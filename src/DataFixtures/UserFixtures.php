<?php

namespace App\DataFixtures;

use App\Entity\User;
use Cocur\Slugify\Slugify;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Faker\Factory;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class UserFixtures extends Fixture
{
    private $genders = ['male', 'female'];
    private $hasher;

    public function __construct(UserPasswordHasherInterface $hasher)
    {
        $this->hasher = $hasher;
    }

    public function load(ObjectManager $manager): void
    {
        $faker = Factory::create('fr_FR');
        $slug = new Slugify();
        /* Boucle pour les USERS */
        for ($i = 0; $i <= 15; $i++) {
            $user = new User();
            $gender = $faker->randomElement($this->genders);
            $user->setFirstName($faker->firstName($gender));
            $user->setLastName($faker->lastName);
            $user->setEmail($slug->slugify($user->getFirstName()) . '.' . $slug->slugify($user->getLastName()) . '@gmail.com');
            $gender = $gender == 'male' ? 'm' : 'f';
            $user->setImage('0' . ($i + 10) . $gender . '.jpg');
            $user->setPassword($this->hasher->hashPassword($user, 'password'));
            $user->setCreatedAt(new \DateTimeImmutable());
            $user->setUpdatedAt(new \DateTimeImmutable());
            $user->setLastLogAt(new \DateTimeImmutable());
            $user->setIsDisabled($faker->boolean(10));
            $user->setRoles(['ROLE_USER']);
            $manager->persist($user);
        }
        $manager->flush();

        /* Boucle pour les Admnistrateurs */
        for ($i = 0; $i <= 5; $i++) {
            $user = new User();
            $gender = $faker->randomElement($this->genders);
            $user->setFirstName($faker->firstName($gender));
            $user->setLastName($faker->lastName);
            $user->setEmail($slug->slugify($user->getFirstName()) . '.' . $slug->slugify($user->getLastName()) . '@gmail.com');
            $gender = $gender == 'male' ? 'm' : 'f';
            $user->setImage('0' . ($i + 10) . $gender . '.jpg');
            $user->setPassword($this->hasher->hashPassword($user, 'password'));
            $user->setCreatedAt(new \DateTimeImmutable());
            $user->setUpdatedAt(new \DateTimeImmutable());
            $user->setLastLogAt(new \DateTimeImmutable());
            $user->setIsDisabled($faker->boolean(10));
            $user->setRoles(['ROLE_ADMIN']);
            $manager->persist($user);
        }
        $manager->flush();

        /* Super Admin Frederic Louis */
        $user = new User();
        $user->setFirstName('Frederic');
        $user->setLastName('Louis');
        $user->setEmail('fred.louis@gmail.com');
        $user->setImage('071m.jpg');
        $user->setPassword($this->hasher->hashPassword($user, 'password'));
        $user->setCreatedAt(new \DateTimeImmutable());
        $user->setUpdatedAt(new \DateTimeImmutable());
        $user->setLastLogAt(new \DateTimeImmutable());
        $user->setIsDisabled(false);
        $user->setRoles(['ROLE_SUPER_ADMIN']);
        $manager->persist($user);
        $manager->flush();

        /* Super Admin Bruno Louis */
        $user = new User();
        $user->setFirstName('Bruno');
        $user->setLastName('Louis');
        $user->setEmail('bruno.louis@gmail.com');
        $user->setImage('076m.jpg');
        $user->setPassword($this->hasher->hashPassword($user, 'password'));
        $user->setCreatedAt(new \DateTimeImmutable());
        $user->setUpdatedAt(new \DateTimeImmutable());
        $user->setLastLogAt(new \DateTimeImmutable());
        $user->setIsDisabled(false);
        $user->setRoles(['ROLE_SUPER_ADMIN']);
        $manager->persist($user);
        $manager->flush();
    }
}
