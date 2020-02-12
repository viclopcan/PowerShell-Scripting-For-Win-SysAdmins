#Creación de usuarios masiva

$usuarios=Import-Csv -Path C:\Users\Administrador.WIN-V0LIIQKJLRN\Desktop\SCRIPTS\practicas\material\usuarios.csv

foreach ($item in $usuarios)
{
    $clave= ConvertTo-SecureString $item.contra -AsPlainText -force
    New-LocalUser $item.nombre -Password $clave -AccountNeverExpires -PasswordNeverExpires

}