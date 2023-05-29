-- link https://www.hackerrank.com/challenges/the-report/ 

 
-- Table 1: Students
-- ID, Integer
-- Name, String
-- Marks, Integer
-- Table 2: Grades
-- Grade, Integer
-- Min_mark, Integer
-- Max_mark, Integer

-- Problem
-- Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. Ketty doesn't want the NAMES of those students who received a grade lower than 8. The report must be in descending order by grade -- i.e. higher grades are entered first. If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.

-- name the_report

-- Solution
SELECT 
CASE
    WHEN B.grade < 8 THEN NULL
    ELSE A.name
END, B.grade, A.marks 
from students as A
INNER JOIN grades as B
on A.marks BETWEEN B.Min_Mark AND B.Max_Mark
ORDER BY B.grade DESC, 
         CASE 
            WHEN B.grade < 8 THEN A.marks 
            ELSE NULL 
         END ASC,
         CASE 
            WHEN B.grade >= 8 THEN A.name 
            ELSE NULL 
         END ASC;
