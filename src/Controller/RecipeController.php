<?php

namespace App\Controller;

use App\Entity\Mark;
use App\Entity\Recipe;
use App\Form\MarkType;
use App\Form\RecipeType;
use App\Repository\MarkRepository;
use App\Repository\RecipeRepository;
use Doctrine\ORM\EntityManagerInterface;
use Knp\Component\Pager\PaginatorInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Cache\Adapter\FilesystemAdapter;
use Symfony\Contracts\Cache\ItemInterface;
class RecipeController extends AbstractController
{
    /**
     * this controller display all recipes
     *
     * @param RecipeRepository $repository
     * @param PaginatorInterface $paginator
     * @param Request $request
     * @return Response
     */

    #[Route('/recette', name: 'recipe.index', methods:['GET'])]
    public function index(
        RecipeRepository $repository,
        PaginatorInterface $paginator,
        Request $request 
    ): Response {
        $recipes = $paginator->paginate(
            $repository->findAll(), /* query NOT result */
            $request->query->getInt('page', 1), /*page number*/
            10 /*limit per page*/
            );
        return $this->render('pages/recipe/index.html.twig', [
            'recipes' => $recipes,
        ]);
    }

    /**
     * This controller allow us to create a new recipe
     *
     * @param Request $request
     * @param EntityManagerInterface $manager
     * @return Response
     */

    #[Route('/recette/creation','recipe.new', methods: ['GET','POST'])]
    public function new(
        Request $request,
        EntityManagerInterface $manager
    ) : Response {

        $recipe = new Recipe();
        $form = $this->createForm(RecipeType::class, $recipe);
        
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid())
        {
            $recipe = $form->getData();

            $manager->persist($recipe);
            $manager->flush();

            //======== message flash ======
            $this->addFlash(
                'notice',
                'Votre recette a été créé avec succès !'
            );


            // dd($form->getData());
            return $this->redirectToRoute('recipe.index');

        }
        return $this->render('pages/recipe/new.html.twig', [
            'form' => $form->createView()
        ]);
    }

    
    /**
     * This controller allow us to edit a recipe
     *
     * @param Recipe $recipe
     * @param Request $request
     * @param EntityManagerInterface $manager
     * @return Response
     */
    
    // #[Security("is_granted('ROLE_USER') and user === recipe.getUser()")]
    #[Route('/recette/edition/{id}', name: 'recipe.edit', methods: ['GET', 'POST'])]

    public function edit(
        RecipeRepository $repository,
        // Recipe $recipe,
        Int $id,
        Request $request,
        EntityManagerInterface $manager
    ): Response {
        $recipe = $repository->findOneBy(["id" => $id]);


        $form = $this->createForm(RecipeType::class, $recipe);
        $form->handleRequest($request);

      
        if ($form->isSubmitted() && $form->isValid()) {
            $recipe = $form->getData();

            $manager->persist($recipe);
            $manager->flush();

            $this->addFlash(
                'success',
                'Votre ingrédient a été modifié avec succès !'
            );

            return $this->redirectToRoute('recipe.index');
        }

        return $this->render('pages/recipe/edit.html.twig', [
            'form' => $form->createView()
        ]);
    }

    /**
     * This controller allow us to delete a recipe
     *
     * @param EntityManagerInterface $manager
     * @param Recipe $recipe
     * @return Response
     */

    #[Route('/recette/suppression/{id}',name:'recipe.delete', methods: ['GET'])]

    public function delete(EntityManagerInterface $manager, Recipe $recipe) : Response
    {
        if(!$recipe){
            //======== message flash ======
        $this->addFlash(
        'notice',
        'L\' Recette n\'a pas été trouvé!'
        );

        }
        $manager->remove($recipe);
        $manager->flush();

        //======== message flash ======
    $this->addFlash(
        'notice',
        'Votre Recette a été supprimé avec succès !'
    );

        return $this->redirectToRoute('recipe.index');
    }

    
}
