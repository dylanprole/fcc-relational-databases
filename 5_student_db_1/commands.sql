-------------------- BASIC COMMANDS --------------------
-- Log into posgresql
'psql --username=freecodecamp --dbname=postgres'

-------------------- CREATE DATABASES --------------------
-- STUDENTS
CREATE DATABASE students;

-------------------- CREATE TABLES --------------------
-- STUDENTS
CREATE TABLE students ();

-- MAJORS
CREATE TABLE majors ();

-- COURSES
CREATE TABLE courses ();

-- MAJORS_COURSES (junction table)
CREATE TABLE majors_courses ();

-------------------- CREATE COLUMNS --------------------
-- STUDENTS
ALTER TABLE students 
ADD COLUMN student_id SERIAL PRIMARY KEY;

ALTER TABLE students 
ADD COLUMN first_name VARCHAR(50) NOT NULL;

ALTER TABLE students 
ADD COLUMN last_name VARCHAR(50) NOT NULL;

ALTER TABLE students 
ADD COLUMN major_id INT; -- We will add foreign key reference later

ALTER TABLE students
ADD FOREIGN KEY (major_id) REFERENCES majors(major_id); -- This is done after majors is created

ALTER TABLE students 
ADD COLUMN gpa NUMERIC(2,1); 

-- MAJORS
ALTER TABLE majors
ADD COLUMN major_id SERIAL PRIMARY KEY;

ALTER TABLE majors
ADD COLUMN major VARCHAR(50) NOT NULL;

-- COURSES
ALTER TABLE courses
ADD COLUMN course_id SERIAL PRIMARY KEY;

ALTER TABLE courses
ADD COLUMN course VARCHAR(100) NOT NULL;

-- MAJORS_COURSES
ALTER TABLE majors_courses
ADD COLUMN major_id INT;
ALTER TABLE majors_courses
ADD FOREIGN KEY (major_id) REFERENCES majors(major_id);

ALTER TABLE majors_courses
ADD COLUMN course_id INT;
ALTER TABLE majors_courses
ADD FOREIGN KEY (course_id) REFERENCES courses(course_id);

ALTER TABLE majors_courses
ADD PRIMARY KEY (major_id, course_id); -- Composite primary key

-------------------- ADDING ROWS --------------------
INSERT INTO majors (major)
VALUES ('Database Administration');

INSERT INTO courses (course)
VALUES ('Data Structures and Algorithms');

INSERT INTO majors_courses (major_id, course_id)
VALUES (1,1);

INSERT INTO students (first_name, last_name, major_id, gpa)
VALUES ('Rhea', 'Kellems', 1, 2.5);

SELECT major_id FROM majors WHERE major = '$MAJOR';

------ DELETE ALL DATA -------
TRUNCATE table_name1, table_name2, table_name3;


ALTER SEQUENCE payments_id_seq RESTART WITH 0;