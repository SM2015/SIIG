-- Creación de nuevos esquemas
CREATE SCHEMA IF NOT EXISTS costos;
CREATE SCHEMA IF NOT EXISTS catalogos;
CREATE SCHEMA IF NOT EXISTS temporales;
CREATE SCHEMA IF NOT EXISTS almacen_datos;

-- Cración de las datos que contendrán los datos leidos de los orígenes
CREATE TABLE IF NOT EXISTS fila_origen_dato_aux(
    id_origen_dato integer,
    datos hstore,
    ultima_lectura timestamp,

    FOREIGN KEY (id_origen_dato) REFERENCES origen_datos(id) on update CASCADE on delete CASCADE
);

CREATE TABLE IF NOT EXISTS costos.fila_origen_dato_rrhh(
    id_origen_dato integer,
    datos hstore,
    ultima_lectura timestamp,

    FOREIGN KEY (id_origen_dato) REFERENCES origen_datos(id) on update CASCADE on delete CASCADE
);

CREATE TABLE IF NOT EXISTS costos.fila_origen_dato_ga_af(
    id_origen_dato integer,
    datos hstore,
    ultima_lectura timestamp,

    FOREIGN KEY (id_origen_dato) REFERENCES origen_datos(id) on update CASCADE on delete CASCADE
);

CREATE TABLE IF NOT EXISTS costos.fila_origen_dato_ga(
    id_formulario integer,
    area_costeo varchar(40),
    datos hstore,
    ultima_lectura timestamp,

    FOREIGN KEY (id_formulario) REFERENCES costos.formulario(id) on update CASCADE on delete CASCADE
);

CREATE TABLE IF NOT EXISTS almacen_datos.repositorio(
    id_formulario integer,
    datos hstore,
    ultima_lectura timestamp,

    FOREIGN KEY (id_formulario) REFERENCES costos.formulario(id) on update CASCADE on delete CASCADE
);