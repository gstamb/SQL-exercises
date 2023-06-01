-- Link to the problem https://www.hackerrank.com/challenges/symmetric-pairs/

-- The database schema consists of 1 table
-- Table 1: Functions
-- x, Integer
-- y, Integer



-- Problem:
-- You are given a table, Functions, containing two columns: X and Y. Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1. Write a query to output all such symmetric pairs in ascending order by the value of X. List the rows such that X1 less or equal to Y1.



-- name: Symmetric Pairs

-- Solution:
select f.x as xx ,f.y as yy  FROM functions f
inner join functions ff on f.x  = ff.y  and f.y = ff.x 
group by f.x , f.y
having count(*) > 1 or f.x < f.y
order by f.x
 