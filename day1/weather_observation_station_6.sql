-- Link to the problem https://www.hackerrank.com/challenges/weather-observation-station-6/

-- The database schema consists of 1 table
-- Table STATION
-- ID, NUMBER
-- CITY, VARCHAR(21)
-- STATE, VARCHAR(2)
-- LAT_N, NUMBER
-- LONG_W, NUMBER



-- Problem:
-- Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.



-- name: Weather Observation Station 6

-- Solution:
SELECT city AS first_letter
FROM station
WHERE FIND_IN_SET(LEFT(city,1), 'A,E,I,O,U') > 0 ;
 