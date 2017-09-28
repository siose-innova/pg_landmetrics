/*
Total Edge - devuelve la suma de las longitudes (m) de todos los segmentos de los bordes en el paisaje.
*/

--SAMPLE USAGE:
/*
SELECT lm.l_totaledge(geom) FROM lm.sample_patches;
*/


CREATE OR REPLACE FUNCTION lm.l_totaledge_state(lm.metric,geometry)
    RETURNS lm.metric AS
$$
	SELECT ('Total Edge'::text, ($1).value + SUM(St_Perimeter($2))/10000, ''::text)::lm.metric;
$$
LANGUAGE 'sql' IMMUTABLE;


CREATE AGGREGATE lm.l_totaledge(geometry)(
    SFUNC=lm.l_totaledge_state,
    STYPE=lm.metric,
    INITCOND='("Total Edge",0,"")'
);

COMMENT ON AGGREGATE lm.l_totaledge(geometry) IS 'Suma las longitudes de todos los bordes del paisaje.';
