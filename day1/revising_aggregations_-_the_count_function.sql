-- Link to the problem https://www.hackerrank.com/challenges/revising-aggregations-the-count-function

-- The database schema consists of 1 table
-- Table 1: CITY
-- Field        , TYPE
-- ID 		    , NUMBER
-- NAME         , VARCHAR2(17)
-- COUNTRYCODE  , VARCHAR2(3) 
-- DISTINCT   	, VARCHAR2(20)
-- POPULATION   , NUMBER



-- Problem:
-- -- Table 1: CITY
-- Field        , TYPE
-- ID 		    , NUMBER
-- NAME         , VARCHAR2(17)
-- COUNTRYCODE  , VARCHAR2(3) 
-- DISTINCT   	, VARCHAR2(20)
-- POPULATION   , NUMBERQuery a count of the number of cities in CITY having a Population larger than 100000.



-- name: Revising Aggregations - The Count Function

-- Solution:
SELECT COUNT(name) FROM city
WHERE population > 100000;
 