/*
Edge Density - devuelve la suma de las longitudes (m) de todos los segmentos del paisaje dividido por el área total (m²) del paisaje, multiplicado por 10,000 (unidades: Metros por hectárea).
*/

--SAMPLE USAGE:
/*
SELECT lm.l_edgedensity(geom) FROM lm.sample_patches;
*/


CREATE OR REPLACE FUNCTION lm.l_edgedensity_state(lm.metric, geometry)
    RETURNS lm.metric AS 
$$

	SELECT ('Edge Density'::text, ($1).value + SUM(St_Perimeter($2)/St_Area($2))*10000, 'm/Ha'::text)::lm.metric;
$$
LANGUAGE 'sql' IMMUTABLE;


CREATE AGGREGATE lm.l_edgedensity(geometry)(
    SFUNC=lm.l_edgedensity_state,
    STYPE=lm.metric,
    INITCOND='("Edge Density",0,"m/Ha")'
);

COMMENT ON AGGREGATE lm.l_edgedensity(geometry) IS 'Suma las longitudes de todos los bordes del paisaje dividido por el área total del paisaje multiplicado por 10,000 para devolver un valor en metros por Hectárea.';
