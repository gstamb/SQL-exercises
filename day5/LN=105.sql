-- Schema Computer firm

-- The database scheme consists of four tables:
-- Product(maker, model, type)
-- PC(code, model, speed, ram, hd, cd, price)
-- Laptop(code, model, speed, ram, hd, screen, price)
-- Printer(code, model, color, type, price)
-- The Product table contains data on the maker, model number, and type of product ('PC', 'Laptop', or 'Printer'). It is assumed that model numbers in the Product table are unique for all makers and product types. Each personal computer in the PC table is unambiguously identified by a unique code, and is additionally characterized by its model (foreign key referring to the Product table), processor speed (in MHz) – speed field, RAM capacity (in Mb) - ram, hard disk drive capacity (in Gb) – hd, CD-ROM speed (e.g, '4x') - cd, and its price. The Laptop table is similar to the PC table, except that instead of the CD-ROM speed, it contains the screen size (in inches) – screen. For each printer model in the Printer table, its output type (‘y’ for color and ‘n’ for monochrome) – color field, printing technology ('Laser', 'Jet', or 'Matrix') – type, and price are specified.

-- Problem
-- Statisticians Alice, Betty, Carol and Diana are numbering rows in the Product table.
-- Initially, all of them have sorted the table rows in ascending order by the names of the makers.
-- Alice assigns a new number to each row, sorting the rows belonging to the same maker by model in ascending order.
-- The other three statisticians assign identical numbers to all rows having the same maker.
-- Betty assigns the numbers starting with one, increasing the number by 1 for each next maker.
-- Carol gives a maker the same number the row with this maker's first model receives from Alice.
-- Diana assigns a maker the same number the row with this maker's last model receives from Alice.
-- Output: maker, model, row numbers assigned by Alice, Betty, Carol, and Diana respectively.


-- link https://www.sql-ex.ru/learn_exercises.php?LN=105

-- Solution
SELECT maker, model, row_number() over(order by maker,model), dense_rank() over(order by maker), rank() over(order by maker), count(*) over(order by maker) from product
