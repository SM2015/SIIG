# Instalación del eTAB

## Requerimientos
* Servidor Web
* Gestor de base de datos
* PHP 5.3.8+
* Java 6



## Instalación de Symfony2
### Instalación de los requerimientos desde un servidor Debian 
Es muy importante poner atención al indicador "#" significa que el comando 
debe ser ejecutado como usuario root y "$" que debe ser ejecutado como un usuario normal, en ambos casos desde una consola de comandos.

~~~
# apt-get update
# apt-get install php5 php5-pgsql php5-sqlite sqlite php5-xdebug  php-apc php5-cli php5-xsl php5-intl php5-mcrypt apache2 postgresql acl git-core curl postgresql-contrib php5-ldap php5-mysql php5-sybase
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
 # nano /etc/apache2/sites-available/siig.localhost
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
* Modificar nombre_usuario por un usuario del sistema con que se modificará el código fuente

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

- Cargar la interfaz web: entrar a la dirección http://server_name:55672/mgmt/
El usuario por defecto es **guest** y la clave **guest**

- Además es necesario configurar el CRON para que ejecute periodicamente la carga de datos, con esto se llamará al proceso origen-dato:cargar que verificará para cada indicador si le corresponde realizar la carga de datos según se haya configurado: diario, mensual, bimensual, trimestral o anual. Un ejemplo podría ser crear el archivo: /etc/cron.d/carga-php-siig

~~~
#Ejecutar cada dia a las 00:00
0 0     * * *   www-data        test -x /usr/bin/php && /usr/bin/php /var/www/siig/app/console origen-dato:cargar
~~~


## Instalación de Servidor de Análisis Pentaho
 
Pentaho es un servidor de  análisis (Business Inteligence) modular que ofrece herramientas para la carga de datos(ETL), análisis dimensional (OLAP), minería de datos y  reportes entre otras. 
A continuación: 

1-Instalaremos el modulo base de Pentaho - edición comunidad

2- Configuraremos su servicio de análisis dimensional conocido como Mondrian 

3- Instalaremos la aplicación de visualización de cubos OLAP llamada SAIKU.

4- Modificaremos Apache: URL del SIIG apuntando a Pentaho 

5- Crear y Publicar Reportes por Indicador

El objetivo es usar el servidor Pentaho+Saiku para analizar los datos del SIIG y a la vez integrar esta aplicación dentro de  la plataforma del SIIG de forma que el usuario no se percate de que esta usando una aplicación externa. 

### Instalación de Pentaho

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

Asegurese de probar la conexión usando el botón "Test/Probar" al pie de esta misma ventana. Finalmente guarde sus cambios y detener la conolsa de administracion:

~~~
./stop-pac.sh
~~~

### Configuración  de Mondrian
Ahora que Pentaho ya puede conectarse a nuestra base datos, procederemos a configurar el servicio de Mondrian para la gestión de cubos OLAP. Para esto es necesario: 

- Crear un archivo para definir nuestro cubo OLAP. Mondrian conoce estos archivos como ‘schemas’ y puede ser creado usando la siguiente plantilla: 

https://github.com/erodriguez-minsal/SIIG/wiki/PlantillaIndicadorOLAP

Alternativamente el mismo archivo puede ser editado/creado  usando la aplicación Mondrian Schema Workbench disponible aquí:

http://sourceforge.net/projects/mondrian/files/schema%20workbench/

Finalmente guardamos el archivo de la siguiente forma:

Biserver-ce/pentaho-solutions/admin/resources/metadata/NOMBRE_CUBO.mondrian.xml

- Y Agregamos el nuevo cubo al listado de cubos de Mondrian. Este listado esta descrito en le archivo:
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
 
 
### Instalar SAIKU
Para poder manipular visualmente los cubos que hemos creado usaremos SAIKU. Esta es una aplicación que permite hacer consultas al cubo y mostrar resultados usando peticiones REST y AJAX. SIKU procesa la respuesta devuelta por Pentaho en formato JSON para generar representaciones visuales de los datos. Para saber mas cerca de SAIKU puede visitar:

http://analytical-labs.com/downloads.php

Para instalar SAIKU debemos primero instalar las librerías de CTOOLS. Estas librerías se pueden instalar automáticamente usando este Script:

https://github.com/pmalves/ctools-installer

Guardamos este archivo como: biserver-ce/instalar_ctools.sh y le damos permisos de ejecución:

~~~
#chmod +x instalar_ctools.sh
~~~

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

### Modificar Apache: URL del SIIG apuntando a SAIKU 

