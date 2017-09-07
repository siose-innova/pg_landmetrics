/*
Number of Patches - devuelve el número de polígonos que corresponden a una categoría.
*/

--SAMPLE USAGE:
/*
WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',25830),'Urbano'))

SELECT lm.c_numpatches(geom, categ) As c_numpatches, categ FROM patches;
*/


CREATE OR REPLACE FUNCTION lm.c_numpatches(geom geometry, categ text)
RETURNS bigint AS 
$$

SELECT SUM(St_NumGeometries(geom)) GROUP BY categ;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.c_numpatches(geom geometry, categ text) IS 'Calcula el número de polígonos de la misma categoría.';
