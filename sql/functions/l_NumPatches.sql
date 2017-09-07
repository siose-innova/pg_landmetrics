/*
Number of Patches - devuelve el número de polígonos del paisaje.
*/

--SAMPLE USAGE:
/*
WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',25830),'Urbano'))

SELECT lm.l_numpatches(geom) As l_numpatches FROM patches;
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
