-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 22, 2023 at 12:33 PM
-- Server version: 5.7.41
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hopecapr_demopos`
--

-- --------------------------------------------------------

--
-- Table structure for table `adjusted_products`
--

CREATE TABLE `adjusted_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `adjustment_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adjustments`
--

CREATE TABLE `adjustments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_code`, `category_name`, `created_at`, `updated_at`) VALUES
(1, '00052', 'Batch 00052', '2022-12-12 21:06:34', '2022-12-28 20:39:41'),
(2, '00053', 'Batch 00053', '2023-01-21 00:10:24', '2023-01-21 00:10:24');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thousand_separator` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_separator` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `currency_name`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', 'USD', '$', ',', '.', NULL, '2022-12-12 21:03:53', '2022-12-12 21:03:53'),
(2, 'Tanzanian Shilings', 'TZS', 'TZS', ',', '.', NULL, '2022-12-12 21:12:33', '2023-01-27 20:26:18');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_tin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_vrn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_name`, `customer_email`, `customer_phone`, `customer_tin`, `customer_vrn`, `city`, `country`, `address`, `created_at`, `updated_at`) VALUES
(2, 'Mr. Discount Supermarket', 'mrdiscount@gmail.com', '0782150150', NULL, NULL, 'Dar es Salaam', 'Tanzania', 'Indira Gandhi St, Dar es Salaam.', '2022-12-28 20:37:07', '2022-12-28 20:37:07'),
(3, 'Mwalimu Joyce', 'null@email.com', '0753612683', NULL, NULL, 'Songea', 'Tanzania', 'Songea, Tanzania', '2023-01-03 13:30:23', '2023-01-03 13:30:23'),
(4, 'Steven Mbwambo', 'null@email.com', '0754741653', NULL, NULL, 'Arusha', 'Tanzania', 'Arusha, Tanzania', '2023-01-03 18:23:03', '2023-01-03 18:23:03'),
(5, 'Lifeline Pharmacy - Muhimbili', 'null@email.com', NULL, NULL, NULL, 'Dar es Salaam', 'Tanzania', 'Muhimbili', '2023-01-04 18:27:20', '2023-01-27 21:56:26'),
(6, 'Jambo Supermarket - Salasala', 'null@email.com', '0742605559', '133-481-737', NULL, 'Dar es salaam', 'Tanzania', 'Salasala', '2023-01-04 18:29:27', '2023-01-27 22:32:11'),
(7, 'New Customer', 'null@email.com', '0786000000', NULL, NULL, 'Dar es salaam', 'Tanzania', 'Dar es Salaam, Tanzania.', '2023-01-04 18:31:34', '2023-01-04 18:31:34'),
(8, 'Nyumbani Pharmacy', 'null@email.com', '0768242929', NULL, NULL, 'Dar es salaam', 'Tanzania', 'Kimara - Dar es Salaam, Tanzania', '2023-01-05 13:47:23', '2023-01-05 13:47:23'),
(9, 'H & R Pharmacy', 'null@email.com', '0679626276', NULL, NULL, 'Dar es salaam', 'Tanzania', 'Tabata', '2023-01-05 14:32:38', '2023-01-27 21:01:42'),
(10, 'Care Pharmacy', 'null@email.com', '0654935946', NULL, NULL, 'Dar es salaam', 'Tanzania', 'Dar es Salaam, Tanzania.', '2023-01-05 15:02:11', '2023-01-05 15:02:11'),
(11, 'Blandina Kisawike - Iringa', 'null@email.com', '0755489067', NULL, NULL, 'Iringa', 'Tanzania', 'Iringa, Tanzania.', '2023-01-05 21:12:05', '2023-01-05 21:12:05'),
(12, 'Migeyo', 'null@email.com', '0717011422', NULL, NULL, 'Dar es salaam', 'Tanzania', 'Dar es Salaam, Tanzania.', '2023-01-06 17:39:21', '2023-01-06 17:39:21'),
(13, 'Diamond Pharmacy - Segerea', 'null@email.com', '0687512077', NULL, NULL, 'Dar es salaam', 'Tanzania', 'Dar es Salaam, Tanzania.', '2023-01-06 19:16:53', '2023-01-06 19:16:53'),
(14, 'East Pharmacy', 'null@email.com', '0764541435', NULL, NULL, 'Dar es salaam', 'Tanzania', 'Dar es Salaam, Tanzania.', '2023-01-08 18:38:40', '2023-01-08 18:38:40'),
(15, 'Wakala Kibaha', 'null@email.com', '0742871219', NULL, NULL, 'Dar es salaam', 'Tanzania', 'Dar es Salaam, Tanzania.', '2023-01-08 18:40:00', '2023-01-08 18:40:00'),
(16, 'Kwanon Trading Company', 'null@email.com', '0655003248', NULL, NULL, 'Dar es salaam', 'Tanzania', 'Dar es Salaam, Tanzania.', '2023-01-09 14:18:32', '2023-01-09 14:18:32'),
(17, 'View Point Supermarket', 'null@email.com', '0716895647', NULL, NULL, 'Dar es salaam', 'Tanzania', 'Dar es Salaam, Tanzania.', '2023-01-09 14:19:29', '2023-01-09 14:19:29'),
(18, 'Bethlehem Pharmacy', 'null@email.com', '0655964333', NULL, NULL, 'Dar es Salaam', 'Tanzania', 'Dar es Salaam, Tanzania.', '2023-01-11 19:50:29', '2023-01-11 19:50:29'),
(19, 'Belaro Pharmacy', 'null@email.com', '0717109956', NULL, NULL, 'Dar es Salaam', 'Tanzania', 'Dar es Salaam, Tanzania.', '2023-01-11 19:51:18', '2023-01-11 19:51:18'),
(20, 'Mafuru - Kyela', 'null@email.com', '0754449870', NULL, NULL, 'Mbeya', 'Tanzania', 'Mbeya, Tanzania.', '2023-01-16 18:48:28', '2023-01-16 18:48:28'),
(21, 'Paschal Mizengo', 'pmizengo@gmail.com', '0786397123', NULL, NULL, 'kinondoni', 'Tanzania', 'Dar es Salaam', '2023-01-20 20:25:25', '2023-01-20 20:25:25'),
(22, 'Kijichi Pharmacy', 'null@email.com', '0786930074', NULL, NULL, 'Kijichi', 'Tanzania', 'Kijichi', '2023-01-27 21:06:28', '2023-01-27 21:06:28'),
(23, 'Baraka Pharmacy', 'null@email.com', '0714270937', '154012346', NULL, 'Dar es Salaam', 'Tanzania', 'Kisutu', '2023-01-27 21:22:33', '2023-01-27 21:22:33'),
(24, 'Mabrouk Pharmacy', 'null@email.com', '0786000000', NULL, NULL, 'Dar es Salaam', 'Tanzania', 'K/Koo', '2023-01-27 21:41:23', '2023-01-27 21:41:23'),
(25, 'Roby One Pharmacy', 'null@email.com', '0754423177', NULL, NULL, 'Dar es Salaam', 'Tanzania', 'K/Koo', '2023-01-27 21:43:55', '2023-01-27 21:43:55'),
(26, 'Talent Pharmacy', 'null@email.com', '0782483710', '135-747-688', NULL, 'Dar es Salaam', 'Tanzania', 'Kimara', '2023-01-27 21:50:23', '2023-01-27 21:50:23'),
(27, 'Mount Kibo Pharamcy', NULL, '0710546894', '151-171-680', NULL, 'Kilimanjaro', 'Tanzania', 'Moshi', '2023-01-27 21:53:34', '2023-01-27 21:53:34'),
(28, 'Happy Products', NULL, '0716260449', NULL, NULL, 'Dar es Salaam', 'Tanzania', 'Banana', '2023-01-27 22:08:49', '2023-01-27 22:08:49'),
(29, 'Jambo Supermarket - Bahari Beach', NULL, '0714716004', '133-481-737', NULL, 'Dar es Salaam', 'Tanzania', 'Bahari Beach', '2023-01-27 22:19:09', '2023-01-27 22:19:09'),
(30, 'White Rose Pharmacy', NULL, '0754064237', NULL, NULL, 'Kagera', 'Tanzania', 'Bukoba', '2023-01-27 22:58:02', '2023-01-27 22:58:02'),
(31, 'Life Pharmacy', NULL, '0756357777', NULL, NULL, 'Dar es Salaam', 'Tanzania', 'Tegeta Namanga', '2023-01-27 23:05:22', '2023-01-27 23:05:22');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(4, 'Modules\\Product\\Entities\\Product', 2, '199ffa8f-e1a6-47de-bcb9-12e9dfd093c2', 'images', '1672238797', '1672238797.png', 'image/png', 'public', 'public', 342678, '[]', '[]', '[]', '[]', 1, '2022-12-28 20:48:30', '2022-12-28 20:48:30');

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
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_07_14_145038_create_categories_table', 1),
(5, '2021_07_14_145047_create_products_table', 1),
(6, '2021_07_15_211319_create_media_table', 1),
(7, '2021_07_16_010005_create_uploads_table', 1),
(8, '2021_07_16_220524_create_permission_tables', 1),
(9, '2021_07_22_003941_create_adjustments_table', 1),
(10, '2021_07_22_004043_create_adjusted_products_table', 1),
(11, '2021_07_28_192608_create_expense_categories_table', 1),
(12, '2021_07_28_192616_create_expenses_table', 1),
(13, '2021_07_29_165419_create_customers_table', 1),
(14, '2021_07_29_165440_create_suppliers_table', 1),
(15, '2021_07_31_015923_create_currencies_table', 1),
(16, '2021_07_31_140531_create_settings_table', 1),
(17, '2021_07_31_201003_create_sales_table', 1),
(18, '2021_07_31_212446_create_sale_details_table', 1),
(19, '2021_08_07_192203_create_sale_payments_table', 1),
(20, '2021_08_08_021108_create_purchases_table', 1),
(21, '2021_08_08_021131_create_purchase_payments_table', 1),
(22, '2021_08_08_021713_create_purchase_details_table', 1),
(23, '2021_08_08_175345_create_sale_returns_table', 1),
(24, '2021_08_08_175358_create_sale_return_details_table', 1),
(25, '2021_08_08_175406_create_sale_return_payments_table', 1),
(26, '2021_08_08_222603_create_purchase_returns_table', 1),
(27, '2021_08_08_222612_create_purchase_return_details_table', 1),
(28, '2021_08_08_222646_create_purchase_return_payments_table', 1),
(29, '2021_08_16_015031_create_quotations_table', 1),
(30, '2021_08_16_155013_create_quotation_details_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 2),
(4, 'App\\Models\\User', 3);

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'edit_own_profile', 'web', '2022-12-12 21:03:51', '2022-12-12 21:03:51'),
(2, 'access_user_management', 'web', '2022-12-12 21:03:51', '2022-12-12 21:03:51'),
(3, 'show_total_stats', 'web', '2022-12-12 21:03:51', '2022-12-12 21:03:51'),
(4, 'show_month_overview', 'web', '2022-12-12 21:03:51', '2022-12-12 21:03:51'),
(5, 'show_weekly_sales_purchases', 'web', '2022-12-12 21:03:51', '2022-12-12 21:03:51'),
(6, 'show_monthly_cashflow', 'web', '2022-12-12 21:03:51', '2022-12-12 21:03:51'),
(7, 'show_notifications', 'web', '2022-12-12 21:03:51', '2022-12-12 21:03:51'),
(8, 'access_products', 'web', '2022-12-12 21:03:51', '2022-12-12 21:03:51'),
(9, 'create_products', 'web', '2022-12-12 21:03:51', '2022-12-12 21:03:51'),
(10, 'show_products', 'web', '2022-12-12 21:03:51', '2022-12-12 21:03:51'),
(11, 'edit_products', 'web', '2022-12-12 21:03:51', '2022-12-12 21:03:51'),
(12, 'delete_products', 'web', '2022-12-12 21:03:51', '2022-12-12 21:03:51'),
(13, 'access_product_categories', 'web', '2022-12-12 21:03:51', '2022-12-12 21:03:51'),
(14, 'print_barcodes', 'web', '2022-12-12 21:03:51', '2022-12-12 21:03:51'),
(15, 'access_adjustments', 'web', '2022-12-12 21:03:51', '2022-12-12 21:03:51'),
(16, 'create_adjustments', 'web', '2022-12-12 21:03:51', '2022-12-12 21:03:51'),
(17, 'show_adjustments', 'web', '2022-12-12 21:03:51', '2022-12-12 21:03:51'),
(18, 'edit_adjustments', 'web', '2022-12-12 21:03:51', '2022-12-12 21:03:51'),
(19, 'delete_adjustments', 'web', '2022-12-12 21:03:51', '2022-12-12 21:03:51'),
(20, 'access_quotations', 'web', '2022-12-12 21:03:51', '2022-12-12 21:03:51'),
(21, 'create_quotations', 'web', '2022-12-12 21:03:51', '2022-12-12 21:03:51'),
(22, 'show_quotations', 'web', '2022-12-12 21:03:51', '2022-12-12 21:03:51'),
(23, 'edit_quotations', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(24, 'delete_quotations', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(25, 'create_quotation_sales', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(26, 'send_quotation_mails', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(27, 'access_expenses', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(28, 'create_expenses', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(29, 'edit_expenses', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(30, 'delete_expenses', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(31, 'access_expense_categories', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(32, 'access_customers', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(33, 'create_customers', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(34, 'show_customers', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(35, 'edit_customers', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(36, 'delete_customers', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(37, 'access_suppliers', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(38, 'create_suppliers', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(39, 'show_suppliers', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(40, 'edit_suppliers', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(41, 'delete_suppliers', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(42, 'access_sales', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(43, 'create_sales', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(44, 'show_sales', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(45, 'edit_sales', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(46, 'delete_sales', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(47, 'create_pos_sales', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(48, 'access_sale_payments', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(49, 'access_sale_returns', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(50, 'create_sale_returns', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(51, 'show_sale_returns', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(52, 'edit_sale_returns', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(53, 'delete_sale_returns', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(54, 'access_sale_return_payments', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(55, 'access_purchases', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(56, 'create_purchases', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(57, 'show_purchases', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(58, 'edit_purchases', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(59, 'delete_purchases', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(60, 'access_purchase_payments', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(61, 'access_purchase_returns', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(62, 'create_purchase_returns', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(63, 'show_purchase_returns', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(64, 'edit_purchase_returns', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(65, 'delete_purchase_returns', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(66, 'access_purchase_return_payments', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(67, 'access_reports', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(68, 'access_currencies', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(69, 'create_currencies', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(70, 'edit_currencies', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(71, 'delete_currencies', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(72, 'access_settings', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `expiry_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_barcode_symbology` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_stock` int(11) DEFAULT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_cost` int(11) DEFAULT NULL,
  `product_price` int(11) NOT NULL,
  `product_unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_stock_alert` int(11) NOT NULL,
  `product_order_tax` int(11) DEFAULT NULL,
  `product_tax_type` tinyint(4) DEFAULT NULL,
  `product_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `expiry_date`, `product_name`, `product_code`, `product_barcode_symbology`, `opening_stock`, `product_quantity`, `product_cost`, `product_price`, `product_unit`, `product_stock_alert`, `product_order_tax`, `product_tax_type`, `product_note`, `created_at`, `updated_at`) VALUES
