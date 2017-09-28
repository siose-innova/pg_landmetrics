/*
Number of Patches - devuelve el número de polígonos del paisaje.
*/

--SAMPLE USAGE:
/*
SELECT lm.l_numpatches(geom) FROM lm.sample_patches;
*/


CREATE OR REPLACE FUNCTION lm.l_numpatches_state(lm.metric, geometry)
    RETURNS lm.metric AS
$$
	SELECT ('Number of Patches'::text, ($1).value + SUM(St_NumGeometries($2)), ''::text)::lm.metric;
$$
LANGUAGE 'sql' IMMUTABLE;


CREATE AGGREGATE lm.l_numpatches(geometry)(
    SFUNC=lm.l_numpatches_state,
    STYPE=lm.metric,
    INITCOND='("Number of Patches",0,"")'
);

COMMENT ON AGGREGATE lm.l_numpatches(geometry) IS 'Calcula el número total de polígonos en el paisaje.';
