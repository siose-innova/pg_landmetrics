/*
Patch Density - devuelve el número de polígonos correspondientes a una categoría dividido por el área total (m²) del paisaje, multiplicado por 10.000 y 100 (unidades: Número por 100 hectáreas).
*/

--SAMPLE USAGE:
/*
SELECT lm.c_patchdensity(geom, category) As c_patchdensity, category FROM lm.sample_patches;
*/


CREATE OR REPLACE FUNCTION lm.c_patchdensity(geom geometry, category text)
RETURNS lm.metric AS 
$$

SELECT ('Patch Density'::text, ((SUM(St_NumGeometries(geom))/SUM(St_Area(geom)))*10000)*100,'por 100 Hectáreas'::text)::lm.metric GROUP BY category;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.c_patchdensity(geom geometry, category text) IS 'Calcula el número de polígonos de la misma categoría dividido por el área total del paisaje, multiplicado por 10.000 y 100 para devolver un valor en número por 100 Hectáreas.';

