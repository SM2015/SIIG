<h1>Gestión de Cubos OLAP</h1>

### Introducción
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
 
Actualmente el sistema utiliza un servidor experimental de cubos escrito en Python. Este servidor contiene tres elementos:

1- Un gestor de persistencia (SQLAlchemy).  Este se conecta a nuestra base de datos y la descripción de los datos o modelo están contenidos en un arreglo JSON (fichero_modelo.json).

2- Un servidor Web para procesar peticiones REST. Este componente permite hacer consultas al cubo usando un URL desde AJAX. La instalación oficial utiliza Werkzeug, pero es posible anadirlo como un virtual host en apache.

3- Una utilidad de configuración y ejecución. SLICER es un componente que permite manipular el servidor desde la linea de comandos y su configuración se realiza en el fichero slicer.ini  

A continuación se describen los pasos para instalar e integrar este servidor.


### Instalar paquete Cubes de Python

 En Debian squeeze con repositorio 'testing':


~#apt-get install python2.7 python-sqlalchemy python-werkzeug python-sqlite  python-psycopg2 python-pip


Finalmente se debe usar un gestor de paquetes de Python para instalar el paquete del servidor OLAP 'Cubes'. La siguiente linea utiliza el gestor 'pip'.

~# pip install cubes



### Configuración de  modelo
El modelo contiene un listado de los cubos/indicadores disponibles en el sistema.
El siguiente modelo es un ejemplo simplificado del cubo/indicador2 con los siguientes datos:

- La llave primaria del cubo/indicador2 es la columna id_fila

- Este indicador tiene dos dimensiones 'departamento' y 'area'. 

- La dimensión área esta asociada por medio de la llave foránea indicador2.id_area

- La dimensión departamento esta asociada por medio de la llave foránea indicador2.id_departamento

- Este indicador tiene ademas dos campos ('anio' y 'edad') que no dependen de ninguna dimensión.

- La dimensión 'departamento' posee los campos descripción y abreviatura

- La dimensión 'area' posee los campos descripción y abreviatura


 Este  fichero es utilizado por SQLAlchemy para manipular el cubo y describe sus campos y llaves foráneas.  

```json
{   "name" : "cubos",
    "locale":"en",
    "cubes": [
        {
            "name": "indicador2",
            "key":"id_fila",
            "measures": {
                "calculo": {"label": "Total"}
            },
            "details": [
                {
                    "name": "anio", 
                    "label": "Anio"
                },
                {
                    "name": "edad", 
                    "label": "Edad"
                }
            ],
            "dimensions": [
                            "area","departamento"
                                                        ],
            "joins": [
        
                {
                    "master": "indicador2.id_area",
                "detail": "ctl_area.id_area"    
            },
          {
              "master": "indicador2.id_departamento",
              "detail": "ctl_departamento.id_departamento"    
            }
            ],
"mappings": {
    "ft_indicador2.id": "ft_indicador2.id_fila"},
            "fact": "indicador2"
        }
    ],
    
    "dimensions": {
        "area" : {
             "name":"Area",
            "label": "Area de Poblacion",
             "key":"id_area",
            "levels" : [
                {
                    "name": "area",
                    "label_attribute":"descripcion",
                    "attributes":[
                        {"name":"descripcion", "label": "area"},
                        {"name":"inicial", "label": "abreviatura"}
                       ]
                }
                
            ]
        },

"departamento" : {
            "name":"Departamento",
            "key":"id_departamento",
            "label": "Departamento / Provincia",
            "levels" : [
                {
                    "name": "departamento",
                    "attributes":[
                        {"name":"descripcion", "label": "departamento"},
                        {"name":"abreviatura", "label": "abreviatura"}
                       ]
                }
                
            ]
        }
         
    }    
}
```

### Configuración de la utilidad 'Slicer'

El iniciar el servidor se debe utilizar el siguiente comando:

~# Ruta_de_Instalacion/cubes/bin/slicer serve slicer.ini

El contenido del archivo slicer.ini es el siguiente:
 

<pre>

[model]
path: Ruta_Modelo/mi_modelo.json


[server]
# Set writeable path for logging slicer info
log_level: info
prettyprint: true
backend: sql
reload: true

[workspace]
# SET DATABASE -> adapter://user:password@host:port/database
url: postgres://minsal:minsal@localhost:5432/minsal
schema: cubos
dimension_schema: public
dimension_prefix: ctl_
debug: true

# Denormalisation demo (see README.md)
#
 denormalized_view_prefix = mft_
 denormalized_view_schema = views
 use_denormalization = yes

</pre>

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
