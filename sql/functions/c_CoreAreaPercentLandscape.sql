/*
Core Area Percentage Landscape - devuelve la suma de los núcleos de las áreas (m²) de cada polígono correspondiente al tipo de polígono, dividido por el total del área (m²) del paisaje, multiplicado por 100 (unidades: Porcentaje).
*/

--SAMPLE USAGE:
/*
WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',25830),'Urbano'))

SELECT lm.c_coreareapercentlandscape(geom, categ) As c_coreareapercentlandscape, categ FROM patches;
*/


CREATE OR REPLACE FUNCTION lm.c_coreareapercentlandscape(geom geometry, categ text)
RETURNS double precision AS 
$$

SELECT (SUM(St_Area(St_Buffer(geom, -100)))/SUM(St_Area(geom)))*100 GROUP BY categ;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.c_coreareapercentlandscape(geom geometry, categ text) IS 'Suma las áreas de los núcleos de cada polígono de la misma categoría dividido por el total del área del paisaje, multiplicado por 100 para devolver un valor en porcentaje.';
