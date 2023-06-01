-- Link to the problem https://www.hackerrank.com/challenges/contest-leaderboard/

-- The database schema consists of 2 tables
-- Table 1: Hackers
-- hacker_id, Integer
-- name, String
--
-- Table 2: Submissions
-- submission_id , Integer
-- hacker_id , Integer
-- challenge_id, Integer
-- score, Integer



-- Problem:
-- The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. Exclude all hackers with a total score of 0 from your result.



-- name: Contest Leaderboard

-- Solution:
SELECT id, name, sum(m)
FROM  
( SELECT s.hacker_id as id, h.name as name, max(s.score) as m from submissions s
join hackers h 
on h.hacker_id = s.hacker_id
group by s.hacker_id, s.challenge_id, h.name) as t1
GROUP BY id, name
HAVING sum(m) > 0
ORDER BY sum(m) DESC, id
 