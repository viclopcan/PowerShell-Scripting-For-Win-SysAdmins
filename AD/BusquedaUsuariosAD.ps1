#Buscar un usuario por nombre
Get-ADuser -Filter 'name -like "nombreusuario*"' 

#busqueda extendida con campos personalizados
Get-ADuser -Filter 'name -like "nombreusuario*"' -Properties name, emailaddress, enabled

#busqueda completa con todas las propiedades del usuario especificado
Get-ADuser -Filter 'samaccountname -like "nombreusuario"' -properties *




<#listado de properties importantes:
name : nombre del usuario de AD
emailaddress : dirección de correo
samaccountname : nombre de login
enabled : estado del usuario (true, false)

#>