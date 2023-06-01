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
-- Supposing a passenger lives in the town his first flight departs from, find non-Muscovites who have visited Moscow more than once.
-- Result set: passenger's name, number of visits to Moscow.

-- Comments: The query does not work against the second database. 
-- Adding distinct count on the database does not seem to help, either. Not sure how to make it work.

-- link https://www.sql-ex.ru/learn_exercises.php?LN=87

-- Solution
With first_flight as (
SELECT ID_psg, trip_no FROM (SELECT trip_no, date, ID_psg, row_number() over(PARTITION BY id_PSG ORDER BY date) as row FROM Pass_in_trip
) as pt
where pt.row = 1
),
not_from_moscow as
(
select f.ID_psg pid from first_flight as f
join trip t on t.trip_no = f.trip_no
where t.town_from not like 'Moscow' and f.id_psg in ( SELECT p.id_psg  from Passenger p
JOIN Pass_in_trip pt on pt.ID_psg= p.ID_psg
JOIN trip t on t.trip_no = pt.trip_no
where town_to like 'Moscow' 
GROUP BY p.id_psg  
HAVING count(pt.id_psg) > 1)
)
SELECT name, count(DISTINCT time_in) Qty  from Passenger p
JOIN Pass_in_trip pt on pt.ID_psg= p.ID_psg
JOIN trip t on t.trip_no = pt.trip_no
where p.id_psg in (SELECT pid from not_from_moscow) and town_to like 'Moscow'
group by name



-- SELECT
--     (SELECT Name FROM passenger WHERE id_psg = d.id_psg) AS passenger_name,
--     ar
-- FROM
--     (
--         SELECT DISTINCT
--             id_psg,
--             pt."date",
--             time_out,
--             pt.trip_no,
--             t.town_from,
--             town_to,
--             COUNT(pt.trip_no) OVER (PARTITION BY id_psg, town_to ORDER BY id_psg) AS ar,
--             DENSE_RANK() OVER (PARTITION BY id_psg ORDER BY "date", time_out) AS arg
--         FROM
--             pass_in_trip pt
--         JOIN
--             trip t ON pt.trip_no = t.trip_no
--     ) d
-- WHERE
--     (ar > 1 AND town_to = 'Moscow')
--     AND (arg = 1 AND town_from != 'Moscow');
