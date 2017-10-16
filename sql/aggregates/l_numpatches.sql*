/*
Number of Patches - devuelve el número de polígonos del paisaje.
*/

--SAMPLE USAGE:
/*
SELECT l_numpatches(geom) FROM sample_patches;
*/


CREATE OR REPLACE FUNCTION l_numpatches_state(metric, geometry)
    RETURNS metric AS
$$
	SELECT ('Number of Patches'::text, ($1).value + SUM(St_NumGeometries($2)), ''::text)::metric;
$$
LANGUAGE 'sql' IMMUTABLE;


CREATE AGGREGATE l_numpatches(geometry)(
    SFUNC=l_numpatches_state,
    STYPE=metric,
    INITCOND='("Number of Patches",0,"")'
);

COMMENT ON AGGREGATE l_numpatches(geometry) IS 'Calcula el número total de polígonos en el paisaje.';
