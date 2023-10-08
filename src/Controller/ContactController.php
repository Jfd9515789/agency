<?php

namespace App\Controller;

use App\Entity\Contact;
use App\Form\ContactType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mailer\Exception\TransportExceptionInterface;
use Symfony\Component\Routing\Annotation\Route;

class ContactController extends AbstractController
{
    /**
     * @param Request $request
     * @param MailerController $mailerController
     * @return Response
     * @throws TransportExceptionInterface
     */
    #[Route('/contact', name: 'contact')]
    public function contact(Request $request, MailerController $mailerController): Response
    {
        $contact = new Contact();
        $form = $this->createForm(ContactType::class, $contact);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $mailerController->sendMail($contact);
            $this->addFlash(
                'success',
                'Votre email a bien été envoyé'
            );

            return $this->redirectToRoute('home');
        }
        return $this->renderForm('contact/contact.html.twig', [
            'form' => $form
        ]);
    }
}
