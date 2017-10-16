/*
Patch Perimeter - devuelve el perímetro del polígono, incluyendo algún vacío interno (unidades: Metros).
*/

--SAMPLE USAGE:
/*
SELECT p_perimeter(geom) As p_perimeter FROM sample_patches;
*/


CREATE OR REPLACE FUNCTION p_perimeter(geom geometry)
RETURNS metric AS 
$$

SELECT ('Patch Perimeter'::text, St_Perimeter(geom),'m.'::text)::metric;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION p_perimeter(geom geometry) IS 'Calcula el perímetro de un polígono para devolver un valor en Metros.';
