/*
Patch Density
Descripción: devuelve el número de polígonos correspondientes a una categoría dividido por el área total (m²) del paisaje, multiplicado por 10,000 y 100 (unidades: Número por 100 hectáreas).
*/

--SAMPLE USAGE:
/*
SELECT lm.c_patchdensity(geom) As c_patchdensity
FROM (SELECT ST_GeomFromText('POLYGON((0 0, 0 10000, 10000 10000, 10000 0, 0 0))',25830)) As foo(geom);
*/


CREATE OR REPLACE FUNCTION lm.c_patchdensity(geom geometry, category_level text)
RETURNS double precision AS 
$$

SELECT (SUM(St_NumGeometries(geom))/SUM(St_Area(geom))*10000)*100 GROUP BY category_level;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.c_patchdensity(geom geometry, category_level text) IS 'Calcula el número de polígonos de la misma categoría dividido por el área total del paisaje, multiplicado por 10,000 y 100 para devolver un valor en número por 100 Hectáreas.';
