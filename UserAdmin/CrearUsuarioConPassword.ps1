# crear un usuario con password encriptado

#generamos una variable que contenga la contraseña deseada encriptada
$contra=ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force

#creamos el usuario con la contraseña que contiene la variable
New-LocalUser usuarioencriptado -Password $contra