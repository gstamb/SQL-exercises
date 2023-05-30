-- Link to the problem https://www.hackerrank.com/challenges/average-population/

-- The database schema consists of 1 table
-- Table 1: CITY
-- Field        , TYPE
-- ID 		    , NUMBER
-- NAME         , VARCHAR2(17)
-- COUNTRYCODE  , VARCHAR2(3) 
-- DISTINCT   	, VARCHAR2(20)
-- POPULATION   , NUMBER



-- Problem:
-- Query the average population for all cities in CITY, rounded down to the nearest integer.



-- name: Average Population

-- Solution:
SELECT FLOOR(AVG(population)) FROM CITY;
 