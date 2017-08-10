/*
Percentage of Landscape
Descripción: devuelve la suma de las áreas (m²) de todos los polígonos correspondientes al tipo de polígono dividido por el área total (m²) del paisaje, multiplicado por 100 (unidades: Porcentaje).
*/

--SAMPLE USAGE:
/*
SELECT lm.c_percentagelandscape(geom) As c_percentagelandscape
FROM (SELECT ST_GeomFromText('POLYGON((0 0, 0 10000, 10000 10000, 10000 0, 0 0))',25830)) As foo(geom);
*/


CREATE OR REPLACE FUNCTION lm.c_percentagelandscape(geom geometry, category_level text)
RETURNS double precision AS 
$$

SELECT (SUM(St_Area(geom))/SUM(St_Area(geom)))*100 GROUP BY category_level;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.c_percentagelandscape(geom geometry, category_level text) IS 'Calcula la suma de las áreas de los polígonos de la misma categoría dividido por el área total del paisaje, multiplicado por 100 para devolver un valor en porcentaje.';
