/*
Number of Patches
Descripción: devuelve el número de polígonos del paisaje.
*/

--SAMPLE USAGE:
/*
SELECT lm.l_numpatches(geom) As l_numpatches
FROM (SELECT ST_GeomFromText('POLYGON((0 0, 0 10000, 10000 10000, 10000 0, 0 0))',25830)) As foo(geom);
*/


CREATE OR REPLACE FUNCTION lm.l_numpatches(geom geometry)
RETURNS bigint AS 
$$

SELECT SUM(St_NumGeometries(geom));

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.l_numpatches(geom geometry) IS 'Calcula el número total de polígonos en el paisaje.';
