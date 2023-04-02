-------------------------------------- CREATE DATABASE -------------------------------------- 
------ LOGGING INTO POSTGRESQL ------
'psql --username=freecodecamp --dbname=postgres'

------ MAKE DUMP OF ALL COMMANDS ------
'pg_dump -cC --inserts -U freecodecamp universe > universe.sql'

CREATE DATABASE universe;

-------------------------------------- CREATE TABLES -------------------------------------- 
------ GALAXY ------
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR UNIQUE NOT NULL,
    galaxy_type VARCHAR(30) NOT NULL,
    diameter_in_thousand_lightyears INT, 
    distance_from_milkyway_in_thousand_lightyears INT
);

------ STAR ------
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR UNIQUE NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id) NOT NULL,
    lightyears_from_sun NUMERIC(10,3),
    orbiting_planets_count INT 
);

------ PLANET ------
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY, 
    name VARCHAR UNIQUE NOT NULL,
    star_id INT REFERENCES star(star_id) NOT NULL,
    has_life BOOLEAN NOT NULL,
    home_to TEXT
);

------ MOON ------
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR UNIQUE NOT NULL,
    planet_id INT REFERENCES planet(planet_id) NOT NULL,
    radius_in_thousand_km NUMERIC(10,3),
    perigee_in_thousand_km NUMERIC(10,3),
    apogee_in_thousand_km NUMERIC(10,3)
);

------ MOUNTAIN ------
CREATE TABLE mountain (
    mountain_id SERIAL PRIMARY KEY,
    name VARCHAR UNIQUE NOT NULL,
    planet_id INT REFERENCES planet(planet_id) NOT NULL,
    height_in_km NUMERIC(10,3),
    climbed_by_humans BOOLEAN
);

-------------------------------------- INSERTING ROWS -------------------------------------- 
------ GALAXY (6 ROWS) ------
INSERT INTO galaxy (
    name,
    galaxy_type,
    diameter_in_thousand_lightyears, 
    distance_from_milkyway_in_thousand_lightyears
) VALUES
    ('milky way', 'barred spiral', 0, 0),
    ('lmc', 'satellite', 14, 158),
    ('andromeda', 'barred spiral', 220, 2500),
    ('cigar galaxy', 'starburst', 37, 11500),
    ('pinwheel galaxy', 'spiral', 170, 20870),
    ('sombrero galaxy', 'UNDEFINED', 50, 29350),
    ('whirlpool galaxy', 'spiral', 60, 30000);

------ STAR (6 ROWS) ------
INSERT INTO star (
    name,
    galaxy_id,
    lightyears_from_sun,
    orbiting_planets_count
) VALUES
    ('sol', 1, 0.0, 7),
    ('alpha centauri b', 1, 4.2, 0),
    ('tau ceti', 1, 11.9, 5),
    ('kapteyn', 1, 12.8, 2),
    ('wolf', 1, 14.0, 3),
    ('gliese 687', 1, 14.7, 1);

------ PLANET (12 ROWS) ------
INSERT INTO planet (
    name,
    star_id,
    has_life,
    home_to
) VALUES
    ('mercury', 1, FALSE, NULL),
    ('venus', 1, FALSE, NULL),
    ('earth', 1, TRUE, 'humans'),
    ('mars', 1, FALSE, NULL),
    ('jupiter', 1, FALSE, NULL),
    ('saturn', 1, FALSE, NULL),
    ('uranus', 1, FALSE, NULL),
    ('neptune', 1, FALSE, NULL),
    ('tau ceti g', 3, FALSE, NULL),
    ('tau ceti h', 3, FALSE, NULL),
    ('tau ceti e', 3, FALSE, NULL),
    ('kapetyn c', 4, FALSE, NULL);

------ MOON (20 ROWS) ------
INSERT INTO moon (
    name,
    planet_id,
    radius_in_thousand_km,
    perigee_in_thousand_km,
    apogee_in_thousand_km
) VALUES
    ('moon', 3, 1.740, 362.6, 405.4),
    ('phobos', 4, 0.010, 9.2, 9.5),
    ('deimos', 4, 0.006, 22.5, 23.5),
    ('europa', 5, 1.561, 664.9, 676.9),
    ('io', 5, 1.822, 420, 423.4),
    ('ganymede', 5, 2.634, 1069.2, 1071.6),
    ('callisto', 5, 2.410, 1869, 1897),
    ('mimas', 6, 0.416, 181.9, 189.2),
    ('titan', 6, 2.574, 1186.7, 1257.1),
    ('lapetus', 6, 0.735, 3560.8, 3560.8),
    ('rhea', 6, 0.764, 527.1, 527.1),
    ('dione', 6, 0.561, 377.4, 377.4),
    ('tethys', 6, 0.531, 294.6, 294.6),
    ('encladeus', 6, 0.252, 237.9, 237.9),
    ('oberon', 7, 0.761, 583.5, 583.5),
    ('puck', 7, 0.081, 86.0, 86.0),
    ('miranda', 7 , 0.236, 129.4, 129.4),
    ('ariel', 7, 0.579, 191.0, 191.0),
    ('umbriel', 7, 0.585, 266, 266),
    ('triton', 8, 1.353, 354.8, 354.8);

------ MOUNTAIN (6 ROWS) ------
INSERT INTO mountain (
    name,
    planet_id,
    height_in_km
) VALUES
    ('mount everest', 3, 8.8, TRUE),
    ('k2', 3, 8.6, TRUE),
    ('mount fuji', 3, 3.8, TRUE),
    ('mount cook', 3, 3.7, TRUE),
    ('olympus mons', 4, 21.9, TRUE),
    ('elysium mons', 4, 12.6, TRUE);