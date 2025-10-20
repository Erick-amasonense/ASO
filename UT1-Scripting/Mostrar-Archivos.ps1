function Mostrar-Archivos{
    param (
        [string]$Ruta,
        [string]$Extension = ".txt",
        [bool]$Ordenar = $false
    )

    if (-not (Test-Path $Ruta)){
        Write-Host "La carpeta no existe"
        break
    }

    if ($Ordenar -eq $true){
        Get-ChildItem -Path $Ruta -Filter *$Extension | Select-Object Name, Length, LastWriteTime |Sort-Object Name -Descending
    }else {
        Get-ChildItem -Path $Ruta -Filter *$Extension | Select-Object Name, Length, LastWriteTime       
    }
}
