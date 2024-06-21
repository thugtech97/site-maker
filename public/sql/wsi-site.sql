-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 18, 2024 at 12:46 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wsi-wing-harmon`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `log_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activity_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dashboard_activity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activity_desc` text COLLATE utf8mb4_unicode_ci,
  `activity_date` datetime DEFAULT NULL,
  `db_table` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `reference` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `log_by`, `activity_type`, `dashboard_activity`, `activity_desc`, `activity_date`, `db_table`, `old_value`, `new_value`, `reference`, `created_at`, `updated_at`) VALUES
(1, NULL, 'insert', 'created a new role', 'created the role Admin', '2024-02-18 20:43:20', 'roles', '', 'Admin', '1', NULL, NULL),
(2, '1', 'update', 'updated the user firstname', 'updated the user firstname of Admin Istrator from Admin to admin', '2024-02-18 20:45:03', 'users', 'Admin', 'admin', '1', NULL, NULL),
(3, '1', 'update', 'updated the user lastname', 'updated the user lastname of Admin Istrator from Istrator to istrator', '2024-02-18 20:45:03', 'users', 'Istrator', 'istrator', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transition_in` int NOT NULL DEFAULT '1',
  `transition_out` int NOT NULL DEFAULT '2',
  `transition` int NOT NULL DEFAULT '6',
  `type` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sub_banner',
  `banner_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image',
  `user_id` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `albums`
--

INSERT INTO `albums` (`id`, `name`, `transition_in`, `transition_out`, `transition`, `type`, `banner_type`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Home Banner', 1, 2, 6, 'main_banner', 'image', 1, '2024-02-18 12:43:20', '2024-02-18 12:43:20', NULL),
(2, 'Sub Banner 1', 1, 2, 6, 'sub_banner', 'image', 1, '2024-02-18 12:43:20', '2024-02-18 12:43:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` int DEFAULT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL DEFAULT '2024-02-18',
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contents` text COLLATE utf8mb4_unicode_ci,
  `json` json DEFAULT NULL,
  `styles` text COLLATE utf8mb4_unicode_ci,
  `teaser` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `is_featured` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `image_url` text COLLATE utf8mb4_unicode_ci,
  `thumbnail_url` text COLLATE utf8mb4_unicode_ci,
  `meta_title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `user_id` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `category_id`, `slug`, `date`, `name`, `contents`, `json`, `styles`, `teaser`, `status`, `is_featured`, `image_url`, `thumbnail_url`, `meta_title`, `meta_keyword`, `meta_description`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 'this-is-a-standard-post-with-a-preview-image', '2024-02-18', 'THIS IS A STANDARD POST WITH A PREVIEW IMAGE', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cupiditate, asperiores quod est tenetur in. Eligendi, deserunt, blanditiis est quisquam doloribus voluptate id aperiam ea ipsum magni aut perspiciatis rem voluptatibus officia eos rerum deleniti quae nihil facilis repellat atque vitae voluptatem libero at eveniet veritatis ab facere.', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Published', '1', 'http://127.0.0.1:8000/theme/images/news/news1.jpg', 'http://127.0.0.1:8000/theme/images/news/news1.jpg', 'title', 'keyword', 'description', '1', '2024-02-18 12:43:20', '2024-02-18 12:43:20', NULL),
