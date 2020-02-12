#Exportar una tarea
Get-ScheduledTask -TaskPath "nombre del contedenor de tareas" -TaskName "nombredelatarea" |Export-ScheduledTask| Out-File -FilePath c:\rutadelarchivo\nombredeseado.xml 

#Importar una tarea
Register-ScheduledTask -xml (Get-Content c:\rutadelarchivo\archivo.xml |Out-String) -TaskName "nombretarea"

