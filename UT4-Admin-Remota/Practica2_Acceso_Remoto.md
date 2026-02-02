  

# Evidencias SSH  

## 1. Usuario creado 
![](capturas/UT4_P2_01_SSH_Usuario_Creado.png)

## 2. Servicio SSH activo 
![](capturas/UT4_P2_02_SSH_Servicio_Activo.png)

## 3. Claves generadas. Captura donde se vean las claves generadas en el directorio final con los permisos adecuados. 

Guardamos la clave publica como “authorized_keys” 
![](capturas/UT4_P2_03_SSH_Claves_Generadas.png)
 
Establecemos conexión por ssh y pasamos el archivo por scp 
a /home/ssh/ 

![](capturas/UT4_P2_05_SSH_SCP_Transferencia.png)

Dentro del servidor entramos al usuario creamos la carpeta .ssh 

![](capturas/UT4_P2_06_SSH_Carpeta.png)

Cambiamos los permisos de la carpeta 

![](capturas/UT4_P2_07_SSH_Carpeta_Permisos.png)

copiamos “authorized_keys” en .ssh 

![](capturas/UT4_P2_08_SSH_Copia_Clave_Final.png)

Entramos al archivo de configuración como root y permitimos el acceso por clave (en mi caso uso “sudo” pero no lo incluí) 

![](capturas/UT4_P2_09_SSH_Config_Root1.png)
![](capturas/UT4_P2_10_SSH_Config_Root2.png)

Configuramos el Putty, establecemos la ubicación de la clave privada y el nombre del usuario. 

![](capturas/UT4_P2_11_SSH_Putty_Config1.png)
![](capturas/UT4_P2_12_SSH_Putty_Config2.png)
![](capturas/UT4_P2_13_SSH_Putty_Config3.png)

Y nos conectamos con la ip 

## 4. Acceso por contraseña deshabilitado.

![](capturas/UT4_P2_14_SSH_Contraseña_deshabilitada.png)

## 5. Acceso SSH desde PuTTY con remoto_ssh. 
![](capturas/UT4_P2_15_SSH_Acceso_Exitoso.png)

## 6. Acceso denegado a otro usuario. Captura del intento fallido con un usuario distinto de remoto_ssh. 

Cambiamos el usuario: 
![](capturas/UT4_P2_16_SSH_Config_Acceso_Denegado.png) 	 
Y probamos 
![](capturas/UT4_P2_17_SSH_Acceso_Denegado.png)


# Evidencias RDP  
 
## 1. Usuario remoto_rdp creado y añadido al grupo. Captura donde se vea el usuario dentro del grupo Usuarios de Escritorio remoto. 

En mi caso utilizare comandos en PS para agilizar el proceso:
![](capturas/UT4_P2_18_RDP_Usuario_Grupo.png)
![](capturas/UT4_P2_RDP_Usuario_Grupo_comprobación.png)

y habilito el usuario
![](capturas/UT4_P2_X_RDP_Arreglo.png)

## 2. Autenticación de nivel de red para la conexión habilitada. 

Entramos a la configuración avanzada del sistema y vamos a la pestaña "acceso remoto"
![](capturas/UT4_P2_20_RDP_Autentificaión_red.png) 

## 3. Sesión RDP activa donde se vea escritorio del servidor y usuario remoto_rdp conectado. 

Entramos desde nuestro windows11 a "conexión a servidor remoto" y establecemos la ip y introducimos las credenciales
![](capturas/UT4_P2_21_RDP_Conexion_Exitosa1.png) 
![](capturas/UT4_P2_22_RDP_Conexion_Exitosa2.png) 
![](capturas/UT4_P2_23_RDP_Conexion_Exitosa3.png)

## 4. Acceso denegado a otro usuario. Captura del intento fallido con un usuario distinto de remoto_rdp. 

Introducco una cuenta diferente "erick"
![](capturas/UT4_P2_24_RDP_Conexion_Denegada1.png)

![](capturas/UT4_P2_25_RDP_Conexion_Denegada2.png)