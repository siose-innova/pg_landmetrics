/*
Total Core Area
Descripción: devuelve la suma de los núcleos de las áreas (m²) de cada polígono correspondiente al tipo de polígono, dividido por 10,000 (unidades: Hectáreas).
*/

--SAMPLE USAGE:
/*
SELECT lm.c_totalcorearea(geom) As c_totalcorearea
FROM (SELECT ST_GeomFromText('POLYGON((0 0, 0 10000, 10000 10000, 10000 0, 0 0))',25830)) As foo(geom);
*/


CREATE OR REPLACE FUNCTION lm.c_totalcorearea(geom geometry, category_level text)
RETURNS double precision AS 
$$

SELECT SUM(St_Area(St_Buffer(geom, -100)))/10000 GROUP BY category_level;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.c_totalcorearea(geom geometry, category_level text) IS 'Suma las áreas de los núcleos de cada polígono de la misma categoría dividido por 10,000 para devolver un valor en Hectáreas.';
