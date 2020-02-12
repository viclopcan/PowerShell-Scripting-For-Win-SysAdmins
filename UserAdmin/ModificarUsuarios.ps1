#Modificar una cuenta

#Añadir campo full name
Set-Localuser usuarioencriptado -FullName "Sr Anonimo"

#Quitar la expriación de la contraseña
Set-LocalUser usuarioencriptado -PasswordNeverExpires $true

#Añadir contraseña a un usuario que no la tiene
Set-LocalUser -name srcangrejo -Password (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -force)

#Renombrar cuenta
Rename-LocalUser cangrejo -NewName srcangrejo

#Desactivar cuenta local
Disable-LocalUser srcangrejo

#Desactivar cuenta AD
Disable-ADAccount srcangrejo

#Activar cuenta local
Enable-LocalUser srcangrejo

#Activar cuenta AD
Enable-ADAccount srcangrejo

#Borrar cuenta con cofirmación
Remove-LocalUser -Confirm srcangrejo