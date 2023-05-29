-- Link to the problem https://www.hackerrank.com/challenges/full-score

-- The database schema consists of 4 tables
-- Table 1: hackers
-- hacker_id , Integer
-- name , String
-- 
-- Table 2: Difficulty
-- difficulty_level, Integer
-- score, Integer
-- 
-- Table 3: Challenges
-- challenge_id, Integer
-- hacker_id, Integer
-- difficulty_level, Integer
--
-- Table 4: Submissions
-- submission_id, Integer
-- hacker_id, Integer
-- challenge_id, Integer
-- score, Integer



-- Problem:
-- Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.



-- name: Top Competitors

-- Solution:
SELECT hackers.hacker_id, hackers.name
FROM hackers
JOIN (
    SELECT s.hacker_id, c.challenge_id, c.difficulty_level, d.score, SUM(s.score) AS total_score
    FROM challenges c
    JOIN submissions s ON c.challenge_id = s.challenge_id
    JOIN difficulty d ON c.difficulty_level = d.difficulty_level
    WHERE s.score = d.score
    GROUP BY s.hacker_id, c.challenge_id, c.difficulty_level, d.score
) full_scores ON hackers.hacker_id = full_scores.hacker_id
GROUP BY hackers.hacker_id, hackers.name
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC, hackers.hacker_id ASC;
 