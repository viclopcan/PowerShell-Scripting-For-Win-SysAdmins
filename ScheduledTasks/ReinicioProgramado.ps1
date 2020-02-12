#Tarea para programar reinicio
$accion = New-ScheduledTaskAction -Execute "powershell.exe" -Argument C:\scripts\reboot11.ps1
$trigger = New-ScheduledTaskTrigger -daily -at 11:00
Register-ScheduledTask -Action $accion -Trigger $trigger -TaskName "ReinicioProgramadoW" -TaskPath "TareasSysAdmin" -Description "reinicio programado a las 11"