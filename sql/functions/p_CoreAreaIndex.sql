/*
Core Area Index - devuelve el área del núcleo del polígono (m²) dividido por el área total del polígono (m²), multiplicado por 100 (unidades: Porcentaje).
*/

--SAMPLE USAGE:
/*
WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',25830),'Urbano'))

SELECT lm.p_coreareaindex(geom) As p_coreareaindex FROM patches;
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
