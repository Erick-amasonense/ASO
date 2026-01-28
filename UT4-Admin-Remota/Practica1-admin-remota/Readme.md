# PARTE 1

La finalidad de esta apartado será implementar la aplicación "administración remota de Windows Server" (WAC) en un cliente Windows 11, a través de los siguientes pasos:

## 1. Acceso a Windows Admin Center

![](capturas/UT4_P1_1.png)

Puerto :6600

Accedemos a la aplicación a través del punto de acceso, este nos llevará automáticamente en el navegador a https:/nombredelw11:6600 
(otra opción para entrar a través del navegador es: https:/localhost:6600)
Iniciamos sesión con un usuario local/AD

![](capturas/UT4_P1_2.png)

Y ya estamos dentro

![](capturas/UT4_P1_3.png)

## 2. Administración remota del Windows Server

Lo agregamos manualmente

![](capturas/UT4_P1_4.png)
![](capturas/UT4_P1_5.png)

### Información del sistema:
![](capturas/UT4_P1_6.png)

### CPU y memoria
![](capturas/UT4_P1_7.png)

### Servicios
![](capturas/UT4_P1_8.png)

# PARTE 2

La finalidad de esta apartado será implementar el servicio de monitorización web "cockpit" en un ubuntu server, el cual entraremos a través de clientes remotos (Windows11 en este caso), siguiendo los siguientes pasos:

## 1. Comprobación del servicio Cockpit

Instalamos el servicio y comprobamos que este activo
Puerto :9090

![](capturas/UT4_P1_9.png)

## 2. Creación de usuario remoto para administración

![](capturas/UT4_P1_10.png)

## 3. acceso remoto desde windows 11

![](capturas/UT4_P1_11.png)

Y hemos entrado

![](capturas/UT4_P1_12.png)