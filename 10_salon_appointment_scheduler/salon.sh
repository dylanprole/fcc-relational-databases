#!/bin/bash

# Variable for querying PostgreSQL database
PSQL="psql -X --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

# Print opening message
echo -e "\n~~~~~ MY SALON ~~~~~\n\nWelcome to My Salon, how can I help you?\n"

SERVICES_MENU() {
  # If customer sent back to service menu, display message
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  # Display services
  SERVICE_LIST=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id;")
  echo "$SERVICE_LIST" | while IFS="|" read SERVICE_ID NAME
  do
    echo -e "$SERVICE_ID) $NAME"
  done

  # Get customer selection
  read SERVICE_ID_SELECTED

  # Take customer to the booking menu
  if [[ ! $SERVICE_ID_SELECTED =~ [1-5] ]]
  then
    SERVICES_MENU "I could not find that service. What would you like today?"
  else
    COMPLETE_BOOKING $SERVICE_ID_SELECTED 
  fi
}

COMPLETE_BOOKING() {
  # Ask customer for their phone number
  echo -e "\nWhat's your phone number?"

  read CUSTOMER_PHONE

  # Check to see if customer exists
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';")
  if [[ -z $CUSTOMER_NAME ]]
  then
    # Ask customer for their name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    # Add customer to customers table
    ADD_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
  fi

  # Ask customer what time they would like to book
  echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME"
  read SERVICE_TIME

  # Add appointment to appointments table
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")
  SERVICE_ID_SELECTED=$1
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")

  # Confirm service and time with customer
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

SERVICES_MENU