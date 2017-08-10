/*
Core Area Index
Descripción: devuelve el área del núcleo del polígono (m²) dividido por el área total del polígono (m²), multiplicado por 100 (unidades: Porcentaje).
*/

--SAMPLE USAGE:
/*
SELECT lm.p_coreareaindex(geom) As p_coreareaindex
FROM (SELECT ST_GeomFromText('POLYGON((0 0, 0 10000, 10000 10000, 10000 0, 0 0))',25830)) As foo(geom);
*/


CREATE OR REPLACE FUNCTION lm.p_coreareaindex(geom geometry)
RETURNS double precision AS 
$$

SELECT (St_Area(St_Buffer(geom, -100))/St_Area(geom))*100;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.p_coreareaindex(geom geometry) IS 'Calcula el área del núcleo dividido por el área total del polígono, multiplicado por 100 para devolver un valor en porcentaje.';
