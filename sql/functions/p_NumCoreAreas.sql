/*
Number of Core Areas - devuelve el número de núcleos de las áreas disyuntivas que contiene el límite de un polígono.
*/

--SAMPLE USAGE:
/*
SELECT lm.p_numcoreareas(geom) As p_numcoreareas FROM lm.sample_patches;
*/


CREATE OR REPLACE FUNCTION lm.p_numcoreareas(geom geometry)
RETURNS lm.simple_metric AS 
$$

SELECT ('Number of Core Areas'::text, St_NumGeometries(St_Buffer(geom, -100)),'')::lm.simple_metric;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION lm.p_numcoreareas(geom geometry) IS 'Cuenta el número de núcleos de las áreas disyuntivas de un polígono.';
