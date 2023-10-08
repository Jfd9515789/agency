<?php

namespace App\Controller;


use App\Entity\User;
use App\Form\EditPasswordType;
use App\Form\EditProfilType;
use App\Form\RegistrationFormType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;

class UserController extends AbstractController
{
    /**
     * @return Response
     */
    #[Route('/profil/{id}', name: 'profil')]
    public function profil(): Response
    {

        return $this->render('user/profil.html.twig');
    }

    /**
     * @param User $user
     * @param EntityManagerInterface $manager
     * @param Request $request
     * @return Response
     */
    #[Route('/edit-profil/{id}', name: 'edit_profil')]
    public function editProfil(User $user, EntityManagerInterface $manager, Request $request): Response
    {
        $form = $this->createForm(EditProfilType::class, $user);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $user->setCreatedAt(new \DateTimeImmutable());
            $user->setUpdatedAt(new \DateTimeImmutable());
            $user->setLastLogAt(new \DateTimeImmutable());
            $manager->persist($user);
            $manager->flush();
            return $this->redirectToRoute('home');
        }
        return $this->render('user/edit-profil.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    /**
     * @param Request $request
     * @param EntityManagerInterface $manager
     * @param UserPasswordHasherInterface $userPasswordHasherInterface
     * @return Response
     */
    #[Route('/edit-password/{id}', name: 'edit_password')]
    public function editPassword(User $user, Request $request, UserPasswordHasherInterface $userPasswordHasherInterface, EntityManagerInterface $manager): Response
    {
        $form = $this->createForm(EditPasswordType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $user->setPassword(
                $userPasswordHasherInterface->hashPassword(
                    $user,
                    $form->get('password')->getData()
                )
            );
            $manager->persist($user);
            $manager->flush();
            return $this->redirectToRoute('home');
        }

        return $this->renderForm('user/edit-password.html.twig', [
            'form' => $form
        ]);
    }
}
