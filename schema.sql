/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
   id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
   name           VARCHAR    NOT NULL,
   date_of_birth  DATE    NOT NULL,
   escape_attempts INT    NOT NULL,
   neutered       BOOLEAN NOT NULL,
   weight_kg      DECIMAL NOT NULL,
);

-- ADD species column to animals table schema

ALTER TABLE animals ADD species VARCHAR;

---------------------------------------------------------------------------------------

--Modify animals table--

--create species table
CREATE TABLE species(
   id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
   name  VARCHAR  NOT NULL
);

--create owners table
CREATE TABLE owners(
   id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
   full_name  VARCHAR  NOT NULL,
   age        INT  NOT NULL
);

-- ALTER TABLE owners
-- RENAME COLUMN id TO animal_owner_id;


-- Make sure that id is set as autoincremented PRIMARY KEY
ALTER TABLE animals
ADD COLUMN id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL;


--Remove column species
ALTER TABLE animals DROP COLUMN species;

-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals 
ADD COLUMN species_id INT, 
ADD FOREIGN KEY(species_id) REFERENCES species(id);


-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals 
ADD COLUMN owner_id INT, 
ADD FOREIGN KEY(owner_id) REFERENCES owners(id);


-- Modify your inserted animals so it includes the species_id value 
-- If the name ends in "mon" it will be Digimon
UPDATE animals 
SET species_id = 2
WHERE name LIKE '%mon';

-- Set All other animals to Pokemon
UPDATE animals 
SET species_id = 1
WHERE name NOT LIKE '%mon';

ALTER TABLE animals 
DROP COLUMN id;
