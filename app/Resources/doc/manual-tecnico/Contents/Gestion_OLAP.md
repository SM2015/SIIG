<h1>Gestion de Cubos OLAP</h1>

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

## Consultando el Servidor OLAP

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
 
