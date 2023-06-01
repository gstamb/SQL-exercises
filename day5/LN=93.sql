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
-- For each airline that transported passengers calculate the total flight duration of its planes.
-- Result set: company name, duration in minutes.



-- link https://www.sql-ex.ru/learn_exercises.php?LN=93

-- Solution
with cte as (
SELECT DISTINCT t.id_comp company,pt.date as dt, t.time_out out, t.time_in inc, count(ID_psg) psg_cnt  FROM trip t, Pass_in_trip pt
where t.trip_no = pt.trip_no
group by t.ID_comp, t.time_out, t.time_in, pt.date
having count(id_psg) > 0)
SELECT c.name , SUM(case
when datediff(mi, cte.out, cte.inc) > 0 then datediff(mi, cte.out, cte.inc)
WHEN datediff(mi, cte.out, cte.inc) <= 0 then datediff(mi, cte.out, cte.inc +1)
end )
as cntt
from cte
join company c on c.id_comp = cte.company
group by c.name
