# Gestión de Cubos OLAP

### Introducción
La cantidad de reportes que pueden generarse depende de los catálogos que se usen en cada  indicador. 
Al interior de una estructura para reportes (cubo OLAP), cada catalogo se  convierte en dimensión. 
Así por ejemplo el catalogo municipio se convierte en una dimensión dentro de la estructura de reportes y posibilita hacer búsquedas usando cualquier campo que  exista dentro de este catálogo.
Por ejemplo: Si el catalogo municipio tiene los campos  municipio, departamento y región esto nos permitiría hacer las siguientes consultas: numero de casos por municipio, número de casos por departamento, número de casos por región.

La ventaja principal de usar un gestor de cubos OLAP es aislar la lógica de las búsquedas para analizar los datos. De esta forma el sistema se enfoca en presentar al usuario la mayor cantidad de información de forma flexible sin preocuparse de la lógica para obtener los datos.

### Indicadores y Cubos OLAP
El sistema cuenta con un servidor de gestion de cubos OLAP que se conecta directamente a la base de datos de Indicadores. La definición de cubos esta descrita en el archivo  biserver-ce/pentaho-solutions/system/olap/datasources.xml, los contenidos de este archivo se muestran a continuacion:

```xml
<?xml version="1.0" encoding="UTF-8"?>

<DataSources> 
  <DataSource> 
    <DataSourceName>Provider=Mondrian;DataSource=Pentaho</DataSourceName>  
    <DataSourceDescription>Pentaho BI Platform Datasources</DataSourceDescription>  
    <URL>http://localhost:8080/pentaho/Xmla?userid=joe&amp;password=password</URL>  
    <DataSourceInfo>Provider=mondrian</DataSourceInfo>  
    <ProviderName>PentahoXMLA</ProviderName>  
    <ProviderType>MDP</ProviderType>  
    <AuthenticationMode>Unauthenticated</AuthenticationMode>  
    <Catalogs> 
      <Catalog name="Indicador 23"> 
        <DataSourceInfo>Provider=mondrian;DataSource=Minsal</DataSourceInfo>  
        <Definition>solution:/admin/resources/metadata/indicador23.mondrian.xml</Definition> 
      </Catalog>  
      <Catalog name="Indicador 24"> 
        <DataSourceInfo>Provider=mondrian;DataSource=Minsal</DataSourceInfo>  
        <Definition>solution:/admin/resources/metadata/indicador24.mondrian.xml</Definition> 
      </Catalog>  
      <Catalog name="Indicador 25"> 
        <DataSourceInfo>Provider=mondrian;DataSource=Minsal</DataSourceInfo>  
        <Definition>solution:/admin/resources/metadata/indicador25.mondrian.xml</Definition> 
      </Catalog>  
      <Catalog name="indicador 7"> 
        <DataSourceInfo>Provider=mondrian;DataSource=Minsal</DataSourceInfo>  
        <Definition>solution:/admin/resources/metadata/indicador7.mondrian.xml</Definition> 
      </Catalog> 
    </Catalogs> 
  </DataSource> 
</DataSources>
``` 
Como puede verse en este codigo cada indicador es un catalogo/cubo cuya descripcion esta contenida en otro archivo XML. Para facilitar la creacion de nuevos cubos a continuacion se muestra el codigo base de un nuevo indcador, esta plantilla esta disponible en https://github.com/erodriguez-minsal/SIIG/wiki/PlantillaIndicadorOLAP 

