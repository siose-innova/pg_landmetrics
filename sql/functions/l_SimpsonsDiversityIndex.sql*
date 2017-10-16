/*
Simpson's Diversity Index - devuelve 1 menos la suma, de todas las categorías de los polígonos, a abundancia proporcional de cada tipo de polígono al cuadrado.
*/

--SAMPLE USAGE:
/*
WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',25830),'Urbano'))

SELECT l_simpsondiversityindex(geom) As l_simpsondiversityindex FROM patches;
*/


CREATE OR REPLACE FUNCTION l_simpsondiversityindex(geom geometry)
RETURNS double precision AS 
$$

SELECT POWER(1-SUM(DISTINCT St_Perimeter(geom))*100/(SELECT SUM(St_Perimeter(geom))), 2);

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION l_simpsondiversityindex(geom geometry) IS 'Resta 1 menos la suma de todas las categorías, la abundancia proporcional de cada categoría al cuadrado.';
