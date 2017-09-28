/*
Number of Patches - devuelve el número de polígonos del paisaje.
*/

--SAMPLE USAGE:
/*
SELECT lm.l_numpatches(geom) FROM lm.sample_patches;
*/


CREATE OR REPLACE FUNCTION lm.l_numpatches_state(lm.simple_metric, geometry)
    RETURNS lm.simple_metric AS
$$
	SELECT ('Number of Patches'::text, ($1).value + SUM(St_NumGeometries($2)), ''::text)::lm.simple_metric;
$$
LANGUAGE 'sql' IMMUTABLE;


CREATE AGGREGATE lm.l_numpatches(geometry)(
    SFUNC=lm.l_numpatches_state,
    STYPE=lm.simple_metric,
    INITCOND='("Number of Patches",0,"")'
);

COMMENT ON AGGREGATE lm.l_numpatches(geometry) IS 'Calcula el número total de polígonos en el paisaje.';
