-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 21 juin 2022 à 10:18
-- Version du serveur : 8.0.29
-- Version de PHP : 8.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `travel`
--
CREATE DATABASE IF NOT EXISTS `travel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `travel`;

-- --------------------------------------------------------

--
-- Structure de la table `activities`
--

DROP TABLE IF EXISTS `activities`;
CREATE TABLE IF NOT EXISTS `activities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=349 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `activities`
--

INSERT INTO `activities` (`id`, `name`, `created_at`, `updated_at`, `content`, `image`, `is_published`, `slug`) VALUES
(338, 'Jeu de pistes', '2022-06-17 17:52:03', '2022-06-17 17:52:03', 'Jeu qui consiste à chercher, sur un itinéraire balisé par le meneur de jeu, des indices sous la forme de signes.', '01.jpg', 1, 'aut-laborum-autem'),
(339, 'Football', '2022-06-17 17:52:03', '2022-06-17 17:52:03', 'Sport collectif qui se joue avec un ballon sphérique entre deux équipes de onze joueurs.', '02.jpg', 1, 'sunt-accusamus-quia'),
(340, 'Basketball', '2022-06-17 17:52:03', '2022-06-17 17:52:03', 'Un match de basketball se résume facilement. Les joueurs essaie de lancer le ballon dans un panier.', '03.jpg', 1, 'earum-recusandae-et'),
(341, 'Baseball', '2022-06-17 17:52:03', '2022-06-17 17:52:03', 'Sport collectif dérivé des mêmes racines que le cricket, qui se pratique sur un terrain de gazon et de sable.', '04.jpg', 0, 'porro-placeat-qui'),
(342, 'Volleyball', '2022-06-17 17:52:03', '2022-06-17 17:52:03', 'Sport collectif opposant deux équipes de six joueurs séparées par un filet, qui s\'affrontent avec un ballon sur un terrain.', '05.jpg', 1, 'tempora-quos-hic'),
(343, 'Ping-pong', '2022-06-17 17:52:03', '2022-06-17 17:52:03', 'Sport de raquette opposant deux ou quatre joueurs autour d\'une table.', '06.jpg', 1, 'dolor-est-quae'),
(344, 'Tennis', '2022-06-17 17:52:03', '2022-06-17 17:52:03', 'Le tennis est une discipline individuelle. Il permet de développer l’endurance, la vitesse et l’adresse de l’enfant.', '07.jpg', 1, 'laboriosam-minima-nihil'),
(345, 'Judo', '2022-06-17 17:52:03', '2022-06-17 17:52:03', 'Le judo est un sport de combat qui développe la force et le mental. Il permet d’acquérir souplesse, endurance.', '08.jpg', 1, 'officiis-odio-quidem'),
(346, 'Karaté', '2022-06-17 17:52:03', '2022-06-17 17:52:03', 'Le karaté est également un sport de combat qui permet de développer la maîtrise de soi ainsi que la concentration.', '09.jpg', 1, 'id-ut-dolorum'),
(347, 'La capoeira', '2022-06-17 17:52:03', '2022-06-17 17:52:03', 'La capoeira est un sport de combat qui associe la danse, la gym et les arts martiaux. Il permet à l’enfant de se défouler et d’avoir confiance en lui.', '010.jpg', 1, 'quam-nulla-et');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `destination_id` int NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `rating` int NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9474526CF675F31B` (`author_id`),
  KEY `IDX_9474526C816C6140` (`destination_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1405 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id`, `author_id`, `destination_id`, `created_at`, `rating`, `comment`, `title`, `is_published`) VALUES
(1365, 915, 848, '2022-06-17 17:52:03', 5, 'Sequi harum repudiandae ut incidunt iusto laborum cum.', '', 1),
(1366, 915, 844, '2022-06-17 17:52:03', 2, 'Quo molestiae voluptas tenetur quia.', '', 1),
(1367, 935, 846, '2022-06-17 17:52:03', 3, 'Tenetur maiores enim et maiores et et. Error ea nobis aut repellendus ipsum laboriosam harum eos.', '', 1),
(1368, 930, 838, '2022-06-17 17:52:03', 4, 'Nam reprehenderit eos et quia. Nisi velit ea molestiae ea rem.', '', 1),
(1369, 934, 847, '2022-06-17 17:52:03', 5, 'Non ut saepe voluptates quis id voluptatibus et.', '', 1),
(1371, 914, 833, '2022-06-17 17:52:03', 3, 'Autem et modi qui cupiditate voluptatem.', '', 1),
(1372, 914, 844, '2022-06-17 17:52:03', 5, 'Aliquam nam quia ut dolor aspernatur ab.', '', 1),
(1373, 923, 852, '2022-06-17 17:52:03', 4, 'Omnis aut corporis qui veniam. Et qui repudiandae beatae eos fugit ut nihil.', '', 0),
(1374, 922, 833, '2022-06-17 17:52:03', 4, 'Ut deleniti necessitatibus laborum provident excepturi.', '', 1),
(1375, 919, 841, '2022-06-17 17:52:03', 2, 'Alias provident cupiditate voluptas quo.', '', 1),
(1376, 928, 840, '2022-06-17 17:52:03', 4, 'Dolor similique aut in ipsa molestias deleniti officia. Enim necessitatibus et ut veniam quaerat.', '', 1),
(1377, 929, 833, '2022-06-17 17:52:03', 4, 'Et harum fuga est quo. Quas ullam consectetur aspernatur molestias quaerat sit.', '', 1),
(1379, 915, 840, '2022-06-17 17:52:03', 5, 'Ut sed id molestiae modi est culpa assumenda. Dolore id libero ut illo et nostrum.', '', 1),
(1380, 920, 834, '2022-06-17 17:52:03', 5, 'Ipsum odit omnis velit nostrum ex cupiditate quam. Impedit explicabo molestias molestias eligendi.', '', 1),
(1381, 929, 843, '2022-06-17 17:52:03', 3, 'Ut iste vitae consequatur quae quia omnis soluta. Repudiandae dicta repellendus optio.', '', 1),
(1382, 929, 846, '2022-06-17 17:52:03', 4, 'Autem dolor nemo et unde eaque laudantium rerum.', '', 1),
(1383, 935, 852, '2022-06-17 17:52:03', 5, 'Quaerat voluptate cum nobis deleniti qui id possimus.', '', 0),
(1384, 920, 847, '2022-06-17 17:52:03', 5, 'Qui architecto ex odit doloribus alias vel quis.', '', 1),
(1386, 924, 856, '2022-06-17 17:52:03', 2, 'Animi distinctio quo ab voluptatem.', '', 1),
(1387, 927, 857, '2022-06-17 17:52:03', 3, 'Rerum doloribus perferendis aperiam doloribus sit magnam.', '', 0),
(1388, 927, 836, '2022-06-17 17:52:03', 3, 'Quo magni blanditiis rerum voluptatem. Distinctio inventore labore libero error voluptas saepe et.', '', 1),
(1390, 932, 846, '2022-06-17 17:52:03', 3, 'Et qui dolorem culpa voluptas iusto voluptate.', '', 1),
(1391, 935, 846, '2022-06-17 17:52:03', 1, 'Quia vero voluptate ullam a ex.', '', 1),
(1392, 934, 857, '2022-06-17 17:52:03', 2, 'Aperiam eos et laboriosam possimus. Repudiandae reprehenderit deserunt accusamus saepe nisi.', '', 1),
(1393, 916, 843, '2022-06-17 17:52:03', 2, 'Optio dolorum nobis exercitationem quia sunt.', '', 1),
(1395, 914, 846, '2022-06-17 17:52:03', 2, 'Et sunt accusamus dolor nisi. Sapiente praesentium ea quia voluptatum.', '', 0),
(1396, 922, 836, '2022-06-17 17:52:03', 5, 'Labore doloribus iste nulla. Suscipit nesciunt iusto est.', '', 1),
(1397, 927, 852, '2022-06-17 17:52:03', 5, 'Non quibusdam iusto amet quis ducimus eum debitis. Doloremque autem velit laboriosam in.', '', 1),
(1398, 919, 844, '2022-06-17 17:52:03', 3, 'In consequatur sint eius eligendi eveniet et. Delectus amet velit sit exercitationem qui.', '', 1),
(1399, 919, 856, '2022-06-17 17:52:03', 5, 'Quia quia beatae voluptas.', '', 1),
(1401, 928, 843, '2022-06-17 17:52:03', 4, 'Nulla et non laboriosam sint.', '', 1),
(1402, 923, 857, '2022-06-17 17:52:03', 3, 'Ad est nemo tenetur distinctio dolorem non modi.', '', 1),
(1403, 935, 845, '2022-06-18 08:17:26', 4, 'commentaire', '', 1),
(1404, 935, 837, '2022-06-18 08:42:35', 4, 'commentaire de test', '', 1);

-- --------------------------------------------------------

--
-- Structure de la table `destination`
--

DROP TABLE IF EXISTS `destination`;
CREATE TABLE IF NOT EXISTS `destination` (
  `id` int NOT NULL AUTO_INCREMENT,
  `province_id` int NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `small_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int NOT NULL,
  `price` double NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `image` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `schedule` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `program` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3EC63EAAE946114A` (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=859 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `destination`
--

INSERT INTO `destination` (`id`, `province_id`, `name`, `small_description`, `full_description`, `duration`, `price`, `created_at`, `slug`, `is_published`, `image`, `schedule`, `program`) VALUES
(833, 284, 'Musée de La Boverie', 'Installé dans un ancien palais construit pour l\'exposition universelle de Liège en 1905, La Boverie présente la collection permanente du musée des Beaux-Arts.', 'Installé dans un ancien palais construit pour l\'exposition universelle de Liège en 1905, La Boverie présente la collection permanente du musée des Beaux-Arts. De la Renaissance au XXe siècle, on peut y admirer aussi bien les œuvres de grands artistes locaux que d\'artistes mondialement reconnus : Ingres, Picasso, Chagall, Lambert Lombard, Delvaux, Monet,... La programmation du musée est également rythmée par de grandes expositions temporaires dont certaines en collaboration avec le musée du Louvre.', 18, 120, '2022-06-17 21:08:12', 'musee-de-la-boverie', 1, '2.jpg', 'Sunday', '2.pdf'),
(834, 277, 'La Maison de Rubens', 'La Maison de Rubens, en néerlandais le Rubenshuis, est l’ancienne demeure et l’atelier du peintre Pierre Paul Rubens.', 'La Maison de Rubens, en néerlandais le Rubenshuis, est l’ancienne demeure et l’atelier du peintre Pierre Paul Rubens (1577-1640). Dessiné par l’artiste en personne, elle s’inspire des palais italiens de la Renaissance. Aujourd’hui, sa maison abrite un musée, qui regroupe du mobilier du 17ème siècle, des œuvres de Rubens ainsi que de ses élèves ou amis !', 25, 80, '2022-06-17 21:07:34', 'la-maison-de-rubens', 1, '3.jpg', 'Wednesday', '3.pdf'),
(835, 285, 'Palais Grand-Ducal', 'Le Palais grand-ducal, la résidence de ville de la famille grand-ducale, se trouve au centre de la vieille ville.Jadis, l\'emplacement de l\'actuel palais.', 'Le Palais grand-ducal, la résidence de ville de la famille grand-ducale, se trouve au centre de la vieille ville.Jadis, l\'emplacement de l\'actuel palais accueillait le premier hôtel de ville de la capitale.', 20, 80, '2022-06-17 21:07:14', 'palais-grand-ducal', 1, '6.jpg', 'Saturday', '4.pdf'),
(836, 281, 'Les châteaux du Brabant Flamand', 'Le château de Beersel est situé au sud de Bruxelles. Il est construit entre 1300 et 1310.', 'Le château de Beersel est situé au sud de Bruxelles. Il est construit entre 1300 et 1310 et faisait partie d’une série de forteresses défensives entourant Bruxelles. Tout fait de briques, ce bel édifice surprend par sa forme elliptique. Un pont-levis en état de marche permet d’y accéder : ambiance médiévale garantie !', 30, 120, '2022-06-18 08:22:58', 'les-chateaux-du-brabant-flamand', 1, '5.jpg', 'Tuesday', '5.pdf'),
(837, 284, 'Coteaux de la Citadelle', 'Les Coteaux de la Citadelle sont un espace champêtre de plus de 90 hectares situé en partie dans le centre historique de Liège, dont près de la moitié sont classés au patrimoine naturel de la Région', 'Les Coteaux de la Citadelle sont un espace champêtre de plus de 90 hectares situé en partie dans le centre historique de Liège, dont près de la moitié sont classés au patrimoine naturel de la Région. Poumon vert situé à proximité du centre historique, le site des Coteaux de la Citadelle offre des vues uniques de Liège et de la vallée de la Meuse. Mélangeant nature et patrimoine, il compte de nombreux monuments emblématiques de la cité.', 25, 120, '2022-06-17 21:22:05', 'coteaux-de-la-citadelle', 1, '6.jpg', 'Monday', '6.pdf'),
(838, 277, 'Le Meir et le Palais du Meir-modification', 'De la Gare Centrale, en passant par la Maison de Rubens, s’étend la large avenue De Keyserlei.', 'De la Gare Centrale, en passant par la Maison de Rubens, s’étend la large avenue De Keyserlei, qui vous mènera à Le Meir, la plus grande rue commerçante de la ville. Vous y trouverez de nombreuses petites enseignes, des grands magasins de vêtements et des boutiques diverses, toutes logées dans de sublimes bâtiments historiques – ce qui fait le charme de ces avenues. En chemin, n’hésitez pas à admirer le magnifique Palais du Meir. Conçu dans la seconde moitié du 18ème siècle par l’architecte Jan-Peter van Baurscheit, il fut acheté par l’Empereur Napoléon qui souhaitait y séjourner, avant de servir de résidence secondaire à la famille royale belge.', 15, 80, '2022-06-18 08:39:03', 'le-meir-et-le-palais-du-meir-modification', 1, '7.jpg', 'Saturday', '7.pdf'),
(839, 278, 'Région de la Voer', 'Tranquillité, nature et plaisir. Trois mots clés qui décrivent parfaitement la région de Voer.', 'Tranquillité, nature et plaisir. Trois mots clés qui décrivent parfaitement la région de Voer.', 14, 120, '2022-06-17 21:14:00', 'region-de-la-voer', 1, '8.jpg', 'Saturday', '8.pdf'),
(840, 280, 'Le tour des brasseries', 'Visiter la Flandre Orientale sans passer par la case découverte des bières locales est un sacrilège.', 'Visiter la Flandre Orientale sans passer par la case découverte des bières locales est un sacrilège. En effet, la région compte quelques noms de bières parmi les plus célèbres au monde.\n\nLa culture brassicole belge est d’ailleurs classée à l’Unesco depuis 2016. Et la ville d’Oudenaarde en abrite deux célèbres justement. La brasserie Liefmans existe depuis 1679 et produit une bière à la cerise. Fait exceptionnel qui mérite d’être souligné, elle est dirigée par la première femme maître-brasseur de Belgique.', 13, 120, '2022-06-17 17:52:03', 'optio-odit', 1, '9.jpg', 'Monday', '9.pdf'),
(841, 286, 'Le Delta', 'Située au confluent de la Sambre et de la Meuse, au pied de la Citadelle, la Maison de la Culture de Namur a fait peau neuve pour devenir le DELTA.', 'Située au confluent de la Sambre et de la Meuse, au pied de la Citadelle, la Maison de la Culture de Namur a fait peau neuve pour devenir le DELTA.\n\nSalles d’exposition, trois salles de spectacle, studios d’enregistrement, centre de documentation, espaces d’animation et de formation, terrasse panoramique….\n\nLe DELTA est pensé comme « un tiers –lieu », espace de vie et de rencontre agrémenté d’un restaurant, de boutiques mais aussi de zones de convivialité !', 12, 120, '2022-06-17 17:52:03', 'et-est', 1, '26.jpg', 'Thursday', '10.pdf'),
(842, 280, 'Horst', 'Le château de Rhode-Saint-Pierre, aussi appelé château de Horst, est l’un des plus beaux châteaux médiévaux de Belgique.', 'Le château de Rhode-Saint-Pierre, aussi appelé château de Horst, est l’un des plus beaux châteaux médiévaux de Belgique. Il tient sa couleur verdâtre de la glauconite, une pierre argileuse utilisée lors de son édification. Entouré d’eau, son donjon domine malgré les siècles les touristes venus l’admirer.', 5, 120, '2022-06-17 21:02:28', 'horst', 1, '29.jpg', 'Friday', '11.pdf'),
(843, 285, 'Le Chemin de la Corniche', 'La Corniche, appelée également “le plus beau balcon de l\'Europe” (selon l\'écrivain luxembourgeois Batty Weber).', 'La Corniche, appelée également “le plus beau balcon de l\'Europe” (selon l\'écrivain luxembourgeois Batty Weber), s\'étend sur les remparts dressés au XVIIe siècle par les Espagnols et les Français. Tout en longeant la vallée de l\'Alzette, le chemin mène du rocher du Bock jusqu\'à la partie inférieure de la Citadelle du Saint-Esprit connue sous le nom de rondelles.', 18, 80, '2022-06-17 17:52:03', 'dolore-qui', 1, '12.jpg', 'Saturday', '12.pdf'),
(844, 277, 'Cathédrale Notre Dame', 'La cathédrale Notre-Dame (en néerlandais Onze-Lieve-Vrouwekathedraal) à Anvers (Antwerpen) en Belgique, dédiée à la Vierge Marie, est la cathédrale du diocèse du même nom.', 'La cathédrale Notre-Dame (en néerlandais Onze-Lieve-Vrouwekathedraal) à Anvers (Antwerpen) en Belgique, dédiée à la Vierge Marie, est la cathédrale du diocèse du même nom. Construite de 1352 à 1521 elle est un des cinq monuments religieux majeurs de la ville d\'Anvers (Belgique) avec l’église Saint-Charles-Borromée, l’église Saint-André, l’église Saint-Jacques et l’église Saint-Paul.', 24, 80, '2022-06-17 21:18:28', 'cathedrale-notre-dame', 1, '13.jpg', 'Lundi', '13.pdf'),
(845, 286, 'Citadelle de Namur', 'La citadelle de Namur, à l\'origine, le château des comtes de Namur, est un ancien château fort puis citadelle situé dans la ville de Namur.', 'La citadelle de Namur, à l\'origine, le château des comtes de Namur, est un ancien château fort puis citadelle situé dans la ville de Namur, dans la province du même nom en Belgique. Dominant la ville à la confluence de la Sambre et la Meuse, il s\'agit d\'une des plus grandes citadelles d\'Europe et son vaste réseau de souterrains lui valut d\'être surnommée \"La termitière de l\'Europe\" par Napoléon Ier. Des vestiges du château comtal aux bastions et terrasses à canons plus récents, elle témoigne de plus de mille ans d\'histoire.', 40, 80, '2022-06-17 20:50:37', 'citadelle-de-namur', 1, '27.jpg', 'Tuesday', '14.pdf'),
(846, 284, 'Le musée du mémorial de Waterloo.', 'Visiter la province du Brabant wallon invite à plonger dans son histoire militaire.', 'Visiter la province du Brabant wallon invite à plonger dans son histoire militaire. Pour cela, rendez-vous au musée du mémorial de la bataille de Waterloo 1815.\n\nLieu-clé des guerres napoléoniennes, Waterloo propose de revenir sur cet épisode à travers un parcours ludique. Mises en scènes, film 3D et animations en retracent le déroulé en s’appuyant sur les travaux de chercheurs passionnés.', 26, 120, '2022-06-17 17:52:03', 'eveniet-possimus-minima', 1, '15.jpg', 'Saturday', '15.pdf'),
(847, 282, 'Parc de la Boverie', 'Le parc de la Boverie est un parc de la ville de Liège situé entre la Meuse et la dérivation dans le quartier administratif d\'Outremeuse.', 'Le parc de la Boverie est un parc de la ville de Liège situé entre la Meuse et la dérivation dans le quartier administratif d\'Outremeuse.', 25, 120, '2022-06-17 17:52:03', 'maxime-quas-consequatur', 1, '16.jpg', 'Friday', '16.pdf'),
(848, 280, 'Qui veritatis aperiam.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam accumsan sodales lacus sed fringilla.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam accumsan sodales lacus sed fringilla. Fusce dapibus dui sit amet aliquam sollicitudin. Phasellus scelerisque eu augue a volutpat. In condimentum lorem laoreet ligula finibus, sit amet elementum elit ornare. Sed ipsum eros, facilisis et est sit amet, tristique tempor enim. Quisque ut laoreet neque. Quisque nunc mi, molestie sed pharetra a, faucibus id velit.', 20, 120, '2022-06-17 17:52:03', 'qui-veritatis-aperiam', 1, '17.jpg', 'Sunday', '17.pdf'),
(852, 277, 'Le Zoo d\'Anvers', 'Derrière la gare centrale, vous trouverez le zoo historique d’Anvers, un des plus importants de Belgique. Fondé en 1843.', 'Derrière la gare centrale, vous trouverez le zoo historique d’Anvers, un des plus importants de Belgique. Fondé en 1843, le zoo abrite aujourd’hui plus de 950 espèces originaires du monde entier, comme des manchots, des félins ou des lions de mer ! C’est un superbe espace à visiter à Anvers, que ce soit au début de votre voyage ou à la fin, lorsque vous serez fatigué des musées.', 30, 120, '2022-06-17 17:52:03', 'doloremque-et-excepturi', 1, '21.jpg', 'Thursday', '21.pdf'),
(853, 278, 'Rerum corrupti.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam accumsan sodales lacus sed fringilla.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam accumsan sodales lacus sed fringilla. Fusce dapibus dui sit amet aliquam sollicitudin. Phasellus scelerisque eu augue a volutpat. In condimentum lorem laoreet ligula finibus, sit amet elementum elit ornare. Sed ipsum eros, facilisis et est sit amet, tristique tempor enim. Quisque ut laoreet neque. Quisque nunc mi, molestie sed pharetra a, faucibus id velit.', 35, 120, '2022-06-17 17:52:03', 'rerum-corrupti', 1, '22.jpg', 'Saturday', '22.pdf'),
(855, 286, 'Théatre Royal de Namur', 'Le théâtre royal de Namur est un théâtre à l\'italienne situé à Namur, en Belgique. Construit en 1863, il est classé au Patrimoine civil public de Wallonie.', 'Le théâtre royal de Namur est un théâtre à l\'italienne situé à Namur, en Belgique. Construit en 1863, il est classé au Patrimoine civil public de Wallonie. Le théâtre de Namur brûle en 1860 (chute du décor sur une conduite de l’éclairage au gaz) et en 1862 (la foudre s’abat sur le théâtre en chantier). Conçu par Thierry Fumière, architecte de la Ville de Namur, le théâtre royal de Namur dans sa forme actuelle est inauguré en 1863.', 15, 80, '2022-06-17 17:52:03', 'ut-ea', 1, '10.jpg', 'Saturday', '24.pdf'),
(856, 285, 'Cupiditate quia laborum.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam accumsan sodales lacus sed fringilla.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam accumsan sodales lacus sed fringilla. Fusce dapibus dui sit amet aliquam sollicitudin. Phasellus scelerisque eu augue a volutpat. In condimentum lorem laoreet ligula finibus, sit amet elementum elit ornare. Sed ipsum eros, facilisis et est sit amet, tristique tempor enim. Quisque ut laoreet neque. Quisque nunc mi, molestie sed pharetra a, faucibus id velit.', 18, 80, '2022-06-17 17:52:03', 'cupiditate-quia-laborum', 1, '25.jpg', 'Wednesday', '25.pdf'),
(857, 282, 'Dolorem culpa.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam accumsan sodales lacus sed fringilla.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam accumsan sodales lacus sed fringilla. Fusce dapibus dui sit amet aliquam sollicitudin. Phasellus scelerisque eu augue a volutpat. In condimentum lorem laoreet ligula finibus, sit amet elementum elit ornare. Sed ipsum eros, facilisis et est sit amet, tristique tempor enim. Quisque ut laoreet neque. Quisque nunc mi, molestie sed pharetra a, faucibus id velit.', 20, 120, '2022-06-17 17:52:03', 'dolorem-culpa', 1, '26.jpg', 'Tuesday', '26.pdf');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220525082732', '2022-05-25 08:27:39', 228);

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

DROP TABLE IF EXISTS `professeur`;
CREATE TABLE IF NOT EXISTS `professeur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=545 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `professeur`
--

