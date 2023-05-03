-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2022 at 07:49 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `exchanger`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_access` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `username`, `email`, `password`, `image`, `phone`, `address`, `admin_access`, `last_login`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com', '$2y$10$.sO9kLAurqjCYnUatIQeDuwxOqPC7KWPKEIOy5rYf8sGMm0zkLdZm', '627a4928ec4a51652181288.jpg', '+5641 455646', 'TX, USA', '[\"admin.dashboard\",\"admin.staff\",\"admin.storeStaff\",\"admin.updateStaff\",\"admin.identify-form\",\"admin.identify-form.store\",\"admin.identify-form.store\",\"admin.scheduleManage\",\"admin.planList\",\"admin.store.schedule\",\"admin.update.schedule\",\"admin.planCreate\",\"admin.planEdit\",\"admin.plans-active\",\"admin.plans-inactive\",\"admin.referral-commission\",\"admin.referral-commission.store\",\"admin.transaction\",\"admin.transaction.search\",\"admin.investments\",\"admin.investments.search\",\"admin.commissions\",\"admin.commissions.search\",\"admin.users\",\"admin.users.search\",\"admin.email-send\",\"admin.user.transaction\",\"admin.user.fundLog\",\"admin.user.withdrawal\",\"admin.user.commissionLog\",\"admin.user.referralMember\",\"admin.user.plan-purchaseLog\",\"admin.user.userKycHistory\",\"admin.kyc.users.pending\",\"admin.kyc.users\",\"admin.user-edit\",\"admin.user-multiple-active\",\"admin.user-multiple-inactive\",\"admin.send-email\",\"admin.user.userKycHistory\",\"admin.user-balance-update\",\"admin.payment.methods\",\"admin.deposit.manual.index\",\"admin.deposit.manual.create\",\"admin.edit.payment.methods\",\"admin.deposit.manual.edit\",\"admin.payment.pending\",\"admin.payment.log\",\"admin.payment.search\",\"admin.payment.action\",\"admin.payout-method\",\"admin.payout-log\",\"admin.payout-request\",\"admin.payout-log.search\",\"admin.payout-method.create\",\"admin.payout-method.edit\",\"admin.payout-action\",\"admin.ticket\",\"admin.ticket.view\",\"admin.ticket.reply\",\"admin.ticket.delete\",\"admin.subscriber.index\",\"admin.subscriber.sendEmail\",\"admin.subscriber.remove\",\"admin.basic-controls\",\"admin.email-controls\",\"admin.email-template.show\",\"admin.sms.config\",\"admin.sms-template\",\"admin.notify-config\",\"admin.notify-template.show\",\"admin.notify-template.edit\",\"admin.basic-controls.update\",\"admin.email-controls.update\",\"admin.email-template.edit\",\"admin.sms-template.edit\",\"admin.notify-config.update\",\"admin.notify-template.update\",\"admin.language.index\",\"admin.language.create\",\"admin.language.edit\",\"admin.language.keywordEdit\",\"admin.language.delete\",\"admin.manage.theme\",\"admin.logo-seo\",\"admin.breadcrumb\",\"admin.template.show\",\"admin.content.index\",\"admin.content.create\",\"admin.logoUpdate\",\"admin.seoUpdate\",\"admin.breadcrumbUpdate\",\"admin.content.show\",\"admin.content.delete\"]', '2022-09-05 05:36:01', 1, 'U0r2JyH85xdA6RgbQc6Zy8dPvj9SXtReta2IBZtKHkgENBa5WVGB1KYRm9yE', '2021-12-17 10:00:01', '2022-09-04 23:36:01');

-- --------------------------------------------------------

--
-- Table structure for table `configures`
--

CREATE TABLE `configures` (
  `id` int(11) UNSIGNED NOT NULL,
  `site_title` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_color` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `time_zone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_currency_rate` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fraction_number` int(11) DEFAULT NULL,
  `paginate` int(11) DEFAULT NULL,
  `email_verification` tinyint(1) NOT NULL DEFAULT 0,
  `email_notification` tinyint(1) NOT NULL DEFAULT 0,
  `sms_verification` tinyint(1) NOT NULL DEFAULT 0,
  `sms_notification` tinyint(1) NOT NULL DEFAULT 0,
  `sender_email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_email_name` varchar(91) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_configuration` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_notification` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `error_log` tinyint(1) NOT NULL,
  `strong_password` tinyint(1) NOT NULL,
  `registration` tinyint(1) NOT NULL,
  `address_verification` tinyint(1) NOT NULL,
  `identity_verification` tinyint(1) NOT NULL,
  `maintenance` tinyint(1) NOT NULL,
  `maintenance_message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active_cron_notification` tinyint(1) NOT NULL DEFAULT 0,
  `tawk_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tawk_status` tinyint(1) NOT NULL DEFAULT 0,
  `fb_messenger_status` tinyint(1) NOT NULL DEFAULT 0,
  `fb_app_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_page_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reCaptcha_status_login` tinyint(1) NOT NULL DEFAULT 0,
  `reCaptcha_status_registration` tinyint(1) NOT NULL DEFAULT 0,
  `MEASUREMENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `analytic_status` tinyint(1) NOT NULL DEFAULT 0,
  `payment_notice` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fiat_currency_api` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fiat_currency_status` tinyint(1) NOT NULL DEFAULT 0,
  `crypto_currency_api` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `crypto_currency_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `configures`
--

INSERT INTO `configures` (`id`, `site_title`, `base_color`, `time_zone`, `base_currency_rate`, `currency`, `currency_symbol`, `theme`, `fraction_number`, `paginate`, `email_verification`, `email_notification`, `sms_verification`, `sms_notification`, `sender_email`, `sender_email_name`, `email_description`, `email_configuration`, `push_notification`, `created_at`, `updated_at`, `error_log`, `strong_password`, `registration`, `address_verification`, `identity_verification`, `maintenance`, `maintenance_message`, `is_active_cron_notification`, `tawk_id`, `tawk_status`, `fb_messenger_status`, `fb_app_id`, `fb_page_id`, `reCaptcha_status_login`, `reCaptcha_status_registration`, `MEASUREMENT_ID`, `analytic_status`, `payment_notice`, `fiat_currency_api`, `fiat_currency_status`, `crypto_currency_api`, `crypto_currency_status`) VALUES
(1, 'Ex-Rate', '#10ce8c', 'UTC', '0.0072100913476755', 'USD', '$', 'exchanger', 2, 20, 0, 0, 0, 0, 'support@mail.com', 'Bug Finder', '<h1>\r\n                            </h1><h1></h1><p style=\"font-style:normal;font-weight:normal;color:rgb(68,168,199);font-size:36px;font-family:bitter, georgia, serif;text-align:center;\"> <br /></p>\r\n                        \r\n\r\n                        \r\n\r\n                            <p><strong>Hello [[name]],</strong></p>\r\n                            <p><strong>[[message]]</strong></p>\r\n                            <p><br /></p>\r\n                        \r\n\r\n                    \r\n                \r\n            \r\n\r\n            \r\n                \r\n                    \r\n                        <p style=\"font-style:normal;font-weight:normal;color:#ffffff;font-size:16px;font-family:bitter, georgia, serif;text-align:center;\">\r\n                            2021 ©  All Right Reserved\r\n                        </p>', '{\"name\":\"smtp\",\"smtp_host\":\"smtp.mailtrap.io\",\"smtp_port\":\"2525\",\"smtp_encryption\":\"tls\",\"smtp_username\":\"b75b1a5bfa5d58\",\"smtp_password\":\"f89fbe0495a7fc\"}', 0, NULL, '2022-09-04 23:15:23', 1, 0, 1, 0, 0, 0, NULL, 1, '58dd135ef7bbaa72709c3470/default', 0, 0, NULL, NULL, 0, 0, NULL, 0, 'After see the detials, if you confirm then your request will go to admin. After verifying everything Admin will send money to you wallet within 10 minutes.', NULL, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `name`, `created_at`, `updated_at`) VALUES
(83, 'how-it-work', '2022-08-14 05:04:54', '2022-08-14 05:04:54'),
(84, 'how-it-work', '2022-08-14 05:11:30', '2022-08-14 05:11:30'),
(85, 'how-it-work', '2022-08-14 05:12:00', '2022-08-14 05:12:00'),
(86, 'faq', '2022-08-14 05:57:14', '2022-08-14 05:57:14'),
(87, 'faq', '2022-08-14 05:57:55', '2022-08-14 05:57:55'),
(88, 'faq', '2022-08-14 05:58:59', '2022-08-14 05:58:59'),
(89, 'testimonial', '2022-08-14 06:02:20', '2022-08-14 06:02:20'),
(90, 'testimonial', '2022-08-14 06:03:15', '2022-08-14 06:03:15'),
(91, 'testimonial', '2022-08-14 06:04:20', '2022-08-14 06:04:20'),
(92, 'testimonial', '2022-08-14 06:04:54', '2022-08-14 06:04:54'),
(93, 'blog', '2022-08-14 06:18:17', '2022-08-14 06:18:17'),
(94, 'blog', '2022-08-14 06:19:23', '2022-08-14 06:19:23'),
(95, 'blog', '2022-08-14 06:20:06', '2022-08-14 06:20:06'),
(96, 'social', '2022-08-16 00:54:34', '2022-08-16 00:54:34'),
(97, 'social', '2022-08-16 00:55:31', '2022-08-16 00:55:31'),
(98, 'social', '2022-08-16 00:56:06', '2022-08-16 00:56:06'),
(99, 'social', '2022-08-16 00:58:48', '2022-08-16 00:58:48'),
(100, 'support', '2022-08-16 01:00:52', '2022-08-16 01:00:52'),
(101, 'support', '2022-08-16 01:01:40', '2022-08-16 01:01:40'),
(102, 'blog', '2022-09-04 10:03:49', '2022-09-04 10:03:49'),
(103, 'blog', '2022-09-04 10:17:00', '2022-09-04 10:17:00'),
(104, 'blog', '2022-09-04 10:17:11', '2022-09-04 10:17:11'),
(105, 'faq', '2022-09-04 11:00:30', '2022-09-04 11:00:30'),
(106, 'faq', '2022-09-04 11:01:15', '2022-09-04 11:01:15');

-- --------------------------------------------------------

--
-- Table structure for table `content_details`
--

CREATE TABLE `content_details` (
  `id` int(11) UNSIGNED NOT NULL,
  `content_id` int(11) UNSIGNED DEFAULT NULL,
  `language_id` int(11) UNSIGNED DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content_details`
