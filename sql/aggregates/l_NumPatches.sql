/*
Number of Patches - devuelve el número de polígonos del paisaje.
*/

-- SAMPLE USAGE:
/*
SELECT (l_numpatches(geom)).value FROM sample_patches_25830;
SELECT (l_numpatches(geom)).value FROM sample_patches_4326;
*/


CREATE OR REPLACE FUNCTION l_numpatches_state(metric, geometry)
    RETURNS metric AS
$$
	SELECT $1 + 1;
$$
LANGUAGE 'sql' IMMUTABLE;


CREATE AGGREGATE l_numpatches(geometry)(
    SFUNC=l_numpatches_state,
    STYPE=metric,
    INITCOND='(0,0)'
);

COMMENT ON AGGREGATE l_numpatches(geometry) IS 'Calcula el número total de polígonos en el paisaje.';




CREATE OR REPLACE FUNCTION l_numpatches_state(metric, geography)
    RETURNS metric AS
$$
	SELECT $1 + 1;
$$
LANGUAGE 'sql' IMMUTABLE;


CREATE AGGREGATE l_numpatches(geography)(
    SFUNC=l_numpatches_state,
    STYPE=metric,
    INITCOND='(0,0)'
);

COMMENT ON AGGREGATE l_numpatches(geography) IS 'Calcula el número total de polígonos en el paisaje.';
