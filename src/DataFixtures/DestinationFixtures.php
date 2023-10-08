<?php

namespace App\DataFixtures;

use App\Entity\Destination;
use App\Entity\Province;
use Cocur\Slugify\Slugify;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Doctrine\Persistence\ObjectManager;
use Faker\Factory;

class DestinationFixtures extends Fixture implements DependentFixtureInterface
{
    private $prices = [80, 120];
    private $durations = [60, 120, 180, 200, 300, 360, 500, 600];

    public function load(ObjectManager $manager): void
    {
        $faker = Factory::create();
        $slugify = new Slugify();
        $provinces = $manager->getRepository(Province::class)->findAll();
        $nbPrices = count($this->prices);
        $nbDurations = count($this->durations);
        $nbProv = count($provinces);
        for ($i = 2; $i <= 26; $i++) {
            $destination = new Destination();
            $destination->setProvince($provinces[$faker->numberBetween(0, $nbProv - 1)]);
            $destination->setName($faker->sentence(2, true));
            $destination->setSmallDescription('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam accumsan sodales lacus sed fringilla.');
            $destination->setFullDescription('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam accumsan sodales lacus sed fringilla. Fusce dapibus dui sit amet aliquam sollicitudin. Phasellus scelerisque eu augue a volutpat. In condimentum lorem laoreet ligula finibus, sit amet elementum elit ornare. Sed ipsum eros, facilisis et est sit amet, tristique tempor enim. Quisque ut laoreet neque. Quisque nunc mi, molestie sed pharetra a, faucibus id velit.');
            $destination->setDuration($this->durations[$faker->numberBetween(0, $nbDurations - 1)]);
            $destination->setPrice($this->prices[$faker->numberBetween(0, $nbPrices - 1)]);
            $destination->setCreatedAt(new \DateTimeImmutable());
            $destination->setIsPublished($faker->boolean(90));
            $destination->setSlug($slugify->slugify($destination->getName()));
            $destination->setImage($i . '.jpg');
            $destination->setSchedule($faker->dayOfWeek);
            $destination->setProgram($i . '.pdf');
            $manager->persist($destination);
        }
        $manager->flush();
    }

    public function getDependencies(): array
    {
        return [
            ProvinceFixtures::class,
        ];
    }
}
