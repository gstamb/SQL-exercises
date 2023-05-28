-- Link to the problem https://www.hackerrank.com/challenges/weather-observation-station-10/

-- The database schema consists of 1 table
-- Table STATION
-- ID, NUMBER
-- CITY, VARCHAR(21)
-- STATE, VARCHAR(2)
-- LAT_N, NUMBER
-- LONG_W, NUMBER



-- Problem:
-- Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.



-- name: Weather Observation Station 10

-- Solution:
SELECT DISTINCT city
FROM station
WHERE RIGHT(city, 1) NOT IN ('a', 'e', 'i', 'o', 'u');
 