-- Schema Computer firm

-- The database scheme consists of four tables:
-- Product(maker, model, type)
-- PC(code, model, speed, ram, hd, cd, price)
-- Laptop(code, model, speed, ram, hd, screen, price)
-- Printer(code, model, color, type, price)
-- The Product table contains data on the maker, model number, and type of product ('PC', 'Laptop', or 'Printer'). It is assumed that model numbers in the Product table are unique for all makers and product types. Each personal computer in the PC table is unambiguously identified by a unique code, and is additionally characterized by its model (foreign key referring to the Product table), processor speed (in MHz) – speed field, RAM capacity (in Mb) - ram, hard disk drive capacity (in Gb) – hd, CD-ROM speed (e.g, '4x') - cd, and its price. The Laptop table is similar to the PC table, except that instead of the CD-ROM speed, it contains the screen size (in inches) – screen. For each printer model in the Printer table, its output type (‘y’ for color and ‘n’ for monochrome) – color field, printing technology ('Laser', 'Jet', or 'Matrix') – type, and price are specified.

-- Problem
-- For makers who have products with a known price in at least one of the Laptop, PC, or Printer tables, find the maximum price for each product type.
-- Output: maker, maximum price of laptops, maximum price of PCs, maximum price of printers. For missing products/prices, use NULL.


-- link https://www.sql-ex.ru/learn_exercises.php?LN=75

-- Solution
WITH t1 AS (
  SELECT p.maker,
         ISNULL(MAX(l.price), NULL) AS maxlap,
         ISNULL(MAX(pc.price), NULL) AS maxpc,
         ISNULL(MAX(pr.price), NULL) AS maxpr,
         COUNT(CASE WHEN l.price IS NULL AND pc.price IS NULL AND pr.price IS NULL THEN 1 END) AS num_null_categories
  FROM product p
  LEFT JOIN laptop l ON l.model = p.model
  LEFT JOIN pc pc ON pc.model = p.model
  LEFT JOIN printer pr ON pr.model = p.model
  GROUP BY p.maker
)
SELECT maker, maxlap, maxpc, maxpr
FROM t1
WHERE num_null_categories < 3
