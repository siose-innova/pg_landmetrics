/*
Total Edge
Descripción: devuelve la suma de las longitudes (m) de todos los segmentos de los bordes correspondientes al tipo de polígono (categoría) (unidades: Metros).
*/

--SAMPLE USAGE:
/*
SELECT lm.c_totaledge(geom) As c_totaledge
FROM (SELECT ST_GeomFromText('POLYGON((0 0, 0 10000, 10000 10000, 10000 0, 0 0))',25830)) As foo(geom);
*/


CREATE OR REPLACE FUNCTION lm.c_totaledge(geom geometry, category_level text)
RETURNS double precision AS 
$$

SELECT SUM(St_Perimeter(geom)) GROUP BY category_level;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.c_totaledge(geom geometry, category_level text) IS 'Suma de las longitudes de los bordes de los polígonos de la misma categoría para devolver un valor en Metros.';
