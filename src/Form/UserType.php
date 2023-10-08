<?php

namespace App\Form;

use App\Entity\User;
use phpDocumentor\Reflection\Types\String_;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;
use function PHPUnit\Framework\stringContains;

class UserType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('firstName', TextType::class, [
                'label' => 'Votre prénom',
                'attr' => [
                    "placeholder" => 'Votre nouveau prénom'
                ]
            ])
            ->add('lastName', TextType::class, [
                'label' => 'Votre nom de famille',
                'attr' => [
                    "placeholder" => 'Votre nouveau nom de famille'
                ]
            ])
            ->add('email', EmailType::class, [
                'label' => 'Votre E-Mail',
                'attr' => [
                    "placeholder" => 'Votre nouvel E-Mail'
                ]
            ])
            ->add('plainPassword', PasswordType::class, [
                'label' => 'Votre Mot de passe',
                'mapped' => false,
                'attr' => ['autocomplete' => 'new-password'],
                'constraints' => [
                    new NotBlank([
                        'message' => 'Entrer votre mot de passe actuel',
                    ]),
                    new Length([
                        'min' => 6,
                        'minMessage' => 'Votre mot de passe doit contenir au minimum {{ limit }}',
                        // max length allowed by Symfony for security reasons
                        'max' => 64,
                    ]),
                ],
            ])
            ->add('isDisabled', CheckboxType::class, [
                'label' => 'J\'accepte les conditions d\'utilisation',
            ])
            ->add('Submit', SubmitType::class, [
                'validation_groups' => ['Registration'],
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
