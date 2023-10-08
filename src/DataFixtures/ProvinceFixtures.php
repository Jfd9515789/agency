<?php

namespace App\DataFixtures;

use App\Entity\Province;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Faker\Factory;

class ProvinceFixtures extends Fixture
{
    private array $provinces = ['Anvers', 'Limbourg', 'Flandre orientale', 'Brabant flamand', 'Flandre occidentale', 'Brabant wallon', 'Hainaut', 'Liège', 'Luxembourg', 'Namur'];

    public function load(ObjectManager $manager): void
    {
        $faker = Factory::create();

        foreach ($this->provinces as $province) {
            $prov = new Province();
            $prov->setName($province);
            $prov->setDescription($faker->sentence);
            $manager->persist($prov);
        }
        $manager->flush();
    }
}
