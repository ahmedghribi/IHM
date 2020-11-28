-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2020 at 04:30 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` int(10) UNSIGNED DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'HP', 'hp', NULL, NULL, '2020-10-22 16:00:20', '2020-10-22 16:00:20'),
(2, 'Lenovo', 'lenovo', NULL, NULL, '2020-10-22 16:00:37', '2020-10-22 16:00:37'),
(3, 'Dell', 'dell', NULL, NULL, '2020-10-22 16:00:43', '2020-10-22 16:00:43'),
(4, 'Asus', 'asus', 'Asus', NULL, '2020-11-28 11:26:33', '2020-11-28 11:26:33'),
(5, 'MSI Gaming', 'msi-gaming', 'MSI Gaming', NULL, '2020-11-28 11:26:37', '2020-11-28 11:26:37'),
(6, 'Intel', 'intel', 'Intel Processeur', NULL, '2020-11-28 13:44:08', '2020-11-28 13:44:08');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `price` decimal(20,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `image`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Desktop', 'desktop', NULL, NULL, NULL, '2020-10-22 16:01:30', '2020-10-22 16:01:30'),
(2, 'Laptop', 'laptop', NULL, NULL, NULL, '2020-10-22 16:01:52', '2020-10-22 16:01:52'),
(3, 'Serveur', 'serveur', NULL, NULL, NULL, '2020-10-22 16:02:21', '2020-10-22 16:02:21'),
(4, 'Workstation', 'workstation', 'Workstation', NULL, NULL, '2020-11-28 11:27:14', '2020-11-28 11:27:14'),
(5, 'Accessoires', 'accessoires', 'Accessoires', NULL, NULL, '2020-11-28 11:27:42', '2020-11-28 11:27:42'),
(6, 'Composants', 'composants', 'Composants', NULL, NULL, '2020-11-28 11:27:53', '2020-11-28 11:27:53'),
(7, 'Souris', 'souris', 'Souris', NULL, 5, '2020-11-28 11:28:06', '2020-11-28 11:28:06'),
(8, 'Clavier', 'clavier', 'Clavier', NULL, 5, '2020-11-28 11:28:19', '2020-11-28 11:28:19'),
(9, 'Ecran', 'ecran', 'Ecran', NULL, 5, '2020-11-28 11:28:32', '2020-11-28 11:28:32'),
(10, 'Casque', 'casque', 'Casque', NULL, 5, '2020-11-28 11:28:42', '2020-11-28 11:28:42'),
(11, 'Disque dur', 'disque-dur', 'Disque dur', NULL, 6, '2020-11-28 11:29:08', '2020-11-28 11:29:08'),
(12, 'Barrette mémoire', 'barrette-memoire', 'Barrette mémoire', NULL, 6, '2020-11-28 11:29:25', '2020-11-28 11:29:25'),
(13, 'Carte mère', 'carte-mere', 'Carte mère', NULL, 6, '2020-11-28 11:29:37', '2020-11-28 11:29:37'),
(14, 'Carte graphique', 'carte-graphique', 'Carte graphique', NULL, 6, '2020-11-28 11:29:50', '2020-11-28 11:29:50'),
(15, 'Processeur', 'processeur', 'Processeur', NULL, 6, '2020-11-28 11:30:07', '2020-11-28 11:30:07');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('spam','0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` decimal(20,2) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `exchange_rate`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Dinar Tunisien', 'TND', 'TND', '1.00', 0, '2020-10-22 15:59:44', '2020-10-22 15:59:44');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_00_000000_create_settings_table', 1),
(2, '2014_10_00_000001_add_group_column_on_settings_table', 1),
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 1),
(5, '2019_08_19_000000_create_failed_jobs_table', 1),
(6, '2019_09_23_111619_create_products_table', 1),
(7, '2019_09_23_135407_create_product_images_table', 1),
(8, '2019_09_24_185442_create_categories_table', 1),
(9, '2019_09_25_143150_create_brands_table', 1),
(10, '2019_10_16_131139_create_orders_table', 1),
(11, '2019_11_06_061010_create_carts_table', 1),
(12, '2019_11_07_194500_create_payments_table', 1),
(13, '2019_11_08_065258_create_shippings_table', 1),
(14, '2019_11_08_153054_create_notifications_table', 1),
(15, '2019_11_15_180652_create_posts_table', 1),
(16, '2019_11_15_181134_create_comments_table', 1),
(17, '2019_11_16_063922_create_post_categories_table', 1),
(18, '2019_11_16_065709_create_post__category__relations_table', 1),
(19, '2019_12_19_155540_create_widgets_table', 1),
(20, '2019_12_19_173325_create_product__comments_table', 1),
(21, '2019_12_19_173349_create_product_reviews_table', 1),
(22, '2019_12_20_152314_create_tags_table', 1),
(23, '2019_12_20_160559_create_tag_post_table', 1),
(24, '2019_12_21_175418_create_currencies_table', 1),
(25, '2019_12_22_153655_create_addresses_table', 1),
(26, '2019_12_22_170532_create_cities_table', 1),
(27, '2019_12_22_191944_create_sessions_table', 1),
(28, '2019_12_23_043904_create_messages_table', 1),
(29, '2019_12_30_080315_create_coupons_table', 1),
(30, '2019_12_30_184550_create_sliders_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` enum('pending','processing','completed','decline') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `coupon_id` int(10) UNSIGNED DEFAULT NULL,
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `shipping_id` int(10) UNSIGNED DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` int(10) UNSIGNED DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `payment_method` enum('cash','bKash','rocket') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cash',
  `transection_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('publish','draft','trash') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post__category__relations`
--

CREATE TABLE `post__category__relations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `post_category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `brand_id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` decimal(20,2) NOT NULL,
  `offer_price` decimal(20,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `admin_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `category_id`, `brand_id`, `slug`, `description`, `quantity`, `price`, `offer_price`, `status`, `admin_id`, `created_at`, `updated_at`) VALUES
