-- Link to the problem https://www.hackerrank.com/challenges/name-of-employees

-- The database schema consists of 1 table
-- Table 1: Employee
-- employee_id, Integer
-- name, String
-- months, Integer
-- salary, Integer



-- Problem:
-- Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.


-- name: Employee Names

-- Solution:
SELECT name FROM employee ORDER BY name;