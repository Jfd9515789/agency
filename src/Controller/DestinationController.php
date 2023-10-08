<?php

namespace App\Controller;

use App\Entity\Comment;
use App\Entity\Destination;
use App\Form\CommentType;
use App\Repository\DestinationRepository;
use App\Repository\ProvinceRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DestinationController extends AbstractController
{
    #[Route('/destinations', name: 'destinations')]
    public function destinations(ProvinceRepository $provinceRepository, DestinationRepository $destinationRepository): Response
    {
        $provinces = $provinceRepository->findBy(
            [],
            ['name' => 'ASC']
        );
        $destinations = $destinationRepository->findBy(
            ['isPublished' => true],
            ['name' => 'ASC']
        );

        return $this->render('destination/destinations.html.twig', [
            'provinces' => $provinces,
            'destinations' => $destinations
        ]);
    }

    /**
     * @param Destination $destination
     * @param Request $request
     * @param EntityManagerInterface $manager
     * @return Response
     */
    #[Route('/destination/{slug}', name: 'destination')]
    public function destination(Destination $destination, Request $request, EntityManagerInterface $manager): Response
    {
        $comment = new Comment();
        $form = $this->createForm(CommentType::class, $comment);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $comment->setAuthor($this->getUser());
            $comment->setDestination($destination);
            $comment->setIsPublished(true);
            $comment->setCreatedAt(new \DateTimeImmutable());
            $manager->persist($comment);
            $manager->flush();
            // Création du message flash
            $this->addFlash(
                'success',
                'Votre commentaire a bien été posté!'
            );
        }

        return $this->renderForm('destination/destination.html.twig', [
            'destination' => $destination,
            'form' => $form
        ]);
    }
}