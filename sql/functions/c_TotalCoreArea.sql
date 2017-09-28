/*
Total Core Area - devuelve la suma de los núcleos de las áreas (m²) de cada polígono correspondiente al tipo de polígono, dividido por 10.000 (unidades: Hectáreas).
*/

--SAMPLE USAGE:
/*
SELECT lm.c_totalcorearea(geom, category) As c_totalcorearea, category FROM lm.sample_patches;
*/


CREATE OR REPLACE FUNCTION lm.c_totalcorearea(geom geometry, category text)
RETURNS lm.metric AS 
$$

SELECT ('Total Core Area'::text, SUM(St_Area(St_Buffer(geom, -100)))/10000,'Hectáreas.'::text)::lm.metric GROUP BY category;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.c_totalcorearea(geom geometry, category text) IS 'Suma las áreas de los núcleos de cada polígono de la misma categoría dividido por 10.000 para devolver un valor en Hectáreas.';

