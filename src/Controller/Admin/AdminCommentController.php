<?php

namespace App\Controller\Admin;

use App\Entity\Comment;
use App\Repository\CommentRepository;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AdminCommentController extends AbstractController
{

    /**
     * @param CommentRepository $repository
     * @return Response
     */
    #[Route('/admin/comment', name: 'admin_comment')]
    public function index(CommentRepository $repository): Response
    {
        $comments = $repository->findAll();

        return $this->render('admin/comments/comment.html.twig', [
            'comments' => $comments
        ]);
    }

    /**
     * @param Comment $comment
     * @param EntityManagerInterface $manager
     * @param Request $request
     * @param UserRepository $userrepository
     * @return Response
     */
    #[Route('/admin/delcomment/{id}', name: 'admin_del_comment')]
    public function delComment(Comment $comment, EntityManagerInterface $manager, Request $request, UserRepository $userrepository): Response
    {
        $manager->remove($comment);
        $manager->flush();

        $this->addFlash(
            'success',
            'Le commentaire "' . $comment->getTitle() . '" a bien été supprimé'
        );
        return $this->redirectToRoute('admin_comment');
    }

    /**
     * @param Comment $comment
     * @param EntityManagerInterface $manager
     * @return Response
     */
    #[Route('/admin/viewcomment/{id}', name: 'admin_view_comment')]
    public function viewCourse(Comment $comment, EntityManagerInterface $manager): Response
    {
        $comment->setIsPublished(!$comment->getIsPublished());
        $manager->flush();
        return $this->redirectToRoute('admin_comment');
    }
}