(2, 'PC PORTABLE ASUS X543MA / DUAL CORE / 4 GO / NOIR', 2, 4, 'pc-portable-asus-x543ma-dual-core-4-go-noir', '<div class=\"product-reference\" style=\"box-sizing: inherit; font-family: Poppins, sans-serif; letter-spacing: 0.8px;\"><label class=\"label\" style=\"box-sizing: inherit; touch-action: manipulation; display: inline-block; margin-bottom: 0.5rem; text-align: right; font-size: 0.875rem; text-transform: capitalize; letter-spacing: 1px;\">R&eacute;f&eacute;rence :</label>&nbsp;<span style=\"box-sizing: inherit;\">X543MA-GQ554T</span></div>\r\n<div class=\"product-information\" style=\"box-sizing: inherit; font-size: 0.9375rem; color: #232323; font-family: Poppins, sans-serif; letter-spacing: 0.8px;\">\r\n<div id=\"product-description-short-43963\" class=\"prodes\" style=\"box-sizing: inherit; border-bottom: 1px solid #f2f2f2; padding: 16px 0px; margin-bottom: 0px;\">\r\n<p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 0px; color: #374853; font-size: 12px;\">Ecran 15.6\" HD - Processeur Intel Celeron Dual Core N4000, up to 2.6 Ghz,&nbsp;4 Mo de m&eacute;moire cache - M&eacute;moire 4 Go - Disque&nbsp;500 Go - Carte graphique Intel UHD Graphics 605 - Lecteur de cartes - Wifi - Bluetooth - USB 3.1 - 2x USB 2.0 - HDMI - Webcam avec Micro -&nbsp;<span style=\"box-sizing: inherit; margin-bottom: 0px; color: #f30c0c;\">Windows 10</span>&nbsp;- Couleur: Noir - Garantie 1 an</p>\r\n</div>\r\n</div>', 10, '750.00', '699.00', 0, 0, '2020-11-28 11:35:05', '2020-11-28 11:35:05'),
(9, 'PC PORTABLE ASUS X509JB / I5 10È GÉN / 8 GO / ROUGE', 2, 2, 'pc-portable-asus-x509jb-i5-10e-gen-8-go-rouge', '<div class=\"product-reference\" style=\"box-sizing: inherit; font-family: Poppins, sans-serif; letter-spacing: 0.8px;\"><label class=\"label\" style=\"box-sizing: inherit; touch-action: manipulation; display: inline-block; margin-bottom: 0.5rem; text-align: right; font-size: 0.875rem; text-transform: capitalize; letter-spacing: 1px;\">R&eacute;f&eacute;rence :</label>&nbsp;<span style=\"box-sizing: inherit;\">S509JB-EJ270T</span></div>\r\n<div class=\"product-information\" style=\"box-sizing: inherit; font-size: 0.9375rem; color: #232323; font-family: Poppins, sans-serif; letter-spacing: 0.8px;\">\r\n<div id=\"product-description-short-45062\" class=\"prodes\" style=\"box-sizing: inherit; border-bottom: 1px solid #f2f2f2; padding: 16px 0px; margin-bottom: 0px;\">\r\n<p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 0px; color: #374853; font-size: 12px;\">Ecran 15.6\" FHD - Processeur Intel i5-1035G1, up to 3.6 Ghz, 6 Mo de m&eacute;moire cache - M&eacute;moire 8 Go - Disque&nbsp;1 To - Carte graphique Nvidia Geforce MX110, 2 Go de M&eacute;moire d&eacute;di&eacute;e - Lecteur de cartes - Wifi - Bluetooth - USB 3.0 Type C - 1xUsb 3.0 - 2x USB 2.0 - HDMI - Webcam avec Micro -&nbsp;<span style=\"box-sizing: inherit; margin-bottom: 0px; color: #f30c0c;\">Windows 10</span>&nbsp;- Couleur: Noir- Garantie 1 an</p>\r\n</div>\r\n</div>', 10, '1999.00', '1359.00', 0, 0, '2020-11-28 14:01:21', '2020-11-28 14:01:21'),
(4, 'PC PORTABLE HP 17-BY3082NF / I3 10È GÉN / 4 GO', 2, 1, 'pc-portable-hp-17-by3082nf-i3-10e-gen-4-go', '<div class=\"product-reference\" style=\"box-sizing: inherit; font-family: Poppins, sans-serif; letter-spacing: 0.8px;\"><label class=\"label\" style=\"box-sizing: inherit; touch-action: manipulation; display: inline-block; margin-bottom: 0.5rem; text-align: right; font-size: 0.875rem; text-transform: capitalize; letter-spacing: 1px;\">R&eacute;f&eacute;rence :</label>&nbsp;<span style=\"box-sizing: inherit;\">27Z94EA</span></div>\r\n<div class=\"product-information\" style=\"box-sizing: inherit; font-size: 0.9375rem; color: #232323; font-family: Poppins, sans-serif; letter-spacing: 0.8px;\">\r\n<div id=\"product-description-short-44637\" class=\"prodes\" style=\"box-sizing: inherit; border-bottom: 1px solid #f2f2f2; padding: 16px 0px; margin-bottom: 0px;\">\r\n<p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 0px; color: #374853; font-size: 12px;\">Ecran 17.3\" LED HD+&nbsp;(1600 x 900) - Processeur Intel Core<span style=\"box-sizing: inherit; margin-bottom: 0px;\">&nbsp;i3-1005G1</span>, up to 3.4 GHz,&nbsp;4 Mo de cache -&nbsp;4 Go de m&eacute;moire - Disque&nbsp;1 To - Carte graphique Intel UHD Graphics&nbsp;- Wifi - Bluetooth - Ethernet - 1x USB 3.1 Type-C - 2x USB 3.1 - 1x HDMI - 1x RJ45 - Graveur DVD - Lecteur de cartes SD - Webcam HD -&nbsp;<span style=\"box-sizing: inherit; margin-bottom: 0px; color: #ef0909;\">Windows 10</span> - Couleur Blanc - Garantie 1 an</p>\r\n</div>\r\n</div>', 10, '1499.00', '1359.00', 0, 0, '2020-11-28 11:39:11', '2020-11-28 11:39:11'),
(5, 'PC PORTABLE LENOVO IDEAPAD 330-15AST / DUAL CORE / 4 GO / NOIR', 2, 2, 'pc-portable-lenovo-ideapad-330-15ast-dual-core-4-go-noir', '<div class=\"product-reference\" style=\"box-sizing: inherit; font-family: Poppins, sans-serif; letter-spacing: 0.8px;\"><label class=\"label\" style=\"box-sizing: inherit; touch-action: manipulation; display: inline-block; margin-bottom: 0.5rem; text-align: right; font-size: 0.875rem; text-transform: capitalize; letter-spacing: 1px;\">R&eacute;f&eacute;rence :</label>&nbsp;<span style=\"box-sizing: inherit;\">81D600DDFE</span></div>\r\n<div class=\"product-information\" style=\"box-sizing: inherit; font-size: 0.9375rem; color: #232323; font-family: Poppins, sans-serif; letter-spacing: 0.8px;\">\r\n<div id=\"product-description-short-44762\" class=\"prodes\" style=\"box-sizing: inherit; border-bottom: 1px solid #f2f2f2; padding: 16px 0px; margin-bottom: 0px;\">\r\n<p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 0px; color: #374853; font-size: 12px;\">Ecran 15.6\" HD LED - Processeur AMD A4-9125 Dual Core, up to 2.6 GHz, 1 Mo de m&eacute;moire cache - M&eacute;moire 4 Go - Disque 1 To - Carte graphique Intel HD Graphics - Wifi - Bluetooth - HDMI - USB 3.0 - RJ45 - Webcam HD avec Micro - Couleur Noir - Garantie 1 an</p>\r\n</div>\r\n</div>', 20, '719.00', '700.00', 0, 0, '2020-11-28 13:16:07', '2020-11-28 13:16:07'),
(6, 'CARTE GRAPHIQUE MSI GEFORCE GT 1030 2GH LP OC / 2 GO', 14, 5, 'carte-graphique-msi-geforce-gt-1030-2gh-lp-oc-2-go', '<div class=\"product-reference\" style=\"box-sizing: inherit;\"><label class=\"label\" style=\"box-sizing: inherit; touch-action: manipulation; display: inline-block; margin-bottom: 0.5rem; text-align: right; font-size: 0.875rem; text-transform: capitalize; letter-spacing: 1px;\">R&eacute;f&eacute;rence :</label>&nbsp;<span style=\"box-sizing: inherit;\">912-V809-2498</span></div>\r\n<div class=\"product-information\" style=\"box-sizing: inherit; font-size: 0.9375rem; color: #232323;\">\r\n<div id=\"product-description-short-29407\" class=\"prodes\" style=\"box-sizing: inherit; border-bottom: 1px solid #f2f2f2; padding: 16px 0px; margin-bottom: 0px; font-family: Poppins, sans-serif; letter-spacing: 0.8px;\">\r\n<p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 0px; color: #374853; font-size: 12px;\">Carte graphique MSI GeForce GT 1030 2GH LP OC&nbsp;- 2 Go de m&eacute;moire DDR5 d&eacute;di&eacute;e - Fr&eacute;quence 1265MHz (Mode Normal) / 1518MHz (Mode Boost&eacute;) - &nbsp;IPCI Express 3.0 16x -&nbsp;1x DisplayPort - 1x HDMI - Dimensions&nbsp;153 x 69 x 38 mm - Garantie 1 an</p>\r\n</div>\r\n<div class=\"product-additional-info\" style=\"box-sizing: inherit; font-family: Poppins, sans-serif; letter-spacing: 0.8px;\">\r\n<div class=\"social-sharing\" style=\"box-sizing: inherit; width: 479.984px; display: flex; -webkit-box-align: center; align-items: center; margin-top: 15px;\">\r\n<ul style=\"box-sizing: inherit; margin: 0px auto; list-style: none; padding-left: 0px;\">\r\n<li class=\"facebook icon-gray\" style=\"box-sizing: inherit; box-shadow: rgba(0, 0, 0, 0.2) 2px 2px 4px 0px; height: 2.5rem; width: 2.5rem; display: inline-block; cursor: pointer; text-align: center; border-radius: 5px; padding: 10px 0px;\">&nbsp;</li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>', 25, '300.00', '279.00', 0, 0, '2020-11-28 13:23:39', '2020-11-28 13:23:39'),
(7, 'CARTE GRAPHIQUE ASUS GTX 1650S 4G GAMING', 14, 4, 'carte-graphique-asus-gtx-1650s-4g-gaming', '<div class=\"product-reference\" style=\"box-sizing: inherit; font-family: Poppins, sans-serif; letter-spacing: 0.8px;\"><label class=\"label\" style=\"box-sizing: inherit; touch-action: manipulation; display: inline-block; margin-bottom: 0.5rem; text-align: right; font-size: 0.875rem; text-transform: capitalize; letter-spacing: 1px;\">R&eacute;f&eacute;rence :</label>&nbsp;<span style=\"box-sizing: inherit;\">90YV0E42-M0NA00</span></div>\r\n<div class=\"product-information\" style=\"box-sizing: inherit; font-size: 0.9375rem; color: #232323; font-family: Poppins, sans-serif; letter-spacing: 0.8px;\">\r\n<div id=\"product-description-short-40386\" class=\"prodes\" style=\"box-sizing: inherit; border-bottom: 1px solid #f2f2f2; padding: 16px 0px; margin-bottom: 0px;\">\r\n<p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 0px; color: #374853; font-size: 12px;\">Carte graphique Asus GTX 1650S 4G Gaming&nbsp;- 4 Go de m&eacute;moire DDR6 d&eacute;di&eacute;e - Fr&eacute;quence du chipset 1530 MHz -&nbsp;Fr&eacute;quence boost&eacute;e 1800 MHz - Interface PCI Express 3.0 16x -&nbsp;1x HDMI Femelle, 1x DVI Femelle, 1x DisplayPort Femelle -&nbsp;<label style=\"box-sizing: inherit; touch-action: manipulation; display: inline-block; margin-bottom: 0.5rem; color: #232323; text-align: right; font-size: 0.875rem;\"></label>Dimensions 206 x 124 x 46 mm - Garantie 1 an</p>\r\n</div>\r\n</div>', 10, '700.00', '669.00', 0, 0, '2020-11-28 13:26:11', '2020-11-28 13:26:11'),
(8, 'PROCESSEUR INTEL CORE COFFEE LAKE I5-9600KF 9É GÉN', 15, 6, 'processeur-intel-core-coffee-lake-i5-9600kf-9e-gen', '<div class=\"product-reference\" style=\"box-sizing: inherit; color: #000000; font-size: 14px; letter-spacing: 0.8px; text-transform: none;\"><label class=\"label\" style=\"box-sizing: inherit; touch-action: manipulation; display: inline-block; margin-bottom: 0.5rem; text-align: right; font-size: 0.875rem; text-transform: capitalize; letter-spacing: 1px;\">R&eacute;f&eacute;rence :</label>&nbsp;<span style=\"box-sizing: inherit;\">CPU-I5-9600KF</span></div>\r\n<div class=\"product-information\" style=\"box-sizing: inherit; font-size: 0.9375rem; color: #232323; letter-spacing: 0.8px; text-transform: none;\">\r\n<div id=\"product-description-short-37091\" class=\"prodes\" style=\"box-sizing: inherit; border-bottom: 1px solid #f2f2f2; padding: 16px 0px; margin-bottom: 0px;\">\r\n<p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 0px; color: #374853; font-size: 12px;\">Processeur Intel Core Coffee Lake i5-9600KF 9&eacute; G&eacute;n, 3.7 Ghz up to 4.6 Ghz, 9 Mo de m&eacute;moire cache - 6 C&oelig;urs - 6 Threads - Socket FCLGA1151 - Technologie Intel Turbo Boost 2.0</p>\r\n</div>\r\n</div>', 8, '1000.00', '950.00', 0, 0, '2020-11-28 13:44:40', '2020-11-28 13:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(3, 2, '1e15c4c3a48369751fa47276d080192c.jpg', '2020-11-28 11:35:06', '2020-11-28 11:35:06'),
(4, 2, '49eaebf2587fe124335130df749342c0.jpg', '2020-11-28 11:35:06', '2020-11-28 11:35:06'),
(5, 2, 'cca074582b494669fe1313b6996c9da8.jpg', '2020-11-28 11:35:06', '2020-11-28 11:35:06'),
(20, 9, 'ac5e4ce315f7c86dcde1f85393f885fa.jpg', '2020-11-28 14:01:21', '2020-11-28 14:01:21'),
(21, 9, 'a8d1d1036f4afb56a48af189e41b4244.jpg', '2020-11-28 14:01:21', '2020-11-28 14:01:21'),
(9, 4, '2c72bae0a48ab5ef70419bc1f32c1c78.jpg', '2020-11-28 11:39:12', '2020-11-28 11:39:12'),
(10, 4, '9f8d8300613688b0be08956ffa971dcc.jpg', '2020-11-28 11:39:12', '2020-11-28 11:39:12'),
(11, 4, '02d34a52bf9a8753eb714fe6c6c0afd1.jpg', '2020-11-28 11:39:12', '2020-11-28 11:39:12'),
(12, 5, '4dad8517709e8b0fea859aa2726013cb.jpg', '2020-11-28 13:16:08', '2020-11-28 13:16:08'),
(13, 5, '60c426586ccfc4cbc6114ef4320aab77.jpg', '2020-11-28 13:16:08', '2020-11-28 13:16:08'),
(14, 5, 'ad91342477c1d10e08a5a2839ceba1f4.jpg', '2020-11-28 13:16:08', '2020-11-28 13:16:08'),
(15, 6, 'd4aab452da7cf65df369a38f2db9ddf9.jpg', '2020-11-28 13:23:39', '2020-11-28 13:23:39'),
(16, 7, 'a33fdf5a65ab380641235f70b9195f56.jpg', '2020-11-28 13:26:11', '2020-11-28 13:26:11'),
(17, 7, 'cf6e9fe6e68ad6148eceb63b9cd1f79c.jpg', '2020-11-28 13:26:12', '2020-11-28 13:26:12'),
(18, 7, '0d888f08b377c3f3957147010696d7cf.jpg', '2020-11-28 13:26:12', '2020-11-28 13:26:12'),
(19, 8, '519278ca3a8e1cab12a2166098faffa0.jpg', '2020-11-28 13:44:41', '2020-11-28 13:44:41');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('spam','0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `rating` decimal(20,2) NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product__comments`
--

CREATE TABLE `product__comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('spam','0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `val` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `val`, `created_at`, `updated_at`, `group`) VALUES
(1, 'app_name', 'DiStore', '2020-10-22 16:11:51', '2020-10-22 16:29:34', 'default'),
(2, 'app_description', 'Digital Store', '2020-10-22 16:11:51', '2020-10-22 16:29:34', 'default'),
(3, 'app_email', 'distore@gmail.com', '2020-10-22 16:11:51', '2020-10-22 16:29:34', 'default'),
(4, 'app_phone', '01776217594', '2020-10-22 16:11:51', '2020-10-22 16:11:51', 'default'),
(5, 'copyright_text', NULL, '2020-10-22 16:11:51', '2020-10-22 16:29:34', 'default'),
(6, 'shop_currency', '1', '2020-10-22 16:11:51', '2020-10-22 16:11:51', 'default'),
(7, 'shop_address', 'Shop address', '2020-10-22 16:11:51', '2020-10-22 16:11:51', 'default'),
(8, 'social_facebook', 'vbn,;:', '2020-10-22 16:11:51', '2020-10-22 16:30:31', 'default'),
(9, 'social_twitter', 'bn,;', '2020-10-22 16:11:51', '2020-10-22 16:30:31', 'default'),
(10, 'social_dribbble', 'nkknk', '2020-10-22 16:11:51', '2020-10-22 16:30:31', 'default'),
(11, 'social_behance', NULL, '2020-10-22 16:11:51', '2020-10-22 16:11:51', 'default'),
(12, 'social_linkedin', 'kn', '2020-10-22 16:11:51', '2020-10-22 16:30:31', 'default'),
(13, 'logo', 'app/VkIj43ewCOWk8PUAV9ASIqGZZl6yFojEyU70UN5Q.png', '2020-10-22 16:29:34', '2020-10-22 16:30:00', 'default'),
(14, 'icon', 'app/2XN0QADd3ntMAt8DZg1n0OU1WBN6BGX8tyRJ1nsR.svg', '2020-10-22 16:29:34', '2020-10-22 16:29:34', 'default');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(20,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `button` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `body`, `button`, `url`, `image`, `created_at`, `updated_at`) VALUES
(1, 'azert', '<p>dfghj</p>', NULL, NULL, '48f52ef9a6d20eec557adb4e293b7bfb.jpg', '2020-10-22 16:31:02', '2020-10-22 16:31:02');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tag_post`
--

CREATE TABLE `tag_post` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT 0,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `is_admin`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'issam', 'issam@a.com', '2020-10-07 17:56:31', 1, '$2y$10$NEP3/ydi8g8uVkrmsdfDR.WkzMdqH9pjk8atwVAiCGjLlPAJYx9bm', NULL, '2020-10-22 15:52:47', '2020-10-22 15:52:47'),
(2, 'Mimos', 'moumen.alila@gmail.com', '2020-11-28 12:25:38', 1, '$2y$10$MkK6Vl1gJGwJIQ6/MdMMyORFHtuoPSxfYtamAyjJ3FlYoWBtcpcLi', NULL, '2020-11-28 11:25:25', '2020-11-28 11:25:25');

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `addresses_user_id_unique` (`user_id`),
  ADD KEY `addresses_city_id_foreign` (`city_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_name_unique` (`name`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`),
  ADD KEY `carts_user_id_index` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currencies_code_unique` (`code`),
  ADD UNIQUE KEY `currencies_symbol_unique` (`symbol`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_coupon_id_foreign` (`coupon_id`),
  ADD KEY `orders_payment_id_foreign` (`payment_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`),
  ADD KEY `orders_city_id_foreign` (`city_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id_foreign` (`user_id`),
  ADD KEY `payments_order_id_foreign` (`order_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_name_unique` (`name`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Indexes for table `post__category__relations`
--
ALTER TABLE `post__category__relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post__category__relations_post_id_foreign` (`post_id`),
  ADD KEY `post__category__relations_post_category_id_foreign` (`post_category_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `product__comments`
--
ALTER TABLE `product__comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product__comments_user_id_foreign` (`user_id`),
  ADD KEY `product__comments_product_id_foreign` (`product_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shippings_type_unique` (`type`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_name_unique` (`name`),
  ADD UNIQUE KEY `tags_slug_unique` (`slug`);

--
-- Indexes for table `tag_post`
--
ALTER TABLE `tag_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tag_post_post_id_foreign` (`post_id`),
  ADD KEY `tag_post_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post__category__relations`
--
ALTER TABLE `post__category__relations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product__comments`
--
ALTER TABLE `product__comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tag_post`
--
ALTER TABLE `tag_post`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
