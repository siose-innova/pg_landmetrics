/*
Edge Density - devuelve la suma de las longitudes (m) de todos los segmentos de los bordes correspondientes al tipo de polígono dividido por el total del área (m²) del paisaje, multiplicado por 10.000 (unidades: metros por Hectárea).
*/

--SAMPLE USAGE:
/*
SELECT lm.c_edgedensity(geom, category) As c_edgedensity, category FROM lm.sample_patches;
*/


CREATE OR REPLACE FUNCTION lm.c_edgedensity(geom geometry, category text)
RETURNS lm.metric AS 
$$

SELECT ('Edge Density'::text, (SUM(St_Perimeter(geom))/SUM(St_Area(geom)))*10000,'metros por Hectárea.'::text)::lm.metric GROUP BY category;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.c_edgedensity(geom geometry, category text) IS 'Suma de las longitudes de los bordes de los polígonos de la misma categoría dividido por el total del área, multiplicado por 10.000 para devolver un valor en metros por Hectárea.';
