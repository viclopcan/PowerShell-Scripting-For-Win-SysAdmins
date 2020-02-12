clear-host

$mail=read-host "Introduce el mail del usuario que quieres bloquear ?"


Get-ADUser -Filter {mail -eq $mail}

$name=read-host "Introduce el campo mostrado como Name"
$password=read-host "Que contraseña deseas poner ?"

Set-LocalUser -name $name -Password (ConvertTo-SecureString $password -AsPlainText -force)
Disable-ADAccount $name

PAUSE
