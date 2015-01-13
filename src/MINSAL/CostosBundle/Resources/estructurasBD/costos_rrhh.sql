CREATE OR REPLACE FUNCTION costo_rrhh() RETURNS TRIGGER AS $costo_rrhh$
  DECLARE    
    limite_isss numeric(15,4) := 685.71;
    isss_porc_patronal numeric(15,4) := 0.075;

    limite_ipsfa numeric(15,4) := 2449.05;
    ipsfa_porc_patronal numeric(15,4) := 0.06;

    afp_porc_patronal numeric(15,4) := 0.0675;
    limite_afp numeric(15,4) := 5467.52;

    salario  numeric(15,4) := 0;
    salario_descuentos_permisos  numeric(15,4) := 0;
    isss_patronal numeric(15,4) := 0;
    tipo_fondo_proteccion  varchar;
    no_genera_costos_patronales varchar;
    forma_contrato varchar;
    
    fondo_proteccion numeric(15,4) := 0;
    porc_fondo_proteccion numeric(15,4) := 0;
    limit_fondo_proteccion numeric(15,4) := 0;

    costo_con_aporte_y_aguinaldo numeric(15,4) :=0;
    costo_hora_con_aporte_y_aguinaldo numeric(15,4) :=0;
    costo_hora_no_trab_CG numeric(15,4) :=0;
    costo_hora_no_trab_SG numeric(15,4) :=0;
    costo_hora_descuentos_permisos numeric(15,4) :=0;

    horas_trabajadas_mes numeric(15,4) :=0;
    horas_trabajadas_sg numeric(15,4) :=0;
    dependencias_donde_labora numeric(15,4) :=0;
    aguinaldo numeric(15,4) :=0;
    descuentos numeric(15,4) :=0;
    horas_no_trab_CG numeric(15,4) :=0;
    horas_no_trab_SG numeric(15,4) :=0;

    r RECORD;
    
  BEGIN   
    salario := (COALESCE(NULLIF(NEW.datos->'salario', ''),'0'))::numeric ;
    descuentos := (COALESCE(NULLIF(NEW.datos->'descuentos',''),'0'))::numeric ;
    tipo_fondo_proteccion := (COALESCE(NULLIF(NEW.datos->'fondo_proteccion', ''),''));
    horas_trabajadas_mes := (COALESCE(NULLIF(NEW.datos->'horas_trab_mes', ''),'0'))::numeric;
    dependencias_donde_labora := (COALESCE(NULLIF(NEW.datos->'dependencias_donde_labora',''),'0'))::numeric;
    horas_trabajadas_sg := (COALESCE(NULLIF(NEW.datos->'horas_trab_sg',''),'0'))::numeric;
    aguinaldo := (COALESCE(NULLIF(NEW.datos->'aguinaldo', ''),'0'))::numeric;
    horas_no_trab_CG := (COALESCE(NULLIF(NEW.datos->'horas_no_trab_cobradas', ''),'0'))::numeric;
    horas_no_trab_SG := (COALESCE(NULLIF(NEW.datos->'horas_no_trab_sin_goce', ''),'0'))::numeric;
    no_genera_costos_patronales := (COALESCE(NULLIF(NEW.datos->'no_genera_costo_patronal', ''),'false'));
    forma_contrato := (COALESCE(NULLIF(NEW.datos->'forma_contrato', ''),''));

     
    IF UPPER(tipo_fondo_proteccion) = 'AFP' THEN
        porc_fondo_proteccion := afp_porc_patronal;
        limit_fondo_proteccion := limite_afp;
    ELSEIF UPPER(tipo_fondo_proteccion) = 'IPSFA' THEN
        porc_fondo_proteccion := ipsfa_porc_patronal;
        limit_fondo_proteccion := limite_ipsfa;
    END IF;
    
    IF (salario > limit_fondo_proteccion) THEN
        fondo_proteccion := limit_fondo_proteccion * porc_fondo_proteccion;
    ELSE
        fondo_proteccion := salario * porc_fondo_proteccion;
    END IF;

    IF (salario > limite_isss) THEN
        isss_patronal := limite_isss * isss_porc_patronal;
    ELSE
        isss_patronal := salario * isss_porc_patronal;
    END IF;

    IF (forma_contrato <> 'AD' AND forma_contrato <> 'LS' AND forma_contrato <> 'CG' AND no_genera_costos_patronales = 'true' ) THEN
        fondo_proteccion := 0;
        isss_patronal := 0;
    END IF;

    IF horas_trabajadas_mes > 0 THEN        
        IF dependencias_donde_labora >= 2 THEN
            costo_con_aporte_y_aguinaldo := isss_patronal + fondo_proteccion + 
            (salario - ((salario / horas_trabajadas_mes) * horas_no_trab_SG) + 
            aguinaldo) / dependencias_donde_labora;
        ELSE
            costo_con_aporte_y_aguinaldo := salario - (( salario / horas_trabajadas_mes) 
            * horas_no_trab_SG) + isss_patronal + fondo_proteccion +  aguinaldo; 
        END IF;
        costo_hora_con_aporte_y_aguinaldo := costo_con_aporte_y_aguinaldo / (horas_trabajadas_mes - horas_no_trab_CG) ;
    ELSE
        costo_con_aporte_y_aguinaldo := 0;
        costo_hora_con_aporte_y_aguinaldo := 0;
    END IF;

    IF horas_trabajadas_mes = horas_no_trab_CG  THEN
        costo_hora_no_trab_CG :=  costo_hora_con_aporte_y_aguinaldo;
    ELSE
        costo_hora_no_trab_CG := horas_no_trab_CG * costo_hora_con_aporte_y_aguinaldo;
    END IF;

    IF (horas_trabajadas_mes = horas_no_trab_SG)  OR horas_trabajadas_mes = 0 THEN
        costo_hora_no_trab_SG :=  0;
    ELSE
        costo_hora_no_trab_SG := horas_no_trab_SG * (salario / horas_trabajadas_mes);
    END IF;

    salario_descuentos_permisos := costo_con_aporte_y_aguinaldo - descuentos;

    IF horas_trabajadas_mes = horas_no_trab_CG THEN
        costo_hora_descuentos_permisos := salario_descuentos_permisos;
    ELSEIF horas_trabajadas_mes > 0 THEN
        costo_hora_descuentos_permisos := salario_descuentos_permisos / (horas_trabajadas_mes - horas_no_trab_CG);
    ELSE
        costo_hora_descuentos_permisos := 0;
    END IF;

    -- Calcular el costo para cada centro
    FOR r IN SELECT replace(key, 'distribucion_horas_','') as centro, value AS horas 
        FROM (SELECT (each(NEW.datos)).* ) AS A WHERE key ~* 'distribucion_horas_' and (COALESCE(NULLIF(value,''),'0'))::numeric > 0
    LOOP
        NEW.datos := NEW.datos || ('"_costo_'||r.centro||'"=>"'|| (costo_hora_descuentos_permisos * r.horas::numeric) ||'"')::hstore;
    END LOOP;

    NEW.datos := NEW.datos || ('"isss_patronal"=>"'||isss_patronal||'"')::hstore;
    NEW.datos := NEW.datos || ('"fondo_proteccion_patronal"=>"'||fondo_proteccion||'"')::hstore;
    NEW.datos := NEW.datos || ('"costo_con_aporte_y_aguinaldo"=>"'||( salario + isss_patronal + fondo_proteccion + aguinaldo )||'"')::hstore;
    NEW.datos := NEW.datos || ('"costo_hora_aporte_aguinaldo"=>"'||costo_hora_con_aporte_y_aguinaldo||'"')::hstore;
    NEW.datos := NEW.datos || ('"costo_hora_no_trab_CG"=>"'||costo_hora_no_trab_CG||'"')::hstore;
    NEW.datos := NEW.datos || ('"costo_hora_no_trab_SG"=>"'||costo_hora_no_trab_SG||'"')::hstore;
    NEW.datos := NEW.datos || ('"salario_descuentos_permisos"=>"'||salario_descuentos_permisos||'"')::hstore;
    NEW.datos := NEW.datos || ('"costo_hora_descuentos_permisos"=>"'||costo_hora_descuentos_permisos||'"')::hstore;
    
   RETURN NEW;
  END;
$costo_rrhh$ LANGUAGE plpgsql;

CREATE TRIGGER costo_rrhh BEFORE INSERT OR UPDATE 
    ON costos.fila_origen_dato_rrhh FOR EACH ROW 
    EXECUTE PROCEDURE costo_rrhh();