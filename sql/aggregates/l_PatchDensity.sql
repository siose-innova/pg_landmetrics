/*
Patch Density
Descripción: devuelve el número de polígonos del paisaje dividido por el área total (m²) del paisaje, multiplicado por 10.000 y por 100 (para convertirlo a hectáreas) (unidades: Número por 100 hectáreas).
*/

-- SAMPLE USAGE:
/*
SELECT (l_patchdensity(geom)).value FROM sample_patches_25830;
SELECT (l_patchdensity(geom)).value FROM sample_patches_4326;
*/


CREATE OR REPLACE FUNCTION l_patchdensity_state(point, geometry)
    RETURNS point AS
$$
	SELECT point($1[0] + 1, $1[1] + St_Area($2));

$$
LANGUAGE 'sql';



CREATE OR REPLACE FUNCTION l_patchdensity_final(point)
    RETURNS metric AS
$$
	SELECT (21, (($1[0] / $1[1])*10000)*100)::metric;
$$
LANGUAGE 'sql';



CREATE AGGREGATE l_patchdensity(geometry)(
    SFUNC=l_patchdensity_state,
    STYPE=point,
    INITCOND='(0,0)',
    finalfunc = l_patchdensity_final
);

COMMENT ON AGGREGATE l_patchdensity(geometry) IS 'Calcula el número total de polígonos en el paisaje dividido por el área total del paisaje multiplicado por 10.000 para devolver un valor en número por 100 Hectáreas.';
