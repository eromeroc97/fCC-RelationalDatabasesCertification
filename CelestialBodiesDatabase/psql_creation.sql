/*
open terminal: psql --username=freecodecamp --dbname=postgres
dump database to file: pg_dump -cC --inserts -U freecodecamp universe > universe.sql
rebuild database: psql -U postgres < universe.sql

connect to db: \c <database_name>
view tables in schema: \dt

*/

CREATE DATABASE universe;

DROP TABLE moon;
DROP TABLE planet;
DROP TABLE star;
DROP TABLE galaxy;
DROP TABLE groups;

CREATE TABLE groups(
    groups_id BIGSERIAL PRIMARY KEY,
    name VARCHAR(25) UNIQUE NOT NULL,
    distance_to_local_mly NUMERIC
);

CREATE TABLE galaxy(
    galaxy_id BIGSERIAL PRIMARY KEY,
    name VARCHAR(25) UNIQUE NOT NULL,
    diam_ly NUMERIC,
    distance_to_milkway_mly INT,
    shape TEXT NOT NULL,
    groups_id INT,
    FOREIGN KEY (groups_id) REFERENCES groups(groups_id)
);

CREATE TABLE star(
    star_id BIGSERIAL PRIMARY KEY,
    name VARCHAR(25) UNIQUE NOT NULL,
    spectral_type TEXT,
    sun_mass INT,
    color TEXT,
    distance_to_sun_ly NUMERIC,
    galaxy_id INT,
    FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
);

CREATE TABLE planet(
    planet_id BIGSERIAL PRIMARY KEY,
    name VARCHAR(25) UNIQUE NOT NULL,
    distance_to_star_mkm NUMERIC,
    isTerrestrial BOOLEAN,
    isInHabitableArea BOOLEAN,
    earth_mass NUMERIC NOT NULL,
    star_id INT,
    FOREIGN KEY (star_id) REFERENCES star(star_id)
);

CREATE TABLE moon(
    moon_id BIGSERIAL PRIMARY KEY,
    name VARCHAR(25) UNIQUE NOT NULL,
    moon_mass NUMERIC,
    distance_to_planet_km NUMERIC,
    planet_id INT,
    FOREIGN KEY (planet_id) REFERENCES planet(planet_id)
);

INSERT INTO groups (name, distance_to_local_mly) VALUES ('Local Group', 0);
INSERT INTO groups (name, distance_to_local_mly) VALUES ('Maffei 1 Group', 10.4);
INSERT INTO groups (name, distance_to_local_mly) VALUES ('Sculptor Group', 11);
INSERT INTO groups (name, distance_to_local_mly) VALUES ('M81 Group', 11.7);

INSERT INTO galaxy (name, diam_ly, distance_to_milkway_mly, shape, groups_id) VALUES ('Milk Way', 100000, 0, 'Spiral', 1);
INSERT INTO galaxy (name, diam_ly, distance_to_milkway_mly, shape, groups_id) VALUES ('Andromeda (M31)', 220000, 2.537, 'Barred spiral', 1);
INSERT INTO galaxy (name, diam_ly, distance_to_milkway_mly, shape, groups_id) VALUES ('Triangle (M33)', 60000, 2.64, 'Spiral', 1);
INSERT INTO galaxy (name, diam_ly, distance_to_milkway_mly, shape, groups_id) VALUES ('Maffei 1', 120000, 10.4, 'Elliptical', 2);
INSERT INTO galaxy (name, diam_ly, distance_to_milkway_mly, shape, groups_id) VALUES ('IC 342', 45000, 10.7, 'Spiral', 2);
INSERT INTO galaxy (name, diam_ly, distance_to_milkway_mly, shape, groups_id) VALUES ('Dwingeloo 1', 50000, 9.75, 'Spiral', 2);
INSERT INTO galaxy (name, diam_ly, distance_to_milkway_mly, shape, groups_id) VALUES ('Sculptor (NGC 253)', 70000, 11, 'Spiral', 3);
INSERT INTO galaxy (name, diam_ly, distance_to_milkway_mly, shape, groups_id) VALUES ('NGC 55', 50000, 7.6, 'Spiral', 3);
INSERT INTO galaxy (name, diam_ly, distance_to_milkway_mly, shape, groups_id) VALUES ('NGC 247', 70000, 11, 'Spiral', 3);
INSERT INTO galaxy (name, diam_ly, distance_to_milkway_mly, shape, groups_id) VALUES ('Bode (M81)', 90000, 11.7, 'Spiral', 4);
INSERT INTO galaxy (name, diam_ly, distance_to_milkway_mly, shape, groups_id) VALUES ('Cigar (M82)', 37000, 11.7, 'Irregular', 4);
INSERT INTO galaxy (name, diam_ly, distance_to_milkway_mly, shape, groups_id) VALUES ('NGC 3077', 25000, 11.7, 'Irregular', 4);

