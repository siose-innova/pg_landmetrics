/*
Perimeter Area Ratio - devuelve la relación entre el perímetro (m) del polígono y el área (m²).
*/

--SAMPLE USAGE:
/*
SELECT p_perimarearatio(geom) As p_perimarearatio FROM sample_patches;
*/


CREATE OR REPLACE FUNCTION p_perimarearatio(geom geometry)
RETURNS metric AS 
$$

SELECT ('Perimeter Area Ratio'::text, St_Perimeter(geom)/St_Area(geom),'')::metric;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION p_perimarearatio(geom geometry) IS 'Divide el perímetro entre el área del polígono.';