--

INSERT INTO `content_details` (`id`, `content_id`, `language_id`, `description`, `created_at`, `updated_at`) VALUES
(225, 83, 1, '{\"title\":\"Connect Wallet\",\"information\":\"A Production-Ready Library Of Stackable Content Blocks Built In React Native.\"}', '2022-08-14 05:04:54', '2022-08-14 05:04:54'),
(226, 84, 1, '{\"title\":\"Start Trading\",\"information\":\"A Production-Ready Library Of Stackable Content Blocks Built In React Native.\"}', '2022-08-14 05:11:30', '2022-08-14 05:11:30'),
(227, 85, 1, '{\"title\":\"Earn Money\",\"information\":\"A Production-Ready Library Of Stackable Content Blocks Built In React Native.\"}', '2022-08-14 05:12:00', '2022-08-14 05:12:00'),
(228, 86, 1, '{\"title\":\"Why choose Ex-rate rates?\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\"}', '2022-08-14 05:57:14', '2022-09-04 10:58:56'),
(229, 87, 1, '{\"title\":\"What is the conversion timeline?\",\"description\":\"This is the second item\'s accordion body. It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It\'s also worth noting that just about any HTML can go within the accordion-body though the transition does limit overflow.\"}', '2022-08-14 05:57:55', '2022-09-04 10:59:27'),
(230, 88, 1, '{\"title\":\"How  rates calculated?\",\"description\":\"This is the third item\'s accordion body. It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It\'s also worth noting that just about any HTML can go within the accordion-body though the transition does limit overflow.\"}', '2022-08-14 05:58:59', '2022-09-04 11:00:02'),
(231, 89, 1, '{\"name\":\"Adam Waltom\",\"designation\":\"Designer\",\"description\":\"\\u201cGreat! This is one of the best apps I have ever used before.\\u201d\"}', '2022-08-14 06:02:20', '2022-08-14 06:02:20'),
(232, 90, 1, '{\"name\":\"Mark John\",\"designation\":\"Software Engineer\",\"description\":\"\\u201cGreat! This is one of the best apps I have ever used before.\\u201d\"}', '2022-08-14 06:03:15', '2022-08-14 06:03:15'),
(233, 91, 1, '{\"name\":\"Steve Smith\",\"designation\":\"Executive\",\"description\":\"\\u201cGreat! This is one of the best apps I have ever used before.\\u201d\"}', '2022-08-14 06:04:20', '2022-08-14 06:04:20'),
(234, 92, 1, '{\"name\":\"Bran Lara\",\"designation\":\"Crickter\",\"description\":\"\\u201cGreat! This is one of the best apps I have ever used before.\\u201d\"}', '2022-08-14 06:04:54', '2022-08-14 06:04:54'),
(235, 93, 1, '{\"title\":\"Learn about UI8 coin and earn an All-Access Pass\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias pariatur eum fuga corporis aperiam sit tempora ad numquam accusamus iste ut aspernatur, explicabo dolore deserunt voluptates distinctio. Ullam, dicta blanditiis? Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias pariatur eum fuga corporis aperiam sit tempora ad numquam accusamus iste ut aspernatur, explicabo dolore deserunt voluptates distinctio. Ullam, dicta blanditiis?\"}', '2022-08-14 06:18:17', '2022-09-04 09:58:38'),
(236, 94, 1, '{\"title\":\"Learn about UI8 coin and earn an All-Access Pass\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias pariatur eum fuga corporis aperiam sit tempora ad numquam accusamus iste ut aspernatur, explicabo dolore deserunt voluptates distinctio. Ullam, dicta blanditiis? Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias pariatur eum fuga corporis aperiam sit tempora ad numquam accusamus iste ut aspernatur, explicabo dolore deserunt voluptates distinctio. Ullam, dicta blanditiis?\"}', '2022-08-14 06:19:23', '2022-09-04 09:59:53'),
(237, 95, 1, '{\"title\":\"Learn about UI8 coin and earn an All-Access Pass\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias pariatur eum fuga corporis aperiam sit tempora ad numquam accusamus iste ut aspernatur, explicabo dolore deserunt voluptates distinctio. Ullam, dicta blanditiis? Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias pariatur eum fuga corporis aperiam sit tempora ad numquam accusamus iste ut aspernatur, explicabo dolore deserunt voluptates distinctio. Ullam, dicta blanditiis?\"}', '2022-08-14 06:20:06', '2022-09-04 10:00:57'),
(238, 96, 1, '{\"name\":\"facebook\"}', '2022-08-16 00:54:34', '2022-08-16 00:54:34'),
(239, 97, 1, '{\"name\":\"linkIn\"}', '2022-08-16 00:55:31', '2022-08-16 00:55:31'),
(240, 98, 1, '{\"name\":\"twitter\"}', '2022-08-16 00:56:06', '2022-08-16 00:57:32'),
(241, 99, 1, '{\"name\":\"instragram\"}', '2022-08-16 00:58:48', '2022-08-16 00:58:48'),
(242, 100, 1, '{\"title\":\"Terms &amp; Conditions\",\"description\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<\\/p><p><br \\/><\\/p><p>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose injected humour and the like.<\\/p>\"}', '2022-08-16 01:00:52', '2022-08-16 01:00:52'),
(243, 101, 1, '{\"title\":\"Privacy Policy\",\"description\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<\\/p><p><br \\/><\\/p><p>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose injected humour and the like.<\\/p>\"}', '2022-08-16 01:01:40', '2022-08-16 01:01:40'),
(244, 83, 18, '{\"title\":\"Conectar billetera\",\"information\":\"Una biblioteca lista para producci\\u00f3n de bloques de contenido apilables integrados en React Native.\"}', '2022-08-25 06:29:59', '2022-08-25 06:29:59'),
(245, 84, 18, '{\"title\":\"Comienza a negociar\",\"information\":\"Una biblioteca lista para producci\\u00f3n de bloques de contenido apilables integrados en React Native.\"}', '2022-08-25 06:30:31', '2022-08-25 06:30:31'),
(246, 85, 18, '{\"title\":\"Ganar dinero\",\"information\":\"Una biblioteca lista para producci\\u00f3n de bloques de contenido apilables integrados en React Native.\"}', '2022-08-25 06:31:09', '2022-08-25 06:31:09'),
(247, 86, 18, '{\"title\":\"Why choose Ex-rate rates?\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\"}', '2022-08-25 06:31:53', '2022-09-04 10:59:07'),
(248, 87, 18, '{\"title\":\"What is the conversion timeline?\",\"description\":\"Este es el cuerpo de acorde\\u00f3n del segundo elemento. Est\\u00e1 oculto de forma predeterminada, hasta que el complemento de colapso agrega las clases apropiadas que usamos para dise\\u00f1ar cada elemento. Estas clases controlan la apariencia general, as\\u00ed como la visualizaci\\u00f3n y ocultaci\\u00f3n a trav\\u00e9s de transiciones CSS. Puede modificar cualquiera de esto con CSS personalizado o anulando nuestras variables predeterminadas. Tambi\\u00e9n vale la pena se\\u00f1alar que casi cualquier HTML puede ir dentro del cuerpo del acorde\\u00f3n, aunque la transici\\u00f3n limita el desbordamiento.\"}', '2022-08-25 06:32:38', '2022-09-04 10:59:31'),
(249, 88, 18, '{\"title\":\"How  rates calculated?\",\"description\":\"Este es el cuerpo del acorde\\u00f3n del tercer elemento. Est\\u00e1 oculto de forma predeterminada, hasta que el complemento de colapso agrega las clases apropiadas que usamos para dise\\u00f1ar cada elemento. Estas clases controlan la apariencia general, as\\u00ed como la visualizaci\\u00f3n y ocultaci\\u00f3n a trav\\u00e9s de transiciones CSS. Puede modificar cualquiera de esto con CSS personalizado o anulando nuestras variables predeterminadas. Tambi\\u00e9n vale la pena se\\u00f1alar que casi cualquier HTML puede ir dentro del cuerpo del acorde\\u00f3n, aunque la transici\\u00f3n limita el desbordamiento.\"}', '2022-08-25 06:33:12', '2022-09-04 11:00:06'),
(250, 93, 18, '{\"title\":\"Aprenda sobre la moneda UI8 y gane un pase de acceso completo\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias pariatur eum fuga corporis aperiam sit tempora ad numquam accusamus iste ut aspernatur, explicabo dolore deserunt voluptates distinctio. Ullam, dicta blanditiis? Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias pariatur eum fuga corporis aperiam sit tempora ad numquam accusamus iste ut aspernatur, explicabo dolore deserunt voluptates distinctio. Ullam, dicta blanditiis?\"}', '2022-08-25 06:33:42', '2022-08-25 06:33:42'),
(251, 94, 18, '{\"title\":\"Aprenda sobre la moneda UI8 y gane un pase de acceso completo\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias pariatur eum fuga corporis aperiam sit tempora ad numquam accusamus iste ut aspernatur, explicabo dolore deserunt voluptates distinctio. Ullam, dicta blanditiis? Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias pariatur eum fuga corporis aperiam sit tempora ad numquam accusamus iste ut aspernatur, explicabo dolore deserunt voluptates distinctio. Ullam, dicta blanditiis?\"}', '2022-08-25 06:34:06', '2022-08-25 06:34:06'),
(252, 95, 18, '{\"title\":\"Aprenda sobre la moneda UI8 y gane un pase de acceso completo\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias pariatur eum fuga corporis aperiam sit tempora ad numquam accusamus iste ut aspernatur, explicabo dolore deserunt voluptates distinctio. Ullam, dicta blanditiis? Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias pariatur eum fuga corporis aperiam sit tempora ad numquam accusamus iste ut aspernatur, explicabo dolore deserunt voluptates distinctio. Ullam, dicta blanditiis?\"}', '2022-08-25 06:34:32', '2022-08-25 06:34:32'),
(253, 97, 18, '{\"name\":\"vinculado en\"}', '2022-08-25 06:35:04', '2022-08-25 06:35:04'),
(254, 98, 18, '{\"name\":\"gorjeo\"}', '2022-08-25 06:35:19', '2022-08-25 06:35:19'),
(255, 99, 18, '{\"name\":\"instagram\"}', '2022-08-25 06:35:33', '2022-08-25 06:35:33'),
(256, 100, 18, '{\"title\":\"T\\u00e9rminos y condiciones\",\"description\":\"Es un hecho establecido desde hace mucho tiempo que un lector se distraer\\u00e1 con el contenido legible de una p\\u00e1gina cuando mire su dise\\u00f1o. El punto de usar Lorem Ipsum es que tiene una distribuci\\u00f3n de letras m\\u00e1s o menos normal, a diferencia de usar \'Contenido aqu\\u00ed, contenido aqu\\u00ed\', lo que hace que parezca un ingl\\u00e9s legible. Muchos paquetes de autoedici\\u00f3n y editores de p\\u00e1ginas web ahora usan Lorem Ipsum como su modelo de texto predeterminado, y una b\\u00fasqueda de \'lorem ipsum\' descubrir\\u00e1 muchos sitios web que a\\u00fan est\\u00e1n en su infancia. Varias versiones han evolucionado a lo largo de los a\\u00f1os, a veces por accidente, a veces a prop\\u00f3sito (humor inyectado y cosas por el estilo). Es un hecho establecido desde hace mucho tiempo que un lector se distraer\\u00e1 con el contenido legible de una p\\u00e1gina cuando mire su dise\\u00f1o.\\r\\n\\r\\n\\r\\n\\r\\nEl punto de usar Lorem Ipsum es que tiene una distribuci\\u00f3n de letras m\\u00e1s o menos normal, a diferencia de usar \'Contenido aqu\\u00ed, contenido aqu\\u00ed\', lo que hace que parezca un ingl\\u00e9s legible. Muchos paquetes de autoedici\\u00f3n y editores de p\\u00e1ginas web ahora usan Lorem Ipsum como su modelo de texto predeterminado, y una b\\u00fasqueda de \'lorem ipsum\' descubrir\\u00e1 muchos sitios web que a\\u00fan est\\u00e1n en su infancia. Varias versiones han evolucionado a lo largo de los a\\u00f1os, a veces por accidente, a veces a prop\\u00f3sito (humor inyectado y cosas por el estilo). Es un hecho establecido desde hace mucho tiempo que un lector se distraer\\u00e1 con el contenido legible de una p\\u00e1gina cuando mire su dise\\u00f1o. El punto de usar Lorem Ipsum es que tiene una distribuci\\u00f3n de letras m\\u00e1s o menos normal, a diferencia de usar \'Contenido aqu\\u00ed, contenido aqu\\u00ed\', lo que hace que parezca un ingl\\u00e9s legible. Muchos paquetes de autoedici\\u00f3n y editores de p\\u00e1ginas web ahora usan Lorem Ipsum como su modelo de texto predeterminado, y una b\\u00fasqueda de \'lorem ipsum\' descubrir\\u00e1 muchos sitios web que a\\u00fan est\\u00e1n en su infancia. Varias versiones han evolucionado a lo largo de los a\\u00f1os, a veces por accidente, a veces a prop\\u00f3sito con humor inyectado y cosas por el estilo.\"}', '2022-08-25 06:36:12', '2022-08-25 06:36:12'),
(257, 101, 18, '{\"title\":\"Pol\\u00edtica de privacidad\",\"description\":\"Es un hecho establecido desde hace mucho tiempo que un lector se distraer\\u00e1 con el contenido legible de una p\\u00e1gina cuando mire su dise\\u00f1o. El punto de usar Lorem Ipsum es que tiene una distribuci\\u00f3n de letras m\\u00e1s o menos normal, a diferencia de usar \'Contenido aqu\\u00ed, contenido aqu\\u00ed\', lo que hace que parezca un ingl\\u00e9s legible. Muchos paquetes de autoedici\\u00f3n y editores de p\\u00e1ginas web ahora usan Lorem Ipsum como su modelo de texto predeterminado, y una b\\u00fasqueda de \'lorem ipsum\' descubrir\\u00e1 muchos sitios web que a\\u00fan est\\u00e1n en su infancia. Varias versiones han evolucionado a lo largo de los a\\u00f1os, a veces por accidente, a veces a prop\\u00f3sito (humor inyectado y cosas por el estilo). Es un hecho establecido desde hace mucho tiempo que un lector se distraer\\u00e1 con el contenido legible de una p\\u00e1gina cuando mire su dise\\u00f1o.\\r\\n\\r\\n\\r\\n\\r\\nEl punto de usar Lorem Ipsum es que tiene una distribuci\\u00f3n de letras m\\u00e1s o menos normal, a diferencia de usar \'Contenido aqu\\u00ed, contenido aqu\\u00ed\', lo que hace que parezca un ingl\\u00e9s legible. Muchos paquetes de autoedici\\u00f3n y editores de p\\u00e1ginas web ahora usan Lorem Ipsum como su modelo de texto predeterminado, y una b\\u00fasqueda de \'lorem ipsum\' descubrir\\u00e1 muchos sitios web que a\\u00fan est\\u00e1n en su infancia. Varias versiones han evolucionado a lo largo de los a\\u00f1os, a veces por accidente, a veces a prop\\u00f3sito (humor inyectado y cosas por el estilo). Es un hecho establecido desde hace mucho tiempo que un lector se distraer\\u00e1 con el contenido legible de una p\\u00e1gina cuando mire su dise\\u00f1o. El punto de usar Lorem Ipsum es que tiene una distribuci\\u00f3n de letras m\\u00e1s o menos normal, a diferencia de usar \'Contenido aqu\\u00ed, contenido aqu\\u00ed\', lo que hace que parezca un ingl\\u00e9s legible. Muchos paquetes de autoedici\\u00f3n y editores de p\\u00e1ginas web ahora usan Lorem Ipsum como su modelo de texto predeterminado, y una b\\u00fasqueda de \'lorem ipsum\' descubrir\\u00e1 muchos sitios web que a\\u00fan est\\u00e1n en su infancia. Varias versiones han evolucionado a lo largo de los a\\u00f1os, a veces por accidente, a veces a prop\\u00f3sito con humor inyectado y cosas por el estilo.\"}', '2022-08-25 06:36:51', '2022-08-25 06:36:51'),
(258, 102, 1, '{\"title\":\"Learn about UI8 coin and earn an All-Access Pass\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias pariatur eum fuga corporis aperiam sit tempora ad numquam accusamus iste ut aspernatur, explicabo dolore deserunt voluptates distinctio. Ullam, dicta blanditiis? Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias pariatur eum fuga corporis aperiam sit tempora ad numquam accusamus iste ut aspernatur, explicabo dolore deserunt voluptates distinctio. Ullam, dicta blanditiis?\"}', '2022-09-04 10:03:49', '2022-09-04 10:03:49'),
(259, 103, 1, '{\"title\":\"Learn about UI8 coin and earn an All-Access Pass\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias pariatur eum fuga corporis aperiam sit tempora ad numquam accusamus iste ut aspernatur, explicabo dolore deserunt voluptates distinctio. Ullam, dicta blanditiis? Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias pariatur eum fuga corporis aperiam sit tempora ad numquam accusamus iste ut aspernatur, explicabo dolore deserunt voluptates distinctio. Ullam, dicta blanditiis?\"}', '2022-09-04 10:17:00', '2022-09-04 10:17:00'),
(260, 104, 1, '{\"title\":\"Learn about UI8 coin and earn an All-Access Pass\",\"description\":\"<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias pariatur eum fuga corporis aperiam sit tempora ad numquam accusamus iste ut aspernatur, explicabo dolore deserunt voluptates distinctio. Ullam, dicta blanditiis? Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias pariatur eum fuga corporis aperiam sit tempora ad numquam accusamus iste ut aspernatur, explicabo dolore deserunt voluptates distinctio. Ullam, dicta blanditiis?<br \\/><\\/p>\"}', '2022-09-04 10:17:11', '2022-09-04 10:17:11'),
(261, 104, 18, '{\"title\":\"Aprenda sobre la moneda UI8 y gane un pase de acceso completo\",\"description\":\"<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias pariatur eum fuga corporis aperiam sit tempora ad numquam accusamus iste ut aspernatur, explicabo dolore deserunt voluptates distinctio. Ullam, dicta blanditiis? Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias pariatur eum fuga corporis aperiam sit tempora ad numquam accusamus iste ut aspernatur, explicabo dolore deserunt voluptates distinctio. Ullam, dicta blanditiis?<br \\/><\\/p>\"}', '2022-09-04 10:19:08', '2022-09-04 10:19:08'),
(262, 102, 18, '{\"title\":\"Learn about UI8 coin and earn an All-Access Pass\",\"description\":\"<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias pariatur eum fuga corporis aperiam sit tempora ad numquam accusamus iste ut aspernatur, explicabo dolore deserunt voluptates distinctio. Ullam, dicta blanditiis? Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias pariatur eum fuga corporis aperiam sit tempora ad numquam accusamus iste ut aspernatur, explicabo dolore deserunt voluptates distinctio. Ullam, dicta blanditiis?<br \\/><\\/p>\"}', '2022-09-04 10:19:33', '2022-09-04 10:19:33'),
(263, 103, 18, '{\"title\":\"Learn about UI8 coin and earn an All-Access Pass\",\"description\":\"<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias pariatur eum fuga corporis aperiam sit tempora ad numquam accusamus iste ut aspernatur, explicabo dolore deserunt voluptates distinctio. Ullam, dicta blanditiis? Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias pariatur eum fuga corporis aperiam sit tempora ad numquam accusamus iste ut aspernatur, explicabo dolore deserunt voluptates distinctio. Ullam, dicta blanditiis?<br \\/><\\/p>\"}', '2022-09-04 10:19:46', '2022-09-04 10:19:46'),
(264, 105, 1, '{\"title\":\"At what time do you publish the latest rates?\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\"}', '2022-09-04 11:00:30', '2022-09-04 11:00:30'),
(265, 105, 18, '{\"title\":\"At what time do you publish the latest rates?\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\"}', '2022-09-04 11:00:46', '2022-09-04 11:00:46'),
(266, 106, 1, '{\"title\":\"What type of support provide to clients?\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\"}', '2022-09-04 11:01:15', '2022-09-04 11:01:15'),
(267, 106, 18, '{\"title\":\"What type of support provide to clients?\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\"}', '2022-09-04 11:01:29', '2022-09-04 11:01:29');

