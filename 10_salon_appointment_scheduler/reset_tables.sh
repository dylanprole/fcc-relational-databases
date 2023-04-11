#!/bin/bash

# Variable for querying PostgreSQL database
PSQL="psql -X --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

# Resetting tables and primary keys
TRUNCATE_RESULT=$($PSQL "TRUNCATE customers, appointments, services;")
RESET_CUSTOMERS_RESULT=$($PSQL "ALTER SEQUENCE customers_customer_id_seq RESTART WITH 1;")
RESET_APPOINTMENTS_RESULT=$($PSQL "ALTER SEQUENCE appointments_appointment_id_seq RESTART WITH 1;")
RESET_SERVICES_RESULT=$($PSQL "ALTER SEQUENCE services_service_id_seq RESTART WITH 1;")

# Adding services
ADDING_SERVICES_RESULT=$($PSQL "INSERT INTO services (name) VALUES ('cut'), ('color'), ('perm'), ('style'), ('trim');")