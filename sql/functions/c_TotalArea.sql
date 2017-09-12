/*
Total Area - devuelve la suma de las áreas (m²) de todos los polígonos correspondientes al tipo de polígono, dividido por 10,000 (unidades: Hectáreas).
*/

--SAMPLE USAGE:
/*
WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',25830),'Urbano'))

SELECT lm.c_totalarea(geom, categ) As c_totalarea, categ FROM patches;
*/


CREATE OR REPLACE FUNCTION lm.c_totalarea(geom geometry, categ text)
RETURNS double precision AS 
$$

SELECT SUM(St_Area(geom))/10000 GROUP BY categ;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.c_totalarea(geom geometry, categ text) IS 'Calcula la suma de las áreas de los polígonos de la misma categoría dividido por 10,000 para devolver un valor en Hectáreas.';
