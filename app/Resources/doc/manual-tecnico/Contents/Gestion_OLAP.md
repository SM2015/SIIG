# Gestión de Cubos OLAP

### Introducción
La cantidad de reportes que pueden generarse depende de los catálogos que se usen en cada  indicador. 
Al interior de una estructura para reportes (cubo OLAP), cada catalogo se  convierte en dimensión. 
Así por ejemplo el catalogo municipio se convierte en una dimensión dentro de la estructura de reportes y posibilita hacer búsquedas usando cualquier campo que  exista dentro de este catálogo.
Por ejemplo: Si el catalogo municipio tiene los campos  municipio, departamento y región esto nos permitiría hacer las siguientes consultas: numero de casos por municipio, número de casos por departamento, número de casos por región.

La ventaja principal de usar un gestor de cubos OLAP es aislar la lógica de las búsquedas para analizar los datos. De esta forma el sistema se enfoca en presentar al usuario la mayor cantidad de información de forma flexible sin preocuparse de la lógica para obtener los datos.

### Indicadores y Cubos OLAP
El sistema cuenta con una función que genera los cubos OLAP automáticamente usando un esquema estrella. 
Los cubos son agregados dentro del mismo catalogo de Postgres pero en un esquema llamado 'cubos'. Esto permite que en el proceso de actualización de cubos, este esquema pueda ser borrado y creado nuevamente sin afectar el resto del sistema. A continuación se muestra como generar/actualizar los cubos usando la función interna del sistema desde la linea de comandos de Postgres:

<pre>

minsal=# select * from cargar_cubos();
NOTICE:  Inicio..
NOTICE:  ALTER TABLE / ADD PRIMARY KEY will create implicit index "cubos_indicador1_pk" for table "indicador1"
CONTEXT:  SQL statement "ALTER TABLE cubos.indicador1 ADD CONSTRAINT cubos_indicador1_pk PRIMARY KEY (id_fila)"
PL/pgSQL function crearcubos() line 39 at EXECUTE statement
NOTICE:  Nueva Tabla cubos.indicador1
NOTICE:  La columna id_area usara el catalago: ctl_area
NOTICE:  La columna id_genero usara el catalago: ctl_sexo
NOTICE:  La columna id_region usara el catalago: ctl_regiones
NOTICE:  La columna id_municipio usara el catalago: ctl_municipio
NOTICE:  La columna id_departamento usara el catalago: ctl_departamento
NOTICE:  ALTER TABLE / ADD PRIMARY KEY will create implicit index "cubos_indicador2_pk" for table "indicador2"
CONTEXT:  SQL statement "ALTER TABLE cubos.indicador2 ADD CONSTRAINT cubos_indicador2_pk PRIMARY KEY (id_fila)"
PL/pgSQL function crearcubos() line 39 at EXECUTE statement
NOTICE:  Nueva Tabla cubos.indicador2
NOTICE:  La columna id_area usara el catalago: ctl_area
NOTICE:  La columna id_genero usara el catalago: ctl_sexo
NOTICE:  La columna id_region usara el catalago: ctl_regiones
NOTICE:  La columna id_municipio usara el catalago: ctl_municipio
NOTICE:  La columna id_departamento usara el catalago: ctl_departamento
NOTICE:  Terminado.
 crearcubos 
------------
 
(1 row)
</pre> 



### Servidor de Gestión de Cubos OLAP 
 
Actualmente el sistema utiliza Pentaho. Este servidor contiene tres elementos:

1- Un gestor de persistencia (Hibernate) que se conecta a nuestra base de datos 

2- Una aplicacion (SAIKU) para procesar peticiones REST. Este componente permite hacer consultas al cubo y mostrar resultados usando un URL desde AJAX.


### Instalar paquete Cubes de Python


1. Instalar Java y soporte de Postgres:
apt-get install openjdk-6-jre libpg-java
2. Descargar la ultima version del servidor de Pentaho en:
http://community.pentaho.com/projects/bi_platform/

Descomprimir el archivo en la carpeta que elijamos, Ejem:
/opt/biserver-ce/
Configurar la base de datos, editar
 /opt/biserver-ce/tomcat/webapps/hibernate.properties:
 <pre>
hibernate.dialect = org.hibernate.dialect.PostgreSQLDialect
hibernate.connection.driver_class = org.postgresql.Driver
hibernate.connection.url = jdbc:postgresql:NOMBRE_DE_BASE_DEDATOS
hibernate.connection.username = USUARIO
hibernate.connection.password = PASSWORD
hibernate.hbm2ddl.auto = update
</pre>

