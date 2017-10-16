/*
Total Area - devuelve el total del área (m²) del paisaje dividido por 10.000 (unidades: Hectáreas).
*/

--SAMPLE USAGE: 
/*
SELECT (l_totalarea(geom)).value FROM sample_patches_25830;
*/

CREATE OR REPLACE FUNCTION l_totalarea_state(metric,geometry)
    RETURNS metric AS
$$
	SELECT $1 + (p_area($2)).value;
$$
LANGUAGE 'sql' IMMUTABLE;


CREATE AGGREGATE l_totalarea(geometry)(
    SFUNC=l_totalarea_state,
    STYPE=metric,
    INITCOND='(3,0)'
);

COMMENT ON AGGREGATE l_totalarea(geometry) IS 'Calcula el área total del paisaje dividida por 10.000 para devolver un valor en Hectáreas.';
