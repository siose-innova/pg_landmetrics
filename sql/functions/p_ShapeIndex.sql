/*
Shape Index - devuelve el perímetro (m) del polígono dividido por la raíz cuadrada del área (m²) del polígono, ajustado por una constante de ajuste para un estándar cuadrático.
*/

--SAMPLE USAGE:
/*
WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',25830),'Urbano'))

SELECT lm.p_shapeindex(geom) As p_shape FROM patches;
*/


CREATE OR REPLACE FUNCTION lm.p_shapeindex(geom geometry)
RETURNS double precision AS 
$$

SELECT St_Perimeter(geom)/(|/St_Area(geom));

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.p_shapeindex(geom geometry) IS 'Divide el perímetro por la raíz cuadrada del área del polígono ajustado por una constante de estándar cuadrático.';
