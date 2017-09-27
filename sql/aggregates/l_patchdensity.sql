/*
Patch Density
Descripción: devuelve el número de polígonos del paisaje dividido por el área total (m²) del paisaje, multiplicado por 10,000 (unidades: Número por 100 hectáreas).
*/

--SAMPLE USAGE:
/*
SELECT lm.l_patchdensity(geom) FROM lm.sample_patches;
*/


CREATE OR REPLACE FUNCTION lm.l_patchdensity_state(lm.metric, geometry)
    RETURNS lm.metric AS
$$

	SELECT ('Patch Density'::text, ($1).value + ((SUM(St_NumGeometries($2))/SUM(St_Area($2)))*10000)*100, ''::text)::lm.metric;
$$
LANGUAGE 'sql' IMMUTABLE;


CREATE AGGREGATE lm.l_patchdensity(geometry)(
    SFUNC=lm.l_patchdensity_state,
    STYPE=lm.metric,
    INITCOND='("Patch Density",0,"")'
);

COMMENT ON AGGREGATE lm.l_patchdensity(geometry) IS 'Calcula el número total de polígonos en el paisaje dividido por el área total del paisaje multiplicado por 10,000 para devolver un valor en número por 100 Hectáreas.';
