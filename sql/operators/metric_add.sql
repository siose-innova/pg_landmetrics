
CREATE OR REPLACE FUNCTION metric_add(metric, metric)
RETURNS metric AS
$BODY$

SELECT 
CASE WHEN ($1).name=($2).name THEN ('Total Class Area'::text, ($1).value + ($2).value, 'Ha.'::text)::metric
ELSE raise_exception('This operation is not allowed for metrics of a different type', $1)
END;

$BODY$
LANGUAGE SQL IMMUTABLE;


CREATE OPERATOR + (
    leftarg = metric,
    rightarg = metric,
    procedure = metric_add,
    commutator = +
);

-- SAMPLE USAGE:
-- SELECT ('Total Class Area'::text, 10, 'Ha.'::text)::metric + ('Total Class Area'::text, 10, 'Ha.'::text)::metric
