<?php

namespace App\Form;

use App\Entity\User;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class EditProfilType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('email', EmailType::class, [
                'label' => 'Votre nouvel E-Mail',
                'attr' => [
                    "placeholder" => 'Votre nouvel E-Mail'
                ]
            ])

            ->add('firstName', TextType::class, [
                'label' => 'Votre prénom',
                'attr' => [
                    "placeholder" => 'Votre prénom'
                ]
            ])
            ->add('lastName', TextType::class, [
                'label' => 'Votre nom de famille',
                'attr' => [
                    "placeholder" => 'Votre nom de famille'
                ]
            ])
            ->add('isDisabled', CheckboxType::class, [
                'label' => 'J\'accepte les conditions d\'utilisation'
            ])
            ->add('Submit', SubmitType::class, [
                'validation_groups' => ['Registration'],
            ]);
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