-- --------------------------------------------------------

--
-- Table structure for table `content_media`
--

CREATE TABLE `content_media` (
  `id` int(11) UNSIGNED NOT NULL,
  `content_id` int(11) UNSIGNED DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content_media`
--

INSERT INTO `content_media` (`id`, `content_id`, `description`, `created_at`, `updated_at`) VALUES
(60, 83, '{\"image\":\"62f8d6d665c6a1660475094.png\"}', '2022-08-14 05:04:54', '2022-08-14 05:04:54'),
(61, 84, '{\"image\":\"62f8d862310dc1660475490.png\"}', '2022-08-14 05:11:30', '2022-08-14 05:11:30'),
(62, 85, '{\"image\":\"62f8d880132011660475520.png\"}', '2022-08-14 05:12:00', '2022-08-14 05:12:00'),
(63, 89, '{\"image\":\"62f8e44c4ea451660478540.jpg\"}', '2022-08-14 06:02:20', '2022-08-14 06:02:20'),
(64, 90, '{\"image\":\"62f8e483b71181660478595.jpg\"}', '2022-08-14 06:03:15', '2022-08-14 06:03:15'),
(65, 91, '{\"image\":\"62f8e4c4149151660478660.jpg\"}', '2022-08-14 06:04:20', '2022-08-14 06:04:20'),
(66, 92, '{\"image\":\"62f8e4e6d600f1660478694.jpg\"}', '2022-08-14 06:04:55', '2022-08-14 06:04:55'),
(67, 93, '{\"image\":\"6314cb2e51e341662307118.png\"}', '2022-08-14 06:18:18', '2022-09-04 09:58:38'),
(68, 94, '{\"image\":\"6314cb7904c1c1662307193.png\"}', '2022-08-14 06:19:24', '2022-09-04 09:59:53'),
(69, 95, '{\"image\":\"6314cf42327641662308162.png\"}', '2022-08-14 06:20:07', '2022-09-04 10:16:02'),
(70, 96, '{\"link\":\"https:\\/\\/www.facebook.com\\/\",\"icon\":\"fab fa-facebook\"}', '2022-08-16 00:54:34', '2022-08-16 00:54:34'),
(71, 97, '{\"link\":\"https:\\/\\/www.linkedin.com\\/\",\"icon\":\"fab fa-linkedin-in\"}', '2022-08-16 00:55:31', '2022-08-16 00:55:31'),
(72, 98, '{\"link\":\"https:\\/\\/twitter.com\\/\",\"icon\":\"fab fa-twitter\"}', '2022-08-16 00:56:06', '2022-08-16 00:57:32'),
(73, 99, '{\"link\":\"https:\\/\\/www.instagram.com\\/\",\"icon\":\"fab fa-instagram\"}', '2022-08-16 00:58:48', '2022-08-16 00:58:48'),
(74, 102, '{\"image\":\"6314cc654a4921662307429.png\"}', '2022-09-04 10:03:49', '2022-09-04 10:03:49'),
(75, 103, '{\"image\":\"6314cf7cd1a0b1662308220.png\"}', '2022-09-04 10:17:01', '2022-09-04 10:17:01'),
(76, 104, '{\"image\":\"6314cfb7d6aea1662308279.png\"}', '2022-09-04 10:17:12', '2022-09-04 10:18:00');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buy_rate` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `sell_rate` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `min_sell` decimal(18,2) NOT NULL DEFAULT 0.00,
  `max_sell` decimal(18,2) NOT NULL DEFAULT 0.00,
  `commission_rate` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `commission_type` int(1) NOT NULL DEFAULT 0 COMMENT '0=>flat 1=>percentage',
  `reserve` decimal(18,2) NOT NULL DEFAULT 0.00,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>crypto 0=> fiat\r\n',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>active 0=>deactive',
  `sell_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>active 0=>deActive',
  `buy_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>active 0=>deActive',
  `form_field` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'form_field => sender Form',
  `receiver_form` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currency_sells`
--

CREATE TABLE `currency_sells` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `send_currency_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receive_currency_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_amount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `receive_amount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `sender_info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exchange_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `process_step` int(11) NOT NULL DEFAULT 0 COMMENT '3 => completed',
  `gateway` int(11) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '0=>pending 1=>completed, 2=>cancel',
  `comments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'admin provide on satus change',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) UNSIGNED NOT NULL,
  `language_id` int(11) UNSIGNED DEFAULT NULL,
  `template_key` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'support@exampl.com',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_keys` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_status` tinyint(1) NOT NULL DEFAULT 0,
  `sms_status` tinyint(1) NOT NULL DEFAULT 0,
  `lang_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `language_id`, `template_key`, `email_from`, `name`, `subject`, `template`, `sms_body`, `short_keys`, `mail_status`, `sms_status`, `lang_code`, `created_at`, `updated_at`) VALUES