3. Remover la seguridad interna de Pentaho segun la documentación:
http://wiki.pentaho.com/display/ServerDoc2x/Removing+Security
Iniciar el servidor:  ./opt/biserver-ce/start-pentaho.sh

En este punto deberíamos poder abrir la aplicación sin usar credenciales usando dirección del servidor:
http://myservidor:8080/pentaho

Los errores del sistema son registrados en:
/opt/biserver-ce/tomcat/logs/pentaho.log 
/opt/biserver-ce/tomcat/logs/catalina.out	

4. Activar el proxy de Apache/Esconder el Puerto de Pentaho
Activar módulos de Apache:  a2enmod proxy proxy_http

editar la seccion VirtualHost dentro de /etc/apache2/sites-enabled/000-default:
<pre>
<Location /pentaho/>
      ProxyPass http://localhost:8080/pentaho/
      ProxyPassReverse http://localhost:8080/pentaho/
      SetEnv proxy-chain-auth
    </Location>

    <Location /pentaho-style/>
      ProxyPass http://localhost:8080/pentaho-style/
      ProxyPassReverse http://localhost:8080/pentaho-style/
      SetEnv proxy-chain-auth
    </Location>
</pre>

Después de reiniciar Apache, podemos usar la nueva dirección del servidor:
http://myservidor/pentaho

5. Descargar la ultima versión del SAIKU (Plugin para Pentaho):
http://analytical-labs.com/downloads.php
copiar el archivo descomprimido  en /opt/biserver-ce/pentaho-solutions/system/
Ejecutar el instalador de  librerías de CTOOLS disponible en:

https://github.com/pmalves/ctools-installer
./ctools-installer.sh -s /opt/biserver-ce/pentaho-solutions
Reiniciar Pentaho: ./stop-pentaho.sh
                   ./start-pentaho.sh


SAIKU esta disponible en: 
http://myserver/pentaho/content/saiku-ui/index.html?biplugin=true

6. Agregar definición de cubos usando la plantilla para indicadores del MINSAL:
indicadorX.xml


### Consultando el Servidor OLAP

El servidor OLAP procesa consultas REST usando su API http, y responde con datos en formato JSON. El formato general a utilizar es el siguiente:

http://servidor:puerto/cubes/nombre_de_cubo/Consulta

Ejemplo:

