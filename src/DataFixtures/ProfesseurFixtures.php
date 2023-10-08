<?php

namespace App\DataFixtures;

use App\Entity\Professeur;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Faker\Factory;

class ProfesseurFixtures extends Fixture
{
    private array $genders = ['male', 'female'];

    public function load(ObjectManager $manager): void
    {
        $faker = Factory::create('fr_FR');

        for ($i = 10; $i <= 25; $i++) {
            $professeur = new Professeur();
            $gender = $faker->randomElement($this->genders);
            $professeur->setFirstName($faker->firstName($gender));
            $professeur->setLastName($faker->lastName);
            $gender = $gender == 'male' ? 'm' : 'f';
            $professeur->setImage('0' . ($i) . $gender . '.jpg');
            $manager->persist($professeur);
        }
        $manager->flush();
    }
}