(1, 1, 'PROFILE_UPDATE', 'support@mail.com', 'Profile has been updated', 'Profile has been updated', 'Your first name [[firstname]]\r\n\r\nlast name [[lastname]]\r\n\r\nemail [[email]]\r\n\r\nphone number [[phone]]\r\n', 'Your first name [[firstname]]\r\n\r\nlast name [[lastname]]\r\n\r\nemail [[email]]\r\n\r\nphone number [[phone]]\r\n', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2022-08-23 03:13:42'),
(2, 1, 'ADMIN_SUPPORT_REPLY', 'support@mail.com', 'Support Ticket Reply ', 'Support Ticket Reply', '<p>Ticket ID [[ticket_id]]\r\n</p><p><span><br /></span></p><p><span>Subject [[ticket_subject]]\r\n</span></p><p><span>-----Replied------</span></p><p><span>\r\n[[reply]]</span><br /></p>', 'Ticket ID [[ticket_id]]\r\n\r\n\r\n\r\nSubject [[ticket_subject]]\r\n\r\n-----Replied------\r\n\r\n[[reply]]', '{\"ticket_id\":\"Support Ticket ID\",\"ticket_subject\":\"Subject Of Support Ticket\",\"reply\":\"Reply from Staff\\/Admin\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2022-08-23 03:13:42'),
(3, 1, 'PASSWORD_CHANGED', 'support@mail.com', 'PASSWORD CHANGED ', 'Your password changed ', 'Your password changed \r\n\r\nNew password [[password]]\r\n\r\n', 'Your password changed\r\n\r\nNew password [[password]]\r\n\r\n\r\nNews [[test]]', '{\"password\":\"password\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2022-08-23 03:13:42'),
(4, 1, 'ADD_BALANCE', 'support@mail.com', 'Balance Add by Admin', 'Your Account has been credited', '[[amount]] [[currency]] credited in your account.\r\n\r\nYour Current Balance [[main_balance]][[currency]]\r\n\r\nTransaction: #[[transaction]]', '[[amount]] [[currency]] credited in your account. \r\n\r\n\r\nYour Current Balance [[main_balance]][[currency]]\r\n\r\nTransaction: #[[transaction]]', '{\"transaction\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"currency\":\"Site Currency\", \"main_balance\":\"Users Balance After this operation\"}', 0, 1, 'en', '2021-12-17 10:00:26', '2022-08-23 03:13:42'),
(6, 1, 'DEDUCTED_BALANCE', 'support@mail.com', 'Balance deducted by Admin', 'Your Account has been debited', '[[amount]] [[currency]] debited in your account.\r\n\r\nYour Current Balance [[main_balance]][[currency]]\r\n\r\nTransaction: #[[transaction]]', '[[amount]] [[currency]] debited in your account.\r\n\r\nYour Current Balance [[main_balance]][[currency]]\r\n\r\nTransaction: #[[transaction]]', '{\"transaction\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"currency\":\"Site Currency\", \"main_balance\":\"Users Balance After this operation\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2022-08-23 03:13:42'),
(11, 1, 'PASSWORD_RESET', 'support@mail.com', 'Reset Password Notification', 'Reset Password Notification', 'You are receiving this email because we received a password reset request for your account.[[message]]\r\n\r\n\r\nThis password reset link will expire in 60 minutes.\r\n\r\nIf you did not request a password reset, no further action is required.', 'You are receiving this email because we received a password reset request for your account. [[message]]', '{\"message\":\"message\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2022-08-23 03:13:42'),
(12, 1, 'VERIFICATION_CODE', 'support@mail.com', 'Verification Code', 'Verify Your Email ', 'Your Email verification Code  [[code]]', 'Your SMS verification Code  [[code]]', '{\"code\":\"code\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2022-08-23 03:13:42'),
(21, 1, 'TWO_STEP_ENABLED', 'support@mail.com', 'TWO STEP ENABLED', 'TWO STEP ENABLED', 'Your verification code is: [[code]]', 'Your verification code is: [[code]]', '{\"action\":\"Enabled Or Disable\",\"ip\":\"Device Ip\",\"browser\":\"browser and Operating System \",\"time\":\"Time\",\"code\":\"code\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2022-08-23 03:13:42'),
(22, 1, 'TWO_STEP_DISABLED', 'support@mail.com', 'TWO STEP DISABLED', 'TWO STEP DISABLED', 'Google two factor verification is disabled', 'Google two factor verification is disabled', '{\"action\":\"Enabled Or Disable\",\"ip\":\"Device Ip\",\"browser\":\"browser and Operating System \",\"time\":\"Time\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2022-08-23 03:13:42'),
(24, 1, 'PAYOUT_REQUEST', 'support@mail.com', 'Withdraw request has been sent', 'Withdraw request has been sent', '[[amount]] [[currency]] withdraw requested by [[method_name]]\r\n\r\n\r\nCharge [[charge]] [[currency]]\r\n\r\nTransaction [[trx]]\r\n', '[[amount]] [[currency]] withdraw requested by [[method_name]]\r\n\r\n\r\nCharge [[charge]] [[currency]]\r\n\r\nTransaction [[trx]]\r\n', '{\"method_name\":\"method name\",\"amount\":\"amount\",\"charge\":\"charge\",\"currency\":\"currency\",\"trx\":\"transaction\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2022-08-23 03:13:42'),
(27, 1, 'PAYOUT_REJECTED', 'support@mail.com', 'Withdraw request has been rejected', 'Withdraw request has been rejected', '[[amount]] [[currency]] withdraw has been rejeced\n\nPayout Method [[method]]\nCharge [[charge]] [[currency]]\nTransaction [[transaction]]\n\n\nAdmin feedback [[feedback]]\n\n', '[[amount]] [[currency]] withdraw has been rejeced\r\n\r\nPayout Method [[method]]\r\nCharge [[charge]] [[currency]]\r\nTransaction [[transaction]]\r\n\r\n\r\nAdmin feedback [[feedback]]\r\n\r\n', '{\"method\":\"Payout method\",\"amount\":\"amount\",\"charge\":\"charge\",\"currency\":\"currency\",\"transaction\":\"transaction\",\"feedback\":\"Admin feedback\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2022-08-23 03:13:42'),
(28, 1, 'PAYOUT_APPROVE ', 'support@mail.com', 'Withdraw request has been approved', 'Withdraw request has been approved', '[[amount]] [[currency]] withdraw has been approved\r\n\r\nPayout Method [[method]]\r\nCharge [[charge]] [[currency]]\r\nTransaction [[transaction]]\r\n\r\n\r\nAdmin feedback [[feedback]]\r\n\r\n', '[[amount]] [[currency]] withdraw has been approved\n\nPayout Method [[method]]\nCharge [[charge]] [[currency]]\nTransaction [[transaction]]\n\n\nAdmin feedback [[feedback]]\n\n', '{\"method\":\"Payout method\",\"amount\":\"amount\",\"charge\":\"charge\",\"currency\":\"currency\",\"transaction\":\"transaction\",\"feedback\":\"Admin feedback\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2022-08-23 03:13:42'),
(42, 1, 'EXCHANGE_COMPLETE', 'support@mail.com', 'Exchange Completed', 'Exchange Completed', 'Your [[sendAmount]] [[sendCurrency]] to [[receiveAmount]] [[receiveCurrency]] exchange has been completed.\r\n\r\nComments: [[comments]]\r\n', 'Your [[sendAmount]] [[sendCurrency]] to [[receiveAmount]] [[receiveCurrency]] exchange has been completed.\r\n\r\nComments: [[comments]]\r\n', '{\"sendAmount\":\"Send Amount\",\"receiveAmount\":\"Receive Amount\",\"sendCurrency\":\"Send Currency\", \"receiveCurrency\":\"Receive Currency\",\"comments\":\"Comments\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2022-08-23 03:13:42'),
(43, 1, 'EXCHANGE_REJECTED', 'support@mail.com', 'Exchange Rejected', 'Exchange Rejected', 'Your [[sendAmount]] [[sendCurrency]] to [[receiveAmount]] [[receiveCurrency]] exchange has been rejected.\r\n\r\nComments: [[comments]]', 'Your [[sendAmount]] [[sendCurrency]] to [[receiveAmount]] [[receiveCurrency]] exchange has been rejected.\r\n\r\nComments: [[comments]]', '{\"sendAmount\":\"Send Amount\",\"receiveAmount\":\"Receive Amount\",\"sendCurrency\":\"Send Currency\", \"receiveCurrency\":\"Receive Currency\",\"comments\":\"Comments\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2022-08-23 03:13:42'),
(44, 1, 'EXCHANGE_CREATE', 'support@mail.com', 'Exchange Create', 'Exchange Create', 'Your [[sendAmount]] [[sendCurrency]] to [[receiveAmount]] [[receiveCurrency]] exchange has been created.\r\n\r\n', 'Your [[sendAmount]] [[sendCurrency]] to [[receiveAmount]] [[receiveCurrency]] exchange has been created.\r\n\r\n', '{\"sendAmount\":\"Send Amount\",\"receiveAmount\":\"Receive Amount\",\"sendCurrency\":\"Send Currency\", \"receiveCurrency\":\"Receive Currency\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2022-08-23 03:13:42'),
(45, 1, 'REFERRAL_BONUS', 'support@mail.com', 'REFERRAL BONUS', 'REFERRAL BONUS', '<p>You got [[amount]] [[currency]]  Referral bonus From  [[bonus_from]]</p><p>\r\n\r\nLevel Commission [[level]]</p><p>\r\ntransaction : [[transaction_id]]\r\n</p><p>\r\nMain Balance: [[final_balance]] [[currency]]</p>\r\n', 'You got [[amount]] [[currency]]  Referral bonus From  [[bonus_from]] \r\n\r\nLevel Commission [[level]]\r\n\r\ntransaction : [[transaction_id]]\r\n\r\nMain Balance: [[final_balance]] [[currency]] \r\n', '{\"bonus_from\":\"bonus from User\",\"amount\":\"amount\",\"currency\":\"currency\",\"level\":\"level\",\"transaction_id\":\"transaction id\",\"final_balance\":\"final balance\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2022-08-23 03:13:42');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` int(11) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_name` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = active, 0 = inactive',
  `rtl` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `short_name`, `flag`, `is_active`, `rtl`, `created_at`, `updated_at`) VALUES
