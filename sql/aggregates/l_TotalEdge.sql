/*
Total Edge - devuelve la suma de las longitudes (m) de todos los segmentos de los bordes en el paisaje.
*/

-- SAMPLE USAGE:
/*
SELECT (l_totaledge(geom)).value FROM sample_patches_25830;
SELECT (l_totaledge(geom)).value FROM sample_patches_4326;
*/


CREATE OR REPLACE FUNCTION l_totaledge_state(metric,geometry)
    RETURNS metric AS
$$
	SELECT $1 + (p_perimeter($2)).value;
$$
LANGUAGE 'sql' IMMUTABLE;


CREATE AGGREGATE l_totaledge(geometry)(
    SFUNC=l_totaledge_state,
    STYPE=metric,
    INITCOND='(0,0)'
);

COMMENT ON AGGREGATE l_totaledge(geometry) IS 'Suma las longitudes de todos los bordes del paisaje.';




CREATE OR REPLACE FUNCTION l_totaledge_state(metric,geography)
    RETURNS metric AS
$$
	SELECT $1 + (p_perimeter($2)).value;
$$
LANGUAGE 'sql' IMMUTABLE;


CREATE AGGREGATE l_totaledge(geography)(
    SFUNC=l_totaledge_state,
    STYPE=metric,
    INITCOND='(0,0)'
);

COMMENT ON AGGREGATE l_totaledge(geography) IS 'Suma las longitudes de todos los bordes del paisaje.';
