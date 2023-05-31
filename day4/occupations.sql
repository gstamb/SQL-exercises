-- Link to the problem https://www.hackerrank.com/challenges/occupations/

-- The database schema consists of 1 table
-- Table 1: Occupations
-- name, String
-- Occupation, String



-- Problem:
-- Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.
Note: Print NULL when there are no more names corresponding to an occupation.



-- name: Occupations

-- Solution:
SELECT
  GROUP_CONCAT(CASE WHEN occupation = 'Doctor' THEN name END) AS Doctor,
  GROUP_CONCAT(CASE WHEN occupation = 'Professor' THEN name END) AS Professor,
  GROUP_CONCAT(CASE WHEN occupation = 'Singer' THEN name END) AS Singer,
  GROUP_CONCAT(CASE WHEN occupation = 'Actor' THEN name END) AS Actor
FROM (
  SELECT name, occupation, 
         ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) AS rn
  FROM occupations
  WHERE occupation IN ('Doctor', 'Professor', 'Singer', 'Actor')
) t
GROUP BY rn;
 