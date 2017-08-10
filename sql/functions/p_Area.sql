/*
Patch Area
Descripción: devuelve la suma del área del polígono dividido por 10,000 (unidades: Hectáreas).
*/

--SAMPLE USAGE:
/*
SELECT lm.p_area(geom) As p_area
FROM (SELECT ST_GeomFromText('POLYGON((0 0, 0 10000, 10000 10000, 10000 0, 0 0))',25830)) As foo(geom);
*/

CREATE OR REPLACE FUNCTION lm.p_area(geom geometry)
RETURNS double precision AS 
$$

SELECT St_Area(geom)/10000;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.p_area(geom geometry) IS 'Divide el área en metros cuadrados de un polígono por 10.000 para devolver un valor en Hectáreas.';
