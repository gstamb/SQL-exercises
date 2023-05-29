-- Link to the problem https://www.hackerrank.com/challenges/the-blunder/

-- The database schema consists of 1 table
-- Table 1 EMPLOYEES
-- name, String
-- salary, Integer



-- Problem:
-- Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's () key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary. Write a query calculating the amount of error (i.e.:actual - miscalculated average monthly salaries), and round it up to the next integer.



-- name: The Blunder

-- Solution:
SELECT  CEIL(AVG(salary) - AVG(CONVERT(REPLACE(CONVERT(salary, char),'0',''),decimal)))  from employees;
 