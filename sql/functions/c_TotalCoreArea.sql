/*
Total Core Area - devuelve la suma de los núcleos de las áreas (m²) de cada polígono correspondiente al tipo de polígono, dividido por 10,000 (unidades: Hectáreas).
*/

--SAMPLE USAGE:
/*
WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',25830),'Urbano'))

SELECT lm.c_totalcorearea(geom, categ) As c_totalcorearea, categ FROM patches;
*/


CREATE OR REPLACE FUNCTION lm.c_totalcorearea(geom geometry, categ text)
RETURNS double precision AS 
$$

SELECT SUM(St_Area(St_Buffer(geom, -100)))/10000 GROUP BY categ;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.c_totalcorearea(geom geometry, categ text) IS 'Suma las áreas de los núcleos de cada polígono de la misma categoría dividido por 10,000 para devolver un valor en Hectáreas.';
