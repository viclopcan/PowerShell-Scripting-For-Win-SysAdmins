Clear-host

$user=read-host "Introduce el mail del usuario quieres bloquear ?"

Get-ADUser -Filter {mail -eq $user} | Disable-ADAccount | Get-ADUser -Filter {mail -eq $user}

pause




