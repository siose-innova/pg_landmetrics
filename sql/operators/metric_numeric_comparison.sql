
-- Value equals
CREATE OR REPLACE FUNCTION metric_eq(metric, numeric)
RETURNS boolean AS
$BODY$

SELECT 
CASE WHEN ($1).value > $2 THEN FALSE
	WHEN ($1).value = $2 THEN TRUE
	WHEN ($1).value < $2 THEN FALSE
ELSE raise_exception('This operation is not allowed for metrics of a different type or units', true)
END;

$BODY$
LANGUAGE SQL IMMUTABLE;

CREATE OPERATOR = (
    leftarg = metric,
    rightarg = numeric,
    procedure = metric_eq,
    commutator = =
);





-- Greater than value
CREATE OR REPLACE FUNCTION metric_gt(metric, numeric)
RETURNS boolean AS
$BODY$

SELECT 
CASE WHEN ($1).value > $2 THEN TRUE
	WHEN ($1).value = $2 THEN FALSE
	WHEN ($1).value < $2 THEN FALSE
ELSE raise_exception('This operation is not allowed for metrics of a different type or units', true)
END;

$BODY$
LANGUAGE SQL IMMUTABLE;

CREATE OPERATOR > (
    leftarg = metric,
    rightarg = numeric,
    procedure = metric_gt,
    commutator = <
);


-- Less than value
CREATE OR REPLACE FUNCTION metric_lt(metric, numeric)
RETURNS boolean AS
$BODY$

SELECT 
CASE WHEN ($1).value > $2 THEN FALSE
	WHEN ($1).value = $2 THEN FALSE
	WHEN ($1).value < $2 THEN TRUE
ELSE raise_exception('This operation is not allowed for metrics of a different type', true)
END;

$BODY$
LANGUAGE SQL IMMUTABLE;

CREATE OPERATOR < (
    leftarg = metric,
    rightarg = numeric,
    procedure = metric_lt,
    commutator = >
);


-- Greater or equals to value
CREATE OR REPLACE FUNCTION metric_gte(metric, numeric)
RETURNS boolean AS
$BODY$

SELECT 
CASE WHEN ($1).value > $2 THEN TRUE
	WHEN ($1).value = $2 THEN TRUE
	WHEN ($1).value < $2 THEN FALSE
ELSE raise_exception('This operation is not allowed for metrics of a different type', true)
END;

$BODY$
LANGUAGE SQL IMMUTABLE;

CREATE OPERATOR >= (
    leftarg = metric,
    rightarg = numeric,
    procedure = metric_gte,
    commutator = <=
);


-- Less or equals value
CREATE OR REPLACE FUNCTION metric_lte(numeric, metric)
RETURNS boolean AS
$BODY$

SELECT 
CASE WHEN $1 > ($2).value THEN FALSE
	WHEN $1 = ($2).value THEN TRUE
	WHEN $1 < ($2).value THEN TRUE
ELSE raise_exception('This operation is not allowed for metrics of a different type', true)
END;

$BODY$
LANGUAGE SQL IMMUTABLE;

CREATE OPERATOR <= (
    leftarg = numeric,
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
SELECT l_totalarea(geom) FROM sample_patches_25830;*/
