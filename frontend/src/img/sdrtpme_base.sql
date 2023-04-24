-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 08, 2023 at 12:56 PM
-- Server version: 8.0.30
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sdrtpme_base`
--

-- --------------------------------------------------------

--
-- Table structure for table `accompagnements`
--

DROP TABLE IF EXISTS `accompagnements`;
CREATE TABLE IF NOT EXISTS `accompagnements` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `entreprise_id` bigint UNSIGNED DEFAULT NULL,
  `candidat_id` bigint UNSIGNED DEFAULT NULL,
  `libelle_programme` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `annee` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accompagnements_entreprise_id_foreign` (`entreprise_id`),
  KEY `accompagnements_candidat_id_foreign` (`candidat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accompagnements`
--



-- --------------------------------------------------------

--
-- Table structure for table `candidats`
--

DROP TABLE IF EXISTS `candidats`;
CREATE TABLE IF NOT EXISTS `candidats` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `genre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_naiss` date DEFAULT NULL,
  `cin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationalite` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ville` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_telephone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `niveau_etude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profession` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `experience_tourisme` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_candidat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `raison_sociale` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `candidats`
--


-- --------------------------------------------------------

--
-- Table structure for table `candidatures`
--

DROP TABLE IF EXISTS `candidatures`;
CREATE TABLE IF NOT EXISTS `candidatures` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `candidat_id` bigint UNSIGNED DEFAULT NULL,
  `type_candidature` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deposer',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `candidatures_user_id_foreign` (`user_id`),
  KEY `candidatures_candidat_id_foreign` (`candidat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `candidatures`
--



-- --------------------------------------------------------

--
-- Table structure for table `communes`
--

DROP TABLE IF EXISTS `communes`;
CREATE TABLE IF NOT EXISTS `communes` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `communes_province_id_foreign` (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `communes`
--



-- --------------------------------------------------------

--
-- Table structure for table `distinction_labels`
--

DROP TABLE IF EXISTS `distinction_labels`;
CREATE TABLE IF NOT EXISTS `distinction_labels` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `entreprise_id` bigint UNSIGNED NOT NULL,
  `libelle_distinction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `annee_obtention` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `distinction_labels_entreprise_id_foreign` (`entreprise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `distinction_labels`
--



-- --------------------------------------------------------

--
-- Table structure for table `domaine_activites`
--

DROP TABLE IF EXISTS `domaine_activites`;
CREATE TABLE IF NOT EXISTS `domaine_activites` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `domaine_activites`
--

INSERT INTO `domaine_activites` (`id`, `libelle`, `created_at`, `updated_at`) VALUES
(1, 'd1', '2023-03-23 09:12:24', '2023-03-23 09:12:24'),
(2, 'd2', '2023-03-23 09:12:30', '2023-03-23 09:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `echeancier_previsionnels`
--

DROP TABLE IF EXISTS `echeancier_previsionnels`;
CREATE TABLE IF NOT EXISTS `echeancier_previsionnels` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `projet_id` bigint UNSIGNED NOT NULL,
  `mois_annee` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `missions` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `echeancier_previsionnels_projet_id_foreign` (`projet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `entreprises`
--

DROP TABLE IF EXISTS `entreprises`;
CREATE TABLE IF NOT EXISTS `entreprises` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `domaine_activite_id` bigint UNSIGNED NOT NULL,
  `province_id` bigint UNSIGNED NOT NULL,
  `commune_id` bigint UNSIGNED NOT NULL,
  `candidature_id` bigint UNSIGNED NOT NULL,
  `forme_juridique_id` bigint UNSIGNED NOT NULL,
  `raison_sociale` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` date DEFAULT NULL,
  `qualite_candidat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse_domicile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `montant_investissement` double(8,2) DEFAULT NULL,
  `proprietaire` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_entreprise` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tribunal_commerce` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ice` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identifiant_fiscal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_cnss` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_classement` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_agrement` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appuibeneficie` json DEFAULT NULL,
  `presentation_text` text COLLATE utf8mb4_unicode_ci,
  `presentation_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `presentation_video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacite_accueil` text COLLATE utf8mb4_unicode_ci,
  `canaux_distribution` text COLLATE utf8mb4_unicode_ci,
  `nbr_emp_permanents` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nbr_emp_occasionnels` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `informations_juridique` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entreprises_domaine_activite_id_foreign` (`domaine_activite_id`),
  KEY `entreprises_province_id_foreign` (`province_id`),
  KEY `entreprises_commune_id_foreign` (`commune_id`),
  KEY `entreprises_candidature_id_foreign` (`candidature_id`),
  KEY `entreprises_forme_juridique_id_foreign` (`forme_juridique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `entreprises`
--


-- --------------------------------------------------------

--
-- Table structure for table `entreprise_transformations`
--

DROP TABLE IF EXISTS `entreprise_transformations`;
CREATE TABLE IF NOT EXISTS `entreprise_transformations` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `entreprise_id` bigint UNSIGNED NOT NULL,
  `description_synt_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `descriptif_synt_pdf` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descriptif_synt_video` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `incubation` tinyint(1) NOT NULL,
  `assistance_technique` tinyint(1) NOT NULL,
  `appui_financier` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entreprise_transformations_entreprise_id_foreign` (`entreprise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `entreprise_transformations`
--


-- --------------------------------------------------------

--
-- Table structure for table `experience_tourismes`
--

DROP TABLE IF EXISTS `experience_tourismes`;
CREATE TABLE IF NOT EXISTS `experience_tourismes` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `candidat_id` bigint UNSIGNED NOT NULL,
  `nombre_annee` int NOT NULL,
  `libelle_experience` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `experience_tourismes_candidat_id_foreign` (`candidat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `financements`
--

DROP TABLE IF EXISTS `financements`;
CREATE TABLE IF NOT EXISTS `financements` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `entreprise_id` bigint UNSIGNED DEFAULT NULL,
  `candidat_id` bigint UNSIGNED DEFAULT NULL,
  `libelle_programme` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `annee` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `financements_entreprise_id_foreign` (`entreprise_id`),
  KEY `financements_candidat_id_foreign` (`candidat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `financements`
--


-- --------------------------------------------------------

--
-- Table structure for table `forme_juridiques`
--

DROP TABLE IF EXISTS `forme_juridiques`;
CREATE TABLE IF NOT EXISTS `forme_juridiques` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forme_juridiques`
--

-- --------------------------------------------------------

--
-- Table structure for table `liste_pieces`
--

DROP TABLE IF EXISTS `liste_pieces`;
CREATE TABLE IF NOT EXISTS `liste_pieces` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `candidature_id` bigint UNSIGNED NOT NULL,
  `dossier_candidature` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `copie_cin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cv` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preuve_financement` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preuve_propriete` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_affaire` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lettres_recommandations` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `liste_pieces_candidature_id_foreign` (`candidature_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

-- --------------------------------------------------------

--
-- Table structure for table `nationalites`
--

DROP TABLE IF EXISTS `nationalites`;
CREATE TABLE IF NOT EXISTS `nationalites` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nationalites`
--


-- --------------------------------------------------------

--
-- Table structure for table `nationalite_segments`
--

DROP TABLE IF EXISTS `nationalite_segments`;
CREATE TABLE IF NOT EXISTS `nationalite_segments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `entreprise_id` bigint UNSIGNED DEFAULT NULL,
  `projet_id` bigint UNSIGNED DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nationalite_segments_entreprise_id_foreign` (`entreprise_id`),
  KEY `nationalite_segments_projet_id_foreign` (`projet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nationalite_segments`
--

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--


-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `projets`;
CREATE TABLE IF NOT EXISTS `projets` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `forme_juridique_id` bigint UNSIGNED DEFAULT NULL,
  `domaine_activite_id` bigint UNSIGNED NOT NULL,
  `province_id` bigint UNSIGNED NOT NULL,
  `commune_id` bigint UNSIGNED NOT NULL,
  `candidature_id` bigint UNSIGNED NOT NULL,
  `forme_juridique` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `montant_investissement` double(8,2) DEFAULT NULL,
  `adresse_implantation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qualite_candidat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `presentation_video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `presentation_text` text COLLATE utf8mb4_unicode_ci,
  `presentation_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacite_accueil` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `canaux_distribution` text COLLATE utf8mb4_unicode_ci,
  `presentation_objectifs` text COLLATE utf8mb4_unicode_ci,
  `presentation_moyens` text COLLATE utf8mb4_unicode_ci,
  `presentation_aspects_innovants` text COLLATE utf8mb4_unicode_ci,
  `partenaire_eventuel` text COLLATE utf8mb4_unicode_ci,
  `remarques` text COLLATE utf8mb4_unicode_ci,
  `appuibeneficie` text COLLATE utf8mb4_unicode_ci,
  `taille_investissement` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_implantation` date DEFAULT NULL,
  `incubation` tinyint(1) DEFAULT NULL,
  `assistance_technique` tinyint(1) DEFAULT NULL,
  `appui_financier` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projets_forme_juridique_id_foreign` (`forme_juridique_id`),
  KEY `projets_domaine_activite_id_foreign` (`domaine_activite_id`),
  KEY `projets_province_id_foreign` (`province_id`),
  KEY `projets_commune_id_foreign` (`commune_id`),
  KEY `projets_candidature_id_foreign` (`candidature_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

DROP TABLE IF EXISTS `provinces`;
CREATE TABLE IF NOT EXISTS `provinces` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `provinces`
--


-- --------------------------------------------------------

--
-- Table structure for table `representants`
--

DROP TABLE IF EXISTS `representants`;
CREATE TABLE IF NOT EXISTS `representants` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `entreprise_id` bigint UNSIGNED NOT NULL,
  `genre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_naiss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationalite` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fonction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_telephone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `representants_entreprise_id_foreign` (`entreprise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `representants`
--


-- --------------------------------------------------------

--
-- Table structure for table `segment_clients`
--

DROP TABLE IF EXISTS `segment_clients`;
CREATE TABLE IF NOT EXISTS `segment_clients` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `entreprise_id` bigint UNSIGNED DEFAULT NULL,
  `projet_id` bigint UNSIGNED DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `segment_clients_entreprise_id_foreign` (`entreprise_id`),
  KEY `segment_clients_projet_id_foreign` (`projet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `segment_clients`
--


-- --------------------------------------------------------

--
-- Table structure for table `service_offerts`
--

DROP TABLE IF EXISTS `service_offerts`;
CREATE TABLE IF NOT EXISTS `service_offerts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `entreprise_id` bigint UNSIGNED DEFAULT NULL,
  `projet_id` bigint UNSIGNED DEFAULT NULL,
  `libelle_service` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tarif_min` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tarif_max` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `service_offerts_entreprise_id_foreign` (`entreprise_id`),
  KEY `service_offerts_projet_id_foreign` (`projet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_offerts`
--

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--


-- --------------------------------------------------------

--
-- Table structure for table `typologie_clienteles`
--

DROP TABLE IF EXISTS `typologie_clienteles`;
CREATE TABLE IF NOT EXISTS `typologie_clienteles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `segment_client` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationalite_client` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accompagnements`
--
ALTER TABLE `accompagnements`
  ADD CONSTRAINT `accompagnements_candidat_id_foreign` FOREIGN KEY (`candidat_id`) REFERENCES `candidats` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `accompagnements_entreprise_id_foreign` FOREIGN KEY (`entreprise_id`) REFERENCES `entreprises` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `candidatures`
--
ALTER TABLE `candidatures`
  ADD CONSTRAINT `candidatures_candidat_id_foreign` FOREIGN KEY (`candidat_id`) REFERENCES `candidats` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `candidatures_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `communes`
--
ALTER TABLE `communes`
  ADD CONSTRAINT `communes_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `distinction_labels`
--
ALTER TABLE `distinction_labels`
  ADD CONSTRAINT `distinction_labels_entreprise_id_foreign` FOREIGN KEY (`entreprise_id`) REFERENCES `entreprises` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `echeancier_previsionnels`
--
ALTER TABLE `echeancier_previsionnels`
  ADD CONSTRAINT `echeancier_previsionnels_projet_id_foreign` FOREIGN KEY (`projet_id`) REFERENCES `projets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `entreprises`
--
ALTER TABLE `entreprises`
  ADD CONSTRAINT `entreprises_candidature_id_foreign` FOREIGN KEY (`candidature_id`) REFERENCES `candidatures` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `entreprises_commune_id_foreign` FOREIGN KEY (`commune_id`) REFERENCES `communes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `entreprises_domaine_activite_id_foreign` FOREIGN KEY (`domaine_activite_id`) REFERENCES `domaine_activites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `entreprises_forme_juridique_id_foreign` FOREIGN KEY (`forme_juridique_id`) REFERENCES `forme_juridiques` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `entreprises_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `entreprise_transformations`
--
ALTER TABLE `entreprise_transformations`
  ADD CONSTRAINT `entreprise_transformations_entreprise_id_foreign` FOREIGN KEY (`entreprise_id`) REFERENCES `entreprises` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `experience_tourismes`
--
ALTER TABLE `experience_tourismes`
  ADD CONSTRAINT `experience_tourismes_candidat_id_foreign` FOREIGN KEY (`candidat_id`) REFERENCES `candidats` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `financements`
--
ALTER TABLE `financements`
  ADD CONSTRAINT `financements_candidat_id_foreign` FOREIGN KEY (`candidat_id`) REFERENCES `candidats` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `financements_entreprise_id_foreign` FOREIGN KEY (`entreprise_id`) REFERENCES `entreprises` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `liste_pieces`
--
ALTER TABLE `liste_pieces`
  ADD CONSTRAINT `liste_pieces_candidature_id_foreign` FOREIGN KEY (`candidature_id`) REFERENCES `candidatures` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nationalite_segments`
--
ALTER TABLE `nationalite_segments`
  ADD CONSTRAINT `nationalite_segments_entreprise_id_foreign` FOREIGN KEY (`entreprise_id`) REFERENCES `entreprises` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nationalite_segments_projet_id_foreign` FOREIGN KEY (`projet_id`) REFERENCES `projets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `projets`
--
ALTER TABLE `projets`
  ADD CONSTRAINT `projets_candidature_id_foreign` FOREIGN KEY (`candidature_id`) REFERENCES `candidatures` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `projets_commune_id_foreign` FOREIGN KEY (`commune_id`) REFERENCES `communes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `projets_domaine_activite_id_foreign` FOREIGN KEY (`domaine_activite_id`) REFERENCES `domaine_activites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `projets_forme_juridique_id_foreign` FOREIGN KEY (`forme_juridique_id`) REFERENCES `forme_juridiques` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `projets_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `representants`
--
ALTER TABLE `representants`
  ADD CONSTRAINT `representants_entreprise_id_foreign` FOREIGN KEY (`entreprise_id`) REFERENCES `entreprises` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `segment_clients`
--
ALTER TABLE `segment_clients`
  ADD CONSTRAINT `segment_clients_entreprise_id_foreign` FOREIGN KEY (`entreprise_id`) REFERENCES `entreprises` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `segment_clients_projet_id_foreign` FOREIGN KEY (`projet_id`) REFERENCES `projets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `service_offerts`
--
ALTER TABLE `service_offerts`
  ADD CONSTRAINT `service_offerts_entreprise_id_foreign` FOREIGN KEY (`entreprise_id`) REFERENCES `entreprises` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `service_offerts_projet_id_foreign` FOREIGN KEY (`projet_id`) REFERENCES `projets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
