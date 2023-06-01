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
-- For classes having irreparable combat losses and at least three ships in the database, display the name of the class and the number of ships sunk.



-- link https://www.sql-ex.ru/learn_exercises.php?LN=57
-- Solution
SELECT a.class,count(*) as q  FROM 
(
SELECT class, name from ships
UNION SELECT ship as class , ship as name from outcomes
WHERE ship in (SELECT class from classes)
) as a
join outcomes b on name=ship
where result  = 'sunk' and class in 
( SELECT class from  
  ( SELECT class, name from ships 
    UNION
     SELECT ship as class, ship as name FROM outcomes where ship in (select class from classes))  c 
GROUP BY class
HAVING COUNT(*) >= 3)
GROUP By class

 