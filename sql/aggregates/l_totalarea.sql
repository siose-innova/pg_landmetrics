/*
Total Area - devuelve el total del área (m²) del paisaje dividido por 10.000 (unidades: Hectáreas).
*/

--SAMPLE USAGE: 
/*
SELECT lm.l_totalarea(geom) FROM lm.sample_patches;
*/

CREATE OR REPLACE FUNCTION lm.l_totalarea_state(lm.simple_metric,geometry)
    RETURNS lm.simple_metric AS
$$
	SELECT ('Total Area'::text, ($1).value + St_Area($2)/10000, 'Ha.'::text)::lm.simple_metric;
$$
LANGUAGE 'sql' IMMUTABLE;


CREATE AGGREGATE lm.l_totalarea(geometry)(
    SFUNC=lm.l_totalarea_state,
    STYPE=lm.simple_metric,
    INITCOND='("Total Area",0,"Ha")'
);

COMMENT ON AGGREGATE lm.l_totalarea(geometry) IS 'Calcula el área total del paisaje dividida por 10.000 para devolver un valor en Hectáreas.';