(2, NULL, 'this-is-a-standard-post-with-a-preview-image-2', '2024-02-18', 'THIS IS A STANDARD POST WITH A PREVIEW IMAGE-2', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cupiditate, asperiores quod est tenetur in. Eligendi, deserunt, blanditiis est quisquam doloribus voluptate id aperiam ea ipsum magni aut perspiciatis rem voluptatibus officia eos rerum deleniti quae nihil facilis repellat atque vitae voluptatem libero at eveniet veritatis ab facere.', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Published', '1', 'http://127.0.0.1:8000/theme/images/news/news2.jpg', 'http://127.0.0.1:8000/theme/images/news/news2.jpg', 'title', 'keyword', 'description', '1', '2024-02-18 12:43:20', '2024-02-18 12:43:20', NULL),
(3, NULL, 'this-is-a-standard-post-with-a-preview-image-3', '2024-02-18', 'THIS IS A STANDARD POST WITH A PREVIEW IMAGE-3', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cupiditate, asperiores quod est tenetur in. Eligendi, deserunt, blanditiis est quisquam doloribus voluptate id aperiam ea ipsum magni aut perspiciatis rem voluptatibus officia eos rerum deleniti quae nihil facilis repellat atque vitae voluptatem libero at eveniet veritatis ab facere.', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Published', '1', 'http://127.0.0.1:8000/theme/images/news/news3.jpg', 'http://127.0.0.1:8000/theme/images/news/news3.jpg', 'title', 'keyword', 'description', '1', '2024-02-18 12:43:20', '2024-02-18 12:43:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `article_categories`
--

CREATE TABLE `article_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `album_id` int NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `alt` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `button_text` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `album_id`, `title`, `description`, `alt`, `image_path`, `button_text`, `url`, `order`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Best way to save your Money.', 'Interactively seize bricks-and-clicks channels before empowered users. Uniquely maximize bleeding-edge outsourcing.', 'Banner 1', 'http://127.0.0.1:8000/theme/images/banners/image1.jpg', NULL, 'http://127.0.0.1:8000', 1, 1, '2024-02-18 12:43:20', '2024-02-18 12:43:20', NULL),
(2, 1, 'Beautifully Flexible', 'Looks beautiful &amp; ultra-sharp on Retina Screen Displays. Powerful Layout with Responsive functionality that can be adapted to any screen size.', NULL, 'http://127.0.0.1:8000/theme/images/banners/image2.jpg', NULL, NULL, 2, 1, '2024-02-18 12:43:20', '2024-02-18 12:43:20', NULL),
(3, 1, 'Great Performance', 'You\'ll be surprised to see the Final Results of your Creation &amp; would crave for more.', NULL, 'http://127.0.0.1:8000/theme/images/banners/image3.jpg', NULL, NULL, 3, 1, '2024-02-18 12:43:20', '2024-02-18 12:43:20', NULL),
(4, 2, NULL, NULL, NULL, 'http://127.0.0.1:8000/theme/images/banners/banner.png', NULL, NULL, 2, 1, '2024-02-18 12:43:20', '2024-02-18 12:43:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `email_recipients`
--

CREATE TABLE `email_recipients` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` int NOT NULL DEFAULT '0',
  `pages_json` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `is_active`, `pages_json`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Menu 1', 1, '[]', NULL, '2024-02-18 12:43:20', '2024-02-18 12:43:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menu_has_pages`
--

CREATE TABLE `menu_has_pages` (
  `id` bigint UNSIGNED NOT NULL,
  `menu_id` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  `page_id` int DEFAULT NULL,
  `page_order` int NOT NULL,
  `label` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uri` text COLLATE utf8mb4_unicode_ci,
  `target` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_has_pages`
--

INSERT INTO `menu_has_pages` (`id`, `menu_id`, `parent_id`, `page_id`, `page_order`, `label`, `uri`, `target`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 0, 1, 1, '', '', '', 'page', '2024-02-18 12:43:20', '2024-02-18 12:43:20', NULL),
(2, 1, 0, 2, 2, '', '', '', 'page', '2024-02-18 12:43:20', '2024-02-18 12:43:20', NULL),
(3, 1, 0, 3, 3, '', '', '', 'page', '2024-02-18 12:43:20', '2024-02-18 12:43:20', NULL),
(4, 1, 0, 5, 4, '', '', '', 'page', '2024-02-18 12:43:20', '2024-02-18 12:43:20', NULL),
(5, 1, 0, 6, 5, '', '', '', 'page', '2024-02-18 12:43:20', '2024-02-18 12:43:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_12_05_044926_create_settings_table', 1),
(6, '2022_12_05_045653_create_menus_table', 1),
(7, '2022_12_05_045836_create_menu_has_pages_table', 1),
(8, '2022_12_05_064934_create_activity_logs_table', 1),
(9, '2022_12_05_065748_create_permissions_table', 1),
(10, '2022_12_05_073918_create_pages_table', 1),
(11, '2022_12_05_074752_create_albums_table', 1),
(12, '2022_12_05_075318_create_articles_table', 1),
(13, '2022_12_05_075328_create_article_categories_table', 1),
(14, '2022_12_05_080128_create_roles_table', 1),
(15, '2022_12_14_012326_create_options_table', 1),
(16, '2022_12_14_012535_create_banners_table', 1),
(17, '2022_12_14_040626_create_social_media_accounts_table', 1),
(18, '2022_12_14_074742_create_role_permission_table', 1),
(19, '2023_02_21_142534_create_email_recipients_table', 1),
(20, '2023_02_27_025744_add_contact_us_email_layout_in_settings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_type` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `type`, `name`, `value`, `field_type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'animation', 'Fade In', 'fadeIn', 'entrance', NULL, NULL, NULL),
(2, 'animation', 'Fade Out', 'fadeOut', 'exit', NULL, NULL, NULL),
(3, 'animation', 'Fade In Down', 'fadeInDown', 'entrance', NULL, NULL, NULL),
(4, 'animation', 'Fade Out Down', 'fadeOutDown', 'exit', NULL, NULL, NULL),
(5, 'animation', 'Fade In Down Big', 'fadeInDownBig', 'entrance', NULL, NULL, NULL),
(6, 'animation', 'Fade Out Down Big', 'fadeOutDownBig', 'exit', NULL, NULL, NULL),
(7, 'animation', 'Fade In Left', 'fadeInLeft', 'entrance', NULL, NULL, NULL),
(8, 'animation', 'Fade Out Left', 'fadeOutLeft', 'exit', NULL, NULL, NULL),
(9, 'animation', 'Fade In Left Big', 'fadeInLeftBig', 'entrance', NULL, NULL, NULL),
(10, 'animation', 'Fade Out Left Big', 'fadeOutDownBig', 'exit', NULL, NULL, NULL),
(11, 'animation', 'Fade In Right', 'fadeInRight', 'entrance', NULL, NULL, NULL),
(12, 'animation', 'Fade Out Right', 'fadeOutRight', 'exit', NULL, NULL, NULL),
(13, 'animation', 'Fade In Right Big', 'fadeInRightBig', 'entrance', NULL, NULL, NULL),
(14, 'animation', 'Fade Out Right Big', 'fadeInRightBig', 'exit', NULL, NULL, NULL),
(15, 'animation', 'Fade In Up', 'fadeInUp', 'entrance', NULL, NULL, NULL),
(16, 'animation', 'Fade Out Up', 'fadeOutUp', 'exit', NULL, NULL, NULL),
(17, 'animation', 'Fade In Up Big', 'fadeInUpBig', 'entrance', NULL, NULL, NULL),
(18, 'animation', 'Fade Out Up Big', 'fadeInUpBig', 'exit', NULL, NULL, NULL),
(19, 'animation', 'Bounce In', 'bounceIn', 'entrance', NULL, NULL, NULL),
(20, 'animation', 'Bounce Out', 'bounceOut', 'exit', NULL, NULL, NULL),
(21, 'animation', 'Bounce In Down', 'bounceInDown', 'entrance', NULL, NULL, NULL),
(22, 'animation', 'Bounce Out Down', 'bounceOutDown', 'exit', NULL, NULL, NULL),
(23, 'animation', 'Bounce In Left', 'bounceInLeft', 'entrance', NULL, NULL, NULL),
(24, 'animation', 'Bounce Out Left', 'bounceOutLeft', 'exit', NULL, NULL, NULL),
(25, 'animation', 'Bounce In Right', 'bounceInRight', 'entrance', NULL, NULL, NULL),
(26, 'animation', 'Bounce Out Right', 'bounceOutRight', 'exit', NULL, NULL, NULL),
(27, 'animation', 'Bounce In Up', 'bounceInUp', 'entrance', NULL, NULL, NULL),
(28, 'animation', 'Bounce Out Up', 'bounceOutUp', 'exit', NULL, NULL, NULL),
(29, 'animation', 'Route In', 'rotateIn', 'entrance', NULL, NULL, NULL),
(30, 'animation', 'Route Out', 'rotateOut', 'exit', NULL, NULL, NULL),
(31, 'animation', 'Route In Down Left', 'rotateInDownLeft', 'entrance', NULL, NULL, NULL),
(32, 'animation', 'Route Out Down Left', 'rotateOutDownLeft', 'exit', NULL, NULL, NULL),
(33, 'animation', 'Route In Down Right', 'rotateInDownRight', 'entrance', NULL, NULL, NULL),
(34, 'animation', 'Route Out Down Right', 'rotateOutDownRight', 'exit', NULL, NULL, NULL),
(35, 'animation', 'Route In Up Left', 'rotateInUpLeft', 'entrance', NULL, NULL, NULL),
(36, 'animation', 'Route Out Up Left', 'rotateOutUpLeft', 'exit', NULL, NULL, NULL),
(37, 'animation', 'Route In Up Right', 'rotateInUpRight', 'entrance', NULL, NULL, NULL),
(38, 'animation', 'Route Out Up Right', 'rotateOutUpRight', 'exit', NULL, NULL, NULL),
(39, 'animation', 'Slide In Up', 'slideInUp', 'entrance', NULL, NULL, NULL),
(40, 'animation', 'Slide Out Up', 'slideOutUp', 'exit', NULL, NULL, NULL),
(41, 'animation', 'Slide In Down', 'slideInDown', 'entrance', NULL, NULL, NULL),
(42, 'animation', 'Slide Out Down', 'slideOutDown', 'exit', NULL, NULL, NULL),
(43, 'animation', 'Slide In Left', 'slideInLeft', 'entrance', NULL, NULL, NULL),
(44, 'animation', 'Slide Out Left', 'slideOutLeft', 'exit', NULL, NULL, NULL),
(45, 'animation', 'Slide In Right', 'slideInRight', 'entrance', NULL, NULL, NULL),
(46, 'animation', 'Slide Out Right', 'slideOutRight', 'exit', NULL, NULL, NULL),
(47, 'animation', 'Zoom In', 'zoomIn', 'entrance', NULL, NULL, NULL),
(48, 'animation', 'Zoom Out', 'zoomOut', 'exit', NULL, NULL, NULL),
(49, 'animation', 'Zoom In Down', 'zoomInDown', 'entrance', NULL, NULL, NULL),
(50, 'animation', 'Zoom Out Down', 'zoomOutDown', 'exit', NULL, NULL, NULL),
(51, 'animation', 'Zoom In Left', 'zoomInLeft', 'entrance', NULL, NULL, NULL),
(52, 'animation', 'Zoom Out Left', 'zoomOutLeft', 'exit', NULL, NULL, NULL),
(53, 'animation', 'Zoom In Right', 'zoomInRight', 'entrance', NULL, NULL, NULL),
(54, 'animation', 'Zoom Out Right', 'zoomOutRight', 'exit', NULL, NULL, NULL),
(55, 'animation', 'Zoom In Up', 'zoomInUp', 'entrance', NULL, NULL, NULL),
(56, 'animation', 'Zoom Out Up', 'zoomOutUp', 'exit', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_page_id` int DEFAULT NULL,
  `album_id` int DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contents` text COLLATE utf8mb4_unicode_ci,
  `json` json DEFAULT NULL,
  `styles` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `page_type` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'custom',
  `image_url` text COLLATE utf8mb4_unicode_ci,
  `meta_title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `parent_page_id`, `album_id`, `slug`, `name`, `label`, `contents`, `json`, `styles`, `status`, `page_type`, `image_url`, `meta_title`, `meta_keyword`, `meta_description`, `user_id`, `template`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 1, 'home', 'Home', 'Home', '', NULL, NULL, 'PUBLISHED', 'default', '', 'Home', 'home', 'Home page', '1', 'home', '2024-02-18 12:43:20', '2024-02-18 12:43:20', NULL),
