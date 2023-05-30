-- Schema Computer firm

-- The database scheme consists of four tables:
-- Product(maker, model, type)
-- PC(code, model, speed, ram, hd, cd, price)
-- Laptop(code, model, speed, ram, hd, screen, price)
-- Printer(code, model, color, type, price)
-- The Product table contains data on the maker, model number, and type of product ('PC', 'Laptop', or 'Printer'). It is assumed that model numbers in the Product table are unique for all makers and product types. Each personal computer in the PC table is unambiguously identified by a unique code, and is additionally characterized by its model (foreign key referring to the Product table), processor speed (in MHz) – speed field, RAM capacity (in Mb) - ram, hard disk drive capacity (in Gb) – hd, CD-ROM speed (e.g, '4x') - cd, and its price. The Laptop table is similar to the PC table, except that instead of the CD-ROM speed, it contains the screen size (in inches) – screen. For each printer model in the Printer table, its output type (‘y’ for color and ‘n’ for monochrome) – color field, printing technology ('Laser', 'Jet', or 'Matrix') – type, and price are specified.

-- Problem
-- For each maker who has models at least in one of the tables PC, Laptop, or Printer, determine the maximum price for his products.
-- Output: maker; if there are NULL values among the prices for the products of a given maker, display NULL for this maker, otherwise, the maximum price.


-- link https://www.sql-ex.ru/learn_exercises.php?LN=41

-- Solution
SELECT subquery.maker,
CASE 
  WHEN MAX(COALESCE(subquery.mp, 922337203685477)) = 922337203685477 
  THEN NULL 
  ELSE MAX(COALESCE(subquery.mp, 922337203685477)) 
END AS price
FROM   (SELECT s.type,
               s.maker,
               p.price AS mp
        FROM   printer p
               INNER JOIN product s
                       ON p.model = s.model
        UNION
        SELECT s.type,
               s.maker,
               p.price AS mp
        FROM   pc p
               INNER JOIN product s
                       ON p.model = s.model
        UNION
        SELECT s.type,
               s.maker,
               p.price AS mp
        FROM   laptop p
               INNER JOIN product s
                       ON p.model = s.model) AS subquery
GROUP  BY subquery.maker
