/*
Shape Index
Descripción: devuelve el perímetro (m) del polígono dividido por la raíz cuadrada del área (m²) del polígono, ajustado por una constante de ajuste para un estándar cuadrático.
*/

--SAMPLE USAGE:
/*
SELECT lm.p_shape(geom) As p_shape
FROM (SELECT ST_GeomFromText('POLYGON((0 0, 0 10000, 10000 10000, 10000 0, 0 0))',25830)) As foo(geom);
*/


CREATE OR REPLACE FUNCTION lm.p_shape(geom geometry)
RETURNS double precision AS 
$$

SELECT St_Perimeter(geom)/(|/St_Area(geom));

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.p_shape(geom geometry) IS 'Divide el perímetro por la raíz cuadrada del área del polígono ajustado por una constante de estándar cuadrático.';
