-- Link to the problem https://www.hackerrank.com/challenges/population-density-difference/

-- The database schema consists of 1 table
-- Table 1: CITY
-- Field        , TYPE
-- ID 		    , NUMBER
-- NAME         , VARCHAR2(17)
-- COUNTRYCODE  , VARCHAR2(3) 
-- DISTINCT   	, VARCHAR2(20)
-- POPULATION   , NUMBER



-- Problem:
-- Query the difference between the maximum and minimum populations in CITY.



-- name: Population Density Difference

-- Solution:
SELECT MAX(population) - MIN(population) FROM CITY;
 