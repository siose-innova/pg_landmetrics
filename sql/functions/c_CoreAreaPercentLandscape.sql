/*
test
Core Area Percentage Landscape - devuelve la suma de los núcleos de las áreas (m²) de cada polígono correspondiente al tipo de polígono, dividido por el total del área (m²) del paisaje, multiplicado por 100 (unidades: Porcentaje).
*/

-- SAMPLE USAGE:
/*
SELECT lm.c_coreareapercentlandscape(geom, category) As c_coreareapercentlandscape, category FROM lm.sample_patches;
*/


CREATE OR REPLACE FUNCTION lm.c_coreareapercentlandscape(geom geometry, category text)
RETURNS lm.simple_metric AS 
$$

SELECT ('Core Area Percentage Landscape'::text, (SUM(St_Area(St_Buffer(geom, -100)))/SUM(St_Area(geom)))*100,'%'::text)::lm.simple_metric GROUP BY category;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.c_coreareapercentlandscape(geom geometry, category text) IS 'Suma las áreas de los núcleos de cada polígono de la misma categoría dividido por el total del área del paisaje, multiplicado por 100 para devolver un valor en porcentaje.';
