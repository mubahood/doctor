-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 26, 2022 at 03:47 AM
-- Server version: 10.3.34-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `goprintug_main`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, '2022-02-25 11:33:44'),
(2, 0, 13, 'Admin', 'fa-tasks', '', NULL, NULL, '2022-02-25 11:33:34'),
(4, 2, 14, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, '2022-02-25 11:33:34'),
(5, 2, 15, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, '2022-02-25 11:33:34'),
(6, 2, 16, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, '2022-02-25 11:33:34'),
(7, 2, 17, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, '2022-02-25 11:33:34'),
(8, 0, 7, 'categories', 'fa-map-marker', 'categories', NULL, '2021-09-17 18:07:30', '2022-02-25 11:33:34'),
(9, 8, 8, 'All categories', 'fa-bars', 'categories', NULL, '2021-09-17 18:08:07', '2022-02-25 11:33:34'),
(10, 8, 9, 'attributes', 'fa-adjust', 'attributes', NULL, '2021-09-17 18:08:40', '2022-02-25 11:33:34'),
(11, 0, 10, 'Location', 'fa-location-arrow', 'countries', NULL, '2021-09-23 07:33:49', '2022-02-25 11:33:34'),
(12, 11, 11, 'Cities / Division', 'fa-building', 'countries', NULL, '2021-09-23 07:34:27', '2022-02-25 11:33:34'),
(13, 11, 12, 'Areas', 'fa-building', 'cities', NULL, '2021-09-23 07:46:07', '2022-02-25 11:33:34'),
(14, 0, 6, 'products', 'fa-american-sign-language-interpreting', 'products', NULL, '2021-10-02 19:04:16', '2022-02-25 11:33:34'),
(15, 0, 5, 'users', 'fa-users', 'users', NULL, '2021-10-05 08:50:05', '2022-02-25 11:33:34'),
(16, 0, 4, 'Shop Profiles', 'fa-users', 'profiles', NULL, '2021-12-15 15:33:05', '2022-02-25 11:33:44'),
(17, 0, 2, 'Mobile App', 'fa-mobile-phone', NULL, NULL, '2022-02-25 11:32:49', '2022-02-25 11:33:44'),
(18, 17, 3, 'Banners', 'fa-align-left', 'banners', NULL, '2022-02-25 11:33:27', '2022-02-25 11:33:44');

-- --------------------------------------------------------

--
-- Table structure for table `admin_operation_log`
--

CREATE TABLE `admin_operation_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_operation_log`
--

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-26 03:11:26', '2021-11-26 03:11:26'),
(2, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-26 03:11:30', '2021-11-26 03:11:30'),
(3, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-26 03:12:28', '2021-11-26 03:12:28'),
(4, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-26 03:12:43', '2021-11-26 03:12:43'),
(5, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-26 03:14:20', '2021-11-26 03:14:20'),
(6, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-26 17:23:01', '2021-11-26 17:23:01'),
(7, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-26 17:23:28', '2021-11-26 17:23:28'),
(8, 1, 'admin/profiles/13/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-26 17:23:44', '2021-11-26 17:23:44'),
(9, 1, 'admin/profiles/13', 'PUT', '127.0.0.1', '{\"status\":\"1\",\"_token\":\"MMjPxqJMpbDdU4VH67gc9WMeEp52uOtejpdeZaQ8\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/profiles\"}', '2021-11-26 17:25:17', '2021-11-26 17:25:17'),
(10, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-11-26 17:25:19', '2021-11-26 17:25:19'),
(11, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-12-04 19:15:54', '2021-12-04 19:15:54'),
(12, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 19:16:02', '2021-12-04 19:16:02'),
(13, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"}}', '2021-12-04 19:16:50', '2021-12-04 19:16:50'),
(14, 1, 'admin/profiles/24/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 19:16:54', '2021-12-04 19:16:54'),
(15, 1, 'admin/profiles/24', 'PUT', '127.0.0.1', '{\"status\":\"1\",\"_token\":\"l1zlzO8EFvw1IE2PJNjDu4zh6P5wEcVknLfWLqAL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/profiles?&_sort%5Bcolumn%5D=created_at&_sort%5Btype%5D=desc\"}', '2021-12-04 19:18:54', '2021-12-04 19:18:54'),
(16, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"}}', '2021-12-04 19:18:54', '2021-12-04 19:18:54'),
(17, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"status\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-12-04 19:18:59', '2021-12-04 19:18:59'),
(18, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"status\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-12-04 19:19:00', '2021-12-04 19:19:00'),
(19, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-12-05 12:57:11', '2021-12-05 12:57:11'),
(20, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-12-05 13:27:22', '2021-12-05 13:27:22'),
(21, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-12-05 13:27:49', '2021-12-05 13:27:49'),
(22, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-12-05 13:28:19', '2021-12-05 13:28:19'),
(23, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-12-05 13:28:34', '2021-12-05 13:28:34'),
(24, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-12-05 13:28:49', '2021-12-05 13:28:49'),
(25, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 13:28:52', '2021-12-05 13:28:52'),
(26, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 13:28:54', '2021-12-05 13:28:54'),
(27, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 13:28:57', '2021-12-05 13:28:57'),
(28, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 13:29:04', '2021-12-05 13:29:04'),
(29, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-12-05 13:29:46', '2021-12-05 13:29:46'),
(30, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-12-05 13:30:06', '2021-12-05 13:30:06'),
(31, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-12-05 13:30:19', '2021-12-05 13:30:19'),
(32, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 13:30:23', '2021-12-05 13:30:23'),
(33, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 13:30:27', '2021-12-05 13:30:27'),
(34, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-12-05 13:30:46', '2021-12-05 13:30:46'),
(35, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-12-05 13:32:13', '2021-12-05 13:32:13'),
(36, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-12-05 13:32:21', '2021-12-05 13:32:21'),
(37, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 13:32:40', '2021-12-05 13:32:40'),
(38, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 13:32:42', '2021-12-05 13:32:42'),
(39, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 13:32:46', '2021-12-05 13:32:46'),
(40, 1, 'admin/auth/menu/3', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"D1jpjVX6pSP3pQDJln9dILIdNMxT2rtvemCjHXxF\"}', '2021-12-05 13:33:07', '2021-12-05 13:33:07'),
(41, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 13:33:08', '2021-12-05 13:33:08'),
(42, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"D1jpjVX6pSP3pQDJln9dILIdNMxT2rtvemCjHXxF\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":15},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":9},{\\\"id\\\":10}]},{\\\"id\\\":11,\\\"children\\\":[{\\\"id\\\":12},{\\\"id\\\":13}]},{\\\"id\\\":14},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2021-12-05 13:33:25', '2021-12-05 13:33:25'),
(43, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 13:33:25', '2021-12-05 13:33:25'),
(44, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"D1jpjVX6pSP3pQDJln9dILIdNMxT2rtvemCjHXxF\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":15},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":9},{\\\"id\\\":10}]},{\\\"id\\\":11,\\\"children\\\":[{\\\"id\\\":12},{\\\"id\\\":13}]},{\\\"id\\\":14},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2021-12-05 13:33:39', '2021-12-05 13:33:39'),
(45, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 13:33:40', '2021-12-05 13:33:40'),
(46, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"D1jpjVX6pSP3pQDJln9dILIdNMxT2rtvemCjHXxF\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":15},{\\\"id\\\":14},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":9},{\\\"id\\\":10}]},{\\\"id\\\":11,\\\"children\\\":[{\\\"id\\\":12},{\\\"id\\\":13}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2021-12-05 13:33:50', '2021-12-05 13:33:50'),
(47, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 13:33:51', '2021-12-05 13:33:51'),
(48, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-12-05 13:33:54', '2021-12-05 13:33:54'),
(49, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 13:33:59', '2021-12-05 13:33:59'),
(50, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2021-12-05 13:35:15', '2021-12-05 13:35:15'),
(51, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 13:35:27', '2021-12-05 13:35:27'),
(52, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-12-15 15:29:33', '2021-12-15 15:29:33'),
(53, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-15 15:30:59', '2021-12-15 15:30:59'),
(54, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"}}', '2021-12-15 15:31:06', '2021-12-15 15:31:06'),
(55, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"created_at\",\"type\":\"asc\"}}', '2021-12-15 15:31:08', '2021-12-15 15:31:08'),
(56, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"}}', '2021-12-15 15:31:09', '2021-12-15 15:31:09'),
(57, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"created_at\",\"type\":\"asc\"}}', '2021-12-15 15:31:11', '2021-12-15 15:31:11'),
(58, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"}}', '2021-12-15 15:31:12', '2021-12-15 15:31:12'),
(59, 1, 'admin/users/25/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-15 15:31:15', '2021-12-15 15:31:15'),
(60, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-15 15:31:23', '2021-12-15 15:31:23'),
(61, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-15 15:31:35', '2021-12-15 15:31:35'),
(62, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-15 15:31:36', '2021-12-15 15:31:36'),
(63, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-15 15:31:43', '2021-12-15 15:31:43'),
(64, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-15 15:31:45', '2021-12-15 15:31:45'),
(65, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-12-15 15:31:52', '2021-12-15 15:31:52'),
(66, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-12-15 15:32:01', '2021-12-15 15:32:01'),
(67, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-15 15:32:14', '2021-12-15 15:32:14'),
(68, 1, 'admin/auth/menu/15/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-15 15:32:32', '2021-12-15 15:32:32'),
(69, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-15 15:32:43', '2021-12-15 15:32:43'),
(70, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Agents\",\"icon\":\"fa-users\",\"uri\":\"profiles\",\"roles\":[null],\"permission\":null,\"_token\":\"LFF3YTDU7Ave6lnVIJ66mxbml1ifEUeB4AuxXV9z\"}', '2021-12-15 15:33:05', '2021-12-15 15:33:05'),
(71, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-12-15 15:33:05', '2021-12-15 15:33:05'),
(72, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"LFF3YTDU7Ave6lnVIJ66mxbml1ifEUeB4AuxXV9z\",\"_order\":\"[{\\\"id\\\":16},{\\\"id\\\":1},{\\\"id\\\":15},{\\\"id\\\":14},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":9},{\\\"id\\\":10}]},{\\\"id\\\":11,\\\"children\\\":[{\\\"id\\\":12},{\\\"id\\\":13}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2021-12-15 15:33:10', '2021-12-15 15:33:10'),
(73, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-15 15:33:11', '2021-12-15 15:33:11'),
(74, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-12-15 15:33:13', '2021-12-15 15:33:13'),
(75, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-15 15:33:16', '2021-12-15 15:33:16'),
(76, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"}}', '2021-12-15 15:33:21', '2021-12-15 15:33:21'),
(77, 1, 'admin/profiles/24/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-15 15:33:27', '2021-12-15 15:33:27'),
(78, 1, 'admin/profiles/24', 'PUT', '127.0.0.1', '{\"status\":\"1\",\"_token\":\"LFF3YTDU7Ave6lnVIJ66mxbml1ifEUeB4AuxXV9z\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/profiles?&_sort%5Bcolumn%5D=created_at&_sort%5Btype%5D=desc\"}', '2021-12-15 15:33:31', '2021-12-15 15:33:31'),
(79, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"}}', '2021-12-15 15:33:32', '2021-12-15 15:33:32'),
(80, 1, 'admin/profiles/23/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-15 15:33:36', '2021-12-15 15:33:36'),
(81, 1, 'admin/profiles/23', 'PUT', '127.0.0.1', '{\"status\":\"1\",\"_token\":\"LFF3YTDU7Ave6lnVIJ66mxbml1ifEUeB4AuxXV9z\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/profiles?&_sort%5Bcolumn%5D=created_at&_sort%5Btype%5D=desc\"}', '2021-12-15 15:36:47', '2021-12-15 15:36:47'),
(82, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"}}', '2021-12-15 15:36:48', '2021-12-15 15:36:48'),
(83, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"status\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-12-15 15:36:53', '2021-12-15 15:36:53'),
(84, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-12-15 15:37:22', '2021-12-15 15:37:22'),
(85, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\",\"per_page\":\"50\"}', '2021-12-15 15:38:41', '2021-12-15 15:38:41'),
(86, 1, 'admin/profiles/24/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-15 15:39:23', '2021-12-15 15:39:23'),
(87, 1, 'admin/profiles/24', 'PUT', '127.0.0.1', '{\"status\":\"1\",\"_token\":\"LFF3YTDU7Ave6lnVIJ66mxbml1ifEUeB4AuxXV9z\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/profiles?_sort%5Bcolumn%5D=created_at&_sort%5Btype%5D=desc&per_page=50\"}', '2021-12-15 15:39:28', '2021-12-15 15:39:28'),
(88, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"},\"per_page\":\"50\"}', '2021-12-15 15:39:28', '2021-12-15 15:39:28'),
(89, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"},\"per_page\":\"50\"}', '2021-12-15 15:39:41', '2021-12-15 15:39:41'),
(90, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"},\"per_page\":\"50\"}', '2021-12-15 18:51:14', '2021-12-15 18:51:14'),
(91, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-15 18:51:25', '2021-12-15 18:51:25'),
(92, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-15 18:54:44', '2021-12-15 18:54:44'),
(93, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-15 18:54:47', '2021-12-15 18:54:47'),
(94, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-12-27 11:08:56', '2021-12-27 11:08:56'),
(95, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-27 11:09:02', '2021-12-27 11:09:02'),
(96, 1, 'admin/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-27 11:09:18', '2021-12-27 11:09:18'),
(97, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-27 11:09:55', '2021-12-27 11:09:55'),
(98, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-12-27 18:52:03', '2021-12-27 18:52:03'),
(99, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-27 18:52:10', '2021-12-27 18:52:10'),
(100, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-27 18:52:20', '2021-12-27 18:52:20'),
(101, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-27 18:52:24', '2021-12-27 18:52:24'),
(102, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-12-27 18:53:33', '2021-12-27 18:53:33'),
(103, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-12-27 18:53:39', '2021-12-27 18:53:39'),
(104, 1, 'admin/profiles/25/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-27 18:53:46', '2021-12-27 18:53:46'),
(105, 1, 'admin/profiles/25', 'PUT', '127.0.0.1', '{\"status\":\"1\",\"_token\":\"284A8csyVOaJyECEfqjnyV5nyhQsp0uhtYacucRf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/profiles?_sort%5Bcolumn%5D=id&_sort%5Btype%5D=desc\"}', '2021-12-27 18:53:51', '2021-12-27 18:53:51'),
(106, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2021-12-27 18:53:51', '2021-12-27 18:53:51'),
(107, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-01-05 17:03:24', '2022-01-05 17:03:24'),
(108, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 17:03:38', '2022-01-05 17:03:38'),
(109, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-01-05 17:03:53', '2022-01-05 17:03:53'),
(110, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 17:04:28', '2022-01-05 17:04:28'),
(111, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 17:04:51', '2022-01-05 17:04:51'),
(112, 1, 'admin/users/12/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 17:05:04', '2022-01-05 17:05:04'),
(113, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 17:05:12', '2022-01-05 17:05:12'),
(114, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2022-01-05 17:05:18', '2022-01-05 17:05:18'),
(115, 1, 'admin/profiles/26/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 17:05:23', '2022-01-05 17:05:23'),
(116, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 17:05:34', '2022-01-05 17:05:34'),
(117, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 17:05:55', '2022-01-05 17:05:55'),
(118, 1, 'admin/users/12/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 17:06:02', '2022-01-05 17:06:02'),
(119, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 17:06:07', '2022-01-05 17:06:07'),
(120, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 17:06:09', '2022-01-05 17:06:09'),
(121, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"per_page\":\"10\"}', '2022-01-05 17:06:17', '2022-01-05 17:06:17'),
(122, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 17:07:05', '2022-01-05 17:07:05'),
(123, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 17:08:08', '2022-01-05 17:08:08'),
(124, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 17:08:42', '2022-01-05 17:08:42'),
(125, 1, 'admin/categories/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 17:08:52', '2022-01-05 17:08:52'),
(126, 1, 'admin/categories/8', 'PUT', '127.0.0.1', '{\"has_parent\":\"1\",\"parent\":\"1\",\"name\":\"Cars\",\"description\":\"Car category details go here...\",\"slug\":\"cars\",\"attributes\":{\"11\":{\"name\":\"Condition\",\"type\":\"radio\",\"options\":[\"New\",\"Used\",\"Reconditioned\",\"Bad\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"11\",\"_remove_\":\"0\"},\"12\":{\"name\":\"Brand\",\"type\":\"select\",\"options\":[\"Audi\",\"BMW\",\"Dodge\",\"Ferrari\",\"Hino\",\"Honder\",\"Hummer\",\"Isuzu\",\"Jaguar\",\"Honda\",\"Toyota\",null],\"units\":\"single\",\"is_required\":\"1\",\"id\":\"12\",\"_remove_\":\"0\"},\"13\":{\"name\":\"Model\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"13\",\"_remove_\":\"0\"},\"14\":{\"name\":\"Trim \\/ Edition\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"14\",\"_remove_\":\"0\"},\"15\":{\"name\":\"Year of Manufacture\",\"type\":\"number\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"15\",\"_remove_\":\"0\"},\"16\":{\"name\":\"Kilometers run\",\"type\":\"number\",\"options\":[null],\"units\":\"KM\",\"is_required\":\"1\",\"id\":\"16\",\"_remove_\":\"0\"},\"17\":{\"name\":\"Engine capacity\",\"type\":\"number\",\"options\":[null],\"units\":\"CC\",\"is_required\":\"1\",\"id\":\"17\",\"_remove_\":\"0\"},\"18\":{\"name\":\"Fuel type\",\"type\":\"radio\",\"options\":[\"Diesel\",\"Petrol\",\"CNG\",\"Hybrid\",\"Electric\",\"Octane\",\"LPG\",\"Other\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"18\",\"_remove_\":\"0\"},\"19\":{\"name\":\"Transmission\",\"type\":\"radio\",\"options\":[\"Manual\",\"Automatic\",\"Other transmission\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"19\",\"_remove_\":\"0\"},\"20\":{\"name\":\"Body type\",\"type\":\"select\",\"options\":[\"Saloon\",\"Hatchback\",\"Estate\",\"Sports\",\"SUV\",\"MPV\",null],\"units\":null,\"is_required\":\"0\",\"id\":\"20\",\"_remove_\":\"0\"},\"21\":{\"name\":\"Negotiable\",\"type\":\"checkbox\",\"options\":[null],\"units\":null,\"is_required\":\"0\",\"id\":\"21\",\"_remove_\":\"0\"},\"new_1\":{\"name\":\"Weight\",\"type\":\"number\",\"options\":[null],\"units\":\"KGs\",\"is_required\":\"0\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"PuurhjtT8JtKzfpMPC7eekg3uGw58NeVIuhHgDbc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2022-01-05 17:14:24', '2022-01-05 17:14:24'),
(127, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2022-01-05 17:14:25', '2022-01-05 17:14:25'),
(128, 1, 'admin/countries', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 17:16:05', '2022-01-05 17:16:05'),
(129, 1, 'admin/countries/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 17:16:10', '2022-01-05 17:16:10'),
(130, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 17:17:10', '2022-01-05 17:17:10'),
(131, 1, 'admin', 'GET', '209.222.97.206', '[]', '2022-01-12 16:14:52', '2022-01-12 16:14:52'),
(132, 1, 'admin', 'GET', '209.222.97.206', '[]', '2022-01-12 16:16:09', '2022-01-12 16:16:09'),
(133, 1, 'admin/profiles', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-12 16:16:18', '2022-01-12 16:16:18'),
(134, 1, 'admin/profiles', 'GET', '209.222.97.206', '[]', '2022-01-12 17:02:40', '2022-01-12 17:02:40'),
(135, 1, 'admin', 'GET', '209.222.97.206', '[]', '2022-01-16 15:15:45', '2022-01-16 15:15:45'),
(136, 1, 'admin/products', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-16 15:15:55', '2022-01-16 15:15:55'),
(137, 1, 'admin/products/15,16,17', 'DELETE', '209.222.97.206', '{\"_method\":\"delete\",\"_token\":\"HR4K8nQPWRE8oKcu29PngBzxL4Z8iIXaoME8pUKP\"}', '2022-01-16 15:16:27', '2022-01-16 15:16:27'),
(138, 1, 'admin/products', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-16 15:16:27', '2022-01-16 15:16:27'),
(139, 1, 'admin', 'GET', '209.222.97.206', '[]', '2022-01-16 23:05:48', '2022-01-16 23:05:48'),
(140, 1, 'admin/products', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-16 23:05:56', '2022-01-16 23:05:56'),
(141, 1, 'admin/categories', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-16 23:06:53', '2022-01-16 23:06:53'),
(142, 1, 'admin/categories/1/edit', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-16 23:07:39', '2022-01-16 23:07:39'),
(143, 1, 'admin/categories', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-16 23:08:58', '2022-01-16 23:08:58'),
(144, 1, 'admin/categories', 'GET', '209.222.97.206', '[]', '2022-01-17 00:44:50', '2022-01-17 00:44:50'),
(145, 1, 'admin', 'GET', '209.222.97.206', '[]', '2022-01-17 02:11:05', '2022-01-17 02:11:05'),
(146, 1, 'admin/auth/setting', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 02:11:20', '2022-01-17 02:11:20'),
(147, 1, 'admin', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 02:13:26', '2022-01-17 02:13:26'),
(148, 1, 'admin/users', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 02:13:35', '2022-01-17 02:13:35'),
(149, 1, 'admin', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 02:14:10', '2022-01-17 02:14:10'),
(150, 1, 'admin/attributes', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 02:15:03', '2022-01-17 02:15:03'),
(151, 1, 'admin/categories', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 02:15:11', '2022-01-17 02:15:11'),
(152, 1, 'admin/attributes', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 02:15:25', '2022-01-17 02:15:25'),
(153, 1, 'admin/attributes', 'GET', '209.222.97.206', '[]', '2022-01-17 02:16:18', '2022-01-17 02:16:18'),
(154, 1, 'admin/attributes', 'GET', '209.222.97.206', '[]', '2022-01-17 02:16:21', '2022-01-17 02:16:21'),
(155, 1, 'admin/categories', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 02:18:32', '2022-01-17 02:18:32'),
(156, 1, 'admin/categories/1/edit', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 02:19:00', '2022-01-17 02:19:00'),
(157, 1, 'admin/categories/1', 'PUT', '209.222.97.206', '{\"has_parent\":\"0\",\"name\":\"Branding\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"slug\":\"vehicles\",\"_token\":\"IWB7860uIRPajF3c6Lv6MfWDAH6WT8SVrVA8nmzC\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-17 02:33:44', '2022-01-17 02:33:44'),
(158, 1, 'admin/categories', 'GET', '209.222.97.206', '[]', '2022-01-17 02:33:44', '2022-01-17 02:33:44'),
(159, 1, 'admin', 'GET', '209.222.97.206', '[]', '2022-01-17 02:41:41', '2022-01-17 02:41:41'),
(160, 1, 'admin/categories', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 02:42:06', '2022-01-17 02:42:06'),
(161, 1, 'admin/categories/2/edit', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 02:42:58', '2022-01-17 02:42:58'),
(162, 1, 'admin/categories/2', 'PUT', '209.222.97.206', '{\"has_parent\":\"0\",\"name\":\"Graphics Designing\",\"description\":\"Graphics Designing\",\"slug\":\"property\",\"_token\":\"IWB7860uIRPajF3c6Lv6MfWDAH6WT8SVrVA8nmzC\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-17 02:44:06', '2022-01-17 02:44:06'),
(163, 1, 'admin/categories', 'GET', '209.222.97.206', '[]', '2022-01-17 02:44:06', '2022-01-17 02:44:06'),
(164, 1, 'admin/categories/3/edit', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 02:44:22', '2022-01-17 02:44:22'),
(165, 1, 'admin/categories/3', 'PUT', '209.222.97.206', '{\"has_parent\":\"0\",\"name\":\"Printing\",\"description\":\"Mobiles details go here\",\"slug\":\"mobiles\",\"_token\":\"IWB7860uIRPajF3c6Lv6MfWDAH6WT8SVrVA8nmzC\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-17 02:44:41', '2022-01-17 02:44:41'),
(166, 1, 'admin/categories', 'GET', '209.222.97.206', '[]', '2022-01-17 02:44:42', '2022-01-17 02:44:42'),
(167, 1, 'admin/categories/14/edit', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 02:45:04', '2022-01-17 02:45:04'),
(168, 1, 'admin/categories/14', 'PUT', '209.222.97.206', '{\"has_parent\":\"0\",\"name\":\"Printing\",\"description\":\"Buy and sell all kinds of printing in Uganda\",\"slug\":\"electronics\",\"_token\":\"IWB7860uIRPajF3c6Lv6MfWDAH6WT8SVrVA8nmzC\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-17 02:45:44', '2022-01-17 02:45:44'),
(169, 1, 'admin/categories', 'GET', '209.222.97.206', '[]', '2022-01-17 02:45:44', '2022-01-17 02:45:44'),
(170, 1, 'admin/categories', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 02:46:41', '2022-01-17 02:46:41'),
(171, 1, 'admin/categories/2/edit', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 02:47:01', '2022-01-17 02:47:01'),
(172, 1, 'admin/categories/2', 'PUT', '209.222.97.206', '{\"has_parent\":\"0\",\"name\":\"Printing\",\"description\":\"Print\",\"slug\":\"graphics-designing\",\"_token\":\"IWB7860uIRPajF3c6Lv6MfWDAH6WT8SVrVA8nmzC\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-17 02:47:24', '2022-01-17 02:47:24'),
(173, 1, 'admin/categories', 'GET', '209.222.97.206', '[]', '2022-01-17 02:47:24', '2022-01-17 02:47:24'),
(174, 1, 'admin/categories/3/edit', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 02:47:33', '2022-01-17 02:47:33'),
(175, 1, 'admin/categories/3', 'PUT', '209.222.97.206', '{\"has_parent\":\"0\",\"name\":\"Graphics Designing\",\"description\":\"Make graphical designs\",\"slug\":\"printing\",\"_token\":\"IWB7860uIRPajF3c6Lv6MfWDAH6WT8SVrVA8nmzC\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-17 02:48:16', '2022-01-17 02:48:16'),
(176, 1, 'admin/categories', 'GET', '209.222.97.206', '[]', '2022-01-17 02:48:16', '2022-01-17 02:48:16'),
(177, 1, 'admin/categories/3/edit', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 02:48:41', '2022-01-17 02:48:41'),
(178, 1, 'admin/categories/3', 'PUT', '209.222.97.206', '{\"has_parent\":\"0\",\"name\":\"Graphics Designing\",\"description\":\"Make graphical designs\",\"slug\":\"graphics-designing\",\"_token\":\"IWB7860uIRPajF3c6Lv6MfWDAH6WT8SVrVA8nmzC\",\"_method\":\"PUT\"}', '2022-01-17 02:48:47', '2022-01-17 02:48:47'),
(179, 1, 'admin/categories', 'GET', '209.222.97.206', '[]', '2022-01-17 02:48:48', '2022-01-17 02:48:48'),
(180, 1, 'admin/categories/14/edit', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 02:49:01', '2022-01-17 02:49:01'),
(181, 1, 'admin/categories/14', 'PUT', '209.222.97.206', '{\"has_parent\":\"0\",\"name\":\"Art and design\",\"description\":\"Buy and sell all kinds of printing in Uganda\",\"slug\":\"printing\",\"_token\":\"IWB7860uIRPajF3c6Lv6MfWDAH6WT8SVrVA8nmzC\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-17 02:49:17', '2022-01-17 02:49:17'),
(182, 1, 'admin/categories', 'GET', '209.222.97.206', '[]', '2022-01-17 02:49:19', '2022-01-17 02:49:19'),
(183, 1, 'admin/categories/2/edit', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 02:49:39', '2022-01-17 02:49:39'),
(184, 1, 'admin/categories/2', 'PUT', '209.222.97.206', '{\"has_parent\":\"0\",\"name\":\"Printing\",\"description\":\"Print\",\"slug\":\"printing\",\"attributes\":{\"new_1\":{\"name\":\"Stationery Supply\",\"type\":\"select\",\"options\":[null],\"units\":null,\"is_required\":\"0\",\"id\":null,\"_remove_\":\"1\"},\"new_2\":{\"name\":null,\"type\":null,\"options\":[null],\"units\":null,\"is_required\":\"0\",\"id\":null,\"_remove_\":\"1\"},\"new_3\":{\"name\":null,\"type\":null,\"options\":[null],\"units\":null,\"is_required\":\"0\",\"id\":null,\"_remove_\":\"1\"},\"new_4\":{\"name\":\"Stationery supply\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"0\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"IWB7860uIRPajF3c6Lv6MfWDAH6WT8SVrVA8nmzC\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-17 02:51:43', '2022-01-17 02:51:43'),
(185, 1, 'admin/categories', 'GET', '209.222.97.206', '[]', '2022-01-17 02:51:44', '2022-01-17 02:51:44'),
(186, 1, 'admin', 'GET', '209.222.97.206', '[]', '2022-01-17 03:59:25', '2022-01-17 03:59:25'),
(187, 1, 'admin/attributes', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 04:00:43', '2022-01-17 04:00:43'),
(188, 1, 'admin/attributes/1/edit', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 04:01:26', '2022-01-17 04:01:26'),
(189, 1, 'admin/countries', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 04:02:05', '2022-01-17 04:02:05'),
(190, 1, 'admin/attributes/1/edit', 'GET', '209.222.97.206', '[]', '2022-01-17 04:02:07', '2022-01-17 04:02:07'),
(191, 1, 'admin/cities', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 04:02:07', '2022-01-17 04:02:07'),
(192, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 04:02:08', '2022-01-17 04:02:08'),
(193, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 04:02:08', '2022-01-17 04:02:08'),
(194, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 04:02:09', '2022-01-17 04:02:09'),
(195, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 04:02:11', '2022-01-17 04:02:11'),
(196, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 04:02:12', '2022-01-17 04:02:12'),
(197, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 04:02:13', '2022-01-17 04:02:13'),
(198, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 04:02:14', '2022-01-17 04:02:14'),
(199, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 04:02:15', '2022-01-17 04:02:15'),
(200, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 04:02:16', '2022-01-17 04:02:16'),
(201, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 04:02:17', '2022-01-17 04:02:17'),
(202, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 04:02:19', '2022-01-17 04:02:19'),
(203, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 04:02:22', '2022-01-17 04:02:22'),
(204, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 04:02:24', '2022-01-17 04:02:24'),
(205, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 04:02:24', '2022-01-17 04:02:24'),
(206, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 04:02:26', '2022-01-17 04:02:26'),
(207, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 04:02:27', '2022-01-17 04:02:27'),
(208, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 04:02:28', '2022-01-17 04:02:28'),
(209, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 04:02:29', '2022-01-17 04:02:29'),
(210, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 04:02:30', '2022-01-17 04:02:30'),
(211, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 04:02:31', '2022-01-17 04:02:31'),
(212, 1, 'admin/cities', 'GET', '209.222.97.206', '[]', '2022-01-17 04:02:34', '2022-01-17 04:02:34'),
(213, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 04:02:59', '2022-01-17 04:02:59'),
(214, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 04:03:00', '2022-01-17 04:03:00'),
(215, 1, 'admin', 'GET', '209.222.97.206', '[]', '2022-01-17 04:03:15', '2022-01-17 04:03:15'),
(216, 1, 'admin/products', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 04:03:36', '2022-01-17 04:03:36'),
(217, 1, 'admin/users', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 04:04:16', '2022-01-17 04:04:16'),
(218, 1, 'admin/attributes', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 04:05:09', '2022-01-17 04:05:09'),
(219, 1, 'admin/auth/permissions', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 04:05:15', '2022-01-17 04:05:15'),
(220, 1, 'admin/auth/menu', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 04:05:34', '2022-01-17 04:05:34'),
(221, 1, 'admin/auth/menu/11/edit', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 04:05:54', '2022-01-17 04:05:54'),
(222, 1, 'admin/auth/menu/11', 'PUT', '209.222.97.206', '{\"parent_id\":\"0\",\"title\":\"Location\",\"icon\":\"fa-bars\",\"uri\":\"countries\",\"roles\":[null],\"permission\":null,\"_token\":\"2526std1Pb2o9Lb1jYdBuuFs3j8WZkddKMdAr3KZ\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/auth\\/menu\"}', '2022-01-17 04:06:01', '2022-01-17 04:06:01'),
(223, 1, 'admin/auth/menu', 'GET', '209.222.97.206', '[]', '2022-01-17 04:06:02', '2022-01-17 04:06:02'),
(224, 1, 'admin/auth/menu', 'GET', '209.222.97.206', '[]', '2022-01-17 04:06:07', '2022-01-17 04:06:07'),
(225, 1, 'admin/auth/roles', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 04:06:29', '2022-01-17 04:06:29'),
(226, 1, 'admin/auth/roles/1/edit', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 04:07:16', '2022-01-17 04:07:16'),
(227, 1, 'admin/auth/roles/1', 'PUT', '209.222.97.206', '{\"slug\":\"administrator\",\"name\":\"Sumayah Swaib\",\"permissions\":[\"1\",null],\"_token\":\"2526std1Pb2o9Lb1jYdBuuFs3j8WZkddKMdAr3KZ\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/auth\\/roles\"}', '2022-01-17 04:07:42', '2022-01-17 04:07:42'),
(228, 1, 'admin/auth/roles', 'GET', '209.222.97.206', '[]', '2022-01-17 04:07:42', '2022-01-17 04:07:42'),
(229, 1, 'admin/auth/roles/1/edit', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 04:08:10', '2022-01-17 04:08:10'),
(230, 1, 'admin/auth/roles/1', 'PUT', '209.222.97.206', '{\"slug\":\"administrator\",\"name\":\"Sumayah Swaib\",\"permissions\":[\"1\",null],\"_token\":\"2526std1Pb2o9Lb1jYdBuuFs3j8WZkddKMdAr3KZ\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/auth\\/roles\"}', '2022-01-17 04:08:40', '2022-01-17 04:08:40'),
(231, 1, 'admin/auth/roles', 'GET', '209.222.97.206', '[]', '2022-01-17 04:08:40', '2022-01-17 04:08:40'),
(232, 1, 'admin/profiles', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 04:09:46', '2022-01-17 04:09:46'),
(233, 1, 'admin/profiles', 'GET', '209.222.97.206', '[]', '2022-01-17 04:23:23', '2022-01-17 04:23:23'),
(234, 1, 'admin', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 04:24:00', '2022-01-17 04:24:00'),
(235, 1, 'admin/users', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 04:24:00', '2022-01-17 04:24:00'),
(236, 1, 'admin/users/12', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 04:24:24', '2022-01-17 04:24:24'),
(237, 1, 'admin', 'GET', '209.222.97.206', '[]', '2022-01-17 14:26:28', '2022-01-17 14:26:28'),
(238, 1, 'admin/users', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 14:26:38', '2022-01-17 14:26:38'),
(239, 1, 'admin/products', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 14:26:48', '2022-01-17 14:26:48'),
(240, 1, 'admin/categories', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 14:27:03', '2022-01-17 14:27:03'),
(241, 1, 'admin/attributes', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 14:27:27', '2022-01-17 14:27:27'),
(242, 1, 'admin/attributes', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 14:27:31', '2022-01-17 14:27:31'),
(243, 1, 'admin/attributes/create', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 14:28:19', '2022-01-17 14:28:19'),
(244, 1, 'admin/countries', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 14:28:38', '2022-01-17 14:28:38'),
(245, 1, 'admin/cities', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 14:28:40', '2022-01-17 14:28:40'),
(246, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 14:28:41', '2022-01-17 14:28:41'),
(247, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 14:28:41', '2022-01-17 14:28:41'),
(248, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 14:28:42', '2022-01-17 14:28:42'),
(249, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 14:28:42', '2022-01-17 14:28:42'),
(250, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 14:28:43', '2022-01-17 14:28:43'),
(251, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 14:28:44', '2022-01-17 14:28:44'),
(252, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 14:28:44', '2022-01-17 14:28:44'),
(253, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 14:28:45', '2022-01-17 14:28:45'),
(254, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 14:28:45', '2022-01-17 14:28:45'),
(255, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 14:28:47', '2022-01-17 14:28:47'),
(256, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 14:28:47', '2022-01-17 14:28:47'),
(257, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 14:28:48', '2022-01-17 14:28:48'),
(258, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 14:28:49', '2022-01-17 14:28:49'),
(259, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 14:28:49', '2022-01-17 14:28:49'),
(260, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 14:28:50', '2022-01-17 14:28:50'),
(261, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 14:28:51', '2022-01-17 14:28:51'),
(262, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 14:28:51', '2022-01-17 14:28:51'),
(263, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 14:28:52', '2022-01-17 14:28:52'),
(264, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 14:28:53', '2022-01-17 14:28:53'),
(265, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 14:28:53', '2022-01-17 14:28:53'),
(266, 1, 'admin/cities', 'GET', '209.222.97.206', '[]', '2022-01-17 14:28:54', '2022-01-17 14:28:54'),
(267, 1, 'admin/countries', 'GET', '209.222.97.206', '[]', '2022-01-17 14:29:12', '2022-01-17 14:29:12'),
(268, 1, 'admin/categories', 'GET', '209.222.97.206', '[]', '2022-01-17 14:29:26', '2022-01-17 14:29:26'),
(269, 1, 'admin/auth/permissions', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 14:29:49', '2022-01-17 14:29:49'),
(270, 1, 'admin/auth/roles', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 14:29:50', '2022-01-17 14:29:50'),
(271, 1, 'admin/countries', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 14:29:59', '2022-01-17 14:29:59'),
(272, 1, 'admin/auth/roles', 'GET', '209.222.97.206', '[]', '2022-01-17 14:30:00', '2022-01-17 14:30:00'),
(273, 1, 'admin/categories', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 14:30:20', '2022-01-17 14:30:20'),
(274, 1, 'admin/users', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 14:30:31', '2022-01-17 14:30:31'),
(275, 1, 'admin', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 14:30:33', '2022-01-17 14:30:33'),
(276, 1, 'admin/users', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 14:30:40', '2022-01-17 14:30:40'),
(277, 1, 'admin', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 14:30:43', '2022-01-17 14:30:43'),
(278, 1, 'admin/auth/setting', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 14:30:54', '2022-01-17 14:30:54'),
(279, 1, 'admin/auth/setting', 'PUT', '209.222.97.206', '{\"name\":\"Administrator\",\"password\":\"$2y$10$omiZ3CJUzWf\\/QGmwiLplGuDz2KT8Tf2fSa22oicpuP9H2kuOi45vS\",\"password_confirmation\":\"$2y$10$omiZ3CJUzWf\\/QGmwiLplGuDz2KT8Tf2fSa22oicpuP9H2kuOi45vS\",\"_token\":\"sS3lCgEjz7NAuLBfXnKUxwELOP2xXXkuGNSvut81\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\"}', '2022-01-17 14:31:58', '2022-01-17 14:31:58'),
(280, 1, 'admin/auth/setting', 'GET', '209.222.97.206', '[]', '2022-01-17 14:31:58', '2022-01-17 14:31:58'),
(281, 1, 'admin/profiles', 'GET', '209.222.97.206', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 14:32:11', '2022-01-17 14:32:11'),
(282, 1, 'admin/profiles', 'GET', '209.222.97.206', '[]', '2022-01-18 12:20:24', '2022-01-18 12:20:24'),
(283, 1, 'admin', 'GET', '197.239.6.149', '[]', '2022-01-19 12:42:46', '2022-01-19 12:42:46'),
(284, 1, 'admin/cities', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 12:43:03', '2022-01-19 12:43:03'),
(285, 1, 'admin', 'GET', '197.239.6.149', '[]', '2022-01-19 12:43:04', '2022-01-19 12:43:04'),
(286, 1, 'admin/cities', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 12:43:24', '2022-01-19 12:43:24'),
(287, 1, 'admin', 'GET', '197.239.6.149', '[]', '2022-01-19 12:43:24', '2022-01-19 12:43:24'),
(288, 1, 'admin/countries', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 12:43:25', '2022-01-19 12:43:25'),
(289, 1, 'admin', 'GET', '197.239.6.149', '[]', '2022-01-19 12:43:26', '2022-01-19 12:43:26'),
(290, 1, 'admin/products', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 12:43:34', '2022-01-19 12:43:34'),
(291, 1, 'admin', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 12:43:54', '2022-01-19 12:43:54'),
(292, 1, 'admin/users', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 12:43:58', '2022-01-19 12:43:58'),
(293, 1, 'admin/categories', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 12:44:08', '2022-01-19 12:44:08'),
(294, 1, 'admin/categories/1/edit', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 12:45:30', '2022-01-19 12:45:30'),
(295, 1, 'admin/categories/1', 'PUT', '197.239.6.149', '{\"has_parent\":\"0\",\"name\":\"Branding\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"slug\":\"branding\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-19 12:47:40', '2022-01-19 12:47:40'),
(296, 1, 'admin/categories', 'GET', '197.239.6.149', '[]', '2022-01-19 12:47:41', '2022-01-19 12:47:41'),
(297, 1, 'admin/categories/1/edit', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 12:52:10', '2022-01-19 12:52:10'),
(298, 1, 'admin/categories/1', 'PUT', '197.239.6.149', '{\"has_parent\":\"0\",\"name\":\"Branding\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"slug\":\"branding\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-19 12:52:45', '2022-01-19 12:52:45'),
(299, 1, 'admin/categories', 'GET', '197.239.6.149', '[]', '2022-01-19 12:52:45', '2022-01-19 12:52:45'),
(300, 1, 'admin/categories', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 12:56:14', '2022-01-19 12:56:14'),
(301, 1, 'admin/categories/1/edit', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 12:56:57', '2022-01-19 12:56:57'),
(302, 1, 'admin/categories', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 12:57:42', '2022-01-19 12:57:42'),
(303, 1, 'admin/categories/create', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 12:57:45', '2022-01-19 12:57:45'),
(304, 1, 'admin/categories', 'POST', '197.239.6.149', '{\"has_parent\":\"0\",\"name\":\"Stationery\",\"description\":\"Buy and sell all kinds of Stationery in Uganda\",\"slug\":null,\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-19 12:58:51', '2022-01-19 12:58:51'),
(305, 1, 'admin/categories', 'GET', '197.239.6.149', '[]', '2022-01-19 12:58:51', '2022-01-19 12:58:51'),
(306, 1, 'admin/categories/1/edit', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 13:00:14', '2022-01-19 13:00:14'),
(307, 1, 'admin/categories/1', 'PUT', '197.239.6.149', '{\"has_parent\":\"0\",\"name\":\"Branding\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"slug\":\"branding\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-19 13:00:35', '2022-01-19 13:00:35'),
(308, 1, 'admin/categories', 'GET', '197.239.6.149', '[]', '2022-01-19 13:00:35', '2022-01-19 13:00:35'),
(309, 1, 'admin/categories/19/edit', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 13:00:54', '2022-01-19 13:00:54'),
(310, 1, 'admin/categories/19', 'PUT', '197.239.6.149', '{\"has_parent\":\"0\",\"name\":\"Stationery\",\"description\":\"Buy and sell all kinds of Stationery in Uganda\",\"slug\":\"stationery\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-19 13:01:32', '2022-01-19 13:01:32'),
(311, 1, 'admin/categories', 'GET', '197.239.6.149', '[]', '2022-01-19 13:01:32', '2022-01-19 13:01:32'),
(312, 1, 'admin/categories', 'GET', '197.239.6.149', '[]', '2022-01-19 13:01:36', '2022-01-19 13:01:36'),
(313, 1, 'admin/categories/19/edit', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 13:07:49', '2022-01-19 13:07:49'),
(314, 1, 'admin/categories/19', 'PUT', '197.239.6.149', '{\"has_parent\":\"0\",\"name\":\"Stationery\",\"description\":\"Buy and sell all kinds of Stationery in Uganda\",\"slug\":\"stationery\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-19 13:08:12', '2022-01-19 13:08:12'),
(315, 1, 'admin/categories', 'GET', '197.239.6.149', '[]', '2022-01-19 13:08:13', '2022-01-19 13:08:13'),
(316, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"19\",\"_model\":\"App_Models_Category\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 13:08:26', '2022-01-19 13:08:26'),
(317, 1, 'admin/categories', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 13:08:27', '2022-01-19 13:08:27'),
(318, 1, 'admin/categories', 'GET', '197.239.6.149', '[]', '2022-01-19 13:08:56', '2022-01-19 13:08:56'),
(319, 1, 'admin/categories/create', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 13:09:24', '2022-01-19 13:09:24');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(320, 1, 'admin/categories', 'POST', '197.239.6.149', '{\"has_parent\":\"0\",\"name\":\"Stationery\",\"description\":\"Buy and sell all kinds of Stationery in Uganda\",\"slug\":null,\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-19 13:10:02', '2022-01-19 13:10:02'),
(321, 1, 'admin/categories', 'GET', '197.239.6.149', '[]', '2022-01-19 13:10:03', '2022-01-19 13:10:03'),
(322, 1, 'admin/categories/20/edit', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 13:10:19', '2022-01-19 13:10:19'),
(323, 1, 'admin/categories/20', 'PUT', '197.239.6.149', '{\"has_parent\":\"0\",\"name\":\"Stationery\",\"description\":\"Buy and sell all kinds of Stationery in Uganda\",\"slug\":\"stationery\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-19 13:10:34', '2022-01-19 13:10:34'),
(324, 1, 'admin/categories', 'GET', '197.239.6.149', '[]', '2022-01-19 13:10:35', '2022-01-19 13:10:35'),
(325, 1, 'admin/categories/2/edit', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 13:10:52', '2022-01-19 13:10:52'),
(326, 1, 'admin/categories/2', 'PUT', '197.239.6.149', '{\"has_parent\":\"0\",\"name\":\"Printing\",\"description\":\"Print\",\"slug\":\"printing\",\"attributes\":{\"57\":{\"name\":\"Stationery supply\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"0\",\"id\":\"57\",\"_remove_\":\"0\"}},\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-19 13:11:16', '2022-01-19 13:11:16'),
(327, 1, 'admin/categories', 'GET', '197.239.6.149', '[]', '2022-01-19 13:11:17', '2022-01-19 13:11:17'),
(328, 1, 'admin/categories/2/edit', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 13:11:30', '2022-01-19 13:11:30'),
(329, 1, 'admin/categories/2', 'PUT', '197.239.6.149', '{\"has_parent\":\"0\",\"name\":\"Printing\",\"description\":\"Print\",\"slug\":\"printing\",\"attributes\":{\"57\":{\"name\":\"Stationery supply\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"0\",\"id\":\"57\",\"_remove_\":\"1\"}},\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-19 13:12:19', '2022-01-19 13:12:19'),
(330, 1, 'admin/categories', 'GET', '197.239.6.149', '[]', '2022-01-19 13:12:20', '2022-01-19 13:12:20'),
(331, 1, 'admin/categories/create', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 13:13:29', '2022-01-19 13:13:29'),
(332, 1, 'admin/categories', 'POST', '197.239.6.149', '{\"has_parent\":\"0\",\"name\":\"Art and Design\",\"description\":\"Buy and sell all kinds of Art  in Uganda\",\"slug\":null,\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-19 13:14:13', '2022-01-19 13:14:13'),
(333, 1, 'admin/categories', 'GET', '197.239.6.149', '[]', '2022-01-19 13:14:14', '2022-01-19 13:14:14'),
(334, 1, 'admin/categories/8/edit', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 13:32:58', '2022-01-19 13:32:58'),
(335, 1, 'admin/categories/8', 'PUT', '197.239.6.149', '{\"has_parent\":\"1\",\"parent\":\"1\",\"name\":\"Business Cards\",\"description\":\"Business Cards category details go here...\",\"slug\":\"cars\",\"attributes\":{\"11\":{\"name\":\"Condition\",\"type\":\"radio\",\"options\":[\"Laminated\",\"Not Lamianted\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"11\",\"_remove_\":\"0\"},\"12\":{\"name\":\"paper type\",\"type\":\"select\",\"options\":[\"Artboard\",\"Ivory\",null],\"units\":\"single\",\"is_required\":\"0\",\"id\":\"12\",\"_remove_\":\"0\"},\"13\":{\"name\":\"Model\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"13\",\"_remove_\":\"1\"},\"14\":{\"name\":\"Trim \\/ Edition\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"14\",\"_remove_\":\"1\"},\"15\":{\"name\":\"Year of Manufacture\",\"type\":\"number\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"15\",\"_remove_\":\"1\"},\"16\":{\"name\":\"Kilometers run\",\"type\":\"number\",\"options\":[null],\"units\":\"KM\",\"is_required\":\"1\",\"id\":\"16\",\"_remove_\":\"1\"},\"17\":{\"name\":\"Engine capacity\",\"type\":\"number\",\"options\":[null],\"units\":\"CC\",\"is_required\":\"1\",\"id\":\"17\",\"_remove_\":\"1\"},\"18\":{\"name\":\"Fuel type\",\"type\":\"radio\",\"options\":[\"Diesel\",\"Petrol\",\"CNG\",\"Hybrid\",\"Electric\",\"Octane\",\"LPG\",\"Other\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"18\",\"_remove_\":\"1\"},\"19\":{\"name\":\"Transmission\",\"type\":\"radio\",\"options\":[\"Manual\",\"Automatic\",\"Other transmission\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"19\",\"_remove_\":\"1\"},\"20\":{\"name\":\"Body type\",\"type\":\"select\",\"options\":[\"Saloon\",\"Hatchback\",\"Estate\",\"Sports\",\"SUV\",\"MPV\",null],\"units\":null,\"is_required\":\"0\",\"id\":\"20\",\"_remove_\":\"1\"},\"21\":{\"name\":\"Negotiable\",\"type\":\"checkbox\",\"options\":[null],\"units\":null,\"is_required\":\"0\",\"id\":\"21\",\"_remove_\":\"0\"},\"56\":{\"name\":\"Weight\",\"type\":\"number\",\"options\":[null],\"units\":\"KGs\",\"is_required\":\"0\",\"id\":\"56\",\"_remove_\":\"1\"}},\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-19 13:37:13', '2022-01-19 13:37:13'),
(336, 1, 'admin/categories', 'GET', '197.239.6.149', '[]', '2022-01-19 13:37:14', '2022-01-19 13:37:14'),
(337, 1, 'admin/categories/8/edit', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 13:38:11', '2022-01-19 13:38:11'),
(338, 1, 'admin/categories/8', 'PUT', '197.239.6.149', '{\"has_parent\":\"1\",\"parent\":\"2\",\"name\":\"Business Cards\",\"description\":\"Business Cards category details go here...\",\"slug\":\"business-cards\",\"attributes\":{\"11\":{\"name\":\"Condition\",\"type\":\"radio\",\"options\":[\"Laminated\",\"Not Lamianted\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"11\",\"_remove_\":\"0\"},\"12\":{\"name\":\"paper type\",\"type\":\"select\",\"options\":[\"Artboard\",\"Ivory\",null],\"units\":\"single\",\"is_required\":\"0\",\"id\":\"12\",\"_remove_\":\"0\"},\"21\":{\"name\":\"Negotiable\",\"type\":\"checkbox\",\"options\":[null],\"units\":null,\"is_required\":\"0\",\"id\":\"21\",\"_remove_\":\"0\"}},\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-19 13:38:28', '2022-01-19 13:38:28'),
(339, 1, 'admin/categories', 'GET', '197.239.6.149', '[]', '2022-01-19 13:38:29', '2022-01-19 13:38:29'),
(340, 1, 'admin/categories/8/edit', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 13:39:21', '2022-01-19 13:39:21'),
(341, 1, 'admin/categories/8', 'PUT', '197.239.6.149', '{\"has_parent\":\"1\",\"parent\":\"2\",\"name\":\"Business Cards\",\"description\":\"Business Cards category details go here...\",\"slug\":\"business-cards\",\"attributes\":{\"11\":{\"name\":\"Condition\",\"type\":\"radio\",\"options\":[\"Laminated\",\"Not Lamianted\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"11\",\"_remove_\":\"0\"},\"12\":{\"name\":\"paper type\",\"type\":\"select\",\"options\":[\"Artboard\",\"Ivory\",null],\"units\":\"single\",\"is_required\":\"0\",\"id\":\"12\",\"_remove_\":\"0\"},\"21\":{\"name\":\"Negotiable\",\"type\":\"checkbox\",\"options\":[null],\"units\":null,\"is_required\":\"0\",\"id\":\"21\",\"_remove_\":\"0\"}},\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-19 13:39:29', '2022-01-19 13:39:29'),
(342, 1, 'admin/categories', 'GET', '197.239.6.149', '[]', '2022-01-19 13:39:30', '2022-01-19 13:39:30'),
(343, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"21\",\"_model\":\"App_Models_Category\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 13:48:38', '2022-01-19 13:48:38'),
(344, 1, 'admin/categories', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 13:48:39', '2022-01-19 13:48:39'),
(345, 1, 'admin/categories/9/edit', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 13:49:16', '2022-01-19 13:49:16'),
(346, 1, 'admin/categories/9', 'PUT', '197.239.6.149', '{\"has_parent\":\"0\",\"name\":\"Travel Mug\",\"description\":\"Travel Mug DETAILS GO HERE.....\",\"slug\":\"motorbikes\",\"attributes\":{\"22\":{\"name\":\"Color\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"0\",\"id\":\"22\",\"_remove_\":\"0\"},\"23\":{\"name\":\"Condition\",\"type\":\"radio\",\"options\":[\"Used\",\"New\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"23\",\"_remove_\":\"1\"},\"24\":{\"name\":\"Brand\",\"type\":\"radio\",\"options\":[\"Akij\",\"Alliance\",\"Bajaj\",\"Senke\",\"Suzuki\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"24\",\"_remove_\":\"1\"},\"25\":{\"name\":\"Trim \\/ Edition\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"25\",\"_remove_\":\"1\"},\"26\":{\"name\":\"Year of Manufacture\",\"type\":\"number\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"26\",\"_remove_\":\"1\"},\"27\":{\"name\":\"Kilometers run\",\"type\":\"number\",\"options\":[null],\"units\":\"KM\",\"is_required\":\"1\",\"id\":\"27\",\"_remove_\":\"1\"},\"28\":{\"name\":\"Engine capacity\",\"type\":\"number\",\"options\":[null],\"units\":\"CC\",\"is_required\":\"1\",\"id\":\"28\",\"_remove_\":\"1\"},\"29\":{\"name\":\"Negotiable\",\"type\":\"checkbox\",\"options\":[\"Negotiable\",null],\"units\":null,\"is_required\":\"0\",\"id\":\"29\",\"_remove_\":\"1\"}},\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-19 13:51:06', '2022-01-19 13:51:06'),
(347, 1, 'admin/categories', 'GET', '197.239.6.149', '[]', '2022-01-19 13:51:06', '2022-01-19 13:51:06'),
(348, 1, 'admin/categories/4/edit', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 13:55:02', '2022-01-19 13:55:02'),
(349, 1, 'admin/categories/4', 'PUT', '197.239.6.149', '{\"has_parent\":\"0\",\"name\":\"Company Logos\",\"description\":\"Company Logos Details\",\"slug\":\"mobile-phones\",\"attributes\":{\"1\":{\"name\":\"Condition\",\"type\":\"radio\",\"options\":[\"New\",\"Used\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"1\",\"_remove_\":\"1\"},\"2\":{\"name\":\"Authenticity\",\"type\":\"radio\",\"options\":[\"Original\",\"Refurbished\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"2\",\"_remove_\":\"1\"},\"3\":{\"name\":\"Brand\",\"type\":\"select\",\"options\":[\"Acer\",\"Apple\",\"Asus\",\"Blackberry\",\"Blu\",\"China mobile\",\"Dell\",\"G-Five\",\"HTC\",\"Huawei\",\"Infinix\",\"Itel\",\"Lava\",\"Lenovo\",\"LG\",\"Motorola\",\"Nokia\",\"Oneplus\",\"OPPO\",null],\"units\":\"single\",\"is_required\":\"1\",\"id\":\"3\",\"_remove_\":\"1\"},\"4\":{\"name\":\"Model\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"4\",\"_remove_\":\"1\"},\"5\":{\"name\":\"Features\",\"type\":\"checkbox\",\"options\":[\"Bluetooth\",\"Camera\",\"Dual-Lens Camera\",\"Dual SIM\",\"Expandable Memory\",\"Fingerprint Sensor\",\"GPS\",\"Physical keyboard\",\"Motion Sensors\",\"3G\",\"4G\",\"GSM\",\"Touch screen\",null],\"units\":null,\"is_required\":\"0\",\"id\":\"5\",\"_remove_\":\"1\"},\"7\":{\"name\":\"Negotiable\",\"type\":\"checkbox\",\"options\":[null],\"units\":null,\"is_required\":\"0\",\"id\":\"7\",\"_remove_\":\"0\"},\"38\":{\"name\":\"Test\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"0\",\"id\":\"38\",\"_remove_\":\"1\"}},\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-19 13:56:53', '2022-01-19 13:56:53'),
(350, 1, 'admin/categories', 'GET', '197.239.6.149', '[]', '2022-01-19 13:56:54', '2022-01-19 13:56:54'),
(351, 1, 'admin/categories/5/edit', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 13:59:43', '2022-01-19 13:59:43'),
(352, 1, 'admin/categories/5', 'PUT', '197.239.6.149', '{\"has_parent\":\"0\",\"name\":\"Online Posters\",\"description\":\"Online Posters\",\"slug\":\"mobile-phone-accessories\",\"attributes\":{\"8\":{\"name\":\"Poster  type\",\"type\":\"radio\",\"options\":[\"face book\",\"Instagram\",\"cover\",\"post\",\"profile\",null],\"units\":\"single\",\"is_required\":\"0\",\"id\":\"8\",\"_remove_\":\"0\"},\"9\":{\"name\":\"Condition\",\"type\":\"radio\",\"options\":[\"New\",\"Used\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"9\",\"_remove_\":\"1\"}},\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-19 14:03:32', '2022-01-19 14:03:32'),
(353, 1, 'admin/categories', 'GET', '197.239.6.149', '[]', '2022-01-19 14:03:32', '2022-01-19 14:03:32'),
(354, 1, 'admin/categories/6/edit', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:03:42', '2022-01-19 14:03:42'),
(355, 1, 'admin/categories/6', 'PUT', '197.239.6.149', '{\"has_parent\":\"0\",\"name\":\"Photo Books\",\"description\":\"Photo Books\",\"slug\":\"mobile-phone-services\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-19 14:04:36', '2022-01-19 14:04:36'),
(356, 1, 'admin/categories', 'GET', '197.239.6.149', '[]', '2022-01-19 14:04:37', '2022-01-19 14:04:37'),
(357, 1, 'admin/categories/10/edit', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:05:13', '2022-01-19 14:05:13'),
(358, 1, 'admin/categories/10', 'PUT', '197.239.6.149', '{\"has_parent\":\"0\",\"name\":\"Plastic Identity Card\",\"description\":\"Plastic Identity Card\",\"slug\":\"land\",\"attributes\":{\"30\":{\"name\":\"Id  type\",\"type\":\"select\",\"options\":[\"Plain White\",\"Gold\",\"Silver\",\"Embossed\",\"chip cards\",\"Magnetic Stripped\",\"offwhite\",null],\"units\":null,\"is_required\":\"0\",\"id\":\"30\",\"_remove_\":\"0\"},\"31\":{\"name\":\"Lamination\",\"type\":\"radio\",\"options\":[\"laminated\",\"Not Laminated\",null],\"units\":null,\"is_required\":\"0\",\"id\":\"31\",\"_remove_\":\"0\"},\"32\":{\"name\":\"Printer\",\"type\":\"select\",\"options\":[\"fargo\",\"Epson\",null],\"units\":null,\"is_required\":\"0\",\"id\":\"32\",\"_remove_\":\"0\"},\"33\":{\"name\":\"Land Address\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"33\",\"_remove_\":\"1\"}},\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-19 14:09:44', '2022-01-19 14:09:44'),
(359, 1, 'admin/categories', 'GET', '197.239.6.149', '[]', '2022-01-19 14:09:45', '2022-01-19 14:09:45'),
(360, 1, 'admin/categories/11/edit', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:10:08', '2022-01-19 14:10:08'),
(361, 1, 'admin/categories', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:17:41', '2022-01-19 14:17:41'),
(362, 1, 'admin/categories/10/edit', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:17:41', '2022-01-19 14:17:41'),
(363, 1, 'admin/categories', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:17:43', '2022-01-19 14:17:43'),
(364, 1, 'admin/categories/6/edit', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:17:44', '2022-01-19 14:17:44'),
(365, 1, 'admin/categories', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:17:49', '2022-01-19 14:17:49'),
(366, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"15\",\"_model\":\"App_Models_Category\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:18:19', '2022-01-19 14:18:19'),
(367, 1, 'admin/categories', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:18:20', '2022-01-19 14:18:20'),
(368, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"16\",\"_model\":\"App_Models_Category\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:18:31', '2022-01-19 14:18:31'),
(369, 1, 'admin/categories', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:18:31', '2022-01-19 14:18:31'),
(370, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"14\",\"_model\":\"App_Models_Category\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:18:38', '2022-01-19 14:18:38'),
(371, 1, 'admin/categories', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:18:39', '2022-01-19 14:18:39'),
(372, 1, 'admin/categories/12', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:19:37', '2022-01-19 14:19:37'),
(373, 1, 'admin/categories', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:19:46', '2022-01-19 14:19:46'),
(374, 1, 'admin/categories/6/edit', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:19:47', '2022-01-19 14:19:47'),
(375, 1, 'admin/categories', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:19:50', '2022-01-19 14:19:50'),
(376, 1, 'admin/categories/11', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:20:06', '2022-01-19 14:20:06'),
(377, 1, 'admin/categories', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:20:21', '2022-01-19 14:20:21'),
(378, 1, 'admin/categories/12/edit', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:21:28', '2022-01-19 14:21:28'),
(379, 1, 'admin/categories/12', 'PUT', '197.239.6.149', '{\"has_parent\":\"1\",\"parent\":\"1\",\"name\":\"Pen\",\"description\":\"Buy and sell all kinds of branded pens in Uganda\",\"slug\":\"bicycles\",\"attributes\":{\"39\":{\"name\":\"Branding type\",\"type\":\"radio\",\"options\":[\"Screen printing\",\"Engraving\",null],\"units\":null,\"is_required\":\"0\",\"id\":\"39\",\"_remove_\":\"0\"},\"40\":{\"name\":\"Brand\",\"type\":\"select\",\"options\":[\"Adder Atlas\",\"Camp Claud\",\"Butler Combat\",\"Core Coyote\",\"Diamond Back\",\"Dragon Duranta\",\"Duranta Extreme\",\"Falcon Finiss\",\"Format Formula\",\"Foxter Galaxy\",\"Ghost Giant\",\"Haolaixi Hero\",\"Indigo Kellys\",\"Landao Laux\",\"Mbm Marine\",\"Merida Mustang\",\"Nekro Paxton\",\"Pelican Phoenix\",\"Precious Prince\",\"Python Raleigh\",\"Riddik Rock\",\"Machine Safeway\",\"Saracen Serious\",\"Trek Trinx\",\"Unifox Upland\",\"Veloce Vertigo\",\"Viking Voyager\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"40\",\"_remove_\":\"1\"},\"new_1\":{\"name\":\"Material\",\"type\":\"select\",\"options\":[\"Plastic\",\"Metalic\",null],\"units\":null,\"is_required\":\"0\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-19 14:23:27', '2022-01-19 14:23:27'),
(380, 1, 'admin/categories', 'GET', '197.239.6.149', '[]', '2022-01-19 14:23:28', '2022-01-19 14:23:28'),
(381, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"18\",\"_model\":\"App_Models_Category\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:23:54', '2022-01-19 14:23:54'),
(382, 1, 'admin/categories', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:23:54', '2022-01-19 14:23:54'),
(383, 1, 'admin/categories/13/edit', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:24:09', '2022-01-19 14:24:09'),
(384, 1, 'admin/categories/13', 'PUT', '197.239.6.149', '{\"has_parent\":\"1\",\"parent\":\"1\",\"name\":\"Corporate Shirts\",\"description\":\"Buy and sell all kinds of Corporate Shirts in Uganda\",\"slug\":\"trucks\",\"attributes\":{\"41\":{\"name\":\"print Type\",\"type\":\"radio\",\"options\":[\"Embroidery\",\"Screen Printing\",null],\"units\":null,\"is_required\":\"0\",\"id\":\"41\",\"_remove_\":\"0\"},\"42\":{\"name\":\"Material\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"0\",\"id\":\"42\",\"_remove_\":\"0\"},\"43\":{\"name\":\"Trim \\/ Edition\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"43\",\"_remove_\":\"1\"},\"44\":{\"name\":\"Model year\",\"type\":\"number\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"44\",\"_remove_\":\"1\"},\"45\":{\"name\":\"Kilometers run (km)\",\"type\":\"number\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"45\",\"_remove_\":\"1\"}},\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-19 14:26:41', '2022-01-19 14:26:41'),
(385, 1, 'admin/categories', 'GET', '197.239.6.149', '[]', '2022-01-19 14:26:41', '2022-01-19 14:26:41'),
(386, 1, 'admin/categories/11/edit', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:26:57', '2022-01-19 14:26:57'),
(387, 1, 'admin/categories/11', 'PUT', '197.239.6.149', '{\"has_parent\":\"0\",\"name\":\"Banners\",\"description\":\"Banners For Sale details go here\",\"slug\":\"apartments-for-sale\",\"attributes\":{\"34\":{\"name\":\"size\",\"type\":\"number\",\"options\":[null],\"units\":\"metres\",\"is_required\":\"1\",\"id\":\"34\",\"_remove_\":\"1\"},\"35\":{\"name\":\"Baths\",\"type\":\"number\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"35\",\"_remove_\":\"1\"},\"36\":{\"name\":\"Size\",\"type\":\"number\",\"options\":[null],\"units\":\"sqft\",\"is_required\":\"1\",\"id\":\"36\",\"_remove_\":\"0\"},\"37\":{\"name\":\"Address\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"0\",\"id\":\"37\",\"_remove_\":\"0\"}},\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-19 14:28:53', '2022-01-19 14:28:53'),
(388, 1, 'admin/categories', 'GET', '197.239.6.149', '[]', '2022-01-19 14:28:54', '2022-01-19 14:28:54'),
(389, 1, 'admin/categories/20/edit', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:29:05', '2022-01-19 14:29:05'),
(390, 1, 'admin/categories/20', 'PUT', '197.239.6.149', '{\"has_parent\":\"0\",\"name\":\"Stationery\",\"description\":\"Buy and sell all kinds of Stationery in Uganda\",\"slug\":\"stationery\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-19 14:29:25', '2022-01-19 14:29:25'),
(391, 1, 'admin/categories', 'GET', '197.239.6.149', '[]', '2022-01-19 14:29:25', '2022-01-19 14:29:25'),
(392, 1, 'admin/categories/create', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:29:41', '2022-01-19 14:29:41'),
(393, 1, 'admin/categories', 'POST', '197.239.6.149', '{\"has_parent\":\"1\",\"parent\":\"20\",\"name\":\"White Boards\",\"description\":\"Buy and sell all kinds of White Boards in Uganda\",\"slug\":null,\"attributes\":{\"new_1\":{\"name\":\"size\",\"type\":\"number\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-19 14:31:16', '2022-01-19 14:31:16'),
(394, 1, 'admin/categories', 'GET', '197.239.6.149', '[]', '2022-01-19 14:31:17', '2022-01-19 14:31:17'),
(395, 1, 'admin/users', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:38:37', '2022-01-19 14:38:37'),
(396, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"12\",\"_model\":\"App_Models_User\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:39:10', '2022-01-19 14:39:10'),
(397, 1, 'admin/users', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:39:11', '2022-01-19 14:39:11'),
(398, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"13\",\"_model\":\"App_Models_User\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:39:17', '2022-01-19 14:39:17'),
(399, 1, 'admin/users', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:39:18', '2022-01-19 14:39:18'),
(400, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"14\",\"_model\":\"App_Models_User\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:39:23', '2022-01-19 14:39:23'),
(401, 1, 'admin/users', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:39:24', '2022-01-19 14:39:24'),
(402, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"15\",\"_model\":\"App_Models_User\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:39:32', '2022-01-19 14:39:32'),
(403, 1, 'admin/users', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:39:33', '2022-01-19 14:39:33'),
(404, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"16\",\"_model\":\"App_Models_User\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:39:39', '2022-01-19 14:39:39'),
(405, 1, 'admin/users', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:39:39', '2022-01-19 14:39:39'),
(406, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"17\",\"_model\":\"App_Models_User\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:39:44', '2022-01-19 14:39:44'),
(407, 1, 'admin/users', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:39:44', '2022-01-19 14:39:44'),
(408, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"19\",\"_model\":\"App_Models_User\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:39:51', '2022-01-19 14:39:51'),
(409, 1, 'admin/users', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:39:51', '2022-01-19 14:39:51'),
(410, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"20\",\"_model\":\"App_Models_User\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:39:57', '2022-01-19 14:39:57'),
(411, 1, 'admin/users', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:39:58', '2022-01-19 14:39:58'),
(412, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"21\",\"_model\":\"App_Models_User\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:40:02', '2022-01-19 14:40:02'),
(413, 1, 'admin/users', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:40:03', '2022-01-19 14:40:03'),
(414, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"22\",\"_model\":\"App_Models_User\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:40:09', '2022-01-19 14:40:09'),
(415, 1, 'admin/users', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:40:10', '2022-01-19 14:40:10'),
(416, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"23\",\"_model\":\"App_Models_User\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:40:14', '2022-01-19 14:40:14'),
(417, 1, 'admin/users', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:40:15', '2022-01-19 14:40:15'),
(418, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"24\",\"_model\":\"App_Models_User\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:40:23', '2022-01-19 14:40:23'),
(419, 1, 'admin/users', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:40:23', '2022-01-19 14:40:23'),
(420, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"25\",\"_model\":\"App_Models_User\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:40:30', '2022-01-19 14:40:30'),
(421, 1, 'admin/users', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:40:30', '2022-01-19 14:40:30'),
(422, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"26\",\"_model\":\"App_Models_User\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:40:35', '2022-01-19 14:40:35'),
(423, 1, 'admin/users', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:40:36', '2022-01-19 14:40:36'),
(424, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"27\",\"_model\":\"App_Models_User\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:40:40', '2022-01-19 14:40:40'),
(425, 1, 'admin/users', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:40:40', '2022-01-19 14:40:40'),
(426, 1, 'admin/profiles', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:42:28', '2022-01-19 14:42:28'),
(427, 1, 'admin/profiles', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:42:29', '2022-01-19 14:42:29'),
(428, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"28\",\"_model\":\"App_Models_Profile\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:42:55', '2022-01-19 14:42:55'),
(429, 1, 'admin/profiles', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:42:56', '2022-01-19 14:42:56'),
(430, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"29\",\"_model\":\"App_Models_Profile\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:43:04', '2022-01-19 14:43:04'),
(431, 1, 'admin/profiles', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:43:04', '2022-01-19 14:43:04'),
(432, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"11\",\"_model\":\"App_Models_Profile\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:43:22', '2022-01-19 14:43:22'),
(433, 1, 'admin/profiles', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:43:23', '2022-01-19 14:43:23'),
(434, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"14\",\"_model\":\"App_Models_Profile\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:43:33', '2022-01-19 14:43:33'),
(435, 1, 'admin/profiles', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:43:34', '2022-01-19 14:43:34'),
(436, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"12\",\"_model\":\"App_Models_Profile\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:43:45', '2022-01-19 14:43:45'),
(437, 1, 'admin/profiles', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:43:45', '2022-01-19 14:43:45'),
(438, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"15\",\"_model\":\"App_Models_Profile\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:43:52', '2022-01-19 14:43:52'),
(439, 1, 'admin/profiles', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:43:52', '2022-01-19 14:43:52'),
(440, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"16\",\"_model\":\"App_Models_Profile\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:43:57', '2022-01-19 14:43:57'),
(441, 1, 'admin/profiles', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:43:58', '2022-01-19 14:43:58'),
(442, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"17\",\"_model\":\"App_Models_Profile\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:44:04', '2022-01-19 14:44:04'),
(443, 1, 'admin/profiles', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:44:04', '2022-01-19 14:44:04'),
(444, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"18\",\"_model\":\"App_Models_Profile\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:44:10', '2022-01-19 14:44:10'),
(445, 1, 'admin/profiles', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:44:11', '2022-01-19 14:44:11'),
(446, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"19\",\"_model\":\"App_Models_Profile\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:44:16', '2022-01-19 14:44:16'),
(447, 1, 'admin/profiles', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:44:16', '2022-01-19 14:44:16'),
(448, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"20\",\"_model\":\"App_Models_Profile\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:44:22', '2022-01-19 14:44:22'),
(449, 1, 'admin/profiles', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:44:23', '2022-01-19 14:44:23'),
(450, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"21\",\"_model\":\"App_Models_Profile\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:44:29', '2022-01-19 14:44:29'),
(451, 1, 'admin/profiles', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:44:29', '2022-01-19 14:44:29'),
(452, 1, 'admin/_handle_action_', 'POST', '197.239.6.149', '{\"_key\":\"22\",\"_model\":\"App_Models_Profile\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-01-19 14:44:39', '2022-01-19 14:44:39'),
(453, 1, 'admin/profiles', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:44:39', '2022-01-19 14:44:39'),
(454, 1, 'admin/products', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:44:45', '2022-01-19 14:44:45'),
(455, 1, 'admin/products/3,4,8,10,11,14', 'DELETE', '197.239.6.149', '{\"_method\":\"delete\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\"}', '2022-01-19 14:45:29', '2022-01-19 14:45:29'),
(456, 1, 'admin/products', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:45:30', '2022-01-19 14:45:30'),
(457, 1, 'admin/products/5,9,13,20,21', 'DELETE', '197.239.6.149', '{\"_method\":\"delete\",\"_token\":\"mwbuYia8iRdOxkxLKQaihiySeOPUoXJPXKhmFLgO\"}', '2022-01-19 14:46:29', '2022-01-19 14:46:29'),
(458, 1, 'admin/products', 'GET', '197.239.6.149', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:46:29', '2022-01-19 14:46:29'),
(459, 1, 'admin', 'GET', '51.195.218.222', '[]', '2022-01-19 15:10:34', '2022-01-19 15:10:34'),
(460, 1, 'admin', 'GET', '51.195.218.222', '[]', '2022-01-19 15:14:53', '2022-01-19 15:14:53'),
(461, 1, 'admin/categories', 'GET', '51.195.218.222', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 15:15:09', '2022-01-19 15:15:09'),
(462, 1, 'admin/categories/create', 'GET', '51.195.218.222', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 15:15:22', '2022-01-19 15:15:22'),
(463, 1, 'admin/categories', 'POST', '51.195.218.222', '{\"has_parent\":\"1\",\"parent\":\"1\",\"name\":\"Company seals\",\"description\":\"Buy and sell all kinds of ... in Uganda\",\"slug\":null,\"_token\":\"JQ8TRPcG0J0dV5vELtUfS67PeINP1dvUwoJRgqcl\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-19 15:16:32', '2022-01-19 15:16:32'),
(464, 1, 'admin/categories', 'GET', '51.195.218.222', '[]', '2022-01-19 15:16:33', '2022-01-19 15:16:33'),
(465, 1, 'admin/categories/create', 'GET', '51.195.218.222', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 15:16:41', '2022-01-19 15:16:41'),
(466, 1, 'admin/categories', 'POST', '51.195.218.222', '{\"has_parent\":\"1\",\"parent\":\"1\",\"name\":\"Company stamps\",\"description\":\"Buy and sell all kinds of ... in Uganda\",\"slug\":null,\"_token\":\"JQ8TRPcG0J0dV5vELtUfS67PeINP1dvUwoJRgqcl\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-19 15:17:34', '2022-01-19 15:17:34'),
(467, 1, 'admin/categories', 'GET', '51.195.218.222', '[]', '2022-01-19 15:17:35', '2022-01-19 15:17:35'),
(468, 1, 'admin/categories/create', 'GET', '51.195.218.222', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 15:17:45', '2022-01-19 15:17:45'),
(469, 1, 'admin/categories', 'POST', '51.195.218.222', '{\"has_parent\":\"1\",\"parent\":\"1\",\"name\":\"Name tags\",\"description\":\"Buy and sell all kinds of ... in Uganda\",\"slug\":null,\"_token\":\"JQ8TRPcG0J0dV5vELtUfS67PeINP1dvUwoJRgqcl\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-19 15:18:34', '2022-01-19 15:18:34'),
(470, 1, 'admin/categories', 'GET', '51.195.218.222', '[]', '2022-01-19 15:18:35', '2022-01-19 15:18:35'),
(471, 1, 'admin/categories/create', 'GET', '51.195.218.222', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 15:18:40', '2022-01-19 15:18:40'),
(472, 1, 'admin/categories/create', 'GET', '51.195.218.222', '[]', '2022-01-19 15:23:28', '2022-01-19 15:23:28'),
(473, 1, 'admin/categories', 'GET', '51.158.182.52', '{\"_pjax\":\"#pjax-container\"}', '2022-01-20 06:37:25', '2022-01-20 06:37:25'),
(474, 1, 'admin/categories/create', 'GET', '51.158.182.52', '{\"_pjax\":\"#pjax-container\"}', '2022-01-20 06:37:30', '2022-01-20 06:37:30'),
(475, 1, 'admin/categories', 'POST', '51.158.182.52', '{\"has_parent\":\"0\",\"name\":\"Printers\",\"description\":\"Buy and sell all kinds of .Printers.. in Uganda\",\"slug\":null,\"_token\":\"GCL2YfMUXXJU3A68ZuwHRkXDLj27PTCBJslgbQu6\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-20 06:38:01', '2022-01-20 06:38:01'),
(476, 1, 'admin/categories', 'GET', '51.158.182.52', '[]', '2022-01-20 06:38:02', '2022-01-20 06:38:02'),
(477, 1, 'admin/products', 'GET', '102.86.16.27', '[]', '2022-01-20 14:30:20', '2022-01-20 14:30:20'),
(478, 1, 'admin/categories', 'GET', '102.86.16.27', '{\"_pjax\":\"#pjax-container\"}', '2022-01-20 14:31:31', '2022-01-20 14:31:31'),
(479, 1, 'admin/categories', 'GET', '197.239.6.151', '[]', '2022-01-20 16:53:29', '2022-01-20 16:53:29'),
(480, 1, 'admin/users', 'GET', '197.239.6.151', '[]', '2022-01-20 16:54:14', '2022-01-20 16:54:14'),
(481, 1, 'admin/users', 'GET', '154.227.224.138', '[]', '2022-01-20 22:29:58', '2022-01-20 22:29:58'),
(482, 1, 'admin/categories', 'GET', '154.227.224.138', '[]', '2022-01-20 22:30:57', '2022-01-20 22:30:57'),
(483, 1, 'admin', 'GET', '154.227.224.138', '{\"_pjax\":\"#pjax-container\"}', '2022-01-20 22:31:00', '2022-01-20 22:31:00'),
(484, 1, 'admin', 'GET', '102.87.123.168', '[]', '2022-01-24 00:23:18', '2022-01-24 00:23:18'),
(485, 1, 'admin/categories', 'GET', '102.87.123.168', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 00:23:31', '2022-01-24 00:23:31'),
(486, 1, 'admin/categories/create', 'GET', '102.87.123.168', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 00:23:39', '2022-01-24 00:23:39'),
(487, 1, 'admin/categories', 'POST', '102.87.123.168', '{\"has_parent\":\"0\",\"name\":\"Other Services\",\"description\":\"Buy and sell all kinds of ... in Uganda\",\"slug\":null,\"_token\":\"wCNUEXFgZ3J1HLYoswasWZxThmNH7l7u30SK2Cht\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-24 00:24:02', '2022-01-24 00:24:02'),
(488, 1, 'admin/categories', 'GET', '102.87.123.168', '[]', '2022-01-24 00:24:02', '2022-01-24 00:24:02'),
(489, 1, 'admin/categories/create', 'GET', '102.87.123.168', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 00:24:48', '2022-01-24 00:24:48'),
(490, 1, 'admin/categories', 'POST', '102.87.123.168', '{\"has_parent\":\"0\",\"name\":\"Jobs\",\"description\":\"Buy and sell all kinds of ... in Uganda\",\"slug\":null,\"_token\":\"wCNUEXFgZ3J1HLYoswasWZxThmNH7l7u30SK2Cht\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-24 00:25:22', '2022-01-24 00:25:22'),
(491, 1, 'admin/categories', 'GET', '102.87.123.168', '[]', '2022-01-24 00:25:23', '2022-01-24 00:25:23'),
(492, 1, 'admin/categories/create', 'GET', '102.87.123.168', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 00:25:35', '2022-01-24 00:25:35'),
(493, 1, 'admin/categories', 'POST', '102.87.123.168', '{\"has_parent\":\"0\",\"name\":\"Application\\/CV\",\"description\":\"Buy and sell all kinds of ... in Uganda\",\"slug\":null,\"_token\":\"wCNUEXFgZ3J1HLYoswasWZxThmNH7l7u30SK2Cht\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-24 00:26:15', '2022-01-24 00:26:15'),
(494, 1, 'admin/categories', 'GET', '102.87.123.168', '[]', '2022-01-24 00:26:16', '2022-01-24 00:26:16'),
(495, 1, 'admin', 'GET', '102.87.123.168', '[]', '2022-01-24 00:27:39', '2022-01-24 00:27:39'),
(496, 1, 'admin/countries', 'GET', '102.87.123.168', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 00:27:48', '2022-01-24 00:27:48'),
(497, 1, 'admin', 'GET', '102.87.123.168', '[]', '2022-01-24 00:27:49', '2022-01-24 00:27:49'),
(498, 1, 'admin/cities', 'GET', '102.87.123.168', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 00:27:52', '2022-01-24 00:27:52'),
(499, 1, 'admin', 'GET', '102.87.123.168', '[]', '2022-01-24 00:27:53', '2022-01-24 00:27:53'),
(500, 1, 'admin', 'GET', '168.119.172.86', '[]', '2022-01-24 01:19:41', '2022-01-24 01:19:41'),
(501, 1, 'admin', 'GET', '41.75.188.163', '[]', '2022-01-24 15:33:38', '2022-01-24 15:33:38'),
(502, 1, 'admin/categories', 'GET', '41.75.188.163', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 15:33:49', '2022-01-24 15:33:49'),
(503, 1, 'admin/categories/1/edit', 'GET', '41.75.188.163', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 15:34:27', '2022-01-24 15:34:27'),
(504, 1, 'admin/categories/1', 'PUT', '41.75.188.163', '{\"has_parent\":\"0\",\"name\":\"Branding\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"slug\":\"branding\",\"_token\":\"EW15Xezcbz6scuIxbfJrW1QOFKxxNH44CQagZ3Li\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-24 15:34:54', '2022-01-24 15:34:54'),
(505, 1, 'admin/categories/1/edit', 'GET', '41.75.188.163', '[]', '2022-01-24 15:34:55', '2022-01-24 15:34:55'),
(506, 1, 'admin/categories/1/edit', 'GET', '41.75.188.163', '[]', '2022-01-24 15:46:15', '2022-01-24 15:46:15'),
(507, 1, 'admin/categories/1', 'PUT', '41.75.188.163', '{\"has_parent\":\"0\",\"name\":\"Branding\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"slug\":\"branding\",\"_token\":\"EW15Xezcbz6scuIxbfJrW1QOFKxxNH44CQagZ3Li\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2022-01-24 15:46:58', '2022-01-24 15:46:58'),
(508, 1, 'admin/categories/1/edit', 'GET', '41.75.188.163', '[]', '2022-01-24 15:46:58', '2022-01-24 15:46:58'),
(509, 1, 'admin/categories/1', 'PUT', '41.75.188.163', '{\"has_parent\":\"0\",\"name\":\"Branding\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"slug\":\"branding\",\"_token\":\"EW15Xezcbz6scuIxbfJrW1QOFKxxNH44CQagZ3Li\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2022-01-24 15:49:09', '2022-01-24 15:49:09'),
(510, 1, 'admin/categories/1/edit', 'GET', '41.75.188.163', '[]', '2022-01-24 15:49:10', '2022-01-24 15:49:10'),
(511, 1, 'admin/categories/1/edit', 'GET', '41.75.188.163', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 15:51:41', '2022-01-24 15:51:41'),
(512, 1, 'admin/categories/1/edit', 'GET', '41.75.188.163', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 15:52:08', '2022-01-24 15:52:08'),
(513, 1, 'admin', 'GET', '51.158.182.52', '[]', '2022-01-27 00:44:04', '2022-01-27 00:44:04'),
(514, 1, 'admin/users', 'GET', '51.158.182.52', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 00:44:17', '2022-01-27 00:44:17'),
(515, 1, 'admin/categories', 'GET', '51.158.182.52', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 00:44:40', '2022-01-27 00:44:40'),
(516, 1, 'admin/categories/create', 'GET', '51.158.182.52', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 00:44:49', '2022-01-27 00:44:49'),
(517, 1, 'admin/categories', 'POST', '51.158.182.52', '{\"has_parent\":\"1\",\"parent\":\"27\",\"name\":\"Plotting\",\"description\":\"Buy and sell all kinds of ... in Uganda\",\"slug\":null,\"_token\":\"XwtIybMMK69Q5ngK1n0SSbWRW0NcUc9ppm5FGyjA\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-27 00:45:09', '2022-01-27 00:45:09'),
(518, 1, 'admin/categories', 'GET', '51.158.182.52', '[]', '2022-01-27 00:45:10', '2022-01-27 00:45:10'),
(519, 1, 'admin/categories/create', 'GET', '51.158.182.52', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 00:45:22', '2022-01-27 00:45:22'),
(520, 1, 'admin/categories', 'POST', '51.158.182.52', '{\"has_parent\":\"1\",\"parent\":\"27\",\"name\":\"Banners installation\",\"description\":\"Buy and sell all kinds of ... in Uganda\",\"slug\":null,\"_token\":\"XwtIybMMK69Q5ngK1n0SSbWRW0NcUc9ppm5FGyjA\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-27 00:45:45', '2022-01-27 00:45:45'),
(521, 1, 'admin/categories', 'GET', '51.158.182.52', '[]', '2022-01-27 00:45:45', '2022-01-27 00:45:45'),
(522, 1, 'admin', 'GET', '41.75.189.155', '[]', '2022-01-27 03:59:33', '2022-01-27 03:59:33'),
(523, 1, 'admin/users', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 03:59:44', '2022-01-27 03:59:44'),
(524, 1, 'admin/users', 'GET', '41.75.189.155', '[]', '2022-01-27 04:06:29', '2022-01-27 04:06:29'),
(525, 1, 'admin/users', 'GET', '41.75.189.155', '[]', '2022-01-27 04:06:35', '2022-01-27 04:06:35'),
(526, 1, 'admin/countries', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 04:07:07', '2022-01-27 04:07:07'),
(527, 1, 'admin/users', 'GET', '41.75.189.155', '[]', '2022-01-27 04:07:08', '2022-01-27 04:07:08'),
(528, 1, 'admin/users', 'GET', '41.75.189.155', '[]', '2022-01-27 04:07:20', '2022-01-27 04:07:20'),
(529, 1, 'admin/auth/menu', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 04:07:24', '2022-01-27 04:07:24'),
(530, 1, 'admin/auth/menu/12/edit', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 04:07:35', '2022-01-27 04:07:35'),
(531, 1, 'admin/auth/roles', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 04:13:42', '2022-01-27 04:13:42'),
(532, 1, 'admin/auth/menu', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 04:13:44', '2022-01-27 04:13:44'),
(533, 1, 'admin/auth/menu/12/edit', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 04:13:53', '2022-01-27 04:13:53'),
(534, 1, 'admin/auth/menu/12', 'PUT', '41.75.189.155', '{\"parent_id\":\"11\",\"title\":\"Cities \\/ Division\",\"icon\":\"fa-building\",\"uri\":\"countries\",\"roles\":[null],\"permission\":null,\"_token\":\"nLo4PMLnRFbBl29kHxNo8jOdeIigWAUf1YIqg1AB\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/auth\\/menu\"}', '2022-01-27 04:15:35', '2022-01-27 04:15:35'),
(535, 1, 'admin/auth/menu', 'GET', '41.75.189.155', '[]', '2022-01-27 04:15:35', '2022-01-27 04:15:35'),
(536, 1, 'admin/auth/menu/13/edit', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 04:15:39', '2022-01-27 04:15:39');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(537, 1, 'admin/auth/menu/13', 'PUT', '41.75.189.155', '{\"parent_id\":\"11\",\"title\":\"Areas\",\"icon\":\"fa-building\",\"uri\":\"cities\",\"roles\":[null],\"permission\":null,\"_token\":\"nLo4PMLnRFbBl29kHxNo8jOdeIigWAUf1YIqg1AB\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/auth\\/menu\"}', '2022-01-27 04:16:22', '2022-01-27 04:16:22'),
(538, 1, 'admin/auth/menu', 'GET', '41.75.189.155', '[]', '2022-01-27 04:16:22', '2022-01-27 04:16:22'),
(539, 1, 'admin/auth/menu', 'GET', '41.75.189.155', '[]', '2022-01-27 04:16:39', '2022-01-27 04:16:39'),
(540, 1, 'admin/auth/menu', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 04:16:50', '2022-01-27 04:16:50'),
(541, 1, 'admin/auth/menu/8/edit', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 04:16:53', '2022-01-27 04:16:53'),
(542, 1, 'admin/auth/menu/8', 'PUT', '41.75.189.155', '{\"parent_id\":\"0\",\"title\":\"categories\",\"icon\":\"fa-map-marker\",\"uri\":\"categories\",\"roles\":[null],\"permission\":null,\"_token\":\"nLo4PMLnRFbBl29kHxNo8jOdeIigWAUf1YIqg1AB\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/auth\\/menu\"}', '2022-01-27 04:17:10', '2022-01-27 04:17:10'),
(543, 1, 'admin/auth/menu', 'GET', '41.75.189.155', '[]', '2022-01-27 04:17:10', '2022-01-27 04:17:10'),
(544, 1, 'admin/auth/menu', 'GET', '41.75.189.155', '[]', '2022-01-27 04:17:26', '2022-01-27 04:17:26'),
(545, 1, 'admin/auth/menu/11/edit', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 04:17:39', '2022-01-27 04:17:39'),
(546, 1, 'admin/auth/menu/11', 'PUT', '41.75.189.155', '{\"parent_id\":\"0\",\"title\":\"Location\",\"icon\":\"fa-location-arrow\",\"uri\":\"countries\",\"roles\":[null],\"permission\":null,\"_token\":\"nLo4PMLnRFbBl29kHxNo8jOdeIigWAUf1YIqg1AB\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/auth\\/menu\"}', '2022-01-27 04:17:48', '2022-01-27 04:17:48'),
(547, 1, 'admin/auth/menu', 'GET', '41.75.189.155', '[]', '2022-01-27 04:17:48', '2022-01-27 04:17:48'),
(548, 1, 'admin/countries', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 04:19:14', '2022-01-27 04:19:14'),
(549, 1, 'admin/auth/menu', 'GET', '41.75.189.155', '[]', '2022-01-27 04:19:15', '2022-01-27 04:19:15'),
(550, 1, 'admin/countries', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 04:20:51', '2022-01-27 04:20:51'),
(551, 1, 'admin/auth/menu', 'GET', '41.75.189.155', '[]', '2022-01-27 04:20:51', '2022-01-27 04:20:51'),
(552, 1, 'admin/cities', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 04:20:54', '2022-01-27 04:20:54'),
(553, 1, 'admin/auth/menu', 'GET', '41.75.189.155', '[]', '2022-01-27 04:20:54', '2022-01-27 04:20:54'),
(554, 1, 'admin/users', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 04:21:07', '2022-01-27 04:21:07'),
(555, 1, 'admin/profiles', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 04:21:10', '2022-01-27 04:21:10'),
(556, 1, 'admin/countries', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 04:22:00', '2022-01-27 04:22:00'),
(557, 1, 'admin/profiles', 'GET', '41.75.189.155', '[]', '2022-01-27 04:22:00', '2022-01-27 04:22:00'),
(558, 1, 'admin/countries', 'GET', '41.75.189.155', '[]', '2022-01-27 04:22:02', '2022-01-27 04:22:02'),
(559, 1, 'admin/countries', 'GET', '41.75.189.155', '[]', '2022-01-27 04:26:23', '2022-01-27 04:26:23'),
(560, 1, 'admin/countries', 'GET', '41.75.189.155', '[]', '2022-01-27 04:27:49', '2022-01-27 04:27:49'),
(561, 1, 'admin/countries', 'GET', '41.75.189.155', '[]', '2022-01-27 04:42:25', '2022-01-27 04:42:25'),
(562, 1, 'admin/countries', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 05:05:28', '2022-01-27 05:05:28'),
(563, 1, 'admin/countries/1/edit', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 05:05:37', '2022-01-27 05:05:37'),
(564, 1, 'admin/countries/1', 'PUT', '41.75.189.155', '{\"name\":\"Kampala\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Kampala uganda\",\"code\":\"256\",\"listed\":\"1\",\"_token\":\"nLo4PMLnRFbBl29kHxNo8jOdeIigWAUf1YIqg1AB\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/countries\"}', '2022-01-27 05:06:30', '2022-01-27 05:06:30'),
(565, 1, 'admin/countries', 'GET', '41.75.189.155', '[]', '2022-01-27 05:06:30', '2022-01-27 05:06:30'),
(566, 1, 'admin/countries/2/edit', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 05:06:36', '2022-01-27 05:06:36'),
(567, 1, 'admin/countries', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 05:07:27', '2022-01-27 05:07:27'),
(568, 1, 'admin/countries/2/edit', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 05:07:33', '2022-01-27 05:07:33'),
(569, 1, 'admin/countries/2', 'PUT', '41.75.189.155', '{\"name\":\"Wakiso\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Wakiso uganda\",\"code\":\"+90\",\"listed\":\"1\",\"_token\":\"nLo4PMLnRFbBl29kHxNo8jOdeIigWAUf1YIqg1AB\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/countries\"}', '2022-01-27 05:08:12', '2022-01-27 05:08:12'),
(570, 1, 'admin/countries', 'GET', '41.75.189.155', '[]', '2022-01-27 05:08:12', '2022-01-27 05:08:12'),
(571, 1, 'admin/countries/3/edit', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 05:08:21', '2022-01-27 05:08:21'),
(572, 1, 'admin/countries/3', 'PUT', '41.75.189.155', '{\"name\":\"Mukono\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Mukono uganda\",\"code\":\"256\",\"listed\":\"1\",\"_token\":\"nLo4PMLnRFbBl29kHxNo8jOdeIigWAUf1YIqg1AB\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/countries\"}', '2022-01-27 05:08:40', '2022-01-27 05:08:40'),
(573, 1, 'admin/countries', 'GET', '41.75.189.155', '[]', '2022-01-27 05:08:41', '2022-01-27 05:08:41'),
(574, 1, 'admin/countries/4/edit', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 05:08:49', '2022-01-27 05:08:49'),
(575, 1, 'admin/countries/4', 'PUT', '41.75.189.155', '{\"name\":\"Estern uganda\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Estern uganda\",\"code\":\"441188\",\"listed\":\"1\",\"_token\":\"nLo4PMLnRFbBl29kHxNo8jOdeIigWAUf1YIqg1AB\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/countries\"}', '2022-01-27 05:09:57', '2022-01-27 05:09:57'),
(576, 1, 'admin/countries', 'GET', '41.75.189.155', '[]', '2022-01-27 05:09:57', '2022-01-27 05:09:57'),
(577, 1, 'admin/countries', 'GET', '41.75.189.155', '[]', '2022-01-27 05:11:10', '2022-01-27 05:11:10'),
(578, 1, 'admin/cities', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 05:36:08', '2022-01-27 05:36:08'),
(579, 1, 'admin/countries', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 05:36:12', '2022-01-27 05:36:12'),
(580, 1, 'admin/countries/2/edit', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 05:36:18', '2022-01-27 05:36:18'),
(581, 1, 'admin/countries/2', 'PUT', '41.75.189.155', '{\"name\":\"Wakiso\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Wakiso uganda\",\"image\":\"images\\/Flag_of_Turkey.svg.png\",\"code\":\"+90\",\"listed\":\"1\",\"cities\":{\"5\":{\"name\":\"Busukuma\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"image\":\"city-istanbul.jpg\",\"listed\":\"1\",\"id\":\"5\",\"_remove_\":\"0\"},\"new_1\":{\"name\":\"Gombe\",\"longitude\":\"0.0\",\"latitude\":\"0.0\",\"details\":null,\"image\":null,\"listed\":\"1\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"name\":\"Kasanje\",\"longitude\":\"0.0\",\"latitude\":\"0.0\",\"details\":null,\"image\":null,\"listed\":\"1\",\"id\":null,\"_remove_\":\"0\"},\"new_3\":{\"name\":\"Kira Town\",\"longitude\":\"0.0\",\"latitude\":\"0.0\",\"details\":null,\"image\":null,\"listed\":\"1\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"nLo4PMLnRFbBl29kHxNo8jOdeIigWAUf1YIqg1AB\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/countries\"}', '2022-01-27 05:38:07', '2022-01-27 05:38:07'),
(582, 1, 'admin/countries', 'GET', '41.75.189.155', '[]', '2022-01-27 05:38:07', '2022-01-27 05:38:07'),
(583, 1, 'admin/countries/3/edit', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 05:38:21', '2022-01-27 05:38:21'),
(584, 1, 'admin/countries/3', 'PUT', '41.75.189.155', '{\"name\":\"Mukono\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Mukono uganda\",\"image\":\"images\\/city-quanzhou.jpg\",\"code\":\"256\",\"listed\":\"1\",\"cities\":{\"7\":{\"name\":\"Kayunga\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Uganda is a landlocked country in East Africa whose diverse landscape encompasses the snow-capped Rwenzori Mountains and immense Lake Victoria. Its abundant wildlife includes chimpanzees as well as rare birds. Remote Bwindi Impenetrable National Park is a renowned mountain gorilla sanctuary. Murchison Falls National Park in the northwest is known for its 43m-tall waterfall and wildlife such as hippos.\",\"image\":\"city-quanzhou.jpg\",\"listed\":\"1\",\"id\":\"7\",\"_remove_\":\"0\"},\"new_1\":{\"name\":\"Luwero\",\"longitude\":\"0.0\",\"latitude\":\"0.0\",\"details\":null,\"image\":null,\"listed\":\"1\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"nLo4PMLnRFbBl29kHxNo8jOdeIigWAUf1YIqg1AB\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/countries\"}', '2022-01-27 05:39:07', '2022-01-27 05:39:07'),
(585, 1, 'admin/countries', 'GET', '41.75.189.155', '[]', '2022-01-27 05:39:07', '2022-01-27 05:39:07'),
(586, 1, 'admin/countries/3/edit', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 05:39:14', '2022-01-27 05:39:14'),
(587, 1, 'admin/countries', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 05:39:17', '2022-01-27 05:39:17'),
(588, 1, 'admin/countries/4/edit', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 05:39:19', '2022-01-27 05:39:19'),
(589, 1, 'admin/countries/4', 'PUT', '41.75.189.155', '{\"name\":\"Estern uganda\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Estern uganda\",\"image\":\"images\\/city-dubai.jpg\",\"code\":\"441188\",\"listed\":\"1\",\"cities\":{\"3\":{\"name\":\"Amuria\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Uganda is a landlocked country in East Africa whose diverse landscape encompasses the snow-capped Rwenzori Mountains and immense Lake Victoria. Its abundant wildlife includes chimpanzees as well as rare birds. Remote Bwindi Impenetrable National Park is a renowned mountain gorilla sanctuary. Murchison Falls National Park in the northwest is known for its 43m-tall waterfall and wildlife such as hippos.\",\"image\":\"city-dubai.jpg\",\"listed\":\"1\",\"id\":\"3\",\"_remove_\":\"0\"},\"6\":{\"name\":\"Budaka\",\"longitude\":\"16.2212\",\"latitude\":\"18.2222\",\"details\":null,\"image\":\"city-qatar.jpg\",\"listed\":\"1\",\"id\":\"6\",\"_remove_\":\"0\"},\"new_1\":{\"name\":\"Bududa\",\"longitude\":\"0.0\",\"latitude\":\"0.0\",\"details\":null,\"image\":null,\"listed\":\"1\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"name\":\"Bugiri\",\"longitude\":\"0.0\",\"latitude\":\"0.0\",\"details\":null,\"image\":null,\"listed\":\"1\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"nLo4PMLnRFbBl29kHxNo8jOdeIigWAUf1YIqg1AB\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/countries\"}', '2022-01-27 05:39:58', '2022-01-27 05:39:58'),
(590, 1, 'admin/countries', 'GET', '41.75.189.155', '[]', '2022-01-27 05:39:59', '2022-01-27 05:39:59'),
(591, 1, 'admin/cities', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 05:42:01', '2022-01-27 05:42:01'),
(592, 1, 'admin/profiles', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 05:42:05', '2022-01-27 05:42:05'),
(593, 1, 'admin/countries', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 05:53:04', '2022-01-27 05:53:04'),
(594, 1, 'admin/countries/1/edit', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 05:53:27', '2022-01-27 05:53:27'),
(595, 1, 'admin/countries/1', 'PUT', '41.75.189.155', '{\"name\":\"Kampala\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Kampala uganda\",\"image\":null,\"code\":\"256\",\"listed\":\"1\",\"cities\":{\"1\":{\"name\":\"Central division\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"image\":\"d8fd9f28af0cdfa8b8f213d347c4fb78.jpg\",\"listed\":\"1\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"name\":\"Makindye\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"image\":\"city-mbarara.jpg\",\"listed\":\"1\",\"id\":\"2\",\"_remove_\":\"0\"},\"4\":{\"name\":\"Kawempe\",\"longitude\":\"0.0\",\"latitude\":\"0.0\",\"details\":null,\"image\":\"01.jpg\",\"listed\":\"0\",\"id\":\"4\",\"_remove_\":\"0\"}},\"_token\":\"IhXAmyuVJyXPSdM0niomVaURfQHodOfQ3ucUYzWx\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/countries\"}', '2022-01-27 05:53:48', '2022-01-27 05:53:48'),
(596, 1, 'admin/countries', 'GET', '41.75.189.155', '[]', '2022-01-27 05:53:48', '2022-01-27 05:53:48'),
(597, 1, 'admin/countries/2/edit', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 05:53:51', '2022-01-27 05:53:51'),
(598, 1, 'admin/countries', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 05:53:58', '2022-01-27 05:53:58'),
(599, 1, 'admin/countries/4/edit', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 05:54:03', '2022-01-27 05:54:03'),
(600, 1, 'admin/profiles', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 05:54:08', '2022-01-27 05:54:08'),
(601, 1, 'admin/auth/menu', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 05:54:18', '2022-01-27 05:54:18'),
(602, 1, 'admin/auth/menu/16/edit', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 05:54:35', '2022-01-27 05:54:35'),
(603, 1, 'admin/auth/menu/16', 'PUT', '41.75.189.155', '{\"parent_id\":\"0\",\"title\":\"Profiles\",\"icon\":\"fa-users\",\"uri\":\"profiles\",\"roles\":[null],\"permission\":null,\"_token\":\"IhXAmyuVJyXPSdM0niomVaURfQHodOfQ3ucUYzWx\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/auth\\/menu\"}', '2022-01-27 05:54:46', '2022-01-27 05:54:46'),
(604, 1, 'admin/auth/menu', 'GET', '41.75.189.155', '[]', '2022-01-27 05:54:46', '2022-01-27 05:54:46'),
(605, 1, 'admin/auth/menu', 'GET', '41.75.189.155', '[]', '2022-01-27 05:54:49', '2022-01-27 05:54:49'),
(606, 1, 'admin/auth/menu/16/edit', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 05:54:54', '2022-01-27 05:54:54'),
(607, 1, 'admin/auth/menu/16', 'PUT', '41.75.189.155', '{\"parent_id\":\"0\",\"title\":\"Shop Profiles\",\"icon\":\"fa-users\",\"uri\":\"profiles\",\"roles\":[null],\"permission\":null,\"_token\":\"IhXAmyuVJyXPSdM0niomVaURfQHodOfQ3ucUYzWx\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/auth\\/menu\"}', '2022-01-27 05:55:01', '2022-01-27 05:55:01'),
(608, 1, 'admin/auth/menu', 'GET', '41.75.189.155', '[]', '2022-01-27 05:55:01', '2022-01-27 05:55:01'),
(609, 1, 'admin/auth/menu', 'GET', '41.75.189.155', '[]', '2022-01-27 05:55:04', '2022-01-27 05:55:04'),
(610, 1, 'admin/profiles', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 05:55:07', '2022-01-27 05:55:07'),
(611, 1, 'admin', 'GET', '41.75.189.155', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 05:56:00', '2022-01-27 05:56:00'),
(612, 1, 'admin', 'GET', '197.239.4.26', '[]', '2022-01-29 08:00:48', '2022-01-29 08:00:48'),
(613, 1, 'admin/countries', 'GET', '197.239.4.26', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 08:01:09', '2022-01-29 08:01:09'),
(614, 1, 'admin/cities', 'GET', '197.239.4.26', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 08:01:17', '2022-01-29 08:01:17'),
(615, 1, 'admin/cities/create', 'GET', '197.239.4.26', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 08:01:29', '2022-01-29 08:01:29'),
(616, 1, 'admin/categories', 'GET', '197.239.4.26', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 08:01:42', '2022-01-29 08:01:42'),
(617, 1, 'admin/products', 'GET', '197.239.4.26', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 08:02:20', '2022-01-29 08:02:20'),
(618, 1, 'admin/users', 'GET', '197.239.4.26', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 08:02:27', '2022-01-29 08:02:27'),
(619, 1, 'admin/users/33', 'GET', '197.239.4.26', '[]', '2022-01-29 08:04:00', '2022-01-29 08:04:00'),
(620, 1, 'admin', 'GET', '154.229.222.204', '[]', '2022-01-29 22:54:32', '2022-01-29 22:54:32'),
(621, 1, 'admin/users', 'GET', '154.229.222.204', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 22:54:48', '2022-01-29 22:54:48'),
(622, 1, 'admin/products', 'GET', '154.229.222.204', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 22:54:53', '2022-01-29 22:54:53'),
(623, 1, 'admin/products/22/edit', 'GET', '154.229.222.204', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 22:55:10', '2022-01-29 22:55:10'),
(624, 1, 'admin/products/22', 'DELETE', '154.229.222.204', '{\"_method\":\"delete\",\"_token\":\"9A0lPSdoK7p8nJTlddxfGr6We5kilbGzgrNpnXNz\"}', '2022-01-29 22:55:14', '2022-01-29 22:55:14'),
(625, 1, 'admin/products', 'GET', '154.229.222.204', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 22:55:15', '2022-01-29 22:55:15'),
(626, 1, 'admin/products', 'GET', '197.239.7.35', '[]', '2022-01-30 05:48:41', '2022-01-30 05:48:41'),
(627, 1, 'admin/attributes', 'GET', '197.239.7.35', '{\"_pjax\":\"#pjax-container\"}', '2022-01-30 05:48:58', '2022-01-30 05:48:58'),
(628, 1, 'admin/attributes', 'GET', '51.195.218.222', '[]', '2022-01-30 10:00:39', '2022-01-30 10:00:39'),
(629, 1, 'admin', 'GET', '197.239.7.35', '[]', '2022-01-30 12:22:02', '2022-01-30 12:22:02'),
(630, 1, 'admin/users', 'GET', '197.239.7.35', '{\"_pjax\":\"#pjax-container\"}', '2022-01-30 12:22:09', '2022-01-30 12:22:09'),
(631, 1, 'admin/users/34', 'GET', '197.239.7.35', '{\"_pjax\":\"#pjax-container\"}', '2022-01-30 12:22:22', '2022-01-30 12:22:22'),
(632, 1, 'admin/users', 'GET', '197.239.7.35', '{\"_pjax\":\"#pjax-container\"}', '2022-01-30 12:22:49', '2022-01-30 12:22:49'),
(633, 1, 'admin/users/33/edit', 'GET', '197.239.7.35', '{\"_pjax\":\"#pjax-container\"}', '2022-01-30 12:23:05', '2022-01-30 12:23:05'),
(634, 1, 'admin/users/33/edit', 'GET', '197.239.7.35', '{\"_pjax\":\"#pjax-container\"}', '2022-01-30 12:23:25', '2022-01-30 12:23:25'),
(635, 1, 'admin/users', 'GET', '197.239.7.35', '{\"_pjax\":\"#pjax-container\"}', '2022-01-30 12:23:27', '2022-01-30 12:23:27'),
(636, 1, 'admin/cities', 'GET', '197.239.7.35', '{\"_pjax\":\"#pjax-container\"}', '2022-01-30 12:28:27', '2022-01-30 12:28:27'),
(637, 1, 'admin/countries', 'GET', '197.239.7.35', '{\"_pjax\":\"#pjax-container\"}', '2022-01-30 12:28:48', '2022-01-30 12:28:48'),
(638, 1, 'admin/auth/roles', 'GET', '197.239.7.35', '{\"_pjax\":\"#pjax-container\"}', '2022-01-30 12:29:04', '2022-01-30 12:29:04'),
(639, 1, 'admin/profiles', 'GET', '197.239.7.35', '{\"_pjax\":\"#pjax-container\"}', '2022-01-30 12:29:10', '2022-01-30 12:29:10'),
(640, 1, 'admin', 'GET', '197.239.7.35', '{\"_pjax\":\"#pjax-container\"}', '2022-01-30 12:29:52', '2022-01-30 12:29:52'),
(641, 1, 'admin/products', 'GET', '197.239.7.35', '{\"_pjax\":\"#pjax-container\"}', '2022-01-30 12:30:08', '2022-01-30 12:30:08'),
(642, 1, 'admin/products', 'GET', '197.239.7.35', '[]', '2022-01-30 13:10:39', '2022-01-30 13:10:39'),
(643, 1, 'admin', 'GET', '41.75.189.160', '[]', '2022-01-31 10:54:38', '2022-01-31 10:54:38'),
(644, 1, 'admin/products', 'GET', '41.75.189.160', '{\"_pjax\":\"#pjax-container\"}', '2022-01-31 10:54:50', '2022-01-31 10:54:50'),
(645, 1, 'admin/categories', 'GET', '41.75.189.160', '{\"_pjax\":\"#pjax-container\"}', '2022-01-31 10:54:54', '2022-01-31 10:54:54'),
(646, 1, 'admin/categories/1/edit', 'GET', '41.75.189.160', '{\"_pjax\":\"#pjax-container\"}', '2022-01-31 10:55:01', '2022-01-31 10:55:01'),
(647, 1, 'admin/categories/1', 'PUT', '41.75.189.160', '{\"has_parent\":\"0\",\"name\":\"Branding\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"slug\":\"branding\",\"_token\":\"JnlkukWR65roeh86mnHdWimv1DVlS2TlH20BQG5v\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-31 10:55:16', '2022-01-31 10:55:16'),
(648, 1, 'admin/categories/1/edit', 'GET', '41.75.189.160', '[]', '2022-01-31 10:55:17', '2022-01-31 10:55:17'),
(649, 1, 'admin/categories/1', 'PUT', '41.75.189.160', '{\"has_parent\":\"0\",\"name\":\"Branding\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"slug\":\"branding\",\"_token\":\"JnlkukWR65roeh86mnHdWimv1DVlS2TlH20BQG5v\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2022-01-31 10:57:47', '2022-01-31 10:57:47'),
(650, 1, 'admin/categories/1/edit', 'GET', '41.75.189.160', '[]', '2022-01-31 10:57:48', '2022-01-31 10:57:48'),
(651, 1, 'admin/categories/1', 'PUT', '41.75.189.160', '{\"has_parent\":\"0\",\"name\":\"Branding\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"slug\":\"branding\",\"_token\":\"JnlkukWR65roeh86mnHdWimv1DVlS2TlH20BQG5v\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2022-01-31 11:00:58', '2022-01-31 11:00:58'),
(652, 1, 'admin/categories/1/edit', 'GET', '41.75.189.160', '[]', '2022-01-31 11:00:59', '2022-01-31 11:00:59'),
(653, 1, 'admin/categories', 'GET', '41.75.189.160', '{\"_pjax\":\"#pjax-container\"}', '2022-01-31 11:01:21', '2022-01-31 11:01:21'),
(654, 1, 'admin/categories/1/edit', 'GET', '41.75.189.160', '{\"_pjax\":\"#pjax-container\"}', '2022-01-31 11:01:27', '2022-01-31 11:01:27'),
(655, 1, 'admin/categories/1', 'PUT', '41.75.189.160', '{\"has_parent\":\"0\",\"name\":\"Branding\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"slug\":\"branding\",\"_token\":\"JnlkukWR65roeh86mnHdWimv1DVlS2TlH20BQG5v\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-31 11:01:46', '2022-01-31 11:01:46'),
(656, 1, 'admin/categories', 'GET', '41.75.189.160', '[]', '2022-01-31 11:01:47', '2022-01-31 11:01:47'),
(657, 1, 'admin/categories/1/edit', 'GET', '41.75.189.160', '{\"_pjax\":\"#pjax-container\"}', '2022-01-31 11:01:56', '2022-01-31 11:01:56'),
(658, 1, 'admin/categories', 'GET', '41.75.189.160', '{\"_pjax\":\"#pjax-container\"}', '2022-01-31 11:01:59', '2022-01-31 11:01:59'),
(659, 1, 'admin', 'GET', '41.75.189.160', '[]', '2022-01-31 11:02:15', '2022-01-31 11:02:15'),
(660, 1, 'admin/categories', 'GET', '41.75.189.160', '[]', '2022-01-31 11:06:26', '2022-01-31 11:06:26'),
(661, 1, 'admin/categories/1/edit', 'GET', '41.75.189.160', '{\"_pjax\":\"#pjax-container\"}', '2022-01-31 11:06:35', '2022-01-31 11:06:35'),
(662, 1, 'admin/categories', 'GET', '41.75.189.160', '{\"_pjax\":\"#pjax-container\"}', '2022-01-31 11:06:37', '2022-01-31 11:06:37'),
(663, 1, 'admin/categories/2/edit', 'GET', '41.75.189.160', '[]', '2022-01-31 11:06:53', '2022-01-31 11:06:53'),
(664, 1, 'admin/categories/2', 'PUT', '41.75.189.160', '{\"has_parent\":\"0\",\"name\":\"Printing\",\"description\":\"Print\",\"slug\":\"printing\",\"_token\":\"JnlkukWR65roeh86mnHdWimv1DVlS2TlH20BQG5v\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-31 11:07:05', '2022-01-31 11:07:05'),
(665, 1, 'admin/categories', 'GET', '41.75.189.160', '[]', '2022-01-31 11:07:05', '2022-01-31 11:07:05'),
(666, 1, 'admin/categories', 'GET', '41.75.189.160', '[]', '2022-01-31 11:07:47', '2022-01-31 11:07:47'),
(667, 1, 'admin/categories/2/edit', 'GET', '41.75.189.160', '{\"_pjax\":\"#pjax-container\"}', '2022-01-31 11:07:59', '2022-01-31 11:07:59'),
(668, 1, 'admin/categories/2', 'PUT', '41.75.189.160', '{\"has_parent\":\"0\",\"name\":\"Printing\",\"description\":\"Print\",\"slug\":\"printing\",\"_token\":\"JnlkukWR65roeh86mnHdWimv1DVlS2TlH20BQG5v\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-31 11:09:02', '2022-01-31 11:09:02'),
(669, 1, 'admin/categories', 'GET', '41.75.189.160', '[]', '2022-01-31 11:09:03', '2022-01-31 11:09:03'),
(670, 1, 'admin/categories/1/edit', 'GET', '41.75.189.160', '{\"_pjax\":\"#pjax-container\"}', '2022-01-31 11:09:16', '2022-01-31 11:09:16'),
(671, 1, 'admin/categories/1', 'PUT', '41.75.189.160', '{\"has_parent\":\"0\",\"name\":\"Branding\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"slug\":\"branding\",\"_token\":\"JnlkukWR65roeh86mnHdWimv1DVlS2TlH20BQG5v\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-31 11:09:34', '2022-01-31 11:09:34'),
(672, 1, 'admin/categories', 'GET', '41.75.189.160', '[]', '2022-01-31 11:09:34', '2022-01-31 11:09:34'),
(673, 1, 'admin/categories/3/edit', 'GET', '41.75.189.160', '{\"_pjax\":\"#pjax-container\"}', '2022-01-31 11:09:39', '2022-01-31 11:09:39'),
(674, 1, 'admin/categories/3', 'PUT', '41.75.189.160', '{\"has_parent\":\"0\",\"name\":\"Graphics Designing\",\"description\":\"Make graphical designs\",\"slug\":\"graphics-designing\",\"_token\":\"JnlkukWR65roeh86mnHdWimv1DVlS2TlH20BQG5v\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-31 11:10:01', '2022-01-31 11:10:01'),
(675, 1, 'admin/categories', 'GET', '41.75.189.160', '[]', '2022-01-31 11:10:01', '2022-01-31 11:10:01'),
(676, 1, 'admin/categories/4/edit', 'GET', '41.75.189.160', '{\"_pjax\":\"#pjax-container\"}', '2022-01-31 11:11:34', '2022-01-31 11:11:34'),
(677, 1, 'admin/categories/4', 'PUT', '41.75.189.160', '{\"has_parent\":\"0\",\"name\":\"Company Logos\",\"description\":\"Company Logos Details\",\"slug\":\"company-logos\",\"attributes\":{\"7\":{\"name\":\"Negotiable\",\"type\":\"checkbox\",\"options\":[null],\"units\":null,\"is_required\":\"0\",\"id\":\"7\",\"_remove_\":\"0\"}},\"_token\":\"JnlkukWR65roeh86mnHdWimv1DVlS2TlH20BQG5v\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-01-31 11:11:50', '2022-01-31 11:11:50'),
(678, 1, 'admin/categories', 'GET', '41.75.189.160', '[]', '2022-01-31 11:11:50', '2022-01-31 11:11:50'),
(679, 1, 'admin/categories', 'GET', '41.75.189.160', '{\"_sort\":{\"column\":\"name\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2022-01-31 11:12:06', '2022-01-31 11:12:06'),
(680, 1, 'admin/categories', 'GET', '41.75.189.160', '{\"_sort\":{\"column\":\"parent\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2022-01-31 11:12:23', '2022-01-31 11:12:23'),
(681, 1, 'admin/categories/26/edit', 'GET', '41.75.189.160', '{\"_pjax\":\"#pjax-container\"}', '2022-01-31 11:12:34', '2022-01-31 11:12:34'),
(682, 1, 'admin/categories/26', 'PUT', '41.75.189.160', '{\"has_parent\":\"0\",\"name\":\"Printers\",\"description\":\"Buy and sell all kinds of .Printers.. in Uganda\",\"slug\":\"printers\",\"_token\":\"JnlkukWR65roeh86mnHdWimv1DVlS2TlH20BQG5v\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories?_sort%5Bcolumn%5D=parent&_sort%5Btype%5D=desc\"}', '2022-01-31 11:12:57', '2022-01-31 11:12:57'),
(683, 1, 'admin/categories', 'GET', '41.75.189.160', '{\"_sort\":{\"column\":\"parent\",\"type\":\"desc\"}}', '2022-01-31 11:12:58', '2022-01-31 11:12:58'),
(684, 1, 'admin', 'GET', '154.227.236.186', '[]', '2022-02-01 04:40:23', '2022-02-01 04:40:23'),
(685, 1, 'admin', 'GET', '154.227.236.186', '[]', '2022-02-01 04:40:44', '2022-02-01 04:40:44'),
(686, 1, 'admin/users', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 04:41:07', '2022-02-01 04:41:07'),
(687, 1, 'admin/categories', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 04:43:47', '2022-02-01 04:43:47'),
(688, 1, 'admin/categories/28/edit', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 05:02:19', '2022-02-01 05:02:19'),
(689, 1, 'admin/categories/28/edit', 'GET', '154.227.236.186', '[]', '2022-02-01 05:02:22', '2022-02-01 05:02:22'),
(690, 1, 'admin/categories/28', 'PUT', '154.227.236.186', '{\"has_parent\":\"0\",\"name\":\"Jobs\",\"description\":\"Buy and sell all kinds of ... in Uganda\",\"slug\":\"jobs\",\"_token\":\"cYaZXPrV6dDQTG6vFnsnA2U5WCDj0uqCG8c2R0hN\",\"_method\":\"PUT\"}', '2022-02-01 05:02:52', '2022-02-01 05:02:52'),
(691, 1, 'admin/categories', 'GET', '154.227.236.186', '[]', '2022-02-01 05:02:52', '2022-02-01 05:02:52'),
(692, 1, 'admin/categories/28/edit', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 05:04:35', '2022-02-01 05:04:35'),
(693, 1, 'admin/categories/28', 'PUT', '154.227.236.186', '{\"has_parent\":\"0\",\"name\":\"Jobs\",\"description\":\"Buy and sell all kinds of ... in Uganda\",\"slug\":\"jobs\",\"_token\":\"cYaZXPrV6dDQTG6vFnsnA2U5WCDj0uqCG8c2R0hN\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-02-01 05:04:53', '2022-02-01 05:04:53'),
(694, 1, 'admin/categories', 'GET', '154.227.236.186', '[]', '2022-02-01 05:04:54', '2022-02-01 05:04:54'),
(695, 1, 'admin/_handle_action_', 'POST', '154.227.236.186', '{\"_key\":\"5\",\"_model\":\"App_Models_Category\",\"_token\":\"cYaZXPrV6dDQTG6vFnsnA2U5WCDj0uqCG8c2R0hN\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-02-01 05:08:13', '2022-02-01 05:08:13'),
(696, 1, 'admin/categories', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 05:08:14', '2022-02-01 05:08:14'),
(697, 1, 'admin/_handle_action_', 'POST', '154.227.236.186', '{\"_key\":\"12\",\"_model\":\"App_Models_Category\",\"_token\":\"cYaZXPrV6dDQTG6vFnsnA2U5WCDj0uqCG8c2R0hN\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-02-01 05:08:29', '2022-02-01 05:08:29'),
(698, 1, 'admin/categories', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 05:08:32', '2022-02-01 05:08:32'),
(699, 1, 'admin/categories/29/edit', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 05:18:18', '2022-02-01 05:18:18'),
(700, 1, 'admin/categories/29', 'PUT', '154.227.236.186', '{\"has_parent\":\"0\",\"name\":\"Application\\/CV\",\"description\":\"Buy and sell all kinds of ... in Uganda\",\"slug\":\"applicationcv\",\"_token\":\"cYaZXPrV6dDQTG6vFnsnA2U5WCDj0uqCG8c2R0hN\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-02-01 05:19:52', '2022-02-01 05:19:52'),
(701, 1, 'admin/categories', 'GET', '154.227.236.186', '[]', '2022-02-01 05:19:53', '2022-02-01 05:19:53'),
(702, 1, 'admin/profiles', 'GET', '154.227.236.186', '[]', '2022-02-01 05:24:45', '2022-02-01 05:24:45'),
(703, 1, 'admin/_handle_action_', 'POST', '154.227.236.186', '{\"_key\":\"27\",\"_model\":\"App_Models_Profile\",\"_token\":\"cYaZXPrV6dDQTG6vFnsnA2U5WCDj0uqCG8c2R0hN\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-02-01 05:25:54', '2022-02-01 05:25:54'),
(704, 1, 'admin/profiles', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 05:25:55', '2022-02-01 05:25:55'),
(705, 1, 'admin/_handle_action_', 'POST', '154.227.236.186', '{\"_key\":\"23\",\"_model\":\"App_Models_Profile\",\"_token\":\"cYaZXPrV6dDQTG6vFnsnA2U5WCDj0uqCG8c2R0hN\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-02-01 05:26:11', '2022-02-01 05:26:11'),
(706, 1, 'admin/profiles', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 05:26:11', '2022-02-01 05:26:11'),
(707, 1, 'admin/_handle_action_', 'POST', '154.227.236.186', '{\"_key\":\"33\",\"_model\":\"App_Models_Profile\",\"_token\":\"cYaZXPrV6dDQTG6vFnsnA2U5WCDj0uqCG8c2R0hN\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-02-01 05:26:19', '2022-02-01 05:26:19'),
(708, 1, 'admin/profiles', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 05:26:20', '2022-02-01 05:26:20'),
(709, 1, 'admin/_handle_action_', 'POST', '154.227.236.186', '{\"_key\":\"34\",\"_model\":\"App_Models_Profile\",\"_token\":\"cYaZXPrV6dDQTG6vFnsnA2U5WCDj0uqCG8c2R0hN\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-02-01 05:26:51', '2022-02-01 05:26:51'),
(710, 1, 'admin/profiles', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 05:26:52', '2022-02-01 05:26:52'),
(711, 1, 'admin/categories', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 05:27:23', '2022-02-01 05:27:23'),
(712, 1, 'admin/categories/27/edit', 'GET', '154.227.236.186', '[]', '2022-02-01 05:39:26', '2022-02-01 05:39:26'),
(713, 1, 'admin', 'GET', '154.227.236.186', '[]', '2022-02-01 05:48:06', '2022-02-01 05:48:06'),
(714, 1, 'admin/users', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 05:48:11', '2022-02-01 05:48:11'),
(715, 1, 'admin/_handle_action_', 'POST', '154.227.236.186', '{\"_key\":\"28\",\"_model\":\"App_Models_User\",\"_token\":\"cYaZXPrV6dDQTG6vFnsnA2U5WCDj0uqCG8c2R0hN\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-02-01 05:48:19', '2022-02-01 05:48:19'),
(716, 1, 'admin/users', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 05:48:21', '2022-02-01 05:48:21'),
(717, 1, 'admin/_handle_action_', 'POST', '154.227.236.186', '{\"_key\":\"29\",\"_model\":\"App_Models_User\",\"_token\":\"cYaZXPrV6dDQTG6vFnsnA2U5WCDj0uqCG8c2R0hN\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-02-01 05:48:33', '2022-02-01 05:48:33'),
(718, 1, 'admin/users', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 05:48:33', '2022-02-01 05:48:33'),
(719, 1, 'admin/_handle_action_', 'POST', '154.227.236.186', '{\"_key\":\"34\",\"_model\":\"App_Models_User\",\"_token\":\"cYaZXPrV6dDQTG6vFnsnA2U5WCDj0uqCG8c2R0hN\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-02-01 05:49:40', '2022-02-01 05:49:40'),
(720, 1, 'admin/users', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 05:49:41', '2022-02-01 05:49:41'),
(721, 1, 'admin/users', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 05:50:06', '2022-02-01 05:50:06'),
(722, 1, 'admin/profiles', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 05:50:09', '2022-02-01 05:50:09'),
(723, 1, 'admin/products', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 05:50:24', '2022-02-01 05:50:24'),
(724, 1, 'admin/categories', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 05:50:41', '2022-02-01 05:50:41'),
(725, 1, 'admin/_handle_action_', 'POST', '154.227.236.186', '{\"_key\":\"27\",\"_model\":\"App_Models_Category\",\"_token\":\"cYaZXPrV6dDQTG6vFnsnA2U5WCDj0uqCG8c2R0hN\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-02-01 05:51:05', '2022-02-01 05:51:05'),
(726, 1, 'admin/categories', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 05:51:06', '2022-02-01 05:51:06'),
(727, 1, 'admin/products', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 05:54:06', '2022-02-01 05:54:06'),
(728, 1, 'admin/products', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 05:54:06', '2022-02-01 05:54:06'),
(729, 1, 'admin/products', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 05:54:08', '2022-02-01 05:54:08'),
(730, 1, 'admin/_handle_action_', 'POST', '154.227.236.186', '{\"_key\":\"18\",\"_model\":\"App_Models_Product\",\"_token\":\"cYaZXPrV6dDQTG6vFnsnA2U5WCDj0uqCG8c2R0hN\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-02-01 05:54:17', '2022-02-01 05:54:17'),
(731, 1, 'admin/products', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 05:54:17', '2022-02-01 05:54:17'),
(732, 1, 'admin/_handle_action_', 'POST', '154.227.236.186', '{\"_key\":\"19\",\"_model\":\"App_Models_Product\",\"_token\":\"cYaZXPrV6dDQTG6vFnsnA2U5WCDj0uqCG8c2R0hN\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-02-01 05:54:23', '2022-02-01 05:54:23'),
(733, 1, 'admin/products', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 05:54:24', '2022-02-01 05:54:24'),
(734, 1, 'admin/_handle_action_', 'POST', '154.227.236.186', '{\"_key\":\"23\",\"_model\":\"App_Models_Product\",\"_token\":\"cYaZXPrV6dDQTG6vFnsnA2U5WCDj0uqCG8c2R0hN\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-02-01 05:54:30', '2022-02-01 05:54:30'),
(735, 1, 'admin/products', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 05:54:31', '2022-02-01 05:54:31'),
(736, 1, 'admin/_handle_action_', 'POST', '154.227.236.186', '{\"_key\":\"24\",\"_model\":\"App_Models_Product\",\"_token\":\"cYaZXPrV6dDQTG6vFnsnA2U5WCDj0uqCG8c2R0hN\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-02-01 05:54:37', '2022-02-01 05:54:37'),
(737, 1, 'admin/products', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 05:54:38', '2022-02-01 05:54:38'),
(738, 1, 'admin/categories', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 05:58:03', '2022-02-01 05:58:03'),
(739, 1, 'admin/categories/create', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 05:58:22', '2022-02-01 05:58:22'),
(740, 1, 'admin/categories', 'POST', '154.227.236.186', '{\"has_parent\":\"0\",\"name\":\"Other Services\",\"description\":\"Buy and sell all kinds of ... in Uganda\",\"slug\":null,\"_token\":\"cYaZXPrV6dDQTG6vFnsnA2U5WCDj0uqCG8c2R0hN\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-02-01 05:58:59', '2022-02-01 05:58:59'),
(741, 1, 'admin/categories', 'GET', '154.227.236.186', '[]', '2022-02-01 05:58:59', '2022-02-01 05:58:59'),
(742, 1, 'admin/categories', 'GET', '154.227.236.186', '[]', '2022-02-01 06:00:02', '2022-02-01 06:00:02'),
(743, 1, 'admin/categories/31/edit', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 06:00:42', '2022-02-01 06:00:42'),
(744, 1, 'admin/categories/31', 'PUT', '154.227.236.186', '{\"has_parent\":\"1\",\"parent\":\"32\",\"name\":\"Banners installation\",\"description\":\"Buy and sell all kinds of ... in Uganda\",\"slug\":\"banners-installation\",\"_token\":\"cYaZXPrV6dDQTG6vFnsnA2U5WCDj0uqCG8c2R0hN\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-02-01 06:00:52', '2022-02-01 06:00:52'),
(745, 1, 'admin/categories', 'GET', '154.227.236.186', '[]', '2022-02-01 06:00:53', '2022-02-01 06:00:53'),
(746, 1, 'admin/categories/30/edit', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 06:01:16', '2022-02-01 06:01:16'),
(747, 1, 'admin/categories/30', 'PUT', '154.227.236.186', '{\"has_parent\":\"1\",\"parent\":\"32\",\"name\":\"Plotting\",\"description\":\"Buy and sell all kinds of ... in Uganda\",\"slug\":\"plotting\",\"_token\":\"cYaZXPrV6dDQTG6vFnsnA2U5WCDj0uqCG8c2R0hN\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-02-01 06:01:25', '2022-02-01 06:01:25'),
(748, 1, 'admin/categories', 'GET', '154.227.236.186', '[]', '2022-02-01 06:01:26', '2022-02-01 06:01:26'),
(749, 1, 'admin/categories', 'GET', '154.227.236.186', '[]', '2022-02-01 06:50:08', '2022-02-01 06:50:08'),
(750, 1, 'admin/categories/26/edit', 'GET', '154.227.236.186', '{\"_pjax\":\"#pjax-container\"}', '2022-02-01 07:37:22', '2022-02-01 07:37:22'),
(751, 1, 'admin', 'GET', '102.82.180.123', '[]', '2022-02-02 14:21:59', '2022-02-02 14:21:59'),
(752, 1, 'admin/users', 'GET', '102.82.180.123', '{\"_pjax\":\"#pjax-container\"}', '2022-02-02 14:22:18', '2022-02-02 14:22:18'),
(753, 1, 'admin/categories', 'GET', '102.82.180.123', '{\"_pjax\":\"#pjax-container\"}', '2022-02-02 14:24:41', '2022-02-02 14:24:41'),
(754, 1, 'admin/categories/create', 'GET', '102.82.180.123', '[]', '2022-02-02 14:25:22', '2022-02-02 14:25:22'),
(755, 1, 'admin/categories', 'POST', '102.82.180.123', '{\"has_parent\":\"1\",\"parent\":\"1\",\"name\":\"Shirts branding\",\"description\":\"Buy and sell all kinds of shirts branding in Uganda\",\"slug\":null,\"_token\":\"BoJLd6UuDaxCk7RkcZiVynIyEPMWxcSkJffWoTzT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-02-02 14:26:24', '2022-02-02 14:26:24'),
(756, 1, 'admin/categories', 'GET', '102.82.180.123', '[]', '2022-02-02 14:26:25', '2022-02-02 14:26:25'),
(757, 1, 'admin/categories/create', 'GET', '102.82.180.123', '{\"_pjax\":\"#pjax-container\"}', '2022-02-02 14:27:39', '2022-02-02 14:27:39'),
(758, 1, 'admin/categories', 'POST', '102.82.180.123', '{\"has_parent\":\"1\",\"parent\":\"1\",\"name\":\"Promotional items\",\"description\":\"Buy and sell all kinds of ... in Uganda\",\"slug\":null,\"_token\":\"BoJLd6UuDaxCk7RkcZiVynIyEPMWxcSkJffWoTzT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-02-02 14:28:03', '2022-02-02 14:28:03'),
(759, 1, 'admin/categories', 'GET', '102.82.180.123', '[]', '2022-02-02 14:28:04', '2022-02-02 14:28:04'),
(760, 1, 'admin/categories/create', 'GET', '102.82.180.123', '{\"_pjax\":\"#pjax-container\"}', '2022-02-02 14:28:16', '2022-02-02 14:28:16'),
(761, 1, 'admin/categories', 'POST', '102.82.180.123', '{\"has_parent\":\"1\",\"parent\":\"2\",\"name\":\"UV printing\",\"description\":\"Buy and sell all kinds of ... in Uganda\",\"slug\":null,\"_token\":\"BoJLd6UuDaxCk7RkcZiVynIyEPMWxcSkJffWoTzT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-02-02 14:28:44', '2022-02-02 14:28:44'),
(762, 1, 'admin/categories', 'GET', '102.82.180.123', '[]', '2022-02-02 14:28:45', '2022-02-02 14:28:45'),
(763, 1, 'admin/categories/create', 'GET', '102.82.180.123', '{\"_pjax\":\"#pjax-container\"}', '2022-02-02 14:28:48', '2022-02-02 14:28:48'),
(764, 1, 'admin/categories', 'POST', '102.82.180.123', '{\"has_parent\":\"1\",\"parent\":\"2\",\"name\":\"Digital printingv\",\"description\":\"Buy and sell all kinds of ... in Uganda\",\"slug\":null,\"_token\":\"BoJLd6UuDaxCk7RkcZiVynIyEPMWxcSkJffWoTzT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-02-02 14:29:09', '2022-02-02 14:29:09'),
(765, 1, 'admin/categories', 'GET', '102.82.180.123', '[]', '2022-02-02 14:29:10', '2022-02-02 14:29:10'),
(766, 1, 'admin/categories/create', 'GET', '102.82.180.123', '{\"_pjax\":\"#pjax-container\"}', '2022-02-02 14:29:13', '2022-02-02 14:29:13'),
(767, 1, 'admin/categories', 'POST', '102.82.180.123', '{\"has_parent\":\"1\",\"parent\":\"1\",\"name\":\"Engraving\",\"description\":\"Buy and sell all kinds of ... in Uganda\",\"slug\":null,\"_token\":\"BoJLd6UuDaxCk7RkcZiVynIyEPMWxcSkJffWoTzT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-02-02 14:29:30', '2022-02-02 14:29:30'),
(768, 1, 'admin/categories', 'GET', '102.82.180.123', '[]', '2022-02-02 14:29:31', '2022-02-02 14:29:31'),
(769, 1, 'admin/categories/create', 'GET', '102.82.180.123', '{\"_pjax\":\"#pjax-container\"}', '2022-02-02 14:29:35', '2022-02-02 14:29:35'),
(770, 1, 'admin/categories', 'POST', '102.82.180.123', '{\"has_parent\":\"1\",\"parent\":\"1\",\"name\":\"Embroidery services\",\"description\":\"Buy and sell all kinds of ... in Uganda\",\"slug\":null,\"_token\":\"BoJLd6UuDaxCk7RkcZiVynIyEPMWxcSkJffWoTzT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-02-02 14:31:04', '2022-02-02 14:31:04'),
(771, 1, 'admin/categories', 'GET', '102.82.180.123', '[]', '2022-02-02 14:31:05', '2022-02-02 14:31:05'),
(772, 1, 'admin/categories', 'GET', '154.224.252.253', '[]', '2022-02-02 23:50:08', '2022-02-02 23:50:08'),
(773, 1, 'admin', 'GET', '154.224.252.253', '{\"_pjax\":\"#pjax-container\"}', '2022-02-02 23:50:28', '2022-02-02 23:50:28'),
(774, 1, 'admin', 'GET', '197.239.4.193', '[]', '2022-02-06 13:24:57', '2022-02-06 13:24:57'),
(775, 1, 'admin/users', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 13:25:04', '2022-02-06 13:25:04'),
(776, 1, 'admin/_handle_action_', 'POST', '197.239.4.193', '{\"_key\":\"30\",\"_model\":\"App_Models_User\",\"_token\":\"b6g0UWv95WZcaczBJIT9sC0YxFkqgEAZIv2vQUvu\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-02-06 13:25:16', '2022-02-06 13:25:16'),
(777, 1, 'admin/users', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 13:25:16', '2022-02-06 13:25:16'),
(778, 1, 'admin/countries', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 13:25:28', '2022-02-06 13:25:28'),
(779, 1, 'admin/cities', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 13:25:34', '2022-02-06 13:25:34'),
(780, 1, 'admin/products', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 13:25:53', '2022-02-06 13:25:53'),
(781, 1, 'admin', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 13:26:01', '2022-02-06 13:26:01'),
(782, 1, 'admin/products', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 13:26:05', '2022-02-06 13:26:05'),
(783, 1, 'admin/profiles', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 13:26:07', '2022-02-06 13:26:07'),
(784, 1, 'admin/_handle_action_', 'POST', '197.239.4.193', '{\"_key\":\"30\",\"_model\":\"App_Models_Profile\",\"_token\":\"b6g0UWv95WZcaczBJIT9sC0YxFkqgEAZIv2vQUvu\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-02-06 13:26:24', '2022-02-06 13:26:24'),
(785, 1, 'admin/profiles', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 13:26:24', '2022-02-06 13:26:24'),
(786, 1, 'admin', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 13:26:48', '2022-02-06 13:26:48'),
(787, 1, 'admin/products', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 13:26:51', '2022-02-06 13:26:51'),
(788, 1, 'admin/categories', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 13:26:57', '2022-02-06 13:26:57'),
(789, 1, 'admin/categories', 'GET', '197.239.4.193', '[]', '2022-02-06 13:40:21', '2022-02-06 13:40:21'),
(790, 1, 'admin/categories', 'GET', '197.239.4.193', '[]', '2022-02-06 13:42:03', '2022-02-06 13:42:03'),
(791, 1, 'admin/users', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 13:42:09', '2022-02-06 13:42:09'),
(792, 1, 'admin/_handle_action_', 'POST', '197.239.4.193', '{\"_key\":\"31\",\"_model\":\"App_Models_User\",\"_token\":\"b6g0UWv95WZcaczBJIT9sC0YxFkqgEAZIv2vQUvu\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-02-06 13:42:16', '2022-02-06 13:42:16'),
(793, 1, 'admin/users', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 13:42:17', '2022-02-06 13:42:17'),
(794, 1, 'admin/_handle_action_', 'POST', '197.239.4.193', '{\"_key\":\"36\",\"_model\":\"App_Models_User\",\"_token\":\"b6g0UWv95WZcaczBJIT9sC0YxFkqgEAZIv2vQUvu\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-02-06 13:43:50', '2022-02-06 13:43:50'),
(795, 1, 'admin/users', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 13:43:50', '2022-02-06 13:43:50'),
(796, 1, 'admin/products', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 13:49:25', '2022-02-06 13:49:25'),
(797, 1, 'admin/users', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 13:49:33', '2022-02-06 13:49:33'),
(798, 1, 'admin/products', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 13:49:37', '2022-02-06 13:49:37'),
(799, 1, 'admin/categories', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 13:49:39', '2022-02-06 13:49:39'),
(800, 1, 'admin/categories/10/edit', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 13:50:07', '2022-02-06 13:50:07'),
(801, 1, 'admin/categories', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 13:50:32', '2022-02-06 13:50:32'),
(802, 1, 'admin/categories', 'GET', '197.239.4.193', '[]', '2022-02-06 13:50:56', '2022-02-06 13:50:56'),
(803, 1, 'admin/_handle_action_', 'POST', '197.239.4.193', '{\"_key\":\"10\",\"_model\":\"App_Models_Category\",\"_token\":\"oeifXP4t04XwSmNapFVIZOpBJjxIwusQfwD6UUeo\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-02-06 13:51:02', '2022-02-06 13:51:02'),
(804, 1, 'admin/categories', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 13:51:03', '2022-02-06 13:51:03'),
(805, 1, 'admin/categories/create', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 13:51:10', '2022-02-06 13:51:10');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(806, 1, 'admin/categories', 'POST', '197.239.4.193', '{\"has_parent\":\"1\",\"parent\":\"2\",\"name\":\"Plastic Identity Card\",\"description\":\"Buy and sell all kinds of Plastic Identity Card in Uganda\",\"slug\":null,\"attributes\":{\"new_1\":{\"name\":\"Type\",\"type\":\"select\",\"options\":[\"Magnetic\",\"Gold\",\"silver\",\"Embossed\",\"White\",\"Chip\",null],\"units\":null,\"is_required\":\"0\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"oeifXP4t04XwSmNapFVIZOpBJjxIwusQfwD6UUeo\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-02-06 13:53:32', '2022-02-06 13:53:32'),
(807, 1, 'admin/categories', 'GET', '197.239.4.193', '[]', '2022-02-06 13:53:33', '2022-02-06 13:53:33'),
(808, 1, 'admin/categories', 'GET', '197.239.4.193', '[]', '2022-02-06 13:53:43', '2022-02-06 13:53:43'),
(809, 1, 'admin/categories', 'GET', '197.239.4.193', '[]', '2022-02-06 13:53:58', '2022-02-06 13:53:58'),
(810, 1, 'admin/categories', 'GET', '197.239.4.193', '[]', '2022-02-06 13:54:56', '2022-02-06 13:54:56'),
(811, 1, 'admin/categories', 'GET', '197.239.4.193', '[]', '2022-02-06 13:55:01', '2022-02-06 13:55:01'),
(812, 1, 'admin/categories/create', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 13:55:13', '2022-02-06 13:55:13'),
(813, 1, 'admin/categories', 'POST', '197.239.4.193', '{\"has_parent\":\"1\",\"parent\":\"2\",\"name\":\"Plastic Identity Card\",\"description\":\"Buy and sell all kinds of Plastic Identity Card in Uganda\",\"slug\":null,\"_token\":\"oeifXP4t04XwSmNapFVIZOpBJjxIwusQfwD6UUeo\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-02-06 13:56:05', '2022-02-06 13:56:05'),
(814, 1, 'admin/categories', 'GET', '197.239.4.193', '[]', '2022-02-06 13:56:05', '2022-02-06 13:56:05'),
(815, 1, 'admin/categories', 'GET', '197.239.4.193', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2022-02-06 13:56:18', '2022-02-06 13:56:18'),
(816, 1, 'admin/_handle_action_', 'POST', '197.239.4.193', '{\"_key\":\"40\",\"_model\":\"App_Models_Category\",\"_token\":\"oeifXP4t04XwSmNapFVIZOpBJjxIwusQfwD6UUeo\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-02-06 13:56:35', '2022-02-06 13:56:35'),
(817, 1, 'admin/categories', 'GET', '197.239.4.193', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2022-02-06 13:56:36', '2022-02-06 13:56:36'),
(818, 1, 'admin/categories/39/edit', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 14:05:01', '2022-02-06 14:05:01'),
(819, 1, 'admin/categories/39', 'PUT', '197.239.4.193', '{\"has_parent\":\"1\",\"parent\":\"2\",\"name\":\"Plastic Identity Card\",\"description\":\"Buy and sell all kinds of Plastic Identity Card in Uganda\",\"slug\":\"plastic-identity-card\",\"attributes\":{\"60\":{\"name\":\"Type\",\"type\":\"select\",\"options\":[\"Magnetic\",\"Gold\",\"silver\",\"Embossed\",\"White\",\"Chip\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"60\",\"_remove_\":\"0\"}},\"_token\":\"oeifXP4t04XwSmNapFVIZOpBJjxIwusQfwD6UUeo\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories?page=2\"}', '2022-02-06 14:05:13', '2022-02-06 14:05:13'),
(820, 1, 'admin/categories', 'GET', '197.239.4.193', '{\"page\":\"2\"}', '2022-02-06 14:05:13', '2022-02-06 14:05:13'),
(821, 1, 'admin/users', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 14:32:24', '2022-02-06 14:32:24'),
(822, 1, 'admin/users', 'GET', '197.239.4.193', '[]', '2022-02-06 14:34:09', '2022-02-06 14:34:09'),
(823, 1, 'admin/users', 'GET', '197.239.4.193', '[]', '2022-02-06 14:38:19', '2022-02-06 14:38:19'),
(824, 1, 'admin/products', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 14:38:31', '2022-02-06 14:38:31'),
(825, 1, 'admin/categories', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 14:38:32', '2022-02-06 14:38:32'),
(826, 1, 'admin/categories/create', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 14:38:40', '2022-02-06 14:38:40'),
(827, 1, 'admin/categories', 'POST', '197.239.4.193', '{\"has_parent\":\"1\",\"parent\":\"1\",\"name\":\"Phone Cases\",\"description\":\"Buy and sell all kinds of Phone Cases in Uganda\",\"slug\":null,\"attributes\":{\"new_1\":{\"name\":\"Phone type\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"PeN2XUDFhipb2jtM8zQC9PT1yh2kCGwXkpVds2da\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-02-06 14:39:45', '2022-02-06 14:39:45'),
(828, 1, 'admin/categories', 'GET', '197.239.4.193', '[]', '2022-02-06 14:39:45', '2022-02-06 14:39:45'),
(829, 1, 'admin/categories/create', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 14:44:26', '2022-02-06 14:44:26'),
(830, 1, 'admin/categories', 'POST', '197.239.4.193', '{\"has_parent\":\"1\",\"parent\":\"1\",\"name\":\"Hoodies\",\"description\":\"Buy and sell all kinds of Hoodies in Uganda\",\"slug\":null,\"_token\":\"PeN2XUDFhipb2jtM8zQC9PT1yh2kCGwXkpVds2da\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-02-06 14:45:01', '2022-02-06 14:45:01'),
(831, 1, 'admin/categories', 'GET', '197.239.4.193', '[]', '2022-02-06 14:45:01', '2022-02-06 14:45:01'),
(832, 1, 'admin/products', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 14:51:57', '2022-02-06 14:51:57'),
(833, 1, 'admin/products', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 14:51:58', '2022-02-06 14:51:58'),
(834, 1, 'admin/products', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 14:51:58', '2022-02-06 14:51:58'),
(835, 1, 'admin/products', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 14:52:21', '2022-02-06 14:52:21'),
(836, 1, 'admin/users', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 14:52:29', '2022-02-06 14:52:29'),
(837, 1, 'admin/users', 'GET', '197.239.4.193', '[]', '2022-02-06 14:54:00', '2022-02-06 14:54:00'),
(838, 1, 'admin/users', 'GET', '197.239.4.193', '[]', '2022-02-06 14:55:11', '2022-02-06 14:55:11'),
(839, 1, 'admin/categories', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 14:55:58', '2022-02-06 14:55:58'),
(840, 1, 'admin/categories', 'GET', '197.239.4.193', '[]', '2022-02-06 15:01:45', '2022-02-06 15:01:45'),
(841, 1, 'admin', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 15:01:47', '2022-02-06 15:01:47'),
(842, 1, 'admin/users', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 15:01:54', '2022-02-06 15:01:54'),
(843, 1, 'admin/users', 'GET', '197.239.4.193', '[]', '2022-02-06 15:02:54', '2022-02-06 15:02:54'),
(844, 1, 'admin/products', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 15:05:17', '2022-02-06 15:05:17'),
(845, 1, 'admin/categories', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 15:05:19', '2022-02-06 15:05:19'),
(846, 1, 'admin/attributes', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 15:05:22', '2022-02-06 15:05:22'),
(847, 1, 'admin/categories', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 15:05:58', '2022-02-06 15:05:58'),
(848, 1, 'admin/categories/create', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 15:06:02', '2022-02-06 15:06:02'),
(849, 1, 'admin/categories', 'POST', '197.239.4.193', '{\"has_parent\":\"1\",\"parent\":\"3\",\"name\":\"Corporate Designing\",\"description\":\"Buy and sell all kinds of Corporate Designing in Uganda\",\"slug\":null,\"_token\":\"PeN2XUDFhipb2jtM8zQC9PT1yh2kCGwXkpVds2da\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-02-06 15:06:35', '2022-02-06 15:06:35'),
(850, 1, 'admin/categories', 'GET', '197.239.4.193', '[]', '2022-02-06 15:06:36', '2022-02-06 15:06:36'),
(851, 1, 'admin/categories/create', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 15:10:13', '2022-02-06 15:10:13'),
(852, 1, 'admin/categories', 'POST', '197.239.4.193', '{\"has_parent\":\"1\",\"parent\":\"1\",\"name\":\"Capes\",\"description\":\"Buy and sell all kinds of Capes in Uganda\",\"slug\":null,\"_token\":\"PeN2XUDFhipb2jtM8zQC9PT1yh2kCGwXkpVds2da\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-02-06 15:10:31', '2022-02-06 15:10:31'),
(853, 1, 'admin/categories', 'GET', '197.239.4.193', '[]', '2022-02-06 15:10:32', '2022-02-06 15:10:32'),
(854, 1, 'admin/categories', 'GET', '197.239.4.193', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2022-02-06 15:11:29', '2022-02-06 15:11:29'),
(855, 1, 'admin/categories/44/edit', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 15:11:34', '2022-02-06 15:11:34'),
(856, 1, 'admin/categories/44', 'PUT', '197.239.4.193', '{\"has_parent\":\"1\",\"parent\":\"1\",\"name\":\"Caps\",\"description\":\"Buy and sell all kinds of Capes in Uganda\",\"slug\":\"capes\",\"_token\":\"PeN2XUDFhipb2jtM8zQC9PT1yh2kCGwXkpVds2da\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories?page=2\"}', '2022-02-06 15:11:44', '2022-02-06 15:11:44'),
(857, 1, 'admin/categories', 'GET', '197.239.4.193', '{\"page\":\"2\"}', '2022-02-06 15:11:44', '2022-02-06 15:11:44'),
(858, 1, 'admin/users', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 15:16:06', '2022-02-06 15:16:06'),
(859, 1, 'admin/users', 'GET', '197.239.4.193', '[]', '2022-02-06 15:16:11', '2022-02-06 15:16:11'),
(860, 1, 'admin/_handle_action_', 'POST', '197.239.4.193', '{\"_key\":\"35\",\"_model\":\"App_Models_User\",\"_token\":\"PeN2XUDFhipb2jtM8zQC9PT1yh2kCGwXkpVds2da\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-02-06 15:16:28', '2022-02-06 15:16:28'),
(861, 1, 'admin/users', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 15:16:28', '2022-02-06 15:16:28'),
(862, 1, 'admin/products', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 15:24:59', '2022-02-06 15:24:59'),
(863, 1, 'admin/categories', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 15:25:01', '2022-02-06 15:25:01'),
(864, 1, 'admin/categories/create', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 15:25:03', '2022-02-06 15:25:03'),
(865, 1, 'admin/categories', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 15:26:25', '2022-02-06 15:26:25'),
(866, 1, 'admin/users', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 15:29:22', '2022-02-06 15:29:22'),
(867, 1, 'admin/users', 'GET', '197.239.4.193', '[]', '2022-02-06 15:29:25', '2022-02-06 15:29:25'),
(868, 1, 'admin/users', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 15:44:35', '2022-02-06 15:44:35'),
(869, 1, 'admin/users', 'GET', '197.239.4.193', '[]', '2022-02-06 15:44:38', '2022-02-06 15:44:38'),
(870, 1, 'admin/users', 'GET', '197.239.4.193', '[]', '2022-02-06 15:48:19', '2022-02-06 15:48:19'),
(871, 1, 'admin/users', 'GET', '197.239.4.193', '[]', '2022-02-06 16:06:22', '2022-02-06 16:06:22'),
(872, 1, 'admin/users', 'GET', '197.239.4.193', '[]', '2022-02-06 16:13:38', '2022-02-06 16:13:38'),
(873, 1, 'admin/users', 'GET', '197.239.4.193', '[]', '2022-02-06 16:15:38', '2022-02-06 16:15:38'),
(874, 1, 'admin/users', 'GET', '197.239.4.193', '[]', '2022-02-06 16:33:13', '2022-02-06 16:33:13'),
(875, 1, 'admin/users', 'GET', '197.239.4.193', '[]', '2022-02-06 16:40:56', '2022-02-06 16:40:56'),
(876, 1, 'admin/categories', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 16:41:16', '2022-02-06 16:41:16'),
(877, 1, 'admin/categories/create', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 16:41:20', '2022-02-06 16:41:20'),
(878, 1, 'admin/categories', 'POST', '197.239.4.193', '{\"has_parent\":\"1\",\"parent\":\"1\",\"name\":\"Digitizing\",\"description\":\"Buy and sell all kinds of ... in Uganda\",\"slug\":null,\"_token\":\"PeN2XUDFhipb2jtM8zQC9PT1yh2kCGwXkpVds2da\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-02-06 16:41:50', '2022-02-06 16:41:50'),
(879, 1, 'admin/categories', 'GET', '197.239.4.193', '[]', '2022-02-06 16:41:51', '2022-02-06 16:41:51'),
(880, 1, 'admin/categories/create', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 16:41:54', '2022-02-06 16:41:54'),
(881, 1, 'admin/categories', 'POST', '197.239.4.193', '{\"has_parent\":\"1\",\"parent\":\"1\",\"name\":\"Tear Drops\",\"description\":\"Buy and sell all kinds of Tear Drops in Uganda\",\"slug\":null,\"attributes\":{\"new_1\":{\"name\":\"size\",\"type\":\"radio\",\"options\":[\"Medium\",\"Large\",\"Small\",null],\"units\":null,\"is_required\":\"0\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"PeN2XUDFhipb2jtM8zQC9PT1yh2kCGwXkpVds2da\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-02-06 16:43:37', '2022-02-06 16:43:37'),
(882, 1, 'admin/categories', 'GET', '197.239.4.193', '[]', '2022-02-06 16:43:38', '2022-02-06 16:43:38'),
(883, 1, 'admin/categories/create', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 16:43:45', '2022-02-06 16:43:45'),
(884, 1, 'admin/categories', 'POST', '197.239.4.193', '{\"has_parent\":\"1\",\"parent\":\"1\",\"name\":\"Epoxy Servies\",\"description\":\"Buy and sell all kinds of Epoxy Servies in Uganda\",\"slug\":null,\"_token\":\"PeN2XUDFhipb2jtM8zQC9PT1yh2kCGwXkpVds2da\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-02-06 16:44:15', '2022-02-06 16:44:15'),
(885, 1, 'admin/categories', 'GET', '197.239.4.193', '[]', '2022-02-06 16:44:16', '2022-02-06 16:44:16'),
(886, 1, 'admin/categories/create', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 16:44:19', '2022-02-06 16:44:19'),
(887, 1, 'admin/categories', 'POST', '197.239.4.193', '{\"has_parent\":\"1\",\"parent\":\"1\",\"name\":\"Customized Sublimation Cups\",\"description\":\"Buy and sell all kinds of Customized Sublimation Cups in Uganda\",\"slug\":null,\"attributes\":{\"new_1\":{\"name\":\"Color\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"0\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"PeN2XUDFhipb2jtM8zQC9PT1yh2kCGwXkpVds2da\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-02-06 16:45:29', '2022-02-06 16:45:29'),
(888, 1, 'admin/categories', 'GET', '197.239.4.193', '[]', '2022-02-06 16:45:29', '2022-02-06 16:45:29'),
(889, 1, 'admin/categories/create', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 16:45:46', '2022-02-06 16:45:46'),
(890, 1, 'admin/categories', 'POST', '197.239.4.193', '{\"has_parent\":\"0\",\"name\":\"Crystal Accolades\",\"description\":\"Buy and sell all kinds of Crystal Accolades in Uganda\",\"slug\":null,\"_token\":\"PeN2XUDFhipb2jtM8zQC9PT1yh2kCGwXkpVds2da\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-02-06 16:46:26', '2022-02-06 16:46:26'),
(891, 1, 'admin/categories', 'GET', '197.239.4.193', '[]', '2022-02-06 16:46:27', '2022-02-06 16:46:27'),
(892, 1, 'admin/categories/create', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 16:46:33', '2022-02-06 16:46:33'),
(893, 1, 'admin/categories', 'POST', '197.239.4.193', '{\"has_parent\":\"1\",\"parent\":\"1\",\"name\":\"Bamboo Awords\",\"description\":\"Buy and sell all kinds of Bamboo Awards in Uganda\",\"slug\":null,\"_token\":\"PeN2XUDFhipb2jtM8zQC9PT1yh2kCGwXkpVds2da\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-02-06 16:47:11', '2022-02-06 16:47:11'),
(894, 1, 'admin/categories', 'GET', '197.239.4.193', '[]', '2022-02-06 16:47:11', '2022-02-06 16:47:11'),
(895, 1, 'admin/categories/create', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 16:47:17', '2022-02-06 16:47:17'),
(896, 1, 'admin/categories', 'POST', '197.239.4.193', '{\"has_parent\":\"1\",\"parent\":\"1\",\"name\":\"Keyholder\",\"description\":\"Buy and sell all kinds of Keyholder in Uganda\",\"slug\":null,\"attributes\":{\"new_1\":{\"name\":\"Material\",\"type\":\"radio\",\"options\":[\"Metalic\",\"Plastic\",null],\"units\":null,\"is_required\":\"0\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"PeN2XUDFhipb2jtM8zQC9PT1yh2kCGwXkpVds2da\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories\"}', '2022-02-06 16:48:12', '2022-02-06 16:48:12'),
(897, 1, 'admin/categories', 'GET', '197.239.4.193', '[]', '2022-02-06 16:48:13', '2022-02-06 16:48:13'),
(898, 1, 'admin/categories', 'GET', '197.239.4.193', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2022-02-06 16:48:25', '2022-02-06 16:48:25'),
(899, 1, 'admin/categories/49/edit', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 16:48:33', '2022-02-06 16:48:33'),
(900, 1, 'admin/categories/49', 'PUT', '197.239.4.193', '{\"has_parent\":\"1\",\"parent\":\"1\",\"name\":\"Crystal Accolades\",\"description\":\"Buy and sell all kinds of Crystal Accolades in Uganda\",\"slug\":\"crystal-accolades\",\"_token\":\"PeN2XUDFhipb2jtM8zQC9PT1yh2kCGwXkpVds2da\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories?page=2\"}', '2022-02-06 16:48:39', '2022-02-06 16:48:39'),
(901, 1, 'admin/categories', 'GET', '197.239.4.193', '{\"page\":\"2\"}', '2022-02-06 16:48:40', '2022-02-06 16:48:40'),
(902, 1, 'admin/categories/create', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 16:49:01', '2022-02-06 16:49:01'),
(903, 1, 'admin/categories', 'POST', '197.239.4.193', '{\"has_parent\":\"1\",\"parent\":\"1\",\"name\":\"Customized Wall Clocks\",\"description\":\"Buy and sell all kinds of Customized Wall Clocks in Uganda\",\"slug\":null,\"_token\":\"PeN2XUDFhipb2jtM8zQC9PT1yh2kCGwXkpVds2da\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories?page=2\"}', '2022-02-06 16:49:50', '2022-02-06 16:49:50'),
(904, 1, 'admin/categories', 'GET', '197.239.4.193', '{\"page\":\"2\"}', '2022-02-06 16:49:51', '2022-02-06 16:49:51'),
(905, 1, 'admin/categories/create', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 16:49:54', '2022-02-06 16:49:54'),
(906, 1, 'admin/categories', 'POST', '197.239.4.193', '{\"has_parent\":\"1\",\"parent\":\"1\",\"name\":\"Engraving Services\",\"description\":\"Buy and sell all kinds of Engraving Services in Uganda\",\"slug\":null,\"_token\":\"PeN2XUDFhipb2jtM8zQC9PT1yh2kCGwXkpVds2da\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories?page=2\"}', '2022-02-06 16:50:58', '2022-02-06 16:50:58'),
(907, 1, 'admin/categories', 'GET', '197.239.4.193', '{\"page\":\"2\"}', '2022-02-06 16:50:59', '2022-02-06 16:50:59'),
(908, 1, 'admin/categories/create', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 16:51:13', '2022-02-06 16:51:13'),
(909, 1, 'admin/categories', 'POST', '197.239.4.193', '{\"has_parent\":\"1\",\"parent\":\"2\",\"name\":\"Stickers\",\"description\":\"Buy and sell all kinds of Stickers in Uganda\",\"slug\":null,\"_token\":\"PeN2XUDFhipb2jtM8zQC9PT1yh2kCGwXkpVds2da\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories?page=2\"}', '2022-02-06 16:51:33', '2022-02-06 16:51:33'),
(910, 1, 'admin/categories', 'GET', '197.239.4.193', '{\"page\":\"2\"}', '2022-02-06 16:51:33', '2022-02-06 16:51:33'),
(911, 1, 'admin/categories/create', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 16:51:40', '2022-02-06 16:51:40'),
(912, 1, 'admin/categories', 'POST', '197.239.4.193', '{\"has_parent\":\"1\",\"parent\":\"1\",\"name\":\"Label pins\",\"description\":\"Buy and sell all kinds of Label pins in Uganda\",\"slug\":null,\"_token\":\"PeN2XUDFhipb2jtM8zQC9PT1yh2kCGwXkpVds2da\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories?page=2\"}', '2022-02-06 16:52:03', '2022-02-06 16:52:03'),
(913, 1, 'admin/categories', 'GET', '197.239.4.193', '{\"page\":\"2\"}', '2022-02-06 16:52:04', '2022-02-06 16:52:04'),
(914, 1, 'admin/categories/create', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 16:52:14', '2022-02-06 16:52:14'),
(915, 1, 'admin/categories', 'POST', '197.239.4.193', '{\"has_parent\":\"1\",\"parent\":\"1\",\"name\":\"Customized gift packs\",\"description\":\"Buy and sell all kinds of Customized gift packs in Uganda\",\"slug\":null,\"_token\":\"PeN2XUDFhipb2jtM8zQC9PT1yh2kCGwXkpVds2da\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories?page=2\"}', '2022-02-06 16:53:01', '2022-02-06 16:53:01'),
(916, 1, 'admin/categories', 'GET', '197.239.4.193', '{\"page\":\"2\"}', '2022-02-06 16:53:01', '2022-02-06 16:53:01'),
(917, 1, 'admin/categories/create', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 16:53:08', '2022-02-06 16:53:08'),
(918, 1, 'admin/categories', 'POST', '197.239.4.193', '{\"has_parent\":\"1\",\"parent\":\"1\",\"name\":\"Branded Keyholders\",\"description\":\"Buy and sell all kinds of ... in Uganda\",\"slug\":null,\"_token\":\"PeN2XUDFhipb2jtM8zQC9PT1yh2kCGwXkpVds2da\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories?page=2\"}', '2022-02-06 16:53:27', '2022-02-06 16:53:27'),
(919, 1, 'admin/categories', 'GET', '197.239.4.193', '{\"page\":\"2\"}', '2022-02-06 16:53:27', '2022-02-06 16:53:27'),
(920, 1, 'admin/categories/create', 'GET', '197.239.4.193', '{\"_pjax\":\"#pjax-container\"}', '2022-02-06 16:54:17', '2022-02-06 16:54:17'),
(921, 1, 'admin/categories', 'POST', '197.239.4.193', '{\"has_parent\":\"1\",\"parent\":\"2\",\"name\":\"Booklets\",\"description\":\"Buy and sell all kinds of Booklets in Uganda\",\"slug\":null,\"_token\":\"PeN2XUDFhipb2jtM8zQC9PT1yh2kCGwXkpVds2da\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/categories?page=2\"}', '2022-02-06 16:54:42', '2022-02-06 16:54:42'),
(922, 1, 'admin/categories', 'GET', '197.239.4.193', '{\"page\":\"2\"}', '2022-02-06 16:54:42', '2022-02-06 16:54:42'),
(923, 1, 'admin/categories', 'GET', '197.239.4.193', '{\"page\":\"3\",\"_pjax\":\"#pjax-container\"}', '2022-02-06 16:55:51', '2022-02-06 16:55:51'),
(924, 1, 'admin', 'GET', '102.82.97.188', '[]', '2022-02-07 00:57:13', '2022-02-07 00:57:13'),
(925, 1, 'admin/users', 'GET', '102.82.97.188', '{\"_pjax\":\"#pjax-container\"}', '2022-02-07 00:57:47', '2022-02-07 00:57:47'),
(926, 1, 'admin/users', 'GET', '102.82.97.188', '[]', '2022-02-07 00:57:52', '2022-02-07 00:57:52'),
(927, 1, 'admin/users', 'GET', '102.82.15.37', '[]', '2022-02-07 03:02:08', '2022-02-07 03:02:08'),
(928, 1, 'admin/users', 'GET', '102.82.15.37', '[]', '2022-02-07 03:02:12', '2022-02-07 03:02:12'),
(929, 1, 'admin', 'GET', '102.82.19.103', '[]', '2022-02-08 13:51:35', '2022-02-08 13:51:35'),
(930, 1, 'admin/users', 'GET', '102.82.19.103', '{\"_pjax\":\"#pjax-container\"}', '2022-02-08 14:02:13', '2022-02-08 14:02:13'),
(931, 1, 'admin/users', 'GET', '102.82.19.103', '[]', '2022-02-08 15:53:21', '2022-02-08 15:53:21'),
(932, 1, 'admin/users', 'GET', '197.239.4.164', '[]', '2022-02-09 12:22:25', '2022-02-09 12:22:25'),
(933, 1, 'admin/users', 'GET', '209.222.97.206', '[]', '2022-02-10 13:11:51', '2022-02-10 13:11:51'),
(934, 1, 'admin', 'GET', '197.239.7.94', '[]', '2022-02-24 08:42:28', '2022-02-24 08:42:28'),
(935, 1, 'admin', 'GET', '102.82.88.59', '[]', '2022-02-25 01:54:45', '2022-02-25 01:54:45'),
(936, 1, 'admin', 'GET', '41.75.188.188', '[]', '2022-02-25 11:32:32', '2022-02-25 11:32:32'),
(937, 1, 'admin/auth/menu', 'GET', '41.75.188.188', '{\"_pjax\":\"#pjax-container\"}', '2022-02-25 11:32:42', '2022-02-25 11:32:42'),
(938, 1, 'admin/auth/menu', 'POST', '41.75.188.188', '{\"parent_id\":\"0\",\"title\":\"Mobile App\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"9POBkXJ6aCXPgTvuew3NeQtV4X1Qz92Z5x1el0Gr\"}', '2022-02-25 11:32:49', '2022-02-25 11:32:49'),
(939, 1, 'admin/auth/menu', 'GET', '41.75.188.188', '[]', '2022-02-25 11:32:49', '2022-02-25 11:32:49'),
(940, 1, 'admin/auth/menu/17/edit', 'GET', '41.75.188.188', '{\"_pjax\":\"#pjax-container\"}', '2022-02-25 11:32:52', '2022-02-25 11:32:52'),
(941, 1, 'admin/auth/menu/17', 'PUT', '41.75.188.188', '{\"parent_id\":\"0\",\"title\":\"Mobile App\",\"icon\":\"fa-mobile-phone\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"9POBkXJ6aCXPgTvuew3NeQtV4X1Qz92Z5x1el0Gr\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/auth\\/menu\"}', '2022-02-25 11:33:04', '2022-02-25 11:33:04'),
(942, 1, 'admin/auth/menu', 'GET', '41.75.188.188', '[]', '2022-02-25 11:33:05', '2022-02-25 11:33:05'),
(943, 1, 'admin/auth/menu', 'POST', '41.75.188.188', '{\"parent_id\":\"0\",\"title\":\"Banners\",\"icon\":\"fa-align-left\",\"uri\":\"banners\",\"roles\":[null],\"permission\":null,\"_token\":\"9POBkXJ6aCXPgTvuew3NeQtV4X1Qz92Z5x1el0Gr\"}', '2022-02-25 11:33:27', '2022-02-25 11:33:27'),
(944, 1, 'admin/auth/menu', 'GET', '41.75.188.188', '[]', '2022-02-25 11:33:27', '2022-02-25 11:33:27'),
(945, 1, 'admin/auth/menu', 'POST', '41.75.188.188', '{\"_token\":\"9POBkXJ6aCXPgTvuew3NeQtV4X1Qz92Z5x1el0Gr\",\"_order\":\"[{\\\"id\\\":17,\\\"children\\\":[{\\\"id\\\":18}]},{\\\"id\\\":16},{\\\"id\\\":1},{\\\"id\\\":15},{\\\"id\\\":14},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":9},{\\\"id\\\":10}]},{\\\"id\\\":11,\\\"children\\\":[{\\\"id\\\":12},{\\\"id\\\":13}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2022-02-25 11:33:34', '2022-02-25 11:33:34'),
(946, 1, 'admin/auth/menu', 'GET', '41.75.188.188', '{\"_pjax\":\"#pjax-container\"}', '2022-02-25 11:33:35', '2022-02-25 11:33:35'),
(947, 1, 'admin/auth/menu', 'GET', '41.75.188.188', '[]', '2022-02-25 11:33:36', '2022-02-25 11:33:36'),
(948, 1, 'admin/auth/menu', 'POST', '41.75.188.188', '{\"_token\":\"9POBkXJ6aCXPgTvuew3NeQtV4X1Qz92Z5x1el0Gr\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":17,\\\"children\\\":[{\\\"id\\\":18}]},{\\\"id\\\":16},{\\\"id\\\":15},{\\\"id\\\":14},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":9},{\\\"id\\\":10}]},{\\\"id\\\":11,\\\"children\\\":[{\\\"id\\\":12},{\\\"id\\\":13}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2022-02-25 11:33:44', '2022-02-25 11:33:44'),
(949, 1, 'admin/auth/menu', 'GET', '41.75.188.188', '{\"_pjax\":\"#pjax-container\"}', '2022-02-25 11:33:45', '2022-02-25 11:33:45'),
(950, 1, 'admin/auth/menu', 'GET', '41.75.188.188', '[]', '2022-02-25 11:33:47', '2022-02-25 11:33:47'),
(951, 1, 'admin/banners', 'GET', '41.75.188.188', '{\"_pjax\":\"#pjax-container\"}', '2022-02-25 11:33:50', '2022-02-25 11:33:50'),
(952, 1, 'admin/banners/1/edit', 'GET', '41.75.188.188', '{\"_pjax\":\"#pjax-container\"}', '2022-02-25 11:33:58', '2022-02-25 11:33:58'),
(953, 1, 'admin', 'GET', '41.75.188.188', '[]', '2022-02-25 11:36:53', '2022-02-25 11:36:53'),
(954, 1, 'admin/banners', 'GET', '41.75.188.188', '{\"_pjax\":\"#pjax-container\"}', '2022-02-25 11:37:03', '2022-02-25 11:37:03'),
(955, 1, 'admin/banners/1/edit', 'GET', '41.75.188.188', '{\"_pjax\":\"#pjax-container\"}', '2022-02-25 11:40:11', '2022-02-25 11:40:11'),
(956, 1, 'admin/banners/1', 'PUT', '41.75.188.188', '{\"section\":\"Section #1\",\"position\":\"1\",\"name\":\"Branding\",\"sub_title\":\"Trending Travel Mug\",\"type\":\"Category\",\"category_id\":\"1\",\"_token\":\"3mkZl8ndPMb0QSQcx1N2ZsniBtz8zzJCncBqMkxi\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/banners\"}', '2022-02-25 11:41:59', '2022-02-25 11:41:59'),
(957, 1, 'admin/banners/1/edit', 'GET', '41.75.188.188', '[]', '2022-02-25 11:42:00', '2022-02-25 11:42:00'),
(958, 1, 'admin', 'GET', '41.75.188.188', '[]', '2022-02-25 14:07:00', '2022-02-25 14:07:00'),
(959, 1, 'admin/profiles', 'GET', '41.75.188.188', '{\"_pjax\":\"#pjax-container\"}', '2022-02-25 14:07:04', '2022-02-25 14:07:04'),
(960, 1, 'admin/banners', 'GET', '41.75.188.188', '{\"_pjax\":\"#pjax-container\"}', '2022-02-25 14:07:09', '2022-02-25 14:07:09'),
(961, 1, 'admin/banners/1/edit', 'GET', '41.75.188.188', '{\"_pjax\":\"#pjax-container\"}', '2022-02-25 14:07:12', '2022-02-25 14:07:12'),
(962, 1, 'admin/banners/1', 'PUT', '41.75.188.188', '{\"section\":\"Section #1\",\"position\":\"1\",\"name\":\"Branding\",\"sub_title\":\"Trending Travel Mug\",\"type\":\"Category\",\"category_id\":\"1\",\"_token\":\"M0gfti1N9HDEe7vhEmunCrNDIOHgJDyJWI35iFQZ\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/goprint.ug\\/admin\\/banners\"}', '2022-02-25 14:08:18', '2022-02-25 14:08:18'),
(963, 1, 'admin/banners', 'GET', '41.75.188.188', '[]', '2022-02-25 14:08:19', '2022-02-25 14:08:19'),
(964, 1, 'admin/banners/1', 'GET', '41.75.188.188', '{\"_pjax\":\"#pjax-container\"}', '2022-02-25 14:08:24', '2022-02-25 14:08:24'),
(965, 1, 'admin/banners', 'GET', '41.75.188.188', '{\"_pjax\":\"#pjax-container\"}', '2022-02-25 14:08:30', '2022-02-25 14:08:30'),
(966, 1, 'admin/banners', 'GET', '41.75.188.188', '{\"_pjax\":\"#pjax-container\",\"_export_\":\"all\"}', '2022-02-25 14:08:33', '2022-02-25 14:08:33'),
(967, 1, 'admin/banners/1/edit', 'GET', '41.75.188.188', '{\"_pjax\":\"#pjax-container\"}', '2022-02-25 14:08:42', '2022-02-25 14:08:42');

-- --------------------------------------------------------

--
-- Table structure for table `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, 'All permission', '*', '', '*', NULL, NULL),
(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Sumayah Swaib', 'administrator', '2021-09-17 18:04:27', '2022-01-17 04:07:42');

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_menu`
--

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_menu`
--

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_users`
--

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_users`
--

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$omiZ3CJUzWf/QGmwiLplGuDz2KT8Tf2fSa22oicpuP9H2kuOi45vS', 'Administrator', 'storage/add.jpg', 'HpBXYDADu5YTWFuyNiIjrzDd7U4N47Qq6Mleq1NNZ4dx1ydyJeygJl3kBhUS', '2021-09-17 18:04:26', '2022-01-17 14:31:58');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_permissions`
--

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_required` tinyint(4) DEFAULT NULL,
  `units` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `created_at`, `updated_at`, `category_id`, `name`, `type`, `options`, `is_required`, `units`) VALUES
(7, '2021-10-08 09:43:11', '2021-10-08 09:45:45', 4, 'Negotiable', 'checkbox', '', 0, NULL),
(8, '2021-10-08 10:08:19', '2022-01-19 14:03:32', 5, 'Poster  type', 'radio', 'face book,Instagram,cover,post,profile', 0, 'single'),
(11, '2021-10-08 10:49:43', '2022-01-19 13:37:13', 8, 'Condition', 'radio', 'Laminated,Not Lamianted', 1, NULL),
(12, '2021-10-08 11:24:12', '2022-01-19 13:37:13', 8, 'paper type', 'select', 'Artboard,Ivory', 0, 'single'),
(21, '2021-10-08 11:32:34', '2021-10-08 11:32:34', 8, 'Negotiable', 'checkbox', '', 0, NULL),
(22, '2021-10-08 11:37:24', '2022-01-19 13:51:06', 9, 'Color', 'text', '', 0, NULL),
(30, '2021-10-08 11:50:18', '2022-01-19 14:09:44', 10, 'Id  type', 'select', 'Plain White,Gold,Silver,Embossed,chip cards,Magnetic Stripped,offwhite', 0, NULL),
(31, '2021-10-08 11:51:24', '2022-01-19 14:09:44', 10, 'Lamination', 'radio', 'laminated,Not Laminated', 0, NULL),
(32, '2021-10-08 11:52:52', '2022-01-19 14:09:44', 10, 'Printer', 'select', 'fargo,Epson', 0, NULL),
(36, '2021-10-08 11:59:10', '2021-10-08 11:59:10', 11, 'Size', 'number', '', 1, 'sqft'),
(37, '2021-10-08 11:59:44', '2022-01-19 14:28:53', 11, 'Address', 'text', '', 0, NULL),
(39, '2021-11-05 20:01:07', '2022-01-19 14:23:27', 12, 'Branding type', 'radio', 'Screen printing,Engraving', 0, NULL),
(41, '2021-11-05 20:06:40', '2022-01-19 14:26:41', 13, 'print Type', 'radio', 'Embroidery,Screen Printing', 0, NULL),
(42, '2021-11-05 20:06:40', '2022-01-19 14:26:41', 13, 'Material', 'text', '', 0, NULL),
(46, '2021-11-05 20:19:17', '2021-11-05 20:19:17', 15, 'Condition', 'radio', 'Used,New', 1, NULL),
(47, '2021-11-05 20:19:17', '2021-11-05 20:19:17', 15, 'Brand', 'select', 'Customized Desktops,Acer Ainol,Apple iMac,Asus Compaq,Daffodil Dell,Fujitsu Gateway,Gigabyte Haier,HP IBM,INSYS Intel,Lenovo Microsoft,Panasonic Samsung,Sony Toshiba,Walton Other', 1, NULL),
(48, '2021-11-05 20:19:17', '2021-11-05 20:19:17', 15, 'RAM SIZE (in GB)', 'number', NULL, 1, 'GB'),
(49, '2021-11-05 20:19:17', '2021-11-05 20:19:17', 15, 'Processor (GHz)', 'number', NULL, 1, NULL),
(50, '2021-11-05 20:21:54', '2021-11-05 20:21:54', 16, 'Condition', 'radio', 'Used,New', 1, NULL),
(51, '2021-11-05 20:21:54', '2021-11-05 20:21:54', 16, 'Brand', 'select', 'Acer Ainol,Amazon Apple,MacBook Asus,Blackberry Compaq,Daffodil Dell,Doel Fujitsu,Gateway Gigabyte,Google Haier,HP HTC,Huawei IBM,INSYS Intel,Lenovo LG,Maximus Maxis,Microsoft Mycell,Panasonic Prolink,Samsung SIHGTECH,Sony Symphony,Toshiba Walton,Xiaomi ZedAir,Other brand', 1, NULL),
(52, '2021-11-05 20:23:55', '2021-11-05 20:23:55', 17, 'Condition', 'radio', 'Used,New', 1, NULL),
(53, '2021-11-05 20:25:04', '2021-11-05 20:25:04', 17, 'Item type', 'select', 'Motherboards Keyboards,Processors Monitors,Hard Drives,Graphics Cards,Software Mouse,Modems &,Routers Printers,& Scanners,RAMs Pendrive,UPS Laptop', 1, NULL),
(54, '2021-11-05 20:28:29', '2021-11-05 20:28:29', 18, 'Brand', 'select', 'Haier JVC,Konka LG,Minister MyOne,National NEC,Nippon Panasonic,Philips Prestige,Rangs R-One,Samsung Sansui,Sharp Singer,Sky Tech,Sky View,Sony TCL,Toshiba Toshin,Transtec Triton,View One,Vision Walton,Other brand', 1, NULL),
(55, '2021-11-05 20:28:29', '2021-11-05 20:28:29', 18, 'Model', 'text', NULL, 1, NULL),
(58, '2022-01-19 14:23:27', '2022-01-19 14:23:27', 12, 'Material', 'select', 'Plastic,Metalic', 0, NULL),
(59, '2022-01-19 14:31:16', '2022-01-19 14:31:16', 22, 'size', 'number', NULL, 1, NULL),
(60, '2022-02-06 13:53:32', '2022-02-06 14:05:13', 39, 'Type', 'select', 'Magnetic,Gold,silver,Embossed,White,Chip', 1, NULL),
(61, '2022-02-06 14:39:45', '2022-02-06 14:39:45', 41, 'Phone type', 'text', NULL, 1, NULL),
(62, '2022-02-06 16:43:37', '2022-02-06 16:43:37', 46, 'size', 'radio', 'Medium,Large,Small', 0, NULL),
(63, '2022-02-06 16:45:29', '2022-02-06 16:45:29', 48, 'Color', 'text', NULL, 0, NULL),
(64, '2022-02-06 16:48:12', '2022-02-06 16:48:12', 51, 'Material', 'radio', 'Metalic,Plastic', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `section` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clicks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `created_at`, `updated_at`, `section`, `position`, `name`, `sub_title`, `type`, `category_id`, `product_id`, `image`, `clicks`) VALUES
(1, '2022-02-25 14:04:35', '2022-02-25 14:08:19', 'Section #1', '1', 'Branding', 'Trending Travel Mug', 'Category', '1', '1', 'public/storage/corporate branding.png', '1');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent` int(11) DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_parent` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `created_at`, `updated_at`, `parent`, `name`, `description`, `slug`, `image`, `has_parent`) VALUES
(1, '2021-09-17 18:13:44', '2022-01-31 11:09:34', 0, 'Branding', '🚘 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!', 'branding', 'public/storage/branding1.png', 0),
(2, '2021-09-17 18:16:29', '2022-01-31 11:09:03', 0, 'Printing', 'Print', 'printing', 'public/storage/printing (2).png', 0),
(3, '2021-09-17 18:17:43', '2022-01-31 11:10:01', 0, 'Graphics Designing', 'Make graphical designs', 'graphics-designing', 'public/storage/graphics.png', 0),
(4, '2021-10-07 21:56:10', '2022-01-31 11:11:50', 3, 'Company Logos', 'Company Logos Details', 'company-logos', 'public/storage/art (1).png', 0),
(6, '2021-10-07 21:57:10', '2022-01-19 14:04:36', 3, 'Photo Books', 'Photo Books', 'photo-books', 'storage/3ace2313e281e48d84f78ad910fb2dfd.png', 0),
(8, '2021-10-08 10:42:37', '2022-01-19 13:38:28', 2, 'Business Cards', 'Business Cards category details go here...', 'business-cards', 'storage/7fcc8ebaeeb66a04d4287c5bab3abb4a.png', 1),
(9, '2021-10-08 11:35:36', '2022-01-19 13:51:06', 1, 'Travel Mug', 'Travel Mug DETAILS GO HERE.....', 'travel-mug', 'storage/347555768ce414027d26edc4ada2d36d.png', 0),
(11, '2021-10-08 11:56:53', '2022-01-19 14:28:53', 2, 'Banners', 'Banners For Sale details go here', 'banners', 'storage/c9c56ed918c6413b03d772267a1307eb.png', 0),
(13, '2021-11-05 20:06:40', '2022-01-19 14:26:41', 1, 'Corporate Shirts', 'Buy and sell all kinds of Corporate Shirts in Uganda', 'corporate-shirts', 'storage/c457727a6e310a03f6de8c8d297f2a00.png', 1),
(20, '2022-01-19 13:10:02', '2022-01-19 13:10:34', 0, 'Stationery', 'Buy and sell all kinds of Stationery in Uganda', 'stationery', 'storage/8a87a353422d06e8a5e7f13a00d4bcbf.png', 0),
(22, '2022-01-19 14:31:16', '2022-01-19 14:31:16', 20, 'White Boards', 'Buy and sell all kinds of White Boards in Uganda', 'white-boards', NULL, 1),
(23, '2022-01-19 15:16:32', '2022-01-19 15:16:32', 1, 'Company seals', 'Buy and sell all kinds of ... in Uganda', 'company-seals', NULL, 1),
(24, '2022-01-19 15:17:34', '2022-01-19 15:17:34', 1, 'Company stamps', 'Buy and sell all kinds of ... in Uganda', 'company-stamps', NULL, 1),
(25, '2022-01-19 15:18:34', '2022-01-19 15:18:34', 1, 'Name tags', 'Buy and sell all kinds of ... in Uganda', 'name-tags', NULL, 1),
(26, '2022-01-20 06:38:01', '2022-01-31 11:12:57', 0, 'Printers', 'Buy and sell all kinds of .Printers.. in Uganda', 'printers', 'public/storage/stationery.png', 0),
(28, '2022-01-24 00:25:22', '2022-02-01 05:04:53', 0, 'Jobs', 'Buy and sell all kinds of ... in Uganda', 'jobs', 'public/storage/jobs.png', 0),
(29, '2022-01-24 00:26:15', '2022-02-01 05:19:52', 0, 'Application/CV', 'Buy and sell all kinds of ... in Uganda', 'applicationcv', 'public/storage/cv.png', 0),
(30, '2022-01-27 00:45:09', '2022-02-01 06:01:25', 32, 'Plotting', 'Buy and sell all kinds of ... in Uganda', 'plotting', NULL, 1),
(31, '2022-01-27 00:45:45', '2022-02-01 06:00:52', 32, 'Banners installation', 'Buy and sell all kinds of ... in Uganda', 'banners-installation', NULL, 1),
(32, '2022-02-01 05:58:59', '2022-02-01 05:58:59', 0, 'Other Services', 'Buy and sell all kinds of ... in Uganda', 'other-services', 'public/storage/service-icon-9.jpg', 0),
(33, '2022-02-02 14:26:24', '2022-02-02 14:26:24', 1, 'Shirts branding', 'Buy and sell all kinds of shirts branding in Uganda', 'shirts-branding', NULL, 1),
(34, '2022-02-02 14:28:03', '2022-02-02 14:28:03', 1, 'Promotional items', 'Buy and sell all kinds of ... in Uganda', 'promotional-items', NULL, 1),
(35, '2022-02-02 14:28:44', '2022-02-02 14:28:44', 2, 'UV printing', 'Buy and sell all kinds of ... in Uganda', 'uv-printing', NULL, 1),
(36, '2022-02-02 14:29:09', '2022-02-02 14:29:09', 2, 'Digital printingv', 'Buy and sell all kinds of ... in Uganda', 'digital-printingv', NULL, 1),
(37, '2022-02-02 14:29:30', '2022-02-02 14:29:30', 1, 'Engraving', 'Buy and sell all kinds of ... in Uganda', 'engraving', NULL, 1),
(38, '2022-02-02 14:31:04', '2022-02-02 14:31:04', 1, 'Embroidery services', 'Buy and sell all kinds of ... in Uganda', 'embroidery-services', NULL, 1),
(39, '2022-02-06 13:53:32', '2022-02-06 13:53:32', 2, 'Plastic Identity Card', 'Buy and sell all kinds of Plastic Identity Card in Uganda', 'plastic-identity-card', NULL, 1),
(41, '2022-02-06 14:39:45', '2022-02-06 14:39:45', 1, 'Phone Cases', 'Buy and sell all kinds of Phone Cases in Uganda', 'phone-cases', NULL, 1),
(42, '2022-02-06 14:45:01', '2022-02-06 14:45:01', 1, 'Hoodies', 'Buy and sell all kinds of Hoodies in Uganda', 'hoodies', NULL, 1),
(43, '2022-02-06 15:06:35', '2022-02-06 15:06:35', 3, 'Corporate Designing', 'Buy and sell all kinds of Corporate Designing in Uganda', 'corporate-designing', NULL, 1),
(44, '2022-02-06 15:10:31', '2022-02-06 15:11:44', 1, 'Caps', 'Buy and sell all kinds of Capes in Uganda', 'caps', NULL, 1),
(45, '2022-02-06 16:41:50', '2022-02-06 16:41:50', 1, 'Digitizing', 'Buy and sell all kinds of ... in Uganda', 'digitizing', NULL, 1),
(46, '2022-02-06 16:43:37', '2022-02-06 16:43:37', 1, 'Tear Drops', 'Buy and sell all kinds of Tear Drops in Uganda', 'tear-drops', NULL, 1),
(47, '2022-02-06 16:44:15', '2022-02-06 16:44:15', 1, 'Epoxy Servies', 'Buy and sell all kinds of Epoxy Servies in Uganda', 'epoxy-servies', NULL, 1),
(48, '2022-02-06 16:45:29', '2022-02-06 16:45:29', 1, 'Customized Sublimation Cups', 'Buy and sell all kinds of Customized Sublimation Cups in Uganda', 'customized-sublimation-cups', NULL, 1),
(49, '2022-02-06 16:46:26', '2022-02-06 16:48:39', 1, 'Crystal Accolades', 'Buy and sell all kinds of Crystal Accolades in Uganda', 'crystal-accolades', NULL, 1),
(50, '2022-02-06 16:47:11', '2022-02-06 16:47:11', 1, 'Bamboo Awords', 'Buy and sell all kinds of Bamboo Awards in Uganda', 'bamboo-awords', NULL, 1),
(51, '2022-02-06 16:48:12', '2022-02-06 16:48:12', 1, 'Keyholder', 'Buy and sell all kinds of Keyholder in Uganda', 'keyholder', NULL, 1),
(52, '2022-02-06 16:49:50', '2022-02-06 16:49:50', 1, 'Customized Wall Clocks', 'Buy and sell all kinds of Customized Wall Clocks in Uganda', 'customized-wall-clocks', NULL, 1),
(53, '2022-02-06 16:50:58', '2022-02-06 16:50:58', 1, 'Engraving Services', 'Buy and sell all kinds of Engraving Services in Uganda', 'engraving-services', NULL, 1),
(54, '2022-02-06 16:51:33', '2022-02-06 16:51:33', 2, 'Stickers', 'Buy and sell all kinds of Stickers in Uganda', 'stickers', NULL, 1),
(55, '2022-02-06 16:52:03', '2022-02-06 16:52:03', 1, 'Label pins', 'Buy and sell all kinds of Label pins in Uganda', 'label-pins', NULL, 1),
(56, '2022-02-06 16:53:01', '2022-02-06 16:53:01', 1, 'Customized gift packs', 'Buy and sell all kinds of Customized gift packs in Uganda', 'customized-gift-packs', NULL, 1),
(57, '2022-02-06 16:53:27', '2022-02-06 16:53:27', 1, 'Branded Keyholders', 'Buy and sell all kinds of ... in Uganda', 'branded-keyholders', NULL, 1),
(58, '2022-02-06 16:54:42', '2022-02-06 16:54:42', 2, 'Booklets', 'Buy and sell all kinds of Booklets in Uganda', 'booklets', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender` bigint(20) UNSIGNED NOT NULL,
  `receiver` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `thread` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `received` tinyint(4) DEFAULT NULL,
  `seen` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `created_at`, `updated_at`, `body`, `sender`, `receiver`, `product_id`, `thread`, `received`, `seen`) VALUES
(1, '2021-10-16 07:35:12', '2021-10-16 07:35:12', 'simple message test', 7, 8, 4, '7-8-4', 0, 1),
(2, '2021-10-16 07:37:06', '2021-10-16 07:37:06', 'simple message test', 7, 8, 4, '7-8-4', 0, 1),
(3, '2021-10-16 07:37:10', '2021-10-16 07:37:10', 'simple message test', 7, 8, 4, '7-8-4', 0, 1),
(4, '2021-10-16 07:39:07', '2021-10-16 07:39:07', 'simple message test', 7, 8, 4, '7-8-4', 0, 1),
(5, '2021-10-16 07:39:46', '2021-10-16 07:39:46', 'simple message test', 7, 8, 4, '7-8-4', 0, 1),
(6, '2021-10-16 07:39:55', '2021-10-16 07:39:55', 'simple message test', 7, 8, 4, '7-8-4', 0, 1),
(7, '2021-10-16 07:40:05', '2021-10-16 07:40:05', 'simple message test', 7, 8, 4, '7-8-4', 0, 1),
(8, '2021-10-16 07:40:17', '2021-10-16 07:40:17', 'simple message test', 7, 8, 4, '7-8-4', 0, 1),
(9, '2021-10-16 07:41:40', '2021-10-16 07:41:40', 'simple message test', 7, 8, 4, '7-8-4', 0, 1),
(10, '2021-10-16 07:42:50', '2021-10-16 07:42:50', 'simple message test', 7, 8, 4, '7-8-4', 0, 1),
(11, '2021-10-16 07:46:22', '2021-10-16 07:46:22', 'simple message test', 7, 8, 4, '7-8-4', 0, 1),
(12, '2021-10-16 07:46:38', '2021-10-16 07:46:38', 'simple message test', 7, 8, 4, '7-8-4', 0, 1),
(13, '2021-10-16 07:47:50', '2021-10-16 07:47:50', 'simple message test', 7, 8, 4, '7-8-4', 0, 1),
(14, '2021-10-16 07:48:17', '2021-10-16 07:48:17', 'simple message test', 7, 8, 4, '7-8-4', 0, 1),
(15, '2021-10-16 07:48:35', '2021-10-16 07:48:35', 'simple message test', 7, 8, 4, '7-8-4', 0, 1),
(16, '2021-10-16 07:58:50', '2021-10-16 07:58:50', 'i love this', 8, 7, 4, '7-8-4', 0, 1),
(17, '2021-10-16 07:59:03', '2021-10-16 07:59:03', 'don;t you?', 8, 7, 4, '7-8-4', 0, 1),
(18, '2021-10-16 07:59:11', '2021-10-16 07:59:11', 'I do!', 7, 8, 4, '7-8-4', 0, 1),
(19, '2021-10-16 09:14:25', '2021-10-16 09:14:25', 'asbjlaks', 7, 8, 4, '7-8-4', 0, 1),
(20, '2021-10-16 09:15:12', '2021-10-16 09:15:12', 'romina is so romantic', 7, 8, 4, '7-8-4', 0, 1),
(21, '2021-10-16 09:17:14', '2021-10-16 09:17:14', 'this si as sipl ', 7, 8, 4, '7-8-4', 0, 1),
(22, '2021-10-16 09:18:22', '2021-10-16 09:18:22', 'asknkjas', 7, 8, 4, '7-8-4', 0, 1),
(23, '2021-10-16 09:19:35', '2021-10-16 09:19:35', 'asljnkas', 7, 8, 4, '7-8-4', 0, 1),
(24, '2021-10-16 09:19:35', '2021-10-16 09:19:35', 'asljnkas', 7, 8, 4, '7-8-4', 0, 1),
(25, '2021-10-16 09:20:26', '2021-10-16 09:20:26', 'asas', 7, 8, 4, '7-8-4', 0, 1),
(26, '2021-10-16 09:22:29', '2021-10-16 09:22:29', 'aksnkljas', 7, 8, 4, '7-8-4', 0, 1),
(27, '2021-10-16 09:28:01', '2021-10-16 09:28:01', 'tes messg', 7, 8, 4, '7-8-4', 0, 1),
(28, '2021-10-16 09:32:14', '2021-10-16 09:32:14', 'ashb', 7, 8, 4, '7-8-4', 0, 1),
(29, '2021-10-16 09:33:00', '2021-10-16 09:33:00', 'ansams', 7, 8, 4, '7-8-4', 0, 1),
(30, '2021-10-16 09:34:18', '2021-10-16 09:34:18', 'anjane', 7, 8, 4, '7-8-4', 0, 1),
(31, '2021-10-16 09:34:58', '2021-10-16 09:34:58', 'anjane says hi', 7, 8, 4, '7-8-4', 0, 1),
(32, '2021-10-16 09:35:34', '2021-10-16 09:35:34', 'Hi', 7, 8, 4, '7-8-4', 0, 1),
(33, '2021-10-16 09:35:39', '2021-10-16 09:35:39', 'My name is Muhindo', 7, 8, 4, '7-8-4', 0, 1),
(34, '2021-10-16 09:35:51', '2021-10-16 09:35:51', 'i love making new firends', 7, 8, 4, '7-8-4', 0, 1),
(35, '2021-10-16 09:37:34', '2021-10-16 09:37:34', 'siml', 7, 8, 4, '7-8-4', 0, 1),
(36, '2021-10-16 09:39:06', '2021-10-16 09:39:06', 'as', 7, 8, 4, '7-8-4', 0, 1),
(37, '2021-10-16 09:39:22', '2021-10-16 09:39:22', 'asjbka', 7, 8, 4, '7-8-4', 0, 1),
(38, '2021-10-16 09:39:40', '2021-10-16 09:39:40', 'asbjlas', 7, 8, 4, '7-8-4', 0, 1),
(39, '2021-10-16 09:39:43', '2021-10-16 09:39:43', 'hjavsgvas', 7, 8, 4, '7-8-4', 0, 1),
(40, '2021-10-16 09:41:24', '2021-10-16 09:41:24', 'anjane', 7, 8, 4, '7-8-4', 0, 1),
(41, '2021-10-16 09:41:32', '2021-10-16 09:41:32', 'I need to come to see you tomorrow', 7, 8, 4, '7-8-4', 0, 1),
(42, '2021-10-16 09:42:16', '2021-10-16 09:42:16', 'yes sure!', 7, 8, 4, '7-8-4', 0, 1),
(43, '2021-10-16 11:31:08', '2021-10-16 11:31:08', 'i love this product', 8, 7, 2, '8-7-2', 0, 1),
(44, '2021-10-16 11:31:25', '2021-10-16 11:31:25', 'Do you mind if you find me on my whastapp', 8, 7, 2, '8-7-2', 0, 1),
(45, '2021-10-17 10:15:20', '2021-10-17 10:15:20', 'I just love this!', 8, 7, 1, '8-7-1', 0, 1),
(46, '2021-10-17 10:15:33', '2021-10-17 10:15:33', 'do you mind if you text me please?', 8, 7, 1, '8-7-1', 0, 1),
(47, '2021-10-17 10:15:51', '2021-10-17 10:15:51', 'Call me if you see this message !', 8, 7, 1, '8-7-1', 0, 1),
(48, '2021-10-17 10:16:08', '2021-10-17 10:16:08', 'thank you!', 8, 7, 1, '8-7-1', 0, 1),
(49, '2021-10-17 10:34:43', '2021-10-17 10:34:43', 'I love that', 7, 8, 4, '7-8-4', 0, 1),
(50, '2021-10-17 10:35:06', '2021-10-17 10:35:06', 'people are not simple', 7, 8, 1, '8-7-1', 0, 1),
(51, '2021-10-17 10:36:24', '2021-10-17 10:36:24', 'I love that of course!', 8, 7, 1, '8-7-1', 0, 1),
(52, '2021-10-17 10:36:39', '2021-10-17 10:36:39', 'this is what I have been praying for!', 8, 7, 1, '8-7-1', 0, 1),
(53, '2021-10-17 10:45:32', '2021-10-17 10:45:32', 'i love this', 7, 8, 1, '8-7-1', 0, 1),
(54, '2021-10-17 10:49:16', '2021-10-17 10:49:16', 'see you tomorrow!', 7, 8, 1, '8-7-1', 0, 1),
(55, '2021-10-17 10:50:32', '2021-10-17 10:50:32', 'i love this', 7, 8, 1, '8-7-1', 0, 1),
(56, '2021-10-17 10:51:08', '2021-10-17 10:51:08', 'some people are not easy', 7, 8, 1, '8-7-1', 0, 1),
(57, '2021-11-26 17:35:34', '2021-11-26 17:35:34', 'Hi', 15, 12, 3, '15-12-3', 0, 0),
(58, '2021-11-26 17:35:48', '2021-11-26 17:35:48', 'I am interested in this pro, is it still available', 15, 12, 3, '15-12-3', 0, 0),
(59, '2021-12-28 15:29:40', '2021-12-28 15:29:40', 'hi', 24, 12, 3, '24-12-3', 0, 0),
(60, '2022-01-05 16:55:29', '2022-01-05 16:55:29', 'simple message', 27, 15, 10, '27-15-10', 0, 0),
(61, '2022-01-17 06:23:09', '2022-01-17 06:23:09', 'Hibi', 30, 25, 11, '30-25-11', 0, 0),
(62, '2022-01-26 19:27:42', '2022-01-26 19:27:42', 'Hi', 31, 28, 18, '31-28-18', 0, 1),
(63, '2022-01-28 13:10:36', '2022-01-28 13:10:36', 'hi', 28, 31, 18, '31-28-18', 0, 0),
(64, '2022-01-31 05:45:04', '2022-01-31 05:45:04', 'Hi ', 31, 28, 24, '31-28-24', 0, 0),
(65, '2022-01-31 05:45:09', '2022-01-31 05:45:09', 'Good evening ', 31, 28, 24, '31-28-24', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `listed` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `created_at`, `updated_at`, `country_id`, `name`, `longitude`, `latitude`, `details`, `image`, `listed`) VALUES
(1, '2021-09-23 07:46:44', '2022-01-27 05:53:48', 1, 'Central division', '16.2212.', '18.2222', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti', 'd8fd9f28af0cdfa8b8f213d347c4fb78.jpg', '1'),
(2, '2021-09-23 07:46:58', '2022-01-27 05:53:48', 1, 'Makindye', '16.2212.', '18.2222', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti', 'city-mbarara.jpg', '1'),
(3, '2021-09-23 07:47:11', '2022-01-27 05:39:58', 4, 'Amuria', '16.2212.', '18.2222', 'Uganda is a landlocked country in East Africa whose diverse landscape encompasses the snow-capped Rwenzori Mountains and immense Lake Victoria. Its abundant wildlife includes chimpanzees as well as rare birds. Remote Bwindi Impenetrable National Park is a renowned mountain gorilla sanctuary. Murchison Falls National Park in the northwest is known for its 43m-tall waterfall and wildlife such as hippos.', 'city-dubai.jpg', '1'),
(4, '2021-09-23 07:47:22', '2022-01-27 05:53:48', 1, 'Kawempe', '0.0', '0.0', NULL, '01.jpg', '0'),
(5, '2021-10-02 11:55:41', '2022-01-27 05:38:07', 2, 'Busukuma', '16.2212.', '18.2222', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti', 'city-istanbul.jpg', '1'),
(6, '2021-10-02 11:56:42', '2022-01-27 05:39:58', 4, 'Budaka', '16.2212', '18.2222', NULL, 'city-qatar.jpg', '1'),
(7, '2021-10-02 12:03:52', '2022-01-27 05:39:07', 3, 'Kayunga', '16.2212.', '18.2222', 'Uganda is a landlocked country in East Africa whose diverse landscape encompasses the snow-capped Rwenzori Mountains and immense Lake Victoria. Its abundant wildlife includes chimpanzees as well as rare birds. Remote Bwindi Impenetrable National Park is a renowned mountain gorilla sanctuary. Murchison Falls National Park in the northwest is known for its 43m-tall waterfall and wildlife such as hippos.', 'city-quanzhou.jpg', '1'),
(8, '2022-01-27 05:38:07', '2022-01-27 05:38:07', 2, 'Gombe', '0.0', '0.0', NULL, NULL, '1'),
(9, '2022-01-27 05:38:07', '2022-01-27 05:38:07', 2, 'Kasanje', '0.0', '0.0', NULL, NULL, '1'),
(10, '2022-01-27 05:38:07', '2022-01-27 05:38:07', 2, 'Kira Town', '0.0', '0.0', NULL, NULL, '1'),
(11, '2022-01-27 05:39:07', '2022-01-27 05:39:07', 3, 'Luwero', '0.0', '0.0', NULL, NULL, '1'),
(12, '2022-01-27 05:39:58', '2022-01-27 05:39:58', 4, 'Bududa', '0.0', '0.0', NULL, NULL, '1'),
(13, '2022-01-27 05:39:58', '2022-01-27 05:39:58', 4, 'Bugiri', '0.0', '0.0', NULL, NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `listed` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `created_at`, `updated_at`, `name`, `longitude`, `latitude`, `details`, `image`, `code`, `listed`) VALUES
(1, '2021-09-23 07:38:25', '2022-01-27 05:06:30', 'Kampala', '16.2212.', '18.2222', 'Kampala uganda', NULL, '256', '1'),
(2, '2021-09-23 07:41:16', '2022-01-27 05:08:12', 'Wakiso', '16.2212.', '18.2222', 'Wakiso uganda', 'images/Flag_of_Turkey.svg.png', '+90', '1'),
(3, '2021-10-02 11:36:43', '2022-01-27 05:08:40', 'Mukono', '16.2212.', '18.2222', 'Mukono uganda', 'images/city-quanzhou.jpg', '256', '1'),
(4, '2021-10-02 11:38:03', '2022-01-27 05:09:57', 'Estern uganda', '16.2212.', '18.2222', 'Estern uganda', 'images/city-dubai.jpg', '441188', '1');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `size` double(8,2) DEFAULT NULL,
  `width` double(8,2) DEFAULT NULL,
  `height` double(8,2) DEFAULT NULL,
  `src` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `created_at`, `updated_at`, `user_id`, `product_id`, `size`, `width`, `height`, `src`, `name`, `thumbnail`) VALUES
(1, '2021-09-18 09:37:41', '2021-09-18 09:37:41', 1, NULL, NULL, NULL, NULL, 'public/MgW7hmTnfXm1CaEdV525VsU9oAa0h2zjvAa2fDJ1.png', NULL, 'public/thumb_MgW7hmTnfXm1CaEdV525VsU9oAa0h2zjvAa2fDJ1.png'),
(2, '2021-09-18 09:39:09', '2021-09-18 09:39:09', 1, NULL, NULL, NULL, NULL, 'public/cNznQD2kbTcXZZ31JxUGcjElBv6UhI37OCzGl1hk.png', NULL, 'public/thumb_cNznQD2kbTcXZZ31JxUGcjElBv6UhI37OCzGl1hk.png'),
(3, '2021-09-18 09:39:32', '2021-09-18 09:39:32', 1, NULL, NULL, NULL, NULL, 'public/fbJ4qhkrq2rhopxEAZ7ACWLOv3e8Xgv60IvNyZ32.png', NULL, 'public/thumb_fbJ4qhkrq2rhopxEAZ7ACWLOv3e8Xgv60IvNyZ32.png'),
(4, '2021-09-18 09:40:01', '2021-09-18 09:40:01', 1, NULL, NULL, NULL, NULL, 'public/CnZXzyFFJTAfZCjXXaS2zb5w8zHhu7o8ZOwMmWzy.png', NULL, 'public/thumb_CnZXzyFFJTAfZCjXXaS2zb5w8zHhu7o8ZOwMmWzy.png'),
(5, '2021-09-18 09:40:01', '2021-09-18 09:40:01', 1, NULL, NULL, NULL, NULL, 'public/lC3ldkuqylg9kIipPLUGXhqmMUCqGrX1aziiPy5P.png', NULL, 'public/thumb_lC3ldkuqylg9kIipPLUGXhqmMUCqGrX1aziiPy5P.png'),
(6, '2021-09-18 09:40:01', '2021-09-18 09:40:01', 1, NULL, NULL, NULL, NULL, 'public/vQTtt1DYr8TNH4O6y3TckvSonicJz4HNMuvoH4vK.png', NULL, 'public/thumb_vQTtt1DYr8TNH4O6y3TckvSonicJz4HNMuvoH4vK.png'),
(7, '2021-09-18 09:40:01', '2021-09-18 09:40:01', 1, NULL, NULL, NULL, NULL, 'public/BR8lmoFdMjyDilLtXLho6kiaLZelR5YsrLskgCUP.png', NULL, 'public/thumb_BR8lmoFdMjyDilLtXLho6kiaLZelR5YsrLskgCUP.png'),
(8, '2021-09-18 09:40:29', '2021-09-18 09:40:29', 1, NULL, NULL, NULL, NULL, 'public/ThltVNoMhDQGShBcdyBBWprzUa1yBjR7YmJjNoOl.png', NULL, 'public/thumb_ThltVNoMhDQGShBcdyBBWprzUa1yBjR7YmJjNoOl.png'),
(9, '2021-09-18 09:40:29', '2021-09-18 09:40:29', 1, NULL, NULL, NULL, NULL, 'public/DHy7TBDHBitLcjFu5IvXITOPXoKV3VZMTFGv89m0.png', NULL, 'public/thumb_DHy7TBDHBitLcjFu5IvXITOPXoKV3VZMTFGv89m0.png'),
(10, '2021-09-18 09:40:29', '2021-09-18 09:40:29', 1, NULL, NULL, NULL, NULL, 'public/qGpwxVmSC31FpSq5yI6OU1YRuVJcAQFTWd1WlXjv.png', NULL, 'public/thumb_qGpwxVmSC31FpSq5yI6OU1YRuVJcAQFTWd1WlXjv.png'),
(11, '2021-09-18 09:40:29', '2021-09-18 09:40:29', 1, NULL, NULL, NULL, NULL, 'public/J4d505h4y0skY5qr7pKrJMJSpJQYIGNiAqkNLvRQ.png', NULL, 'public/thumb_J4d505h4y0skY5qr7pKrJMJSpJQYIGNiAqkNLvRQ.png'),
(12, '2021-09-18 09:42:56', '2021-09-18 09:42:56', 1, NULL, NULL, NULL, NULL, 'public/yu62gPXVRTuEO3TpL0XBDi335BVYCCDEZzZk4mxK.png', NULL, 'public/thumb_yu62gPXVRTuEO3TpL0XBDi335BVYCCDEZzZk4mxK.png'),
(13, '2021-09-18 09:42:56', '2021-09-18 09:42:56', 1, NULL, NULL, NULL, NULL, 'public/z5dSFMAdAdOUs0J585w8hDMI8GMPh0i0KthmVhY2.png', NULL, 'public/thumb_z5dSFMAdAdOUs0J585w8hDMI8GMPh0i0KthmVhY2.png'),
(14, '2021-09-18 09:42:56', '2021-09-18 09:42:56', 1, NULL, NULL, NULL, NULL, 'public/PwjUhGyuwcPVog92OrW4WahLHcDddXybqarVYTR0.png', NULL, 'public/thumb_PwjUhGyuwcPVog92OrW4WahLHcDddXybqarVYTR0.png'),
(15, '2021-09-18 09:42:56', '2021-09-18 09:42:56', 1, NULL, NULL, NULL, NULL, 'public/bs2lNXPppvL2ClcZ05PRLJO20FQ9PfbK5kxJO8Hy.png', NULL, 'public/thumb_bs2lNXPppvL2ClcZ05PRLJO20FQ9PfbK5kxJO8Hy.png'),
(16, '2021-09-18 11:44:10', '2021-09-18 11:44:10', 1, NULL, NULL, NULL, NULL, 'public/khirV2BKPl15UsNNynUhZmAdxlBv31vnyryM5Y0y.png', NULL, 'public/thumb_khirV2BKPl15UsNNynUhZmAdxlBv31vnyryM5Y0y.png'),
(17, '2021-09-18 11:44:11', '2021-09-18 11:44:11', 1, NULL, NULL, NULL, NULL, 'public/PDoI1DJOK0x8rPESYTNe5vJAGuvA8IQkQVdidHhU.png', NULL, 'public/thumb_PDoI1DJOK0x8rPESYTNe5vJAGuvA8IQkQVdidHhU.png'),
(18, '2021-09-18 11:44:11', '2021-09-18 11:44:11', 1, NULL, NULL, NULL, NULL, 'public/9meMaBZ52fbiX7HvFYl7zTMbabUk3n62VYEwOGfN.png', NULL, 'public/thumb_9meMaBZ52fbiX7HvFYl7zTMbabUk3n62VYEwOGfN.png'),
(19, '2021-09-18 11:44:11', '2021-09-18 11:44:11', 1, NULL, NULL, NULL, NULL, 'public/l8fuEDd5xZaMydC2K1LANr1yaE0r2lPRBjzUgeLF.png', NULL, 'public/thumb_l8fuEDd5xZaMydC2K1LANr1yaE0r2lPRBjzUgeLF.png'),
(20, '2021-09-18 11:46:12', '2021-09-18 11:46:12', 1, NULL, NULL, NULL, NULL, 'public/IhFh607BR9MSGvQik7WOhPSg5qto3u2yHuXjjkOv.png', NULL, 'public/thumb_IhFh607BR9MSGvQik7WOhPSg5qto3u2yHuXjjkOv.png'),
(21, '2021-09-18 11:46:12', '2021-09-18 11:46:12', 1, NULL, NULL, NULL, NULL, 'public/WS2WLUPZF6UiwMG3QmAzAXyEqlpqpEv8hnX4lqdh.png', NULL, 'public/thumb_WS2WLUPZF6UiwMG3QmAzAXyEqlpqpEv8hnX4lqdh.png'),
(22, '2021-09-18 11:46:12', '2021-09-18 11:46:12', 1, NULL, NULL, NULL, NULL, 'public/3FwKJlTHNkZeClCfxf13Dx1B73NXcwUGLC5fP3oq.png', NULL, 'public/thumb_3FwKJlTHNkZeClCfxf13Dx1B73NXcwUGLC5fP3oq.png'),
(23, '2021-09-18 11:46:13', '2021-09-18 11:46:13', 1, NULL, NULL, NULL, NULL, 'public/3tO5AHTdlVf2GsdTZ1gQHVIEDTntd0GhntOefhgV.png', NULL, 'public/thumb_3tO5AHTdlVf2GsdTZ1gQHVIEDTntd0GhntOefhgV.png'),
(24, '2021-09-18 11:46:55', '2021-09-18 11:46:55', 1, NULL, NULL, NULL, NULL, 'public/fljgtgldZIOwtUSY48Q71NcUh2uJL0gQNC1RSB5H.png', NULL, 'public/thumb_fljgtgldZIOwtUSY48Q71NcUh2uJL0gQNC1RSB5H.png'),
(25, '2021-09-18 11:46:55', '2021-09-18 11:46:55', 1, NULL, NULL, NULL, NULL, 'public/TSvVTYQKx9P0bFlcrH8FIYGZaw32UUkWpoNX3HVy.png', NULL, 'public/thumb_TSvVTYQKx9P0bFlcrH8FIYGZaw32UUkWpoNX3HVy.png'),
(26, '2021-09-18 11:46:55', '2021-09-18 11:46:55', 1, NULL, NULL, NULL, NULL, 'public/cy4k0swa4UfGEr9Zv3x0SAeAZVelLOG31vn94ASQ.png', NULL, 'public/thumb_cy4k0swa4UfGEr9Zv3x0SAeAZVelLOG31vn94ASQ.png'),
(27, '2021-09-18 11:46:56', '2021-09-18 11:46:56', 1, NULL, NULL, NULL, NULL, 'public/khkWLMtHsGgN0z2JEba7qD7BuYPzmdegNMd1Zxjl.png', NULL, 'public/thumb_khkWLMtHsGgN0z2JEba7qD7BuYPzmdegNMd1Zxjl.png'),
(28, '2021-09-18 12:22:16', '2021-09-18 12:22:16', 1, NULL, NULL, NULL, NULL, 'public/l9S2oGnT00rO2ITzF9e7GWZNPPGw9ziVZgx1ngeb.png', NULL, 'public/thumb_l9S2oGnT00rO2ITzF9e7GWZNPPGw9ziVZgx1ngeb.png'),
(29, '2021-09-18 12:22:16', '2021-09-18 12:22:16', 1, NULL, NULL, NULL, NULL, 'public/r9NubfRpUUEOqfmmPD3QwoMEBc1AwHQenxs3sJW0.png', NULL, 'public/thumb_r9NubfRpUUEOqfmmPD3QwoMEBc1AwHQenxs3sJW0.png'),
(30, '2021-09-18 12:22:16', '2021-09-18 12:22:16', 1, NULL, NULL, NULL, NULL, 'public/kmQL2oTcuUnOZ1tC87d7Fo2pDnZQfMxlCeFTJFUR.png', NULL, 'public/thumb_kmQL2oTcuUnOZ1tC87d7Fo2pDnZQfMxlCeFTJFUR.png'),
(31, '2021-09-18 12:22:16', '2021-09-18 12:22:16', 1, NULL, NULL, NULL, NULL, 'public/oZKGft8wix9mHsN7Tmd3OIoCYBMrjZlv6IgLf1yM.png', NULL, 'public/thumb_oZKGft8wix9mHsN7Tmd3OIoCYBMrjZlv6IgLf1yM.png'),
(32, '2021-09-18 12:22:38', '2021-09-18 12:22:38', 1, NULL, NULL, NULL, NULL, 'public/yMFwGKCrRlBsAcHisUAbMJWzE45QS6jiyfeyM6em.png', NULL, 'public/thumb_yMFwGKCrRlBsAcHisUAbMJWzE45QS6jiyfeyM6em.png'),
(33, '2021-09-18 12:22:38', '2021-09-18 12:22:38', 1, NULL, NULL, NULL, NULL, 'public/reYG0O5DUYKXdD2NqiCbyTR0E12A5ezJN9EyGruu.png', NULL, 'public/thumb_reYG0O5DUYKXdD2NqiCbyTR0E12A5ezJN9EyGruu.png'),
(34, '2021-09-18 12:22:39', '2021-09-18 12:22:39', 1, NULL, NULL, NULL, NULL, 'public/RQLgkoaKZ3jXbBvFyHhm2c9r7udXQCu2yxiWMVe0.png', NULL, 'public/thumb_RQLgkoaKZ3jXbBvFyHhm2c9r7udXQCu2yxiWMVe0.png'),
(35, '2021-09-18 12:22:39', '2021-09-18 12:22:39', 1, NULL, NULL, NULL, NULL, 'public/8HMiKmLVh0UQxGTKikIMd3fuFIwxvm2O1lSpa6WS.png', NULL, 'public/thumb_8HMiKmLVh0UQxGTKikIMd3fuFIwxvm2O1lSpa6WS.png'),
(36, '2021-09-18 12:23:20', '2021-09-18 12:23:20', 1, NULL, NULL, NULL, NULL, 'public/c817KrTtcQxt52rRgSkapKRxYRsiXutcxO8WQDsJ.png', NULL, 'public/thumb_c817KrTtcQxt52rRgSkapKRxYRsiXutcxO8WQDsJ.png'),
(37, '2021-09-18 12:23:20', '2021-09-18 12:23:20', 1, NULL, NULL, NULL, NULL, 'public/8QK2VQFmzhn5UYFVdIFsfttxjGgDUAezG70PqWG1.png', NULL, 'public/thumb_8QK2VQFmzhn5UYFVdIFsfttxjGgDUAezG70PqWG1.png'),
(38, '2021-09-18 12:23:20', '2021-09-18 12:23:20', 1, NULL, NULL, NULL, NULL, 'public/EocRmDOgNeXOiMbxUP2AeACoJER2Rm1TBnxNw4u1.png', NULL, 'public/thumb_EocRmDOgNeXOiMbxUP2AeACoJER2Rm1TBnxNw4u1.png'),
(39, '2021-09-18 12:23:20', '2021-09-18 12:23:20', 1, NULL, NULL, NULL, NULL, 'public/6W9jaVttNUh3XIvSW6lGLLAwQnDSL1O3ItgJ5DI0.png', NULL, 'public/thumb_6W9jaVttNUh3XIvSW6lGLLAwQnDSL1O3ItgJ5DI0.png'),
(40, '2021-09-18 12:24:43', '2021-09-18 12:24:43', 1, NULL, NULL, NULL, NULL, 'public/Ww1HdM9pY2hxH2BVBKirgQlFSRUUyYjm77ZITGRv.png', NULL, 'public/thumb_Ww1HdM9pY2hxH2BVBKirgQlFSRUUyYjm77ZITGRv.png'),
(41, '2021-09-18 12:24:43', '2021-09-18 12:24:43', 1, NULL, NULL, NULL, NULL, 'public/buyPGy0x1Y2qejNDEPEOP70txqDZegk3OQEpfn4t.png', NULL, 'public/thumb_buyPGy0x1Y2qejNDEPEOP70txqDZegk3OQEpfn4t.png'),
(42, '2021-09-18 12:24:43', '2021-09-18 12:24:43', 1, NULL, NULL, NULL, NULL, 'public/KoHri5TwnWjdRJ0e6P0Yl7wZRKArqyUOXt2BGI1Z.png', NULL, 'public/thumb_KoHri5TwnWjdRJ0e6P0Yl7wZRKArqyUOXt2BGI1Z.png'),
(43, '2021-09-18 12:24:43', '2021-09-18 12:24:43', 1, NULL, NULL, NULL, NULL, 'public/04mN7VwyyMKd7jk46RBMUfbzZO4OqiyO0asfG1Oh.png', NULL, 'public/thumb_04mN7VwyyMKd7jk46RBMUfbzZO4OqiyO0asfG1Oh.png'),
(44, '2021-09-20 00:51:04', '2021-09-20 00:51:04', 1, NULL, NULL, NULL, NULL, 'public/3oziXAFWN6lQ0zOkN9y7AoDAMKu0Ki4y9mQ7soNb.png', NULL, 'public/thumb_3oziXAFWN6lQ0zOkN9y7AoDAMKu0Ki4y9mQ7soNb.png'),
(45, '2021-09-20 00:54:21', '2021-09-20 00:54:21', 1, NULL, NULL, NULL, NULL, 'public/3pBDpQK4MJsE8haVxQJOXyemTXl2SjSo67F7nJpt.png', NULL, 'public/thumb_3pBDpQK4MJsE8haVxQJOXyemTXl2SjSo67F7nJpt.png'),
(46, '2021-09-20 00:56:16', '2021-09-20 00:56:16', 1, NULL, NULL, NULL, NULL, 'public/GGbxgOxcjhF5HpxVEmSZhzDKwP0yN0KKddRbAlzt.png', NULL, 'public/thumb_GGbxgOxcjhF5HpxVEmSZhzDKwP0yN0KKddRbAlzt.png'),
(47, '2021-09-20 00:56:59', '2021-09-20 00:56:59', 1, NULL, NULL, NULL, NULL, 'public/4iHSG16IOqxN1nP1JPfh7zXRBplN4DRyKpQGaGQZ.png', NULL, 'public/thumb_4iHSG16IOqxN1nP1JPfh7zXRBplN4DRyKpQGaGQZ.png'),
(48, '2021-09-20 00:57:17', '2021-09-20 00:57:17', 1, NULL, NULL, NULL, NULL, 'public/C3CitkxRADTxd5nrKQhrfsgeMhBOyStEKW4kx9tn.png', NULL, 'public/thumb_C3CitkxRADTxd5nrKQhrfsgeMhBOyStEKW4kx9tn.png'),
(49, '2021-09-20 00:58:30', '2021-09-20 00:58:30', 1, NULL, NULL, NULL, NULL, 'public/oYVPXeRKGCmZWCwwfDQhXzpswABstgvSGNa7JTkG.png', NULL, 'public/thumb_oYVPXeRKGCmZWCwwfDQhXzpswABstgvSGNa7JTkG.png'),
(50, '2021-09-21 16:53:31', '2021-09-21 16:53:31', 1, NULL, NULL, NULL, NULL, 'public/XXUoVwPjpifkAqD9o2H4kfI9fi3cfbhTH9Gtnnp6.png', NULL, 'public/thumb_XXUoVwPjpifkAqD9o2H4kfI9fi3cfbhTH9Gtnnp6.png'),
(51, '2021-09-21 16:53:31', '2021-09-21 16:53:31', 1, NULL, NULL, NULL, NULL, 'public/ju3prU7l73aYBPQf1NHZXFSZ3MazNgrEs67byPap.png', NULL, 'public/thumb_ju3prU7l73aYBPQf1NHZXFSZ3MazNgrEs67byPap.png'),
(52, '2021-09-25 05:28:47', '2021-09-25 05:28:47', 1, NULL, NULL, NULL, NULL, 'public/X3ReN7ebnBNTepANKsuggBBXBepb9f0DTfQRZ4ay.jpg', NULL, 'public/thumb_X3ReN7ebnBNTepANKsuggBBXBepb9f0DTfQRZ4ay.jpg'),
(53, '2021-09-25 05:28:47', '2021-09-25 05:28:47', 1, NULL, NULL, NULL, NULL, 'public/YnJMC3fHyFa8fJLsQSPlr6vglN2dxJY21L0QdWTP.png', NULL, 'public/thumb_YnJMC3fHyFa8fJLsQSPlr6vglN2dxJY21L0QdWTP.png'),
(54, '2021-09-25 05:31:12', '2021-09-25 05:31:12', 1, NULL, NULL, NULL, NULL, 'public/rXJjZzCSyeDRDuLmlvTP5t8sofywsCPXqsfu7Sh3.jpg', NULL, 'public/thumb_rXJjZzCSyeDRDuLmlvTP5t8sofywsCPXqsfu7Sh3.jpg'),
(55, '2021-09-25 05:31:12', '2021-09-25 05:31:12', 1, NULL, NULL, NULL, NULL, 'public/dIgyd4LMsFP1viJJ50fEqelfN1CoAUj7RIsLzbWV.png', NULL, 'public/thumb_dIgyd4LMsFP1viJJ50fEqelfN1CoAUj7RIsLzbWV.png'),
(56, '2021-09-25 05:32:07', '2021-09-25 05:32:07', 1, NULL, NULL, NULL, NULL, 'public/9w4QGG18IHqQVQYoouZhbEnTqxGyLFKYWI4o8NOT.jpg', NULL, 'public/thumb_9w4QGG18IHqQVQYoouZhbEnTqxGyLFKYWI4o8NOT.jpg'),
(57, '2021-09-25 05:32:07', '2021-09-25 05:32:07', 1, NULL, NULL, NULL, NULL, 'public/mESlrH7suOqCQiyMZ1qLQKsyPq23mK09O2S92Ecf.png', NULL, 'public/thumb_mESlrH7suOqCQiyMZ1qLQKsyPq23mK09O2S92Ecf.png'),
(58, '2021-09-25 05:32:38', '2021-09-25 05:32:38', 1, NULL, NULL, NULL, NULL, 'public/s3bshfVHW2q06eGP6DF0UjOKp8m0gNOjoDeoTb8f.jpg', NULL, 'public/thumb_s3bshfVHW2q06eGP6DF0UjOKp8m0gNOjoDeoTb8f.jpg'),
(59, '2021-09-25 05:32:38', '2021-09-25 05:32:38', 1, NULL, NULL, NULL, NULL, 'public/peyvC3eGvqKaFRh5fiwy0nFzkkes4Dcd8BNlVAIg.png', NULL, 'public/thumb_peyvC3eGvqKaFRh5fiwy0nFzkkes4Dcd8BNlVAIg.png'),
(60, '2021-09-25 05:42:00', '2021-09-25 05:42:00', 1, NULL, NULL, NULL, NULL, 'public/xvmmMep1TbkOkQrlSZcqa5k7hMhnHNPIVObvW1t7.jpg', NULL, 'public/thumb_xvmmMep1TbkOkQrlSZcqa5k7hMhnHNPIVObvW1t7.jpg'),
(61, '2021-09-25 05:42:00', '2021-09-25 05:42:00', 1, NULL, NULL, NULL, NULL, 'public/FTkNLMT54AfMZgnh5DsFom884MS0EZDXuth4mqep.png', NULL, 'public/thumb_FTkNLMT54AfMZgnh5DsFom884MS0EZDXuth4mqep.png'),
(62, '2021-09-25 05:42:46', '2021-09-25 05:42:46', 1, NULL, NULL, NULL, NULL, 'public/Qz0GVpbL1xTaHyh7O7WEsd3zF1cmbOQ0xWRO1EOL.jpg', NULL, 'public/thumb_Qz0GVpbL1xTaHyh7O7WEsd3zF1cmbOQ0xWRO1EOL.jpg'),
(63, '2021-09-25 05:42:46', '2021-09-25 05:42:46', 1, NULL, NULL, NULL, NULL, 'public/ZKhdiCNJSSNKeE2oxeG8eZRZreuvep9WQNJYjLhT.png', NULL, 'public/thumb_ZKhdiCNJSSNKeE2oxeG8eZRZreuvep9WQNJYjLhT.png'),
(64, '2021-09-25 05:46:15', '2021-09-25 05:46:15', 1, NULL, NULL, NULL, NULL, 'public/hJCAUMc9PY0UtkISE6yKbsngRg07s4H8oDwi5nZx.jpg', NULL, 'public/thumb_hJCAUMc9PY0UtkISE6yKbsngRg07s4H8oDwi5nZx.jpg'),
(65, '2021-09-25 05:49:07', '2021-09-25 05:49:07', 1, NULL, NULL, NULL, NULL, 'public/zDzmG8wVcxDhMhV9KFuRvvNvTvD6zQswPqdaPIQI.jpg', NULL, 'public/thumb_zDzmG8wVcxDhMhV9KFuRvvNvTvD6zQswPqdaPIQI.jpg'),
(66, '2021-09-25 05:49:25', '2021-09-25 05:49:25', 1, NULL, NULL, NULL, NULL, 'public/ywppVSZgDi5ByJS8ksk3twaagSplzOZj9Nwhk6zj.jpg', NULL, 'public/thumb_ywppVSZgDi5ByJS8ksk3twaagSplzOZj9Nwhk6zj.jpg'),
(67, '2021-09-25 05:49:53', '2021-09-25 05:49:53', 1, NULL, NULL, NULL, NULL, 'public/hAXkhd3r0IZf4zIaiiQv0o067wfXncLTSbFNSxWe.jpg', NULL, 'public/thumb_hAXkhd3r0IZf4zIaiiQv0o067wfXncLTSbFNSxWe.jpg'),
(68, '2021-09-25 05:51:09', '2021-09-25 05:51:09', 1, NULL, NULL, NULL, NULL, 'public/6BBxxNO8SIBoljFBPlKVxAKW320za3nKgu7eb9PZ.jpg', NULL, 'public/thumb_6BBxxNO8SIBoljFBPlKVxAKW320za3nKgu7eb9PZ.jpg'),
(69, '2021-09-25 05:52:27', '2021-09-25 05:52:27', 1, NULL, NULL, NULL, NULL, 'public/owo6TT9idZ0rGLgIdO0YezpF1QL3Oxm7Bal7hFui.jpg', NULL, 'public/thumb_owo6TT9idZ0rGLgIdO0YezpF1QL3Oxm7Bal7hFui.jpg'),
(70, '2021-09-27 07:07:52', '2021-09-27 07:07:52', 1, NULL, NULL, NULL, NULL, 'public/ld36auATg0mejq1hSIZFiohvWyjSjU7I1b3aftAU.jpg', NULL, 'public/thumb_ld36auATg0mejq1hSIZFiohvWyjSjU7I1b3aftAU.jpg'),
(71, '2021-09-27 07:08:05', '2021-09-27 07:08:05', 1, NULL, NULL, NULL, NULL, 'public/B2kzOh4fT5xbOR9X7pY1m7L6TAOkWYWogVu1SsWR.jpg', NULL, 'public/thumb_B2kzOh4fT5xbOR9X7pY1m7L6TAOkWYWogVu1SsWR.jpg'),
(72, '2021-09-27 07:08:28', '2021-09-27 07:08:28', 1, NULL, NULL, NULL, NULL, 'public/j50VqfP0ORNODNpSKCp1gE4B3h7hDGbSS6DMJOgT.jpg', NULL, 'public/thumb_j50VqfP0ORNODNpSKCp1gE4B3h7hDGbSS6DMJOgT.jpg'),
(73, '2021-09-27 07:08:37', '2021-09-27 07:08:37', 1, NULL, NULL, NULL, NULL, 'public/muOh8DsTN7N9PNeWpBtF0aKGYaVnuNGnBDOrDuWY.jpg', NULL, 'public/thumb_muOh8DsTN7N9PNeWpBtF0aKGYaVnuNGnBDOrDuWY.jpg'),
(74, '2021-09-27 07:09:13', '2021-09-27 07:09:13', 1, NULL, NULL, NULL, NULL, 'public/tL5Ut6HKnI6JvhYDng0BsQzmi7OBoFCxsBS76Xsw.jpg', NULL, 'public/thumb_tL5Ut6HKnI6JvhYDng0BsQzmi7OBoFCxsBS76Xsw.jpg'),
(75, '2021-09-27 07:10:33', '2021-09-27 07:10:33', 1, NULL, NULL, NULL, NULL, 'public/U4GislZKRNPTrc7HusJO25gmYkYHldYkQnmqf9un.jpg', NULL, 'public/thumb_U4GislZKRNPTrc7HusJO25gmYkYHldYkQnmqf9un.jpg'),
(76, '2021-09-27 07:11:08', '2021-09-27 07:11:08', 1, NULL, NULL, NULL, NULL, 'public/GDS9KfrsQLlersfsr7H5zdf5SubRjDPsLxk7kTEQ.jpg', NULL, 'public/thumb_GDS9KfrsQLlersfsr7H5zdf5SubRjDPsLxk7kTEQ.jpg'),
(77, '2021-09-27 07:11:18', '2021-09-27 07:11:18', 1, NULL, NULL, NULL, NULL, 'public/1QhOMCBa9dori86Kwv0Qkhqe0hV1Y71aiZMJrqn0.jpg', NULL, 'public/thumb_1QhOMCBa9dori86Kwv0Qkhqe0hV1Y71aiZMJrqn0.jpg'),
(78, '2021-09-27 07:13:38', '2021-09-27 07:13:38', 1, NULL, NULL, NULL, NULL, 'public/CUwezVyzB8AJnc7xGaoYXIvbgARGTC0XWNcXBG4p.jpg', NULL, 'public/thumb_CUwezVyzB8AJnc7xGaoYXIvbgARGTC0XWNcXBG4p.jpg'),
(79, '2021-09-27 07:14:23', '2021-09-27 07:14:23', 1, NULL, NULL, NULL, NULL, 'public/I1jpc3r9NoAWfn8OGZsebZNzbucL9Aufqv3V8S2J.jpg', NULL, 'public/thumb_I1jpc3r9NoAWfn8OGZsebZNzbucL9Aufqv3V8S2J.jpg'),
(80, '2021-09-27 07:14:43', '2021-09-27 07:14:43', 1, NULL, NULL, NULL, NULL, 'public/buPeQAY7DI1ycJ6pYfPukfXtQTyGEomGYqEbRHg0.jpg', NULL, 'public/thumb_buPeQAY7DI1ycJ6pYfPukfXtQTyGEomGYqEbRHg0.jpg'),
(81, '2021-09-27 07:17:29', '2021-09-27 07:17:29', 1, NULL, NULL, NULL, NULL, 'public/0pakZtRnkziyRSTEplfERBUmu3pe23LmTrbLjxoK.jpg', NULL, 'public/thumb_0pakZtRnkziyRSTEplfERBUmu3pe23LmTrbLjxoK.jpg'),
(82, '2021-09-27 07:18:00', '2021-09-27 07:18:00', 1, NULL, NULL, NULL, NULL, 'public/wEqwYW6ogcy1BebTC2PUcejXerRT6P9N3yWKDk7L.jpg', NULL, 'public/thumb_wEqwYW6ogcy1BebTC2PUcejXerRT6P9N3yWKDk7L.jpg'),
(83, '2021-09-27 07:18:34', '2021-09-27 07:18:34', 1, NULL, NULL, NULL, NULL, 'public/zvp7e77Sm2TU5MXAP8lZNvbz8wYmzPeQ4fm5KKQM.jpg', NULL, 'public/thumb_zvp7e77Sm2TU5MXAP8lZNvbz8wYmzPeQ4fm5KKQM.jpg'),
(84, '2021-09-27 07:19:19', '2021-09-27 07:19:19', 1, NULL, NULL, NULL, NULL, 'public/LTznCqoVY5fauWJHgISBRJJjY3XMs4N54zfoUl1S.jpg', NULL, 'public/thumb_LTznCqoVY5fauWJHgISBRJJjY3XMs4N54zfoUl1S.jpg'),
(85, '2021-09-27 07:20:07', '2021-09-27 07:20:07', 1, NULL, NULL, NULL, NULL, 'public/Db3PZfIuOeOMjFc41AixbTe7lPEP6fIs1HAPeL5C.jpg', NULL, 'public/thumb_Db3PZfIuOeOMjFc41AixbTe7lPEP6fIs1HAPeL5C.jpg'),
(86, '2021-09-27 07:20:51', '2021-09-27 07:20:51', 1, NULL, NULL, NULL, NULL, 'public/LY1c5URxBk7wN678NIptajs4wUtAcZLgKTld1qVB.jpg', NULL, 'public/thumb_LY1c5URxBk7wN678NIptajs4wUtAcZLgKTld1qVB.jpg'),
(87, '2021-09-27 07:21:25', '2021-09-27 07:21:25', 1, NULL, NULL, NULL, NULL, 'public/4SlQgLVqpxKvtjSzwthQOAKcm4vkf1RuLiWDzBRw.jpg', NULL, 'public/thumb_4SlQgLVqpxKvtjSzwthQOAKcm4vkf1RuLiWDzBRw.jpg'),
(88, '2021-09-27 07:21:48', '2021-09-27 07:21:48', 1, NULL, NULL, NULL, NULL, 'public/tGb9q9zSrFlD6z8rxVh4NkVakbjmWFxOnMs45fDn.jpg', NULL, 'public/thumb_tGb9q9zSrFlD6z8rxVh4NkVakbjmWFxOnMs45fDn.jpg'),
(89, '2021-09-27 07:22:12', '2021-09-27 07:22:12', 1, NULL, NULL, NULL, NULL, 'public/nKMfw6Da9dEeAoMhHyt3bx3lcnjsmid9do9Ccv5r.jpg', NULL, 'public/thumb_nKMfw6Da9dEeAoMhHyt3bx3lcnjsmid9do9Ccv5r.jpg'),
(90, '2021-09-27 07:22:44', '2021-09-27 07:22:44', 1, NULL, NULL, NULL, NULL, 'public/IUDqZ0HVcaOql01E25UdpsIj83h6PKfyBXHZk2iz.jpg', NULL, 'public/thumb_IUDqZ0HVcaOql01E25UdpsIj83h6PKfyBXHZk2iz.jpg'),
(91, '2021-09-27 07:23:21', '2021-09-27 07:23:21', 1, NULL, NULL, NULL, NULL, 'public/RPFOd2PhhHbVdcS7ikb4VEQSwCXp1ebG0xhMKyt7.jpg', NULL, 'public/thumb_RPFOd2PhhHbVdcS7ikb4VEQSwCXp1ebG0xhMKyt7.jpg'),
(92, '2021-09-27 07:23:32', '2021-09-27 07:23:32', 1, NULL, NULL, NULL, NULL, 'public/uOPIsJLobuePhFhbH4BJ7GoyQM5EnbT290gH3CkH.jpg', NULL, 'public/thumb_uOPIsJLobuePhFhbH4BJ7GoyQM5EnbT290gH3CkH.jpg'),
(93, '2021-09-27 16:42:33', '2021-09-27 16:42:33', 1, NULL, NULL, NULL, NULL, 'public/E28l7a3vzAjA7uam1BJtrUTbN5e3VyPMzT5Zydkq.jpg', NULL, 'public/thumb_E28l7a3vzAjA7uam1BJtrUTbN5e3VyPMzT5Zydkq.jpg'),
(94, '2021-09-27 16:47:22', '2021-09-27 16:47:22', 1, NULL, NULL, NULL, NULL, 'public/tjhCWvAuF1pQhwhkmqxJcMr7O8L9hLszz26UM7ze.jpg', NULL, 'public/thumb_tjhCWvAuF1pQhwhkmqxJcMr7O8L9hLszz26UM7ze.jpg'),
(95, '2021-09-27 16:48:06', '2021-09-27 16:48:06', 1, NULL, NULL, NULL, NULL, 'public/yuVTxuBKFaHmFZN88sHILmYArxFRExrRkebmkl9d.jpg', NULL, 'public/thumb_yuVTxuBKFaHmFZN88sHILmYArxFRExrRkebmkl9d.jpg'),
(96, '2021-09-27 16:48:19', '2021-09-27 16:48:19', 1, NULL, NULL, NULL, NULL, 'public/uqwD0wj71fBG2oNsbiKh41UnIfh0yrw4jzJXOcRW.jpg', NULL, 'public/thumb_uqwD0wj71fBG2oNsbiKh41UnIfh0yrw4jzJXOcRW.jpg'),
(97, '2021-09-27 16:50:46', '2021-09-27 16:50:46', 1, NULL, NULL, NULL, NULL, 'public/hqssxhKHSnmOPqIv8RrKTK8j80TER0kQq8dW6GI7.jpg', NULL, 'public/thumb_hqssxhKHSnmOPqIv8RrKTK8j80TER0kQq8dW6GI7.jpg'),
(98, '2021-09-27 16:51:31', '2021-09-27 16:51:31', 1, NULL, NULL, NULL, NULL, 'public/lYceYCTOMZpn3m7qbIFT6INmpkGQBZs78eJaQqzB.jpg', NULL, 'public/thumb_lYceYCTOMZpn3m7qbIFT6INmpkGQBZs78eJaQqzB.jpg'),
(99, '2021-09-27 17:00:03', '2021-09-27 17:00:03', 1, NULL, NULL, NULL, NULL, 'public/CxSUW0gpm2pWJZj1lbucNkgCpJcJHKj7YTsgCecr.jpg', NULL, 'public/thumb_CxSUW0gpm2pWJZj1lbucNkgCpJcJHKj7YTsgCecr.jpg'),
(100, '2021-09-27 17:03:29', '2021-09-27 17:03:29', 1, NULL, NULL, NULL, NULL, 'public/WuLWDW0WwOMKNtqMcYjM8PxKYmclcxCSv0CFYrlV.jpg', NULL, 'public/thumb_WuLWDW0WwOMKNtqMcYjM8PxKYmclcxCSv0CFYrlV.jpg'),
(101, '2021-09-27 17:04:35', '2021-09-27 17:04:35', 1, NULL, NULL, NULL, NULL, 'public/gX3G4B3JAHbARghknoI8BgnpoYBzcIQNNjc2Zjft.jpg', NULL, 'public/thumb_gX3G4B3JAHbARghknoI8BgnpoYBzcIQNNjc2Zjft.jpg'),
(102, '2021-09-27 17:04:36', '2021-09-27 17:04:36', 1, NULL, NULL, NULL, NULL, 'public/AtFwLkeNkk8rtmL0H8270MKTgX7iF1RjGVA6jG3E.jpg', NULL, 'public/thumb_AtFwLkeNkk8rtmL0H8270MKTgX7iF1RjGVA6jG3E.jpg'),
(103, '2021-10-02 19:10:31', '2021-10-02 19:10:31', 1, NULL, NULL, NULL, NULL, 'public/KoXIEdGL0rSYIcATgHpBMhOUkz38VBEkOhftdfJC.jpg', NULL, 'public/thumb_KoXIEdGL0rSYIcATgHpBMhOUkz38VBEkOhftdfJC.jpg'),
(104, '2021-10-02 19:16:53', '2021-10-02 19:16:53', 1, NULL, NULL, NULL, NULL, 'public/ycCtSvqYlLmEs2TY4foTKLxG7vfa2KJ6MTUKwijM.jpg', NULL, 'public/thumb_ycCtSvqYlLmEs2TY4foTKLxG7vfa2KJ6MTUKwijM.jpg'),
(105, '2021-10-02 19:16:53', '2021-10-02 19:16:53', 1, NULL, NULL, NULL, NULL, 'public/xdCG2VbeeMiBDCfSAjfjdD6EXgd7Fi7insYIHZVF.jpg', NULL, 'public/thumb_xdCG2VbeeMiBDCfSAjfjdD6EXgd7Fi7insYIHZVF.jpg'),
(106, '2021-10-02 19:18:45', '2021-10-02 19:18:45', 1, NULL, NULL, NULL, NULL, 'public/WNFHiCoemfngoPaV7LAgoc6jMjcDlBK7p9fUveA0.jpg', NULL, 'public/thumb_WNFHiCoemfngoPaV7LAgoc6jMjcDlBK7p9fUveA0.jpg'),
(107, '2021-10-02 19:18:45', '2021-10-02 19:18:45', 1, NULL, NULL, NULL, NULL, 'public/IIEZcl7lGNtzEMjc30tS7yKHj584wSiFd9QUfDps.jpg', NULL, 'public/thumb_IIEZcl7lGNtzEMjc30tS7yKHj584wSiFd9QUfDps.jpg'),
(108, '2021-10-03 01:39:16', '2021-10-03 01:39:16', 1, NULL, NULL, NULL, NULL, 'public/Ev9j7eBVtROBe8yyPRhzA9dghmHAZs3JF24HRvwB.jpg', NULL, 'public/thumb_Ev9j7eBVtROBe8yyPRhzA9dghmHAZs3JF24HRvwB.jpg'),
(109, '2021-10-03 04:13:20', '2021-10-03 04:13:20', 1, NULL, NULL, NULL, NULL, 'public/UdsQdNbJrKFBvAGThcZoYfIOn9mHAZBK9asEwSfX.jpg', NULL, 'public/thumb_UdsQdNbJrKFBvAGThcZoYfIOn9mHAZBK9asEwSfX.jpg'),
(110, '2021-10-03 04:17:10', '2021-10-03 04:17:10', 1, NULL, NULL, NULL, NULL, 'public/orEsSpRA1Dnsbrnrn0DxbpuHa8BzuDXPVHd2NpCI.jpg', NULL, 'public/thumb_orEsSpRA1Dnsbrnrn0DxbpuHa8BzuDXPVHd2NpCI.jpg'),
(111, '2021-10-03 04:34:39', '2021-10-03 04:34:39', 1, NULL, NULL, NULL, NULL, 'public/1W2yfIEwFUofN6hHXZywn4x86TLa2Uaad4c27xdA.jpg', NULL, 'public/thumb_1W2yfIEwFUofN6hHXZywn4x86TLa2Uaad4c27xdA.jpg'),
(112, '2021-10-03 04:36:21', '2021-10-03 04:36:21', 1, NULL, NULL, NULL, NULL, 'public/FeHlg3011u9JSf9ORpIV37LCDP12nVZ8eOXAv5Br.jpg', NULL, 'public/thumb_FeHlg3011u9JSf9ORpIV37LCDP12nVZ8eOXAv5Br.jpg'),
(113, '2021-10-03 04:44:55', '2021-10-03 04:44:55', 1, NULL, NULL, NULL, NULL, 'public/lqE6hKLhc2al8oVfVqDcCKTWXgqJD1I7Wn4CNMbk.jpg', NULL, 'public/thumb_lqE6hKLhc2al8oVfVqDcCKTWXgqJD1I7Wn4CNMbk.jpg'),
(114, '2021-10-03 04:49:01', '2021-10-03 04:49:01', 1, NULL, NULL, NULL, NULL, 'public/rO81oJc0KtOnSxTt7fzESZg7tMBwPwAmQDkkysW8.jpg', NULL, 'public/thumb_rO81oJc0KtOnSxTt7fzESZg7tMBwPwAmQDkkysW8.jpg'),
(115, '2021-10-05 06:28:48', '2021-10-05 06:28:48', 3, NULL, NULL, NULL, NULL, 'public/UZ1ViUC6zJjHQ7dMcCSnzHv0W7YGjK6W4RcxhN9y.jpg', NULL, 'public/thumb_UZ1ViUC6zJjHQ7dMcCSnzHv0W7YGjK6W4RcxhN9y.jpg'),
(116, '2021-10-05 06:28:49', '2021-10-05 06:28:49', 3, NULL, NULL, NULL, NULL, 'public/xew3iJYzRk8JUQET6A35MYlFfdZsPxN751MUADFr.png', NULL, 'public/thumb_xew3iJYzRk8JUQET6A35MYlFfdZsPxN751MUADFr.png'),
(117, '2021-10-05 06:34:29', '2021-10-05 06:34:29', 3, NULL, NULL, NULL, NULL, 'public/WXjhSyifSfK1GkViPFdvONr2pKGbkeXSilH4SDWq.jpg', NULL, 'public/thumb_WXjhSyifSfK1GkViPFdvONr2pKGbkeXSilH4SDWq.jpg'),
(118, '2021-10-05 06:34:29', '2021-10-05 06:34:29', 3, NULL, NULL, NULL, NULL, 'public/t5QVdLAcyiZknx1qzCT09RKyGu5tiEiCpHpejzEi.png', NULL, 'public/thumb_t5QVdLAcyiZknx1qzCT09RKyGu5tiEiCpHpejzEi.png'),
(119, '2021-10-05 06:35:53', '2021-10-05 06:35:53', 3, NULL, NULL, NULL, NULL, 'public/DvOwJS2CWnrvyQgYjgZ8xqKgYZhlpK6THiPfpxdI.jpg', NULL, 'public/thumb_DvOwJS2CWnrvyQgYjgZ8xqKgYZhlpK6THiPfpxdI.jpg'),
(120, '2021-10-05 06:35:53', '2021-10-05 06:35:53', 3, NULL, NULL, NULL, NULL, 'public/XMuIvMbt4klKzPE8KcAi72T7UxfXkTkUW58GZsGZ.png', NULL, 'public/thumb_XMuIvMbt4klKzPE8KcAi72T7UxfXkTkUW58GZsGZ.png'),
(121, '2021-10-05 06:39:30', '2021-10-05 06:39:30', 3, NULL, NULL, NULL, NULL, 'public/fuMlVlP2Xy26k0PB3LBYGPoJmQGbyDniZU7rmd2B.jpg', NULL, 'public/thumb_fuMlVlP2Xy26k0PB3LBYGPoJmQGbyDniZU7rmd2B.jpg'),
(122, '2021-10-05 06:39:31', '2021-10-05 06:39:31', 3, NULL, NULL, NULL, NULL, 'public/i4SyIbVYgOykndqfrPRGFKLGwlg7CGqst4Gp2jDm.png', NULL, 'public/thumb_i4SyIbVYgOykndqfrPRGFKLGwlg7CGqst4Gp2jDm.png'),
(123, '2021-10-05 06:41:01', '2021-10-05 06:41:01', 3, NULL, NULL, NULL, NULL, 'public/bqweMJi2pZs0szGoPXbszuujgsrkjWMVoZPx64Ba.jpg', NULL, 'public/thumb_bqweMJi2pZs0szGoPXbszuujgsrkjWMVoZPx64Ba.jpg'),
(124, '2021-10-05 06:41:02', '2021-10-05 06:41:02', 3, NULL, NULL, NULL, NULL, 'public/WrxZJd6FRaZGR0t58utOSmk29bGuIkd8c1YyMSHk.png', NULL, 'public/thumb_WrxZJd6FRaZGR0t58utOSmk29bGuIkd8c1YyMSHk.png'),
(125, '2021-10-05 09:25:17', '2021-10-05 09:25:17', 3, NULL, NULL, NULL, NULL, 'public/7xytFFjUv66Li3sJVVUPsTiKIz3q5qTOCh9eO7Sw.jpg', NULL, 'public/thumb_7xytFFjUv66Li3sJVVUPsTiKIz3q5qTOCh9eO7Sw.jpg'),
(126, '2021-10-08 09:58:06', '2021-10-08 09:58:06', 1, NULL, NULL, NULL, NULL, 'public/u5CEoujxGbiIW571W3KkEBeqiKK3rFAjWvM4K0PZ.png', NULL, 'public/thumb_u5CEoujxGbiIW571W3KkEBeqiKK3rFAjWvM4K0PZ.png'),
(127, '2021-10-08 09:58:07', '2021-10-08 09:58:07', 1, NULL, NULL, NULL, NULL, 'public/c3hSY3a6K0UuOhxPaMhv3pgkNee99FscbX6jqk3o.png', NULL, 'public/thumb_c3hSY3a6K0UuOhxPaMhv3pgkNee99FscbX6jqk3o.png'),
(128, '2021-10-09 04:02:42', '2021-10-09 04:02:42', 4, NULL, NULL, NULL, NULL, 'public/8kttt8c3H0WOJ1ITq8gZqetdxGDNU24zuoi4fCxB.jpg', NULL, 'public/8kttt8c3H0WOJ1ITq8gZqetdxGDNU24zuoi4fCxB.jpg'),
(129, '2021-10-09 04:02:42', '2021-10-09 04:02:42', 4, NULL, NULL, NULL, NULL, 'public/u9s5Qne4SUlLe0r2uTWJ4f09HQM1tzI98vpNtVYC.jpg', NULL, 'public/u9s5Qne4SUlLe0r2uTWJ4f09HQM1tzI98vpNtVYC.jpg'),
(130, '2021-10-09 07:35:24', '2021-10-09 07:35:24', 4, NULL, NULL, NULL, NULL, 'public/BzOd4tlCv5ICkPbLzGuKnxO7GPvuJAYq9SQERf2k.jpg', NULL, 'public/BzOd4tlCv5ICkPbLzGuKnxO7GPvuJAYq9SQERf2k.jpg'),
(131, '2021-10-09 07:37:18', '2021-10-09 07:37:18', 4, NULL, NULL, NULL, NULL, 'public/phgmqFncHz5Sa3oGMPzkNXRaCxPVEc16wuekaSET.jpg', NULL, 'public/phgmqFncHz5Sa3oGMPzkNXRaCxPVEc16wuekaSET.jpg'),
(132, '2021-10-09 07:39:44', '2021-10-09 07:39:44', 4, NULL, NULL, NULL, NULL, 'public/5ElBJsgR1OszyajIJWChnZUJJ0B6Ef70lUG26qVT.jpg', NULL, 'public/5ElBJsgR1OszyajIJWChnZUJJ0B6Ef70lUG26qVT.jpg'),
(133, '2021-10-09 10:06:20', '2021-10-09 10:06:20', 4, NULL, NULL, NULL, NULL, 'public/1fDV6hijmmENEYBRntG0i9MJy2ZCe2Ehwo4fBKxg.jpg', NULL, 'public/thumb_1fDV6hijmmENEYBRntG0i9MJy2ZCe2Ehwo4fBKxg.jpg'),
(134, '2021-10-09 10:06:20', '2021-10-09 10:06:20', 4, NULL, NULL, NULL, NULL, 'public/o14VFgXuVXyW16nSCRuHEFOMI4ipQdwop3FWASr4.jpg', NULL, 'public/thumb_o14VFgXuVXyW16nSCRuHEFOMI4ipQdwop3FWASr4.jpg'),
(135, '2021-10-09 10:06:20', '2021-10-09 10:06:20', 4, NULL, NULL, NULL, NULL, 'public/SdCdLjU6plkhEjeFzsjoDPJp8Wpzn6oioD586onc.jpg', NULL, 'public/thumb_SdCdLjU6plkhEjeFzsjoDPJp8Wpzn6oioD586onc.jpg'),
(136, '2021-10-09 10:12:50', '2021-10-09 10:12:50', 4, NULL, NULL, NULL, NULL, 'public/ZyhVsPiNqZDpyvheuttrqUZcz5e4PBz37kjAma6n.jpg', NULL, 'public/thumb_ZyhVsPiNqZDpyvheuttrqUZcz5e4PBz37kjAma6n.jpg'),
(137, '2021-10-09 10:12:50', '2021-10-09 10:12:50', 4, NULL, NULL, NULL, NULL, 'public/uCtEsBeQlISb2WG89QY5vXy13DO5CE0jM9XUZ389.jpg', NULL, 'public/thumb_uCtEsBeQlISb2WG89QY5vXy13DO5CE0jM9XUZ389.jpg'),
(138, '2021-10-09 10:12:50', '2021-10-09 10:12:50', 4, NULL, NULL, NULL, NULL, 'public/tRue2CPErfvVxqwDoZku6X7WIIRCgZWopIUT56Bu.jpg', NULL, 'public/thumb_tRue2CPErfvVxqwDoZku6X7WIIRCgZWopIUT56Bu.jpg'),
(139, '2021-10-09 10:12:50', '2021-10-09 10:12:50', 4, NULL, NULL, NULL, NULL, 'public/NfZr0nDedireIHBiubYWtqmRpb2Yr4APZdVDaltJ.jpg', NULL, 'public/thumb_NfZr0nDedireIHBiubYWtqmRpb2Yr4APZdVDaltJ.jpg'),
(140, '2021-10-09 10:15:23', '2021-10-09 10:15:23', 4, NULL, NULL, NULL, NULL, 'public/UdxxR4BZuAsEUHUp6KDou2ARCOkAYeQqsnmtVJFE.jpg', NULL, 'public/thumb_UdxxR4BZuAsEUHUp6KDou2ARCOkAYeQqsnmtVJFE.jpg'),
(141, '2021-10-09 10:15:23', '2021-10-09 10:15:23', 4, NULL, NULL, NULL, NULL, 'public/qPzsS4lsvz0NxrBdq2ekbFc2rJ4TTl54VoNsxgUA.jpg', NULL, 'public/thumb_qPzsS4lsvz0NxrBdq2ekbFc2rJ4TTl54VoNsxgUA.jpg'),
(142, '2021-10-09 10:15:23', '2021-10-09 10:15:23', 4, NULL, NULL, NULL, NULL, 'public/PQn0bJwWioRhVCXClhxlDpTrXp8xCEney2spliK5.jpg', NULL, 'public/thumb_PQn0bJwWioRhVCXClhxlDpTrXp8xCEney2spliK5.jpg'),
(143, '2021-10-09 10:15:23', '2021-10-09 10:15:23', 4, NULL, NULL, NULL, NULL, 'public/Rg9GWv91Pizy1FLhEjo5Qi5cJxqzqJXgw5iXlhHn.jpg', NULL, 'public/thumb_Rg9GWv91Pizy1FLhEjo5Qi5cJxqzqJXgw5iXlhHn.jpg'),
(144, '2021-10-09 10:20:01', '2021-10-09 10:20:01', 4, NULL, NULL, NULL, NULL, 'public/4WafErFFfVDMjjC4llJACNzaPQdkGzGm5CzDWgy1.jpg', NULL, 'public/thumb_4WafErFFfVDMjjC4llJACNzaPQdkGzGm5CzDWgy1.jpg'),
(145, '2021-10-09 10:20:01', '2021-10-09 10:20:01', 4, NULL, NULL, NULL, NULL, 'public/dKBfXBVPfJ2DVlFyl3eqxpYLz2tql9B30OIXfywC.jpg', NULL, 'public/thumb_dKBfXBVPfJ2DVlFyl3eqxpYLz2tql9B30OIXfywC.jpg'),
(146, '2021-10-09 10:20:01', '2021-10-09 10:20:01', 4, NULL, NULL, NULL, NULL, 'public/ow528ydntjYNosIbrEbk6kyJ0sTMRTeSVWwBP3Q4.jpg', NULL, 'public/thumb_ow528ydntjYNosIbrEbk6kyJ0sTMRTeSVWwBP3Q4.jpg'),
(147, '2021-10-09 10:20:01', '2021-10-09 10:20:01', 4, NULL, NULL, NULL, NULL, 'public/XMtZSkBRtyvHL8H9qSBUHtpB5YNjgLgIs7DpeOs8.jpg', NULL, 'public/thumb_XMtZSkBRtyvHL8H9qSBUHtpB5YNjgLgIs7DpeOs8.jpg'),
(148, '2021-10-09 10:20:42', '2021-10-09 10:20:42', 4, NULL, NULL, NULL, NULL, 'public/ArEHjiO7pbqFzoHfVJz5F3BKNGDO1eqB8UcJmzM4.jpg', NULL, 'public/thumb_ArEHjiO7pbqFzoHfVJz5F3BKNGDO1eqB8UcJmzM4.jpg'),
(149, '2021-10-09 10:20:42', '2021-10-09 10:20:42', 4, NULL, NULL, NULL, NULL, 'public/ObEVfYdFNqlap9RKSLD7q67fna1QeYA4D2aMPqKB.jpg', NULL, 'public/thumb_ObEVfYdFNqlap9RKSLD7q67fna1QeYA4D2aMPqKB.jpg'),
(150, '2021-10-09 10:20:42', '2021-10-09 10:20:42', 4, NULL, NULL, NULL, NULL, 'public/QVhLV62DBq9FRjsEqYRMAFQQRITq0gNktoXs3eoT.jpg', NULL, 'public/thumb_QVhLV62DBq9FRjsEqYRMAFQQRITq0gNktoXs3eoT.jpg'),
(151, '2021-10-09 10:20:42', '2021-10-09 10:20:42', 4, NULL, NULL, NULL, NULL, 'public/N52nBByCqfZWpPazawDYaEElRsFESX0pvCNpLcoR.jpg', NULL, 'public/thumb_N52nBByCqfZWpPazawDYaEElRsFESX0pvCNpLcoR.jpg'),
(152, '2021-10-09 10:25:23', '2021-10-09 10:25:23', 4, NULL, NULL, NULL, NULL, 'public/HsSyk3nfXMm6VvZHyxcTi1x3bOamBeUXYlmcxvMU.jpg', NULL, 'public/thumb_HsSyk3nfXMm6VvZHyxcTi1x3bOamBeUXYlmcxvMU.jpg'),
(153, '2021-10-09 10:25:23', '2021-10-09 10:25:23', 4, NULL, NULL, NULL, NULL, 'public/YnrIssXb7mBsgrO4doL3UgHXuf1zuyB8L8vUevRR.jpg', NULL, 'public/thumb_YnrIssXb7mBsgrO4doL3UgHXuf1zuyB8L8vUevRR.jpg'),
(154, '2021-10-09 10:25:23', '2021-10-09 10:25:23', 4, NULL, NULL, NULL, NULL, 'public/vtBCvERRVjByVe5fX3uHBSbtRLZjHbmt27DMB2Ym.jpg', NULL, 'public/thumb_vtBCvERRVjByVe5fX3uHBSbtRLZjHbmt27DMB2Ym.jpg'),
(155, '2021-10-09 10:25:23', '2021-10-09 10:25:23', 4, NULL, NULL, NULL, NULL, 'public/5caSg5dqo1dBCOcme12l4P4ZcFtpqX8wGjmrcDNY.jpg', NULL, 'public/thumb_5caSg5dqo1dBCOcme12l4P4ZcFtpqX8wGjmrcDNY.jpg'),
(156, '2021-10-09 10:25:23', '2021-10-09 10:25:23', 4, NULL, NULL, NULL, NULL, 'public/wRoIBN2QfTMBCdhdO39f7bm2yd1ioOyxxBGAB4pp.jpg', NULL, 'public/thumb_wRoIBN2QfTMBCdhdO39f7bm2yd1ioOyxxBGAB4pp.jpg'),
(157, '2021-10-09 10:29:42', '2021-10-09 10:29:42', 4, NULL, NULL, NULL, NULL, 'public/d72FimnAleL5EznUhaYCblFJXyPFpCl9DVyWfUEE.jpg', NULL, 'public/thumb_d72FimnAleL5EznUhaYCblFJXyPFpCl9DVyWfUEE.jpg'),
(158, '2021-10-09 10:31:40', '2021-10-09 10:31:40', 4, NULL, NULL, NULL, NULL, 'public/WQpTxoq2XmItywP0YCi9R5wvS36csA4hK4R2zben.jpg', NULL, 'public/thumb_WQpTxoq2XmItywP0YCi9R5wvS36csA4hK4R2zben.jpg'),
(159, '2021-10-12 00:29:54', '2021-10-12 00:29:54', 1, NULL, NULL, NULL, NULL, 'public/MSfR233HSI6T0pJpN3oWZcq9uJAdoddvaRzcTPc9.jpg', NULL, 'public/thumb_MSfR233HSI6T0pJpN3oWZcq9uJAdoddvaRzcTPc9.jpg'),
(160, '2021-10-12 00:29:54', '2021-10-12 00:29:54', 1, NULL, NULL, NULL, NULL, 'public/RS3yxg8eUUVpe5bOk6SipfXjE27NCfpAxdMmIove.jpg', NULL, 'public/thumb_RS3yxg8eUUVpe5bOk6SipfXjE27NCfpAxdMmIove.jpg'),
(161, '2021-10-12 00:41:47', '2021-10-12 00:41:47', 7, NULL, NULL, NULL, NULL, 'public/DtF0R95cJY5ElTAbuEv4A9y43uLPkYxBAtb39qUu.jpg', NULL, 'public/thumb_DtF0R95cJY5ElTAbuEv4A9y43uLPkYxBAtb39qUu.jpg'),
(162, '2021-10-12 00:41:47', '2021-10-12 00:41:47', 7, NULL, NULL, NULL, NULL, 'public/ZRhJUBTNEfh5mGkI1vX5L0GeUA4BiFkGZpRrMSUy.jpg', NULL, 'public/thumb_ZRhJUBTNEfh5mGkI1vX5L0GeUA4BiFkGZpRrMSUy.jpg'),
(163, '2021-10-12 04:21:53', '2021-10-12 04:21:53', 7, NULL, NULL, NULL, NULL, 'public/TSqSnwKHbbdRLHU9Yxtq9B65ttzR4PHvPN6OBic2.jpg', NULL, 'public/thumb_TSqSnwKHbbdRLHU9Yxtq9B65ttzR4PHvPN6OBic2.jpg'),
(164, '2021-10-12 04:21:53', '2021-10-12 04:21:53', 7, NULL, NULL, NULL, NULL, 'public/I53tP9P405R7R5U5B4Wn4uOj5mNGyHfzj7y68NZi.jpg', NULL, 'public/thumb_I53tP9P405R7R5U5B4Wn4uOj5mNGyHfzj7y68NZi.jpg'),
(165, '2021-10-12 04:21:54', '2021-10-12 04:21:54', 7, NULL, NULL, NULL, NULL, 'public/oYZb6ZjpqdF6oBoreVJ3TKXhmtbaBsTwIB0s1rqz.jpg', NULL, 'public/thumb_oYZb6ZjpqdF6oBoreVJ3TKXhmtbaBsTwIB0s1rqz.jpg'),
(166, '2021-10-12 04:21:54', '2021-10-12 04:21:54', 7, NULL, NULL, NULL, NULL, 'public/75Xai7X4pGbaXSplCyNO5Tk99AjZAicnfFxIyJJa.jpg', NULL, 'public/thumb_75Xai7X4pGbaXSplCyNO5Tk99AjZAicnfFxIyJJa.jpg'),
(167, '2021-10-12 04:21:54', '2021-10-12 04:21:54', 7, NULL, NULL, NULL, NULL, 'public/KE5Fy2XjNpYiFim4xxiMCXY9HA7huGr0quSA2mfl.jpg', NULL, 'public/thumb_KE5Fy2XjNpYiFim4xxiMCXY9HA7huGr0quSA2mfl.jpg'),
(168, '2021-10-12 04:21:54', '2021-10-12 04:21:54', 7, NULL, NULL, NULL, NULL, 'public/auzfiQ8NENZmOHIC6PXec0CF1AUf2QKVWqFw1a6W.jpg', NULL, 'public/thumb_auzfiQ8NENZmOHIC6PXec0CF1AUf2QKVWqFw1a6W.jpg'),
(169, '2021-10-12 09:11:51', '2021-10-12 09:11:51', 7, NULL, NULL, NULL, NULL, 'public/SvkVBd5MhiX8WQvzVRUyrxiOo5SJyZTYEutz0Xdj.png', NULL, 'public/thumb_SvkVBd5MhiX8WQvzVRUyrxiOo5SJyZTYEutz0Xdj.png'),
(170, '2021-10-12 09:11:52', '2021-10-12 09:11:52', 7, NULL, NULL, NULL, NULL, 'public/gU1MFgyD5nwuESpHAwhDJme96EuxABy3Ad0yvV9O.webp', NULL, 'public/thumb_gU1MFgyD5nwuESpHAwhDJme96EuxABy3Ad0yvV9O.webp'),
(171, '2021-10-13 11:15:14', '2021-10-13 11:15:14', 7, NULL, NULL, NULL, NULL, 'Ger4vsSBwHvkOP0Ies4Y9B8g2sJh2fQHz98FWwpW.jpg', NULL, 'Ger4vsSBwHvkOP0Ies4Y9B8g2sJh2fQHz98FWwpW.jpg'),
(172, '2021-10-14 14:16:24', '2021-10-14 14:16:24', 7, NULL, NULL, NULL, NULL, '5X4XlDxjzTvdB02pgsUBHEpBEpp3McJemLAbfsgT.jpg', NULL, '5X4XlDxjzTvdB02pgsUBHEpBEpp3McJemLAbfsgT.jpg'),
(173, '2021-10-14 14:16:24', '2021-10-14 14:16:24', 7, NULL, NULL, NULL, NULL, 'ekO2huBrwNKSeySJ7Q0h92WVtD4rb0FTGjXCimCd.jpg', NULL, 'ekO2huBrwNKSeySJ7Q0h92WVtD4rb0FTGjXCimCd.jpg'),
(174, '2021-10-14 14:16:24', '2021-10-14 14:16:24', 7, NULL, NULL, NULL, NULL, 'Oe0ot9L3U7WmgQwsrDzKCkmWLGe0VHnrczJnpHAA.jpg', NULL, 'Oe0ot9L3U7WmgQwsrDzKCkmWLGe0VHnrczJnpHAA.jpg'),
(175, '2021-10-14 15:01:58', '2021-10-14 15:01:58', 7, NULL, NULL, NULL, NULL, 'La4K5i2rnySnb1dp2gQZwLtIHaXRuv57buwa8EIz.jpg', NULL, 'thumb_La4K5i2rnySnb1dp2gQZwLtIHaXRuv57buwa8EIz.jpg'),
(176, '2021-10-14 15:31:48', '2021-10-14 15:31:48', 7, NULL, NULL, NULL, NULL, 'hANw7RVEOocoiiQNZe2ttT3d0rTkWGuxk2PvPSDz.jpg', NULL, 'thumb_hANw7RVEOocoiiQNZe2ttT3d0rTkWGuxk2PvPSDz.jpg'),
(177, '2021-10-14 15:31:48', '2021-10-14 15:31:48', 7, NULL, NULL, NULL, NULL, 'eOuBBzNOfvqI7F6VfrZ5kGChDNeK5JSEi4te02FX.jpg', NULL, 'thumb_eOuBBzNOfvqI7F6VfrZ5kGChDNeK5JSEi4te02FX.jpg'),
(178, '2021-10-14 15:31:48', '2021-10-14 15:31:48', 7, NULL, NULL, NULL, NULL, 'O75AMuFj3DJ7eWvkFstfkOMQE5Jne9sfpajaJ08g.jpg', NULL, 'thumb_O75AMuFj3DJ7eWvkFstfkOMQE5Jne9sfpajaJ08g.jpg'),
(179, '2021-10-14 15:31:48', '2021-10-14 15:31:48', 7, NULL, NULL, NULL, NULL, 'uId0fvmi41CBQVIO0hrYBnyBV9stOVNimXmXuAKY.jpg', NULL, 'thumb_uId0fvmi41CBQVIO0hrYBnyBV9stOVNimXmXuAKY.jpg'),
(180, '2021-10-15 03:19:55', '2021-10-15 03:19:55', 7, NULL, NULL, NULL, NULL, 'vXIutIMJDgw7Kn6FknEeB9tI5lAwUnE0QC1c0jUh.jpg', NULL, 'thumb_vXIutIMJDgw7Kn6FknEeB9tI5lAwUnE0QC1c0jUh.jpg'),
(181, '2021-10-15 03:32:02', '2021-10-15 03:32:02', 7, NULL, NULL, NULL, NULL, '3BKqoOlWJrxJKwiyWDQbNob7cVEKJaz1L0VpXgK9.jpg', NULL, 'thumb_3BKqoOlWJrxJKwiyWDQbNob7cVEKJaz1L0VpXgK9.jpg'),
(182, '2021-10-16 05:10:24', '2021-10-16 05:10:24', 8, NULL, NULL, NULL, NULL, 'vDsosTKY2OtGTraUMPRH2kw1OB55ueEU5xGKVrYE.png', NULL, 'thumb_vDsosTKY2OtGTraUMPRH2kw1OB55ueEU5xGKVrYE.png'),
(183, '2021-10-16 05:10:24', '2021-10-16 05:10:24', 8, NULL, NULL, NULL, NULL, 'ys1SjJCGFphEdLIBvYgygQEskcZQzzv42qekFqln.png', NULL, 'thumb_ys1SjJCGFphEdLIBvYgygQEskcZQzzv42qekFqln.png'),
(184, '2021-10-16 05:14:32', '2021-10-16 05:14:32', 8, NULL, NULL, NULL, NULL, 'bATS3dE1p3uKpY5AP64nrq5swhTOJ58OFjoasB8S.jpg', NULL, 'thumb_bATS3dE1p3uKpY5AP64nrq5swhTOJ58OFjoasB8S.jpg'),
(185, '2021-10-16 05:14:32', '2021-10-16 05:14:32', 8, NULL, NULL, NULL, NULL, 'IkZfVexGADyK5du9dPGxQuV4pZzNyrLKZe97Jqod.jpg', NULL, 'thumb_IkZfVexGADyK5du9dPGxQuV4pZzNyrLKZe97Jqod.jpg'),
(186, '2021-10-16 05:14:33', '2021-10-16 05:14:33', 8, NULL, NULL, NULL, NULL, 'm2JED1Aa5x31NmPBzF9yrwlj1YxDHnxcB861K3pD.jpg', NULL, 'thumb_m2JED1Aa5x31NmPBzF9yrwlj1YxDHnxcB861K3pD.jpg'),
(187, '2021-10-16 05:14:33', '2021-10-16 05:14:33', 8, NULL, NULL, NULL, NULL, 'Yh8mmeN8fa8mb8ozyt0DtqxDg4As8TEe1i8VXZlx.jpg', NULL, 'thumb_Yh8mmeN8fa8mb8ozyt0DtqxDg4As8TEe1i8VXZlx.jpg'),
(188, '2021-10-17 16:40:24', '2021-10-17 16:40:24', 7, NULL, NULL, NULL, NULL, 'QNbjfWYDGJIL2QMNW2C99G38DZQzUeTE3KKIw7vr.jpg', NULL, 'thumb_QNbjfWYDGJIL2QMNW2C99G38DZQzUeTE3KKIw7vr.jpg'),
(189, '2021-10-24 02:50:52', '2021-10-24 02:50:52', 9, NULL, NULL, NULL, NULL, 'URyM5N3sifOxu0oBMsTeKfoNLUTl5Dn0uuBoxXwH.jpg', NULL, 'thumb_URyM5N3sifOxu0oBMsTeKfoNLUTl5Dn0uuBoxXwH.jpg'),
(190, '2021-10-24 02:50:53', '2021-10-24 02:50:53', 9, NULL, NULL, NULL, NULL, 'RP0lKHgfTd580Mq4rkGLReKyrEOkqUmLSrgD2JhW.jpg', NULL, 'thumb_RP0lKHgfTd580Mq4rkGLReKyrEOkqUmLSrgD2JhW.jpg'),
(191, '2021-10-24 02:52:27', '2021-10-24 02:52:27', 9, NULL, NULL, NULL, NULL, 'DK1fYT4k3m9OF23u3v8vaH1rxH3vhE4MdDz5G6iw.png', NULL, 'thumb_DK1fYT4k3m9OF23u3v8vaH1rxH3vhE4MdDz5G6iw.png'),
(192, '2021-10-24 03:00:50', '2021-10-24 03:00:50', 9, NULL, NULL, NULL, NULL, 'APCOF8v6zKdbp9bvgeQeKIyFHEcQp9I3EWRoV898.png', NULL, 'thumb_APCOF8v6zKdbp9bvgeQeKIyFHEcQp9I3EWRoV898.png'),
(193, '2021-10-24 05:54:15', '2021-10-24 05:54:15', 9, NULL, NULL, NULL, NULL, 'sXedeOsKkKO1JvYSsWuJbr7uv9wye8U1d49J2S4W.jpg', NULL, 'thumb_sXedeOsKkKO1JvYSsWuJbr7uv9wye8U1d49J2S4W.jpg'),
(194, '2021-10-24 05:54:15', '2021-10-24 05:54:15', 9, NULL, NULL, NULL, NULL, 'VCdBtLSOceW2JSnkB3dHgpIXsdBmbj4jN7Bar5wW.jpg', NULL, 'thumb_VCdBtLSOceW2JSnkB3dHgpIXsdBmbj4jN7Bar5wW.jpg'),
(195, '2021-10-24 05:54:15', '2021-10-24 05:54:15', 9, NULL, NULL, NULL, NULL, 'wBUPFcIbXRSiBdecCOY0m3TXctUmh4XZYOcasGqR.jpg', NULL, 'thumb_wBUPFcIbXRSiBdecCOY0m3TXctUmh4XZYOcasGqR.jpg'),
(196, '2021-10-24 05:54:15', '2021-10-24 05:54:15', 9, NULL, NULL, NULL, NULL, 'EBCnl6bATADWTsDxqYY4tDgmAuhtetkBXlvVaQD9.jpg', NULL, 'thumb_EBCnl6bATADWTsDxqYY4tDgmAuhtetkBXlvVaQD9.jpg'),
(197, '2021-10-24 05:54:15', '2021-10-24 05:54:15', 9, NULL, NULL, NULL, NULL, 'JsEcIiSjL8ZFaeTz0qe9X63nPdlUWcU9rRVNIyW2.jpg', NULL, 'thumb_JsEcIiSjL8ZFaeTz0qe9X63nPdlUWcU9rRVNIyW2.jpg'),
(198, '2021-10-24 05:54:15', '2021-10-24 05:54:15', 9, NULL, NULL, NULL, NULL, 'imMGAdSo67H2zgQ0K0QuyMKHVPlQ1Yga4fZQM9I6.jpg', NULL, 'thumb_imMGAdSo67H2zgQ0K0QuyMKHVPlQ1Yga4fZQM9I6.jpg'),
(199, '2021-10-24 05:54:15', '2021-10-24 05:54:15', 9, NULL, NULL, NULL, NULL, '72Poo4vszpHGu6C2Ef6p8K1pybzNpKkJoUg6oZCR.jpg', NULL, 'thumb_72Poo4vszpHGu6C2Ef6p8K1pybzNpKkJoUg6oZCR.jpg'),
(200, '2021-10-24 06:00:21', '2021-10-24 06:00:21', 9, NULL, NULL, NULL, NULL, 'osopx9xJRyasNS2Tpm6yRNW7zoReGPyEdJtUSmV8.jpg', NULL, 'thumb_osopx9xJRyasNS2Tpm6yRNW7zoReGPyEdJtUSmV8.jpg'),
(201, '2021-10-24 06:00:21', '2021-10-24 06:00:21', 9, NULL, NULL, NULL, NULL, 'y0FaWI0UvzBVJT31eRjkGlq4Jtw31Me9Wkmc4a7o.jpg', NULL, 'thumb_y0FaWI0UvzBVJT31eRjkGlq4Jtw31Me9Wkmc4a7o.jpg'),
(202, '2021-10-24 06:00:21', '2021-10-24 06:00:21', 9, NULL, NULL, NULL, NULL, 'm87krwYW6Q8TPRsVEdrZyYFQ4D12WA9rdQ7Q3dAh.jpg', NULL, 'thumb_m87krwYW6Q8TPRsVEdrZyYFQ4D12WA9rdQ7Q3dAh.jpg'),
(203, '2021-10-24 06:00:21', '2021-10-24 06:00:21', 9, NULL, NULL, NULL, NULL, 'abNt7Ox5TvFdnWdkAHYvc2k5WCMFFKMYARdBySiP.jpg', NULL, 'thumb_abNt7Ox5TvFdnWdkAHYvc2k5WCMFFKMYARdBySiP.jpg'),
(204, '2021-10-24 06:00:21', '2021-10-24 06:00:21', 9, NULL, NULL, NULL, NULL, 'inQ11eGXlkG8xJscJ6xTZIlDcE78bogTnnwDgChs.jpg', NULL, 'thumb_inQ11eGXlkG8xJscJ6xTZIlDcE78bogTnnwDgChs.jpg'),
(205, '2021-10-24 06:00:21', '2021-10-24 06:00:21', 9, NULL, NULL, NULL, NULL, '3TXvxQ2jjDBQDpIRTwWeyr3Ce12SmhYaS13LFsiu.jpg', NULL, 'thumb_3TXvxQ2jjDBQDpIRTwWeyr3Ce12SmhYaS13LFsiu.jpg'),
(206, '2021-10-24 06:00:21', '2021-10-24 06:00:21', 9, NULL, NULL, NULL, NULL, 'EK4WNwezoj4B3R0qT6gKV4BssQnWVVE7KGZew6SJ.jpg', NULL, 'thumb_EK4WNwezoj4B3R0qT6gKV4BssQnWVVE7KGZew6SJ.jpg'),
(207, '2021-10-24 06:00:21', '2021-10-24 06:00:21', 9, NULL, NULL, NULL, NULL, 'CnGRMirDcDpcdZu0Gwnuf0LBf0acJqGvjsxWfM3r.jpg', NULL, 'thumb_CnGRMirDcDpcdZu0Gwnuf0LBf0acJqGvjsxWfM3r.jpg'),
(208, '2021-10-24 06:05:31', '2021-10-24 06:05:31', 9, NULL, NULL, NULL, NULL, 'hWTSNpOVowv3fXUGY0hB6sIekieDMji7RnbIqqIl.jpg', NULL, 'thumb_hWTSNpOVowv3fXUGY0hB6sIekieDMji7RnbIqqIl.jpg'),
(209, '2021-10-24 06:05:31', '2021-10-24 06:05:31', 9, NULL, NULL, NULL, NULL, 'WCLyOM3YsLhWogckdGLLx2Xe0YJwblCCmzFx09iN.jpg', NULL, 'thumb_WCLyOM3YsLhWogckdGLLx2Xe0YJwblCCmzFx09iN.jpg'),
(210, '2021-10-24 06:05:31', '2021-10-24 06:05:31', 9, NULL, NULL, NULL, NULL, 'EZlF2A7zd0LOBnrivSJPGuy5tEHlwNb05MyTEQZ8.jpg', NULL, 'thumb_EZlF2A7zd0LOBnrivSJPGuy5tEHlwNb05MyTEQZ8.jpg'),
(211, '2021-10-24 06:05:31', '2021-10-24 06:05:31', 9, NULL, NULL, NULL, NULL, 'N5vfY4yyTK4uab1zfgp1rNqaGtQgbA6d1rOAndag.jpg', NULL, 'thumb_N5vfY4yyTK4uab1zfgp1rNqaGtQgbA6d1rOAndag.jpg'),
(212, '2021-10-24 06:05:32', '2021-10-24 06:05:32', 9, NULL, NULL, NULL, NULL, 'Y5OBBVjubiRmPExMQj7KjWqB0nwQpgNtj4we5mmM.jpg', NULL, 'thumb_Y5OBBVjubiRmPExMQj7KjWqB0nwQpgNtj4we5mmM.jpg'),
(213, '2021-10-24 06:05:32', '2021-10-24 06:05:32', 9, NULL, NULL, NULL, NULL, 'RnwsIUHtQrh254qKG7shsMp1U1mr5hSbAJBR2tq2.jpg', NULL, 'thumb_RnwsIUHtQrh254qKG7shsMp1U1mr5hSbAJBR2tq2.jpg'),
(214, '2021-10-24 06:05:32', '2021-10-24 06:05:32', 9, NULL, NULL, NULL, NULL, 'CflUNjI1hpyteD7Wxur6tu258QeVMkmn4N5eTmN8.jpg', NULL, 'thumb_CflUNjI1hpyteD7Wxur6tu258QeVMkmn4N5eTmN8.jpg'),
(215, '2021-11-04 14:56:59', '2021-11-04 14:56:59', 11, NULL, NULL, NULL, NULL, 'tjYYdzXRuBBtwu9geB6gd30kAUUdcVePwmzVltwa.png', NULL, 'thumb_tjYYdzXRuBBtwu9geB6gd30kAUUdcVePwmzVltwa.png'),
(216, '2021-11-04 14:56:59', '2021-11-04 14:56:59', 11, NULL, NULL, NULL, NULL, 'XZyBp6pm0qdXbBZmeGqHKphN3zx4FsxPxyO6UbfV.png', NULL, 'thumb_XZyBp6pm0qdXbBZmeGqHKphN3zx4FsxPxyO6UbfV.png'),
(217, '2021-11-04 14:58:28', '2021-11-04 14:58:28', 11, NULL, NULL, NULL, NULL, 'a8s70VQbsecXIJswRGWG0I0CVPrv6KjOn2UMMCu0.png', NULL, 'thumb_a8s70VQbsecXIJswRGWG0I0CVPrv6KjOn2UMMCu0.png'),
(218, '2021-11-04 14:58:28', '2021-11-04 14:58:28', 11, NULL, NULL, NULL, NULL, 'uBIvMH4TKA1uBiBsI04E6LcbEtfhaJQ2NsXD2an4.png', NULL, 'thumb_uBIvMH4TKA1uBiBsI04E6LcbEtfhaJQ2NsXD2an4.png'),
(219, '2021-11-04 14:59:00', '2021-11-04 14:59:00', 11, NULL, NULL, NULL, NULL, 'UTinGLEiVi74ArYAUPJVgzw2gLxJKyZZLxL1bJBc.png', NULL, 'thumb_UTinGLEiVi74ArYAUPJVgzw2gLxJKyZZLxL1bJBc.png'),
(220, '2021-11-04 14:59:00', '2021-11-04 14:59:00', 11, NULL, NULL, NULL, NULL, 'lOdnJv20SkbYlXCXri8lxM1iuxcRCaC5K46wMI7t.png', NULL, 'thumb_lOdnJv20SkbYlXCXri8lxM1iuxcRCaC5K46wMI7t.png'),
(221, '2021-11-05 09:31:54', '2021-11-05 09:31:54', 12, NULL, NULL, NULL, NULL, 'bytjx4r5b6sezWMDQiRf5UpX5dDPHdD7YxaVEJ1V.jpg', NULL, 'thumb_bytjx4r5b6sezWMDQiRf5UpX5dDPHdD7YxaVEJ1V.jpg'),
(222, '2021-11-05 09:31:54', '2021-11-05 09:31:54', 12, NULL, NULL, NULL, NULL, 'Mg9pGEvj2BaA6WqTJxIypGdfYXMzzGShQ5EKuM97.jpg', NULL, 'thumb_Mg9pGEvj2BaA6WqTJxIypGdfYXMzzGShQ5EKuM97.jpg'),
(223, '2021-11-05 09:31:56', '2021-11-05 09:31:56', 12, NULL, NULL, NULL, NULL, '7cuGTXEU5v31WaMOM0K063jlNI1Qw1juTslB4JN5.jpg', NULL, 'thumb_7cuGTXEU5v31WaMOM0K063jlNI1Qw1juTslB4JN5.jpg'),
(224, '2021-11-05 09:31:56', '2021-11-05 09:31:56', 12, NULL, NULL, NULL, NULL, 'AX8837sXMf5MYbi7FsGQwsaVFCJGrvl0MjDwTWpR.jpg', NULL, 'thumb_AX8837sXMf5MYbi7FsGQwsaVFCJGrvl0MjDwTWpR.jpg'),
(225, '2021-11-05 20:53:09', '2021-11-05 20:53:09', 12, NULL, NULL, NULL, NULL, 'TbjKdfR52L3VxxMXcWmGpNmd8Xbc4uACLpL8CNk7.html', NULL, 'TbjKdfR52L3VxxMXcWmGpNmd8Xbc4uACLpL8CNk7.html'),
(226, '2021-11-05 20:53:09', '2021-11-05 20:53:09', 12, NULL, NULL, NULL, NULL, 'dERVYUhk7Rix3bfySGxk7yNmxSlJHahpVLIqomXG.html', NULL, 'dERVYUhk7Rix3bfySGxk7yNmxSlJHahpVLIqomXG.html'),
(227, '2021-11-05 20:53:10', '2021-11-05 20:53:10', 12, NULL, NULL, NULL, NULL, 'omGiCsPQMIuiAfv2X3QlV6gronXRUE5JxaafA8HL.jpg', NULL, 'thumb_omGiCsPQMIuiAfv2X3QlV6gronXRUE5JxaafA8HL.jpg'),
(228, '2021-11-05 20:53:12', '2021-11-05 20:53:12', 12, NULL, NULL, NULL, NULL, 'n6mrboxZTrRhO3CvrFTJywioXfKVmnl0KeHAcQFk.jpg', NULL, 'thumb_n6mrboxZTrRhO3CvrFTJywioXfKVmnl0KeHAcQFk.jpg'),
(229, '2021-11-05 20:54:06', '2021-11-05 20:54:06', 12, NULL, NULL, NULL, NULL, 'XRzJdG6hG8ibArNZD2NNBEyoANq23HwFztZOdgtR.html', NULL, 'XRzJdG6hG8ibArNZD2NNBEyoANq23HwFztZOdgtR.html'),
(230, '2021-11-05 20:54:06', '2021-11-05 20:54:06', 12, NULL, NULL, NULL, NULL, 'rudgcHcSeAduanVIwJn9B4Kcdip0wBnhbPdiN9Ay.html', NULL, 'rudgcHcSeAduanVIwJn9B4Kcdip0wBnhbPdiN9Ay.html'),
(231, '2021-11-05 20:54:07', '2021-11-05 20:54:07', 12, NULL, NULL, NULL, NULL, '1BMWoRbaQhq2MVKJaL3U5uzhOvgbLCCXXCX6PEhN.jpg', NULL, 'thumb_1BMWoRbaQhq2MVKJaL3U5uzhOvgbLCCXXCX6PEhN.jpg'),
(232, '2021-11-05 20:54:10', '2021-11-05 20:54:10', 12, NULL, NULL, NULL, NULL, 'Xd7whw5PaqmxjK6eY1Q1OAk6d67LM7sOegs7nR88.jpg', NULL, 'thumb_Xd7whw5PaqmxjK6eY1Q1OAk6d67LM7sOegs7nR88.jpg'),
(233, '2021-11-05 20:55:05', '2021-11-05 20:55:05', 12, NULL, NULL, NULL, NULL, 'DEtBhfDcBZWWvO4xZTfDEEu6TiJ6scK4dbmQIRDN.html', NULL, 'DEtBhfDcBZWWvO4xZTfDEEu6TiJ6scK4dbmQIRDN.html'),
(234, '2021-11-05 20:55:05', '2021-11-05 20:55:05', 12, NULL, NULL, NULL, NULL, 'UEa2oT02b8qfUDOZBHXB8Mkxr4oOnEChSDm1PgM7.html', NULL, 'UEa2oT02b8qfUDOZBHXB8Mkxr4oOnEChSDm1PgM7.html'),
(235, '2021-11-05 20:55:06', '2021-11-05 20:55:06', 12, NULL, NULL, NULL, NULL, 'h1krWMhUtfKrITWrt0mGKQuhpT9qDtc9qE9caKjX.jpg', NULL, 'thumb_h1krWMhUtfKrITWrt0mGKQuhpT9qDtc9qE9caKjX.jpg'),
(236, '2021-11-05 20:55:07', '2021-11-05 20:55:07', 12, NULL, NULL, NULL, NULL, 'RwanLEWN47gdxvz8GVi6euw4BhiFvOMp07772rVZ.jpg', NULL, 'thumb_RwanLEWN47gdxvz8GVi6euw4BhiFvOMp07772rVZ.jpg'),
(237, '2021-11-11 10:48:53', '2021-11-11 10:48:53', 12, NULL, NULL, NULL, NULL, 'I4sJgQJkhYDCRtBuFQPLWyXkxiN9abe5ZpDwN5mz.png', NULL, 'thumb_I4sJgQJkhYDCRtBuFQPLWyXkxiN9abe5ZpDwN5mz.png'),
(238, '2021-11-11 10:48:54', '2021-11-11 10:48:54', 12, NULL, NULL, NULL, NULL, 'N4VYictlqsc569GYCaxNmGTTnrayJfg8DvqwTxqY.png', NULL, 'thumb_N4VYictlqsc569GYCaxNmGTTnrayJfg8DvqwTxqY.png'),
(239, '2021-11-11 10:48:55', '2021-11-11 10:48:55', 12, NULL, NULL, NULL, NULL, 'eoAKAoGVMdNg21MibMklSj72cVd6Da2wIHZB7abi.png', NULL, 'thumb_eoAKAoGVMdNg21MibMklSj72cVd6Da2wIHZB7abi.png'),
(240, '2021-11-14 08:14:50', '2021-11-14 08:14:50', 12, NULL, NULL, NULL, NULL, 'maJRpmiJd0g3XY5C0ilSLjqzJhqEWkUSnp3hY9rP.png', NULL, 'thumb_maJRpmiJd0g3XY5C0ilSLjqzJhqEWkUSnp3hY9rP.png'),
(241, '2021-11-14 08:14:52', '2021-11-14 08:14:52', 12, NULL, NULL, NULL, NULL, 'SSq8OOwyFPSlPhRhfk8MITsJymUvz2GAfZfg7Tfd.png', NULL, 'thumb_SSq8OOwyFPSlPhRhfk8MITsJymUvz2GAfZfg7Tfd.png'),
(242, '2021-11-14 08:14:53', '2021-11-14 08:14:53', 12, NULL, NULL, NULL, NULL, 'mQcUk7fRRZGpLZivTQJM6Fwunk1yoQ3JTMAlm7rm.png', NULL, 'thumb_mQcUk7fRRZGpLZivTQJM6Fwunk1yoQ3JTMAlm7rm.png'),
(243, '2021-11-24 20:03:21', '2021-11-24 20:03:21', 12, NULL, NULL, NULL, NULL, '21I3usMLVBTWjOs1G2jfIQpGybGlxOs7DeovY939.png', NULL, 'thumb_21I3usMLVBTWjOs1G2jfIQpGybGlxOs7DeovY939.png'),
(244, '2021-11-26 03:13:54', '2021-11-26 03:13:54', 13, NULL, NULL, NULL, NULL, 'GqCptgNOGDpUKAHwT0BNv1mbMPp4z1jnMjQhpDw3.jpg', NULL, 'thumb_GqCptgNOGDpUKAHwT0BNv1mbMPp4z1jnMjQhpDw3.jpg'),
(245, '2021-11-26 03:13:54', '2021-11-26 03:13:54', 13, NULL, NULL, NULL, NULL, '90M0l5CZ9W06oPr03FvxhODa5FOO5GwvM2BW4IOM.jpg', NULL, 'thumb_90M0l5CZ9W06oPr03FvxhODa5FOO5GwvM2BW4IOM.jpg'),
(246, '2021-11-26 03:14:07', '2021-11-26 03:14:07', 13, NULL, NULL, NULL, NULL, 'zrfTUy1igKDWijuhU2r4qHr90gUD5TRZCPq4o3Mq.jpg', NULL, 'thumb_zrfTUy1igKDWijuhU2r4qHr90gUD5TRZCPq4o3Mq.jpg'),
(247, '2021-11-26 03:14:07', '2021-11-26 03:14:07', 13, NULL, NULL, NULL, NULL, 'LPKcdRvsZtACcRxbvJO1DlPpgUaoCjvt89FLWdoV.jpg', NULL, 'thumb_LPKcdRvsZtACcRxbvJO1DlPpgUaoCjvt89FLWdoV.jpg'),
(248, '2021-11-26 17:22:20', '2021-11-26 17:22:20', 15, NULL, NULL, NULL, NULL, 'RDmtJU1yoE6dhNNuUOr0TXkHKQbiD743Og888mAx.jpg', NULL, 'thumb_RDmtJU1yoE6dhNNuUOr0TXkHKQbiD743Og888mAx.jpg'),
(249, '2021-11-26 17:22:22', '2021-11-26 17:22:22', 15, NULL, NULL, NULL, NULL, '2x16IS7tl6ROZWSYbI6gjWOP4AcKjLbdY59OH5d0.png', NULL, 'thumb_2x16IS7tl6ROZWSYbI6gjWOP4AcKjLbdY59OH5d0.png'),
(250, '2021-11-26 17:32:32', '2021-11-26 17:32:32', 15, NULL, NULL, NULL, NULL, 'ypySBW5JWq8SCHfmxpQcZaIyEwzw7WMXT9IgRH2t.png', NULL, 'thumb_ypySBW5JWq8SCHfmxpQcZaIyEwzw7WMXT9IgRH2t.png'),
(251, '2021-12-04 19:11:56', '2021-12-04 19:11:56', 25, NULL, NULL, NULL, NULL, '0FKRpj4xmIaDmrL3Ta8GGy5Ceeeu8akptq8QACMV.png', NULL, 'thumb_0FKRpj4xmIaDmrL3Ta8GGy5Ceeeu8akptq8QACMV.png'),
(252, '2021-12-04 19:11:57', '2021-12-04 19:11:57', 25, NULL, NULL, NULL, NULL, 'kVynYrBsfMiA5Dx81sm8lvT9e2uYXn992yXGUyAa.jpg', NULL, 'thumb_kVynYrBsfMiA5Dx81sm8lvT9e2uYXn992yXGUyAa.jpg'),
(253, '2021-12-04 19:12:17', '2021-12-04 19:12:17', 25, NULL, NULL, NULL, NULL, 'KDEwyuWvamPmLIizm2QFOuluDdg5sPe4zbenW52c.png', NULL, 'thumb_KDEwyuWvamPmLIizm2QFOuluDdg5sPe4zbenW52c.png'),
(254, '2021-12-04 19:12:17', '2021-12-04 19:12:17', 25, NULL, NULL, NULL, NULL, 'wFnSkKFZ9EUiE1eFcq4XimiwusbtBjPMGJn4MOx9.jpg', NULL, 'thumb_wFnSkKFZ9EUiE1eFcq4XimiwusbtBjPMGJn4MOx9.jpg'),
(255, '2021-12-04 19:27:37', '2021-12-04 19:27:37', 25, NULL, NULL, NULL, NULL, '6k5xChJBIUejtOZAwsiKaAy4D95NSgKMIwGujGnF.png', NULL, 'thumb_6k5xChJBIUejtOZAwsiKaAy4D95NSgKMIwGujGnF.png'),
(256, '2021-12-04 19:29:22', '2021-12-04 19:29:22', 25, NULL, NULL, NULL, NULL, 'JCMOVnDvMKoWB6vK42oAW8CPpJe5OuBb2SsBUMkA.png', NULL, 'thumb_JCMOVnDvMKoWB6vK42oAW8CPpJe5OuBb2SsBUMkA.png');
INSERT INTO `images` (`id`, `created_at`, `updated_at`, `user_id`, `product_id`, `size`, `width`, `height`, `src`, `name`, `thumbnail`) VALUES
(257, '2021-12-27 05:23:17', '2021-12-27 05:23:17', 26, NULL, NULL, NULL, NULL, 'U0uX7NrOjivykoBLH9aHYu6HFzL12lxTZttTwwiB.jpg', NULL, 'thumb_U0uX7NrOjivykoBLH9aHYu6HFzL12lxTZttTwwiB.jpg'),
(258, '2021-12-27 05:23:19', '2021-12-27 05:23:19', 26, NULL, NULL, NULL, NULL, '2UoZTQj4BwWWbnMImaW5E0DvvJoL0v3owldoxuJ4.png', NULL, 'thumb_2UoZTQj4BwWWbnMImaW5E0DvvJoL0v3owldoxuJ4.png'),
(259, '2021-12-27 19:11:08', '2021-12-27 19:11:08', 26, NULL, NULL, NULL, NULL, 'y83aOwnhowk2J5nwueJ1bGX4kRh7GbFI4ffYPzBX.jpg', NULL, 'thumb_y83aOwnhowk2J5nwueJ1bGX4kRh7GbFI4ffYPzBX.jpg'),
(260, '2021-12-27 19:16:58', '2021-12-27 19:16:58', 26, NULL, NULL, NULL, NULL, 'vtAqesfC44W8BnPesVqrz6HiTOvannZDR8SrmRm1.jpg', NULL, 'thumb_vtAqesfC44W8BnPesVqrz6HiTOvannZDR8SrmRm1.jpg'),
(261, '2021-12-27 20:29:49', '2021-12-27 20:29:49', 26, NULL, NULL, NULL, NULL, '0xuemxPbeQgsKsUF7sAXKDJOnkb46SCvWBZZJKFL.jpg', NULL, 'thumb_0xuemxPbeQgsKsUF7sAXKDJOnkb46SCvWBZZJKFL.jpg'),
(262, '2021-12-27 20:30:26', '2021-12-27 20:30:26', 26, NULL, NULL, NULL, NULL, 'FIp7QtHqcpcqW9gD3fvyrVbz3DNyjMsjBkZp2GSw.jpg', NULL, 'thumb_FIp7QtHqcpcqW9gD3fvyrVbz3DNyjMsjBkZp2GSw.jpg'),
(263, '2021-12-30 06:15:19', '2021-12-30 06:15:19', 24, NULL, NULL, NULL, NULL, 'MJZN6zFkgoQY5Lj4h6ce0B6Q7JyMzMSEcZLS5GGX.jpg', NULL, 'thumb_MJZN6zFkgoQY5Lj4h6ce0B6Q7JyMzMSEcZLS5GGX.jpg'),
(264, '2022-01-04 05:16:07', '2022-01-04 05:16:07', 24, NULL, NULL, NULL, NULL, 'jlxygaJBDwwgg1GZLONvo2B96qI8RZ2iIHMfkiEu.jpg', NULL, 'thumb_jlxygaJBDwwgg1GZLONvo2B96qI8RZ2iIHMfkiEu.jpg'),
(265, '2022-01-04 05:16:37', '2022-01-04 05:16:37', 24, NULL, NULL, NULL, NULL, 'QpS5Tp2S5yhiYn7iCMFscparuOC6TwkfMtc7dqly.jpg', NULL, 'thumb_QpS5Tp2S5yhiYn7iCMFscparuOC6TwkfMtc7dqly.jpg'),
(266, '2022-01-05 16:58:18', '2022-01-05 16:58:18', 27, NULL, NULL, NULL, NULL, 'j7ZUW8atJejd1uAjVzOq4WSBeApTAVETxKOEfa7g.jpg', NULL, 'thumb_j7ZUW8atJejd1uAjVzOq4WSBeApTAVETxKOEfa7g.jpg'),
(267, '2022-01-05 16:58:18', '2022-01-05 16:58:18', 27, NULL, NULL, NULL, NULL, 'TgWanUfgMfGva81zs182jQesP2MWFdDMo3kdTCyZ.jpg', NULL, 'thumb_TgWanUfgMfGva81zs182jQesP2MWFdDMo3kdTCyZ.jpg'),
(268, '2022-01-05 17:01:59', '2022-01-05 17:01:59', 27, NULL, NULL, NULL, NULL, 'iQj1kiDVBQR7FwaJA8fm0vEROb4ifcCnJduhNIrl.jpg', NULL, 'thumb_iQj1kiDVBQR7FwaJA8fm0vEROb4ifcCnJduhNIrl.jpg'),
(269, '2022-01-05 17:01:59', '2022-01-05 17:01:59', 27, NULL, NULL, NULL, NULL, 'cvtBTSqIamcUnK3moSbIAcKdxK08MlzaCOKzmyr9.jpg', NULL, 'thumb_cvtBTSqIamcUnK3moSbIAcKdxK08MlzaCOKzmyr9.jpg'),
(270, '2022-01-05 17:02:00', '2022-01-05 17:02:00', 27, NULL, NULL, NULL, NULL, 'DoLlwStztOocYP8SgHXXP450sttKa64PYSmpRqTS.jpg', NULL, 'thumb_DoLlwStztOocYP8SgHXXP450sttKa64PYSmpRqTS.jpg'),
(271, '2022-01-14 12:32:03', '2022-01-14 12:32:03', 28, NULL, NULL, NULL, NULL, 'qYrks22gnSv6EAsJrp3a5ECreogfQpTArfm1sAJP.jpg', NULL, 'thumb_qYrks22gnSv6EAsJrp3a5ECreogfQpTArfm1sAJP.jpg'),
(272, '2022-01-14 12:32:03', '2022-01-14 12:32:03', 28, NULL, NULL, NULL, NULL, 'h1wi7wKHFazcUQVhqmp4kf9xuYtT1euI7hDElWlP.jpg', NULL, 'thumb_h1wi7wKHFazcUQVhqmp4kf9xuYtT1euI7hDElWlP.jpg'),
(273, '2022-01-19 13:21:15', '2022-01-19 13:21:15', 28, NULL, NULL, NULL, NULL, 'sIfYNMEBjjvNxiRPfZp0Ls3E0CKum2dnCoLrxnZ3.jpg', NULL, 'thumb_sIfYNMEBjjvNxiRPfZp0Ls3E0CKum2dnCoLrxnZ3.jpg'),
(274, '2022-01-19 13:42:12', '2022-01-19 13:42:12', 28, NULL, NULL, NULL, NULL, 'BWYQfaJhh6t8VftYAptghYIoKZNiLNsblGNm8eIy.jpg', NULL, 'thumb_BWYQfaJhh6t8VftYAptghYIoKZNiLNsblGNm8eIy.jpg'),
(275, '2022-01-19 14:34:45', '2022-01-19 14:34:45', 28, NULL, NULL, NULL, NULL, '4ZOVtMt4U4tleitPhaITgKCh0dO6vzqx3WzRuyFz.png', NULL, 'thumb_4ZOVtMt4U4tleitPhaITgKCh0dO6vzqx3WzRuyFz.png'),
(276, '2022-01-19 14:38:02', '2022-01-19 14:38:02', 28, NULL, NULL, NULL, NULL, 'UBisFgmLbC8fZwMuBDScpZIQl9fFB7JL3W5jJVo3.jpg', NULL, 'thumb_UBisFgmLbC8fZwMuBDScpZIQl9fFB7JL3W5jJVo3.jpg'),
(277, '2022-01-27 05:52:36', '2022-01-27 05:52:36', 32, NULL, NULL, NULL, NULL, 'YaBeL70VgLUjfAc7HSBTqRSd4Dq8I1uaOvwF7SLv.jpg', NULL, 'thumb_YaBeL70VgLUjfAc7HSBTqRSd4Dq8I1uaOvwF7SLv.jpg'),
(278, '2022-01-27 05:52:36', '2022-01-27 05:52:36', 32, NULL, NULL, NULL, NULL, 'mBElWaNFkxEFE4BHd6LAtHqPxkPzaAXoSwAtp4pO.jpg', NULL, 'thumb_mBElWaNFkxEFE4BHd6LAtHqPxkPzaAXoSwAtp4pO.jpg'),
(279, '2022-01-29 22:53:58', '2022-01-29 22:53:58', 31, NULL, NULL, NULL, NULL, 'U62emL3bFv1We6vByUZgDSAYoHHuuXbbo7Q2xmLA.png', NULL, 'thumb_U62emL3bFv1We6vByUZgDSAYoHHuuXbbo7Q2xmLA.png'),
(280, '2022-01-30 11:59:53', '2022-01-30 11:59:53', 28, NULL, NULL, NULL, NULL, 'vtAWOfk6XLTtxX0lsIjJUcoOsCgLCZn56MrmphAE.jpg', NULL, 'thumb_vtAWOfk6XLTtxX0lsIjJUcoOsCgLCZn56MrmphAE.jpg'),
(281, '2022-01-30 12:03:13', '2022-01-30 12:03:13', 28, NULL, NULL, NULL, NULL, '33zjyRK9wnrHtxdjNj7NFr2AkRdAOqcJK8JGs8hZ.jpg', NULL, 'thumb_33zjyRK9wnrHtxdjNj7NFr2AkRdAOqcJK8JGs8hZ.jpg'),
(282, '2022-01-30 12:21:04', '2022-01-30 12:21:04', 34, NULL, NULL, NULL, NULL, 'Ou1HCtsHJrbyAWTjP4saFjx3CgB0JWpYBKGDDmCF.jpg', NULL, 'thumb_Ou1HCtsHJrbyAWTjP4saFjx3CgB0JWpYBKGDDmCF.jpg'),
(283, '2022-01-30 12:21:04', '2022-01-30 12:21:04', 34, NULL, NULL, NULL, NULL, 'Kl2r90C7eD5v5lcTMnirpfGwHZvw26ij55hCL0gq.jpg', NULL, 'thumb_Kl2r90C7eD5v5lcTMnirpfGwHZvw26ij55hCL0gq.jpg'),
(284, '2022-02-01 06:55:56', '2022-02-01 06:55:56', 35, NULL, NULL, NULL, NULL, '7Ia8nzN5A52JzofjGR95lDUjFnAPiHgxSNjePqrY.png', NULL, 'thumb_7Ia8nzN5A52JzofjGR95lDUjFnAPiHgxSNjePqrY.png'),
(285, '2022-02-01 06:55:56', '2022-02-01 06:55:56', 35, NULL, NULL, NULL, NULL, 'EbMRbJjjGtYi7vKgcPAYgCkompkxcbWrRPiGrYQD.jpg', NULL, 'thumb_EbMRbJjjGtYi7vKgcPAYgCkompkxcbWrRPiGrYQD.jpg'),
(286, '2022-02-06 13:29:00', '2022-02-06 13:29:00', 33, NULL, NULL, NULL, NULL, 'QUWW74I99dxUkQutRPuat7cU8Sg2zlFxIa9pECtL.jpg', NULL, 'thumb_QUWW74I99dxUkQutRPuat7cU8Sg2zlFxIa9pECtL.jpg'),
(287, '2022-02-06 13:48:45', '2022-02-06 13:48:45', 37, NULL, NULL, NULL, NULL, 'gsEF3WKp96uYsEqd3upcXDz2MuHxM5mZsvwN0Jnh.png', NULL, 'thumb_gsEF3WKp96uYsEqd3upcXDz2MuHxM5mZsvwN0Jnh.png'),
(288, '2022-02-06 13:48:45', '2022-02-06 13:48:45', 37, NULL, NULL, NULL, NULL, 'DRMSeJzZI3RGEaFhKAB9huSlXaGx9bTZ0fZZQRap.png', NULL, 'thumb_DRMSeJzZI3RGEaFhKAB9huSlXaGx9bTZ0fZZQRap.png'),
(289, '2022-02-06 13:58:56', '2022-02-06 13:58:56', 37, NULL, NULL, NULL, NULL, '9iTCmPciFJlciX3DKXyk3P7Amk1E1y21sHqCFcGv.png', NULL, 'thumb_9iTCmPciFJlciX3DKXyk3P7Amk1E1y21sHqCFcGv.png'),
(290, '2022-02-06 14:13:22', '2022-02-06 14:13:22', 37, NULL, NULL, NULL, NULL, 'XdtekJW31HeXflUfHjmi3XlSYpAU0mKsIjSsbxqE.jpg', NULL, 'thumb_XdtekJW31HeXflUfHjmi3XlSYpAU0mKsIjSsbxqE.jpg'),
(291, '2022-02-06 14:13:22', '2022-02-06 14:13:22', 37, NULL, NULL, NULL, NULL, 'SeZSsYO7PKbBZHpg6mjTMEdxi2LGLNQyv7Eupsa9.jpg', NULL, 'thumb_SeZSsYO7PKbBZHpg6mjTMEdxi2LGLNQyv7Eupsa9.jpg'),
(292, '2022-02-06 14:16:43', '2022-02-06 14:16:43', 37, NULL, NULL, NULL, NULL, 'RaLlnkN5eGBI5JRHIftrFshGfz3MV3kBJU15AKpJ.png', NULL, 'thumb_RaLlnkN5eGBI5JRHIftrFshGfz3MV3kBJU15AKpJ.png'),
(293, '2022-02-06 14:20:14', '2022-02-06 14:20:14', 37, NULL, NULL, NULL, NULL, '4QvFIVlhmBimmSiqmlYtpxPy3lXMglhP7KkujcV4.png', NULL, 'thumb_4QvFIVlhmBimmSiqmlYtpxPy3lXMglhP7KkujcV4.png'),
(294, '2022-02-06 14:23:40', '2022-02-06 14:23:40', 37, NULL, NULL, NULL, NULL, 'qDXZbVaODtlZinN7vTxdMt3gXdediDhSrjdtuf9m.png', NULL, 'thumb_qDXZbVaODtlZinN7vTxdMt3gXdediDhSrjdtuf9m.png'),
(295, '2022-02-06 14:41:43', '2022-02-06 14:41:43', 40, NULL, NULL, NULL, NULL, 'GJJW53Ai76VpwZS9TUgJJb8f5Wsg0wGKt3T3tU7e.png', NULL, 'thumb_GJJW53Ai76VpwZS9TUgJJb8f5Wsg0wGKt3T3tU7e.png'),
(296, '2022-02-06 14:43:19', '2022-02-06 14:43:19', 40, NULL, NULL, NULL, NULL, 'RK2QvjFbbUH59DSavmlg0m2ackl3S7AAIqqMQIQy.jpg', NULL, 'thumb_RK2QvjFbbUH59DSavmlg0m2ackl3S7AAIqqMQIQy.jpg'),
(297, '2022-02-06 14:48:13', '2022-02-06 14:48:13', 40, NULL, NULL, NULL, NULL, 'SB0Y2kVnf8tJIApo553o13UwEQj5IhDJVCvwNBXs.jpg', NULL, 'thumb_SB0Y2kVnf8tJIApo553o13UwEQj5IhDJVCvwNBXs.jpg'),
(298, '2022-02-06 15:14:10', '2022-02-06 15:14:10', 40, NULL, NULL, NULL, NULL, '1jOsXXWg9xlSMKAAnpN4R5KYVAnJHaUFP7m7BsUa.jpg', NULL, 'thumb_1jOsXXWg9xlSMKAAnpN4R5KYVAnJHaUFP7m7BsUa.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_04_173148_create_admin_tables', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2021_09_05_180305_create_categories_table', 1),
(7, '2021_09_05_180411_create_attributes_table', 1),
(10, '2021_09_18_100139_create_images_table', 2),
(11, '2021_09_15_220048_create_profiles_table', 3),
(13, '2021_09_23_092138_create_cities_table', 5),
(15, '2021_09_23_091308_create_countries_table', 6),
(18, '2021_09_05_211930_create_products_table', 7),
(19, '2021_10_11_095912_create_product_reviews_table', 8),
(21, '2021_10_16_021622_create_chats_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_category_id` int(11) DEFAULT NULL,
  `fixed_price` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `created_at`, `updated_at`, `name`, `category_id`, `user_id`, `country_id`, `city_id`, `price`, `slug`, `status`, `description`, `quantity`, `images`, `thumbnail`, `attributes`, `sub_category_id`, `fixed_price`) VALUES
(25, '2022-02-06 13:29:00', '2022-02-06 13:29:00', 'COMPANY LOGO', 4, 33, 1, 1, '3000', 'company-logo', '0', 'I need a logo for that project', NULL, '[{\"src\":\"QUWW74I99dxUkQutRPuat7cU8Sg2zlFxIa9pECtL.jpg\",\"thumbnail\":\"thumb_QUWW74I99dxUkQutRPuat7cU8Sg2zlFxIa9pECtL.jpg\",\"user_id\":33}]', '{\"src\":\"QUWW74I99dxUkQutRPuat7cU8Sg2zlFxIa9pECtL.jpg\",\"thumbnail\":\"thumb_QUWW74I99dxUkQutRPuat7cU8Sg2zlFxIa9pECtL.jpg\",\"user_id\":33}', '[{\"id\":7,\"name\":\"Negotiable\",\"type\":\"checkbox\",\"options\":\"\",\"is_required\":0,\"units\":null,\"value\":[\"\"]}]', NULL, 1),
(26, '2022-02-06 13:58:56', '2022-02-06 13:58:56', 'Bussiness cards', 8, 37, 1, 1, '15000', 'bussiness-cards', '0', '100 Business cards', NULL, '[{\"src\":\"9iTCmPciFJlciX3DKXyk3P7Amk1E1y21sHqCFcGv.png\",\"thumbnail\":\"thumb_9iTCmPciFJlciX3DKXyk3P7Amk1E1y21sHqCFcGv.png\",\"user_id\":37}]', '{\"src\":\"9iTCmPciFJlciX3DKXyk3P7Amk1E1y21sHqCFcGv.png\",\"thumbnail\":\"thumb_9iTCmPciFJlciX3DKXyk3P7Amk1E1y21sHqCFcGv.png\",\"user_id\":37}', '[{\"id\":11,\"name\":\"Condition\",\"type\":\"radio\",\"options\":\"Laminated,Not Lamianted\",\"is_required\":1,\"units\":null,\"value\":\"Not Lamianted\"},{\"id\":12,\"name\":\"paper type\",\"type\":\"select\",\"options\":\"Artboard,Ivory\",\"is_required\":0,\"units\":\"single\",\"value\":\"Not Lamianted\"},{\"id\":21,\"name\":\"Negotiable\",\"type\":\"checkbox\",\"options\":\"\",\"is_required\":0,\"units\":null,\"value\":[\"\"]}]', NULL, 1),
(27, '2022-02-06 14:13:22', '2022-02-06 14:13:22', 'Name Tags', 25, 37, 1, 1, '10000', 'name-tags', '0', 'company name tags', NULL, '[{\"src\":\"XdtekJW31HeXflUfHjmi3XlSYpAU0mKsIjSsbxqE.jpg\",\"thumbnail\":\"thumb_XdtekJW31HeXflUfHjmi3XlSYpAU0mKsIjSsbxqE.jpg\",\"user_id\":37},{\"src\":\"SeZSsYO7PKbBZHpg6mjTMEdxi2LGLNQyv7Eupsa9.jpg\",\"thumbnail\":\"thumb_SeZSsYO7PKbBZHpg6mjTMEdxi2LGLNQyv7Eupsa9.jpg\",\"user_id\":37}]', '{\"src\":\"XdtekJW31HeXflUfHjmi3XlSYpAU0mKsIjSsbxqE.jpg\",\"thumbnail\":\"thumb_XdtekJW31HeXflUfHjmi3XlSYpAU0mKsIjSsbxqE.jpg\",\"user_id\":37}', '[]', NULL, 1),
(28, '2022-02-06 14:16:43', '2022-02-06 14:16:43', 'Plastic Identity Cards', 39, 37, 1, 1, '15000', 'plastic-identity-cards', '0', 'All kinds of plastic Identity Cards', NULL, '[{\"src\":\"RaLlnkN5eGBI5JRHIftrFshGfz3MV3kBJU15AKpJ.png\",\"thumbnail\":\"thumb_RaLlnkN5eGBI5JRHIftrFshGfz3MV3kBJU15AKpJ.png\",\"user_id\":37}]', '{\"src\":\"RaLlnkN5eGBI5JRHIftrFshGfz3MV3kBJU15AKpJ.png\",\"thumbnail\":\"thumb_RaLlnkN5eGBI5JRHIftrFshGfz3MV3kBJU15AKpJ.png\",\"user_id\":37}', '[{\"id\":60,\"name\":\"Type\",\"type\":\"select\",\"options\":\"Magnetic,Gold,silver,Embossed,White,Chip\",\"is_required\":1,\"units\":null,\"value\":\"White\"}]', NULL, 1),
(29, '2022-02-06 14:20:14', '2022-02-06 14:20:14', 'T- Shirts', 33, 37, 1, 1, '20000', 't-shirts', '0', 'All t-shirt Branding', NULL, '[{\"src\":\"4QvFIVlhmBimmSiqmlYtpxPy3lXMglhP7KkujcV4.png\",\"thumbnail\":\"thumb_4QvFIVlhmBimmSiqmlYtpxPy3lXMglhP7KkujcV4.png\",\"user_id\":37}]', '{\"src\":\"4QvFIVlhmBimmSiqmlYtpxPy3lXMglhP7KkujcV4.png\",\"thumbnail\":\"thumb_4QvFIVlhmBimmSiqmlYtpxPy3lXMglhP7KkujcV4.png\",\"user_id\":37}', '[]', NULL, 1),
(30, '2022-02-06 14:23:40', '2022-02-06 14:23:40', 'Magnetic Stripped Identity Cards', 39, 37, 1, 1, '15000', 'magnetic-stripped-identity-cards', '0', 'Magnetic Stripped  Identity Cards', NULL, '[{\"src\":\"qDXZbVaODtlZinN7vTxdMt3gXdediDhSrjdtuf9m.png\",\"thumbnail\":\"thumb_qDXZbVaODtlZinN7vTxdMt3gXdediDhSrjdtuf9m.png\",\"user_id\":37}]', '{\"src\":\"qDXZbVaODtlZinN7vTxdMt3gXdediDhSrjdtuf9m.png\",\"thumbnail\":\"thumb_qDXZbVaODtlZinN7vTxdMt3gXdediDhSrjdtuf9m.png\",\"user_id\":37}', '[{\"id\":60,\"name\":\"Type\",\"type\":\"select\",\"options\":\"Magnetic,Gold,silver,Embossed,White,Chip\",\"is_required\":1,\"units\":null,\"value\":\"Magnetic\"}]', NULL, 1),
(31, '2022-02-06 14:43:19', '2022-02-06 14:43:19', 'Branded Phone Case', 41, 40, 1, 1, '40000', 'branded-phone-case', '0', 'Phone Cases', NULL, '[{\"src\":\"RK2QvjFbbUH59DSavmlg0m2ackl3S7AAIqqMQIQy.jpg\",\"thumbnail\":\"thumb_RK2QvjFbbUH59DSavmlg0m2ackl3S7AAIqqMQIQy.jpg\",\"user_id\":40}]', '{\"src\":\"RK2QvjFbbUH59DSavmlg0m2ackl3S7AAIqqMQIQy.jpg\",\"thumbnail\":\"thumb_RK2QvjFbbUH59DSavmlg0m2ackl3S7AAIqqMQIQy.jpg\",\"user_id\":40}', '[{\"id\":61,\"name\":\"Phone type\",\"type\":\"text\",\"options\":null,\"is_required\":1,\"units\":null,\"value\":\"Iphone\"}]', NULL, 1),
(32, '2022-02-06 14:48:13', '2022-02-06 14:48:13', 'Branded Hoodies', 42, 40, 1, 1, '45000', 'branded-hoodies', '0', 'Nice Hoodies', NULL, '[{\"src\":\"SB0Y2kVnf8tJIApo553o13UwEQj5IhDJVCvwNBXs.jpg\",\"thumbnail\":\"thumb_SB0Y2kVnf8tJIApo553o13UwEQj5IhDJVCvwNBXs.jpg\",\"user_id\":40}]', '{\"src\":\"SB0Y2kVnf8tJIApo553o13UwEQj5IhDJVCvwNBXs.jpg\",\"thumbnail\":\"thumb_SB0Y2kVnf8tJIApo553o13UwEQj5IhDJVCvwNBXs.jpg\",\"user_id\":40}', '[]', NULL, 1),
(33, '2022-02-06 15:14:10', '2022-02-06 15:14:10', 'Caps', 44, 40, 1, 1, '50000', 'caps', '0', 'Branded Caps', NULL, '[{\"src\":\"1jOsXXWg9xlSMKAAnpN4R5KYVAnJHaUFP7m7BsUa.jpg\",\"thumbnail\":\"thumb_1jOsXXWg9xlSMKAAnpN4R5KYVAnJHaUFP7m7BsUa.jpg\",\"user_id\":40}]', '{\"src\":\"1jOsXXWg9xlSMKAAnpN4R5KYVAnJHaUFP7m7BsUa.jpg\",\"thumbnail\":\"thumb_1jOsXXWg9xlSMKAAnpN4R5KYVAnJHaUFP7m7BsUa.jpg\",\"user_id\":40}', '[]', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `created_at`, `updated_at`, `user_id`, `product_id`, `rating`, `comment`, `reason`, `image`) VALUES
(1, '2021-10-11 09:24:37', '2021-10-11 09:24:37', 4, 1, 5, 'Check the item before you buy\r\n\r\nPay only after collecting item\r\n\r\nBeware of unrealistic offers\r\n\r\nMeet seller at a safe location\r\n\r\nDo not make an abrupt decision\r\n\r\nBe honest with the ad you post', '1', NULL),
(2, '2021-10-11 09:28:56', '2021-10-11 09:28:56', 4, 1, 5, 'Check the item before you buy\r\n\r\nPay only after collecting item\r\n\r\nBeware of unrealistic offers\r\n\r\nMeet seller at a safe location\r\n\r\nDo not make an abrupt decision\r\n\r\nBe honest with the ad you post', '1', NULL),
(3, '2021-10-11 09:29:21', '2021-10-11 09:29:21', 4, 1, 5, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit Non quibusdam harum ipsum dolor cumque quas magni voluptatibus cupiditate minima quis.\r\n\r\n', '1', NULL),
(4, '2021-10-11 09:41:51', '2021-10-11 09:41:51', 4, 1, 5, 'Another simple comment', '2', NULL),
(5, '2021-10-11 09:51:33', '2021-10-11 09:51:33', 4, 1, 3, 'Not happy with your delivery system!', 'Product quality', NULL),
(6, '2021-10-12 04:25:56', '2021-10-12 04:25:56', 7, 8, 4, 'Customer caring was a good one. Thank you!', 'Qoute', NULL),
(7, '2021-12-30 05:25:07', '2021-12-30 05:25:07', 24, 4, 4, 'simple', 'Qoute', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `services` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `division` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_hours` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_seen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `username` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `status_comment` int(11) DEFAULT NULL,
  `country_id` int(11) NOT NULL DEFAULT 1,
  `city_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `created_at`, `updated_at`, `user_id`, `first_name`, `last_name`, `company_name`, `email`, `phone_number`, `location`, `about`, `services`, `longitude`, `latitude`, `division`, `opening_hours`, `profile_photo`, `cover_photo`, `facebook`, `twitter`, `whatsapp`, `youtube`, `instagram`, `last_seen`, `status`, `username`, `linkedin`, `category_id`, `status_comment`, `country_id`, `city_id`) VALUES
(10, '2021-11-05 09:15:12', '2021-11-05 09:51:52', 12, 'Biirah', 'Swaleh', 'JOHN Tech', '+256751685087', '0779755798', 'Kampala Uganda', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dolorem consequatur voluptas eum quis id sequi! Aut aliquid facilis aperiam harum! Ut architecto eum assumenda ratione error unde quae fuga magnam.', NULL, '1677028000', NULL, 'hppts://fb.com', NULL, '{\"src\":\"7cuGTXEU5v31WaMOM0K063jlNI1Qw1juTslB4JN5.jpg\",\"thumbnail\":\"thumb_7cuGTXEU5v31WaMOM0K063jlNI1Qw1juTslB4JN5.jpg\",\"user_id\":12}', '{\"src\":\"AX8837sXMf5MYbi7FsGQwsaVFCJGrvl0MjDwTWpR.jpg\",\"thumbnail\":\"thumb_AX8837sXMf5MYbi7FsGQwsaVFCJGrvl0MjDwTWpR.jpg\",\"user_id\":12}', 'hppts://fb.com', 'hppts://fb.com', 'hppts://fb.com', 'hppts://fb.com', 'hppts://fb.com', '1636115515', '1', 'john-tech696', 'hppts://fb.com', 4, NULL, 1, 1),
(13, '2021-11-26 17:18:55', '2021-11-26 17:25:17', 15, 'Muhindo', 'Mubaraka', 'IUT', 'mubahood361@gmail.com', '+25670663845', 'Kibuli, Kampala, Uganda', 'explain about busines,,', NULL, '14003000900', NULL, 'https://www.facebook.com/ugnews24/', NULL, '{\"src\":\"RDmtJU1yoE6dhNNuUOr0TXkHKQbiD743Og888mAx.jpg\",\"thumbnail\":\"thumb_RDmtJU1yoE6dhNNuUOr0TXkHKQbiD743Og888mAx.jpg\",\"user_id\":15}', '{\"src\":\"2x16IS7tl6ROZWSYbI6gjWOP4AcKjLbdY59OH5d0.png\",\"thumbnail\":\"thumb_2x16IS7tl6ROZWSYbI6gjWOP4AcKjLbdY59OH5d0.png\",\"user_id\":15}', 'https://www.facebook.com/ugnews24/', 'https://www.facebook.com/ugnews24/', 'https://www.facebook.com/ugnews24/', 'https://www.facebook.com/ugnews24/', 'https://www.facebook.com/ugnews24/', '1637958139', '1', 'iut837', 'https://www.facebook.com/ugnews24/', 10, NULL, 1, 1),
(24, '2021-12-04 18:54:27', '2021-12-15 15:38:14', 25, 'Muhindo 1', 'Mubaraka', 'admin', 'mubahood360@gmail.com', '+256706638494', 'Kibuli, Kampala, Uganda', 'simple', NULL, '14003000900', NULL, NULL, NULL, '{\"src\":\"KDEwyuWvamPmLIizm2QFOuluDdg5sPe4zbenW52c.png\",\"thumbnail\":\"thumb_KDEwyuWvamPmLIizm2QFOuluDdg5sPe4zbenW52c.png\",\"user_id\":25}', '{\"src\":\"wFnSkKFZ9EUiE1eFcq4XimiwusbtBjPMGJn4MOx9.jpg\",\"thumbnail\":\"thumb_wFnSkKFZ9EUiE1eFcq4XimiwusbtBjPMGJn4MOx9.jpg\",\"user_id\":25}', NULL, NULL, NULL, NULL, NULL, '1638655936', '1', 'admin', NULL, 4, NULL, 1, 1),
(25, '2021-12-27 04:57:13', '2022-01-04 06:50:53', 26, 'Muhindo', 'Mubaraka', '0123456789', 'mubahood360@gmail.com', '0123456789', 'Kibuli, Kampala, Uganda', '0123456789', NULL, 'romina', NULL, NULL, NULL, '{\"src\":\"U0uX7NrOjivykoBLH9aHYu6HFzL12lxTZttTwwiB.jpg\",\"thumbnail\":\"thumb_U0uX7NrOjivykoBLH9aHYu6HFzL12lxTZttTwwiB.jpg\",\"user_id\":26}', '{\"src\":\"2UoZTQj4BwWWbnMImaW5E0DvvJoL0v3owldoxuJ4.png\",\"thumbnail\":\"thumb_2UoZTQj4BwWWbnMImaW5E0DvvJoL0v3owldoxuJ4.png\",\"user_id\":26}', NULL, NULL, NULL, NULL, NULL, NULL, '1', '0123456789', NULL, 5, NULL, 1, 1),
(26, '2022-01-05 16:54:18', '2022-01-05 16:58:18', 27, 'Muhindo', 'Mubaraka', 'admin', 'mubahood360@gmail.com', '+256706638494', 'Kibuli, Kampala, Uganda', ',nknkn', NULL, 'romina', NULL, NULL, NULL, '{\"src\":\"j7ZUW8atJejd1uAjVzOq4WSBeApTAVETxKOEfa7g.jpg\",\"thumbnail\":\"thumb_j7ZUW8atJejd1uAjVzOq4WSBeApTAVETxKOEfa7g.jpg\",\"user_id\":27}', '{\"src\":\"TgWanUfgMfGva81zs182jQesP2MWFdDMo3kdTCyZ.jpg\",\"thumbnail\":\"thumb_TgWanUfgMfGva81zs182jQesP2MWFdDMo3kdTCyZ.jpg\",\"user_id\":27}', 'https://www.facebook.com/ugnews24/', 'https://www.facebook.com/ugnews24/', 'https://www.facebook.com/ugnews24/', 'https://www.facebook.com/ugnews24/', NULL, NULL, '1', 'admin370', NULL, 6, NULL, 1, 1),
(31, '2022-01-20 16:44:45', '2022-01-20 16:52:35', 31, 'Kleberson', NULL, 'kleberson', 'klb284@gmail.com', '+256 776 983199', 'Kampala', 'We do all kind og branding on:\r\nT-shirts, caps, mugs, hoodies and much more', NULL, 'romina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'kleberson', NULL, 13, NULL, 1, 1),
(32, '2022-01-27 05:49:43', '2022-01-27 05:52:36', 32, 'Muhindo', 'Mubaraka', 'mubahood360@gmail.com', 'mubahood360@gmail.com', '+256706638494', 'Kibuli, Kampala, Uganda', 'simple', NULL, 'romina', NULL, NULL, NULL, '{\"src\":\"YaBeL70VgLUjfAc7HSBTqRSd4Dq8I1uaOvwF7SLv.jpg\",\"thumbnail\":\"thumb_YaBeL70VgLUjfAc7HSBTqRSd4Dq8I1uaOvwF7SLv.jpg\",\"user_id\":32}', '{\"src\":\"mBElWaNFkxEFE4BHd6LAtHqPxkPzaAXoSwAtp4pO.jpg\",\"thumbnail\":\"thumb_mBElWaNFkxEFE4BHd6LAtHqPxkPzaAXoSwAtp4pO.jpg\",\"user_id\":32}', NULL, NULL, NULL, NULL, NULL, NULL, '1', 'mubahood360-at-gmailcom', NULL, 5, NULL, 1, 1),
(35, '2022-02-01 06:10:30', '2022-02-01 06:55:56', 35, 'qt', 'supplies', 'qtsuppliesltd@gmail.com', 'qtsuppliesltd@gmail.com', '0772426123', 'Nasser road', 'Printing graphics designing, identity cards', NULL, 'romina', NULL, NULL, NULL, '{\"src\":\"7Ia8nzN5A52JzofjGR95lDUjFnAPiHgxSNjePqrY.png\",\"thumbnail\":\"thumb_7Ia8nzN5A52JzofjGR95lDUjFnAPiHgxSNjePqrY.png\",\"user_id\":35}', '{\"src\":\"EbMRbJjjGtYi7vKgcPAYgCkompkxcbWrRPiGrYQD.jpg\",\"thumbnail\":\"thumb_EbMRbJjjGtYi7vKgcPAYgCkompkxcbWrRPiGrYQD.jpg\",\"user_id\":35}', NULL, NULL, NULL, NULL, NULL, NULL, '1', 'qtsuppliesltd-at-gmailcom', NULL, 10, NULL, 1, 1),
(36, '2022-02-01 22:51:04', '2022-02-01 22:52:45', 33, 'Ashiraff', 'Tumusiime', 'boosteds', 'developer@boostedtechs.com', '+256759800742', 'Buziga - kampala U', 'Software Company', NULL, 'romina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'boosteds', NULL, 22, NULL, 1, 1),
(37, '2022-02-04 05:06:30', '2022-02-04 05:08:34', 36, 'Sumayah', 'Swaib', 'Sumayah Swaib', 'sumayahswaibk@gmail.com', '0755906818', 'Nasser road', 'Printing branding plastic id\'s', NULL, 'romina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'sumayah-swaib713', NULL, 10, NULL, 1, 1),
(38, '2022-02-06 13:44:40', '2022-02-06 13:48:45', 37, 'Queenstech', 'Supplies', 'QUEENSTECH SUPPLIES LTD', 'qtsuppliesltd@gmail.com', '0702426123', 'Nasser Road room C003', 'We do all kinds of printing, branding, plastic identity cards and general stationery', NULL, 'romina', NULL, NULL, NULL, '{\"src\":\"gsEF3WKp96uYsEqd3upcXDz2MuHxM5mZsvwN0Jnh.png\",\"thumbnail\":\"thumb_gsEF3WKp96uYsEqd3upcXDz2MuHxM5mZsvwN0Jnh.png\",\"user_id\":37}', '{\"src\":\"DRMSeJzZI3RGEaFhKAB9huSlXaGx9bTZ0fZZQRap.png\",\"thumbnail\":\"thumb_DRMSeJzZI3RGEaFhKAB9huSlXaGx9bTZ0fZZQRap.png\",\"user_id\":37}', NULL, NULL, '0702426123', NULL, NULL, NULL, '1', 'queenstech-supplies-ltd', NULL, 10, NULL, 1, 1),
(39, '2022-02-06 13:51:29', '2022-02-06 13:51:29', 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 1, 1),
(40, '2022-02-06 14:28:21', '2022-02-06 14:28:21', 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 1, 1),
(41, '2022-02-06 14:36:40', '2022-02-08 13:48:27', 40, 'Kleberson', 'Wear', 'kleberson-wear-t-shirt-printing-ug', 'klb284@gmail.com', '+256776983199', 'Kampala', NULL, NULL, 'romina', NULL, NULL, NULL, '{\"src\":\"GJJW53Ai76VpwZS9TUgJJb8f5Wsg0wGKt3T3tU7e.png\",\"thumbnail\":\"thumb_GJJW53Ai76VpwZS9TUgJJb8f5Wsg0wGKt3T3tU7e.png\",\"user_id\":40}', NULL, NULL, NULL, '+256776983199', NULL, NULL, NULL, '1', 'kleberson-wear-t-shirt-printing-ug', NULL, 39, NULL, 1, 1),
(42, '2022-02-07 05:19:33', '2022-02-07 05:19:33', 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `phone_number`) VALUES
(32, '', 'mubahood360@gmail.com', NULL, '$2y$10$NtqaYziIoRFzT9VrwY8R4.usovNNmptAi4f4PskI5PeXbZ.jb0vzK', 'w4ErP31y7y9BjLIDS6rI1Bawrkqgh0cuPFK5eeiiwYrz1XnbJdYfqPbr06yz', '2022-01-27 05:49:43', '2022-01-27 05:49:43', 'mubahood360@gmail.com'),
(33, '', 'developer@boostedtechs.com', NULL, '$2y$10$gEaCAqpTE5yNuV1vQD7x.usz60XpxUAW3U7KQg6JUF7JvLjkCg1XS', 'QR7N09NJnJiu7QeqeBo0xRsFSED1q5d5O7aBsbbAIC9unsQINxQ7ISTd8uR1', '2022-01-28 07:24:02', '2022-01-28 07:24:02', 'developer@boostedtechs.com'),
(37, '', 'qtsuppliesltd@gmail.com', NULL, '$2y$10$EwMvPcW9EliE360gymfN6.ma6ZweleJLYqRmcvLDeyntxCVh3FXna', 'LLs0KHiX8paIKBpMEOzFQl45FeOZH5aTV0UtIrpM7xVXouKtjXRVs7wuM13s', '2022-02-06 13:44:40', '2022-02-06 13:44:40', 'qtsuppliesltd@gmail.com'),
(38, '', 'kshafic2017@gmail.com', NULL, '$2y$10$/TeiQ8hqshK8NGVZznYRX.Rrnx2541HxLXdy3SvH.J/YGwdgf8pze', 'kkeEkDmJehCZTNO1pH978QZZTrXqUGJ0GcDreqCFcczZXo0ePs3bwO8g7DWy', '2022-02-06 13:51:29', '2022-02-06 13:51:29', 'kshafic2017@gmail.com'),
(39, '', 'kibirigeibrahim092@gmail.com', NULL, '$2y$10$DCu8XAohVk2o..06cE7QRe18fYW7jxSpB6ybTB04CxpGgh6WcDbui', 'MRIosKyzTaZYh9kfKXG0v8Rt6KbnvQfadCsbdIQCfDsx2BUjqzyEt2snS6C0', '2022-02-06 14:28:21', '2022-02-06 14:28:21', 'kibirigeibrahim092@gmail.com'),
(40, '', 'klb284@gmail.com', NULL, '$2y$10$Gk/gmFRQeikIGQWsPIp9A.tGCMHY0ZFTyhHB8BHba0MmuHDFFks2C', '6LLOTuoj0XQNHOShzgYp2o3K53fTiu8pxqJSbEaxzk1ysszBaIUFL8Rkd324', '2022-02-06 14:36:40', '2022-02-06 14:36:40', 'klb284@gmail.com'),
(41, '', 'nndawulanajibla@gmail.com', NULL, '$2y$10$aUg4Pu6FG34oWUbnoFGT.eBuubPa7iqB.9IofL9Az7zX2Kdv6vqba', 'kUxivaeIm91ZX0fhmpAQlLS8rBnohCJ9BGdI2lfzIbsdkQs5Abg7BBQuNdrm', '2022-02-07 05:19:33', '2022-02-07 05:19:33', 'nndawulanajibla@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_operation_log_user_id_index` (`user_id`);

--
-- Indexes for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `admin_permissions_slug_unique` (`slug`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`),
  ADD UNIQUE KEY `admin_roles_slug_unique` (`slug`);

--
-- Indexes for table `admin_role_menu`
--
ALTER TABLE `admin_role_menu`
  ADD KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- Indexes for table `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- Indexes for table `admin_role_users`
--
ALTER TABLE `admin_role_users`
  ADD KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`);

--
-- Indexes for table `admin_user_permissions`
--
ALTER TABLE `admin_user_permissions`
  ADD KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=968;

--
-- AUTO_INCREMENT for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=299;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
