-- Link to the problem https://www.hackerrank.com/challenges/weather-observation-station-3/

-- The database schema consists of 1 table
-- Table STATION
-- ID, NUMBER
-- CITY, VARCHAR(21)
-- STATE, VARCHAR(2)
-- LAT_N, NUMBER
-- LONG_W, NUMBER



-- Problem
-- Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.
The STATION table is described as follows:



-- name Weather Observation Station 3

-- Solution
SELECT DISTINCT city FROM station WHERE ID % 2 = 0;
 