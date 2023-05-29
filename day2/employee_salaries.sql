-- Link to the problem https://www.hackerrank.com/challenges/salary-of-employees

-- The database schema consists of 1 table
-- Table 1: Employee
-- employee_id, Integer
-- name, String
-- months, Integer
-- salary, Integer



-- Problem:
-- Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than 2000$ per month who have been employees for less than 10 months. Sort your result by ascending employee_id.



-- name: Employee Salaries

-- Solution:
SELECT name FROM employee where salary > 2000 and months < 10 ORDER BY employee_id
 