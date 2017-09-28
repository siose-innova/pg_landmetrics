/*
Patch Perimeter - devuelve el perímetro del polígono, incluyendo algún vacío interno (unidades: Metros).
*/

--SAMPLE USAGE:
/*
SELECT lm.p_perimeter(geom) As p_perimeter FROM lm.sample_patches;
*/


CREATE OR REPLACE FUNCTION lm.p_perimeter(geom geometry)
RETURNS lm.simple_metric AS 
$$

SELECT ('Patch Perimeter'::text, St_Perimeter(geom),'m.'::text)::lm.simple_metric;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.p_perimeter(geom geometry) IS 'Calcula el perímetro de un polígono para devolver un valor en Metros.';
