#Script para comprobar conectividad en varios host a traves de un csv
clear-host
write-host "-----Probando_Conectividad-----"
$datos=Import-Csv -path C:\ruta\IPacomprobar.csv
foreach ($item in $datos)
{
    $respuesta=Test-Connection $item.ip -count 1 -quiet
    if( $respuesta -eq "True"){
    Write-Host "$item Conexión establecida" 
    }
    else{
    Write-host "$item Error de conexión" 
    }
}
PAUSE