INSERT INTO star (name, spectral_type, sun_mass, color, distance_to_sun_ly, galaxy_id) VALUES ('Sun', 'G2V', 1, 'White-yellow', 0, 1);
INSERT INTO star (name, spectral_type, sun_mass, color, distance_to_sun_ly, galaxy_id) VALUES ('Sirius', 'A1V', 2, 'White-blue', 8.6, 1);
INSERT INTO star (name, spectral_type, sun_mass, color, distance_to_sun_ly, galaxy_id) VALUES ('Proxima Centauri', 'M5.5Ve', 0.12, 'Red', 4.24, 1);
INSERT INTO star (name, spectral_type, sun_mass, color, distance_to_sun_ly, galaxy_id) VALUES ('Kepler-90', 'G', 1.2, 'Yellow', 2540, 1);
INSERT INTO star (name, spectral_type, sun_mass, color, distance_to_sun_ly, galaxy_id) VALUES ('Nova Andromeda 1885', 'Cataclysmic variable', 1, 'Variable', 2537000, 2);
INSERT INTO star (name, spectral_type, sun_mass, color, distance_to_sun_ly, galaxy_id) VALUES ('M31 PAndromedae', 'Variable', 5, 'Red', 2537000, 2);
INSERT INTO star (name, spectral_type, sun_mass, color, distance_to_sun_ly, galaxy_id) VALUES ('M33 Var B', 'Variable', 0.9, 'Variable', 2640000, 3);
INSERT INTO star (name, spectral_type, sun_mass, color, distance_to_sun_ly, galaxy_id) VALUES ('M33 Var A', 'Eclipsing variable', 0.9, 'Variable', 2640000, 3);

INSERT INTO planet (name, distance_to_star_mkm, isTerrestrial, isInHabitableArea, earth_mass, star_id) VALUES ('Mercury', 57.9, true, false, 0.0553, 1);
INSERT INTO planet (name, distance_to_star_mkm, isTerrestrial, isInHabitableArea, earth_mass, star_id) VALUES ('Venus', 108.2, true, false, 0.815, 1);
INSERT INTO planet (name, distance_to_star_mkm, isTerrestrial, isInHabitableArea, earth_mass, star_id) VALUES ('Earth', 149.6, true, true, 1, 1);
INSERT INTO planet (name, distance_to_star_mkm, isTerrestrial, isInHabitableArea, earth_mass, star_id) VALUES ('Mars', 227.9, true, false, 0.107, 1);
INSERT INTO planet (name, distance_to_star_mkm, isTerrestrial, isInHabitableArea, earth_mass, star_id) VALUES ('Jupiter', 778.6, false, false, 317.8, 1);
INSERT INTO planet (name, distance_to_star_mkm, isTerrestrial, isInHabitableArea, earth_mass, star_id) VALUES ('Saturn', 1433.5, false, false, 95.2, 1);
INSERT INTO planet (name, distance_to_star_mkm, isTerrestrial, isInHabitableArea, earth_mass, star_id) VALUES ('Uranus', 2872.5, false, false, 14.6, 1);
INSERT INTO planet (name, distance_to_star_mkm, isTerrestrial, isInHabitableArea, earth_mass, star_id) VALUES ('Neptune', 4495.1, false, false, 17.2, 1);
INSERT INTO planet (name, distance_to_star_mkm, isTerrestrial, isInHabitableArea, earth_mass, star_id) VALUES ('Proxima Centauri b', 4.24, true, true, 1.17, 3);
INSERT INTO planet (name, distance_to_star_mkm, isTerrestrial, isInHabitableArea, earth_mass, star_id) VALUES ('Kepler-90b', 0.1, false, false, 0.3, 4);
INSERT INTO planet (name, distance_to_star_mkm, isTerrestrial, isInHabitableArea, earth_mass, star_id) VALUES ('Kepler-90c', 0.17, false, false, 0.9, 4);
INSERT INTO planet (name, distance_to_star_mkm, isTerrestrial, isInHabitableArea, earth_mass, star_id) VALUES ('Kepler-90d', 0.25, false, false, 2.8, 4);
INSERT INTO planet (name, distance_to_star_mkm, isTerrestrial, isInHabitableArea, earth_mass, star_id) VALUES ('Kepler-90e', 0.4, false, false, 2.4, 4);
INSERT INTO planet (name, distance_to_star_mkm, isTerrestrial, isInHabitableArea, earth_mass, star_id) VALUES ('Kepler-90f', 0.5, true, false, 0.9, 4);

