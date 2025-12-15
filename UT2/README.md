Scripts y ejercicios de prueba UT2
---------------------------------
En esta unidad nos centramos en los dominios de **Active directory**:

## ¿Qué es un dominio?

Un **dominio** es una estructura lógica que permite administrar de manera centralizada usuarios, equipos, recursos y políticas de seguridad dentro de una red. Los dominios facilitan el control, la seguridad y la escalabilidad en entornos empresariales o educativos.

Los dominios en sistemas Windows se gestionan mediante **Active Directory**, un servicio de directorio que almacena información sobre los objetos de la red y permite su administración desde un punto central.

## Active Directory Domain Services (AD DS)

**AD DS** es el rol de Windows Server encargado de proporcionar:

* Autenticación de usuarios y equipos.
* Autorización de acceso a recursos.
* Administración centralizada de cuentas.
* Aplicación de directivas de grupo (GPO).
* Integración con servicios como DNS.

## Controlador de Dominio (DC)

El **Controlador de Dominio** es el servidor que aloja Active Directory. Sus funciones principales son:

* Validar credenciales de inicio de sesión.
* Almacenar la base de datos del directorio.
* Gestionar usuarios, grupos y equipos.
* Aplicar políticas de seguridad.

Un dominio puede tener uno o varios controladores de dominio para garantizar redundancia y alta disponibilidad.

## DNS en un dominio

El servicio **DNS** es un componente esencial en una instalación de dominio, ya que permite:

* Resolver nombres de equipos dentro del dominio.
* Localizar controladores de dominio.
* Garantizar la comunicación entre clientes y servidores.

Por este motivo, normalmente el Controlador de Dominio también actúa como servidor DNS.

## Clientes de dominio

Los **clientes de dominio** son los equipos que se unen al dominio para beneficiarse de la administración centralizada. Al formar parte de un dominio:

* Los usuarios pueden iniciar sesión desde cualquier equipo autorizado.
* Se aplican políticas de seguridad comunes.
* Se facilita el acceso controlado a recursos compartidos.

## Ventajas de una instalación de dominio

* Administración centralizada de usuarios y equipos.
* Mayor seguridad mediante políticas comunes.
* Escalabilidad para redes medianas y grandes.
* Facilidad de mantenimiento y control.
* Mejora en la organización de los recursos.

## Casos de uso habituales

* Entornos empresariales.
* Centros educativos.
* Laboratorios de prácticas.
* Redes corporativas con múltiples usuarios.

## Conclusión

La instalación básica de un dominio es un pilar fundamental en la administración de redes Windows. Comprender sus componentes principales —Active Directory, Controladores de Dominio, DNS y clientes— permite diseñar y mantener infraestructuras de red seguras, organizadas y eficientes.
