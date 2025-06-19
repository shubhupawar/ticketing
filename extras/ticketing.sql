-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 19, 2025 at 04:18 PM
-- Server version: 8.0.39
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ticketing`
--

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
CREATE TABLE IF NOT EXISTS `attachments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `attachable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachable_id` bigint UNSIGNED NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attachments_attachable_type_attachable_id_index` (`attachable_type`,`attachable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attachments`
--

INSERT INTO `attachments` (`id`, `attachable_type`, `attachable_id`, `file_path`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Ticket', 3, 'uploads/hafi7pt4wGMbHNdzb1fKqngWomhPcIiKmHofPAHu.png', '2025-06-19 09:03:27', '2025-06-19 09:03:27'),
(2, 'App\\Models\\Reply', 1, 'uploads/t17WkYjnO88Kuw2UlCIxRvxSofPhepisMJJA3XLS.jpg', '2025-06-19 09:21:18', '2025-06-19 09:21:18'),
(3, 'App\\Models\\Reply', 2, 'uploads/aCCxOS1d8o33NFFJ5x6tAlNsobJVcHG9cOXPDapb.png', '2025-06-19 09:33:28', '2025-06-19 09:33:28'),
(4, 'App\\Models\\Ticket', 4, 'uploads/WJPtLDvQN1vTJhDSB57eCfVTTMzSZ3GJoTyzMTps.png', '2025-06-19 10:20:56', '2025-06-19 10:20:56'),
(5, 'App\\Models\\Reply', 3, 'uploads/QKpFPG0oIn0AFyvSYfLvMK7nrkbLbUpNg9GMppFi.png', '2025-06-19 10:26:40', '2025-06-19 10:26:40'),
(6, 'App\\Models\\Ticket', 5, 'uploads/EnfCXjDbvp2ZGd6yZTAtaf8Lx7wPW74efzWamQmi.png', '2025-06-19 10:31:33', '2025-06-19 10:31:33');

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
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_06_19_141617_create_tickets_table', 2),
(6, '2025_06_19_142305_create_attachments_table', 3),
(7, '2025_06_19_144353_create_replies_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 11, 'auth_token', '0e81e20d5d2f1908373dd30194d528705ca13c31f3a6e4ba63aab295151b3640', '[\"*\"]', NULL, NULL, '2025-06-19 08:43:54', '2025-06-19 08:43:54'),
(2, 'App\\Models\\User', 11, 'auth_token', '0cab1cde5bd1525ac6bfdc0dc342157a12f0b8751be0a4412ddfd4e4020ba396', '[\"*\"]', '2025-06-19 10:00:10', NULL, '2025-06-19 08:56:53', '2025-06-19 10:00:10'),
(3, 'App\\Models\\User', 11, 'auth_token', 'bc985c92ae07e2f5279ab10330974e6f19d05cb77dc032c6cbb13d692b45e9a2', '[\"*\"]', NULL, NULL, '2025-06-19 09:06:38', '2025-06-19 09:06:38'),
(4, 'App\\Models\\User', 12, 'auth_token', '82b460864e5c32c86d235975f77f15170a483f7534d61d91a2182b2b66ab730c', '[\"*\"]', '2025-06-19 09:36:35', NULL, '2025-06-19 09:35:08', '2025-06-19 09:36:35'),
(5, 'App\\Models\\User', 12, 'auth_token', 'b1621b16d29c52dbbac2754dda25b4c7f70ff6f9ef181962f8320e5c5c0b9f31', '[\"*\"]', '2025-06-19 09:59:27', NULL, '2025-06-19 09:44:53', '2025-06-19 09:59:27');

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

DROP TABLE IF EXISTS `replies`;
CREATE TABLE IF NOT EXISTS `replies` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `replies_ticket_id_foreign` (`ticket_id`),
  KEY `replies_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `replies`
--

INSERT INTO `replies` (`id`, `ticket_id`, `user_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 11, 'This is my reply', '2025-06-19 09:21:18', '2025-06-19 09:21:18'),
(2, 1, 11, 'This is my second reply', '2025-06-19 09:33:28', '2025-06-19 09:33:28'),
(3, 4, 11, 'reply by web', '2025-06-19 10:26:40', '2025-06-19 10:26:40'),
(4, 4, 11, 'second reply by web', '2025-06-19 10:27:33', '2025-06-19 10:27:33');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tickets_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `user_id`, `subject`, `description`, `created_at`, `updated_at`) VALUES
(1, 11, 'My first ticket', 'This is a test ticket only', '2025-06-19 09:01:01', '2025-06-19 09:01:01'),
(2, 11, 'My first ticket', 'This is a test ticket only', '2025-06-19 09:01:26', '2025-06-19 09:01:26'),
(3, 11, 'Ticket with file', 'Testing file upload', '2025-06-19 09:03:27', '2025-06-19 09:03:27'),
(4, 11, 'Ticket web 1', 'created by web', '2025-06-19 10:20:56', '2025-06-19 10:20:56'),
(5, 13, 'web user First Ticket', 'Ticket by Web User', '2025-06-19 10:31:33', '2025-06-19 10:31:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(11, 'Test User', 'test@example.com', NULL, '$2y$10$qW5P.qoiw5Jt28OZLcJjbO1y/Y9yYp0mliI1REe1LJ0F/xB00DHCC', NULL, '2025-06-19 08:43:54', '2025-06-19 08:43:54'),
(12, 'Second User', 'second@example.com', NULL, '$2y$10$P.qNXxTlSTQ6HB/836gCaer3eV9sVHjsUaMLR5Ifqw8YzUabge8RS', NULL, '2025-06-19 09:35:08', '2025-06-19 09:35:08'),
(13, 'Web User', 'web@example.com', NULL, '$2y$10$ML1hnQnP3RvQJ0bf1CSgC.lDRdaiRN7D9yFthKcVu1Otce//cv3fy', NULL, '2025-06-19 10:30:44', '2025-06-19 10:30:44');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `replies`
--
ALTER TABLE `replies`
  ADD CONSTRAINT `replies_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
