/*
Patch Density
Descripción: devuelve el número de polígonos del paisaje dividido por el área total (m²) del paisaje, multiplicado por 10.000 (unidades: Número por 100 hectáreas).
*/

--SAMPLE USAGE:
/*
SELECT lm.l_patchdensity(geom) FROM lm.sample_patches;
*/


CREATE OR REPLACE FUNCTION lm.l_patchdensity_state(lm.simple_metric, geometry)
    RETURNS lm.simple_metric AS
$$

	SELECT ('Patch Density'::text, ($1).value + ((SUM(St_NumGeometries($2))/SUM(St_Area($2)))*10000)*100, ''::text)::lm.simple_metric;
$$
LANGUAGE 'sql' IMMUTABLE;


CREATE AGGREGATE lm.l_patchdensity(geometry)(
    SFUNC=lm.l_patchdensity_state,
    STYPE=lm.simple_metric,
    INITCOND='("Patch Density",0,"")'
);

COMMENT ON AGGREGATE lm.l_patchdensity(geometry) IS 'Calcula el número total de polígonos en el paisaje dividido por el área total del paisaje multiplicado por 10.000 para devolver un valor en número por 100 Hectáreas.';
