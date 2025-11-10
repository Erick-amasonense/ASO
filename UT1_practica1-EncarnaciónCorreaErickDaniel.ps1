#=========================
# Parametrización
#=========================
param(
    [string]$OutputPath = "H:\ComparteInformática\ASR2\Practica_PS",
    [string]$LogPath = "H:\ComparteInformática\ASR2\Practica_PS\logs",
    [string]$SessionCode = "UT1_P1_EDEC"
)
#=========================
# Inicialización
#=========================
$infoColl = @()
$Date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Función de log
function Write-Log {
    param(
        [string]$Message,
        [ValidateSet("INFO","WARN","ERROR")]
        [string]$Level = "INFO"
    )

    $logFile = Join-Path -Path $LogPath -ChildPath "Inventory.log"
    $logEntry = "[{0}] [{1}] [{2}] {3}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $Level, $SessionCode, $Message

    try {
        if (-not (Test-Path $LogPath)) {
            New-Item -ItemType Directory -Path $LogPath -Force | Out-Null
        }
        Add-Content -Path $logFile -Value $logEntry
    } catch {
        Write-Warning "No se pudo escribir en el log: $logFile"
    }
}

#=========================
# Comprobación de rutas
#=========================
if (-not (Test-Path $OutputPath)) {
    try {
        New-Item -ItemType Directory -Path $OutputPath -Force | Out-Null
        Write-Verbose "Ruta de salida creada: $OutputPath"
    } catch {
        Write-Warning "No se pudo crear la ruta de salida: $OutputPath. Usando Documentos."
        $OutputPath = [Environment]::GetFolderPath("MyDocuments")
    }
}

#=========================
# Función de prueba de escritura
#=========================
function Test-WriteAccess {
    param([string]$Path)
    $tempFile = Join-Path -Path $Path -ChildPath "temp_write_test.txt"
    try {
        Set-Content -Path $tempFile -Value "Test write access" -ErrorAction Stop
        Remove-Item -Path $tempFile -Force
        return $true
    } catch {
        Write-Warning "No se puede escribir en $Path. Se usará ruta local."
        Write-Log -Message "Ruta de salida inaccesible: $Path" -Level "WARN"
        return $false
    }
}

# Verificación real de escritura
if (-not (Test-WriteAccess -Path $OutputPath)) {
    $OutputPath = [Environment]::GetFolderPath("MyDocuments")
}

Write-Host "Usando ruta de salida: $OutputPath"
Write-Log -Message "Ruta de salida establecida: $OutputPath" -Level "INFO"

#=========================
# Mensajes informativos
#=========================
Write-Host "Obteniendo datos del sistema..."
Write-Verbose "Iniciando inventario en $(Get-Date)"

#=========================
# Variables de inventario
#=========================
$Username = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$ComputerName = $env:COMPUTERNAME
$Date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Fecha de último boot
try {
    $lastBootTime = (Get-CimInstance -ClassName Win32_OperatingSystem).LastBootUpTime
    $uptime = (Get-Date) - $lastBootTime
    $uptimeReadable = "{0} days, {1} hours, {2} minutes" -f $uptime.Days, $uptime.Hours, $uptime.Minutes
} catch {
    $uptimeReadable = "N/A"
}

# Información de hardware
try {
    $BIOS = Get-CimInstance -Class Win32_Bios | ForEach-Object { "$($_.Manufacturer), $($_.SMBIOSBIOSVersion), $($_.Name)" }
    $CPU = Get-CimInstance -Class Win32_Processor | Select-Object -ExpandProperty Name
    $RAM = (Get-CimInstance -Class Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum).Sum / 1GB
    $Storage = (Get-CimInstance -Class Win32_LogicalDisk -Filter "DeviceID='$env:SystemDrive'").Size / 1GB
    $Model = Get-CimInstance -Class Win32_ComputerSystem | Select-Object -ExpandProperty Model
    $SN = Get-CimInstance -Class Win32_Bios | Select-Object -ExpandProperty SerialNumber
} catch {
    Write-Warning "Error al obtener información del hardware"
    Write-Log -Message "Error al obtener información del hardware: $_" -Level "ERROR"
}

# GPU
function GetGPUInfo {
    try {
        Get-CimInstance -Class Win32_VideoController | Select-Object -ExpandProperty Description
    } catch {
        return @("N/A")
    }
}
$GPUs = GetGPUInfo
$GPU0 = $GPUs | Select-Object -Index 0 -ErrorAction SilentlyContinue
$GPU1 = $GPUs | Select-Object -Index 1 -ErrorAction SilentlyContinue

# OS
try {
    $OS = Get-CimInstance -Class Win32_OperatingSystem
    $OSCaption = $OS.Caption
    $OSBuild = $OS.BuildNumber
} catch {
    $OSCaption = "N/A"
    $OSBuild = "N/A"
}

