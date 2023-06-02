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
-- Using the Income and Outcome tables, find out the balance for each buy-back center by the end of each day when funds were received or payments were made.
-- Note that the cash isn’t withdrawn, and the unspent balance/debt is carried forward to the next day.
-- Result set: buy-back center ID (point), date in dd/mm/yyyy format, unspent balance/debt by the end of this day.



-- link https://www.sql-ex.ru/learn_exercises.php?LN=69

-- Solution
with t1 as (
select point, date , inc from income
union all 
select point, date, -out from outcome
)
SELECT DISTINCT t2.point, CONVERT(varchar(10), t2.date, 103),
COALESCE(( SELECT SUM(inc) from t1 where date <= t2.date and point = t2.point), 0)  FROM t1 t2
