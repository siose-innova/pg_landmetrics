/*
Edge Density - devuelve la suma de las longitudes (m) de todos los segmentos del paisaje dividido por el área total (m²) del paisaje, multiplicado por 10.000 (unidades: Metros por hectárea).
*/

-- SAMPLE USAGE:
/*
SELECT (l_edgedensity(geom)).value FROM sample_patches_25830;
SELECT (l_edgedensity(geom)).value FROM sample_patches_4326;
*/



CREATE OR REPLACE FUNCTION l_edgedensity_state(point, geometry)
    RETURNS point AS
$$
	SELECT point($1[0] + 1, $1[1] + (St_Perimeter($2)/St_Area($2)));

$$
LANGUAGE 'sql';



CREATE OR REPLACE FUNCTION l_edgedensity_final(point)
    RETURNS metric AS
$$
	SELECT (19, (($1[0] / $1[1])*10000))::metric;
$$
LANGUAGE 'sql';



CREATE AGGREGATE l_edgedensity(geometry)(
    SFUNC=l_edgedensity_state,
    STYPE=point,
    INITCOND='(0,0)',
    finalfunc = l_edgedensity_final
);

COMMENT ON AGGREGATE l_edgedensity(geometry) IS 'Suma las longitudes de todos los bordes del paisaje dividido por el área total del paisaje multiplicado por 10.000 para devolver un valor en metros por Hectárea.';





CREATE OR REPLACE FUNCTION l_edgedensity_state(point, geography)
    RETURNS point AS
$$
	SELECT point($1[0] + 1, $1[1] + (St_Perimeter($2)/St_Area($2)));

$$
LANGUAGE 'sql';



CREATE OR REPLACE FUNCTION l_edgedensity_final(point)
    RETURNS metric AS
$$
	SELECT (19, (($1[0] / $1[1])*10000))::metric;
$$
LANGUAGE 'sql';



CREATE AGGREGATE l_edgedensity(geography)(
    SFUNC=l_edgedensity_state,
    STYPE=point,
    INITCOND='(0,0)',
    finalfunc = l_edgedensity_final
);

COMMENT ON AGGREGATE l_edgedensity(geography) IS 'Suma las longitudes de todos los bordes del paisaje dividido por el área total del paisaje multiplicado por 10.000 para devolver un valor en metros por Hectárea.';
