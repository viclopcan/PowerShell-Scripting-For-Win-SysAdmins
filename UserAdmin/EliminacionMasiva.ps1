#Eliminación de usuarios masiva

$usuarios=Import-Csv -Path C:\Users\Administrador.WIN-V0LIIQKJLRN\Desktop\SCRIPTS\practicas\material\usuarios.csv

foreach ($item in $usuarios)
{
    Remove-LocalUser $item.nombre
}