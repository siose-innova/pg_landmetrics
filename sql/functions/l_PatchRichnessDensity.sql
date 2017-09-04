/*
Patch Richness Density
Descripción: devuelve el número de las diferentes categorías de polígonos presentes dentro del límite del paisaje dividido por el área total (m²) del paisaje, multiplicado por 10,000 y 100 (unidades: número por 100 hectáreas).
*/

--SAMPLE USAGE:
/*
SELECT lm.l_patchrichnessdensity(geom) As l_patchrichnessdensity
FROM (SELECT ST_GeomFromText('POLYGON((0 0, 0 10000, 10000 10000, 10000 0, 0 0))',25830)) As foo(geom);
*/

CREATE OR REPLACE FUNCTION lm.l_patchrichnessdensity(geom geometry, category_level text)
RETURNS double precision AS 
$$

SELECT ((COUNT(DISTINCT category_level)/SUM(St_Area(geom)))*10000)*100;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.l_patchrichnessdensity(geom geometry, category_level text) IS 'Número total de las distintas categorías del paisaje entre el área total por 10,000 y 100 para devolver un resultado en número por 100 Hectáreas.';
