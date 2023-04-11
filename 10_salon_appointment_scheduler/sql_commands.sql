-- Connect to PostgreSQL
"psql --username=freecodecamp --dbname=postgres"

-- Clear tables
TRUNCATE customers, appointments, services;

-- Reset keys
ALTER SEQUENCE customers_customer_id_seq RESTART WITH 1;
ALTER SEQUENCE appointments_appointment_id_seq RESTART WITH 1;
ALTER SEQUENCE services_service_id_seq RESTART WITH 1;

-- Create Database
CREATE DATABASE salon;

-- Creating tables
CREATE TABLE customers (
  customer_id SERIAL PRIMARY KEY,
  phone VARCHAR(30) UNIQUE NOT NULL,
  name VARCHAR(30)
);

CREATE TABLE services (
  service_id SERIAL PRIMARY KEY,
  name VARCHAR(30)
);

CREATE TABLE appointments (
  appointment_id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(customer_id),
  service_id INT REFERENCES services(service_id),
  time VARCHAR(30)
);