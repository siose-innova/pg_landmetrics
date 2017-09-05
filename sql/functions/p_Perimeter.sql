/*
Patch Perimeter
Descripción: devuelve el perímetro del polígono, incluyendo algún vacío interno (unidades: Metros).
*/

--SAMPLE USAGE:
/*
SELECT lm.p_perimeter(geom) As p_perimeter
FROM (SELECT ST_GeomFromText('POLYGON((0 0, 0 10000, 10000 10000, 10000 0, 0 0))',25830)) As foo(geom);
*/


CREATE OR REPLACE FUNCTION lm.p_perimeter(geom geometry)
RETURNS double precision AS 
$$

SELECT St_Perimeter(geom);

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.p_perimeter(geom geometry) IS 'Calcula el perímetro de un polígono para devolver un valor en Metros.';
