<?php

namespace App\DataFixtures;

use App\Entity\Comment;
use App\Entity\Destination;
use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Doctrine\Persistence\ObjectManager;
use Faker\Factory;

class CommentFixtures extends Fixture implements DependentFixtureInterface
{
    public function load(ObjectManager $manager): void
    {
        $faker = Factory::create();
        $users = $manager->getRepository(User::class)->findAll();
        $courses = $manager->getRepository(Destination::class)->findAll();
        for ($i = 1; $i <= 40; $i++) {
            $comment = new Comment();
            $comment->setCreatedAt(new \DateTimeImmutable());
            $comment->setRating($faker->numberBetween(1, 5));
            $comment->setComment($faker->paragraph($nbSentences = 1, $variableNBSentences = true));
            $comment->setIsPublished($faker->boolean(90));
            $comment->setAuthor($users[$faker->numberBetween(0, count($users) - 1)]);
            $comment->setDestination($courses[$faker->numberBetween(0, count($courses) - 1)]);
            $comment->setTitle($faker->words(3, true));
            $manager->persist($comment);
        }

        $manager->flush();
    }

    public function getDependencies(): array
    {
        return [
            UserFixtures::class,
            DestinationFixtures::class
        ];
    }
}
