-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  in_country INTEGER NOT NULL REFERENCES countries(id)
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline INTEGER NOT NULL REFERENCES airlines,
  from_city INTEGER NOT NULL REFERENCES cities(id),
  to_city INTEGER NOT NULL REFERENCES cities(id)
);

INSERT INTO countries
  (name)
VALUES
 ('United States'), ('Japan'), ('France'), ('UAE'), ('Brazil'),
 ('United Kingdom'), ('Mexico'), ('Morocco'), ('China'), ('Chile');

INSERT INTO cities
 (name, in_country)
VALUES
 ('Washington DC', 1), ('Los Angeles', 1), ('Seattle', 1), 
 ('New York', 1), ('Cedar Rapids', 1), ('Charlotte', 1),
 ('Las Vegas', 1), ('Chicago', 1), ('New Orleans', 1), 
 ('Tokyo', 2), ('Paris', 3), ('Dubai', 4), ('Sao Paolo', 5),
 ('London', 6), ('Mexico City', 7), ('Casablanca', 8),
 ('Beijing', 9), ('Santiago', 10);

INSERT INTO airlines
 (name)
VALUES
 ('United'), ('British Airways'), ('Delta'), ('TUI Fly Belgium'),
 ('Air China'), ('American Airlines'), ('Avianca Brasil');

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline, from_city, to_city)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 3),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 10, 14),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 2, 7),
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 3, 15),
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 11, 16),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 12, 17),
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 4, 6),
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 5, 8),
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 6, 9),
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 13, 18);