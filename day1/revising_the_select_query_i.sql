-- link https://www.hackerrank.com/challenges/revising-the-select-query
 
-- Table 1: CITY
-- Field        , TYPE
-- ID 		, NUMBER
-- NAME         , VARCHAR2(17)
-- COUNTRYCODE  , VARCHAR2(3) 
-- DISTINCT   	, VARCHAR2(20)
-- POPULATION   , NUMBER

-- Problem
-- Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.


-- name Revising the Select Query I

-- Solution
SELECT * FROM CITY WHERE POPULATION > 100000 and COUNTRYCODE = "USA";
 