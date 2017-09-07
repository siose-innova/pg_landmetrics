/*
Number of Core Areas - devuelve el número de núcleos de las áreas disyuntivas que contiene el límite de un polígono.
*/

--SAMPLE USAGE:
/*
WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',25830),'Urbano'))

SELECT lm.p_numcoreareas(geom) As p_numcoreareas FROM patches;
*/


CREATE OR REPLACE FUNCTION lm.p_numcoreareas(geom geometry)
RETURNS integer AS 
$$

SELECT St_NumGeometries(St_Buffer(geom, -100));

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.p_numcoreareas(geom geometry) IS 'Cuenta el número de núcleos de las áreas disyuntivas de un polígono.';
