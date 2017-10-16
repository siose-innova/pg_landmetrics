
CREATE OR REPLACE FUNCTION metrics_sum(metric, metric)
RETURNS metric AS
$BODY$

SELECT 
CASE WHEN ($1).id=($2).id THEN (($1).id, ($1).value + ($2).value)::metric
ELSE raise_exception('This operation is not allowed for metrics of a different type.', $1)
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
-- SELECT (1, 10)::metric + (1, 10)::metric
