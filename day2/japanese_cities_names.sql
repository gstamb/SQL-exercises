-- Link to the problem https://www.hackerrank.com/challenges/japanese-cities-name

-- The database schema consists of 1 table
-- Table 1: CITY
-- Field        , TYPE
-- ID 		    , NUMBER
-- NAME         , VARCHAR2(17)
-- COUNTRYCODE  , VARCHAR2(3) 
-- DISTINCT   	, VARCHAR2(20)
-- POPULATION   , NUMBER



-- Problem:
-- Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.



-- name: Japanese Cities Names

-- Solution:
SELECT name FROM CITY WHERE COUNTRYCODE = "JPN";
 