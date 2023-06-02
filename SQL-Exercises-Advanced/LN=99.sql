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
-- Only Income_o and Outcome_o tables are considered. It is known that no money transactions are performed on Sundays.
-- For each buy-back center (point) and each funds receipt date, determine the encashment date according to the following rules:
-- 1. The encashment date is the same as the receipt date if there is no payment entry in the Outcome_o table for this date and point.
-- 2. Otherwise, the first possible date after the receipt date is used that doesn’t fall on Sunday and doesn’t have a corresponding payment entry in the Outcome_o table for the point in question.
-- Output: point, receipt date, encashment date.



-- link https://www.sql-ex.ru/learn_exercises.php?LN=99

-- Solution
WITH recursive_dates AS (
  SELECT point, MIN(CAST(date AS DATE)) AS date_min, MAX(CAST(DATEADD(day, 7, date) AS DATE)) AS date_max 
  FROM income_o
  GROUP BY point
  UNION ALL
  SELECT point, DATEADD(day, 1, date_min), date_max 
  FROM recursive_dates 
  WHERE date_min < date_max
),
filtered_dates AS (
  SELECT point, date_min
  FROM recursive_dates rd
  WHERE NOT EXISTS (SELECT 1 FROM outcome_o oo WHERE rd.point = 
  oo.point AND rd.date_min = oo.date) 
  AND datepart(weekday, date_min) != 1
)
SELECT DISTINCT o.point, o.date, 
MIN(CASE WHEN o.date = fd.date_min THEN CONVERT(varchar, CONVERT(datetime, fd.date_min), 21) 
ELSE CONVERT(varchar, CONVERT(datetime, fd.date_min),21) END) AS encashment
FROM filtered_dates fd
LEFT JOIN income_o o ON fd.point = o.point 
WHERE fd.date_min >= o.date
GROUP BY o.point, o.date
ORDER BY o.point, o.date
OPTION (MAXRECURSION 1000)