```xml

<!--Para crear un indicador nuevo se debe:
1. Cambia el nombre del archivo usando el numero del indicador correspondiente ej: indicador5.mondrian.xml
2. Modificar los valores de este archvo archivo (comentario N.1 - N.5) 
3. Copiar este archivo al servidor en: /home/siig/biserver-ce/pentaho-solutions/admin/resources/metadata
4. Agregar el indicador comoun nuevo catalgo: 
el Archivo de Fuentes de datos /home/siig/biserver-ce/pentaho-solutions/system/olap/datasources.xml

Se deben agregar estas lineas:

 <Catalog name="Indicador 5"> 
        <DataSourceInfo>Provider=mondrian;DataSource=Minsal</DataSourceInfo>  
        <Definition>solution:/admin/resources/metadata/indicador5.mondrian.xml</Definition> 
      </Catalog>
      
5. Refrescar la aplicacion.      
      
-->

<?xml version="1.0" encoding="UTF-8"?>

<!-- N.1 - Asignar el numero del indicador segun la tabla Ficha_tecnica-->
<Schema name="Indicador X">

<!--Definicion de dimensiones, pueden estar definidas aun si no se utilizan en este indicador-->

<!-- Definicion de la dimension departamento-->
<Dimension visible="true" highCardinality="false" name="Departamento">
    <Hierarchy name="Departamento" visible="true" hasAll="true" primaryKey="id">
      <Table name="ctl_departamento" schema="public">
      </Table>
      <Level name="Departamento" visible="true" column="descripcion" type="String" uniqueMembers="false" levelType="Regular" hideMemberIf="Never">
      </Level>
    </Hierarchy>
    <Hierarchy name="Digestyc" visible="true" hasAll="true" primaryKey="id">
      <Table name="ctl_departamento" schema="public">
      </Table>
      <Level name="Digestyc" visible="true" column="digestyc" type="String" uniqueMembers="false" levelType="Regular" hideMemberIf="Never">
      </Level>
    </Hierarchy>
    <Hierarchy name="Gis" visible="true" hasAll="true" primaryKey="id">
      <Table name="ctl_departamento" schema="public">
      </Table>
      <Level name="Gis" visible="true" column="gis" type="Numeric" uniqueMembers="false" levelType="Regular" hideMemberIf="Never">
      </Level>
    </Hierarchy>
  </Dimension>
  
  <!-- Definicion de la dimension Municipio-->
  <Dimension visible="true" highCardinality="false" name="Municipio">
    <Hierarchy name="Municipio" visible="true" hasAll="true" primaryKey="id">
      <Table name="ctl_municipio" schema="public">
      </Table>
      <Level name="Municipio" visible="true" column="descripcion" type="String" uniqueMembers="false" levelType="Regular" hideMemberIf="Never">
      </Level>
    </Hierarchy>
  </Dimension>
  
  
  <!-- Definicion de la dimension Region-->
  <Dimension visible="true" highCardinality="false" name="Region">
    <Hierarchy name="Region" visible="true" hasAll="true" primaryKey="id">
      <Table name="ctl_regiones" schema="public">
      </Table>
      <Level name="Region" visible="true" column="descripcion" type="String" uniqueMembers="false" levelType="Regular" hideMemberIf="Never">
      </Level>
    </Hierarchy>
  </Dimension>
  
  <!-- Definicion de la dimension Area-->
  <Dimension visible="true" highCardinality="false" name="Area">
    <Hierarchy name="Area" visible="true" hasAll="true" primaryKey="inicial">
      <Table name="ctl_area" schema="public">
      </Table>
      <Level name="Area" visible="true" column="descripcion" type="String" uniqueMembers="false" levelType="Regular" hideMemberIf="Never">
      </Level>
    </Hierarchy>
  </Dimension>
  
 <!-- Definicion de la dimension Genero-->
   <Dimension visible="true" highCardinality="false" name="Genero">
    <Hierarchy name="Genero" visible="true" hasAll="true" primaryKey="inicial">
      <Table name="ctl_sexo" schema="public">
      </Table>
      <Level name="Genero" visible="true" column="descripcion" type="String" uniqueMembers="false" levelType="Regular" hideMemberIf="Never">
      </Level>
    </Hierarchy>
  </Dimension>
  
 <!-- Definicion de la dimension Sibasi-->
   <Dimension visible="true" highCardinality="false" name="Sibasi">
    <Hierarchy name="Sibasi" visible="true" hasAll="true" primaryKey="id">
      <Table name="ctl_sibasi" schema="public">
      </Table>
      <Level name="Sibasi" visible="true" column="descripcion" type="String" uniqueMembers="false" levelType="Regular" hideMemberIf="Never">
      </Level>
    </Hierarchy>
  </Dimension>
  
  <!-- Definicion de la dimension Tiempo-->
  <Dimension visible="true" highCardinality="false" name="Tiempo">
    <Hierarchy name="Anio" visible="true" hasAll="true" primaryKey="fecha">
      <Table name="ctl_tiempo" schema="public">
      </Table>
      <Level name="Anio" visible="true" column="anio" type="Numeric" uniqueMembers="false" levelType="Regular" hideMemberIf="Never">
      </Level>
    </Hierarchy>
    <Hierarchy name="Mes" visible="true" hasAll="true" primaryKey="fecha">
      <Table name="ctl_tiempo" schema="public">
      </Table>
      <Level name="Mes" visible="true" column="mes" type="Numeric" uniqueMembers="false" levelType="Regular" hideMemberIf="Never">
      </Level>
      <Level name="Mesanio" visible="true" column="mesanio" type="String" uniqueMembers="false" levelType="Regular" hideMemberIf="Never">
      </Level>
      <Level name="Finmes" visible="true" column="finmes" type="String" uniqueMembers="false" levelType="Regular" hideMemberIf="Never">
      </Level>
    </Hierarchy>
    <Hierarchy name="Feriadoelsalvador" visible="true" hasAll="true" primaryKey="fecha">
      <Table name="ctl_tiempo" schema="public">
      </Table>
      <Level name="Feriadoelsalvador" visible="true" column="feriadoelsalvador" type="String" uniqueMembers="false" levelType="Regular" hideMemberIf="Never">
      </Level>
    </Hierarchy>
    <Hierarchy name="Periodo" visible="true" hasAll="true" primaryKey="fecha">
      <Table name="ctl_tiempo" schema="public">
      </Table>
      <Level name="Periodo" visible="true" column="periodo" type="String" uniqueMembers="false" levelType="Regular" hideMemberIf="Never">
      </Level>
    </Hierarchy>
    <Hierarchy name="Semanaaniocalendario" visible="true" hasAll="true" primaryKey="fecha">
      <Table name="ctl_tiempo" schema="public">
      </Table>
      <Level name="Semanaaniocalendario" visible="true" column="semanaaniocalendario" type="String" uniqueMembers="false" levelType="Regular" hideMemberIf="Never">
      </Level>
      <Level name="Semanacalendario" visible="true" column="semanacalendario" type="Numeric" uniqueMembers="false" levelType="Regular" hideMemberIf="Never">
      </Level>
      <Level name="Findesemana" visible="true" column="findesemana" type="String" uniqueMembers="false" levelType="Regular" hideMemberIf="Never">
      </Level>
    </Hierarchy>
    <Hierarchy name="Trimestre" visible="true" hasAll="true" primaryKey="fecha">
      <Table name="ctl_tiempo" schema="public">
      </Table>
      <Level name="Trimestre" visible="true" column="trimestre" type="String" uniqueMembers="false" levelType="Regular" hideMemberIf="Never">
      </Level>
      <Level name="Trimestreanio" visible="true" column="trimestreanio" type="String" uniqueMembers="false" levelType="Regular" hideMemberIf="Never">
      </Level>
    </Hierarchy>
  </Dimension>
  
  <!--N.2 - Definicion del cubo-->
  
  <Cube name="Nombre del indicador">
    <Table name="Nombre de la tabla del indicador" schema="public"/>
    
    <!--N.3 - Listado de dimensiones disponibles en este indicador. Para cada dimension el formato a seguir es:
    DimensionUsage name=Etiqueta source=DimensionPreDefinida foreignKey=ColumnaTablaInidcador-->
    
    <DimensionUsage name="Departamento" source="Departamento" foreignKey="id_departamento"/>
    <DimensionUsage name="Municipio" source="Municipio" foreignKey="id_municipio"/>
    <DimensionUsage name="Region" source="Region" foreignKey="id_region"/>
    <DimensionUsage source="Tiempo" name="Tiempo" visible="true" foreignKey="fecha" highCardinality="false"/>
 
 <!--N.4 - Definicion de variables del indicador-->
    <Measure name="nnici_p" column="nnici_p" aggregator="sum" formatString="#"/>
    <Measure name="nnici_simmow" column="nnici_simmow" aggregator="sum" formatString="#"/>
    
    <!--N.5 - Definicion de la formula unidad de medida-->
<CalculatedMember name="Porcentaje"  formula="([Measures].[nnici_p]/[Measures].[nnici_simmow])* 100" dimension="Measures" visible="true"/>
 </Cube>
</Schema>

````



### Servidor de Gestión de Cubos OLAP 
 
Actualmente el sistema utiliza de inteligencia de negociso Pentaho Edicion Comunidad. Este servidor contiene tres elementos:

1- Un gestor de persistencia (Hibernate) que se conecta a nuestra base de datos 

2- El servidor de aplicaciones Java/Tomcat

3- Una aplicacion (SAIKU) para procesar peticiones REST. Este componente permite hacer consultas al cubo y mostrar resultados usando un URL desde AJAX.


### Instalar Pentaho


1- Instalar Java y soporte de Postgres:

apt-get install openjdk-6-jre libpg-java


2- Descargar la ultima version del servidor de Pentaho en:

http://community.pentaho.com/projects/bi_platform/

Descomprimir el archivo en la carpeta que elijamos, Ejem: /home/siig/biserver-ce/

Configurar la base de datos, editar
/home/siig/biserver-ce/tomcat/webapps/hibernate.properties:
 
```
hibernate.dialect = org.hibernate.dialect.PostgreSQLDialect
hibernate.connection.driver_class = org.postgresql.Driver
hibernate.connection.url = jdbc:postgresql:NOMBRE_DE_BASE_DEDATOS
hibernate.connection.username = USUARIO
hibernate.connection.password = PASSWORD
hibernate.hbm2ddl.auto = update
```

3- Permitir usuarios anonimos, remover la seguridad interna de Pentaho segun la documentación:

http://infocenter.pentaho.com/help/index.jsp?topic=%2Fsecurity_guide%2Ftask_removing_security.html

Iniciar el servidor:  ./start-pentaho.sh

En este punto deberíamos poder abrir la aplicación sin usar credenciales usando dirección del servidor:

http://myservidor:8080/pentaho

Los errores del sistema son registrados en:

/opt/biserver-ce/tomcat/logs/pentaho.log 
/opt/biserver-ce/tomcat/logs/catalina.out	

Después de reiniciar Apache, podemos usar la nueva dirección del servidor:

http://myservidor:8080/pentaho

4- Descargar la ultima versión de SAIKU-UI:

http://analytical-labs.com/downloads.php

Copiar el archivo descomprimido  en /opt/biserver-ce/pentaho-solutions/system/. Luego copiar y 
ejecutar el instalador de  librerías de CTOOLS disponible en:

https://github.com/pmalves/ctools-installer

Para ejecutarlo, es necesario indicar la ubicacion de la instalacion:
./ctools-installer.sh -s /opt/biserver-ce/pentaho-solutions


Reiniciar Pentaho: ./stop-pentaho.sh
                   ./start-pentaho.sh

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

6- Agregar definición de cubos usando la plantilla para indicadores del MINSAL:

https://github.com/erodriguez-minsal/SIIG/wiki/PlantillaIndicadorOLAP

7- Agregar el nuevo indicador al catalogo de cubos dentro de:

biserver-ce/pentaho-solutions/system/olap/datasources.xml


### Pentaho+Saiku API

El servidor OLAP/Pentaho puede ser consultado a traves de SAIKU usando su API HTTP/REST. Esta API permite obtener informacion sobre 
los cubos existentes en el servidor OLAP asi como efectuar consultas. La documentacion de la API puede ser consultada en:


http://dev.analytical-labs.com/saiku/serverdocs/
 

### Crear/Actualizar Catalogo Tiempo

Cada indicador/cubo puede utilizar la dimension tiempo, esta dimension es un tabla/catalogo especial que es creada por el administrador del sistema usando la funcion especial crear_ctl_tiempo. A continuacion se muestra el codigo de esta funcion:


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
Como se puede ver en el codigo, los intervalos y periodos de tiempo (feriados, etc) que se quieran usar para analizar datos pueden pueden ser configurados al crear esta funcion. Luego de que se ha agregado esta funcion, procedemos a crear el catalogo tiempo dentro de la base de datos indicadores:

postgres=# select * from crear_ctl_tiempo(2008,5);

NOTICE:  Se creo tabla Tiempo de 5 anios a partir de 2008
