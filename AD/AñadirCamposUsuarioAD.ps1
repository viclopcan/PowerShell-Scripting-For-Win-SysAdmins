#Añadir campos usuario AD


#Añadir correo
Set-aduser -Identity nombreusuario -EmailAddress correo@correo.com

#Añadir apellido
Set-ADUser -Identity nombreusuario -Surname apellido

#Añadir password
Set-ADAccountPassword -Identity nombreusuario -NewPassword (ConvertTo-SecureString -AsPlainText "P@ssw0rd" -force) 