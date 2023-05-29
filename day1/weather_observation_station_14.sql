-- Link to the problem https://www.hackerrank.com/challenges/weather-observation-station-14/

-- The database schema consists of 1 table
-- Table STATION
-- ID, NUMBER
-- CITY, VARCHAR(21)
-- STATE, VARCHAR(2)
-- LAT_N, NUMBER
-- LONG_W, NUMBER



-- Problem:
-- Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. Truncate your answer to 4 decimal places.



-- name: Weather Observation Station 14

-- Solution:
SELECT ROUND(MAX(LAT_N),4) FROM STATION
WHERE LAT_N < 137.2345;
 