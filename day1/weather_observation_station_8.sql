-- Link to the problem https://www.hackerrank.com/challenges/weather-observation-station-8/

-- The database schema consists of 1 table
-- Table STATION
-- ID, NUMBER
-- CITY, VARCHAR(21)
-- STATE, VARCHAR(2)
-- LAT_N, NUMBER
-- LONG_W, NUMBER



-- Problem:
-- Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.



-- name: Weather Observation Station 8

-- Solution:
SELECT DISTINCT CITY
FROM STATION
WHERE RIGHT(city, 1) IN ('a', 'e', 'i', 'o', 'u') and
LEFT(city, 1) IN ('a', 'e', 'i', 'o', 'u');
 