# Monitores
function GetMonitorInfo {
    try {
        $Monitors = Get-CimInstance -Namespace "root\WMI" -Class "WMIMonitorID"
        $results = @()
        foreach ($Monitor in $Monitors) {
            $results += ([System.Text.Encoding]::ASCII.GetString($Monitor.UserFriendlyName)).Replace("$([char]0x0000)","")
            $results += ([System.Text.Encoding]::ASCII.GetString($Monitor.SerialNumberID)).Replace("$([char]0x0000)","")
        }
        return $results
    } catch { return @("N/A") }
}
$MonitorInfo = GetMonitorInfo
$Monitor1 = ($MonitorInfo | Select-Object -Index 0,1) -join ' ' 2>$null
$Monitor2 = ($MonitorInfo | Select-Object -Index 2,3) -join ' ' 2>$null
$Monitor3 = ($MonitorInfo | Select-Object -Index 4,5) -join ' ' 2>$null

# IP y MAC
try {
    $defaultRoute = Get-NetRoute -DestinationPrefix "0.0.0.0/0" | Sort-Object Metric | Select-Object -First 1
    $interfaceIndex = $defaultRoute.InterfaceIndex
    $interfaceIP = (Get-NetIPAddress -InterfaceIndex $interfaceIndex -AddressFamily IPv4).IPAddress
    $interfaceMAC = (Get-NetAdapter -InterfaceIndex $interfaceIndex).MacAddress
} catch {
    $interfaceIP = "N/A"
    $interfaceMAC = "N/A"
}

# Tipo de chasis
try {
    $Chassis = Get-CimInstance -ClassName Win32_SystemEnclosure -Property ChassisTypes | Select-Object -ExpandProperty ChassisTypes
    $ChassisDescription = switch ($Chassis) {
        1 {"Other"};2 {"Unknown"};3 {"Desktop"};4 {"Low Profile Desktop"};5 {"Pizza Box"};6 {"Mini Tower"}
        7 {"Tower"};8 {"Portable"};9 {"Laptop"};10 {"Notebook"};11 {"Hand Held"};12 {"Docking Station"}
        13 {"All in One"};14 {"Sub Notebook"};15 {"Space-Saving"};16 {"Lunch Box"};17 {"Main System Chassis"}
        18 {"Expansion Chassis"};19 {"SubChassis"};20 {"Bus Expansion Chassis"};21 {"Peripheral Chassis"}
        22 {"Storage Chassis"};23 {"Rack Mount Chassis"};24 {"Sealed-Case PC"};30 {"Tablet"};31 {"Convertible"}
        32 {"Detachable"}; default {"Unknown"}
    }
} catch {
    $ChassisDescription = "Unknown"
}

#=========================
# Export CSV
#=========================
$csvFile = Join-Path -Path $OutputPath -ChildPath "$ComputerName-Inventory.csv"

try {
    $infoObject = New-Object PSObject
    Add-Member -InputObject $infoObject -MemberType NoteProperty -Name "Date Collected" -Value $Date
    Add-Member -InputObject $infoObject -MemberType NoteProperty -Name "Computer" -Value $ComputerName
    Add-Member -InputObject $infoObject -MemberType NoteProperty -Name "User" -Value $Username
    Add-Member -InputObject $infoObject -MemberType NoteProperty -Name "BIOS" -Value $BIOS
    Add-Member -InputObject $infoObject -MemberType NoteProperty -Name "CPU" -Value $CPU
    Add-Member -InputObject $infoObject -MemberType NoteProperty -Name "RAM (GB)" -Value ([math]::Round($RAM,2))
    Add-Member -InputObject $infoObject -MemberType NoteProperty -Name "Storage (GB)" -Value ([math]::Round($Storage,2))
    Add-Member -InputObject $infoObject -MemberType NoteProperty -Name "Model" -Value $Model
    Add-Member -InputObject $infoObject -MemberType NoteProperty -Name "Serial Number" -Value $SN
    Add-Member -InputObject $infoObject -MemberType NoteProperty -Name "GPU 0" -Value $GPU0
    Add-Member -InputObject $infoObject -MemberType NoteProperty -Name "GPU 1" -Value $GPU1
    Add-Member -InputObject $infoObject -MemberType NoteProperty -Name "OS" -Value $OSCaption
    Add-Member -InputObject $infoObject -MemberType NoteProperty -Name "OS Build" -Value $OSBuild
    Add-Member -InputObject $infoObject -MemberType NoteProperty -Name "Up Time" -Value $uptimeReadable
    Add-Member -InputObject $infoObject -MemberType NoteProperty -Name "Monitor 1" -Value $Monitor1
    Add-Member -InputObject $infoObject -MemberType NoteProperty -Name "Monitor 2" -Value $Monitor2
    Add-Member -InputObject $infoObject -MemberType NoteProperty -Name "Monitor 3" -Value $Monitor3
    Add-Member -InputObject $infoObject -MemberType NoteProperty -Name "IP Address" -Value $interfaceIP
    Add-Member -InputObject $infoObject -MemberType NoteProperty -Name "MAC Address" -Value $interfaceMAC
    Add-Member -InputObject $infoObject -MemberType NoteProperty -Name "Type" -Value $ChassisDescription

    $infoColl += $infoObject

    $infoColl | Export-Csv -Path $csvFile -NoTypeInformation -Force
    Write-Host "Inventario generado correctamente en $csvFile"
    Write-Log -Message "Inventario exportado: $csvFile" -Level "INFO"
} catch {
    Write-Warning "Error al exportar CSV."
    Write-Log -Message "ERROR exportando CSV: $_" -Level "ERROR"
}
