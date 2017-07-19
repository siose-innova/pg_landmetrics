

/*
*  array_percentages for an integer[]
*/
CREATE OR REPLACE FUNCTION lm.array_percentages(v_array integer[], sum_total int)
  RETURNS double precision[] AS
$BODY$
DECLARE
  result_array float[];

--temp variables
  tempi integer := 0;
  tempercent float :=0;
  x integer;

BEGIN
  FOREACH x IN ARRAY v_array
  LOOP
    tempercent:=(x*100)/sum_total::float;

    result_array[tempi] := tempercent;
    tempi:=tempi+1;

  END LOOP;
  RETURN result_array;
END;
$BODY$
  LANGUAGE plpgsql IMMUTABLE STRICT;


/*
*  array_percentages for a double[]
*/
CREATE OR REPLACE FUNCTION lm.array_percentages(v_array double precision[], sum_total int)
  RETURNS double precision[] AS
$BODY$
DECLARE
  result_array float[];

--temp variables
  tempi integer := 0;
  tempercent float :=0;
  x float;

BEGIN
  FOREACH x IN ARRAY v_array
  LOOP
    tempercent:=(x*100)/sum_total::float;

    result_array[tempi] := tempercent;
    tempi:=tempi+1;

  END LOOP;
  RETURN result_array;
END;
$BODY$
  LANGUAGE plpgsql IMMUTABLE STRICT;



