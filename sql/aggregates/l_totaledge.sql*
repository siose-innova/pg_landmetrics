/*
Total Edge - devuelve la suma de las longitudes (m) de todos los segmentos de los bordes en el paisaje.
*/

--SAMPLE USAGE:
/*
SELECT l_totaledge(geom) FROM sample_patches;
*/


CREATE OR REPLACE FUNCTION l_totaledge_state(metric,geometry)
    RETURNS metric AS
$$
	SELECT ('Total Edge'::text, ($1).value + SUM(St_Perimeter($2))/10000, ''::text)::metric;
$$
LANGUAGE 'sql' IMMUTABLE;


CREATE AGGREGATE l_totaledge(geometry)(
    SFUNC=l_totaledge_state,
    STYPE=metric,
    INITCOND='("Total Edge",0,"")'
);

COMMENT ON AGGREGATE l_totaledge(geometry) IS 'Suma las longitudes de todos los bordes del paisaje.';
