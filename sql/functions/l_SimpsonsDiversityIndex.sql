/*
Simpson's Diversity Index
Descripción: devuelve 1 menos la suma, de todas las categorías de los polígonos, a abundancia proporcional de cada tipo de polígono al cuadrado.
*/

--SAMPLE USAGE:
/*
SELECT lm.l_simpsondiversityindex(geom) As l_simpsondiversityindex
FROM (SELECT ST_GeomFromText('POLYGON((0 0, 0 10000, 10000 10000, 10000 0, 0 0))',25830)) As foo(geom);
*/


CREATE OR REPLACE FUNCTION lm.l_simpsondiversityindex(geom geometry)
RETURNS double precision AS 
$$

SELECT POWER(1-SUM(DISTINCT St_Perimeter(geom))*100/(SELECT SUM(St_Perimeter(geom))), 2);

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.l_simpsondiversityindex(geom geometry) IS 'Resta 1 menos la suma de todas las categorías, la abundancia proporcional de cada categoría al cuadrado.';
