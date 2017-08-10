/*
Edge Density
Descripción: devuelve la suma de las longitudes (m) de todos los segmentos de los bordes correspondientes al tipo de polígono dividido por el total del área (m²) del paisaje, multiplicado por 10,000 (unidades: Metros por hectárea).
*/

--SAMPLE USAGE:
/*
SELECT lm.c_edgedensity(geom) As c_edgedensity
FROM (SELECT ST_GeomFromText('POLYGON((0 0, 0 10000, 10000 10000, 10000 0, 0 0))',25830)) As foo(geom);
*/


CREATE OR REPLACE FUNCTION lm.c_edgedensity(geom geometry, category_level text)
RETURNS double precision AS 
$$

SELECT (SUM(St_Perimeter(geom))/SUM(St_Area(geom)))*10000 GROUP BY category_level;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.c_edgedensity(geom geometry, category_level text) IS 'Suma de las longitudes de los bordes de los polígonos de la misma categoría dividido por el total del área, multiplicado por 10,000 para devolver un valor en metros por Hectárea.';
