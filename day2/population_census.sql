-- Link to the problem https://www.hackerrank.com/challenges/asian-population/

-- The database schema consists of 2 tables
-- Table 1: CITY
-- Field        , TYPE
-- ID 		    , NUMBER
-- NAME         , VARCHAR2(17)
-- COUNTRYCODE  , VARCHAR2(3) 
-- DISTINCT   	, VARCHAR2(20)
-- POPULATION   , NUMBER
--
-- Table 2: COUNTRY
-- code        , VARCHAR2(3)
-- NAME 	   , VARCHAR2(44) 
-- CONTINENT   , VARCHAR2(13)
-- REGION      , VARCHAR2(25) 
-- SURFACEAREA , NUMBER
-- INDEPYEAR   , VARCHAR2(5)
-- POPULATION  , NUMBER
-- GNP         , NUMBER
-- GNPOLD      , VARCHAR2(9)
-- LOCALNAME   , VARCHAR2(44)
-- GOVERMENTFORM, VARCHAR2(44)
-- HEADOFSTATE , VARCHAR2(32)
-- CAPITAL     , VARCHAR2(4)
-- CODE2       , VARCHAR2(2)



-- Problem:
-- Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.


-- name: Population Census

-- Solution:
SELECT sum(city.population) FROM city 
INNER JOIN country 
on city.countrycode = country.code
WHERE continent = 'Asia';
 