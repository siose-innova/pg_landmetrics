/*
Percentage of Landscape - devuelve la suma de las áreas (m²) de todos los polígonos correspondientes al tipo de polígono dividido por el área total (m²) del paisaje, multiplicado por 100 (unidades: Porcentaje).
*/

--SAMPLE USAGE:
/*
WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',25830),'Urbano'))

SELECT lm.c_percentagelandscape(geom, categ) As c_percentagelandscape, categ FROM patches;
*/


CREATE OR REPLACE FUNCTION lm.c_percentagelandscape(geom geometry, categ text)
RETURNS double precision AS 
$$

SELECT (SUM(St_Area(geom))/SUM(St_Area(geom)))*100 GROUP BY categ;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.c_percentagelandscape(geom geometry, categ text) IS 'Calcula la suma de las áreas de los polígonos de la misma categoría dividido por el área total del paisaje, multiplicado por 100 para devolver un valor en porcentaje.';
