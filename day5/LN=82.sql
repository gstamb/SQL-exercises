-- Schema Computer firm

-- The database scheme consists of four tables:
-- Product(maker, model, type)
-- PC(code, model, speed, ram, hd, cd, price)
-- Laptop(code, model, speed, ram, hd, screen, price)
-- Printer(code, model, color, type, price)
-- The Product table contains data on the maker, model number, and type of product ('PC', 'Laptop', or 'Printer'). It is assumed that model numbers in the Product table are unique for all makers and product types. Each personal computer in the PC table is unambiguously identified by a unique code, and is additionally characterized by its model (foreign key referring to the Product table), processor speed (in MHz) – speed field, RAM capacity (in Mb) - ram, hard disk drive capacity (in Gb) – hd, CD-ROM speed (e.g, '4x') - cd, and its price. The Laptop table is similar to the PC table, except that instead of the CD-ROM speed, it contains the screen size (in inches) – screen. For each printer model in the Printer table, its output type (‘y’ for color and ‘n’ for monochrome) – color field, printing technology ('Laser', 'Jet', or 'Matrix') – type, and price are specified.

-- Problem
-- Assuming the PC table is sorted by code in ascending order, find the average price for each group of six consecutive personal computers.
-- Result set: the first code value in a set of six records, average price for the respective set.


-- link https://www.sql-ex.ru/learn_exercises.php?LN=82

-- Solution
with t1(code, price, row) as (
SELECT code, price, row_number() over(order by code)  from pc
)
SELECT t1.code, avg(t2.price) as avg FROM t1
join t1 t2 on (t2.row - t1.row) < 6 and (t2.row - t1.row) >= 0
group by t1.code , t1.row
having count(t1.row) = 6
