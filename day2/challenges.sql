-- Link to the problem https://www.hackerrank.com/challenges/challenges/

-- The database schema consists of 2 tables
-- Table 1 Hackers
-- hacker_id , INTEGER
-- name, String
-- Table 2 Challenges
-- challenge_id, INTEGER
-- hacker_id, INTEGER



-- Problem:
-- Julia asked her students to create some coding challenges. Write a query to print the hacker_id, name, and the total number of challenges created by each student. Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id. If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.



-- name: Challenges

-- Solution:
SELECT printme.hid, printme.hnm, printme.cid FROM
(
SELECT final.hacker as hid, final.name as hnm,
CASE 
  WHEN final.wanted = 50 THEN final.wanted
  WHEN final.unwanted IS NOT NULL THEN final.unwanted
END as cid
FROM
(SELECT sq1.hacker, sq1.name, sq1.wanted, sq2.unwanted FROM
(
SELECT c.hacker_id as hacker, h.name as name, count(c.challenge_id ) as wanted from challenges c
JOIN hackers h on h.hacker_id = c.hacker_id
GROUP BY c.hacker_id, h.name 
having count(c.challenge_id) <= (SELECT count(challenge_id) from challenges
group by hacker_id
order by count(challenge_id) DESC
limit 1) 
) as sq1
LEFT JOIN (
SELECT sq.num_challenges as unwanted FROM
(
SELECT c.hacker_id as hacker, h.name as name, COUNT(c.challenge_id) AS num_challenges
FROM challenges c
JOIN hackers h ON h.hacker_id = c.hacker_id
GROUP BY c.hacker_id, h.name
having count(c.challenge_id) < (SELECT count(challenge_id) from challenges
group by hacker_id
order by count(challenge_id) DESC
limit 1)
ORDER BY COUNT(c.challenge_id) DESC
) as sq
GROUP BY sq.num_challenges
HAVING count(sq.num_challenges) = 1
) as sq2
ON sq1.wanted = sq2.unwanted
) as final
) printme
WHERE printme.cid IS NOT NULL
ORDER BY printme.cid DESC, printme.hid;