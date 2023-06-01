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
-- Find out the names of the ships in the Ships table that meet at least four criteria from the following list:
-- numGuns = 8,
-- bore = 15,
-- displacement = 32000,
-- type = bb,
-- launched = 1915,
-- class = Kongo,
-- country = USA.



-- link https://www.sql-ex.ru/learn_exercises.php?LN=83
-- Solution
with CTE as (
SELECT s.name as ship, 
case c.numguns
WHEN 8 then 1 else 0 end as numguns,
case c.bore
WHEN 15 then 1 else 0 end as bore,
case c.displacement
WHEN 32000 then 1 else 0 end as displacement,
case c.type
WHEN 'bb' then 1 else 0 end as type,
case s.launched
WHEN 1915 then 1 else 0 end as launched,
case c.class
WHEN 'Kongo' then 1 else 0 end as kongo,
case c.country
WHEN 'USA' then 1 else 0 end as country
from ships s , classes c
where s.class = c.class
)
SELECT CTE.ship  from CTE
GROUP BY cte.ship
HAVING SUM(CTE.bore+ cte.type+ cte.numguns +cte.displacement + cte.launched+ cte.kongo + cte.country) >= 4
