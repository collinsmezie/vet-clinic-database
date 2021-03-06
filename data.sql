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


-----------------------------------------------------------------------------------------------------
                                        ---DAY  4 ---

INSERT INTO vets (name, age, date_of_graduation)
VALUES('William Tatcher', 45,'2000-04-23'), ('Maisy Smith', 26,'2019-01-17'),
('Stephanie Mendez', 45,'2000-04-23'), ('Jack Harkness', 38,'2008-06-08');

-- Insert the following data for specialties
INSERT INTO specializations (vet_id, species_id)
VALUES(1,1), (3,1), (3,2), (4,2);

/* Insert the following data for visits */
-- Agumon visited William Tatcher on May 24th, 2020
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(1, 1, '2020-05-24');

-- Agumon visited Stephanie Mendez on Jul 22th, 2020
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(1, 3, '2020-07-22');

-- Gabumon visited Jack Harkness on Feb 2nd, 2021
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(2, 4, '2021-02-02');

-- Pikachu visited Maisy Smith on Jan 5th, 2020
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(7, 2, '2020-01-5');

-- Pikachu visited Maisy Smith on Mar 8th, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(7, 2, '2020-03-08');

-- Pikachu visited Maisy Smith on May 14th, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(7, 2, '2020-05-14');

-- Devimon visited Stephanie Mendez on May 4th, 2021.
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(3, 3, '2020-05-04');

-- Charmander visited Jack Harkness on Feb 24th, 2021.
INSERT INTO visits (animal_id, vet_id,date_of_visit)
VALUES(8, 4, '2021-02-24');

-- Plantmon visited Maisy Smith on Dec 21st, 2019.
INSERT INTO visits (animal_id, vet_id,date_of_visit)
VALUES(4, 2, '2019-12-21');

-- Plantmon visited William Tatcher on Aug 10th, 2020.
INSERT INTO visits (animal_id, vet_id,date_of_visit)
VALUES(4, 1, '2020-08-10');

-- Plantmon visited Maisy Smith on Apr 7th, 2021.
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(4, 2, '2021-04-07');

-- Squirtle visited Stephanie Mendez on Sep 29th, 2019.
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(9, 3, '2019-09-29');

-- Angemon visited Jack Harkness on Oct 3rd, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(5, 4, '2020-10-03');

-- Angemon visited Jack Harkness on Nov 4th, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(5, 4, '2020-11-04');

-- Boarmon visited Maisy Smith on Jan 24th, 2019.
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(6, 2, '2019-01-24');

-- Boarmon visited Maisy Smith on May 15th, 2019.
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(6, 2, '2019-05-15');

-- Boarmon visited Maisy Smith on Feb 27th, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(5, 2, '2020-02-27');

-- Boarmon visited Maisy Smith on Aug 3rd, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(5, 2, '2020-08-03');

-- Blossom visited Stephanie Mendez on May 24th, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(10, 3, '2020-05-24');

-- Blossom visited William Tatcher on Jan 11th, 2021.
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(10, 1, '2021-01-11');

