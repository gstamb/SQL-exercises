-- Link to the problem https://www.hackerrank.com/challenges/weather-observation-station-13/

-- The database schema consists of 1 table
-- Table STATION
-- ID, NUMBER
-- CITY, VARCHAR(21)
-- STATE, VARCHAR(2)
-- LAT_N, NUMBER
-- LONG_W, NUMBER



-- Problem:
-- Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. Truncate your answer to 4 decimal places.



-- name: Weather Observation Station 13

-- Solution:
SELECT ROUND(SUM(LAT_N),4) FROM STATION
WHERE LAT_N BETWEEN 38.7880 and 137.2345;
 