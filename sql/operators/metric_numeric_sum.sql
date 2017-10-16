
CREATE OR REPLACE FUNCTION metric_numeric_sum(metric, numeric)
RETURNS metric AS
$BODY$

SELECT 
CASE WHEN TRUE THEN (($1).id, ($1).value + $2)::metric
ELSE raise_exception('This operation is not allowed for metrics of a different type or units', $1)
END;

$BODY$
LANGUAGE SQL IMMUTABLE;


CREATE OPERATOR + (
    leftarg = metric,
    rightarg = numeric,
    procedure = metric_numeric_sum,
    commutator = +
);

-- SAMPLE USAGE:
-- SELECT ('Total Class Area'::text, 10, 'Ha.'::text)::metric + 10
