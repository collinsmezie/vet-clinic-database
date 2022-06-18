/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)  
VALUES ('Agumon', '2020-02-03', 0, TRUE, 10.23);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)  
VALUES ('Gabumon', '2018-11-15', 2, TRUE, 8.0);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)  
VALUES ('Pikachu','2021-01-07', 1, FALSE, 15.04);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)  
VALUES ('Devimon', '2017-05-12', 5, TRUE, 11.0);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)  
VALUES ('Charmander', '2020-02-08', 0, FALSE, -11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)  
VALUES ('Plantmon', '2021-11-15', 2, TRUE, -5.7 );

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)  
VALUES ('Squirtle', '1993-04-02', 3, FALSE, -12.13 );

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)  
VALUES ('Angemon', '2005-06-12', 1, TRUE, -45 );

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)  
VALUES ('Boarmon', '2005-06-07', 7, TRUE, 20.4 );

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)  
VALUES ('Blossom', '1998-10-13', 3, TRUE, 17 );

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)  
VALUES ('Ditto', '2022-05-14', 4, TRUE, 22 );

-------------------------------------------------------------------

INSERT INTO owners (full_name, age)  
VALUES ('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody POnd', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name)  
VALUES ('Pokemon'),
('Digimon');

-- Modify your inserted animals so it includes the species_id value 
-- If the name ends in "mon" it will be Digimon
UPDATE animals 
SET species_id = 2
WHERE name LIKE '%mon';

-- Set All other animals to Pokemon
UPDATE animals 
SET species_id = 1
WHERE name NOT LIKE '%mon';

-- Modify your inserted animals to include owner information (owner_id):
-- Sam Smith owns Agumon.
UPDATE animals 
SET owner_id = 1
WHERE name = 'Agumon';

-- Jennifer Orwell owns Gabumon and Pikachu.
UPDATE animals 
SET owner_id = 2
WHERE name = 'Gabumon';

UPDATE animals 
SET owner_id = 2
WHERE name = 'Pikachu';

-- Bob owns Devimon and Plantmon.
UPDATE animals 
SET owner_id = 3
WHERE name = 'Devimon';

UPDATE animals 
SET owner_id = 3
WHERE name = 'Plantmon';

-- Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animals 
SET owner_id = 4
WHERE name = 'Charmander';

UPDATE animals 
SET owner_id = 4
WHERE name = 'Squirtle';

UPDATE animals
SET owner_id = 4
WHERE name = 'Blossom';

-- Dean Winchester owns Angemon and Boarmon.
UPDATE animals 
SET owner_id = 5
WHERE name = 'Angemon';

UPDATE animals 
SET owner_id = 5
WHERE name = 'Boarmon';


