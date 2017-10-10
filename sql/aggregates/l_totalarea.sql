/*
Total Area - devuelve el total del área (m²) del paisaje dividido por 10.000 (unidades: Hectáreas).
*/

--SAMPLE USAGE: 
/*
SELECT l_totalarea(geom) FROM sample_patches;
*/

CREATE OR REPLACE FUNCTION l_totalarea_state(metric,geometry)
    RETURNS metric AS
$$
	SELECT ('Total Area'::text, ($1).value + St_Area($2)/10000, 'Ha.'::text)::metric;
$$
LANGUAGE 'sql' IMMUTABLE;


CREATE AGGREGATE l_totalarea(geometry)(
    SFUNC=l_totalarea_state,
    STYPE=metric,
    INITCOND='("Total Area",0,"Ha")'
);

COMMENT ON AGGREGATE l_totalarea(geometry) IS 'Calcula el área total del paisaje dividida por 10.000 para devolver un valor en Hectáreas.';
