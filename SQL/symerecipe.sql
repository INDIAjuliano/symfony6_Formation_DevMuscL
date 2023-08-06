-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 05 août 2023 à 08:10
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `symerecipe`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230804171844', '2023-08-04 19:19:03', 214);

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` double NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ingredient`
--

INSERT INTO `ingredient` (`id`, `name`, `price`, `created_at`) VALUES
(201, 'dolores', 58, '2023-08-05 08:00:47'),
(202, 'vel', 32, '2023-08-05 08:00:47'),
(203, 'voluptatem', 60, '2023-08-05 08:00:47'),
(204, 'reiciendis', 57, '2023-08-05 08:00:47'),
(205, 'non', 96, '2023-08-05 08:00:47'),
(206, 'neque', 37, '2023-08-05 08:00:47'),
(207, 'nulla', 12, '2023-08-05 08:00:47'),
(208, 'omnis', 25, '2023-08-05 08:00:47'),
(209, 'eum', 67, '2023-08-05 08:00:47'),
(210, 'delectus', 99, '2023-08-05 08:00:47'),
(211, 'sit', 77, '2023-08-05 08:00:47'),
(212, 'praesentium', 22, '2023-08-05 08:00:47'),
(213, 'laudantium', 77, '2023-08-05 08:00:47'),
(214, 'est', 70, '2023-08-05 08:00:47'),
(215, 'repellat', 65, '2023-08-05 08:00:47'),
(216, 'numquam', 79, '2023-08-05 08:00:47'),
(217, 'in', 64, '2023-08-05 08:00:47'),
(218, 'et', 52, '2023-08-05 08:00:47'),
(219, 'dolore', 14, '2023-08-05 08:00:47'),
(220, 'eligendi', 73, '2023-08-05 08:00:47'),
(221, 'est', 38, '2023-08-05 08:00:47'),
(222, 'officiis', 83, '2023-08-05 08:00:47'),
(223, 'ea', 81, '2023-08-05 08:00:47'),
(224, 'consequatur', 36, '2023-08-05 08:00:47'),
(225, 'qui', 38, '2023-08-05 08:00:47'),
(226, 'tenetur', 20, '2023-08-05 08:00:47'),
(227, 'animi', 61, '2023-08-05 08:00:47'),
(228, 'veritatis', 95, '2023-08-05 08:00:47'),
(229, 'magnam', 79, '2023-08-05 08:00:47'),
(230, 'rem', 62, '2023-08-05 08:00:47'),
(231, 'recusandae', 21, '2023-08-05 08:00:47'),
(232, 'voluptatum', 65, '2023-08-05 08:00:47'),
(233, 'est', 73, '2023-08-05 08:00:47'),
(234, 'eaque', 31, '2023-08-05 08:00:47'),
(235, 'recusandae', 36, '2023-08-05 08:00:47'),
(236, 'hic', 99, '2023-08-05 08:00:47'),
(237, 'eligendi', 26, '2023-08-05 08:00:47'),
(238, 'et', 14, '2023-08-05 08:00:47'),
(239, 'possimus', 84, '2023-08-05 08:00:47'),
(240, 'fugiat', 37, '2023-08-05 08:00:47'),
(241, 'quaerat', 83, '2023-08-05 08:00:47'),
(242, 'doloribus', 41, '2023-08-05 08:00:47'),
(243, 'deserunt', 25, '2023-08-05 08:00:47'),
(244, 'ut', 79, '2023-08-05 08:00:47'),
(245, 'eveniet', 75, '2023-08-05 08:00:47'),
(246, 'repudiandae', 13, '2023-08-05 08:00:47'),
(247, 'neque', 66, '2023-08-05 08:00:47'),
(248, 'veritatis', 49, '2023-08-05 08:00:47'),
(249, 'excepturi', 14, '2023-08-05 08:00:47'),
(250, 'qui', 39, '2023-08-05 08:00:47');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `recipe`
--

CREATE TABLE `recipe` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `time` int(11) DEFAULT NULL,
  `nb_people` int(11) DEFAULT NULL,
  `difficulty` int(11) DEFAULT NULL,
  `description` longtext NOT NULL,
  `price` double NOT NULL,
  `is_favorite` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `recipe`
