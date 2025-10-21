function Mostrar-Estadistica{
    param (
        [double[]]$Notas
    )
    $lista_Notas = @()
    foreach($Nota in $Notas){
        $lista_Notas =  $lista_Notas + $Nota
    }
    $Valor_med= $lista_Notas | Measure-Object -Average
    $Valor_min= $lista_Notas | Measure-Object -Minimum
    $Valor_max= $lista_Notas | Measure-Object -Maximum
    
    $Media= $Valor_med.Average
    $Minima= $Valor_min.Minimum
    $Maxima= $Valor_max.Maximum

    Write-Host "Nota media: $Media"    
    Write-Host "Nota minima: $Minima"
    Write-Host "Nota maxima: $Maxima"
}