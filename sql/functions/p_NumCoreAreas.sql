/*
Number of Core Areas
Descripción: devuelve el número de núcleos de las áreas disyuntivas que contiene el límite de un polígono.
*/

--SAMPLE USAGE:
/*
SELECT lm.p_numcoreareas(geom) As p_numcoreareas
FROM (SELECT ST_GeomFromText('POLYGON((0 0, 0 10000, 10000 10000, 10000 0, 0 0))',25830)) As foo(geom);
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
