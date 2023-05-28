-- link https://www.hackerrank.com/challenges/revising-the-select-query-2

 
-- Table 1: CITY
-- Field        , TYPE
-- ID 		, NUMBER
-- NAME         , VARCHAR2(17)
-- COUNTRYCODE  , VARCHAR2(3) 
-- DISTINCT   	, VARCHAR2(20)
-- POPULATION   , NUMBER

-- Problem
-- Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.


-- name Revising the Select Query II

-- Solution
SELECT NAME
FROM CITY 
WHERE population > 120000 
and CountryCode = "USA";