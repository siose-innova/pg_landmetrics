/*
Patch Density
Descripción: devuelve el número de polígonos del paisaje dividido por el área total (m²) del paisaje, multiplicado por 10,000 (unidades: Número por 100 hectáreas).
*/

--SAMPLE USAGE:
/*
WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',25830),'Urbano'))

SELECT lm.l_patchdensity(geom) As l_patchdensity FROM patches;
*/


CREATE OR REPLACE FUNCTION lm.l_patchdensity(geom geometry)
RETURNS double precision AS 
$$

SELECT ((SUM(St_NumGeometries(geom))/SUM(St_Area(geom)))*10000)*100;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.l_patchdensity(geom geometry) IS 'Calcula el número total de polígonos en el paisaje dividido por el área total del paisaje multiplicado por 10,000 para devolver un valor en número por 100 Hectáreas.';
