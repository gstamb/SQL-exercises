-- Link to the problem https://www.hackerrank.com/challenges/weather-observation-station-16/

-- The database schema consists of 1 table
-- Table STATION
-- ID, NUMBER
-- CITY, VARCHAR(21)
-- STATE, VARCHAR(2)
-- LAT_N, NUMBER
-- LONG_W, NUMBER



-- Problem:
-- Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. Round your answer to 4 decimal places.



-- name: Weather Observation Station 16

-- Solution:
SELECT ROUND(LAT_N, 4) FROM STATION
WHERE LAT_N > 38.7780
ORDER BY LAT_N
LIMIT 1;
 