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
-- Using the Pass_in_Trip table, calculate for each airline:
-- 1) the number of performed flights;
-- 2) the number of plane types used;
-- 3) the number of different passengers that have been transported;
-- 4) the total number of passengers that have been transported by the company.
-- Output: airline name, 1), 2), 3), 4).



-- link https://www.sql-ex.ru/learn_exercises.php?LN=95

-- Solution
SELECT c.name, COUNT(DISTINCT CONVERT(Char(25), pt.date)+CONVERT(Char(5), pt.trip_no)),
COUNT(DISTINCT t.plane),
count(Distinct pt.id_psg)  ,
COUNT(*)
FROM trip t, pass_in_trip pt, company c
where t.trip_no = pt.trip_no and c.id_comp = t.id_comp
group by t.id_comp, c.name
