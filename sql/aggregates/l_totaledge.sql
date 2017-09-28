/*
Total Edge - devuelve la suma de las longitudes (m) de todos los segmentos de los bordes en el paisaje.
*/

--SAMPLE USAGE:
/*
SELECT lm.l_totaledge(geom) FROM lm.sample_patches;
*/


CREATE OR REPLACE FUNCTION lm.l_totaledge_state(lm.simple_metric,geometry)
    RETURNS lm.simple_metric AS
$$
	SELECT ('Total Edge'::text, ($1).value + SUM(St_Perimeter($2))/10000, ''::text)::lm.simple_metric;
$$
LANGUAGE 'sql' IMMUTABLE;


CREATE AGGREGATE lm.l_totaledge(geometry)(
    SFUNC=lm.l_totaledge_state,
    STYPE=lm.simple_metric,
    INITCOND='("Total Edge",0,"")'
);

COMMENT ON AGGREGATE lm.l_totaledge(geometry) IS 'Suma las longitudes de todos los bordes del paisaje.';
