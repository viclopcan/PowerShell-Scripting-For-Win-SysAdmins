#Creación y modificación de una tarea programada

#Ver las tareas programadas disponibles
Get-ScheduledTask

#Buscar una tarea por nombre
Get-ScheduledTask -TaskName nombredelatarea*

#Ver las acciones que va a realizar una tarea
(Get-ScheduledTask -TaskName "nombretarea").Actions

#Ver cuando se va a ejecutar una tarea
(Get-ScheduledTask -TaskName "nombretarea").Triggers

#Forzar el inicio de una tarea
Start-ScheduledTask -TaskName "nombretarea"

#Modificar una tarea
Set-ScheduledTask -TaskName "nombretarea" 

#Eliminar tarea
Unregister-ScheduledTask -TaskPath "nombredelcontenedor" -TaskName "nombredelatarea"

<# Para crear una tarea 
1º Action - ¿Que programa se va a ejecutar ?
2º Trigger - ¿ Cuando va a tener lugar esta tarea ?
3º Registrar la tarea
#>

#------------------------------------------------------
#Programar un reinicio diario a una hora determinada
#Action
$accion = New-ScheduledTaskAction -Execute "powershell.exe" -Argument c:\ruta\archivo.ps1(que contiene lo mencionado en "SCRIPT CON ORDEN DE REINICIO")
#Trigger
$trigger = New-ScheduledTaskTrigger -daily -at horadeseada
#Registro tarea
Register-ScheduledTask -Action $accion -Trigger $trigger -TaskPath "nombre el contenedor de tareas" -TaskName "nombre de la tarea" -Description "definir función script"
#Script con orden de reinicio
C:\Windows\System32\shutdown.exe /r /t 600
#------------------------------------------------------

