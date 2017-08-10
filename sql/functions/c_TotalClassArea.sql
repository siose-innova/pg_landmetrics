/*
Total Class Area
Descripción: devuelve la suma de las áreas (m²) de todos los polígonos correspondientes al tipo de polígono, dividido por 10,000 (unidades: Hectáreas).
*/

--SAMPLE USAGE:
/*
SELECT lm.c_totalarea(geom) As c_totalarea
FROM (SELECT ST_GeomFromText('POLYGON((0 0, 0 10000, 10000 10000, 10000 0, 0 0))',25830)) As foo(geom);
*/


CREATE OR REPLACE FUNCTION lm.c_totalarea(geom geometry, category_level text)
RETURNS double precision AS 
$$

SELECT SUM(St_Area(geom))/10000 GROUP BY category_level;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.c_totalarea(geom geometry, category_level text) IS 'Calcula la suma de las áreas de los polígonos de la misma categoría dividido por 10,000 para devolver un valor en Hectáreas.';
