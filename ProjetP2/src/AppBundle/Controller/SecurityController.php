<?php

namespace AppBundle\Controller;

use AppBundle\Entity\User;
use AppBundle\form\Type\UserType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class SecurityController extends Controller
{

    /**
     * @Route("/login", name="login")
     * @Template("/security/login.html.twig")
     */
    public function loginAction()
    {
        return [];
    }

    /**
     * @param \Symfony\Component\HttpFoundation\Request $request
     * @param \Symfony\Component\Security\Http\Authentication\AuthenticationUtils $authenticationUtils
     * @return array
     *
     * @Template("/security/_login.html.twig")
     */
    public function renderLoginAction(
        Request $request,
        AuthenticationUtils $authenticationUtils
    ) {
        // get the login error if there is one
        $error = $authenticationUtils->getLastAuthenticationError();

        // last username entered by the user
        $lastUsername = $authenticationUtils->getLastUsername();

        return ['lastUsername' => $lastUsername, 'error' => $error];



    }

    /**
     * @param \Symfony\Component\HttpFoundation\Request $request
     * @Route("/register", name="register")
     */
    public function registerAction(Request $request, UserPasswordEncoderInterface $encoder)
    {
        $user = new User();

        $form = $this->createForm(UserType::class, $user);
        $form->add('Inscription', SubmitType::class,array(
            'attr' => array('class' => 'mdc-button mdc-button--raised')));

        $form->handleRequest($request);
        if ($form->isValid()) {
            //$password = $encoder->encodePassword($user, $user->getPlainPassword());

            $user->setNbSurvey(0);
            $user->setStatus(0);
            $em = $this->getDoctrine()->getManager();
            $em->persist($user);
            $em->flush();

            return new RedirectResponse($this->generateUrl('homepage'));
        }

        return $this->render('/security/register.html.twig', [
            'form' => $form->createView(),
        ]);
    }
}