(1, 'English', 'US', NULL, 1, 0, '2021-12-17 10:00:55', '2021-12-17 10:00:55'),
(18, 'Spanish', 'ES', NULL, 1, 0, '2021-12-17 10:00:55', '2021-12-17 10:31:02');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(8, '2020_09_29_074810_create_jobs_table', 1),
(32, '2020_11_12_075639_create_transactions_table', 6),
(36, '2020_10_14_113046_create_admins_table', 9),
(42, '2020_11_24_064711_create_email_templates_table', 11),
(48, '2014_10_12_000000_create_users_table', 13),
(51, '2020_09_16_103709_create_controls_table', 15),
(59, '2021_01_03_061604_create_tickets_table', 17),
(60, '2021_01_03_061834_create_ticket_messages_table', 18),
(61, '2021_01_03_065607_create_ticket_attachments_table', 18),
(62, '2021_01_07_095019_create_funds_table', 19),
(66, '2021_01_21_050226_create_languages_table', 21),
(69, '2020_12_17_075238_create_sms_controls_table', 23),
(70, '2021_01_26_051716_create_site_notifications_table', 24),
(72, '2021_01_26_075451_create_notify_templates_table', 25),
(73, '2021_01_28_074544_create_contents_table', 26),
(74, '2021_01_28_074705_create_content_details_table', 26),
(75, '2021_01_28_074829_create_content_media_table', 26),
(76, '2021_01_28_074847_create_templates_table', 26),
(77, '2021_01_28_074905_create_template_media_table', 26),
(83, '2021_02_03_100945_create_subscribers_table', 27),
(86, '2021_01_21_101641_add_language_to_email_templates_table', 28),
(87, '2021_02_14_064722_create_manage_plans_table', 28),
(88, '2021_02_14_072251_create_manage_times_table', 29),
(89, '2021_03_09_100340_create_investments_table', 30),
(90, '2021_03_13_132414_create_payout_methods_table', 31),
(91, '2021_03_13_133534_create_payout_logs_table', 32),
(93, '2021_03_18_091710_create_referral_bonuses_table', 33),
(94, '2021_10_25_060950_create_money_transfers_table', 34),
(96, '2021_03_18_091710_create_users_table', 35),
(97, '2022_08_16_131538_create_currencies_table', 36),
(98, '2022_08_22_082015_create_currency_sells_table', 37),
(99, '2022_08_25_095327_create_testimonials_table', 38);

