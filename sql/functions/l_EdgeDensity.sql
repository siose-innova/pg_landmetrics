/*
Edge Density - devuelve la suma de las longitudes (m) de todos los segmentos del paisaje dividido por el área total (m²) del paisaje, multiplicado por 10,000 (unidades: Metros por hectárea).
*/

--SAMPLE USAGE:
/*
WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',25830),'Urbano'))

SELECT lm.l_edgedensity(geom) As l_edgedensity FROM patches;
*/


CREATE OR REPLACE FUNCTION lm.l_edgedensity(geom geometry)
RETURNS double precision AS 
$$

SELECT SUM(St_Perimeter(geom)/St_Area(geom))*10000;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.l_edgedensity(geom geometry) IS 'Suma las longitudes de todos los bordes del paisaje dividido por el área total del paisaje multiplicado por 10,000 para devolver un valor en metros por Hectárea.';
