#Tablero eTAB
## Instalacion del Sistema Integrado de Información Gerencial

## Requerimientos
* Servidor Web
* Gestor de base de datos
* PHP 5.3.8+
* Java 6

## Pasos

1. Instalación de Symfony2
2. Instalación de Postgres
3. Instalación RabbitMQ
4. Instalación Servidor de Análisis
5. Librería wkhtmltopdf


## 1. Instalación de Symfony2
### Instalación de los requerimientos desde un servidor Debian 
Es muy importante poner atención al indicador "#" significa que el comando 
debe ser ejecutado como usuario root y "$" que debe ser ejecutado como un usuario normal
~~~
# apt-get update
# apt-get install php5 php5-pgsql php5-sqlite sqlite php5-xdebug  php-apc php5-cli php5-xsl php5-intl php5-mcrypt apache2 postgresql acl git-core curl postgresql-contrib php5-ldap
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
Al finalizar la instalación, se solicitará los parámetros de conexión a la base de datos, se deben ingresar los 
valores correspondientes.

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
 $ setfacl -R -m u:www-data:rwx -m u:`whoami`:rwx app/cache app/logs web/uploads
 $ setfacl -dR -m u:www-data:rwx -m u:`whoami`:rwx app/cache app/logs web/uploads
~~~
* Modificar nombre_usuario por un usuario del sistema con que se modificará el código fuente

### Verificar la configuración
Entra a la siguiente dirección desde el navegador http://siig.localhost/config.php 
Si aparece algún error debe ser corregido antes de continuar


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

## 4. Instalación de Servidor de Aanálisis Pentaho

 
Pentaho es un servidor de  análisis (Business Inteligence) modular que ofrece herramientas para la carga de datos(ETL), análisis dimensional (OLAP), minería de datos y  reportes entre otras. 
A continuación: 

1-Instalaremos el modulo base de Pentaho - edición comunidad

2- Configuraremos su servicio de análisis dimensional conocido como Mondrian 

3- Instalaremos la aplicación de visualización de cubos OLAP llamada SAIKU.

El objetivo es usar el servidor Pentaho+Saiku para analizar los datos del SIIG y a la vez integrar esta aplicación dentro de  la plataforma del SIIG de forma que el usuario no se percate de que esta usando una aplicación externa. 

### 4.1 Instalación de Pentaho

Pentaho es una aplicación escrita en JAVA que utiliza persistencia (Hibernate) un servidor de aplicaciones (Tomcat). Pentaho servirá como plataforma ejecutar nuestra aplicación de análisis de datos.

- Instalar Java y soporte de Postgres:

~~~
# apt-get install openjdk-6-jre libpg-java
~~~

- Descargar la ultima versión del servidor de Pentaho en:

http://community.pentaho.com/projects/bi_platform/

Y luego descomprimir el archivo descargado en la carpeta que elijamos.

El archivo comprimido del servidor de Pentaho (biserver-ce-X.X-estable.tar) contiene dos carpetas con dos servicios diferentes:

- biserver-ce, la plataforma sobre la cual se instalaran nuevas aplicaciones visibles a los usuarios, accesible por el puerto 8080
- aministration-console, la interfaz de administración del servidor que permite manejar cuentas de usuario, roles y conexiones a bases de datos, accesible desde el puerto 8099.   

Cada uno de estos dos servicios tiene su script de inicio correspondiente y credenciales por defecto. A continuación eliminaremos el sistema de seguridad interno de Pentaho, para que no pida credenciales y así  facilitar la integración con el resto del sistema SIIG. Estos cambios afectan ambos servicios: la plataforma de Pentaho y la consola de administración. Para eliminar el uso de credenciales basta seguir las instrucciones del manual oficial de Pentaho:

http://wiki.pentaho.com/display/ServerDoc2x/Removing+Security

Luego de hacer esos cambios estamos listos para iniciar el servidor:  
~~~
# cd biserver-ce
# ./start-pentaho.sh
~~~

En este punto deberíamos poder abrir la aplicación sin usar credenciales usando la dirección del servidor:

http://localhost:8080/pentaho
~~~
Nota: Si fuesen necesarias, las credenciales por defecto son usuario: joe, pwd: password
Los errores del sistema son registrados en:
Log de Pentaho:  biserver-ce/tomcat/logs/pentaho.log 
Log de Servidor Tomcat: biserver-ce/tomcat/logs/catalina.out 
~~~

A continuación, conectaremos Pentaho a la base de datos del SIIG usando la consola de administración. La consola de administración no incluye soporte para Postgres. El primer paso es copiar el manejador de Postgres:
~~~
# cp biserver-ce/tomcat/lib/postgresql-9.1-902.jdbc4.jar administration-console/jdbc/
~~~

Luego arrancamos la consola de administración usando el script dentro de la carpeta administration-console:

~~~
# ./start-pac.sh
En este punto ya podemos conectarnos a http://localhost:8099/
Nota: Si fuese necesario las credenciales por defecto son: usuario: admin, pwd: password
~~~

Una vez dentro de la consola, podemos crear nueva conexión de bases de datos, asegurándonos de usar estos valores.

~~~
nombre: NOMBRE_CONN 
driver: org.postgres.Driver
URL: jdbc:postgresql://localhost:5432/NOMRE_BASE_DE_DATOS
~~~

