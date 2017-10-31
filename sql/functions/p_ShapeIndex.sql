/*
Shape Index - devuelve el perímetro (m) del polígono dividido por la raíz cuadrada del área (m²) del polígono, ajustado por una constante de ajuste para un estándar cuadrático.
*/

-- SAMPLE USAGE:
/*
SELECT (p_shapeindex(geom)).value FROM sample_patches_25830;
SELECT (p_shapeindex(geom)).value FROM sample_patches_4326;
*/


CREATE OR REPLACE FUNCTION p_shapeindex(geom geometry)
RETURNS metric AS 
$$

SELECT (4, St_Perimeter(geom)/sqrt(St_Area(geom)))::metric;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION p_shapeindex(geom geometry) IS 'Divide el perímetro por la raíz cuadrada del área del polígono ajustado por una constante de estándar cuadrático.';




CREATE OR REPLACE FUNCTION p_shapeindex(geom geography)
RETURNS metric AS 
$$

SELECT (4, St_Perimeter(geom)/sqrt(St_Area(geom)))::metric;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION p_shapeindex(geom geography) IS 'Divide el perímetro por la raíz cuadrada del área del polígono ajustado por una constante de estándar cuadrático.';
