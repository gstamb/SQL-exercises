-- Link to the problem https://www.hackerrank.com/challenges/draw-the-triangle-2/

-- The database schema consists of 1 table
--No table



-- Problem:
-- P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):



-- name: Draw The Triangle 2

-- Solution:
SET @NUMBER = 0;
SELECT REPEAT('* ', @NUMBER := @NUMBER +1)
 FROM information_schema.tables WHERE @NUMBER < 20;
 