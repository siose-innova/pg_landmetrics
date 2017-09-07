/*
Patch Density - devuelve el número de polígonos correspondientes a una categoría dividido por el área total (m²) del paisaje, multiplicado por 10,000 y 100 (unidades: Número por 100 hectáreas).
*/

--SAMPLE USAGE:
/*
WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',25830),'Urbano'))

SELECT lm.c_patchdensity(geom, categ) As c_patchdensity, categ FROM patches;
*/


CREATE OR REPLACE FUNCTION lm.c_patchdensity(geom geometry, categ text)
RETURNS double precision AS 
$$

SELECT (SUM(St_NumGeometries(geom))/SUM(St_Area(geom))*10000)*100 GROUP BY categ;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.c_patchdensity(geom geometry, categ text) IS 'Calcula el número de polígonos de la misma categoría dividido por el área total del paisaje, multiplicado por 10,000 y 100 para devolver un valor en número por 100 Hectáreas.';
