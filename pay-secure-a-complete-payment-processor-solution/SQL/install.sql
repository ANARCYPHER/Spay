-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2023 at 08:05 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pay_secure`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=>inactive, 1=>active',
  `is_owner` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>owner',
  `role_id` int(11) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `fcm_token` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `status`, `is_owner`, `role_id`, `username`, `password`, `remember_token`, `created_at`, `updated_at`, `fcm_token`) VALUES
(1, 'Admin', 'admin@gmail.com', 1, 1, NULL, 'admin', '$2y$10$H5oSxdIu6goOeGvtlVBJY.Uq4xNWrS0ZT/BET/94tpEtLIf1JyqUa', 'A7CWyGFSAoOyih7TRhIG3uqnhLe9Us1SEOnZpJDVKCIhFtySMW39dDq0F0XV', '2020-12-12 07:34:26', '2022-06-28 05:28:36', NULL),
(5, 'Babar Azam', 'babar@gmail.com', 1, 0, 1, 'babarazam', '$2y$10$9Puk0iIy2GL/r5iyiAYimuCZfB6WAwTM9cfNhTEHIaWJuCcnX83j.', NULL, '2023-02-01 06:22:39', '2023-02-03 23:33:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_profiles`
--

CREATE TABLE `admin_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `state` varchar(32) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `last_login_ip` varchar(16) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_profiles`
--

INSERT INTO `admin_profiles` (`id`, `admin_id`, `city`, `state`, `phone`, `address`, `profile_picture`, `last_login_at`, `last_login_ip`, `created_at`, `updated_at`) VALUES
(1, 1, 'NY pd', 'NY pd', '123456789', 'R - 08, H - 41', 'admin.jpg', NULL, NULL, '2021-01-16 06:35:21', '2022-06-27 03:58:14');

-- --------------------------------------------------------

--
-- Table structure for table `api_orders`
--

CREATE TABLE `api_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `gateway_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `utr` varchar(255) DEFAULT NULL,
  `percentage` double DEFAULT 0,
  `charge_percentage` double NOT NULL DEFAULT 0,
  `charge_fixed` double NOT NULL DEFAULT 0,
  `amount` double DEFAULT NULL,
  `charge` double DEFAULT NULL,
  `meta` text NOT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>pending,1=>completed,2=>fail',
  `ipn_url` mediumtext DEFAULT NULL,
  `redirect_url` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `api_order_tests`
--

CREATE TABLE `api_order_tests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `gateway_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `utr` varchar(255) DEFAULT NULL,
  `percentage` double NOT NULL DEFAULT 0,
  `charge_percentage` double NOT NULL DEFAULT 0,
  `charge_fixed` double NOT NULL DEFAULT 0,
  `amount` double DEFAULT NULL,
  `charge` double DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `meta` text NOT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>pending, 1=>success,2=>fail',
  `ipn_url` mediumtext DEFAULT NULL,
  `redirect_url` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `basic_controls`
--

CREATE TABLE `basic_controls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency_layer_access_key` varchar(255) DEFAULT NULL,
  `currency_layer_auto_update` tinyint(1) NOT NULL DEFAULT 0,
  `currency_layer_auto_update_at` varchar(255) DEFAULT NULL,
  `coin_market_cap_app_key` varchar(255) DEFAULT NULL,
  `coin_market_cap_auto_update` tinyint(1) NOT NULL DEFAULT 0,
  `coin_market_cap_auto_update_at` varchar(255) DEFAULT NULL,
  `site_title` varchar(255) DEFAULT NULL,
  `primaryColor` varchar(255) DEFAULT NULL,
  `secondaryColor` varchar(10) DEFAULT NULL,
  `time_zone` varchar(255) DEFAULT NULL,
  `base_currency` varchar(255) DEFAULT NULL,
  `base_currency_code` varchar(255) DEFAULT NULL,
  `currency_symbol` varchar(255) DEFAULT NULL,
  `fraction_number` varchar(255) DEFAULT NULL,
  `paginate` varchar(255) DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `social_title` text DEFAULT NULL,
  `social_description` text DEFAULT NULL,
  `sender_email` varchar(255) DEFAULT NULL,
  `sender_email_name` varchar(255) DEFAULT NULL,
  `email_description` text DEFAULT NULL,
  `push_notification` tinyint(1) NOT NULL DEFAULT 0,
  `email_notification` tinyint(1) NOT NULL DEFAULT 0,
  `email_verification` tinyint(1) NOT NULL DEFAULT 0,
  `sms_notification` tinyint(1) NOT NULL DEFAULT 0,
  `sms_verification` tinyint(1) NOT NULL DEFAULT 0,
  `allowUser` tinyint(1) NOT NULL DEFAULT 0,
  `joining_bonus` varchar(255) DEFAULT NULL,
  `deposit_commission` tinyint(1) NOT NULL DEFAULT 0,
  `signup_bonus_status` tinyint(1) NOT NULL DEFAULT 0,
  `transfer` tinyint(1) NOT NULL DEFAULT 0,
  `request` tinyint(1) NOT NULL DEFAULT 0,
  `exchange` tinyint(1) NOT NULL DEFAULT 0,
  `redeem` tinyint(1) NOT NULL DEFAULT 0,
  `escrow` tinyint(1) NOT NULL DEFAULT 0,
  `voucher` tinyint(1) NOT NULL DEFAULT 0,
  `invoice` tinyint(1) DEFAULT NULL,
  `invoice_charge` tinyint(4) DEFAULT NULL COMMENT '0=>sender, 1=>receiver',
  `store` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=>off,1=>on',
  `qr_payment` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=>off, 1=>on',
  `virtual_card` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=>off,1=>on',
  `v_card_multiple` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=>no,1=>yes',
  `v_card_charge` double NOT NULL DEFAULT 0,
  `deposit` tinyint(1) NOT NULL DEFAULT 0,
  `payout` tinyint(1) NOT NULL DEFAULT 0,
  `force_ssl` tinyint(1) NOT NULL DEFAULT 0,
  `bill_payment` tinyint(4) NOT NULL DEFAULT 0,
  `tawk_id` varchar(255) DEFAULT NULL,
  `tawk_status` tinyint(1) NOT NULL DEFAULT 0,
  `fb_messenger_status` tinyint(1) NOT NULL DEFAULT 0,
  `fb_app_id` varchar(255) DEFAULT NULL,
  `fb_page_id` varchar(255) DEFAULT NULL,
  `reCaptcha_status_login` tinyint(1) NOT NULL DEFAULT 0,
  `reCaptcha_status_registration` tinyint(1) NOT NULL DEFAULT 0,
  `MEASUREMENT_ID` varchar(255) DEFAULT NULL,
  `analytic_status` tinyint(1) NOT NULL,
  `sandbox_gateways` text DEFAULT NULL COMMENT 'test gateways for sandbox',
  `error_log` tinyint(1) NOT NULL DEFAULT 0,
  `is_active_cron_notification` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `basic_controls`
--

INSERT INTO `basic_controls` (`id`, `currency_layer_access_key`, `currency_layer_auto_update`, `currency_layer_auto_update_at`, `coin_market_cap_app_key`, `coin_market_cap_auto_update`, `coin_market_cap_auto_update_at`, `site_title`, `primaryColor`, `secondaryColor`, `time_zone`, `base_currency`, `base_currency_code`, `currency_symbol`, `fraction_number`, `paginate`, `meta_keywords`, `meta_description`, `social_title`, `social_description`, `sender_email`, `sender_email_name`, `email_description`, `push_notification`, `email_notification`, `email_verification`, `sms_notification`, `sms_verification`, `allowUser`, `joining_bonus`, `deposit_commission`, `signup_bonus_status`, `transfer`, `request`, `exchange`, `redeem`, `escrow`, `voucher`, `invoice`, `invoice_charge`, `store`, `qr_payment`, `virtual_card`, `v_card_multiple`, `v_card_charge`, `deposit`, `payout`, `force_ssl`, `bill_payment`, `tawk_id`, `tawk_status`, `fb_messenger_status`, `fb_app_id`, `fb_page_id`, `reCaptcha_status_login`, `reCaptcha_status_registration`, `MEASUREMENT_ID`, `analytic_status`, `sandbox_gateways`, `error_log`, `is_active_cron_notification`, `created_at`, `updated_at`) VALUES
(1, 'Currency_Layer_Access_Key', 0, 'everyMinute', 'YOUR_API_KEY', 0, 'everyMinute', 'Pay Secure', '#f05822', '#f0aa22', 'Africa/Abidjan', '1', 'USD', '$', '2', '15', 'Wallet, Payment Gateway, Paypal, Stripe, Skrill, Codecannyon, Envato,Pay Secure', 'Pay Secure is a complete payment gateway solution', 'Pay Secure', 'Pay Secure is a complete payment gateway solution', 'support@example.com', 'Pay Secure', '<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n<meta name=\"viewport\" content=\"width=device-width\">\r\n<style type=\"text/css\">\r\n    @media only screen and (min-width: 620px) {\r\n        * [lang=x-wrapper] h1 {\r\n        }\r\n\r\n        * [lang=x-wrapper] h1 {\r\n            font-size: 26px !important;\r\n            line-height: 34px !important\r\n        }\r\n\r\n        * [lang=x-wrapper] h2 {\r\n        }\r\n\r\n        * [lang=x-wrapper] h2 {\r\n            font-size: 20px !important;\r\n            line-height: 28px !important\r\n        }\r\n\r\n        * [lang=x-wrapper] h3 {\r\n        }\r\n\r\n        * [lang=x-layout__inner] p,\r\n        * [lang=x-layout__inner] ol,\r\n        * [lang=x-layout__inner] ul {\r\n        }\r\n\r\n        * div [lang=x-size-8] {\r\n            font-size: 8px !important;\r\n            line-height: 14px !important\r\n        }\r\n\r\n        * div [lang=x-size-9] {\r\n            font-size: 9px !important;\r\n            line-height: 16px !important\r\n        }\r\n\r\n        * div [lang=x-size-10] {\r\n            font-size: 10px !important;\r\n            line-height: 18px !important\r\n        }\r\n\r\n        * div [lang=x-size-11] {\r\n            font-size: 11px !important;\r\n            line-height: 19px !important\r\n        }\r\n\r\n        * div [lang=x-size-12] {\r\n            font-size: 12px !important;\r\n            line-height: 19px !important\r\n        }\r\n\r\n        * div [lang=x-size-13] {\r\n            font-size: 13px !important;\r\n            line-height: 21px !important\r\n        }\r\n\r\n        * div [lang=x-size-14] {\r\n            font-size: 14px !important;\r\n            line-height: 21px !important\r\n        }\r\n\r\n        * div [lang=x-size-15] {\r\n            font-size: 15px !important;\r\n            line-height: 23px !important\r\n        }\r\n\r\n        * div [lang=x-size-16] {\r\n            font-size: 16px !important;\r\n            line-height: 24px !important\r\n        }\r\n\r\n        * div [lang=x-size-17] {\r\n            font-size: 17px !important;\r\n            line-height: 26px !important\r\n        }\r\n\r\n        * div [lang=x-size-18] {\r\n            font-size: 18px !important;\r\n            line-height: 26px !important\r\n        }\r\n\r\n        * div [lang=x-size-18] {\r\n            font-size: 18px !important;\r\n            line-height: 26px !important\r\n        }\r\n\r\n        * div [lang=x-size-20] {\r\n            font-size: 20px !important;\r\n            line-height: 28px !important\r\n        }\r\n\r\n        * div [lang=x-size-22] {\r\n            font-size: 22px !important;\r\n            line-height: 31px !important\r\n        }\r\n\r\n        * div [lang=x-size-24] {\r\n            font-size: 24px !important;\r\n            line-height: 32px !important\r\n        }\r\n\r\n        * div [lang=x-size-26] {\r\n            font-size: 26px !important;\r\n            line-height: 34px !important\r\n        }\r\n\r\n        * div [lang=x-size-28] {\r\n            font-size: 28px !important;\r\n            line-height: 36px !important\r\n        }\r\n\r\n        * div [lang=x-size-30] {\r\n            font-size: 30px !important;\r\n            line-height: 38px !important\r\n        }\r\n\r\n        * div [lang=x-size-32] {\r\n            font-size: 32px !important;\r\n            line-height: 40px !important\r\n        }\r\n\r\n        * div [lang=x-size-34] {\r\n            font-size: 34px !important;\r\n            line-height: 43px !important\r\n        }\r\n\r\n        * div [lang=x-size-36] {\r\n            font-size: 36px !important;\r\n            line-height: 43px !important\r\n        }\r\n\r\n        * div [lang=x-size-40] {\r\n            font-size: 40px !important;\r\n            line-height: 47px !important\r\n        }\r\n\r\n        * div [lang=x-size-44] {\r\n            font-size: 44px !important;\r\n            line-height: 50px !important\r\n        }\r\n\r\n        * div [lang=x-size-48] {\r\n            font-size: 48px !important;\r\n            line-height: 54px !important\r\n        }\r\n\r\n        * div [lang=x-size-56] {\r\n            font-size: 56px !important;\r\n            line-height: 60px !important\r\n        }\r\n\r\n        * div [lang=x-size-64] {\r\n            font-size: 64px !important;\r\n            line-height: 63px !important\r\n        }\r\n    }\r\n</style>\r\n<style type=\"text/css\">\r\n    body {\r\n        margin: 0;\r\n        padding: 0;\r\n    }\r\n\r\n    table {\r\n        border-collapse: collapse;\r\n        table-layout: fixed;\r\n    }\r\n\r\n    * {\r\n        line-height: inherit;\r\n    }\r\n\r\n    [x-apple-data-detectors],\r\n    [href^=\"tel\"],\r\n    [href^=\"sms\"] {\r\n        color: inherit !important;\r\n        text-decoration: none !important;\r\n    }\r\n\r\n    .wrapper .footer__share-button a:hover,\r\n    .wrapper .footer__share-button a:focus {\r\n        color: #ffffff !important;\r\n    }\r\n\r\n    .btn a:hover,\r\n    .btn a:focus,\r\n    .footer__share-button a:hover,\r\n    .footer__share-button a:focus,\r\n    .email-footer__links a:hover,\r\n    .email-footer__links a:focus {\r\n        opacity: 0.8;\r\n    }\r\n\r\n    .preheader,\r\n    .header,\r\n    .layout,\r\n    .column {\r\n        transition: width 0.25s ease-in-out, max-width 0.25s ease-in-out;\r\n    }\r\n\r\n    .layout,\r\n    .header {\r\n        max-width: 400px !important;\r\n        -fallback-width: 95% !important;\r\n        width: calc(100% - 20px) !important;\r\n    }\r\n\r\n    div.preheader {\r\n        max-width: 360px !important;\r\n        -fallback-width: 90% !important;\r\n        width: calc(100% - 60px) !important;\r\n    }\r\n\r\n    .snippet,\r\n    .webversion {\r\n        Float: none !important;\r\n    }\r\n\r\n    .column {\r\n        max-width: 400px !important;\r\n        width: 100% !important;\r\n    }\r\n\r\n    .fixed-width.has-border {\r\n        max-width: 402px !important;\r\n    }\r\n\r\n    .fixed-width.has-border .layout__inner {\r\n        box-sizing: border-box;\r\n    }\r\n\r\n    .snippet,\r\n    .webversion {\r\n        width: 50% !important;\r\n    }\r\n\r\n    .ie .btn {\r\n        width: 100%;\r\n    }\r\n\r\n    .ie .column,\r\n    [owa] .column,\r\n    .ie .gutter,\r\n    [owa] .gutter {\r\n        display: table-cell;\r\n        float: none !important;\r\n        vertical-align: top;\r\n    }\r\n\r\n    .ie div.preheader,\r\n    [owa] div.preheader,\r\n    .ie .email-footer,\r\n    [owa] .email-footer {\r\n        max-width: 560px !important;\r\n        width: 560px !important;\r\n    }\r\n\r\n    .ie .snippet,\r\n    [owa] .snippet,\r\n    .ie .webversion,\r\n    [owa] .webversion {\r\n        width: 280px !important;\r\n    }\r\n\r\n    .ie .header,\r\n    [owa] .header,\r\n    .ie .layout,\r\n    [owa] .layout,\r\n    .ie .one-col .column,\r\n    [owa] .one-col .column {\r\n        max-width: 600px !important;\r\n        width: 600px !important;\r\n    }\r\n\r\n    .ie .fixed-width.has-border,\r\n    [owa] .fixed-width.has-border,\r\n    .ie .has-gutter.has-border,\r\n    [owa] .has-gutter.has-border {\r\n        max-width: 602px !important;\r\n        width: 602px !important;\r\n    }\r\n\r\n    .ie .two-col .column,\r\n    [owa] .two-col .column {\r\n        width: 300px !important;\r\n    }\r\n\r\n    .ie .three-col .column,\r\n    [owa] .three-col .column,\r\n    .ie .narrow,\r\n    [owa] .narrow {\r\n        width: 200px !important;\r\n    }\r\n\r\n    .ie .wide,\r\n    [owa] .wide {\r\n        width: 400px !important;\r\n    }\r\n\r\n    .ie .two-col.has-gutter .column,\r\n    [owa] .two-col.x_has-gutter .column {\r\n        width: 290px !important;\r\n    }\r\n\r\n    .ie .three-col.has-gutter .column,\r\n    [owa] .three-col.x_has-gutter .column,\r\n    .ie .has-gutter .narrow,\r\n    [owa] .has-gutter .narrow {\r\n        width: 188px !important;\r\n    }\r\n\r\n    .ie .has-gutter .wide,\r\n    [owa] .has-gutter .wide {\r\n        width: 394px !important;\r\n    }\r\n\r\n    .ie .two-col.has-gutter.has-border .column,\r\n    [owa] .two-col.x_has-gutter.x_has-border .column {\r\n        width: 292px !important;\r\n    }\r\n\r\n    .ie .three-col.has-gutter.has-border .column,\r\n    [owa] .three-col.x_has-gutter.x_has-border .column,\r\n    .ie .has-gutter.has-border .narrow,\r\n    [owa] .has-gutter.x_has-border .narrow {\r\n        width: 190px !important;\r\n    }\r\n\r\n    .ie .has-gutter.has-border .wide,\r\n    [owa] .has-gutter.x_has-border .wide {\r\n        width: 396px !important;\r\n    }\r\n\r\n    .ie .fixed-width .layout__inner {\r\n        border-left: 0 none white !important;\r\n        border-right: 0 none white !important;\r\n    }\r\n\r\n    .ie .layout__edges {\r\n        display: none;\r\n    }\r\n\r\n    .mso .layout__edges {\r\n        font-size: 0;\r\n    }\r\n\r\n    .layout-fixed-width,\r\n    .mso .layout-full-width {\r\n        background-color: #ffffff;\r\n    }\r\n\r\n    @media only screen and (min-width: 620px) {\r\n\r\n        .column,\r\n        .gutter {\r\n            display: table-cell;\r\n            Float: none !important;\r\n            vertical-align: top;\r\n        }\r\n\r\n        div.preheader,\r\n        .email-footer {\r\n            max-width: 560px !important;\r\n            width: 560px !important;\r\n        }\r\n\r\n        .snippet,\r\n        .webversion {\r\n            width: 280px !important;\r\n        }\r\n\r\n        .header,\r\n        .layout,\r\n        .one-col .column {\r\n            max-width: 600px !important;\r\n            width: 600px !important;\r\n        }\r\n\r\n        .fixed-width.has-border,\r\n        .fixed-width.ecxhas-border,\r\n        .has-gutter.has-border,\r\n        .has-gutter.ecxhas-border {\r\n            max-width: 602px !important;\r\n            width: 602px !important;\r\n        }\r\n\r\n        .two-col .column {\r\n            width: 300px !important;\r\n        }\r\n\r\n        .three-col .column,\r\n        .column.narrow {\r\n            width: 200px !important;\r\n        }\r\n\r\n        .column.wide {\r\n            width: 400px !important;\r\n        }\r\n\r\n        .two-col.has-gutter .column,\r\n        .two-col.ecxhas-gutter .column {\r\n            width: 290px !important;\r\n        }\r\n\r\n        .three-col.has-gutter .column,\r\n        .three-col.ecxhas-gutter .column,\r\n        .has-gutter .narrow {\r\n            width: 188px !important;\r\n        }\r\n\r\n        .has-gutter .wide {\r\n            width: 394px !important;\r\n        }\r\n\r\n        .two-col.has-gutter.has-border .column,\r\n        .two-col.ecxhas-gutter.ecxhas-border .column {\r\n            width: 292px !important;\r\n        }\r\n\r\n        .three-col.has-gutter.has-border .column,\r\n        .three-col.ecxhas-gutter.ecxhas-border .column,\r\n        .has-gutter.has-border .narrow,\r\n        .has-gutter.ecxhas-border .narrow {\r\n            width: 190px !important;\r\n        }\r\n\r\n        .has-gutter.has-border .wide,\r\n        .has-gutter.ecxhas-border .wide {\r\n            width: 396px !important;\r\n        }\r\n    }\r\n\r\n    @media only screen and (-webkit-min-device-pixel-ratio: 2), only screen and (min--moz-device-pixel-ratio: 2), only screen and (-o-min-device-pixel-ratio: 2/1), only screen and (min-device-pixel-ratio: 2), only screen and (min-resolution: 192dpi), only screen and (min-resolution: 2dppx) {\r\n        .fblike {\r\n            background-image: url(https://i3.createsend1.com/static/eb/customise/13-the-blueprint-3/images/fblike@2x.png) !important;\r\n        }\r\n\r\n        .tweet {\r\n            background-image: url(https://i4.createsend1.com/static/eb/customise/13-the-blueprint-3/images/tweet@2x.png) !important;\r\n        }\r\n\r\n        .linkedinshare {\r\n            background-image: url(https://i6.createsend1.com/static/eb/customise/13-the-blueprint-3/images/lishare@2x.png) !important;\r\n        }\r\n\r\n        .forwardtoafriend {\r\n            background-image: url(https://i5.createsend1.com/static/eb/customise/13-the-blueprint-3/images/forward@2x.png) !important;\r\n        }\r\n    }\r\n\r\n    @media (max-width: 321px) {\r\n        .fixed-width.has-border .layout__inner {\r\n            border-width: 1px 0 !important;\r\n        }\r\n\r\n        .layout,\r\n        .column {\r\n            min-width: 320px !important;\r\n            width: 320px !important;\r\n        }\r\n\r\n        .border {\r\n            display: none;\r\n        }\r\n    }\r\n\r\n    .mso div {\r\n        border: 0 none white !important;\r\n    }\r\n\r\n    .mso .w560 .divider {\r\n        margin-left: 260px !important;\r\n        margin-right: 260px !important;\r\n    }\r\n\r\n    .mso .w360 .divider {\r\n        margin-left: 160px !important;\r\n        margin-right: 160px !important;\r\n    }\r\n\r\n    .mso .w260 .divider {\r\n        margin-left: 110px !important;\r\n        margin-right: 110px !important;\r\n    }\r\n\r\n    .mso .w160 .divider {\r\n        margin-left: 60px !important;\r\n        margin-right: 60px !important;\r\n    }\r\n\r\n    .mso .w354 .divider {\r\n        margin-left: 157px !important;\r\n        margin-right: 157px !important;\r\n    }\r\n\r\n    .mso .w250 .divider {\r\n        margin-left: 105px !important;\r\n        margin-right: 105px !important;\r\n    }\r\n\r\n    .mso .w148 .divider {\r\n        margin-left: 54px !important;\r\n        margin-right: 54px !important;\r\n    }\r\n\r\n    .mso .font-avenir,\r\n    .mso .font-cabin,\r\n    .mso .font-open-sans,\r\n    .mso .font-ubuntu {\r\n        font-family: sans-serif !important;\r\n    }\r\n\r\n    .mso .font-bitter,\r\n    .mso .font-merriweather,\r\n    .mso .font-pt-serif {\r\n        font-family: Georgia, serif !important;\r\n    }\r\n\r\n    .mso .font-lato,\r\n    .mso .font-roboto {\r\n        font-family: Tahoma, sans-serif !important;\r\n    }\r\n\r\n    .mso .font-pt-sans {\r\n        font-family: \"Trebuchet MS\", sans-serif !important;\r\n    }\r\n\r\n    .mso .footer__share-button p {\r\n        margin: 0;\r\n    }\r\n\r\n    @media only screen and (min-width: 620px) {\r\n        .wrapper .size-8 {\r\n            font-size: 8px !important;\r\n            line-height: 14px !important;\r\n        }\r\n\r\n        .wrapper .size-9 {\r\n            font-size: 9px !important;\r\n            line-height: 16px !important;\r\n        }\r\n\r\n        .wrapper .size-10 {\r\n            font-size: 10px !important;\r\n            line-height: 18px !important;\r\n        }\r\n\r\n        .wrapper .size-11 {\r\n            font-size: 11px !important;\r\n            line-height: 19px !important;\r\n        }\r\n\r\n        .wrapper .size-12 {\r\n            font-size: 12px !important;\r\n            line-height: 19px !important;\r\n        }\r\n\r\n        .wrapper .size-13 {\r\n            font-size: 13px !important;\r\n            line-height: 21px !important;\r\n        }\r\n\r\n        .wrapper .size-14 {\r\n            font-size: 14px !important;\r\n            line-height: 21px !important;\r\n        }\r\n\r\n        .wrapper .size-15 {\r\n            font-size: 15px !important;\r\n            line-height: 23px !important;\r\n        }\r\n\r\n        .wrapper .size-16 {\r\n            font-size: 16px !important;\r\n            line-height: 24px !important;\r\n        }\r\n\r\n        .wrapper .size-17 {\r\n            font-size: 17px !important;\r\n            line-height: 26px !important;\r\n        }\r\n\r\n        .wrapper .size-18 {\r\n            font-size: 18px !important;\r\n            line-height: 26px !important;\r\n        }\r\n\r\n        .wrapper .size-20 {\r\n            font-size: 20px !important;\r\n            line-height: 28px !important;\r\n        }\r\n\r\n        .wrapper .size-22 {\r\n            font-size: 22px !important;\r\n            line-height: 31px !important;\r\n        }\r\n\r\n        .wrapper .size-24 {\r\n            font-size: 24px !important;\r\n            line-height: 32px !important;\r\n        }\r\n\r\n        .wrapper .size-26 {\r\n            font-size: 26px !important;\r\n            line-height: 34px !important;\r\n        }\r\n\r\n        .wrapper .size-28 {\r\n            font-size: 28px !important;\r\n            line-height: 36px !important;\r\n        }\r\n\r\n        .wrapper .size-30 {\r\n            font-size: 30px !important;\r\n            line-height: 38px !important;\r\n        }\r\n\r\n        .wrapper .size-32 {\r\n            font-size: 32px !important;\r\n            line-height: 40px !important;\r\n        }\r\n\r\n        .wrapper .size-34 {\r\n            font-size: 34px !important;\r\n            line-height: 43px !important;\r\n        }\r\n\r\n        .wrapper .size-36 {\r\n            font-size: 36px !important;\r\n            line-height: 43px !important;\r\n        }\r\n\r\n        .wrapper .size-40 {\r\n            font-size: 40px !important;\r\n            line-height: 47px !important;\r\n        }\r\n\r\n        .wrapper .size-44 {\r\n            font-size: 44px !important;\r\n            line-height: 50px !important;\r\n        }\r\n\r\n        .wrapper .size-48 {\r\n            font-size: 48px !important;\r\n            line-height: 54px !important;\r\n        }\r\n\r\n        .wrapper .size-56 {\r\n            font-size: 56px !important;\r\n            line-height: 60px !important;\r\n        }\r\n\r\n        .wrapper .size-64 {\r\n            font-size: 64px !important;\r\n            line-height: 63px !important;\r\n        }\r\n    }\r\n\r\n    .mso .size-8,\r\n    .ie .size-8 {\r\n        font-size: 8px !important;\r\n        line-height: 14px !important;\r\n    }\r\n\r\n    .mso .size-9,\r\n    .ie .size-9 {\r\n        font-size: 9px !important;\r\n        line-height: 16px !important;\r\n    }\r\n\r\n    .mso .size-10,\r\n    .ie .size-10 {\r\n        font-size: 10px !important;\r\n        line-height: 18px !important;\r\n    }\r\n\r\n    .mso .size-11,\r\n    .ie .size-11 {\r\n        font-size: 11px !important;\r\n        line-height: 19px !important;\r\n    }\r\n\r\n    .mso .size-12,\r\n    .ie .size-12 {\r\n        font-size: 12px !important;\r\n        line-height: 19px !important;\r\n    }\r\n\r\n    .mso .size-13,\r\n    .ie .size-13 {\r\n        font-size: 13px !important;\r\n        line-height: 21px !important;\r\n    }\r\n\r\n    .mso .size-14,\r\n    .ie .size-14 {\r\n        font-size: 14px !important;\r\n        line-height: 21px !important;\r\n    }\r\n\r\n    .mso .size-15,\r\n    .ie .size-15 {\r\n        font-size: 15px !important;\r\n        line-height: 23px !important;\r\n    }\r\n\r\n    .mso .size-16,\r\n    .ie .size-16 {\r\n        font-size: 16px !important;\r\n        line-height: 24px !important;\r\n    }\r\n\r\n    .mso .size-17,\r\n    .ie .size-17 {\r\n        font-size: 17px !important;\r\n        line-height: 26px !important;\r\n    }\r\n\r\n    .mso .size-18,\r\n    .ie .size-18 {\r\n        font-size: 18px !important;\r\n        line-height: 26px !important;\r\n    }\r\n\r\n    .mso .size-20,\r\n    .ie .size-20 {\r\n        font-size: 20px !important;\r\n        line-height: 28px !important;\r\n    }\r\n\r\n    .mso .size-22,\r\n    .ie .size-22 {\r\n        font-size: 22px !important;\r\n        line-height: 31px !important;\r\n    }\r\n\r\n    .mso .size-24,\r\n    .ie .size-24 {\r\n        font-size: 24px !important;\r\n        line-height: 32px !important;\r\n    }\r\n\r\n    .mso .size-26,\r\n    .ie .size-26 {\r\n        font-size: 26px !important;\r\n        line-height: 34px !important;\r\n    }\r\n\r\n    .mso .size-28,\r\n    .ie .size-28 {\r\n        font-size: 28px !important;\r\n        line-height: 36px !important;\r\n    }\r\n\r\n    .mso .size-30,\r\n    .ie .size-30 {\r\n        font-size: 30px !important;\r\n        line-height: 38px !important;\r\n    }\r\n\r\n    .mso .size-32,\r\n    .ie .size-32 {\r\n        font-size: 32px !important;\r\n        line-height: 40px !important;\r\n    }\r\n\r\n    .mso .size-34,\r\n    .ie .size-34 {\r\n        font-size: 34px !important;\r\n        line-height: 43px !important;\r\n    }\r\n\r\n    .mso .size-36,\r\n    .ie .size-36 {\r\n        font-size: 36px !important;\r\n        line-height: 43px !important;\r\n    }\r\n\r\n    .mso .size-40,\r\n    .ie .size-40 {\r\n        font-size: 40px !important;\r\n        line-height: 47px !important;\r\n    }\r\n\r\n    .mso .size-44,\r\n    .ie .size-44 {\r\n        font-size: 44px !important;\r\n        line-height: 50px !important;\r\n    }\r\n\r\n    .mso .size-48,\r\n    .ie .size-48 {\r\n        font-size: 48px !important;\r\n        line-height: 54px !important;\r\n    }\r\n\r\n    .mso .size-56,\r\n    .ie .size-56 {\r\n        font-size: 56px !important;\r\n        line-height: 60px !important;\r\n    }\r\n\r\n    .mso .size-64,\r\n    .ie .size-64 {\r\n        font-size: 64px !important;\r\n        line-height: 63px !important;\r\n    }\r\n\r\n    .footer__share-button p {\r\n        margin: 0;\r\n    }\r\n</style>\r\n\r\n<title></title>\r\n<!--[if !mso]><!-->\r\n<style type=\"text/css\">\r\n    @import url(https://fonts.googleapis.com/css?family=Bitter:400,700,400italic|Cabin:400,700,400italic,700italic|Open+Sans:400italic,700italic,700,400);\r\n</style>\r\n<link href=\"https://fonts.googleapis.com/css?family=Bitter:400,700,400italic|Cabin:400,700,400italic,700italic|Open+Sans:400italic,700italic,700,400\" rel=\"stylesheet\" type=\"text/css\">\r\n<!--<![endif]-->\r\n<style type=\"text/css\">\r\n    body {\r\n        background-color: #f5f7fa\r\n    }\r\n\r\n    .mso h1 {\r\n    }\r\n\r\n    .mso h1 {\r\n        font-family: sans-serif !important\r\n    }\r\n\r\n    .mso h2 {\r\n    }\r\n\r\n    .mso h3 {\r\n    }\r\n\r\n    .mso .column,\r\n    .mso .column__background td {\r\n    }\r\n\r\n    .mso .column,\r\n    .mso .column__background td {\r\n        font-family: sans-serif !important\r\n    }\r\n\r\n    .mso .btn a {\r\n    }\r\n\r\n    .mso .btn a {\r\n        font-family: sans-serif !important\r\n    }\r\n\r\n    .mso .webversion,\r\n    .mso .snippet,\r\n    .mso .layout-email-footer td,\r\n    .mso .footer__share-button p {\r\n    }\r\n\r\n    .mso .webversion,\r\n    .mso .snippet,\r\n    .mso .layout-email-footer td,\r\n    .mso .footer__share-button p {\r\n        font-family: sans-serif !important\r\n    }\r\n\r\n    .mso .logo {\r\n    }\r\n\r\n    .mso .logo {\r\n        font-family: Tahoma, sans-serif !important\r\n    }\r\n\r\n    .logo a:hover,\r\n    .logo a:focus {\r\n        color: #859bb1 !important\r\n    }\r\n\r\n    .mso .layout-has-border {\r\n        border-top: 1px solid #b1c1d8;\r\n        border-bottom: 1px solid #b1c1d8\r\n    }\r\n\r\n    .mso .layout-has-bottom-border {\r\n        border-bottom: 1px solid #b1c1d8\r\n    }\r\n\r\n    .mso .border,\r\n    .ie .border {\r\n        background-color: #b1c1d8\r\n    }\r\n\r\n    @media only screen and (min-width: 620px) {\r\n        .wrapper h1 {\r\n        }\r\n\r\n        .wrapper h1 {\r\n            font-size: 26px !important;\r\n            line-height: 34px !important\r\n        }\r\n\r\n        .wrapper h2 {\r\n        }\r\n\r\n        .wrapper h2 {\r\n            font-size: 20px !important;\r\n            line-height: 28px !important\r\n        }\r\n\r\n        .wrapper h3 {\r\n        }\r\n\r\n        .column p,\r\n        .column ol,\r\n        .column ul {\r\n        }\r\n    }\r\n\r\n    .mso h1,\r\n    .ie h1 {\r\n    }\r\n\r\n    .mso h1,\r\n    .ie h1 {\r\n        font-size: 26px !important;\r\n        line-height: 34px !important\r\n    }\r\n\r\n    .mso h2,\r\n    .ie h2 {\r\n    }\r\n\r\n    .mso h2,\r\n    .ie h2 {\r\n        font-size: 20px !important;\r\n        line-height: 28px !important\r\n    }\r\n\r\n    .mso h3,\r\n    .ie h3 {\r\n    }\r\n\r\n    .mso .layout__inner p,\r\n    .ie .layout__inner p,\r\n    .mso .layout__inner ol,\r\n    .ie .layout__inner ol,\r\n    .mso .layout__inner ul,\r\n    .ie .layout__inner ul {\r\n    }\r\n</style>\r\n<meta name=\"robots\" content=\"noindex,nofollow\">\r\n\r\n<meta property=\"og:title\" content=\"Just One More Step\">\r\n\r\n<link href=\"https://css.createsend1.com/css/social.min.css?h=0ED47CE120160920\" media=\"screen,projection\" rel=\"stylesheet\" type=\"text/css\">\r\n\r\n\r\n<div class=\"wrapper\" style=\"min-width: 320px;background-color: #f5f7fa;\" lang=\"x-wrapper\">\r\n    <div class=\"preheader\" style=\"margin: 0 auto;max-width: 560px;min-width: 280px; width: 280px;\">\r\n        <div style=\"border-collapse: collapse;display: table;width: 100%;\">\r\n            <div class=\"snippet\" style=\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 140px; width: 140px;padding: 10px 0 5px 0;color: #b9b9b9;\">\r\n            </div>\r\n            <div class=\"webversion\" style=\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 139px; width: 139px;padding: 10px 0 5px 0;text-align: right;color: #b9b9b9;\">\r\n            </div>\r\n        </div>\r\n\r\n        <div class=\"layout one-col fixed-width\" style=\"margin: 0 auto;max-width: 600px;min-width: 320px; width: 320px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;\">\r\n            <div class=\"layout__inner\" style=\"border-collapse: collapse;display: table;width: 100%;background-color: #c4e5dc;\" lang=\"x-layout__inner\">\r\n                <div class=\"column\" style=\"text-align: left;color: #60666d;font-size: 14px;line-height: 21px;max-width:600px;min-width:320px;\">\r\n                    <div style=\"margin-left: 20px;margin-right: 20px;margin-top: 24px;margin-bottom: 24px;\">\r\n                        <h1 style=\"margin-top: 0;margin-bottom: 0;font-style: normal;font-weight: normal;color: #44a8c7;font-size: 36px;line-height: 43px;font-family: bitter,georgia,serif;text-align: center;\">\r\n                            <img style=\"width: 200px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAAAwCAYAAABUmTXqAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAABmJLR0QA/wD/AP+gvaeTAAAAB3RJTUUH5gsOBCMe2Gn2wwAAAAFvck5UAc+id5oAACxkSURBVHja7X15eFRFuv5b53T36SXd2fcQCPsSBGUVFUXBBXdFxnXcddwV0FHn+rvOjHecGXdFx33XGUVccEdBEAERlN0ohCRkTyfp/fTZq35/VHfohIQ06FznzvA+Tx6SQ1WdOnXqq2//DgEA/YqjAUAAIKI7CAATAAUAx7MrkdKeALBhb7BEH6T26YnEGEnY0TuM5Bg92tsS9+8JEwDr654HcRD7CwJ0bdYTAcwH3+BJCAAaAPw3gPoefQcDeBCAJ6UPARAHcB+Ar5INe27YHpt9DoArEvdKvW8jgJsBhHrc9zAAdwLI7DFXA8DtALYeJJCD+LmQygHKAMzso91AAFcBqE655gMwC4C7l/ZjAVwN4DOAE0QP7pPEJQAeAJDTyxh1ABw9rh0O4FkAo3tpTwH89RddzYP4t0PqqU330W4GgFcAVKZc6yZK9UAFgBcBnJ68oF9xdCpxCACuA/AoeicO9DL2cYk5jN5He4aDOIifEcJ+tJ0K4FUAE9NsXwLgGQDn97huA7AAXAzzpjnWqeAEN+SXWqiD+M9EKoGQNNqPAyeSaeAcp78++QAeB3Bl4m8JwP8D8EcArn76EnCOcA64WFWWxvzSeYaDOIi0kaqDxME3ZH+bbAS4qPNnADL65wJZAB4CV6qLwBVvEf0jCmAuODFlp9FeB6D+by7eQfz7I5VAPgTXCW5A/6LXYHDd4Q4AD4Nv/n3BA+BP6N2U3BvqE2PPQXrEEQdwN4CN/5uL96+Oq6/+C9xuJ8LhGASBwOVyglKKxx9f8EtP7f8MUgkkAm4mjQG4DX37JpLQwfUCDcAj4OLUvtDfeEnsBBfJVgI4M432YQC/BfA0DkBJd7uPSasdYwx2uw0jRw7CN988h+nTr8GXX/5tf2/3T0dR0cnIy8tEW1sAr7zyMeLxEObNuzSHMWZ76KGb/ZmZM+F2H4MhQ0px+OFj0dkZxuLF9/7S0/6XhQ3o5ohTAfweXHT6fwCc++ibFMX+Dn6CPwGumP8UbAUnjnU97tEXOgHcAi7yIfksB4CJAC5AHwRGCFBYmMMkyfEVpfQ7ALsJIZg27SqsWfP0T3zknw95eSdCVXWMHz9cWLVq86EOh+MMQohvyZJVh9tsYkZm5swVoihoZWUlO02TrozH1R9VVTd/+p3/fdFtA/Zihv0TgIw++s4HdxQmMQvAU+Am3gPBN+DEsSXl2tPYo+D3REtiju8kLxwIcSQ4yCUAXthXO0EQAMBwu6X64uK8ZysqSh72+4Pqrl2NaGv76AAf+efDlCmXQ9MMtLUFihhjv5dl9UzGaD6lDIxxuieEdP3k5vo2Dhs24LhYTAl+/fWzv/T0/2VhA/Zy3gHcQvUYuPhyP7j4lHq6Eux92n4G4Dxw0+5Y7J+4sxzcEVnT4zrr8W/y3jsBXANgWWrj5HMcAKHs5QMihIAx1vUvpRQA7LGYMqS+vvWeQCDSnJHhenn06EFoa+N9fL7jAACWRbs2JcCJS5K4hNnZ+SkAQJKmw+NxQtOMbm2TiMdXYPLky+B0OrBrVxOCwWjXvCTJBsaAYPAzAMDll/8Pqqrq4PN5yhob/U8qinZyT6IAuJiY/AHw49y5x8krVmxEcfHt2LRpB1pbO7va9gWfz4Oysnwoiobt2/8OADjmmGvh8TixfXstolEZxx8/FaIoYMuWajQ2tmPatLHYvr0GmZkZaGz0Q5ZVEAJIkgO5uT4QQrBz56JexV2324ncXB903URbW2Cfc2OMobg4D6NGDQIhBB98cH/KOMfgQJCqg5QDOBTdN2MEnEvUgjviUlevDjw8JdXbTcFP4mCib3/KvgWgMDHuKOxxRBJwK9aLAD5PmRMFV/gLwT34p/W491pwsesnQRQFbdCg4iVtbYH3MjMzjuroCB1pGOYYSvk0NM0QKZWvz8nxfhIOy/6uh7EoZLmZeDzFnsSzJ62CrLOzXi4qGtxFiIQQxOOqixDBTghvZ5qWceedv1a2b6/FokUrIMsK/P5O2GyiB9y4wRhjhDFojDEtdazVq58WKivPn69p+skpBBfIysr4Kj8/uzoSkQdHIvIIVdUGMwYpHle33nXX0/r48cPhdDoExuBOmXNfIIJALEmyxy3LYgBw8cX3YO3aLdixYxfGjBnuiURkG8AOYYx5GGMb7HZRGzCgQJdlRQsEIiL2RF4QxhizLBonBFbyBozBQQicybWjlFmmSeOWRZPzcib2XG/zJC6XxD788IHo4MFnIS/vBAiCAL//4+T/29C/eyEJBYCZSiAzATyH7qcpARAAV9578uGxAP4BHnKSGoulA3gy0ac/s2sBuJ/kTHQnPgGcSxwOvum79i54XNj8xIOmLpIO4AQAX6a5AH3CsmjA7w/e5vcH6vz+j18bOfJXQ1pbA6/qujE1pc24xsb2UYQQPwDMnj0Pa9duRU7OyHHBYGQhYywZo0YAaMOGVd7c3NzxdbK/YZgYM6bi8rq6lqtM0zIBiJJk3/z22yuvyc31yb/5zV+wZcsu5OT4yquqdj8DfihAEEiYEHITgE3JsVau3Ihx4y7y+f2hmZbVjRk+19i45LYEFyTHHXd9yebN1ROzs70LSkrytsbjKiTJDofDXiQI5MXE+9hXRIWoaUZ1W1vwMlXVwxdeeDe+/bYKmZme8aWlJae1tHTOVFXdt2LFdxWCIEjhsLxTEAhdvXrLphEjyq8Ph2NDCSFPAswBEAgCUSXJfjUhpEusJgS/AnAr+IEsiqJQ43Q6LhUEEko0uQHAr5EIZE0FIYS0tQWswsLZK+12+6elpUVLdV3DhAm3YOXKjQAwGdxS29/BTRP3WdtbNG7PzrngVqoscH+GldKOpPwkIQG4Cdz0Ox+cwHqLxaoA11lm9TFJgu4m4QwA/wPg+pQ59iSqnwssGo3D7XYhO/tU7N7dumvw4NKN9fWtU5MbkFKKeFzruv/QoWX46KPP4HINOhvAET0HtCx6NmPs66FD56C6+i0cccRYeDyuNe3twbtCIbmAEEAQhFEA3t+w4YdFy5c/DkIIDjvs4osMwzw+OY7DYX8jO9tXpSgagkF+raHBD4B1E6cAQBQFJwAUFs7G6NHnsdLS/KbOzvqm00674AtBEGLxuArGGJxOh8NmEw9Bggh7XRAGAAwej8s9eHCpDQCmTTvE/uOP9ddXVzdcZxjWkIQYilAoxl8OIZWUAm1tAf+cOTOMpqb2DEEghwGwMcYgiqLu8bg8gsDnbLfbIAikSNfNsUkuaLeLLq/XLSpKF8McgO4hT2CMG1IAIB5XQQgmKIp2sSiK85Ys+eurixd/QRMEkglgwj5f/J4jN3N/NpUbfHPehb0DCPvCJeCcpAjYKxZrFLjlaVaaY2WDE+mN+zHnnwUnnDAFhmHB53P3lM+77cfPP1+PCRMm5Oi6cSKl3bk/pRSdneHKIUPKPKLIaX7hwvn4+OOHvsvNzXzJZuOPZJqmva0tcE5l5RBx+vRrcOKJNw9rawtcbhjc0ORw2DtzcnyPGIappTJPl0tCRoYLNpvYbW0YY5dlZc16UBSFsUccMZZs3LgDY8YcimAwEmlubqehUBQejwsZGW7YbKLV49ED4P6oBgANbrek8bau7088caq8ZctO3HvvSyfs2tX4B00zuohDFAWDENIoCEKLzSYmF2nL4sUrVJfLSQRB6LqPzSZaXq8bPp+n6zk8HhdNEgwA2O02mpWVgYyMLsmoG4ez222B3FxfvdsttdhsIidjBhiGmWuzCQ/feuvCyd98833XkmDPAQ9BEJggkLbkMxJCmj0eJ/V4nHC7JeZ2S73mc/QFB4DfgesA/4V9s+IkzgEnrmsSkwC4nvMM+qHkBCwAeeAGg3P3Y64/GZRSJkkONDW1o67ubXHq1CtyLWvPHhJFIeL1uiOEEIwbdyXa2gIwDHOSrhujAIAQYni97mAsphRQSkEpmxKPq6N03dhwySV/xAsvfIhjj70edrvtmc7O8JxwWK5gDJBldUZdXcvklpbNa4cPP/yKSESuSLxM5Ob6Fj344I3rnnrqXXz44R4D4tChZRg7dnBs6dJvvg6FoqOTBEop8zBm3hKNKue+9daKd0VReCkjw/3tmjVbzTlzZqChwQ+PxwmPx8mSmysxdwgC+aNpWm8QQmyEAFOnjploWXRAPK6u/uijNerkyWPKv/nm+3sVRctInhJ2u22bz+f5azgcW5md7XVKkuMoRdFmUEoXiaIAp9MBMYWGRVFARoYLyUPD6XTA4bAjEol3bS+bzQafzwPWh2bEGPvTYYeNeC0QiGQ0Nvov8PuDdwCQEjqeb9u2mj6d2Ha7bX1WVsZlLS0dYUIIyc72OsaPH3aEqhoZpmlVEbJ3DkZ/sIGLTfeDi17pxD6dDOBlAEOxJ+AxHeIg4GLYc0iPOJIi30+G3W4TDz10eFY43ICRIweJEydeerIsK8enviSXS1o/fPjAraWlBWCMoaZmMWIx5STLsjyMAW631F5QkH0nIVzEZIxma5p+UkPDevh8Hjz00M049NDh+PTThTuzsrzPJzcJpTSPUnrNlCnHT+rsDF/ILWKAx+PcNWJE+ROPPrqIalp38VvTdKxdu83Mz8+6z+VyrkvldIwBlmUV67pxjaYZH+3YUf+s3W4b+vjjt5Li4lxIkh0TJoxo8fuDq5P9BIHA63X7nU5Hi8Nhb5DlFQ2zZk3+4pNPHn6UUvZtfX0bvv++boqiaJXJPoSQsCgK18ZiyiuMoV7TjB2yrDx36aWzL2lvD6wbNqwMbreUNJfzzWQTkZHh7uIOTqcj0YZ0zd1uF+HzeeDx9O6SM02rc/3671tbWzurDcNabLfb9NRn54cT7aOv2VRb+/Z2h8Pe6HJJDXV17+yePXvaexs2VD1hWVa9omjdOMgm8HyPoWls3OsBtIJ7u09JY88dA+BN8Lit/sZP4nNwMe20NNt/g73NxP0ieaKl+gsA5HV2Rl72+cqWvvTSRyWWZZ1oWTQr+Z8Oh93v8bj+smLFm/qNN96BNWu2YsKES4pqa5tnMQYIAiBJjjWDB5d+1t4e8odCsRxKGSils0866VePbNhQFQGA5uYOHHXUFbDbbS8Fg9FzIxF5DADE4+qpNTVNo1VVL0nM0QBw90cfrdnK2Nd7mWK3bHkVI0bMBWPsh7y8zAvb29n1pmldrutGNx8WpTRH0/SL7XZx+rRpV96oacYHRx55CG688WE9HI61pZqDYzHlfNO0KhljpKDgpJwXXvjwiOOOu/6u+vq2d3buXIGSkikFSdGPMYa8vCx17NghTbpuoKamCbt2LQZjDNOnX2NmZfngdrtgmla3zS+KIsnIcBGbjR8OkuSAy+VEDxELPp8Hus4PBULQk5vQcFhGKCTD43EWmqbVtadFUVDcbmcMAGIxpWuuKWMfk5NzwpOKogUNw8SQIWcPycnJzB4ypHSuLCvBjRtf7sY1NgC4CMC2NPdWHMDlAN5Ls/2hSI84GLhlaz7SD09ZDm7ZaEizfRfcbifcble3l2IYptjQ0HaIaVoLdN0437JoV86K1+sODRlS+teamsUrzj33N2hs9KOurhkdHeFppmkNB7hs6/E4P3j33RfqCcFqQSBgDNA0ozIeVyeJoohjj70Of//7H3DccZOwfPm6Bp/P87QocjHHsmiWLKsTki/T43GuGDiw6L1RowZhwIDTe32OH398E9FoHIqiV5911jHzy8sLz8nLy1zkcklhbsXa0zYWUyqqqnbPk2Ul6/33VyMUioKkUB2lDKZpnQzgDkLI7bGYctXOnQ3DNm3aGWhs9GP58o9txcV5J6cSamZmBhk7dgiprByMXbsWA+Ci2qpVT8Lv/xgulwSn0wFBELqUasMw/ZLk6HS7OXdIcpA982Ww223E63UTt5tzGYfD0fOAmALgDJtNuMg0rfsYY13Kis0mvl1amr8hN9cHl0uCy9Wdg6mqnq2q2tWE4HZCyO0dHeFzamubB7W0dIpNTe18jB7r/DWAC8FNuv3lfRAAfnBPt4y98z4OBCa43+VucDt0OiLTB+A6TuOB3NDtdoIQAlXVkGoiTX0JDofNYAx1TqdjeXFx7osvvXTX+ksvvQfBYASffvoIGGOkuPiU05Onl91uq8nO9n5ZUjIZRUW566PR+KWMMUFV9Ywff6wf1dravmzChJEAgKqqWkydOh4Oh+3v4XDswmg0Pil1fi6XpBYV5S5sbw9Fa2s/Qm+W8+OPvwkAPx1VVcf339daum588utfz16+bNmGKa2tHVdEIvHzFEXrOnAopUeqqj4DKZEI/cBSFE0VRRGqqhFRFLoZa+JxhdXVtUDvI3LFNC1YlpVwvvL17egIbXv55Y+qR40aCKAnB+EWcsZYKDvba0QiMgghcLkcMAwjleCvBXCNZVGSfH+EEMYYe90wzFt/+GG3VlSUA6/XDcYYDMPsU+QCgNzcTDp+/HBEozI+++zjPbFYQJcJdjM4kTwD4Kg0Fq4dPOQjDp5bfqDQwENb/gzu00gHb4Bbtvypz7E/cDhse5lH3W5nkDF2dzyu+kVRFEpL8+OUsnXnnHNc25Ilq+hbb32BnBwfXnzxLowf/2uMG3dRhaYZ05P9VVX3bNmy638A0FAolguucQqMMZimders2Uc8I0mS9u23wBtv3IPy8jMQDsfa8/OznlAU7ZlUMcHlkl4488yjl1ZXN6K29u1enyHBaeyMYbzX6962e3eLMnBgMVpbO3VdN1b9/vdXrrv//tdra2qa76SU2gHANC17Z2fYt/dYgNstITvb97fGxrYVgiCI2FO8oxoAZs8+whg+fO4KxthxAN/sfn9I+Pzz9YLT6cAhh1yILVtexZw5d8CyKKLROCKRWJJIuhZaEIg4ceIocvjhYxNcXOh6H3xcoKam+bObb74yvGDBn0AI4HRKiEaTmRldpkTCGO0iGqfTIQ8bNuC5QCDiN00LNTWLUVl5ARhjiERk6HqXWXgduF8kYf1ixONxRSoqiqOdnWEA6NOK9SO4yPIkuPOtP4TA8zxi4A6WdELaU5EMjnwEKWa4fYCBe+wXgHvtDzRIMRHCQdDDQqVUVJQs3rWrqUlRVFDKYBgWPv54DZxOB+6+m58DJ510C77+ejsyMz1HG4ZZnjJsEXjYzV6wLDqxsbF9LCHYkLxWX/8upk69AvG4+i5juBbAJABwOOxxQSAvvPHG52pl5eA+n2Hr1l0A4GGMPQFga1FR7pOjR1d899hjb5oOhx3z5z+m+3zurwiBhoTYKkl2q7y8SGaMobo6lfkyOBx2TJgw4kvG6JuNje3QtAg4jSgYMqQSBQVnIxqNbxFF0bQsTsyWZeXa7c55I0aU/3bZsi8iAPDWW1/gsstOccmy4rbZbJ2UMpVSpgJwMAa4XNIEy6KTXnrpo7XBYATxeAhjxozO0DSji0h03dAyMiYlDgECh6P7lnU6HUs9HtdmWVamqqp2VEKUzWhqar9m3Lhh37W2doYt6ww4nQ5QShMiVlfaU61lWa+Looh4PAZAx+7dNjzwwIsAOgAM7k4gPcrr1IEryU9hH4pySh8Z3HseBw+XT9eEHAPf6F3h6r2U+UkFA48c/m3ingdMHMAe5S0VqqqjoaHNbrOJiMW+QFVV730ppZgz5xjHe++tOplSKgBdMVw6sFd1GDsAGIaZY1n0xO3b126YNu1KrFnzDADg669XAsiV3W5ntKuTIMDtdhIAWLToT30+w6BBxRAEMraqqm6orpsT6+vbTn399U9XDBxYvLyx0b9FFIXBgUDkBkppl9IuiuK67GzviqQ3PWkZS4qb69dXjW1s9Nfn5WVmDRs25gRF0d2xWJzYbOLaW2+94IU///nlVfG4utayuqQMQZbVqzdt2lkxceLkuqysY4Wamma2ZMlXZV6va1tra+C3hYU52yIR+TtCyDEAoChaXnV1wwOyrN5js4lyZeXo45ubOy5JKv+CIMDn8zDDMPDAAzfC45mBWEzppmgrivY6pfSlkpL8I5ub25dompFNKUU4HJuzadOOdT5fxgOFhTno7AyDMS7qJYnP7XYe6nQ6zujsDAeOPHLCdELIoFgsTmU5l1I6+DFCyPb98YP8x8AwzC5vcF847bRbsXXrLuze3TZU180jk9d9Ps9nhmH+OR5XTQCEUmrm5mYeI8vqPbpugFKKlpaOQ88770KxpaWzi2253aXJX7tEEF3X0dq67wA9AKitbQaAQaZpZTHGoGl6nqbpc2Ix5WxRFPRoNG5njHVppxkZruiAAYWPdHZGOmbMOAzr1j2HrKxZzuTG1DQDra2dt9ls4vxwOCZs3LjDzhgX5QoLcwqamtpfsywazMryPhwKRccZhukDANO0iGlaJ/z4424QQkApBSEERUU5zVu2fIuSkqFxQRDeEAR6NKWMUMoQCsUOB/AuAFpX1yql6gd2u21rUVHOO4FABO3t/P6hUBQ9HLECpQyXXXbq2kce+cdiXY9ckRBlSSQi/5fP5/F/883GV7xenneXOr6iaCMURVtECLE2b94pJQNTE/T3LoDt3XwfPU7tQeDBgvs0s6b08YDrD79F+twD4CEkD4DndYi9zKMnCLhi9igS2Yb9tE8HPX1A9pSo1z7R3h6ELCuzTdMqBLoCEJfH4+py8JiwlSUl+asPPXT4IkEgzcl+lkWPWrNm6/Duok0XutaOUmbTdYMkTZx9QZZVxONqgBAip+pSlFLCGJOSxCGKInM6HV/m52dfcN55sxZXVBRBllXcdNNDZUVFuTN7PK8NgMQY7EkFO0Hc6//4xxdUShkqKyveycryXudySVWCQLrCPSyLwjStro0sSY513MLP4PE4X3W7XY9Jkj1Vz7QDkDhBcc6RmenZMWbMoHtcLml7cXFuyjOxnuK7YBgmXn/9U6u4OO9vLpfUkvL8Wc3NHbf6fDkllFJYFhUY2yP+J96xDYCUnLNlUdhsIgoLs1FUlNPnRh6B9JV0gMdp3YcDV9KTKbkZSE9JJwAuS/S7EYA/tfbWAWAXeOJXcuwAEuLbvnDjjXPtr776iUUpfQMAtdlEobg4b7um6V0KdU3NIaipqa1zuXzPEYLhACil1MrK8ua1tu4VeEwBfAqgOfG7Bi4M7xPl5QWQJMeyYDB6kiTZj21vD41UFM3Kzc0c4XDYstvaghskyR5xuaRPhgwpWxuNxlu++mozZFmF3R6FoqiaZVkfgx84+zoVBABbGWPQdQNtbUG2e/cHrw4adMrynBzfnFAoOjUWU2hGhrvANC1VVbWo1+vRCcEXU6aMRUODH3l5WbHKyiF3bNhQtaSzMzwrHlfLJcnusdtt7mg03paR4RYLCrK/EQRh0VdfPd3417++gttuuyh1DuvBfWpW4l1VA8DZZ8/AnXde/F1W1qzfIOFYLi7Oo4SQz6urG6MulwSANQF4DftwijPG4HJJ1tChZc2iKHarrJjEOKRn5k0mTOWD56X/M8y8+0qYSmIvM+/+EEp/eQLx+Iper5922q2glMHrdZEPP1zDKGWIxXYB2L3P8QVBQCy2HGeddTvJyfGxZ5+98yfNAwAqK8+H0+lAR0cYdXUfAtAxa9aNGDGiPJ8x5p4z59j6GTNmsby8yRg5ciAKCnKwbNl6hMOfY926H5Gbm4l58x7Cp5+u7RYK0t98Zs68ASNHDsRHH61FTc1WADtwyikLMGZMhUcUBXP9+irts88e3WvdAOCHH3Zjx45vcfTRx2P69PEO07Qc27bVxN5//34AFTjkkCNw++0XYc2arVi4cEG/a3TOOceitrYFVVW1kGUehKkoKwEMRUHBMKiqDtPs3/7D389u8DMTexHIVHDOUdnvSMA8cGp8GikF4n4GpCrhD4InUvWHZMLVLuCnKe3/Lrj66j8nYpwYXC4ndN3AY4/N/6ffd/787gTxwAM37rP9rbc+1u3v++674X99rfaFVAKZCC5mpBsK8l/gBJVOqAnAK47sT6jJU+Ac5bo0268BZ60NBwnkIH4upPLT8Ug/FGQhgNUA0tWOV4DXuLoIwPdp9pkJbiRYkmb7yeDliA7iIH42pFubNwkT3OK0ADy1NZ288w/BnY7V2BPK8m0a/Rh4qu/l4JmL/YGmOZ+DOIi0sT/JRzp40tTvwK0r6fRdBG7ZSg0i3AjOSVan0V8Et+JcC+D5X3qxDuI/D+kSSBycMP6I9OOkXgTwG/CweDieXZmqPFeBE8lnaY4VBE/jfRTpcbqDOIifBb35QdIt2pAUaZI/yfa9Fm3oxZlXCy5u9VW0oVt6JHhIyjzwUkS9FW3YL8JJNRnG4wEMHTocjDGUlRXAZhOxbNnCf/ba/6wYPnwunE4JXq8bp556BOrqWpEaFf63v92W9nrsWZcVv/Rj/eJIJZDPAZyBvWOIRoKX4Dkbe5f9ORd7l/0ZBn7iz0Z6ZX+WgZtp67EnyDFZ9mc4eFX31LI/O8Erm/zYYz4UwPZ0H1xRNBBCbACkk0+eKQcCEdLZGckEEAdIulzyXwaGYcJmE10AkyyLhisqitltt11IHnjg7yLA+q2emAgzIeDO2jjSCxr9t0cqgdRj78+s/Rr81O6tcNw88ConqZgC7hH/uQrHPZW4nlbhuP3BpEmjQCkrbW3tvKe1NXBfU1O7CeCWvLysPwiC0CCK03DhhbOxbNl6xGJxhEL7lgbLy8+Aw2HDtdeejZtv/hUEQcCCBY9i27YarFq1GbHYcgwdOgednWGEQp3IzMzFWWcdjfPOOx5nn30HIpFlOOWUBfjww6UAtkKSpsPpdCAc3gyeUdAdPK/iUIwbNxabN7+CAQMK4HA4TjJNs3DmzElPnXHGbWzRomVnWBZVnU7p4xtuuB+PPbYAQBEEoQKUru02XkVFCcAPu2sAvCIIQktr6yzceuv5GDduGH71q7vgdDq6Ct+Vlp4KQSBoaemEYXwFSZqOnBwfWlreBCGePtepqOgUtLS8z19kgsV5vTPgcjnh929FeflhCAZjiEY3orJyNrZt2wzGtoKQCkyefBwCgSiqq98EP3spgFEYPHg0OjvDGDOmAvX1bWhsXILS0tPQ1NSA7Ow8CIKAjo5P4PEcg4EDi1FVVQPgG4wbdxG2bt0FSmXwLI/J4HaoLSgvPxUul+M/t/To1Vf/BU8+eRspLz/jBrfbOduyLDMUir3uckmvl5bmQ9OMyYZhXm+ziSwry/uozSZ8u2VLtVMUxeskyf5qcXHeXK/XzZYu/XRhfv6gYR6P+yJdN36IRGJLRVHsCIc/x4IFj0KS7MI//vH5mQ6Hfbam6WsCgeiLY8ZUWIyxsZSyWxhjDkmyP+VySavsdhFNTZ1zOzqCs2VZXanr5mtut1MnBOcCaLYsut7jcV3ncknPu1xSLBaLzxdFMZSVlWFfu/aZR48++trzTdPMXbPmmcfmzv3d6NWrt7xomlY8Ly/rKllWdlgWvcCyaM2QIaU/NDe3X62q+uOCIEQbGt5DWdlpAC/KdieAp9vago0DBxYOF0XxWkqpFo+rjxJCmhoblyQI6ky43U6PZdEbABwSDEafu/DC45f5fF7xk0++vtPtdu7aurV6LSHkFACPE0IogCuLinIr2tuD3+bnZy3etImXVM7ImIHy8qIiVdXn6bqRJYrik7t37/6uvLxczM31XatpxlE+n+cHl8v5ly++WCgff/xNt+ze3VIQj6sugKxvaHjvtYEDz0Bxcd7Imprm830+d0lxcd6Tum5s2Lq12j5gQOFlXq/n2HA49lZ+fubipqYOquvGlRkZbqm9PViVk5O5TJLs46PR+KmWZcUyMzMGuVzSnwzDausSgVKIww7uxf7rPoijJ04HV8oPlDgATr6vgnOhdFAM7vXvCtTZn6BFwzAxbdpVbMCAwpcURfXIsuIYO3bIkuLiXGRkOF3RqHznb35z5kVz5x73a78/cOeZZx7tDAQitlgsfqwsKxmKok1XFG06EEMspuRHIvLpgkDaYrF4JBnSQAjQ0RHOliTHfI/HZc/O9tmnTBnjmj17ms3vD946enTFpZMmjb6grq7lsk8+eRiNje2DZVm53uNxfWyaliZJ9iJF0RCLKYfFYsrQjo6QTZaVY+Nx1S3Liqiq2lyfz32GzSauzMyciVgsPthut1321FPvuIuK8nbEYspmy7JWl5bmNxmGCcMwo6IoXCHL6pmUsokVFSVmQQGPcg0EIggEImIgEDk0EIh4DGMzvF7PXEmyH+vzedorKkoKKipKMGjQGQB4xG9nZ+TcQw4Zdu/99994XklJ3uMPPPBK6emnH8UURTtBVbWJ0Wg8NxZTjo7FFBKLKYjFlKPC4ViWomjreS0vjlgsgEhEnmcYpqOwMGdtZqZnDPAd7HZxcna29/cPPnjTOXl5mXfGYvHTACAeV4+LxZRDQiH5m2Awcp7TebSzru4d0t4eusXlcuiyrC7bvbs1u66uBYIgzMjNzXz49NOnz3W5pMd37Wqu1DQD0ahyhCyroyllOwzDRDQaL5Ekx01FRbnBSEQ+vKam+bCmpnauI6RsLCe4fP977LuyO7BH7EnW4/2pld0BLpq9gj0OyP7EtFzwkkBXA73GlfWJ55//Herr27BmzXfhWEx5MxyWN6xbtz0migKiUcUtiuKAYcPKMHhwCURRGFBX1+I0TV5z1+FwSIZhCowxygmBEFXVtg8eXLqMEEFPRsWGQjIAGF6ve5Gqaq2yrPyKMXborl1NNkEQKtau3fr2V19t/u+sLO/OJ598x8EYy9M0vb2srOBzm03c4HY71WSuPCEQJ00aXSKKgptSxhRFY3a7HaWl+assy9pcVlYAxsAIIUTXDfLGG5+ZhmF2aJqxe+nSV2Sez16w1uGwDwoEItdFo/JT27fXKt9/X9vbe2XASOTnZ24yTevteFw9WteNs7/88m+YPJlHIcXjGmKxeE5Ojhfjxg2F2+0sAIhr3LhhjDFmaJohulySEwDjkb0UlFK9paVziaYZ9araPZg3HldzCSHbJMn+hmGY3wIAYyjJyHB7x40biszMDFEUhfLEWjCfz9NCKd1AKTMNw8D9979mF0WSnZ3trfH5PF8oirZT03QAJGfHjoav33vvyxvC4dirNpuoJuZjBAKRDyyLNoiiAMuiyMrKsObMmbEyEIhsMAxT1DS9mxLtA4+kvQPpFUtwgCdU/Q39fxsE4KUi01H8hoGXCToR6WUmZoKLevOQflE7AMCsWZPg8XihKFo7eC1huN0u1NW1dMqy8vj997/e9PTT7zVqmvH4889/EJIkm+5w2Gu9Xve94Fa01gQN6wCCGzZUCYyt7Wb90XWTBoNRyemUBrrdTsHjcZKqqlqVMfaYZVGPaZoTGWOtr7/+qR4IRL4jhFQ3NLS9WFZW8PCYMRWlgweXIDvbuy072zeXMfbfoijojDEzkdvtFwQSkyRHMs8hCsAPECaKAggh32dn+846/PCzxsRicQQC0fb29uAbiqLS4cMHfltRUZwI6OtGHJ0ATKARfn/IFARhkMsluTweXgvB5eJL7PE4kZ3tW7Jmzdbl119/f0swGH3nhBOODBFyGAuFYgvb2gKVhYU5Zzgc9p2aJidF+ZAgEJ0xBln+IuW2Anw+z8uSZJ/j9wefj0bjYwEgGIx8tnNnw7vXXntfe1VV3epQKJqIuCad4NZMCiAgSQ689tpSXZIcSxVFu0QQyIu5ub6JubmZsNttXwoC+S4Wix8uCEL7sGEDmp1OBwAEk3NJnGcqY6xFllUGkAgSFtjUU/c88ODDdAol1IAT0x+QqJzYD2TwCN39+QTbJnDTcrqfYIuBh6esO4BoXi+4wSI4YcJIZGd7kZmZYX/nnZUlGRkudtVVpze3twfNDz5YDafT4VVVo7CgIDvsdkt01ar3O93u4c7EGO2pxHHllfeivr4N3333o5tSWjpq1CBl4cL5TS+++CHz+Tzim28uGxCNxoURIwY22myiHgrF4PN5PNu27SoePXqQsmzZwuaLL/4jMwzDvmbNtjKAabKsmG63q5NSSiXJXjxu3LB4IBAJtbZ2wuVyZmVmetxnnz2j5YknFjNZVu3RaLzUNE2/yyXF8/OzTw8Go6dblvVxW1tgEQ9u6EhdBwJenzdQVJRj1NS8jYKCk8p9Po9j9uxpzZGIHH/77RWIRJZhzJjzoao6YrF4Tltbuy8/P6+5vX2XfsIJs/HJJw8hJ+f4AYJAYqpqGJRSmRDCwIsAygCU1HX68svvcMkl98AwrGJV1Z2WRXcPHz6A7thRj8GDS7M2bKjKOfzwyujatc+2J0oJFXZ0hKz6+rYwYywbQPvFF89mZWUF9tde+3SAqmr0hBOmNjLGzCVLVsHlkjLDYbmAMdpUXl4U37jxe7jdGXng1rp4fn42dN1wFRfn5p944tSWBx/8h08QiAIgnmrFcqdJHD+C52JEwfMx+kMIPAX3GfC6vXFwHae/094LHvfvB4/9KuinvQP9i4V9oSvNddWqJ3HyyfMRDEaN7GzvbpfLgYaGtq5EGsuiUcZYlFKaWllDRS/lRp555g4MGTIHXq87HghEdlLKsHTpNwiFYgiHYxZjqOOfM3BAEAicTgdM05QZY9WWRfHqq58iEAhD102DMVabrAaSguYetwwlfpKlewxKaZ1pWigqykVhYU5tdrb3udbWwBpZVhGL7ZVqwgC0Aby+7rhxF6G5ub2eh/IrEEUBkQg3HG7f/jqczqNRVpYf0PWsgM0moqRkBDZv3pksTdRgGMkqJl1z7jW3Zd68xzBz5hQsXfp1C2MMubmZ8PuDyMnxQRSFUF5eVihZOyuBtpTf/QCg6yaamtoNxlgNY0BHRwimacFmE8EYC1NKwy6XhPb2ENzujN7momCPFbcrUSeVg1wGXsVwX9gMHjqyATxv5Etw0awvtINzjNdTrtnAxaG7se9S9NXgRaD94J+BfgL7/tKtDm5J+/JgNO/eGD/+IpSU5ENRVOze3YbW1s6DjsA0sD+psV+Dm1zTLSzXDB5D1bOwnAleulQGcC/S+1b6++Cc5ykc/Fb6AWHTplewadMvPYv/e0i3Nu8X2LvqIkHfBFYLrsB3EUePWCwKHmJyIxKfR+gFPcdehn2Hy9tw8DvpB/EzI3UTNqL715wATjQN4Kbfnl72CHiwoQfdY7Hi4PnpXyUbpoo8PUr6vAiuXF+BvYm1EXsHRq4FJ5I7wa1XqXM10DexHcRBHBBSdZDevmGerKhHgb0qMPbFQViiD1L79EQPf0VfZmUjOUaP9n1xCxMAO6iDHMTPhf8P/Itcf9Ip2+AAAAAldEVYdGRhdGU6Y3JlYXRlADIwMjItMTEtMTRUMDQ6MzU6MzArMDA6MDDyI1OYAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDIyLTExLTE0VDA0OjM1OjMwKzAwOjAwg37rJAAAAABJRU5ErkJggg==\" data-filename=\"imageedit_76_3542310111.png\"></h1>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n\r\n            <div class=\"layout one-col fixed-width\" style=\"margin: 0 auto;max-width: 600px;min-width: 320px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;\">\r\n                <div class=\"layout__inner\" style=\"border-collapse: collapse;display: table;width: 100%;background-color: #ffffff;\" lang=\"x-layout__inner\">\r\n                    <div class=\"column\" style=\"text-align: left; background: rgb(237, 241, 235); line-height: 21px; max-width: 600px; min-width: 320px; width: 320px;\">\r\n\r\n                        <div style=\"color: rgb(96, 102, 109); font-size: 14px; margin-left: 20px; margin-right: 20px; margin-top: 24px;\">\r\n                            <div style=\"line-height:10px;font-size:1px\">&nbsp;</div>\r\n                        </div>\r\n\r\n                        <div style=\"margin-left: 20px; margin-right: 20px;\">\r\n\r\n                            <p style=\"color: rgb(96, 102, 109); font-size: 14px; margin-top: 16px; margin-bottom: 0px;\"><strong>Hello [[name]],</strong></p>\r\n                            <p style=\"color: rgb(96, 102, 109); font-size: 14px; margin-top: 20px; margin-bottom: 20px;\"><strong>[[message]]</strong></p>\r\n                            <p style=\"margin-top: 20px; margin-bottom: 20px;\"><strong style=\"color: rgb(96, 102, 109); font-size: 14px;\">Sincerely,<br>Team&nbsp;</strong><font color=\"#60666d\"><b>Pay Secure</b></font></p>\r\n                        </div>\r\n\r\n                    </div>\r\n                </div>\r\n            </div>\r\n\r\n            <div class=\"layout__inner\" style=\"border-collapse: collapse;display: table;width: 100%;background-color: #2c3262; margin-bottom: 20px\" lang=\"x-layout__inner\">\r\n                <div class=\"column\" style=\"text-align: left;color: #60666d;font-size: 14px;line-height: 21px;max-width:600px;min-width:320px;\">\r\n                    <div style=\"margin-top: 5px;margin-bottom: 5px;\">\r\n                        <p style=\"margin-top: 0;margin-bottom: 0;font-style: normal;font-weight: normal;color: #ffffff;font-size: 16px;line-height: 35px;font-family: bitter,georgia,serif;text-align: center;\">\r\n                            2022 ©  All Right Reserved</p>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n\r\n        </div>\r\n\r\n\r\n        <div style=\"border-collapse: collapse;display: table;width: 100%;\">\r\n            <div class=\"snippet\" style=\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 140px; width: 140px;padding: 10px 0 5px 0;color: #b9b9b9;\">\r\n            </div>\r\n            <div class=\"webversion\" style=\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 139px; width: 139px;padding: 10px 0 5px 0;text-align: right;color: #b9b9b9;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>', 0, 0, 0, 0, 0, 1, '25', 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 5, 1, 1, 0, 1, '58dd135ef7bbaa72709c3470/default', 0, 0, '1983831301869331', '1983831301869331', 0, 0, 'G-TFQZ8YZ468', 0, '[\"1\",\"5\",\"10\",\"18\"]', 1, 1, '2021-03-15 00:26:24', '2023-03-16 00:38:27');

-- --------------------------------------------------------

--
-- Table structure for table `bill_methods`
--

CREATE TABLE `bill_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `methodName` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `parameters` text DEFAULT NULL COMMENT 'api parameters',
  `extra_parameters` text DEFAULT NULL,
  `inputForm` text DEFAULT NULL,
  `convert_rate` text DEFAULT NULL COMMENT 'convert through base currency',
  `is_active` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = active, 0 = inactive',
  `logo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bill_methods`
--

INSERT INTO `bill_methods` (`id`, `methodName`, `code`, `description`, `parameters`, `extra_parameters`, `inputForm`, `convert_rate`, `is_active`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'Flutterwave', 'flutterwave', 'Automated Bill Payment', '{\"Public_Key\":\"\",\"Secret_Key\":\"\",\"Encryption_Key\":\"\"}', NULL, '{\"customer\":{\"name\":\"customer\",\"label\":\"Customer\",\"type\":\"text\",\"validation\":\"required\"}}', '{\"NGN\":\"255\",\"GHS\":\"5.30\",\"KES\":\"1\"}', 1, 'flutterwave.jpg', NULL, '2023-03-16 00:18:52');

-- --------------------------------------------------------

--
-- Table structure for table `bill_pays`
--

CREATE TABLE `bill_pays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `method_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `from_wallet` int(11) DEFAULT NULL,
  `customer` text DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `country_name` varchar(255) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `charge` double NOT NULL DEFAULT 0,
  `payable_amount` double DEFAULT 0,
  `pay_amount_in_base` double NOT NULL DEFAULT 0 COMMENT 'payable amount in base currency for return user',
  `base_currency_id` int(11) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `exchange_rate` double NOT NULL DEFAULT 0 COMMENT 'in service currency',
  `utr` text DEFAULT NULL,
  `status` tinyint(6) NOT NULL COMMENT '0=>generate,1=>pending,2=>payment_completed,3=>bill_complete,4=>bill_return',
  `last_api_error` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bill_services`
--

CREATE TABLE `bill_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bill_method_id` bigint(20) UNSIGNED NOT NULL,
  `service` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `info` longtext DEFAULT NULL,
  `label_name` varchar(191) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `percent_charge` double NOT NULL DEFAULT 0,
  `fixed_charge` double NOT NULL DEFAULT 0,
  `min_amount` double DEFAULT 0,
  `max_amount` double DEFAULT 0,
  `currency` varchar(10) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=>disable,1=>enable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `charges_limits`
--

CREATE TABLE `charges_limits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `percentage_charge` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `fixed_charge` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `min_limit` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `max_limit` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `is_active` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = active, 0 = inactive',
  `convention_rate` decimal(16,8) DEFAULT 1.00000000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `charges_limits`
--

INSERT INTO `charges_limits` (`id`, `currency_id`, `transaction_type_id`, `payment_method_id`, `percentage_charge`, `fixed_charge`, `min_limit`, `max_limit`, `is_active`, `convention_rate`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, '0.00000000', '0.00000000', '0.00000000', '0.00000000', 1, '1.00000000', '2023-03-16 00:36:49', '2023-03-16 00:36:49'),
(2, 1, 2, NULL, '0.00000000', '0.00000000', '0.00000000', '0.00000000', 1, '1.00000000', '2023-03-16 00:36:49', '2023-03-16 00:36:49'),
(3, 1, 3, NULL, '0.00000000', '0.00000000', '0.00000000', '0.00000000', 1, '1.00000000', '2023-03-16 00:36:49', '2023-03-16 00:36:49');

-- --------------------------------------------------------

--
-- Table structure for table `commission_entries`
--

CREATE TABLE `commission_entries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `to_user` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_id` bigint(20) DEFAULT NULL,
  `from_user` bigint(20) UNSIGNED DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `commission_amount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `utr` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'feature', '2021-01-27 01:56:36', '2021-01-27 01:56:36'),
(3, 'feature', '2021-01-27 01:58:28', '2021-01-27 01:58:28'),
(4, 'feature', '2021-01-27 05:07:27', '2021-01-27 05:07:27'),
(5, 'about-us', '2021-01-27 05:11:15', '2021-01-27 05:11:15'),
(6, 'about-us', '2021-01-27 05:12:24', '2021-01-27 05:12:24'),
(7, 'services', '2021-01-27 05:23:07', '2021-01-27 05:23:07'),
(8, 'services', '2021-01-27 05:23:29', '2021-01-27 05:23:29'),
(9, 'services', '2021-01-27 05:23:46', '2021-01-27 05:23:46'),
(10, 'services', '2021-01-27 05:24:22', '2021-01-27 05:24:22'),
(11, 'services', '2021-01-27 05:24:55', '2021-01-27 05:24:55'),
(12, 'services', '2021-01-27 05:25:18', '2021-01-27 05:25:18'),
(13, 'how-it-works', '2021-01-27 06:42:21', '2021-01-27 06:42:21'),
(14, 'how-it-works', '2021-01-27 06:42:31', '2021-01-27 06:42:31'),
(15, 'how-it-works', '2021-01-27 06:42:45', '2021-01-27 06:42:45'),
(16, 'how-it-works', '2021-01-27 06:43:01', '2021-01-27 06:43:01'),
(17, 'faq', '2021-01-27 06:43:36', '2021-01-27 06:43:36'),
(18, 'faq', '2021-01-27 06:44:45', '2021-01-27 06:44:45'),
(19, 'faq', '2021-01-27 06:44:56', '2021-01-27 06:44:56'),
(20, 'faq', '2021-01-27 06:45:13', '2021-01-27 06:45:13'),
(21, 'faq', '2021-01-27 06:45:26', '2021-01-27 06:45:26'),
(22, 'clients-feedback', '2021-01-28 02:14:47', '2021-01-28 02:14:47'),
(23, 'clients-feedback', '2021-01-28 02:15:44', '2021-01-28 02:15:44'),
(24, 'clients-feedback', '2021-01-28 02:16:15', '2021-01-28 02:16:15'),
(25, 'clients-feedback', '2021-01-28 03:43:50', '2021-01-28 03:43:50'),
(26, 'blog', '2021-01-28 05:33:36', '2021-01-28 05:33:36'),
(27, 'blog', '2021-01-28 05:35:08', '2021-01-28 05:35:08'),
(28, 'blog', '2021-01-28 05:36:28', '2021-01-28 05:36:28'),
(29, 'blog', '2021-01-28 05:37:19', '2021-01-28 05:37:19'),
(30, 'contact', '2021-01-30 05:38:08', '2021-01-30 05:38:08'),
(31, 'contact', '2021-01-30 05:39:03', '2021-01-30 05:39:03'),
(32, 'contact', '2021-01-30 05:39:47', '2021-01-30 05:39:47'),
(33, 'social-links', '2021-01-30 06:53:34', '2021-01-30 06:53:34'),
(34, 'social-links', '2021-01-30 07:20:36', '2021-01-30 07:20:36'),
(35, 'social-links', '2021-01-30 07:20:50', '2021-01-30 07:20:50'),
(36, 'social-links', '2021-01-30 07:21:18', '2021-01-30 07:21:18'),
(37, 'social-links', '2021-01-30 07:21:32', '2021-01-30 07:21:32'),
(39, 'feature', '2021-12-26 03:34:51', '2021-12-26 03:34:51'),
(40, 'extra-pages', '2022-06-06 01:52:37', '2022-06-06 01:52:37'),
(41, 'extra-pages', '2022-06-06 01:52:58', '2022-06-06 01:52:58'),
(42, 'extra-pages', '2022-06-06 01:53:35', '2022-06-06 01:53:35'),
(43, 'extra-pages', '2022-06-06 01:53:51', '2022-06-06 01:53:51'),
(44, 'extra-pages', '2022-06-06 01:54:05', '2022-06-06 01:54:05'),
(45, 'feature', '2022-06-06 04:29:06', '2022-06-06 04:29:06'),
(47, 'get-started', '2022-06-06 05:18:26', '2022-06-06 05:18:26'),
(48, 'get-started', '2022-06-06 05:18:38', '2022-06-06 05:18:38'),
(49, 'get-started', '2022-06-06 05:18:56', '2022-06-06 05:18:56'),
(50, 'blog', '2022-06-06 11:35:02', '2022-06-06 11:35:02'),
(51, 'blog', '2022-06-06 11:35:27', '2022-06-06 11:35:27'),
(52, 'banner', '2022-06-07 22:43:11', '2022-06-07 22:43:11'),
(53, 'banner', '2022-06-07 23:00:37', '2022-06-07 23:00:37'),
(63, 'feature', '2022-11-14 10:15:06', '2022-11-14 10:15:06');

-- --------------------------------------------------------

--
-- Table structure for table `content_details`
--

CREATE TABLE `content_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content_id` bigint(20) UNSIGNED DEFAULT NULL,
  `language_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content_details`
--

INSERT INTO `content_details` (`id`, `content_id`, `language_id`, `description`, `created_at`, `updated_at`) VALUES
(2, 2, 1, '{\"title\":\"Account Transfers\",\"short_description\":\"<span>Get your pay early and when you need it the most<\\/span>\"}', '2021-01-27 01:56:36', '2022-06-06 04:24:37'),
(3, 3, 1, '{\"title\":\"Payment Channel Options\",\"short_description\":\"<span>Better manage your day to day spending with PayAid<\\/span>\"}', '2021-01-27 01:58:28', '2022-06-06 04:26:43'),
(5, 2, 2, '{\"title\":\"Transferencias de cuenta\",\"short_description\":\"Obtenga su pago temprano y cuando m\\u00e1s lo necesite\"}', '2021-01-27 05:04:37', '2022-11-08 00:43:49'),
(6, 3, 2, '{\"title\":\"Opciones de canales de pago\",\"short_description\":\"<p>Administre mejor sus gastos diarios con PayAid<br \\/><\\/p>\"}', '2021-01-27 05:06:06', '2022-11-08 00:44:29'),
(7, 4, 1, '{\"title\":\"Flexible Settlement\",\"short_description\":\"<span>Registration only takes 5-10 min to complete and approval is instant<\\/span>\"}', '2021-01-27 05:07:27', '2022-06-06 04:27:12'),
(8, 4, 2, '{\"title\":\"Liquidaci\\u00f3n flexible\",\"short_description\":\"El registro solo toma de 5 a 10 minutos para completarse y la aprobaci\\u00f3n es instant\\u00e1nea\"}', '2021-01-27 05:07:56', '2022-11-08 00:45:48'),
(9, 5, 1, '{\"title\":\"Our Mission\",\"short_description\":\"We work to help businesses throughout the world maximize their profits and create consistent value and support to our merchants. This is our mission. Everything we do reflects this mission and the values that make it possible.\"}', '2021-01-27 05:11:15', '2021-12-26 03:44:37'),
(10, 5, 2, '{\"title\":\"Nuestra misi\\u00f3n\",\"short_description\":\"Trabajamos para ayudar a las empresas de todo el mundo a maximizar sus ganancias y crear valor y apoyo constantes para nuestros comerciantes. \\u00c9sta es nuestra misi\\u00f3n. Todo lo que hacemos refleja esta misi\\u00f3n y los valores que la hacen posible.\"}', '2021-01-27 05:11:55', '2021-12-26 03:44:46'),
(11, 6, 1, '{\"title\":\"Our Visions\",\"short_description\":\"Our vision serves as the foundation for The Merchant Solutions which guides the entirety of our business by identifying what we need to accomplish in order to continue achieving.\"}', '2021-01-27 05:12:24', '2021-12-26 03:45:25'),
(12, 6, 2, '{\"title\":\"Nuestras Visiones\",\"short_description\":\"Nuestra visi\\u00f3n sirve como base para The Merchant Solutions, que gu\\u00eda la totalidad de nuestro negocio al identificar lo que debemos lograr para seguir logrando.\"}', '2021-01-27 05:12:48', '2021-12-26 03:45:33'),
(13, 7, 1, '{\"title\":\"Send Money\",\"short_description\":\"Send money to any wallet pro user instantly by following some instructions.\"}', '2021-01-27 05:23:07', '2021-12-26 04:21:11'),
(14, 8, 1, '{\"title\":\"Payment Online\",\"short_description\":\"Pay online by wallet pro services and your receiver will get instant notification.\"}', '2021-01-27 05:23:29', '2021-12-26 04:22:25'),
(15, 9, 1, '{\"title\":\"Receive Money\",\"short_description\":\"Receive money from any wallet pro user instantly once they pay for you.\"}', '2021-01-27 05:23:46', '2021-12-26 04:23:10'),
(16, 10, 1, '{\"title\":\"Withdraw\",\"short_description\":\"Receive bank account numbers and get paid as easily as having a local bank account.\"}', '2021-01-27 05:24:22', '2021-12-26 04:27:12'),
(17, 11, 1, '{\"title\":\"Cash Board\",\"short_description\":\"Connect with thousands of marketplaces and start getting paid within a couple of clicks\"}', '2021-01-27 05:24:55', '2021-12-26 04:25:04'),
(18, 12, 1, '{\"title\":\"Deposit\",\"short_description\":\"Deposit money into your any wallet with more that 24 payment gateways worldwide.\"}', '2021-01-27 05:25:18', '2021-12-26 04:26:20'),
(19, 7, 2, '{\"title\":\"Enviar dinero\",\"short_description\":\"Env\\u00ede dinero a cualquier usuario profesional de billetera al instante siguiendo algunas instrucciones.\"}', '2021-01-27 05:26:07', '2021-12-26 04:21:27'),
(20, 8, 2, '{\"title\":\"Pago en l\\u00ednea\",\"short_description\":\"Pague en l\\u00ednea con los servicios de Wallet Pro y su destinatario recibir\\u00e1 una notificaci\\u00f3n instant\\u00e1nea.\"}', '2021-01-27 05:27:10', '2021-12-26 04:22:30'),
(21, 9, 2, '{\"title\":\"Recibir dinero\",\"short_description\":\"Reciba dinero de cualquier usuario profesional de billetera al instante una vez que pague por usted.\"}', '2021-01-27 05:27:27', '2021-12-26 04:23:16'),
(22, 10, 2, '{\"title\":\"Retirar\",\"short_description\":\"Reciba n\\u00fameros de cuentas bancarias y le paguen tan f\\u00e1cilmente como si tuviera una cuenta bancaria local.\"}', '2021-01-27 05:27:47', '2021-12-26 04:27:19'),
(23, 11, 2, '{\"title\":\"Junta de caja\",\"short_description\":\"Con\\u00e9ctese con miles de mercados y comience a recibir pagos con un par de clics\"}', '2021-01-27 05:28:00', '2021-12-26 04:25:11'),
(24, 12, 2, '{\"title\":\"Depositar\",\"short_description\":\"Deposite dinero en su billetera con m\\u00e1s de 24 pasarelas de pago en todo el mundo.\"}', '2021-01-27 05:28:16', '2021-12-26 04:26:27'),
(25, 13, 1, '{\"title\":\"Login To Our Platform\",\"short_description\":\"Login with your wallet pro account.\"}', '2021-01-27 06:42:21', '2021-12-26 04:29:13'),
(26, 14, 1, '{\"title\":\"Deposit\",\"short_description\":\"Deposit money into your wallet\"}', '2021-01-27 06:42:31', '2021-12-26 04:30:24'),
(27, 15, 1, '{\"title\":\"Send \\/ Receive Money\",\"short_description\":\"Send or receive money from any wallet pro account.\"}', '2021-01-27 06:42:45', '2021-12-26 04:31:30'),
(28, 16, 1, '{\"title\":\"Withdraw\",\"short_description\":\"Withdraw money into any selected payout method.\"}', '2021-01-27 06:43:01', '2021-12-26 04:32:28'),
(29, 17, 1, '{\"title\":\"I have some questions regarding my Wallet Pro integration. Who can I contact?\",\"short_description\":\"During office hours you can contact us and speak to one of our Customer Service agents who are trained to assist you with your integration, alternatively you can send us an email at support@wallet.pro\"}', '2021-01-27 06:43:36', '2021-12-26 04:39:37'),
(30, 18, 1, '{\"title\":\"What geographical locations does each Payment Gateway support?\",\"short_description\":\"Geographic locations are set by each Payment Gateway.  ClickFunnels does not support which locations each payment gateway accepts.  It is recommended that you reach out the the SUPPORT TEAM for your corresponding payment gateway to check your location and if you can accept payments.\"}', '2021-01-27 06:44:45', '2021-12-26 04:43:12'),
(31, 19, 1, '{\"title\":\"How many payment gateways can I have in my account?\",\"short_description\":\"You will get 24 payment gateways in total. In neat future if wallet pro deals with new payment gateway then everyone will get access on that.\"}', '2021-01-27 06:44:56', '2021-12-26 04:47:49'),
(32, 20, 1, '{\"title\":\"Is payment information collected by Wallet Pro?\",\"short_description\":\"Using API to pass payment information directly to your payment gateway means that Wallet Pro doesn\'t directly collect any information submitted through the funnel. To help ensure protection while the data is passed, Order Form pages do employ a higher level of security than a standard page and require HTTPS to work properly.\"}', '2021-01-27 06:45:13', '2021-12-26 04:50:51'),
(33, 21, 1, '{\"title\":\"How Much Does a Payment Gateway Cost?\",\"short_description\":\"Every payment gateway has a unique payment structure, so it\\u2019s important to do comparative research. Some processors will ask for a monthly maintenance fee, while others will require a one-time setup fee. Whatever the case it\\u2019s important to look out for hidden costs and conditions that may affect the overall price.\"}', '2021-01-27 06:45:26', '2021-12-26 04:52:34'),
(34, 17, 2, '{\"title\":\"Tengo algunas preguntas sobre mi integraci\\u00f3n con Wallet Pro. \\u00bfA qui\\u00e9n puedo contactar?\",\"short_description\":\"Durante el horario de oficina, puede contactarnos y hablar con uno de nuestros agentes de Servicio al Cliente que est\\u00e1n capacitados para ayudarlo con su integraci\\u00f3n; alternativamente, puede enviarnos un correo electr\\u00f3nico a support@wallet.pro\"}', '2021-01-27 23:11:43', '2021-12-26 04:39:54'),
(35, 18, 2, '{\"title\":\"\\u00bfQu\\u00e9 ubicaciones geogr\\u00e1ficas admite cada pasarela de pago?\",\"short_description\":\"Las ubicaciones geogr\\u00e1ficas las establece cada pasarela de pago. ClickFunnels no admite qu\\u00e9 ubicaciones acepta cada pasarela de pago. Se recomienda que se comunique con el EQUIPO DE SOPORTE de su pasarela de pago correspondiente para verificar su ubicaci\\u00f3n y si puede aceptar pagos.\"}', '2021-01-27 23:12:51', '2021-12-26 04:43:28'),
(36, 19, 2, '{\"title\":\"\\u00bfCu\\u00e1ntas pasarelas de pago puedo tener en mi cuenta?\",\"short_description\":\"Obtendr\\u00e1 24 pasarelas de pago en total. En un futuro pr\\u00f3ximo, si Wallet Pro se ocupa de una nueva pasarela de pago, todos tendr\\u00e1n acceso a ella.\"}', '2021-01-27 23:13:09', '2021-12-26 04:48:06'),
(37, 20, 2, '{\"title\":\"\\u00bfLa informaci\\u00f3n de pago recopila Wallet Pro?\",\"short_description\":\"El uso de API para pasar informaci\\u00f3n de pago directamente a su pasarela de pago significa que Wallet Pro no recopila directamente ninguna informaci\\u00f3n enviada a trav\\u00e9s del embudo. Para ayudar a garantizar la protecci\\u00f3n mientras se transmiten los datos, las p\\u00e1ginas del formulario de pedido emplean un nivel de seguridad m\\u00e1s alto que una p\\u00e1gina est\\u00e1ndar y requieren HTTPS para funcionar correctamente.\"}', '2021-01-27 23:13:24', '2021-12-26 04:51:06'),
(38, 21, 2, '{\"title\":\"\\u00bfCu\\u00e1nto cuesta una pasarela de pago?\",\"short_description\":\"Cada pasarela de pago tiene una estructura de pago \\u00fanica, por lo que es importante realizar una investigaci\\u00f3n comparativa. Algunos procesadores solicitar\\u00e1n una tarifa de mantenimiento mensual, mientras que otros requerir\\u00e1n una tarifa de configuraci\\u00f3n \\u00fanica. Cualquiera que sea el caso, es importante estar atento a los costos ocultos y las condiciones que pueden afectar el precio general.\"}', '2021-01-27 23:13:36', '2021-12-26 04:52:50'),
(39, 13, 2, '{\"title\":\"Inicie sesi\\u00f3n en su plataforma\",\"short_description\":\"Inicie sesi\\u00f3n con su cuenta Wallet Pro.\"}', '2021-01-28 01:09:37', '2021-12-26 04:29:19'),
(40, 14, 2, '{\"title\":\"Depositar\",\"short_description\":\"Deposita dinero en tu billetera\"}', '2021-01-28 01:10:19', '2021-12-26 04:30:40'),
(41, 15, 2, '{\"title\":\"Enviar \\/ recibir dinero\",\"short_description\":\"Env\\u00ede o reciba dinero de cualquier cuenta Wallet Pro.\"}', '2021-01-28 01:10:40', '2021-12-26 04:31:45'),
(42, 16, 2, '{\"title\":\"Retirar\",\"short_description\":\"Retire dinero en cualquier m\\u00e9todo de pago seleccionado.\"}', '2021-01-28 01:10:52', '2021-12-26 04:32:42'),
(43, 22, 1, '{\"title\":\"CEO, Bug-Finder\",\"designation\":\"CEO, Bug-Finder\",\"short_description\":\"In libero omnis voluptatibus nam voluptatem ducimus ipsum voluptatum minima officia suscipit.\"}', '2021-01-28 02:14:47', '2022-06-06 05:55:54'),
(44, 23, 1, '{\"title\":\"Leonardo Bell\",\"designation\":\"CEO, Bug-Finder\",\"short_description\":\"In libero omnis voluptatibus nam voluptatem ducimus ipsum voluptatum minima officia suscipit.\"}', '2021-01-28 02:15:44', '2022-06-06 05:56:14'),
(45, 24, 1, '{\"title\":\"Kate Thompson\",\"designation\":\"CEO, Bug-Finder\",\"short_description\":\"In libero omnis voluptatibus nam voluptatem ducimus ipsum voluptatum minima officia suscipit.essing industry.\"}', '2021-01-28 02:16:15', '2022-06-06 05:56:35'),
(46, 22, 2, '{\"title\":\"CEO, Bug-Finder\",\"designation\":\"CEO, Bug-Finder\",\"short_description\":\"La pasarela de pago Wallet Pro es una de las herramientas m\\u00e1s vers\\u00e1tiles para el comercio electr\\u00f3nico. Tiene un conjunto s\\u00f3lido de funciones, que incluyen facturaci\\u00f3n recurrente y procesamiento de cheques electr\\u00f3nicos \\/ ACH. Sin embargo, decidir de d\\u00f3nde obtener su puerta de enlace es a menudo el mayor desaf\\u00edo. Esto es lo que necesita saber sobre sus opciones.\"}', '2021-01-28 02:18:41', '2022-11-08 01:00:34'),
(47, 23, 2, '{\"title\":\"Leonard Bell\",\"designation\":\"CEO, Bug-Finder\",\"short_description\":\"La puerta de enlace Wallet Pro es un gran producto con caracter\\u00edsticas s\\u00f3lidas. Si bien opciones como el soporte para facturaci\\u00f3n recurrente y una base de datos de informaci\\u00f3n del cliente son caracter\\u00edsticas est\\u00e1ndar en la mayor\\u00eda de las puertas de enlace, la capacidad de Wallet Pro para procesar datos de tarjetas de cr\\u00e9dito de Nivel III lo distingue de muchos de sus competidores. Es una funci\\u00f3n especialmente \\u00fatil para los comerciantes B2B.\"}', '2021-01-28 02:19:44', '2022-11-08 01:34:48'),
(48, 24, 2, '{\"title\":\"Kate Thompson\",\"designation\":\"CEO, Bug-Finder\",\"short_description\":\"Con todo lo que Wallet Pro ha logrado, est\\u00e1 preparado para continuar como uno de los proveedores m\\u00e1s importantes en el mundo del comercio electr\\u00f3nico y el procesamiento m\\u00f3vil. Considere la enorme cantidad de funciones y servicios \\u00fanicos que obtiene sin cargo adicional y, sin cargo mensual, Wallet Promay tiene el mejor valor en toda la industria de procesamiento de comercio electr\\u00f3nico.\"}', '2021-01-28 03:40:39', '2022-11-08 01:35:05'),
(49, 25, 1, '{\"title\":\"Thompson Kate\",\"designation\":\"CEO, Bug-Finder\",\"short_description\":\"In libero omnis voluptatibus nam voluptatem ducimus ipsum voluptatum minima officia suscipit.\"}', '2021-01-28 03:43:50', '2022-06-06 05:57:01'),
(50, 25, 2, '{\"title\":\"Thompson Kate\",\"designation\":\"CEO, Bug-Finder\",\"short_description\":\"Wallet Pro es una plataforma de pago en la nube dise\\u00f1ada para aceptar pagos en l\\u00ednea y en aplicaciones m\\u00f3viles. Es una soluci\\u00f3n de extremo a extremo con un motor de pagos robusto que agiliza el movimiento de dinero. Adem\\u00e1s, Wallet Pro tiene numerosas aplicaciones que ayudan a prevenir el fraude, administrar los ingresos e impulsar el crecimiento empresarial global.\"}', '2021-01-28 03:44:20', '2022-11-08 01:35:20'),
(51, 26, 1, '{\"title\":\"Temporibus quo beatae quisquam vero atque dicta, accusantium pain.\",\"short_description\":\"<p style=\\\"color:rgb(83,100,121);font-family:Roboto, sans-serif;\\\">Yes, you can initialize transactions with the split payment methods. To do that, you\\u2019ll need to create sub-account(s) and specify the percentage of the transaction to split into that subaccount. You can have as many sub accounts necessary. See the documentation on how to use the split payments APIs (link to split payments documentation).<\\/p><p style=\\\"color:rgb(83,100,121);font-family:Roboto, sans-serif;\\\">Ratione soluta, illum tenetur, beatae distinctio non repellendus debitis vel culpa ipsum nesciunt sint accusantium cumque maiores est reiciendis. Fugit, explicabo aliquam? Ipsum, quibusdam aliquid expedita culpa sint maiores dolore odio laboriosam hic qui est quas doloremque dignissimos repellat exercitationem nostrum voluptatibus ipsam soluta. Similique deleniti iste iure totam sit, reprehenderit accusamus.<\\/p>Atque distinctio dolor soluta reiciendis iste, architecto, totam veritatis rerum dolorem officiis assumenda voluptatum rem, eius consectetur eum. Dolorem, esse!<span>Nafiz Ahmed Rana<\\/span><p style=\\\"color:rgb(83,100,121);font-family:Roboto, sans-serif;\\\">Yes, you can initialize transactions with the split payment methods. To do that, you\\u2019ll need to create sub-account(s) and specify the percentage of the transaction to split into that subaccount. You can have as many sub accounts necessary. See the documentation on how to use the split payments APIs (link to split payments documentation).<\\/p><p style=\\\"color:rgb(83,100,121);font-family:Roboto, sans-serif;\\\">Ratione soluta, illum tenetur, beatae distinctio non repellendus debitis vel culpa ipsum nesciunt sint accusantium cumque maiores est reiciendis. Fugit, explicabo aliquam? Ipsum, quibusdam aliquid expedita culpa sint maiores dolore odio laboriosam hic qui est quas doloremque dignissimos repellat exercitationem nostrum voluptatibus ipsam soluta. Similique deleniti iste iure totam sit, reprehenderit accusamus.<\\/p>\"}', '2021-01-28 05:33:36', '2022-11-08 01:19:23'),
(52, 26, 2, '{\"title\":\"Temporibus quo beatae quisquam vero atque dicta, dolor accusantium.\",\"short_description\":\"<p>S\\u00ed, puede inicializar transacciones con los m\\u00e9todos de pago divididos. Para hacer eso, deber\\u00e1 crear subcuentas y especificar el porcentaje de la transacci\\u00f3n para dividir en esa subcuenta. Puede tener tantas subcuentas como sea necesario. Consulte la documentaci\\u00f3n sobre c\\u00f3mo utilizar las API de pagos fraccionados (enlace a la documentaci\\u00f3n de pagos fraccionados).<\\/p><p>Ratione soluta, illum tenetur, beatae distintio non repellendus debitis vel culpa ipsum nesciunt sint accusantium cumque maiores est reiciendis. Fugit, explicabo aliquam? Ipsum, quibusdam aliquid expedita culpa sint maiores dolore odio laboriosam hic qui est quas doloremque dignissimos repellat exercitationem nostrum voluptatibus ipsam soluta. Similique deleniti iste iure totam sit, reprehenderit accusamus.Atque distintio dolor soluta reiciendis iste, architecto, totam veritatis rerum dolorem officiis asunci\\u00f3n voluptatum rem, eius consectetur eum. Dolorem, esse!Nafiz Ahmed Rana<\\/p><p>S\\u00ed, puede inicializar transacciones con los m\\u00e9todos de pago divididos. Para hacer eso, deber\\u00e1 crear subcuentas y especificar el porcentaje de la transacci\\u00f3n para dividir en esa subcuenta. Puede tener tantas subcuentas como sea necesario. Consulte la documentaci\\u00f3n sobre c\\u00f3mo utilizar las API de pagos fraccionados (enlace a la documentaci\\u00f3n de pagos fraccionados).<\\/p><p>Ratione soluta, illum tenetur, beatae distintio non repellendus debitis vel culpa ipsum nesciunt sint accusantium cumque maiores est reiciendis. Fugit, explicabo aliquam? Ipsum, quibusdam aliquid expedita culpa sint maiores dolore odio laboriosam hic qui est quas doloremque dignissimos repellat exercitationem nostrum voluptatibus ipsam soluta. Similique deleniti iste iure totam sit, reprehenderit accusamus.<\\/p>\"}', '2021-01-28 05:34:09', '2022-11-08 01:06:12'),
(53, 27, 1, '{\"title\":\"Temporibus impeded quaerat atque dicta, accusantium pain.\",\"short_description\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incidunt ut labor et dolore plicabo. Nemo enim ipsam voluptatem quia voluptas sit aspertur aut odit aut quia consequuntur magni enim Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s,<\\/p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took.<\\/p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.<\\/p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took.unchanged.only Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.<\\/p>\"}', '2021-01-28 05:35:08', '2022-11-08 01:19:55'),
(54, 28, 1, '{\"title\":\"Temporibus impeded quaerat atque dicta, accusantium pain.\",\"short_description\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incidunt ut labor et dolore plicabo. Nemo enim ipsam voluptatem quia voluptas sit aspertur aut odit aut quia consequuntur magni enim Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s,<\\/p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took.<\\/p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.<\\/p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took.unchanged.only Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.<\\/p>\"}', '2021-01-28 05:36:28', '2022-11-08 01:20:55'),
(55, 29, 1, '{\"title\":\"Temporibus impeded quaerat atque dicta, accusantium pain.\",\"short_description\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incidunt ut labor et dolore plicabo. Nemo enim ipsam voluptatem quia voluptas sit aspertur aut odit aut quia consequuntur magni enim Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s,<\\/p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took.<\\/p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.<\\/p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took.unchanged.only Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.<\\/p>\"}', '2021-01-28 05:37:19', '2022-11-08 01:21:32'),
(56, 27, 2, '{\"title\":\"Temporibus impedit quaerat atque dicta, dolor accusantium.\",\"short_description\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incidunt ut labor et dolore plicabo. Nemo enim ipsam voluptatem quia voluptas sit aspertur aut odit aut quia consequuntur magni enim Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s,<\\/p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took.<\\/p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.<\\/p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took.unchanged.only Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.<\\/p>\"}', '2021-01-28 05:38:22', '2022-11-08 01:20:09'),
(57, 28, 2, '{\"title\":\"Discovery Incommode\",\"short_description\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incidunt ut labor et dolore plicabo. Nemo enim ipsam voluptatem quia voluptas sit aspertur aut odit aut quia consequuntur magni enim Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s,<\\/p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took.<\\/p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.<\\/p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took.unchanged.only Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.<\\/p>\"}', '2021-01-28 05:39:12', '2021-01-28 05:39:12'),
(58, 29, 2, '{\"title\":\"English Temporibus impedit quaerat atque dicta, dolor accusantium.\",\"short_description\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incidunt ut labor et dolore plicabo. Nemo enim ipsam voluptatem quia voluptas sit aspertur aut odit aut quia consequuntur magni enim Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s,<\\/p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took.<\\/p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.<\\/p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took.unchanged.only Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.<\\/p>\"}', '2021-01-28 05:39:28', '2022-11-08 01:21:44'),
(59, 30, 1, '{\"title\":\"Address\",\"short_description\":\"<p>CA 560 Bush St &amp; 20th Ave, <\\/p><p>Apt 5 San Francisco, 230909,\\u00a0<span>Canada<\\/span><\\/p>\"}', '2021-01-30 05:38:08', '2022-06-08 01:06:53'),
(60, 31, 1, '{\"title\":\"Email\",\"short_description\":\"<p>paysecure@email.com<\\/p><p>fax@email.com<\\/p>\"}', '2021-01-30 05:39:03', '2022-11-14 07:50:22'),
(61, 32, 1, '{\"title\":\"Phone\",\"short_description\":\"<p>+1 587 154756<\\/p><p>+44 5555 14574<\\/p>\"}', '2021-01-30 05:39:47', '2022-11-14 07:51:23'),
(69, 39, 1, '{\"title\":\"All Banks Supported\",\"short_description\":\"No setup fees, No late fees you only pay 5% transaction fee\"}', '2021-12-26 03:34:51', '2022-06-06 04:59:46'),
(70, 39, 2, '{\"title\":\"Todos los bancos compatibles\",\"short_description\":\"Sin tarifas de instalaci\\u00f3n, sin cargos por pagos atrasados, solo paga una tarifa de transacci\\u00f3n del 5%\"}', '2021-12-26 03:35:16', '2022-11-08 00:46:50'),
(71, 30, 2, '{\"title\":\"Direcci\\u00f3n\",\"short_description\":\"CA 560 Bush St &amp; amp; 20th Ave, Apt 5 San Francisco, 230909, Canad\\u00e1\"}', '2021-12-26 05:16:36', '2022-11-08 01:07:26'),
(72, 31, 2, '{\"title\":\"Correo electr\\u00f3nico\",\"short_description\":\"paysecure@email.com <br \\/> fax@email.com\"}', '2021-12-26 05:17:14', '2022-11-14 07:50:47'),
(73, 32, 2, '{\"title\":\"Tel\\u00e9fono\",\"short_description\":\"<p>+1 587 154756\\r\\n<\\/p><p>+44 5555 14574<\\/p>\"}', '2021-12-26 05:17:34', '2022-11-14 07:51:18'),
(74, 40, 1, '{\"title\":\"Terms And Conditions\",\"description\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<\\/p><p><br \\/><\\/p><p><br \\/><\\/p><p>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\"}', '2022-06-06 01:52:37', '2022-10-05 06:15:58'),
(75, 41, 1, '{\"title\":\"Privacy Policy\",\"description\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<\\/p><p><br \\/><\\/p><p><br \\/><\\/p><p>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\"}', '2022-06-06 01:52:58', '2022-06-06 01:52:58'),
(76, 42, 1, '{\"title\":\"Partner Directory\",\"description\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<\\/p><p><br \\/><\\/p><p><br \\/><\\/p><p>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\"}', '2022-06-06 01:53:35', '2022-06-06 01:53:35'),
(77, 43, 1, '{\"title\":\"Affiliate Program\",\"description\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<\\/p><p><br \\/><\\/p><p><br \\/><\\/p><p>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\"}', '2022-06-06 01:53:51', '2022-06-06 01:53:51'),
(78, 44, 1, '{\"title\":\"Free Invoice Generator\",\"description\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<\\/p><p><br \\/><\\/p><p><br \\/><\\/p><p>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\"}', '2022-06-06 01:54:05', '2022-06-06 01:54:05'),
(79, 45, 1, '{\"title\":\"Easy Reconciliation\",\"short_description\":\"<span>Registration only takes 5-10 min to complete and approval is instant<\\/span><br \\/>\"}', '2022-06-06 04:29:06', '2022-06-06 04:29:06'),
(81, 47, 1, '{\"title\":\"Create an Account\",\"short_description\":\"<p>Tempore quaerat eos possimus ullam accusamus delectus consequuntur nulla, perferendis voluptates expedita<br \\/><\\/p>\"}', '2022-06-06 05:18:26', '2022-06-06 05:18:26'),
(82, 48, 1, '{\"title\":\"Get Payments\",\"short_description\":\"<p>Tempore quaerat eos possimus ullam accusamus delectus consequuntur nulla, perferendis voluptates expedita<br \\/><\\/p>\"}', '2022-06-06 05:18:38', '2022-06-06 05:18:38'),
(83, 49, 1, '{\"title\":\"Happy and Withdraw\",\"short_description\":\"<p>Tempore quaerat eos possimus ullam accusamus delectus consequuntur nulla, perferendis voluptates expedita<br \\/><\\/p>\"}', '2022-06-06 05:18:56', '2022-06-06 05:18:56'),
(84, 50, 1, '{\"title\":\"Temporibus impeded quaerat atque dicta, accusantium pain.\",\"short_description\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incidunt ut labor et dolore plicabo. Nemo enim ipsam voluptatem quia voluptas sit aspertur aut odit aut quia consequuntur magni enim Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s,<\\/p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took.<\\/p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.<\\/p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took.unchanged.only Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.<\\/p>\"}', '2022-06-06 11:35:02', '2022-11-08 01:21:57'),
(85, 51, 1, '{\"title\":\"Beatae quisquam vero, voluptatum libero tenetur impeded quaerat atque dicta, accusantium pain.\",\"short_description\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incidunt ut labor et dolore plicabo. Nemo enim ipsam voluptatem quia voluptas sit aspertur aut odit aut quia consequuntur magni enim Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s,<\\/p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took.<\\/p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.<\\/p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took.unchanged.only Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.<\\/p>\"}', '2022-06-06 11:35:27', '2022-11-08 01:22:31'),
(86, 52, 1, '{\"title\":\"A Better Way To Make Payments\",\"sub_title\":\"Cum, voluptatem eligendi earum inventore sed, nobis tempora ratione architecto culpa.\",\"button_name\":\"Create Free Account\"}', '2022-06-07 22:43:11', '2022-06-07 23:00:04'),
(87, 53, 1, '{\"title\":\"A Better Way To Collect Payments\",\"sub_title\":\"Cum, voluptatem eligendi earum inventore sed, nobis tempora ratione architecto culpa.\",\"button_name\":\"Create Free Account\"}', '2022-06-07 23:00:37', '2022-06-07 23:00:37'),
(94, 52, 2, '{\"title\":\"Una mejor manera de hacer pagos\",\"sub_title\":\"Cum, voluptatem eligendi earum inventore sed, nobis tempora ratione architecto culpa.\",\"button_name\":\"Crea una cuenta gratis\"}', '2022-11-08 00:41:13', '2022-11-08 00:41:13'),
(95, 53, 2, '{\"title\":\"Una mejor manera de cobrar pagos\",\"sub_title\":\"Cum, voluptatem eligendi earum inventore sed, nobis tempora ratione architecto culpa.\",\"button_name\":\"Crea una cuenta gratis\"}', '2022-11-08 00:41:51', '2022-11-08 00:41:51'),
(96, 45, 2, '{\"title\":\"Reconciliaci\\u00f3n f\\u00e1cil\",\"short_description\":\"<p>El registro solo toma de 5 a 10 minutos para completarse y la aprobaci\\u00f3n es instant\\u00e1nea<br \\/><\\/p>\"}', '2022-11-08 00:47:48', '2022-11-08 00:47:48'),
(98, 47, 2, '{\"title\":\"Crea una cuenta\",\"short_description\":\"<p>Tempore quaerat eos possimus ullam accusamus delectus consequuntur nulla, perferendis voluptates expedita<br \\/><\\/p>\"}', '2022-11-08 00:57:08', '2022-11-08 00:57:08'),
(99, 48, 2, '{\"title\":\"Obtener pagos\",\"short_description\":\"<p>Tempore quaerat eos possimus ullam accusamus delectus consequuntur nulla, perferendis voluptates expedita<br \\/><\\/p>\"}', '2022-11-08 00:57:39', '2022-11-08 00:57:39'),
(100, 49, 2, '{\"title\":\"feliz y retra\\u00eddo\",\"short_description\":\"<p>Tempore quaerat eos possimus ullam accusamus delectus consequuntur nulla, perferendis voluptates expedita<br \\/><\\/p>\"}', '2022-11-08 00:58:14', '2022-11-08 00:58:14'),
(101, 40, 2, '{\"title\":\"T\\u00e9rminos y condiciones\",\"description\":\"<p>Es un hecho establecido desde hace mucho tiempo que un lector se distraer\\u00e1 con el contenido legible de una p\\u00e1gina cuando mire su dise\\u00f1o. El punto de usar Lorem Ipsum es que tiene una distribuci\\u00f3n de letras m\\u00e1s o menos normal, en lugar de usar \'Contenido aqu\\u00ed, contenido aqu\\u00ed\', lo que hace que parezca un ingl\\u00e9s legible. Muchos paquetes de autoedici\\u00f3n y editores de p\\u00e1ginas web ahora usan Lorem Ipsum como su modelo de texto predeterminado, y una b\\u00fasqueda de \'lorem ipsum\' descubrir\\u00e1 muchos sitios web que a\\u00fan est\\u00e1n en su infancia. Varias versiones han evolucionado a lo largo de los a\\u00f1os, a veces por accidente, a veces a prop\\u00f3sito (humor inyectado y cosas por el estilo). Es un hecho establecido desde hace mucho tiempo que un lector se distraer\\u00e1 con el contenido legible de una p\\u00e1gina cuando mire su dise\\u00f1o.<\\/p><p><br \\/><\\/p><p><br \\/><\\/p><p><br \\/><\\/p><p><br \\/><\\/p><p><br \\/><\\/p><p>El punto de usar Lorem Ipsum es que tiene una distribuci\\u00f3n de letras m\\u00e1s o menos normal, en lugar de usar \'Contenido aqu\\u00ed, contenido aqu\\u00ed\', lo que hace que parezca un ingl\\u00e9s legible. Muchos paquetes de autoedici\\u00f3n y editores de p\\u00e1ginas web ahora usan Lorem Ipsum como su modelo de texto predeterminado, y una b\\u00fasqueda de \'lorem ipsum\' descubrir\\u00e1 muchos sitios web que a\\u00fan est\\u00e1n en su infancia. Varias versiones han evolucionado a lo largo de los a\\u00f1os, a veces por accidente, a veces a prop\\u00f3sito (humor inyectado y cosas por el estilo). Es un hecho establecido desde hace mucho tiempo que un lector se distraer\\u00e1 con el contenido legible de una p\\u00e1gina cuando mire su dise\\u00f1o. El punto de usar Lorem Ipsum es que tiene una distribuci\\u00f3n de letras m\\u00e1s o menos normal, en lugar de usar \'Contenido aqu\\u00ed, contenido aqu\\u00ed\', lo que hace que parezca un ingl\\u00e9s legible. Muchos paquetes de autoedici\\u00f3n y editores de p\\u00e1ginas web ahora usan Lorem Ipsum como su modelo de texto predeterminado, y una b\\u00fasqueda de \'lorem ipsum\' descubrir\\u00e1 muchos sitios web que a\\u00fan est\\u00e1n en su infancia. Varias versiones han evolucionado a lo largo de los a\\u00f1os, a veces por accidente, a veces a prop\\u00f3sito (humor inyectado y cosas por el estilo).<\\/p>\"}', '2022-11-08 01:09:24', '2022-11-08 01:09:24');
INSERT INTO `content_details` (`id`, `content_id`, `language_id`, `description`, `created_at`, `updated_at`) VALUES
(102, 41, 2, '{\"title\":\"Pol\\u00edtica de privacidad\",\"description\":\"<p>Es un hecho establecido desde hace mucho tiempo que un lector se distraer\\u00e1 con el contenido legible de una p\\u00e1gina cuando mire su dise\\u00f1o. El punto de usar Lorem Ipsum es que tiene una distribuci\\u00f3n de letras m\\u00e1s o menos normal, en lugar de usar \'Contenido aqu\\u00ed, contenido aqu\\u00ed\', lo que hace que parezca un ingl\\u00e9s legible. Muchos paquetes de autoedici\\u00f3n y editores de p\\u00e1ginas web ahora usan Lorem Ipsum como su modelo de texto predeterminado, y una b\\u00fasqueda de \'lorem ipsum\' descubrir\\u00e1 muchos sitios web que a\\u00fan est\\u00e1n en su infancia. Varias versiones han evolucionado a lo largo de los a\\u00f1os, a veces por accidente, a veces a prop\\u00f3sito (humor inyectado y cosas por el estilo). Es un hecho establecido desde hace mucho tiempo que un lector se distraer\\u00e1 con el contenido legible de una p\\u00e1gina cuando mire su dise\\u00f1o.<\\/p><p><br \\/><\\/p><p>El punto de usar Lorem Ipsum es que tiene una distribuci\\u00f3n de letras m\\u00e1s o menos normal, en lugar de usar \'Contenido aqu\\u00ed, contenido aqu\\u00ed\', lo que hace que parezca un ingl\\u00e9s legible. Muchos paquetes de autoedici\\u00f3n y editores de p\\u00e1ginas web ahora usan Lorem Ipsum como su modelo de texto predeterminado, y una b\\u00fasqueda de \'lorem ipsum\' descubrir\\u00e1 muchos sitios web que a\\u00fan est\\u00e1n en su infancia. Varias versiones han evolucionado a lo largo de los a\\u00f1os, a veces por accidente, a veces a prop\\u00f3sito (humor inyectado y cosas por el estilo). Es un hecho establecido desde hace mucho tiempo que un lector se distraer\\u00e1 con el contenido legible de una p\\u00e1gina cuando mire su dise\\u00f1o. El punto de usar Lorem Ipsum es que tiene una distribuci\\u00f3n de letras m\\u00e1s o menos normal, en lugar de usar \'Contenido aqu\\u00ed, contenido aqu\\u00ed\', lo que hace que parezca un ingl\\u00e9s legible. Muchos paquetes de autoedici\\u00f3n y editores de p\\u00e1ginas web ahora usan Lorem Ipsum como su modelo de texto predeterminado, y una b\\u00fasqueda de \'lorem ipsum\' descubrir\\u00e1 muchos sitios web que a\\u00fan est\\u00e1n en su infancia. Varias versiones han evolucionado a lo largo de los a\\u00f1os, a veces por accidente, a veces a prop\\u00f3sito (humor inyectado y cosas por el estilo).<\\/p>\"}', '2022-11-08 01:10:11', '2022-11-08 01:10:11'),
(103, 42, 2, '{\"title\":\"Directorio de socios\",\"description\":\"<p>Es un hecho establecido desde hace mucho tiempo que un lector se distraer\\u00e1 con el contenido legible de una p\\u00e1gina cuando mire su dise\\u00f1o. El punto de usar Lorem Ipsum es que tiene una distribuci\\u00f3n de letras m\\u00e1s o menos normal, en lugar de usar \'Contenido aqu\\u00ed, contenido aqu\\u00ed\', lo que hace que parezca un ingl\\u00e9s legible. Muchos paquetes de autoedici\\u00f3n y editores de p\\u00e1ginas web ahora usan Lorem Ipsum como su modelo de texto predeterminado, y una b\\u00fasqueda de \'lorem ipsum\' descubrir\\u00e1 muchos sitios web que a\\u00fan est\\u00e1n en su infancia. Varias versiones han evolucionado a lo largo de los a\\u00f1os, a veces por accidente, a veces a prop\\u00f3sito (humor inyectado y cosas por el estilo). Es un hecho establecido desde hace mucho tiempo que un lector se distraer\\u00e1 con el contenido legible de una p\\u00e1gina cuando mire su dise\\u00f1o.<\\/p><p><br \\/><\\/p><p>El punto de usar Lorem Ipsum es que tiene una distribuci\\u00f3n de letras m\\u00e1s o menos normal, en lugar de usar \'Contenido aqu\\u00ed, contenido aqu\\u00ed\', lo que hace que parezca un ingl\\u00e9s legible. Muchos paquetes de autoedici\\u00f3n y editores de p\\u00e1ginas web ahora usan Lorem Ipsum como su modelo de texto predeterminado, y una b\\u00fasqueda de \'lorem ipsum\' descubrir\\u00e1 muchos sitios web que a\\u00fan est\\u00e1n en su infancia. Varias versiones han evolucionado a lo largo de los a\\u00f1os, a veces por accidente, a veces a prop\\u00f3sito (humor inyectado y cosas por el estilo). Es un hecho establecido desde hace mucho tiempo que un lector se distraer\\u00e1 con el contenido legible de una p\\u00e1gina cuando mire su dise\\u00f1o. El punto de usar Lorem Ipsum es que tiene una distribuci\\u00f3n de letras m\\u00e1s o menos normal, en lugar de usar \'Contenido aqu\\u00ed, contenido aqu\\u00ed\', lo que hace que parezca un ingl\\u00e9s legible. Muchos paquetes de autoedici\\u00f3n y editores de p\\u00e1ginas web ahora usan Lorem Ipsum como su modelo de texto predeterminado, y una b\\u00fasqueda de \'lorem ipsum\' descubrir\\u00e1 muchos sitios web que a\\u00fan est\\u00e1n en su infancia. Varias versiones han evolucionado a lo largo de los a\\u00f1os, a veces por accidente, a veces a prop\\u00f3sito (humor inyectado y cosas por el estilo).<\\/p>\"}', '2022-11-08 01:10:33', '2022-11-08 01:10:33'),
(104, 43, 2, '{\"title\":\"programa de afiliaci\\u00f3n\",\"description\":\"<p>Es un hecho establecido desde hace mucho tiempo que un lector se distraer\\u00e1 con el contenido legible de una p\\u00e1gina cuando mire su dise\\u00f1o. El punto de usar Lorem Ipsum es que tiene una distribuci\\u00f3n de letras m\\u00e1s o menos normal, en lugar de usar \'Contenido aqu\\u00ed, contenido aqu\\u00ed\', lo que hace que parezca un ingl\\u00e9s legible. Muchos paquetes de autoedici\\u00f3n y editores de p\\u00e1ginas web ahora usan Lorem Ipsum como su modelo de texto predeterminado, y una b\\u00fasqueda de \'lorem ipsum\' descubrir\\u00e1 muchos sitios web que a\\u00fan est\\u00e1n en su infancia. Varias versiones han evolucionado a lo largo de los a\\u00f1os, a veces por accidente, a veces a prop\\u00f3sito (humor inyectado y cosas por el estilo). Es un hecho establecido desde hace mucho tiempo que un lector se distraer\\u00e1 con el contenido legible de una p\\u00e1gina cuando mire su dise\\u00f1o.<\\/p><p><br \\/><\\/p><p>El punto de usar Lorem Ipsum es que tiene una distribuci\\u00f3n de letras m\\u00e1s o menos normal, en lugar de usar \'Contenido aqu\\u00ed, contenido aqu\\u00ed\', lo que hace que parezca un ingl\\u00e9s legible. Muchos paquetes de autoedici\\u00f3n y editores de p\\u00e1ginas web ahora usan Lorem Ipsum como su modelo de texto predeterminado, y una b\\u00fasqueda de \'lorem ipsum\' descubrir\\u00e1 muchos sitios web que a\\u00fan est\\u00e1n en su infancia. Varias versiones han evolucionado a lo largo de los a\\u00f1os, a veces por accidente, a veces a prop\\u00f3sito (humor inyectado y cosas por el estilo). Es un hecho establecido desde hace mucho tiempo que un lector se distraer\\u00e1 con el contenido legible de una p\\u00e1gina cuando mire su dise\\u00f1o. El punto de usar Lorem Ipsum es que tiene una distribuci\\u00f3n de letras m\\u00e1s o menos normal, en lugar de usar \'Contenido aqu\\u00ed, contenido aqu\\u00ed\', lo que hace que parezca un ingl\\u00e9s legible. Muchos paquetes de autoedici\\u00f3n y editores de p\\u00e1ginas web ahora usan Lorem Ipsum como su modelo de texto predeterminado, y una b\\u00fasqueda de \'lorem ipsum\' descubrir\\u00e1 muchos sitios web que a\\u00fan est\\u00e1n en su infancia. Varias versiones han evolucionado a lo largo de los a\\u00f1os, a veces por accidente, a veces a prop\\u00f3sito (humor inyectado y cosas por el estilo).<\\/p>\"}', '2022-11-08 01:11:00', '2022-11-08 01:11:00'),
(105, 44, 2, '{\"title\":\"Generador de Facturas Gratis\",\"description\":\"<p>Es un hecho establecido desde hace mucho tiempo que un lector se distraer\\u00e1 con el contenido legible de una p\\u00e1gina cuando mire su dise\\u00f1o. El punto de usar Lorem Ipsum es que tiene una distribuci\\u00f3n de letras m\\u00e1s o menos normal, en lugar de usar \'Contenido aqu\\u00ed, contenido aqu\\u00ed\', lo que hace que parezca un ingl\\u00e9s legible. Muchos paquetes de autoedici\\u00f3n y editores de p\\u00e1ginas web ahora usan Lorem Ipsum como su modelo de texto predeterminado, y una b\\u00fasqueda de \'lorem ipsum\' descubrir\\u00e1 muchos sitios web que a\\u00fan est\\u00e1n en su infancia. Varias versiones han evolucionado a lo largo de los a\\u00f1os, a veces por accidente, a veces a prop\\u00f3sito (humor inyectado y cosas por el estilo). Es un hecho establecido desde hace mucho tiempo que un lector se distraer\\u00e1 con el contenido legible de una p\\u00e1gina cuando mire su dise\\u00f1o.<\\/p><p><br \\/><\\/p><p>El punto de usar Lorem Ipsum es que tiene una distribuci\\u00f3n de letras m\\u00e1s o menos normal, en lugar de usar \'Contenido aqu\\u00ed, contenido aqu\\u00ed\', lo que hace que parezca un ingl\\u00e9s legible. Muchos paquetes de autoedici\\u00f3n y editores de p\\u00e1ginas web ahora usan Lorem Ipsum como su modelo de texto predeterminado, y una b\\u00fasqueda de \'lorem ipsum\' descubrir\\u00e1 muchos sitios web que a\\u00fan est\\u00e1n en su infancia. Varias versiones han evolucionado a lo largo de los a\\u00f1os, a veces por accidente, a veces a prop\\u00f3sito (humor inyectado y cosas por el estilo). Es un hecho establecido desde hace mucho tiempo que un lector se distraer\\u00e1 con el contenido legible de una p\\u00e1gina cuando mire su dise\\u00f1o. El punto de usar Lorem Ipsum es que tiene una distribuci\\u00f3n de letras m\\u00e1s o menos normal, en lugar de usar \'Contenido aqu\\u00ed, contenido aqu\\u00ed\', lo que hace que parezca un ingl\\u00e9s legible. Muchos paquetes de autoedici\\u00f3n y editores de p\\u00e1ginas web ahora usan Lorem Ipsum como su modelo de texto predeterminado, y una b\\u00fasqueda de \'lorem ipsum\' descubrir\\u00e1 muchos sitios web que a\\u00fan est\\u00e1n en su infancia. Varias versiones han evolucionado a lo largo de los a\\u00f1os, a veces por accidente, a veces a prop\\u00f3sito (humor inyectado y cosas por el estilo).<\\/p>\"}', '2022-11-08 01:11:30', '2022-11-08 01:11:30'),
(106, 50, 2, '{\"title\":\"Temporibus impedit quaerat atque dicta, dolor accusantium.\",\"short_description\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incidunt ut labor et dolore plicabo. Nemo enim ipsam voluptatem quia voluptas sit aspertur aut odit aut quia consequuntur magni enim Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s,<\\/p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took.<\\/p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.<\\/p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took.unchanged.only Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.<\\/p>\"}', '2022-11-08 01:22:13', '2022-11-08 01:22:13'),
(107, 51, 2, '{\"title\":\"Beatae quisquam vero, voluptatum libero tenetur impedit quaerat atque dicta, dolor accusantium.\",\"short_description\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incidunt ut labor et dolore plicabo. Nemo enim ipsam voluptatem quia voluptas sit aspertur aut odit aut quia consequuntur magni enim Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s,<\\/p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took.<\\/p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.<\\/p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took.unchanged.only Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\u2019s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.<\\/p>\"}', '2022-11-08 01:22:46', '2022-11-08 01:22:46'),
(110, 63, 1, '{\"title\":\"Fully Featured Sandbox\",\"short_description\":\"<p>No setup fees, no late fees, just pay a 5% transaction fee<br \\/><\\/p>\"}', '2022-11-14 10:15:06', '2022-11-14 10:15:06'),
(111, 63, 2, '{\"title\":\"Sandbox con todas las funciones\",\"short_description\":\"<p>No setup fees, no late fees, just pay a 5% transaction fee<br \\/><\\/p>\"}', '2022-11-14 10:15:21', '2022-11-14 10:15:21');

-- --------------------------------------------------------

--
-- Table structure for table `content_media`
--

CREATE TABLE `content_media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content_media`
--

INSERT INTO `content_media` (`id`, `content_id`, `description`, `created_at`, `updated_at`) VALUES
(2, 2, '{\"image\":\"629dd62ab2c651654511146.png\"}', '2021-01-27 01:56:36', '2022-06-06 04:25:46'),
(3, 3, '{\"image\":\"629dd6634cc581654511203.png\"}', '2021-01-27 01:58:28', '2022-06-06 04:26:43'),
(4, 4, '{\"image\":\"629dd6804ccea1654511232.png\"}', '2021-01-27 05:07:27', '2022-06-06 04:27:12'),
(5, 7, '{\"image\":\"629e51baad79c1654542778.png\"}', '2021-01-27 05:23:07', '2022-06-06 13:12:58'),
(6, 8, '{\"image\":\"629e51d016eaa1654542800.png\"}', '2021-01-27 05:23:29', '2022-06-06 13:13:20'),
(7, 9, '{\"image\":\"629e51d8d917c1654542808.png\"}', '2021-01-27 05:23:46', '2022-06-06 13:13:28'),
(8, 10, '{\"image\":\"629e51e3161ec1654542819.png\"}', '2021-01-27 05:24:22', '2022-06-06 13:13:39'),
(9, 11, '{\"image\":\"629e51ebd0a771654542827.png\"}', '2021-01-27 05:24:55', '2022-06-06 13:13:47'),
(10, 12, '{\"image\":\"629e51f5362d21654542837.png\"}', '2021-01-27 05:25:18', '2022-06-06 13:13:57'),
(11, 22, '{\"image\":\"629deb034de0f1654516483.png\"}', '2021-01-28 02:14:47', '2022-06-06 05:54:43'),
(12, 23, '{\"image\":\"629deb5e9cef61654516574.png\"}', '2021-01-28 02:15:44', '2022-06-06 05:56:14'),
(13, 24, '{\"image\":\"629deb735bfd11654516595.png\"}', '2021-01-28 02:16:15', '2022-06-06 05:56:35'),
(14, 25, '{\"image\":\"60128756a35a41611827030.jpg\"}', '2021-01-28 03:43:50', '2021-01-28 03:43:50'),
(15, 26, '{\"image\":\"629e3922c0a7c1654536482.jpg\"}', '2021-01-28 05:33:36', '2022-06-06 11:28:02'),
(16, 27, '{\"image\":\"629ded25b22be1654517029.jpg\"}', '2021-01-28 05:35:08', '2022-06-06 06:03:49'),
(17, 28, '{\"image\":\"629e3a86614bc1654536838.jpg\"}', '2021-01-28 05:36:28', '2022-06-06 11:33:58'),
(18, 29, '{\"image\":\"629e3a9edbe271654536862.jpg\"}', '2021-01-28 05:37:19', '2022-06-06 11:34:22'),
(19, 30, '{\"image\":\"62a04e4db29a81654672973.png\"}', '2021-01-30 05:38:08', '2022-06-08 01:22:53'),
(20, 31, '{\"image\":\"6023c6ce6392c1612957390.png\"}', '2021-01-30 05:39:03', '2021-02-10 05:43:10'),
(21, 32, '{\"image\":\"6023c6bca091e1612957372.png\"}', '2021-01-30 05:39:47', '2021-02-10 05:42:52'),
(22, 33, '{\"social_icon\":\"fab fa-facebook-f\",\"social_link\":\"https:\\/\\/victor-valencia.github.io\\/bootstrap-iconpicker\\/\"}', '2021-01-30 06:53:34', '2021-01-30 07:20:14'),
(23, 34, '{\"social_icon\":\"fab fa-twitter\",\"social_link\":\"https:\\/\\/victor-valencia.github.io\\/bootstrap-iconpicker\\/\"}', '2021-01-30 07:20:36', '2021-01-30 07:20:36'),
(24, 35, '{\"social_icon\":\"fab fa-google-plus-g\",\"social_link\":\"https:\\/\\/victor-valencia.github.io\\/bootstrap-iconpicker\\/\"}', '2021-01-30 07:20:50', '2021-01-30 07:20:50'),
(25, 36, '{\"social_icon\":\"fab fa-pinterest-p\",\"social_link\":\"https:\\/\\/victor-valencia.github.io\\/bootstrap-iconpicker\\/\"}', '2021-01-30 07:21:18', '2021-01-30 07:21:18'),
(26, 37, '{\"social_icon\":\"fab fa-instagram\",\"social_link\":\"https:\\/\\/victor-valencia.github.io\\/bootstrap-iconpicker\\/\"}', '2021-01-30 07:21:32', '2021-01-30 07:21:32'),
(28, 39, '{\"image\":\"629dd6b1e39111654511281.png\"}', '2021-12-26 03:34:52', '2022-06-06 04:28:01'),
(29, 45, '{\"image\":\"629dd6f2c6e8c1654511346.png\"}', '2022-06-06 04:29:06', '2022-06-06 04:29:06'),
(31, 50, '{\"image\":\"629e3ac6db12d1654536902.jpg\"}', '2022-06-06 11:35:02', '2022-06-06 11:35:02'),
(32, 51, '{\"image\":\"629e3adf8d4321654536927.jpg\"}', '2022-06-06 11:35:27', '2022-06-06 11:35:27'),
(33, 52, '{\"image\":\"62a028df0ab1a1654663391.png\",\"button_link\":\"http:\\/\\/localhost\\/wallet-pro\\/user\\/login\"}', '2022-06-07 22:43:11', '2022-06-07 22:58:46'),
(34, 53, '{\"image\":\"62a02cf5de0de1654664437.png\",\"button_link\":\"http:\\/\\/localhost\\/wallet-pro\\/user\\/login\"}', '2022-06-07 23:00:38', '2022-06-07 23:00:38'),
(41, 63, '{\"image\":\"6372698abebd91668442506.png\"}', '2022-11-14 10:15:06', '2022-11-14 10:15:06');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `symbol` varchar(10) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `exchange_rate` decimal(20,8) NOT NULL DEFAULT 0.00000000,
  `is_active` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = active, 0 = inactive',
  `currency_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = crypto, 1 = Fiat',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `logo`, `exchange_rate`, `is_active`, `currency_type`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', '$', 'USD', 'usd.png', '1.00000000', 1, 1, '2023-03-16 00:36:49', '2023-03-16 00:37:41');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `depositable_id` int(11) DEFAULT NULL,
  `depositable_type` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `charges_limit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_method_currency` varchar(255) DEFAULT NULL,
  `amount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `percentage` decimal(18,8) NOT NULL DEFAULT 0.00000000 COMMENT 'Percent of charge',
  `charge_percentage` decimal(18,8) NOT NULL DEFAULT 0.00000000 COMMENT 'After adding percent of charge',
  `charge_fixed` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(18,8) NOT NULL DEFAULT 0.00000000 COMMENT 'Total charge',
  `payable_amount` decimal(18,8) NOT NULL DEFAULT 0.00000000 COMMENT 'Amount payed',
  `btc_amount` decimal(18,8) DEFAULT NULL,
  `btc_wallet` varchar(255) DEFAULT NULL,
  `utr` char(36) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=Success,0=Pending',
  `note` text DEFAULT NULL,
  `card_order_id` int(11) DEFAULT NULL COMMENT 'virtual card order table id',
  `payment_id` varchar(61) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mode` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>all,1=>test',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `disputes`
--

CREATE TABLE `disputes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `disputable_id` bigint(20) DEFAULT NULL,
  `disputable_type` varchar(255) DEFAULT NULL,
  `utr` char(36) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 0 COMMENT '0 = open,1 = solved,2 = closed',
  `defender_reply_yn` tinyint(4) DEFAULT NULL COMMENT '0 = No, 1 = Yes',
  `claimer_reply_yn` tinyint(4) DEFAULT NULL COMMENT '0 = No, 1 = Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dispute_details`
--

CREATE TABLE `dispute_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dispute_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0 = user replied ,1 = admin replied',
  `message` text DEFAULT NULL,
  `files` text DEFAULT NULL,
  `action` tinyint(4) DEFAULT NULL COMMENT '0 = solved,1 = closed,2 = mute,3 = unmute',
  `utr` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED DEFAULT NULL,
  `template_key` varchar(120) DEFAULT NULL,
  `email_from` varchar(191) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `template` text DEFAULT NULL,
  `sms_body` text DEFAULT NULL,
  `short_keys` text DEFAULT NULL,
  `mail_status` tinyint(1) NOT NULL DEFAULT 0,
  `sms_status` tinyint(1) NOT NULL DEFAULT 0,
  `lang_code` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `language_id`, `template_key`, `email_from`, `name`, `subject`, `template`, `sms_body`, `short_keys`, `mail_status`, `sms_status`, `lang_code`, `created_at`, `updated_at`) VALUES
(1, 1, 'TRANSFER_TO', 'support@example.com', 'Send money to', 'Your Account has been credited', '[[sender]] send money to your account amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '[[sender]] send money to your account amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Sender Name\",\"amount\":\"Received Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(2, 1, 'TRANSFER_FROM', 'support@example.com', 'Send money from', 'Your Account has been debited', 'You have send money to [[receiver]] account amount [[amount]] [[currency]].Transaction: #[[transaction]]', 'You have send money to [[receiver]] account amount [[amount]] [[currency]].Transaction: #[[transaction]]', '{\"receiver\":\"Receiver Name\",\"amount\":\"Send Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(3, 1, 'REQUEST_MONEY_INIT', 'support@example.com', 'Request Money Initialise', 'Request to send money', '[[sender]] request for send money to account amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '[[sender]] request for send money to account amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Sender Name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(4, 1, 'REQUEST_MONEY_CONFIRM', 'support@example.com', 'Request Money Confirm', 'Request to send money', '[[sender]] confirm your request money amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '[[sender]] confirm your request money amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Sender Name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(5, 1, 'REQUEST_MONEY_CANCEL', 'support@example.com', 'Request Money Cancel', 'Request to send money', '[[sender]] cancel your request money amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '[[sender]] cancel your request money amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Sender Name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(6, 1, 'MONEY_EXCHANGE', 'support@example.com', 'Money Exchange', 'Exchange Money', 'You are exchange [[from_amount]] [[from_currency]] to [[to_amount]] [[to_currency]]. Transaction: #[[transaction]]', 'You are exchange [[from_amount]] [[from_currency]] to [[to_amount]] [[to_currency]]. Transaction: #[[transaction]]', '{\"from_amount\":\"Amount Exchange From\",\"from_currency\":\"Currency Exchange From\",\"to_amount\":\"Amount Exchange To\",\"to_currency\":\"Currency Exchange To\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(7, 1, 'REDEEM_CODE_GENERATE', 'support@example.com', 'Redeem Code Generate', 'Redeem Code Generate', 'You have generate a redeem code amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'You have generate a redeem code amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Redeem Code\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(8, 1, 'REDEEM_CODE_USED_BY', 'support@example.com', 'Redeem code used by', 'Redeem Code Used', 'You have used a redeem code amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'You have used a redeem code amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Redeem Code\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(9, 1, 'REDEEM_CODE_SENDER', 'support@example.com', 'Redeem Code Sender', 'Redeem Code Used', '[[receiver]] used your redeem code amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '[[receiver]] used your redeem code amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"receiver\":\"Receiver Name who used code\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(10, 1, 'ESCROW_REQUEST_SENDER', 'support@example.com', 'Escrow request sender', 'Escrow request initiated', 'Your escrow request to [[receiver]] amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'Your escrow request to [[receiver]] amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"receiver\":\"Receiver Name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(11, 1, 'ESCROW_REQUEST_RECEIVER', 'support@example.com', 'Escrow request receiver', 'Escrow request generated', 'You have escrow request from [[sender]] amount [[amount]] [[currency]] . Transaction: #[[transaction]] click to view [[link]]', 'You have escrow request from [[sender]] amount [[amount]] [[currency]] . Transaction: #[[transaction]] click to view [[link]]', '{\"sender\":\"Sender Name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\",\"link\":\"Action Link\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(12, 1, 'ESCROW_REQUEST_ACCEPT_FROM', 'support@example.com', 'Escrow Request Accept from', 'Escrow Request Accept from', '[[sender]] accept your request amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '[[sender]] accept your request amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Request sender Name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(13, 1, 'ESCROW_REQUEST_ACCEPT_BY', 'support@example.com', 'Escrow Request Accept by', 'Escrow Request Accept by you', 'You accept escrow request amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'You accept escrow request amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(14, 1, 'ESCROW_REQUEST_CANCEL_FROM', 'support@example.com', 'Escrow Request Cancel from', 'Escrow Request Cancel from', '[[sender]] Cancel your request amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '[[sender]] Cancel your request amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Request sender Name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(15, 1, 'ESCROW_REQUEST_CANCEL_BY', 'support@example.com', 'Escrow Request Cancel by', 'Escrow Request Cancel by you', 'You Cancel escrow request amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'You Cancel escrow request amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(16, 1, 'ESCROW_PAYMENT_DISBURSED_REQUEST_FROM', 'support@example.com', 'Escrow payment disburse request from', 'Escrow payment disburse request from', '[[sender]] request to disburse your amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '[[sender]] request to disburse your amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Request sender Name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(17, 1, 'ESCROW_PAYMENT_DISBURSED_REQUEST_BY', 'support@example.com', 'request to payment disburse request by', 'Escrow payment disburse request by you', 'You request escrow disburse amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'You request escrow disburse amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(18, 1, 'ESCROW_PAYMENT_DISBURSED_FROM', 'support@example.com', 'Escrow payment disburse from', 'Escrow payment disburse from', '[[sender]] disburse your request amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '[[sender]] disburse your request amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Request sender Name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(19, 1, 'ESCROW_PAYMENT_DISBURSED_BY', 'support@example.com', 'request to payment disburse by', 'Escrow payment disburse by you', 'You disburse escrow request amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'You disburse escrow request amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(20, 1, 'DISPUTE_REQUEST_TO_ADMIN', 'support@example.com', 'Dispute request to admin', 'Dispute request to admin', '[[sender]] dispute escrow request amount [[amount]] [[currency]] . Transaction: #[[transaction]] click to reply [[link]]', '[[sender]] dispute escrow request amount [[amount]] [[currency]] . Transaction: #[[transaction]] click to reply [[link]]', '{\"sender\":\"Sender Name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\",\"link\":\"Dispute reply link\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(21, 1, 'DISPUTE_REQUEST_TO_USER', 'support@example.com', 'Dispute request to user', 'Dispute request to user', '[[sender]] reply dispute escrow request amount. Transaction: #[[transaction]] click to reply [[link]]', '[[sender]] reply dispute escrow request amount. Transaction: #[[transaction]] click to reply [[link]]', '{\"sender\":\"Sender Name\",\"transaction\":\"Transaction Number\",\"link\":\"Dispute reply link\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(22, 1, 'VOUCHER_PAYMENT_REQUEST_TO', 'support@example.com', 'Voucher payment request to', 'Voucher payment request to', '[[sender]] request to voucher payment amount [[amount]] [[currency]] . Transaction: #[[transaction]] click to payment [[link]]', '[[sender]] request to voucher payment amount [[amount]] [[currency]] . Transaction: #[[transaction]] click to payment [[link]]', '{\"sender\":\"Sender Name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\",\"link\":\"Dispute reply link\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(23, 1, 'VOUCHER_PAYMENT_REQUEST_FROM', 'support@example.com', 'Voucher payment request from', 'Voucher payment request from', 'You request to [[receiver]] voucher payment amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'You request to [[receiver]] voucher payment amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"receiver\":\"Receiver Name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(24, 1, 'VOUCHER_PAYMENT_TO', 'support@example.com', 'Voucher payment to', 'Voucher payment to', '[[receiver]] payment to your voucher amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '[[receiver]] payment to your voucher amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"receiver\":\"Request receiver name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(25, 1, 'VOUCHER_PAYMENT_FROM', 'support@example.com', 'Voucher payment from', 'Voucher payment from', 'You payment to [[sender]] voucher amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'You payment to [[sender]] voucher amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Request sender Name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(26, 1, 'VOUCHER_PAYMENT_CANCEL_TO', 'support@example.com', 'Voucher payment cancel to', 'Voucher payment cancel to', '[[receiver]] payment cancel to your voucher amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '[[receiver]] payment cancel to your voucher amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"receiver\":\"Request receiver name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(27, 1, 'VOUCHER_PAYMENT_CANCEL_FROM', 'support@example.com', 'Voucher payment cancel from', 'Voucher payment cancel from', 'You payment cancel to [[sender]] voucher amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'You payment cancel to [[sender]] voucher amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Request sender Name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(28, 1, 'PAYOUT_REQUEST_TO_ADMIN', 'support@example.com', 'Payout Request Admin', 'Payout Request Admin', '[[sender]] request for payment amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '[[sender]] request for payment amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Sender Name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(29, 1, 'PAYOUT_REQUEST_FROM', 'support@example.com', 'Payout Request from', 'Payout Request from', 'You request for payout amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(30, 1, 'PAYOUT_CONFIRM', 'support@example.com', 'Payout Confirm', 'Payout Confirm', '[[sender]] confirm your payout amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '[[sender]] confirm your payout amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Sender Name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(31, 1, 'PAYOUT_CANCEL', 'support@example.com', 'Payout Cancel', 'Payout Cancel', '[[sender]] cancel your payout amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '[[sender]] cancel your payout amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Sender Name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(32, 1, 'ADD_FUND_USER_USER', 'support@example.com', 'Add Fund user user', 'Add fund user', 'you add fund money amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'you add fund money amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(33, 1, 'ADD_FUND_USER_ADMIN', 'support@example.com', 'Add Fund user admin', 'Add fund by user', '[[user]] add fund money amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '[[user]] add fund money amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"user\":\"User full name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(34, 1, 'VERIFICATION_CODE', 'support@example.com', 'Verification Code', 'verify your email', 'Your email verification code [[code]]', 'Your sms verification code [[code]]', '{\"code\":\"code\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(35, 1, 'DEPOSIT_BONUS', 'support@example.com', 'Deposit Bonus', 'Deposit Bonus', 'Deposit Commission From [[sender]] amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'Deposit Commission From [[sender]] amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Sender Name\",\"amount\":\"Received Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(36, 1, 'LOGIN_BONUS', 'support@example.com', 'Login Bonus', 'Login Bonus', 'Login Commission From [[sender]] amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'Login Commission From [[sender]] amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Sender Name\",\"amount\":\"Received Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(37, 2, 'ADD_FUND_USER_ADMIN', 'support@example.com', 'Add Fund user admin', 'Add fund by user', '[[user]] add fund money amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '[[user]] add fund money amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"user\":\"User full name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'es', '2021-03-17 09:00:26', '2023-03-15 23:38:29'),
(39, 1, 'PASSWORD_RESET', 'support@example.com', 'Reset Password Notification', 'Reset Password Notification', 'You are receiving this email because we received a password reset request for your account.[[message]]\r\n\r\n\r\nThis password reset link will expire in 60 minutes.\r\n\r\nIf you did not request a password reset, no further action is required.', 'You are receiving this email because we received a password reset request for your account. [[message]]', '{\"message\":\"message\"}', 1, 1, 'en', '2021-10-31 05:27:16', '2023-03-15 23:38:29'),
(40, 2, 'DEPOSIT_BONUS', 'support@example.com', 'Deposit Bonus', 'Deposit Bonus', 'Deposit Commission From [[sender]] amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'Deposit Commission From [[sender]] amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Sender Name\",\"amount\":\"Received Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'es', '2022-06-25 01:08:31', '2023-03-15 23:38:29'),
(42, 2, 'ESCROW_PAYMENT_DISBURSED_REQUEST_BY', 'support@example.com', 'request to payment disburse request by', 'Escrow payment disburse request by you', 'You request escrow disburse amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'You request escrow disburse amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'es', '2022-06-29 00:28:29', '2023-03-15 23:38:29'),
(43, 2, 'ESCROW_REQUEST_ACCEPT_BY', 'support@example.com', 'Escrow Request Accept by', 'Escrow Request Accept by you', 'You accept escrow request amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'You accept escrow request amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'es', '2022-12-06 02:27:58', '2023-03-15 23:38:29'),
(44, 1, 'INVOICE_PAYMENT_TO', 'support@example.com', 'Invoice payment to', 'Invoice payment to', '[[receiver]] payment to your invoice amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '[[receiver]] payment to your invoice amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"receiver\":\"Request receiver name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(45, 1, 'INVOICE_PAYMENT_FROM', 'support@example.com', 'Invoice payment from', 'Invoice payment from', 'You payment to [[sender]] invoice amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'You payment to [[sender]] invoice amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Request sender Name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(46, 1, 'KYC_APPROVE', 'support@example.com', 'KYC Approved', 'Your KYC has been approved', 'Your KYC has been approved', 'Your KYC has been approved', '', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(47, 1, 'KYC_REJECT', 'support@example.com', 'KYC Rejected', 'Your KYC has been rejected', 'Your KYC has been rejected', 'Your KYC has been rejected', '', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(48, 1, 'PRODUCT_ORDER', 'support@example.com', 'Product Order', 'Product Order', 'you have a new order amount [[amount]] [[currency]] payment has been complete . Order Number: #[[orderNumber]]', 'you have a new order amount [[amount]] [[currency]] payment has been complete . Order Number: #[[orderNumber]]', '{\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"orderNumber\":\"orderNumber\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(49, 1, 'PRODUCT_ORDER_BUYER', 'support@example.com', 'Product Order Buyer', 'Product Order Buyer', 'Amount [[amount]] [[currency]] payment has been complete . Order Number: #[[orderNumber]]', 'Amount [[amount]] [[currency]] payment has been complete . Order Number: #[[orderNumber]]', '{\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"orderNumber\":\"orderNumber\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(50, 1, 'CONTACT_MESSAGE', 'support@example.com', 'Contact Message', 'Contact Message', 'Store [[store]] send message from [[sender]]\r\nMessage: [[message]]', 'Store [[store]] send message from [[sender]]\r\nMessage: [[message]]', '{\"storeName\":\"storeName\",\"senderName\":\"senderName\",\"message\":\"message\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(51, 1, 'QR_PAYMENT_TO', 'support@example.com', 'QR payment to', 'QR payment to', 'Amount [[amount]][[currency]] payment from [[email]] by QR Code', 'Amount [[amount]][[currency]] payment from [[email]] by QR Code', '{\"email\":\"email\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(52, 1, 'QR_PAYMENT_FROM', 'support@example.com', 'QR payment from', 'QR payment from', 'Amount [[amount]][[currency]] payment for [[sender]] by QR Code', 'Amount [[amount]][[currency]] payment for [[sender]] by QR Code', '{\"sender\":\"sender\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(53, 1, 'VIRTUAL_CARD_APPLY', 'support@example.com', 'Virtual Card Apply', 'Virtual Card Apply', 'Amount [[amount]][[currency]] payment for virtual card from wallet', 'Amount [[amount]][[currency]] payment for virtual card from wallet', '{\"amount\":\"amount\",\"currency\":\"Request Currency\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(54, 1, 'ADMIN_VIRTUAL_CARD_APPLY', 'support@example.com', 'Admin Virtual Card Apply', 'Admin Virtual Card Apply', 'Amount [[amount]][[currency]] payment for virtual card by [[username]]', 'Amount [[amount]][[currency]] payment for virtual card by [[username]]', '{\"amount\":\"amount\",\"currency\":\"Request Currency\",\"username\":\"username\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(55, 1, 'VIRTUAL_CARD_REJECTED', 'support@example.com', 'Virtual Card Rejected', 'Virtual Card Rejected', 'Virtual card request has been rejected Amount [[amount]][[currency]] payment for virtual card has been return', 'Virtual card request has been rejected Amount [[amount]][[currency]] payment for virtual card has been return', '{\"amount\":\"amount\",\"currency\":\"Request Currency\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(56, 1, 'VIRTUAL_CARD_APPROVE', 'support@example.com', 'Virtual Card Approve', 'Virtual Card Approve', 'Virtual card request has been approved. Your Card credential are :- \r\nName On Card : [[name_on_card]]\r\nCard Id : [[card_id]]\r\nCVV : [[cvv]]\r\nCard Number : [[card_number]]\r\nBrand : [[brand]]\r\nExpiry Date : [[expiry_date]]\r\nBalance : [[balance]] [[currency]]', 'Virtual card request has been approved. Your Card credential are :- \r\nName On Card : [[name_on_card]]\r\nCard Id : [[card_id]]\r\nCVV : [[cvv]]\r\nCard Number : [[card_number]]\r\nBrand : [[brand]]\r\nExpiry Date : [[expiry_date]]\r\nBalance : [[balance]] [[currency]]', '{\"name_on_card\":\"name_on_card\",\"card_id\":\"card_id\",\"cvv\":\"cvv\",\"card_number\":\"card_number\",\"brand\":\"brand\",\"expiry_date\":\"expiry_date\",\"balance\":\"balance\",\"currency\":\"currency\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(57, 1, 'VIRTUAL_CARD_FUND_RETURN', 'support@example.com', 'Virtual Card Fund Return', 'Virtual Card Fund Return', 'Virtual card fund request [[amount [[currency]] has been return card number: [[cardNumber]]', 'Virtual card fund request [[amount [[currency]] has been return card number: [[cardNumber]]', '{\"amount\":\"amount\",\"currency\":\"Request Currency\",\"cardNumber\":\"cardNumber\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(58, 1, 'VIRTUAL_CARD_FUND_APPROVE', 'support@example.com', 'Virtual Card Fund Approve', 'Virtual Card Fund Approve', 'Virtual card fund request [[amount [[currency]] has been approved card number: [[cardNumber]]', 'Virtual card fund request [[amount [[currency]] has been approved card number: [[cardNumber]]', '{\"amount\":\"amount\",\"currency\":\"Request Currency\",\"cardNumber\":\"cardNumber\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(59, 1, 'VIRTUAL_CARD_UNBLOCK', 'support@example.com', 'Virtual Card Un-Block', 'Virtual Card Un-Block', 'Your Card has been un-blocked card number-[[cardNumber]]', 'Your Card has been un-blocked card number-[[cardNumber]]', '{\"cardNumber\":\"cardNumber\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(60, 1, 'VIRTUAL_CARD_BLOCK', 'support@example.com', 'Virtual Card Block', 'Virtual Card Un-Block', 'Your Card has been blocked card number-[[cardNumber]]', 'Your Card has been blocked card number-[[cardNumber]]', '{\"cardNumber\":\"cardNumber\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(61, 1, 'BILL_PAYMENT_RETURN', 'support@example.com', 'Bill Payment Return', 'Bill Payment Return', 'your bill pay [[amount]] [[currency]] has been return in [[return_currency]] wallet.\r\nreturn amount [[return_currency_amount]] [[return_currency]]', 'your bill pay [[amount]] [[currency]] has been return in [[return_currency]] wallet.\r\nreturn amount [[return_currency_amount]] [[return_currency]]', '{\"amount\":\"amount\",\"currency\":\"currency\",\"return_currency_amount\":\"return_currency_amount\",\"return_currency\":\"return_currency\",\"transaction\":\"transaction\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(62, 1, 'BILL_PAY', 'support@example.com', 'Bill Pay', 'Bill Pay', '[[amount]] [[currency]] for bill. Transaction: #[[transaction]]', '[[amount]] [[currency]] for bill. Transaction: #[[transaction]]', '{\"amount\":\"amount\",\"amount\":\"Request Amount\",\"currency\":\"currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(63, 1, 'PAYOUT_FAIL', 'support@example.com', 'Payout Fail', 'Payout Fail', '[[sender]] fail your payout amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '[[sender]] fail your payout amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Sender Name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(64, 1, 'API_PAYMENT', 'support@example.com', 'Api Payment', 'Api Payment', 'you got payment from api amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'you got payment from api amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(65, 1, 'TWO_STEP_ENABLED', 'support@example.com', 'TWO STEP ENABLED', 'TWO STEP ENABLED', 'Your verification code is: [[code]]', 'Your verification code is: [[code]]', '{\"action\":\"Enabled Or Disable\",\"ip\":\"Device Ip\",\"browser\":\"browser and Operating System \",\"time\":\"Time\",\"code\":\"code\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29'),
(66, 1, 'TWO_STEP_DISABLED', 'support@example.com', 'TWO STEP DISABLED', 'TWO STEP DISABLED', 'Google two factor verification is disabled', 'Google two factor verification is disabled', '{\"action\":\"Enabled Or Disable\",\"ip\":\"Device Ip\",\"browser\":\"browser and Operating System \",\"time\":\"Time\"}', 1, 1, 'en', NULL, '2023-03-15 23:38:29');

-- --------------------------------------------------------

--
-- Table structure for table `escrows`
--

CREATE TABLE `escrows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED DEFAULT NULL,
  `receiver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `percentage` decimal(16,8) NOT NULL DEFAULT 0.00000000 COMMENT 'Percent of charge',
  `charge_percentage` decimal(16,8) NOT NULL DEFAULT 0.00000000 COMMENT 'After adding percent of charge',
  `charge_fixed` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `amount` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `transfer_amount` decimal(16,8) NOT NULL DEFAULT 0.00000000 COMMENT 'Amount deduct from sender',
  `received_amount` decimal(16,8) NOT NULL DEFAULT 0.00000000 COMMENT 'Amount add to receiver',
  `charge_from` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = Sender, 1 = Receiver',
  `note` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=Pending, 1=generated, 2 = payment done, 3 = sender request to payment disburse, 4 = payment disbursed,5 = cancel, 6= dispute',
  `utr` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exchanges`
--

CREATE TABLE `exchanges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `from_wallet` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Wallet table id',
  `to_wallet` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Wallet table id',
  `percentage` decimal(16,8) NOT NULL DEFAULT 0.00000000 COMMENT 'Percent of charge',
  `charge_percentage` decimal(16,8) NOT NULL DEFAULT 0.00000000 COMMENT 'After adding percent of charge',
  `charge_fixed` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(16,8) NOT NULL DEFAULT 0.00000000 COMMENT 'After adding percent & fixed charge',
  `exchange_rate` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `amount` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `transfer_amount` decimal(16,8) NOT NULL DEFAULT 0.00000000 COMMENT 'Amount deduct from exchange currency wallet',
  `received_amount` decimal(16,8) NOT NULL DEFAULT 0.00000000 COMMENT 'Amount add to exchange currency wallet',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=Success,0=Pending',
  `utr` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(76, '1f2b7a83-c3ae-47a9-b191-e1bffe275f01', 'database', 'default', '{\"uuid\":\"1f2b7a83-c3ae-47a9-b191-e1bffe275f01\",\"displayName\":\"App\\\\Mail\\\\SendOrderMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:22:\\\"App\\\\Mail\\\\SendOrderMail\\\":31:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\ProductOrder\\\";s:2:\\\"id\\\";i:48;s:9:\\\"relations\\\";a:3:{i:0;s:5:\\\"store\\\";i:1;s:10:\\\"store.user\\\";i:2;s:12:\\\"orderDetails\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:8:\\\"subtotal\\\";d:179.5;s:14:\\\"currencySymbol\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:19:\\\"App\\\\Models\\\\Currency\\\";s:2:\\\"id\\\";N;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:16:\\\"mail@example.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Illuminate\\Database\\Eloquent\\ModelNotFoundException: No query results for model [App\\Models\\Currency]. in E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php:527\nStack trace:\n#0 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(102): Illuminate\\Database\\Eloquent\\Builder->firstOrFail()\n#1 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(57): App\\Mail\\SendOrderMail->restoreModel(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#2 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesModels.php(122): App\\Mail\\SendOrderMail->getRestoredPropertyValue(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#3 [internal function]: App\\Mail\\SendOrderMail->__unserialize(Array)\n#4 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(97): unserialize(\'O:34:\"Illuminat...\')\n#5 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(60): Illuminate\\Queue\\CallQueuedHandler->getCommand(Array)\n#6 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#7 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#8 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(378): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#9 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(172): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#10 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#11 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#12 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#13 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#15 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#16 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#17 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#18 E:\\xamp\\htdocs\\Wallet\\vendor\\symfony\\console\\Command\\Command.php(298): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Illuminate\\Console\\OutputStyle))\n#19 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Illuminate\\Console\\OutputStyle))\n#20 E:\\xamp\\htdocs\\Wallet\\vendor\\symfony\\console\\Application.php(1040): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Symfony\\Component\\Console\\Output\\BufferedOutput))\n#21 E:\\xamp\\htdocs\\Wallet\\vendor\\symfony\\console\\Application.php(301): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Symfony\\Component\\Console\\Output\\BufferedOutput))\n#22 E:\\xamp\\htdocs\\Wallet\\vendor\\symfony\\console\\Application.php(171): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Symfony\\Component\\Console\\Output\\BufferedOutput))\n#23 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(94): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Symfony\\Component\\Console\\Output\\BufferedOutput))\n#24 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(186): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Symfony\\Component\\Console\\Output\\BufferedOutput))\n#25 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(263): Illuminate\\Console\\Application->call(\'queue:work\', Array, NULL)\n#26 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(261): Illuminate\\Foundation\\Console\\Kernel->call(\'queue:work\', Array)\n#27 E:\\xamp\\htdocs\\Wallet\\routes\\web.php(74): Illuminate\\Support\\Facades\\Facade::__callStatic(\'call\', Array)\n#28 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(238): Illuminate\\Routing\\RouteFileRegistrar->{closure}()\n#29 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(208): Illuminate\\Routing\\Route->runCallable()\n#30 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(721): Illuminate\\Routing\\Route->run()\n#31 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#32 E:\\xamp\\htdocs\\Wallet\\app\\Http\\Middleware\\Language.php(22): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): App\\Http\\Middleware\\Language->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\VerifyCsrfToken.php(78): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Foundation\\Http\\Middleware\\VerifyCsrfToken->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#42 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#43 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(723): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#49 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(698): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#50 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(662): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#51 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(651): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#52 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(167): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#53 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#54 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest.php(21): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#55 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\ConvertEmptyStringsToNull.php(31): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#56 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Foundation\\Http\\Middleware\\ConvertEmptyStringsToNull->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#57 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest.php(21): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#58 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\TrimStrings.php(40): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#59 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Foundation\\Http\\Middleware\\TrimStrings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#60 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\ValidatePostSize.php(27): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#61 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Foundation\\Http\\Middleware\\ValidatePostSize->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#62 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#63 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#64 E:\\xamp\\htdocs\\Wallet\\vendor\\fruitcake\\laravel-cors\\src\\HandleCors.php(38): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#65 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Fruitcake\\Cors\\HandleCors->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#66 E:\\xamp\\htdocs\\Wallet\\vendor\\fideloper\\proxy\\src\\TrustProxies.php(57): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#67 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Fideloper\\Proxy\\TrustProxies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#68 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#69 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(142): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#70 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(111): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#71 E:\\xamp\\htdocs\\Wallet\\index.php(52): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#72 {main}', '2023-01-01 01:27:19'),
(77, '7fb8eae7-0663-4b5c-b992-83d9c85b0073', 'database', 'default', '{\"uuid\":\"7fb8eae7-0663-4b5c-b992-83d9c85b0073\",\"displayName\":\"App\\\\Mail\\\\SendOrderMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:22:\\\"App\\\\Mail\\\\SendOrderMail\\\":31:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\ProductOrder\\\";s:2:\\\"id\\\";i:52;s:9:\\\"relations\\\";a:3:{i:0;s:5:\\\"store\\\";i:1;s:10:\\\"store.user\\\";i:2;s:12:\\\"orderDetails\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:8:\\\"subtotal\\\";d:179.5;s:14:\\\"currencySymbol\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:19:\\\"App\\\\Models\\\\Currency\\\";s:2:\\\"id\\\";N;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:16:\\\"mail@example.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Illuminate\\Database\\Eloquent\\ModelNotFoundException: No query results for model [App\\Models\\Currency]. in E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php:527\nStack trace:\n#0 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(102): Illuminate\\Database\\Eloquent\\Builder->firstOrFail()\n#1 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(57): App\\Mail\\SendOrderMail->restoreModel(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#2 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesModels.php(122): App\\Mail\\SendOrderMail->getRestoredPropertyValue(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#3 [internal function]: App\\Mail\\SendOrderMail->__unserialize(Array)\n#4 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(97): unserialize(\'O:34:\"Illuminat...\')\n#5 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(60): Illuminate\\Queue\\CallQueuedHandler->getCommand(Array)\n#6 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#7 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#8 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(378): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#9 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(172): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#10 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#11 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#12 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#13 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#15 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#16 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#17 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#18 E:\\xamp\\htdocs\\Wallet\\vendor\\symfony\\console\\Command\\Command.php(298): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Illuminate\\Console\\OutputStyle))\n#19 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Illuminate\\Console\\OutputStyle))\n#20 E:\\xamp\\htdocs\\Wallet\\vendor\\symfony\\console\\Application.php(1040): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Symfony\\Component\\Console\\Output\\BufferedOutput))\n#21 E:\\xamp\\htdocs\\Wallet\\vendor\\symfony\\console\\Application.php(301): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Symfony\\Component\\Console\\Output\\BufferedOutput))\n#22 E:\\xamp\\htdocs\\Wallet\\vendor\\symfony\\console\\Application.php(171): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Symfony\\Component\\Console\\Output\\BufferedOutput))\n#23 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(94): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Symfony\\Component\\Console\\Output\\BufferedOutput))\n#24 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(186): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Symfony\\Component\\Console\\Output\\BufferedOutput))\n#25 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(263): Illuminate\\Console\\Application->call(\'queue:work\', Array, NULL)\n#26 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(261): Illuminate\\Foundation\\Console\\Kernel->call(\'queue:work\', Array)\n#27 E:\\xamp\\htdocs\\Wallet\\routes\\web.php(74): Illuminate\\Support\\Facades\\Facade::__callStatic(\'call\', Array)\n#28 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(238): Illuminate\\Routing\\RouteFileRegistrar->{closure}()\n#29 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(208): Illuminate\\Routing\\Route->runCallable()\n#30 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(721): Illuminate\\Routing\\Route->run()\n#31 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#32 E:\\xamp\\htdocs\\Wallet\\app\\Http\\Middleware\\Language.php(22): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): App\\Http\\Middleware\\Language->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\VerifyCsrfToken.php(78): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Foundation\\Http\\Middleware\\VerifyCsrfToken->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#42 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#43 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(723): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#49 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(698): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#50 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(662): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#51 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(651): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#52 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(167): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#53 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#54 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest.php(21): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#55 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\ConvertEmptyStringsToNull.php(31): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#56 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Foundation\\Http\\Middleware\\ConvertEmptyStringsToNull->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#57 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest.php(21): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#58 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\TrimStrings.php(40): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#59 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Foundation\\Http\\Middleware\\TrimStrings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#60 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\ValidatePostSize.php(27): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#61 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Foundation\\Http\\Middleware\\ValidatePostSize->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#62 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#63 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#64 E:\\xamp\\htdocs\\Wallet\\vendor\\fruitcake\\laravel-cors\\src\\HandleCors.php(38): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#65 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Fruitcake\\Cors\\HandleCors->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#66 E:\\xamp\\htdocs\\Wallet\\vendor\\fideloper\\proxy\\src\\TrustProxies.php(57): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#67 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Fideloper\\Proxy\\TrustProxies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#68 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#69 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(142): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#70 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(111): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#71 E:\\xamp\\htdocs\\Wallet\\index.php(52): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#72 {main}', '2023-01-01 03:32:22');
INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(78, 'b8a83a3f-b014-4b14-a71e-a86d21fb219b', 'database', 'default', '{\"uuid\":\"b8a83a3f-b014-4b14-a71e-a86d21fb219b\",\"displayName\":\"App\\\\Mail\\\\SendOrderMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:22:\\\"App\\\\Mail\\\\SendOrderMail\\\":31:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\ProductOrder\\\";s:2:\\\"id\\\";i:52;s:9:\\\"relations\\\";a:3:{i:0;s:5:\\\"store\\\";i:1;s:10:\\\"store.user\\\";i:2;s:12:\\\"orderDetails\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:8:\\\"subtotal\\\";d:179.5;s:14:\\\"currencySymbol\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:19:\\\"App\\\\Models\\\\Currency\\\";s:2:\\\"id\\\";N;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:18:\\\"demouser@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Illuminate\\Database\\Eloquent\\ModelNotFoundException: No query results for model [App\\Models\\Currency]. in E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php:527\nStack trace:\n#0 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(102): Illuminate\\Database\\Eloquent\\Builder->firstOrFail()\n#1 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(57): App\\Mail\\SendOrderMail->restoreModel(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#2 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesModels.php(122): App\\Mail\\SendOrderMail->getRestoredPropertyValue(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#3 [internal function]: App\\Mail\\SendOrderMail->__unserialize(Array)\n#4 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(97): unserialize(\'O:34:\"Illuminat...\')\n#5 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(60): Illuminate\\Queue\\CallQueuedHandler->getCommand(Array)\n#6 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#7 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#8 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(378): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#9 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(172): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#10 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#11 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#12 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#13 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#15 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#16 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#17 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#18 E:\\xamp\\htdocs\\Wallet\\vendor\\symfony\\console\\Command\\Command.php(298): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Illuminate\\Console\\OutputStyle))\n#19 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Illuminate\\Console\\OutputStyle))\n#20 E:\\xamp\\htdocs\\Wallet\\vendor\\symfony\\console\\Application.php(1040): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Symfony\\Component\\Console\\Output\\BufferedOutput))\n#21 E:\\xamp\\htdocs\\Wallet\\vendor\\symfony\\console\\Application.php(301): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Symfony\\Component\\Console\\Output\\BufferedOutput))\n#22 E:\\xamp\\htdocs\\Wallet\\vendor\\symfony\\console\\Application.php(171): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Symfony\\Component\\Console\\Output\\BufferedOutput))\n#23 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(94): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Symfony\\Component\\Console\\Output\\BufferedOutput))\n#24 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(186): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Symfony\\Component\\Console\\Output\\BufferedOutput))\n#25 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(263): Illuminate\\Console\\Application->call(\'queue:work\', Array, NULL)\n#26 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(261): Illuminate\\Foundation\\Console\\Kernel->call(\'queue:work\', Array)\n#27 E:\\xamp\\htdocs\\Wallet\\routes\\web.php(74): Illuminate\\Support\\Facades\\Facade::__callStatic(\'call\', Array)\n#28 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(238): Illuminate\\Routing\\RouteFileRegistrar->{closure}()\n#29 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(208): Illuminate\\Routing\\Route->runCallable()\n#30 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(721): Illuminate\\Routing\\Route->run()\n#31 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#32 E:\\xamp\\htdocs\\Wallet\\app\\Http\\Middleware\\Language.php(22): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): App\\Http\\Middleware\\Language->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\VerifyCsrfToken.php(78): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Foundation\\Http\\Middleware\\VerifyCsrfToken->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#42 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#43 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(723): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#49 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(698): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#50 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(662): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#51 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(651): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#52 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(167): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#53 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#54 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest.php(21): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#55 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\ConvertEmptyStringsToNull.php(31): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#56 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Foundation\\Http\\Middleware\\ConvertEmptyStringsToNull->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#57 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest.php(21): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#58 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\TrimStrings.php(40): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#59 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Foundation\\Http\\Middleware\\TrimStrings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#60 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\ValidatePostSize.php(27): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#61 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Foundation\\Http\\Middleware\\ValidatePostSize->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#62 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#63 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#64 E:\\xamp\\htdocs\\Wallet\\vendor\\fruitcake\\laravel-cors\\src\\HandleCors.php(38): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#65 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Fruitcake\\Cors\\HandleCors->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#66 E:\\xamp\\htdocs\\Wallet\\vendor\\fideloper\\proxy\\src\\TrustProxies.php(57): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#67 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Fideloper\\Proxy\\TrustProxies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#68 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#69 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(142): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#70 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(111): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#71 E:\\xamp\\htdocs\\Wallet\\index.php(52): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#72 {main}', '2023-01-01 03:32:22');
INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(79, 'cfaca53d-5dc7-4d88-86b1-d0038a0befe7', 'database', 'default', '{\"uuid\":\"cfaca53d-5dc7-4d88-86b1-d0038a0befe7\",\"displayName\":\"App\\\\Mail\\\\SendMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:17:\\\"App\\\\Mail\\\\SendMail\\\":31:{s:10:\\\"from_email\\\";s:19:\\\"support@example.com\\\";s:10:\\\"site_title\\\";s:10:\\\"Pay Secure\\\";s:7:\\\"subject\\\";s:15:\\\"QR payment from\\\";s:7:\\\"message\\\";s:42507:\\\"<meta http-equiv=\\\"X-UA-Compatible\\\" content=\\\"IE=edge\\\">\\r\\n<meta name=\\\"viewport\\\" content=\\\"width=device-width\\\">\\r\\n<style type=\\\"text\\/css\\\">\\r\\n    @media only screen and (min-width: 620px) {\\r\\n        * [lang=x-wrapper] h1 {\\r\\n        }\\r\\n\\r\\n        * [lang=x-wrapper] h1 {\\r\\n            font-size: 26px !important;\\r\\n            line-height: 34px !important\\r\\n        }\\r\\n\\r\\n        * [lang=x-wrapper] h2 {\\r\\n        }\\r\\n\\r\\n        * [lang=x-wrapper] h2 {\\r\\n            font-size: 20px !important;\\r\\n            line-height: 28px !important\\r\\n        }\\r\\n\\r\\n        * [lang=x-wrapper] h3 {\\r\\n        }\\r\\n\\r\\n        * [lang=x-layout__inner] p,\\r\\n        * [lang=x-layout__inner] ol,\\r\\n        * [lang=x-layout__inner] ul {\\r\\n        }\\r\\n\\r\\n        * div [lang=x-size-8] {\\r\\n            font-size: 8px !important;\\r\\n            line-height: 14px !important\\r\\n        }\\r\\n\\r\\n        * div [lang=x-size-9] {\\r\\n            font-size: 9px !important;\\r\\n            line-height: 16px !important\\r\\n        }\\r\\n\\r\\n        * div [lang=x-size-10] {\\r\\n            font-size: 10px !important;\\r\\n            line-height: 18px !important\\r\\n        }\\r\\n\\r\\n        * div [lang=x-size-11] {\\r\\n            font-size: 11px !important;\\r\\n            line-height: 19px !important\\r\\n        }\\r\\n\\r\\n        * div [lang=x-size-12] {\\r\\n            font-size: 12px !important;\\r\\n            line-height: 19px !important\\r\\n        }\\r\\n\\r\\n        * div [lang=x-size-13] {\\r\\n            font-size: 13px !important;\\r\\n            line-height: 21px !important\\r\\n        }\\r\\n\\r\\n        * div [lang=x-size-14] {\\r\\n            font-size: 14px !important;\\r\\n            line-height: 21px !important\\r\\n        }\\r\\n\\r\\n        * div [lang=x-size-15] {\\r\\n            font-size: 15px !important;\\r\\n            line-height: 23px !important\\r\\n        }\\r\\n\\r\\n        * div [lang=x-size-16] {\\r\\n            font-size: 16px !important;\\r\\n            line-height: 24px !important\\r\\n        }\\r\\n\\r\\n        * div [lang=x-size-17] {\\r\\n            font-size: 17px !important;\\r\\n            line-height: 26px !important\\r\\n        }\\r\\n\\r\\n        * div [lang=x-size-18] {\\r\\n            font-size: 18px !important;\\r\\n            line-height: 26px !important\\r\\n        }\\r\\n\\r\\n        * div [lang=x-size-18] {\\r\\n            font-size: 18px !important;\\r\\n            line-height: 26px !important\\r\\n        }\\r\\n\\r\\n        * div [lang=x-size-20] {\\r\\n            font-size: 20px !important;\\r\\n            line-height: 28px !important\\r\\n        }\\r\\n\\r\\n        * div [lang=x-size-22] {\\r\\n            font-size: 22px !important;\\r\\n            line-height: 31px !important\\r\\n        }\\r\\n\\r\\n        * div [lang=x-size-24] {\\r\\n            font-size: 24px !important;\\r\\n            line-height: 32px !important\\r\\n        }\\r\\n\\r\\n        * div [lang=x-size-26] {\\r\\n            font-size: 26px !important;\\r\\n            line-height: 34px !important\\r\\n        }\\r\\n\\r\\n        * div [lang=x-size-28] {\\r\\n            font-size: 28px !important;\\r\\n            line-height: 36px !important\\r\\n        }\\r\\n\\r\\n        * div [lang=x-size-30] {\\r\\n            font-size: 30px !important;\\r\\n            line-height: 38px !important\\r\\n        }\\r\\n\\r\\n        * div [lang=x-size-32] {\\r\\n            font-size: 32px !important;\\r\\n            line-height: 40px !important\\r\\n        }\\r\\n\\r\\n        * div [lang=x-size-34] {\\r\\n            font-size: 34px !important;\\r\\n            line-height: 43px !important\\r\\n        }\\r\\n\\r\\n        * div [lang=x-size-36] {\\r\\n            font-size: 36px !important;\\r\\n            line-height: 43px !important\\r\\n        }\\r\\n\\r\\n        * div [lang=x-size-40] {\\r\\n            font-size: 40px !important;\\r\\n            line-height: 47px !important\\r\\n        }\\r\\n\\r\\n        * div [lang=x-size-44] {\\r\\n            font-size: 44px !important;\\r\\n            line-height: 50px !important\\r\\n        }\\r\\n\\r\\n        * div [lang=x-size-48] {\\r\\n            font-size: 48px !important;\\r\\n            line-height: 54px !important\\r\\n        }\\r\\n\\r\\n        * div [lang=x-size-56] {\\r\\n            font-size: 56px !important;\\r\\n            line-height: 60px !important\\r\\n        }\\r\\n\\r\\n        * div [lang=x-size-64] {\\r\\n            font-size: 64px !important;\\r\\n            line-height: 63px !important\\r\\n        }\\r\\n    }\\r\\n<\\/style>\\r\\n<style type=\\\"text\\/css\\\">\\r\\n    body {\\r\\n        margin: 0;\\r\\n        padding: 0;\\r\\n    }\\r\\n\\r\\n    table {\\r\\n        border-collapse: collapse;\\r\\n        table-layout: fixed;\\r\\n    }\\r\\n\\r\\n    * {\\r\\n        line-height: inherit;\\r\\n    }\\r\\n\\r\\n    [x-apple-data-detectors],\\r\\n    [href^=\\\"tel\\\"],\\r\\n    [href^=\\\"sms\\\"] {\\r\\n        color: inherit !important;\\r\\n        text-decoration: none !important;\\r\\n    }\\r\\n\\r\\n    .wrapper .footer__share-button a:hover,\\r\\n    .wrapper .footer__share-button a:focus {\\r\\n        color: #ffffff !important;\\r\\n    }\\r\\n\\r\\n    .btn a:hover,\\r\\n    .btn a:focus,\\r\\n    .footer__share-button a:hover,\\r\\n    .footer__share-button a:focus,\\r\\n    .email-footer__links a:hover,\\r\\n    .email-footer__links a:focus {\\r\\n        opacity: 0.8;\\r\\n    }\\r\\n\\r\\n    .preheader,\\r\\n    .header,\\r\\n    .layout,\\r\\n    .column {\\r\\n        transition: width 0.25s ease-in-out, max-width 0.25s ease-in-out;\\r\\n    }\\r\\n\\r\\n    .layout,\\r\\n    .header {\\r\\n        max-width: 400px !important;\\r\\n        -fallback-width: 95% !important;\\r\\n        width: calc(100% - 20px) !important;\\r\\n    }\\r\\n\\r\\n    div.preheader {\\r\\n        max-width: 360px !important;\\r\\n        -fallback-width: 90% !important;\\r\\n        width: calc(100% - 60px) !important;\\r\\n    }\\r\\n\\r\\n    .snippet,\\r\\n    .webversion {\\r\\n        Float: none !important;\\r\\n    }\\r\\n\\r\\n    .column {\\r\\n        max-width: 400px !important;\\r\\n        width: 100% !important;\\r\\n    }\\r\\n\\r\\n    .fixed-width.has-border {\\r\\n        max-width: 402px !important;\\r\\n    }\\r\\n\\r\\n    .fixed-width.has-border .layout__inner {\\r\\n        box-sizing: border-box;\\r\\n    }\\r\\n\\r\\n    .snippet,\\r\\n    .webversion {\\r\\n        width: 50% !important;\\r\\n    }\\r\\n\\r\\n    .ie .btn {\\r\\n        width: 100%;\\r\\n    }\\r\\n\\r\\n    .ie .column,\\r\\n    [owa] .column,\\r\\n    .ie .gutter,\\r\\n    [owa] .gutter {\\r\\n        display: table-cell;\\r\\n        float: none !important;\\r\\n        vertical-align: top;\\r\\n    }\\r\\n\\r\\n    .ie div.preheader,\\r\\n    [owa] div.preheader,\\r\\n    .ie .email-footer,\\r\\n    [owa] .email-footer {\\r\\n        max-width: 560px !important;\\r\\n        width: 560px !important;\\r\\n    }\\r\\n\\r\\n    .ie .snippet,\\r\\n    [owa] .snippet,\\r\\n    .ie .webversion,\\r\\n    [owa] .webversion {\\r\\n        width: 280px !important;\\r\\n    }\\r\\n\\r\\n    .ie .header,\\r\\n    [owa] .header,\\r\\n    .ie .layout,\\r\\n    [owa] .layout,\\r\\n    .ie .one-col .column,\\r\\n    [owa] .one-col .column {\\r\\n        max-width: 600px !important;\\r\\n        width: 600px !important;\\r\\n    }\\r\\n\\r\\n    .ie .fixed-width.has-border,\\r\\n    [owa] .fixed-width.has-border,\\r\\n    .ie .has-gutter.has-border,\\r\\n    [owa] .has-gutter.has-border {\\r\\n        max-width: 602px !important;\\r\\n        width: 602px !important;\\r\\n    }\\r\\n\\r\\n    .ie .two-col .column,\\r\\n    [owa] .two-col .column {\\r\\n        width: 300px !important;\\r\\n    }\\r\\n\\r\\n    .ie .three-col .column,\\r\\n    [owa] .three-col .column,\\r\\n    .ie .narrow,\\r\\n    [owa] .narrow {\\r\\n        width: 200px !important;\\r\\n    }\\r\\n\\r\\n    .ie .wide,\\r\\n    [owa] .wide {\\r\\n        width: 400px !important;\\r\\n    }\\r\\n\\r\\n    .ie .two-col.has-gutter .column,\\r\\n    [owa] .two-col.x_has-gutter .column {\\r\\n        width: 290px !important;\\r\\n    }\\r\\n\\r\\n    .ie .three-col.has-gutter .column,\\r\\n    [owa] .three-col.x_has-gutter .column,\\r\\n    .ie .has-gutter .narrow,\\r\\n    [owa] .has-gutter .narrow {\\r\\n        width: 188px !important;\\r\\n    }\\r\\n\\r\\n    .ie .has-gutter .wide,\\r\\n    [owa] .has-gutter .wide {\\r\\n        width: 394px !important;\\r\\n    }\\r\\n\\r\\n    .ie .two-col.has-gutter.has-border .column,\\r\\n    [owa] .two-col.x_has-gutter.x_has-border .column {\\r\\n        width: 292px !important;\\r\\n    }\\r\\n\\r\\n    .ie .three-col.has-gutter.has-border .column,\\r\\n    [owa] .three-col.x_has-gutter.x_has-border .column,\\r\\n    .ie .has-gutter.has-border .narrow,\\r\\n    [owa] .has-gutter.x_has-border .narrow {\\r\\n        width: 190px !important;\\r\\n    }\\r\\n\\r\\n    .ie .has-gutter.has-border .wide,\\r\\n    [owa] .has-gutter.x_has-border .wide {\\r\\n        width: 396px !important;\\r\\n    }\\r\\n\\r\\n    .ie .fixed-width .layout__inner {\\r\\n        border-left: 0 none white !important;\\r\\n        border-right: 0 none white !important;\\r\\n    }\\r\\n\\r\\n    .ie .layout__edges {\\r\\n        display: none;\\r\\n    }\\r\\n\\r\\n    .mso .layout__edges {\\r\\n        font-size: 0;\\r\\n    }\\r\\n\\r\\n    .layout-fixed-width,\\r\\n    .mso .layout-full-width {\\r\\n        background-color: #ffffff;\\r\\n    }\\r\\n\\r\\n    @media only screen and (min-width: 620px) {\\r\\n\\r\\n        .column,\\r\\n        .gutter {\\r\\n            display: table-cell;\\r\\n            Float: none !important;\\r\\n            vertical-align: top;\\r\\n        }\\r\\n\\r\\n        div.preheader,\\r\\n        .email-footer {\\r\\n            max-width: 560px !important;\\r\\n            width: 560px !important;\\r\\n        }\\r\\n\\r\\n        .snippet,\\r\\n        .webversion {\\r\\n            width: 280px !important;\\r\\n        }\\r\\n\\r\\n        .header,\\r\\n        .layout,\\r\\n        .one-col .column {\\r\\n            max-width: 600px !important;\\r\\n            width: 600px !important;\\r\\n        }\\r\\n\\r\\n        .fixed-width.has-border,\\r\\n        .fixed-width.ecxhas-border,\\r\\n        .has-gutter.has-border,\\r\\n        .has-gutter.ecxhas-border {\\r\\n            max-width: 602px !important;\\r\\n            width: 602px !important;\\r\\n        }\\r\\n\\r\\n        .two-col .column {\\r\\n            width: 300px !important;\\r\\n        }\\r\\n\\r\\n        .three-col .column,\\r\\n        .column.narrow {\\r\\n            width: 200px !important;\\r\\n        }\\r\\n\\r\\n        .column.wide {\\r\\n            width: 400px !important;\\r\\n        }\\r\\n\\r\\n        .two-col.has-gutter .column,\\r\\n        .two-col.ecxhas-gutter .column {\\r\\n            width: 290px !important;\\r\\n        }\\r\\n\\r\\n        .three-col.has-gutter .column,\\r\\n        .three-col.ecxhas-gutter .column,\\r\\n        .has-gutter .narrow {\\r\\n            width: 188px !important;\\r\\n        }\\r\\n\\r\\n        .has-gutter .wide {\\r\\n            width: 394px !important;\\r\\n        }\\r\\n\\r\\n        .two-col.has-gutter.has-border .column,\\r\\n        .two-col.ecxhas-gutter.ecxhas-border .column {\\r\\n            width: 292px !important;\\r\\n        }\\r\\n\\r\\n        .three-col.has-gutter.has-border .column,\\r\\n        .three-col.ecxhas-gutter.ecxhas-border .column,\\r\\n        .has-gutter.has-border .narrow,\\r\\n        .has-gutter.ecxhas-border .narrow {\\r\\n            width: 190px !important;\\r\\n        }\\r\\n\\r\\n        .has-gutter.has-border .wide,\\r\\n        .has-gutter.ecxhas-border .wide {\\r\\n            width: 396px !important;\\r\\n        }\\r\\n    }\\r\\n\\r\\n    @media only screen and (-webkit-min-device-pixel-ratio: 2), only screen and (min--moz-device-pixel-ratio: 2), only screen and (-o-min-device-pixel-ratio: 2\\/1), only screen and (min-device-pixel-ratio: 2), only screen and (min-resolution: 192dpi), only screen and (min-resolution: 2dppx) {\\r\\n        .fblike {\\r\\n            background-image: url(https:\\/\\/i3.createsend1.com\\/static\\/eb\\/customise\\/13-the-blueprint-3\\/images\\/fblike@2x.png) !important;\\r\\n        }\\r\\n\\r\\n        .tweet {\\r\\n            background-image: url(https:\\/\\/i4.createsend1.com\\/static\\/eb\\/customise\\/13-the-blueprint-3\\/images\\/tweet@2x.png) !important;\\r\\n        }\\r\\n\\r\\n        .linkedinshare {\\r\\n            background-image: url(https:\\/\\/i6.createsend1.com\\/static\\/eb\\/customise\\/13-the-blueprint-3\\/images\\/lishare@2x.png) !important;\\r\\n        }\\r\\n\\r\\n        .forwardtoafriend {\\r\\n            background-image: url(https:\\/\\/i5.createsend1.com\\/static\\/eb\\/customise\\/13-the-blueprint-3\\/images\\/forward@2x.png) !important;\\r\\n        }\\r\\n    }\\r\\n\\r\\n    @media (max-width: 321px) {\\r\\n        .fixed-width.has-border .layout__inner {\\r\\n            border-width: 1px 0 !important;\\r\\n        }\\r\\n\\r\\n        .layout,\\r\\n        .column {\\r\\n            min-width: 320px !important;\\r\\n            width: 320px !important;\\r\\n        }\\r\\n\\r\\n        .border {\\r\\n            display: none;\\r\\n        }\\r\\n    }\\r\\n\\r\\n    .mso div {\\r\\n        border: 0 none white !important;\\r\\n    }\\r\\n\\r\\n    .mso .w560 .divider {\\r\\n        margin-left: 260px !important;\\r\\n        margin-right: 260px !important;\\r\\n    }\\r\\n\\r\\n    .mso .w360 .divider {\\r\\n        margin-left: 160px !important;\\r\\n        margin-right: 160px !important;\\r\\n    }\\r\\n\\r\\n    .mso .w260 .divider {\\r\\n        margin-left: 110px !important;\\r\\n        margin-right: 110px !important;\\r\\n    }\\r\\n\\r\\n    .mso .w160 .divider {\\r\\n        margin-left: 60px !important;\\r\\n        margin-right: 60px !important;\\r\\n    }\\r\\n\\r\\n    .mso .w354 .divider {\\r\\n        margin-left: 157px !important;\\r\\n        margin-right: 157px !important;\\r\\n    }\\r\\n\\r\\n    .mso .w250 .divider {\\r\\n        margin-left: 105px !important;\\r\\n        margin-right: 105px !important;\\r\\n    }\\r\\n\\r\\n    .mso .w148 .divider {\\r\\n        margin-left: 54px !important;\\r\\n        margin-right: 54px !important;\\r\\n    }\\r\\n\\r\\n    .mso .font-avenir,\\r\\n    .mso .font-cabin,\\r\\n    .mso .font-open-sans,\\r\\n    .mso .font-ubuntu {\\r\\n        font-family: sans-serif !important;\\r\\n    }\\r\\n\\r\\n    .mso .font-bitter,\\r\\n    .mso .font-merriweather,\\r\\n    .mso .font-pt-serif {\\r\\n        font-family: Georgia, serif !important;\\r\\n    }\\r\\n\\r\\n    .mso .font-lato,\\r\\n    .mso .font-roboto {\\r\\n        font-family: Tahoma, sans-serif !important;\\r\\n    }\\r\\n\\r\\n    .mso .font-pt-sans {\\r\\n        font-family: \\\"Trebuchet MS\\\", sans-serif !important;\\r\\n    }\\r\\n\\r\\n    .mso .footer__share-button p {\\r\\n        margin: 0;\\r\\n    }\\r\\n\\r\\n    @media only screen and (min-width: 620px) {\\r\\n        .wrapper .size-8 {\\r\\n            font-size: 8px !important;\\r\\n            line-height: 14px !important;\\r\\n        }\\r\\n\\r\\n        .wrapper .size-9 {\\r\\n            font-size: 9px !important;\\r\\n            line-height: 16px !important;\\r\\n        }\\r\\n\\r\\n        .wrapper .size-10 {\\r\\n            font-size: 10px !important;\\r\\n            line-height: 18px !important;\\r\\n        }\\r\\n\\r\\n        .wrapper .size-11 {\\r\\n            font-size: 11px !important;\\r\\n            line-height: 19px !important;\\r\\n        }\\r\\n\\r\\n        .wrapper .size-12 {\\r\\n            font-size: 12px !important;\\r\\n            line-height: 19px !important;\\r\\n        }\\r\\n\\r\\n        .wrapper .size-13 {\\r\\n            font-size: 13px !important;\\r\\n            line-height: 21px !important;\\r\\n        }\\r\\n\\r\\n        .wrapper .size-14 {\\r\\n            font-size: 14px !important;\\r\\n            line-height: 21px !important;\\r\\n        }\\r\\n\\r\\n        .wrapper .size-15 {\\r\\n            font-size: 15px !important;\\r\\n            line-height: 23px !important;\\r\\n        }\\r\\n\\r\\n        .wrapper .size-16 {\\r\\n            font-size: 16px !important;\\r\\n            line-height: 24px !important;\\r\\n        }\\r\\n\\r\\n        .wrapper .size-17 {\\r\\n            font-size: 17px !important;\\r\\n            line-height: 26px !important;\\r\\n        }\\r\\n\\r\\n        .wrapper .size-18 {\\r\\n            font-size: 18px !important;\\r\\n            line-height: 26px !important;\\r\\n        }\\r\\n\\r\\n        .wrapper .size-20 {\\r\\n            font-size: 20px !important;\\r\\n            line-height: 28px !important;\\r\\n        }\\r\\n\\r\\n        .wrapper .size-22 {\\r\\n            font-size: 22px !important;\\r\\n            line-height: 31px !important;\\r\\n        }\\r\\n\\r\\n        .wrapper .size-24 {\\r\\n            font-size: 24px !important;\\r\\n            line-height: 32px !important;\\r\\n        }\\r\\n\\r\\n        .wrapper .size-26 {\\r\\n            font-size: 26px !important;\\r\\n            line-height: 34px !important;\\r\\n        }\\r\\n\\r\\n        .wrapper .size-28 {\\r\\n            font-size: 28px !important;\\r\\n            line-height: 36px !important;\\r\\n        }\\r\\n\\r\\n        .wrapper .size-30 {\\r\\n            font-size: 30px !important;\\r\\n            line-height: 38px !important;\\r\\n        }\\r\\n\\r\\n        .wrapper .size-32 {\\r\\n            font-size: 32px !important;\\r\\n            line-height: 40px !important;\\r\\n        }\\r\\n\\r\\n        .wrapper .size-34 {\\r\\n            font-size: 34px !important;\\r\\n            line-height: 43px !important;\\r\\n        }\\r\\n\\r\\n        .wrapper .size-36 {\\r\\n            font-size: 36px !important;\\r\\n            line-height: 43px !important;\\r\\n        }\\r\\n\\r\\n        .wrapper .size-40 {\\r\\n            font-size: 40px !important;\\r\\n            line-height: 47px !important;\\r\\n        }\\r\\n\\r\\n        .wrapper .size-44 {\\r\\n            font-size: 44px !important;\\r\\n            line-height: 50px !important;\\r\\n        }\\r\\n\\r\\n        .wrapper .size-48 {\\r\\n            font-size: 48px !important;\\r\\n            line-height: 54px !important;\\r\\n        }\\r\\n\\r\\n        .wrapper .size-56 {\\r\\n            font-size: 56px !important;\\r\\n            line-height: 60px !important;\\r\\n        }\\r\\n\\r\\n        .wrapper .size-64 {\\r\\n            font-size: 64px !important;\\r\\n            line-height: 63px !important;\\r\\n        }\\r\\n    }\\r\\n\\r\\n    .mso .size-8,\\r\\n    .ie .size-8 {\\r\\n        font-size: 8px !important;\\r\\n        line-height: 14px !important;\\r\\n    }\\r\\n\\r\\n    .mso .size-9,\\r\\n    .ie .size-9 {\\r\\n        font-size: 9px !important;\\r\\n        line-height: 16px !important;\\r\\n    }\\r\\n\\r\\n    .mso .size-10,\\r\\n    .ie .size-10 {\\r\\n        font-size: 10px !important;\\r\\n        line-height: 18px !important;\\r\\n    }\\r\\n\\r\\n    .mso .size-11,\\r\\n    .ie .size-11 {\\r\\n        font-size: 11px !important;\\r\\n        line-height: 19px !important;\\r\\n    }\\r\\n\\r\\n    .mso .size-12,\\r\\n    .ie .size-12 {\\r\\n        font-size: 12px !important;\\r\\n        line-height: 19px !important;\\r\\n    }\\r\\n\\r\\n    .mso .size-13,\\r\\n    .ie .size-13 {\\r\\n        font-size: 13px !important;\\r\\n        line-height: 21px !important;\\r\\n    }\\r\\n\\r\\n    .mso .size-14,\\r\\n    .ie .size-14 {\\r\\n        font-size: 14px !important;\\r\\n        line-height: 21px !important;\\r\\n    }\\r\\n\\r\\n    .mso .size-15,\\r\\n    .ie .size-15 {\\r\\n        font-size: 15px !important;\\r\\n        line-height: 23px !important;\\r\\n    }\\r\\n\\r\\n    .mso .size-16,\\r\\n    .ie .size-16 {\\r\\n        font-size: 16px !important;\\r\\n        line-height: 24px !important;\\r\\n    }\\r\\n\\r\\n    .mso .size-17,\\r\\n    .ie .size-17 {\\r\\n        font-size: 17px !important;\\r\\n        line-height: 26px !important;\\r\\n    }\\r\\n\\r\\n    .mso .size-18,\\r\\n    .ie .size-18 {\\r\\n        font-size: 18px !important;\\r\\n        line-height: 26px !important;\\r\\n    }\\r\\n\\r\\n    .mso .size-20,\\r\\n    .ie .size-20 {\\r\\n        font-size: 20px !important;\\r\\n        line-height: 28px !important;\\r\\n    }\\r\\n\\r\\n    .mso .size-22,\\r\\n    .ie .size-22 {\\r\\n        font-size: 22px !important;\\r\\n        line-height: 31px !important;\\r\\n    }\\r\\n\\r\\n    .mso .size-24,\\r\\n    .ie .size-24 {\\r\\n        font-size: 24px !important;\\r\\n        line-height: 32px !important;\\r\\n    }\\r\\n\\r\\n    .mso .size-26,\\r\\n    .ie .size-26 {\\r\\n        font-size: 26px !important;\\r\\n        line-height: 34px !important;\\r\\n    }\\r\\n\\r\\n    .mso .size-28,\\r\\n    .ie .size-28 {\\r\\n        font-size: 28px !important;\\r\\n        line-height: 36px !important;\\r\\n    }\\r\\n\\r\\n    .mso .size-30,\\r\\n    .ie .size-30 {\\r\\n        font-size: 30px !important;\\r\\n        line-height: 38px !important;\\r\\n    }\\r\\n\\r\\n    .mso .size-32,\\r\\n    .ie .size-32 {\\r\\n        font-size: 32px !important;\\r\\n        line-height: 40px !important;\\r\\n    }\\r\\n\\r\\n    .mso .size-34,\\r\\n    .ie .size-34 {\\r\\n        font-size: 34px !important;\\r\\n        line-height: 43px !important;\\r\\n    }\\r\\n\\r\\n    .mso .size-36,\\r\\n    .ie .size-36 {\\r\\n        font-size: 36px !important;\\r\\n        line-height: 43px !important;\\r\\n    }\\r\\n\\r\\n    .mso .size-40,\\r\\n    .ie .size-40 {\\r\\n        font-size: 40px !important;\\r\\n        line-height: 47px !important;\\r\\n    }\\r\\n\\r\\n    .mso .size-44,\\r\\n    .ie .size-44 {\\r\\n        font-size: 44px !important;\\r\\n        line-height: 50px !important;\\r\\n    }\\r\\n\\r\\n    .mso .size-48,\\r\\n    .ie .size-48 {\\r\\n        font-size: 48px !important;\\r\\n        line-height: 54px !important;\\r\\n    }\\r\\n\\r\\n    .mso .size-56,\\r\\n    .ie .size-56 {\\r\\n        font-size: 56px !important;\\r\\n        line-height: 60px !important;\\r\\n    }\\r\\n\\r\\n    .mso .size-64,\\r\\n    .ie .size-64 {\\r\\n        font-size: 64px !important;\\r\\n        line-height: 63px !important;\\r\\n    }\\r\\n\\r\\n    .footer__share-button p {\\r\\n        margin: 0;\\r\\n    }\\r\\n<\\/style>\\r\\n\\r\\n<title><\\/title>\\r\\n<!--[if !mso]><!-->\\r\\n<style type=\\\"text\\/css\\\">\\r\\n    @import url(https:\\/\\/fonts.googleapis.com\\/css?family=Bitter:400,700,400italic|Cabin:400,700,400italic,700italic|Open+Sans:400italic,700italic,700,400);\\r\\n<\\/style>\\r\\n<link href=\\\"https:\\/\\/fonts.googleapis.com\\/css?family=Bitter:400,700,400italic|Cabin:400,700,400italic,700italic|Open+Sans:400italic,700italic,700,400\\\" rel=\\\"stylesheet\\\" type=\\\"text\\/css\\\">\\r\\n<!--<![endif]-->\\r\\n<style type=\\\"text\\/css\\\">\\r\\n    body {\\r\\n        background-color: #f5f7fa\\r\\n    }\\r\\n\\r\\n    .mso h1 {\\r\\n    }\\r\\n\\r\\n    .mso h1 {\\r\\n        font-family: sans-serif !important\\r\\n    }\\r\\n\\r\\n    .mso h2 {\\r\\n    }\\r\\n\\r\\n    .mso h3 {\\r\\n    }\\r\\n\\r\\n    .mso .column,\\r\\n    .mso .column__background td {\\r\\n    }\\r\\n\\r\\n    .mso .column,\\r\\n    .mso .column__background td {\\r\\n        font-family: sans-serif !important\\r\\n    }\\r\\n\\r\\n    .mso .btn a {\\r\\n    }\\r\\n\\r\\n    .mso .btn a {\\r\\n        font-family: sans-serif !important\\r\\n    }\\r\\n\\r\\n    .mso .webversion,\\r\\n    .mso .snippet,\\r\\n    .mso .layout-email-footer td,\\r\\n    .mso .footer__share-button p {\\r\\n    }\\r\\n\\r\\n    .mso .webversion,\\r\\n    .mso .snippet,\\r\\n    .mso .layout-email-footer td,\\r\\n    .mso .footer__share-button p {\\r\\n        font-family: sans-serif !important\\r\\n    }\\r\\n\\r\\n    .mso .logo {\\r\\n    }\\r\\n\\r\\n    .mso .logo {\\r\\n        font-family: Tahoma, sans-serif !important\\r\\n    }\\r\\n\\r\\n    .logo a:hover,\\r\\n    .logo a:focus {\\r\\n        color: #859bb1 !important\\r\\n    }\\r\\n\\r\\n    .mso .layout-has-border {\\r\\n        border-top: 1px solid #b1c1d8;\\r\\n        border-bottom: 1px solid #b1c1d8\\r\\n    }\\r\\n\\r\\n    .mso .layout-has-bottom-border {\\r\\n        border-bottom: 1px solid #b1c1d8\\r\\n    }\\r\\n\\r\\n    .mso .border,\\r\\n    .ie .border {\\r\\n        background-color: #b1c1d8\\r\\n    }\\r\\n\\r\\n    @media only screen and (min-width: 620px) {\\r\\n        .wrapper h1 {\\r\\n        }\\r\\n\\r\\n        .wrapper h1 {\\r\\n            font-size: 26px !important;\\r\\n            line-height: 34px !important\\r\\n        }\\r\\n\\r\\n        .wrapper h2 {\\r\\n        }\\r\\n\\r\\n        .wrapper h2 {\\r\\n            font-size: 20px !important;\\r\\n            line-height: 28px !important\\r\\n        }\\r\\n\\r\\n        .wrapper h3 {\\r\\n        }\\r\\n\\r\\n        .column p,\\r\\n        .column ol,\\r\\n        .column ul {\\r\\n        }\\r\\n    }\\r\\n\\r\\n    .mso h1,\\r\\n    .ie h1 {\\r\\n    }\\r\\n\\r\\n    .mso h1,\\r\\n    .ie h1 {\\r\\n        font-size: 26px !important;\\r\\n        line-height: 34px !important\\r\\n    }\\r\\n\\r\\n    .mso h2,\\r\\n    .ie h2 {\\r\\n    }\\r\\n\\r\\n    .mso h2,\\r\\n    .ie h2 {\\r\\n        font-size: 20px !important;\\r\\n        line-height: 28px !important\\r\\n    }\\r\\n\\r\\n    .mso h3,\\r\\n    .ie h3 {\\r\\n    }\\r\\n\\r\\n    .mso .layout__inner p,\\r\\n    .ie .layout__inner p,\\r\\n    .mso .layout__inner ol,\\r\\n    .ie .layout__inner ol,\\r\\n    .mso .layout__inner ul,\\r\\n    .ie .layout__inner ul {\\r\\n    }\\r\\n<\\/style>\\r\\n<meta name=\\\"robots\\\" content=\\\"noindex,nofollow\\\">\\r\\n\\r\\n<meta property=\\\"og:title\\\" content=\\\"Just One More Step\\\">\\r\\n\\r\\n<link href=\\\"https:\\/\\/css.createsend1.com\\/css\\/social.min.css?h=0ED47CE120160920\\\" media=\\\"screen,projection\\\" rel=\\\"stylesheet\\\" type=\\\"text\\/css\\\">\\r\\n\\r\\n\\r\\n<div class=\\\"wrapper\\\" style=\\\"min-width: 320px;background-color: #f5f7fa;\\\" lang=\\\"x-wrapper\\\">\\r\\n    <div class=\\\"preheader\\\" style=\\\"margin: 0 auto;max-width: 560px;min-width: 280px; width: 280px;\\\">\\r\\n        <div style=\\\"border-collapse: collapse;display: table;width: 100%;\\\">\\r\\n            <div class=\\\"snippet\\\" style=\\\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 140px; width: 140px;padding: 10px 0 5px 0;color: #b9b9b9;\\\">\\r\\n            <\\/div>\\r\\n            <div class=\\\"webversion\\\" style=\\\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 139px; width: 139px;padding: 10px 0 5px 0;text-align: right;color: #b9b9b9;\\\">\\r\\n            <\\/div>\\r\\n        <\\/div>\\r\\n\\r\\n        <div class=\\\"layout one-col fixed-width\\\" style=\\\"margin: 0 auto;max-width: 600px;min-width: 320px; width: 320px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;\\\">\\r\\n            <div class=\\\"layout__inner\\\" style=\\\"border-collapse: collapse;display: table;width: 100%;background-color: #c4e5dc;\\\" lang=\\\"x-layout__inner\\\">\\r\\n                <div class=\\\"column\\\" style=\\\"text-align: left;color: #60666d;font-size: 14px;line-height: 21px;max-width:600px;min-width:320px;\\\">\\r\\n                    <div style=\\\"margin-left: 20px;margin-right: 20px;margin-top: 24px;margin-bottom: 24px;\\\">\\r\\n                        <h1 style=\\\"margin-top: 0;margin-bottom: 0;font-style: normal;font-weight: normal;color: #44a8c7;font-size: 36px;line-height: 43px;font-family: bitter,georgia,serif;text-align: center;\\\">\\r\\n                            <img style=\\\"width: 200px;\\\" src=\\\"data:image\\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAAAwCAYAAABUmTXqAAAABGdBTUEAALGPC\\/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAABmJLR0QA\\/wD\\/AP+gvaeTAAAAB3RJTUUH5gsOBCMe2Gn2wwAAAAFvck5UAc+id5oAACxkSURBVHja7X15eFRFuv5b53T36SXd2fcQCPsSBGUVFUXBBXdFxnXcddwV0FHn+rvOjHecGXdFx33XGUVccEdBEAERlN0ohCRkTyfp\\/fTZq35\\/VHfohIQ06FznzvA+Tx6SQ1WdOnXqq2\\/\\/DgEA\\/YqjAUAAIKI7CAATAAUAx7MrkdKeALBhb7BEH6T26YnEGEnY0TuM5Bg92tsS9+8JEwDr654HcRD7CwJ0bdYTAcwH3+BJCAAaAPw3gPoefQcDeBCAJ6UPARAHcB+Ar5INe27YHpt9DoArEvdKvW8jgJsBhHrc9zAAdwLI7DFXA8DtALYeJJCD+LmQygHKAMzso91AAFcBqE655gMwC4C7l\\/ZjAVwN4DOAE0QP7pPEJQAeAJDTyxh1ABw9rh0O4FkAo3tpTwH89RddzYP4t0PqqU330W4GgFcAVKZc6yZK9UAFgBcBnJ68oF9xdCpxCACuA\\/AoeicO9DL2cYk5jN5He4aDOIifEcJ+tJ0K4FUAE9NsXwLgGQDn97huA7AAXAzzpjnWqeAEN+SXWqiD+M9EKoGQNNqPAyeSaeAcp78++QAeB3Bl4m8JwP8D8EcArn76EnCOcA64WFWWxvzSeYaDOIi0kaqDxME3ZH+bbAS4qPNnADL65wJZAB4CV6qLwBVvEf0jCmAuODFlp9FeB6D+by7eQfz7I5VAPgTXCW5A\\/6LXYHDd4Q4AD4Nv\\/n3BA+BP6N2U3BvqE2PPQXrEEQdwN4CN\\/5uL96+Oq6\\/+C9xuJ8LhGASBwOVyglKKxx9f8EtP7f8MUgkkAm4mjQG4DX37JpLQwfUCDcAj4OLUvtDfeEnsBBfJVgI4M432YQC\\/BfA0DkBJd7uPSasdYwx2uw0jRw7CN988h+nTr8GXX\\/5tf2\\/3T0dR0cnIy8tEW1sAr7zyMeLxEObNuzSHMWZ76KGb\\/ZmZM+F2H4MhQ0px+OFj0dkZxuLF9\\/7S0\\/6XhQ3o5ohTAfweXHT6fwCc++ibFMX+Dn6CPwGumP8UbAUnjnU97tEXOgHcAi7yIfksB4CJAC5AHwRGCFBYmMMkyfEVpfQ7ALsJIZg27SqsWfP0T3zknw95eSdCVXWMHz9cWLVq86EOh+MMQohvyZJVh9tsYkZm5swVoihoZWUlO02TrozH1R9VVTd\\/+p3\\/fdFtA\\/Zihv0TgIw++s4HdxQmMQvAU+Am3gPBN+DEsSXl2tPYo+D3REtiju8kLxwIcSQ4yCUAXthXO0EQAMBwu6X64uK8ZysqSh72+4Pqrl2NaGv76AAf+efDlCmXQ9MMtLUFihhjv5dl9UzGaD6lDIxxuieEdP3k5vo2Dhs24LhYTAl+\\/fWzv\\/T0\\/2VhA\\/Zy3gHcQvUYuPhyP7j4lHq6Eux92n4G4Dxw0+5Y7J+4sxzcEVnT4zrr8W\\/y3jsBXANgWWrj5HMcAKHs5QMihIAx1vUvpRQA7LGYMqS+vvWeQCDSnJHhenn06EFoa+N9fL7jAACWRbs2JcCJS5K4hNnZ+SkAQJKmw+NxQtOMbm2TiMdXYPLky+B0OrBrVxOCwWjXvCTJBsaAYPAzAMDll\\/8Pqqrq4PN5yhob\\/U8qinZyT6IAuJiY\\/AHw49y5x8krVmxEcfHt2LRpB1pbO7va9gWfz4Oysnwoiobt2\\/8OADjmmGvh8TixfXstolEZxx8\\/FaIoYMuWajQ2tmPatLHYvr0GmZkZaGz0Q5ZVEAJIkgO5uT4QQrBz56JexV2324ncXB903URbW2Cfc2OMobg4D6NGDQIhBB98cH\\/KOMfgQJCqg5QDOBTdN2MEnEvUgjviUlevDjw8JdXbTcFP4mCib3\\/KvgWgMDHuKOxxRBJwK9aLAD5PmRMFV\\/gLwT34p\\/W491pwsesnQRQFbdCg4iVtbYH3MjMzjuroCB1pGOYYSvk0NM0QKZWvz8nxfhIOy\\/6uh7EoZLmZeDzFnsSzJ62CrLOzXi4qGtxFiIQQxOOqixDBTghvZ5qWceedv1a2b6\\/FokUrIMsK\\/P5O2GyiB9y4wRhjhDFojDEtdazVq58WKivPn69p+skpBBfIysr4Kj8\\/uzoSkQdHIvIIVdUGMwYpHle33nXX0\\/r48cPhdDoExuBOmXNfIIJALEmyxy3LYgBw8cX3YO3aLdixYxfGjBnuiURkG8AOYYx5GGMb7HZRGzCgQJdlRQsEIiL2RF4QxhizLBonBFbyBozBQQicybWjlFmmSeOWRZPzcib2XG\\/zJC6XxD788IHo4MFnIS\\/vBAiCAL\\/\\/4+T\\/29C\\/eyEJBYCZSiAzATyH7qcpARAAV9578uGxAP4BHnKSGoulA3gy0ac\\/s2sBuJ\\/kTHQnPgGcSxwOvum79i54XNj8xIOmLpIO4AQAX6a5AH3CsmjA7w\\/e5vcH6vz+j18bOfJXQ1pbA6\\/qujE1pc24xsb2UYQQPwDMnj0Pa9duRU7OyHHBYGQhYywZo0YAaMOGVd7c3NzxdbK\\/YZgYM6bi8rq6lqtM0zIBiJJk3\\/z22yuvyc31yb\\/5zV+wZcsu5OT4yquqdj8DfihAEEiYEHITgE3JsVau3Ihx4y7y+f2hmZbVjRk+19i45LYEFyTHHXd9yebN1ROzs70LSkrytsbjKiTJDofDXiQI5MXE+9hXRIWoaUZ1W1vwMlXVwxdeeDe+\\/bYKmZme8aWlJae1tHTOVFXdt2LFdxWCIEjhsLxTEAhdvXrLphEjyq8Ph2NDCSFPAswBEAgCUSXJfjUhpEusJgS\\/AnAr+IEsiqJQ43Q6LhUEEko0uQHAr5EIZE0FIYS0tQWswsLZK+12+6elpUVLdV3DhAm3YOXKjQAwGdxS29\\/BTRP3WdtbNG7PzrngVqoscH+GldKOpPwkIQG4Cdz0Ox+cwHqLxaoA11lm9TFJgu4m4QwA\\/wPg+pQ59iSqnwssGo3D7XYhO\\/tU7N7dumvw4NKN9fWtU5MbkFKKeFzruv\\/QoWX46KPP4HINOhvAET0HtCx6NmPs66FD56C6+i0cccRYeDyuNe3twbtCIbmAEEAQhFEA3t+w4YdFy5c\\/DkIIDjvs4osMwzw+OY7DYX8jO9tXpSgagkF+raHBD4B1E6cAQBQFJwAUFs7G6NHnsdLS\\/KbOzvqm00674AtBEGLxuArGGJxOh8NmEw9Bggh7XRAGAAwej8s9eHCpDQCmTTvE\\/uOP9ddXVzdcZxjWkIQYilAoxl8OIZWUAm1tAf+cOTOMpqb2DEEghwGwMcYgiqLu8bg8gsDnbLfbIAikSNfNsUkuaLeLLq\\/XLSpKF8McgO4hT2CMG1IAIB5XQQgmKIp2sSiK85Ys+eurixd\\/QRMEkglgwj5f\\/J4jN3N\\/NpUbfHPehb0DCPvCJeCcpAjYKxZrFLjlaVaaY2WDE+mN+zHnnwUnnDAFhmHB53P3lM+77cfPP1+PCRMm5Oi6cSKl3bk\\/pRSdneHKIUPKPKLIaX7hwvn4+OOHvsvNzXzJZuOPZJqmva0tcE5l5RBx+vRrcOKJNw9rawtcbhjc0ORw2DtzcnyPGIappTJPl0tCRoYLNpvYbW0YY5dlZc16UBSFsUccMZZs3LgDY8YcimAwEmlubqehUBQejwsZGW7YbKLV49ED4P6oBgANbrek8bau7088caq8ZctO3HvvSyfs2tX4B00zuohDFAWDENIoCEKLzSYmF2nL4sUrVJfLSQRB6LqPzSZaXq8bPp+n6zk8HhdNEgwA2O02mpWVgYyMLsmoG4ez222B3FxfvdsttdhsIidjBhiGmWuzCQ\\/feuvCyd98833XkmDPAQ9BEJggkLbkMxJCmj0eJ\\/V4nHC7JeZ2S73mc\\/QFB4DfgesA\\/4V9s+IkzgEnrmsSkwC4nvMM+qHkBCwAeeAGg3P3Y64\\/GZRSJkkONDW1o67ubXHq1CtyLWvPHhJFIeL1uiOEEIwbdyXa2gIwDHOSrhujAIAQYni97mAsphRQSkEpmxKPq6N03dhwySV\\/xAsvfIhjj70edrvtmc7O8JxwWK5gDJBldUZdXcvklpbNa4cPP\\/yKSESuSLxM5Ob6Fj344I3rnnrqXXz44R4D4tChZRg7dnBs6dJvvg6FoqOTBEop8zBm3hKNKue+9daKd0VReCkjw\\/3tmjVbzTlzZqChwQ+PxwmPx8mSmysxdwgC+aNpWm8QQmyEAFOnjploWXRAPK6u\\/uijNerkyWPKv\\/nm+3sVRctInhJ2u22bz+f5azgcW5md7XVKkuMoRdFmUEoXiaIAp9MBMYWGRVFARoYLyUPD6XTA4bAjEol3bS+bzQafzwPWh2bEGPvTYYeNeC0QiGQ0Nvov8PuDdwCQEjqeb9u2mj6d2Ha7bX1WVsZlLS0dYUIIyc72OsaPH3aEqhoZpmlVEbJ3DkZ\\/sIGLTfeDi17pxD6dDOBlAEOxJ+AxHeIg4GLYc0iPOJIi30+G3W4TDz10eFY43ICRIweJEydeerIsK8enviSXS1o\\/fPjAraWlBWCMoaZmMWIx5STLsjyMAW631F5QkH0nIVzEZIxma5p+UkPDevh8Hjz00M049NDh+PTThTuzsrzPJzcJpTSPUnrNlCnHT+rsDF\\/ILWKAx+PcNWJE+ROPPrqIalp38VvTdKxdu83Mz8+6z+VyrkvldIwBlmUV67pxjaYZH+3YUf+s3W4b+vjjt5Li4lxIkh0TJoxo8fuDq5P9BIHA63X7nU5Hi8Nhb5DlFQ2zZk3+4pNPHn6UUvZtfX0bvv++boqiaJXJPoSQsCgK18ZiyiuMoV7TjB2yrDx36aWzL2lvD6wbNqwMbreUNJfzzWQTkZHh7uIOTqcj0YZ0zd1uF+HzeeDx9O6SM02rc\\/3671tbWzurDcNabLfb9NRn54cT7aOv2VRb+\\/Z2h8Pe6HJJDXV17+yePXvaexs2VD1hWVa9omjdOMgm8HyPoWls3OsBtIJ7u09JY88dA+BN8Lit\\/sZP4nNwMe20NNt\\/g73NxP0ieaKl+gsA5HV2Rl72+cqWvvTSRyWWZZ1oWTQr+Z8Oh93v8bj+smLFm\\/qNN96BNWu2YsKES4pqa5tnMQYIAiBJjjWDB5d+1t4e8odCsRxKGSils0866VePbNhQFQGA5uYOHHXUFbDbbS8Fg9FzIxF5DADE4+qpNTVNo1VVL0nM0QBw90cfrdnK2Nd7mWK3bHkVI0bMBWPsh7y8zAvb29n1pmldrutGNx8WpTRH0\\/SL7XZx+rRpV96oacYHRx55CG688WE9HI61pZqDYzHlfNO0KhljpKDgpJwXXvjwiOOOu\\/6u+vq2d3buXIGSkikFSdGPMYa8vCx17NghTbpuoKamCbt2LQZjDNOnX2NmZfngdrtgmla3zS+KIsnIcBGbjR8OkuSAy+VEDxELPp8Hus4PBULQk5vQcFhGKCTD43EWmqbVtadFUVDcbmcMAGIxpWuuKWMfk5NzwpOKogUNw8SQIWcPycnJzB4ypHSuLCvBjRtf7sY1NgC4CMC2NPdWHMDlAN5Ls\\/2hSI84GLhlaz7SD09ZDm7ZaEizfRfcbifcble3l2IYptjQ0HaIaVoLdN0437JoV86K1+sODRlS+teamsUrzj33N2hs9KOurhkdHeFppmkNB7hs6\\/E4P3j33RfqCcFqQSBgDNA0ozIeVyeJoohjj70Of\\/\\/7H3DccZOwfPm6Bp\\/P87QocjHHsmiWLKsTki\\/T43GuGDiw6L1RowZhwIDTe32OH398E9FoHIqiV5911jHzy8sLz8nLy1zkcklhbsXa0zYWUyqqqnbPk2Ul6\\/33VyMUioKkUB2lDKZpnQzgDkLI7bGYctXOnQ3DNm3aGWhs9GP58o9txcV5J6cSamZmBhk7dgiprByMXbsWA+Ci2qpVT8Lv\\/xgulwSn0wFBELqUasMw\\/ZLk6HS7OXdIcpA982Ww223E63UTt5tzGYfD0fOAmALgDJtNuMg0rfsYY13Kis0mvl1amr8hN9cHl0uCy9Wdg6mqnq2q2tWE4HZCyO0dHeFzamubB7W0dIpNTe18jB7r\\/DWAC8FNuv3lfRAAfnBPt4y98z4OBCa43+VucDt0OiLTB+A6TuOB3NDtdoIQAlXVkGoiTX0JDofNYAx1TqdjeXFx7osvvXTX+ksvvQfBYASffvoIGGOkuPiU05Onl91uq8nO9n5ZUjIZRUW566PR+KWMMUFV9Ywff6wf1dravmzChJEAgKqqWkydOh4Oh+3v4XDswmg0Pil1fi6XpBYV5S5sbw9Fa2s\\/Qm+W8+OPvwkAPx1VVcf339daum588utfz16+bNmGKa2tHVdEIvHzFEXrOnAopUeqqj4DKZEI\\/cBSFE0VRRGqqhFRFLoZa+JxhdXVtUDvI3LFNC1YlpVwvvL17egIbXv55Y+qR40aCKAnB+EWcsZYKDvba0QiMgghcLkcMAwjleCvBXCNZVGSfH+EEMYYe90wzFt\\/+GG3VlSUA6\\/XDcYYDMPsU+QCgNzcTDp+\\/HBEozI+++zjPbFYQJcJdjM4kTwD4Kg0Fq4dPOQjDp5bfqDQwENb\\/gzu00gHb4Bbtvypz7E\\/cDhse5lH3W5nkDF2dzyu+kVRFEpL8+OUsnXnnHNc25Ilq+hbb32BnBwfXnzxLowf\\/2uMG3dRhaYZ05P9VVX3bNmy638A0FAolguucQqMMZimders2Uc8I0mS9u23wBtv3IPy8jMQDsfa8\\/OznlAU7ZlUMcHlkl4488yjl1ZXN6K29u1enyHBaeyMYbzX6962e3eLMnBgMVpbO3VdN1b9\\/vdXrrv\\/\\/tdra2qa76SU2gHANC17Z2fYt\\/dYgNstITvb97fGxrYVgiCI2FO8oxoAZs8+whg+fO4KxthxAN\\/sfn9I+Pzz9YLT6cAhh1yILVtexZw5d8CyKKLROCKRWJJIuhZaEIg4ceIocvjhYxNcXOh6H3xcoKam+bObb74yvGDBn0AI4HRKiEaTmRldpkTCGO0iGqfTIQ8bNuC5QCDiN00LNTWLUVl5ARhjiERk6HqXWXgduF8kYf1ixONxRSoqiqOdnWEA6NOK9SO4yPIkuPOtP4TA8zxi4A6WdELaU5EMjnwEKWa4fYCBe+wXgHvtDzRIMRHCQdDDQqVUVJQs3rWrqUlRVFDKYBgWPv54DZxOB+6+m58DJ510C77+ejsyMz1HG4ZZnjJsEXjYzV6wLDqxsbF9LCHYkLxWX\\/8upk69AvG4+i5juBbAJABwOOxxQSAvvPHG52pl5eA+n2Hr1l0A4GGMPQFga1FR7pOjR1d899hjb5oOhx3z5z+m+3zurwiBhoTYKkl2q7y8SGaMobo6lfkyOBx2TJgw4kvG6JuNje3QtAg4jSgYMqQSBQVnIxqNbxFF0bQsTsyWZeXa7c55I0aU\\/3bZsi8iAPDWW1\\/gsstOccmy4rbZbJ2UMpVSpgJwMAa4XNIEy6KTXnrpo7XBYATxeAhjxozO0DSji0h03dAyMiYlDgECh6P7lnU6HUs9HtdmWVamqqp2VEKUzWhqar9m3Lhh37W2doYt6ww4nQ5QShMiVlfaU61lWa+Looh4PAZAx+7dNjzwwIsAOgAM7k4gPcrr1IEryU9hH4pySh8Z3HseBw+XT9eEHAPf6F3h6r2U+UkFA48c\\/m3ingdMHMAe5S0VqqqjoaHNbrOJiMW+QFVV730ppZgz5xjHe++tOplSKgBdMVw6sFd1GDsAGIaZY1n0xO3b126YNu1KrFnzDADg669XAsiV3W5ntKuTIMDtdhIAWLToT30+w6BBxRAEMraqqm6orpsT6+vbTn399U9XDBxYvLyx0b9FFIXBgUDkBkppl9IuiuK67GzviqQ3PWkZS4qb69dXjW1s9Nfn5WVmDRs25gRF0d2xWJzYbOLaW2+94IU\\/\\/\\/nlVfG4utayuqQMQZbVqzdt2lkxceLkuqysY4Wamma2ZMlXZV6va1tra+C3hYU52yIR+TtCyDEAoChaXnV1wwOyrN5js4lyZeXo45ubOy5JKv+CIMDn8zDDMPDAAzfC45mBWEzppmgrivY6pfSlkpL8I5ub25dompFNKUU4HJuzadOOdT5fxgOFhTno7AyDMS7qJYnP7XYe6nQ6zujsDAeOPHLCdELIoFgsTmU5l1I6+DFCyPb98YP8x8AwzC5vcF847bRbsXXrLuze3TZU180jk9d9Ps9nhmH+OR5XTQCEUmrm5mYeI8vqPbpugFKKlpaOQ88770KxpaWzi2253aXJX7tEEF3X0dq67wA9AKitbQaAQaZpZTHGoGl6nqbpc2Ix5WxRFPRoNG5njHVppxkZruiAAYWPdHZGOmbMOAzr1j2HrKxZzuTG1DQDra2dt9ls4vxwOCZs3LjDzhgX5QoLcwqamtpfsywazMryPhwKRccZhukDANO0iGlaJ\\/z4424QQkApBSEERUU5zVu2fIuSkqFxQRDeEAR6NKWMUMoQCsUOB\\/AuAFpX1yql6gd2u21rUVHOO4FABO3t\\/P6hUBQ9HLECpQyXXXbq2kce+cdiXY9ckRBlSSQi\\/5fP5\\/F\\/883GV7xenneXOr6iaCMURVtECLE2b94pJQNTE\\/T3LoDt3XwfPU7tQeDBgvs0s6b08YDrD79F+twD4CEkD4DndYi9zKMnCLhi9igS2Yb9tE8HPX1A9pSo1z7R3h6ELCuzTdMqBLoCEJfH4+py8JiwlSUl+asPPXT4IkEgzcl+lkWPWrNm6\\/Duok0XutaOUmbTdYMkTZx9QZZVxONqgBAip+pSlFLCGJOSxCGKInM6HV\\/m52dfcN55sxZXVBRBllXcdNNDZUVFuTN7PK8NgMQY7EkFO0Hc6\\/\\/4xxdUShkqKyveycryXudySVWCQLrCPSyLwjStro0sSY513MLP4PE4X3W7XY9Jkj1Vz7QDkDhBcc6RmenZMWbMoHtcLml7cXFuyjOxnuK7YBgmXn\\/9U6u4OO9vLpfUkvL8Wc3NHbf6fDkllFJYFhUY2yP+J96xDYCUnLNlUdhsIgoLs1FUlNPnRh6B9JV0gMdp3YcDV9KTKbkZSE9JJwAuS\\/S7EYA\\/tfbWAWAXeOJXcuwAEuLbvnDjjXPtr776iUUpfQMAtdlEobg4b7um6V0KdU3NIaipqa1zuXzPEYLhACil1MrK8ua1tu4VeEwBfAqgOfG7Bi4M7xPl5QWQJMeyYDB6kiTZj21vD41UFM3Kzc0c4XDYstvaghskyR5xuaRPhgwpWxuNxlu++mozZFmF3R6FoqiaZVkfgx84+zoVBABbGWPQdQNtbUG2e\\/cHrw4adMrynBzfnFAoOjUWU2hGhrvANC1VVbWo1+vRCcEXU6aMRUODH3l5WbHKyiF3bNhQtaSzMzwrHlfLJcnusdtt7mg03paR4RYLCrK\\/EQRh0VdfPd3417++gttuuyh1DuvBfWpW4l1VA8DZZ8\\/AnXde\\/F1W1qzfIOFYLi7Oo4SQz6urG6MulwSANQF4DftwijPG4HJJ1tChZc2iKHarrJjEOKRn5k0mTOWD56X\\/M8y8+0qYSmIvM+\\/+EEp\\/eQLx+Iper5922q2glMHrdZEPP1zDKGWIxXYB2L3P8QVBQCy2HGeddTvJyfGxZ5+98yfNAwAqK8+H0+lAR0cYdXUfAtAxa9aNGDGiPJ8x5p4z59j6GTNmsby8yRg5ciAKCnKwbNl6hMOfY926H5Gbm4l58x7Cp5+u7RYK0t98Zs68ASNHDsRHH61FTc1WADtwyikLMGZMhUcUBXP9+irts88e3WvdAOCHH3Zjx45vcfTRx2P69PEO07Qc27bVxN5\\/\\/34AFTjkkCNw++0XYc2arVi4cEG\\/a3TOOceitrYFVVW1kGUehKkoKwEMRUHBMKiqDtPs3\\/7D389u8DMTexHIVHDOUdnvSMA8cGp8GikF4n4GpCrhD4InUvWHZMLVLuCnKe3\\/Lrj66j8nYpwYXC4ndN3AY4\\/N\\/6ffd\\/787gTxwAM37rP9rbc+1u3v++674X99rfaFVAKZCC5mpBsK8l\\/gBJVOqAnAK47sT6jJU+Ac5bo0268BZ60NBwnkIH4upPLT8Ug\\/FGQhgNUA0tWOV4DXuLoIwPdp9pkJbiRYkmb7yeDliA7iIH42pFubNwkT3OK0ADy1NZ288w\\/BnY7V2BPK8m0a\\/Rh4qu\\/l4JmL\\/YGmOZ+DOIi0sT\\/JRzp40tTvwK0r6fRdBG7ZSg0i3AjOSVan0V8Et+JcC+D5X3qxDuI\\/D+kSSBycMP6I9OOkXgTwG\\/CweDieXZmqPFeBE8lnaY4VBE\\/jfRTpcbqDOIifBb35QdIt2pAUaZI\\/yfa9Fm3oxZlXCy5u9VW0oVt6JHhIyjzwUkS9FW3YL8JJNRnG4wEMHTocjDGUlRXAZhOxbNnCf\\/ba\\/6wYPnwunE4JXq8bp556BOrqWpEaFf63v92W9nrsWZcVv\\/Rj\\/eJIJZDPAZyBvWOIRoKX4Dkbe5f9ORd7l\\/0ZBn7iz0Z6ZX+WgZtp67EnyDFZ9mc4eFX31LI\\/O8Erm\\/zYYz4UwPZ0H1xRNBBCbACkk0+eKQcCEdLZGckEEAdIulzyXwaGYcJmE10AkyyLhisqitltt11IHnjg7yLA+q2emAgzIeDO2jjSCxr9t0cqgdRj78+s\\/Rr81O6tcNw88ConqZgC7hH\\/uQrHPZW4nlbhuP3BpEmjQCkrbW3tvKe1NXBfU1O7CeCWvLysPwiC0CCK03DhhbOxbNl6xGJxhEL7lgbLy8+Aw2HDtdeejZtv\\/hUEQcCCBY9i27YarFq1GbHYcgwdOgednWGEQp3IzMzFWWcdjfPOOx5nn30HIpFlOOWUBfjww6UAtkKSpsPpdCAc3gyeUdAdPK\\/iUIwbNxabN7+CAQMK4HA4TjJNs3DmzElPnXHGbWzRomVnWBZVnU7p4xtuuB+PPbYAQBEEoQKUru02XkVFCcAPu2sAvCIIQktr6yzceuv5GDduGH71q7vgdDq6Ct+Vlp4KQSBoaemEYXwFSZqOnBwfWlreBCGePtepqOgUtLS8z19kgsV5vTPgcjnh929FeflhCAZjiEY3orJyNrZt2wzGtoKQCkyefBwCgSiqq98EP3spgFEYPHg0OjvDGDOmAvX1bWhsXILS0tPQ1NSA7Ow8CIKAjo5P4PEcg4EDi1FVVQPgG4wbdxG2bt0FSmXwLI\\/J4HaoLSgvPxUul+M\\/t\\/To1Vf\\/BU8+eRspLz\\/jBrfbOduyLDMUir3uckmvl5bmQ9OMyYZhXm+ziSwry\\/uozSZ8u2VLtVMUxeskyf5qcXHeXK\\/XzZYu\\/XRhfv6gYR6P+yJdN36IRGJLRVHsCIc\\/x4IFj0KS7MI\\/\\/vH5mQ6Hfbam6WsCgeiLY8ZUWIyxsZSyWxhjDkmyP+VySavsdhFNTZ1zOzqCs2VZXanr5mtut1MnBOcCaLYsut7jcV3ncknPu1xSLBaLzxdFMZSVlWFfu\\/aZR48++trzTdPMXbPmmcfmzv3d6NWrt7xomlY8Ly\\/rKllWdlgWvcCyaM2QIaU\\/NDe3X62q+uOCIEQbGt5DWdlpAC\\/KdieAp9vago0DBxYOF0XxWkqpFo+rjxJCmhoblyQI6ky43U6PZdEbABwSDEafu\\/DC45f5fF7xk0++vtPtdu7aurV6LSHkFACPE0IogCuLinIr2tuD3+bnZy3etImXVM7ImIHy8qIiVdXn6bqRJYrik7t37\\/6uvLxczM31XatpxlE+n+cHl8v5ly++WCgff\\/xNt+ze3VIQj6sugKxvaHjvtYEDz0Bxcd7Imprm830+d0lxcd6Tum5s2Lq12j5gQOFlXq\\/n2HA49lZ+fubipqYOquvGlRkZbqm9PViVk5O5TJLs46PR+KmWZcUyMzMGuVzSnwzDausSgVKIww7uxf7rPoijJ04HV8oPlDgATr6vgnOhdFAM7vXvCtTZn6BFwzAxbdpVbMCAwpcURfXIsuIYO3bIkuLiXGRkOF3RqHznb35z5kVz5x73a78\\/cOeZZx7tDAQitlgsfqwsKxmKok1XFG06EEMspuRHIvLpgkDaYrF4JBnSQAjQ0RHOliTHfI\\/HZc\\/O9tmnTBnjmj17ms3vD946enTFpZMmjb6grq7lsk8+eRiNje2DZVm53uNxfWyaliZJ9iJF0RCLKYfFYsrQjo6QTZaVY+Nx1S3Liqiq2lyfz32GzSauzMyciVgsPthut1321FPvuIuK8nbEYspmy7JWl5bmNxmGCcMwo6IoXCHL6pmUsokVFSVmQQGPcg0EIggEImIgEDk0EIh4DGMzvF7PXEmyH+vzedorKkoKKipKMGjQGQB4xG9nZ+TcQw4Zdu\\/99994XklJ3uMPPPBK6emnH8UURTtBVbWJ0Wg8NxZTjo7FFBKLKYjFlKPC4ViWomjreS0vjlgsgEhEnmcYpqOwMGdtZqZnDPAd7HZxcna29\\/cPPnjTOXl5mXfGYvHTACAeV4+LxZRDQiH5m2Awcp7TebSzru4d0t4eusXlcuiyrC7bvbs1u66uBYIgzMjNzXz49NOnz3W5pMd37Wqu1DQD0ahyhCyroyllOwzDRDQaL5Ekx01FRbnBSEQ+vKam+bCmpnauI6RsLCe4fP977LuyO7BH7EnW4\\/2pld0BLpq9gj0OyP7EtFzwkkBXA73GlfWJ55\\/\\/Herr27BmzXfhWEx5MxyWN6xbtz0migKiUcUtiuKAYcPKMHhwCURRGFBX1+I0TV5z1+FwSIZhCowxygmBEFXVtg8eXLqMEEFPRsWGQjIAGF6ve5Gqaq2yrPyKMXborl1NNkEQKtau3fr2V19t\\/u+sLO\\/OJ598x8EYy9M0vb2srOBzm03c4HY71WSuPCEQJ00aXSKKgptSxhRFY3a7HaWl+assy9pcVlYAxsAIIUTXDfLGG5+ZhmF2aJqxe+nSV2Sez16w1uGwDwoEItdFo\\/JT27fXKt9\\/X9vbe2XASOTnZ24yTevteFw9WteNs7\\/88m+YPJlHIcXjGmKxeE5Ojhfjxg2F2+0sAIhr3LhhjDFmaJohulySEwDjkb0UlFK9paVziaYZ9araPZg3HldzCSHbJMn+hmGY3wIAYyjJyHB7x40biszMDFEUhfLEWjCfz9NCKd1AKTMNw8D9979mF0WSnZ3trfH5PF8oirZT03QAJGfHjoav33vvyxvC4dirNpuoJuZjBAKRDyyLNoiiAMuiyMrKsObMmbEyEIhsMAxT1DS9mxLtA4+kvQPpFUtwgCdU\\/Q39fxsE4KUi01H8hoGXCToR6WUmZoKLevOQflE7AMCsWZPg8XihKFo7eC1huN0u1NW1dMqy8vj997\\/e9PTT7zVqmvH4889\\/EJIkm+5w2Gu9Xve94Fa01gQN6wCCGzZUCYyt7Wb90XWTBoNRyemUBrrdTsHjcZKqqlqVMfaYZVGPaZoTGWOtr7\\/+qR4IRL4jhFQ3NLS9WFZW8PCYMRWlgweXIDvbuy072zeXMfbfoijojDEzkdvtFwQSkyRHMs8hCsAPECaKAggh32dn+846\\/PCzxsRicQQC0fb29uAbiqLS4cMHfltRUZwI6OtGHJ0ATKARfn\\/IFARhkMsluTweXgvB5eJL7PE4kZ3tW7Jmzdbl119\\/f0swGH3nhBOODBFyGAuFYgvb2gKVhYU5Zzgc9p2aJidF+ZAgEJ0xBln+IuW2Anw+z8uSZJ\\/j9wefj0bjYwEgGIx8tnNnw7vXXntfe1VV3epQKJqIuCad4NZMCiAgSQ689tpSXZIcSxVFu0QQyIu5ub6JubmZsNttXwoC+S4Wix8uCEL7sGEDmp1OBwAEk3NJnGcqY6xFllUGkAgSFtjUU\\/c88ODDdAol1IAT0x+QqJzYD2TwCN39+QTbJnDTcrqfYIuBh6esO4BoXi+4wSI4YcJIZGd7kZmZYX\\/nnZUlGRkudtVVpze3twfNDz5YDafT4VVVo7CgIDvsdkt01ar3O93u4c7EGO2pxHHllfeivr4N3333o5tSWjpq1CBl4cL5TS+++CHz+Tzim28uGxCNxoURIwY22myiHgrF4PN5PNu27SoePXqQsmzZwuaLL\\/4jMwzDvmbNtjKAabKsmG63q5NSSiXJXjxu3LB4IBAJtbZ2wuVyZmVmetxnnz2j5YknFjNZVu3RaLzUNE2\\/yyXF8\\/OzTw8Go6dblvVxW1tgEQ9u6EhdBwJenzdQVJRj1NS8jYKCk8p9Po9j9uxpzZGIHH\\/77RWIRJZhzJjzoao6YrF4Tltbuy8\\/P6+5vX2XfsIJs\\/HJJw8hJ+f4AYJAYqpqGJRSmRDCwIsAygCU1HX68svvcMkl98AwrGJV1Z2WRXcPHz6A7thRj8GDS7M2bKjKOfzwyujatc+2J0oJFXZ0hKz6+rYwYywbQPvFF89mZWUF9tde+3SAqmr0hBOmNjLGzCVLVsHlkjLDYbmAMdpUXl4U37jxe7jdGXng1rp4fn42dN1wFRfn5p944tSWBx\\/8h08QiAIgnmrFcqdJHD+C52JEwfMx+kMIPAX3GfC6vXFwHae\\/094LHvfvB4\\/9KuinvQP9i4V9oSvNddWqJ3HyyfMRDEaN7GzvbpfLgYaGtq5EGsuiUcZYlFKaWllDRS\\/lRp555g4MGTIHXq87HghEdlLKsHTpNwiFYgiHYxZjqOOfM3BAEAicTgdM05QZY9WWRfHqq58iEAhD102DMVabrAaSguYetwwlfpKlewxKaZ1pWigqykVhYU5tdrb3udbWwBpZVhGL7ZVqwgC0Aby+7rhxF6G5ub2eh\\/IrEEUBkQg3HG7f\\/jqczqNRVpYf0PWsgM0moqRkBDZv3pksTdRgGMkqJl1z7jW3Zd68xzBz5hQsXfp1C2MMubmZ8PuDyMnxQRSFUF5eVihZOyuBtpTf\\/QCg6yaamtoNxlgNY0BHRwimacFmE8EYC1NKwy6XhPb2ENzujN7momCPFbcrUSeVg1wGXsVwX9gMHjqyATxv5Etw0awvtINzjNdTrtnAxaG7se9S9NXgRaD94J+BfgL7\\/tKtDm5J+\\/JgNO\\/eGD\\/+IpSU5ENRVOze3YbW1s6DjsA0sD+psV+Dm1zTLSzXDB5D1bOwnAleulQGcC\\/S+1b6++Cc5ykc\\/Fb6AWHTplewadMvPYv\\/e0i3Nu8X2LvqIkHfBFYLrsB3EUePWCwKHmJyIxKfR+gFPcdehn2Hy9tw8DvpB\\/EzI3UTNqL715wATjQN4Kbfnl72CHiwoQfdY7Hi4PnpXyUbpoo8PUr6vAiuXF+BvYm1EXsHRq4FJ5I7wa1XqXM10DexHcRBHBBSdZDevmGerKhHgb0qMPbFQViiD1L79EQPf0VfZmUjOUaP9n1xCxMAO6iDHMTPhf8P\\/Itcf9Ip2+AAAAAldEVYdGRhdGU6Y3JlYXRlADIwMjItMTEtMTRUMDQ6MzU6MzArMDA6MDDyI1OYAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDIyLTExLTE0VDA0OjM1OjMwKzAwOjAwg37rJAAAAABJRU5ErkJggg==\\\" data-filename=\\\"imageedit_76_3542310111.png\\\"><\\/h1>\\r\\n                    <\\/div>\\r\\n                <\\/div>\\r\\n            <\\/div>\\r\\n\\r\\n            <div class=\\\"layout one-col fixed-width\\\" style=\\\"margin: 0 auto;max-width: 600px;min-width: 320px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;\\\">\\r\\n                <div class=\\\"layout__inner\\\" style=\\\"border-collapse: collapse;display: table;width: 100%;background-color: #ffffff;\\\" lang=\\\"x-layout__inner\\\">\\r\\n                    <div class=\\\"column\\\" style=\\\"text-align: left; background: rgb(237, 241, 235); line-height: 21px; max-width: 600px; min-width: 320px; width: 320px;\\\">\\r\\n\\r\\n                        <div style=\\\"color: rgb(96, 102, 109); font-size: 14px; margin-left: 20px; margin-right: 20px; margin-top: 24px;\\\">\\r\\n                            <div style=\\\"line-height:10px;font-size:1px\\\">&nbsp;<\\/div>\\r\\n                        <\\/div>\\r\\n\\r\\n                        <div style=\\\"margin-left: 20px; margin-right: 20px;\\\">\\r\\n\\r\\n                            <p style=\\\"color: rgb(96, 102, 109); font-size: 14px; margin-top: 16px; margin-bottom: 0px;\\\"><strong>Hello ,<\\/strong><\\/p>\\r\\n                            <p style=\\\"color: rgb(96, 102, 109); font-size: 14px; margin-top: 20px; margin-bottom: 20px;\\\"><strong>Amount 10GBP payment for Alex Hels by QR Code<\\/strong><\\/p>\\r\\n                            <p style=\\\"margin-top: 20px; margin-bottom: 20px;\\\"><strong style=\\\"color: rgb(96, 102, 109); font-size: 14px;\\\">Sincerely,<br>Team&nbsp;<\\/strong><font color=\\\"#60666d\\\"><b>Pay Secure<\\/b><\\/font><\\/p>\\r\\n                        <\\/div>\\r\\n\\r\\n                    <\\/div>\\r\\n                <\\/div>\\r\\n            <\\/div>\\r\\n\\r\\n            <div class=\\\"layout__inner\\\" style=\\\"border-collapse: collapse;display: table;width: 100%;background-color: #2c3262; margin-bottom: 20px\\\" lang=\\\"x-layout__inner\\\">\\r\\n                <div class=\\\"column\\\" style=\\\"text-align: left;color: #60666d;font-size: 14px;line-height: 21px;max-width:600px;min-width:320px;\\\">\\r\\n                    <div style=\\\"margin-top: 5px;margin-bottom: 5px;\\\">\\r\\n                        <p style=\\\"margin-top: 0;margin-bottom: 0;font-style: normal;font-weight: normal;color: #ffffff;font-size: 16px;line-height: 35px;font-family: bitter,georgia,serif;text-align: center;\\\">\\r\\n                            2022 ©  All Right Reserved<\\/p>\\r\\n                    <\\/div>\\r\\n                <\\/div>\\r\\n            <\\/div>\\r\\n\\r\\n        <\\/div>\\r\\n\\r\\n\\r\\n        <div style=\\\"border-collapse: collapse;display: table;width: 100%;\\\">\\r\\n            <div class=\\\"snippet\\\" style=\\\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 140px; width: 140px;padding: 10px 0 5px 0;color: #b9b9b9;\\\">\\r\\n            <\\/div>\\r\\n            <div class=\\\"webversion\\\" style=\\\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 139px; width: 139px;padding: 10px 0 5px 0;text-align: right;color: #b9b9b9;\\\">\\r\\n            <\\/div>\\r\\n        <\\/div>\\r\\n    <\\/div>\\r\\n<\\/div>\\\";s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";s:7:\\\"Concern\\\";s:7:\\\"address\\\";N;}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Swift_RfcComplianceException: Address in mailbox given [] does not comply with RFC 2822, 3.6.2. in E:\\xamp\\htdocs\\Wallet\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Mime\\Headers\\MailboxHeader.php:355\nStack trace:\n#0 E:\\xamp\\htdocs\\Wallet\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Mime\\Headers\\MailboxHeader.php(272): Swift_Mime_Headers_MailboxHeader->assertValidAddress(\'\')\n#1 E:\\xamp\\htdocs\\Wallet\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Mime\\Headers\\MailboxHeader.php(117): Swift_Mime_Headers_MailboxHeader->normalizeMailboxes(Array)\n#2 E:\\xamp\\htdocs\\Wallet\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Mime\\Headers\\MailboxHeader.php(74): Swift_Mime_Headers_MailboxHeader->setNameAddresses(Array)\n#3 E:\\xamp\\htdocs\\Wallet\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Mime\\SimpleHeaderFactory.php(61): Swift_Mime_Headers_MailboxHeader->setFieldBodyModel(Array)\n#4 E:\\xamp\\htdocs\\Wallet\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Mime\\SimpleHeaderSet.php(71): Swift_Mime_SimpleHeaderFactory->createMailboxHeader(\'To\', Array)\n#5 E:\\xamp\\htdocs\\Wallet\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Mime\\SimpleMessage.php(323): Swift_Mime_SimpleHeaderSet->addMailboxHeader(\'To\', Array)\n#6 E:\\xamp\\htdocs\\Wallet\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Mime\\SimpleMessage.php(299): Swift_Mime_SimpleMessage->setTo(Array)\n#7 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Message.php(164): Swift_Mime_SimpleMessage->addTo(NULL, \'Concern\')\n#8 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Message.php(98): Illuminate\\Mail\\Message->addAddresses(NULL, \'Concern\', \'To\')\n#9 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(376): Illuminate\\Mail\\Message->to(NULL, \'Concern\')\n#10 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(183): Illuminate\\Mail\\Mailable->buildRecipients(Object(Illuminate\\Mail\\Message))\n#11 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(271): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}(Object(Illuminate\\Mail\\Message))\n#12 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(187): Illuminate\\Mail\\Mailer->send(\'layouts.mail\', Array, Object(Closure))\n#13 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#14 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(188): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#15 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\SendQueuedMailable.php(65): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\MailManager))\n#16 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle(Object(Illuminate\\Mail\\MailManager))\n#17 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#18 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#19 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#20 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#21 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#22 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#23 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#24 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#25 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Mail\\SendQueuedMailable), false)\n#26 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#27 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#28 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Mail\\SendQueuedMailable))\n#30 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#31 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#32 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(378): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#33 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(172): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#34 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#35 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#36 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#37 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#38 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#39 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#40 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#41 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#42 E:\\xamp\\htdocs\\Wallet\\vendor\\symfony\\console\\Command\\Command.php(298): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Illuminate\\Console\\OutputStyle))\n#43 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Illuminate\\Console\\OutputStyle))\n#44 E:\\xamp\\htdocs\\Wallet\\vendor\\symfony\\console\\Application.php(1040): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Symfony\\Component\\Console\\Output\\BufferedOutput))\n#45 E:\\xamp\\htdocs\\Wallet\\vendor\\symfony\\console\\Application.php(301): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Symfony\\Component\\Console\\Output\\BufferedOutput))\n#46 E:\\xamp\\htdocs\\Wallet\\vendor\\symfony\\console\\Application.php(171): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Symfony\\Component\\Console\\Output\\BufferedOutput))\n#47 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(94): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Symfony\\Component\\Console\\Output\\BufferedOutput))\n#48 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(186): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Symfony\\Component\\Console\\Output\\BufferedOutput))\n#49 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(263): Illuminate\\Console\\Application->call(\'queue:work\', Array, NULL)\n#50 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(261): Illuminate\\Foundation\\Console\\Kernel->call(\'queue:work\', Array)\n#51 E:\\xamp\\htdocs\\Wallet\\routes\\web.php(75): Illuminate\\Support\\Facades\\Facade::__callStatic(\'call\', Array)\n#52 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(238): Illuminate\\Routing\\RouteFileRegistrar->{closure}()\n#53 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(208): Illuminate\\Routing\\Route->runCallable()\n#54 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(721): Illuminate\\Routing\\Route->run()\n#55 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#56 E:\\xamp\\htdocs\\Wallet\\app\\Http\\Middleware\\Language.php(22): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#57 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): App\\Http\\Middleware\\Language->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#58 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#59 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#60 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\VerifyCsrfToken.php(78): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#61 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Foundation\\Http\\Middleware\\VerifyCsrfToken->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#62 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#63 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#64 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#65 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#66 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#67 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#68 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#69 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#70 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#71 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#72 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(723): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#73 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(698): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#74 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(662): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#75 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(651): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#76 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(167): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#77 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#78 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest.php(21): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#79 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\ConvertEmptyStringsToNull.php(31): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#80 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Foundation\\Http\\Middleware\\ConvertEmptyStringsToNull->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#81 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest.php(21): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#82 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\TrimStrings.php(40): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#83 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Foundation\\Http\\Middleware\\TrimStrings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#84 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\ValidatePostSize.php(27): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#85 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Foundation\\Http\\Middleware\\ValidatePostSize->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#86 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#87 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#88 E:\\xamp\\htdocs\\Wallet\\vendor\\fruitcake\\laravel-cors\\src\\HandleCors.php(38): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#89 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Fruitcake\\Cors\\HandleCors->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#90 E:\\xamp\\htdocs\\Wallet\\vendor\\fideloper\\proxy\\src\\TrustProxies.php(57): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#91 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Fideloper\\Proxy\\TrustProxies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#92 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#93 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(142): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#94 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(111): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#95 E:\\xamp\\htdocs\\Wallet\\index.php(52): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#96 {main}', '2023-01-02 05:56:26');
INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(80, 'eac88bf9-f73b-4291-bea4-c9685c24eb95', 'database', 'default', '{\"uuid\":\"eac88bf9-f73b-4291-bea4-c9685c24eb95\",\"displayName\":\"App\\\\Mail\\\\SendOrderMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:22:\\\"App\\\\Mail\\\\SendOrderMail\\\":31:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\ProductOrder\\\";s:2:\\\"id\\\";i:54;s:9:\\\"relations\\\";a:3:{i:0;s:5:\\\"store\\\";i:1;s:10:\\\"store.user\\\";i:2;s:12:\\\"orderDetails\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:8:\\\"subtotal\\\";d:179.5;s:14:\\\"currencySymbol\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:19:\\\"App\\\\Models\\\\Currency\\\";s:2:\\\"id\\\";N;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:16:\\\"mail@example.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Illuminate\\Database\\Eloquent\\ModelNotFoundException: No query results for model [App\\Models\\Currency]. in E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php:527\nStack trace:\n#0 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(102): Illuminate\\Database\\Eloquent\\Builder->firstOrFail()\n#1 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(57): App\\Mail\\SendOrderMail->restoreModel(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#2 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesModels.php(122): App\\Mail\\SendOrderMail->getRestoredPropertyValue(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#3 [internal function]: App\\Mail\\SendOrderMail->__unserialize(Array)\n#4 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(97): unserialize(\'O:34:\"Illuminat...\')\n#5 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(60): Illuminate\\Queue\\CallQueuedHandler->getCommand(Array)\n#6 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#7 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#8 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(378): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#9 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(172): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#10 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#11 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#12 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#13 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#15 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#16 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#17 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#18 E:\\xamp\\htdocs\\Wallet\\vendor\\symfony\\console\\Command\\Command.php(298): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Illuminate\\Console\\OutputStyle))\n#19 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Illuminate\\Console\\OutputStyle))\n#20 E:\\xamp\\htdocs\\Wallet\\vendor\\symfony\\console\\Application.php(1040): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Symfony\\Component\\Console\\Output\\BufferedOutput))\n#21 E:\\xamp\\htdocs\\Wallet\\vendor\\symfony\\console\\Application.php(301): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Symfony\\Component\\Console\\Output\\BufferedOutput))\n#22 E:\\xamp\\htdocs\\Wallet\\vendor\\symfony\\console\\Application.php(171): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Symfony\\Component\\Console\\Output\\BufferedOutput))\n#23 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(94): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Symfony\\Component\\Console\\Output\\BufferedOutput))\n#24 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(186): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Symfony\\Component\\Console\\Output\\BufferedOutput))\n#25 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(263): Illuminate\\Console\\Application->call(\'queue:work\', Array, NULL)\n#26 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(261): Illuminate\\Foundation\\Console\\Kernel->call(\'queue:work\', Array)\n#27 E:\\xamp\\htdocs\\Wallet\\routes\\web.php(77): Illuminate\\Support\\Facades\\Facade::__callStatic(\'call\', Array)\n#28 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(238): Illuminate\\Routing\\RouteFileRegistrar->{closure}()\n#29 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(208): Illuminate\\Routing\\Route->runCallable()\n#30 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(721): Illuminate\\Routing\\Route->run()\n#31 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#32 E:\\xamp\\htdocs\\Wallet\\app\\Http\\Middleware\\Language.php(22): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): App\\Http\\Middleware\\Language->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\VerifyCsrfToken.php(78): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Foundation\\Http\\Middleware\\VerifyCsrfToken->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#42 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#43 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(723): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#49 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(698): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#50 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(662): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#51 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(651): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#52 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(167): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#53 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#54 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest.php(21): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#55 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\ConvertEmptyStringsToNull.php(31): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#56 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Foundation\\Http\\Middleware\\ConvertEmptyStringsToNull->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#57 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest.php(21): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#58 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\TrimStrings.php(40): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#59 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Foundation\\Http\\Middleware\\TrimStrings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#60 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\ValidatePostSize.php(27): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#61 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Foundation\\Http\\Middleware\\ValidatePostSize->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#62 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#63 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#64 E:\\xamp\\htdocs\\Wallet\\vendor\\fruitcake\\laravel-cors\\src\\HandleCors.php(38): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#65 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Fruitcake\\Cors\\HandleCors->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#66 E:\\xamp\\htdocs\\Wallet\\vendor\\fideloper\\proxy\\src\\TrustProxies.php(57): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#67 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Fideloper\\Proxy\\TrustProxies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#68 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#69 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(142): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#70 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(111): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#71 E:\\xamp\\htdocs\\Wallet\\index.php(52): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#72 {main}', '2023-01-15 00:21:20'),
(81, '408159b1-d5be-441e-b7cc-964502b3d9f7', 'database', 'default', '{\"uuid\":\"408159b1-d5be-441e-b7cc-964502b3d9f7\",\"displayName\":\"App\\\\Mail\\\\SendOrderMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:22:\\\"App\\\\Mail\\\\SendOrderMail\\\":31:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\ProductOrder\\\";s:2:\\\"id\\\";i:54;s:9:\\\"relations\\\";a:3:{i:0;s:5:\\\"store\\\";i:1;s:10:\\\"store.user\\\";i:2;s:12:\\\"orderDetails\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:8:\\\"subtotal\\\";d:179.5;s:14:\\\"currencySymbol\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:19:\\\"App\\\\Models\\\\Currency\\\";s:2:\\\"id\\\";N;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:18:\\\"demouser@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Illuminate\\Database\\Eloquent\\ModelNotFoundException: No query results for model [App\\Models\\Currency]. in E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php:527\nStack trace:\n#0 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(102): Illuminate\\Database\\Eloquent\\Builder->firstOrFail()\n#1 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(57): App\\Mail\\SendOrderMail->restoreModel(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#2 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesModels.php(122): App\\Mail\\SendOrderMail->getRestoredPropertyValue(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#3 [internal function]: App\\Mail\\SendOrderMail->__unserialize(Array)\n#4 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(97): unserialize(\'O:34:\"Illuminat...\')\n#5 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(60): Illuminate\\Queue\\CallQueuedHandler->getCommand(Array)\n#6 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#7 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#8 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(378): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#9 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(172): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#10 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#11 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#12 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#13 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#15 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#16 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#17 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#18 E:\\xamp\\htdocs\\Wallet\\vendor\\symfony\\console\\Command\\Command.php(298): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Illuminate\\Console\\OutputStyle))\n#19 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Illuminate\\Console\\OutputStyle))\n#20 E:\\xamp\\htdocs\\Wallet\\vendor\\symfony\\console\\Application.php(1040): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Symfony\\Component\\Console\\Output\\BufferedOutput))\n#21 E:\\xamp\\htdocs\\Wallet\\vendor\\symfony\\console\\Application.php(301): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Symfony\\Component\\Console\\Output\\BufferedOutput))\n#22 E:\\xamp\\htdocs\\Wallet\\vendor\\symfony\\console\\Application.php(171): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Symfony\\Component\\Console\\Output\\BufferedOutput))\n#23 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(94): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Symfony\\Component\\Console\\Output\\BufferedOutput))\n#24 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(186): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArrayInput), Object(Symfony\\Component\\Console\\Output\\BufferedOutput))\n#25 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(263): Illuminate\\Console\\Application->call(\'queue:work\', Array, NULL)\n#26 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(261): Illuminate\\Foundation\\Console\\Kernel->call(\'queue:work\', Array)\n#27 E:\\xamp\\htdocs\\Wallet\\routes\\web.php(77): Illuminate\\Support\\Facades\\Facade::__callStatic(\'call\', Array)\n#28 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(238): Illuminate\\Routing\\RouteFileRegistrar->{closure}()\n#29 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(208): Illuminate\\Routing\\Route->runCallable()\n#30 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(721): Illuminate\\Routing\\Route->run()\n#31 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#32 E:\\xamp\\htdocs\\Wallet\\app\\Http\\Middleware\\Language.php(22): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): App\\Http\\Middleware\\Language->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\VerifyCsrfToken.php(78): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Foundation\\Http\\Middleware\\VerifyCsrfToken->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#42 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#43 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(723): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#49 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(698): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#50 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(662): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#51 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(651): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#52 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(167): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#53 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#54 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest.php(21): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#55 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\ConvertEmptyStringsToNull.php(31): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#56 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Foundation\\Http\\Middleware\\ConvertEmptyStringsToNull->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#57 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest.php(21): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#58 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\TrimStrings.php(40): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#59 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Foundation\\Http\\Middleware\\TrimStrings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#60 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\ValidatePostSize.php(27): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#61 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Foundation\\Http\\Middleware\\ValidatePostSize->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#62 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#63 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#64 E:\\xamp\\htdocs\\Wallet\\vendor\\fruitcake\\laravel-cors\\src\\HandleCors.php(38): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#65 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Fruitcake\\Cors\\HandleCors->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#66 E:\\xamp\\htdocs\\Wallet\\vendor\\fideloper\\proxy\\src\\TrustProxies.php(57): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#67 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(167): Fideloper\\Proxy\\TrustProxies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#68 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#69 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(142): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#70 E:\\xamp\\htdocs\\Wallet\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(111): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#71 E:\\xamp\\htdocs\\Wallet\\index.php(52): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#72 {main}', '2023-01-15 00:21:20');

-- --------------------------------------------------------

--
-- Table structure for table `firebase_notifies`
--

CREATE TABLE `firebase_notifies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `server_key` varchar(255) DEFAULT NULL,
  `vapid_key` varchar(255) DEFAULT NULL,
  `api_key` varchar(255) DEFAULT NULL,
  `auth_domain` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `storage_bucket` varchar(255) DEFAULT NULL,
  `messaging_sender_id` varchar(255) DEFAULT NULL,
  `app_id` varchar(255) DEFAULT NULL,
  `measurement_id` varchar(255) DEFAULT NULL,
  `user_foreground` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=> off, 1=> on',
  `user_background` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=> off, 1=> on',
  `admin_foreground` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=> off, 1=> on',
  `admin_background` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=> off, 1=> on',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `firebase_notifies`
--

INSERT INTO `firebase_notifies` (`id`, `server_key`, `vapid_key`, `api_key`, `auth_domain`, `project_id`, `storage_bucket`, `messaging_sender_id`, `app_id`, `measurement_id`, `user_foreground`, `user_background`, `admin_foreground`, `admin_background`, `created_at`, `updated_at`) VALUES
(1, 'Your Server_KEY', 'Your_Vapid Key', 'Your_API Key', 'appSecret', 'Project_Id', 'Storage_Bucket', 'Sender_Id', 'App_Id', 'Measurement_Id', 0, 0, 0, 0, '2023-03-16 00:06:24', '2023-03-16 00:06:24');

-- --------------------------------------------------------

--
-- Table structure for table `funds`
--

CREATE TABLE `funds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Deposit from admin',
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `percentage` decimal(18,8) NOT NULL DEFAULT 0.00000000 COMMENT 'Percent of charge',
  `charge_percentage` decimal(18,8) NOT NULL DEFAULT 0.00000000 COMMENT 'After adding percent of charge',
  `charge_fixed` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `amount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `received_amount` decimal(18,8) NOT NULL DEFAULT 0.00000000 COMMENT 'Amount add to receiver',
  `note` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=Success,0=Pending',
  `utr` char(36) DEFAULT NULL,
  `payment_id` varchar(61) DEFAULT NULL,
  `card_order_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `sort_by` int(11) DEFAULT 1,
  `image` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: inactive, 1: active',
  `parameters` text DEFAULT NULL,
  `currencies` text DEFAULT NULL,
  `extra_parameters` text DEFAULT NULL,
  `currency` varchar(191) NOT NULL,
  `symbol` varchar(191) NOT NULL,
  `is_sandbox` tinyint(1) NOT NULL DEFAULT 0,
  `environment` enum('test','live') NOT NULL DEFAULT 'live',
  `min_amount` decimal(18,8) NOT NULL,
  `max_amount` decimal(18,8) NOT NULL,
  `percentage_charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `fixed_charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `convention_rate` decimal(18,8) NOT NULL DEFAULT 1.00000000,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `code`, `name`, `sort_by`, `image`, `status`, `parameters`, `currencies`, `extra_parameters`, `currency`, `symbol`, `is_sandbox`, `environment`, `min_amount`, `max_amount`, `percentage_charge`, `fixed_charge`, `convention_rate`, `note`, `created_at`, `updated_at`) VALUES
(1, 'paypal', 'Paypal', 2, '6369f8a5aa4551667889317.jpg', 0, '{\"cleint_id\":\"\",\"secret\":\"\"}', '{\"0\":{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"USD\"}}', NULL, 'USD', 'USD', 1, 'test', '1.00000000', '10000.00000000', '1.00000000', '0.50000000', '1.00000000', NULL, '2020-09-10 09:05:02', '2023-03-16 00:16:29'),
(2, 'stripe', 'Stripe ', 4, '6369f8cb536811667889355.jpg', 0, '{\"secret_key\":\"\",\"publishable_key\":\"\"}', '{\"0\":{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}}', NULL, 'USD', 'USD', 1, 'test', '1.00000000', '10000.00000000', '0.00000000', '0.50000000', '1.00000000', NULL, '2020-09-10 09:05:02', '2023-03-16 00:16:29'),
(3, 'skrill', 'Skrill', 6, '6369f81ab99a21667889178.jpg', 0, '{\"pay_to_email\":\"\",\"secret_key\":\"\"}', '{\"0\":{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"MAD\":\"MAD\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"SAR\":\"SAR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TND\":\"TND\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\",\"COP\":\"COP\"}}', NULL, 'USD', 'USD', 0, '', '1.00000000', '10000.00000000', '0.00000000', '0.50000000', '1.00000000', NULL, '2020-09-10 09:05:02', '2023-03-16 00:16:29'),
(4, 'perfectmoney', 'Perfect Money', 31, '6369fa31e12df1667889713.jpg', 0, '{\"passphrase\":\"\",\"payee_account\":\"\"}', '{\"0\":{\"USD\":\"USD\",\"EUR\":\"EUR\"}}', NULL, 'USD', 'USD', 0, '', '1.00000000', '10000.00000000', '0.00000000', '0.50000000', '1.00000000', NULL, '2020-09-10 09:05:02', '2023-03-16 00:16:29'),
(5, 'paytm', 'PayTM', 30, '6369f9afa42461667889583.jpg', 0, '{\"MID\":\"\",\"merchant_key\":\"\",\"WEBSITE\":\"\",\"INDUSTRY_TYPE_ID\":\"\",\"CHANNEL_ID\":\"\",\"environment_url\":\"\",\"process_transaction_url\":\"\"}', '{\"0\":{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}}', NULL, 'INR', 'INR', 1, 'test', '1.00000000', '10000.00000000', '0.00000000', '0.50000000', '1.00000000', NULL, '2020-09-10 09:05:02', '2023-03-16 00:16:29'),
(6, 'payeer', 'Payeer', 28, '6369f9a0071251667889568.jpg', 0, '{\"merchant_id\":\"\",\"secret_key\":\"\"}', '{\"0\":{\"USD\":\"USD\",\"EUR\":\"EUR\",\"RUB\":\"RUB\"}}', '{\"status\":\"ipn\"}', 'USD', 'USD', 0, '', '1.00000000', '10000.00000000', '0.00000000', '0.50000000', '1.00000000', NULL, '2020-09-10 09:05:02', '2023-03-16 00:16:29'),
(7, 'paystack', 'PayStack', 29, '6369f9a838c321667889576.jpg', 0, '{\"public_key\":\"\",\"secret_key\":\"\"}', '{\"0\":{\"USD\":\"USD\",\"NGN\":\"NGN\"}}', '{\"callback\":\"ipn\",\"webhook\":\"ipn\"}\r\n', 'NGN', 'NGN', 0, '', '1.00000000', '10000.00000000', '0.00000000', '0.50000000', '1.00000000', NULL, '2020-09-10 09:05:02', '2023-03-16 00:16:29'),
(8, 'voguepay', 'VoguePay', 35, '6369f9dd947711667889629.jpg', 0, '{\"merchant_id\":\"\"}', '{\"0\":{\"NGN\":\"NGN\",\"USD\":\"USD\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"ZAR\":\"ZAR\",\"JPY\":\"JPY\",\"INR\":\"INR\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PLN\":\"PLN\"}}\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', NULL, 'NGN', 'NGN', 0, '', '1.00000000', '10000.00000000', '0.00000000', '0.50000000', '1.00000000', NULL, '2020-09-10 09:05:02', '2023-03-16 00:16:29'),
(9, 'flutterwave', 'Flutterwave', 24, '6369f9945993b1667889556.jpg', 0, '{\"public_key\":\"\",\"secret_key\":\"\",\"encryption_key\":\"\"}', '{\"0\":{\"KES\":\"KES\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"USD\":\"USD\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"UGX\":\"UGX\",\"TZS\":\"TZS\"}}', NULL, 'USD', 'USD', 0, '', '1.00000000', '10000.00000000', '0.00000000', '0.50000000', '1.00000000', NULL, '2020-09-10 09:05:02', '2023-03-16 00:16:29'),
(10, 'razorpay', 'RazorPay', 33, '6369f9be2e8f01667889598.jpg', 0, '{\"key_id\":\"\",\"key_secret\":\"\"}', '{\"0\":{\"INR\":\"INR\"}}', NULL, 'INR', 'INR', 0, '', '1.00000000', '10000.00000000', '0.00000000', '0.50000000', '1.00000000', NULL, '2020-09-10 09:05:02', '2023-03-16 00:16:29'),
(11, 'instamojo', 'instamojo', 13, '6369f90a5d0721667889418.jpg', 0, '{\"api_key\":\"\",\"auth_token\":\"\",\"salt\":\"\"}', '{\"0\":{\"INR\":\"INR\"}}', NULL, 'INR', 'INR', 0, '', '1.00000000', '10000.00000000', '0.00000000', '0.50000000', '73.51000000', NULL, '2020-09-10 09:05:02', '2023-03-16 00:16:29'),
(12, 'mollie', 'Mollie', 26, '62a02512f1c291654662418.png', 0, '{\"api_key\":\"\"}', '{\"0\":{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}}', NULL, 'USD', 'USD', 0, 'live', '1.00000000', '10000.00000000', '0.00000000', '0.50000000', '73.51000000', NULL, '2020-09-10 09:05:02', '2023-03-16 00:16:29'),
(13, 'twocheckout', '2checkout', 10, '6369f8fa28e6f1667889402.jpg', 0, '{\"merchant_code\":\"\",\"secret_key\":\"\"}', '{\"0\":{\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"DZD\":\"DZD\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"AZN\":\"AZN\",\"BSD\":\"BSD\",\"BDT\":\"BDT\",\"BBD\":\"BBD\",\"BZD\":\"BZD\",\"BMD\":\"BMD\",\"BOB\":\"BOB\",\"BWP\":\"BWP\",\"BRL\":\"BRL\",\"GBP\":\"GBP\",\"BND\":\"BND\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"XCD\":\"XCD\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"FJD\":\"FJD\",\"GTQ\":\"GTQ\",\"HKD\":\"HKD\",\"HNL\":\"HNL\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JMD\":\"JMD\",\"JPY\":\"JPY\",\"KZT\":\"KZT\",\"KES\":\"KES\",\"LAK\":\"LAK\",\"MMK\":\"MMK\",\"LBP\":\"LBP\",\"LRD\":\"LRD\",\"MOP\":\"MOP\",\"MYR\":\"MYR\",\"MVR\":\"MVR\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NIO\":\"NIO\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PGK\":\"PGK\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"WST\":\"WST\",\"SAR\":\"SAR\",\"SCR\":\"SCR\",\"SGD\":\"SGD\",\"SBD\":\"SBD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"SYP\":\"SYP\",\"THB\":\"THB\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TRY\":\"TRY\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"USD\":\"USD\",\"VUV\":\"VUV\",\"VND\":\"VND\",\"XOF\":\"XOF\",\"YER\":\"YER\"}}', '{\"approved_url\":\"ipn\"}', 'USD', 'USD', 0, '', '1.00000000', '10000.00000000', '0.00000000', '0.50000000', '1.00000000', NULL, '2020-09-10 09:05:02', '2023-03-16 00:16:29'),
(14, 'authorizenet', 'Authorize.Net', 8, '6369f8e57971e1667889381.jpg', 0, '{\"login_id\":\"\",\"current_transaction_key\":\"\"}', '{\"0\":{\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"USD\":\"USD\"}}', NULL, 'USD', 'USD', 1, 'test', '1.00000000', '10000.00000000', '0.00000000', '0.50000000', '1.00000000', NULL, '2020-09-10 09:05:02', '2023-03-16 00:16:29'),
(15, 'securionpay', 'SecurionPay', 34, '6369f9c78112c1667889607.jpg', 0, '{\"public_key\":\"\",\"secret_key\":\"\"}', '{\"0\":{\"AFN\":\"AFN\", \"DZD\":\"DZD\", \"ARS\":\"ARS\", \"AUD\":\"AUD\", \"BHD\":\"BHD\", \"BDT\":\"BDT\", \"BYR\":\"BYR\", \"BAM\":\"BAM\", \"BWP\":\"BWP\", \"BRL\":\"BRL\", \"BND\":\"BND\", \"BGN\":\"BGN\", \"CAD\":\"CAD\", \"CLP\":\"CLP\", \"CNY\":\"CNY\", \"COP\":\"COP\", \"KMF\":\"KMF\", \"HRK\":\"HRK\", \"CZK\":\"CZK\", \"DKK\":\"DKK\", \"DJF\":\"DJF\", \"DOP\":\"DOP\", \"EGP\":\"EGP\", \"ETB\":\"ETB\", \"ERN\":\"ERN\", \"EUR\":\"EUR\", \"GEL\":\"GEL\", \"HKD\":\"HKD\", \"HUF\":\"HUF\", \"ISK\":\"ISK\", \"INR\":\"INR\", \"IDR\":\"IDR\", \"IRR\":\"IRR\", \"IQD\":\"IQD\", \"ILS\":\"ILS\", \"JMD\":\"JMD\", \"JPY\":\"JPY\", \"JOD\":\"JOD\", \"KZT\":\"KZT\", \"KES\":\"KES\", \"KWD\":\"KWD\", \"KGS\":\"KGS\", \"LVL\":\"LVL\", \"LBP\":\"LBP\", \"LTL\":\"LTL\", \"MOP\":\"MOP\", \"MKD\":\"MKD\", \"MGA\":\"MGA\", \"MWK\":\"MWK\", \"MYR\":\"MYR\", \"MUR\":\"MUR\", \"MXN\":\"MXN\", \"MDL\":\"MDL\", \"MAD\":\"MAD\", \"MZN\":\"MZN\", \"NAD\":\"NAD\", \"NPR\":\"NPR\", \"ANG\":\"ANG\", \"NZD\":\"NZD\", \"NOK\":\"NOK\", \"OMR\":\"OMR\", \"PKR\":\"PKR\", \"PEN\":\"PEN\", \"PHP\":\"PHP\", \"PLN\":\"PLN\", \"QAR\":\"QAR\", \"RON\":\"RON\", \"RUB\":\"RUB\", \"SAR\":\"SAR\", \"RSD\":\"RSD\", \"SGD\":\"SGD\", \"ZAR\":\"ZAR\", \"KRW\":\"KRW\", \"IKR\":\"IKR\", \"LKR\":\"LKR\", \"SEK\":\"SEK\", \"CHF\":\"CHF\", \"SYP\":\"SYP\", \"TWD\":\"TWD\", \"TZS\":\"TZS\", \"THB\":\"THB\", \"TND\":\"TND\", \"TRY\":\"TRY\", \"UAH\":\"UAH\", \"AED\":\"AED\", \"GBP\":\"GBP\", \"USD\":\"USD\", \"VEB\":\"VEB\", \"VEF\":\"VEF\", \"VND\":\"VND\", \"XOF\":\"XOF\", \"YER\":\"YER\", \"ZMK\":\"ZMK\"}}', NULL, 'USD', 'USD', 0, '', '1.00000000', '10000.00000000', '0.00000000', '0.50000000', '1.00000000', NULL, '2020-09-10 09:05:02', '2023-03-16 00:16:29'),
(16, 'payumoney', 'PayUmoney', 32, '6369f9b5ef2411667889589.jpg', 0, '{\"merchant_key\":\"\",\"salt\":\"\"}', '{\"0\":{\"INR\":\"INR\"}}', NULL, 'INR', 'INR', 1, 'test', '1.00000000', '10000.00000000', '0.00000000', '0.50000000', '73.51000000', NULL, '2020-09-10 09:05:02', '2023-03-16 00:16:29'),
(17, 'mercadopago', 'Mercado Pago', 25, '6369f999dfb2e1667889561.jpg', 0, '{\"access_token\":\"\"}', '{\"0\":{\"ARS\":\"ARS\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"DOP\":\"DOP\",\"EUR\":\"EUR\",\"GTQ\":\"GTQ\",\"HNL\":\"HNL\",\"MXN\":\"MXN\",\"NIO\":\"NIO\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PYG\":\"PYG\",\"USD\":\"USD\",\"UYU\":\"UYU\",\"VEF\":\"VEF\",\"VES\":\"VES\"}}', NULL, 'BRL', 'BRL', 0, '', '3715.12000000', '371500000.12000000', '0.00000000', '0.50000000', '3715.12000000', NULL, '2020-09-10 09:05:02', '2023-03-16 00:16:29'),
(18, 'coingate', 'Coingate', 22, '6369f94f842d81667889487.jpg', 0, '{\"api_key\":\"\"}', '{\"0\":{\"USD\":\"USD\",\"EUR\":\"EUR\"}}', NULL, 'USD', 'USD', 1, 'test', '1.00000000', '10000.00000000', '0.00000000', '0.50000000', '1.00000000', NULL, '2020-09-10 09:05:02', '2023-03-16 00:16:29'),
(19, 'coinbasecommerce', 'Coinbase Commerce', 21, '6369f94339bf41667889475.jpg', 0, '{\"api_key\":\"\",\"secret\":\"\"}', '{\"0\":{\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CHF\":\"CHF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"EUR\":\"EUR\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GBP\":\"GBP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HKD\":\"HKD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"INR\":\"INR\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NOK\":\"NOK\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RUB\":\"RUB\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TRY\":\"TRY\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZAR\":\"ZAR\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}}', '{\"webhook\":\"ipn\"}', 'USD', 'USD', 0, '', '1.00000000', '10000.00000000', '0.00000000', '0.50000000', '1.00000000', NULL, '2020-09-10 09:05:02', '2023-03-16 00:16:29'),
(20, 'monnify', 'Monnify', 27, '62a0252654b071654662438.png', 0, '{\"api_key\":\"\",\"secret_key\":\"\",\"contract_code\":\"\"}', '{\"0\":{\"NGN\":\"NGN\"}}', NULL, 'NGN', 'NGN', 0, 'live', '1.00000000', '10000.00000000', '0.00000000', '0.50000000', '1.00000000', NULL, '2020-09-10 09:05:02', '2023-03-16 00:16:29'),
(21, 'blockio', 'Block.io', 15, '63db63437ced41675322179.jpg', 0, '{\"api_key\":\"\",\"api_pin\":\"\"}', '{\"1\":{\"BTC\":\"BTC\",\"LTC\":\"LTC\",\"DOGE\":\"DOGE\"}}', '{\"cron\":\"ipn\"}', 'BTC', 'BTC', 0, '', '0.00004200', '10000.00000000', '0.00000000', '0.50000000', '0.00004200', NULL, '2020-09-10 09:05:02', '2023-03-16 00:16:29'),
(22, 'coinpayments', 'CoinPayments', 23, '6369f9591a8d51667889497.jpg', 0, '{\"merchant_id\":\"\",\"private_key\":\"\",\"public_key\":\"\"}', '{\"0\":{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\"},\"1\":{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}}', '{\"callback\":\"ipn\"}', 'BTC', 'BTC', 0, '', '0.00004200', '10000.00000000', '0.00000000', '0.50000000', '0.00004200', NULL, '2020-09-10 09:05:02', '2023-03-16 00:16:29'),
(23, 'blockchain', 'Blockchain', 18, '6369f932cde211667889458.jpg', 0, '{\"api_key\":\"\",\"xpub_code\":\"\"}', '{\"1\":{\"BTC\":\"BTC\"}}', NULL, 'BTC', 'BTC', 0, '', '0.00000000', '10000.00000000', '0.00000000', '0.50000000', '0.00000000', NULL, '2020-09-10 09:05:02', '2023-03-16 00:16:29'),
(24, 'midtrans', 'Midtrans', 16, '63db5ec76455b1675321031.png', 0, '{\"client_key\":\"\",\"server_key\":\"\"}', '{\"0\":{\"IDR\":\"IDR\"}}', '{\"payment_notification_url\":\"ipn\", \"finish redirect_url\":\"ipn\", \"unfinish redirect_url\":\"failed\",\"error redirect_url\":\"failed\"}', 'IDR', 'IDR', 1, 'test', '1.00000000', '10000.00000000', '0.00000000', '0.05000000', '14835.20000000', '', '2020-09-09 09:05:02', '2023-03-16 00:16:29'),
(25, 'cashmaal', 'cashmaal', 20, '6369f9384f75d1667889464.jpg', 0, '{\"web_id\":\"\",\"ipn_key\":\"\"}', '{\"0\":{\"PKR\":\"PKR\",\"USD\":\"USD\"}}', '{\"ipn_url\":\"ipn\"}', 'PKR', 'PKR', 0, '', '1.00000000', '100.00000000', '0.00000000', '0.00000000', '1.00000000', NULL, NULL, '2023-03-16 00:16:29'),
(26, 'binance', 'Binance', 17, '63d8e062e2c5f1675157602.png', 0, '{\"mercent_api_key\":\"\",\"mercent_secret\":\"\"}', '{\"1\":{\"ADA\":\"ADA\",\"ATOM\":\"ATOM\",\"AVA\":\"AVA\",\"BCH\":\"BCH\",\"BNB\":\"BNB\",\"BTC\":\"BTC\",\"BUSD\":\"BUSD\",\"CTSI\":\"CTSI\",\"DASH\":\"DASH\",\"DOGE\":\"DOGE\",\"DOT\":\"DOT\",\"EGLD\":\"EGLD\",\"EOS\":\"EOS\",\"ETC\":\"ETC\",\"ETH\":\"ETH\",\"FIL\":\"FIL\",\"FRONT\":\"FRONT\",\"FTM\":\"FTM\",\"GRS\":\"GRS\",\"HBAR\":\"HBAR\",\"IOTX\":\"IOTX\",\"LINK\":\"LINK\",\"LTC\":\"LTC\",\"MANA\":\"MANA\",\"MATIC\":\"MATIC\",\"NEO\":\"NEO\",\"OM\":\"OM\",\"ONE\":\"ONE\",\"PAX\":\"PAX\",\"QTUM\":\"QTUM\",\"STRAX\":\"STRAX\",\"SXP\":\"SXP\",\"TRX\":\"TRX\",\"TUSD\":\"TUSD\",\"UNI\":\"UNI\",\"USDC\":\"USDC\",\"USDT\":\"USDT\",\"WRX\":\"WRX\",\"XLM\":\"XLM\",\"XMR\":\"XMR\",\"XRP\":\"XRP\",\"XTZ\":\"XTZ\",\"XVS\":\"XVS\",\"ZEC\":\"ZEC\",\"ZIL\":\"ZIL\"}}', '', 'USDT', 'BTC', 0, '', '0.00004200', '10000.00000000', '0.00000000', '0.50000000', '0.00004200', NULL, '2020-09-10 09:05:02', '2023-03-16 00:16:29'),
(27, 'peachpayments', 'peachpayments', 14, '63db5f625d8051675321186.png', 0, '{\"Authorization_Bearer\":\"\",\"Entity_ID\":\"\",\"Recur_Channel\":\"\"}', '{\"0\":{\"AED\":\"AED\",\"AFA\":\"AFA\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"AWG\":\"AWG\",\"AZM\":\"AZM\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYR\":\"BYR\",\"BZD\":\"BZD\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CYP\":\"CYP\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EEK\":\"EEK\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"EUR\":\"EUR\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GBP\":\"GBP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHC\":\"GHC\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HKD\":\"HKD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"INR\":\"INR\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LTL\":\"LTL\",\"LVL\":\"LVL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MTL\":\"MTL\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"MZM\":\"MZM\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NOK\":\"NOK\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PTS\":\"PTS\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDD\":\"SDD\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"SHP\":\"SHP\",\"SIT\":\"SIT\",\"SKK\":\"SKK\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SPL\":\"SPL\",\"SRD\":\"SRD\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMM\":\"TMM\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TRL\":\"TRL\",\"TRY\":\"TRY\",\"TTD\":\"TTD\",\"TVD\":\"TVD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZAR\":\"ZAR\",\"ZMK\":\"ZMK\",\"ZWD\":\"ZWD\"}}', NULL, 'USD', 'USD', 1, 'test', '100.00000000', '10000.00000000', '0.00000000', '0.50000000', '1.00000000', '', '2020-09-09 15:05:02', '2023-03-16 00:16:29'),
(28, 'nowpayments', 'Nowpayments', 5, '63db5fe0ecda91675321312.jpg', 0, '{\"api_key\":\"\"}', '{\"1\":{\"BTC\":\"BTC\",\"LTC\":\"LTC\",\"DOGE\":\"DOGE\"}}', '{\"cron\":\"ipn\"}', 'BTC', 'BTC', 0, '', '10.10000000', '10000.00000000', '0.00000000', '0.50000000', '1.00000000', NULL, '2020-09-09 09:05:02', '2023-03-16 00:16:29'),
(29, 'khalti', 'Khalti Payment', 9, '63db601dc202b1675321373.webp', 0, '{\"secret_key\":\"\",\"public_key\":\"\"}', '{\"0\":{\"NPR\":\"NPR\"}}', NULL, 'NPR', 'NPR', 1, 'live', '100.00000000', '10000.00000000', '0.00000000', '0.00000000', '1.00000000', '', '2020-09-09 09:05:02', '2023-03-16 00:16:29'),
(30, 'swagger', 'MAGUA PAY', 7, '63db60dd217751675321565.png', 0, '{\"MAGUA_PAY_ACCOUNT\":\"\",\"MerchantKey\":\"\",\"Secret\":\"\"}', '{\"0\":{\"EUR\":\"EUR\"}}', NULL, 'EUR', 'EUR', 1, 'test', '100.00000000', '10000.00000000', '0.00000000', '0.00000000', '1.00000000', '', '2020-09-09 09:05:02', '2023-03-16 00:16:29'),
(31, 'freekassa', 'Free kassa', 3, '63db6113451f11675321619.jpg', 0, '{\"merchant_id\":\"\",\"merchant_key\":\"\",\"secret_word\":\"\",\"secret_word2\":\"\"}', '{\"0\":{\"RUB\":\"RUB\",\"USD\":\"USD\",\"EUR\":\"EUR\",\"UAH\":\"UAH\",\"KZT\":\"KZT\"}}', '{\"ipn_url\":\"ipn\"}', 'USD', 'RUB', 0, '', '10.00000000', '10000.00000000', '0.10000000', '0.00000000', '1.00000000', NULL, '2020-09-09 09:05:02', '2023-03-16 00:16:29'),
(32, 'konnect', 'Konnect', 19, '63db613ccb4d41675321660.jpg', 0, '{\"api_key\":\"\",\"receiver_wallet_Id\":\"\"}', '{\"0\":{\"TND\":\"TND\",\"EUR\":\"EUR\",\"USD\":\"USD\"}}', '{\"webhook\":\"ipn\"}', 'USD', 'USD', 1, 'live', '1.00000000', '10000.00000000', '0.00000000', '0.00000000', '1.00000000', '', '2020-09-09 09:05:02', '2023-03-16 00:16:29'),
(33, 'mypay', 'Mypay Np', 11, '63db615bdda911675321691.png', 0, '{\"merchant_username\":\"\",\"merchant_api_password\":\"\",\"merchant_id\":\"\",\"api_key\":\"\"}', '{\"0\":{\"NPR\":\"NPR\"}}', NULL, 'NPR', 'NPR', 1, 'live', '1.00000000', '100000.00000000', '1.50000000', '0.00000000', '1.00000000', '', '2020-09-09 09:05:02', '2023-03-16 00:16:29'),
(34, 'paythrow', 'PayThrow', 36, '63db62709b79c1675321968.jpg', 0, '{\"client_id\":\"\",\"client_secret\":\"\"}', '{\"0\":{\"PKR\":\"PKR\",\"USD\":\"USD\"}}', '{\"ipn_url\":\"ipn\"}', 'USD', 'USD', 0, '', '1.00000000', '10000.00000000', '0.00000000', '0.50000000', '157.96000000', NULL, '2020-09-09 15:05:02', '2023-03-16 00:16:29'),
(35, 'imepay', 'IME PAY', 12, '63db61ffa1f641675321855.png', 0, '{\"MerchantModule\":\"\",\"MerchantCode\":\"\",\"username\":\"\",\"password\":\"\"}', '{\"0\":{\"NPR\":\"NPR\"}}', NULL, 'NPR', 'NPR', 0, '', '1.00000000', '100000.00000000', '1.50000000', '0.00000000', '1.00000000', '', '2020-09-09 09:05:02', '2023-03-16 00:16:29'),
(36, 'fastPay', 'FastPay', 1, '63f218a53bab51676810405.png', 0, '{\"store_id\":\"\",\"store_password\":\"\"}', '{\"0\":{\"IQD\":\"IQD\"}}', '{\"ipn_url\":\"ipn\"}', 'IQD', 'IQD', 1, 'live', '1.00000000', '100000.00000000', '1.50000000', '0.00000000', '1.00000000', '', '2020-09-09 09:05:02', '2023-03-16 00:16:29');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `recuring_invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `invoice_number` varchar(255) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `percentage` decimal(10,8) DEFAULT NULL COMMENT 'percebt value of charge',
  `charge_percentage` decimal(10,8) DEFAULT NULL COMMENT 'value after percent charge',
  `charge_fixed` decimal(10,8) DEFAULT NULL COMMENT 'fixed charge',
  `charge` decimal(10,8) DEFAULT NULL COMMENT 'overall charge for currency',
  `tax` double DEFAULT NULL,
  `vat` double DEFAULT NULL,
  `tax_rate` double DEFAULT NULL,
  `vat_rate` double DEFAULT NULL,
  `grand_total` decimal(8,2) DEFAULT NULL,
  `frequency` varchar(255) DEFAULT NULL COMMENT '1=>one Time, 2=>weekly, 3=>monthly',
  `has_slug` varchar(255) DEFAULT NULL COMMENT '1',
  `due_date` timestamp NULL DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `charge_pay` tinyint(4) DEFAULT 0 COMMENT '0=> sender , 1 receiver',
  `status` varchar(255) DEFAULT NULL COMMENT 'paid , pending , rejected',
  `seen_at` timestamp NULL DEFAULT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `rejected_at` timestamp NULL DEFAULT NULL,
  `mark_as_paid_at` timestamp NULL DEFAULT NULL,
  `reminder_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kycs`
--

CREATE TABLE `kycs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `input_form` longtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kycs`
--

INSERT INTO `kycs` (`id`, `input_form`, `status`, `created_at`, `updated_at`) VALUES
(2, '{\"DrivingLiences\":{\"field_name\":\"DrivingLiences\",\"field_level\":\"Driving Liences\",\"type\":\"text\",\"validation\":\"required\"},\"Address\":{\"field_name\":\"Address\",\"field_level\":\"Address\",\"type\":\"textarea\",\"validation\":\"required\"},\"PassportDocument\":{\"field_name\":\"PassportDocument\",\"field_level\":\"Passport Document\",\"type\":\"file\",\"validation\":\"required\"}}', 1, '2022-12-10 02:25:32', '2022-12-10 02:25:35');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `short_name` varchar(10) DEFAULT NULL,
  `flag` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = active, 0 = inactive',
  `rtl` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = active, 0 = inactive	',
  `default_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `short_name`, `flag`, `is_active`, `rtl`, `default_status`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 'en.png', 1, 0, 1, '2021-01-20 04:49:29', '2021-10-31 09:44:53'),
(2, 'Spanish', 'es', 'es.jpg', 1, 0, 0, '2021-01-21 05:33:06', '2022-06-25 05:42:26');

-- --------------------------------------------------------

--
-- Table structure for table `line_items`
--

CREATE TABLE `line_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `line_item_type` varchar(255) NOT NULL,
  `line_item_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `description` longtext DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `subtotal` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_10_19_061600_create_basic_controls_table', 1),
(5, '2020_10_20_100935_create_email_controls_table', 1),
(6, '2020_10_24_072526_create_email_templates_table', 1),
(7, '2020_11_07_085217_create_currencies_table', 2),
(8, '2020_11_08_075435_create_charges_limits_table', 3),
(9, '2020_11_09_112425_create_transfers_table', 4),
(10, '2020_11_11_103026_create_wallets_table', 5),
(11, '2020_11_14_065358_create_security_questions_table', 6),
(12, '2020_11_14_085811_create_two_factor_settings_table', 7),
(13, '2020_11_16_074706_create_transactions_table', 8),
(14, '2020_11_16_132223_create_jobs_table', 9),
(15, '2020_11_18_063222_create_exchanges_table', 10),
(16, '2020_11_19_072459_create_request_money_table', 11),
(17, '2020_11_25_060330_create_user_profiles_table', 12),
(18, '2020_11_30_095703_create_redeem_codes_table', 13),
(19, '2020_12_03_103512_create_admins_table', 14),
(20, '2020_12_06_100331_create_escrows_table', 15),
(21, '2020_12_09_064344_create_vouchers_table', 16),
(22, '2020_12_12_112328_create_sms_controls_table', 17),
(23, '2020_12_20_090105_create_sms_templates_table', 18),
(26, '2020_12_24_081403_create_payouts_table', 20),
(27, '2020_12_31_063516_create_site_notifications_table', 21),
(56, '2021_01_10_080449_create_deposits_table', 22),
(57, '2021_01_12_071930_create_funds_table', 23),
(58, '2021_01_16_121411_create_admin_profiles_table', 24),
(72, '2021_01_16_131037_create_disputes_table', 25),
(73, '2021_01_16_132315_create_dispute_details_table', 25),
(74, '2021_01_20_095223_create_languages_table', 26),
(75, '2021_01_21_101929_create_templates_table', 27),
(76, '2021_01_24_063900_create_template_media_table', 28),
(80, '2021_01_26_122022_create_contents_table', 29),
(81, '2021_01_26_122211_create_content_details_table', 29),
(82, '2021_01_26_122228_create_content_media_table', 29),
(84, '2021_01_31_060855_create_contacts_table', 30),
(85, '2021_01_31_074126_create_subscribes_table', 31),
(86, '2021_03_08_060607_create_referral_bonuses_table', 32),
(87, '2021_03_08_072720_create_commission_entries_table', 33),
(89, '2021_03_15_042634_create_basic_controls_table', 34),
(90, '2022_12_04_141240_create_recuring_invoices_table', 35),
(91, '2022_12_04_141650_create_invoices_table', 36),
(92, '2022_12_04_143335_create_line_items_table', 37),
(93, '2022_12_08_132812_create_kycs_table', 38),
(94, '2022_12_10_064852_create_user_kycs_table', 39),
(95, '2022_12_11_115620_create_stores_table', 40),
(96, '2022_12_12_105414_create_store_categories_table', 41),
(97, '2022_12_12_133624_create_store_shippings_table', 42),
(98, '2022_12_13_063456_create_store_product_attrs_table', 43),
(99, '2022_12_17_061738_create_store_products_table', 44),
(100, '2022_12_17_063720_create_store_product_images_table', 44),
(101, '2022_12_17_063845_create_product_store_maps_table', 44),
(103, '2022_12_17_063859_create_product_attr_maps_table', 45),
(104, '2022_12_17_064834_create_store_products_table', 46),
(105, '2022_12_18_091111_create_product_attr_lists_table', 47),
(106, '2022_12_18_104720_create_store_product_stocks_table', 48),
(107, '2022_12_24_065744_create_product_orders_table', 49),
(108, '2022_12_24_071858_create_product_order_details_table', 50),
(109, '2023_01_01_050125_create_seller_contacts_table', 51),
(110, '2023_01_02_095530_create_q_r_codes_table', 52),
(111, '2023_01_03_113735_create_virtual_card_methods_table', 53),
(112, '2023_01_04_102130_create_virtual_card_orders_table', 54),
(113, '2023_01_11_064324_create_virtual_card_transactions_table', 55),
(114, '2023_01_17_103352_create_razorpay_contacts_table', 56),
(115, '2020_12_24_051324_create_payout_methods_table', 57),
(116, '2023_01_23_102149_create_bill_methods_table', 58),
(117, '2023_01_23_130930_create_bill_services_table', 59),
(118, '2023_01_25_101024_create_bill_pays_table', 60),
(119, '2023_01_29_123413_create_api_orders_table', 61),
(120, '2023_01_30_071050_create_api_order_tests_table', 62),
(121, '2023_02_01_081645_create_roles_table', 63);

-- --------------------------------------------------------

--
-- Table structure for table `notify_templates`
--

CREATE TABLE `notify_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `template_key` varchar(255) DEFAULT NULL,
  `body` text DEFAULT NULL,
  `short_keys` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `firebase_notify_status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=>inactive, 1=>active	',
  `notify_for` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=> Admin, 0=> User',
  `lang_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notify_templates`
--

INSERT INTO `notify_templates` (`id`, `language_id`, `name`, `template_key`, `body`, `short_keys`, `status`, `firebase_notify_status`, `notify_for`, `lang_code`, `created_at`, `updated_at`) VALUES
(1, 1, 'Send money', 'TRANSFER_TO', '[[sender]] send money to your account amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Sender Name\",\"amount\":\"Received Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(2, 1, 'Send money', 'TRANSFER_FROM', 'You have send money to [[receiver]] account amount [[amount]] [[currency]].Transaction: #[[transaction]]', '{\"receiver\":\"Receiver Name\",\"amount\":\"Send Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(3, 1, 'Request Money Initialise', 'REQUEST_MONEY_INIT', '[[sender]] request for send money to account amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Sender Name\",\"amount\":\"Received Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(4, 1, 'Request Money Confirm', 'REQUEST_MONEY_CONFIRM', '[[sender]] confirm your request money amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Sender Name\",\"amount\":\"Received Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(5, 1, 'Request Money Cancel', 'REQUEST_MONEY_CANCEL', '[[sender]] cancel your request money amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Sender Name\",\"amount\":\"Received Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(6, 1, 'Money Exchange', 'MONEY_EXCHANGE', 'You are exchange [[from_amount]] [[from_currency]] to [[to_amount]] [[to_currency]]. Transaction: #[[transaction]]', '{\"from_amount\":\"Amount Exchange From\",\"from_currency\":\"Currency Exchange From\",\"to_amount\":\"Amount Exchange To\",\"to_currency\":\"Currency Exchange To\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(7, 1, 'Redeem Code Generate', 'REDEEM_CODE_GENERATE', 'You have generate a redeem code amount [[amount]] [[currency]].Transaction: #[[transaction]]', '{\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Redeem Code\"}', 1, 1, 0, 'en', NULL, NULL),
(8, 1, 'Redeem code sender', 'REDEEM_CODE_SENDER', '[[receiver]] used your redeem code amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"receiver\":\"Receiver Name who used code\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(9, 1, 'Redeem code used by', 'REDEEM_CODE_USED_BY', 'You have used a redeem code amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Redeem Code\"}', 1, 1, 0, 'en', NULL, NULL),
(10, 1, 'Escrow request sender', 'ESCROW_REQUEST_SENDER', 'Your escrow request to [[receiver]] amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"receiver\":\"Receiver Name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(11, 1, 'Escrow request receiver', 'ESCROW_REQUEST_RECEIVER', 'You have escrow request from [[sender]] amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Sender Name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(12, 1, 'Escrow Request Accept from', 'ESCROW_REQUEST_ACCEPT_FROM', '[[sender]] accept your request amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Request sender Name\",\"amount\":\"Received Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(13, 1, 'Escrow Request Accept by', 'ESCROW_REQUEST_ACCEPT_BY', 'You accept escrow request amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"amount\":\"Received Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(14, 1, 'Escrow Request Cancel from', 'ESCROW_REQUEST_CANCEL_FROM', '[[sender]] Cancel your request amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Request sender Name\",\"amount\":\"Received Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(15, 1, 'Escrow Request Cancel by', 'ESCROW_REQUEST_CANCEL_BY', 'You Cancel escrow request amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"amount\":\"Received Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(16, 1, 'Escrow payment disburse from', 'ESCROW_PAYMENT_DISBURSED_REQUEST_FROM', '[[sender]] request to disburse your amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Request sender Name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(17, 1, 'request to payment disburse by', 'ESCROW_PAYMENT_DISBURSED_REQUEST_BY', 'You request escrow disburse amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(18, 1, 'Escrow payment disburse from', 'ESCROW_PAYMENT_DISBURSED_FROM', '[[sender]] disburse your request amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Request sender Name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(19, 1, 'request to payment disburse by', 'ESCROW_PAYMENT_DISBURSED_BY', 'You disburse escrow request amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(20, 1, 'Dispute request to admin', 'DISPUTE_REQUEST_TO_ADMIN', '[[sender]] dispute escrow request amount [[amount]] [[currency]] . Transaction: #[[transaction]] click to reply [[link]]', '{\"sender\":\"Sender Name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\",\"link\":\"Dispute reply link\"}', 1, 1, 1, 'en', NULL, NULL),
(21, 1, 'Dispute request to user', 'DISPUTE_REQUEST_TO_USER', '[[sender]] reply dispute escrow request amount. Transaction: #[[transaction]] click to reply [[link]]', '{\"sender\":\"Sender Name\",\"transaction\":\"Transaction Number\",\"link\":\"Dispute reply link\"}', 1, 1, 0, 'en', NULL, NULL),
(22, 1, 'Voucher payment request to', 'VOUCHER_PAYMENT_REQUEST_TO', '[[sender]] request to voucher payment amount [[amount]] [[currency]] . Transaction: #[[transaction]] click to payment [[link]]', '{\"sender\":\"Sender Name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\",\"link\":\"Dispute reply link\"}', 1, 1, 0, 'en', NULL, NULL),
(23, 1, 'Voucher payment request from', 'VOUCHER_PAYMENT_REQUEST_FROM', 'You request to [[receiver]] voucher payment amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"receiver\":\"Receiver Name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(24, 1, 'Voucher payment to', 'VOUCHER_PAYMENT_TO', '[[receiver]] payment to your voucher amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"receiver\":\"Request receiver name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(25, 1, 'Voucher payment from', 'VOUCHER_PAYMENT_FROM', 'You payment to [[sender]] voucher amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Request sender Name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(26, 1, 'Voucher payment cancel to', 'VOUCHER_PAYMENT_CANCEL_TO', '[[receiver]] payment cancel to your voucher amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"receiver\":\"Request receiver name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(27, 1, 'Voucher payment cancel from', 'VOUCHER_PAYMENT_CANCEL_FROM', 'You payment cancel to [[sender]] voucher amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Request sender Name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(28, 1, 'Payout Request Admin', 'PAYOUT_REQUEST_TO_ADMIN', '[[sender]] request for payment amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Sender Name\",\"amount\":\"Received Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 1, 'en', NULL, NULL),
(29, 1, 'Payout Request from', 'PAYOUT_REQUEST_FROM', 'You request for payout amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"amount\":\"Received Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(30, 1, 'Payout Confirm', 'PAYOUT_CONFIRM', '[[sender]] confirm your payout amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Sender Name\",\"amount\":\"Received Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(31, 1, 'Payout Cancel', 'PAYOUT_CANCEL', '[[sender]] cancel your payout amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Sender Name\",\"amount\":\"Received Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(32, 1, 'Add Fund user user', 'ADD_FUND_USER_USER', 'you add fund money amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, '2023-03-13 06:31:35'),
(33, 1, 'Add Fund user admin', 'ADD_FUND_USER_ADMIN', '[[user]] add fund money amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"user\":\"User full name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 1, 'en', NULL, '2022-07-02 09:53:35'),
(34, 1, 'Deposit Bonus', 'DEPOSIT_BONUS', 'Deposit Commission From [[sender]] amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Sender Name\",\"amount\":\"Received Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(35, 1, 'Login Bonus', 'LOGIN_BONUS', 'Login Commission From [[sender]] amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Sender Name\",\"amount\":\"Received Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(36, 1, 'SUPPORT TICKET CREATE', 'SUPPORT_TICKET_CREATE', '[[username]] create a ticket\r\nTicket : [[ticket_id]]', '{\"ticket_id\":\"Support Ticket ID\",\"username\":\"username\"}', 1, 1, 1, 'en', '2021-12-05 04:58:45', '2021-12-05 04:58:45'),
(37, 1, 'SUPPORT TICKET REPLIED', 'SUPPORT_TICKET_REPLIED', '[[username]] replied  ticket\r\nTicket : [[ticket_id]]', '{\"ticket_id\":\"Support Ticket ID\",\"username\":\"username\"}', 1, 1, 1, 'en', '2021-12-05 04:58:45', '2021-12-05 04:58:45'),
(38, 1, 'ADMIN REPLIED SUPPORT TICKET ', 'ADMIN_REPLIED_TICKET', 'Admin replied  \r\nTicket : [[ticket_id]]', '{\"ticket_id\":\"Support Ticket ID\"}', 1, 1, 0, 'en', '2021-12-05 05:00:17', '2021-12-05 05:00:17'),
(40, 1, 'Invoice payment to', 'INVOICE_PAYMENT_TO', '[[receiver]] payment to your invoice amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"receiver\":\"Request receiver name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(41, 1, 'Invoice payment from', 'INVOICE_PAYMENT_FROM', 'You payment to [[sender]] invoice amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"sender\":\"Request sender Name\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(42, 1, 'KYC APPROVE', 'KYC_APPROVE', 'Your KYC has been approved', '', 1, 1, 0, 'en', NULL, NULL),
(43, 1, 'KYC REJECT', 'KYC_REJECT', 'Your KYC has been rejected', '', 1, 1, 0, 'en', NULL, NULL),
(44, 1, 'Product order from', 'PRODUCT_ORDER', 'Your have a new order amount [[amount]] [[currency]] has been payment . Order Bumber: #[[orderNumber]]', '{\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"orderNumber\":\"orderNumber\"}', 1, 1, 0, 'en', NULL, NULL),
(45, 1, 'QR payment to', 'QR_PAYMENT_TO', 'Amount [[amount]][[currency]] payment from [[email]] by QR Code', '{\"email\":\"email\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\"}', 1, 1, 0, 'en', NULL, NULL),
(46, 1, 'QR payment From', 'QR_PAYMENT_FROM', 'Amount [[amount]][[currency]] payment for [[sender]] by QR Code', '{\"sender\":\"sender\",\"amount\":\"Request Amount\",\"currency\":\"Request Currency\"}', 1, 1, 0, 'en', NULL, NULL),
(47, 1, 'Virtual Card Apply', 'VIRTUAL_CARD_APPLY', 'Amount [[amount]][[currency]] payment for virtual card from wallet ', '{\"amount\":\"amount\",\"currency\":\"currency\"}', 1, 1, 0, 'en', NULL, NULL),
(48, 1, 'Admin Virtual Card Apply', 'ADMIN_VIRTUAL_CARD_APPLY', 'Amount [[amount]][[currency]] payment for virtual card by [[username]] ', '{\"amount\":\"amount\",\"currency\":\"currency\",\"username\":\"username\"}', 1, 1, 0, 'en', NULL, NULL),
(49, 1, 'Virtual Card Rejected', 'VIRTUAL_CARD_REJECTED', 'Virtual card request has been rejected amount [[amount]][[currency]] payment for virtual card has been return ', '{\"amount\":\"amount\",\"currency\":\"currency\"}', 1, 1, 0, 'en', NULL, NULL),
(50, 1, 'Virtual Card Approve', 'VIRTUAL_CARD_APPROVE', 'Virtual card request has been approved. Card Number[[card_number]] balance [[balance]] expiry on [[expiry_date]]', '{\"name_on_card\":\"name_on_card\",\"card_id\":\"card_id\",\"cvv\":\"cvv\",\"card_number\":\"card_number\",\"brand\":\"brand\",\"expiry_date\":\"expiry_date\",\"balance\":\"balance\",\"currency\":\"currency\"}', 1, 1, 0, 'en', NULL, NULL),
(51, 1, 'Virtual Card Fund Return', 'VIRTUAL_CARD_FUND_RETURN', 'Virtual card fund request [[amount [[currency]] has been return card number: [[cardNumber]]', '{\"amount\":\"amount\",\"currency\":\"Request Currency\",\"cardNumber\":\"cardNumber\"}', 1, 1, 0, 'en', NULL, NULL),
(52, 1, 'Virtual Card Fund Approve', 'VIRTUAL_CARD_FUND_APPROVE', 'Virtual card fund request [[amount [[currency]] has been approved card number: [[cardNumber]]', '{\"amount\":\"amount\",\"currency\":\"Request Currency\",\"cardNumber\":\"cardNumber\"}', 1, 1, 0, 'en', NULL, NULL),
(53, 1, 'Virtual Card Un-Block', 'VIRTUAL_CARD_UNBLOCK', 'Your Card has been un-blocked card number-[[cardNumber]]', '{\"cardNumber\":\"cardNumber\"}', 1, 1, 0, 'en', NULL, NULL),
(54, 1, 'Virtual Card Block', 'VIRTUAL_CARD_BLOCK', 'Your Card has been blocked card number-[[cardNumber]]', '{\"cardNumber\":\"cardNumber\"}', 1, 1, 0, 'en', NULL, NULL),
(55, 1, 'Bill Payment Return', 'BILL_PAYMENT_RETURN', 'your bill pay [[amount]] [[currency]] has been return in [[return_currency]] wallet.\r\nreturn amount [[return_currency_amount]] [[return_currency]]', '{\"amount\":\"amount\",\"currency\":\"currency\",\"return_currency_amount\":\"return_currency_amount\",\"return_currency\":\"return_currency\",\"transaction\":\"transaction\"}', 1, 1, 0, 'en', NULL, NULL),
(56, 1, 'Bill Pay', 'BILL_PAY', '[[amount]] [[currency]] for bill. Transaction: #[[transaction]]', '{\"amount\":\"amount\",\"amount\":\"Request Amount\",\"currency\":\"currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(57, 1, 'Api Payment', 'API_PAYMENT', 'you got payment from api amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(58, 1, 'Admin Api Payment', 'ADMIN_API_PAYMENT', '[[receiver]] got payment from api amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"amount\":\"Request Amount\",\"receiver\":\"receiver\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'en', NULL, NULL),
(59, 2, 'Add Fund user user', 'ADD_FUND_USER_USER', 'you add fund money amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 1, 1, 0, 'es', '2023-03-13 06:25:27', '2023-03-13 06:31:35');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payouts`
--

CREATE TABLE `payouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_code` varchar(10) DEFAULT NULL COMMENT 'automatic payout currency code',
  `payout_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `response_id` varchar(191) DEFAULT NULL COMMENT 'api response id for webhooks',
  `percentage` decimal(16,8) NOT NULL DEFAULT 0.00000000 COMMENT 'Percent of charge',
  `charge_percentage` decimal(16,8) NOT NULL DEFAULT 0.00000000 COMMENT 'After adding percent of charge',
  `charge_fixed` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `amount` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `transfer_amount` decimal(16,8) NOT NULL DEFAULT 0.00000000 COMMENT 'Amount deduct from sender',
  `received_amount` decimal(16,8) NOT NULL DEFAULT 0.00000000 COMMENT 'Amount add to receiver',
  `charge_from` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = Sender, 1 = Receiver',
  `note` text DEFAULT NULL,
  `withdraw_information` text DEFAULT NULL,
  `meta_field` text NOT NULL COMMENT 'for .flutterwave',
  `email` varchar(255) DEFAULT NULL,
  `status` tinyint(8) NOT NULL DEFAULT 0 COMMENT '0=Pending, 1=generate, 2 = payment done, 5 = cancel,6=failed',
  `utr` char(36) DEFAULT NULL,
  `last_error` text DEFAULT NULL COMMENT 'api error',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payout_methods`
--

CREATE TABLE `payout_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `methodName` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `bank_name` text DEFAULT NULL COMMENT 'automatic payment for bank name',
  `banks` text DEFAULT NULL COMMENT 'admin bank permission',
  `parameters` text DEFAULT NULL COMMENT 'api parameters',
  `extra_parameters` text DEFAULT NULL,
  `inputForm` text DEFAULT NULL,
  `percentage_charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `fixed_charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `min_limit` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `max_limit` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `currency_lists` text DEFAULT NULL,
  `supported_currency` text DEFAULT NULL,
  `convert_rate` text DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = active, 0 = inactive',
  `is_automatic` tinyint(4) NOT NULL DEFAULT 0,
  `is_sandbox` tinyint(4) NOT NULL DEFAULT 0,
  `environment` enum('test','live') NOT NULL DEFAULT 'live',
  `is_auto_update` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'currency rate auto update',
  `logo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payout_methods`
--

INSERT INTO `payout_methods` (`id`, `methodName`, `code`, `description`, `bank_name`, `banks`, `parameters`, `extra_parameters`, `inputForm`, `percentage_charge`, `fixed_charge`, `min_limit`, `max_limit`, `currency_lists`, `supported_currency`, `convert_rate`, `is_active`, `is_automatic`, `is_sandbox`, `environment`, `is_auto_update`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'Payoneer', NULL, 'Payment will receive within 3 days', NULL, NULL, NULL, NULL, '{\"account_name\":{\"name\":\"account_name\",\"label\":\"Account  Name\",\"type\":\"text\",\"validation\":\"required\"},\"account_number\":{\"name\":\"account_number\",\"label\":\"Account  Number\",\"type\":\"text\",\"validation\":\"required\"},\"description\":{\"name\":\"description\",\"label\":\"Description\",\"type\":\"textarea\",\"validation\":\"required\"}}', '0.75000000', '1.12300000', '1.00000000', '55.00000000', NULL, NULL, NULL, 1, 0, 0, 'live', 1, 'payoneer.png', '2020-12-23 19:40:29', '2021-02-13 23:13:55'),
(2, 'Paypal manual', NULL, 'Payment will receive within 9 hours', NULL, NULL, '[]', NULL, '{\"account_name\":{\"name\":\"account_name\",\"label\":\"Account  Name\",\"type\":\"text\",\"validation\":\"required\"},\"account_number\":{\"name\":\"account_number\",\"label\":\"Account  Number\",\"type\":\"text\",\"validation\":\"required\"},\"description\":{\"name\":\"description\",\"label\":\"Description\",\"type\":\"textarea\",\"validation\":\"required\"}}', '0.35000000', '1.32100000', '1.00000000', '169.00000000', NULL, NULL, '[]', 1, 0, 0, 'live', 0, 'paypal.png', '2020-12-23 19:40:51', '2023-01-22 06:03:36'),
(3, 'Bank', NULL, 'Payment will receive within 8 days', NULL, NULL, '[]', NULL, '{\"account_name\":{\"name\":\"account_name\",\"label\":\"Account Name\",\"type\":\"text\",\"validation\":\"required\"},\"account_number\":{\"name\":\"account_number\",\"label\":\"Account  Number\",\"type\":\"textarea\",\"validation\":\"required\"}}', '0.50000000', '1.00000000', '1.00000000', '100.00000000', NULL, NULL, '[]', 1, 0, 0, 'live', 0, 'bank.png', '2020-12-27 19:23:36', '2023-01-21 00:29:51'),
(9, 'Flutterwave', 'flutterwave', 'Payment will receive within 1 days', '{\"0\":{\"NGN BANK\":\"NGN BANK\",\"NGN DOM\":\"NGN DOM\",\"GHS BANK\":\"GHS BANK\",\"KES BANK\":\"KES BANK\",\"ZAR BANK\":\"ZAR BANK\",\"INTL EUR & GBP\":\"INTL EUR & GBP\",\"INTL USD\":\"INTL USD\",\"INTL OTHERS\":\"INTL OTHERS\",\"FRANCOPGONE\":\"FRANCOPGONE\",\"XAF/XOF MOMO\":\"XAF/XOF MOMO\",\"mPesa\":\"mPesa\",\"Rwanda Momo\":\"Rwanda Momo\",\"Uganda Momo\":\"Uganda Momo\",\"Zambia Momo\":\"Zambia Momo\",\"Barter\":\"Barter\",\"FLW\":\"FLW\"}}', '[\"NGN BANK\",\"NGN DOM\",\"GHS BANK\",\"INTL USD\"]', '{\"Public_Key\":\"\",\"Secret_Key\":\"\",\"Encryption_Key\":\"\"}', NULL, NULL, '0.50000000', '2.00000000', '10.00000000', '5000.00000000', '{\"USD\":\"USD\",\"KES\":\"KES\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"UGX\":\"UGX\",\"TZS\":\"TZS\"}', '{\"USD\":\"USD\",\"KES\":\"KES\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"UGX\":\"UGX\",\"TZS\":\"TZS\"}', '{\"USD\":1,\"KES\":124.1,\"GHS\":12.3,\"NGN\":455.06,\"GBP\":0.81,\"EUR\":0.92,\"UGX\":3677.34,\"TZS\":2335}', 1, 1, 0, 'live', 1, 'flutterwave.jpg', '2020-12-27 19:23:36', '2023-03-16 00:17:44'),
(10, 'Razorpay', 'razorpay', 'Payment will receive within 1 days', '', NULL, '{\"account_number\":\"\",\"Key_Id\":\"\",\"Key_Secret\":\"\"}', '{\"webhook\":\"payout\"}', '{\"name\":{\"name\":\"name\",\"label\":\"Name\",\"type\":\"text\",\"validation\":\"required\"},\"email\":{\"name\":\"email\",\"label\":\"Email\",\"type\":\"text\",\"validation\":\"required\"},\"ifsc\":{\"name\":\"ifsc\",\"label\":\"IFSC\",\"type\":\"text\",\"validation\":\"required\"},\"account_number\":{\"name\":\"account_number\",\"label\":\"Account number\",\"type\":\"text\",\"validation\":\"required\"}}', '0.50000000', '2.00000000', '100.00000000', '50000.00000000', '{\"INR\":\"INR\"}', '{\"INR\":\"INR\"}', '{\"INR\":80.98}', 1, 1, 0, 'live', 1, 'razorpay.jpg', '2020-12-27 19:23:36', '2023-03-16 00:17:44'),
(11, 'Paystack', 'paystack', 'Payment will receive within 1 days', '', NULL, '{\"Public_key\":\"\",\"Secret_key\":\"\"}', '{\"webhook\":\"payout\"}', '{\"name\":{\"name\":\"name\",\"label\":\"Name\",\"type\":\"text\",\"validation\":\"required\"},\"account_number\":{\"name\":\"account_number\",\"label\":\"Account  Number\",\"type\":\"text\",\"validation\":\"required\"}}', '1.30000000', '2.30000000', '50.00000000', '50000.00000000', '{\"NGN\":\"NGN\",\"GHS\":\"GHS\",\"ZAR\":\"ZAR\"}', '{\"NGN\":\"NGN\",\"GHS\":\"GHS\",\"ZAR\":\"ZAR\"}', '{\"NGN\":\"455\",\"GHS\":\"2.3\",\"ZAR\":\"17.2\"}', 1, 1, 0, '', 1, 'paystack.jpg', '2020-12-27 19:23:36', '2023-03-16 00:17:44'),
(12, 'Coinbase', 'coinbase', 'Payment will receive within 1 days', '', NULL, '{\"API_Key\":\"\",\"API_Secret\":\"\",\"Api_Passphrase\":\"\"}', '{\"webhook\":\"payout\"}', '{\"crypto_address\":{\"name\":\"crypto_address\",\"label\":\"Crypto Address\",\"type\":\"text\",\"validation\":\"required\"}}', '1.30000000', '2.00000000', '50.00000000', '50000.00000000', '{\"BNB\":\"BNB\",\"BTC\":\"BTC\",\"XRP\":\"XRP\",\"ETH\":\"ETH\",\"ETH2\":\"ETH2\",\"USDT\":\"USDT\",\"BCH\":\"BCH\",\"LTC\":\"LTC\",\"XMR\":\"XMR\",\"TON\":\"TON\"}', '{\"BNB\":\"BNB\",\"BTC\":\"BTC\",\"XRP\":\"XRP\",\"ETH\":\"ETH\",\"ETH2\":\"ETH2\",\"USDT\":\"USDT\",\"BCH\":\"BCH\",\"LTC\":\"LTC\",\"XMR\":\"XMR\",\"TON\":\"TON\"}', '{\"BNB\":\"0.0032866584364651\",\"BTC\":\"4.3438047580189E-5\",\"XRP\":\"2.4317656276014\",\"ETH\":\"0.00060498363899103\",\"ETH2\":\"1\",\"USDT\":\"0.99970684227142\",\"BCH\":\"0.0077663435649339\",\"LTC\":\"0.011189496085365\",\"XMR\":\"0.0056633319909619\",\"TON\":\"0.43646828144729\"}', 1, 1, 0, '', 1, 'coinbase.png', '2020-12-27 19:23:36', '2023-03-16 00:17:44'),
(14, 'Perfect Money', 'perfectmoney', 'Payment will receive within 1 days', '', NULL, '{\"Passphrase\":\"\",\"Account_ID\":\"\",\"Payer_Account\":\"\"}', '', '{\"account_number\":{\"name\":\"account_number\",\"label\":\"Account  Number\",\"type\":\"text\",\"validation\":\"required\"}}', '1.30000000', '2.00000000', '50.00000000', '50000.00000000', '{\"USD\":\"USD\",\"EUR\":\"EUR\"}', '{\"USD\":\"USD\",\"EUR\":\"EUR\"}', '{\"USD\":\"1\",\"EUR\":\"0.92\"}', 1, 1, 0, 'live', 1, 'perfect money.jpg', '2020-12-27 19:23:36', '2023-03-16 00:17:44'),
(15, 'Paypal', 'paypal', 'Payment will receive within 1 days', '', NULL, '{\"cleint_id\":\"\",\"secret\":\"\"}', '{\"webhook\":\"payout\"}', '{\"receiver\":{\"name\":\"receiver\",\"label\":\"Receiver\",\"type\":\"text\",\"validation\":\"required\"}}', '2.00000000', '5.00000000', '5.00000000', '50000.00000000', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"USD\"}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"USD\"}', '{\"AUD\":\"1.44\",\"BRL\":\"5.21\",\"CAD\":\"1.34\",\"CZK\":\"21.99\",\"DKK\":\"6.85\",\"EUR\":\"0.92\",\"HKD\":\"7.83\",\"HUF\":\"361.73\",\"INR\":\"80.98\",\"ILS\":\"3.4\",\"JPY\":\"129.56\",\"MYR\":\"4.29\",\"MXN\":\"18.87\",\"TWD\":\"30.33\",\"NZD\":\"1.55\",\"NOK\":\"9.79\",\"PHP\":\"54.46\",\"PLN\":\"4.14\",\"GBP\":\"0.81\",\"RUB\":\"68.25\",\"SGD\":\"1.32\",\"SEK\":\"10.3\",\"CHF\":\"0.92\",\"THB\":\"32.64\",\"USD\":\"1\"}', 1, 1, 1, 'test', 1, 'paypal.jpg', '2020-12-27 19:23:36', '2023-03-16 00:17:44'),
(16, 'Binance', 'binance', 'Payment will receive within 1 days', '', NULL, '{\"API_Key\":\"\",\"KEY_Secret\":\"\"}', '', '{\"network\":{\"name\":\"network\",\"label\":\"Network\",\"type\":\"text\",\"validation\":\"required\"},\"address\":{\"name\":\"address\",\"label\":\"Address\",\"type\":\"text\",\"validation\":\"required\"},\"amount\":{\"name\":\"amount\",\"label\":\"Amount\",\"type\":\"text\",\"validation\":\"required\"}}', '1.30000000', '2.00000000', '50.00000000', '50000.00000000', '{\"BNB\":\"BNB\",\"BTC\":\"BTC\",\"XRP\":\"XRP\",\"ETH\":\"ETH\",\"ETH2\":\"ETH2\",\"USDT\":\"USDT\",\"BCH\":\"BCH\",\"LTC\":\"LTC\",\"XMR\":\"XMR\",\"TON\":\"TON\"}', '{\"BNB\":\"BNB\",\"BTC\":\"BTC\",\"XRP\":\"XRP\",\"ETH\":\"ETH\",\"ETH2\":\"ETH2\",\"USDT\":\"USDT\",\"BCH\":\"BCH\",\"LTC\":\"LTC\",\"XMR\":\"XMR\",\"TON\":\"TON\"}', '{\"BNB\":\"0.0032866584364651\",\"BTC\":\"4.3438047580189E-5\",\"XRP\":\"2.4317656276014\",\"ETH\":\"0.00060498363899103\",\"ETH2\":\"1\",\"USDT\":\"0.99970684227142\",\"BCH\":\"0.0077663435649339\",\"LTC\":\"0.011189496085365\",\"XMR\":\"0.0056633319909619\",\"TON\":\"0.43646828144729\"}', 1, 1, 1, 'live', 1, 'binance.png', '2020-12-27 19:23:36', '2023-03-16 00:17:44');

-- --------------------------------------------------------

--
-- Table structure for table `product_attr_lists`
--

CREATE TABLE `product_attr_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_product_attrs_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_attr_maps`
--

CREATE TABLE `product_attr_maps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `attributes_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_orders`
--

CREATE TABLE `product_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` text DEFAULT NULL,
  `gateway_id` bigint(20) UNSIGNED DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL COMMENT 'who owner of store',
  `currency_id` int(11) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `alt_phone` varchar(255) DEFAULT NULL,
  `total_amount` double DEFAULT NULL COMMENT 'without shipping charge',
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shipping_charge` double DEFAULT NULL,
  `detailed_address` varchar(255) DEFAULT NULL,
  `order_note` varchar(255) DEFAULT NULL,
  `utr` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>pending,1=>complete',
  `stage` tinyint(6) DEFAULT NULL COMMENT '0=>arrivel,1=>processing,2=>on shipping,3=>out for delivers,4=>delivered,5=>cancel',
  `cancel_from` tinyint(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_order_details`
--

CREATE TABLE `product_order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `attributes_id` text DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_store_maps`
--

CREATE TABLE `product_store_maps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `q_r_codes`
--

CREATE TABLE `q_r_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT 'who receive payment',
  `gateway_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `charge` double NOT NULL DEFAULT 0,
  `amount` double NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=>incomplete, 1=>complete',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `razorpay_contacts`
--

CREATE TABLE `razorpay_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contact_id` varchar(255) DEFAULT NULL,
  `entity` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recuring_invoices`
--

CREATE TABLE `recuring_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `number_of_payments` int(11) DEFAULT NULL,
  `current_number_of_payment` int(11) DEFAULT NULL,
  `first_arrival_date` timestamp NULL DEFAULT NULL,
  `last_arrival_date` timestamp NULL DEFAULT NULL,
  `subtotal` decimal(8,2) DEFAULT NULL,
  `tax` decimal(8,2) DEFAULT NULL,
  `vat` decimal(8,2) DEFAULT NULL,
  `tax_rate` decimal(8,2) DEFAULT NULL,
  `vat_rate` decimal(8,2) DEFAULT NULL,
  `grand_total` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `redeem_codes`
--

CREATE TABLE `redeem_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED DEFAULT NULL,
  `receiver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `percentage` decimal(16,8) NOT NULL DEFAULT 0.00000000 COMMENT 'Percent of charge',
  `charge_percentage` decimal(16,8) NOT NULL DEFAULT 0.00000000 COMMENT 'After adding percent of charge',
  `charge_fixed` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `amount` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `transfer_amount` decimal(16,8) NOT NULL DEFAULT 0.00000000 COMMENT 'Amount deduct from sender',
  `received_amount` decimal(16,8) NOT NULL DEFAULT 0.00000000 COMMENT 'Amount add to receiver',
  `charge_from` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = Sender, 1 = Receiver',
  `note` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=Success,0=Pending',
  `utr` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referral_bonuses`
--

CREATE TABLE `referral_bonuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `referral_on` varchar(50) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `calcType` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = fixed, 0 = percent',
  `amount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `minAmount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request_money`
--

CREATE TABLE `request_money` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'user id of request sender',
  `receiver_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'user id of received receiver',
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `utr` char(36) DEFAULT NULL COMMENT 'unique id for each payment request',
  `amount` decimal(16,8) NOT NULL DEFAULT 0.00000000 COMMENT 'requested amount',
  `email` varchar(255) DEFAULT NULL COMMENT 'request receiver id',
  `note` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=Success,0=Pending',
  `percentage` decimal(16,8) NOT NULL DEFAULT 0.00000000 COMMENT 'percent of charge',
  `charge_percentage` decimal(16,8) NOT NULL DEFAULT 0.00000000 COMMENT 'after adding percent of charge',
  `charge_fixed` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `transfer_amount` decimal(16,8) NOT NULL DEFAULT 0.00000000 COMMENT 'amount deduct from user who (received request)',
  `received_amount` decimal(16,8) NOT NULL DEFAULT 0.00000000 COMMENT 'amount add to user who send (request money)',
  `charge_from` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = Sender, 1 = Receiver',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `permission` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=>deactive,1=> active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `user_id`, `name`, `permission`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Manager', '[\"19\"]', 1, '2023-02-01 03:51:55', '2023-02-02 07:28:44'),
(2, 1, 'HR', '[\"10\",\"7\",\"4\",\"2\"]', 1, '2023-02-01 03:57:38', '2023-02-01 04:23:50');

-- --------------------------------------------------------

--
-- Table structure for table `security_questions`
--

CREATE TABLE `security_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `security_questions`
--

INSERT INTO `security_questions` (`id`, `question`, `created_at`, `updated_at`) VALUES
(1, 'What was the house number and street name you lived in as a child?', '2020-11-14 01:38:42', '2020-11-14 01:39:44'),
(2, 'What were the last four digits of your childhood telephone number?', '2020-11-14 01:40:01', '2020-11-14 01:40:01'),
(3, 'What primary school did you attend?', '2020-11-14 01:40:08', '2020-11-14 01:40:08'),
(4, 'In what town or city was your first full time job?', '2020-11-14 01:40:33', '2020-11-14 01:40:33'),
(5, 'In what town or city did you meet your spouse or partner?', '2020-11-14 01:40:59', '2020-11-14 01:40:59'),
(6, 'What is the middle name of your oldest child?', '2020-11-14 01:41:06', '2020-11-14 01:41:06'),
(7, 'What are the last five digits of your driver\'s license number?', '2020-11-14 02:06:57', '2020-11-14 02:06:57'),
(8, 'What is your grandmother\'s (on your mother\'s side) maiden name?', '2020-11-14 02:07:06', '2020-11-14 02:07:06'),
(9, 'What is your favourite sports name?', '2022-06-26 06:56:44', '2022-06-26 07:00:07');

-- --------------------------------------------------------

--
-- Table structure for table `seller_contacts`
--

CREATE TABLE `seller_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sender_name` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seller_contacts`
--

INSERT INTO `seller_contacts` (`id`, `store_id`, `user_id`, `sender_name`, `message`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'alex boobs', 'how can i buy', '2022-12-31 23:15:24', '2022-12-31 23:15:24');

-- --------------------------------------------------------

--
-- Table structure for table `site_notifications`
--

CREATE TABLE `site_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_notificational_id` int(11) NOT NULL,
  `site_notificational_type` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_controls`
--

CREATE TABLE `sms_controls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `actionMethod` varchar(255) DEFAULT NULL,
  `actionUrl` varchar(255) DEFAULT NULL,
  `headerData` text DEFAULT NULL,
  `paramData` text DEFAULT NULL,
  `formData` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_controls`
--

INSERT INTO `sms_controls` (`id`, `actionMethod`, `actionUrl`, `headerData`, `paramData`, `formData`, `created_at`, `updated_at`) VALUES
(1, 'POST', 'https://rest.nexmo.com/sms/json', '{\"Content-Type\":\"application\\/x-www-form-urlencoded\"}', NULL, '{\"from\":\"Rownak\",\"text\":\"[[message]]\",\"to\":\"[[receiver]]\",\"api_key\":\"930cc608\",\"api_secret\":\"2pijsaMOUw5YKOK5\"}', '2020-12-13 01:45:29', '2022-06-29 00:34:54');

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `shipping_charge` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=>Inactive,1=>active',
  `delivery_note` varchar(10) NOT NULL DEFAULT 'disabled',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=>inactive , 1=>active',
  `link` text DEFAULT NULL,
  `short_description` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `user_id`, `name`, `image`, `shipping_charge`, `delivery_note`, `status`, `link`, `short_description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'LifeTime', '63a4098de066e1671694733.png', 1, 'disabled', 1, '317c4c69666554696d65', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', '2022-12-11 23:23:50', '2023-01-01 00:32:49', NULL),
(2, 1, 'Store Hook', '63a407e9100831671694313.png', 0, 'enable', 1, 'store-hook-shop', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2022-12-12 01:35:33', '2022-12-29 01:21:41', NULL),
(3, 1, 'asdf', '63b1281d3ec101672554525.png', 0, 'enable', 1, 'abc', 'sadf', '2023-01-01 00:28:45', '2023-01-01 00:29:54', '2023-01-01 00:29:54'),
(4, 1, 'dcb', '63b1284835fcf1672554568.png', 1, 'disabled', 1, '347c646362', '', '2023-01-01 00:29:28', '2023-01-01 00:29:49', '2023-01-01 00:29:49'),
(5, 1, 'afdf', '63b12b66028881672555366.png', 1, 'disabled', 1, 'asfgg', 'fd', '2023-01-01 00:42:46', '2023-01-01 00:42:49', '2023-01-01 00:42:49');

-- --------------------------------------------------------

--
-- Table structure for table `store_categories`
--

CREATE TABLE `store_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=>inactive, 1=>active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `store_products`
--

CREATE TABLE `store_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `tag` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=>inactive , 1=>active',
  `description` longtext DEFAULT NULL,
  `instruction` longtext DEFAULT NULL,
  `thumbnail` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `store_product_attrs`
--

CREATE TABLE `store_product_attrs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=> active, 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `store_product_images`
--

CREATE TABLE `store_product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `store_product_stocks`
--

CREATE TABLE `store_product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_attr_lists_id` text DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `store_shippings`
--

CREATE TABLE `store_shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `charge` decimal(10,8) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribes`
--

CREATE TABLE `subscribes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED DEFAULT NULL,
  `section_name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id`, `language_id`, `section_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'banner', '{\"title\":\"TRUSTED ONLINE PAYMENT PLATFORM\",\"sub_title\":\"Low Transaction Fee to Boost Your Business\",\"short_description\":\"Your wallet pro account is your key to unlock a universe of opportunities. Whether making international payments, receiving funds, managing your digital business, or accessing capital, wallet pro opens your business up to the world.\",\"image_slogan\":\"+10  Years of Experience\"}', '2021-01-23 18:25:21', '2021-12-26 03:20:28'),
(2, 2, 'banner', '{\"title\":\"PLATAFORMA DE PAGO EN L\\u00cdNEA DE CONFIANZA\",\"sub_title\":\"Tarifa de transacci\\u00f3n baja para impulsar su negocio\",\"short_description\":\"Su cuenta Wallet Pro es la clave para desbloquear un universo de oportunidades. Ya sea que realice pagos internacionales, reciba fondos, administre su negocio digital o acceda al capital, wallet pro abre su negocio al mundo.\",\"image_slogan\":\"+10 a\\u00f1os de experiencia\"}', '2021-01-23 19:16:56', '2021-12-26 03:20:45'),
(3, 2, 'feature', '{\"title\":\"Caracter\\u00edsticas especiales\",\"sub_title\":\"Explorando nuestras caracter\\u00edsticas especiales\",\"short_description\":\"Neque expedita, nobis eius excepturi minima ad repellendus quo quas qui, quisquam molestias illo velit cum amet beatae porro in exercitationem nam repellat.\"}', '2021-01-23 22:26:42', '2022-11-08 00:19:16'),
(4, 1, 'feature', '{\"title\":\"Special Features\",\"sub_title\":\"Exploring Our Special Features\",\"short_description\":\"<span>Neque expedita, nobis eius excepturi minima ad repellendus quo quas qui, quisquam molestias illo velit cum amet beatae porro in exercitationem nam repellat.<\\/span>\"}', '2021-01-23 22:27:00', '2022-06-24 22:28:24'),
(5, 1, 'about-us', '{\"title\":\"About Us\",\"sub_title\":\"Transfer and Deposite your money anytime, anywhere in the world\",\"short_description\":\"Wallet pro is end-to-end business solution which is provide to their client many services. Such as Send money, Request money, Voucher payment, Escrow, Withdraw money and more than 24 other payment gateways world wide.\"}', '2021-01-23 22:53:59', '2021-12-26 03:42:14'),
(6, 2, 'about-us', '{\"title\":\"Sobre nosotros\",\"sub_title\":\"Transfiere y deposita tu dinero en cualquier momento y en cualquier parte del mundo\",\"short_description\":\"Wallet pro es una soluci\\u00f3n comercial de extremo a extremo que brinda a sus clientes muchos servicios. Tales como Enviar dinero, Solicitar dinero, Pago de vales, Escrow, Retirar dinero y m\\u00e1s de 24 otras pasarelas de pago en todo el mundo.\"}', '2021-01-23 22:54:58', '2022-11-08 00:21:37'),
(7, 1, 'services', '{\"title\":\"Our Services\",\"sub_title\":\"Our Best Services\",\"short_description\":\"Enjoy the maximum services with wallet pro digital solution and grow your business with us.\"}', '2021-01-23 23:14:34', '2021-12-26 03:52:28'),
(8, 2, 'services', '{\"title\":\"Nuestros servicios\",\"sub_title\":\"Nuestros mejores servicios\",\"short_description\":\"<p>Disfrute de los m\\u00e1ximos servicios con la soluci\\u00f3n digital wallet pro y haga crecer su negocio con nosotros.<\\/p>\"}', '2021-01-23 23:15:29', '2022-11-08 00:22:32'),
(9, 1, 'how-it-works', '{\"title\":\"How It Works\",\"sub_title\":\"Get the best experience\",\"short_description\":\"Wallet pro is very easy to use. Just follow the below steps.\"}', '2021-01-23 23:37:31', '2021-12-26 04:34:24'),
(10, 2, 'how-it-works', '{\"title\":\"C\\u00f3mo funciona\",\"sub_title\":\"Obt\\u00e9n la mejor experiencia\",\"short_description\":\"Wallet pro es muy f\\u00e1cil de usar. Simplemente siga los pasos a continuaci\\u00f3n.\"}', '2021-01-23 23:37:45', '2021-12-26 04:34:46'),
(11, 1, 'faq', '{\"title\":\"FAQ\",\"sub_title\":\"Frequently Questions\",\"short_description\":\"Have a read through our FAQs for more information and if you have any further questions and would like us to get in touch.\"}', '2021-01-23 23:40:39', '2021-12-26 04:36:39'),
(12, 2, 'faq', '{\"title\":\"Preguntas m\\u00e1s frecuentes\",\"sub_title\":\"Preguntas frecuentes\",\"short_description\":\"Lea nuestras preguntas frecuentes para obtener m\\u00e1s informaci\\u00f3n y si tiene m\\u00e1s preguntas y desea que nos pongamos en contacto\"}', '2021-01-23 23:41:43', '2021-12-26 04:37:56'),
(13, 1, 'mobile-app', '{\"title\":\"Mobile App\",\"sub_title\":\"Manage Your Global Payments On The Wallet Mobile App\",\"short_description\":\"Download our latest version of the app from play store or app store and enjoy wallet pro.\"}', '2021-01-24 00:13:47', '2021-12-26 04:53:59'),
(14, 1, 'clients-feedback', '{\"title\":\"Testimonials\",\"sub_title\":\"What Happy Clients Say\"}', '2021-01-24 00:21:45', '2022-06-06 05:39:55'),
(15, 1, 'blog', '{\"title\":\"Blog Posts\",\"sub_title\":\"Latest News &amp; Tips\",\"short_description\":\"<span>Neque expedita, nobis eius excepturi minima ad repellendus quo quas qui, quisquam molestias illo velit cum amet beatae porro in exercitationem nam repellat.<\\/span>\"}', '2021-01-24 00:30:10', '2022-06-06 06:00:44'),
(16, 2, 'mobile-app', '{\"title\":\"Aplicaci\\u00f3n movil\",\"sub_title\":\"Administre sus pagos globales en la aplicaci\\u00f3n m\\u00f3vil Wallet\",\"short_description\":\"Descargue nuestra \\u00faltima versi\\u00f3n de la aplicaci\\u00f3n desde Play Store o App Store y disfrute de Wallet Pro.\"}', '2021-01-25 18:53:24', '2021-12-26 04:54:33'),
(17, 2, 'clients-feedback', '{\"title\":\"Testimonios\",\"sub_title\":\"Lo que dicen las clientes felices\"}', '2021-01-25 18:54:11', '2022-11-08 00:25:36'),
(18, 2, 'blog', '{\"title\":\"Publicaciones de blog\",\"sub_title\":\"\\u00daltimas noticias y Puntas\",\"short_description\":\"Neque expedita, nobis eius excepturi minima ad repellendus quo quas qui, quisquam molestias illo velit cum amet beatae porro in exercitationem nam repellat.\"}', '2021-01-25 18:56:50', '2022-11-08 00:26:47'),
(19, 1, 'call', '{\"number\":\"+10236547896\",\"sub_title\":\"We are here to help your Transaction Call to discuss your Solute\"}', '2021-01-25 19:18:29', '2021-12-26 03:50:13'),
(20, 2, 'call', '{\"number\":\"+8801911105804\",\"sub_title\":\"Estamos aqu\\u00ed para ayudar a su Transaction Call para discutir su Solute\"}', '2021-01-25 19:18:40', '2021-01-28 00:00:29'),
(21, 1, 'customers-content', '{\"title\":\"What is Paypal Wallet?\",\"sub_title\":\"Payment Gateway Redefined\",\"short_description\":\"The project improves skills, fosters entrepreneurship and creates employment along selected value chains.\",\"total_users\":\"70000\",\"total_currency\":\"14000\",\"total_wallet\":\"200000\",\"gateways\":\"29\"}', '2021-01-27 22:21:32', '2022-06-08 06:20:39'),
(22, 2, 'customers-content', '{\"title\":\"Nuestros n\\u00fameros hablan\",\"sub_title\":\"Siempre intentamos comprender las expectativas de los clientes\",\"short_description\":\"<p>M\\u00e1s de 20.000 marcas confiables mediante Pay<br \\/><\\/p>\",\"happy_client\":\"550\",\"weekly_transaction\":\"100000\",\"monthly_transaction\":\"10000000\",\"yearly_transaction\":\"1000000000\"}', '2021-01-27 22:21:57', '2021-12-25 00:12:56'),
(23, 1, 'subscribe', '{\"title\":\"Newslatter\",\"sub_title\":\"Subscribe Our Newslatter\"}', '2021-02-10 05:36:27', '2021-02-10 05:36:27'),
(26, 1, 'login', '{\"title\":\"Login to Get Started\",\"sub_title\":\"Your ease of mind is our priority\",\"short_description\":\"Neque expedita, nobis eius excepturi minima ad repellendus quo quas qui, quisquam molestias illo velit cum amet beatae porro in exerci tationem.\",\"button_name\":\"Back To Home\"}', '2021-12-25 08:37:16', '2022-06-08 03:25:45'),
(27, 1, 'register', '{\"title\":\"Sign Up to Get Started\",\"sub_title\":\"Your ease of mind is our priority\",\"short_description\":\"Neque expedita, nobis eius excepturi minima ad repellendus quo quas qui, quisquam molestias illo velit cum amet beatae porro in exerci tationem.\",\"button_name\":\"Back To Home\"}', '2021-12-25 08:37:49', '2022-06-08 04:45:21'),
(28, 1, 'forget-password', '{\"title\":\"Reset Password\",\"sub_title\":\"Get reset password link\",\"short_description\":\"Neque expedita, nobis eius excepturi minima ad repellendus quo quas qui, quisquam molestias illo velit cum amet beatae porro in exerci tationem.\",\"button_name\":\"Back To Home\"}', '2021-12-25 08:38:16', '2022-06-08 05:40:04'),
(29, 1, 'reset-password', '{\"title\":\"Reset Password\",\"sub_title\":\"Enter your details to reset password\",\"short_description\":\"Neque expedita, nobis eius excepturi minima ad repellendus quo quas qui, quisquam molestias illo velit cum amet beatae porro in exerci tationem.\",\"button_name\":\"Back To Home\"}', '2021-12-25 08:39:39', '2022-06-28 07:37:31'),
(30, 1, 'email-verification', '{\"title\":\"Email Verification\",\"sub_title\":\"Verify your email\"}', '2021-12-25 08:40:06', '2021-12-25 08:40:06'),
(31, 1, 'sms-verification', '{\"title\":\"Phone Number Verification\",\"sub_title\":\"Verify your phone Number\"}', '2021-12-25 08:40:50', '2021-12-25 08:40:50'),
(32, 1, 'add-fund', '{\"short_description\":\"You can deposit money into your own wallet in multiple currencies\"}', '2021-12-25 09:09:33', '2021-12-25 09:13:07'),
(33, 1, 'send-money', '{\"short_description\":\"Send money to your friends and family instantly.\"}', '2021-12-25 09:13:56', '2021-12-26 05:14:35'),
(34, 1, 'request-money', '{\"short_description\":\"Send request for money to your desire one instantly.\"}', '2021-12-25 09:18:24', '2021-12-25 09:18:24'),
(35, 1, 'exchange-money', '{\"short_description\":\"Exchange money from your wallet to another wallet and enjoy hassle free transaction.\"}', '2021-12-25 09:19:33', '2021-12-25 09:19:33'),
(36, 1, 'generate-redeem-code', '{\"short_description\":\"Generate redeem code and share with your desire one and he\\/she will get the credit up.\"}', '2021-12-25 09:21:02', '2021-12-25 09:21:02'),
(37, 1, 'escrow', '{\"short_description\":\"Create escrow from here for your client and enjoy secure payment transaction.\"}', '2021-12-25 09:23:13', '2021-12-25 09:23:13'),
(38, 1, 'voucher-payment', '{\"short_description\":\"Generate voucher for your client and get instant money from them.\"}', '2021-12-25 09:25:30', '2021-12-25 09:25:30'),
(39, 1, 'payout-request', '{\"short_description\":\"Withdraw your money from here.\"}', '2021-12-25 09:26:45', '2021-12-25 09:26:45'),
(40, 2, 'subscribe', '{\"title\":\"Boletin informativo\",\"sub_title\":\"Suscr\\u00edbete a nuestro bolet\\u00edn\"}', '2021-12-26 05:11:16', '2021-12-26 05:11:16'),
(41, 2, 'login', '{\"title\":\"Iniciar sesi\\u00f3n para empezar\",\"sub_title\":\"Tu tranquilidad es nuestra prioridad\",\"short_description\":\"Neque expedita, nobis eius excepturi minima ad repellendus quo quas qui, quisquam molestias illo velit cum amet beatae porro in exerci tationem.\",\"button_name\":\"De vuelta a casa\"}', '2021-12-26 05:12:26', '2022-11-08 00:32:03'),
(42, 2, 'register', '{\"title\":\"Reg\\u00edstrate para empezar\",\"sub_title\":\"Tu tranquilidad es nuestra prioridad\",\"short_description\":\"Neque expedita, nobis eius excepturi minima ad repellendus quo quas qui, quisquam molestias illo velit cum amet beatae porro in exerci tationem.\",\"button_name\":\"De vuelta a casa\"}', '2021-12-26 05:12:42', '2022-11-08 00:32:58'),
(43, 2, 'forget-password', '{\"title\":\"Restablecer la contrase\\u00f1a\",\"sub_title\":\"Obtener enlace de restablecimiento de contrase\\u00f1a\",\"short_description\":\"Neque expedita, nobis eius excepturi minima ad repellendus quo quas qui, quisquam molestias illo velit cum amet beatae porro in exerci tationem.\",\"button_name\":\"De vuelta a casa\"}', '2021-12-26 05:12:58', '2022-11-08 00:33:50'),
(44, 2, 'reset-password', '{\"title\":\"Restablecer la contrase\\u00f1a\",\"sub_title\":\"Ingrese sus datos para restablecer la contrase\\u00f1a\",\"short_description\":\"Neque expedita, nobis eius excepturi minima ad repellendus quo quas qui, quisquam molestias illo velit cum amet beatae porro in exerci tationem.\",\"button_name\":\"De vuelta a casa\"}', '2021-12-26 05:13:16', '2022-11-08 00:34:45'),
(45, 2, 'email-verification', '{\"title\":\"verificacion de email\",\"sub_title\":\"verifica tu correo electr\\u00f3nico\"}', '2021-12-26 05:13:35', '2021-12-26 05:13:35'),
(46, 2, 'sms-verification', '{\"title\":\"Verificaci\\u00f3n del n\\u00famero de tel\\u00e9fono\",\"sub_title\":\"Verifica tu numero de telefono\"}', '2021-12-26 05:13:53', '2021-12-26 05:13:53'),
(47, 2, 'add-fund', '{\"short_description\":\"Puede depositar dinero en su propia billetera en varias monedas\"}', '2021-12-26 05:14:09', '2021-12-26 05:14:09'),
(48, 2, 'send-money', '{\"short_description\":\"Env\\u00ede dinero a sus amigos y familiares al instante.\"}', '2021-12-26 05:14:43', '2021-12-26 05:14:43'),
(49, 2, 'request-money', '{\"short_description\":\"Env\\u00ede la solicitud de dinero a su deseo al instante.\"}', '2021-12-26 05:14:59', '2021-12-26 05:14:59'),
(50, 2, 'exchange-money', '{\"short_description\":\"Cambie dinero de su billetera a otra billetera y disfrute de transacciones sin problemas.\"}', '2021-12-26 05:15:12', '2021-12-26 05:15:12'),
(51, 2, 'generate-redeem-code', '{\"short_description\":\"Genere el c\\u00f3digo de canje y comp\\u00e1rtalo con su deseo y \\u00e9l \\/ ella obtendr\\u00e1 el cr\\u00e9dito.\"}', '2021-12-26 05:15:22', '2021-12-26 05:15:22'),
(52, 2, 'escrow', '{\"short_description\":\"Cree un dep\\u00f3sito en garant\\u00eda desde aqu\\u00ed para su cliente y disfrute de una transacci\\u00f3n de pago segura.\"}', '2021-12-26 05:15:36', '2021-12-26 05:15:36'),
(53, 2, 'voucher-payment', '{\"short_description\":\"Genere un cup\\u00f3n para su cliente y obtenga dinero instant\\u00e1neo de ellos.\"}', '2021-12-26 05:15:49', '2021-12-26 05:15:49'),
(54, 2, 'payout-request', '{\"short_description\":\"Retira tu dinero de aqu\\u00ed.\"}', '2021-12-26 05:16:02', '2021-12-26 05:16:02'),
(55, 1, 'get-started', '{\"title\":\"Get Started\",\"sub_title\":\"How to Get Started\",\"short_description\":\"Neque expedita, nobis eius excepturi minima ad repellendus quo quas qui, quisquam molestias illo velit cum amet beatae porro in exercitationem nam repellat.\"}', '2022-06-06 05:14:26', '2022-06-06 05:14:26'),
(56, 1, 'contact', '{\"title\":\"Contact Information\",\"sub_title\":\"Contact Information We\\u2019ll create high-quality linkable content and build at least 40 high-authority.\"}', '2022-06-08 01:08:56', '2022-06-08 01:08:56'),
(57, 1, 'cookie-consent', '{\"title\":\"The Website uses cookies\",\"popup_short_description\":\"This website uses cookies to improve user experience. By using our website you consent to all cookies in accordance with our Cookie Policy.\",\"description\":\"<h1>Cookie Policy for bugfinder.net<\\/h1>\\r\\n\\r\\n<p>This is the Cookie Policy for bugfinder.net, accessible from https:\\/\\/bugfinder.net<\\/p>\\r\\n\\r\\n<p><strong>What Are Cookies<\\/strong><\\/p>\\r\\n\\r\\n<p>As is common practice with almost all professional websites this site uses cookies, which are tiny files that are downloaded to your computer, to improve your experience. This page describes what information they gather, how we use it and why we sometimes need to store these cookies. We will also share how you can prevent these cookies from being stored however this may downgrade or \'break\' certain elements of the sites functionality.<\\/p>\\r\\n\\r\\n<p><strong>How We Use Cookies<\\/strong><\\/p>\\r\\n\\r\\n<p>We use cookies for a variety of reasons detailed below. Unfortunately in most cases there are no industry standard options for disabling cookies without completely disabling the functionality and features they add to this site. It is recommended that you leave on all cookies if you are not sure whether you need them or not in case they are used to provide a service that you use.<\\/p>\\r\\n\\r\\n<p><strong>Disabling Cookies<\\/strong><\\/p>\\r\\n\\r\\n<p>You can prevent the setting of cookies by adjusting the settings on your browser (see your browser Help for how to do this). Be aware that disabling cookies will affect the functionality of this and many other websites that you visit. Disabling cookies will usually result in also disabling certain functionality and features of the this site. Therefore it is recommended that you do not disable cookies. This Cookies Policy was created with the help of the <a href=\\\"https:\\/\\/www.cookiepolicygenerator.com\\/cookie-policy-generator\\/\\\">Cookies Policy Generator<\\/a>.<\\/p>\\r\\n<p><strong>The Cookies We Set<\\/strong><\\/p>\\r\\n\\r\\n<ul>\\r\\n\\r\\n<li>\\r\\n    <p>Account related cookies<\\/p>\\r\\n    <p>If you create an account with us then we will use cookies for the management of the signup process and general administration. These cookies will usually be deleted when you log out however in some cases they may remain afterwards to remember your site preferences when logged out.<\\/p>\\r\\n<\\/li>\\r\\n\\r\\n<li>\\r\\n    <p>Login related cookies<\\/p>\\r\\n    <p>We use cookies when you are logged in so that we can remember this fact. This prevents you from having to log in every single time you visit a new page. These cookies are typically removed or cleared when you log out to ensure that you can only access restricted features and areas when logged in.<\\/p>\\r\\n<\\/li>\\r\\n\\r\\n<li>\\r\\n    <p>Email newsletters related cookies<\\/p>\\r\\n    <p>This site offers newsletter or email subscription services and cookies may be used to remember if you are already registered and whether to show certain notifications which might only be valid to subscribed\\/unsubscribed users.<\\/p>\\r\\n<\\/li>\\r\\n\\r\\n<li>\\r\\n    <p>Orders processing related cookies<\\/p>\\r\\n    <p>This site offers e-commerce or payment facilities and some cookies are essential to ensure that your order is remembered between pages so that we can process it properly.<\\/p>\\r\\n<\\/li>\\r\\n\\r\\n<li>\\r\\n    <p>Surveys related cookies<\\/p>\\r\\n    <p>From time to time we offer user surveys and questionnaires to provide you with interesting insights, helpful tools, or to understand our user base more accurately. These surveys may use cookies to remember who has already taken part in a survey or to provide you with accurate results after you change pages.<\\/p>\\r\\n<\\/li>\\r\\n\\r\\n<li>\\r\\n    <p>Forms related cookies<\\/p>\\r\\n    <p>When you submit data to through a form such as those found on contact pages or comment forms cookies may be set to remember your user details for future correspondence.<\\/p>\\r\\n<\\/li>\\r\\n\\r\\n<li>\\r\\n    <p>Site preferences cookies<\\/p>\\r\\n    <p>In order to provide you with a great experience on this site we provide the functionality to set your preferences for how this site runs when you use it. In order to remember your preferences we need to set cookies so that this information can be called whenever you interact with a page is affected by your preferences.<\\/p>\\r\\n<\\/li>\\r\\n\\r\\n<\\/ul>\\r\\n\\r\\n<p><strong>Third Party Cookies<\\/strong><\\/p>\\r\\n\\r\\n<p>In some special cases we also use cookies provided by trusted third parties. The following section details which third party cookies you might encounter through this site.<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\r\\n<li>\\r\\n    <p>This site uses Google Analytics which is one of the most widespread and trusted analytics solution on the web for helping us to understand how you use the site and ways that we can improve your experience. These cookies may track things such as how long you spend on the site and the pages that you visit so we can continue to produce engaging content.<\\/p>\\r\\n    <p>For more information on Google Analytics cookies, see the official Google Analytics page.<\\/p>\\r\\n<\\/li>\\r\\n\\r\\n<li>\\r\\n    <p>Third party analytics are used to track and measure usage of this site so that we can continue to produce engaging content. These cookies may track things such as how long you spend on the site or pages you visit which helps us to understand how we can improve the site for you.<\\/p>\\r\\n<\\/li>\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n<\\/ul>\\r\\n\\r\\n<p><strong>More Information<\\/strong><\\/p>\\r\\n\\r\\n<p>Hopefully that has clarified things for you and as was previously mentioned if there is something that you aren\'t sure whether you need or not it\'s usually safer to leave cookies enabled in case it does interact with one of the features you use on our site.<\\/p>\\r\\n\\r\\n<p>For more general information on cookies, please read <a href=\\\"https:\\/\\/www.cookiepolicygenerator.com\\/sample-cookies-policy\\/\\\">the Cookies Policy article<\\/a>.<\\/p>\\r\\n\\r\\n<p>However if you are still looking for more information then you can contact us through one of our preferred contact methods:<\\/p>\\r\\n\\r\\n<ul>\\r\\n<li>Email: <\\/li>\\r\\n<li>By visiting this link: <\\/li>\\r\\n<\\/ul>\"}', '2022-10-04 10:39:20', '2022-10-05 06:34:22'),
(58, 2, 'cookie-consent', '{\"title\":\"El sitio web utiliza cookies\",\"popup_short_description\":\"Este sitio web utiliza cookies para mejorar la experiencia del usuario. Al utilizar nuestro sitio web, acepta todas las cookies de acuerdo con nuestra Pol\\u00edtica de cookies.\",\"description\":\"<h1>Cookie Policy for bugfinder.net<\\/h1>\\r\\n\\r\\n<p>This is the Cookie Policy for bugfinder.net, accessible from https:\\/\\/bugfinder.net<\\/p>\\r\\n\\r\\n<p><strong>What Are Cookies<\\/strong><\\/p>\\r\\n\\r\\n<p>As is common practice with almost all professional websites this site uses cookies, which are tiny files that are downloaded to your computer, to improve your experience. This page describes what information they gather, how we use it and why we sometimes need to store these cookies. We will also share how you can prevent these cookies from being stored however this may downgrade or \'break\' certain elements of the sites functionality.<\\/p>\\r\\n\\r\\n<p><strong>How We Use Cookies<\\/strong><\\/p>\\r\\n\\r\\n<p>We use cookies for a variety of reasons detailed below. Unfortunately in most cases there are no industry standard options for disabling cookies without completely disabling the functionality and features they add to this site. It is recommended that you leave on all cookies if you are not sure whether you need them or not in case they are used to provide a service that you use.<\\/p>\\r\\n\\r\\n<p><strong>Disabling Cookies<\\/strong><\\/p>\\r\\n\\r\\n<p>You can prevent the setting of cookies by adjusting the settings on your browser (see your browser Help for how to do this). Be aware that disabling cookies will affect the functionality of this and many other websites that you visit. Disabling cookies will usually result in also disabling certain functionality and features of the this site. Therefore it is recommended that you do not disable cookies. This Cookies Policy was created with the help of the <a href=\\\"https:\\/\\/www.cookiepolicygenerator.com\\/cookie-policy-generator\\/\\\">Cookies Policy Generator<\\/a>.<\\/p>\\r\\n<p><strong>The Cookies We Set<\\/strong><\\/p>\\r\\n\\r\\n<ul>\\r\\n\\r\\n<li>\\r\\n    <p>Account related cookies<\\/p>\\r\\n    <p>If you create an account with us then we will use cookies for the management of the signup process and general administration. These cookies will usually be deleted when you log out however in some cases they may remain afterwards to remember your site preferences when logged out.<\\/p>\\r\\n<\\/li>\\r\\n\\r\\n<li>\\r\\n    <p>Login related cookies<\\/p>\\r\\n    <p>We use cookies when you are logged in so that we can remember this fact. This prevents you from having to log in every single time you visit a new page. These cookies are typically removed or cleared when you log out to ensure that you can only access restricted features and areas when logged in.<\\/p>\\r\\n<\\/li>\\r\\n\\r\\n<li>\\r\\n    <p>Email newsletters related cookies<\\/p>\\r\\n    <p>This site offers newsletter or email subscription services and cookies may be used to remember if you are already registered and whether to show certain notifications which might only be valid to subscribed\\/unsubscribed users.<\\/p>\\r\\n<\\/li>\\r\\n\\r\\n<li>\\r\\n    <p>Orders processing related cookies<\\/p>\\r\\n    <p>This site offers e-commerce or payment facilities and some cookies are essential to ensure that your order is remembered between pages so that we can process it properly.<\\/p>\\r\\n<\\/li>\\r\\n\\r\\n<li>\\r\\n    <p>Surveys related cookies<\\/p>\\r\\n    <p>From time to time we offer user surveys and questionnaires to provide you with interesting insights, helpful tools, or to understand our user base more accurately. These surveys may use cookies to remember who has already taken part in a survey or to provide you with accurate results after you change pages.<\\/p>\\r\\n<\\/li>\\r\\n\\r\\n<li>\\r\\n    <p>Forms related cookies<\\/p>\\r\\n    <p>When you submit data to through a form such as those found on contact pages or comment forms cookies may be set to remember your user details for future correspondence.<\\/p>\\r\\n<\\/li>\\r\\n\\r\\n<li>\\r\\n    <p>Site preferences cookies<\\/p>\\r\\n    <p>In order to provide you with a great experience on this site we provide the functionality to set your preferences for how this site runs when you use it. In order to remember your preferences we need to set cookies so that this information can be called whenever you interact with a page is affected by your preferences.<\\/p>\\r\\n<\\/li>\\r\\n\\r\\n<\\/ul>\\r\\n\\r\\n<p><strong>Third Party Cookies<\\/strong><\\/p>\\r\\n\\r\\n<p>In some special cases we also use cookies provided by trusted third parties. The following section details which third party cookies you might encounter through this site.<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\r\\n<li>\\r\\n    <p>This site uses Google Analytics which is one of the most widespread and trusted analytics solution on the web for helping us to understand how you use the site and ways that we can improve your experience. These cookies may track things such as how long you spend on the site and the pages that you visit so we can continue to produce engaging content.<\\/p>\\r\\n    <p>For more information on Google Analytics cookies, see the official Google Analytics page.<\\/p>\\r\\n<\\/li>\\r\\n\\r\\n<li>\\r\\n    <p>Third party analytics are used to track and measure usage of this site so that we can continue to produce engaging content. These cookies may track things such as how long you spend on the site or pages you visit which helps us to understand how we can improve the site for you.<\\/p>\\r\\n<\\/li>\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n<\\/ul>\\r\\n\\r\\n<p><strong>More Information<\\/strong><\\/p>\\r\\n\\r\\n<p>Hopefully that has clarified things for you and as was previously mentioned if there is something that you aren\'t sure whether you need or not it\'s usually safer to leave cookies enabled in case it does interact with one of the features you use on our site.<\\/p>\\r\\n\\r\\n<p>For more general information on cookies, please read <a href=\\\"https:\\/\\/www.cookiepolicygenerator.com\\/sample-cookies-policy\\/\\\">the Cookies Policy article<\\/a>.<\\/p>\\r\\n\\r\\n<p>However if you are still looking for more information then you can contact us through one of our preferred contact methods:<\\/p>\\r\\n\\r\\n<ul>\\r\\n<li>Email: <\\/li>\\r\\n<li>By visiting this link: <\\/li>\\r\\n<\\/ul>\"}', '2022-10-04 10:40:03', '2022-11-08 01:24:08'),
(59, 2, 'get-started', '{\"title\":\"Empezar\",\"sub_title\":\"C\\u00f3mo empezar\",\"short_description\":\"<p>Neque expedita, nobis eius excepturi minima ad repellendus quo quas qui, quisquam molestias illo velit cum amet beatae porro in exercitationem nam repellat.<br \\/><\\/p>\"}', '2022-11-08 00:24:05', '2022-11-08 00:24:05'),
(60, 2, 'contact', '{\"title\":\"Informaci\\u00f3n del contacto\",\"sub_title\":\"Informaci\\u00f3n de contacto Crearemos contenido enlazable de alta calidad y construiremos al menos 40 de alta autoridad.\"}', '2022-11-08 00:30:55', '2022-11-08 00:30:55'),
(61, 1, 'invoice-payment', '{\"short_description\":\"Generate invoice for your client and get instant money from them.\"}', '2022-12-10 23:30:35', '2022-12-10 23:43:28'),
(62, 2, 'invoice-payment', '{\"short_description\":\"Genere cup\\u00f3n para su cliente y obtenga dinero instant\\u00e1neo de ellos.\"}', '2022-12-10 23:30:40', '2022-12-10 23:43:42'),
(63, 1, 'virtual-card', '{\"short_description\":\"A \\u201cvirtual card\\u201d is stored on your phone and can be used to pay contactless in stores or online, but has its own unique card number, expiry date, and CVC.\"}', '2023-01-05 01:11:25', '2023-01-05 01:11:25'),
(64, 1, '2fa-verification', '{\"title\":\"2 FA  Verification\",\"sub_title\":\"Verify you are authenticate user\"}', '2023-03-02 00:57:07', '2023-03-02 00:57:07');

-- --------------------------------------------------------

--
-- Table structure for table `template_media`
--

CREATE TABLE `template_media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `section_name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `template_media`
--

INSERT INTO `template_media` (`id`, `section_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'banner', '{\"image\":\"600d2670c10fa1611474544.jpg\",\"thumbnail\":\"6016b3390b4991612100409.jpg\"}', '2021-01-24 01:37:14', '2021-01-31 07:40:09'),
(2, 'about-us', '{\"image\":\"600f9e09f04d21611636233.jpg\",\"thumbnail\":\"600f9e0a02f021611636234.jpg\",\"youtube_link\":\"https:\\/\\/www.youtube.com\\/embed\\/OsXedJq1aWE\"}', '2021-01-24 06:12:07', '2021-01-25 22:43:54'),
(3, 'faq', '{\"image\":\"600d6424eec9f1611490340.png\"}', '2021-01-24 06:12:20', '2021-01-24 06:12:21'),
(5, 'call', '{\"image\":\"600fc2456e99c1611645509.png\"}', '2021-01-26 01:18:29', '2021-01-26 01:18:29'),
(6, 'login', '{\"image\":\"61c72c9cb78d21640443036.jpg\",\"button_link\":\"https:\\/\\/www.google.com\\/\"}', '2021-12-25 08:37:16', '2022-06-08 03:46:40'),
(7, 'register', '{\"image\":\"61c72cbdedff01640443069.jpg\",\"button_link\":\"https:\\/\\/www.google.com\\/\"}', '2021-12-25 08:37:49', '2022-06-24 22:38:18'),
(8, 'forget-password', '{\"image\":\"61c72cd840ca71640443096.jpg\",\"button_link\":\"https:\\/\\/www.google.com\\/\"}', '2021-12-25 08:38:16', '2022-06-24 22:38:36'),
(9, 'reset-password', '{\"image\":\"61c72d2b65eec1640443179.jpg\",\"button_link\":\"https:\\/\\/www.google.com\\/\"}', '2021-12-25 08:39:39', '2022-06-28 07:37:31'),
(10, 'email-verification', '{\"image\":\"61c72d46987031640443206.jpg\"}', '2021-12-25 08:40:06', '2021-12-25 08:40:06'),
(11, 'sms-verification', '{\"image\":\"61c72d72f39aa1640443250.jpg\"}', '2021-12-25 08:40:50', '2021-12-25 08:40:51'),
(12, 'feature', '{\"image\":\"62ba9f49f2e901656397641.png\"}', '2022-06-06 04:18:07', '2022-06-28 00:27:22'),
(13, 'get-started', '{\"image\":\"62ba9fd3333d21656397779.png\"}', '2022-06-06 05:14:26', '2022-06-28 00:29:39');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(91) DEFAULT NULL,
  `ticket` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_message_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_messages`
--

CREATE TABLE `ticket_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` bigint(20) UNSIGNED DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transactional_id` int(11) NOT NULL,
  `transactional_type` varchar(255) NOT NULL,
  `amount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_code` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED DEFAULT NULL,
  `receiver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `percentage` decimal(16,8) NOT NULL DEFAULT 0.00000000 COMMENT 'Percent of charge',
  `charge_percentage` decimal(16,8) NOT NULL DEFAULT 0.00000000 COMMENT 'After adding percent of charge',
  `charge_fixed` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `amount` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `transfer_amount` decimal(16,8) NOT NULL DEFAULT 0.00000000 COMMENT 'Amount deduct from sender',
  `received_amount` decimal(16,8) NOT NULL DEFAULT 0.00000000 COMMENT 'Amount add to receiver',
  `charge_from` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = Sender, 1 = Receiver',
  `note` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=Success,0=Pending',
  `utr` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `two_factor_settings`
--

CREATE TABLE `two_factor_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `security_question_id` bigint(20) UNSIGNED DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL COMMENT 'Security question answer',
  `hints` varchar(255) DEFAULT NULL COMMENT 'Security question answer hints',
  `security_pin` varchar(255) DEFAULT NULL,
  `enable_for` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `two_factor_settings`
--

INSERT INTO `two_factor_settings` (`id`, `user_id`, `security_question_id`, `answer`, `hints`, `security_pin`, `enable_for`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, NULL, NULL, NULL, '2023-03-16 00:34:39', '2023-03-16 00:34:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ref_by` int(11) DEFAULT NULL,
  `store_currency_id` int(11) DEFAULT NULL,
  `qr_currency_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = inactive, 1 = active',
  `qr_link` text DEFAULT NULL,
  `language_id` bigint(20) DEFAULT NULL,
  `email_verification` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = inactive, 1 = active',
  `sms_verification` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = inactive, 1 = active',
  `verify_code` varchar(10) DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `two_fa` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: two-FA off, 1: two-FA on	',
  `two_fa_verify` tinyint(1) NOT NULL DEFAULT 1 COMMENT '	0: two-FA unverified, 1: two-FA verified	',
  `two_fa_code` varchar(20) DEFAULT NULL,
  `kyc_verified` tinyint(4) DEFAULT NULL COMMENT '0=> not verified, 1=>pending , 2=> verified 3=>rejected',
  `password` varchar(255) NOT NULL,
  `public_key` varchar(191) DEFAULT NULL COMMENT 'business api key',
  `secret_key` varchar(191) DEFAULT NULL COMMENT 'business api key',
  `mode` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>test,1=>live',
  `remember_token` varchar(100) DEFAULT NULL,
  `fcm_token` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `notify_active_template` text DEFAULT NULL COMMENT 'notification enable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_kycs`
--

CREATE TABLE `user_kycs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `kyc_info` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>pending , 1=> verified, 2=>rejected',
  `reason` longtext DEFAULT NULL COMMENT 'rejected reason',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE `user_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `state` varchar(32) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `phone_code` varchar(8) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `about_me` text DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `last_login_ip` varchar(16) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `virtual_card_methods`
--

CREATE TABLE `virtual_card_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `parameters` text DEFAULT NULL,
  `currencies` text DEFAULT NULL,
  `debit_currency` varchar(20) DEFAULT NULL,
  `extra_parameters` text DEFAULT NULL,
  `add_fund_parameter` text DEFAULT NULL,
  `form_field` text DEFAULT NULL,
  `currency` text DEFAULT NULL,
  `symbol` text DEFAULT NULL,
  `info_box` mediumtext DEFAULT NULL,
  `alert_message` text NOT NULL COMMENT 'anything need to admin inform from alert',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `virtual_card_methods`
--

INSERT INTO `virtual_card_methods` (`id`, `code`, `name`, `image`, `status`, `parameters`, `currencies`, `debit_currency`, `extra_parameters`, `add_fund_parameter`, `form_field`, `currency`, `symbol`, `info_box`, `alert_message`, `created_at`, `updated_at`) VALUES
(1, 'flutterwave', 'Flutterwave', '63c2aab64d6e41673702070.jpg', 1, '{\"public_key\":\"\",\"secret_key\":\"\",\"encryption_key\":\"\"}', '{\"0\":{\"NGN\":\"NGN\",\"USD\":\"USD\"}}', 'NGN', NULL, '{\"NGN\":{\"MinimumAmount\":{\"field_name\":\"MinimumAmount\",\"field_level\":\"Minimum Amount\",\"field_value\":\"500\",\"type\":\"text\",\"validation\":\"required\"},\"MaximumAmount\":{\"field_name\":\"MaximumAmount\",\"field_level\":\"Maximum Amount\",\"field_value\":\"10000\",\"type\":\"text\",\"validation\":\"required\"},\"PercentCharge\":{\"field_name\":\"PercentCharge\",\"field_level\":\"Percent Charge\",\"field_value\":\"2.3\",\"type\":\"text\",\"validation\":\"required\"},\"FixedCharge\":{\"field_name\":\"FixedCharge\",\"field_level\":\"Fixed Charge\",\"field_value\":\"2\",\"type\":\"text\",\"validation\":\"required\"},\"OpeningAmount\":{\"field_name\":\"OpeningAmount\",\"field_level\":\"Opening Amount\",\"field_value\":\"15\",\"type\":\"text\",\"validation\":\"required\"}},\"USD\":{\"MinimumAmount\":{\"field_name\":\"MinimumAmount\",\"field_level\":\"Minimum Amount\",\"field_value\":\"5\",\"type\":\"text\",\"validation\":\"required\"},\"MaximumAmount\":{\"field_name\":\"MaximumAmount\",\"field_level\":\"Maximum Amount\",\"field_value\":\"500\",\"type\":\"text\",\"validation\":\"required\"},\"PercentCharge\":{\"field_name\":\"PercentCharge\",\"field_level\":\"Percent Charge\",\"field_value\":\"1\",\"type\":\"text\",\"validation\":\"required\"},\"FixedCharge\":{\"field_name\":\"FixedCharge\",\"field_level\":\"Fixed Charge\",\"field_value\":\"2\",\"type\":\"text\",\"validation\":\"required\"},\"OpeningAmount\":{\"field_name\":\"OpeningAmount\",\"field_level\":\"Opening Amount\",\"field_value\":\"5\",\"type\":\"text\",\"validation\":\"required\"}}}', '{\"FirstName\":{\"field_name\":\"FirstName\",\"field_level\":\"First Name\",\"field_place\":\"Example\",\"type\":\"text\",\"validation\":\"required\"},\"LastName\":{\"field_name\":\"LastName\",\"field_level\":\"Last Name\",\"field_place\":\"User\",\"type\":\"text\",\"validation\":\"required\"},\"DateOfBirth\":{\"field_name\":\"DateOfBirth\",\"field_level\":\"Date Of Birth\",\"field_place\":\"1996/12/30\",\"type\":\"date\",\"validation\":\"required\"},\"Email\":{\"field_name\":\"Email\",\"field_level\":\"Email\",\"field_place\":\"userg@example.com\",\"type\":\"text\",\"validation\":\"required\"},\"Phone\":{\"field_name\":\"Phone\",\"field_level\":\"Phone\",\"field_place\":\"07030000000\",\"type\":\"text\",\"validation\":\"required\"},\"Title\":{\"field_name\":\"Title\",\"field_level\":\"Title\",\"field_place\":\"MR\",\"type\":\"text\",\"validation\":\"required\"},\"Gender\":{\"field_name\":\"Gender\",\"field_level\":\"Gender\",\"field_place\":\"M\",\"type\":\"text\",\"validation\":\"required\"},\"BillingName\":{\"field_name\":\"BillingName\",\"field_level\":\"Billing Name\",\"field_place\":\"Example User.\",\"type\":\"text\",\"validation\":\"nullable\"},\"BillingAddress\":{\"field_name\":\"BillingAddress\",\"field_level\":\"Billing Address\",\"field_place\":\"333, Fremont Street\",\"type\":\"text\",\"validation\":\"nullable\"},\"BillingCity\":{\"field_name\":\"BillingCity\",\"field_level\":\"Billing City\",\"field_place\":\"San Francisco\",\"type\":\"text\",\"validation\":\"nullable\"},\"BillingState\":{\"field_name\":\"BillingState\",\"field_level\":\"Billing State\",\"field_place\":\"CA\",\"type\":\"text\",\"validation\":\"nullable\"},\"BillingCountry\":{\"field_name\":\"BillingCountry\",\"field_level\":\"Billing Country\",\"field_place\":\"US\",\"type\":\"text\",\"validation\":\"nullable\"},\"BillingPostalCode\":{\"field_name\":\"BillingPostalCode\",\"field_level\":\"Billing Postal Code\",\"field_place\":\"94105\",\"type\":\"text\",\"validation\":\"nullable\"}}', '[\"NGN\",\"USD\"]', '[\"₦\",\"$\"]', 'The Flutterwave API allows you to create virtual cards that can be used online to make purchases and complete payments.', '', NULL, '2023-03-16 00:18:27'),
(4, 'ufitpay', 'UfitPay', '63baa1ee7a31c1673175534.png', 0, '{\"Api_Key\":\"\",\"Api_Token\":\"\"}', '{\"0\":{\"NGN\":\"NGN\",\"USD\":\"USD\"}}', 'USD', '', '{\"NGN\":{\"MinimumAmount\":{\"field_name\":\"MinimumAmount\",\"field_level\":\"Minimum Amount\",\"field_value\":\"2500\",\"type\":\"text\",\"validation\":\"required\"},\"MaximumAmount\":{\"field_name\":\"MaximumAmount\",\"field_level\":\"Maximum Amount\",\"field_value\":\"25000\",\"type\":\"text\",\"validation\":\"required\"},\"PercentCharge\":{\"field_name\":\"PercentCharge\",\"field_level\":\"Percent Charge\",\"field_value\":\"2\",\"type\":\"text\",\"validation\":\"required\"},\"FixedCharge\":{\"field_name\":\"FixedCharge\",\"field_level\":\"Fixed Charge\",\"field_value\":\"4\",\"type\":\"text\",\"validation\":\"required\"},\"OpeningAmount\":{\"field_name\":\"OpeningAmount\",\"field_level\":\"Opening Amount\",\"field_value\":\"15\",\"type\":\"text\",\"validation\":\"required\"}},\"USD\":{\"MinimumAmount\":{\"field_name\":\"MinimumAmount\",\"field_level\":\"Minimum Amount\",\"field_value\":\"10\",\"type\":\"text\",\"validation\":\"required\"},\"MaximumAmount\":{\"field_name\":\"MaximumAmount\",\"field_level\":\"Maximum Amount\",\"field_value\":\"500\",\"type\":\"text\",\"validation\":\"required\"},\"PercentCharge\":{\"field_name\":\"PercentCharge\",\"field_level\":\"Percent Charge\",\"field_value\":\"1\",\"type\":\"text\",\"validation\":\"required\"},\"FixedCharge\":{\"field_name\":\"FixedCharge\",\"field_level\":\"Fixed Charge\",\"field_value\":\"2\",\"type\":\"text\",\"validation\":\"required\"},\"OpeningAmount\":{\"field_name\":\"OpeningAmount\",\"field_level\":\"Opening Amount\",\"field_value\":\"3000\",\"type\":\"text\",\"validation\":\"required\"}}}', '{\"FirstName\":{\"field_name\":\"FirstName\",\"field_level\":\"First Name\",\"field_place\":\"Alex\",\"type\":\"text\",\"validation\":\"required\"},\"LastName\":{\"field_name\":\"LastName\",\"field_level\":\"Last Name\",\"field_place\":\"Hels\",\"type\":\"text\",\"validation\":\"required\"},\"Email\":{\"field_name\":\"Email\",\"field_level\":\"Email\",\"field_place\":\"alexhels@gmail.com\",\"type\":\"text\",\"validation\":\"required\"},\"Phone\":{\"field_name\":\"Phone\",\"field_level\":\"Phone\",\"field_place\":\"965852369\",\"type\":\"text\",\"validation\":\"required\"},\"BVN\":{\"field_name\":\"BVN\",\"field_level\":\"BVM\",\"field_place\":\"22485231397\",\"type\":\"text\",\"validation\":\"nullable\"}}', '[\"NGN\",\"USD\"]', '[\"₦\",\"$\"]', 'UfitPay offer you a simplified, unified, secure &amp; convenient banking, payment and fintech solutions, at much cheaper price.', 'Minimum Opening Amount: 10 USD or 2500 NGN', NULL, '2023-03-16 00:18:27');

-- --------------------------------------------------------

--
-- Table structure for table `virtual_card_orders`
--

CREATE TABLE `virtual_card_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `virtual_card_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `form_input` text DEFAULT NULL,
  `status` tinyint(10) NOT NULL DEFAULT 0 COMMENT '0=>pending,1=>approve,2=>rejected,3=>resubmit,4=>generate,5=>block rqst,6=>fund rejected,7=>block,8=>add_fund_rqst,9=>inactive',
  `fund_amount` double NOT NULL DEFAULT 0,
  `fund_charge` double NOT NULL DEFAULT 0,
  `reason` text DEFAULT NULL,
  `resubmitted` tinyint(4) DEFAULT NULL COMMENT '0=>no,1=>yes',
  `charge` double NOT NULL DEFAULT 0 COMMENT 'admin charge',
  `charge_currency` int(11) DEFAULT NULL COMMENT 'admin base currency',
  `card_info` text DEFAULT NULL COMMENT 'response card information',
  `balance` double NOT NULL DEFAULT 0,
  `cvv` varchar(100) DEFAULT NULL,
  `card_number` text DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `name_on_card` varchar(50) DEFAULT NULL,
  `card_Id` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_error` text DEFAULT NULL COMMENT 'api given last error',
  `test` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `virtual_card_transactions`
--

CREATE TABLE `virtual_card_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `card_order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `card_id` varchar(50) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `currency_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED DEFAULT NULL,
  `receiver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `percentage` decimal(16,8) NOT NULL DEFAULT 0.00000000 COMMENT 'Percent of charge',
  `charge_percentage` decimal(16,8) NOT NULL DEFAULT 0.00000000 COMMENT 'After adding percent of charge',
  `charge_fixed` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `amount` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `transfer_amount` decimal(16,8) NOT NULL DEFAULT 0.00000000 COMMENT 'Amount deduct from sender',
  `received_amount` decimal(16,8) NOT NULL DEFAULT 0.00000000 COMMENT 'Amount add to receiver',
  `charge_from` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = Sender, 1 = Receiver',
  `note` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=Pending, 1=generate, 2 = payment done, 5 = cancel',
  `utr` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `balance` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `is_active` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = active, 0 = inactive',
  `is_default` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 = default, 0 = not default',
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
  ADD UNIQUE KEY `admins_username_unique` (`username`);

--
-- Indexes for table `admin_profiles`
--
ALTER TABLE `admin_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_profiles_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `api_orders`
--
ALTER TABLE `api_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `api_orders_user_id_index` (`user_id`),
  ADD KEY `api_orders_currency_id_index` (`currency_id`),
  ADD KEY `api_orders_gateway_id_index` (`gateway_id`);

--
-- Indexes for table `api_order_tests`
--
ALTER TABLE `api_order_tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `api_order_tests_user_id_index` (`user_id`),
  ADD KEY `api_order_tests_currency_id_index` (`currency_id`),
  ADD KEY `api_order_tests_gateway_id_index` (`gateway_id`);

--
-- Indexes for table `basic_controls`
--
ALTER TABLE `basic_controls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill_methods`
--
ALTER TABLE `bill_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill_pays`
--
ALTER TABLE `bill_pays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_pays_method_id_index` (`method_id`),
  ADD KEY `bill_pays_user_id_index` (`user_id`),
  ADD KEY `bill_pays_service_id_index` (`service_id`);

--
-- Indexes for table `bill_services`
--
ALTER TABLE `bill_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_services_bill_method_id_index` (`bill_method_id`);

--
-- Indexes for table `charges_limits`
--
ALTER TABLE `charges_limits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commission_entries`
--
ALTER TABLE `commission_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commission_entries_to_user_foreign` (`to_user`),
  ADD KEY `commission_entries_from_user_foreign` (`from_user`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deposits_user_id_foreign` (`user_id`),
  ADD KEY `deposits_currency_id_foreign` (`currency_id`),
  ADD KEY `deposits_charges_limit_id_foreign` (`charges_limit_id`),
  ADD KEY `deposits_payment_method_id_foreign` (`payment_method_id`);

--
-- Indexes for table `disputes`
--
ALTER TABLE `disputes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dispute_details`
--
ALTER TABLE `dispute_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dispute_details_dispute_id_foreign` (`dispute_id`),
  ADD KEY `dispute_details_user_id_foreign` (`user_id`),
  ADD KEY `dispute_details_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_templates_language_id_foreign` (`language_id`);

--
-- Indexes for table `escrows`
--
ALTER TABLE `escrows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `escrows_sender_id_foreign` (`sender_id`),
  ADD KEY `escrows_receiver_id_foreign` (`receiver_id`),
  ADD KEY `escrows_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `exchanges`
--
ALTER TABLE `exchanges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `firebase_notifies`
--
ALTER TABLE `firebase_notifies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `funds`
--
ALTER TABLE `funds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `funds_user_id_foreign` (`user_id`),
  ADD KEY `funds_admin_id_foreign` (`admin_id`),
  ADD KEY `funds_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gateways_code_unique` (`code`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_sender_id_index` (`sender_id`),
  ADD KEY `invoices_recuring_invoice_id_index` (`recuring_invoice_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `kycs`
--
ALTER TABLE `kycs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `line_items`
--
ALTER TABLE `line_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `line_items_line_item_type_line_item_id_index` (`line_item_type`,`line_item_id`);

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
-- Indexes for table `payouts`
--
ALTER TABLE `payouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payouts_admin_id_foreign` (`admin_id`),
  ADD KEY `payouts_user_id_foreign` (`user_id`),
  ADD KEY `payouts_currency_id_foreign` (`currency_id`),
  ADD KEY `payouts_payout_method_id_foreign` (`payout_method_id`);

--
-- Indexes for table `payout_methods`
--
ALTER TABLE `payout_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_attr_lists`
--
ALTER TABLE `product_attr_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_attr_lists_store_product_attrs_id_index` (`store_product_attrs_id`);

--
-- Indexes for table `product_attr_maps`
--
ALTER TABLE `product_attr_maps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_attr_maps_product_id_index` (`product_id`),
  ADD KEY `product_attr_maps_attributes_id_index` (`attributes_id`);

--
-- Indexes for table `product_orders`
--
ALTER TABLE `product_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_orders_gateway_id_index` (`gateway_id`),
  ADD KEY `product_orders_shipping_id_index` (`shipping_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `currency_id` (`currency_id`);

--
-- Indexes for table `product_order_details`
--
ALTER TABLE `product_order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_order_details_order_id_index` (`order_id`),
  ADD KEY `product_order_details_product_id_index` (`product_id`);

--
-- Indexes for table `product_store_maps`
--
ALTER TABLE `product_store_maps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_store_maps_product_id_index` (`product_id`),
  ADD KEY `product_store_maps_store_id_index` (`store_id`);

--
-- Indexes for table `q_r_codes`
--
ALTER TABLE `q_r_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `q_r_codes_gateway_id_index` (`gateway_id`),
  ADD KEY `q_r_codes_currency_id_index` (`currency_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `razorpay_contacts`
--
ALTER TABLE `razorpay_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recuring_invoices`
--
ALTER TABLE `recuring_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `redeem_codes`
--
ALTER TABLE `redeem_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `redeem_codes_sender_id_foreign` (`sender_id`),
  ADD KEY `redeem_codes_receiver_id_foreign` (`receiver_id`),
  ADD KEY `redeem_codes_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `referral_bonuses`
--
ALTER TABLE `referral_bonuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_money`
--
ALTER TABLE `request_money`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_money_sender_id_foreign` (`sender_id`),
  ADD KEY `request_money_receiver_id_foreign` (`receiver_id`),
  ADD KEY `request_money_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `security_questions`
--
ALTER TABLE `security_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_contacts`
--
ALTER TABLE `seller_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_contacts_store_id_index` (`store_id`),
  ADD KEY `seller_contacts_user_id_index` (`user_id`);

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
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stores_user_id_index` (`user_id`);

--
-- Indexes for table `store_categories`
--
ALTER TABLE `store_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_products`
--
ALTER TABLE `store_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_products_category_id_index` (`category_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `store_product_attrs`
--
ALTER TABLE `store_product_attrs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_product_attrs_user_id_index` (`user_id`);

--
-- Indexes for table `store_product_images`
--
ALTER TABLE `store_product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_product_images_product_id_index` (`product_id`);

--
-- Indexes for table `store_product_stocks`
--
ALTER TABLE `store_product_stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_product_stocks_user_id_index` (`user_id`),
  ADD KEY `store_product_stocks_product_id_index` (`product_id`);

--
-- Indexes for table `store_shippings`
--
ALTER TABLE `store_shippings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_shippings_user_id_index` (`user_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `subscribes`
--
ALTER TABLE `subscribes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templates_language_id_foreign` (`language_id`);

--
-- Indexes for table `template_media`
--
ALTER TABLE `template_media`
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
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `two_factor_settings`
--
ALTER TABLE `two_factor_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_kycs`
--
ALTER TABLE `user_kycs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_kycs_user_id_index` (`user_id`);

--
-- Indexes for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_profiles_user_id_foreign` (`user_id`);

--
-- Indexes for table `virtual_card_methods`
--
ALTER TABLE `virtual_card_methods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `virtual_card_methods_code_unique` (`code`);

--
-- Indexes for table `virtual_card_orders`
--
ALTER TABLE `virtual_card_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `virtual_card_orders_virtual_card_method_id_index` (`virtual_card_method_id`),
  ADD KEY `virtual_card_orders_user_id_index` (`user_id`);

--
-- Indexes for table `virtual_card_transactions`
--
ALTER TABLE `virtual_card_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `virtual_card_transactions_user_id_index` (`user_id`),
  ADD KEY `virtual_card_transactions_card_order_id_index` (`card_order_id`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vouchers_sender_id_foreign` (`sender_id`),
  ADD KEY `vouchers_receiver_id_foreign` (`receiver_id`),
  ADD KEY `vouchers_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admin_profiles`
--
ALTER TABLE `admin_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `api_orders`
--
ALTER TABLE `api_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_order_tests`
--
ALTER TABLE `api_order_tests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `basic_controls`
--
ALTER TABLE `basic_controls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bill_methods`
--
ALTER TABLE `bill_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bill_pays`
--
ALTER TABLE `bill_pays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bill_services`
--
ALTER TABLE `bill_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `charges_limits`
--
ALTER TABLE `charges_limits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `commission_entries`
--
ALTER TABLE `commission_entries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `content_details`
--
ALTER TABLE `content_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `content_media`
--
ALTER TABLE `content_media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disputes`
--
ALTER TABLE `disputes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dispute_details`
--
ALTER TABLE `dispute_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `escrows`
--
ALTER TABLE `escrows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exchanges`
--
ALTER TABLE `exchanges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `firebase_notifies`
--
ALTER TABLE `firebase_notifies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `funds`
--
ALTER TABLE `funds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kycs`
--
ALTER TABLE `kycs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `line_items`
--
ALTER TABLE `line_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `notify_templates`
--
ALTER TABLE `notify_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `payouts`
--
ALTER TABLE `payouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payout_methods`
--
ALTER TABLE `payout_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `product_attr_lists`
--
ALTER TABLE `product_attr_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_attr_maps`
--
ALTER TABLE `product_attr_maps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_orders`
--
ALTER TABLE `product_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_order_details`
--
ALTER TABLE `product_order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_store_maps`
--
ALTER TABLE `product_store_maps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `q_r_codes`
--
ALTER TABLE `q_r_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `razorpay_contacts`
--
ALTER TABLE `razorpay_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recuring_invoices`
--
ALTER TABLE `recuring_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `redeem_codes`
--
ALTER TABLE `redeem_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referral_bonuses`
--
ALTER TABLE `referral_bonuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request_money`
--
ALTER TABLE `request_money`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `security_questions`
--
ALTER TABLE `security_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `seller_contacts`
--
ALTER TABLE `seller_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `site_notifications`
--
ALTER TABLE `site_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_controls`
--
ALTER TABLE `sms_controls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `store_categories`
--
ALTER TABLE `store_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `store_products`
--
ALTER TABLE `store_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `store_product_attrs`
--
ALTER TABLE `store_product_attrs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `store_product_images`
--
ALTER TABLE `store_product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `store_product_stocks`
--
ALTER TABLE `store_product_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `store_shippings`
--
ALTER TABLE `store_shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribes`
--
ALTER TABLE `subscribes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `template_media`
--
ALTER TABLE `template_media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_attachments`
--
ALTER TABLE `ticket_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_messages`
--
ALTER TABLE `ticket_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `two_factor_settings`
--
ALTER TABLE `two_factor_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_kycs`
--
ALTER TABLE `user_kycs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `virtual_card_methods`
--
ALTER TABLE `virtual_card_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `virtual_card_orders`
--
ALTER TABLE `virtual_card_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `virtual_card_transactions`
--
ALTER TABLE `virtual_card_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_profiles`
--
ALTER TABLE `admin_profiles`
  ADD CONSTRAINT `admin_profiles_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`);

--
-- Constraints for table `commission_entries`
--
ALTER TABLE `commission_entries`
  ADD CONSTRAINT `commission_entries_from_user_foreign` FOREIGN KEY (`from_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `commission_entries_to_user_foreign` FOREIGN KEY (`to_user`) REFERENCES `users` (`id`);

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
-- Constraints for table `deposits`
--
ALTER TABLE `deposits`
  ADD CONSTRAINT `deposits_charges_limit_id_foreign` FOREIGN KEY (`charges_limit_id`) REFERENCES `charges_limits` (`id`),
  ADD CONSTRAINT `deposits_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `deposits_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `gateways` (`id`),
  ADD CONSTRAINT `deposits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `dispute_details`
--
ALTER TABLE `dispute_details`
  ADD CONSTRAINT `dispute_details_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`),
  ADD CONSTRAINT `dispute_details_dispute_id_foreign` FOREIGN KEY (`dispute_id`) REFERENCES `disputes` (`id`),
  ADD CONSTRAINT `dispute_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD CONSTRAINT `email_templates_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Constraints for table `escrows`
--
ALTER TABLE `escrows`
  ADD CONSTRAINT `escrows_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `escrows_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `escrows_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `funds`
--
ALTER TABLE `funds`
  ADD CONSTRAINT `funds_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`),
  ADD CONSTRAINT `funds_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `funds_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `notify_templates`
--
ALTER TABLE `notify_templates`
  ADD CONSTRAINT `notify_templates_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Constraints for table `payouts`
--
ALTER TABLE `payouts`
  ADD CONSTRAINT `payouts_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`),
  ADD CONSTRAINT `payouts_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `payouts_payout_method_id_foreign` FOREIGN KEY (`payout_method_id`) REFERENCES `payout_methods` (`id`),
  ADD CONSTRAINT `payouts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `redeem_codes`
--
ALTER TABLE `redeem_codes`
  ADD CONSTRAINT `redeem_codes_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `redeem_codes_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `redeem_codes_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `request_money`
--
ALTER TABLE `request_money`
  ADD CONSTRAINT `request_money_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `request_money_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `request_money_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `templates`
--
ALTER TABLE `templates`
  ADD CONSTRAINT `templates_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

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

--
-- Constraints for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD CONSTRAINT `user_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD CONSTRAINT `vouchers_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `vouchers_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `vouchers_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
