/*
Total Area - devuelve el total del área (m²) del paisaje dividido por 10,000 (unidades: Hectáreas).
*/

--SAMPLE USAGE:
/*
WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',25830),'Urbano'))

SELECT lm.l_totalarea(geom) As l_totalarea FROM patches;
*/


CREATE OR REPLACE FUNCTION lm.l_totalarea(geom geometry)
RETURNS double precision AS 
$$

SELECT SUM(St_Area(geom))/10000;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.l_totalarea(geom geometry) IS 'Calcula el área total del paisaje dividido por 10,000 para devolver un valor en Hectáreas.';
