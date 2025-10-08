[int]$numero = Read-Host;
if ($numero % 2 -eq 0){
    mkdir "pares"
} else{
    mkdir "impares"
};