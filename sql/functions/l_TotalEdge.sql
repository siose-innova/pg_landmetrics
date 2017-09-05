/*
Total Edge
Descripción: devuelve la suma de las longitudes (m) de todos los segmentos de los bordes en el paisaje.
*/

--SAMPLE USAGE:
/*
SELECT lm.l_totaledge(geom) As l_totaledge
FROM (SELECT ST_GeomFromText('POLYGON((0 0, 0 10000, 10000 10000, 10000 0, 0 0))',25830)) As foo(geom);
*/


CREATE OR REPLACE FUNCTION lm.l_totaledge(geom geometry)
RETURNS double precision AS 
$$

SELECT SUM(St_Perimeter(geom))/10000;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.l_totaledge(geom geometry) IS 'Suma las longitudes de todos los bordes del paisaje.';
