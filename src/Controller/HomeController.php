<?php

namespace App\Controller;

use App\Repository\ActivitiesRepository;
use App\Repository\DestinationRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    #[Route('/', name: 'home')]
    public function index(DestinationRepository $destinationRepository, ActivitiesRepository $activitiesRepository): Response
    {
        $activities = $activitiesRepository->findBy(
            ['isPublished' => true],
            ['name' => 'ASC'],
        );

        $destinations = $destinationRepository->findBy(
            ['isPublished' => true],
            ['name' => 'ASC'],
        );

        return $this->render('home/home.html.twig', [
            'activities' => $activities,
            'destinations' => $destinations,
        ]);
    }
}
