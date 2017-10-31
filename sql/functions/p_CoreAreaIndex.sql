/*
Core Area Index - devuelve el área del núcleo del polígono (m²) dividido por el área total del polígono (m²), multiplicado por 100 (unidades: Porcentaje).
*/

-- SAMPLE USAGE:
/*
SELECT (p_coreareaindex(geom, 50)).value FROM sample_patches_25830;
SELECT (p_coreareaindex(geom, 50)).value FROM sample_patches_4326;
*/


CREATE OR REPLACE FUNCTION p_coreareaindex(geom geometry, buffer numeric)
RETURNS metric AS 
$$

SELECT (7, (St_Area(St_Buffer(geom, -$2))/St_Area(geom))*100)::metric;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION p_coreareaindex(geom geometry, buffer numeric) IS 'Calcula el área del núcleo dividido por el área total del polígono, multiplicado por 100 para devolver un valor en porcentaje.';




CREATE OR REPLACE FUNCTION p_coreareaindex(geom geography, buffer numeric)
RETURNS metric AS 
$$

SELECT (7, (St_Area(St_Buffer(geom, -$2))/St_Area(geom))*100)::metric;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION p_coreareaindex(geom geography, buffer numeric) IS 'Calcula el área del núcleo dividido por el área total del polígono, multiplicado por 100 para devolver un valor en porcentaje.';
