#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE teams, games;")
echo $($PSQL "ALTER SEQUENCE teams_team_id_seq RESTART WITH 1;")
echo $($PSQL "ALTER SEQUENCE games_game_id_seq RESTART WITH 1;")

# Insert values about teams into the teams table
echo -e "\n~~ Populating the teams table ~~\n"

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    # get team_id for winner and opponent
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")
    # if team_id for winner not found
    if [[ -z $WINNER_ID ]]
    then
      # Insert winners team_id into teams
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$WINNER');")
      # Check to see it was successfully inserted
      if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
      then
        # Print what was inserted
        echo "Inserted into teams, $WINNER"
      fi
    fi
    # if team_id for opponent not found
    if [[ -z $OPPONENT_ID ]]
    then
      # Insert opponents team_id into teams
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT');")
      # Check to see it was successfully inserted
      if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
      then
        # Print what was inserted
        echo "Inserted into teams, $OPPONENT"
      fi
    fi
  fi
done

# Insert all game info into the games table
echo -e "\n~~ Populating the games table ~~\n"

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    # get the team_id for the winner
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
    # get the team_id for the opponent
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
    # Insert all game info
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games (year, round, winner_id, winner_goals, opponent_id, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $WINNER_GOALS, $OPPONENT_ID, $OPPONENT_GOALS);")
    # Check if game was inserted
    if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
    then
      echo "Inserted into games; $YEAR, '$ROUND', $WINNER_ID, $WINNER_GOALS, $OPPONENT_ID, $OPPONENT_GOALS"
    fi
  fi
done