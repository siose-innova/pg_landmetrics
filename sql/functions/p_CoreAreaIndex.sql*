/*
Core Area Index - devuelve el área del núcleo del polígono (m²) dividido por el área total del polígono (m²), multiplicado por 100 (unidades: Porcentaje).
*/

--SAMPLE USAGE:
/*
SELECT p_coreareaindex(geom) As p_coreareaindex FROM sample_patches;
*/


CREATE OR REPLACE FUNCTION p_coreareaindex(geom geometry)
RETURNS metric AS 
$$

SELECT ('Core Area Index'::text, (St_Area(St_Buffer(geom, -100))/St_Area(geom))*100, '%'::text)::metric;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION p_coreareaindex(geom geometry) IS 'Calcula el área del núcleo dividido por el área total del polígono, multiplicado por 100 para devolver un valor en porcentaje.';
