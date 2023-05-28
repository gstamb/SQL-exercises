-- Link to the problem https://www.hackerrank.com/challenges/revising-aggregations-the-average-function

-- The database schema consists of 1 table
-- Table 1: CITY
-- Field        , TYPE
-- ID 		    , NUMBER
-- NAME         , VARCHAR2(17)
-- COUNTRYCODE  , VARCHAR2(3) 
-- DISTINCT   	, VARCHAR2(20)
-- POPULATION   , NUMBER



-- Problem:
-- Query the average population of all cities in CITY where District is California.



-- name: Revising Aggregations - Averages

-- Solution:
SELECT ROUND(AVG(Population),3) FROM CITY
WHERE district = "California";
 