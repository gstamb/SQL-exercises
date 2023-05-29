-- Link to the problem https://www.hackerrank.com/challenges/japan-population/

-- The database schema consists of 1 table
-- Table 1: CITY
-- Field        , TYPE
-- ID 		    , NUMBER
-- NAME         , VARCHAR2(17)
-- COUNTRYCODE  , VARCHAR2(3) 
-- DISTINCT   	, VARCHAR2(20)
-- POPULATION   , NUMBER



-- Problem:
-- Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.



-- name: Japan Population

-- Solution:
SELECT SUM(Population) FROM CITY
WHERE COUNTRYCODE = "JPN";
 