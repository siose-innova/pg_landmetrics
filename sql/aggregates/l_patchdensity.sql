/*
Patch Density
Descripción: devuelve el número de polígonos del paisaje dividido por el área total (m²) del paisaje, multiplicado por 10.000 (unidades: Número por 100 hectáreas).
*/

--SAMPLE USAGE:
/*
SELECT l_patchdensity(geom) FROM sample_patches;
*/


CREATE OR REPLACE FUNCTION l_patchdensity_state(metric, geometry)
    RETURNS metric AS
$$

	SELECT ('Patch Density'::text, ($1).value + ((SUM(St_NumGeometries($2))/SUM(St_Area($2)))*10000)*100, ''::text)::metric;
$$
LANGUAGE 'sql' IMMUTABLE;


CREATE AGGREGATE l_patchdensity(geometry)(
    SFUNC=l_patchdensity_state,
    STYPE=metric,
    INITCOND='("Patch Density",0,"")'
);

COMMENT ON AGGREGATE l_patchdensity(geometry) IS 'Calcula el número total de polígonos en el paisaje dividido por el área total del paisaje multiplicado por 10.000 para devolver un valor en número por 100 Hectáreas.';
