/*
Percentage of Landscape - devuelve la suma de las áreas (m²) de todos los polígonos correspondientes al tipo de polígono dividido por el área total (m²) del paisaje, multiplicado por 100 (unidades: Porcentaje).
*/

--SAMPLE USAGE:
/*
SELECT lm.c_percentagelandscape(geom, category) As c_percentagelandscape, category FROM lm.sample_patches;
*/


CREATE OR REPLACE FUNCTION lm.c_percentagelandscape(geom geometry, category text)
RETURNS lm.metric AS 
$$

SELECT ('Percentage of Landscape'::text, (SUM(St_Area(geom))/SUM(St_Area(geom)))*100,'%'::text)::lm.metric GROUP BY category;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.c_percentagelandscape(geom geometry, category text) IS 'Calcula la suma de las áreas de los polígonos de la misma categoría dividido por el área total del paisaje, multiplicado por 100 para devolver un valor en porcentaje.';

