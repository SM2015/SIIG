#Tablero eTAB
## Instalacion del Sistema Integrado de Información Gerencial

## Requerimientos
* Servidor Web
* Gestor de base de datos
* PHP 5.3.8+

## Pasos

1. Instalación de Symfony2
2. Instalación de Postgres
3. Instalación RabbitMQ
4. Instalación Servidor OLAP
5. Librería wkhtmltopdf


## 1. Instalación de Symfony2
### Instalación de los requerimientos desde un servidor Debian 
Es muy importante poner atención al indicador "#" significa que el comando 
debe ser ejecutado como usuario root y "$" que debe ser ejecutado como un usuario normal
~~~
# apt-get update
# apt-get install php5 php5-pgsql php5-sqlite sqlite php5-xdebug  php-apc php5-cli php5-xsl php5-intl php5-mcrypt apache2 postgresql acl git-core curl postgresql-contrib
~~~

### Obtener el código fuente
Puedes descargarlo desde: https://github.com/erodriguez-minsal/SIIG/tarball/master o clonar el repositorio

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
Esto es para una instalación de prueba en una máquina local, la instalación real en un servidor el administrador de servicios deberá realizar esta configuración
con los parámetros más adecuados: ip, dominio, configuración en el DNS, etc.

####Configurar un VirtualHost
Creamos el archivo para la definición del VirtualHost
~~~
 # nano /etc/apache2/sites-available/siig.localhost
~~~
El contenido será similar a esto:
~~~
<VirtualHost 127.0.0.7>
 
    ServerName siig.localhost
    DocumentRoot /ruta_al_directorio_descargado/web
 
    <Directory /ruta_al_directorio_descargado/web >
         Options Indexes FollowSymLinks MultiViews
         AllowOverride All
         Order allow,deny
         allow from all
    </Directory>
 
    ErrorLog ${APACHE_LOG_DIR}/siig-error.localhost.log
    # Possible values include: debug, info, notice, warn, error, crit,
    # alert, emerg.
    LogLevel warn
    CustomLog ${APACHE_LOG_DIR}/siig-access.localhost.log combined
</VirtualHost>

~~~

En el archivo /etc/hosts agregamos la línea 
~~~
127.0.0.7               siig.localhost
~~~

Habilitamos el VirtualHost
~~~
 # a2ensite siig.localhost
~~~

También es recomendable activar el módulo mod_rewrite
~~~
 # a2enmod rewrite
~~~

Reiniciar apache
~~~
 # /etc/init.d/apache2 restart
~~~

### Permisos sobre carpetas
Es necesario tener [soporte para ACL](https://help.ubuntu.com/community/FilePermissionsACLs) en la partición en que 
está el proyecto y luego ejecutar

~~~
 # setfacl -R -m u:www-data:rwx -m u:`whoami`:rwx app/cache app/logs web/uploads
 # setfacl -dR -m u:www-data:rwx -m u:`whoami`:rwx app/cache app/logs web/uploads
~~~

### Verificar la configuración
Entra a la siguiente dirección desde el navegador http://siig.localhost/config.php 
Si aparece algún error debe ser corregido antes de continuar

### Configuración de la conexión
editar el archivo app/config/parameters.yml y colocar los valores correctos para las variables siguientes:

* database_host: localhost
* database_port: null
* database_name: nombre_base_datos
* database_user: nombre_usuario_base_datos
* database_password: clave_usuario


## 2. Instalación de Postgres

### Crear la base de datos
~~~
$ app/console doctrine:database:create
$ app/console doctrine:schema:update --force
~~~

### Cargar datos iniciales

~~~
$ app/console doctrine:fixtures:load
~~~

### Crear un usuario administrador
~~~
$ app/console fos:user:create --super-admin
~~~

### Instalación de HStore
[HStore](http://www.postgresql.org/docs/9.1/static/hstore.html) es un tipo especial de campo de PostgreSQL


- Ejecutar dentro de la base de datos, con el usuario postgres 
~~~
create extension hstore;
~~~

- Crear la tabla especial que no se manejará con el ORM, hacerlo con el usuario dueño de la base de datos 
- (no con el usuario postrgres, a menos que este mismo sea el dueño de la base de datos)
~~~
CREATE TABLE fila_origen_dato(
    id serial,
    id_origen_dato integer,
    datos hstore,

    PRIMARY KEY (id),
    FOREIGN KEY (id_origen_dato) REFERENCES origen_datos(id) on update CASCADE on delete CASCADE
);
~~~

## 3. Instalación de RabbitMQ

### Instalación de RabbitMQ
[RabbitMQ](http://www.rabbitmq.com/) es un sistema de mensajería empresarial completo y altamente confiable basado en el estándar AMQP
[Charla sobre RabbitMQ](http://www.symfony.es/noticias/2011/07/06/desymfony-2011-reduciendo-el-acoplamiento-entre-aplicaciones-con-rabbitmq/).
En este proyecto será utilizado para la carga masiva de datos y así evitar cuelgues o saturación del servidor.

- Agregar el repositorio
~~~
 # sh -c 'echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list'
~~~

- Agregar la clave pública
~~~
 # wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
 # apt-key add rabbitmq-signing-key-public.asc
~~~

- Ejecutar 
~~~
 # apt-get update
~~~

- Instalar el paquete
~~~
 # apt-get install rabbitmq-server
~~~

- Verificar que el servicio de rabbitmq esté corriendo
~~~
 # /etc/init.d/rabbitmq-server start
~~~

- Iniciar las colas
~~~
$ src/MINSAL/IndicadoresBundle/Util/iniciar_colas.sh
~~~
Pueden aparecer mensajes de aviso como "/usr/bin/nohup: redirecting stderr to stdout" solo debemos presionar ENTER


- Habilitar la interfaz web de administración
~~~
 # rabbitmq-plugins enable rabbitmq_management
 # /etc/init.d/rabbitmq-server restart
~~~

- Cargar la interfaz web: entrar a la dirección http://server_name:55672/mgmt/
El usuario por defecto es **guest** y la clave **guest**

## 4. Instalación de Servidor OLAP

En Debian squeeze con repositorio 'testing':

~#apt-get install python2.7 python-sqlalchemy python-werkzeug python-sqlite python-psycopg2 python-pip

Finalmente se debe usar un gestor de paquetes de Python para instalar el paquete del servidor OLAP 'Cubes'. La siguiente linea utiliza el gestor 'pip'.

~# pip install cubes
Desde la Carpeta siig/src/MINSAL/cubos, ejecutar:

~# slicer serve slicer.ini 

Este comando ejecuta el servidor OLAP y muestra la salida en pantalla.
La documentacion completa de este servidor dentor de la aplicacion esta disponible en la seccion "estion y Análisis de Cubos OLAP"

## Instalación de librería wkhtmltopdf
[wkhtmltopdf](http://code.google.com/p/wkhtmltopdf/) Es una utilidad de línea de comando para convertir html a pdf

1. Descargar wkhtmltopdf desde http://code.google.com/p/wkhtmltopdf/downloads/list elegir la versión adecuada al sistema operativo
2. Descomprimir. Ej.: tar xjf wkhtmltopdf-0.11.0_rc1-static-amd64.tar.bz2
3. Mover y renombrar el archivo: mv wkhtmltopdf-amd64 /usr/bin/wkhtmltopdf
4. Dar permisos de ejecución: chmod +x /usr/bin/wkhtmltopdf


### Cargar la aplicación
En este punto estamos listos para crgar la aplicacion desde: 
http://siig.localhost/app_dev.php
