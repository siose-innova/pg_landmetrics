/*
Shannon's Diversity Index
Descripción: devuelve menos la suma, de todas las categorías de los polígonos, la abundancia proporcional de cada tipo de polígono multiplicado por esa proporción.
*/

--SAMPLE USAGE:
/*
SELECT lm.l_shannondiversityindex(geom) As l_shannondiversityindex
FROM (SELECT ST_GeomFromText('POLYGON((0 0, 0 10000, 10000 10000, 10000 0, 0 0))',25830)) As foo(geom);
*/


CREATE OR REPLACE FUNCTION lm.l_shannondiversityindex(geom geometry)
RETURNS double precision AS 
$$

SELECT -1*SUM(DISTINCT St_Perimeter(geom))*100/(SELECT SUM(St_Perimeter(geom))*ln(SUM(DISTINCT St_Perimeter(geom))*100/(SELECT SUM(St_Perimeter(geom)))));

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.l_shannondiversityindex(geom geometry) IS 'Menos la suma de todas las categorías, la abundancia proporcional de cada categoría multiplicado por la proporción.';
