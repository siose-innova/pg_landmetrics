/*
Total Area - devuelve la suma de las áreas (m²) de todos los polígonos correspondientes al tipo de polígono, dividido por 10.000 (unidades: Hectáreas).
*/

-- SAMPLE USAGE
/*
SELECT c_totalarea_state(ARRAY[('Agricultural area',('Total Class Area'::text, 10, 'Ha.'::text))::labeled_metric], geom, category) FROM sample_patches_25830;
*/

CREATE OR REPLACE FUNCTION c_totalarea_state(
	current_state metric_labeled,
	geom geometry,
	category text)
    RETURNS metric_labeled
    LANGUAGE 'sql'

AS 
$BODY$

WITH inputs AS (
    	SELECT current_state AS cstate
), melt AS (
    	SELECT unnest((cstate).pairs) AS m2 FROM inputs
    	UNION 
	SELECT (category, (p_area(geom)).value)::metric_labeled_pair AS m2
), summarize AS (
	SELECT (m2).label, SUM((m2).value) AS value FROM melt GROUP BY (m2).label
)
SELECT (9, ARRAY(SELECT (label, value)::metric_labeled_pair FROM summarize))::metric_labeled;

$BODY$;


-- SAMPLE USAGE
-- SELECT c_totalarea(geom,category) FROM sample_patches_25830;

CREATE AGGREGATE c_totalarea(geometry, text)(
    SFUNC=c_totalarea_state,
    STYPE=metric_labeled,
    INITCOND='(9,{})'
);

COMMENT ON AGGREGATE c_totalarea(geom geometry, category text) IS 'Calcula la suma de las áreas de los polígonos de la misma categoría dividido por 10.000 para devolver un valor en Hectáreas.';