INSERT INTO `professeur` (`id`, `first_name`, `last_name`, `image`) VALUES
(529, 'Benoît', 'Renard', '010m.jpg'),
(530, 'Christiane', 'Leclercq', '011f.jpg'),
(531, 'Michelle', 'Clerc', '012f.jpg'),
(532, 'Pierre', 'Marin', '013m.jpg'),
(533, 'Benjamin', 'Colas', '014m.jpg'),
(534, 'Geneviève', 'Letellier', '015f.jpg'),
(535, 'Bernard', 'Remy', '016m.jpg'),
(536, 'Arthur', 'Roux', '017m.jpg'),
(537, 'Stéphane', 'Fontaine', '018m.jpg'),
(538, 'Sabine', 'Guillot', '019f.jpg'),
(539, 'Claude', 'Ribeiro', '020m.jpg'),
(540, 'Robert', 'Moreau', '021m.jpg'),
(541, 'Véronique', 'Caron', '022f.jpg'),
(542, 'Anouk', 'Lelievre', '023f.jpg'),
(543, 'Geneviève', 'Diallo', '024f.jpg'),
(544, 'Denis', 'Rodriguez', '025m.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `province`
--

DROP TABLE IF EXISTS `province`;
CREATE TABLE IF NOT EXISTS `province` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=287 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `province`
--

INSERT INTO `province` (`id`, `name`, `description`) VALUES
(277, 'Anvers', 'Libero iusto mollitia quo asperiores aut esse.'),
(278, 'Limbourg', 'Dignissimos accusamus dolorem sit recusandae incidunt asperiores accusantium ratione.'),
(279, 'Flandre orientale', 'Enim est voluptatem facilis labore laborum quidem.'),
(280, 'Brabant flamand', 'Ut quia aperiam quaerat pariatur.'),
(281, 'Flandre occidentale', 'Quas consequatur adipisci totam nostrum.'),
(282, 'Brabant wallon', 'Explicabo fuga suscipit eos perspiciatis.'),
(283, 'Hainaut', 'Repellat tempore nemo laboriosam est labore.'),
(284, 'Liège', 'Nesciunt et repudiandae a nemo similique ex voluptas.'),
(285, 'Luxembourg', 'Est consequatur est est odit magnam quisquam dolor et.'),
(286, 'Namur', 'Cumque enim voluptatem aut amet et modi quam.');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `last_log_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `is_disabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=936 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `first_name`, `last_name`, `image`, `created_at`, `updated_at`, `last_log_at`, `is_disabled`) VALUES
(912, 'michel.millet@gmail.com', '[\"ROLE_USER\"]', '$2y$13$Zj9hOrYflF7CsWiX3yFqn.WlwK.YrShVSH0NtbMaCaEk6iiNlHFpe', 'Michel', 'Millet', '010m.jpg', '2022-06-17 17:51:54', '2022-06-17 17:51:54', '2022-06-17 17:51:54', 0),
(913, 'nicole.rolland@gmail.com', '[\"ROLE_USER\"]', '$2y$13$RzPYNRXae1INvtaSkd09gO4kqGLbAl7PI.FaWED5tft9lSkFEaaoi', 'Nicole', 'Rolland', '011f.jpg', '2022-06-17 17:51:54', '2022-06-17 17:51:54', '2022-06-17 17:51:54', 0),
(914, 'gabriel.alves@gmail.com', '[\"ROLE_USER\"]', '$2y$13$uVajv1KYE3tpTK/BgV7pXu/SH1LUNAD4tK4qS.TqqE5eiDRVbwrVm', 'Gabriel-modif', 'Alves', '012m.jpg', '2022-06-18 08:45:29', '2022-06-18 08:45:29', '2022-06-18 08:45:29', 1),
(915, 'simone.lacroix@gmail.com', '[\"ROLE_USER\"]', '$2y$13$ZZm7WiR86OLfYYs3M0BwN.4b5IM/B8FPAUFUBaZacl7zhpp3Yn4gy', 'Simone', 'Lacroix', '013f.jpg', '2022-06-17 17:51:55', '2022-06-17 17:51:55', '2022-06-17 17:51:55', 0),
(916, 'maggie.millet@gmail.com', '[\"ROLE_USER\"]', '$2y$13$KmeDmLMAkBn1DARyGzSgXuWeE7z/DonAXArNNRf6mNnA/7BzrpsPe', 'Maggie', 'Millet', '014f.jpg', '2022-06-17 17:51:55', '2022-06-17 17:51:55', '2022-06-17 17:51:55', 0),
(917, 'elise.becker@gmail.com', '[\"ROLE_USER\"]', '$2y$13$DZSDYV.qfzHPB6Sa8ywsT.2PoO036.FSCC/L6ABZGXzRS/Kx9s7aG', 'Élise', 'Becker', '015f.jpg', '2022-06-17 17:51:56', '2022-06-17 17:51:56', '2022-06-17 17:51:56', 0),
(918, 'martine.vidal@gmail.com', '[\"ROLE_USER\"]', '$2y$13$tDFdNfeFGvHnnTTAj5xuc.SYakz45Bwy9/yJESNPimNMyT16IPwX.', 'Martine', 'Vidal', '016f.jpg', '2022-06-17 17:51:56', '2022-06-17 17:51:56', '2022-06-17 17:51:56', 0),
(919, 'matthieu.regnier@gmail.com', '[\"ROLE_USER\"]', '$2y$13$7T.Fm9kIPreuofRdOndXV.PkgYqjIu7wXhJnuqYvWQjBacvBUIwnq', 'Matthieu', 'Regnier', '017m.jpg', '2022-06-17 17:51:57', '2022-06-17 17:51:57', '2022-06-17 17:51:57', 0),
(920, 'theophile.teixeira@gmail.com', '[\"ROLE_USER\"]', '$2y$13$4fMpz.K4zxmqISsI4xakX.FGBLsj4elLul3q..cQeh2CUKZAqdxq6', 'Théophile', 'Teixeira', '018m.jpg', '2022-06-17 17:51:57', '2022-06-17 17:51:57', '2022-06-17 17:51:57', 1),
(921, 'aime.lemaitre@gmail.com', '[\"ROLE_USER\"]', '$2y$13$KMDwh3KEVyDmpqm37y.UWuZ1easY7PhGYIXgzXBcOjTB7y.BOvs62', 'Aimé', 'Lemaitre', '019m.jpg', '2022-06-17 17:51:57', '2022-06-17 17:51:57', '2022-06-17 17:51:57', 0),
(922, 'andre.lecomte@gmail.com', '[\"ROLE_USER\"]', '$2y$13$XWUL8JYHEld69n4NLE6sauIKn2tpU3q04V/rFs6GG7J5V5lLvuRKS', 'André', 'Lecomte', '020m.jpg', '2022-06-17 17:51:58', '2022-06-17 17:51:58', '2022-06-17 17:51:58', 1),
(923, 'philippine.munoz@gmail.com', '[\"ROLE_USER\"]', '$2y$13$oIVJXid8FNNSIK4ZWgSUaOhV.RrUfgemAXLO1CGXFZReKVmLtsT0.', 'Philippine', 'Munoz', '021f.jpg', '2022-06-17 17:51:58', '2022-06-17 17:51:58', '2022-06-17 17:51:58', 0),
(924, 'dominique.legrand@gmail.com', '[\"ROLE_USER\"]', '$2y$13$MT5F54Mxvvla42VKNSDNze4k2bsG3HN4RywfOg3prDI5X/LBj0wHW', 'Dominique', 'Legrand', '022f.jpg', '2022-06-17 17:51:59', '2022-06-17 17:51:59', '2022-06-17 17:51:59', 0),
(925, 'patricia.maurice@gmail.com', '[\"ROLE_USER\"]', '$2y$13$vAT4rRp/pkQ9A4NeYmlzXO0TNU9T3UfqlWYqeWVjaqpOtr6kTgL16', 'Patricia', 'Maurice', '023f.jpg', '2022-06-17 17:51:59', '2022-06-17 17:51:59', '2022-06-17 17:51:59', 1),
(926, 'patricia.andre@gmail.com', '[\"ROLE_USER\"]', '$2y$13$KgeJRGRG8oAg9kSPPNHnzu/L3v8nPu3uBPe9D0fJ53gxDqU2590oS', 'Patricia', 'Andre', '024f.jpg', '2022-06-17 17:51:59', '2022-06-17 17:51:59', '2022-06-17 17:51:59', 1),
(927, 'laurent.couturier@gmail.com', '[\"ROLE_USER\"]', '$2y$13$lzJcTN.Ok8zjtIgsjWpxwuqxzJ9XBZIppEVdvhX7P.26gmACsM2za', 'Laurent', 'Couturier', '025m.jpg', '2022-06-17 17:52:00', '2022-06-17 17:52:00', '2022-06-17 17:52:00', 0),
(928, 'aurelie.lacroix@gmail.com', '[\"ROLE_USER\"]', '$2y$13$CqSCnyRz9Zmx8CIphOtb6.vW60/ekrCIMWBKTPJB3BdwXAh4CjvMS', 'Aurélie', 'Lacroix', '010f.jpg', '2022-06-17 17:52:00', '2022-06-17 17:52:00', '2022-06-17 17:52:00', 1),
(929, 'sylvie.delahaye@gmail.com', '[\"ROLE_USER\"]', '$2y$13$IllwfpSiBkmZI8wmV3Rb0OtLN1akftoM8dcyjOpTi0F8PysP776Si', 'Sylvie', 'Delahaye', '011f.jpg', '2022-06-17 17:52:01', '2022-06-17 17:52:01', '2022-06-17 17:52:01', 0),
(930, 'simone.torres@gmail.com', '[\"ROLE_USER\"]', '$2y$13$aFvnYNJUzcJlTA38xkqt9.gZvbXySgSmRoo5RhNDZNMoXThv5z1zK', 'Simone', 'Torres', '012f.jpg', '2022-06-17 17:52:01', '2022-06-17 17:52:01', '2022-06-17 17:52:01', 0),
(931, 'marguerite.toussaint@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$2StxWTgVL9E8MjXOLDNYJuldokJwUoZ8orWiXKNLmcHkjeqWrl45.', 'Marguerite', 'Toussaint', '013f.jpg', '2022-06-17 17:52:01', '2022-06-17 17:52:01', '2022-06-17 17:52:01', 0),
(932, 'margaret.perrin@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$tWIeROLN1sJ/E/Hu4bMTgOm.MFsZt5daToO2sVcONxWXEW3D/94c6', 'Margaret', 'Perrin', '014f.jpg', '2022-06-17 17:52:02', '2022-06-17 17:52:02', '2022-06-17 17:52:02', 0),
(933, 'alex.bodin@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$Gbe10ktnOTqQuSo5RKxSfef2vQQBQQGKQcSiyeSAEhFEYHhLWNzz.', 'Alex', 'Bodin', '015f.jpg', '2022-06-17 17:52:02', '2022-06-17 17:52:02', '2022-06-17 17:52:02', 0),
(934, 'fred.louis@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$ENYuEilgZKSQNLU9oUNIj.llLwtDRgjzFsbSYOw1X2yj2hSJyt14m', 'Frederic', 'Louis', '071m.jpg', '2022-06-17 17:52:03', '2022-06-17 17:52:03', '2022-06-17 17:52:03', 0),
(935, 'bruno.louis@gmail.com', '[\"ROLE_SUPER_ADMIN\"]', '$2y$13$Y29aLcACQN285Ra8YjODqu3w2dNsaq.heNZOsNSFjtJ0MU/s0JZky', 'Bruno', 'Louis', '076m.jpg', '2022-06-18 08:30:37', '2022-06-18 08:30:37', '2022-06-18 08:30:37', 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526C816C6140` FOREIGN KEY (`destination_id`) REFERENCES `destination` (`id`),
  ADD CONSTRAINT `FK_9474526CF675F31B` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `destination`
--
ALTER TABLE `destination`
  ADD CONSTRAINT `FK_3EC63EAAE946114A` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
