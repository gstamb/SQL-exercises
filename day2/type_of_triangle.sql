-- Link to the problem https://www.hackerrank.com/challenges/what-type-of-triangle


-- The database schema consists of 1 table
-- Triangles
-- A, Integer
-- B, Integer
-- C, Integer



-- Problem:
-- Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:
-- Equilateral: It's a triangle with  sides of equal length.
-- Isosceles: It's a triangle with  sides of equal length.
-- Scalene: It's a triangle with  sides of differing lengths.
-- Not A Triangle: The given values of A, B, and C don't form a triangle.



-- name: Type of Triangle

-- Solution:
SELECT
CASE 
WHEN ( (A+B)<=C OR (A+C)<=B OR (B+C)<=A ) THEN 'Not A Triangle' 
WHEN (A=B AND B=C) THEN 'Equilateral'
WHEN (A=B OR A=C OR B=C) THEN 'Isosceles'
ELSE 'Scalene' 
END 
FROM TRIANGLES;
 