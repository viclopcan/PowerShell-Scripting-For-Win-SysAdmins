#Gestión de Procesos

#Mostrar todos los procesos activos en nuestro servidor
Get-Process

#Buscar los procesos que consumen mas CPU
Get-Process |sort cpu -Descending| Select-Object -first 10

#Buscar proceso por nombre (podemos poner un * al final si no sabemos el nombre completo)
Get-Process -Name nombredelproceso

#Obtener información acerca de un proceso en concreto
Get-Process -name nombredelproceo |fl *

#Ver una propiedad en concreto del proceso
(Get-Process -name nombredelproceso).propiedad
#ejemplo: (Get-Process -name explorer).path (Nos indicaria la ruta donde esta alojado el proceso)

#Parar un proceso
Stop-Process -Name nombredelproceso

#Como inicializar un proceso
Start-Process -FilePath rutadelproceso

