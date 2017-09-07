/*
Patch Perimeter - devuelve el perímetro del polígono, incluyendo algún vacío interno (unidades: Metros).
*/

--SAMPLE USAGE:
/*
WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',25830),'Urbano'))

SELECT lm.p_perimeter(geom) As p_perimeter FROM patches;
*/


CREATE OR REPLACE FUNCTION lm.p_perimeter(geom geometry)
RETURNS double precision AS 
$$

SELECT St_Perimeter(geom);

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.p_perimeter(geom geometry) IS 'Calcula el perímetro de un polígono para devolver un valor en Metros.';
