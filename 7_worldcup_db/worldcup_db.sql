-- Connect to postgresql
"psql --username=freecodecamp --dbname=postgres"

-- Create Database
CREATE DATABASE worldcup;

-- Create Tables
CREATE TABLE teams (
  team_id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE games (
  game_id SERIAL PRIMARY KEY NOT NULL,
  year INT NOT NULL,
  round VARCHAR(30) NOT NULL,
  winner_id INT REFERENCES teams(team_id) NOT NULL,
  winner_goals INT NOT NULL,
  opponent_id INT REFERENCES teams(team_id) NOT NULL,
  opponent_goals INT NOT NULL
);