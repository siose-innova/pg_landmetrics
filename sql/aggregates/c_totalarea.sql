/*
Total Area - devuelve la suma de las áreas (m²) de todos los polígonos correspondientes al tipo de polígono, dividido por 10.000 (unidades: Hectáreas).
*/

/*
SAMPLE USAGE
SELECT c_totalarea_state(ARRAY[('Agricultural area',('Total Class Area'::text, 10, 'Ha.'::text))::labeled_metric], geom, category) FROM sample_patches_25830;
*/

CREATE OR REPLACE FUNCTION c_totalarea_state(
	current_state labeled_metric[],
	geom geometry,
	category text)
    RETURNS labeled_metric[]
    LANGUAGE 'sql'

AS 
$BODY$

WITH inputs AS (
    SELECT current_state AS cstate
), melt AS (
    SELECT unnest(cstate) AS m2 FROM inputs
    UNION 
    SELECT (category,('Total Class Area'::text, (p_area(geom)).value, 'Ha.'::text))::labeled_metric AS m2
), summarize AS (
    SELECT (m2).label, ((m2).metric).name, SUM(((m2).metric).value) AS value, ((m2).metric).units  FROM melt GROUP BY (m2).label, ((m2).metric).name, ((m2).metric).units
)
SELECT ARRAY(SELECT (label::text, (name, value, units))::labeled_metric FROM summarize);

$BODY$;




-- SAMPLE USAGE
-- SELECT c_totalarea(geom,category) FROM sample_patches_25830;
CREATE AGGREGATE c_totalarea(geometry, text)(
    SFUNC=c_totalarea_state,
    STYPE=labeled_metric[],
    INITCOND='{}'
);

COMMENT ON AGGREGATE c_totalarea(geom geometry, category text) IS 'Calcula la suma de las áreas de los polígonos de la misma categoría dividido por 10.000 para devolver un valor en Hectáreas.';
