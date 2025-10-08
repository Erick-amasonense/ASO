$nota = Read-Host;
switch ($nota) {
    0 {$texto="Insuficiente"; break;}
    1 {$texto="Insuficiente"; break;}
    2 {$texto="Insuficiente"; break;}    
    3 {$texto="Insuficiente"; break;}    
    4 {$texto="Insuficiente"; break;}
    5 {$texto="Suficiente"; break;}
    6 {$texto="Bien"; break;}    
    7 {$texto="Notable"; break;}
    8 {$texto="Notable"; break;}
    9 {$texto="Sobresaliente"; break;}
    10 {$texto="Sobresaliente"; break;}
    Default {$texto="ERROR: NOTA IMPOSIBLE"; break;}
};
Write-Host $texto;