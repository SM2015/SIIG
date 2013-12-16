# Instalación del eTAB

## Requerimientos
* Servidor Web
* Gestor de base de datos
* PHP 5.3.8+
* Java 6


## Instalación de Symfony2
### Instalación de los requerimientos desde un servidor Debian 
Es muy importante poner atención al indicador "**#**" significa que el comando debe ser ejecutado como usuario **root** y "**$**" que debe ser ejecutado como un **usuario normal**, en ambos casos desde una **consola de comandos**.

<blockquote>
Actualizamos la lista de paquetes del sistema operativo.

<p># apt-get update</p>

Instalamos todas las librerías y aplicaciones que se utilizan en el sistema (PHP, PostgreSQL y Git).
<p># apt-get install php5 php5-pgsql php5-sqlite sqlite php5-xdebug  php-apc php5-cli php5-xsl php5-intl php5-mcrypt apache2 postgresql acl git-core curl postgresql-contrib php5-ldap php5-mysql php5-sybase php5-json</p>
</blockquote>

### Crear usuario y directorio de trabajo
El directorio y usuario a utilizar pueden variar de acuerdo a los que se deseen elegir en cada instalación. Como ejemplo se usará un usuario llamado **siig** y el directorio de instalación **/var/www/siig**

<blockquote>
Creamos el usuario
<p># adduser siig</p>
Creamos el directorio
<p># mkdir /var/www/siig</p>
Asignamos como dueño del directorio al usuario que acabamos de crear, en nuestro caso es siig
<p># chown siig:siig /var/www/siig</p>
Nos cambiamos al usuario que es dueño de la directorio siig
<p># su siig</p>
Accedemos a la carpeta web del Apache
<p>$ cd /var/www</p>
</blockquote>



