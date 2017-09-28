/*
Core Area Index - devuelve el área del núcleo del polígono (m²) dividido por el área total del polígono (m²), multiplicado por 100 (unidades: Porcentaje).
*/

--SAMPLE USAGE:
/*
SELECT lm.p_coreareaindex(geom) As p_coreareaindex FROM lm.sample_patches;
*/


CREATE OR REPLACE FUNCTION lm.p_coreareaindex(geom geometry)
RETURNS lm.simple_metric AS 
$$

SELECT ('Core Area Index'::text, (St_Area(St_Buffer(geom, -100))/St_Area(geom))*100, '%'::text)::lm.simple_metric;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.p_coreareaindex(geom geometry) IS 'Calcula el área del núcleo dividido por el área total del polígono, multiplicado por 100 para devolver un valor en porcentaje.';
