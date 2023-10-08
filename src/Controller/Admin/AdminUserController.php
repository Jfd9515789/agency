<?php

namespace App\Controller\Admin;

use App\Entity\Destination;
use App\Entity\User;
use App\Form\DestinationType;
use App\Form\UserType;
use App\Repository\UserRepository;
use Cocur\Slugify\Slugify;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;

class AdminUserController extends AbstractController
{
    /**
     * @param UserRepository $repository
     * @return Response
     */
    #[Route('/admin/user', name: 'admin_user')]
    public function viewUser(UserRepository $repository): Response
    {
        $users = $repository->findby(
            [],
            ['lastName' => 'ASC']
        );

        return $this->render('admin/users/user.html.twig', [
            'users' => $users,
        ]);
    }

    #[Route('/admin/viewuser/{id}', name: 'admin_view_user')]
    public function viewDisabledUser(User $user, EntityManagerInterface $manager): Response
    {
        $user->setIsDisabled(!$user->getIsDisabled());
        $manager->flush();
        return $this->redirectToRoute('admin_user');
    }

    #[Route('/admin/promote/{id}/{role}', name: 'admin_user_promote')]
    public function userPromote(User $user, EntityManagerInterface $manager, $role): Response
    {
        $user->setRoles([$role]);
        $manager->flush();

        return $this->redirectToRoute("admin_user");
    }

    #[Route('admin/newuser', name: 'admin_new_user')]
    public function newUser(UserPasswordHasherInterface $userPasswordHasherInterface, EntityManagerInterface $manager, Request $request): Response
    {
        $user = new User();
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $user->setPassword(
                $userPasswordHasherInterface->hashPassword(
                    $user,
                    $form->get('plainPassword')->getData()
                )
            );
            $user->setRoles(['ROLE_USER']);
            if (empty($user->getImage())) {
                $user->setImage('default.jpg');
            }
            $user->setCreatedAt(new \DateTimeImmutable());
            $user->setUpdatedAt(new \DateTimeImmutable());
            $user->setLastLogAt(new \DateTimeImmutable());
            $manager->persist($user);
            $manager->flush();
            $this->addFlash(
                'success',
                'L\'utilisateur ' . $user->getFirstName() . ' ' . $user->getLastName() . ' a bien été ajoutée.'
            );
            return $this->redirectToRoute('admin_user');
        }

        return $this->renderForm('admin/users/adduser.html.twig', [
            'form' => $form
        ]);
    }

    #[Route('/admin/edituser/{id}', name: 'admin_edit_user')]
    public function editUser(User $user, EntityManagerInterface $manager, Request $request): Response
    {
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            if (empty($user->getImage())) {
                $user->setImage('default.jpg');
            }
            $user->setCreatedAt(new \DateTimeImmutable());
            $user->setUpdatedAt(new \DateTimeImmutable());
            $user->setLastLogAt(new \DateTimeImmutable());
            $manager->persist($user);
            $manager->flush();

            $this->addFlash(
                'success',
                'L\'utilisateur ' . $user->getFirstName() . ' ' . $user->getLastName() . ' a bien été modifié'
            );

            return $this->redirectToRoute('admin_user');
        }
        return $this->render('admin/users/edituser.html.twig', [
            'form' => $form->createView(),
        ]);
    }
}