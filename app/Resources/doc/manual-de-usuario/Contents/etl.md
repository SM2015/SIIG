# ETL #
El bloque ETL (Extract Transform Load) es la sección dónde se configuran los orígenes de datos y se obtiene la información de ellos.
Contamos con las siguientes opciones en el menú principal:

![Menú orígenes de datos](menu_origenes_datos.png)

## Conexión a bases de datos
Cuando los datos provienen de una base ya existente, se debe configurar antes la conexión a esa base de datos. Los motores soportados son: PostgreSQL, MySQL, SQL Server y Oracle.

![Formulario de conexión de base de datos](conexion.png)

Debemos ingresar los datos necesarios para configurar la conexión, una vez ingresados se puede probar la conexión con el botón **Probar Conexión** el cual nos devolverá un mensaje con el resultado de la prueba.

## Origen de datos
Para la creación de un origen de datos tenemos tres secciones: Datos generales que contendrá la descripción general del origen de datos, Cargar datos desde una sentencia SQL y Cargar datos desde archivo.

![Creación de origen de datos](origen_dato_crear.png)

De las últimas dos secciones debemos seleccionar la que utilizaremos según el caso. Para cargar datos desde una sentencia SQL debemos seleccionar la conexión a la base de datos y especificar la sentencia SQL para extraer los datos, opcionalmente podemos probar la sentencia antes de guardarla con el botón **Probar Sentencia SQL** la cual mostrará un mensaje con el resultado de la prueba y un listado de datos de muestra en el caso que ejecución de la sentencia haya sido exitosa.
![Creación de origen de datos a partir de sentencia SQL](origen_dato_sql.png)

Y para cargar datos desde un archivo, debemos especificar la ruta del archivo, el cual puede ser una hoja electrónica (Excel hasta versión 2010 y OpenOffice/LibreOffice hasta versión 3.5 son soportados) o desde un archivo de texto con formato de valores separados por comas (CSV).

### Configuración de un origen de datos
Al especificar las opciones necesarias en el formulario de origen de datos y dar clic en guardar y editar se cargará una nueva sección en la parte inferior del formulario, por medio de la cual debemos configurar los datos obtenidos.

![Configuración del origen de datos](origen_dato_configurar.png)

Es de suma importancia realizar esta configuración correctamente. Debemos especificar para cada campo su tipo y significado, el significado del campo determinará qué es lo que se almacena en el campo y por medio de este se permitirá luego relacionar campos de diferentes orígenes de datos, solo puede haber un campo de un tipo en cada origen de datos y uno con especial importancia es el significado **Campo para cálculos** el cual identificará el campo que se utilizará para realizar los cálculos cuando se utilice el origen de datos en una fórmula matemática para calcular algún indicador. si algún campo contiene llaves foráneas deberá selecionar los tipos que comienzan con **Identificador** indicando que este dato tendrá asociado una tabla catálogo que ya debe estar cargada o cargar posteriormente en la base de datos. Por ejemplo para el caso de Departamento si está cargando el nombre del departamento el significado será *Departamento* pero si en lugar del nombre tiene la llave foránea deberá colocar como significado *Identificador departamento* (recuerde que necesitará una tabla departamento, la asociación de la tabla se realiza cuando se crea un significado de campos)
![Origen de datos configurado](origen_dato_configurar2.png)

### Carga de tablas catálogos 
El formulario de orígen de datos además permite crear tablar catálogos (cuyas llaves se utilizarán como llaves foráneas en los orígenes de datos normales). Alternativamente las tablas catálogo pueden ser gestionadas con algún programa especializado para el manejo de bases de datos, esto es así puesto que cada implementación del Sistema de Indicadores puede tener diferentes catálogos. Es responsabilidad del administrador en cada implementación garantizar la gestión de las tablas catálogos.

