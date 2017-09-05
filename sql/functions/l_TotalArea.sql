/*
Total Area
Descripción: devuelve el total del área (m²) del paisaje dividido por 10,000 (unidades: Hectáreas).
*/

--SAMPLE USAGE:
/*
SELECT lm.l_totalarea(geom) As l_totalarea
FROM (SELECT ST_GeomFromText('POLYGON((0 0, 0 10000, 10000 10000, 10000 0, 0 0))',25830)) As foo(geom);
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