<pre>
~# curl "http://localhost:5000/cubes/indicador2/dimension/area"
{
    "depth": null, 
    "data": [
        {
            "area.inicial": "U", 
            "area.descripcion": "Urbano"
        }, 
        {
            "area.inicial": "R", 
            "area.descripcion": "Rural"
        }
    ], 
    "dimension": "area"
</pre>


En este punto estamos listos para efectuar consultas desde el sistema de gestión de Indicadores usando AJAX.
Un listado completo de las posibles consultas que se pueden hacer usando el servidor OLAP esta disponible en esta dirección:

http://packages.python.org/cubes/server.html#http-api 
 

## Funciones Auxiliares de PostgreSQL

 
Estas son funciones que utiliza el sistema, para poder crearlas es necesario instalar primero las funciones para manejar hstore y tablas pivot:

postgres=# create extension hstore;

postgres=# create extension tablefunc;


### Crear/Actualizar Cubos



Para crear los cubos OLAP se debe llamar la funcion correspondiente:

postgres=# select * from cargar_cubos();

[....]

NOTICE:  Terminado.

Es posible verificar las tablas/cubos generados en el paso anterior por medio de la siguiente consulta.

postgres=# SELECT table_name FROM information_schema.tables WHERE table_schema = 'cubos';



```postgres

CREATE OR REPLACE FUNCTION cargar_cubos()
  RETURNS void AS
$BODY$
DECLARE
indicador int;
columnas text;
cols text [];
c text;
col text;
fk record;
coltype record;
mycursor refcursor;
mycursor2 refcursor;
nombre_tabla text;
myquery text;
BEGIN
SET client_min_messages='INFO';
DROP SCHEMA IF EXISTS cubos CASCADE;
CREATE SCHEMA cubos;
   RAISE NOTICE 'Inicio..';
    --Agrupar por indicador Para crear
    -- y poblar tablas por indicador
  FOR indicador IN SELECT DISTINCT id_ficha_tecnica FROM ficha_tecnica_variable_dato 
      WHERE id_variable_dato IN (SELECT id FROM variable_dato WHERE 
      id_origen_datos IN (SELECT id_origen_dato FROM fila_origen_dato 
      GROUP BY id_origen_dato)) LOOP

        --Obtener los campos comunes de este indicador
                FOR col IN  SELECT skeys(datos) AS cosa FROM fila_origen_dato WHERE
                    id IN (SELECT min(id) AS cosa FROM fila_origen_dato WHERE 
                           id_origen_dato=(SELECT min(id_variable_dato) as tt 
                            FROM ficha_tecnica_variable_dato WHERE id_ficha_tecnica=indicador))
                  LOOP
                    cols:= array_append(cols,col);
                END LOOP;

        --Crear lista de columnas
                columnas:=array_to_string(cols, ' text,') || ' text';
                columnas:='id_fila int, '|| columnas;

         --Crear y poblar tabla por indicador/ 'Fact Table' del cubo
                nombre_tabla:= 'cubos.indicador' || indicador;
                EXECUTE 'CREATE TABLE IF NOT EXISTS ' || nombre_tabla || '(' || columnas || ')';
                -- RAISE NOTICE 'Se creo tabla % con columnas:\n %', nombre_tabla,columnas;

                EXECUTE 'INSERT INTO '|| nombre_tabla || '  SELECT * FROM
                crosstab(''SELECT id,(each(datos)).key AS columna, 
        (each(datos)).value AS valor FROM  fila_origen_dato where id_origen_dato 
        IN (SELECT min(id_variable_dato) AS tt FROM ficha_tecnica_variable_dato
         WHERE id_ficha_tecnica='|| indicador || ') '') AS ct('|| columnas ||')';


         columnas :='';
        cols:=ARRAY[]::text[];
   END LOOP;


 --Agrupar por indicador para crear estructura de estrella
  FOR indicador IN SELECT DISTINCT id_ficha_tecnica FROM ficha_tecnica_variable_dato 
      WHERE id_variable_dato IN (SELECT id FROM variable_dato WHERE 
      id_origen_datos IN (SELECT id_origen_dato FROM fila_origen_dato 
      GROUP BY id_origen_dato)) LOOP

        --Obtener los campos comunes de este indicador
                FOR col IN  SELECT skeys(datos) AS cosa FROM fila_origen_dato WHERE
                    id IN (SELECT min(id) AS cosa FROM fila_origen_dato WHERE 
                           id_origen_dato=(SELECT min(id_variable_dato) as tt 
                            FROM ficha_tecnica_variable_dato WHERE id_ficha_tecnica=indicador))
                 LOOP
                cols:= array_append(cols,col);
                END LOOP;

        --Crear lista de columnas
                columnas:=array_to_string(cols, ' text,') || ' text';
                columnas:='id_fila int, '|| columnas;
                nombre_tabla:= 'cubos.indicador' || indicador;
                RAISE NOTICE 'Tabla % con Columnas: %', nombre_tabla,columnas;

                EXECUTE 'ALTER TABLE '|| nombre_tabla ||' ADD CONSTRAINT '||
                replace(nombre_tabla,'.','_') ||'_pk PRIMARY KEY (id_fila)';
                EXECUTE 'ALTER TABLE '|| nombre_tabla ||' ALTER COLUMN calculo
                  TYPE numeric(10,2) USING calculo::numeric(10,2)';
                RAISE NOTICE 'Nueva Tabla %',  nombre_tabla;

        -- Crear estrella/relacios con otras dimensiones
                FOREACH c IN ARRAY cols LOOP
                        IF (c <>'calculo') THEN
                        OPEN mycursor FOR EXECUTE 'SELECT  significado_campo.catalogo FROM
                        public.significado_campo WHERE  significado_campo.codigo = '''|| c ||''' AND
                        significado_campo.catalogo IS NOT NULL;' ;

                        FETCH mycursor INTO fk;
                                --myVar := rec
                        IF fk.catalogo IS NULL THEN
                                RAISE NOTICE 'No se encontro Catalogo para: %', c;
                        ELSE

                                RAISE NOTICE 'La columna % usara el catalago: %', c,fk.catalogo;
                                OPEN mycursor2 FOR EXECUTE 'SELECT pg_typeof('||c||')::text as tipo
                                FROM public.'||fk.catalogo||' LIMIT 1';

                                FETCH mycursor2 INTO coltype;
                                myquery:= 'ALTER TABLE '|| nombre_tabla ||' ALTER COLUMN '|| c ||
                                 ' TYPE '|| coltype.tipo ||' using '||c||'::'||coltype.tipo;
                                --RAISE NOTICE 'Codigo que modifica campo columna: %', myquery;
                                EXECUTE myquery;

                                myquery='ALTER TABLE '|| nombre_tabla ||' ADD CONSTRAINT '|| c ||'_fk
                                 FOREIGN KEY ('||c||') REFERENCES public.'||fk.catalogo||' ('||c||') ON
                                 DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE';
                                --RAISE NOTICE 'Codigo de llave foranea: %', myquery;
                                EXECUTE myquery;
                                CLOSE mycursor2;
                        END IF;
                        CLOSE mycursor;
                        END IF;
                END LOOP;
        columnas :='';
        cols:=ARRAY[]::text[];
    END LOOP;
RAISE NOTICE 'Terminado.';
SET client_min_messages='WARNING';
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
```


### Crear/Actualizar Catalogo Tiempo


postgres=# select * from crear_ctl_tiempo(2008,5);

NOTICE:  Se creo tabla Tiempo de 5 anios a partir de 2008

```postgres
CREATE OR REPLACE FUNCTION crear_ctl_tiempo(inicio integer DEFAULT 2006,
 anios integer DEFAULT 8)
RETURNS VOID AS $$
DECLARE
dias integer;
myquery text;
BEGIN
dias:=365*$2;

DROP TABLE IF EXISTS ctl_tiempo;

myquery:='CREATE TABLE ctl_tiempo AS SELECT *  from  (SELECT
            datum AS fecha,
            extract(year FROM datum)::int  AS Anio,
            extract(month FROM datum)::int AS Mes,
            to_char(datum, ''TMMonth'')::character(12) AS NombreMes,
            extract(day FROM datum)::int AS Dia,
            extract(doy FROM datum)::int AS DiaAnio,
              to_char(datum, ''TMDay'')::character(12) AS NombreDiaSemana,
            extract(week FROM datum)::int AS SemanaCalendario,
            to_char(datum, ''dd. mm. yyyy'')::character(12) AS FechaCorriente,
            ''T'' || to_char(datum, ''Q'')::int  AS Trimestre,
            to_char(datum, ''yyyy/Q'')::character(6) AS TrimestreAnio,
            to_char(datum, ''yyyy/mm'')::character(12) AS MesAnio,
            -- ISO calendar year and week
            to_char(datum, ''iyyy/IW'')::character(8) AS SemanaAnioCalendario,
            -- Weekend
            CASE WHEN extract(isodow FROM datum) IN (6, 7) THEN ''FinDeSemana'' ELSE ''DiaDeSemana'' END AS FinDeSemana,
            -- Feriados para El Salvador
        CASE WHEN to_char(datum, ''MMDD'') IN (''0801'', ''0802'', ''0803'', ''084'')
                        THEN ''Feriado'' ELSE ''Dia Laboral'' END
                        AS FeriadoElSalvador,
            -- Periodos festivos del calendario
            CASE WHEN to_char(datum, ''MMDD'') BETWEEN ''0701'' AND ''0831'' THEN ''Vacación de Verano''
                 WHEN to_char(datum, ''MMDD'') BETWEEN ''1115'' AND ''1225'' THEN ''Temporada Navideña''
                 WHEN to_char(datum, ''MMDD'') > ''1223'' OR to_char(datum, ''MMDD'') <= ''1231'' THEN ''Vacación Navideña''
                        ELSE ''Normal'' END
                        AS Periodo,
            -- Fecha de inicio de fin de semana 
            datum + (1 - extract(isodow FROM datum))::integer AS IncioSemana,
            datum + (7 - extract(isodow FROM datum))::integer AS FinSemana,
            -- Fecha de inicio de fin de Mes
            datum + (1 - extract(day FROM datum))::integer AS InicioMes,
            (datum + (1 - extract(day FROM datum))::integer + ''1 month''::interval)::date - ''1 day''::interval AS FinMes
FROM ( SELECT '''||$1||'-01-01''::DATE + sequence.day AS datum
            FROM generate_series(0,'||dias||') AS sequence(day)
            GROUP BY sequence.day
     ) DQ
ORDER BY 1) as foo;';
EXECUTE myquery;
 
ALTER TABLE ctl_tiempo ADD PRIMARY KEY (fecha);        

RAISE NOTICE 'Se creo tabla Tiempo de % anios a partir de %',anios,inicio;

END;
$$  LANGUAGE plpgsql;
```
