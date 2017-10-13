CREATE OR REPLACE FUNCTION labeled_metrics_sum(labeled_metric, labeled_metric)
RETURNS labeled_metric AS
$BODY$

SELECT 
CASE WHEN ($1).label=($2).label 
AND (($1).metric).name=(($2).metric).name 
AND (($1).metric).units=(($2).metric).units  THEN (($1).label,((($1).metric).name, (($1).metric).value + (($2).metric).value, (($1).metric).name)::metric)::labeled_metric
ELSE raise_exception('This operation is not allowed for metrics of a different label, type or units', $1)
END;

$BODY$
LANGUAGE SQL IMMUTABLE;


CREATE OPERATOR + (
    leftarg = labeled_metric,
    rightarg = labeled_metric,
    procedure = labeled_metrics_sum,
    commutator = +
);

-- SELECT ('agricola2',('Total Class Area'::text, 10, 'Ha.'::text)::metric)::labeled_metric + ('agricola',('Total Class Area'::text, 10, 'Ha.'::text)::metric)::labeled_metric