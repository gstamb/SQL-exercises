-- Schema Computer firm

-- The database scheme consists of four tables:
-- Product(maker, model, type)
-- PC(code, model, speed, ram, hd, cd, price)
-- Laptop(code, model, speed, ram, hd, screen, price)
-- Printer(code, model, color, type, price)
-- The Product table contains data on the maker, model number, and type of product ('PC', 'Laptop', or 'Printer'). It is assumed that model numbers in the Product table are unique for all makers and product types. Each personal computer in the PC table is unambiguously identified by a unique code, and is additionally characterized by its model (foreign key referring to the Product table), processor speed (in MHz) – speed field, RAM capacity (in Mb) - ram, hard disk drive capacity (in Gb) – hd, CD-ROM speed (e.g, '4x') - cd, and its price. The Laptop table is similar to the PC table, except that instead of the CD-ROM speed, it contains the screen size (in inches) – screen. For each printer model in the Printer table, its output type (‘y’ for color and ‘n’ for monochrome) – color field, printing technology ('Laser', 'Jet', or 'Matrix') – type, and price are specified.

-- Problem
-- Find out the arithmetic mean (rounded to hundredths) of the following prices:
-- 1. Price of the cheapest Laptops produced by makers of PCs with the lowest CD-ROM speed;
-- 2. Price of the most expensive PCs by makers of the cheapest printers;
-- 3. Price of the most expensive printers by makers of Laptops with the greatest RAM capacity.
-- Note: Exclude missing prices from the calculation.


-- link https://www.sql-ex.ru/learn_exercises.php?LN=127

-- Solution
with cte as (
SELECT min(price) as pr from laptop l, product p
where l.model = p.model and p.maker in ( SELECT maker from product where model in ( select model from pc where cast(replace(cd, 'x', '') as numeric) = ( select min(cast(replace(cd, 'x', '') as numeric)) from pc)))
UNION
SELECT max(price) as pr from pc pc, product p
where p.model = pc.model
and p.maker in ( select maker from product where model in ( select model from printer where price = ( select min(price) from printer)))
UNION
SELECT max(price) as pr FROM printer pr , product p
where pr.model = p.model
and p.maker in ( select maker from product where model in ( select model from laptop where ram = ( select max(ram) from laptop)))
)
select CAST(round(avg(pr),2) as varchar)  from cte
where pr is not NULL
