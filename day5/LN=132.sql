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
-- Assuming there is no flight number greater than 65535, display the flight number and its binary representation (without leading zeroes).



-- link https://www.sql-ex.ru/learn_exercises.php?LN=132

-- Solution
SELECT trip_no
,CAST(CASE trip_no & 32768 WHEN 32768 THEN '1' ELSE '0' END
+CASE trip_no & 16384 WHEN 16384 THEN '1' ELSE '0' END
+CASE trip_no & 8192 WHEN 8192 THEN '1' ELSE '0' END
+CASE trip_no & 4096 WHEN 4096 THEN '1' ELSE '0' END
+CASE trip_no & 2048 WHEN 2048 THEN '1' ELSE '0' END
+CASE trip_no & 1024 WHEN 1024 THEN '1' ELSE '0' END
+CASE trip_no & 512 WHEN 512 THEN '1' ELSE '0' END
+CASE trip_no & 256 WHEN 256 THEN '1' ELSE '0' END
+CASE trip_no & 128 WHEN 128 THEN '1' ELSE '0' END
+CASE trip_no & 64 WHEN 64 THEN '1' ELSE '0' END
+CASE trip_no & 32 WHEN 32 THEN '1' ELSE '0' END
+CASE trip_no & 16 WHEN 16 THEN '1' ELSE '0' END
+CASE trip_no & 8 WHEN 8 THEN '1' ELSE '0' END
+CASE trip_no & 4 WHEN 4 THEN '1' ELSE '0' END
+CASE trip_no & 2 WHEN 2 THEN '1' ELSE '0' END
+CASE trip_no & 1 WHEN 1 THEN '1' ELSE '0' END AS bigint) AS bin_value
FROM trip
