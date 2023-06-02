-- Schema Ships

--The database of naval ships that took part in World War II is under consideration. The database consists of the following relations:
--Classes(class, type, country, numGuns, bore, displacement)
--Ships(name, class, launched)
--Battles(name, date)
--Outcomes(ship, battle, result)
--Ships in classes all have the same general design. A class is normally assigned either the name of the first ship built according to the corresponding design, or a name that is different from any ship name in the database. The ship whose name is assigned to a class is called a lead ship.
--The Classes relation includes the name of the class, type (can be either bb for a battle ship, or bc for a battle cruiser), country the ship was built in, the number of main guns, gun caliber (bore diameter in inches), and displacement (weight in tons). The Ships relation holds information about the ship name, the name of its corresponding class, and the year the ship was launched. The Battles relation contains names and dates of battles the ships participated in, and the Outcomes relation - the battle result for a given ship (may be sunk, damaged, or OK, the last value meaning the ship survived the battle unharmed).
--Notes: 1) The Outcomes relation may contain ships not present in the Ships relation. 2) A ship sunk can’t participate in later battles. 3) For historical reasons, lead ships are referred to as head ships in many exercises.4) A ship found in the Outcomes table but not in the Ships table is still considered in the database. This is true even if it is sunk.

-- Problem
-- Find the names of the ships with the largest number of guns among all ships having the same displacement (including ships in the Outcomes table).

-- comment why not?
-- WITH cte AS (
-- select s.name as name, c.class as class, c.numguns as numg,  c.displacement  as dis
-- from Ships s
-- join Classes c on c.class = s.class
-- UNION
-- select  o.ship, c.class, c.numguns,  c.displacement  
-- from Outcomes o
-- join Classes c on c.class = o.ship
-- )
-- select name from cte
-- where numg in (  select max(numg) from cte where dis in (select   dis  from cte
-- group by dis
-- having count(*) > 1 ) )
 

-- link https://www.sql-ex.ru/learn_exercises.php?LN=51
-- Solution that works...
With cte as (
SELECT s.name as name, c.class as class, c.numguns as numg, c.displacement as dis FROM SHIPS s
join classes c on c.class = s.name or s.class = c.class
UNION
SELECT o.ship, c.class, c.numguns, c.displacement from outcomes o
join classes c on c.class = o.ship
)
SELECT name from cte
WHERE cte.numg = 
(SELECT MAX(numGuns) FROM Classes 
WHERE (class IN 
         (SELECT class FROM Ships 
           UNION SELECT 
          ship FROM Outcomes))
GROUP BY displacement 
HAVING displacement = cte.dis)

