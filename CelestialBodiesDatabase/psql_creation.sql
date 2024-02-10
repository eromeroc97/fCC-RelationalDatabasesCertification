CREATE DATABASE universe;

DROP TABLE moon;
DROP TABLE planet;
DROP TABLE star;
DROP TABLE galaxy;

CREATE TABLE galaxy(
    id BIGSERIAL PRIMARY KEY,
    name TEXT,
    diam_ly NUMERIC,
    distance_to_milkway INT,
    shape TEXT
);

CREATE TABLE star(
    id BIGSERIAL PRIMARY KEY,
    name TEXT,
    sun_mass INT,
    color TEXT,
    distance_to_sun NUMERIC,
    galaxy_id INT,
    FOREIGN KEY (galaxy_id) REFERENCES galaxy(id)
);

CREATE TABLE planet(
    id BIGSERIAL PRIMARY KEY,
    name TEXT,
    distance_to_star NUMERIC,
    isTerrestial BOOLEAN,
    isInHabitableArea BOOLEAN,
    earth_mass NUMERIC,
    star_id INT,
    FOREIGN KEY (star_id) REFERENCES star(id)
);

CREATE TABLE moon(
    id BIGSERIAL PRIMARY KEY,
    name TEXT,
    moon_mass NUMERIC,
    distance_to_planet NUMERIC,
    planet_id INT,
    FOREIGN KEY (planet_id) REFERENCES planet(id)
);

INSERT INTO galaxy (name, diam_ly, distance_to_milkway, shape) VALUES ('Milk Way', 1000000000, 0, 'Spiral');


INSERT INTO star (name, sun_mass, color, distance_to_sun, galaxy_id) VALUES ('Sun', 1, 'Yellow', 0, 1);


INSERT INTO planet (name, distance_to_star, isTerrestial, isInHabitableArea, earth_mass, star_id) VALUES('Mercury', 58000000, true, false, 0.055, 1);
INSERT INTO planet (name, distance_to_star, isTerrestial, isInHabitableArea, earth_mass, star_id) VALUES('Venus', 108200000, true, false, 0.815, 1);
INSERT INTO planet (name, distance_to_star, isTerrestial, isInHabitableArea, earth_mass, star_id) VALUES('Earth', 150000000, true, true, 1, 1);

INSERT INTO moon (name, moon_mass, distance_to_planet, planet_id) VALUES ('Moon', 1, 384000, 3);