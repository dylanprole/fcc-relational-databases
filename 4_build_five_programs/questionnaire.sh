#!/bin/bash

echo -e "\n~~ Questionnaire ~~\n"

QUESTION1="What's your name?"
QUESTION2="Where are you from?"
QUESTION3="What's your favorite coding website?"

echo -e "\n"$QUESTION1
read NAME

echo -e "\n"$QUESTION2
read LOCATION

echo -e "\n"$QUESTION3
read WEBSITE

echo -e "\nHello $NAME from $LOCATION. I learned that your favorite coding website is $WEBSITE!"
