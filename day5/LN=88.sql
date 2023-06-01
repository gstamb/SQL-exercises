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
-- Among those flying with a single airline find the names of different passengers who have flown most often.
-- Result set: passenger name, number of trips, and airline name.



-- link https://www.sql-ex.ru/learn_exercises.php?LN=88

-- Solution
SELECT (SELECT name from passenger where id_psg = t1.idp) Client, t1.cnt,
(SELECT name FROM Company WHERE ID_comp = t1.comp) AS Company 
from
(SELECT pt.ID_psg as idp, Count(pt.trip_no) as cnt, max(t.id_comp) as comp, max(count(*)) over() as max_qty from pass_in_trip pt, trip t
where pt.trip_no = t.trip_no
group by pt.id_psg
having max(t.id_comp) = min(t.id_comp)) t1
where t1.max_qty = t1.cnt
