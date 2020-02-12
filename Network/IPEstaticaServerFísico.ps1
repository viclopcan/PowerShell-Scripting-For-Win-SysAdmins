#Configurar IP Esática (SERVIDORES FÍSICOS)

#Hay que seguir unos pasos

#Primero borramos la dirección IP
Remove-NetIPAddress -InterfaceAlias "nombreinterfaz" -Confirm:$false

#Borramos la puerta de enlace
Remove-NetRoute -InterfaceAlias "nombreinterfaz" -Confirm:$false

#Añadimos la nueva dirección IP deseada
New-NetIPAddress -InterfaceAlias "nombreinterfaz" -IPAddress ipdeseada -PrefixLength mascara(/24) -DefaultGateway gatewaydeseada

#Añadimos DNS
Set-DnsClientServerAddress -InterfaceAlias "nombreinterfaz" -ServerAddresses dnsdeseado1, dnsdeseado2