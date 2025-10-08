[int] $numero=Read-Host;

if ($numero -lt 18){
    write-host "Menor de edad"
}else{
    write-host "Mayor de edad"
};