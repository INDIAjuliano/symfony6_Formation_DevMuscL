<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\RegistrationType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class SecurityController extends AbstractController
{
     /**
     * ---------------this Controller allow us to login-------------
     *
     * @param AuthenticationUtils $authenticationUtils
     * @return Response
     */
    #[Route('/connexion', name: 'security.login', methods:['GET','POST'])]
    public function index(AuthenticationUtils $authenticationUtils): Response
    {
     
        return $this->render('pages/security/login.html.twig', [
            'last_username' => $authenticationUtils->getLastUsername(),
            'error' => $authenticationUtils->getLastAuthenticationError()
        
            // 'controller_name' => 'SecurityController',
        ]);
    }

    /**
     * This Controller allow us to logout
     *
     * @return void
     */
    #[Route('/deconnexion', 'security.logout')]
    public function logout()
    {
        //Nothing
    }

    /**
     * -----------This Controller allow us to register --------------
     *
     * @param Request $request
     * @param EntityManagerInterface $manager
     * @return Response
     */
    #[Route('/inscription', 'security.registration', methods: ['GET', 'POST'])]
    public function registration(Request $request,EntityManagerInterface $manager) : Response 
    {
        $user = new User();
        $user-> setRoles(['ROLE_USER']);

        $form = $this->createForm(RegistrationType::class, $user);

        $form->handleRequest($request);

        if ($form->isSubmitted() &&  $form->isValid()) {
            $user = $form->getData();

            $this->addFlash(
                'notice',
                "Votre compte a bien été créé"
            );

            $manager->persist($user);
            $manager->flush();

            return $this->redirectToRoute('security.login');
        }
        return $this->render('pages/security/registration.html.twig', [
            'form' => $form->createView()
        ]);  
    }
}
