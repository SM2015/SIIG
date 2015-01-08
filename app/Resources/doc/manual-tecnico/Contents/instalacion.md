# Instalación del eTAB

## Requerimientos
* Servidor Web
* Gestor de base de datos
* PHP 5.3.8+



## Instalación de Symfony2
### Instalación de los requerimientos desde un servidor Debian 
Es muy importante poner atención al indicador "#" significa que el comando 
debe ser ejecutado como usuario root y "$" que debe ser ejecutado como un usuario normal, en ambos casos desde una consola de comandos.

~~~
# apt-get update
# apt-get install php5 php5-pgsql php5-sqlite sqlite php5-xdebug  php-apc php5-cli php5-xsl php5-intl php5-mcrypt apache2 postgresql acl git-core curl postgresql-contrib php5-ldap php5-mysql php5-sybase php5-json postgresql-contrib redis-server
# php5enmod mcrypt
~~~

### Crear usuario y directorio de trabajo
El directorio y usuario a utilizar pueden variar de acuerdo a los que se deseen elegir en cada instalación, como ejemplo se usará un usuario llamado *siig* y el directorio de instalación */var/www/siig*
~~~
# adduser siig
# mkdir /var/www/siig
# chown siig:siig /var/www/siig
# su siig
$ cd /var/www
~~~

### Obtener el código fuente
Puedes descargarlo desde: https://github.com/SM2015/SIIG/tarball/master o clonar el repositorio

~~~
$ git clone -b v1.0.0 https://github.com/SM2015/SIIG.git siig
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
Al finalizar la instalación, se solicitará los parámetros de conexión a la base de datos, 
se deben ingresar los valores correspondientes. Más adelante, en la sección "Configuración de PosgreSQL" 
se muestra un ejemplo de cómo crear un usuario de la base de datos para utilizarlo en el Siig. Ademas en la sección 
"Configuración de Mondrian" se explica el significad de las variables: carpeta_siig_mondrian, conexion_bd_pentaho y listado_metadata.

## Configuración

### Servidor web 
Esto es para una instalación de prueba en una máquina local, la instalación real en un servidor el administrador de servicios deberá realizar esta configuración
con los parámetros más adecuados: ip, dominio, configuración en el DNS, etc.

####Configurar un VirtualHost
Creamos el archivo para la definición del VirtualHost
~~~
 # nano /etc/apache2/sites-available/siig.localhost.conf
~~~
El contenido será similar a esto:
~~~
<VirtualHost 127.0.0.7>
 
    ServerName siig.localhost
    DocumentRoot /var/www/siig/web
 
    <Directory /var/www/siig/web >
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
 $ setfacl -R -m u:www-data:rwx -m u:`whoami`:rwx app/cache app/logs web/uploads
 $ setfacl -dR -m u:www-data:rwx -m u:`whoami`:rwx app/cache app/logs web/uploads
~~~

### Verificar la configuración
Entra a la siguiente dirección desde el navegador http://siig.localhost/config.php 
Si aparece algún error debe ser corregido antes de continuar


## Configuración de Postgres

### Editar archivo de configuración
Como usuario root realizar:

1. Editar el archivo */etc/postgresql/9.1/main/pg_hba.conf* 
2. Cambiar la siguiente línea, sustituir la última palabra por *md5* 
~~~
local   all             all                       md5
~~~
Reiniciar PostgreSQL
~~~
# /etc/init.d/postgresql restart
~~~

### Crear el usuario dueño de la base de datos

Se creará el usuario dueño de la base de datos, las opciones utilizadas dependerán de los criterios que se quieran seguir, se muestra un ejemplo, ejecutar *createuser --help* para la explicación de las opciones.
El nombre utilizado y la clave debe corresponder con los parámetros especificados al ejecutar *php composer.phar install* en unas secciones anteriores

~~~
# su postgres
$ createuser -d -S  -R -P admin;
~~~

Al finalizar presionar la combinación Ctrl+D 2 veces para regresar al usuario siig y continuar con la instalación.

### Crear la base de datos
~~~
$ app/console doctrine:database:create
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
    id_origen_dato integer,
    datos hstore,
    ultima_lectura timestamp,

    FOREIGN KEY (id_origen_dato) REFERENCES origen_datos(id) on update CASCADE on delete CASCADE
);
~~~

- Ejecutar dentro de la base de datos, con el usuario dueño de la base
~~~
\i [directorio_instalacion]/src/MINSAL/CostosBundle/Resources/estructurasBD/estructuras.sql
\i [directorio_instalacion]/src/MINSAL/CostosBundle/Resources/estructurasBD/costos_rrhh.sql
~~~

- Crear la estructura de la base de datos
~~~
$ app/console doctrine:schema:update --force
~~~

### Cargar datos iniciales

~~~
$ app/console doctrine:fixtures:load
~~~

### Crear un usuario administrador del SIIG
~~~
$ app/console fos:user:create --super-admin
~~~

## Instalación de RabbitMQ

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

- Cargar la interfaz web: entrar a la dirección http://server_name:15672
El usuario por defecto es **guest** y la clave **guest**

- Además es necesario configurar el CRON para que ejecute periodicamente la carga de datos, con esto se llamará al proceso origen-dato:cargar que verificará para cada indicador si le corresponde realizar la carga de datos según se haya configurado: diario, mensual, bimensual, trimestral o anual. Un ejemplo podría ser crear el archivo: /etc/cron.d/carga-php-siig

~~~
#Ejecutar cada dia a las 00:00
0 0     * * *   www-data        test -x /usr/bin/php && /usr/bin/php /var/www/siig/app/console origen-dato:cargar
~~~


## Instalación de librería wkhtmltopdf
[wkhtmltopdf](http://wkhtmltopdf.org) Es una utilidad de línea de comando para convertir html a pdf

1. Descargar wkhtmltopdf desde http://wkhtmltopdf.org/downloads.html elegir la versión adecuada al sistema operativo
2. Descomprimir. Ej.: tar xjf wkhtmltox-linux-amd64_0.12.0-03c001d.tar.xz
3. Copiar el archivo (como root): cp wkhtmltox/bin/wkhtmltopdf /usr/bin/wkhtmltopdf
4. Dar permisos de ejecución (como root): chmod +x /usr/bin/wkhtmltopdf


## OPCIONAL: Validación de Usarios desde directorios LDAP

Si fuese necesario validar usuarios contra un directorio LDAP, se deben seguir los pasos descritos en esta sección. Si un usuario aun no esta creado dentro del sistema, se hara una busqueda en el drictorio LDAP especificado en el archivo app/config/config.yml.
A continuacion se muestran las lineas relvantes para especificar que directorio usar:

~~~
#Fr3d_LDAP
fr3d_ldap:
    driver:
        host:         10.10.20.2 # IP del Servidor LDAP institucional
        port:         389    # Opcional
    user:
        baseDn:          ou=people,dc=salud,dc=gob,dc=sv # contenedor de usuarios
        filter: (objectClass=organizationalPerson) # esquema comun para todos los usuarios del directorio
~~~

### Cargar la aplicación
En este punto estamos listos para crgar la aplicacion desde: 
http://siig.localhost/app_dev.php
