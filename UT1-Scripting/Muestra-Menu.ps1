while($opcion -ne 3){
    Write-Host "1 ) Mostrar la fecha actua"
    Write-Host "2 ) Mostrar el usuario actual"
    Write-Host "3 ) Salir"
    $opcion = Read-Host
    if ($opcion -eq 1) {
        Get-Date
    }elseif ($opcion -eq 2) {
        $env:USERNAME
    }elseif ($opcion -eq 3) {
        Write-Host "BYE BYE"
    }else{
        Write-Host "Opción no válida"
    }
};