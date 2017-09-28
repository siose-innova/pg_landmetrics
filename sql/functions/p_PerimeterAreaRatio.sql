/*
Perimeter Area Ratio - devuelve la relación entre el perímetro (m) del polígono y el área (m²).
*/

--SAMPLE USAGE:
/*
SELECT lm.p_perimarearatio(geom) As p_perimarearatio FROM lm.sample_patches;
*/


CREATE OR REPLACE FUNCTION lm.p_perimarearatio(geom geometry)
RETURNS lm.simple_metric AS 
$$

SELECT ('Perimeter Area Ratio'::text, St_Perimeter(geom)/St_Area(geom),'')::lm.simple_metric;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.p_perimarearatio(geom geometry) IS 'Divide el perímetro entre el área del polígono.';
