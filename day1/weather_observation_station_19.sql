-- Link to the problem https://www.hackerrank.com/challenges/weather-observation-station-19/

-- The database schema consists of 1 table
-- Table STATION
-- ID, NUMBER
-- CITY, VARCHAR(21)
-- STATE, VARCHAR(2)
-- LAT_N, NUMBER
-- LONG_W, NUMBER



-- Problem:
-- Query the Euclidean Distance between points p1 and  p2 and format your answer to display 4 decimal digits.



-- name: Weather Observation Station 19

-- Solution:
SELECT ROUND(SQRT(POWER((MIN(LAT_N)-MAX(LAT_N)),2)+POWER((MIN(LONG_W)-MAX(LONG_W)),2)),4) FROM STATION; 