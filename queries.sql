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


----------------------------------------------------------------------------------------
                            --DAY 4 --

-- Who was the last animal seen by William Tatcher?
SELECT animals.name, animals.id, animal_id, vet_id, date_of_visit FROM animals
JOIN visits on animals.id = animal_id
WHERE vet_id = 1
GROUP BY animals.name, animals.id, animal_id, vet_id, date_of_visit
ORDER BY date_of_visit DESC LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT animals.name FROM animals
JOIN visits on animals.id = animal_id
WHERE vet_id = 3
GROUP BY animals.name;

-- List all vets and their specialties, including vets with no specialties.
SELECT species_id,vets.name,species.name FROM specializations
RIGHT JOIN vets ON specializations.vet_id = vets.id
LEFT JOIN species  ON specializations.species_id = species.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT vets.name,animals.name,visits.date_of_visit FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez' AND date_of_visit between '2020-04-1' AND '2020-08-30';

-- What animal has the most visits to vets?
SELECT animals.name, COUNT(*) as visits FROM visits
JOIN animals ON visits.animal_id = animals.id
GROUP BY animals.name
ORDER BY visits DESC LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT vets.name,animals.name,visits.date_of_visit FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Maisy Smith'
ORDER BY date_of_visit ASC LIMIT 1;


-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.name,visits.date_of_visit,vets.name as vet_name FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
ORDER BY date_of_visit DESC LIMIT 1;


-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) FROM visits LEFT
JOIN specializations ON visits.vet_id = specializations.vet_id
JOIN animals ON visits.animal_id = animals.id
WHERE specializations.species_id != animals.species_id OR specializations.species_id IS NULL;


-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT animal_id, animals.species_id, species.name as speciality FROM visits
JOIN animals ON visits.animal_id = animals.id
JOIN species ON animals.species_id = species.id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Maisy Smith';


--------------------------------------------------------------------------------------------------
                                ---WEEK 2 -- DAY 1 



-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT * FROM (SELECT id FROM animals) animal_ids, 
(SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) 
select 'Owner ' || generate_series(1,2500000), 
'owner_' || generate_series(1,2500000) || '@mail.com';


EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';