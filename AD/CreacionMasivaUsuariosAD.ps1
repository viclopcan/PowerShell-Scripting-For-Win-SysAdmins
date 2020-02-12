#Creación masiva usuarios AD

$usuarios=Import-Csv -Path C:\ruta\usuariosAD.csv
foreach ($item in $usuarios)
{
    $clave= ConvertTo-SecureString $item.contra -AsPlainText -force
    New-ADUser $item.nombre -AccountPassword $clave
    Set-aduser -Identity $item.nombre -EmailAddress $item.email 
    Enable-ADAccount -Identity $item.nombre 

}