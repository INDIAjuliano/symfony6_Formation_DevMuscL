<?php

namespace App\Controller;

use App\Entity\Ingredient;
use App\Form\IngredientType;
use App\Repository\IngredientRepository;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;
use Doctrine\ORM\EntityManagerInterface;
use PhpParser\Node\Expr\Cast\Int_;

class IngredientController extends AbstractController
{
     /**
      * this function display all ingredients
      *
      * @param IngredientRepository $repository
      * @param PaginatorInterface $paginator
      * @param Request $request
      * @return Response
      */

    #[Route('/ingredient', 'ingredient.index', methods:['GET'])]
    public function index(
        IngredientRepository $repository,
        PaginatorInterface $paginator,
        Request $request
        ): Response {
        $ingredients = $paginator->paginate(
            $repository->findAll(), /* query NOT result */
            $request->query->getInt('page', 1), /*page number*/
            10 /*limit per page*/
            );

        // dd($ingredients);
        return $this->render('pages/ingredient/index.html.twig', [
            'ingredients'=> $ingredients
        ]);
    }
    // le formulaire Creat (CRUD)

    #[Route('/ingredient/nouveau', 'ingredient.new', methods : ['GET','POST'])] // la soumission de formulaire (Post)
    public function new(
        Request $request,
        EntityManagerInterface $manager
    ): Response {
        $ingredient = new Ingredient();
        $form = $this->createForm(IngredientType::class, $ingredient);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $ingredient = $form->getData();
            $ingredient->setUser($this->getUser());

            $manager->persist($ingredient);
            $manager->flush();
            
            //======== message flash ======
            $this->addFlash(
                'notice',
                'Votre ingrédinet a été créé avec succès !'
            );

            return $this->redirectToRoute('ingredient_index');

        }
        return $this->render('pages/ingredient/new.html.twig', [
            'form' => $form->createView() // créer la formulaire dans le vew
        ]);
    }

    /**
     * This controller allow us to create a new Ingredient
     * 
     * @param EntityManagerInterface $manager
     * @param Request $request
      * @return Response
     */

     // --------------------------- à vérifier : non opérationnel (injection d'ingredient) ----------------------------
    #[Route('/ingredient/edition/{id}', name: "ingredient.edit", methods: ['GET', 'POST'])]

    /**
    * @Route('/ingredient/edition/{id}', name="ingredient.edit", methods={"GET","POST"})
    * @ParamConverter("ingredient", class="App\Entity\Ingredient")
    */
    public function edit(
        IngredientRepository $repository,
        // Ingredient $ingredient,
        Int $id,
        Request $request,
        EntityManagerInterface $manager
    ): Response {
        $ingredient = $repository->findOneBy(["id" => $id]);



        $form = $this->createForm(IngredientType::class, $ingredient);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $ingredient = $form->getData();

            $manager->persist($ingredient);
            $manager->flush();

            $this->addFlash(
                'success',
                'Votre ingrédient a été modifié avec succès !'
            );

            return $this->redirectToRoute('ingredient.index');
        }

        return $this->render('pages/ingredient/edit.html.twig', [
            'form' => $form->createView()
        ]);
    }

    
    /**
     * this controller allow us to delete an ingredient
     *
     * @param EntityManagerInterface $manager
     * @param Ingredient $ingredient
     * @return Response
     */

    #[Route('/ingredient/suppression/{id}',name:'ingredient.delete', methods: ['GET'])]

    public function delete(EntityManagerInterface $manager, Ingredient $ingredient) : Response
    {
        if(!$ingredient){
            //======== message flash ======
        $this->addFlash(
        'notice',
        'L\' ingrédinet n\'a pas été trouvé!'
    );
        }
        $manager->remove($ingredient);
        $manager->flush();

        //======== message flash ======
    $this->addFlash(
        'notice',
        'Votre ingrédinet a été supprimé avec succès !'
    );

        return $this->redirectToRoute('ingredient.index');
    }
    
}

