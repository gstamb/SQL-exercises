-- Link to the problem https://www.hackerrank.com/challenges/15-days-of-learning-sql/problem

-- The database schema consists of 2 tables
-- Table 1: Hackers
-- hacker_id, Integer
-- name, String
--
-- Table 2: Submissions
-- submission_date, Date
-- submission_id, Integer
-- hacker_id, Integer 
-- score, integer


-- Problem:
-- Write a query to print total number of unique hackers who made at least  submission each day (starting on the first day of the contest), and find the hacker_id and name of the hacker who made maximum number of submissions each day. 
-- If more than one such hacker has a maximum number of submissions, print the lowest hacker_id. The query should print this information for each day of the contest, sorted by the date.



-- name: 15 Days of Learning SQL

-- Solution:
with hacker_names as (SELECT name, hacker_id FROM hackers) ,
sub_cnt as(
SELECT submission_date as dt , hacker_id as id , count(*) as cnt from submissions
group  by submission_date , hacker_id),
daily_best as (
SELECT dt as dt, id as id, cnt as cnt FROM ( SELECT dt as dt, id as id, cnt as cnt, row_number() Over(PARTITION by dt ORDER by cnt DESC, id) as best FROM sub_cnt ) d
where best = 1
), 
best_hackers as (
SELECT dt as dt, min(id) as id, cnt as cnt FROM daily_best
group by dt, cnt )

SELECT dt as dt, (
  SELECT SUM(id) as id
  FROM (
    SELECT COUNT(DISTINCT HACKER_ID) AS id
    FROM submissions
    WHERE SUBMISSION_DATE <= dt
    GROUP BY HACKER_ID
    HAVING COUNT(DISTINCT SUBMISSION_DATE) = (
      SELECT DATEDIFF(day, MIN(SUBMISSION_DATE), dt) + 1
      FROM submissions
      WHERE SUBMISSION_DATE <= dt
    )
  ) AS sub_sum_inner
) AS cnt , 
  best_hackers.id AS bh,
  (SELECT name from hacker_names where hacker_id = best_hackers.id) as name
FROM best_hackers
order by dt

 