CREATE OR REPLACE FUNCTION costo_activo_fijo() RETURNS TRIGGER AS $costo_activo_fijo$
  DECLARE        

    carga_kw_hora  numeric(15,4) := 0;
    dias_inutilizado_por_fallas  integer := 0;
    dias_utilizados_por_mes integer := 0;
    horas_utilizacion_dia integer := 0;
    fecha_descarte  varchar;
    fecha_subasta_permuta varchar;    
    
    consumo_kw_mes numeric(15,4) := 0;
    
  BEGIN   
    carga_kw_hora := (COALESCE(NULLIF(NEW.datos->'carga_kw_hora', ''),'0'))::numeric ;
    dias_inutilizado_por_fallas := (COALESCE(NULLIF(NEW.datos->'dias_inutilizado_por_fallas',''),'0'))::numeric ;    
    dias_utilizados_por_mes := (COALESCE(NULLIF(NEW.datos->'dias_utilizados_por_mes', ''),'0'))::numeric;
    horas_utilizacion_dia := (COALESCE(NULLIF(NEW.datos->'horas_utilizacion_dia', ''),'0'))::numeric;
    fecha_descarte := (COALESCE(NULLIF(NEW.datos->'fecha_descarte', ''),''));
    fecha_subasta_permuta := (COALESCE(NULLIF(NEW.datos->'fecha_subasta_permuta', ''),''));

    IF (carga_kw_hora = 0 OR dias_inutilizado_por_fallas =  dias_utilizados_por_mes OR fecha_descarte <> '' OR fecha_subasta_permuta <> '' ) THEN
        consumo_kw_mes := 0;
    ELSE
        consumo_kw_mes := carga_kw_hora * horas_utilizacion_dia * (dias_utilizados_por_mes - dias_inutilizado_por_fallas);
    END IF;

    NEW.datos := NEW.datos || ('"consumo_kw_mes"=>"'||consumo_kw_mes||'"')::hstore;    
    
   RETURN NEW;
  END;
$costo_activo_fijo$ LANGUAGE plpgsql;

CREATE TRIGGER costo_activo_fijo BEFORE INSERT OR UPDATE 
    ON costos.fila_origen_dato_ga_af FOR EACH ROW 
    EXECUTE PROCEDURE costo_activo_fijo();