#Crear un usuario


#Limpia la consola
clear-host

#Pregunta al usuario que nombre quiere para el usuario nuevo
$usuario=read-host "introduce nombre de usuario"

#Pregunta al usuario que contraseña quiere para el usuario nuevo 
$password=read-host "introduce la contraseña deseada" -AsSecureString 

#Convierte la contraseña en un string y la añade a la variable $contra
$contra=ConvertTo-SecureString $password -AsPlainText -Force

#Crea el usuario almacenado en la variable $usuario y le añade el password en forma de string
New-ADUser $usuario -AccountPassword $contra

#Activa la cuenta del usuario-
Enable-ADAccount -Identity $usuario

#Permite presionar ENTER al usuario para cerrar la consola
Pause



