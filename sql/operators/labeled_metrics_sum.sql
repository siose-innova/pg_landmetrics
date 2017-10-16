CREATE OR REPLACE FUNCTION metric_labeled_pair_sum(metric_labeled_pair, metric_labeled_pair)
RETURNS metric_labeled_pair AS
$BODY$

SELECT 
CASE WHEN ($1).label=($2).label THEN (($1).label, ($1).value + ($2).value)::metric_labeled_pair
ELSE raise_exception('This operation is not allowed for metrics of a different type.', $1)
END;

$BODY$
LANGUAGE SQL IMMUTABLE;


CREATE OPERATOR + (
    leftarg = metric_labeled_pair,
    rightarg = metric_labeled_pair,
    procedure = metric_labeled_pair_sum,
    commutator = +
);

-- SELECT ('agricola2',('Total Class Area'::text, 10, 'Ha.'::text)::metric)::metric_labeled + ('agricola',('Total Class Area'::text, 10, 'Ha.'::text)::metric)::metric_labeled
