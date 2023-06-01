-- Link to the problem https://www.hackerrank.com/challenges/interviews/

-- The database schema consists of 5 tables
-- Table 1: Contests
-- contest_id, Integer
-- hacker_id, Integer
--
-- Table 2: Colleges
-- college_id, Integer
-- contest_id, Integer
-- 
-- Table 3: Challenges
-- challenge_id, Integer
-- college_id, Integer
--
-- Table 4: View_stats
-- challenge_id, Integer
-- total_views, Integer
-- total_unique_views, Integer
--
-- Table 5:
-- challenge_id, Integer
-- total_submissions, Integer
-- total_accepted_submissions, Integer



-- Problem:
-- Samantha interviews many candidates from different colleges using coding challenges and contests. Write a query to print the contest_id, hacker_id, name, and the sums of total_submissions, total_accepted_submissions, total_views, and total_unique_views for each contest sorted by contest_id. Exclude the contest from the result if all four sums are .
Note: A specific contest can be used to screen candidates at more than one college, but each college only holds  screening contest.



-- name: Interviews

-- Solution:
SELECT  col.contest_id, c.hacker_id, c.name, sum(ts), sum(tas), sum(tv), sum(tuv)
FROM contests c
INNER JOIN Colleges col ON col.contest_id = c.contest_id
INNER JOIN challenges ch ON ch.college_id = col.college_id
left join ( SELECT challenge_id, sum(total_submissions) as ts, sum(total_accepted_submissions) as tas from submission_stats group by challenge_id) as s_stat on s_stat.challenge_id = ch.challenge_id
LEFT JOIN ( SELECT challenge_id, sum(total_views) as tv, sum(total_unique_views) as tuv from view_stats
group by challenge_id) as vs_stats on vs_stats.challenge_id = ch.challenge_id
group by col.contest_id, c.hacker_id, c.name
having sum(ts+tas+tv+tuv) > 0 
ORDER by col.contest_id
 