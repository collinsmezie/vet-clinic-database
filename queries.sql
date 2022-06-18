/*Queries that provide answers to the questions from all projects.*/

-- SELECT * from animals WHERE name = 'Luna';

-- SELECT * FROM animals WHERE name LIKE '%mon%';

-- SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-11-15' AND '2019-11-15';

-- SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;

-- SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';

-- SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

-- SELECT * FROM animals WHERE neutered = TRUE;

-- SELECT * FROM animals WHERE name NOT LIKE '%Gabumon';

-- SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;



--TRANSACTION SECTION--
BEGIN TRANSACTION;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN TRANSACTION;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon%';
UPDATE animals SET species = 'pokemon' WHERE species = 'unspecified';
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;


BEGIN TRANSACTION;
DELETE * FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;


BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth > 2022-01-01;
SAVEPOINT savepoint1;
UPDATE animals SET weight_kg = weight_kg * -1
ROLLBACK TO savepoint1;
UPDATE animals SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;


--QUERIES SECTION--

-- How many animals are there?
SELECT COUNT(*) FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, SUM(escape_attempts) FROM animals
GROUP BY neutered;

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MAX(weight_kg) MIN(weight_kg) FROM animals
GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth
BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

-------------------------------------------------------------------------

-- What animals belong to Melody Pond?
SELECT name FROM owners
INNER JOIN animals ON owner_id = animal_owner_id
WHERE full_name = 'Melody POnd';

-- List of all animals that are pokemon (their type is Pokemon)
SELECT name, animal_species_name FROM species 
JOIN animals ON animal_species_id = species_id 
WHERE animal_species_name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT full_name, name FROM owners
FULL OUTER JOIN animals ON owner_id = animal_owner_id;

-- How many animals are there per species?
 SELECT  COUNT(*) FROM species 
 JOIN animals ON species_id = animal_species_id
 WHERE species.animal_species_id = 2 ;

 SELECT  COUNT(*) FROM species 
 JOIN animals ON animals.species_id = species.id
 WHERE species.name = 1;


-- List all Digimon owned by Jennifer Orwell.
SELECT name FROM owners
INNER JOIN animals ON owner_id = animal_owner_id
WHERE full_name = 'Jennifer Orwell' AND name LIKE '%mon';


-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT name FROM owners
INNER JOIN animals ON owner_id = animal_owner_id
WHERE full_name = 'Dean Winchester' AND escape_attempts = 0;


-- Who owns the most animals?
SELECT full_name, COUNT(owner_id) AS number_of_animals
    FROM     owners
    INNER JOIN animals ON owner_id = animal_owner_id
    GROUP BY full_name
    ORDER BY number_of_animals DESC
    LIMIT    1;




