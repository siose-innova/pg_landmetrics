/*
Patch Richness Density - devuelve el número de las diferentes categorías de polígonos presentes dentro del límite del paisaje dividido por el área total (m²) del paisaje, multiplicado por 10.000 y 100 (unidades: número por 100 hectáreas).
*/

--SAMPLE USAGE:
/*
WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',25830),'Urbano'))

SELECT l_patchrichnessdensity(geom, categ) As l_patchrichnessdensity, categ FROM patches;
*/

CREATE OR REPLACE FUNCTION l_patchrichnessdensity(geom geometry, categ text)
RETURNS double precision AS 
$$

SELECT ((COUNT(DISTINCT categ)/SUM(St_Area(geom)))*10000)*100;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION l_patchrichnessdensity(geom geometry, categ text) IS 'Número total de las distintas categorías del paisaje entre el área total por 10.000 y 100 para devolver un resultado en número por 100 Hectáreas.';
