/*
Patch Area - devuelve la suma del área del polígono dividido por 10.000 (unidades: Hectáreas).
*/

--SAMPLE USAGE:
/*
SELECT p_area(geom) As p_area FROM sample_patches;
*/

CREATE OR REPLACE FUNCTION p_area(geom geometry)
RETURNS metric AS 
$$

SELECT ('Patch Area'::text, St_Area(geom)/10000, 'Ha.'::text)::metric;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION p_area(geom geometry) IS 'Divide el área en metros cuadrados de un polígono por 10.000 para devolver un valor en Hectáreas.';
