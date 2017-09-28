/*
Core Area - devuelve el área interior del polígono que está más allá de la profundidad especificada del borde del perímetro del polígono, dividido por 10.000 (unidades: Hectáreas).
*/

--SAMPLE USAGE:
/*
SELECT lm.p_corearea(geom) As p_corearea FROM lm.sample_patches;
*/


CREATE OR REPLACE FUNCTION lm.p_corearea(geom geometry)
RETURNS lm.simple_metric AS 
$$

SELECT ('Core Area'::text, St_Area(St_Buffer(geom, -100))/10000, 'Ha.'::text)::lm.simple_metric;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.p_corearea(geom geometry) IS 'Calcula el área interior del polígono dividido por 10.000 para devolver un valor en Hectáreas.';
