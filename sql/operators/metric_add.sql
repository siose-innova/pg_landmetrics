
CREATE OR REPLACE FUNCTION lm.metric_add(lm.metric, lm.metric)
RETURNS lm.metric AS
$BODY$

SELECT 
CASE WHEN ($1).name=($2).name THEN ('Total Class Area'::text, ($1).value + ($2).value, 'Ha.'::text)::lm.metric
ELSE lm.raise_exception('This operation is not allowed for metrics of a different type', $1)
END;

$BODY$
LANGUAGE SQL IMMUTABLE;


CREATE OPERATOR + (
    leftarg = lm.metric,
    rightarg = lm.metric,
    procedure = lm.metric_add,
    commutator = +
);

-- SAMPLE USAGE:
-- SELECT ('Total Class Area'::text, 10, 'Ha.'::text)::lm.metric + ('Total Class Area'::text, 10, 'Ha.'::text)::lm.metric
