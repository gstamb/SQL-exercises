-- Link to the problem https://www.hackerrank.com/challenges/weather-observation-station-18/

-- The database schema consists of 1 table
-- Table STATION
-- ID, NUMBER
-- CITY, VARCHAR(21)
-- STATE, VARCHAR(2)
-- LAT_N, NUMBER
-- LONG_W, NUMBER



-- Problem:
-- Query the Manhattan Distance between points p1 and p2 and round it to a scale of 4 decimal places.



-- name: Weather Observation Station 18

-- Solution:
SELECT ROUND((ABS(MIN(LAT_N) - MAX(LAT_N))) + ABS((MIN(LONG_W) - MAX(LONG_W))),4) FROM STATION;
 