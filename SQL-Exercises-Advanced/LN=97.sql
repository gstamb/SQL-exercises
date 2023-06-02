-- Schema Computer firm

-- The database scheme consists of four tables:
-- Product(maker, model, type)
-- PC(code, model, speed, ram, hd, cd, price)
-- Laptop(code, model, speed, ram, hd, screen, price)
-- Printer(code, model, color, type, price)
-- The Product table contains data on the maker, model number, and type of product ('PC', 'Laptop', or 'Printer'). It is assumed that model numbers in the Product table are unique for all makers and product types. Each personal computer in the PC table is unambiguously identified by a unique code, and is additionally characterized by its model (foreign key referring to the Product table), processor speed (in MHz) – speed field, RAM capacity (in Mb) - ram, hard disk drive capacity (in Gb) – hd, CD-ROM speed (e.g, '4x') - cd, and its price. The Laptop table is similar to the PC table, except that instead of the CD-ROM speed, it contains the screen size (in inches) – screen. For each printer model in the Printer table, its output type (‘y’ for color and ‘n’ for monochrome) – color field, printing technology ('Laser', 'Jet', or 'Matrix') – type, and price are specified.

-- Problem
-- From the Laptop table, select rows fulfilling the following condition:
-- the values of the speed, ram, price, and screen columns can be arranged in such a way that each successive value exceeds two or more times the previous one.
-- Note: all known laptop characteristics are greater than zero.
-- Output: code, speed, ram, price, screen.


-- link https://www.sql-ex.ru/learn_exercises.php?LN=97

-- Solution
WITH cte AS (
SELECT
  Attribute,
  Code,
  CONVERT(decimal(18, 2), Value) AS Value
FROM (SELECT
  code,
  CONVERT(varchar(max), speed) AS speed,
  CONVERT(varchar(max), ram) AS ram,
  CONVERT(varchar(max), price) AS price,
  CONVERT(varchar(max), screen) AS screen
FROM Laptop) AS SourceTable
UNPIVOT
(
Value FOR Attribute IN (speed, ram, price, screen)
) AS UnpivotTable
),
ranked_cte AS (
SELECT
  *,
  RANK() OVER (PARTITION BY code ORDER BY value) AS prt
FROM cte),
final_cte AS (
SELECT
  *,
  value AS val,
  LAG(value, 1) OVER (PARTITION BY code ORDER BY prt) AS prt1_value,
  LAG(value, 2) OVER (PARTITION BY code ORDER BY prt) AS prt2_value,
  LAG(value, 3) OVER (PARTITION BY code ORDER BY prt) AS prt3_value
FROM ranked_cte
)
SELECT
  code,
  speed,
  ram,
  price,
  screen
FROM laptop
WHERE code IN (SELECT code FROM final_cte 
WHERE 
val >= prt1_value * 2
AND prt1_value >= prt2_value * 2
AND prt2_value >= prt3_value * 2)