INSERT INTO moon (name, moon_mass, distance_to_planet_km, planet_id) VALUES ('Moon', 1, 384000, 3);
INSERT INTO moon (name, moon_mass, distance_to_planet_km, planet_id) VALUES ('Io', 1.22, 421700, 5);
INSERT INTO moon (name, moon_mass, distance_to_planet_km, planet_id) VALUES ('Europa', 0.65, 671034, 5);
INSERT INTO moon (name, moon_mass, distance_to_planet_km, planet_id) VALUES ('Ganymede', 2.02, 1070412, 5);
INSERT INTO moon (name, moon_mass, distance_to_planet_km, planet_id) VALUES ('Callisto', 1.47, 1882709, 5);
INSERT INTO moon (name, moon_mass, distance_to_planet_km, planet_id) VALUES ('Titan', 1.83, 1221870, 6);
INSERT INTO moon (name, moon_mass, distance_to_planet_km, planet_id) VALUES ('Rhea', 0.031, 527068, 6);
INSERT INTO moon (name, moon_mass, distance_to_planet_km, planet_id) VALUES ('Iapetus', 0.024, 3560820, 6);
INSERT INTO moon (name, moon_mass, distance_to_planet_km, planet_id) VALUES ('Dione', 0.015, 377396, 6);
INSERT INTO moon (name, moon_mass, distance_to_planet_km, planet_id) VALUES ('Titania', 0.06, 435910, 7);
INSERT INTO moon (name, moon_mass, distance_to_planet_km, planet_id) VALUES ('Oberon', 0.052, 583520, 7);
INSERT INTO moon (name, moon_mass, distance_to_planet_km, planet_id) VALUES ('Umbriel', 0.022, 266300, 7);
INSERT INTO moon (name, moon_mass, distance_to_planet_km, planet_id) VALUES ('Ariel', 0.022, 191020, 7);
INSERT INTO moon (name, moon_mass, distance_to_planet_km, planet_id) VALUES ('Triton', 0.079, 354800, 8);
INSERT INTO moon (name, moon_mass, distance_to_planet_km, planet_id) VALUES ('Proteus', 0.0002, 117647, 8);
INSERT INTO moon (name, moon_mass, distance_to_planet_km, planet_id) VALUES ('Nereid', 0.00012, 5513827, 8);
INSERT INTO moon (name, moon_mass, distance_to_planet_km, planet_id) VALUES ('Larissa', 0.000016, 73548, 8);
INSERT INTO moon (name, moon_mass, distance_to_planet_km, planet_id) VALUES ('Phobos', 0.000000001072, 9378, 4);
INSERT INTO moon (name, moon_mass, distance_to_planet_km, planet_id) VALUES ('Deimos', 0.00000000000049, 23460, 4);
INSERT INTO moon (name, moon_mass, distance_to_planet_km, planet_id) VALUES ('Tethys', 0.000011, 294619, 6);
INSERT INTO moon (name, moon_mass, distance_to_planet_km, planet_id) VALUES ('Enceladus', 0.0000011, 238042, 6);
INSERT INTO moon (name, moon_mass, distance_to_planet_km, planet_id) VALUES ('Amalthea', 2.08, 181366, 5);