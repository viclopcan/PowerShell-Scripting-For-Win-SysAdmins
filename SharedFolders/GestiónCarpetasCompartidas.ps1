#Gestión de carpetas compartidas

#Ver los recursos compartidos
Get-SmbShare

#Ver recurso compartido en concreto
Get-SmbShare -name nombre

#Crear Carpeta
New-Item C:\ruta\nombredelacarpeta -ItemType Directory

#Compartir Carpeta
New-SmbShare -Path C:\ruta\nombredelrecurso 

#Ver permisos carpeta
Get-SmbShareAccess -name nombredelrecurso

#Crear recurso compartido delimitando permisos
New-SmbShare -Path c:\ruta -name nombredelrecurso -FullAccess usuariofull -ReadAccess usuariolimitado

#Modificar recurso compartido
Set-SmbShare -name sharedpermisos -Description "Carpeta compartida con permisos"

#Ver número de conexiones simultáneas que permite el recurso compartido
Get-SmbShare nombredelrecurso | fl name,path,ShareState,ConcurrentUserLimit

#Modificar el número de conexiones simultáneas que tiene el recurso compartido
Set-SmbShare -Name nombredelrecurso -ConcurrentUserLimit numerodeseado -Force

#Modificar los permisos de un usuario hacia un recurso
Grant-SmbShareAccess -Name nombredelrecurso -AccessRight niveldeacceso -AccountName nombreusuario

#Retirar permisos de acceso a un recuros 
Revoke-SmbShareAccess -Name nombredelrecurso -AccountName nombreusuario

#Bloquear el acceso a una carpeta
Block-SmbShareAccess -Name nombredelrecurso -AccountName nombreusuario

#Eliminiar recurso compartido
Remove-SmbShare -Name nombredelrecurso
