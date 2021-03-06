/*
Patch Area - devuelve la suma del área del polígono dividido por 10.000 (unidades: Hectáreas).
*/

-- SAMPLE USAGE:
/*
SELECT (p_area(geom)).value As p_area FROM sample_patches_25830;
SELECT (p_area(geom)).value As p_area FROM sample_patches_4326;
*/


CREATE OR REPLACE FUNCTION p_area(geom geometry)
RETURNS metric AS 
$$

SELECT (1, St_Area(geom)/10000)::metric;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION p_area(geom geometry) IS 'Divide el área en metros cuadrados de un polígono por 10.000 para devolver un valor en Hectáreas.';




CREATE OR REPLACE FUNCTION p_area(geom geography)
RETURNS metric AS 
$$

SELECT (1, St_Area(geom)/10000)::metric;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION p_area(geom geography) IS 'Divide el área en metros cuadrados de un polígono por 10.000 para devolver un valor en Hectáreas.';










CREATE OR REPLACE FUNCTION p_area(geom geometry, factor numeric)
RETURNS metric AS 
$$

SELECT (1, St_Area(geom)/$2)::metric;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION p_area(geom geometry) IS 'Calcula el área en metros cuadrados de un polígono.';




CREATE OR REPLACE FUNCTION p_area(geom geography, factor numeric)
RETURNS metric AS 
$$

SELECT (1, St_Area(geom)/$2)::metric;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION p_area(geom geography) IS 'Calcula el área en metros cuadrados de un polígono.';

