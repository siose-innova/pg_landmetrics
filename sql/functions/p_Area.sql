/*
Patch Area - devuelve la suma del área del polígono dividido por 10,000 (unidades: Hectáreas).
*/

--SAMPLE USAGE:
/*
SELECT lm.p_area(geom) As p_area FROM lm.sample_patches;
*/

CREATE OR REPLACE FUNCTION lm.p_area(geom geometry)
RETURNS lm.metric AS 
$$

SELECT ('Patch Area'::text, St_Area(geom)/10000, 'Ha.'::text)::lm.metric;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.p_area(geom geometry) IS 'Divide el área en metros cuadrados de un polígono por 10.000 para devolver un valor en Hectáreas.';
