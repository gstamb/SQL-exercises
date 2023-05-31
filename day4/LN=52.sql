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
-- Determine the names of all ships in the Ships table that can be a Japanese battleship having at least nine main guns with a caliber of less than 19 inches and a displacement of not more than 65 000 tons.



-- link https://www.sql-ex.ru/learn_exercises.php?LN=52
-- Solution
SELECT DISTINCT ships.name  from ships
Join classes on ships.class = classes.class
Where 
(classes.country = 'Japan' Or classes.country = NULL)
AND (type ='bb' OR type IS NULL)
AND (numGuns >=9 OR numGuns IS NULL)
AND (bore <19 OR bore IS NULL)
AND (displacement <=65000 OR displacement IS NULL)

 