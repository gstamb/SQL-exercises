-- Schema Computer firm

-- The database scheme consists of four tables:
-- Product(maker, model, type)
-- PC(code, model, speed, ram, hd, cd, price)
-- Laptop(code, model, speed, ram, hd, screen, price)
-- Printer(code, model, color, type, price)
-- The Product table contains data on the maker, model number, and type of product ('PC', 'Laptop', or 'Printer'). It is assumed that model numbers in the Product table are unique for all makers and product types. Each personal computer in the PC table is unambiguously identified by a unique code, and is additionally characterized by its model (foreign key referring to the Product table), processor speed (in MHz) – speed field, RAM capacity (in Mb) - ram, hard disk drive capacity (in Gb) – hd, CD-ROM speed (e.g, '4x') - cd, and its price. The Laptop table is similar to the PC table, except that instead of the CD-ROM speed, it contains the screen size (in inches) – screen. For each printer model in the Printer table, its output type (‘y’ for color and ‘n’ for monochrome) – color field, printing technology ('Laser', 'Jet', or 'Matrix') – type, and price are specified.

-- Problem
-- Find out the average price of PCs and laptops produced by maker A. Result set: one overall average price for all items.

-- link https://www.sql-ex.ru/learn_exercises.php?LN=26

-- Solution
SELECT AVG(price) AS avg_price
FROM (
  SELECT price 
  FROM pc 
  JOIN product ON product.model = pc.model 
  WHERE product.maker = 'A'
  UNION ALL
  SELECT price 
  FROM laptop 
  JOIN product ON product.model = laptop.model 
  WHERE product.maker = 'A'
) AS subquery


