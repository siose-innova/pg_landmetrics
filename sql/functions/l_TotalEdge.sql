/*
Total Edge - devuelve la suma de las longitudes (m) de todos los segmentos de los bordes en el paisaje.
*/

--SAMPLE USAGE:
/*
WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',25830),'Urbano'))

SELECT lm.l_totaledge(geom) As l_totaledge FROM patches;
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
