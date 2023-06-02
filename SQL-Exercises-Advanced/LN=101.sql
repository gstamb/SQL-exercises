-- Schema Computer firm

-- The database scheme consists of four tables:
-- Product(maker, model, type)
-- PC(code, model, speed, ram, hd, cd, price)
-- Laptop(code, model, speed, ram, hd, screen, price)
-- Printer(code, model, color, type, price)
-- The Product table contains data on the maker, model number, and type of product ('PC', 'Laptop', or 'Printer'). It is assumed that model numbers in the Product table are unique for all makers and product types. Each personal computer in the PC table is unambiguously identified by a unique code, and is additionally characterized by its model (foreign key referring to the Product table), processor speed (in MHz) – speed field, RAM capacity (in Mb) - ram, hard disk drive capacity (in Gb) – hd, CD-ROM speed (e.g, '4x') - cd, and its price. The Laptop table is similar to the PC table, except that instead of the CD-ROM speed, it contains the screen size (in inches) – screen. For each printer model in the Printer table, its output type (‘y’ for color and ‘n’ for monochrome) – color field, printing technology ('Laser', 'Jet', or 'Matrix') – type, and price are specified.

-- Problem
-- The Printer table is sorted by the code field in ascending order.
-- The ordered rows form groups: the first group starts with the first row, each row having color=’n’ begins a new group, the groups of rows don’t overlap.
-- For each group, determine the maximum value of the model field (max_model), the number of unique printer types (distinct_types_cou), and the average price (avg_price).
-- For all table rows, display code, model, color, type, price, max_model, distinct_types_cou, avg_price.


-- link https://www.sql-ex.ru/learn_exercises.php?LN=101

-- Solution
with cte as (
SELECT *,
        case color WHEN 'n' then 0 else row_number() over (order by code) end+ 
        case color when 'n' then 1 else -1 end * row_number() over (Partition by color order by code) as grp
FROM printer
)
SELECT code, model, color , type, price, max(model) over( partition by grp) as c_adj,
MAX(case type when 'Laser' then 1 else 0 end) over( partition by grp ) +
MAX(case type when 'Matrix' then 1 else 0 end) over( partition by grp ) +
MAX(case type when 'Jet' then 1 else 0 end) over( partition by grp ) as g_cnt,
avg(price) OVER(Partition by grp) avg_gprice 
 FROM cte
