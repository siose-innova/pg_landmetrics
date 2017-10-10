/*
Shannon's Diversity Index - devuelve menos la suma, de todas las categorías de los polígonos, la abundancia proporcional de cada tipo de polígono multiplicado por esa proporción.
*/

--SAMPLE USAGE:
/*
WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',25830),'Urbano'))

SELECT l_shannondiversityindex(geom) As l_shannondiversityindex FROM patches;
*/


CREATE OR REPLACE FUNCTION l_shannondiversityindex(geom geometry)
RETURNS double precision AS 
$$

SELECT -1*SUM(DISTINCT St_Perimeter(geom))*100/(SELECT SUM(St_Perimeter(geom))*ln(SUM(DISTINCT St_Perimeter(geom))*100/(SELECT SUM(St_Perimeter(geom)))));

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION l_shannondiversityindex(geom geometry) IS 'Menos la suma de todas las categorías, la abundancia proporcional de cada categoría multiplicado por la proporción.';
