<?php

namespace App\Controller\Admin;

use App\Entity\Destination;
use App\Form\DestinationType;
use App\Repository\DestinationRepository;
use Cocur\Slugify\Slugify;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class
AdminDestinationController extends AbstractController
{
    #[Route('/admin/destination', name: 'admin_destinations')]
    public function adminDestinations(DestinationRepository $destinationRepository): Response
    {
        $destinations = $destinationRepository->findBy(
            [],
            ['createdAt' => 'ASC']
        );

        return $this->render('admin/destinations/destinations.html.twig', [
            'destinations' => $destinations,
        ]);
    }

    #[Route('/admin/viewdestination/{id}', name: 'admin_view_destination')]
    public function viewDestination(Destination $destination, EntityManagerInterface $manager): Response
    {
        $destination->setIsPublished(!$destination->getIsPublished());
        $manager->flush();
        return $this->redirectToRoute('admin_destinations');
    }

    #[Route('/admin/deldestination/{id}', name: 'admin_del_destination')]
    public function delDestination(Destination $destination, EntityManagerInterface $manager): Response
    {
        $manager->remove($destination);
        $manager->flush();
        $this->addFlash(
            'success',
            'La destination ' . $destination->getName() . ' a bien été supprimé'
        );
        return $this->redirectToRoute('admin_destinations');
    }

    #[Route('/admin/newdestination', name: 'admin_new_destination')]
    public function newDestination(EntityManagerInterface $manager, Request $request): Response
    {
        $destination = new Destination();

        $form = $this->createForm(DestinationType::class, $destination);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $slug = new Slugify();
            if (empty($destination->getImage())) {
                $destination->setImage('default.jpg');
            }
            if (empty($destination->getProgram())) {
                $destination->setProgram('26.pdf');
            }
            $destination->setSlug($slug->slugify($destination->getName()));
            $destination->setCreatedAt(new \DateTimeImmutable());
            $destination->setIsPublished(true);
            /*On persiste uniquement en insert pas en edit*/
            $manager->persist($destination);
            $manager->flush();
            $this->addFlash(
                'success',
                'La destination ' . $destination->getName() . ' a bien été ajoutée.'
            );
            return $this->redirectToRoute('admin_destinations');
        }

        return $this->renderForm('admin/destinations/newdestination.html.twig', [
            'form' => $form
        ]);
    }

    #[Route('/admin/editdestination/{id}', name: 'admin_edit_destination')]
    public function editDestination(Destination $destination, EntityManagerInterface $manager, Request $request): Response
    {
        $form = $this->createForm(DestinationType::class, $destination);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $slug = new Slugify();
            if (empty($destination->getImage())) {
                $destination->setImage('default.jpg');
            }
            if (empty($destination->getProgram())) {
                $destination->setProgram('26.pdf');
            }
            $destination->setSlug($slug->slugify($destination->getName()));
            $destination->setCreatedAt(new \DateTimeImmutable());
            $destination->setIsPublished(true);
            $manager->persist($destination);
            $manager->flush();
            $this->addFlash(
                'success',
                'La destination ' . $destination->getName() . ' a bien été modifié.'
            );
            return $this->redirectToRoute('admin_destinations');
        }

        return $this->renderForm('admin/destinations/editdestination.html.twig', [
            'form' => $form
        ]);
    }

}