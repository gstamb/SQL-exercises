-- Link to the problem https://www.hackerrank.com/challenges/weather-observation-station-7/

-- The database schema consists of 1 table
-- Table STATION
-- ID, NUMBER
-- CITY, VARCHAR(21)
-- STATE, VARCHAR(2)
-- LAT_N, NUMBER
-- LONG_W, NUMBER



-- Problem:
-- Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.



-- name: Weather Observation Station 7

-- Solution:
SELECT DISTINCT CITY
FROM STATION
WHERE RIGHT(city, 1) IN ('a', 'e', 'i', 'o', 'u');
 