/*
Perimeter Area Ratio - devuelve la relación entre el perímetro (m) del polígono y el área (m²).
*/

-- SAMPLE USAGE:
/*
SELECT (p_perimarearatio(geom)).value FROM sample_patches_25830;
SELECT (p_perimarearatio(geom)).value FROM sample_patches_4326;
*/


CREATE OR REPLACE FUNCTION p_perimarearatio(geom geometry)
RETURNS metric AS 
$$

SELECT (3, St_Perimeter(geom)/St_Area(geom))::metric;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION p_perimarearatio(geom geometry) IS 'Divide el perímetro entre el área del polígono.';




CREATE OR REPLACE FUNCTION p_perimarearatio(geom geography)
RETURNS metric AS 
$$

SELECT (3, St_Perimeter(geom)/St_Area(geom))::metric;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION p_perimarearatio(geom geography) IS 'Divide el perímetro entre el área del polígono.';
