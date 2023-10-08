<?php

namespace App\Form;

use App\Entity\Destination;
use Doctrine\ORM\EntityRepository;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\MoneyType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\NotBlank;

class DestinationType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name', TextType::class, [
                'label' => 'Nom du cours',
                'constraints' => array(
                    new NotBlank(),
                ),
            ])
            ->add('smallDescription', TextType::class, [
                'label' => 'Description courte',
                'constraints' => array(
                    new NotBlank(),
                ),
            ])
            ->add('fullDescription', TextType::class, [
                'label' => 'Description complète',
                'constraints' => array(
                    new NotBlank(),
                ),
            ])
            ->add('duration', IntegerType::class, [
                'label' => 'Durée de la destination',
                'constraints' => array(
                    new NotBlank(),
                ),
            ])
            ->add('price', MoneyType::class, [
                'label' => 'Prix de la destination',
            ])
            ->add('schedule', TextType::class, [
                'label' => 'Horaire de la destination',
                'constraints' => array(
                    new NotBlank(),
                ),
            ])
            ->add('province', EntityType::class, [
                'label' => 'Province de la destination',
                'placeholder' => 'Sélectionnez...',
                'class' => 'App\Entity\Province',
                'choice_label' => 'name',
                'query_builder' => function (EntityRepository $repository) {
                    return $repository->createQueryBuilder('p')->orderBy('p.name', 'ASC');
                }
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Destination::class,
        ]);
    }
}
