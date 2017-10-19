/*
Patch Perimeter - devuelve el perímetro del polígono, incluyendo algún vacío interno (unidades: Metros).
*/

-- SAMPLE USAGE:
/*
SELECT (p_perimeter(geom)).value FROM sample_patches_25830;
SELECT (p_perimeter(geom)).value FROM sample_patches_4326;
*/


CREATE OR REPLACE FUNCTION p_perimeter(geom geometry)
RETURNS metric AS 
$$

SELECT (2, St_Perimeter(geom))::metric;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION p_perimeter(geom geometry) IS 'Calcula el perímetro de un polígono para devolver un valor en Metros.';




CREATE OR REPLACE FUNCTION p_perimeter(geom geography)
RETURNS metric AS 
$$

SELECT (2, St_Perimeter(geom))::metric;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION p_perimeter(geom geography) IS 'Calcula el perímetro de un polígono para devolver un valor en Metros.';
