#Gestión de servicios

#Obtener información de los servicios activos
Get-Service

#Obtener listado de servicios que estan activos
Get-Service |Where-Object{$_.status -eq "Running"}

#Ver un servicio en concreto
Get-Service -name nombredelservicio |fl *

#Ver los servicios necesarios para el funcionamiento de otro
Get-Service -RequiredServices -name nombredelservicio

#Ver los servicios vinculados a este
Get-Service -DependentServices -name nombredelservicio

#Detener un servicio
Stop-Service -name nombredelservicio

#Iniciar un servicio
Start-Service -name nombredelservicio

#Modificar un servicio (Description, displayname, starttype (arranque), status)
#ejemplo -- Modificar que un servicio no arranque automaticamente
Set-Service -Name nombredelservicio -StartupType Disabled
