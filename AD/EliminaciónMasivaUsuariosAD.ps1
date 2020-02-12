#Eliminación masiva usuarios AD

$usuarios=Import-Csv -Path C:\ruta\usuariosAD.csv
foreach ($item in $usuarios)
{
    Remove-ADUser $item.nombre 
   
}