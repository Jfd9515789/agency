<?php

namespace App\Controller;

use App\Repository\ActivitiesRepository;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ActivitiesController extends AbstractController
{
    #[Route('/activities', name: 'activities')]
    public function activities(ActivitiesRepository $activitiesRepository, PaginatorInterface $paginator, Request $request): Response
    {
        $month = '2021-12-01';
        $activitiesmonths = $activitiesRepository->getActivitiesOfMonth($month);

        $activities = $activitiesRepository->findBy(
            ['isPublished' => true]
        );

        $pagination = $paginator->paginate(
            $activities,
            $request->query->getInt('page', 1),
            10
        );

        $pagination = $paginator->paginate(
            $activitiesmonths,
            $request->query->getInt('page', 1),
            10
        );

        return $this->render('activities/activities.html.twig', [
            'activities' => $pagination,
            'activitiesmonths' => $activitiesmonths
        ]);
    }
}