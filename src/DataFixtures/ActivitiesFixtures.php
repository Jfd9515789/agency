<?php

namespace App\DataFixtures;

use Cocur\Slugify\Slugify;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Doctrine\Persistence\ObjectManager;
use App\Entity\Activities;
use Faker\Factory;
use App\Entity\User;

class ActivitiesFixtures extends Fixture implements DependentFixtureInterface
{

    public function load(ObjectManager $manager): void
    {
        $faker = Factory::create();
        $slug = new Slugify();

        for ($i = 1; $i <= 10; $i++) {
            $activities = new Activities();
            $activities->setName($faker->words(3, true));
            $activities->setCreatedAt(new \DateTimeImmutable());
            $activities->setUpdatedAt(new \DateTimeImmutable());
            $activities->setContent('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam accumsan sodales lacus sed fringilla. Nam accumsan sodales lacus sed fringilla. Nam accumsan sodales lacus sed fringilla.');
            $activities->setIsPublished($faker->boolean(90));
            $activities->setImage('0' . $i . '.jpg');
            $activities->setSlug($slug->slugify($activities->getName()));
            $manager->persist($activities);
        }
        $manager->flush();
    }

    public function getDependencies()
    {
        return [
            UserFixtures::class,
        ];
    }
}
