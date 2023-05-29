-- Link to the problem https://www.hackerrank.com/challenges/japanese-cities-attributes/problem

-- The database schema consists of 1 table
-- Table 1: CITY
-- Field        , TYPE
-- ID 		    , NUMBER
-- NAME         , VARCHAR2(17)
-- COUNTRYCODE  , VARCHAR2(3) 
-- DISTINCT   	, VARCHAR2(20)
-- POPULATION   , NUMBER



-- Problem:
-- Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.



-- name: Japanese Cities' Attributes

-- Solution:
SELECT * FROM CITY where countrycode = "JPN";
 