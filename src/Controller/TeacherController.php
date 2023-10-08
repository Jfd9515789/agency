<?php

namespace App\Controller;

use App\Repository\ProfesseurRepository;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class TeacherController extends AbstractController
{
    #[Route('/teacher', name: 'teacher')]
    public function teacher(ProfesseurRepository $repository): Response
    {
        $professeurs = $repository->findBy(
            [],
            ["lastName" => 'ASC']
        );

        return $this->render('teacher/teacher.html.twig', [
            'professeurs' => $professeurs
        ]);
    }
}
