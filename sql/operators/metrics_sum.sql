
CREATE OR REPLACE FUNCTION metrics_sum(metric, metric)
RETURNS metric AS
$BODY$

SELECT 
CASE WHEN ($1).name=($2).name AND ($1).units=($2).units THEN (($1).name, ($1).value + ($2).value, ($1).units)::metric
ELSE raise_exception('This operation is not allowed for metrics of a different type or units', $1)
END;

$BODY$
LANGUAGE SQL IMMUTABLE;


CREATE OPERATOR + (
    leftarg = metric,
    rightarg = metric,
    procedure = metrics_sum,
    commutator = +
);

-- SAMPLE USAGE:
-- SELECT ('Total Class Area'::text, 10, 'Ha.'::text)::metric + ('Total Class Area'::text, 10, 'Ha.'::text)::metric
