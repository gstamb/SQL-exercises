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
-- Get all ship classes of Russia. If there are no Russian ship classes in the database, display classes of all countries present in the DB.
-- Result set: country, class.



-- link https://www.sql-ex.ru/learn_exercises.php?LN=74
-- Solution
WITH t1 AS (
  SELECT c.country, c.class
  FROM classes c
  WHERE UPPER(c.country) = 'RUSSIA' AND EXISTS (
  SELECT c.country, c.class
  FROM classes c
  WHERE UPPER(c.country) = 'RUSSIA' )
  UNION ALL
  SELECT c.country, c.class
  FROM classes c
  WHERE NOT EXISTS (SELECT c.country, c.class
  FROM classes c
  WHERE UPPER(c.country) = 'RUSSIA' )
)
SELECT t1.country, t1.class 
FROM t1
WHERE t1.country = UPPER('RUSSIA')                                      
UNION
SELECT t1.country, t1.class 
FROM t1
WHERE NOT EXISTS (
  SELECT 1 FROM t1 WHERE country = UPPER('RUSSIA')
)
