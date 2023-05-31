-- Schema Recycling firm

--The firm owns several buy-back centers for collection of recyclable materials. Each of them receives funds to be paid to the recyclables suppliers. Data on funds received is recorded in the table
-- Income_o(point, date, inc)
-- The primary key is (point, date), where point holds the identifier of the buy-back center, and date corresponds to the calendar date the funds were received. The date column doesn’t include the time part, thus, money (inc) arrives no more than once a day for each center. Information on payments to the recyclables suppliers is held in the table
-- Outcome_o(point, date, out)
-- In this table, the primary key (point, date) ensures each buy-back center reports about payments (out) no more than once a day, too.
-- For the case income and expenditure may occur more than once a day, another database schema with tables having a primary key consisting of the single column code is used:
-- Income(code, point, date, inc)
-- Outcome(code, point, date, out)
-- Here, the date column doesn’t include the time part, either.

-- Problem
-- Using the Income and Outcome tables, determine for each buy-back center the days when it received funds but made no payments, and vice versa.
-- Result set: point, date, type of operation (inc/out), sum of money per day.



-- link https://www.sql-ex.ru/learn_exercises.php?LN=64

-- Solution
SELECT point, date, 'inc' cashflow, sum(inc) as sum from income i
WHERE NOT EXISTS
( SELECT 1 from outcome o WHERE i.point = o.point and i.date = o.date) 
GROUP BY point,date
UNION
SELECT point, date, 'out' cashflow, sum(out) as sum from outcome i
WHERE NOT EXISTS
( SELECT 1 from income o WHERE i.point = o.point and i.date = o.date) 
GROUP BY point,date
