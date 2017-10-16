

-- Greater than another metric
CREATE OR REPLACE FUNCTION metric_gt(metric, metric)
RETURNS boolean AS
$BODY$

SELECT 
CASE WHEN ($1).id=($2).id AND ($1).value > ($2).value THEN TRUE
	WHEN ($1).id=($2).id AND ($1).value = ($2).value THEN FALSE
	WHEN ($1).id=($2).id AND ($1).value < ($2).value THEN FALSE
ELSE raise_exception('This operation is not allowed for metrics of a different type.', true)
END;

$BODY$
LANGUAGE SQL IMMUTABLE;

CREATE OPERATOR > (
    leftarg = metric,
    rightarg = metric,
    procedure = metric_gt,
    commutator = <
);


-- Less than another metric
CREATE OR REPLACE FUNCTION metric_lt(metric, metric)
RETURNS boolean AS
$BODY$

SELECT 
CASE WHEN ($1).id=($2).id AND ($1).value > ($2).value THEN FALSE
	WHEN ($1).id=($2).id AND ($1).value = ($2).value THEN FALSE
	WHEN ($1).id=($2).id AND ($1).value < ($2).value THEN TRUE
ELSE raise_exception('This operation is not allowed for metrics of a different type', true)
END;

$BODY$
LANGUAGE SQL IMMUTABLE;

CREATE OPERATOR < (
    leftarg = metric,
    rightarg = metric,
    procedure = metric_lt,
    commutator = >
);


-- Greater or equals to another metric
CREATE OR REPLACE FUNCTION metric_gte(metric, metric)
RETURNS boolean AS
$BODY$

SELECT 
CASE WHEN ($1).id=($2).id AND ($1).value > ($2).value THEN TRUE
	WHEN ($1).id=($2).id AND ($1).value = ($2).value THEN TRUE
	WHEN ($1).id=($2).id AND ($1).value < ($2).value THEN FALSE
ELSE raise_exception('This operation is not allowed for metrics of a different type.', true)
END;

$BODY$
LANGUAGE SQL IMMUTABLE;

CREATE OPERATOR >= (
    leftarg = metric,
    rightarg = metric,
    procedure = metric_gte,
    commutator = <=
);


-- Less or equals to another metric
CREATE OR REPLACE FUNCTION metric_lte(metric, metric)
RETURNS boolean AS
$BODY$

SELECT 
CASE WHEN ($1).id=($2).id AND ($1).value > ($2).value THEN FALSE
	WHEN ($1).id=($2).id AND ($1).value = ($2).value THEN TRUE
	WHEN ($1).id=($2).id AND ($1).value < ($2).value THEN TRUE
ELSE raise_exception('This operation is not allowed for metrics of a different type.', true)
END;

$BODY$
LANGUAGE SQL IMMUTABLE;

CREATE OPERATOR <= (
    leftarg = metric,
    rightarg = metric,
    procedure = metric_lt,
    commutator = >=
);


-- SAMPLE USAGE:
/*WITH sample AS(
    SELECT ('Total Class Area'::text, 10, 'Ha.'::text)::metric AS x,
    ('Total Class Area'::text, 10, 'Ha.'::text)::metric AS samex,
    ('Total Class Area'::text, 20, 'Ha.'::text)::metric AS doublex,
    ('NOT a Total Class Area'::text, 10, 'Ha.'::text)::metric AS notx
)
SELECT x >= samex FROM sample;*/
