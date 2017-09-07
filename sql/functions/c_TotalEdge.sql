/*
Total Edge - devuelve la suma de las longitudes (m) de todos los segmentos de los bordes correspondientes al tipo de polígono (categoría) (unidades: Metros).
*/

--SAMPLE USAGE:
/*
WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',25830),'Urbano'))

SELECT lm.c_totaledge(geom, categ) As c_totaledge, categ FROM patches;
*/


CREATE OR REPLACE FUNCTION lm.c_totaledge(geom geometry, categ text)
RETURNS double precision AS 
$$

SELECT SUM(St_Perimeter(geom)) GROUP BY categ;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.c_totaledge(geom geometry, categ text) IS 'Suma de las longitudes de los bordes de los polígonos de la misma categoría para devolver un valor en Metros.';
