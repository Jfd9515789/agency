<?php

namespace App\Controller;

use App\Entity\Contact;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mailer\Exception\TransportExceptionInterface;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use Symfony\Component\Routing\Annotation\Route;

class MailerController extends AbstractController
{
    private MailerInterface $mailer;

    public function __construct(MailerInterface $mailer)
    {
        $this->mailer = $mailer;
    }

    /**
     * @throws TransportExceptionInterface
     */
    #[Route('/mailer', name: 'mailer')]
    public function sendMail(Contact $contact): Response
    {
        $email = (new TemplatedEmail())
            ->from($contact->getEmail())
            ->to('info@weblearning.be')
            ->replyTo($contact->getEmail())
            ->subject($contact->getSubject())
            ->text('Sending emails is fun again!')
            ->html('<h1>See Twig integration for better HTML integration!</h1>');

        $this->mailer->send($email);
        return $this->redirectToRoute('home');
    }
}
