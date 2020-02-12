#COMANDOS DE GRUPOS

#Ver los comandos disponibles para "localgroup"
Get-Command *localgroup*

#Ver información grupos
Get-LocalGroup 

#Crear Grupo
New-LocalGroup nombredelgrupo

#Añadir info
Set-LocalGroup nombredelgrupo -Description "grupo de prueba"

#Renombrar grupo
Rename-LocalGroup nombredelgrupo -NewName nombredelgruponuevo

#Eliminar Grupo
Remove-LocalGroup -Confirm nombredelgruponuevo

#Ver usuarios de un grupo
Get-LocalGroupMember nombredelgrupo

#Agregar usuario a grupo
Add-LocalGroupMember nombredelgrupo -Member usuario1,usuario2

#Eliminar usuario de un grupo
Remove-LocalGroupMember nombredelgrupo -Member usuario1,usuario2

