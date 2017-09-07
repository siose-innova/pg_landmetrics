/*
Patch Richness - devuelve el número de las diferentes categorías de polígonos presentes dentro del límite del paisaje.
*/

--SAMPLE USAGE:
/*
WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',25830),'Urbano'))

SELECT lm.l_patchrichness(geom, categ) As l_patchrichness, categ FROM patches;
*/

CREATE OR REPLACE FUNCTION lm.l_patchrichness(geom geometry, categ text)
RETURNS bigint AS 
$$

SELECT COUNT(DISTINCT categ);

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.l_patchrichness(geom geometry, categ text) IS 'Número total de las distintas categorías del paisaje';
