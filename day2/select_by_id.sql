-- Link to the problem https://www.hackerrank.com/challenges/select-by-id/

-- The database schema consists of 1 table
-- Table 1: CITY
-- Field        , TYPE
-- ID 		    , NUMBER
-- NAME         , VARCHAR2(17)
-- COUNTRYCODE  , VARCHAR2(3) 
-- DISTINCT   	, VARCHAR2(20)
-- POPULATION   , NUMBER



-- Problem:
-- Query all columns for a city in CITY with the ID 1661.



-- name: Select By ID

-- Solution:
SELECT * FROM city where ID=1661;