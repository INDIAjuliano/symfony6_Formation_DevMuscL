<?php 

namespace App\Event;

use App\Entity\User;
use App\Repository\UserRepository;
use Symfony\Component\HttpKernel\Event\ControllerEvent;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class ParamConverterSubscriber implements EventSubscriberInterface 
{
    protected UserRepository $UserRepository;
    public function __construct(UserRepository $UserRepository)
    {
        $this->UserRepository =  $UserRepository;
    }
    public static function getSubscribedEvents()
    {
        return [
            'kernel.controller' => 'onkernelController'
        ];
    }

    public function onkernelController(ControllerEvent $e) {
        $request = $e->getRequest();

        $id = $request->attributes->get('id');

        $user = $this->UserRepository->findOneBy([
            'id' => $id
        ]);

        $request->attributes->set('User', $user);
    }
}