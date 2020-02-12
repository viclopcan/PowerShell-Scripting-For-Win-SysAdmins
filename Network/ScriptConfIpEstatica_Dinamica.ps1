#Script configuración de red estatica o dinámica


<#DECLARACIÓN DE FUNCIONES
------------------------------------------
#>
#Crea una función la cual muestra un menú.
Function Get-Menu{
Clear-Host
Write-Host "MENU DE CONFIGURACIÓN"
Write-host "1.- IP-Fija"
Write-Host "2.- IP-DHCP"
Write-host "3.- Mostrar configuración actual"
Write-Host "4.- ¿ Que modo tengo actualmente ?"
Write-Host "5.- Salir"
}

#Crea la función para obtener información del adaptador y que el usuario puea seleccionarlo
Function Get-Adaptador {
Write-Host "Configuración del adaptador"
Get-NetAdapter|ft -AutoSize
#Añadimos el $script para que la variable nos sirva en toda el script y no solo en la función.
$script:interfaz = Read-Host "Introduzca la interfaz (IfIndex)"
$script:nombre = Read-Host "Introduzca el nombre (name)"
#Borramos datos
Remove-NetIPAddress -InterfaceIndex $interfaz -Confirm:$false
Remove-NetRoute -InterfaceIndex $interfaz -Confirm:$false
}

#Crea la función para establecer la IP como fija.
Function Ip-Fija {
Get-Adaptador
#Creamos la nueva IP
$ip = Read-host "Introduzca IP"
$mascara = Read-Host "Introduca la máscar (nºs de unos)"
$gateway = Read-Host "Introduzca el gateway"
$dns1 = Read-host "Introduzca el primer DNS"
$dns2 = Read-host "Introduzca el segundo DNS"
New-NetIPAddress -InterfaceIndex $interfaz $ip -PrefixLength $mascara -DefaultGateway $gateway
Set-DnsClientServerAddress -InterfaceIndex $interfaz -ServerAddresses ("$dns1","$dns2")
Restart-NetAdapter -Name $nombre
}

#Crea la función para establecer la IP a través del servicio DHCP.
Function Ip-Dhcp {
Get-Adaptador
#Establecemos IP por Dhcp
Set-NetIPInterface -InterfaceIndex $interfaz -Dhcp enabled
Set-DnsClientServerAddress -InterfaceIndex $interfaz -ResetServerAddresses
#Restablecer el interfaz
Restart-NetAdapter -Name $nombre
}

#Crea la función para seleccionar adaptador en caso de la 3a opción
Function show-ip {
Write-Host "Configuración del adaptador"
Get-NetAdapter|ft -AutoSize
#Añadimos el $script para que la variable nos sirva en toda el script y no solo en la función.
$script:interfaz = Read-Host "Introduzca la interfaz (IfIndex)"
$script:nombre = Read-Host "Introduzca el nombre (name)"
Write-host "Configuración Actual "
Get-NetIPConfiguration -InterfaceIndex $interfaz > C:\tmp\temp.tmp
cat c:\tmp\temp.tmp 
Remove-Item -Path c:\tmp\temp.tmp
}

#Crea la función para mostrar la Ip y configuración actual
Function Mostrar-IP {
Show-Ip
}

#Crea la función para saber si esta actualmente configurado por DHCP o estatico
Function dhcpostatic {
Write-Host "Configuración del adaptador"
Get-NetAdapter|ft -AutoSize
#Añadimos el $script para que la variable nos sirva en toda el script y no solo en la función.
$script:interfaz = Read-Host "Introduzca la interfaz (IfIndex)"
Get-NetIPAddress -InterfaceIndex $interfaz > C:\tmp\showmode.tmp
cat c:\tmp\showmode.tmp
$respuesta=Read-Host "Introduce el valor del campo PrefixOrigin (Manual, DHCP)"
if ($respuesta -eq "Manual"){
Write-Host "La configuración IP esta en modo estático"
}
else{
"La configuración IP esta en modo DHCP"
}
Remove-Item -Path C:\tmp\showmode.tmp
}

<#---------------------------------------------
DECLARACIÓN DEL MENU
#>

#Menu de inicio
do{
Get-Menu
$opcion = Read-Host "Elija una opción"
switch ($opcion){
'1'{Ip-Fija}
'2'{Ip-Dhcp}
'3'{Mostrar-IP}
'4'{dhcpostatic}
'5'{exit}
Default {Write-Host "Opción incorrecta"}
}


$intro = Read-Host "Pulse intro para continuar"
}while ($true)