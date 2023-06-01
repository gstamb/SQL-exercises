-- Link to the problem https://www.hackerrank.com/challenges/sql-projects

-- The database schema consists of 1 table
-- Table 1: projects
-- Task_id, Integer
-- Start_date, date
-- End_date, Date



-- Problem:
-- You are given a table, Projects, containing three columns: Task_ID, Start_Date and End_Date. It is guaranteed that the difference between the End_Date and the Start_Date is equal to 1 day for each row in the table.If the End_Date of the tasks are consecutive, then they are part of the same project. Samantha is interested in finding the total number of different projects completed.
Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. If there is more than one project that have the same number of completion days, then order by the start date of the project.



-- name: SQL Project Planning

-- Solution:
WITH t1 as(
select start_date as date,count(start_date) as date_count from projects
group by start_date
union all
select end_date as date, count(end_date) as date_count from projects
group by end_date
),
t2 as (
select t1.date, count(t1.date), row_number() over(order by t1.date) row_num from t1
group by t1.date
having count(t1.date) = 1
)
select start_date, end_date from
(select date as start_date, row_number() over(order by date) row_num1 from t2 where mod(row_num,2)=1) table3
join
(select date  as end_date, row_number() over(order by date) row_num1 from t2 where mod(row_num,2)=0) table4
on table3.row_num1=table4.row_num1
order by (end_date-start_date) asc, start_date asc
 