Asegurese de probar la conexión usando el botón "Test/Probar" al pie de esta misma ventana. Finalmente guarde sus cambios.

### 4.2 Configuracion de Mondrian
Ahora que Pentaho ya puede conectarse a nuestra base datos, procederemos a configurar el servicio de Mondrian para la gestión de cubos OLAP. Para esto es necesario: 

- Crear un archivo para definir nuestro cubo OLAP. Mondrian conoce estos archivos como ‘schemas’ y puede ser creado usando la siguiente plantilla: 

https://github.com/erodriguez-minsal/SIIG/wiki/PlantillaIndicadorOLAP

Alternativamente el mismo archivo puede ser editado/creado  usando la aplicación Mondrian Schema Workbench disponible aquí:

http://sourceforge.net/projects/mondrian/files/schema%20workbench/

Finalmente guardamos el archivo de la siguiente forma:

Biserver-ce/pentaho-solutions/admin/resources/metadata/NOMBRE_CUBO.mondrian.xml

Y Agregamos el nuevo cubo al listado de cubos de Mondrian. Este listado esta descrito en le archivo:
biserver-ce/pentaho-solutions/system/olap/datasources.xml

En este archivo cada cubo esta definido de la siguiente forma:
~~~
 <Catalog name="NOMBRE_CUBO"> 
        <DataSourceInfo>Provider=mondrian;DataSource=NOMBRE_CONN_BD</DataSourceInfo>  
        <Definition>solution:admin/resources/metadata/NOMBRE_CUBO.mondrian.xml</Definition> 
      </Catalog>
~~~

 Este listado puede incluir varios cubos, por cada cubo que se agregue al sistema habrá que crear su archivo/esquema correspondiente y agregarlo a este listado.
Alternativamente, la aplicación Mondrian Workbench, puede generar el esquema del cubo y luego publicarlo/agregarlo a este listado por nosostros.
 

### 4.3 Instalar SAIKU

Para poder manipular visualmente los cubos que hemos creado usaremos SAIKU. Esta es una aplicación que permite hacer consultas al cubo y mostrar resultados usando peticiones REST y AJAX. SIKU procesa la respuesta devuelta por Pentaho en formato JSON para generar representaciones visuales de los datos. Para saber mas cerca de SAIKU puede visitar:

http://analytical-labs.com/downloads.php

Para instalar SAIKU debemos primero instalar las librerías de CTOOLS. Estas librerías se pueden instalar automáticamente usando este Script:

https://github.com/pmalves/ctools-installer

Guardamos este archivo como: biserver-ce/instalar_ctools.sh
Le damos permisos de ejecución: ~#chmod +x instalar_ctools.sh

Y ejecutamos el script :
~~~
# ./instalar_ctools.sh –s pentaho-solutions/
~~~

El Script preguntara si queremos instalar todas las librerías, incluyendo el paquete SAIKU, respondemos que si a todo.

Reiniciar Pentaho:
 ~~~
# ./stop-pentaho.sh  
# ./start-pentaho.sh
~~~


5- Activar el proxy de Apache/Esconder el Puerto de Pentaho

Activar módulos de Apache:  a2enmod proxy proxy_http

editar la seccion VirtualHost dentro de /etc/apache2/sites-enabled/000-default:

```
<Location /saiku/>
      ProxyPass http://localhost:8080/pentaho/content/saiku/
      ProxyPassReverse http://localhost:8080/pentaho/content/saiku/
      SetEnv proxy-chain-auth
    </Location>
```



En este punto ya tenemos SAIKU disponible en: 

http://myserver/saiku-ui/index.html?biplugin=true


El servidor OLAP/Mondrian puede ser consultado a traves de SAIKU usando su API HTTP/REST. Esta API permite obtener informacion sobre 
los cubos existentes en el servidor OLAP asi como efectuar consultas, los resultados son deveultos en formato JSON. La documentacion de la API puede ser consultada en:


http://dev.analytical-labs.com/saiku/serverdocs/
 

## Instalación de librería wkhtmltopdf
[wkhtmltopdf](http://code.google.com/p/wkhtmltopdf/) Es una utilidad de línea de comando para convertir html a pdf

1. Descargar wkhtmltopdf desde http://code.google.com/p/wkhtmltopdf/downloads/list elegir la versión adecuada al sistema operativo
2. Descomprimir. Ej.: tar xjf wkhtmltopdf-0.11.0_rc1-static-amd64.tar.bz2
3. Mover y renombrar el archivo: mv wkhtmltopdf-amd64 /usr/bin/wkhtmltopdf
4. Dar permisos de ejecución: chmod +x /usr/bin/wkhtmltopdf


## Validación de Usarios desde directorios LDAP

Si un usuario aun no esta creado dentro del sistema, se hara una busqueda en el drictorio LDAP especificado en el archivo app/config/config.yml.
A continuacion se muestran las lineas relvantes para especificar que directorio usar:

```yml
#Fr3d_LDAP
fr3d_ldap:
    driver:
        host:         10.10.20.2 # IP del Servidor LDAP Zimbra/Minsal
        port:         389    # Opcional
    user:
        baseDn:          ou=people,dc=salud,dc=gob,dc=sv # contenedor de usuarios
        filter: (objectClass=organizationalPerson) # esquema comun para todos los usuarios del directorio
```

### Cargar la aplicación
En este punto estamos listos para crgar la aplicacion desde: 
http://siig.localhost/app_dev.php
