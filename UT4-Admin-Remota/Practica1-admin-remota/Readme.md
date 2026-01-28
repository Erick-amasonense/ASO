# PARTE 1

La finalidad de esta apartado será implementar la aplicación "administración remota de Windows Server" (WAC) en un cliente Windows 11, con ella obtendremos los daton en tiempo real del Windows Server, a través de los siguientes pasos:

## 1. Acceso a Windows Admin Center
Instalamos WAC

![](capturas/wac_instaladador.png)

Puerto :6600

Accedemos a la aplicación a través del punto de acceso, este nos llevará automáticamente en el navegador a https:/nombredelw11:6600 
(otra opción para entrar a través del navegador es: https:/localhost:6600)
Iniciamos sesión con un usuario local

![](capturas/wac_acceso.png)

Y ya estamos dentro

![](capturas/wac_panel-admin.png)

## 2. Administración remota del Windows Server

Lo agregamos manualmente

![](capturas/wac_añado-server.png)
![](capturas/wac_panel-server-añadido.png)

### Información del sistema:
![](capturas/wac_servidor1.png)

### CPU y memoria
![](capturas/wac_servidor2.png)

### Servicios
![](capturas/wac_servidor3.png)

# PARTE 2

La finalidad de esta apartado será implementar el servicio de monitorización web "cockpit" en un ubuntu server, el cual entraremos a través de clientes remotos (Windows11 en este caso), siguiendo los siguientes pasos:

## 1. Comprobación del servicio Cockpit

Instalamos el servicio y comprobamos que este activo
Puerto :9090

![](capturas/cockpit_servicio.png)

## 2. Creación de usuario remoto para administración

![](capturas/cockpit_usuario.png)

## 3. acceso remoto desde windows 11

![](capturas/cockpit_acceso.png)

Y hemos entrado

![](capturas/cockpit_monitorización.png)



