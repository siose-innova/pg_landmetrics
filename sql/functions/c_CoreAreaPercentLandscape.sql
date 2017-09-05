/*
Core Area Percentage Landscape
Descripción: devuelve la suma de los núcleos de las áreas (m²) de cada polígono correspondiente al tipo de polígono, dividido por el total del área (m²) del paisaje, multiplicado por 100 (unidades: Porcentaje).
*/

--SAMPLE USAGE:
/*
SELECT lm.c_coreareapercentlandscape(geom) As c_coreareapercentlandscape
FROM (SELECT ST_GeomFromText('POLYGON((0 0, 0 10000, 10000 10000, 10000 0, 0 0))',25830)) As foo(geom);
*/


CREATE OR REPLACE FUNCTION lm.c_coreareapercentlandscape(geom geometry, category_level text)
RETURNS double precision AS 
$$

SELECT (SUM(St_Area(St_Buffer(geom, -100)))/SUM(St_Area(geom)))*100 GROUP BY category_level;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.c_coreareapercentlandscape(geom geometry, category_level text) IS 'Suma las áreas de los núcleos de cada polígono de la misma categoría dividido por el total del área del paisaje, multiplicado por 100 para devolver un valor en porcentaje.';
