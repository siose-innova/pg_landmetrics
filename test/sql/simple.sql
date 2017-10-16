--
-- A simple brain-dead test to show how one is written
--

-- Create a table
CREATE TABLE simple_test (a integer, b text);

-- Add a couple of rows
INSERT INTO simple_test(a, b)
VALUES 
  (1, 'foo')
, (2, 'bar')
, (3, 'baz')
, (4, 'floob')
;

-- Select it back out in reverse order
SELECT * FROM simple_test ORDER BY a DESC;

-- remove a row
DELETE FROM simple_test WHERE length(b) > 3;

-- Select again
SELECT * FROM simple_test ORDER BY a DESC;

-- Clean up
DROP TABLE simple_test;

