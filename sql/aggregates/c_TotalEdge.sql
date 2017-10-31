/*
Total Edge - devuelve la suma de las longitudes (m) de todos los segmentos de los bordes correspondientes al tipo de polígono (categoría) (unidades: Metros).
*/

-- SAMPLE USAGE
/*
SELECT c_totaledge_state(ARRAY[('Agricultural area',('Total Edge'::text, 10, 'Ha.'::text))::labeled_metric], geom, category) FROM sample_patches_25830;
SELECT c_totaledge_state(ARRAY[('Agricultural area',('Total Edge'::text, 10, 'Ha.'::text))::labeled_metric], geom, category) FROM sample_patches_4326;
*/

CREATE OR REPLACE FUNCTION c_totaledge_state(
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
	SELECT (category, (p_perimeter(geom)).value)::metric_labeled_pair AS m2
), summarize AS (
	SELECT (m2).label, SUM((m2).value) AS value FROM melt GROUP BY (m2).label
)
SELECT (18, ARRAY(SELECT (label, value)::metric_labeled_pair FROM summarize))::metric_labeled;

$BODY$;


-- SAMPLE USAGE
-- SELECT c_totaledge(geom,category) FROM sample_patches_25830;

CREATE AGGREGATE c_totaledge(geometry, text)(
    SFUNC=c_totaledge_state,
    STYPE=metric_labeled,
    INITCOND='(18,{})'
);

COMMENT ON AGGREGATE c_totaledge(geom geometry, category text) IS 'Suma de las longitudes de los bordes de los polígonos de la misma categoría para devolver un valor en Metros.';




CREATE OR REPLACE FUNCTION c_totaledge_state(
	current_state metric_labeled,
	geom geography,
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
	SELECT (category, (p_perimeter(geom)).value)::metric_labeled_pair AS m2
), summarize AS (
	SELECT (m2).label, SUM((m2).value) AS value FROM melt GROUP BY (m2).label
)
SELECT (18, ARRAY(SELECT (label, value)::metric_labeled_pair FROM summarize))::metric_labeled;

$BODY$;


-- SAMPLE USAGE
-- SELECT c_totaledge(geom,category) FROM sample_patches_4326;

CREATE AGGREGATE c_totaledge(geography, text)(
    SFUNC=c_totaledge_state,
    STYPE=metric_labeled,
    INITCOND='(18,{})'
);

COMMENT ON AGGREGATE c_totaledge(geom geography, category text) IS 'Suma de las longitudes de los bordes de los polígonos de la misma categoría para devolver un valor en Metros.';