--

INSERT INTO `recipe` (`id`, `name`, `time`, `nb_people`, `difficulty`, `description`, `price`, `is_favorite`, `created_at`, `updated_at`) VALUES
(101, 'libero', NULL, NULL, 3, 'Sed et accusantium earum ea voluptatem voluptatum. Labore sequi officiis perspiciatis et. Corrupti necessitatibus sit velit.', 561, 0, '2023-08-05 08:00:47', '2023-08-05 08:00:47'),
(102, 'vel', NULL, NULL, NULL, 'Nemo sit occaecati recusandae magnam labore odit. Vitae laborum cumque eligendi necessitatibus nulla cumque. Qui sed omnis ab dicta.', 293, 1, '2023-08-05 08:00:47', '2023-08-05 08:00:47'),
(103, 'distinctio', NULL, 47, NULL, 'Excepturi nostrum aperiam corrupti quis. Labore voluptatem quo aut excepturi quam non velit minima. Minus id sed eos ut ex. Dolor necessitatibus maiores vitae nihil consequatur rem. Aperiam facilis sint amet eaque modi. Placeat alias eius nihil sit a. Quia quia blanditiis non vitae asperiores.', 223, 0, '2023-08-05 08:00:47', '2023-08-05 08:00:47'),
(104, 'deleniti', 1374, NULL, NULL, 'Ea doloremque consequuntur nesciunt consectetur. Ad cumque sed ipsum expedita rerum ut quod. Eveniet nihil aliquam est libero quia labore ut. Voluptas voluptatem vel temporibus quibusdam eum sequi. Ut facere et provident.', 508, 0, '2023-08-05 08:00:47', '2023-08-05 08:00:47'),
(105, 'non', 440, 16, 5, 'Ipsum quasi esse sunt magnam praesentium quibusdam voluptate. Tempore similique iure fugit laboriosam. Amet vel pariatur temporibus. Ducimus doloribus aperiam saepe ipsa qui. Itaque facere sint aut. Repudiandae quis ab velit mollitia consequatur nesciunt sed.', 767, 0, '2023-08-05 08:00:47', '2023-08-05 08:00:47'),
(106, 'minus', 485, NULL, NULL, 'Illo quod dolorum qui et optio voluptas. Ut quod qui placeat ratione in. Ex optio quibusdam blanditiis cum vel facilis et dolores.', 270, 1, '2023-08-05 08:00:47', '2023-08-05 08:00:47'),
(107, 'odio', 1072, NULL, 4, 'In consequatur tempora voluptatibus deleniti laborum et. Molestias provident sapiente voluptates officia quis. Modi molestiae fuga minima vel maxime cum. Doloribus excepturi quis at recusandae aliquid ex suscipit.', 321, 1, '2023-08-05 08:00:47', '2023-08-05 08:00:47'),
(108, 'quisquam', 703, NULL, NULL, 'Aut quae consectetur officia consequatur rem. Ut qui id id nemo laudantium molestiae nostrum ducimus. Quisquam sed et doloremque et nobis distinctio. Dolorem reprehenderit est fugiat vel.', 874, 0, '2023-08-05 08:00:47', '2023-08-05 08:00:47'),
(109, 'similique', NULL, NULL, 3, 'Et eveniet error inventore dolore voluptate. Quia autem voluptate error ipsum esse. Fuga architecto totam delectus soluta est. Nihil quia dolor veritatis et sint illo hic. Suscipit dolorem at odit in. Est ad et assumenda quas qui. Eum et quaerat atque dolorem sed.', 253, 0, '2023-08-05 08:00:47', '2023-08-05 08:00:47'),
(110, 'molestiae', 1187, 41, NULL, 'Delectus labore quis dolorem iusto rerum occaecati. Totam rem tenetur quam a molestiae laudantium.', 653, 1, '2023-08-05 08:00:47', '2023-08-05 08:00:47'),
(111, 'debitis', 892, 8, NULL, 'Est consequatur neque et molestiae cumque quos eveniet repellat. Nobis architecto natus vel aperiam eos voluptatem consequuntur nobis. Porro ullam mollitia odit.', 30, 1, '2023-08-05 08:00:47', '2023-08-05 08:00:47'),
(112, 'aut', 629, NULL, 5, 'Atque blanditiis et est magni aut laborum. Earum sit explicabo nesciunt debitis. Temporibus tempore voluptate assumenda. Voluptatibus earum ipsum asperiores est id odit vitae.', 269, 1, '2023-08-05 08:00:47', '2023-08-05 08:00:47'),
(113, 'accusamus', NULL, 19, 3, 'Temporibus alias magnam nihil velit blanditiis ut. Maiores aliquam aut sunt animi nihil eum. Praesentium quam rem omnis atque error voluptas totam enim. Non quidem voluptatibus est fugit. Sit ut pariatur molestiae laboriosam. Est velit atque doloribus fugiat animi.', 670, 0, '2023-08-05 08:00:47', '2023-08-05 08:00:47'),
(114, 'consequatur', 756, 33, NULL, 'Dolorem perferendis id quia corporis eos. Quia fuga odio qui. Id omnis voluptas sit voluptatem. Nihil accusantium reiciendis ut. Eum eum voluptatem unde adipisci cum. Soluta laboriosam minus beatae et.', 278, 0, '2023-08-05 08:00:47', '2023-08-05 08:00:47'),
(115, 'quos', 1193, 13, NULL, 'Ut inventore quis quam repellat. Exercitationem molestiae non sit eum. Aut et non quo tempore voluptatem ut. Eaque suscipit architecto quia qui sint. Assumenda deleniti et ullam sapiente omnis qui temporibus et. Libero vel aut id in. Quas et rerum natus qui harum.', 584, 1, '2023-08-05 08:00:47', '2023-08-05 08:00:47'),
(116, 'ipsa', 33, NULL, NULL, 'Adipisci laudantium omnis quasi error ullam dolores. Eos nemo sint fuga aperiam culpa at maxime. Aliquid commodi rem est cum dolores. Magni eligendi est quibusdam.', 601, 1, '2023-08-05 08:00:47', '2023-08-05 08:00:47'),
(117, 'non', NULL, NULL, NULL, 'Et vel et voluptatum eos dolore ut veritatis. Consequatur sit officia possimus. Nam similique est voluptatum et minima perferendis unde.', 65, 1, '2023-08-05 08:00:47', '2023-08-05 08:00:47'),
(118, 'animi', NULL, NULL, NULL, 'Perspiciatis eos repellendus dolorum autem vitae. Libero possimus consequatur placeat deleniti. Et qui doloribus totam distinctio accusantium error. Porro excepturi repellendus magnam iusto veritatis sit ab. Quos beatae unde nihil quaerat.', 450, 1, '2023-08-05 08:00:47', '2023-08-05 08:00:47'),
(119, 'possimus', 1129, NULL, 2, 'Voluptates cum id non optio. Pariatur enim sapiente laudantium non facilis quo mollitia. Est earum quam atque. Atque cum quisquam rem voluptatem. Id est dolorem libero est voluptatem. Nihil et magni qui.', 192, 1, '2023-08-05 08:00:47', '2023-08-05 08:00:47'),
(120, 'corporis', NULL, NULL, NULL, 'Quo aut laudantium porro nisi unde impedit. Non provident est asperiores quis rerum in. Magni sit veniam nihil sed inventore possimus.', 557, 1, '2023-08-05 08:00:47', '2023-08-05 08:00:47'),
(121, 'quibusdam', 13, 17, NULL, 'Laborum aut tenetur nihil dolorem molestiae repellat molestiae. Enim non ut blanditiis cum suscipit. Molestiae id exercitationem qui at sequi. Accusantium ea perferendis voluptatem.', 917, 1, '2023-08-05 08:00:47', '2023-08-05 08:00:47'),
(122, 'itaque', 245, NULL, 2, 'Eos quidem aperiam sit nulla architecto numquam. Sequi impedit dolor quasi laborum atque eos. Magni impedit repellat quidem a. Culpa est saepe deleniti corrupti exercitationem itaque.', 17, 1, '2023-08-05 08:00:47', '2023-08-05 08:00:47'),
(123, 'voluptatum', NULL, 38, 4, 'Sed eligendi inventore voluptatibus quod nihil eligendi et assumenda. Quisquam enim et est. Cum ut natus expedita ad sint animi repellendus qui. Vel velit aut molestiae voluptas saepe facilis.', 99, 0, '2023-08-05 08:00:47', '2023-08-05 08:00:47'),
(124, 'et', NULL, 35, NULL, 'Ipsum repellendus quaerat consequuntur aperiam. Harum iste praesentium et dolorum quis ea accusamus. Accusamus nobis rerum ad accusantium quaerat cupiditate animi. Et voluptas voluptatem ut corporis quam fuga velit.', 73, 1, '2023-08-05 08:00:47', '2023-08-05 08:00:47'),
(125, 'nisi', 442, 10, 4, 'Dolorem voluptas et praesentium nihil velit. Quae ipsam similique vitae asperiores odio. Earum dolores illo nihil tempore rerum. Occaecati libero temporibus illum dolor autem est consequuntur odit.', 761, 0, '2023-08-05 08:00:47', '2023-08-05 08:00:47');

