#Comprobar Conectividad

#Prueba de conexión con un host (devuelve un valor True,False)
Test-Connection ip -count 1 -quiet


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
    Wirte-host "$item Error de conexión" 
    }
}

