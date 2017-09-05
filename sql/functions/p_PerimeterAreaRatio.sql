/*
Perimeter Area Ratio
Descripción: devuelve la relación entre el perímetro (m) del polígono y el área (m²).
*/

--SAMPLE USAGE:
/*
SELECT lm.p_perimarearatio(geom) As p_perimarearatio
FROM (SELECT ST_GeomFromText('POLYGON((0 0, 0 10000, 10000 10000, 10000 0, 0 0))',25830)) As foo(geom);
*/


CREATE OR REPLACE FUNCTION lm.p_perimarearatio(geom geometry)
RETURNS double precision AS 
$$

SELECT St_Perimeter(geom)/St_Area(geom);

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.p_perimarearatio(geom geometry) IS 'Divide el perímetro entre el área del polígono.';
