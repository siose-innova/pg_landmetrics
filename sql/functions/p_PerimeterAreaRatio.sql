/*
Perimeter Area Ratio - devuelve la relación entre el perímetro (m) del polígono y el área (m²).
*/

--SAMPLE USAGE:
/*
WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',25830),'Urbano'))

SELECT lm.p_perimarearatio(geom) As p_perimarearatio FROM patches;
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
