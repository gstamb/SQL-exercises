-- Link to the problem https://www.hackerrank.com/challenges/earnings-of-employees

-- The database schema consists of 1 table
-- Table 1: Employees
-- employee_id, Integer
-- name, String
-- months, Integer
-- salary, Integer



-- Problem:
-- We define an employee's total earnings to be their monthly  salary x months worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as 2 space-separated integers.



-- name: Top Earners

-- Solution:
SELECT  salary*months as earnings , count(employee_id) from employee
GROUP BY earnings
ORDER BY earnings DESC
LIMIT 1;
 