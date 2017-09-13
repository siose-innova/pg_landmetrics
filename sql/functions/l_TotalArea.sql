/*
Total Area - devuelve el total del área (m²) del paisaje dividido por 10,000 (unidades: Hectáreas).
*/

--SAMPLE USAGE: 
/*
SELECT lm.l_totalarea('lm.sample_patches', 'geom')
*/

CREATE OR REPLACE FUNCTION lm.l_totalarea(tblname text, geom_colname text)
    RETURNS lm.metric
    LANGUAGE 'plpgsql'
AS $BODY$

DECLARE
script text;
m_name text :='Total Area';
m_value numeric:=0;
m_unit text :='Ha.';

BEGIN

script:= $literal$
SELECT SUM(St_Area(%s))/10000 FROM %s;
$literal$;

script:= format(script, geom_colname, tblname);

EXECUTE script INTO m_value;
RETURN (m_name,m_value,m_unit)::lm.metric;

END
$BODY$;

COMMENT ON FUNCTION lm.l_totalarea(geom geometry) IS 'Calcula el área total del paisaje dividida por 10.000 para devolver un valor en Hectáreas.';