Para enmascarar le URL de Pentaho debemos activar el proxy de Apache para esto debemos activar un par de módulos de Apache:  

~~~
#a2enmod proxy proxy_http
~~~

Luego editamos la seccion VirtualHost dentro de /etc/apache2/sites-enabled/000-default:

```
<Location /admin/minsal/indicadores/saiku/>
      ProxyPass http://localhost:8080/pentaho/content/saiku/
      ProxyPassReverse http://localhost:8080/pentaho/content/saiku/
      SetEnv proxy-chain-auth
    </Location>
```



En este punto ya tenemos SAIKU disponible como una URL del SIIG en: 

http://localhost/admin/minsal/indicadores/saiku/


El servidor OLAP/Mondrian puede ser consultado a traves de SAIKU usando su API HTTP/REST. Esta API permite obtener informacion sobre 
los cubos existentes en el servidor OLAP asi como efectuar consultas, los resultados son deveultos en formato JSON. La documentacion de la API puede ser consultada en:


http://dev.analytical-labs.com/saiku/serverdocs/
 
### 4.5 Generación de Reportes 
 
Los reportes son generados usando el servidor de análisis Pentaho.
Cada indicador puede tener un reporte individual que incluye menúes de selección, gráficos, texto y tablas de datos según se requiera. 
Debido a que los requerimientos de análisis y presentación varían entre indicadores, estos reportes deben ser diseñados y publicados manualmente por el administrador del sistema. 
Los reportes existentes están disponibles desde  el menú del SIIG en administración->Indicadores->Ficha Tecnica (http://SIIG/admin/minsal/indicadores/fichatecnica/list).

El listado de Ficha Tecnica incluye un botón Mostrar Reporte que carga el reporte para el indicador correspondiente usando los datos disponibles mas recientes. 
Todos los indicadores en el listado tienen el botón 'Mostrar Reporte', sin embargo solo los reportes creados y publicados por el administrador del sistema están disponibles.

El proceso para crear y publicar reportes incluye:

1. Fijar clave para la publicación de contenidos al editar el archivo:

~~~ 
pentaho-solutions/system/publisher_config.xml 

para modificar esta linea

<publisher-password>NUEVA_CLAVE</publisher-password>
~~~

2. Crear Reporte para el Indicador deseado usando la aplicación de Reportes de Pentaho. Esta aplicación debe ser instalada en la terminal del administrador del sistema y puede ser descargada en:
http://reporting.pentaho.com/report_designer.php

Una guía completa sobre el diseño de reportes usando esta aplicación esta disponible en:

http://wiki.pentaho.com/display/Reporting/01.+Creating+Your+First+Report

Los reportes pueden ser creados y editados de forma local, y una vez terminados pueden ser publicados en el servidor de Pentaho. Al publicar un reporte, este inmediatamente esta disponible para el sistema SIIG. Si es necesario modificar un reporte existente, la modificación debe hacerse en forma local y luego publicar la nueva version del reporte . 

3. Publicar reporte. Al seleccionar el la opción publicar, aparece un ventana que nos pide elegir una carpeta en la cual se publicara el reporte. Para que pueda ser encontrada por el SIIG, asegurese de guardar todos sus reportes en  una carpeta llamada 'reportes'.  Si esta carpeta no existe puede crearla al momento de guardar su primer reporte usando el botón 'Nueva Carpeta'.  

Una vez dentro de la carpeta 'reportes' deberá asignar un nombre de archivo (Ejem: indicador15.prpt), un titulo e ingresar la clave de publicación que se fijo en el primer paso. 

~~~
NOTA: El SIIG  esta configurado para leer reportes tales como: reportes/indicadorX.prpt 
Por esto, si el reporte es publicado en una carpeta diferente o si el nombre 
asignado al archivo es diferente, no podrá ser leido por el SIIG. 
~~~

## Instalación de librería wkhtmltopdf
[wkhtmltopdf](http://code.google.com/p/wkhtmltopdf/) Es una utilidad de línea de comando para convertir html a pdf

1. Descargar wkhtmltopdf desde http://code.google.com/p/wkhtmltopdf/downloads/list elegir la versión adecuada al sistema operativo
2. Descomprimir. Ej.: tar xjf wkhtmltopdf-0.11.0_rc1-static-amd64.tar.bz2
3. Mover y renombrar el archivo: mv wkhtmltopdf-amd64 /usr/bin/wkhtmltopdf
4. Dar permisos de ejecución: chmod +x /usr/bin/wkhtmltopdf


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
