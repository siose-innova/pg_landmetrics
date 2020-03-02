/*
Total Area - devuelve la suma de las áreas (m²) de todos los polígonos correspondientes al tipo de polígono, dividido por 10.000 (unidades: Hectáreas).
*/

-- SAMPLE USAGE
/*
SELECT c_totalcorearea_state(ARRAY[('Agricultural area',('Total Class Area'::text, 10, 'Ha.'::text),50)::labeled_metric], geom, category) FROM sample_patches_25830;
SELECT c_totalcorearea_state(ARRAY[('Agricultural area',('Total Class Area'::text, 10, 'Ha.'::text),50)::labeled_metric], geom, category) FROM sample_patches_4326;
*/

CREATE OR REPLACE FUNCTION c_totalcorearea_state(
	current_state metric_labeled,
	geom geometry,
	category text,
	buffer numeric)
    RETURNS metric_labeled
    LANGUAGE 'sql'

AS 
$BODY$

WITH inputs AS (
    	SELECT current_state AS cstate
), melt AS (
    	SELECT unnest((cstate).pairs) AS m2 FROM inputs
    	UNION 
	SELECT (category, (p_corearea(geom)).value, buffer)::metric_labeled_pair AS m2
), summarize AS (
	SELECT (m2).label, SUM((m2).value) AS value FROM melt GROUP BY (m2).label
)
SELECT (13, ARRAY(SELECT (label, value)::metric_labeled_pair FROM summarize))::metric_labeled;

$BODY$;


-- SAMPLE USAGE
-- SELECT c_totalcorearea(geom,category,50) FROM sample_patches_25830;

CREATE AGGREGATE c_totalcorearea(geometry, text, numeric)(
    SFUNC=c_totalcorearea_state,
    STYPE=metric_labeled,
    INITCOND='(13,{})'
);

COMMENT ON AGGREGATE c_totalcorearea(geom geometry, category text, buffer numeric) IS 'Calcula la suma de las áreas de los polígonos de la misma categoría dividido por 10.000 para devolver un valor en Hectáreas.';





CREATE OR REPLACE FUNCTION c_totalcorearea_state(
	current_state metric_labeled,
	geom geography,
	category text,
	buffer numeric)
    RETURNS metric_labeled
    LANGUAGE 'sql'

AS 
$BODY$

WITH inputs AS (
    	SELECT current_state AS cstate
), melt AS (
    	SELECT unnest((cstate).pairs) AS m2 FROM inputs
    	UNION 
	SELECT (category, (p_corearea(geom)).value, buffer)::metric_labeled_pair AS m2
), summarize AS (
	SELECT (m2).label, SUM((m2).value) AS value FROM melt GROUP BY (m2).label
)
SELECT (13, ARRAY(SELECT (label, value)::metric_labeled_pair FROM summarize))::metric_labeled;

$BODY$;


-- SAMPLE USAGE
-- SELECT c_totalcorearea(geom,category,buffer) FROM sample_patches_4326;

CREATE AGGREGATE c_totalcorearea(geography, text, buffer)(
    SFUNC=c_totalcorearea_state,
    STYPE=metric_labeled,
    INITCOND='(13,{})'
);

COMMENT ON AGGREGATE c_totalcorearea(geom geography, category text, buffer numeric) IS 'Calcula la suma de las áreas de los polígonos de la misma categoría dividido por 10.000 para devolver un valor en Hectáreas.';
