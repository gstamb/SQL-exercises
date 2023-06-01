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
-- Find the overall flight duration for passengers who never occupied the same seat.
-- Result set: passenger name, flight duration in minutes.



-- link https://www.sql-ex.ru/learn_exercises.php?LN=76

-- Solution
with CTE as  
(
SELECT pt.id_psg as pass_id, 
     (SELECT CASE 
        WHEN time_dep >= time_arr 
        THEN time_arr - time_dep + 1440 
        ELSE time_arr - time_dep 
    END dur 
    FROM (
        SELECT DATEPART(hh, time_out)*60 + DATEPART(mi, time_out) time_dep,
            DATEPART(hh, time_in)*60 + DATEPART(mi, time_in) time_arr
        FROM Trip 
        WHERE trip_no = pt.trip_no
    ) as tm)  as duration
FROM Pass_in_trip pt
JOIN trip t ON t.trip_no = pt.trip_no
WHERE pt.id_psg not in (SELECT ID_psg from pass_in_trip GROUP BY place, id_psg  HAVING count(*) > 1)
)
SELECT p.name, SUM(c.duration) FROM CTE c
join passenger p on p.id_psg = c.pass_id
GROUP BY p.name, id_psg
