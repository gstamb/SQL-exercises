-- Link to the problem https://www.hackerrank.com/challenges/weather-observation-station-20/

-- The database schema consists of 1 table
-- Table STATION
-- ID, NUMBER
-- CITY, VARCHAR(21)
-- STATE, VARCHAR(2)
-- LAT_N, NUMBER
-- LONG_W, NUMBER



-- Problem:
-- A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.



-- name: Weather Observation Station 20

-- Solution:
SELECT ROUND(AVG(LAT_N), 4)
FROM (
  SELECT LAT_N, ROW_NUMBER() OVER (ORDER BY LAT_N) AS RowNum, COUNT(*) OVER () AS TotalRows
  FROM STATION
) AS t
WHERE RowNum IN (CEILING(TotalRows/2.0), FLOOR(TotalRows/2.0)+1);
 