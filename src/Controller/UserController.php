<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\UserType;
use App\Form\UserPasswordType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\Security\Core\Validator\Constraints\UserPassword;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class UserController extends AbstractController
{
   
    /**
     * ------------------------- This controller allow us to edit user's profie -------------------------------
     *
     * @param User|null $user
     * @param Request $request
     * @param EntityManagerInterface $manager
     * @return Response
     */
    #[Route('/utilisateur/edition/{id}', name: 'user.edit', methods: ['GET', 'POST'])]

    public function editUser(
        User $user = null, 
        Request $request, 
        EntityManagerInterface $manager,
        UserPasswordHasherInterface $hasher
    ): Response {

        
        if (!$user) {
            throw new NotFoundHttpException('L\'utilisateur demandé n\'existe pas.');
        }
        //  pour verifier si un autre user modifier un compte d'un autre utilisateur
        if (!$this->getUser()) {
            // pour verifier s'il est connecté ou pas!
            return $this->redirectToRoute('security.login');
        }
        // dd($user, $this->getUser());
        // Verifier si l'user courant est l'user  à modifier
        if($this->getUser() !== $user) {
            return $this->redirectToRoute('recipe.index');
        }
        // création d'un formulair
        $form = $this->createForm(UserType::class, $user);

        // Pour recuper les donnés dans la base
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()) {
            // Pour modifier: le mot de passe doit être égale au mdp enregisté
            if($hasher->isPasswordValid($user, $form->getData()->getPlainPassword()))
            {
                $user = $form->getData();
                $manager->persist($user);
                $manager->flush();

                // Message flash
                $this->addFlash(
                    'success',
                    'Les informations de votre compte ont bien été modifiées.'
                );
                return $this->redirectToRoute('recipe.index');
            }else {
                // Message flash
                $this->addFlash(
                    'warning',
                    'Le mot de passe renseigné est incorrecte.'
                );
                // return $this->redirectToRoute('recipe.index');
            }
        }

        return $this->render('pages/user/edit.html.twig', [
            'form' => $form->createView(),
        ]);
    }
        #[Route('/utilisateur/edition-mot-de-passe/{id}', 'user.edit.password', methods: ['GET', 'POST'])]
        Public function editPassword(
            User $choosenUser, 
            Request $request,
            EntityManagerInterface $manager,
            UserPasswordHasherInterface $hasher
        ) : Response{
            $form = $this->createForm(UserPasswordType::class);

            // dd($form);
            $form->handleRequest($request);
            if($form->isSubmitted() && $form->isValid()) {
                // dd($form->getData());
                // verfication et comparaison de password par rapport dans le BD
                if($hasher->isPasswordValid($choosenUser, $form->getData()['plainPassword'])) {
                    $choosenUser->setPlainPassword(
                        $hasher->hashPassword(
                            $choosenUser,
                            $form->getData()['newPassword']
                        )
                    );
                    $this->addFlash(
                        'success',
                        'Le mot de passe a été modifié.'
                    );
                    $manager->persist($choosenUser);
                    $manager->flush();
                return $this->redirectToRoute('recipe.index');
                }else {
                // Message flash
                $this->addFlash(
                    'warning',
                    'Le mot de passe renseigné est incorrecte.'
                );
                // return $this->redirectToRoute('recipe.index');
            }
            }
            return $this->render('pages/user/edit_password.html.twig', [
            'form' => $form->createView()
        ]);
    }
}
