-- Schema Computer firm

-- The database scheme consists of four tables:
-- Product(maker, model, type)
-- PC(code, model, speed, ram, hd, cd, price)
-- Laptop(code, model, speed, ram, hd, screen, price)
-- Printer(code, model, color, type, price)
-- The Product table contains data on the maker, model number, and type of product ('PC', 'Laptop', or 'Printer'). It is assumed that model numbers in the Product table are unique for all makers and product types. Each personal computer in the PC table is unambiguously identified by a unique code, and is additionally characterized by its model (foreign key referring to the Product table), processor speed (in MHz) – speed field, RAM capacity (in Mb) - ram, hard disk drive capacity (in Gb) – hd, CD-ROM speed (e.g, '4x') - cd, and its price. The Laptop table is similar to the PC table, except that instead of the CD-ROM speed, it contains the screen size (in inches) – screen. For each printer model in the Printer table, its output type (‘y’ for color and ‘n’ for monochrome) – color field, printing technology ('Laser', 'Jet', or 'Matrix') – type, and price are specified.

-- Problem
-- For each product type and maker in the Product table, find out, with a precision of two decimal places, the percentage ratio of the number of models of the actual type produced by the actual maker to the total number of models by this maker.
-- Result set: maker, product type, the percentage ratio mentioned above.


-- link https://www.sql-ex.ru/learn_exercises.php?LN=58

-- Solution
select p.maker makers, pp.type  types , cast(((SELECT count(model) from product where type = pp.type and maker =p.maker) / (SELECT count(model) from product where maker =p.maker))*100 as decimal(35,2))as prc from (SELECT DISTINCT maker from product) p, (SELECT DISTINCT TYPE FROM PRODUCT) pp
