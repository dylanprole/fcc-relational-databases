---------------------------------------------------- MARIO DATABSE ----------------------------------------------------
"https://github.com/freeCodeCamp/learn-relational-databases-by-building-a-mario-database/blob/main/TUTORIAL.md"

---------------------------------------------------- BASH COMMANDS ----------------------------------------------------
\l -- lists all databases
\c database_name -- connects to database
\d -- displays all tables in current database
\d table_name -- displays info about the table
\q -- quit out of psql

"psql --username=freecodecamp --dbname=postgres" -- connect to database


---------------------------------------------------- DATABASES ----------------------------------------------------
-- Create database:
CREATE DATABASE database_name;

-- Delete database:
DROP DATABASE database_name;

-- Rename database:
ALTER DATABASE database_name RENAME TO new_database_name;


---------------------------------------------------- TABLES ----------------------------------------------------
-- Create table:
CREATE TABLE table_name (column_name DATATYPE CONDITIONS, ...)

-- Delete table:
DROP TABLE IF EXISTS table_name;

-- Rename table
ALTER TABLE table_name RENAME TO new_table_name;


---------------------------------------------------- COLUMNS ----------------------------------------------------
-- Add column
ALTER TABLE table_name ADD COLUMN column_name DATATYPE CONDITIONS;

-- Data types:
    VARCHAR(30);
    INT;
    SERIAL;
    NUMERIC(digits_before_floating_point, digits_after_floating_point);
    DATATYPE REFERENCES referenced_table_name(referenced_column_name); -- Creates foreign primary key
    DATE;

-- Delete column
ALTER TABLE table_name DROP COLUMN column_name;

-- Rename column
ALTER TABLE table_name RENAME COLUMN column_name TO new_column_name;

---------------------------------------------------- KEYS ----------------------------------------------------

-- Add primary key:
ALTER TABLE table_name ADD PRIMARY KEY(column_name);

-- Drop primary key:
ALTER TABLE table_name DROP CONSTRAINT table_name_pkey;

-- Add foreign key and new column:
ALTER TABLE table_name ADD COLUMN column_name DATATYPE REFERENCES referenced_table_name(referenced_column_name);

-- Add foreign key to existing column:
ALTER TABLE table_name ADD FOREIGN KEY(column_name) REFERENCES referenced_table(referenced_column);

-- Adding composite primary key
ALTER TABLE table_name ADD PRIMARY KEY(column1, column2);

-- Add constraint to column
ALTER TABLE table_name ADD UNIQUE(column_name);
ALTER TABLE table_name ALTER COLUMN column_name SET NOT NULL;


---------------------------------------------------- ROWS ----------------------------------------------------
-- Add multiple rows:
INSERT INTO table_name (column_name_1, column_name_2, column_name_3)
VALUES 
    ('value_a1', 'value_a2', 'value_a3'),
    ('value_b1', 'value_b2', 'value_b3');

-- Modify values in rows:
UPDATE table_name SET column_name='NEW_VALUE' WHERE column_name='VALUE';

-- Delete rows
DELETE FROM table_name WHERE column_name = 'value';

---------------------------------------------------- JOINING ----------------------------------------------------
-- Joining two tables wiht full join
SELECT columns FROM table_1 FULL JOIN table_2 ON table_1.primary_key_column = table_2.foreign_key_column;