(2, 1, '2023-06-26', 'HOPECA PROCUCTS', '00052', 'C128', NULL, 201, 2000000, 2500000, 'Kg', 100, 18, 2, NULL, '2022-12-28 20:48:29', '2023-01-27 23:11:56'),
(3, 2, '2023-07-30', 'Unga Lishe', '00053', 'C128', 750, 687, 0, 2500000, 'Kg', 100, 18, 2, NULL, '2023-01-21 00:13:18', '2023-01-27 23:06:12');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `supplier_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT '0',
  `tax_amount` int(11) NOT NULL DEFAULT '0',
  `discount_percentage` int(11) NOT NULL DEFAULT '0',
  `discount_amount` int(11) NOT NULL DEFAULT '0',
  `shipping_amount` int(11) NOT NULL DEFAULT '0',
  `total_amount` int(11) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `due_amount` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_details`
--

CREATE TABLE `purchase_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `product_discount_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `product_tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_payments`
--

CREATE TABLE `purchase_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_returns`
--

CREATE TABLE `purchase_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `supplier_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT '0',
  `tax_amount` int(11) NOT NULL DEFAULT '0',
  `discount_percentage` int(11) NOT NULL DEFAULT '0',
  `discount_amount` int(11) NOT NULL DEFAULT '0',
  `shipping_amount` int(11) NOT NULL DEFAULT '0',
  `total_amount` int(11) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `due_amount` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return_details`
--

CREATE TABLE `purchase_return_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_return_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `product_discount_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `product_tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return_payments`
--

CREATE TABLE `purchase_return_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_return_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT '0',
  `tax_amount` int(11) NOT NULL DEFAULT '0',
  `discount_percentage` int(11) NOT NULL DEFAULT '0',
  `discount_amount` int(11) NOT NULL DEFAULT '0',
  `shipping_amount` int(11) NOT NULL DEFAULT '0',
  `total_amount` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_details`
--

CREATE TABLE `quotation_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quotation_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `product_discount_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `product_tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2022-12-12 21:03:52', '2022-12-12 21:03:52'),
(2, 'Super Admin', 'web', '2022-12-12 21:03:53', '2022-12-12 21:03:53'),
(3, 'test', 'web', '2022-12-21 15:10:46', '2022-12-21 15:10:46'),
(4, 'Super_admin', 'web', '2022-12-21 15:38:21', '2022-12-21 15:38:21');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(1, 3),
(3, 3),
(4, 3),
(5, 3),
(6, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(27, 3),
(28, 3),
(29, 3),
(30, 3),
(31, 3),
(32, 3),
(33, 3),
(34, 3),
(35, 3),
(36, 3),
(37, 3),
(38, 3),
(39, 3),
(40, 3),
(42, 3),
(43, 3),
(45, 3),
(46, 3),
(48, 3),
(49, 3),
(50, 3),
(51, 3),
(52, 3),
(53, 3),
(54, 3),
(55, 3),
(56, 3),
(57, 3),
(58, 3),
(59, 3),
(60, 3),
(61, 3),
(62, 3),
(63, 3),
(64, 3),
(65, 3),
(66, 3),
(67, 3),
(1, 4),
(2, 4),
(3, 4),
(4, 4),
(5, 4),
(6, 4),
(7, 4),
(8, 4),
(9, 4),
(10, 4),
(11, 4),
(12, 4),
(13, 4),
(14, 4),
(15, 4),
(16, 4),
(17, 4),
(18, 4),
(19, 4),
(20, 4),
(21, 4),
(22, 4),
(23, 4),
(24, 4),
(25, 4),
(26, 4),
(27, 4),
(28, 4),
(29, 4),
(30, 4),
(31, 4),
(32, 4),
(33, 4),
(34, 4),
(35, 4),
(36, 4),
(37, 4),
(38, 4),
(39, 4),
(40, 4),
(42, 4),
(43, 4),
(45, 4),
(46, 4),
(47, 4),
(48, 4),
(49, 4),
(50, 4),
(51, 4),
(52, 4),
(53, 4),
(54, 4),
(55, 4),
(56, 4),
(57, 4),
(58, 4),
(59, 4),
(60, 4),
(61, 4),
(62, 4),
(63, 4),
(64, 4),
(65, 4),
(66, 4),
(67, 4),
(68, 4),
(69, 4),
(70, 4),
(71, 4),
(72, 4);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT '0',
  `tax_amount` int(11) NOT NULL DEFAULT '0',
  `discount_percentage` int(11) NOT NULL DEFAULT '0',
  `discount_amount` int(11) NOT NULL DEFAULT '0',
  `shipping_amount` int(11) NOT NULL DEFAULT '0',
  `total_amount` int(11) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `due_amount` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_details`
--

CREATE TABLE `sale_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `product_discount_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `product_tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_payments`
--

CREATE TABLE `sale_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_returns`
--

CREATE TABLE `sale_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT '0',
  `tax_amount` int(11) NOT NULL DEFAULT '0',
  `discount_percentage` int(11) NOT NULL DEFAULT '0',
  `discount_amount` int(11) NOT NULL DEFAULT '0',
  `shipping_amount` int(11) NOT NULL DEFAULT '0',
  `total_amount` int(11) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `due_amount` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_return_details`
--

CREATE TABLE `sale_return_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_return_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `product_discount_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `product_tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_return_payments`
--

CREATE TABLE `sale_return_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_return_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_currency_id` int(11) NOT NULL,
  `default_currency_position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notification_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `company_name`, `company_email`, `company_phone`, `site_logo`, `default_currency_id`, `default_currency_position`, `notification_email`, `footer_text`, `company_address`, `created_at`, `updated_at`) VALUES