### Obtener el código fuente
Puedes descargarlo desde: [https://github.com/erodriguez-minsal/SIIG/tarball/master](https://github.com/erodriguez-minsal/SIIG/tarball/master) o clonar el repositorio

<blockquote>
$ git clone https://github.com/erodriguez-minsal/SIIG.git siig
</blockquote>

Recuerda que actualmente estamos en el directorio */var/www* y el último parámetro del git clone es la carpeta en donde se descargará el código fuente del repositorio, en este nuestro caso es *siig*.

```
NOTA: A partir de este punto todos los comandos se deben ejecutar dentro de la carpeta en que se ha descargado el código fuente.
```

<blockquote>
<p>Si se desea tener las aportaciones del equipo SM2015 Chiapas, es necesario cambiar de rama el repositorio, esto se logra ejecutando la siguiente sentencia:</p> 
<p>git checkout chiapas</p>
</blockquote>

### Instalar composer
[Composer](http://getcomposer.org) es una librería de PHP para el manejo de dependencias. Para instalarlo, dentro de la carpeta donde descargaste el código fuente se debe ejecutar:

<blockquote>
$ curl -s https://getcomposer.org/installer | php
</blockquote>

### Instalar todas las librerías necesarias

<blockquote>
$ php composer.phar install
</blockquote>

Dado que Symfony2 es un proyecto Open Source, depende de librerías y paquetes de terceros, por lo que puede presentarse el caso que al ejecutar composer install se produzca un error de dependencias. Al ejecutar el composer install este lee el archivo composer.json donde se encuentran las dependencias del proyecto. Al terminar la instalación este crea el archivo composer.lock el cual contiene las especificación exacta de las versiones de los paquetes instalados, por lo que puede utilizar como alternativa el siguiente archivo [composer.lock](https://github.com/erodriguez-minsal/SIIG/tree/chiapas/app/Resources/doc/composer.lock) e intentar nuevamente la instalación, este solo en caso de presentarse el problema de dependencias.

Durante la instalación se solicitarán los siguientes parámetros (Si desea conservar el valor por defecto para cada entrada es suficiente con presionar Enter para confirmar el valor):

<blockquote>
<p>database_driver: pdo_pgsql</p>
Esta variable contiene el driver php que manejará la comunicación con la base de datos en la capa de acceso a datos, dado que la plataforma trabaja con PostgreSQL su valor por defecto será pdo_pgsql, se recomienda no modificar este valor. 
<p>database_host: localhost</p>
Se refiere al host donde se encuentra alojado el servidor de base de datos, en nuestro caso es el mismo que el servidor web.
<p>database_port: null</p>
El puerto del manejador de base de datos, en nuestro caso es null ya que utiliza el puerto por defecto para el PostgreSQL (5432).
<p>database_name: indicadores</p>
Nombre de la base de datos, mas adelante se creará la base de datos con ayuda de Symfony.
<p>database_user: admin</p>
Nombre del usuario para la base de datos, este se creará mas adelante en la sección Configuración de PostgreSQL.
<p>database_password: rodriguez</p>
Contraseña del usuario para la base de datos.
<p>mailer_transport: smtp</p>
Protocolo para la transferencia de correo electrónico.
<p>mailer_host: localhost</p>
Servidor de correo electrónico.
<p>mailer_user: null</p>
Usuario para el servidor de correo electrónico.
<p>mailer_password: null</p>
Contraseña del usuario para el servidor de correo electrónico.
<p>locale: es_SV</p>
Lenguaje por defecto para la aplicación.
<p>secret: 295125e6c66ab2a1038b62ad3c910733510</p>
Esta es una cadena que debe ser única, se utiliza para la generación de las tokens CSRF, pero que podría ser utilizado en cualquier otro contexto en donde una cadena única es útil, como por ejemplo, la encriptación de las contraseñas de usuario.
<p>archivo_vitacora: %kernel.logs_dir%/minsal.log</p>
Archivo donde se guardará el registro de eventos de la aplicación. %kernel.logs_dir% es una variable de Symfony2 que hace referencia a la ruta relativa app/logs/ (con respecto a directorio de instalación).
<p>carpeta_siig_mondrian: %kernel.root_dir%/mondrian/</p>
Carpeta de esquemas generados por la aplicación para Pentaho, esta variable es utilizada por Saiku. %kernel.root_dir% es una variable de Symfony2 que hace referencia a la ruta relativa app/ (con respecto a directorio de instalación).
<p>conexion_bd_pentaho: Minsal</p>
Nombre de conexión a base de datos dentro de Pentaho.
<p>listado_metadata: datasources.siig</p>
Archivo que lista esquemas existentes y su conexión. Este archivo debe estar ligado al fichero ../pentaho-solutions/system/olap/datasources.xml
<p></p>
</blockquote>

## Configuración

### Servidor web 
Esto es para una instalación de prueba en una máquina local, la instalación real en un servidor el administrador de servicios deberá realizar esta configuración
con los parámetros más adecuados: ip, dominio, configuración en el DNS, etc.

####Configurar un VirtualHost
Creamos el archivo para la definición del VirtualHost

<blockquote>
# nano /etc/apache2/sites-available/siig.localhost
</blockquote>

El contenido será similar a esto:

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


En el archivo /etc/hosts agregamos la línea 

<blockquote>
127.0.0.7               siig.localhost
</blockquote>

Habilitamos el VirtualHost
<blockquote>
# a2ensite siig.localhost
</blockquote>

También es recomendable activar el módulo mod_rewrite
<blockquote>
# a2enmod rewrite
</blockquote>

Reiniciar apache
<blockquote>
# /etc/init.d/apache2 restart
</blockquote>

### Permisos sobre carpetas
Es necesario tener [soporte para ACL](https://help.ubuntu.com/community/FilePermissionsACLs) en la partición en que 
está el proyecto y luego ejecutar

<blockquote>
<p>$ setfacl -R -m u:www-data:rwx -m u:`whoami`:rwx app/cache app/logs web/uploads</p>
<p>$ setfacl -dR -m u:www-data:rwx -m u:`whoami`:rwx app/cache app/logs web/uploads</p>
</blockquote>


### Verificar la configuración
Entra a la siguiente dirección desde el navegador [*http://siig.localhost/config.php*](http://siig.localhost/config.php). Si aparece algún error debe ser corregido antes de continuar.


## Configuración de PostgreSQL

### Editar archivo de configuración
Como usuario root realizar:

1. Editar el archivo */etc/postgresql/9.1/main/pg_hba.conf* 

2. Cambiar la siguiente línea, sustituir la última palabra por *md5* 

<blockquote>
local             all             all                       md5
</blockquote>

Reiniciar PostgreSQL

<blockquote>
# /etc/init.d/postgresql restart
</blockquote>

### Crear el usuario dueño de la base de datos

Se creará el usuario dueño de la base de datos, las opciones utilizadas dependerán de los criterios que se quieran seguir, se muestra un ejemplo, ejecutar *createuser --help* para la explicación de las opciones. El nombre utilizado y la clave debe corresponder con los parámetros especificados al ejecutar *php composer.phar install* en unas secciones anteriores

<blockquote>
<p># su postgres</p>
<p>$ createuser -d -S  -R -P admin;</p>
</blockquote>

Al finalizar presionar la combinación Ctrl+D 2 veces para regresar al usuario siig y continuar con la instalación.

### Crear la base de datos
Symfony hace uso del bundle [Doctrine](http://gitnacho.github.io/symfony-docs-es/book/doctrine.html) para el manejo de la capa de datos.
<blockquote>
$ app/console doctrine:database:create
</blockquote>

Este comando creará la base de datos.

<blockquote>
$ app/console doctrine:schema:update --force
</blockquote>

Este comando creará la estructura de las tablas del sistema.

### Cargar datos iniciales
<blockquote>
$ app/console doctrine:fixtures:load
</blockquote>

Con este comando se insertan los datos iniciales del sistema.

### Crear un usuario administrador del SIIG
Symfony hace uso del bundle [FOSUser](https://github.com/FriendsOfSymfony/FOSUserBundle/blob/master/Resources/doc/index.md) para la administración de usuarios.

<blockquote>
$ app/console fos:user:create --super-admin
</blockquote>

Con este *usuario* se iniciará **sesión** en la aplicación web al terminar instalación.

### Instalación de HStore
[HStore](http://www.postgresql.org/docs/9.1/static/hstore.html) es un tipo especial de campo de PostgreSQL. 

- Conectarse al servidor de base de datos con el usuario postgres, esto se logra ejecutando desde una ventana de comando las siguientes sentencias:
<blockquote>
# psql -U postgres -d database_name
</blockquote>

El parametro database_name es el que se estableció anteriormente al ejecutar composer install. Ahora procedemos a crear la extensión hstore:

<blockquote>
create extension hstore;
</blockquote>

Salir de la línea de comandos del PostgreSQL con \q.

- Crear la tabla especial que no se manejará con el ORM, hacerlo con el usuario dueño de la base de datos (no con el usuario postgres, a menos que este mismo sea el dueño de la base de datos).

<blockquote>
# psql -U database_user -d database_name
</blockquote>

El parametro database_user y database_name se establecieron anteriormente al ejecutar composer install.

    CREATE TABLE fila_origen_dato(
        id_origen_dato integer,
        datos hstore,
        ultima_lectura timestamp,
    
        FOREIGN KEY (id_origen_dato) REFERENCES origen_datos(id) on update CASCADE on delete CASCADE
    );

Salir de la línea de comandos del PostgreSQL con \q.

Si se prefiere, hay una alternativa de interfaz gráfica para la administración de PostgreSQL, este es *pgAdmin*. Para instalar este administrador ejecutar la siguiente sentencia:

<blockquote>
# aptitude install pgadmin3
</blockquote>

## Instalación de RabbitMQ

[RabbitMQ](http://www.rabbitmq.com/) es un sistema de mensajería empresarial completo y altamente confiable basado en el estándar AMQP 
[Charla sobre RabbitMQ](http://www.symfony.es/noticias/2011/07/06/desymfony-2011-reduciendo-el-acoplamiento-entre-aplicaciones-con-rabbitmq/).
En este proyecto será utilizado para la carga masiva de datos y así evitar cuelgues o saturación del servidor.

- Agregar el repositorio
<blockquote>
# sh -c 'echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list'
</blockquote>

- Agregar la clave pública
<blockquote>
<p># wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc</p>
<p># apt-key add rabbitmq-signing-key-public.asc</p>
</blockquote>

- Ejecutar 
<blockquote>
# apt-get update
</blockquote>

- Instalar el paquete
<blockquote>
# apt-get install rabbitmq-server
</blockquote>

- Verificar que el servicio de rabbitmq esté corriendo
<blockquote>
# /etc/init.d/rabbitmq-server start
</blockquote>

- Habilitar la interfaz web de administración
<blockquote>
<p># rabbitmq-plugins enable rabbitmq_management</p>
<p># /etc/init.d/rabbitmq-server restart</p>
</blockquote>

- Cargar la interfaz web: entrar a la dirección [*http://localhost:55672/mgmt/*](http://localhost:55672/mgmt/). El usuario por defecto es **guest** y la clave **guest**

- Iniciar las colas
<blockquote>
$ src/MINSAL/IndicadoresBundle/Util/iniciar_colas.sh
</blockquote>
Pueden aparecer mensajes de aviso como "/usr/bin/nohup: redirecting stderr to stdout" solo debemos presionar ENTER

- Además es necesario configurar el **CRON** para que ejecute periódicamente la carga de datos, con esto se llamará al proceso origen-dato:cargar que verificará para cada indicador si le corresponde realizar la carga de datos según se haya configurado: diario, mensual, bimensual, trimestral, cuatrimestral, semestral o anual. Un ejemplo podría ser crear el archivo: /etc/cron.d/carga-php-siig con el siguiente contenido:

<blockquote>
<p>#Ejecutar cada dia a las 00:00</p>
<p>0 0     * * *   www-data        test -x /usr/bin/php && /usr/bin/php /var/www/siig/app/console origen-dato:cargar</p>
</blockquote>


## Instalación de Servidor de Análisis Pentaho
 
Pentaho es un servidor de  análisis (Business Inteligence) modular que ofrece herramientas para la carga de datos(ETL), análisis dimensional (OLAP), minería de datos y reportes entre otros. A continuación: 

1-Instalaremos el modulo base de Pentaho - edición comunidad.

2- Configuraremos su servicio de análisis dimensional conocido como Mondrian. 

3- Instalaremos la aplicación de visualización de cubos OLAP llamada SAIKU.

4- Modificaremos Apache: URL del SIIG apuntando a Pentaho.

5- Crear y Publicar Reportes por Indicador.

El objetivo es usar el servidor Pentaho+Saiku para analizar los datos del SIIG y a la vez integrar esta aplicación dentro de la plataforma del SIIG de forma que el usuario no se percate de que esta usando una aplicación externa. 

### Instalación de Pentaho

Pentaho es una aplicación escrita en JAVA que utiliza persistencia (Hibernate) un servidor de aplicaciones (Tomcat). Pentaho servirá como plataforma para ejecutar nuestra aplicación de análisis de datos.

- Instalar Java y soporte de Postgres:

<blockquote>
# apt-get install openjdk-6-jre libpg-java
</blockquote>

- Descargar la ultima versión del servidor de Pentaho en:

[http://community.pentaho.com/projects/bi_platform/](http://community.pentaho.com/projects/bi_platform/)

Y luego descomprimir el archivo descargado en la carpeta que elijamos.

El archivo comprimido del servidor de Pentaho (biserver-ce-X.X-estable.tar) contiene dos carpetas con dos servicios diferentes:

- biserver-ce, la plataforma sobre la cual se instalaran nuevas aplicaciones visibles a los usuarios, accesible por el puerto 8080.

- aministration-console, la interfaz de administración del servidor que permite manejar cuentas de usuario, roles y conexiones a bases de datos, accesible desde el puerto 8099.   

Cada uno de estos dos servicios tiene su script de inicio correspondiente y credenciales por defecto. A continuación eliminaremos el sistema de seguridad interno de Pentaho, para que no pida credenciales y así  facilitar la integración con el resto del sistema SIIG. Estos cambios afectan ambos servicios: la plataforma de Pentaho y la consola de administración. Para eliminar el uso de credenciales basta seguir las instrucciones del manual oficial de Pentaho:

[http://wiki.pentaho.com/display/ServerDoc2x/Removing+Security](http://wiki.pentaho.com/display/ServerDoc2x/Removing+Security)

Luego de hacer esos cambios estamos listos para iniciar el servidor:  
<blockquote>
<p># cd biserver-ce</p>
<p># ./start-pentaho.sh</p>
</blockquote>

En este punto deberíamos poder abrir la aplicación sin usar credenciales usando la dirección del servidor:

[http://localhost:8080/pentaho](http://localhost:8080/pentaho)


    Nota: Si fuesen necesarias, las credenciales por defecto son 
    usuario: joe, 
    contraseña: password
    
    Los errores del sistema son registrados en:
    Log de Pentaho:  biserver-ce/tomcat/logs/pentaho.log 
    Log de Servidor Tomcat: biserver-ce/tomcat/logs/catalina.out 


A continuación, conectaremos Pentaho a la base de datos del SIIG usando la consola de administración. La consola de administración no incluye soporte para Postgres. El primer paso es copiar el manejador de Postgres:

<blockquote>
# cp biserver-ce/tomcat/lib/postgresql-9.1-902.jdbc4.jar administration-console/jdbc/
</blockquote>

Luego arrancamos la consola de administración usando el script dentro de la carpeta administration-console:

<blockquote>
# ./start-pac.sh
</blockquote>

En este punto ya podemos conectarnos a:

[http://localhost:8099/](http://localhost:8099/)

    Nota: Si fuese necesario las credenciales por defecto son: 
    usuario: admin
    contraseña: password

Una vez dentro de la consola, podemos crear nueva conexión de bases de datos, asegurándonos de usar estos valores.

<blockquote>
<p>nombre: conexion_bd_pentaho<p> 
<p>driver: org.postgres.Driver<p>
<p>URL: jdbc:postgresql://localhost:5432/database_name<p>
</blockquote>

Los parámetros conexion_bd_pentaho y database_name deben de ser los que se establecieron anteriormente al ejecutar el comando composer install.

Asegúrese de probar la conexión usando el botón "Test/Probar" al pie de esta misma ventana. Finalmente guarde sus cambios y detener la consola de administración:

<blockquote>
./stop-pac.sh
</blockquote>

### Configuración  de Mondrian
Ahora que Pentaho ya puede conectarse a nuestra base datos, procederemos a configurar el servicio de Mondrian para la gestión de cubos OLAP. Para esto es necesario: 

- Crear un archivo para definir nuestro cubo OLAP. Mondrian conoce estos archivos como ‘schemas’ y puede ser creado usando la siguiente plantilla: 

[https://github.com/erodriguez-minsal/SIIG/wiki/PlantillaIndicadorOLAP](https://github.com/erodriguez-minsal/SIIG/wiki/PlantillaIndicadorOLAP)

Alternativamente el mismo archivo puede ser editado/creado usando la aplicación Mondrian Schema Workbench disponible aquí:

[http://sourceforge.net/projects/mondrian/files/schema%20workbench/](http://sourceforge.net/projects/mondrian/files/schema%20workbench/)

Finalmente guardamos el archivo de la siguiente forma:

Biserver-ce/pentaho-solutions/admin/resources/metadata/NOMBRE_CUBO.mondrian.xml

- Y Agregamos el nuevo cubo al listado de cubos de Mondrian. Este listado esta descrito en el archivo:

biserver-ce/pentaho-solutions/system/olap/datasources.xml

En este archivo cada cubo esta definido de la siguiente forma:

    <Catalog name="NOMBRE_CUBO"> 
        <DataSourceInfo>Provider=mondrian;DataSource=conexion_bd_pentaho</DataSourceInfo>  
        <Definition>solution:admin/resources/metadata/NOMBRE_CUBO.mondrian.xml</Definition> 
    </Catalog>

Este listado puede incluir varios cubos, por cada cubo que se agregue al sistema habrá que crear su archivo/esquema correspondiente y agregarlo a este listado. Alternativamente, la aplicación Mondrian Workbench, puede generar el esquema del cubo y luego publicarlo/agregarlo a este listado.
 
 
### Instalar SAIKU
Para poder manipular visualmente los cubos que hemos creado usaremos SAIKU. Esta es una aplicación que permite hacer consultas al cubo y mostrar resultados usando peticiones REST y AJAX. SAIKU procesa la respuesta devuelta por Pentaho en formato JSON para generar representaciones visuales de los datos. Para saber mas cerca de SAIKU puede visitar: 

[http://analytical-labs.com/downloads.php](http://analytical-labs.com/downloads.php)

Para instalar SAIKU debemos primero instalar las librerías de CTOOLS. Estas librerías se pueden instalar automáticamente usando este Script:

[https://github.com/pmalves/ctools-installer](https://github.com/pmalves/ctools-installer)

Guardamos este archivo como: biserver-ce/instalar_ctools.sh y le damos permisos de ejecución:

<blockquote>
#chmod +x instalar_ctools.sh
</blockquote>

Y ejecutamos el script:
<blockquote>
# ./instalar_ctools.sh –s pentaho-solutions/
</blockquote>

El Script preguntará si queremos instalar todas las librerías, incluyendo el paquete SAIKU, respondemos que si a todo.

Reiniciar Pentaho:
<blockquote>
<p># ./stop-pentaho.sh</p> 
<p># ./start-pentaho.sh</p>
</blockquote>

### Modificar Apache: URL del SIIG apuntando a SAIKU 
Para enmascarar la URL de Pentaho debemos activar el proxy de Apache para esto debemos activar un par de módulos de Apache:  

<blockquote>
#a2enmod proxy proxy_http
</blockquote>

Luego editamos la sección VirtualHost dentro de /etc/apache2/sites-enabled/000-default:

    <Location /admin/minsal/indicadores/saiku/>
        ProxyPass http://localhost:8080/pentaho/content/saiku/
        ProxyPassReverse http://localhost:8080/pentaho/content/saiku/
        SetEnv proxy-chain-auth
    </Location>

En este punto ya tenemos SAIKU disponible como una URL del SIIG en: 

[http://localhost/admin/minsal/indicadores/saiku/](http://localhost/admin/minsal/indicadores/saiku/)


El servidor OLAP/Mondrian puede ser consultado a través de SAIKU usando su API HTTP/REST. Esta API permite obtener información sobre los cubos existentes en el servidor OLAP así como efectuar consultas, los resultados son devueltos en formato JSON. La documentación de la API puede ser consultada en: 

[http://dev.analytical-labs.com/saiku/serverdocs/](http://dev.analytical-labs.com/saiku/serverdocs/)
 
### 4.5 Generación de Reportes 
 
Los reportes son generados usando el servidor de análisis Pentaho. Cada indicador puede tener un reporte individual que incluye menús de selección, gráficos, texto y tablas de datos según se requiera. Debido a que los requerimientos de análisis y presentación varían entre indicadores, estos reportes deben ser diseñados y publicados manualmente por el administrador del sistema. 

Los reportes existentes están disponibles desde  el menú del SIIG en administración->Indicadores->Ficha Técnica (http://SIIG/admin/minsal/indicadores/fichatecnica/list).

El listado de Ficha Técnica incluye un botón Mostrar Reporte que carga el reporte para el indicador correspondiente usando los datos disponibles mas recientes. Todos los indicadores en el listado tienen el botón 'Mostrar Reporte', sin embargo solo los reportes creados y publicados por el administrador del sistema están disponibles.

El proceso para crear y publicar reportes incluye:

1. **Fijar clave para la publicación** de contenidos al editar el archivo:

<blockquote> 
pentaho-solutions/system/publisher_config.xml 
</blockquote>

para modificar esta linea

```
<publisher-password>NUEVA_CLAVE</publisher-password>
```

2. **Crear Reporte** para el Indicador deseado usando la aplicación de Reportes de Pentaho. Esta aplicación debe ser instalada en la terminal del administrador del sistema y puede ser descargada en: 

[http://reporting.pentaho.com/report_designer.php](http://reporting.pentaho.com/report_designer.php)

Una guía completa sobre el diseño de reportes usando esta aplicación esta disponible en

[http://wiki.pentaho.com/display/Reporting/01.+Creating+Your+First+Report](http://wiki.pentaho.com/display/Reporting/01.+Creating+Your+First+Report)

Los reportes pueden ser creados y editados de forma local, y una vez terminados pueden ser publicados en el servidor de Pentaho. Al publicar un reporte, este inmediatamente esta disponible para el sistema SIIG. Si es necesario modificar un reporte existente, la modificación debe hacerse en forma local y luego publicar la nueva versión del reporte. 

3. **Publicar reporte**. Al seleccionar la opción publicar, aparece un ventana que nos pide elegir una carpeta en la cual se publicará el reporte. Para que pueda ser encontrada por el SIIG, asegúrese de guardar todos sus reportes en una carpeta llamada 'reportes'.  Si esta carpeta no existe puede crearla al momento de guardar su primer reporte usando el botón 'Nueva Carpeta'.

Una vez dentro de la carpeta 'reportes' deberá asignar un nombre de archivo (Ejem: indicador15.prpt), un titulo e ingresar la clave de publicación que se fijo en el primer paso. 

    NOTA: El SIIG  esta configurado para leer reportes tales como: reportes/indicadorX.prpt 
    Por esto, si el reporte es publicado en una carpeta diferente o si el nombre 
    asignado al archivo es diferente, no podrá ser leído por el SIIG.

## Instalación de librería wkhtmltopdf
[wkhtmltopdf](http://code.google.com/p/wkhtmltopdf/) Es una utilidad de línea de comando para convertir html a pdf

1. Descargar wkhtmltopdf desde [http://code.google.com/p/wkhtmltopdf/downloads/list](http://code.google.com/p/wkhtmltopdf/downloads/list) elegir la versión adecuada al sistema operativo
2. Descomprimir. Ej.: tar xjf wkhtmltopdf-0.11.0_rc1-static-amd64.tar.bz2
3. Mover y renombrar el archivo: mv wkhtmltopdf-amd64 /usr/bin/wkhtmltopdf
4. Dar permisos de ejecución: chmod +x /usr/bin/wkhtmltopdf


## OPCIONAL: Validación de Usuarios desde directorios LDAP

Si fuese necesario validar usuarios contra un directorio LDAP, se deben seguir los pasos descritos en esta sección. Si un usuario aun no esta creado dentro del sistema, se hará una búsqueda en el directorio LDAP especificado en el archivo app/config/config.yml.
A continuación se muestran las lineas relevantes para especificar que directorio usar:

    #Fr3d_LDAP
    fr3d_ldap:
        driver:
            host:   10.10.20.2 # IP del Servidor LDAP institucional
            port:   389    # Opcional
        user:
            baseDn: ou=people,dc=salud,dc=gob,dc=sv # contenedor de usuarios
            filter: (objectClass=organizationalPerson) # esquema comun para todos los usuarios del directorio

### Cargar la aplicación
En este punto estamos listos para cargar la aplicación desde:


[**http://siig.localhost**](http://siig.localhost)