/*
Total Area - devuelve la suma de las áreas (m²) de todos los polígonos correspondientes al tipo de polígono, dividido por 10.000 (unidades: Hectáreas).
*/

--SAMPLE USAGE:
/*
SELECT lm.c_totalarea(geom, category) As c_totalarea, category FROM lm.sample_patches;
*/


CREATE OR REPLACE FUNCTION lm.c_totalarea(geom geometry, category text)
RETURNS lm.metric AS 
$$

SELECT ('Total Area'::text, SUM(St_Area(geom))/10000,'Hectáreas.'::text)::lm.metric GROUP BY category;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.c_totalarea(geom geometry, category text) IS 'Calcula la suma de las áreas de los polígonos de la misma categoría dividido por 10.000 para devolver un valor en Hectáreas.';

