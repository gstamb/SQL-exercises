-- Schema Airport

-- The database schema consists of 4 tables:
-- Company(ID_comp, name)
-- Trip(trip_no, id_comp, plane, town_from, town_to, time_out, time_in)
-- Passenger(ID_psg, name)
-- Pass_in_trip(trip_no, date, ID_psg, place)
--The Company table contains IDs and names of the airlines transporting passengers. The Trip table contains information on the schedule of flights: trip (flight) number, company (airline) ID, plane type, departure city, destination city, departure time, and arrival time. The Passenger table holds IDs and names of the passengers. The Pass_in_trip table contains data on flight bookings: trip number, departure date (day), passenger ID and her seat (place) designation during the flight. It should be noted that
-- * scheduled flights are operated daily; the duration of any flight is -- less than 24 hours; town_from <> town_to;
-- * all time and date values are assumed to belong to the same time zone;
-- * departure and arrival times are specified with one minute precision;
-- * there can be several passengers bearing the same first name and surname (for example, Bruce Willis);
-- * the seat (place) designation consists of a number followed by a letter; the number stands for the row, while the letter (a – d) defines the seat position in the grid (from left to right, in alphabetical order;
-- * connections and constraints are shown in the database schema below.


-- Problem
-- Find out the number of routes with the greatest number of flights (trips).
-- Notes.
-- 1) A - B and B - A are to be considered the SAME route.
-- 2) Use the Trip table only.



-- link https://www.sql-ex.ru/learn_exercises.php?LN=68

-- Solution
SELECT COUNT(*) AS count_of_highest_value
FROM
(
  SELECT point_1, point_2, COUNT(*) AS max_res 
  FROM
  (
    SELECT 
      CASE 
        WHEN town_from < town_to THEN town_from ELSE town_to 
      END AS point_1,
      CASE
        WHEN town_to > town_from THEN town_to ELSE town_from 
      END as point_2
    FROM 
      trip
  ) AS tab
  GROUP BY point_1, point_2
) AS subquery
WHERE subquery.max_res = 
(
  SELECT MAX(subquery.max_res) AS highest_count
  FROM
  (
    SELECT point_1, point_2, COUNT(*) AS max_res 
    FROM
    (
      SELECT 
        CASE 
          WHEN town_from < town_to THEN town_from ELSE town_to 
        END AS point_1,
        CASE
          WHEN town_to > town_from THEN town_to ELSE town_from 
        END as point_2
      FROM 
        trip
    ) AS tab
    GROUP BY point_1, point_2
  ) AS subquery
)
