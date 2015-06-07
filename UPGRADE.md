#Actualización a 1.1
## Cambios en la base de datos



alter table grupo_indicadores_indicador add column vista varchar(20);

ALTER TABLE ficha_tecnica ADD id_sala_reporte INT DEFAULT NULL;
ALTER TABLE ficha_tecnica ADD CONSTRAINT FK_AE97ABD1EF8F4F8 FOREIGN KEY (id_sala_reporte) REFERENCES grupo_indicadores (id) NOT DEFERRABLE INITIALLY IMMEDIATE;
CREATE INDEX IDX_AE97ABD1EF8F4F8 ON ficha_tecnica (id_sala_reporte);
ALTER TABLE fos_user_user ALTER biography TYPE VARCHAR(1000);

alter table grupo_indicadores add column updated_at timestamp(0) without time zone;



##Actualizar wkhtmltopdf
Descargar la versión 0.12 de wkhtmltopdf e instalarla según se indica en el manual de instalación del eTAB


## Instalación de Redis
apt-get install redis-server

##Actualizar el código del siig
git reset --hard
git pull

## Actualizar las dependencias
php composer.phar self-update
php composer.phar update


## Limpiar la caché
app/console redis:flushall
app/console cache:clear
app/console cache:clear --env=prod

#Actualización módulo de costos
## Crear el esquema costos
## dentro de la base ejecutar
CREATE SCHEMA costos;
CREATE SCHEMA catalogos;
CREATE SCHEMA temporales;

##Actualizar la estructura de la base de datos
app/console doctrine:schema:update --force


## Cargar datos iniciales
app/console doctrine:fixtures:load --fixtures=src/MINSAL/CostosBundle/DataFixtures/ORM --append

- Ejecutar dentro de la base de datos, con el usuario dueño de la base
~~~
\i [directorio_instalacion]/src/MINSAL/CostosBundle/Resources/estructurasBD/estructuras.sql
\i [directorio_instalacion]/src/MINSAL/CostosBundle/Resources/estructurasBD/costos_rrhh.sql
~~~

##Agregar desde la aplicación dos significados
Código: tipo_contratacion
Descripción: Tipo Contratación
Utilizado para costeo: Sí
Catálogo: catalogos.tipo_contratacion

Código: tipo_recurso
Descripción: Tipo Recurso
Utilizado para costeo: Sí
Catálogo: catalogos.tipo_recurso

Código: especialidad
Descripción: Especialidad
Utilizado para costeo: Sí
Catálogo: catalogos.especialidad