-- Link to the problem https://www.hackerrank.com/challenges/weather-observation-station-9/

-- The database schema consists of 1 table
-- Table STATION
-- ID, NUMBER
-- CITY, VARCHAR(21)
-- STATE, VARCHAR(2)
-- LAT_N, NUMBER
-- LONG_W, NUMBER



-- Problem:
-- Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.



-- name: Weather Observation Station 9

-- Solution:
SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(LEFT(city, 1)) NOT IN ('a', 'e', 'i', 'o', 'u');