(1, 'HOPECA PRODUCTS', 'info@hopecaproducts.co.tz', '0652 100 024', NULL, 2, 'prefix', 'info@hopecaproducts.co.tz', 'HOPECA POS © 2023.', 'Mlimani Bus Stop, Sinza A, Dar es Salaam - Tanzania.', '2022-12-12 21:03:53', '2023-01-27 20:30:40');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `folder` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `is_active` tinyint(1) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `is_active`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@test.com', NULL, '$2y$10$fZ2oMurVZLXOlr.C7LNgA.qGLyfBS2iZTzBtS87bF4ZaMvLaB3UCm', 1, NULL, '2022-12-12 21:03:53', '2022-12-12 21:03:53'),
(2, 'Test user', 'user@test.com', NULL, '$2y$10$TKPpaPQVvMzKr8l2ap7ZQ.UgU/wMBBcSjxo/jwbE.CqwljdOgjIQS', 1, NULL, '2022-12-21 15:11:47', '2022-12-21 15:11:47'),
(3, 'Super Admin', 'super_admin@test.com', NULL, '$2y$10$RqkALkN1WjjLY8ujxR52QeSccoAsvGfpHuAzc2x3CXn.zMJBwgRQK', 1, NULL, '2022-12-21 15:39:45', '2022-12-21 15:39:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adjusted_products`
--
ALTER TABLE `adjusted_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjusted_products_adjustment_id_foreign` (`adjustment_id`);

--
-- Indexes for table `adjustments`
--
ALTER TABLE `adjustments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_category_code_unique` (`category_code`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_category_id_foreign` (`category_id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_product_code_unique` (`product_code`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchases_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_details_purchase_id_foreign` (`purchase_id`),
  ADD KEY `purchase_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_payments_purchase_id_foreign` (`purchase_id`);

--
-- Indexes for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_returns_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `purchase_return_details`
--
ALTER TABLE `purchase_return_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_return_details_purchase_return_id_foreign` (`purchase_return_id`),
  ADD KEY `purchase_return_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `purchase_return_payments`
--
ALTER TABLE `purchase_return_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_return_payments_purchase_return_id_foreign` (`purchase_return_id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotations_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `quotation_details`
--
ALTER TABLE `quotation_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_details_quotation_id_foreign` (`quotation_id`),
  ADD KEY `quotation_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `sale_details`
--
ALTER TABLE `sale_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_details_sale_id_foreign` (`sale_id`),
  ADD KEY `sale_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `sale_payments`
--
ALTER TABLE `sale_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_payments_sale_id_foreign` (`sale_id`);

--
-- Indexes for table `sale_returns`
--
ALTER TABLE `sale_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_returns_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `sale_return_details`
--
ALTER TABLE `sale_return_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_return_details_sale_return_id_foreign` (`sale_return_id`),
  ADD KEY `sale_return_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `sale_return_payments`
--
ALTER TABLE `sale_return_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_return_payments_sale_return_id_foreign` (`sale_return_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
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
-- AUTO_INCREMENT for table `adjusted_products`
--
ALTER TABLE `adjusted_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adjustments`
--
ALTER TABLE `adjustments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_details`
--
ALTER TABLE `purchase_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_return_details`
--
ALTER TABLE `purchase_return_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_return_payments`
--
ALTER TABLE `purchase_return_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotation_details`
--
ALTER TABLE `quotation_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `sale_details`
--
ALTER TABLE `sale_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `sale_payments`
--
ALTER TABLE `sale_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `sale_returns`
--
ALTER TABLE `sale_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sale_return_details`
--
ALTER TABLE `sale_return_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sale_return_payments`
--
ALTER TABLE `sale_return_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adjusted_products`
--
ALTER TABLE `adjusted_products`
  ADD CONSTRAINT `adjusted_products_adjustment_id_foreign` FOREIGN KEY (`adjustment_id`) REFERENCES `adjustments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `expense_categories` (`id`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD CONSTRAINT `purchase_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_details_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  ADD CONSTRAINT `purchase_payments_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD CONSTRAINT `purchase_returns_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `purchase_return_details`
--
ALTER TABLE `purchase_return_details`
  ADD CONSTRAINT `purchase_return_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_return_details_purchase_return_id_foreign` FOREIGN KEY (`purchase_return_id`) REFERENCES `purchase_returns` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_return_payments`
--
ALTER TABLE `purchase_return_payments`
  ADD CONSTRAINT `purchase_return_payments_purchase_return_id_foreign` FOREIGN KEY (`purchase_return_id`) REFERENCES `purchase_returns` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quotations`
--
ALTER TABLE `quotations`
  ADD CONSTRAINT `quotations_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `quotation_details`
--
ALTER TABLE `quotation_details`
  ADD CONSTRAINT `quotation_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `quotation_details_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sale_details`
--
ALTER TABLE `sale_details`
  ADD CONSTRAINT `sale_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `sale_details_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sale_payments`
--
ALTER TABLE `sale_payments`
  ADD CONSTRAINT `sale_payments_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sale_returns`
--
ALTER TABLE `sale_returns`
  ADD CONSTRAINT `sale_returns_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sale_return_details`
--
ALTER TABLE `sale_return_details`
  ADD CONSTRAINT `sale_return_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `sale_return_details_sale_return_id_foreign` FOREIGN KEY (`sale_return_id`) REFERENCES `sale_returns` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sale_return_payments`
--
ALTER TABLE `sale_return_payments`
  ADD CONSTRAINT `sale_return_payments_sale_return_id_foreign` FOREIGN KEY (`sale_return_id`) REFERENCES `sale_returns` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
