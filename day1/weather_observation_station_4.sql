-- Link to the problem https://www.hackerrank.com/challenges/weather-observation-station-4/

-- The database schema consists of 1 table
-- Table STATION
-- ID, NUMBER
-- CITY, VARCHAR(21)
-- STATE, VARCHAR(2)
-- LAT_N, NUMBER
-- LONG_W, NUMBER



-- Problem:
-- Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.



-- name: Weather Observation Station 4

-- Solution:
SELECT COUNT(city) - COUNT(DISTINCT city) from station;
 