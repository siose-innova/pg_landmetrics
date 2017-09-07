/*
Core Area - devuelve el área interior del polígono que está más allá de la profundidad especificada del borde del perímetro del polígono, dividido por 10,000 (unidades: Hectáreas).
*/

--SAMPLE USAGE:
/*
WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',25830),'Urbano'))

SELECT lm.p_corearea(geom) As p_corearea FROM patches;
*/


CREATE OR REPLACE FUNCTION lm.p_corearea(geom geometry)
RETURNS double precision AS 
$$

SELECT St_Area(St_Buffer(geom, -100))/10000;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.p_corearea(geom geometry) IS 'Calcula el área interior del polígono dividido por 10,000 para devolver un valor en Hectáreas.';
