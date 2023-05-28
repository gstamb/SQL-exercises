-- Link to the problem https://www.hackerrank.com/challenges/weather-observation-station-5/

-- The database schema consists of 1 table
-- Table STATION
-- ID, NUMBER
-- CITY, VARCHAR(21)
-- STATE, VARCHAR(2)
-- LAT_N, NUMBER
-- LONG_W, NUMBER



-- Problem:
-- Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.



-- name: Weather Observation Station 5

-- Solution:
SELECT *
FROM (
    SELECT City, LENGTH(City) AS City_Length
    FROM STATION
    ORDER BY City_Length ASC, City ASC
    LIMIT 1
) AS TblMin
UNION
SELECT *
FROM (
    SELECT CITY, LENGTH(City) AS City_Length
    FROM STATION
    ORDER BY City_Length DESC, CITY ASC
    LIMIT 1
) AS TblMax;
 