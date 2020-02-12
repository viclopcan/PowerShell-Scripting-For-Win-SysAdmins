#Deshabilitar usuarios de forma masiva

$usuarios=Import-Csv -Path C:\Users\Administrador.WIN-V0LIIQKJLRN\Desktop\SCRIPTS\practicas\GitHub\AD\usuariosAD.csv
foreach ($item in $usuarios)
{
    Disable-ADAccount $item.nombre 
   
}