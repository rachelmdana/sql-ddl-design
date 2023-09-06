-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE Passengers (
    passenger_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE Airports (
    airport_id SERIAL PRIMARY KEY,
    airport_name TEXT NOT NULL,
    airport_code VARCHAR(3) NOT NULL,
    country TEXT NOT NULL
);

CREATE TABLE Airlines (
    airline_id SERIAL PRIMARY KEY,
    airline_name TEXT NOT NULL
);

CREATE TABLE Seats (
    seat_id SERIAL PRIMARY KEY,
    seat_number VARCHAR(5) NOT NULL
);

CREATE TABLE Tickets (
    ticket_id SERIAL PRIMARY KEY,
    passenger_id INT,
    seat_id INT,
    departure_date DATE NOT NULL,
    departure_time TIME NOT NULL,
    arrival_date DATE NOT NULL,
    arrival_time TIME NOT NULL,
    airline_id INT,
    from_airport_id INT,
    to_airport_id INT,
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id),
    FOREIGN KEY (seat_id) REFERENCES Seats(seat_id),
    FOREIGN KEY (airline_id) REFERENCES Airlines(airline_id),
    FOREIGN KEY (from_airport_id) REFERENCES Airports(airport_id),
    FOREIGN KEY (to_airport_id) REFERENCES Airports(airport_id)
);
