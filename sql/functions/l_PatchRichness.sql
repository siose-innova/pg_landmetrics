/*
Patch Richness
Descripción: devuelve el número de las diferentes categorías de polígonos presentes dentro del límite del paisaje.
*/

--SAMPLE USAGE:
/*
SELECT lm.l_patchrichness(geom) As l_patchrichness
FROM (SELECT ST_GeomFromText('POLYGON((0 0, 0 10000, 10000 10000, 10000 0, 0 0))',25830)) As foo(geom);
*/

CREATE OR REPLACE FUNCTION lm.l_patchrichness(geom geometry, category_level text)
RETURNS bigint AS 
$$

SELECT COUNT(DISTINCT category_level);

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.l_patchrichness(geom geometry, category_level text) IS 'Número total de las distintas categorías del paisaje';
