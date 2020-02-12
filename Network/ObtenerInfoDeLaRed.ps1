#Obtener información de la red

#Ver adaptadores de red
Get-NetAdapter

#Ver información concreta de un adaptador de red (modo lista)
Get-NetAdapter -Name "nombredeladaptador" | fl

#Deshabilitar un adaptador de red
Disable-NetAdapter -Name "nombredeladaptador"

#Habilitar un adaptador de red
Enable-NetAdapter -Name "nombredeladaptador"

#Ver la configuración de la red
Get-NetIPConfiguration 

#Ver la configuración de red de un adaptador determinado
Get-NetIPConfiguration -InterfaceAlias "nombredeladaptador"

#Ver si esta el DHCP activado (fijarse en los campos "PrefixOrigin" y "SufixOrigin")
Get-NetIPAddress -InterfaceAlias "nombredeladaptador"

#Ver una propiedad en concreto del adaptador
(Get-NetIPAddress -InterfaceAlias "nombredeladaptador").campodeseado

#Ver tabla de enrutamiento de un adaptador (mostrando los datos en una tabla )
Get-NetRoute -InterfaceAlias "nombredeladaptador" | ft -AutoSize

#Ver DNS configurados en un adaptador
Get-DnsClientServerAddress -InterfaceAlias "nombredeladaptador"

#Ver la memoria caché 
Get-DnsClientCache

#Borrar la memoria cache
Clear-DnsClientCache

#Ver el los puertos y su estado
Get-NetTCPConnection |ft -AutoSize

#Ver los puertos que estan abiertos y con conexión establecida
Get-NetTCPConnection -State Established |ft -AutoSize

