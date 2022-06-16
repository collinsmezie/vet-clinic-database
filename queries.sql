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
ROLLBACK;

BEGIN TRANSACTION;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon%';
UPDATE animals SET species = 'pokemon' WHERE species = 'unspecified';
COMMIT;

BEGIN TRANSACTION;
DELETE * FROM animals;
ROLLBACK;

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
BETWEEN '1990-01-01' AND '2000-01-01' GROUP BY species;
