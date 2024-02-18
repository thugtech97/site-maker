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
(4, 2, NULL, NULL, NULL, 'http://127.0.0.1:8000/theme/images/banners/sub1.jpg', NULL, NULL, 2, 1, '2024-02-18 12:43:20', '2024-02-18 12:43:20', NULL),
(5, 2, NULL, NULL, NULL, 'http://127.0.0.1:8000/theme/images/banners/sub2.jpg', NULL, NULL, 3, 1, '2024-02-18 12:43:20', '2024-02-18 12:43:20', NULL);

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
(3, 1, 0, 3, 3, '', '', '', 'page', '2024-02-18 12:43:20', '2024-02-18 12:43:20', NULL);

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
(4, 0, 0, 'footer', 'Footer', 'Footer', '<footer id=\"footer\" draggable=\"true\" data-highlightable=\"1\" class=\"border-0 border-top\">\r\n                    <div id=\"copyrights\" draggable=\"true\" data-highlightable=\"1\"><div id=\"i4xn9t\" draggable=\"true\" data-highlightable=\"1\" class=\"container\"><div id=\"iswjil\" draggable=\"true\" data-highlightable=\"1\" class=\"row justify-content-between\"><div id=\"iq9mwh\" draggable=\"true\" data-highlightable=\"1\" class=\"col\"><span id=\"ing3xk\" draggable=\"true\" data-highlightable=\"1\" class=\"text-black-50\">© 2023 House of Travel, Inc.</span><a id=\"iwrref\" draggable=\"true\" data-highlightable=\"1\" href=\"https://beta.houseoftravel.com.ph/privacy-policy-2\" class=\"gjs-comp-selected\">&nbsp; Privacy Policy&nbsp;</a></div><div id=\"iolzho\" draggable=\"true\" data-highlightable=\"1\" class=\"col text-end\">\r\n                    <a id=\"ih72js\" draggable=\"true\" data-highlightable=\"1\" href=\"https://beta.houseoftravel.com.ph/\">Home</a>/\r\n                    <a id=\"ie71qy\" draggable=\"true\" data-highlightable=\"1\" href=\"https://beta.houseoftravel.com.ph/about-us\">About</a>/\r\n                    <a id=\"iov9rf\" draggable=\"true\" data-highlightable=\"1\" href=\"https://beta.houseoftravel.com.ph/services\">Services</a>/\r\n                    <a id=\"iscxtz\" draggable=\"true\" data-highlightable=\"1\" href=\"https://beta.houseoftravel.com.ph/tour-packages\">Tour Packages</a>/\r\n                    <a id=\"ij9ta8\" draggable=\"true\" data-highlightable=\"1\" href=\"https://beta.houseoftravel.com.ph/contact-us\">Contact Us</a></div></div></div></div></footer>', '{\"gjs-css\": \"* { box-sizing: border-box; } body {margin: 0;}*{box-sizing:border-box;}body{margin:0;}#iwrref{margin:0 5px 0 5px;}section:empty{min-height:40px;}#iemunx{padding:5px 5px 5px 5px;}#i1i6is{max-width:100%;padding:0 8.5% 0 8.5%;}#iitz4f{padding:5px 0 5px 0;margin:0 0 0 0;}#ixv6f{color:#eeeeee;}#id8oa{color:#eeeeee;}#ik38c{color:#eeeeee;}#ik5dp{color:#eeeeee;}#ismbm{color:#eeeeee;}#ikcll{color:#eeeeee;}#ifhz9{color:#ffffff;}#i4wol{color:#eeeeee;}#ieq4nl{color:#eeeeee;}#imbj0k{color:#eeeeee;}#footer{color:#ffffff;}#is88i{color:#ffffff;}#ivj09{color:#ffffff;}#ifd2fw{color:#ffffff;}#i806og{color:#ffffff;}#ib5gh{color:#ffffff;}#i7ksx3{color:#ffffff;}\", \"gjs-html\": \"<footer id=\\\"footer\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"border-0 border-top\\\"><section id=\\\"iemunx\\\"><div id=\\\"i1i6is\\\" class=\\\"container\\\"><img id=\\\"i97g\\\" draggable=\\\"true\\\" src=\\\"http://beta.houseoftravel.com.ph/theme/images/hoti-logo-white.png\\\"/><div id=\\\"iitz4f\\\" class=\\\"row\\\"><div id=\\\"i9hpi\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"dark col-lg-4 col-md-12 col-sm-12\\\"><div id=\\\"iyu6m\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"table-responsive\\\"><table id=\\\"izdyd\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><tbody id=\\\"ijf7w\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><tr id=\\\"i765f\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><td id=\\\"inf9q\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><i id=\\\"inpex\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"bg-transparent i-small icon-line-map-pin m-0 me-1\\\">\\n\\t\\t\\t\\t\\t\\t</i></td><td id=\\\"izomi\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><h5 id=\\\"ifznr\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"m-0\\\">2/F Anflocor Building 411 Quirino Aveñue, corner NAIA Road, Barangay Tambo Parañaque City, Metro Manila\\n\\t\\t\\t\\t\\t\\t</h5></td></tr><tr id=\\\"iozpx\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><td id=\\\"i03ak\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" colspan=\\\"2\\\"> \\n\\t\\t\\t\\t\\t  </td></tr><tr id=\\\"ia1cj\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><td id=\\\"iag9y\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><i id=\\\"ia1kf\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"bg-transparent i-small icon-phone1 m-0 me-1\\\">\\n\\t\\t\\t\\t\\t\\t</i></td><td id=\\\"igz76\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><h6 id=\\\"irysp\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"m-0\\\">(+63) (2) 8832-2404 \\n\\t\\t\\t\\t\\t\\t  <br id=\\\"i78p4\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"/>(+63) (2) 8853-3988 \\n\\t\\t\\t\\t\\t\\t  <br id=\\\"i6d22\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"/>(+63) (2) 8855-2741 to 47\\n\\t\\t\\t\\t\\t\\t</h6></td></tr><tr id=\\\"imkem\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><td id=\\\"ihmmh\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" colspan=\\\"2\\\"> \\n\\t\\t\\t\\t\\t  </td></tr><tr id=\\\"i5pst\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><td id=\\\"iciiw\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><i id=\\\"i9wty\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"bg-transparent i-small icon-clock2 m-0 me-1\\\">\\n\\t\\t\\t\\t\\t\\t</i></td><td id=\\\"i0tk3\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><h6 id=\\\"ioaqz\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"m-0\\\">Monday – Thursday: 8:00AM – 6:00PM\\n\\t\\t\\t\\t\\t\\t  <br id=\\\"iq13r\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"/>Friday: 8:00AM – 5:00PM\\n\\t\\t\\t\\t\\t\\t</h6></td></tr></tbody></table></div>\\n\\t\\t\\t  {Media Accounts}\\n\\t\\t\\t  <br id=\\\"ij6mf\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"/><br id=\\\"i35sy\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"/></div><div id=\\\"im0vg\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"col-md-12 col-lg-4 col-sm-12\\\"><div id=\\\"i8yzj\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"mb-2 text-white\\\"><h5 id=\\\"ismbm\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"m-0 text-white\\\">Ticketing Department\\n\\t\\t\\t\\t\\t</h5><small id=\\\"ikcll\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"text-white\\\">For ticketing and reservation inquiry:</small><table id=\\\"iawlb\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"table-responsive m-0\\\"><tbody id=\\\"ip7ed\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><tr id=\\\"iovu5\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><td id=\\\"ii3p8\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><i id=\\\"ib5gh\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"bg-transparent i-small icon-envelope21 m-0 me-1\\\">\\n\\t\\t\\t\\t\\t\\t\\t</i></td><td id=\\\"ibklk\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><a id=\\\"ijt3f\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" href=\\\"mailto:ticketing@houseoftravel.com.ph\\\" class=\\\"text-white text-decoration-underline\\\">ticketing@houseoftravel.com.ph</a></td></tr></tbody></table></div><div id=\\\"izono\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"mb-2 text-white\\\"><h5 id=\\\"ik5dp\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"m-0 text-white\\\">Tours Department\\n\\t\\t\\t\\t\\t</h5><small id=\\\"ik38c\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"text-white\\\">For tour packages inquiry:</small><table id=\\\"it2pi\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"table-responsive m-0\\\"><tbody id=\\\"iff25\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><tr id=\\\"i5ohp\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><td id=\\\"imwvf\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><i id=\\\"ivj09\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"bg-transparent i-small icon-envelope21 m-0 me-1\\\">\\n\\t\\t\\t\\t\\t\\t\\t</i></td><td id=\\\"iruvx\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><a id=\\\"ichbn\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" href=\\\"mailto:tours@houseoftravel.com.ph\\\" class=\\\"text-white text-decoration-underline\\\">tours@houseoftravel.com.ph</a></td></tr></tbody></table></div><div id=\\\"iwaih\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"mb-2 text-white\\\"><h5 id=\\\"id8oa\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"m-0 text-white\\\">Documentation Department\\n\\t\\t\\t\\t\\t</h5><small id=\\\"ixv6f\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\">For passport, visa and other document concern:</small><table id=\\\"i9vkr\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"table-responsive m-0\\\"><tbody id=\\\"iwf7g\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><tr id=\\\"ilzqd\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><td id=\\\"iback\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><i id=\\\"is88i\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"bg-transparent i-small icon-envelope21 m-0 me-1\\\">\\n\\t\\t\\t\\t\\t\\t\\t</i></td><td id=\\\"iwkb6\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><a id=\\\"iq2lj\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" href=\\\"mailto:documentation@houseoftravel.com.ph\\\" class=\\\"text-white text-decoration-underline\\\">documentation@houseoftravel.com.ph</a></td></tr></tbody></table></div></div><div id=\\\"iaifs\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"col-md-12 col-lg-4 col-sm-12\\\"><div id=\\\"i81p7\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"mb-2 text-white\\\"><h5 id=\\\"ifhz9\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"m-0 text-white\\\">Pearl Farm Manila Department\\n\\t\\t\\t\\t\\t</h5><small id=\\\"i4wol\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\">For pearl farm reservation inquiry:</small><table id=\\\"idjjx\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"table-responsive m-0\\\"><tbody id=\\\"it0os\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><tr id=\\\"ink37\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><td id=\\\"ig49e\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><i id=\\\"i806og\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"bg-transparent i-small icon-envelope21 m-0 me-1\\\">\\n\\t\\t\\t\\t\\t\\t\\t</i></td><td id=\\\"ikbbuo\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><a id=\\\"ismtwg\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" href=\\\"mailto:pearlfarm@houseoftravel.com.ph\\\" class=\\\"text-white text-decoration-underline\\\">pearlfarm@houseoftravel.com.ph</a></td></tr></tbody></table></div><div id=\\\"ihg0lv\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"mb-2 text-white\\\"><h5 id=\\\"ieq4nl\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"m-0 text-white\\\">Technical Support Department\\n\\t\\t\\t\\t\\t</h5><small id=\\\"imbj0k\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"text-white\\\">For website technical issues concern:</small><table id=\\\"iicpq8\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"table-responsive m-0\\\"><tbody id=\\\"i80qym\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><tr id=\\\"iqdx0t\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><td id=\\\"i7ksx3\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><i id=\\\"ifd2fw\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"bg-transparent i-small icon-envelope21 m-0 me-1\\\">\\n\\t\\t\\t\\t\\t\\t\\t</i></td><td id=\\\"ipuzup\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><a id=\\\"iglj8q\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" href=\\\"mailto:support@houseoftravel.com.ph\\\" class=\\\"text-white text-decoration-underline\\\">support@houseoftravel.com.ph</a></td></tr></tbody></table></div></div></div></div></section><!-- Copyrights\\n============================================= --><div id=\\\"copyrights\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\"><div id=\\\"i4xn9t\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"container\\\"><div id=\\\"iswjil\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"row justify-content-between\\\"><div id=\\\"iq9mwh\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"col\\\"><span id=\\\"ing3xk\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"text-black-50\\\">© 2023 House of Travel, Inc.</span><a id=\\\"iwrref\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" href=\\\"https://beta.houseoftravel.com.ph/privacy-policy-2\\\" class=\\\"gjs-comp-selected\\\">&nbsp; Privacy Policy&nbsp;</a></div><div id=\\\"iolzho\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" class=\\\"col text-end\\\"><a id=\\\"ih72js\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" href=\\\"https://beta.houseoftravel.com.ph/\\\">Home</a>/\\n\\t\\t  <a id=\\\"ie71qy\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" href=\\\"https://beta.houseoftravel.com.ph/about-us\\\">About</a>/\\n\\t\\t  <a id=\\\"iov9rf\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" href=\\\"https://beta.houseoftravel.com.ph/services\\\">Services</a>/\\n\\t\\t  <a id=\\\"iscxtz\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" href=\\\"https://beta.houseoftravel.com.ph/tour-packages\\\">Tour Packages</a>/\\n\\t\\t  <a id=\\\"ij9ta8\\\" draggable=\\\"true\\\" data-highlightable=\\\"1\\\" href=\\\"https://beta.houseoftravel.com.ph/contact-us\\\">Contact Us</a></div></div></div></div><!-- #copyrights end --></footer><!-- #footer end -->\", \"gjs-assets\": \"[]\", \"gjs-styles\": \"[{\\\"selectors\\\":[],\\\"selectorsAdd\\\":\\\"*\\\",\\\"style\\\":{\\\"box-sizing\\\":\\\"border-box\\\"}},{\\\"selectors\\\":[],\\\"selectorsAdd\\\":\\\"body\\\",\\\"style\\\":{\\\"margin\\\":\\\"0\\\"}},{\\\"selectors\\\":[\\\"#iwrref\\\"],\\\"style\\\":{\\\"margin\\\":\\\"0 5px 0 5px\\\"}},{\\\"selectors\\\":[],\\\"selectorsAdd\\\":\\\"section:empty\\\",\\\"style\\\":{\\\"min-height\\\":\\\"40px\\\"}},{\\\"selectors\\\":[\\\"#iemunx\\\"],\\\"style\\\":{\\\"padding\\\":\\\"5px 5px 5px 5px\\\"}},{\\\"selectors\\\":[\\\"#i1i6is\\\"],\\\"style\\\":{\\\"max-width\\\":\\\"100%\\\",\\\"padding\\\":\\\"0 8.5% 0 8.5%\\\"}},{\\\"selectors\\\":[\\\"#iitz4f\\\"],\\\"style\\\":{\\\"padding\\\":\\\"5px 0 5px 0\\\",\\\"margin\\\":\\\"0 0 0 0\\\"}},{\\\"selectors\\\":[\\\"#ixv6f\\\"],\\\"style\\\":{\\\"color\\\":\\\"#eeeeee\\\"}},{\\\"selectors\\\":[\\\"#id8oa\\\"],\\\"style\\\":{\\\"color\\\":\\\"#eeeeee\\\"}},{\\\"selectors\\\":[\\\"#ik38c\\\"],\\\"style\\\":{\\\"color\\\":\\\"#eeeeee\\\"}},{\\\"selectors\\\":[\\\"#ik5dp\\\"],\\\"style\\\":{\\\"color\\\":\\\"#eeeeee\\\"}},{\\\"selectors\\\":[\\\"#ismbm\\\"],\\\"style\\\":{\\\"color\\\":\\\"#eeeeee\\\"}},{\\\"selectors\\\":[\\\"#ikcll\\\"],\\\"style\\\":{\\\"color\\\":\\\"#eeeeee\\\"}},{\\\"selectors\\\":[\\\"#ifhz9\\\"],\\\"style\\\":{\\\"color\\\":\\\"#ffffff\\\"}},{\\\"selectors\\\":[\\\"#i4wol\\\"],\\\"style\\\":{\\\"color\\\":\\\"#eeeeee\\\"}},{\\\"selectors\\\":[\\\"#ieq4nl\\\"],\\\"style\\\":{\\\"color\\\":\\\"#eeeeee\\\"}},{\\\"selectors\\\":[\\\"#imbj0k\\\"],\\\"style\\\":{\\\"color\\\":\\\"#eeeeee\\\"}},{\\\"selectors\\\":[\\\"#footer\\\"],\\\"style\\\":{\\\"color\\\":\\\"#ffffff\\\"}},{\\\"selectors\\\":[\\\"#is88i\\\"],\\\"style\\\":{\\\"color\\\":\\\"#ffffff\\\"}},{\\\"selectors\\\":[\\\"#ivj09\\\"],\\\"style\\\":{\\\"color\\\":\\\"#ffffff\\\"}},{\\\"selectors\\\":[\\\"#ifd2fw\\\"],\\\"style\\\":{\\\"color\\\":\\\"#ffffff\\\"}},{\\\"selectors\\\":[\\\"#i806og\\\"],\\\"style\\\":{\\\"color\\\":\\\"#ffffff\\\"}},{\\\"selectors\\\":[\\\"#ib5gh\\\"],\\\"style\\\":{\\\"color\\\":\\\"#ffffff\\\"}},{\\\"selectors\\\":[\\\"#i7ksx3\\\"],\\\"style\\\":{\\\"color\\\":\\\"#ffffff\\\"}}]\", \"gjs-components\": \"[{\\\"tagName\\\":\\\"footer\\\",\\\"type\\\":\\\"default\\\",\\\"classes\\\":[\\\"border-0\\\",\\\"border-top\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"footer\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"tagName\\\":\\\"section\\\",\\\"attributes\\\":{\\\"id\\\":\\\"iemunx\\\"},\\\"components\\\":[{\\\"type\\\":\\\"container\\\",\\\"classes\\\":[\\\"container\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"i1i6is\\\"},\\\"components\\\":[{\\\"type\\\":\\\"image\\\",\\\"attributes\\\":{\\\"id\\\":\\\"i97g\\\",\\\"draggable\\\":\\\"true\\\",\\\"src\\\":\\\"http://beta.houseoftravel.com.ph/theme/images/hoti-logo-white.png\\\"}},{\\\"type\\\":\\\"row\\\",\\\"classes\\\":[\\\"row\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"iitz4f\\\"},\\\"components\\\":[{\\\"type\\\":\\\"column\\\",\\\"classes\\\":[\\\"dark\\\",\\\"col-lg-4\\\",\\\"col-md-12\\\",\\\"col-sm-12\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"i9hpi\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"default\\\",\\\"classes\\\":[\\\"table-responsive\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"iyu6m\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"table\\\",\\\"attributes\\\":{\\\"id\\\":\\\"izdyd\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"tbody\\\",\\\"attributes\\\":{\\\"id\\\":\\\"ijf7w\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"tagName\\\":\\\"tr\\\",\\\"type\\\":\\\"default\\\",\\\"attributes\\\":{\\\"id\\\":\\\"i765f\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"cell\\\",\\\"attributes\\\":{\\\"id\\\":\\\"inf9q\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"tagName\\\":\\\"i\\\",\\\"type\\\":\\\"icon\\\",\\\"classes\\\":[\\\"bg-transparent\\\",\\\"i-small\\\",\\\"icon-line-map-pin\\\",\\\"m-0\\\",\\\"me-1\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"inpex\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"\\n\\t\\t\\t\\t\\t\\t\\\"}]}]},{\\\"type\\\":\\\"cell\\\",\\\"attributes\\\":{\\\"id\\\":\\\"izomi\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"tagName\\\":\\\"h5\\\",\\\"type\\\":\\\"header\\\",\\\"classes\\\":[\\\"m-0\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"ifznr\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"2/F Anflocor Building 411 Quirino Aveñue, corner NAIA Road, Barangay Tambo Parañaque City, Metro Manila\\n\\t\\t\\t\\t\\t\\t\\\"}]}]}]},{\\\"tagName\\\":\\\"tr\\\",\\\"type\\\":\\\"default\\\",\\\"attributes\\\":{\\\"id\\\":\\\"iozpx\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"cell\\\",\\\"attributes\\\":{\\\"id\\\":\\\"i03ak\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\",\\\"colspan\\\":\\\"2\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\" \\n\\t\\t\\t\\t\\t  \\\"}]}]},{\\\"tagName\\\":\\\"tr\\\",\\\"type\\\":\\\"default\\\",\\\"attributes\\\":{\\\"id\\\":\\\"ia1cj\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"cell\\\",\\\"attributes\\\":{\\\"id\\\":\\\"iag9y\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"tagName\\\":\\\"i\\\",\\\"type\\\":\\\"icon\\\",\\\"classes\\\":[\\\"bg-transparent\\\",\\\"i-small\\\",\\\"icon-phone1\\\",\\\"m-0\\\",\\\"me-1\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"ia1kf\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"\\n\\t\\t\\t\\t\\t\\t\\\"}]}]},{\\\"type\\\":\\\"cell\\\",\\\"attributes\\\":{\\\"id\\\":\\\"igz76\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"tagName\\\":\\\"h6\\\",\\\"type\\\":\\\"header\\\",\\\"classes\\\":[\\\"m-0\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"irysp\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"(+63) (2) 8832-2404 \\n\\t\\t\\t\\t\\t\\t  \\\"},{\\\"tagName\\\":\\\"br\\\",\\\"type\\\":\\\"default\\\",\\\"void\\\":true,\\\"attributes\\\":{\\\"id\\\":\\\"i78p4\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"}},{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"(+63) (2) 8853-3988 \\n\\t\\t\\t\\t\\t\\t  \\\"},{\\\"tagName\\\":\\\"br\\\",\\\"type\\\":\\\"default\\\",\\\"void\\\":true,\\\"attributes\\\":{\\\"id\\\":\\\"i6d22\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"}},{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"(+63) (2) 8855-2741 to 47\\n\\t\\t\\t\\t\\t\\t\\\"}]}]}]},{\\\"tagName\\\":\\\"tr\\\",\\\"type\\\":\\\"default\\\",\\\"attributes\\\":{\\\"id\\\":\\\"imkem\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"cell\\\",\\\"attributes\\\":{\\\"id\\\":\\\"ihmmh\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\",\\\"colspan\\\":\\\"2\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\" \\n\\t\\t\\t\\t\\t  \\\"}]}]},{\\\"tagName\\\":\\\"tr\\\",\\\"type\\\":\\\"default\\\",\\\"attributes\\\":{\\\"id\\\":\\\"i5pst\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"cell\\\",\\\"attributes\\\":{\\\"id\\\":\\\"iciiw\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"tagName\\\":\\\"i\\\",\\\"type\\\":\\\"icon\\\",\\\"classes\\\":[\\\"bg-transparent\\\",\\\"i-small\\\",\\\"icon-clock2\\\",\\\"m-0\\\",\\\"me-1\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"i9wty\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"\\n\\t\\t\\t\\t\\t\\t\\\"}]}]},{\\\"type\\\":\\\"cell\\\",\\\"attributes\\\":{\\\"id\\\":\\\"i0tk3\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"tagName\\\":\\\"h6\\\",\\\"type\\\":\\\"header\\\",\\\"classes\\\":[\\\"m-0\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"ioaqz\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"Monday – Thursday: 8:00AM – 6:00PM\\n\\t\\t\\t\\t\\t\\t  \\\"},{\\\"tagName\\\":\\\"br\\\",\\\"type\\\":\\\"default\\\",\\\"void\\\":true,\\\"attributes\\\":{\\\"id\\\":\\\"iq13r\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"}},{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"Friday: 8:00AM – 5:00PM\\n\\t\\t\\t\\t\\t\\t\\\"}]}]}]}]}]}]},{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"\\n\\t\\t\\t  {Media Accounts}\\n\\t\\t\\t  \\\"},{\\\"tagName\\\":\\\"br\\\",\\\"type\\\":\\\"default\\\",\\\"void\\\":true,\\\"attributes\\\":{\\\"id\\\":\\\"ij6mf\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"}},{\\\"tagName\\\":\\\"br\\\",\\\"type\\\":\\\"default\\\",\\\"void\\\":true,\\\"attributes\\\":{\\\"id\\\":\\\"i35sy\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"}}]},{\\\"type\\\":\\\"column\\\",\\\"classes\\\":[\\\"col-md-12\\\",\\\"col-lg-4\\\",\\\"col-sm-12\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"im0vg\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"default\\\",\\\"classes\\\":[\\\"mb-2\\\",\\\"text-white\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"i8yzj\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"tagName\\\":\\\"h5\\\",\\\"type\\\":\\\"header\\\",\\\"classes\\\":[\\\"m-0\\\",\\\"text-white\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"ismbm\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"Ticketing Department\\n\\t\\t\\t\\t\\t\\\"}]},{\\\"tagName\\\":\\\"small\\\",\\\"type\\\":\\\"text\\\",\\\"classes\\\":[\\\"text-white\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"ikcll\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"For ticketing and reservation inquiry:\\\"}]},{\\\"type\\\":\\\"table\\\",\\\"classes\\\":[\\\"table-responsive\\\",\\\"m-0\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"iawlb\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"tbody\\\",\\\"attributes\\\":{\\\"id\\\":\\\"ip7ed\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"tagName\\\":\\\"tr\\\",\\\"type\\\":\\\"default\\\",\\\"attributes\\\":{\\\"id\\\":\\\"iovu5\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"cell\\\",\\\"attributes\\\":{\\\"id\\\":\\\"ii3p8\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"tagName\\\":\\\"i\\\",\\\"type\\\":\\\"icon\\\",\\\"classes\\\":[\\\"bg-transparent\\\",\\\"i-small\\\",\\\"icon-envelope21\\\",\\\"m-0\\\",\\\"me-1\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"ib5gh\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"\\n\\t\\t\\t\\t\\t\\t\\t\\\"}]}]},{\\\"type\\\":\\\"cell\\\",\\\"attributes\\\":{\\\"id\\\":\\\"ibklk\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"button\\\",\\\"classes\\\":[\\\"text-white\\\",\\\"text-decoration-underline\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"ijt3f\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\",\\\"href\\\":\\\"mailto:ticketing@houseoftravel.com.ph\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"ticketing@houseoftravel.com.ph\\\"}]}]}]}]}]}]},{\\\"type\\\":\\\"default\\\",\\\"classes\\\":[\\\"mb-2\\\",\\\"text-white\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"izono\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"tagName\\\":\\\"h5\\\",\\\"type\\\":\\\"header\\\",\\\"classes\\\":[\\\"m-0\\\",\\\"text-white\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"ik5dp\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"Tours Department\\n\\t\\t\\t\\t\\t\\\"}]},{\\\"tagName\\\":\\\"small\\\",\\\"type\\\":\\\"text\\\",\\\"classes\\\":[\\\"text-white\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"ik38c\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"For tour packages inquiry:\\\"}]},{\\\"type\\\":\\\"table\\\",\\\"classes\\\":[\\\"table-responsive\\\",\\\"m-0\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"it2pi\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"tbody\\\",\\\"attributes\\\":{\\\"id\\\":\\\"iff25\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"tagName\\\":\\\"tr\\\",\\\"type\\\":\\\"default\\\",\\\"attributes\\\":{\\\"id\\\":\\\"i5ohp\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"cell\\\",\\\"attributes\\\":{\\\"id\\\":\\\"imwvf\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"tagName\\\":\\\"i\\\",\\\"type\\\":\\\"icon\\\",\\\"classes\\\":[\\\"bg-transparent\\\",\\\"i-small\\\",\\\"icon-envelope21\\\",\\\"m-0\\\",\\\"me-1\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"ivj09\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"\\n\\t\\t\\t\\t\\t\\t\\t\\\"}]}]},{\\\"type\\\":\\\"cell\\\",\\\"attributes\\\":{\\\"id\\\":\\\"iruvx\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"button\\\",\\\"classes\\\":[\\\"text-white\\\",\\\"text-decoration-underline\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"ichbn\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\",\\\"href\\\":\\\"mailto:tours@houseoftravel.com.ph\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"tours@houseoftravel.com.ph\\\"}]}]}]}]}]}]},{\\\"type\\\":\\\"default\\\",\\\"classes\\\":[\\\"mb-2\\\",\\\"text-white\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"iwaih\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"tagName\\\":\\\"h5\\\",\\\"type\\\":\\\"header\\\",\\\"classes\\\":[\\\"m-0\\\",\\\"text-white\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"id8oa\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"Documentation Department\\n\\t\\t\\t\\t\\t\\\"}]},{\\\"tagName\\\":\\\"small\\\",\\\"type\\\":\\\"text\\\",\\\"attributes\\\":{\\\"id\\\":\\\"ixv6f\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"For passport, visa and other document concern:\\\"}]},{\\\"type\\\":\\\"table\\\",\\\"classes\\\":[\\\"table-responsive\\\",\\\"m-0\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"i9vkr\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"tbody\\\",\\\"attributes\\\":{\\\"id\\\":\\\"iwf7g\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"tagName\\\":\\\"tr\\\",\\\"type\\\":\\\"default\\\",\\\"attributes\\\":{\\\"id\\\":\\\"ilzqd\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"cell\\\",\\\"attributes\\\":{\\\"id\\\":\\\"iback\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"tagName\\\":\\\"i\\\",\\\"type\\\":\\\"icon\\\",\\\"classes\\\":[\\\"bg-transparent\\\",\\\"i-small\\\",\\\"icon-envelope21\\\",\\\"m-0\\\",\\\"me-1\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"is88i\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"\\n\\t\\t\\t\\t\\t\\t\\t\\\"}]}]},{\\\"type\\\":\\\"cell\\\",\\\"attributes\\\":{\\\"id\\\":\\\"iwkb6\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"button\\\",\\\"content\\\":\\\"documentation@houseoftravel.com.ph\\\",\\\"classes\\\":[\\\"text-white\\\",\\\"text-decoration-underline\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"iq2lj\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\",\\\"href\\\":\\\"mailto:documentation@houseoftravel.com.ph\\\"}}]}]}]}]}]}]},{\\\"type\\\":\\\"column\\\",\\\"classes\\\":[\\\"col-md-12\\\",\\\"col-lg-4\\\",\\\"col-sm-12\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"iaifs\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"default\\\",\\\"classes\\\":[\\\"mb-2\\\",\\\"text-white\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"i81p7\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"tagName\\\":\\\"h5\\\",\\\"type\\\":\\\"header\\\",\\\"classes\\\":[\\\"m-0\\\",\\\"text-white\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"ifhz9\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"Pearl Farm Manila Department\\n\\t\\t\\t\\t\\t\\\"}]},{\\\"tagName\\\":\\\"small\\\",\\\"type\\\":\\\"text\\\",\\\"attributes\\\":{\\\"id\\\":\\\"i4wol\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"For pearl farm reservation inquiry:\\\"}]},{\\\"type\\\":\\\"table\\\",\\\"classes\\\":[\\\"table-responsive\\\",\\\"m-0\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"idjjx\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"tbody\\\",\\\"attributes\\\":{\\\"id\\\":\\\"it0os\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"tagName\\\":\\\"tr\\\",\\\"type\\\":\\\"default\\\",\\\"attributes\\\":{\\\"id\\\":\\\"ink37\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"cell\\\",\\\"attributes\\\":{\\\"id\\\":\\\"ig49e\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"tagName\\\":\\\"i\\\",\\\"type\\\":\\\"icon\\\",\\\"classes\\\":[\\\"bg-transparent\\\",\\\"i-small\\\",\\\"icon-envelope21\\\",\\\"m-0\\\",\\\"me-1\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"i806og\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"\\n\\t\\t\\t\\t\\t\\t\\t\\\"}]}]},{\\\"type\\\":\\\"cell\\\",\\\"attributes\\\":{\\\"id\\\":\\\"ikbbuo\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"button\\\",\\\"classes\\\":[\\\"text-white\\\",\\\"text-decoration-underline\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"ismtwg\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\",\\\"href\\\":\\\"mailto:pearlfarm@houseoftravel.com.ph\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"pearlfarm@houseoftravel.com.ph\\\"}]}]}]}]}]}]},{\\\"type\\\":\\\"default\\\",\\\"classes\\\":[\\\"mb-2\\\",\\\"text-white\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"ihg0lv\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"tagName\\\":\\\"h5\\\",\\\"type\\\":\\\"header\\\",\\\"classes\\\":[\\\"m-0\\\",\\\"text-white\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"ieq4nl\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"Technical Support Department\\n\\t\\t\\t\\t\\t\\\"}]},{\\\"tagName\\\":\\\"small\\\",\\\"type\\\":\\\"text\\\",\\\"classes\\\":[\\\"text-white\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"imbj0k\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"For website technical issues concern:\\\"}]},{\\\"type\\\":\\\"table\\\",\\\"classes\\\":[\\\"table-responsive\\\",\\\"m-0\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"iicpq8\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"tbody\\\",\\\"attributes\\\":{\\\"id\\\":\\\"i80qym\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"tagName\\\":\\\"tr\\\",\\\"type\\\":\\\"default\\\",\\\"attributes\\\":{\\\"id\\\":\\\"iqdx0t\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"cell\\\",\\\"attributes\\\":{\\\"id\\\":\\\"i7ksx3\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"tagName\\\":\\\"i\\\",\\\"type\\\":\\\"icon\\\",\\\"classes\\\":[\\\"bg-transparent\\\",\\\"i-small\\\",\\\"icon-envelope21\\\",\\\"m-0\\\",\\\"me-1\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"ifd2fw\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"\\n\\t\\t\\t\\t\\t\\t\\t\\\"}]}]},{\\\"type\\\":\\\"cell\\\",\\\"attributes\\\":{\\\"id\\\":\\\"ipuzup\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"button\\\",\\\"classes\\\":[\\\"text-white\\\",\\\"text-decoration-underline\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"iglj8q\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\",\\\"href\\\":\\\"mailto:support@houseoftravel.com.ph\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"support@houseoftravel.com.ph\\\"}]}]}]}]}]}]}]}]}]}]},{\\\"tagName\\\":\\\"NULL\\\",\\\"type\\\":\\\"comment\\\",\\\"content\\\":\\\" Copyrights\\n============================================= \\\"},{\\\"type\\\":\\\"default\\\",\\\"attributes\\\":{\\\"id\\\":\\\"copyrights\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"container\\\",\\\"classes\\\":[\\\"container\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"i4xn9t\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"row\\\",\\\"classes\\\":[\\\"row\\\",\\\"justify-content-between\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"iswjil\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"column\\\",\\\"classes\\\":[\\\"col\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"iq9mwh\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"tagName\\\":\\\"span\\\",\\\"type\\\":\\\"text\\\",\\\"classes\\\":[\\\"text-black-50\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"ing3xk\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"© 2023 House of Travel, Inc.\\\"}]},{\\\"type\\\":\\\"link\\\",\\\"content\\\":\\\"&nbsp; Privacy Policy&nbsp;\\\",\\\"classes\\\":[\\\"gjs-comp-selected\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"iwrref\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\",\\\"href\\\":\\\"https://beta.houseoftravel.com.ph/privacy-policy-2\\\"}}]},{\\\"type\\\":\\\"column\\\",\\\"classes\\\":[\\\"col\\\",\\\"text-end\\\"],\\\"attributes\\\":{\\\"id\\\":\\\"iolzho\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\"},\\\"components\\\":[{\\\"type\\\":\\\"button\\\",\\\"attributes\\\":{\\\"id\\\":\\\"ih72js\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\",\\\"href\\\":\\\"https://beta.houseoftravel.com.ph/\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"Home\\\"}]},{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"/\\n\\t\\t  \\\"},{\\\"type\\\":\\\"button\\\",\\\"attributes\\\":{\\\"id\\\":\\\"ie71qy\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\",\\\"href\\\":\\\"https://beta.houseoftravel.com.ph/about-us\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"About\\\"}]},{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"/\\n\\t\\t  \\\"},{\\\"type\\\":\\\"button\\\",\\\"content\\\":\\\"Services\\\",\\\"attributes\\\":{\\\"id\\\":\\\"iov9rf\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\",\\\"href\\\":\\\"https://beta.houseoftravel.com.ph/services\\\"}},{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"/\\n\\t\\t  \\\"},{\\\"type\\\":\\\"button\\\",\\\"attributes\\\":{\\\"id\\\":\\\"iscxtz\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\",\\\"href\\\":\\\"https://beta.houseoftravel.com.ph/tour-packages\\\"},\\\"components\\\":[{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"Tour Packages\\\"}]},{\\\"type\\\":\\\"textnode\\\",\\\"content\\\":\\\"/\\n\\t\\t  \\\"},{\\\"type\\\":\\\"button\\\",\\\"content\\\":\\\"Contact Us\\\",\\\"attributes\\\":{\\\"id\\\":\\\"ij9ta8\\\",\\\"draggable\\\":\\\"true\\\",\\\"data-highlightable\\\":\\\"1\\\",\\\"href\\\":\\\"https://beta.houseoftravel.com.ph/contact-us\\\"}}]}]}]}]},{\\\"tagName\\\":\\\"NULL\\\",\\\"type\\\":\\\"comment\\\",\\\"content\\\":\\\" #copyrights end \\\"}]},{\\\"tagName\\\":\\\"NULL\\\",\\\"type\\\":\\\"comment\\\",\\\"content\\\":\\\" #footer end \\\"}]\"}', '* { box-sizing: border-box; } body {margin: 0;}*{box-sizing:border-box;}body{margin:0;}#iwrref{margin:0 5px 0 5px;}section:empty{min-height:40px;}#iemunx{padding:5px 5px 5px 5px;}#i1i6is{max-width:100%;padding:0 8.5% 0 8.5%;}#iitz4f{padding:5px 0 5px 0;margin:0 0 0 0;}#ixv6f{color:#eeeeee;}#id8oa{color:#eeeeee;}#ik38c{color:#eeeeee;}#ik5dp{color:#eeeeee;}#ismbm{color:#eeeeee;}#ikcll{color:#eeeeee;}#ifhz9{color:#ffffff;}#i4wol{color:#eeeeee;}#ieq4nl{color:#eeeeee;}#imbj0k{color:#eeeeee;}#footer{color:#ffffff;}#is88i{color:#ffffff;}#ivj09{color:#ffffff;}#ifd2fw{color:#ffffff;}#i806og{color:#ffffff;}#ib5gh{color:#ffffff;}#i7ksx3{color:#ffffff;}#i81p7{color:#ffffff;}', 'PUBLISHED', 'standard', '', '', '', '', '1', '', '2024-02-18 12:43:20', '2024-02-18 12:43:20', NULL);

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
