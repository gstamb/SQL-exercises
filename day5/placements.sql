-- Link to the problem https://www.hackerrank.com/challenges/placements/

-- The database schema consists of 3 tables
-- Table 1: Students
-- id, Integer
-- name, String
--
-- Table 2: Friends
-- id, Integer
-- friend_id, String
--
-- Table 3: Packages
-- id, Integer
-- salary, float



-- Problem:
-- You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). Packages contains two columns: ID and Salary (offered salary in $ thousands per month).Write a query to output the names of those students whose best friends got offered a higher salary than them. Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer.



-- name: Placements

-- Solution:
SELECT s.name  FROm students s
join packages p on s.id = p.id
join friends f on s.id = f.id
left join packages pp on f.friend_id = pp.id
WHERE pp.salary > p.salary
ORDER BY pp.salary
 