/*
Shape Index - devuelve el perímetro (m) del polígono dividido por la raíz cuadrada del área (m²) del polígono, ajustado por una constante de ajuste para un estándar cuadrático.
*/

--SAMPLE USAGE:
/*
SELECT lm.p_shapeindex(geom) As p_shape FROM lm.sample_patches;
*/


CREATE OR REPLACE FUNCTION lm.p_shapeindex(geom geometry)
RETURNS lm.simple_metric AS 
$$

SELECT ('Shape Index'::text, St_Perimeter(geom)/sqrt(St_Area(geom)),'')::lm.simple_metric;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.p_shapeindex(geom geometry) IS 'Divide el perímetro por la raíz cuadrada del área del polígono ajustado por una constante de estándar cuadrático.';
