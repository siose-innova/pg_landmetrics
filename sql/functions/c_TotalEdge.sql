/*
Total Edge - devuelve la suma de las longitudes (m) de todos los segmentos de los bordes correspondientes al tipo de polígono (categoría) (unidades: Metros).
*/

--SAMPLE USAGE:
/*
SELECT lm.c_totaledge(geom, category) As c_totaledge, category FROM lm.sample_patches;
*/


CREATE OR REPLACE FUNCTION lm.c_totaledge(geom geometry, category text)
RETURNS lm.metric AS 
$$

SELECT ('Total Edge'::text, SUM(St_Perimeter(geom)),'Metros.'::text)::lm.metric GROUP BY category;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.c_totaledge(geom geometry, category text) IS 'Suma de las longitudes de los bordes de los polígonos de la misma categoría para devolver un valor en Metros.';

