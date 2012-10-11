#Sistema Integrado de Información Gerencial

## Requerimientos
* Servidor Web
* Gestor de base de datos
* PHP 5.3.8+

### Instalación de los requerimientos desde ubuntu (con postgresql como gestor de base de datos)
~~~
$ sudo apt-get install php5 php5-pgsql php5-sqlite sqlite php5-xdebug  php-apc php5-cli php5-xsl php5-intl apache2 postgresql acl git-core curl
~~~

##Instalación
### Obtener el código fuente
Puedes descargarlo desde: https://github.com/erodriguez-minsal/SIIG/tarball/master o puedes clonar el repositorio

~~~
$ git clone https://github.com/erodriguez-minsal/SIIG.git siig
~~~

A partir de este punto todos los comandos se deben ejecutar dentro de la carpeta en que se ha descargado el código fuente

### Instalar composer
[Composer](http://getcomposer.org/) Es una librería de PHP para el manejo de dependencias. Para instalarlo, dentro de la carpeta
donde descargaste el código fuente se debe ejecutar:

~~~
$ curl -s https://getcomposer.org/installer | php
~~~

### Instalar todas las librerías necesarias

~~~
$ php composer.phar install
~~~

## Configuración

### Servidor web
Se puede crear un enlace en /var/www y hacia la carpeta web de nuestro proyecto y utilizarlo 
como http://localhost/siig o se puede configurar un VirtualHost

### Permisos sobre carpetas
Es necesario tener [soporte para ACL](https://help.ubuntu.com/community/FilePermissionsACLs) en la partición en que 
está el proyecto y luego ejecutar

~~~
$ sudo setfacl -R -m u:www-data:rwx -m u:`whoami`:rwx app/cache app/logs
$ sudo setfacl -dR -m u:www-data:rwx -m u:`whoami`:rwx app/cache app/logs
~~~

### Verificar la configuración
Entra a la siguiente dirección desde el navegador http://localhost/siig/config.php 
Si aparece algún error debe ser corregido antes de continuar

### Configuración de la conexión
Después de haber solventado todos los inconvenientes, dentro de la misma página hay un enlace para pasar a la configuración, 
y seguir los pasos del asistente

### Crear la base de datos
~~~
$ app/console doctrine:database:create
$ app/console doctrine:schema:update --force
~~~

### Crear un usuario administrador
~~~
$ app/console fos:user:create --super-admin
~~~

### Cargar la aplicación
http://localhost/siig