(2, 0, 2, 'about-us', 'About', 'About', '', NULL, NULL, 'PUBLISHED', 'standard', '', 'About Us', 'About Us', 'About Us page', '1', '', '2024-02-18 12:43:20', '2024-02-18 12:43:20', NULL),
(3, 0, 2, 'contact-us', 'Contact Us', 'Contact Us', '', NULL, NULL, 'PUBLISHED', 'standard', '', 'Contact Us', 'Contact Us', 'Contact Us page', '1', 'contact-us', '2024-02-18 12:43:20', '2024-02-18 12:43:20', NULL),
(4, 0, 0, 'footer', 'Footer', 'Footer', '', NULL, NULL, 'PUBLISHED', 'standard', '', '', '', '', '1', '', '2024-02-18 12:43:20', '2024-02-18 12:43:20', NULL),
(5, 0, 2, 'news', 'News', 'News', '', NULL, NULL, 'PUBLISHED', 'standard', '', 'News', 'News', 'News page', '1', 'news-list', '2024-02-18 12:43:20', '2024-02-18 12:43:20', NULL),
(6, 0, 2, 'services', 'Services', 'Services', '', NULL, NULL, 'PUBLISHED', 'standard', '', 'Services', 'Services', 'Services page', '1', '', '2024-02-18 12:43:20', '2024-02-18 12:43:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `routes` text COLLATE utf8mb4_unicode_ci,
  `methods` text COLLATE utf8mb4_unicode_ci,
  `user_id` int NOT NULL,
  `is_view_page` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'Administrator of the system', 1, '2024-02-18 12:43:20', '2024-02-18 12:43:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `user_id` int NOT NULL,
  `isAllowed` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `api_key` text COLLATE utf8mb4_unicode_ci,
  `website_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website_favicon` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_logo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_favicon` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_about` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `google_analytics` text COLLATE utf8mb4_unicode_ci,
  `google_map` text COLLATE utf8mb4_unicode_ci,
  `google_recaptcha_sitekey` text COLLATE utf8mb4_unicode_ci,
  `google_recaptcha_secret` text COLLATE utf8mb4_unicode_ci,
  `data_privacy_title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_privacy_popup_content` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_privacy_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tel_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_accounts` text COLLATE utf8mb4_unicode_ci,
  `copyright` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `min_order` int NOT NULL DEFAULT '0',
  `promo_is_displayed` int NOT NULL DEFAULT '0',
  `review_is_allowed` int NOT NULL DEFAULT '0',
  `pickup_is_allowed` int NOT NULL DEFAULT '1',
  `delivery_note` text COLLATE utf8mb4_unicode_ci,
  `min_order_is_allowed` int NOT NULL DEFAULT '1',
  `flatrate_is_allowed` int NOT NULL DEFAULT '1',
  `delivery_collect_is_allowed` int NOT NULL DEFAULT '1',
  `accepted_payments` text COLLATE utf8mb4_unicode_ci,
  `coupon_limit` int DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `contact_us_email_layout` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `api_key`, `website_name`, `website_favicon`, `company_logo`, `company_favicon`, `company_name`, `company_about`, `company_address`, `google_analytics`, `google_map`, `google_recaptcha_sitekey`, `google_recaptcha_secret`, `data_privacy_title`, `data_privacy_popup_content`, `data_privacy_content`, `mobile_no`, `fax_no`, `tel_no`, `email`, `social_media_accounts`, `copyright`, `user_id`, `min_order`, `promo_is_displayed`, `review_is_allowed`, `pickup_is_allowed`, `delivery_note`, `min_order_is_allowed`, `flatrate_is_allowed`, `delivery_collect_is_allowed`, `accepted_payments`, `coupon_limit`, `created_at`, `updated_at`, `deleted_at`, `contact_us_email_layout`) VALUES
(1, '', 'Ruiz and Hammond Plc', 'favicon.ico', 'site-logo.png', '', 'Ruiz and Hammond Plc', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '795 Folsom Ave, Suite 600 San Francisco, CA 94107', NULL, 'https://www.google.com/maps?ll=14.584069,121.062934&z=17&t=m&hl=en&gl=PH&mapclient=embed&cid=4804121224053792784', '6Lfgj7cUAAAAAJfCgUcLg4pjlAOddrmRPt86tkQK', '6Lfgj7cUAAAAALOaFTbSFgCXpJldFkG8nFET9eRx', 'Privacy-Policy', 'This website uses cookies to ensure you get the best experience.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '(1) 8547 632521', '13232107114', '(1) 11 4752 1433', 'info@canvas.com', '', '2022-2023', 1, 0, 0, 0, 1, NULL, 1, 1, 1, NULL, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `social_media`
--

CREATE TABLE `social_media` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_account` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` text COLLATE utf8mb4_unicode_ci,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int DEFAULT NULL,
  `is_active` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_street` text COLLATE utf8mb4_unicode_ci,
  `address_city` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_municipality` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `firstname`, `lastname`, `avatar`, `email_verified_at`, `password`, `role_id`, `is_active`, `user_id`, `mobile`, `phone`, `address_street`, `address_city`, `address_municipality`, `address_zip`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin Istrator', 'wsiprod.demo@gmail.com', 'admin', 'istrator', NULL, '2024-02-18 12:43:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 1, 1, '09456714321', '022646545', 'Maharlika St', 'Pasay', NULL, '1234', 'Hia0QMmEvZyu4ZIB24wHo7yJP0eriA6F7FObVQf0GNifFqJehIZHbQ2YexPj', '2024-02-18 12:43:20', '2024-02-18 12:43:20', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `articles_slug_unique` (`slug`);

--
-- Indexes for table `article_categories`
--
ALTER TABLE `article_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_recipients`
--
ALTER TABLE `email_recipients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_has_pages`
--
ALTER TABLE `menu_has_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_media`
--
ALTER TABLE `social_media`
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
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `article_categories`
--
ALTER TABLE `article_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `email_recipients`
--
ALTER TABLE `email_recipients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_has_pages`
--
ALTER TABLE `menu_has_pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `role_permission`
--
ALTER TABLE `role_permission`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `social_media`
--
ALTER TABLE `social_media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
