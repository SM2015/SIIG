-- Creación de nuevos esquemas
CREATE SCHEMA IF NOT EXISTS costos;
CREATE SCHEMA IF NOT EXISTS catalogos;
CREATE SCHEMA IF NOT EXISTS temporales;

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

CREATE TABLE IF NOT EXISTS costos.fila_origen_dato_ga_compromisosfinancieros(
    id_origen_dato integer,
    datos hstore,
    ultima_lectura timestamp,

    FOREIGN KEY (id_origen_dato) REFERENCES origen_datos(id) on update CASCADE on delete CASCADE
);