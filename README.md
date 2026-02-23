# EVIDENCIAS-Unidades de red

## Estructura de carpetas en el servidor (C:\Compartidas\) 

![](capturas/UT5_UnidadesRed_CarpetasServidor.png)

## Permisos de una carpeta compartida (pestaña Compartir + Seguridad) 

### Compartidas:

Establecemos los permisos base para que los usuarios del dominio puedan atravesar el directorio

![](capturas/UT5_UnidadesRed_CompartidasSeguridad.png)
![](capturas/UT5_UnidadesRed_CompartidasCompartir.png)

### Admin:

Restringimos el acceso y control total exclusivamente a los miembros del grupo de seguridad GRP_Administracion

![](capturas/UT5_UnidadesRed_AdminSeguridad.png)

Compartimos el recurso como Compartida-Admin 

![](capturas/UT5_UnidadesRed_AdminCompartir.png)

### Informatica:

Restringimos el acceso a los miembros del grupo del departamento de informática

![](capturas/UT5_UnidadesRed_InformaticaSeguridad.png)

Compartimos el recurso como Compartida-Info 

![](capturas/UT5_UnidadesRed_InformaticaCompartir.png)

### Comun:

Al ser una carpeta pública, otorgamos acceso a todos los Usuarios del dominio

![](capturas/UT5_UnidadesRed_ComunSeguridad.png)

Compartimos el recurso como Compartida-Todos

![](capturas/UT5_UnidadesRed_ComunCompartir.png)

## GPO de mapeo creada y vinculada en GPMC 

Creamos la GPO, la editaremos y la asignaremos a las UOs

![](capturas/UT5_UnidadesRed_GPOCreada.png)

![](capturas/UT5_UnidadesRed_GPOVinculada1.png)

![](capturas/UT5_UnidadesRed_GPOVinculada2.png)

Y repetiremos el proceso vinculandolo a las UO Informatica y Usuarios

## Configuración de las 3 unidades en la GPO

Dentro de Configuración de usuario > Preferencias > Configuración de Windows > Asignaciones de unidades

![](capturas/UT5_UnidadesRed_ConfiguracionUnidades.png)

Creamos las asignaciones para mapear las rutas de los recursos compartidos a letras de unidad específicas

### Admin (Z):

![](capturas/UT5_UnidadesRed_ConfiguracionZ.png)

### Info (Y):

![](capturas/UT5_UnidadesRed_ConfiguracionY.png)

### Comun (X):

![](capturas/UT5_UnidadesRed_ConfiguracionX.png)

## Segmentación configurada para unidades Z: e Y:

Para confugurar las segmentaciones de las unidades: 

Iremos a comunes>Marcamos Destinatarios de nivel de elemento>
hacemos clic en Destinatarios...

![](capturas/UT5_UnidadesRed_Segmentación1.png)

Iremos a un nuevo elemento y seleccionaremos Grupo de seguridad

![](capturas/UT5_UnidadesRed_Segmentación2.png)

Finalmente introduciremos el grupo correspondiente para cada unidad (Z: e Y:)

### Z:

![](capturas/UT5_UnidadesRed_SegmentaciónZ.png)

### Y:

![](capturas/UT5_UnidadesRed_SegmentaciónY.png)

## Explorador de archivos de user_admin1 mostrando unidades Z: y X:

![](capturas/UT5_UnidadesRed_user_admin1.png)

## Explorador de archivos de user_info1 mostrando unidades Y: y X: 

![](capturas/UT5_UnidadesRed_user_info1.png)

## Acceso denegado al intentar acceder a recurso de otro grupo 

![](capturas/UT5_UnidadesRed_accesoDenegado.png)

# EVIDENCIAS-Limpiar archivos automaticamente

## GPO creada y vinculada en GPMC 

Creo y Vinculo la GPO

![](capturas/UT5_Limpiar_GPOCreadaVinculada.png)

![](capturas/UT5_Limpiar_GPOCreadaVinculada2.png)

## Configuración de la tarea programada dentro de la GPO (pestañas General, Desencadenadores, Acciones) 

Dentro de Configuración del equipo > Preferencias > Panel de control > Tareas programadas

![](capturas/UT5_Limpiar_ProgramarTareas.png)

Crearemos la tarea Limpiar

Establecmos SYSTEM como usuario para ejecutar la tarea y le otorgamos privilegios

![](capturas/UT5_Limpiar_ProgramarTareas_Limpiar_General.png)

Creamos un Desencadenador para la tarea
![](capturas/UT5_Limpiar_ProgramarTareas_Limpiar_Desencadenantes1.png)

En este caso se ejecutara una vez a las 23:30
![](capturas/UT5_Limpiar_ProgramarTareas_Limpiar_Desencadenantes2.png)

Creamos la accion

![](capturas/UT5_Limpiar_ProgramarTareas_Limpiar_Acciones1.png)

Establecemos que inicie powershell y ejecute el scrip con el comando:
-ExecutionPolicy Bypass -File \\e.local\SYSVOL\e.local\scripts\Limpiar.ps1

![](capturas/UT5_Limpiar_ProgramarTareas_Limpiar_Acciones2.png)

## Tarea visible en el Programador del cliente 

## Ejecución exitosa (estado o historial) 

## Contenido del log generado (abierto con Bloc de notas) 