-- --------------------------------------------------------

--
-- Table structure for table `notify_templates`
--

CREATE TABLE `notify_templates` (
  `id` int(11) NOT NULL,
  `language_id` int(11) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_keys` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `notify_for` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=> Admin, 0=> User',
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notify_templates`
--

INSERT INTO `notify_templates` (`id`, `language_id`, `name`, `template_key`, `body`, `short_keys`, `status`, `notify_for`, `lang_code`, `created_at`, `updated_at`) VALUES
(1, 1, 'SUPPORT TICKET CREATE', 'SUPPORT_TICKET_CREATE', '[[username]] create a ticket\r\nTicket : [[ticket_id]]\r\n\r\n', '{\"ticket_id\":\"Support Ticket ID\",\"username\":\"username\"}', 1, 1, NULL, '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(2, 1, 'SUPPORT TICKET REPLIED', 'SUPPORT_TICKET_REPLIED', '[[username]] replied  ticket\r\nTicket : [[ticket_id]]\r\n\r\n', '{\"ticket_id\":\"Support Ticket ID\",\"username\":\"username\"}', 1, 1, NULL, '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(3, 1, 'ADMIN REPLIED SUPPORT TICKET ', 'ADMIN_REPLIED_TICKET', 'Admin replied  \r\nTicket : [[ticket_id]]', '{\"ticket_id\":\"Support Ticket ID\"}', 1, 0, 'en', '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(4, 1, 'ADMIN DEPOSIT NOTIFICATION', 'PAYMENT_COMPLETE', '[[username]] deposited [[amount]] [[currency]] via [[gateway]]\r\n', '{\"gateway\":\"gateway\",\"amount\":\"amount\",\"currency\":\"currency\",\"username\":\"username\"}', 1, 1, NULL, '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(5, 1, 'ADD BALANCE', 'ADD_BALANCE', '[[amount]] [[currency]] credited in your account. \r\n\r\n\r\nYour Current Balance [[main_balance]][[currency]]\r\n\r\nTransaction: #[[transaction]]', '{\"transaction\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"currency\":\"Site Currency\", \"main_balance\":\"Users Balance After this operation\"}', 1, 0, 'en', '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(6, 1, 'DEDUCTED BALANCE', 'DEDUCTED_BALANCE', '[[amount]] [[currency]] debited in your account.\r\n\r\nYour Current Balance [[main_balance]][[currency]]\r\n\r\nTransaction: #[[transaction]]', '{\"transaction\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"currency\":\"Site Currency\", \"main_balance\":\"Users Balance After this operation\"}', 1, 0, 'en', '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(7, 1, 'NEW USER ADDED', 'ADDED_USER', '[[username]] has been joined\r\n\r\n', '{\"username\":\"username\"}', 1, 1, 'en', '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(8, 1, 'WITHDRAW REQUEST NOTIFICATION TO ADMIN', 'PAYOUT_REQUEST', '[[username]] withdraw requested by [[amount]] [[currency]] \r\n\r\n', '{\"amount\":\"amount\",\"currency\":\"currency\",\"username\":\"username\"}', 1, 1, NULL, '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(9, 1, 'PAYOUT REJECTED ', 'PAYOUT_REJECTED', '[[amount]] [[currency]]  withdraw requested has been rejected\r\n\r\n', '{\"amount\":\"amount\",\"currency\":\"currency\"}', 1, 1, NULL, '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(10, 1, 'PAYOUT APPROVE ', 'PAYOUT_APPROVE ', '[[amount]] [[currency]]  withdraw requested has been approved\r\n\r\n', '{\"amount\":\"amount\",\"currency\":\"currency\"}', 1, 1, NULL, '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(11, 1, 'ADMIN DEPOSIT REQUEST NOTIFICATION', 'PAYMENT_REQUEST', '[[username]] deposit request [[amount]] [[currency]] via [[gateway]]\r\n', '{\"gateway\":\"gateway\",\"amount\":\"amount\",\"currency\":\"currency\",\"username\":\"username\"}', 1, 1, NULL, '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(15, 1, 'Exchange Completed ', 'EXCHANGE_COMPLETE ', 'Your [[sendAmount]] [[sendCurrency]] to  [[receiveAmount]] [[receiveCurrency]] excahnge has been Completed.\r\n\r\n', '{\"sendAmount\":\"Send Amount\",\"receiveAmount\":\"Receive Amount\",\"sendCurrency\":\"Send Currency\",\"receiveCurrency\":\"Receive Currency\"}', 1, 1, NULL, '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(16, 1, 'Exchange Rejected ', 'EXCHANGE_REJECTED ', 'Your [[sendAmount]] [[sendCurrency]] to  [[receiveAmount]] [[receiveCurrency]] excahnge has been Rejected.\r\n\r\n', '{\"sendAmount\":\"Send Amount\",\"receiveAmount\":\"Receive Amount\",\"sendCurrency\":\"Send Currency\",\"receiveCurrency\":\"Receive Currency\"}', 1, 1, NULL, '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(17, 1, 'ADMIN EXCHANGE REQUEST NOTIFICATION', 'EXCHANGE_REQUEST', '[[username]] request to exchange [[sendAmount]] [[sendCurrency]] to [[receiveAmount]] [[receiveCurrency]] ', '{\"username\":\"Username\",\"sendAmount\":\"Send Amount\",\"receiveAmount\":\"Receive Amount\",\"sendCurrency\":\"Send Currency\",\"receiveCurrency\":\"Receive Currency\"}', 1, 1, NULL, '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(18, 1, 'REFERRAL BONUS', 'REFERRAL_BONUS', 'You got [[amount]] [[currency]]  Referral bonus From  [[bonus_from]] \r\n\r\n', '{\"bonus_from\":\"bonus from User\",\"amount\":\"amount\",\"currency\":\"currency\",\"level\":\"level\"}', 1, 1, NULL, '2021-12-17 10:01:53', '2021-12-17 10:01:53');

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
-- Table structure for table `payout_logs`
--

CREATE TABLE `payout_logs` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `method_id` int(11) UNSIGNED DEFAULT NULL,
  `amount` decimal(11,2) DEFAULT NULL,
  `charge` decimal(11,2) DEFAULT NULL,
  `net_amount` decimal(11,2) DEFAULT NULL,
  `information` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feedback` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1=> pending, 2=> success, 3=> cancel,',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payout_methods`
--

CREATE TABLE `payout_methods` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minimum_amount` decimal(11,2) DEFAULT NULL,
  `maximum_amount` decimal(11,2) DEFAULT NULL,
  `fixed_charge` decimal(11,2) DEFAULT NULL,
  `percent_charge` decimal(11,2) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `input_form` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payout_methods`
--

INSERT INTO `payout_methods` (`id`, `name`, `image`, `minimum_amount`, `maximum_amount`, `fixed_charge`, `percent_charge`, `status`, `input_form`, `duration`, `created_at`, `updated_at`) VALUES
(1, 'Wire Transfer', '606418e821ad01617172712.jpg', '20.00', '2000.00', '10.00', '0.00', 1, '{\"email\":{\"field_name\":\"email\",\"field_level\":\"Email\",\"type\":\"text\",\"validation\":\"required\"},\"nid_number\":{\"field_name\":\"nid_number\",\"field_level\":\"NID Number\",\"type\":\"text\",\"validation\":\"required\"},\"passport_number\":{\"field_name\":\"passport_number\",\"field_level\":\"Passport Number\",\"type\":\"text\",\"validation\":\"nullable\"}}', '1-2 Hours', '2021-12-17 10:02:14', '2021-12-17 10:02:14'),
(2, 'Bank Transfer', '6064181b137c91617172507.jpg', '10.00', '100.00', '10.00', '1.00', 1, '{\"bank_name\":{\"field_name\":\"bank_name\",\"field_level\":\"Bank Name\",\"type\":\"text\",\"validation\":\"required\"},\"transaction_prove\":{\"field_name\":\"transaction_prove\",\"field_level\":\"Transaction Prove\",\"type\":\"file\",\"validation\":\"required\"},\"your_address\":{\"field_name\":\"your_address\",\"field_level\":\"Your Address\",\"type\":\"textarea\",\"validation\":\"required\"}}', '1-2 hours maximum', '2021-12-17 10:02:14', '2021-12-17 10:02:14');

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` int(11) UNSIGNED NOT NULL,
  `commission_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL,
  `percent` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referral_bonuses`
--

CREATE TABLE `referral_bonuses` (
  `id` int(11) UNSIGNED NOT NULL,
  `from_user_id` int(11) UNSIGNED DEFAULT NULL,
  `to_user_id` int(11) UNSIGNED DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `amount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `main_balance` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `transaction` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_notifications`
--

CREATE TABLE `site_notifications` (
  `id` int(11) UNSIGNED NOT NULL,
  `site_notificational_id` int(11) NOT NULL,
  `site_notificational_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_controls`
--

CREATE TABLE `sms_controls` (
  `id` int(11) UNSIGNED NOT NULL,
  `actionMethod` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actionUrl` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `headerData` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paramData` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `formData` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_controls`
--

INSERT INTO `sms_controls` (`id`, `actionMethod`, `actionUrl`, `headerData`, `paramData`, `formData`, `created_at`, `updated_at`) VALUES
(1, 'POST', 'https://rest.nexmo.com/sms/json', '{\"Content-Type\":\"application\\/x-www-form-urlencoded\"}', NULL, '{\"from\":\"Rownak\",\"text\":\"[[message]]\",\"to\":\"[[receiver]]\",\"api_key\":\"930cc608\",\"api_secret\":\"2pijsaMOUw5YKOK5\"}', '2021-12-17 10:02:43', '2021-12-17 10:02:43');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `created_at`, `updated_at`) VALUES
(7, 'demouserr@gmail.com', '2022-05-16 04:08:23', '2022-05-16 04:08:23'),
(8, 'mail@example.com', '2022-08-16 01:26:20', '2022-08-16 01:26:20'),
(9, 'baaaaaugfinder.me@gmail.com', '2022-09-04 01:03:38', '2022-09-04 01:03:38'),
(10, 'ttt@example.com', '2022-09-04 01:04:01', '2022-09-04 01:04:01');

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `id` int(11) UNSIGNED NOT NULL,
  `language_id` int(11) UNSIGNED DEFAULT NULL,
  `section_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id`, `language_id`, `section_name`, `description`, `created_at`, `updated_at`) VALUES
(82, 1, 'hero', '{\"title\":\"First Offer GET 25% OFF NOW\",\"sub_title\":\"Trusted &amp; Secure Currency Exchange\",\"short_description\":\"Trade Bitcoin, Ethereum, USDT and other altcoins using our crypto trading app.\",\"button_name\":\"Get Started\"}', '2022-08-14 04:38:15', '2022-09-04 09:47:47'),
(83, 1, 'how-it-work', '{\"title\":\"Working Process\",\"sub_title\":\"How It Works\",\"short_description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Atque accusantium, quaerat perferendis consectetur.\"}', '2022-08-14 04:55:30', '2022-08-14 04:55:30'),
(84, 1, 'about-us', '{\"title\":\"Know More\",\"sub_title\":\"About Us\",\"short_description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Atque accusantium, quaerat perferendis consectetur.\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Quidem, culpa explicabo, quisquam quasi blanditiis adipisci reiciendis ex incidunt similique facilis nesciunt porro.\\r\\n\\r\\nLorem ipsum dolor, sit amet consectetur adipisicing elit. Odit illo illum vero saepe. Quasi, fugit facere? Expedita, laborum voluptates ipsa voluptatibus eligendi consequatur architecto provident minus atque, vitae excepturi praesentium. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Odit illo illum vero saepe. Quasi, fugit facere? Expedita, laborum voluptates ipsa voluptatibus eligendi consequatur architecto provident minus atque, vitae excepturi praesentium.\\r\\n\\r\\nLorem ipsum dolor sit, amet consectetur adipisicing elit. Minima pariatur qui eaque aliquam doloremque ducimus fugit minus ut quasi neque iste modi error facere incidunt corporis, quas eum sit repellat.\",\"button_name\":\"Learn More\"}', '2022-08-14 05:14:03', '2022-08-14 05:14:03'),
(85, 1, 'latest-exchange', '{\"title\":\"Latest Exchanges\"}', '2022-08-14 05:43:32', '2022-08-25 00:58:19'),
(86, 1, 'faq', '{\"title\":\"Faqs\",\"sub_title\":\"Frequently Asked Questions\",\"short_description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Atque accusantium, quaerat perferendis consectetur.\"}', '2022-08-14 05:47:27', '2022-08-14 05:47:27'),
(87, 1, 'testimonial', '{\"title\":\"Testimonial\",\"sub_title\":\"What Clients Say\",\"short_description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Atque accusantium, quaerat perferendis consectetur.\"}', '2022-08-14 06:00:07', '2022-08-14 06:00:07'),
(88, 1, 'blog', '{\"title\":\"Our Blogs\",\"sub_title\":\"Latest News Update\",\"short_description\":\"Here are a few reasons why you should choose Oction for sell your NFT\"}', '2022-08-14 06:12:43', '2022-08-14 06:12:43'),
(89, 1, 'contact-us', '{\"heading\":\"Contact Us\",\"sub_heading\":\"Our clients send us bunch of smilies with our services and we love them\",\"address\":\"7 Green Lake Street Crawfordsville, IN 47933\",\"email\":\"info2@nftmonkey.com\",\"phone\":\"+1 800 123 456 789\",\"footer_short_details\":\"<p>We are a full service like readable english. Many desktop publishing packages and web page editor now use lorem Ipsum sites still in their.<br \\/><\\/p>\"}', '2022-08-16 00:08:40', '2022-08-16 00:25:50'),
(90, 18, 'hero', '{\"title\":\"Primera oferta OBTENGA 25% DE DESCUENTO AHORA\",\"sub_title\":\"De confianza y amp; intercambio criptogr\\u00e1fico seguro\",\"short_description\":\"Opere Bitcoin, Ethereum, USDT y otras monedas alternativas utilizando nuestra aplicaci\\u00f3n de comercio de criptomonedas.\",\"button_name\":\"Empezar\"}', '2022-08-25 06:23:50', '2022-08-25 06:23:50'),
(91, 18, 'how-it-work', '{\"title\":\"Proceso de trabajo\",\"sub_title\":\"C\\u00f3mo funciona\",\"short_description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Atque accusantium, quaerat perferendis consectetur.\"}', '2022-08-25 06:24:33', '2022-08-25 06:24:33'),
(92, 18, 'about-us', '{\"title\":\"Saber m\\u00e1s\",\"sub_title\":\"Sobre nosotras\",\"short_description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Atque accusantium, quaerat perferendis consectetur.\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Quidem, culpa explicabo, quisquam quasi blanditiis adipisci reiciendis ex incidunt similique facilis nesciunt porro. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Odit illo illum vero saepe. Quasi, fugit facere? Expedita, laborum voluptates ipsa voluptatibus eligendi consequatur architecto provident minus atque, vitae excepturi praesentium. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Odit illo illum vero saepe. Quasi, fugit facere? Expedita, laborum voluptates ipsa voluptatibus eligendi consequatur architecto provident minus atque, vitae excepturi praesentium. Lorem ipsum dolor sit, amet consectetur adipisicing elit. Minima pariatur qui eaque aliquam doloremque ducimus fugit minus ut quasi neque iste modi error facere incidunt corporis, quas eum sit repellat.\",\"button_name\":\"Aprende m\\u00e1s\"}', '2022-08-25 06:25:45', '2022-08-25 06:25:45'),
(93, 18, 'latest-exchange', '{\"title\":\"\\u00daltimos intercambios\"}', '2022-08-25 06:25:59', '2022-08-25 06:25:59'),
(94, 18, 'faq', '{\"title\":\"Preguntas frecuentes\",\"sub_title\":\"Preguntas frecuentes\",\"short_description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Atque accusantium, quaerat perferendis consectetur.\"}', '2022-08-25 06:26:39', '2022-08-25 06:26:39'),
(95, 18, 'testimonial', '{\"title\":\"Testimonial\",\"sub_title\":\"Lo que dicen las clientes\",\"short_description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Atque accusantium, quaerat perferendis consectetur.\"}', '2022-08-25 06:27:24', '2022-08-25 06:27:24'),
(96, 18, 'blog', '{\"title\":\"Nuestras Blogs\",\"sub_title\":\"\\u00daltimas noticias actualizadas\",\"short_description\":\"Aqu\\u00ed hay algunas razones por las que deber\\u00eda elegir Oction para vender su NFT\"}', '2022-08-25 06:28:11', '2022-08-25 06:28:11'),
(97, 18, 'contact-us', '{\"heading\":\"Contacta con nosotras\",\"sub_heading\":\"Nuestros clientes nos env\\u00edan montones de caritas con nuestros servicios y nos encantan\",\"address\":\"7 Calle Lago Verde Crawfordsville, IN 47933\",\"email\":\"info2@nftmonkey.com\",\"phone\":\"+1 800 123 456 789\",\"footer_short_details\":\"Somos un servicio completo como ingl\\u00e9s legible. Muchos paquetes de autoedici\\u00f3n y editores de p\\u00e1ginas web ahora usan sitios de lorem Ipsum todav\\u00eda en sus.\"}', '2022-08-25 06:29:21', '2022-08-25 06:29:21');

-- --------------------------------------------------------

--
-- Table structure for table `template_media`
--

CREATE TABLE `template_media` (
  `id` int(11) UNSIGNED NOT NULL,
  `section_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `template_media`
--

INSERT INTO `template_media` (`id`, `section_name`, `description`, `created_at`, `updated_at`) VALUES
(7, 'hero', '{\"button_link\":\"https:\\/\\/script.viserlab.com\\/localcoins\\/admin\\/payment-window\"}', '2022-08-14 04:38:15', '2022-08-14 04:38:15'),
(8, 'about-us', '{\"image\":\"62f8d8fb701581660475643.png\",\"button_link\":\"http:\\/\\/localhost\\/exchanger\\/project\\/\"}', '2022-08-14 05:14:03', '2022-08-14 05:14:03'),
(9, 'faq', '{\"image\":\"62f8e0cfd7dd41660477647.png\"}', '2022-08-14 05:47:27', '2022-08-14 05:47:27');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_sell_id` int(11) DEFAULT NULL,
  `comments` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` int(11) NOT NULL DEFAULT 5,
  `status` int(11) NOT NULL COMMENT '0=>pending 1=>approve',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(91) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed	',
  `last_reply` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_attachments`
--

CREATE TABLE `ticket_attachments` (
  `id` int(11) UNSIGNED NOT NULL,
  `ticket_message_id` int(11) UNSIGNED DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_messages`
--

CREATE TABLE `ticket_messages` (
  `id` int(11) UNSIGNED NOT NULL,
  `ticket_id` int(11) UNSIGNED DEFAULT NULL,
  `admin_id` int(11) UNSIGNED DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double(18,8) DEFAULT NULL,
  `charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `final_balance` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trx_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `firstname` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referral_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(91) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `identity_verify` tinyint(4) NOT NULL COMMENT '	0 => Not Applied, 1=> Applied, 2=> Approved, 3 => Rejected	',
  `address_verify` tinyint(4) NOT NULL COMMENT '0 => Not Applied, 1=> Applied, 2=> Approved, 3 => Rejected	',
  `two_fa` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: two-FA off, 1: two-FA on',
  `two_fa_verify` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: two-FA unverified, 1: two-FA verified',
  `two_fa_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verification` tinyint(1) NOT NULL DEFAULT 1,
  `sms_verification` tinyint(1) NOT NULL DEFAULT 1,
  `verify_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `configures`
--
ALTER TABLE `configures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contents_name_index` (`name`);

--
-- Indexes for table `content_details`
--
ALTER TABLE `content_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_details_content_id_foreign` (`content_id`),
  ADD KEY `content_details_language_id_foreign` (`language_id`);

--
-- Indexes for table `content_media`
--
ALTER TABLE `content_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_media_content_id_foreign` (`content_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency_sells`
--
ALTER TABLE `currency_sells`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_templates_language_id_foreign` (`language_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notify_templates`
--
ALTER TABLE `notify_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notify_templates_language_id_foreign` (`language_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payout_logs`
--
ALTER TABLE `payout_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payout_methods`
--
ALTER TABLE `payout_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referral_bonuses`
--
ALTER TABLE `referral_bonuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_notifications`
--
ALTER TABLE `site_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_controls`
--
ALTER TABLE `sms_controls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `template_media`
--
ALTER TABLE `template_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `template_media_section_name_index` (`section_name`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_user_id_foreign` (`user_id`);

--
-- Indexes for table `ticket_attachments`
--
ALTER TABLE `ticket_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_attachments_ticket_message_id_foreign` (`ticket_message_id`);

--
-- Indexes for table `ticket_messages`
--
ALTER TABLE `ticket_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_messages_ticket_id_foreign` (`ticket_id`),
  ADD KEY `ticket_messages_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `configures`
--
ALTER TABLE `configures`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `content_details`
--
ALTER TABLE `content_details`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=268;

--
-- AUTO_INCREMENT for table `content_media`
--
ALTER TABLE `content_media`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currency_sells`
--
ALTER TABLE `currency_sells`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `notify_templates`
--
ALTER TABLE `notify_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `payout_logs`
--
ALTER TABLE `payout_logs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payout_methods`
--
ALTER TABLE `payout_methods`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referral_bonuses`
--
ALTER TABLE `referral_bonuses`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_notifications`
--
ALTER TABLE `site_notifications`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_controls`
--
ALTER TABLE `sms_controls`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `template_media`
--
ALTER TABLE `template_media`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_attachments`
--
ALTER TABLE `ticket_attachments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ticket_messages`
--
ALTER TABLE `ticket_messages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `content_details`
--
ALTER TABLE `content_details`
  ADD CONSTRAINT `content_details_content_id_foreign` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`),
  ADD CONSTRAINT `content_details_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Constraints for table `content_media`
--
ALTER TABLE `content_media`
  ADD CONSTRAINT `content_media_content_id_foreign` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`);

--
-- Constraints for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD CONSTRAINT `email_templates_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Constraints for table `notify_templates`
--
ALTER TABLE `notify_templates`
  ADD CONSTRAINT `notify_templates_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `ticket_attachments`
--
ALTER TABLE `ticket_attachments`
  ADD CONSTRAINT `ticket_attachments_ticket_message_id_foreign` FOREIGN KEY (`ticket_message_id`) REFERENCES `ticket_messages` (`id`);

--
-- Constraints for table `ticket_messages`
--
ALTER TABLE `ticket_messages`
  ADD CONSTRAINT `ticket_messages_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`),
  ADD CONSTRAINT `ticket_messages_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
