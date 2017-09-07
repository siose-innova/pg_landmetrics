/*
Patch Area - devuelve la suma del área del polígono dividido por 10,000 (unidades: Hectáreas).
*/

--SAMPLE USAGE:
/*
WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',25830),'Urbano'))

SELECT lm.p_area(geom) As p_area FROM patches;
*/

CREATE OR REPLACE FUNCTION lm.p_area(geom geometry)
RETURNS double precision AS 
$$

SELECT St_Area(geom)/10000;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.p_area(geom geometry) IS 'Divide el área en metros cuadrados de un polígono por 10.000 para devolver un valor en Hectáreas.';