-- --------------------------------------------------------

--
-- Structure de la table `recipe_ingredient`
--

CREATE TABLE `recipe_ingredient` (
  `recipe_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `recipe_ingredient`
--

INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`) VALUES
(101, 205),
(101, 214),
(101, 222),
(101, 225),
(101, 240),
(102, 202),
(102, 211),
(102, 216),
(102, 228),
(102, 232),
(102, 241),
(103, 207),
(103, 215),
(103, 228),
(103, 232),
(103, 242),
(103, 245),
(104, 206),
(104, 225),
(104, 226),
(104, 227),
(104, 237),
(104, 238),
(104, 240),
(104, 244),
(105, 201),
(105, 224),
(105, 229),
(105, 235),
(105, 240),
(105, 244),
(106, 210),
(106, 226),
(106, 229),
(106, 232),
(106, 244),
(106, 245),
(107, 204),
(107, 207),
(107, 221),
(107, 223),
(107, 227),
(107, 230),
(107, 234),
(107, 235),
(107, 245),
(108, 206),
(108, 208),
(108, 209),
(108, 212),
(108, 214),
(108, 222),
(108, 231),
(108, 234),
(108, 235),
(108, 244),
(109, 204),
(109, 209),
(109, 214),
(109, 215),
(109, 240),
(109, 241),
(109, 242),
(110, 203),
(110, 216),
(110, 217),
(110, 219),
(110, 221),
(110, 240),
(110, 242),
(111, 202),
(111, 217),
(111, 218),
(111, 229),
(111, 231),
(111, 233),
(111, 237),
(111, 238),
(111, 250),
(112, 202),
(112, 212),
(112, 217),
(112, 219),
(112, 221),
(112, 229),
(112, 230),
(112, 243),
(112, 250),
(113, 212),
(113, 227),
(113, 230),
(113, 244),
(113, 246),
(113, 249),
(114, 201),
(114, 204),
(114, 216),
(114, 217),
(114, 233),
(114, 250),
(115, 206),
(115, 218),
(115, 220),
(115, 225),
(115, 227),
(116, 207),
(116, 213),
(116, 217),
(116, 219),
(116, 245),
(117, 203),
(117, 210),
(117, 211),
(117, 219),
(117, 228),
(117, 242),
(117, 245),
(117, 246),
(118, 203),
(118, 206),
(118, 214),
(118, 222),
(118, 226),
(118, 227),
(118, 235),
(119, 204),
(119, 209),
(119, 211),
(119, 213),
(119, 217),
(119, 219),
(119, 223),
(119, 226),
(119, 229),
(120, 205),
(120, 209),
(120, 214),
(120, 215),
(120, 229),
(120, 230),
(120, 250),
(121, 204),
(121, 215),
(121, 227),
(121, 230),
(121, 235),
(121, 247),
(122, 204),
(122, 215),
(122, 216),
(122, 231),
(122, 242),
(122, 248),
(123, 201),
(123, 208),
(123, 230),
(123, 235),
(123, 245),
(123, 248),
(124, 202),
(124, 209),
(124, 214),
(124, 215),
(124, 224),
(124, 228),
(124, 240),
(124, 246),
(124, 249),
(125, 211),
(125, 212),
(125, 216),
(125, 231),
(125, 249);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `pseudo` varchar(50) DEFAULT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL,
  `created_ad` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `full_name`, `pseudo`, `email`, `roles`, `password`, `created_ad`) VALUES
