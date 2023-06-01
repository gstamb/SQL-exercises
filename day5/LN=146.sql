-- Schema Computer firm

-- The database scheme consists of four tables:
-- Product(maker, model, type)
-- PC(code, model, speed, ram, hd, cd, price)
-- Laptop(code, model, speed, ram, hd, screen, price)
-- Printer(code, model, color, type, price)
-- The Product table contains data on the maker, model number, and type of product ('PC', 'Laptop', or 'Printer'). It is assumed that model numbers in the Product table are unique for all makers and product types. Each personal computer in the PC table is unambiguously identified by a unique code, and is additionally characterized by its model (foreign key referring to the Product table), processor speed (in MHz) – speed field, RAM capacity (in Mb) - ram, hard disk drive capacity (in Gb) – hd, CD-ROM speed (e.g, '4x') - cd, and its price. The Laptop table is similar to the PC table, except that instead of the CD-ROM speed, it contains the screen size (in inches) – screen. For each printer model in the Printer table, its output type (‘y’ for color and ‘n’ for monochrome) – color field, printing technology ('Laser', 'Jet', or 'Matrix') – type, and price are specified.

-- Problem
-- For the PC in the PC table with the maximum code value, obtain all its characteristics (except for the code) and display them in two columns:
-- - name of the characteristic (title of the corresponding column in the PC table);
-- - its respective value.


-- link https://www.sql-ex.ru/learn_exercises.php?LN=146

-- Solution
SELECT 'model' as chr, model as value from PC where code = (SELECT max(Code) from pc)
UNION all
SELECT 'speed' as chr, CAST(speed as varchar(15)) as value from PC where code = (SELECT max(Code) from pc)
UNION all
SELECT 'ram' as chr, CAST(ram as varchar(15)) as value from PC where code = (SELECT max(Code) from pc)
UNION all
SELECT 'hd' as chr, CAST(hd as varchar(15))as value from PC where code = (SELECT max(Code) from pc)
UNION all
SELECT 'cd' as chr, CAST(cd as varchar(15)) as value from PC where code = (SELECT max(Code) from pc)
UNION all
SELECT 'price' as chr, CAST(price as varchar(15)) as value from PC where code = (SELECT max(Code) from pc)
