/*
Number of Core Areas - devuelve el número de núcleos de las áreas disyuntivas que contiene el límite de un polígono.
*/

-- SAMPLE USAGE:
/*
SELECT (p_numcoreareas(geom, 50)).value FROM sample_patches_25830;
SELECT (p_numcoreareas(geom, 50)).value FROM sample_patches_4326;
*/


CREATE OR REPLACE FUNCTION p_numcoreareas(geom geometry, buffer numeric)
RETURNS metric AS 
$$

SELECT (6, St_NumGeometries(St_Buffer(geom, -$2)))::metric;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION p_numcoreareas(geom geometry, buffer numeric) IS 'Cuenta el número de núcleos de las áreas disyuntivas de un polígono.';




CREATE OR REPLACE FUNCTION p_numcoreareas(geom geography, buffer numeric)
RETURNS metric AS 
$$

SELECT (6, St_NumGeometries(St_Buffer(geom, -$2)::geometry))::metric;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION p_numcoreareas(geom geography, buffer numeric) IS 'Cuenta el número de núcleos de las áreas disyuntivas de un polígono.';
