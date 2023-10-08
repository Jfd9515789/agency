<?php

namespace App\Controller\Admin;

use App\Entity\Activities;
use App\Form\ActivitiesType;
use App\Repository\ActivitiesRepository;
use Cocur\Slugify\Slugify;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AdminActivitiesController extends AbstractController
{
    /**
     * @param ActivitiesRepository $activitiesRepository
     * @return Response
     */
    #[Route('/admin/activities', name: 'admin_activities')]
    public function activities(ActivitiesRepository $activitiesRepository): Response
    {
        $activities = $activitiesRepository->findBy(
            ['isPublished' => true]
        );

        return $this->render('admin/activities/activities.html.twig', [
            'activities' => $activities,
        ]);
    }

    /**
     * @param Activities $activitie
     * @param EntityManagerInterface $manager
     * @param Request $request
     * @return Response
     */
    #[Route('/admin/delactivities/{id}', name: 'admin_del_activities')]
    public function delActivities(Activities $activitie, EntityManagerInterface $manager, Request $request): Response
    {
        $manager->remove($activitie);
        $manager->flush();

        $this->addFlash(
            'success',
            'L\'activité "' . $activitie->getName() . '" a bien été supprimé'
        );
        return $this->redirectToRoute('admin_activities');
    }

    /**
     * @param Activities $activitie
     * @param EntityManagerInterface $manager
     * @return Response
     */
    #[Route('/admin/viewactivities/{id}', name: 'admin_view_activitie')]
    public function viewActivities(Activities $activitie, EntityManagerInterface $manager): Response
    {
        $activitie->setIsPublished(!$activitie->getIsPublished());
        $manager->flush();
        return $this->redirectToRoute('admin_activities');
    }

    #[Route('admin/newActivities', name: 'admin_new_activitie')]
    public function newActivitie(EntityManagerInterface $manager, Request $request): Response
    {
        $activitie = new Activities();

        $form = $this->createForm(ActivitiesType::class, $activitie);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $slug = new Slugify();
            if (empty($activitie->getImage())) {
                $activitie->setImage('default.jpg');
            }
            $activitie->setSlug($slug->slugify($activitie->getName()));
            $activitie->setCreatedAt(new \DateTimeImmutable());
            $activitie->setUpdatedAt(new \DateTimeImmutable());
            $activitie->setIsPublished(true);
            $manager->persist($activitie);
            $manager->flush();

            $this->addFlash(
                "success",
                'L\'activité ' . $activitie->getName() . ' a bien été ajoutée.'
            );

            return $this->redirectToRoute('admin_activities');
        }
        return $this->renderForm('admin/activities/newactivitie.html.twig', [
            'form' => $form
        ]);
    }

    #[Route('/admin/editactivitie/{id}', name: 'admin_edit_activitie')]
    public function editActivitie(Activities $activitie, EntityManagerInterface $manager, Request $request): Response
    {
        $form = $this->createForm(ActivitiesType::class, $activitie);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $slug = new Slugify();
            if (empty($activitie->getImage())) {
                $activitie->setImage('default.jpg');
            }
            $activitie->setSlug($slug->slugify($activitie->getName()));
            $activitie->setCreatedAt(new \DateTimeImmutable());
            $activitie->setIsPublished(true);
            $manager->persist($activitie);
            $manager->flush();
            $this->addFlash(
                "success",
                'L\'activité ' . $activitie->getName() . ' a bien été modifiée.'
            );
            return $this->redirectToRoute('admin_activities');
        }

        return $this->renderForm('admin/activities/editactivitie.html.twig', [
            'form' => $form
        ]);
    }
}