(31, 'Thibaut Chretien', NULL, 'edupuy@laposte.net', '[\"ROLE_USER\"]', '$2y$13$8JHQFKCMbcQcL0VqlKBalODIW7sxtYwQ0jJ08hZJeNonWospcQSvq', '2023-08-05 08:00:47'),
(32, 'Tristan Roche', NULL, 'laetitia21@maillot.net', '[\"ROLE_USER\"]', '$2y$13$Ywqv50s4wLB5Olsb7vU6b.WYDLHi9WtH.kbyUdcP8Ns0shaC.dWkO', '2023-08-05 08:00:48'),
(33, 'Alexandria Michel', NULL, 'nfischer@live.com', '[\"ROLE_USER\"]', '$2y$13$/pzIpoekSE3DFdwts5jlkuYuMDiLDq/nu2y4EG7hCUfigy7ptAUs6', '2023-08-05 08:00:48'),
(34, 'Henriette Menard', NULL, 'stephanie.leclerc@live.com', '[\"ROLE_USER\"]', '$2y$13$j.H3dhEp3U9ejes2kF9i..b5Q0FlpXIxfzBRqNRFjEU3ZaNwG1CoS', '2023-08-05 08:00:49'),
(35, 'Jules Lamy', NULL, 'klaroche@dacosta.fr', '[\"ROLE_USER\"]', '$2y$13$tLBPod.38qvmL7LdBqU36eVyBPH2wgGO0ZwkrDBMe8pi7ZPbfwZdy', '2023-08-05 08:00:50'),
(36, 'Thomas Allard-Pruvost', NULL, 'arnaude.robert@laposte.net', '[\"ROLE_USER\"]', '$2y$13$cffdZdagRFoOvaVagNmgIem8SwN3IosGarXUe17eah8bjvf7.Rp7O', '2023-08-05 08:00:51'),
(37, 'Paul Pasquier', NULL, 'bailly.matthieu@orange.fr', '[\"ROLE_USER\"]', '$2y$13$yQG/jxWlnfSdte3ta1.ZvuynrLOx636.K0VAunN9aoj7kq.7gy0R6', '2023-08-05 08:00:51'),
(38, 'Bernard Durand', NULL, 'isabelle.lemonnier@laposte.net', '[\"ROLE_USER\"]', '$2y$13$QWULcRPCAf6ZK7zLxJf9QeYCb3HeSzIx4EtfXxPr7y4rUwC0CJ3nO', '2023-08-05 08:00:52'),
(39, 'Laure Labbe-Thomas', NULL, 'zvaillant@tele2.fr', '[\"ROLE_USER\"]', '$2y$13$8vxI537vXoSQvxUMFAGbLu08Uu784ov6YgiFsCXCvL5lomboSLzIy', '2023-08-05 08:00:52'),
(40, 'Arthur Munoz', NULL, 'grenier.zacharie@laposte.net', '[\"ROLE_USER\"]', '$2y$13$SMqFDzw2/A60U6GEdCSHV.UDfcdlwiRRf8JEb8.ht2dRxJ9SabTgO', '2023-08-05 08:00:53');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `recipe_ingredient`
--
ALTER TABLE `recipe_ingredient`
  ADD PRIMARY KEY (`recipe_id`,`ingredient_id`),
  ADD KEY `IDX_22D1FE1359D8A214` (`recipe_id`),
  ADD KEY `IDX_22D1FE13933FE08C` (`ingredient_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `recipe_ingredient`
--
ALTER TABLE `recipe_ingredient`
  ADD CONSTRAINT `FK_22D1FE1359D8A214` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_22D1FE13933FE08C` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
