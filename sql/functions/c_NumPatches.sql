/*
Number of Patches
Descripción: devuelve el número de polígonos que corresponden a una categoría.
*/

--SAMPLE USAGE:
/*
SELECT lm.c_numpatches(geom) As c_numpatches
FROM (SELECT ST_GeomFromText('POLYGON((0 0, 0 10000, 10000 10000, 10000 0, 0 0))',25830)) As foo(geom);
*/


CREATE OR REPLACE FUNCTION lm.c_numpatches(geom geometry, category_level text)
RETURNS bigint AS 
$$

SELECT SUM(St_NumGeometries(geom)) GROUP BY category_level;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.c_numpatches(geom geometry, category_level text) IS 'Calcula el número de polígonos de la misma categoría.';
