-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 21, 2021 at 06:09 PM
-- Server version: 10.3.31-MariaDB
-- PHP Version: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `duradrivecom_duradb`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_type`
--

CREATE TABLE `account_type` (
  `id` int(11) NOT NULL,
  `accountName` text NOT NULL,
  `description` text NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account_type`
--

INSERT INTO `account_type` (`id`, `accountName`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Personal', 'Lorem ipsum dolor sit amet&nbsp;', 'active', '2021-08-17 17:49:24', '2021-09-04 15:05:51'),
(2, 'Corporate', 'Lorem ipsum dolor sit amet consectetur adipisicing elit.', 'active', '2021-08-17 17:49:24', '2021-08-17 17:49:24'),
(3, 'VIP', 'Lorem ipsum dolor sit amet consectetur adipisicing elit.', 'active', '2021-08-17 17:49:24', '2021-08-17 17:49:24'),
(4, 'Test', 'Lorem ipsum dolor sit amet consectetur adipisicing elit.', 'active', '2021-08-19 14:04:50', '2021-08-21 20:08:49'),
(5, 'test5', 'Lorem ipsum dolor sit amet consectetur adipisicing elit.', 'active', '2021-08-19 14:06:27', '2021-08-25 16:49:05'),
(6, 'test51', 'Lorem ipsum dolor sit amet consectetur adipisicing elit.', 'inactive', '2021-08-28 17:56:58', '2021-08-28 17:57:38'),
(7, 'test', 'test1111', 'active', '2021-08-28 20:00:04', '2021-08-28 20:00:42');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin_type` varchar(255) DEFAULT NULL,
  `area_list` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_user`
--

INSERT INTO `admin_user` (`id`, `name`, `phone`, `address`, `password`, `admin_type`, `area_list`, `role`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Upendra update', '+917905848333', 'upendrasngh5@gmail.com', 'test@123', 'alltype', 'alltype', 'role', 1, '2021-09-19 21:02:45', '2021-09-19 14:33:35');

-- --------------------------------------------------------

--
-- Table structure for table `areservice`
--

CREATE TABLE `areservice` (
  `id` int(11) NOT NULL,
  `country` int(11) DEFAULT 0,
  `area` int(11) DEFAULT 0,
  `mon` int(11) DEFAULT 0,
  `tue` int(11) DEFAULT 0,
  `wed` int(11) DEFAULT 0,
  `thu` int(11) DEFAULT 0,
  `fri` int(11) DEFAULT 0,
  `sat` int(11) DEFAULT 0,
  `sun` int(11) DEFAULT 0,
  `sunday_start_time` text DEFAULT NULL,
  `sunday_end_time` text DEFAULT NULL,
  `monday_start_time` varchar(255) DEFAULT NULL,
  `monday_end_time` varchar(255) DEFAULT NULL,
  `tuesday_start_time` varchar(255) DEFAULT NULL,
  `tuesday_end_time` varchar(255) DEFAULT NULL,
  `wednesday_start_time` varchar(255) DEFAULT NULL,
  `wednesday_end_time` varchar(255) DEFAULT NULL,
  `thursday_start_time` varchar(255) DEFAULT NULL,
  `thursday_end_time` varchar(255) DEFAULT NULL,
  `friday_start_time` varchar(255) DEFAULT NULL,
  `friday_end_time` varchar(255) DEFAULT NULL,
  `saturday_start_time` varchar(255) DEFAULT NULL,
  `saturday_end_time` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `areservice`
--

INSERT INTO `areservice` (`id`, `country`, `area`, `mon`, `tue`, `wed`, `thu`, `fri`, `sat`, `sun`, `sunday_start_time`, `sunday_end_time`, `monday_start_time`, `monday_end_time`, `tuesday_start_time`, `tuesday_end_time`, `wednesday_start_time`, `wednesday_end_time`, `thursday_start_time`, `thursday_end_time`, `friday_start_time`, `friday_end_time`, `saturday_start_time`, `saturday_end_time`, `created_at`, `updated_at`) VALUES
(1, 169, 14, 1, 1, 1, NULL, 1, 1, 1, '09:37', '14:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-16 21:38:03', '2021-09-16 16:08:03'),
(2, 169, 12, 1, 1, NULL, NULL, NULL, NULL, 1, '04:03', '17:04', '04:02', '17:05', '05:04', '17:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-21 15:03:03', '2021-09-21 09:33:03');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `bannerName` text NOT NULL,
  `bannerImage` text NOT NULL,
  `bannerDescription` text NOT NULL,
  `status` text DEFAULT NULL,
  `created_at` text DEFAULT NULL,
  `updated_at` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `bannerName`, `bannerImage`, `bannerDescription`, `status`, `created_at`, `updated_at`) VALUES
(1, '30% Off', '20210828123955-7-Reasons-You-Should-Ride-Your-Bike-According-to-The-Weather.jpg.webp', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'inactive', '2021-08-18 17:48:52', '2021-08-28 12:39:55'),
(2, 'First Registration', '20210821155127-4.jpg', 'Lorem Ipsum is simply dummy text', 'active', '2021-08-18 17:48:52', '2021-08-21 15:51:27'),
(3, '40% Off', '20210826223917-1.jpg', 'Lorem Ipsum is simply dummy text', 'active', '2021-08-18 20:27:05', '2021-08-26 22:39:17'),
(4, '41% Off', '20210828192150-2.jpg', 'Lorem Ipsum is simply dummy text', 'active', '2021-08-18 20:29:25', '2021-08-28 19:21:50'),
(5, '40% Off', '20210828192531-3.jpg', 'fgfdgfd', 'active', '2021-08-18 20:40:54', '2021-08-28 19:25:31'),
(6, '401% Off', '20210828192911-3.jpg', 'gfdfgdfgdf', 'active', '2021-08-18 20:41:57', '2021-08-28 19:29:11'),
(7, '51% Off', '20210828193052-2.jpg', 'Lorem Ipsum is simply dummy text', 'active', '2021-08-18 20:45:57', '2021-08-28 19:30:52'),
(8, '60%', '20210827195251-3.jpg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'active', '2021-08-19 22:06:53', '2021-08-27 19:52:51'),
(9, '80%', '20210831112517-viktor-bystrov-Gi0OMNguFaw-unsplash.jpg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'active', '2021-08-28 12:41:37', '2021-08-31 11:25:17');

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `upload_by` int(11) NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '''0''=>Active, ''1''=>Inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `upload_by`, `brand_name`, `logo`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'ROLEX', '20200930120553-37538.gif', 0, '2020-09-30 16:07:34', ''),
(3, 1, 'Casio', 'casio.png', 0, '2020-08-27 13:15:50', ''),
(11, 1, 'Audemars Piguet', '20201006140740-Audemars_Piguet_logo_logotype.png', 0, '2020-10-06 18:07:40', ''),
(12, 1, 'PATEK PHILIPPE', '20201009113912-1200px-Patek_Philippe_SA_logo.svg.png', 0, '2020-10-09 15:39:12', ''),
(13, 1, 'HUBLOT', '20201015115129-1200px-Hublot_logo.svg.png', 0, '2020-10-15 15:51:29', ''),
(14, 1, 'IWC', '20201015123219-download.png', 0, '2020-10-15 16:32:19', ''),
(15, 1, 'RICHARD MILLE', '20201019124839-richard.png', 0, '2020-11-30 09:55:13', ''),
(16, 1, 'DIOR', '20201021183911-58429610a6515b1e0ad75ad3.png', 0, '2020-10-21 22:39:11', '');

-- --------------------------------------------------------

--
-- Table structure for table `cardmaster`
--

CREATE TABLE `cardmaster` (
  `id` bigint(20) NOT NULL,
  `cardholdername` varchar(200) NOT NULL,
  `cardnumber` varchar(200) NOT NULL,
  `expdate` varchar(100) NOT NULL,
  `cvv` varchar(100) NOT NULL,
  `isdefault` tinyint(1) NOT NULL,
  `createdbyuserid` int(11) NOT NULL,
  `createddatetime` datetime NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cartmaster`
--

CREATE TABLE `cartmaster` (
  `cartid` bigint(20) NOT NULL,
  `productid` int(11) NOT NULL,
  `cartqty` int(11) NOT NULL,
  `cartcreatedbyuserid` int(11) NOT NULL,
  `createddatetime` datetime NOT NULL DEFAULT current_timestamp(),
  `carttotal` decimal(10,0) NOT NULL,
  `cartdeliverytotal` decimal(10,0) NOT NULL,
  `cartothercharge` decimal(10,0) NOT NULL,
  `carttotalcharge` decimal(10,0) NOT NULL,
  `notes` varchar(300) NOT NULL,
  `coupancode` varchar(200) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `service` varchar(255) NOT NULL,
  `upload_by` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `status` tinyint(11) NOT NULL COMMENT '''0''=>Active, ''1''=>Inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `service`, `upload_by`, `brand_id`, `category_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Dura Express', 1, 1, 'Rolex X1', 0, '2021-08-31 03:50:39', '2021-08-30 23:50:39'),
(4, '', 1, 1, 'Rolex X3', 0, '2020-08-27 12:33:29', ''),
(6, '', 1, 1, 'test-5', 0, '2020-08-27 11:17:29', ''),
(8, '', 1, 2, 'Fastack  Sport', 0, '2020-08-31 13:19:01', ''),
(9, '', 1, 3, 'CASIO CTS-200', 0, '2020-08-31 13:19:16', ''),
(10, '', 1, 1, 'Fastack  Sport V1', 0, '2021-08-27 22:02:43', '2021-08-27 18:02:43'),
(11, '', 1, 13, '1111', 0, '2021-08-28 19:52:14', '2021-08-28 15:52:14');

-- --------------------------------------------------------

--
-- Table structure for table `categorymaster`
--

CREATE TABLE `categorymaster` (
  `categoryid` bigint(20) NOT NULL,
  `categoryname` varchar(200) NOT NULL,
  `categorydesc` varchar(300) NOT NULL,
  `categorycreatedby` bigint(20) NOT NULL,
  `createddatetime` datetime NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `chasout_request`
--

CREATE TABLE `chasout_request` (
  `id` int(11) NOT NULL,
  `merchant_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `commission` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chasout_request`
--

INSERT INTO `chasout_request` (`id`, `merchant_id`, `name`, `country`, `city`, `date`, `payment`, `commission`, `status`, `created_at`, `updated_at`) VALUES
(1, 9348749, 'Food Corner', 'Philippines', 'Manila', '18/09/2021', '$100', '10%', 'Payment Pending', '18/09/2021', '2021-09-18 11:31:55');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `province_id` int(11) UNSIGNED NOT NULL,
  `zipcode` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `province_id`, `zipcode`) VALUES
(1, 'Bangued', 1, '2800'),
(2, 'Boliney', 1, '2815'),
(3, 'Bucay', 1, '2805'),
(4, 'Bucloc', 1, '2817'),
(5, 'Daguioman', 1, '2816'),
(6, 'Danglas', 1, '2825'),
(7, 'Dolores', 1, '2801'),
(8, 'La Paz', 1, '2826'),
(9, 'Lacub', 1, '2821'),
(10, 'Lagangilang', 1, '2902'),
(11, 'Lagayan', 1, '2824'),
(12, 'Langiden', 1, '2807'),
(13, 'Licuan-Baay', 1, ''),
(14, 'Luba', 1, '2813'),
(15, 'Malibcong', 1, '2820'),
(16, 'Manabo', 1, '2810'),
(17, 'Peñarrubia', 1, ''),
(18, 'Pidigan', 1, '2806'),
(19, 'Pilar', 1, '2812'),
(20, 'Sallapadan', 1, '2818'),
(21, 'San Isidro', 1, '2809'),
(22, 'San Juan', 1, '2823'),
(23, 'San Quintin', 1, '2808'),
(24, 'Tayum', 1, '2803'),
(25, 'Tineg', 1, '2822'),
(26, 'Tubo', 1, '2814'),
(27, 'Villaviciosa', 1, '2811'),
(28, 'Butuan City', 2, '8600'),
(29, 'Buenavista', 2, '8601'),
(30, 'Cabadbaran', 2, '8605'),
(31, 'Carmen', 2, '8603'),
(32, 'Jabonga', 2, '8607'),
(33, 'Kitcharao', 2, '8609'),
(34, 'Las Nieves', 2, '8610'),
(35, 'Magallanes', 2, '8604'),
(36, 'Nasipit', 2, '8602'),
(37, 'Remedios T. Romualdez', 2, '8611'),
(38, 'Santiago', 2, '8608'),
(39, 'Tubay', 2, '8606'),
(40, 'Bayugan', 3, '8502'),
(41, 'Bunawan', 3, '8506'),
(42, 'Esperanza', 3, '8513'),
(43, 'La Paz', 3, '8508'),
(44, 'Loreto', 3, '8507'),
(45, 'Prosperidad', 3, '8500'),
(46, 'Rosario', 3, '8504'),
(47, 'San Francisco', 3, '8501'),
(48, 'San Luis', 3, '8511'),
(49, 'Santa Josefa', 3, '8512'),
(50, 'Sibagat', 3, '8503'),
(51, 'Talacogon', 3, '8510'),
(52, 'Trento', 3, '8505'),
(53, 'Veruela', 3, '8509'),
(54, 'Altavas', 4, '5616'),
(55, 'Balete', 4, ''),
(56, 'Banga', 4, '5601'),
(57, 'Batan', 4, '5615'),
(58, 'Buruanga', 4, '5609'),
(59, 'Ibajay', 4, '5613'),
(60, 'Kalibo', 4, '5600'),
(61, 'Lezo', 4, '5605'),
(62, 'Libacao', 4, '5602'),
(63, 'Madalag', 4, '5603'),
(64, 'Makato', 4, '5611'),
(65, 'Malay', 4, '5608'),
(66, 'Malinao', 4, '5606'),
(67, 'Nabas', 4, '5607'),
(68, 'New Washington', 4, '5610'),
(69, 'Numancia', 4, '5604'),
(70, 'Tangalan', 4, '5612'),
(71, 'Legazpi City', 5, '4500'),
(72, 'Ligao City', 5, '4504'),
(73, 'Tabaco City', 5, '4511'),
(74, 'Bacacay', 5, '4509'),
(75, 'Camalig', 5, '4502'),
(76, 'Daraga', 5, '4501'),
(77, 'Guinobatan', 5, '4503'),
(78, 'Jovellar', 5, '4515'),
(79, 'Libon', 5, '4507'),
(80, 'Malilipot', 5, '4510'),
(81, 'Malinao', 5, '4512'),
(82, 'Manito', 5, '4514'),
(83, 'Oas', 5, '4505'),
(84, 'Pio Duran', 5, '4516'),
(85, 'Polangui', 5, '4506'),
(86, 'Rapu-Rapu', 5, '4517'),
(87, 'Santo Domingo', 5, '4508'),
(88, 'Tiwi', 5, '4513'),
(89, 'Anini-y', 6, '5717'),
(90, 'Barbaza', 6, '5706'),
(91, 'Belison', 6, '5701'),
(92, 'Bugasong', 6, '5704'),
(93, 'Caluya', 6, '5711'),
(94, 'Culasi', 6, '5708'),
(95, 'Hamtic', 6, '5715'),
(96, 'Laua-an', 6, '5705'),
(97, 'Libertad', 6, '5710'),
(98, 'Pandan', 6, '5712'),
(99, 'Patnongon', 6, '5702'),
(100, 'San Jose', 6, '6202'),
(101, 'San Remigio', 6, '6011'),
(102, 'Sebaste', 6, '5709'),
(103, 'Sibalom', 6, '5713'),
(104, 'Tibiao', 6, '5707'),
(105, 'Tobias Fornier', 6, '5716'),
(106, 'Valderrama', 6, '5703'),
(107, 'Calanasan', 7, '3814'),
(108, 'Conner', 7, '3807'),
(109, 'Flora', 7, '3810'),
(110, 'Kabugao', 7, '3809'),
(111, 'Luna', 7, '3813'),
(112, 'Pudtol', 7, '3812'),
(113, 'Santa Marcela', 7, '3811'),
(114, 'Baler', 8, '3200'),
(115, 'Casiguran', 8, '3204'),
(116, 'Dilasag', 8, '3205'),
(117, 'Dinalungan', 8, '3206'),
(118, 'Dingalan', 8, '3207'),
(119, 'Dipaculao', 8, '3203'),
(120, 'Maria Aurora', 8, '3202'),
(121, 'San Luis', 8, '3201'),
(122, 'Isabela City', 9, '7300'),
(123, 'Akbar', 9, ''),
(124, 'Al-Barka', 9, ''),
(125, 'Hadji Mohammad Ajul', 9, ''),
(126, 'Hadji Muhtamad', 9, ''),
(127, 'Lamitan', 9, '7302'),
(128, 'Lantawan', 9, '7301'),
(129, 'Maluso', 9, '7303'),
(130, 'Sumisip', 9, '7305'),
(131, 'Tabuan-Lasa', 9, ''),
(132, 'Tipo-Tipo', 9, '7304'),
(133, 'Tuburan', 9, '7306'),
(134, 'Ungkaya Pukan', 9, ''),
(135, 'Balanga City', 10, '2100'),
(136, 'Abucay', 10, '2114'),
(137, 'Bagac', 10, '2107'),
(138, 'Dinalupihan', 10, '2110'),
(139, 'Hermosa', 10, '2111'),
(140, 'Limay', 10, '2103'),
(141, 'Mariveles', 10, '2106'),
(142, 'Morong', 10, '2108'),
(143, 'Orani', 10, '2112'),
(144, 'Orion', 10, '2102'),
(145, 'Pilar', 10, '2101'),
(146, 'Samal', 10, '2113'),
(147, 'Basco', 11, '3900'),
(148, 'Itbayat', 11, '3905'),
(149, 'Ivana', 11, '3902'),
(150, 'Mahatao', 11, '3901'),
(151, 'Sabtang', 11, '3904'),
(152, 'Uyugan', 11, '3903'),
(153, 'Batangas City', 12, '4200'),
(154, 'Lipa City', 12, '4217'),
(155, 'Tanauan City', 12, '4232'),
(156, 'Agoncillo', 12, '4211'),
(157, 'Alitagtag', 12, '4205'),
(158, 'Balayan', 12, '4213'),
(159, 'Balete', 12, ''),
(160, 'Bauan', 12, '4201'),
(161, 'Calaca', 12, '4212'),
(162, 'Calatagan', 12, '4215'),
(163, 'Cuenca', 12, '4222'),
(164, 'Ibaan', 12, '4230'),
(165, 'Laurel', 12, '4221'),
(166, 'Lemery', 12, '4209'),
(167, 'Lian', 12, '4216'),
(168, 'Lobo', 12, '4229'),
(169, 'Mabini', 12, '4202'),
(170, 'Malvar', 12, '4233'),
(171, 'Mataas na Kahoy', 12, '4223'),
(172, 'Nasugbu', 12, '4231'),
(173, 'Padre Garcia', 12, '4224'),
(174, 'Rosario', 12, '4225'),
(175, 'San Jose', 12, '4227'),
(176, 'San Juan', 12, '4226'),
(177, 'San Luis', 12, '4210'),
(178, 'San Nicolas', 12, '4207'),
(179, 'San Pascual', 12, '4204'),
(180, 'Santa Teresita', 12, '4206'),
(181, 'Santo Tomas', 12, '4234'),
(182, 'Taal', 12, '4208'),
(183, 'Talisay', 12, '4220'),
(184, 'Taysan', 12, '4228'),
(185, 'Tingloy', 12, '4203'),
(186, 'Tuy', 12, '4214'),
(187, 'Baguio City', 13, '2600'),
(188, 'Atok', 13, '2612'),
(189, 'Bakun', 13, '2610'),
(190, 'Bokod', 13, '2605'),
(191, 'Buguias', 13, '2607'),
(192, 'Itogon', 13, '2604'),
(193, 'Kabayan', 13, '2606'),
(194, 'Kapangan', 13, '2613'),
(195, 'Kibungan', 13, '2611'),
(196, 'La Trinidad', 13, '2601'),
(197, 'Mankayan', 13, '2608'),
(198, 'Sablan', 13, '2614'),
(199, 'Tuba', 13, '2603'),
(200, 'Tublay', 13, '2615'),
(201, 'Almeria', 14, '6544'),
(202, 'Biliran', 14, '6544'),
(203, 'Cabucgayan', 14, '6550'),
(204, 'Caibiran', 14, '6548'),
(205, 'Culaba', 14, '6547'),
(206, 'Kawayan', 14, '6545'),
(207, 'Maripipi', 14, '6546'),
(208, 'Naval', 14, '6543'),
(209, 'Tagbilaran City', 15, '6300'),
(210, 'Alburquerque', 15, ''),
(211, 'Alicia', 15, '6314'),
(212, 'Anda', 15, '6311'),
(213, 'Antequera', 15, '6335'),
(214, 'Baclayon', 15, '6301'),
(215, 'Balilihan', 15, '6342'),
(216, 'Batuan', 15, '6318'),
(217, 'Bien Unido', 15, '6326'),
(218, 'Bilar', 15, '6317'),
(219, 'Buenavista', 15, '6333'),
(220, 'Calape', 15, '6328'),
(221, 'Candijay', 15, '6312'),
(222, 'Carmen', 15, '6319'),
(223, 'Catigbian', 15, '6343'),
(224, 'Clarin', 15, '6330'),
(225, 'Corella', 15, '6337'),
(226, 'Cortes', 15, ''),
(227, 'Dagohoy', 15, '6322'),
(228, 'Danao', 15, '6344'),
(229, 'Dauis', 15, '6339'),
(230, 'Dimiao', 15, '6305'),
(231, 'Duero', 15, '6309'),
(232, 'Garcia Hernandez', 15, '6307'),
(233, 'Getafe', 15, ''),
(234, 'Guindulman', 15, '6310'),
(235, 'Inabanga', 15, '6332'),
(236, 'Jagna', 15, '6308'),
(237, 'Lila', 15, '6304'),
(238, 'Loay', 15, '6303'),
(239, 'Loboc', 15, '6316'),
(240, 'Loon', 15, '6327'),
(241, 'Mabini', 15, '6313'),
(242, 'Maribojoc', 15, '6336'),
(243, 'Panglao', 15, '6340'),
(244, 'Pilar', 15, '6321'),
(245, 'President Carlos P. Garcia', 15, ''),
(246, 'Sagbayan', 15, '6331'),
(247, 'San Isidro', 15, '6345'),
(248, 'San Miguel', 15, '6323'),
(249, 'Sevilla', 15, '6347'),
(250, 'Sierra Bullones', 15, '6320'),
(251, 'Sikatuna', 15, '6338'),
(252, 'Talibon', 15, '6325'),
(253, 'Trinidad', 15, '6324'),
(254, 'Tubigon', 15, '6329'),
(255, 'Ubay', 15, '6315'),
(256, 'Valencia', 15, '6306'),
(257, 'Malaybalay City', 16, '8700'),
(258, 'Valencia City', 16, '8709'),
(259, 'Baungon', 16, '8707'),
(260, 'Cabanglasan', 16, '8723'),
(261, 'Damulog', 16, '8721'),
(262, 'Dangcagan', 16, '8719'),
(263, 'Don Carlos', 16, '8712'),
(264, 'Impasug-ong', 16, '8702'),
(265, 'Kadingilan', 16, '8713'),
(266, 'Kalilangan', 16, '8718'),
(267, 'Kibawe', 16, '8720'),
(268, 'Kitaotao', 16, '8716'),
(269, 'Lantapan', 16, '8722'),
(270, 'Libona', 16, '8706'),
(271, 'Malitbog', 16, '8704'),
(272, 'Manolo Fortich', 16, '8703'),
(273, 'Maramag', 16, '8714'),
(274, 'Pangantucan', 16, '8717'),
(275, 'Quezon', 16, '8715'),
(276, 'San Fernando', 16, '8711'),
(277, 'Sumilao', 16, '8701'),
(278, 'Talakag', 16, '8708'),
(279, 'Malolos City', 17, '3000'),
(280, 'Meycauayan City', 17, '3020'),
(281, 'San Jose del Monte City', 17, '3023'),
(282, 'Angat', 17, '3012'),
(283, 'Balagtas', 17, '3016'),
(284, 'Baliuag', 17, '3006'),
(285, 'Bocaue', 17, '3018'),
(286, 'Bulacan', 17, '3012'),
(287, 'Bustos', 17, '3007'),
(288, 'Calumpit', 17, '3003'),
(289, 'Doña Remedios Trinidad', 17, ''),
(290, 'Guiguinto', 17, '3015'),
(291, 'Hagonoy', 17, '3002'),
(292, 'Marilao', 17, '3019'),
(293, 'Norzagaray', 17, '3013'),
(294, 'Obando', 17, '3021'),
(295, 'Pandi', 17, '3014'),
(296, 'Paombong', 17, '3001'),
(297, 'Plaridel', 17, '3004'),
(298, 'Pulilan', 17, '3005'),
(299, 'San Ildefonso', 17, '3010'),
(300, 'San Miguel', 17, '3011'),
(301, 'San Rafael', 17, '3008'),
(302, 'Santa Maria', 17, '3022'),
(303, 'Tuguegarao City', 18, '3500'),
(304, 'Abulug', 18, '3517'),
(305, 'Alcala', 18, '3507'),
(306, 'Allacapan', 18, '3523'),
(307, 'Amulung', 18, '3505'),
(308, 'Aparri', 18, '3515'),
(309, 'Baggao', 18, '3506'),
(310, 'Ballesteros', 18, '3516'),
(311, 'Buguey', 18, '3511'),
(312, 'Calayan', 18, '3520'),
(313, 'Camalaniugan', 18, '3510'),
(314, 'Claveria', 18, '3519'),
(315, 'Enrile', 18, '3501'),
(316, 'Gattaran', 18, '3508'),
(317, 'Gonzaga', 18, '3513'),
(318, 'Iguig', 18, '3504'),
(319, 'Lal-lo', 18, '3509'),
(320, 'Lasam', 18, '3524'),
(321, 'Pamplona', 18, '3522'),
(322, 'Peñablanca', 18, '3502'),
(323, 'Piat', 18, '3527'),
(324, 'Rizal', 18, '3526'),
(325, 'Sanchez-Mira', 18, ''),
(326, 'Santa Ana', 18, '3514'),
(327, 'Santa Praxedes', 18, '3521'),
(328, 'Santa Teresita', 18, '3512'),
(329, 'Santo Niño', 18, '3525'),
(330, 'Solana', 18, '3503'),
(331, 'Tuao', 18, '3528'),
(332, 'Basud', 19, '4608'),
(333, 'Capalonga', 19, '4607'),
(334, 'Daet', 19, '4600'),
(335, 'Jose Panganiban', 19, '4606'),
(336, 'Labo', 19, '4604'),
(337, 'Mercedes', 19, '4601'),
(338, 'Paracale', 19, '4605'),
(339, 'San Lorenzo Ruiz', 19, '4610'),
(340, 'San Vicente', 19, '4609'),
(341, 'Santa Elena', 19, '4611'),
(342, 'Talisay', 19, '4602'),
(343, 'Vinzons', 19, '4603'),
(344, 'Iriga City', 20, '4431'),
(345, 'Naga City', 20, '4400'),
(346, 'Baao', 20, '4432'),
(347, 'Balatan', 20, '4436'),
(348, 'Bato', 20, '4435'),
(349, 'Bombon', 20, '4404'),
(350, 'Buhi', 20, '4433'),
(351, 'Bula', 20, '4430'),
(352, 'Cabusao', 20, '4406'),
(353, 'Calabanga', 20, '4405'),
(354, 'Camaligan', 20, '4401'),
(355, 'Canaman', 20, '4402'),
(356, 'Caramoan', 20, '4429'),
(357, 'Del Gallego', 20, '4411'),
(358, 'Gainza', 20, '4412'),
(359, 'Garchitorena', 20, '4428'),
(360, 'Goa', 20, '4422'),
(361, 'Lagonoy', 20, '4425'),
(362, 'Libmanan', 20, '4407'),
(363, 'Lupi', 20, '4409'),
(364, 'Magarao', 20, '4403'),
(365, 'Milaor', 20, '4413'),
(366, 'Minalabac', 20, '4414'),
(367, 'Nabua', 20, '4434'),
(368, 'Ocampo', 20, '4419'),
(369, 'Pamplona', 20, '4416'),
(370, 'Pasacao', 20, '4417'),
(371, 'Pili', 20, '4418'),
(372, 'Presentacion', 20, '4424'),
(373, 'Ragay', 20, '4410'),
(374, 'Sagñay', 20, '4421'),
(375, 'San Fernando', 20, '4415'),
(376, 'San Jose', 20, '4423'),
(377, 'Sipocot', 20, '4408'),
(378, 'Siruma', 20, '4427'),
(379, 'Tigaon', 20, '4420'),
(380, 'Tinambac', 20, '4426'),
(381, 'Catarman', 21, '9104'),
(382, 'Guinsiliban', 21, '9102'),
(383, 'Mahinog', 21, '9101'),
(384, 'Mambajao', 21, '9100'),
(385, 'Sagay', 21, '9103'),
(386, 'Roxas City', 22, '5800'),
(387, 'Cuartero', 22, '5811'),
(388, 'Dao', 22, '5810'),
(389, 'Dumalag', 22, '5813'),
(390, 'Dumarao', 22, '5812'),
(391, 'Ivisan', 22, '5805'),
(392, 'Jamindan', 22, '5808'),
(393, 'Ma-ayon', 22, '5809'),
(394, 'Mambusao', 22, '5807'),
(395, 'Panay', 22, '5801'),
(396, 'Panitan', 22, '5815'),
(397, 'Pilar', 22, '5804'),
(398, 'Pontevedra', 22, '5802'),
(399, 'President Roxas', 22, '5803'),
(400, 'Sapi-an', 22, ''),
(401, 'Sigma', 22, '5816'),
(402, 'Tapaz', 22, '5814'),
(403, 'Bagamanoc', 23, '4807'),
(404, 'Baras', 23, '4803'),
(405, 'Bato', 23, '4801'),
(406, 'Caramoran', 23, '4808'),
(407, 'Gigmoto', 23, '4804'),
(408, 'Pandan', 23, '4809'),
(409, 'Panganiban', 23, '4806'),
(410, 'San Andres', 23, '4810'),
(411, 'San Miguel', 23, '4802'),
(412, 'Viga', 23, '4805'),
(413, 'Virac', 23, '4800'),
(414, 'Cavite City', 24, '4100'),
(415, 'Dasmariñas City', 24, '4114'),
(416, 'Tagaytay City', 24, '4120'),
(417, 'Trece Martires City', 24, '4109'),
(418, 'Alfonso', 24, '4123'),
(419, 'Amadeo', 24, '4119'),
(420, 'Bacoor', 24, '4102'),
(421, 'Carmona', 24, '4116'),
(422, 'General Mariano Alvarez', 24, '4117'),
(423, 'General Emilio Aguinaldo', 24, '4124'),
(424, 'General Trias', 24, '4107'),
(425, 'Imus', 24, '4103'),
(426, 'Indang', 24, '4122'),
(427, 'Kawit', 24, '4104'),
(428, 'Magallanes', 24, '4113'),
(429, 'Maragondon', 24, '4112'),
(430, 'Mendez', 24, '4121'),
(431, 'Naic', 24, '4110'),
(432, 'Noveleta', 24, '4105'),
(433, 'Rosario', 24, '4106'),
(434, 'Silang', 24, '4118'),
(435, 'Tanza', 24, '4108'),
(436, 'Ternate', 24, '4111'),
(437, 'Bogo City', 25, '6010'),
(438, 'Cebu City', 25, '6000'),
(439, 'Carcar City', 25, '6019'),
(440, 'Danao City', 25, '6004'),
(441, 'Lapu-Lapu City', 25, '6015'),
(442, 'Mandaue City', 25, '6014'),
(443, 'Naga City', 25, '6037'),
(444, 'Talisay City', 25, '6045'),
(445, 'Toledo City', 25, '6038'),
(446, 'Alcantara', 25, '6033'),
(447, 'Alcoy', 25, '6023'),
(448, 'Alegria', 25, '6030'),
(449, 'Aloguinsan', 25, '6040'),
(450, 'Argao', 25, '6021'),
(451, 'Asturias', 25, '6042'),
(452, 'Badian', 25, '6031'),
(453, 'Balamban', 25, '6041'),
(454, 'Bantayan', 25, '6052'),
(455, 'Barili', 25, '6036'),
(456, 'Boljoon', 25, '6024'),
(457, 'Borbon', 25, '6008'),
(458, 'Carmen', 25, '6005'),
(459, 'Catmon', 25, '6006'),
(460, 'Compostela', 25, '6003'),
(461, 'Consolacion', 25, '6001'),
(462, 'Cordoba', 25, ''),
(463, 'Daanbantayan', 25, '6013'),
(464, 'Dalaguete', 25, '6022'),
(465, 'Dumanjug', 25, '6035'),
(466, 'Ginatilan', 25, '6028'),
(467, 'Liloan', 25, '6002'),
(468, 'Madridejos', 25, '6053'),
(469, 'Malabuyoc', 25, '6029'),
(470, 'Medellin', 25, '6012'),
(471, 'Minglanilla', 25, '6046'),
(472, 'Moalboal', 25, '6032'),
(473, 'Oslob', 25, '6025'),
(474, 'Pilar', 25, '6048'),
(475, 'Pinamungahan', 25, '6039'),
(476, 'Poro', 25, '6049'),
(477, 'Ronda', 25, '6034'),
(478, 'Samboan', 25, '6027'),
(479, 'San Fernando', 25, '6018'),
(480, 'San Francisco', 25, '6050'),
(481, 'San Remigio', 25, '6011'),
(482, 'Santa Fe', 25, '6047'),
(483, 'Santander', 25, '6026'),
(484, 'Sibonga', 25, '6020'),
(485, 'Sogod', 25, '6007'),
(486, 'Tabogon', 25, '6009'),
(487, 'Tabuelan', 25, '6044'),
(488, 'Tuburan', 25, '6043'),
(489, 'Tudela', 25, '6051'),
(490, 'Compostela', 26, '9413'),
(491, 'Laak', 26, ''),
(492, 'Mabini', 26, ''),
(493, 'Maco', 26, ''),
(494, 'Maragusan', 26, ''),
(495, 'Mawab', 26, ''),
(496, 'Monkayo', 26, ''),
(497, 'Montevista', 26, ''),
(498, 'Nabunturan', 26, ''),
(499, 'New Bataan', 26, ''),
(500, 'Pantukan', 26, ''),
(501, 'Kidapawan City', 27, '9400'),
(502, 'Alamada', 27, '9413'),
(503, 'Aleosan', 27, '9415'),
(504, 'Antipas', 27, '9414'),
(505, 'Arakan', 27, '9417'),
(506, 'Banisilan', 27, '9416'),
(507, 'Carmen', 27, '9408'),
(508, 'Kabacan', 27, '9407'),
(509, 'Libungan', 27, '9411'),
(510, 'M\'lang', 27, '9402'),
(511, 'Magpet', 27, '9404'),
(512, 'Makilala', 27, '9401'),
(513, 'Matalam', 27, '9406'),
(514, 'Midsayap', 27, '9410'),
(515, 'Pigkawayan', 27, '9412'),
(516, 'Pikit', 27, '9409'),
(517, 'President Roxas', 27, '9405'),
(518, 'Tulunan', 27, '9403'),
(519, 'Panabo City', 28, ''),
(520, 'Island Garden City of Samal', 28, ''),
(521, 'Tagum City', 28, ''),
(522, 'Asuncion', 28, ''),
(523, 'Braulio E. Dujali', 28, ''),
(524, 'Carmen', 28, '9408'),
(525, 'Kapalong', 28, ''),
(526, 'New Corella', 28, ''),
(527, 'San Isidro', 28, '8421'),
(528, 'Santo Tomas', 28, ''),
(529, 'Talaingod', 28, ''),
(530, 'Davao City', 29, '9413'),
(531, 'Digos City', 29, ''),
(532, 'Bansalan', 29, ''),
(533, 'Don Marcelino', 29, ''),
(534, 'Hagonoy', 29, ''),
(535, 'Jose Abad Santos', 29, ''),
(536, 'Kiblawan', 29, ''),
(537, 'Magsaysay', 29, ''),
(538, 'Malalag', 29, ''),
(539, 'Malita', 29, ''),
(540, 'Matanao', 29, ''),
(541, 'Padada', 29, ''),
(542, 'Santa Cruz', 29, ''),
(543, 'Santa Maria', 29, ''),
(544, 'Sarangani', 29, '9501'),
(545, 'Sulop', 29, ''),
(546, 'Mati City', 30, ''),
(547, 'Baganga', 30, ''),
(548, 'Banaybanay', 30, ''),
(549, 'Boston', 30, ''),
(550, 'Caraga', 30, ''),
(551, 'Cateel', 30, ''),
(552, 'Governor Generoso', 30, ''),
(553, 'Lupon', 30, ''),
(554, 'Manay', 30, ''),
(555, 'San Isidro', 30, '8421'),
(556, 'Tarragona', 30, ''),
(557, 'Arteche', 31, '6822'),
(558, 'Balangiga', 31, '6812'),
(559, 'Balangkayan', 31, '6801'),
(560, 'Borongan', 31, '6800'),
(561, 'Can-avid', 31, '6806'),
(562, 'Dolores', 31, '6817'),
(563, 'General MacArthur', 31, '6805'),
(564, 'Giporlos', 31, '6811'),
(565, 'Guiuan', 31, '6809'),
(566, 'Hernani', 31, '6804'),
(567, 'Jipapad', 31, '6819'),
(568, 'Lawaan', 31, '6813'),
(569, 'Llorente', 31, '6803'),
(570, 'Maslog', 31, '6820'),
(571, 'Maydolong', 31, '6802'),
(572, 'Mercedes', 31, '6808'),
(573, 'Oras', 31, '6818'),
(574, 'Quinapondan', 31, ''),
(575, 'Salcedo', 31, '6807'),
(576, 'San Julian', 31, '6814'),
(577, 'San Policarpo', 31, '6821'),
(578, 'Sulat', 31, '6815'),
(579, 'Taft', 31, '6816'),
(580, 'Buenavista', 32, '5044'),
(581, 'Jordan', 32, '5045'),
(582, 'Nueva Valencia', 32, '5046'),
(583, 'San Lorenzo', 32, ''),
(584, 'Sibunag', 32, ''),
(585, 'Aguinaldo', 33, '3606'),
(586, 'Alfonso Lista', 33, ''),
(587, 'Asipulo', 33, '3610'),
(588, 'Banaue', 33, '3601'),
(589, 'Hingyon', 33, '3607'),
(590, 'Hungduan', 33, '3603'),
(591, 'Kiangan', 33, '3604'),
(592, 'Lagawe', 33, '3600'),
(593, 'Lamut', 33, '3605'),
(594, 'Mayoyao', 33, '3602'),
(595, 'Tinoc', 33, '3609'),
(596, 'Batac City', 34, '2906'),
(597, 'Laoag City', 34, '2900'),
(598, 'Adams', 34, '2922'),
(599, 'Bacarra', 34, '2916'),
(600, 'Badoc', 34, '2904'),
(601, 'Bangui', 34, '2920'),
(602, 'Banna', 34, '2908'),
(603, 'Burgos', 34, '2918'),
(604, 'Carasi', 34, '2911'),
(605, 'Currimao', 34, '2903'),
(606, 'Dingras', 34, '2913'),
(607, 'Dumalneg', 34, '2921'),
(608, 'Marcos', 34, '2907'),
(609, 'Nueva Era', 34, '2909'),
(610, 'Pagudpud', 34, '2919'),
(611, 'Paoay', 34, '2902'),
(612, 'Pasuquin', 34, '2917'),
(613, 'Piddig', 34, '2912'),
(614, 'Pinili', 34, '2905'),
(615, 'San Nicolas', 34, '2901'),
(616, 'Sarrat', 34, '2914'),
(617, 'Solsona', 34, '2910'),
(618, 'Vintar', 34, '2915'),
(619, 'Candon City', 35, '2710'),
(620, 'Vigan City', 35, '2700'),
(621, 'Alilem', 35, '2716'),
(622, 'Banayoyo', 35, '2708'),
(623, 'Bantay', 35, '2727'),
(624, 'Burgos', 35, '2724'),
(625, 'Cabugao', 35, '2732'),
(626, 'Caoayan', 35, '2702'),
(627, 'Cervantes', 35, '2718'),
(628, 'Galimuyod', 35, '2709'),
(629, 'Gregorio Del Pilar', 35, '2720'),
(630, 'Lidlidda', 35, '2723'),
(631, 'Magsingal', 35, '2730'),
(632, 'Nagbukel', 35, '2725'),
(633, 'Narvacan', 35, '2704'),
(634, 'Quirino', 35, '2721'),
(635, 'Salcedo', 35, '2711'),
(636, 'San Emilio', 35, '2722'),
(637, 'San Esteban', 35, '2706'),
(638, 'San Ildefonso', 35, '2728'),
(639, 'San Juan', 35, '2731'),
(640, 'San Vicente', 35, '2726'),
(641, 'Santa', 35, '2703'),
(642, 'Santa Catalina', 35, '2701'),
(643, 'Santa Cruz', 35, '2713'),
(644, 'Santa Lucia', 35, '2712'),
(645, 'Santa Maria', 35, '2440'),
(646, 'Santiago', 35, '2707'),
(647, 'Santo Domingo', 35, '2729'),
(648, 'Sigay', 35, '2719'),
(649, 'Sinait', 35, '2733'),
(650, 'Sugpon', 35, '2717'),
(651, 'Suyo', 35, '2715'),
(652, 'Tagudin', 35, '2714'),
(653, 'Iloilo City', 36, '5000'),
(654, 'Passi City', 36, '5037'),
(655, 'Ajuy', 36, '5012'),
(656, 'Alimodian', 36, '5028'),
(657, 'Anilao', 36, '5009'),
(658, 'Badiangan', 36, '5033'),
(659, 'Balasan', 36, '5018'),
(660, 'Banate', 36, '5010'),
(661, 'Barotac Nuevo', 36, '5007'),
(662, 'Barotac Viejo', 36, '5011'),
(663, 'Batad', 36, '5016'),
(664, 'Bingawan', 36, '5041'),
(665, 'Cabatuan', 36, '5031'),
(666, 'Calinog', 36, '5040'),
(667, 'Carles', 36, '5019'),
(668, 'Concepcion', 36, '5013'),
(669, 'Dingle', 36, '5035'),
(670, 'Dueñas', 36, '5038'),
(671, 'Dumangas', 36, '5006'),
(672, 'Estancia', 36, '5017'),
(673, 'Guimbal', 36, '5022'),
(674, 'Igbaras', 36, '5029'),
(675, 'Janiuay', 36, '5034'),
(676, 'Lambunao', 36, '5042'),
(677, 'Leganes', 36, '5003'),
(678, 'Lemery', 36, '5043'),
(679, 'Leon', 36, '5026'),
(680, 'Maasin', 36, '5030'),
(681, 'Miagao', 36, '5023'),
(682, 'Mina', 36, '5032'),
(683, 'New Lucena', 36, '5005'),
(684, 'Oton', 36, '5020'),
(685, 'Pavia', 36, '5001'),
(686, 'Pototan', 36, '5008'),
(687, 'San Dionisio', 36, '5015'),
(688, 'San Enrique', 36, '5036'),
(689, 'San Joaquin', 36, '5024'),
(690, 'San Miguel', 36, '5025'),
(691, 'San Rafael', 36, '5039'),
(692, 'Santa Barbara', 36, '5002'),
(693, 'Sara', 36, '5014'),
(694, 'Tigbauan', 36, '5021'),
(695, 'Tubungan', 36, '5027'),
(696, 'Zarraga', 36, '5004'),
(697, 'Cauayan City', 37, '3305'),
(698, 'Santiago City', 37, '3311'),
(699, 'Alicia', 37, '3306'),
(700, 'Angadanan', 37, '3307'),
(701, 'Aurora', 37, '3316'),
(702, 'Benito Soliven', 37, '3331'),
(703, 'Burgos', 37, '3322'),
(704, 'Cabagan', 37, '3328'),
(705, 'Cabatuan', 37, '3315'),
(706, 'Cordon', 37, '3312'),
(707, 'Delfin Albano', 37, '3326'),
(708, 'Dinapigue', 37, '3336'),
(709, 'Divilacan', 37, ''),
(710, 'Echague', 37, '3309'),
(711, 'Gamu', 37, '3301'),
(712, 'Ilagan', 37, '3300'),
(713, 'Jones', 37, '3313'),
(714, 'Luna', 37, '3304'),
(715, 'Maconacon', 37, '3333'),
(716, 'Mallig', 37, '3323'),
(717, 'Naguilian', 37, '3302'),
(718, 'Palanan', 37, '3334'),
(719, 'Quezon', 37, '3324'),
(720, 'Quirino', 37, '3321'),
(721, 'Ramon', 37, '3319'),
(722, 'Reina Mercedes', 37, '3303'),
(723, 'Roxas', 37, '3320'),
(724, 'San Agustin', 37, '3314'),
(725, 'San Guillermo', 37, '3308'),
(726, 'San Isidro', 37, '3310'),
(727, 'San Manuel', 37, '3317'),
(728, 'San Mariano', 37, '3332'),
(729, 'San Mateo', 37, '3318'),
(730, 'San Pablo', 37, '3329'),
(731, 'Santa Maria', 37, '3330'),
(732, 'Santo Tomas', 37, '3327'),
(733, 'Tumauini', 37, '3325'),
(734, 'Tabuk', 38, '3800'),
(735, 'Balbalan', 38, '3801'),
(736, 'Lubuagan', 38, '3802'),
(737, 'Pasil', 38, '3803'),
(738, 'Pinukpuk', 38, '3806'),
(739, 'Rizal', 38, '3808'),
(740, 'Tanudan', 38, '3805'),
(741, 'Tinglayan', 38, '3804'),
(742, 'San Fernando City', 39, '2500'),
(743, 'Agoo', 39, '2504'),
(744, 'Aringay', 39, '2503'),
(745, 'Bacnotan', 39, '2515'),
(746, 'Bagulin', 39, '2512'),
(747, 'Balaoan', 39, '2517'),
(748, 'Bangar', 39, '2519'),
(749, 'Bauang', 39, '2501'),
(750, 'Burgos', 39, '2510'),
(751, 'Caba', 39, '2502'),
(752, 'Luna', 39, '2518'),
(753, 'Naguilian', 39, '3302'),
(754, 'Pugo', 39, '2508'),
(755, 'Rosario', 39, '2506'),
(756, 'San Gabriel', 39, '2513'),
(757, 'San Juan', 39, '2514'),
(758, 'Santo Tomas', 39, '2505'),
(759, 'Santol', 39, '2516'),
(760, 'Sudipen', 39, '2520'),
(761, 'Tubao', 39, '2509'),
(762, 'Biñan City', 40, '4024'),
(763, 'Calamba City', 40, '4027'),
(764, 'San Pablo City', 40, '4000'),
(765, 'Santa Rosa City', 40, '4026'),
(766, 'Alaminos', 40, '4001'),
(767, 'Bay', 40, '4033'),
(768, 'Cabuyao', 40, '4025'),
(769, 'Calauan', 40, '4012'),
(770, 'Cavinti', 40, '4013'),
(771, 'Famy', 40, '4021'),
(772, 'Kalayaan', 40, '4015'),
(773, 'Liliw', 40, '4004'),
(774, 'Los Baños', 40, '4031'),
(775, 'Luisiana', 40, '4032'),
(776, 'Lumban', 40, '4014'),
(777, 'Mabitac', 40, '4020'),
(778, 'Magdalena', 40, '4007'),
(779, 'Majayjay', 40, '4005'),
(780, 'Nagcarlan', 40, '4002'),
(781, 'Paete', 40, '4016'),
(782, 'Pagsanjan', 40, '4008'),
(783, 'Pakil', 40, '4017'),
(784, 'Pangil', 40, '4018'),
(785, 'Pila', 40, '4010'),
(786, 'Rizal', 40, '4003'),
(787, 'San Pedro', 40, '4023'),
(788, 'Santa Cruz', 40, '4009'),
(789, 'Santa Maria', 40, '4022'),
(790, 'Siniloan', 40, '4019'),
(791, 'Victoria', 40, '4011'),
(792, 'Iligan City', 41, '9200'),
(793, 'Bacolod', 41, '9205'),
(794, 'Baloi', 41, '9217'),
(795, 'Baroy', 41, '9210'),
(796, 'Kapatagan', 41, '9214'),
(797, 'Kauswagan', 41, '9202'),
(798, 'Kolambugan', 41, '9207'),
(799, 'Lala', 41, '9211'),
(800, 'Linamon', 41, '9201'),
(801, 'Magsaysay', 41, '9221'),
(802, 'Maigo', 41, '9206'),
(803, 'Matungao', 41, '9203'),
(804, 'Munai', 41, '9219'),
(805, 'Nunungan', 41, '9216'),
(806, 'Pantao Ragat', 41, '9208'),
(807, 'Pantar', 41, '9218'),
(808, 'Poona Piagapo', 41, '9204'),
(809, 'Salvador', 41, '9212'),
(810, 'Sapad', 41, '9213'),
(811, 'Sultan Naga Dimaporo', 41, '9215'),
(812, 'Tagoloan', 41, '9222'),
(813, 'Tangcal', 41, '9220'),
(814, 'Tubod', 41, '9209'),
(815, 'Marawi City', 42, ''),
(816, 'Bacolod-Kalawi', 42, ''),
(817, 'Balabagan', 42, '9302'),
(818, 'Balindong', 42, '9318'),
(819, 'Bayang', 42, '9309'),
(820, 'Binidayan', 42, '9310'),
(821, 'Buadiposo-Buntong', 42, ''),
(822, 'Bubong', 42, '9708'),
(823, 'Bumbaran', 42, '9320'),
(824, 'Butig', 42, '9305'),
(825, 'Calanogas', 42, '9319'),
(826, 'Ditsaan-Ramain', 42, ''),
(827, 'Ganassi', 42, '9311'),
(828, 'Kapai', 42, '9709'),
(829, 'Kapatagan', 42, '9214'),
(830, 'Lumba-Bayabao', 42, ''),
(831, 'Lumbaca-Unayan', 42, ''),
(832, 'Lumbatan', 42, '9307'),
(833, 'Lumbayanague', 42, '9306'),
(834, 'Madalum', 42, '9315'),
(835, 'Madamba', 42, '9314'),
(836, 'Maguing', 42, '9715'),
(837, 'Malabang', 42, '9300'),
(838, 'Marantao', 42, ''),
(839, 'Marogong', 42, ''),
(840, 'Masiu', 42, ''),
(841, 'Mulondo', 42, ''),
(842, 'Pagayawan', 42, ''),
(843, 'Piagapo', 42, '9204'),
(844, 'Poona Bayabao', 42, ''),
(845, 'Pualas', 42, ''),
(846, 'Saguiaran', 42, ''),
(847, 'Sultan Dumalondong', 42, ''),
(848, 'Picong', 42, ''),
(849, 'Tagoloan II', 42, ''),
(850, 'Tamparan', 42, ''),
(851, 'Taraka', 42, ''),
(852, 'Tubaran', 42, ''),
(853, 'Tugaya', 42, ''),
(854, 'Wao', 42, ''),
(855, 'Ormoc City', 43, '6541'),
(856, 'Tacloban City', 43, '6500'),
(857, 'Abuyog', 43, '6510'),
(858, 'Alangalang', 43, '6517'),
(859, 'Albuera', 43, '6542'),
(860, 'Babatngon', 43, '6520'),
(861, 'Barugo', 43, '6519'),
(862, 'Bato', 43, '6525'),
(863, 'Baybay', 43, '6521'),
(864, 'Burauen', 43, '6516'),
(865, 'Calubian', 43, '6534'),
(866, 'Capoocan', 43, '6530'),
(867, 'Carigara', 43, '6529'),
(868, 'Dagami', 43, '6515'),
(869, 'Dulag', 43, '6505'),
(870, 'Hilongos', 43, '6524'),
(871, 'Hindang', 43, '6523'),
(872, 'Inopacan', 43, '6522'),
(873, 'Isabel', 43, '6539'),
(874, 'Jaro', 43, '6527'),
(875, 'Javier', 43, '6511'),
(876, 'Julita', 43, '6506'),
(877, 'Kananga', 43, '6531'),
(878, 'La Paz', 43, '6508'),
(879, 'Leyte', 43, '6510'),
(880, 'Liloan', 43, '6612'),
(881, 'MacArthur', 43, '6509'),
(882, 'Mahaplag', 43, '6512'),
(883, 'Matag-ob', 43, '6532'),
(884, 'Matalom', 43, '6526'),
(885, 'Mayorga', 43, '6507'),
(886, 'Merida', 43, '6540'),
(887, 'Palo', 43, '6501'),
(888, 'Palompon', 43, '6538'),
(889, 'Pastrana', 43, '6514'),
(890, 'San Isidro', 43, '6535'),
(891, 'San Miguel', 43, '6518'),
(892, 'Santa Fe', 43, '6513'),
(893, 'Sogod', 43, '6606'),
(894, 'Tabango', 43, '6536'),
(895, 'Tabontabon', 43, '6504'),
(896, 'Tanauan', 43, '6502'),
(897, 'Tolosa', 43, '6503'),
(898, 'Tunga', 43, '6528'),
(899, 'Villaba', 43, '6537'),
(900, 'Cotabato City', 44, '9600'),
(901, 'Ampatuan', 44, '9609'),
(902, 'Barira', 44, '9614'),
(903, 'Buldon', 44, '9615'),
(904, 'Buluan', 44, '9616'),
(905, 'Datu Abdullah Sangki', 44, ''),
(906, 'Datu Anggal Midtimbang', 44, ''),
(907, 'Datu Blah T. Sinsuat', 44, ''),
(908, 'Datu Hoffer Ampatuan', 44, ''),
(909, 'Datu Montawal', 44, ''),
(910, 'Datu Odin Sinsuat', 44, '9601'),
(911, 'Datu Paglas', 44, '9617'),
(912, 'Datu Piang', 44, '9607'),
(913, 'Datu Salibo', 44, ''),
(914, 'Datu Saudi-Ampatuan', 44, ''),
(915, 'Datu Unsay', 44, ''),
(916, 'General Salipada K. Pendatun', 44, ''),
(917, 'Guindulungan', 44, ''),
(918, 'Kabuntalan', 44, ''),
(919, 'Mamasapano', 44, ''),
(920, 'Mangudadatu', 44, ''),
(921, 'Matanog', 44, '9613'),
(922, 'Northern Kabuntalan', 44, ''),
(923, 'Pagalungan', 44, '9610'),
(924, 'Paglat', 44, ''),
(925, 'Pandag', 44, ''),
(926, 'Parang', 44, '9604'),
(927, 'Rajah Buayan', 44, ''),
(928, 'Shariff Aguak', 44, '9608'),
(929, 'Shariff Saydona Mustapha', 44, ''),
(930, 'South Upi', 44, '9603'),
(931, 'Sultan Kudarat', 44, '9605'),
(932, 'Sultan Mastura', 44, ''),
(933, 'Sultan sa Barongis', 44, '9611'),
(934, 'Talayan', 44, '9612'),
(935, 'Talitay', 44, ''),
(936, 'Upi', 44, '9603'),
(937, 'Boac', 45, '4900'),
(938, 'Buenavista', 45, '4904'),
(939, 'Gasan', 45, '4905'),
(940, 'Mogpog', 45, '4901'),
(941, 'Santa Cruz', 45, '4902'),
(942, 'Torrijos', 45, '4903'),
(943, 'Masbate City', 46, '5414'),
(944, 'Aroroy', 46, '5414'),
(945, 'Baleno', 46, '5413'),
(946, 'Balud', 46, '5412'),
(947, 'Batuan', 46, '5415'),
(948, 'Cataingan', 46, '5405'),
(949, 'Cawayan', 46, '5409'),
(950, 'Claveria', 46, '5419'),
(951, 'Dimasalang', 46, '5403'),
(952, 'Esperanza', 46, '5407'),
(953, 'Mandaon', 46, '5411'),
(954, 'Milagros', 46, '5410'),
(955, 'Mobo', 46, '5401'),
(956, 'Monreal', 46, '5418'),
(957, 'Palanas', 46, '5404'),
(958, 'Pio V. Corpuz', 46, '5406'),
(959, 'Placer', 46, '5408'),
(960, 'San Fernando', 46, '5416'),
(961, 'San Jacinto', 46, '5417'),
(962, 'San Pascual', 46, '5420'),
(963, 'Uson', 46, '5402'),
(964, 'Caloocan', 47, ''),
(965, 'Las Piñas', 47, '1740'),
(966, 'Makati', 47, '1224'),
(967, 'Malabon', 47, '1470'),
(968, 'Mandaluyong', 47, ''),
(969, 'Manila', 47, ''),
(970, 'Marikina', 47, '1800'),
(971, 'Muntinlupa', 47, '1770'),
(972, 'Navotas', 47, '1485'),
(973, 'Parañaque', 47, '1700'),
(974, 'Pasay', 47, '1300'),
(975, 'Pasig', 47, '1600'),
(976, 'Quezon City', 47, '1100'),
(977, 'San Juan City', 47, '1500'),
(978, 'Taguig', 47, ''),
(979, 'Valenzuela City', 47, '1208'),
(980, 'Pateros', 47, ''),
(981, 'Oroquieta City', 48, '7207'),
(982, 'Ozamiz City', 48, ''),
(983, 'Tangub City', 48, '7214'),
(984, 'Aloran', 48, '7206'),
(985, 'Baliangao', 48, '7211'),
(986, 'Bonifacio', 48, '7215'),
(987, 'Calamba', 48, '7210'),
(988, 'Clarin', 48, '7201'),
(989, 'Concepcion', 48, '7213'),
(990, 'Don Victoriano Chiongbian', 48, ''),
(991, 'Jimenez', 48, '7204'),
(992, 'Lopez Jaena', 48, '7208'),
(993, 'Panaon', 48, '7205'),
(994, 'Plaridel', 48, '7209'),
(995, 'Sapang Dalaga', 48, '7212'),
(996, 'Sinacaban', 48, '7203'),
(997, 'Tudela', 48, '7202'),
(998, 'Cagayan de Oro', 49, '9000'),
(999, 'Gingoog City', 49, '9014'),
(1000, 'Alubijid', 49, '9018'),
(1001, 'Balingasag', 49, '9005'),
(1002, 'Balingoan', 49, '9011'),
(1003, 'Binuangan', 49, '9008'),
(1004, 'Claveria', 49, '9004'),
(1005, 'El Salvador', 49, '9017'),
(1006, 'Gitagum', 49, '9020'),
(1007, 'Initao', 49, '9022'),
(1008, 'Jasaan', 49, '9003'),
(1009, 'Kinoguitan', 49, '9010'),
(1010, 'Lagonglong', 49, '9006'),
(1011, 'Laguindingan', 49, '9019'),
(1012, 'Libertad', 49, '9021'),
(1013, 'Lugait', 49, '9025'),
(1014, 'Magsaysay', 49, '9015'),
(1015, 'Manticao', 49, '9024'),
(1016, 'Medina', 49, '9013'),
(1017, 'Naawan', 49, '9023'),
(1018, 'Opol', 49, '9016'),
(1019, 'Salay', 49, '9007'),
(1020, 'Sugbongcogon', 49, '9009'),
(1021, 'Tagoloan', 49, '9001'),
(1022, 'Talisayan', 49, '9012'),
(1023, 'Villanueva', 49, '9002'),
(1024, 'Barlig', 50, '2623'),
(1025, 'Bauko', 50, '2621'),
(1026, 'Besao', 50, '2618'),
(1027, 'Bontoc', 50, '2616'),
(1028, 'Natonin', 50, '2624'),
(1029, 'Paracelis', 50, '2625'),
(1030, 'Sabangan', 50, '2622'),
(1031, 'Sadanga', 50, '2617'),
(1032, 'Sagada', 50, '2619'),
(1033, 'Tadian', 50, '2620'),
(1034, 'Bacolod City', 51, '6100'),
(1035, 'Bago City', 51, '6101'),
(1036, 'Cadiz City', 51, '6121'),
(1037, 'Escalante City', 51, '6124'),
(1038, 'Himamaylan City', 51, '6108'),
(1039, 'Kabankalan City', 51, '6111'),
(1040, 'La Carlota City', 51, '6130'),
(1041, 'Sagay City', 51, '6122'),
(1042, 'San Carlos City', 51, '6127'),
(1043, 'Silay City', 51, '6116'),
(1044, 'Sipalay City', 51, '6113'),
(1045, 'Talisay City', 51, '6115'),
(1046, 'Victorias City', 51, '6119'),
(1047, 'Binalbagan', 51, '6107'),
(1048, 'Calatrava', 51, '6126'),
(1049, 'Candoni', 51, '6110'),
(1050, 'Cauayan', 51, '6112'),
(1051, 'Enrique B. Magalona', 51, '6118'),
(1052, 'Hinigaran', 51, '6106'),
(1053, 'Hinoba-an', 51, '6114'),
(1054, 'Ilog', 51, '6109'),
(1055, 'Isabela', 51, '6128'),
(1056, 'La Castellana', 51, '6131'),
(1057, 'Manapla', 51, '6120'),
(1058, 'Moises Padilla', 51, '6132'),
(1059, 'Murcia', 51, '6129'),
(1060, 'Pontevedra', 51, '6105'),
(1061, 'Pulupandan', 51, '6102'),
(1062, 'Salvador Benedicto', 51, ''),
(1063, 'San Enrique', 51, '6104'),
(1064, 'Toboso', 51, '6125'),
(1065, 'Valladolid', 51, '6103'),
(1066, 'Bais City', 52, '6206'),
(1067, 'Bayawan City', 52, '6221'),
(1068, 'Canlaon City', 52, '6223'),
(1069, 'Guihulngan City', 52, '6214'),
(1070, 'Dumaguete City', 52, '6200'),
(1071, 'Tanjay City', 52, '6204'),
(1072, 'Amlan', 52, '6203'),
(1073, 'Ayungon', 52, '6210'),
(1074, 'Bacong', 52, '6216'),
(1075, 'Basay', 52, '6222'),
(1076, 'Bindoy', 52, '6209'),
(1077, 'Dauin', 52, '6217'),
(1078, 'Jimalalud', 52, '6212'),
(1079, 'La Libertad', 52, '6213'),
(1080, 'Mabinay', 52, '6207'),
(1081, 'Manjuyod', 52, '6208'),
(1082, 'Pamplona', 52, '6205'),
(1083, 'San Jose', 52, '6202'),
(1084, 'Santa Catalina', 52, '6220'),
(1085, 'Siaton', 52, '6219'),
(1086, 'Sibulan', 52, '6201'),
(1087, 'Tayasan', 52, '6211'),
(1088, 'Valencia', 52, '6215'),
(1089, 'Vallehermoso', 52, '6224'),
(1090, 'Zamboanguita', 52, '6218'),
(1091, 'Allen', 53, '6405'),
(1092, 'Biri', 53, '6410'),
(1093, 'Bobon', 53, '6401'),
(1094, 'Capul', 53, '6408'),
(1095, 'Catarman', 53, '6400'),
(1096, 'Catubig', 53, '6418'),
(1097, 'Gamay', 53, '6422'),
(1098, 'Laoang', 53, '6411'),
(1099, 'Lapinig', 53, '6423'),
(1100, 'Las Navas', 53, '6420'),
(1101, 'Lavezares', 53, '6404'),
(1102, 'Lope de Vega', 53, '6403'),
(1103, 'Mapanas', 53, '6412'),
(1104, 'Mondragon', 53, '6417'),
(1105, 'Palapag', 53, '6421'),
(1106, 'Pambujan', 53, '6413'),
(1107, 'Rosario', 53, '6416'),
(1108, 'San Antonio', 53, '6407'),
(1109, 'San Isidro', 53, '6409'),
(1110, 'San Jose', 53, '6402'),
(1111, 'San Roque', 53, '6415'),
(1112, 'San Vicente', 53, '6419'),
(1113, 'Silvino Lobos', 53, '6414'),
(1114, 'Victoria', 53, '6406'),
(1115, 'Cabanatuan City', 54, '3100'),
(1116, 'Gapan City', 54, '3105'),
(1117, 'Science City of Muñoz', 54, ''),
(1118, 'Palayan City', 54, '3132'),
(1119, 'San Jose City', 54, '3121'),
(1120, 'Aliaga', 54, '3111'),
(1121, 'Bongabon', 54, '3128'),
(1122, 'Cabiao', 54, '3107'),
(1123, 'Carranglan', 54, '3123'),
(1124, 'Cuyapo', 54, '3117'),
(1125, 'Gabaldon', 54, '3131'),
(1126, 'General Mamerto Natividad', 54, '3125'),
(1127, 'General Tinio', 54, '3104'),
(1128, 'Guimba', 54, '3115'),
(1129, 'Jaen', 54, '3109'),
(1130, 'Laur', 54, '3129'),
(1131, 'Licab', 54, '3112'),
(1132, 'Llanera', 54, '3126'),
(1133, 'Lupao', 54, '3122'),
(1134, 'Nampicuan', 54, '3116'),
(1135, 'Pantabangan', 54, '3124'),
(1136, 'Peñaranda', 54, '3103'),
(1137, 'Quezon', 54, '3113'),
(1138, 'Rizal', 54, '3127'),
(1139, 'San Antonio', 54, '3108'),
(1140, 'San Isidro', 54, '3106'),
(1141, 'San Leonardo', 54, '3102'),
(1142, 'Santa Rosa', 54, '3101'),
(1143, 'Santo Domingo', 54, '3133'),
(1144, 'Talavera', 54, '3114'),
(1145, 'Talugtug', 54, ''),
(1146, 'Zaragoza', 54, ''),
(1147, 'Alfonso Castaneda', 55, ''),
(1148, 'Ambaguio', 55, '3701'),
(1149, 'Aritao', 55, '3704'),
(1150, 'Bagabag', 55, '3711'),
(1151, 'Bambang', 55, '3702'),
(1152, 'Bayombong', 55, '3700'),
(1153, 'Diadi', 55, '3712'),
(1154, 'Dupax del Norte', 55, '3706'),
(1155, 'Dupax del Sur', 55, '3707'),
(1156, 'Kasibu', 55, '3703'),
(1157, 'Kayapa', 55, '3708'),
(1158, 'Quezon', 55, '3713'),
(1159, 'Santa Fe', 55, '3705'),
(1160, 'Solano', 55, '3709'),
(1161, 'Villaverde', 55, '3710'),
(1162, 'Abra de Ilog', 56, '5108'),
(1163, 'Calintaan', 56, '5102'),
(1164, 'Looc', 56, '5111'),
(1165, 'Lubang', 56, '5109'),
(1166, 'Magsaysay', 56, '5101'),
(1167, 'Mamburao', 56, '5106'),
(1168, 'Paluan', 56, '5107'),
(1169, 'Rizal', 56, '5103'),
(1170, 'Sablayan', 56, '5104'),
(1171, 'San Jose', 56, '5100'),
(1172, 'Santa Cruz', 56, '5105'),
(1173, 'Calapan City', 57, '5200'),
(1174, 'Baco', 57, '5201'),
(1175, 'Bansud', 57, '5210'),
(1176, 'Bongabong', 57, '5211'),
(1177, 'Bulalacao', 57, '5214'),
(1178, 'Gloria', 57, '5209'),
(1179, 'Mansalay', 57, '5213'),
(1180, 'Naujan', 57, '5204'),
(1181, 'Pinamalayan', 57, '5208'),
(1182, 'Pola', 57, '5206'),
(1183, 'Puerto Galera', 57, '5203'),
(1184, 'Roxas', 57, '5212'),
(1185, 'San Teodoro', 57, '5202'),
(1186, 'Socorro', 57, '5207'),
(1187, 'Victoria', 57, '5205'),
(1188, 'Puerto Princesa City', 58, '5300'),
(1189, 'Aborlan', 58, '5302'),
(1190, 'Agutaya', 58, '5320'),
(1191, 'Araceli', 58, '5311'),
(1192, 'Balabac', 58, '5307'),
(1193, 'Bataraza', 58, '5306'),
(1194, 'Brooke\'s Point', 58, '5305'),
(1195, 'Busuanga', 58, '5317'),
(1196, 'Cagayancillo', 58, '5321'),
(1197, 'Coron', 58, '5316'),
(1198, 'Culion', 58, '5315'),
(1199, 'Cuyo', 58, '5318'),
(1200, 'Dumaran', 58, '5310'),
(1201, 'El Nido', 58, '5313'),
(1202, 'Kalayaan', 58, '5322'),
(1203, 'Linapacan', 58, '5314'),
(1204, 'Magsaysay', 58, '5319'),
(1205, 'Narra', 58, '5303'),
(1206, 'Quezon', 58, '5304'),
(1207, 'Rizal', 58, '7104'),
(1208, 'Roxas', 58, '5308'),
(1209, 'San Vicente', 58, '5309'),
(1210, 'Sofronio Española', 58, ''),
(1211, 'Taytay', 58, '5312'),
(1212, 'Angeles City', 59, '2009'),
(1213, 'City of San Fernando', 59, '2000'),
(1214, 'Apalit', 59, '2016'),
(1215, 'Arayat', 59, '2012'),
(1216, 'Bacolor', 59, '2001'),
(1217, 'Candaba', 59, '2013'),
(1218, 'Floridablanca', 59, '2006'),
(1219, 'Guagua', 59, '2003'),
(1220, 'Lubao', 59, '2005'),
(1221, 'Mabalacat', 59, '2010'),
(1222, 'Macabebe', 59, '2018'),
(1223, 'Magalang', 59, '2011'),
(1224, 'Masantol', 59, '2017'),
(1225, 'Mexico', 59, '2021'),
(1226, 'Minalin', 59, '2019'),
(1227, 'Porac', 59, '2008'),
(1228, 'San Luis', 59, '2014'),
(1229, 'San Simon', 59, '2015'),
(1230, 'Santa Ana', 59, '2022'),
(1231, 'Santa Rita', 59, '2002'),
(1232, 'Santo Tomas', 59, '2020'),
(1233, 'Sasmuan', 59, ''),
(1234, 'Alaminos City', 60, '2404'),
(1235, 'Dagupan City', 60, '2400'),
(1236, 'San Carlos City', 60, '2420'),
(1237, 'Urdaneta City', 60, '2428'),
(1238, 'Agno', 60, '2408'),
(1239, 'Aguilar', 60, '2415'),
(1240, 'Alcala', 60, '2425'),
(1241, 'Anda', 60, '2405'),
(1242, 'Asingan', 60, '2439'),
(1243, 'Balungao', 60, '2442'),
(1244, 'Bani', 60, '2407'),
(1245, 'Basista', 60, '2422'),
(1246, 'Bautista', 60, '2424'),
(1247, 'Bayambang', 60, '2423'),
(1248, 'Binalonan', 60, '2436'),
(1249, 'Binmaley', 60, '2417'),
(1250, 'Bolinao', 60, '2406'),
(1251, 'Bugallon', 60, '2416'),
(1252, 'Burgos', 60, '2410'),
(1253, 'Calasiao', 60, '2418'),
(1254, 'Dasol', 60, '2411'),
(1255, 'Infanta', 60, '2412'),
(1256, 'Labrador', 60, '2402'),
(1257, 'Laoac', 60, '2437'),
(1258, 'Lingayen', 60, '2401'),
(1259, 'Mabini', 60, '2409'),
(1260, 'Malasiqui', 60, '2421'),
(1261, 'Manaoag', 60, '2430'),
(1262, 'Mangaldan', 60, '2432'),
(1263, 'Mangatarem', 60, '2413'),
(1264, 'Mapandan', 60, '2429'),
(1265, 'Natividad', 60, '2446'),
(1266, 'Pozzorubio', 60, ''),
(1267, 'Rosales', 60, '2441'),
(1268, 'San Fabian', 60, '2433'),
(1269, 'San Jacinto', 60, '2431'),
(1270, 'San Manuel', 60, '2438'),
(1271, 'San Nicolas', 60, '2447'),
(1272, 'San Quintin', 60, '2444'),
(1273, 'Santa Barbara', 60, '2419'),
(1274, 'Santa Maria', 60, '2440'),
(1275, 'Santo Tomas', 60, '2426'),
(1276, 'Sison', 60, '2434'),
(1277, 'Sual', 60, '2403'),
(1278, 'Tayug', 60, '2445'),
(1279, 'Umingan', 60, '2443'),
(1280, 'Urbiztondo', 60, '2414'),
(1281, 'Villasis', 60, '2427'),
(1282, 'Lucena City', 61, '4301'),
(1283, 'Tayabas City', 61, '4327'),
(1284, 'Agdangan', 61, '4304'),
(1285, 'Alabat', 61, '4333'),
(1286, 'Atimonan', 61, '4331'),
(1287, 'Buenavista', 61, '4320'),
(1288, 'Burdeos', 61, '4340'),
(1289, 'Calauag', 61, '4318'),
(1290, 'Candelaria', 61, '4323'),
(1291, 'Catanauan', 61, '4311'),
(1292, 'Dolores', 61, '4326'),
(1293, 'General Luna', 61, '4310'),
(1294, 'General Nakar', 61, '4338'),
(1295, 'Guinayangan', 61, '4319'),
(1296, 'Gumaca', 61, '4307'),
(1297, 'Infanta', 61, '4336'),
(1298, 'Jomalig', 61, '4342'),
(1299, 'Lopez', 61, '4316'),
(1300, 'Lucban', 61, '4328'),
(1301, 'Macalelon', 61, '4309'),
(1302, 'Mauban', 61, '4330'),
(1303, 'Mulanay', 61, '4312'),
(1304, 'Padre Burgos', 61, '4303'),
(1305, 'Pagbilao', 61, '4302'),
(1306, 'Panukulan', 61, '4337'),
(1307, 'Patnanungan', 61, '4341'),
(1308, 'Perez', 61, '4334'),
(1309, 'Pitogo', 61, '4308'),
(1310, 'Plaridel', 61, '4306'),
(1311, 'Polillo', 61, '4339'),
(1312, 'Quezon', 61, '4304'),
(1313, 'Real', 61, '4335'),
(1314, 'Sampaloc', 61, '4329'),
(1315, 'San Andres', 61, '4314'),
(1316, 'San Antonio', 61, '4324'),
(1317, 'San Francisco', 61, '4315'),
(1318, 'San Narciso', 61, '4313'),
(1319, 'Sariaya', 61, '4322'),
(1320, 'Tagkawayan', 61, '4321'),
(1321, 'Tiaong', 61, '4325'),
(1322, 'Unisan', 61, '4305'),
(1323, 'Aglipay', 62, '3403'),
(1324, 'Cabarroguis', 62, '3400'),
(1325, 'Diffun', 62, '3401'),
(1326, 'Maddela', 62, '3404'),
(1327, 'Nagtipunan', 62, '3405'),
(1328, 'Saguday', 62, '3402'),
(1329, 'Antipolo City', 63, '1870'),
(1330, 'Angono', 63, '1930'),
(1331, 'Baras', 63, '1970'),
(1332, 'Binangonan', 63, '1940'),
(1333, 'Cainta', 63, '1900'),
(1334, 'Cardona', 63, '1950'),
(1335, 'Jalajala', 63, ''),
(1336, 'Morong', 63, '1960'),
(1337, 'Pililla', 63, '1910'),
(1338, 'Rodriguez', 63, '1860'),
(1339, 'San Mateo', 63, '1850'),
(1340, 'Tanay', 63, '1980'),
(1341, 'Taytay', 63, '1920'),
(1342, 'Teresa', 63, '1880'),
(1343, 'Alcantara', 64, '5509'),
(1344, 'Banton', 64, '5515'),
(1345, 'Cajidiocan', 64, '5512'),
(1346, 'Calatrava', 64, '5503'),
(1347, 'Concepcion', 64, '5516'),
(1348, 'Corcuera', 64, '5514'),
(1349, 'Ferrol', 64, '5506'),
(1350, 'Looc', 64, '5507'),
(1351, 'Magdiwang', 64, '5511'),
(1352, 'Odiongan', 64, '5505'),
(1353, 'Romblon', 64, '5509'),
(1354, 'San Agustin', 64, '5501'),
(1355, 'San Andres', 64, '5504'),
(1356, 'San Fernando', 64, '5513'),
(1357, 'San Jose', 64, '5510'),
(1358, 'Santa Fe', 64, '5508'),
(1359, 'Santa Maria', 64, '5502'),
(1360, 'Calbayog City', 65, '6710'),
(1361, 'Catbalogan City', 65, '6700'),
(1362, 'Almagro', 65, '6724'),
(1363, 'Basey', 65, '6720'),
(1364, 'Calbiga', 65, '6715'),
(1365, 'Daram', 65, '6722'),
(1366, 'Gandara', 65, '6706'),
(1367, 'Hinabangan', 65, '6713'),
(1368, 'Jiabong', 65, '6701'),
(1369, 'Marabut', 65, '6721'),
(1370, 'Matuguinao', 65, '6708'),
(1371, 'Motiong', 65, '6702'),
(1372, 'Pagsanghan', 65, '6705'),
(1373, 'Paranas', 65, '6703'),
(1374, 'Pinabacdao', 65, '6716'),
(1375, 'San Jorge', 65, '6707'),
(1376, 'San Jose De Buan', 65, '6723'),
(1377, 'San Sebastian', 65, '6714'),
(1378, 'Santa Margarita', 65, '6709'),
(1379, 'Santa Rita', 65, '6718'),
(1380, 'Santo Niño', 65, '6711'),
(1381, 'Tagapul-an', 65, '6712'),
(1382, 'Talalora', 65, '6719'),
(1383, 'Tarangnan', 65, '6704'),
(1384, 'Villareal', 65, '6717'),
(1385, 'Zumarraga', 65, '6725'),
(1386, 'Alabel', 66, '9501'),
(1387, 'Glan', 66, '9517'),
(1388, 'Kiamba', 66, '9514'),
(1389, 'Maasim', 66, '9502'),
(1390, 'Maitum', 66, '9515'),
(1391, 'Malapatan', 66, '9516'),
(1392, 'Malungon', 66, '9503'),
(1393, 'Enrique Villanueva', 67, '6230'),
(1394, 'Larena', 67, '6226'),
(1395, 'Lazi', 67, '6228'),
(1396, 'Maria', 67, '6229'),
(1397, 'San Juan', 67, '6227'),
(1398, 'Siquijor', 67, '6230'),
(1399, 'Sorsogon City', 68, '4701'),
(1400, 'Barcelona', 68, '4712'),
(1401, 'Bulan', 68, '4706'),
(1402, 'Bulusan', 68, '4704'),
(1403, 'Casiguran', 68, '4702'),
(1404, 'Castilla', 68, '4713'),
(1405, 'Donsol', 68, '4715'),
(1406, 'Gubat', 68, '4710'),
(1407, 'Irosin', 68, '4707'),
(1408, 'Juban', 68, '4703'),
(1409, 'Magallanes', 68, '4705'),
(1410, 'Matnog', 68, '4708'),
(1411, 'Pilar', 68, '4714'),
(1412, 'Prieto Diaz', 68, '4711'),
(1413, 'Santa Magdalena', 68, '4709'),
(1414, 'General Santos City', 69, '9500'),
(1415, 'Koronadal City', 69, '9506'),
(1416, 'Banga', 69, '9511'),
(1417, 'Lake Sebu', 69, ''),
(1418, 'Norala', 69, '9508'),
(1419, 'Polomolok', 69, '9504'),
(1420, 'Santo Niño', 69, '9509'),
(1421, 'Surallah', 69, '9512'),
(1422, 'T\'boli', 69, '9513'),
(1423, 'Tampakan', 69, '9507'),
(1424, 'Tantangan', 69, '9510'),
(1425, 'Tupi', 69, '9505'),
(1426, 'Maasin City', 70, '6600'),
(1427, 'Anahawan', 70, '6610'),
(1428, 'Bontoc', 70, '6604'),
(1429, 'Hinunangan', 70, '6608'),
(1430, 'Hinundayan', 70, '6609'),
(1431, 'Libagon', 70, '6615'),
(1432, 'Liloan', 70, '6612'),
(1433, 'Limasawa', 70, ''),
(1434, 'Macrohon', 70, '6601'),
(1435, 'Malitbog', 70, '6603'),
(1436, 'Padre Burgos', 70, '6602'),
(1437, 'Pintuyan', 70, '6614'),
(1438, 'Saint Bernard', 70, '6616'),
(1439, 'San Francisco', 70, '6613'),
(1440, 'San Juan', 70, '6611'),
(1441, 'San Ricardo', 70, '6617'),
(1442, 'Silago', 70, '6607'),
(1443, 'Sogod', 70, '6606'),
(1444, 'Tomas Oppus', 70, '6605'),
(1445, 'Tacurong City', 71, '9800'),
(1446, 'Bagumbayan', 71, '9810'),
(1447, 'Columbio', 71, '9801'),
(1448, 'Esperanza', 71, '9806'),
(1449, 'Isulan', 71, '9805'),
(1450, 'Kalamansig', 71, '9808'),
(1451, 'Lambayong', 71, '9802'),
(1452, 'Lebak', 71, '9807'),
(1453, 'Lutayan', 71, '9803'),
(1454, 'Palimbang', 71, '9809'),
(1455, 'President Quirino', 71, '9804'),
(1456, 'Senator Ninoy Aquino', 71, '9811'),
(1457, 'Banguingui', 72, ''),
(1458, 'Hadji Panglima Tahil', 72, ''),
(1459, 'Indanan', 72, '7407'),
(1460, 'Jolo', 72, '7400'),
(1461, 'Kalingalan Caluang', 72, ''),
(1462, 'Lugus', 72, '7411'),
(1463, 'Luuk', 72, '7404'),
(1464, 'Maimbung', 72, '7409'),
(1465, 'Old Panamao', 72, ''),
(1466, 'Omar', 72, ''),
(1467, 'Pandami', 72, ''),
(1468, 'Panglima Estino', 72, '7415'),
(1469, 'Pangutaran', 72, ''),
(1470, 'Parang', 72, '7408'),
(1471, 'Pata', 72, '7405'),
(1472, 'Patikul', 72, '7401'),
(1473, 'Siasi', 72, '7412'),
(1474, 'Talipao', 72, '7403'),
(1475, 'Tapul', 72, '7410'),
(1476, 'Surigao City', 73, '8425'),
(1477, 'Alegria', 73, '8425'),
(1478, 'Bacuag', 73, '8408'),
(1479, 'Basilisa', 73, '8413'),
(1480, 'Burgos', 73, '8424'),
(1481, 'Cagdianao', 73, '8411'),
(1482, 'Claver', 73, '8410'),
(1483, 'Dapa', 73, '8417'),
(1484, 'Del Carmen', 73, '8418'),
(1485, 'Dinagat', 73, '8412'),
(1486, 'General Luna', 73, '8419'),
(1487, 'Gigaquit', 73, '8409'),
(1488, 'Libjo', 73, '8414'),
(1489, 'Loreto', 73, '8415'),
(1490, 'Mainit', 73, '8407'),
(1491, 'Malimono', 73, ''),
(1492, 'Pilar', 73, '8420'),
(1493, 'Placer', 73, '8405'),
(1494, 'San Benito', 73, '8423'),
(1495, 'San Francisco', 73, '8401'),
(1496, 'San Isidro', 73, '8421'),
(1497, 'San Jose', 73, '8427'),
(1498, 'Santa Monica', 73, '8422'),
(1499, 'Sison', 73, '8404'),
(1500, 'Socorro', 73, '8416'),
(1501, 'Tagana-an', 73, ''),
(1502, 'Tubajon', 73, ''),
(1503, 'Tubod', 73, ''),
(1504, 'Bislig City', 74, '8311'),
(1505, 'Tandag City', 74, '8300'),
(1506, 'Barobo', 74, '8309'),
(1507, 'Bayabas', 74, '8303'),
(1508, 'Cagwait', 74, '8304'),
(1509, 'Cantilan', 74, ''),
(1510, 'Carmen', 74, '8315'),
(1511, 'Carrascal', 74, '8318'),
(1512, 'Cortes', 74, ''),
(1513, 'Hinatuan', 74, '8310'),
(1514, 'Lanuza', 74, '8314'),
(1515, 'Lianga', 74, '8307'),
(1516, 'Lingig', 74, '8312'),
(1517, 'Madrid', 74, '8316'),
(1518, 'Marihatag', 74, '8306'),
(1519, 'San Agustin', 74, '8305'),
(1520, 'San Miguel', 74, '8301'),
(1521, 'Tagbina', 74, '8308'),
(1522, 'Tago', 74, '8302'),
(1523, 'Tarlac City', 75, '2310'),
(1524, 'Anao', 75, '2310'),
(1525, 'Bamban', 75, '2317'),
(1526, 'Camiling', 75, '2306'),
(1527, 'Capas', 75, '2315'),
(1528, 'Concepcion', 75, '2316'),
(1529, 'Gerona', 75, '2302'),
(1530, 'La Paz', 75, '2314'),
(1531, 'Mayantoc', 75, '2304'),
(1532, 'Moncada', 75, '2308'),
(1533, 'Paniqui', 75, '2307'),
(1534, 'Pura', 75, '2312'),
(1535, 'Ramos', 75, '2311'),
(1536, 'San Clemente', 75, '2305'),
(1537, 'San Jose', 75, '4227'),
(1538, 'San Manuel', 75, '2309'),
(1539, 'Santa Ignacia', 75, '2303'),
(1540, 'Victoria', 75, '2313'),
(1541, 'Bongao', 76, '7500'),
(1542, 'Languyan', 76, '7509'),
(1543, 'Mapun', 76, ''),
(1544, 'Panglima Sugala', 76, ''),
(1545, 'Sapa-Sapa', 76, '7503'),
(1546, 'Sibutu', 76, ''),
(1547, 'Simunul', 76, ''),
(1548, 'Sitangkai', 76, '7506'),
(1549, 'South Ubian', 76, '7504'),
(1550, 'Tandubas', 76, ''),
(1551, 'Turtle Islands', 76, '7507'),
(1552, 'Olongapo City', 77, '2200'),
(1553, 'Botolan', 77, '2202'),
(1554, 'Cabangan', 77, '2203'),
(1555, 'Candelaria', 77, '2212'),
(1556, 'Castillejos', 77, ''),
(1557, 'Iba', 77, '2201'),
(1558, 'Masinloc', 77, '2211'),
(1559, 'Palauig', 77, '2210'),
(1560, 'San Antonio', 77, '2206'),
(1561, 'San Felipe', 77, '2204'),
(1562, 'San Marcelino', 77, '2207'),
(1563, 'San Narciso', 77, '2205'),
(1564, 'Santa Cruz', 77, '2213'),
(1565, 'Subic', 77, ''),
(1566, 'Dapitan City', 78, '7101'),
(1567, 'Dipolog City', 78, '7100'),
(1568, 'Bacungan', 78, ''),
(1569, 'Baliguian', 78, '7123'),
(1570, 'Godod', 78, ''),
(1571, 'Gutalac', 78, '7118'),
(1572, 'Jose Dalman', 78, '7111'),
(1573, 'Kalawit', 78, '7124'),
(1574, 'Katipunan', 78, '7109'),
(1575, 'La Libertad', 78, '7119'),
(1576, 'Labason', 78, '7117'),
(1577, 'Liloy', 78, '7115'),
(1578, 'Manukan', 78, '7110'),
(1579, 'Mutia', 78, '7107'),
(1580, 'Piñan', 78, '7105'),
(1581, 'Polanco', 78, '7106'),
(1582, 'President Manuel A. Roxas', 78, ''),
(1583, 'Rizal', 78, '7104'),
(1584, 'Salug', 78, '7114'),
(1585, 'Sergio Osmeña Sr.', 78, ''),
(1586, 'Siayan', 78, '7113'),
(1587, 'Sibuco', 78, '7122'),
(1588, 'Sibutad', 78, '7103'),
(1589, 'Sindangan', 78, '7112'),
(1590, 'Siocon', 78, '7120'),
(1591, 'Sirawai', 78, ''),
(1592, 'Tampilisan', 78, '7116'),
(1593, 'Pagadian City', 79, '7016'),
(1594, 'Zamboanga City', 79, '7000'),
(1595, 'Aurora', 79, '7020'),
(1596, 'Bayog', 79, '7011'),
(1597, 'Dimataling', 79, '7032'),
(1598, 'Dinas', 79, '7030'),
(1599, 'Dumalinao', 79, '7015'),
(1600, 'Dumingag', 79, '7028'),
(1601, 'Guipos', 79, '7042'),
(1602, 'Josefina', 79, '7027'),
(1603, 'Kumalarang', 79, '7013'),
(1604, 'Labangan', 79, '7017'),
(1605, 'Lakewood', 79, '7014'),
(1606, 'Lapuyan', 79, '7037'),
(1607, 'Mahayag', 79, '7026'),
(1608, 'Margosatubig', 79, ''),
(1609, 'Midsalip', 79, '7021'),
(1610, 'Molave', 79, '7023'),
(1611, 'Pitogo', 79, '7033'),
(1612, 'Ramon Magsaysay', 79, '7024'),
(1613, 'San Miguel', 79, '7029'),
(1614, 'San Pablo', 79, '7031'),
(1615, 'Sominot', 79, ''),
(1616, 'Tabina', 79, '7034'),
(1617, 'Tambulig', 79, '7025'),
(1618, 'Tigbao', 79, '7043'),
(1619, 'Tukuran', 79, '7019'),
(1620, 'Vincenzo A. Sagun', 79, ''),
(1621, 'Alicia', 80, '7040'),
(1622, 'Buug', 80, ''),
(1623, 'Diplahan', 80, '7039'),
(1624, 'Imelda', 80, '7007'),
(1625, 'Ipil', 80, '7001'),
(1626, 'Kabasalan', 80, '7005'),
(1627, 'Mabuhay', 80, '7010'),
(1628, 'Malangas', 80, '7038'),
(1629, 'Naga', 80, '7004'),
(1630, 'Olutanga', 80, '7041'),
(1631, 'Payao', 80, '7008'),
(1632, 'Roseller Lim', 80, '7002'),
(1633, 'Siay', 80, '7006'),
(1634, 'Talusan', 80, '7012'),
(1635, 'Titay', 80, '7003'),
(1636, 'Tungawan', 80, '7018');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `city_name` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `country_id`, `city_name`, `created_at`, `updated_at`) VALUES
(1, 2, 'Noida', '', ''),
(2, 2, 'Greater Noida', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `users_role` enum('1','2','3','4','5') NOT NULL DEFAULT '5' COMMENT '''1''=>''Admin'', ''2''=>''White label'', ''3''=>''manager'', ''4''=>''employee, ''5''=>''Client''''',
  `upload_by` int(11) NOT NULL,
  `white_label_id` int(11) NOT NULL,
  `profile_image` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `country_id` int(11) NOT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `gender` tinyint(4) NOT NULL COMMENT '0=>mail, 1=>femail, 2=>other',
  `email_verified_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `remember_token` varchar(100) DEFAULT NULL,
  `status` enum('0','1') DEFAULT '1' COMMENT '''0'' Active , ''1'' Inactive',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `users_role`, `upload_by`, `white_label_id`, `profile_image`, `name`, `password`, `email`, `country_id`, `address`, `phone`, `dob`, `gender`, `email_verified_at`, `remember_token`, `status`, `created_at`, `updated_at`) VALUES
(63, '5', 61, 58, '20200825122152-user2.png', 'Client ', '$2y$10$LfFhKmNJHYUF68/TLH6aqOMkql4x4Vw1Hf8NmkDhTGT1wIxP5ERKK', 'client@gmail.com', 2, 'street-4, sanjay colony, sasni  Hathras, up', '0000000000', '25-08-2020', 0, '2020-08-25 01:21:52', NULL, '1', '2020-08-25 01:21:52', '2020-08-25 01:21:52'),
(82, '5', 1, 58, '20200825122152-user2.png', 'name', '$2y$10$LfFhKmNJHYUF68/TLH6aqOMkql4x4Vw1Hf8NmkDhTGT1wIxP5ERKK', 'email', 2, 'phase 2, noida', 'phone', '', 0, '2021-09-03 06:56:16', NULL, '1', '2020-08-27 06:31:36', '2020-08-27 06:31:36'),
(83, '5', 1, 58, '20200825122152-user2.png', 'test22', '$2y$10$LfFhKmNJHYUF68/TLH6aqOMkql4x4Vw1Hf8NmkDhTGT1wIxP5ERKK', 'test@gmail.com', 2, 'phase 2, noida', '9021451555', '', 0, '2021-09-03 06:56:10', NULL, '1', '2020-08-27 06:31:36', '2020-08-27 06:31:36'),
(84, '5', 1, 58, '20200825122152-user2.png', 'test22', '$2y$10$LfFhKmNJHYUF68/TLH6aqOMkql4x4Vw1Hf8NmkDhTGT1wIxP5ERKK', 'test@gmail.com', 2, '', '9021451555', '', 0, '2021-09-03 06:56:59', '', '1', '2020-08-27 06:32:22', '2020-08-27 06:32:22'),
(85, '5', 1, 58, '20200825122152-user2.png', 'test22', '$2y$10$LfFhKmNJHYUF68/TLH6aqOMkql4x4Vw1Hf8NmkDhTGT1wIxP5ERKK', 'test@gmail.com', 2, 'phase 2, noida', '9021451555', '', 0, '2021-09-03 06:55:45', NULL, '1', '2020-08-27 06:38:30', '2020-08-27 06:38:30');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `country` int(11) NOT NULL,
  `city` int(11) NOT NULL,
  `address` longtext NOT NULL,
  `doc_number` varchar(255) NOT NULL,
  `exp_date` varchar(255) NOT NULL,
  `company_photo` text NOT NULL,
  `front_file` text NOT NULL,
  `back_file` text NOT NULL,
  `status` int(11) DEFAULT 1,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `email`, `phone`, `country`, `city`, `address`, `doc_number`, `exp_date`, `company_photo`, `front_file`, `back_file`, `status`, `created_at`, `updated_at`) VALUES
(1, 'company', 'customer@example.com', '1234567890', 169, 12, 'Rampur, Baiju, chhibramau,dist-kannauj', '214234687767543', '2021-09-30', '20210913130123-fb2.jpg', '20210913130123-fb1.png', '20210913130123-driverimage.png', 1, '2021-09-13 12:57:37', '2021-09-13 07:31:23');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `iso` char(2) NOT NULL,
  `country_name` varchar(80) NOT NULL,
  `nicename` varchar(80) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `isd_code` varchar(255) NOT NULL,
  `currency_symbol` varchar(255) NOT NULL,
  `distance_unit` varchar(255) NOT NULL,
  `default_language` varchar(255) NOT NULL,
  `min_number_digits` varchar(255) NOT NULL,
  `max_number_digits` varchar(255) NOT NULL,
  `online_trans_code` varchar(255) NOT NULL,
  `sequence` varchar(255) NOT NULL,
  `iso3` char(3) NOT NULL,
  `numcode` smallint(6) NOT NULL,
  `phonecode` int(5) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `iso`, `country_name`, `nicename`, `currency`, `isd_code`, `currency_symbol`, `distance_unit`, `default_language`, `min_number_digits`, `max_number_digits`, `online_trans_code`, `sequence`, `iso3`, `numcode`, `phonecode`, `status`, `created_at`, `updated_at`) VALUES
(5, 'AD', 'ANDORRA', 'Andorra', 'PHP', 'AND', 'P', 'Km', 'english', '10', '10', '', '12', 'AND', 20, 376, 'active', '2020-08-27 16:47:29', '2021-08-30 19:44:30'),
(6, 'AO', 'ANGOLA', 'Angola', 'PHP', 'AO', 'P', 'Km', 'english', '10', '10', '', '10', 'AGO', 24, 244, 'active', '2020-08-27 16:47:29', '2021-08-30 20:09:07'),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', '', '', '', '', '', '', '', '', '', '0', 123, 0, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(11, 'AM', 'ARMENIA', 'Armenia', '', '', '', '', '', '', '', '', '', 'ARM', 51, 374, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(12, 'AW', 'ARUBA', 'Aruba', '', '', '', '', '', '', '', '', '', 'ABW', 533, 297, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(13, 'AU', 'AUSTRALIA', 'Australia', '', '', '', '', '', '', '', '', '', 'AUS', 36, 61, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', '', '', '', '', '', '', '', '', '', 'AZE', 31, 994, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(16, 'BS', 'BAHAMAS', 'Bahamas', '', '', '', '', '', '', '', '', '', 'BHS', 44, 1242, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(17, 'BH', 'BAHRAIN', 'Bahrain', '', '', '', '', '', '', '', '', '', 'BHR', 48, 973, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(18, 'BD', 'BANGLADESH', 'Bangladesh', '', '', '', '', '', '', '', '', '', 'BGD', 50, 880, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(19, 'BB', 'BARBADOS', 'Barbados', '', '', '', '', '', '', '', '', '', 'BRB', 52, 1246, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(20, 'BY', 'BELARUS', 'Belarus', '', '', '', '', '', '', '', '', '', 'BLR', 112, 375, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(21, 'BE', 'BELGIUM', 'Belgium', '', '', '', '', '', '', '', '', '', 'BEL', 56, 32, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(22, 'BZ', 'BELIZE', 'Belize', '', '', '', '', '', '', '', '', '', 'BLZ', 84, 501, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(23, 'BJ', 'BENIN', 'Benin', '', '', '', '', '', '', '', '', '', 'BEN', 204, 229, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(24, 'BM', 'BERMUDA', 'Bermuda', '', '', '', '', '', '', '', '', '', 'BMU', 60, 1441, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(25, 'BT', 'BHUTAN', 'Bhutan', '', '', '', '', '', '', '', '', '', 'BTN', 64, 975, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(26, 'BO', 'BOLIVIA', 'Bolivia', '', '', '', '', '', '', '', '', '', 'BOL', 68, 591, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', '', '', '', '', '', '', '', '', '', 'BIH', 70, 387, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(28, 'BW', 'BOTSWANA', 'Botswana', '', '', '', '', '', '', '', '', '', 'BWA', 72, 267, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', '', '', '', '', '', '', '', '', '', '1', 123, 0, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(30, 'BR', 'BRAZIL', 'Brazil', '', '', '', '', '', '', '', '', '', 'BRA', 76, 55, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', '', '', '', '', '', '', '', '', '', '0', 123, 246, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', '', '', '', '', '', '', '', '', '', 'BRN', 96, 673, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(33, 'BG', 'BULGARIA', 'Bulgaria', '', '', '', '', '', '', '', '', '', 'BGR', 100, 359, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', '', '', '', '', '', '', '', '', '', 'BFA', 854, 226, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(35, 'BI', 'BURUNDI', 'Burundi', '', '', '', '', '', '', '', '', '', 'BDI', 108, 257, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(36, 'KH', 'CAMBODIA', 'Cambodia', '', '', '', '', '', '', '', '', '', 'KHM', 116, 855, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(37, 'CM', 'CAMEROON', 'Cameroon', '', '', '', '', '', '', '', '', '', 'CMR', 120, 237, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(38, 'CA', 'CANADA', 'Canada', '', '', '', '', '', '', '', '', '', 'CAN', 124, 1, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', '', '', '', '', '', '', '', '', '', 'CPV', 132, 238, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', '', '', '', '', '', '', '', '', '', 'CYM', 136, 1345, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', '', '', '', '', '', '', '', '', '', 'CAF', 140, 236, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(42, 'TD', 'CHAD', 'Chad', '', '', '', '', '', '', '', '', '', 'TCD', 148, 235, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(43, 'CL', 'CHILE', 'Chile', '', '', '', '', '', '', '', '', '', 'CHL', 152, 56, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(44, 'CN', 'CHINA', 'China', '', '', '', '', '', '', '', '', '', 'CHN', 156, 86, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', '', '', '', '', '', '', '', '', '', '0', 123, 61, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', '', '', '', '', '', '', '', '', '', '0', 123, 672, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(47, 'CO', 'COLOMBIA', 'Colombia', '', '', '', '', '', '', '', '', '', 'COL', 170, 57, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(48, 'KM', 'COMOROS', 'Comoros', '', '', '', '', '', '', '', '', '', 'COM', 174, 269, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(49, 'CG', 'CONGO', 'Congo', '', '', '', '', '', '', '', '', '', 'COG', 178, 242, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', '', '', '', '', '', '', '', '', '', 'COD', 180, 242, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', '', '', '', '', '', '', '', '', '', 'COK', 184, 682, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(52, 'CR', 'COSTA RICA', 'Costa Rica', '', '', '', '', '', '', '', '', '', 'CRI', 188, 506, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(53, 'CI', 'COTE D\'IVOIRE', 'Cote D\'Ivoire', '', '', '', '', '', '', '', '', '', 'CIV', 384, 225, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(54, 'HR', 'CROATIA', 'Croatia', '', '', '', '', '', '', '', '', '', 'HRV', 191, 385, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(55, 'CU', 'CUBA', 'Cuba', '', '', '', '', '', '', '', '', '', 'CUB', 192, 53, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(56, 'CY', 'CYPRUS', 'Cyprus', '', '', '', '', '', '', '', '', '', 'CYP', 196, 357, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', '', '', '', '', '', '', '', '', '', 'CZE', 203, 420, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(58, 'DK', 'DENMARK', 'Denmark', '', '', '', '', '', '', '', '', '', 'DNK', 208, 45, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', '', '', '', '', '', '', '', '', '', 'DJI', 262, 253, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(60, 'DM', 'DOMINICA', 'Dominica', '', '', '', '', '', '', '', '', '', 'DMA', 212, 1767, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', '', '', '', '', '', '', '', '', '', 'DOM', 214, 1809, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(62, 'EC', 'ECUADOR', 'Ecuador', '', '', '', '', '', '', '', '', '', 'ECU', 218, 593, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(63, 'EG', 'EGYPT', 'Egypt', '', '', '', '', '', '', '', '', '', 'EGY', 818, 20, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(64, 'SV', 'EL SALVADOR', 'El Salvador', '', '', '', '', '', '', '', '', '', 'SLV', 222, 503, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', '', '', '', '', '', '', '', '', '', 'GNQ', 226, 240, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(66, 'ER', 'ERITREA', 'Eritrea', '', '', '', '', '', '', '', '', '', 'ERI', 232, 291, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(67, 'EE', 'ESTONIA', 'Estonia', '', '', '', '', '', '', '', '', '', 'EST', 233, 372, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', '', '', '', '', '', '', '', '', '', 'ETH', 231, 251, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', '', '', '', '', '', '', '', '', '', 'FLK', 238, 500, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', '', '', '', '', '', '', '', '', '', 'FRO', 234, 298, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(71, 'FJ', 'FIJI', 'Fiji', '', '', '', '', '', '', '', '', '', 'FJI', 242, 679, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(72, 'FI', 'FINLAND', 'Finland', '', '', '', '', '', '', '', '', '', 'FIN', 246, 358, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(73, 'FR', 'FRANCE', 'France', '', '', '', '', '', '', '', '', '', 'FRA', 250, 33, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', '', '', '', '', '', '', '', '', '', 'GUF', 254, 594, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', '', '', '', '', '', '', '', '', '', 'PYF', 258, 689, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', '', '', '', '', '', '', '', '', '', '0', 123, 0, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(77, 'GA', 'GABON', 'Gabon', '', '', '', '', '', '', '', '', '', 'GAB', 266, 241, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(78, 'GM', 'GAMBIA', 'Gambia', '', '', '', '', '', '', '', '', '', 'GMB', 270, 220, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(79, 'GE', 'GEORGIA', 'Georgia', '', '', '', '', '', '', '', '', '', 'GEO', 268, 995, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(80, 'DE', 'GERMANY', 'Germany', '', '', '', '', '', '', '', '', '', 'DEU', 276, 49, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(81, 'GH', 'GHANA', 'Ghana', '', '', '', '', '', '', '', '', '', 'GHA', 288, 233, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', '', '', '', '', '', '', '', '', '', 'GIB', 292, 350, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(83, 'GR', 'GREECE', 'Greece', '', '', '', '', '', '', '', '', '', 'GRC', 300, 30, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(84, 'GL', 'GREENLAND', 'Greenland', '', '', '', '', '', '', '', '', '', 'GRL', 304, 299, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(85, 'GD', 'GRENADA', 'Grenada', '', '', '', '', '', '', '', '', '', 'GRD', 308, 1473, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', '', '', '', '', '', '', '', '', '', 'GLP', 312, 590, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(87, 'GU', 'GUAM', 'Guam', '', '', '', '', '', '', '', '', '', 'GUM', 316, 1671, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(88, 'GT', 'GUATEMALA', 'Guatemala', '', '', '', '', '', '', '', '', '', 'GTM', 320, 502, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(89, 'GN', 'GUINEA', 'Guinea', '', '', '', '', '', '', '', '', '', 'GIN', 324, 224, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', '', '', '', '', '', '', '', '', '', 'GNB', 624, 245, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(91, 'GY', 'GUYANA', 'Guyana', '', '', '', '', '', '', '', '', '', 'GUY', 328, 592, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(92, 'HT', 'HAITI', 'Haiti', '', '', '', '', '', '', '', '', '', 'HTI', 332, 509, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', '', '', '', '', '', '', '', '', '', '0', 123, 0, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', '', '', '', '', '', '', '', '', '', 'VAT', 336, 39, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(95, 'HN', 'HONDURAS', 'Honduras', '', '', '', '', '', '', '', '', '', 'HND', 340, 504, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(96, 'HK', 'HONG KONG', 'Hong Kong', '', '', '', '', '', '', '', '', '', 'HKG', 344, 852, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(97, 'HU', 'HUNGARY', 'Hungary', '', '', '', '', '', '', '', '', '', 'HUN', 348, 36, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(98, 'IS', 'ICELAND', 'Iceland', '', '', '', '', '', '', '', '', '', 'ISL', 352, 354, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(99, 'IN', 'INDIA', 'India', '', '', '', '', '', '', '', '', '', 'IND', 356, 91, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(100, 'ID', 'INDONESIA', 'Indonesia', '', '', '', '', '', '', '', '', '', 'IDN', 360, 62, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', '', '', '', '', '', '', '', '', '', 'IRN', 364, 98, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(102, 'IQ', 'IRAQ', 'Iraq', '', '', '', '', '', '', '', '', '', 'IRQ', 368, 964, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(103, 'IE', 'IRELAND', 'Ireland', '', '', '', '', '', '', '', '', '', 'IRL', 372, 353, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(104, 'IL', 'ISRAEL', 'Israel', '', '', '', '', '', '', '', '', '', 'ISR', 376, 972, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(105, 'IT', 'ITALY', 'Italy', '', '', '', '', '', '', '', '', '', 'ITA', 380, 39, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(106, 'JM', 'JAMAICA', 'Jamaica', '', '', '', '', '', '', '', '', '', 'JAM', 388, 1876, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(107, 'JP', 'JAPAN', 'Japan', '', '', '', '', '', '', '', '', '', 'JPN', 392, 81, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(108, 'JO', 'JORDAN', 'Jordan', '', '', '', '', '', '', '', '', '', 'JOR', 400, 962, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', '', '', '', '', '', '', '', '', '', 'KAZ', 398, 7, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(110, 'KE', 'KENYA', 'Kenya', '', '', '', '', '', '', '', '', '', 'KEN', 404, 254, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(111, 'KI', 'KIRIBATI', 'Kiribati', '', '', '', '', '', '', '', '', '', 'KIR', 296, 686, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'Korea, Democratic People\'s Republic of', '', '', '', '', '', '', '', '', '', 'PRK', 408, 850, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', '', '', '', '', '', '', '', '', '', 'KOR', 410, 82, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(114, 'KW', 'KUWAIT', 'Kuwait', '', '', '', '', '', '', '', '', '', 'KWT', 414, 965, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', '', '', '', '', '', '', '', '', '', 'KGZ', 417, 996, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(116, 'LA', 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', 'Lao People\'s Democratic Republic', '', '', '', '', '', '', '', '', '', 'LAO', 418, 856, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(117, 'LV', 'LATVIA', 'Latvia', '', '', '', '', '', '', '', '', '', 'LVA', 428, 371, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(118, 'LB', 'LEBANON', 'Lebanon', '', '', '', '', '', '', '', '', '', 'LBN', 422, 961, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(119, 'LS', 'LESOTHO', 'Lesotho', '', '', '', '', '', '', '', '', '', 'LSO', 426, 266, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(120, 'LR', 'LIBERIA', 'Liberia', '', '', '', '', '', '', '', '', '', 'LBR', 430, 231, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', '', '', '', '', '', '', '', '', '', 'LBY', 434, 218, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', '', '', '', '', '', '', '', '', '', 'LIE', 438, 423, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(123, 'LT', 'LITHUANIA', 'Lithuania', '', '', '', '', '', '', '', '', '', 'LTU', 440, 370, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', '', '', '', '', '', '', '', '', '', 'LUX', 442, 352, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(125, 'MO', 'MACAO', 'Macao', '', '', '', '', '', '', '', '', '', 'MAC', 446, 853, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', '', '', '', '', '', '', '', '', '', 'MKD', 807, 389, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(127, 'MG', 'MADAGASCAR', 'Madagascar', '', '', '', '', '', '', '', '', '', 'MDG', 450, 261, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(128, 'MW', 'MALAWI', 'Malawi', '', '', '', '', '', '', '', '', '', 'MWI', 454, 265, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(129, 'MY', 'MALAYSIA', 'Malaysia', '', '', '', '', '', '', '', '', '', 'MYS', 458, 60, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(130, 'MV', 'MALDIVES', 'Maldives', '', '', '', '', '', '', '', '', '', 'MDV', 462, 960, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(131, 'ML', 'MALI', 'Mali', '', '', '', '', '', '', '', '', '', 'MLI', 466, 223, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(132, 'MT', 'MALTA', 'Malta', '', '', '', '', '', '', '', '', '', 'MLT', 470, 356, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', '', '', '', '', '', '', '', '', '', 'MHL', 584, 692, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(134, 'MQ', 'MARTINIQUE', 'Martinique', '', '', '', '', '', '', '', '', '', 'MTQ', 474, 596, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(135, 'MR', 'MAURITANIA', 'Mauritania', '', '', '', '', '', '', '', '', '', 'MRT', 478, 222, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(136, 'MU', 'MAURITIUS', 'Mauritius', '', '', '', '', '', '', '', '', '', 'MUS', 480, 230, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(137, 'YT', 'MAYOTTE', 'Mayotte', '', '', '', '', '', '', '', '', '', '0', 123, 269, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(138, 'MX', 'MEXICO', 'Mexico', '', '', '', '', '', '', '', '', '', 'MEX', 484, 52, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', '', '', '', '', '', '', '', '', '', 'FSM', 583, 691, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', '', '', '', '', '', '', '', '', '', 'MDA', 498, 373, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(141, 'MC', 'MONACO', 'Monaco', '', '', '', '', '', '', '', '', '', 'MCO', 492, 377, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(142, 'MN', 'MONGOLIA', 'Mongolia', '', '', '', '', '', '', '', '', '', 'MNG', 496, 976, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(143, 'MS', 'MONTSERRAT', 'Montserrat', '', '', '', '', '', '', '', '', '', 'MSR', 500, 1664, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(144, 'MA', 'MOROCCO', 'Morocco', '', '', '', '', '', '', '', '', '', 'MAR', 504, 212, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', '', '', '', '', '', '', '', '', '', 'MOZ', 508, 258, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(146, 'MM', 'MYANMAR', 'Myanmar', '', '', '', '', '', '', '', '', '', 'MMR', 104, 95, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(147, 'NA', 'NAMIBIA', 'Namibia', '', '', '', '', '', '', '', '', '', 'NAM', 516, 264, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(148, 'NR', 'NAURU', 'Nauru', '', '', '', '', '', '', '', '', '', 'NRU', 520, 674, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(149, 'NP', 'NEPAL', 'Nepal', '', '', '', '', '', '', '', '', '', 'NPL', 524, 977, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(150, 'NL', 'NETHERLANDS', 'Netherlands', '', '', '', '', '', '', '', '', '', 'NLD', 528, 31, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', '', '', '', '', '', '', '', '', '', 'ANT', 530, 599, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', '', '', '', '', '', '', '', '', '', 'NCL', 540, 687, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', '', '', '', '', '', '', '', '', '', 'NZL', 554, 64, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(154, 'NI', 'NICARAGUA', 'Nicaragua', '', '', '', '', '', '', '', '', '', 'NIC', 558, 505, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(155, 'NE', 'NIGER', 'Niger', '', '', '', '', '', '', '', '', '', 'NER', 562, 227, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(156, 'NG', 'NIGERIA', 'Nigeria', '', '', '', '', '', '', '', '', '', 'NGA', 566, 234, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(157, 'NU', 'NIUE', 'Niue', '', '', '', '', '', '', '', '', '', 'NIU', 570, 683, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', '', '', '', '', '', '', '', '', '', 'NFK', 574, 672, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', '', '', '', '', '', '', '', '', '', 'MNP', 580, 1670, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(160, 'NO', 'NORWAY', 'Norway', '', '', '', '', '', '', '', '', '', 'NOR', 578, 47, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(161, 'OM', 'OMAN', 'Oman', '', '', '', '', '', '', '', '', '', 'OMN', 512, 968, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(162, 'PK', 'PAKISTAN', 'Pakistan', '', '', '', '', '', '', '', '', '', 'PAK', 586, 92, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(163, 'PW', 'PALAU', 'Palau', '', '', '', '', '', '', '', '', '', 'PLW', 585, 680, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', '', '', '', '', '', '', '', '', '', '0', 123, 970, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(165, 'PA', 'PANAMA', 'Panama', '', '', '', '', '', '', '', '', '', 'PAN', 591, 507, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', '', '', '', '', '', '', '', '', '', 'PNG', 598, 675, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(167, 'PY', 'PARAGUAY', 'Paraguay', '', '', '', '', '', '', '', '', '', 'PRY', 600, 595, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(168, 'PE', 'PERU', 'Peru', '', '', '', '', '', '', '', '', '', 'PER', 604, 51, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHP', 'PH', 'PHP', 'Km', 'english', '10', '11', '', '1', 'PHL', 608, 63, 'active', '2020-08-27 16:47:29', '2021-09-15 16:42:25'),
(170, 'PN', 'PITCAIRN', 'Pitcairn', '', '', '', '', '', '', '', '', '', 'PCN', 612, 0, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(171, 'PL', 'POLAND', 'Poland', '', '', '', '', '', '', '', '', '', 'POL', 616, 48, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(172, 'PT', 'PORTUGAL', 'Portugal', '', '', '', '', '', '', '', '', '', 'PRT', 620, 351, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', '', '', '', '', '', '', '', '', '', 'PRI', 630, 1787, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(174, 'QA', 'QATAR', 'Qatar', '', '', '', '', '', '', '', '', '', 'QAT', 634, 974, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(175, 'RE', 'REUNION', 'Reunion', '', '', '', '', '', '', '', '', '', 'REU', 638, 262, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(176, 'RO', 'ROMANIA', 'Romania', '', '', '', '', '', '', '', '', '', 'ROM', 642, 40, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', '', '', '', '', '', '', '', '', '', 'RUS', 643, 70, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(178, 'RW', 'RWANDA', 'Rwanda', '', '', '', '', '', '', '', '', '', 'RWA', 646, 250, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', '', '', '', '', '', '', '', '', '', 'SHN', 654, 290, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', '', '', '', '', '', '', '', '', '', 'KNA', 659, 1869, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', '', '', '', '', '', '', '', '', '', 'LCA', 662, 1758, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', '', '', '', '', '', '', '', '', '', 'SPM', 666, 508, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', '', '', '', '', '', '', '', '', '', 'VCT', 670, 1784, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(184, 'WS', 'SAMOA', 'Samoa', '', '', '', '', '', '', '', '', '', 'WSM', 882, 684, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(185, 'SM', 'SAN MARINO', 'San Marino', '', '', '', '', '', '', '', '', '', 'SMR', 674, 378, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', '', '', '', '', '', '', '', '', '', 'STP', 678, 239, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', '', '', '', '', '', '', '', '', '', 'SAU', 682, 966, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(188, 'SN', 'SENEGAL', 'Senegal', '', '', '', '', '', '', '', '', '', 'SEN', 686, 221, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', '', '', '', '', '', '', '', '', '', '0', 123, 381, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(190, 'SC', 'SEYCHELLES', 'Seychelles', '', '', '', '', '', '', '', '', '', 'SYC', 690, 248, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', '', '', '', '', '', '', '', '', '', 'SLE', 694, 232, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(192, 'SG', 'SINGAPORE', 'Singapore', '', '', '', '', '', '', '', '', '', 'SGP', 702, 65, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(193, 'SK', 'SLOVAKIA', 'Slovakia', '', '', '', '', '', '', '', '', '', 'SVK', 703, 421, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(194, 'SI', 'SLOVENIA', 'Slovenia', '', '', '', '', '', '', '', '', '', 'SVN', 705, 386, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', '', '', '', '', '', '', '', '', '', 'SLB', 90, 677, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(196, 'SO', 'SOMALIA', 'Somalia', '', '', '', '', '', '', '', '', '', 'SOM', 706, 252, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', '', '', '', '', '', '', '', '', '', 'ZAF', 710, 27, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', '', '', '', '', '', '', '', '', '', '0', 123, 0, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(199, 'ES', 'SPAIN', 'Spain', '', '', '', '', '', '', '', '', '', 'ESP', 724, 34, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', '', '', '', '', '', '', '', '', '', 'LKA', 144, 94, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(201, 'SD', 'SUDAN', 'Sudan', '', '', '', '', '', '', '', '', '', 'SDN', 736, 249, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(202, 'SR', 'SURINAME', 'Suriname', '', '', '', '', '', '', '', '', '', 'SUR', 740, 597, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', '', '', '', '', '', '', '', '', '', 'SJM', 744, 47, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(204, 'SZ', 'SWAZILAND', 'Swaziland', '', '', '', '', '', '', '', '', '', 'SWZ', 748, 268, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(205, 'SE', 'SWEDEN', 'Sweden', '', '', '', '', '', '', '', '', '', 'SWE', 752, 46, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(206, 'CH', 'SWITZERLAND', 'Switzerland', '', '', '', '', '', '', '', '', '', 'CHE', 756, 41, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', '', '', '', '', '', '', '', '', '', 'SYR', 760, 963, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', '', '', '', '', '', '', '', '', '', 'TWN', 158, 886, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', '', '', '', '', '', '', '', '', '', 'TJK', 762, 992, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', '', '', '', '', '', '', '', '', '', 'TZA', 834, 255, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(211, 'TH', 'THAILAND', 'Thailand', '', '', '', '', '', '', '', '', '', 'THA', 764, 66, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', '', '', '', '', '', '', '', '', '', '0', 123, 670, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(213, 'TG', 'TOGO', 'Togo', '', '', '', '', '', '', '', '', '', 'TGO', 768, 228, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(214, 'TK', 'TOKELAU', 'Tokelau', '', '', '', '', '', '', '', '', '', 'TKL', 772, 690, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(215, 'TO', 'TONGA', 'Tonga', '', '', '', '', '', '', '', '', '', 'TON', 776, 676, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', '', '', '', '', '', '', '', '', '', 'TTO', 780, 1868, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(217, 'TN', 'TUNISIA', 'Tunisia', '', '', '', '', '', '', '', '', '', 'TUN', 788, 216, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(218, 'TR', 'TURKEY', 'Turkey', '', '', '', '', '', '', '', '', '', 'TUR', 792, 90, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', '', '', '', '', '', '', '', '', '', 'TKM', 795, 7370, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', '', '', '', '', '', '', '', '', '', 'TCA', 796, 1649, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(221, 'TV', 'TUVALU', 'Tuvalu', '', '', '', '', '', '', '', '', '', 'TUV', 798, 688, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(222, 'UG', 'UGANDA', 'Uganda', '', '', '', '', '', '', '', '', '', 'UGA', 800, 256, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(223, 'UA', 'UKRAINE', 'Ukraine', '', '', '', '', '', '', '', '', '', 'UKR', 804, 380, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', '', '', '', '', '', '', '', '', '', 'ARE', 784, 971, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', '', '', '', '', '', '', '', '', '', 'GBR', 826, 44, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(226, 'US', 'UNITED STATES', 'United States', '', '', '', '', '', '', '', '', '', 'USA', 840, 1, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', '', '', '', '', '', '', '', '', '', '0', 123, 1, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(228, 'UY', 'URUGUAY', 'Uruguay', '', '', '', '', '', '', '', '', '', 'URY', 858, 598, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', '', '', '', '', '', '', '', '', '', 'UZB', 860, 998, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(230, 'VU', 'VANUATU', 'Vanuatu', '', '', '', '', '', '', '', '', '', 'VUT', 548, 678, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(231, 'VE', 'VENEZUELA', 'Venezuela', '', '', '', '', '', '', '', '', '', 'VEN', 862, 58, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(232, 'VN', 'VIET NAM', 'Viet Nam', '', '', '', '', '', '', '', '', '', 'VNM', 704, 84, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', '', '', '', '', '', '', '', '', '', 'VGB', 92, 1284, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', '', '', '', '', '', '', '', '', '', 'VIR', 850, 1340, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', '', '', '', '', '', '', '', '', '', 'WLF', 876, 681, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', '', '', '', '', '', '', '', '', '', 'ESH', 732, 212, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(237, 'YE', 'YEMEN', 'Yemen', '', '', '', '', '', '', '', '', '', 'YEM', 887, 967, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(238, 'ZM', 'ZAMBIA', 'Zambia', '', '', '', '', '', '', '', '', '', 'ZMB', 894, 260, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29'),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', '', '', '', '', '', '', '', '', '', 'ZWE', 716, 263, 'active', '2020-08-27 16:47:29', '2020-08-27 16:47:29');

-- --------------------------------------------------------

--
-- Table structure for table `country_all`
--

CREATE TABLE `country_all` (
  `id` int(11) NOT NULL,
  `isd_code` char(255) NOT NULL,
  `country_name` varchar(80) NOT NULL,
  `sequence` varchar(80) NOT NULL,
  `country_currency` char(255) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  `ISOCode` int(5) NOT NULL,
  `distance_unit` text NOT NULL,
  `mobile_no_lenghth` text NOT NULL,
  `status` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country_all`
--

INSERT INTO `country_all` (`id`, `isd_code`, `country_name`, `sequence`, `country_currency`, `numcode`, `ISOCode`, `distance_unit`, `mobile_no_lenghth`, `status`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93, 'Kilometer', 'Max:10|Min:10', 'active'),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355, '', '', ''),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213, '', '', ''),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684, '', '', ''),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376, '', '', ''),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244, '', '', ''),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264, '', '', ''),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL, 0, '', '', ''),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268, '', '', ''),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54, '', '', ''),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374, '', '', ''),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297, '', '', ''),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61, '', '', ''),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43, '', '', ''),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994, '', '', ''),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242, '', '', ''),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973, '', '', ''),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880, '', '', ''),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246, '', '', ''),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375, '', '', ''),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32, '', '', ''),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501, '', '', ''),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229, '', '', ''),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441, '', '', ''),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975, '', '', ''),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591, '', '', ''),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387, '', '', ''),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267, '', '', ''),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, 0, '', '', ''),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55, '', '', ''),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL, 246, '', '', ''),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673, '', '', ''),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359, '', '', ''),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226, '', '', ''),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257, '', '', ''),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855, '', '', ''),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237, '', '', ''),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1, '', '', ''),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238, '', '', ''),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345, '', '', ''),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236, '', '', ''),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235, '', '', ''),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56, '', '', ''),
(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86, '', '', ''),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL, 61, '', '', ''),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, 672, '', '', ''),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57, '', '', ''),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269, '', '', ''),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242, '', '', ''),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 242, '', '', ''),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682, '', '', ''),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506, '', '', ''),
(53, 'CI', 'COTE D\'IVOIRE', 'Cote D\'Ivoire', 'CIV', 384, 225, '', '', ''),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385, '', '', ''),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53, '', '', ''),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357, '', '', ''),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420, '', '', ''),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45, '', '', ''),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253, '', '', ''),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767, '', '', ''),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809, '', '', ''),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593, '', '', ''),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20, '', '', ''),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503, '', '', ''),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240, '', '', ''),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291, '', '', ''),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372, '', '', ''),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251, '', '', ''),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500, '', '', ''),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298, '', '', ''),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679, '', '', ''),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358, '', '', ''),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33, '', '', ''),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594, '', '', ''),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689, '', '', ''),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, 0, '', '', ''),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241, '', '', ''),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220, '', '', ''),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995, '', '', ''),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49, '', '', ''),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233, '', '', ''),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350, '', '', ''),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30, '', '', ''),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299, '', '', ''),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473, '', '', ''),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590, '', '', ''),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671, '', '', ''),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502, '', '', ''),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224, '', '', ''),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245, '', '', ''),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592, '', '', ''),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509, '', '', ''),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL, 0, '', '', ''),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39, '', '', ''),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504, '', '', ''),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852, '', '', ''),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36, '', '', ''),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354, '', '', ''),
(99, 'IN', 'INDIA', 'India', 'IND', 356, 91, '', '', ''),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62, '', '', ''),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98, '', '', ''),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964, '', '', ''),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353, '', '', ''),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972, '', '', ''),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39, '', '', ''),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876, '', '', ''),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81, '', '', ''),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962, '', '', ''),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7, '', '', ''),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254, '', '', ''),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686, '', '', ''),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'Korea, Democratic People\'s Republic of', 'PRK', 408, 850, '', '', ''),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82, '', '', ''),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965, '', '', ''),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996, '', '', ''),
(116, 'LA', 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', 'Lao People\'s Democratic Republic', 'LAO', 418, 856, '', '', ''),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371, '', '', ''),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961, '', '', ''),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266, '', '', ''),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231, '', '', ''),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218, '', '', ''),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423, '', '', ''),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370, '', '', ''),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352, '', '', ''),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853, '', '', ''),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389, '', '', ''),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261, '', '', ''),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265, '', '', ''),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60, '', '', ''),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960, '', '', ''),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223, '', '', ''),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356, '', '', ''),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692, '', '', ''),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596, '', '', ''),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222, '', '', ''),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230, '', '', ''),
(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL, 269, '', '', ''),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52, '', '', ''),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691, '', '', ''),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373, '', '', ''),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377, '', '', ''),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976, '', '', ''),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664, '', '', ''),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212, '', '', ''),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258, '', '', ''),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95, '', '', ''),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264, '', '', ''),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674, '', '', ''),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977, '', '', ''),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31, '', '', ''),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599, '', '', ''),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687, '', '', ''),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64, '', '', ''),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505, '', '', ''),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227, '', '', ''),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234, '', '', ''),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683, '', '', ''),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672, '', '', ''),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670, '', '', ''),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47, '', '', ''),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968, '', '', ''),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92, '', '', ''),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680, '', '', ''),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970, '', '', ''),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507, '', '', ''),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675, '', '', ''),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595, '', '', ''),
(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51, '', '', ''),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63, '', '', ''),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0, '', '', ''),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48, '', '', ''),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351, '', '', ''),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787, '', '', ''),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974, '', '', ''),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262, '', '', ''),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40, '', '', ''),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 70, '', '', ''),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250, '', '', ''),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290, '', '', ''),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869, '', '', ''),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758, '', '', ''),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508, '', '', ''),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784, '', '', ''),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684, '', '', ''),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378, '', '', ''),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239, '', '', ''),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966, '', '', ''),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221, '', '', ''),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL, 381, '', '', ''),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248, '', '', ''),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232, '', '', ''),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65, '', '', ''),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421, '', '', ''),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386, '', '', ''),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677, '', '', ''),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252, '', '', ''),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27, '', '', ''),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0, '', '', ''),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34, '', '', ''),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94, '', '', ''),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249, '', '', ''),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597, '', '', ''),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47, '', '', ''),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268, '', '', ''),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46, '', '', ''),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41, '', '', ''),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963, '', '', ''),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886, '', '', ''),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992, '', '', ''),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255, '', '', ''),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66, '', '', ''),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL, 670, '', '', ''),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228, '', '', ''),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690, '', '', ''),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676, '', '', ''),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868, '', '', ''),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216, '', '', ''),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90, '', '', ''),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370, '', '', ''),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649, '', '', ''),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688, '', '', ''),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256, '', '', ''),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380, '', '', ''),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971, '', '', ''),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44, '', '', ''),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1, '', '', ''),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, 1, '', '', ''),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598, '', '', ''),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998, '', '', ''),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678, '', '', ''),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58, '', '', ''),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84, '', '', ''),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284, '', '', ''),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340, '', '', ''),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681, '', '', ''),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212, '', '', ''),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967, '', '', ''),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260, '', '', ''),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE `document` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mandatory` varchar(255) NOT NULL,
  `expiration_date` varchar(255) NOT NULL,
  `no_required` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `type` varchar(255) NOT NULL DEFAULT 'user',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `document`
--

INSERT INTO `document` (`id`, `name`, `mandatory`, `expiration_date`, `no_required`, `status`, `type`, `created_at`, `updated_at`) VALUES
(1, 'id card', '', '', '', 1, 'user', '2021-08-05 11:46:40', '2021-08-05 11:46:40'),
(2, 'driver\'s license', '', '', '', 1, 'user', '2021-08-05 11:46:40', '2021-08-05 11:46:40'),
(3, 'business document 1', '', '', '', 1, 'user', '2021-08-05 11:47:37', '2021-08-05 11:47:37'),
(4, 'business document 2', '51', '2024-11-23', '52', 1, 'user', '2021-08-05 11:47:37', '2021-08-28 14:22:59'),
(5, 'test10', '12', '2021-08-30', '11', 1, 'user', '2021-08-28 14:23:31', '2021-08-28 14:23:58');

-- --------------------------------------------------------

--
-- Table structure for table `drivecardmaster`
--

CREATE TABLE `drivecardmaster` (
  `cardtypeid` bigint(20) NOT NULL,
  `cardtypename` int(11) NOT NULL,
  `inactive` int(11) NOT NULL,
  `createduserid` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `drivepersonaldoc`
--

CREATE TABLE `drivepersonaldoc` (
  `id` bigint(20) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `cr_no` varchar(200) DEFAULT NULL,
  `crno_image` varchar(255) DEFAULT NULL,
  `licence_no` varchar(200) DEFAULT NULL,
  `frontlicensephoto` varchar(255) DEFAULT NULL,
  `backlicensephoto` varchar(255) DEFAULT NULL,
  `police_clearance_no` varchar(200) DEFAULT NULL,
  `police_clearance_image` text DEFAULT NULL,
  `vehicle_id` varchar(255) NOT NULL,
  `vehiclephoto` text DEFAULT NULL,
  `document_type` varchar(255) NOT NULL,
  `docsExpire` varchar(255) NOT NULL,
  `docs_status` varchar(255) NOT NULL,
  `document_file` varchar(255) DEFAULT NULL,
  `cardtypeid` varchar(110) DEFAULT NULL,
  `isactive` enum('1','0') NOT NULL DEFAULT '1',
  `createddate` datetime DEFAULT current_timestamp(),
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drivepersonaldoc`
--

INSERT INTO `drivepersonaldoc` (`id`, `driver_id`, `cr_no`, `crno_image`, `licence_no`, `frontlicensephoto`, `backlicensephoto`, `police_clearance_no`, `police_clearance_image`, `vehicle_id`, `vehiclephoto`, `document_type`, `docsExpire`, `docs_status`, `document_file`, `cardtypeid`, `isactive`, `createddate`, `created_at`, `updated_at`) VALUES
(38, 5, 'file613996b6a58b1-2.jpg', 'file613996b6a58b1-2.jpg', '', 'file613996b6a5605-4.jpg', 'file613996b6a578b-3.jpg', 'file613996b6a58b1-2.jpg', '', '1', 'file613996b6a594d-1.jpg', '', '2021-09-09', '', '', '2', '1', '2021-09-09 00:00:00', '2021-09-09', '2021-09-09'),
(56, 78, 'file613996b6a58b1-2.jpg', 'file613996b6a58b1-2.jpg', '', 'file613996b6a5605-4.jpg', 'file613996b6a578b-3.jpg', 'file613996b6a58b1-2.jpg', '', '2', 'file613996b6a594d-1.jpg', '', '2021-09-09', '', '', '2', '1', '2021-09-14 05:38:56', '2021-09-14 05:38:56', '2021-09-14 05:38:56'),
(57, 79, '', '', '', '', '', '', '', '3', '', '', '2021-09-11', '', '', '2', '1', '2021-09-11 00:00:00', '2021-09-11', '2021-09-11'),
(58, 80, '', '', '', '', '', '', '', '', '', '', '2021-09-11', '', '', '2', '1', '2021-09-11 00:00:00', '2021-09-11', '2021-09-11'),
(73, 99, '546546545656', '', '5646546565', '', '', '4654654656', '', '56465', '', '', '', '', '', NULL, '1', '2021-09-21 16:16:52', '2021-09-21 16:16:52', '2021-09-21 16:16:52'),
(74, 100, '457824163525', 'file614a009e669f7-3.jpg', '45789136584', 'file614a009e66aba-4.jpg', 'file614a009e66b25-3.jpg', '14574852145', 'file614a009e66b85-3.jpg', '25647', 'file614a009e66c09-3.jpg', '', '', '', '', NULL, '1', '2021-09-21 15:56:14', '2021-09-21 15:56:14', '2021-09-21 15:56:14'),
(75, 101, '457824163525', 'file614a010c33f07-3.jpg', '45789136584', 'file614a010c340da-4.jpg', 'file614a010c341ff-3.jpg', '14574852145', 'file614a010c34302-3.jpg', '25647', 'file614a010c343f2-3.jpg', '', '', '', '', NULL, '1', '2021-09-21 15:58:04', '2021-09-21 15:58:04', '2021-09-21 15:58:04'),
(76, 102, '457824163525', 'file614a05c507548-3.jpg', '45789136584', 'file614a05c507603-4.jpg', 'file614a05c50766a-3.jpg', '14574852145', 'file614a05c5076bd-3.jpg', '25647', 'file614a05c50770d-3.jpg', '', '', '', '', NULL, '1', '2021-09-21 16:18:13', '2021-09-21 16:18:13', '2021-09-21 16:18:13'),
(77, 103, '457824163525', 'file614a0629ee3f7-3.jpg', '45789136584', 'file614a0629ee591-4.jpg', 'file614a0629ee690-3.jpg', '14574852145', 'file614a0629ee768-3.jpg', '25647', 'file614a0629ee82f-3.jpg', '', '', '', '', NULL, '1', '2021-09-21 16:19:54', '2021-09-21 16:19:54', '2021-09-21 16:19:54');

-- --------------------------------------------------------

--
-- Table structure for table `driverconfiguration`
--

CREATE TABLE `driverconfiguration` (
  `id` int(11) NOT NULL,
  `payment_to` varchar(255) DEFAULT NULL,
  `verify` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `driverconfiguration`
--

INSERT INTO `driverconfiguration` (`id`, `payment_to`, `verify`, `time`, `created_at`, `updated_at`) VALUES
(1, 'driver', 'active', '12', NULL, '2021-09-17 10:55:10');

-- --------------------------------------------------------

--
-- Table structure for table `driverdecline`
--

CREATE TABLE `driverdecline` (
  `id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `pickup_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `driverdecline`
--

INSERT INTO `driverdecline` (`id`, `driver_id`, `pickup_id`, `created_at`, `updated_at`) VALUES
(1, 5, 256, '2021-09-21 17:18:08', '2021-09-21 17:18:08');

-- --------------------------------------------------------

--
-- Table structure for table `driver_current_location`
--

CREATE TABLE `driver_current_location` (
  `id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `angle` varchar(100) NOT NULL,
  `c_lat` varchar(100) NOT NULL,
  `c_log` varchar(100) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `driver_current_location`
--

INSERT INTO `driver_current_location` (`id`, `driver_id`, `angle`, `c_lat`, `c_log`, `created_at`, `updated_at`) VALUES
(1, 1, 'east', '37.3296035', '-122.0208292', '', ''),
(2, 2, 'east', '11.945650', '79.831047', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `driver_otp`
--

CREATE TABLE `driver_otp` (
  `id` int(11) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `otp` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `driver_otp`
--

INSERT INTO `driver_otp` (`id`, `phone`, `otp`, `created`, `created_at`, `updated_at`) VALUES
(1, '+910099889900', 58840, '2021-06-19 16:07:21', '', ''),
(2, '+911122334455', 885468, '2021-06-19 16:13:38', '', ''),
(3, '+910909090909', 52875, '2021-06-19 17:23:07', '', ''),
(4, '+919009890998', 261176, '2021-06-19 17:26:24', '', ''),
(5, '+910909090990', 895571, '2021-06-19 17:30:55', '', ''),
(6, '+910909900000', 467246, '2021-06-19 17:36:41', '', ''),
(7, '+919090909988', 739904, '2021-06-19 17:39:14', '', ''),
(8, '+911234445578', 932513, '2021-06-19 18:14:40', '', ''),
(9, '+912345567789', 587072, '2021-06-19 18:19:01', '', ''),
(10, '+911237890234', 858349, '2021-06-19 18:27:00', '', ''),
(11, '+913456789098', 344341, '2021-06-19 18:30:11', '', ''),
(12, '+910896533655', 246026, '2021-06-19 18:40:57', '', ''),
(13, '+916555352445', 317996, '2021-06-19 18:44:23', '', ''),
(14, '+913655236655', 915310, '2021-06-19 18:50:20', '', ''),
(15, '+916555555532', 203637, '2021-06-19 18:54:50', '', ''),
(16, '+912233665588', 134369, '2021-06-20 04:36:27', '', ''),
(17, '+918855223366', 227835, '2021-06-20 05:56:09', '', ''),
(18, '+916633552222', 744623, '2021-06-20 06:13:03', '', ''),
(19, '+917499435683', 643747, '2021-06-20 06:17:34', '', ''),
(20, '+919988996633', 338603, '2021-06-20 06:34:59', '', ''),
(21, '+919953666666', 497190, '2021-06-20 06:38:38', '', ''),
(22, '+916636636336', 765045, '2021-06-20 06:52:16', '', ''),
(23, '+918899663366', 201606, '2021-06-20 07:07:32', '', ''),
(24, '+912356896599', 140254, '2021-06-20 07:10:33', '', ''),
(25, '+911234568552', 661364, '2021-06-20 07:26:26', '', ''),
(26, '+919900990999', 563639, '2021-06-20 08:48:03', '', ''),
(27, '+910909090999', 288090, '2021-06-20 16:02:01', '', ''),
(28, '+919495858858', 920600, '2021-06-20 18:19:16', '', ''),
(29, '+919090890989', 725516, '2021-06-20 18:31:26', '', ''),
(30, '+911234567890', 972747, '2021-06-20 18:54:37', '', ''),
(31, '+910989009959', 134011, '2021-06-20 19:14:16', '', ''),
(32, '+910909890998', 380327, '2021-06-20 20:04:54', '', ''),
(33, '+629627204181', 43455, '2021-06-30 03:52:34', '', ''),
(34, '+918630920347', 65364, '2021-06-30 03:58:12', '', ''),
(35, '+639159851468', 851624, '2021-06-30 04:23:28', '', ''),
(36, '+919532152051', 156145, '2021-06-30 10:57:15', '', ''),
(37, '+919532152051', 739386, '2021-06-30 10:57:57', '', ''),
(38, '+918630920347', 553891, '2021-06-30 18:47:06', '', ''),
(39, '+918630920347', 302250, '2021-06-30 18:47:26', '', ''),
(40, '+918882341937', 376465, '2021-07-02 11:18:10', '', ''),
(41, '+919953696119', 716017, '2021-07-03 11:30:18', '', ''),
(42, '+919976898999', 868203, '2021-07-03 11:37:16', '', ''),
(43, '+919953696119', 393995, '2021-07-03 11:57:07', '', ''),
(44, '+919953696119', 708800, '2021-07-03 16:49:44', '', ''),
(45, '+919999999999', 359791, '2021-07-03 16:52:54', '', ''),
(46, '+919999999999', 41253, '2021-07-03 16:56:00', '', ''),
(47, '+910999990999', 215452, '2021-07-03 16:58:14', '', ''),
(48, '+919999999999', 902007, '2021-07-03 18:00:39', '', ''),
(49, '+919953696119', 871315, '2021-07-04 03:39:19', '', ''),
(50, '+919953696119', 295527, '2021-07-04 03:42:17', '', ''),
(51, '+919953696119', 106655, '2021-07-04 03:44:42', '', ''),
(52, '+919953696119', 476067, '2021-07-04 05:00:25', '', ''),
(53, '1234567890', 611184, '2021-07-04 09:18:42', '', ''),
(54, '1234567890', 73750, '2021-07-04 09:21:02', '', ''),
(55, '1234567890', 155699, '2021-07-04 09:24:28', '', ''),
(56, '1234567890', 824971, '2021-07-04 09:28:18', '', ''),
(57, '1234567890', 87923, '2021-07-04 09:28:45', '', ''),
(58, '1234567890', 821630, '2021-07-04 09:29:05', '', ''),
(59, '+639081250030', 868987, '2021-07-04 22:08:45', '', ''),
(60, '+918882341937', 97697, '2021-07-05 06:08:16', '', ''),
(61, '+918882341937', 636096, '2021-07-05 06:09:15', '', ''),
(62, '+918882341937', 883645, '2021-07-05 07:23:21', '', ''),
(63, '+918882341937', 405836, '2021-07-05 07:24:41', '', ''),
(64, '+918882341937', 266437, '2021-07-05 07:50:23', '', ''),
(65, '+918882341937', 218598, '2021-07-05 08:54:47', '', ''),
(66, '+918882341937', 22779, '2021-07-05 08:56:50', '', ''),
(67, '+918882341937', 985392, '2021-07-05 08:57:54', '', ''),
(68, '+918888888888', 625812, '2021-07-05 13:39:03', '', ''),
(69, '+910999990002', 465801, '2021-07-05 13:45:06', '', ''),
(70, '+910909090909', 385067, '2021-07-05 13:49:19', '', ''),
(71, '+919988899988', 717946, '2021-07-05 17:10:12', '', ''),
(72, '+919988999383', 265203, '2021-07-05 17:21:24', '', ''),
(73, '+919953696119', 484239, '2021-07-06 04:29:00', '', ''),
(74, '+919953696119', 570456, '2021-07-06 11:44:05', '', ''),
(75, '+919953696119', 367329, '2021-07-06 13:23:50', '', ''),
(76, '+912222222555', 655343, '2021-07-06 13:26:59', '', ''),
(77, '+919965667777', 311355, '2021-07-06 13:30:39', '', ''),
(78, '+639081250030', 191059, '2021-07-10 09:07:34', '', ''),
(79, '+918130413551', 965368, '2021-07-18 05:29:37', '', ''),
(80, '+917979948924', 518889, '2021-09-04 07:41:42', '', ''),
(81, '+917979948924', 80144, '2021-09-04 08:27:38', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `driver_request`
--

CREATE TABLE `driver_request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `driver_request`
--

INSERT INTO `driver_request` (`id`, `user_id`, `created_at`) VALUES
(1, 1, '2021-08-30 06:47:12'),
(2, 149, '2021-08-30 11:11:02'),
(3, 281, '2021-08-31 10:46:30'),
(4, 288, '2021-08-31 13:50:13'),
(5, 289, '2021-08-31 18:07:20'),
(6, 298, '2021-09-03 02:12:58'),
(7, 300, '2021-09-03 06:01:09'),
(8, 293, '2021-09-03 06:42:11'),
(9, 302, '2021-09-03 08:45:27'),
(10, 304, '2021-09-04 16:19:56'),
(11, 307, '2021-09-06 11:31:54');

-- --------------------------------------------------------

--
-- Table structure for table `driver_vehicle`
--

CREATE TABLE `driver_vehicle` (
  `id` int(11) NOT NULL,
  `driver_id` varchar(255) NOT NULL,
  `vehicle_type` varchar(25) NOT NULL,
  `vehicle_image` varchar(255) NOT NULL,
  `vehicle_plate_image` varchar(255) NOT NULL,
  `vehicle_ser_type` varchar(255) NOT NULL,
  `veh_doc_type` varchar(255) NOT NULL,
  `veh_doc_expire` date NOT NULL,
  `veh_doc_image` varchar(255) NOT NULL,
  `veh_doc_status` varchar(255) NOT NULL,
  `veh_doc_upload_at` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `driver_vehicle`
--

INSERT INTO `driver_vehicle` (`id`, `driver_id`, `vehicle_type`, `vehicle_image`, `vehicle_plate_image`, `vehicle_ser_type`, `veh_doc_type`, `veh_doc_expire`, `veh_doc_image`, `veh_doc_status`, `veh_doc_upload_at`, `created_at`, `updated_at`) VALUES
(1, '35', 'Motercycle', 'vehicle_image-1630388453.jpg', 'vehicle_plate_image-1630388453.jpg', 'Dura Express', 'static', '2021-08-29', 'veh_doc_image-1630388453.jpg', 'valid', '2021-08-29', '2021-08-29 22:44:40', '2021-08-31 11:10:53'),
(2, '36', 'Motercycle', 'vehicle_image-1630388453.jpg', 'vehicle_plate_image-1630388453.jpg', 'Dura Express', 'static', '2021-08-31', 'veh_doc_image-1630388453.jpg', 'valid', '2021-08-31', '2021-08-31 10:38:11', '2021-08-31 11:10:53'),
(3, '40', 'Motercycle', 'vehicle_image-1630388453.jpg', 'vehicle_plate_image-1630388453.jpg', 'Dura Express', 'static', '2021-08-31', 'veh_doc_image-1630388453.jpg', 'valid', '2021-08-30', '2021-08-31 10:58:37', '2021-08-31 11:10:53'),
(4, '42', 'Motercycle', 'vehicle_image-1630388453.jpg', 'vehicle_plate_image-1630388453.jpg', 'Dura Express', 'static', '2021-08-30', 'veh_doc_image-1630388453.jpg', 'valid', '2021-08-30', '2021-08-31 11:10:53', '2021-08-31 11:10:53');

-- --------------------------------------------------------

--
-- Table structure for table `driver_wallet`
--

CREATE TABLE `driver_wallet` (
  `id` int(11) NOT NULL,
  `driver_id` varchar(25) NOT NULL,
  `wallet_amount` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `driver_wallet`
--

INSERT INTO `driver_wallet` (`id`, `driver_id`, `wallet_amount`, `created_at`, `updated_at`) VALUES
(1, '78', '0', '2021-09-09 15:41:47', '2021-09-09 15:41:47'),
(2, '79', '0', '2021-09-11 08:18:54', '2021-09-11 08:18:54'),
(3, '80', '0', '2021-09-11 08:39:54', '2021-09-11 08:39:54'),
(4, '81', '0', '2021-09-11 11:13:06', '2021-09-11 11:13:06'),
(5, '82', '0', '2021-09-15 08:03:06', '2021-09-15 08:03:06'),
(6, '83', '0', '2021-09-16 13:56:26', '2021-09-16 13:56:26'),
(7, '84', '0', '2021-09-16 14:47:34', '2021-09-16 14:47:34'),
(8, '85', '0', '2021-09-18 12:51:32', '2021-09-18 12:51:32'),
(9, '86', '0', '2021-09-18 12:53:56', '2021-09-18 12:53:56'),
(10, '87', '0', '2021-09-18 18:56:07', '2021-09-18 18:56:07'),
(11, '88', '0', '2021-09-20 13:08:03', '2021-09-20 13:08:03'),
(12, '89', '0', '2021-09-20 13:47:26', '2021-09-20 13:47:26'),
(13, '90', '0', '2021-09-20 14:48:53', '2021-09-20 14:48:53'),
(14, '91', '0', '2021-09-20 14:59:26', '2021-09-20 14:59:26'),
(15, '92', '0', '2021-09-20 15:29:37', '2021-09-20 15:29:37'),
(16, '93', '0', '2021-09-21 12:02:45', '2021-09-21 12:02:45'),
(17, '94', '0', '2021-09-21 12:11:21', '2021-09-21 12:11:21'),
(18, '95', '0', '2021-09-21 15:21:59', '2021-09-21 15:21:59'),
(19, '96', '0', '2021-09-21 15:24:51', '2021-09-21 15:24:51'),
(20, '97', '0', '2021-09-21 15:29:11', '2021-09-21 15:29:11'),
(21, '98', '0', '2021-09-21 15:32:26', '2021-09-21 15:32:26'),
(22, '99', '0', '2021-09-21 15:37:19', '2021-09-21 15:37:19'),
(23, '100', '0', '2021-09-21 15:56:14', '2021-09-21 15:56:14'),
(24, '101', '0', '2021-09-21 15:58:04', '2021-09-21 15:58:04'),
(25, '102', '0', '2021-09-21 16:18:13', '2021-09-21 16:18:13'),
(26, '103', '0', '2021-09-21 16:19:54', '2021-09-21 16:19:54');

-- --------------------------------------------------------

--
-- Table structure for table `driveuser`
--

CREATE TABLE `driveuser` (
  `id` int(11) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `middlename` varchar(255) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `dob` varchar(255) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `manager_account_no` text DEFAULT NULL,
  `g_cash_accont_name` varchar(255) NOT NULL,
  `g_cash_no` varchar(255) DEFAULT NULL,
  `lastupdatedatetime` datetime NOT NULL,
  `profilephoto_url` text DEFAULT NULL,
  `qr_code` varchar(255) NOT NULL,
  `dura_bag_id` varchar(200) NOT NULL,
  `vehicle_id` varchar(25) DEFAULT NULL,
  `created_datetime` date NOT NULL,
  `isactive` enum('1','0') NOT NULL DEFAULT '1',
  `isvarified` enum('1','0') NOT NULL DEFAULT '0',
  `is_online` enum('1','0') DEFAULT '0',
  `is_autoaccept` enum('1','0') NOT NULL DEFAULT '0' COMMENT '''1'' Auto Accept , ''0'' InactiveAutoAccept',
  `referralcode` varchar(200) NOT NULL,
  `refered_by` varchar(255) DEFAULT NULL,
  `isbusinessaccout` enum('1','0') NOT NULL DEFAULT '0',
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `driveuser`
--

INSERT INTO `driveuser` (`id`, `firstname`, `middlename`, `lastname`, `mobile`, `dob`, `password`, `email`, `manager_account_no`, `g_cash_accont_name`, `g_cash_no`, `lastupdatedatetime`, `profilephoto_url`, `qr_code`, `dura_bag_id`, `vehicle_id`, `created_datetime`, `isactive`, `isvarified`, `is_online`, `is_autoaccept`, `referralcode`, `refered_by`, `isbusinessaccout`, `latitude`, `longitude`, `updated_at`, `created_at`) VALUES
(5, 'Felicity', '', 'Felicia', '8826592906', '10-02-1994', '', 'sonam5@gmail.com', '', '', '', '2021-08-23 23:21:16', 'driverimage.png', '', '', NULL, '2021-08-23', '1', '1', '1', '0', 'HxpBWnG2', '', '1', '14.622541600', '121.023234600', '2021-09-19 17:58:53', '2021-09-09 00:00:00'),
(78, 'Manish', 'Kumar', 'Pathak', '941596811', '1986-05-05', '$2y$10$BneVzjYzI.x4T7Hc45rI0e8cOqcyu9ljM4IclOhv1ZmJOUqTU26Ha', 'man@gmail.com', '15465456', '56465465456', '1', '2021-09-16 14:53:12', 'mani.jpg', '', '51', NULL, '2021-09-09', '1', '', '1', '0', 'KHhyfel2', '', '', '28.532406', '77.404885', '2021-09-19 17:58:59', '2021-09-09 00:00:00'),
(79, 'Manish', 'Kumar', '', '7979948924', '', '$2y$10$cz2dnqBZEoahf/PDEBRGBunWzLgEivE5c94zAERa0spVZaGiSTdEO', 'test@test.com', '', '', '1', '2021-09-11 00:00:00', 'driverimage.png', '', '1', NULL, '2021-09-11', '1', '', '1', '0', 'DvOuqN4n', '', '', '0.000000', '0.000000', '2021-09-19 17:59:05', '2021-09-11 00:00:00'),
(83, 'Manish', '', 'Kumar', '55666666666', '1986-02-02', '$2y$10$dsWuaZvJMhvde/upZLwrs.H5XssIN8oaAePO8OBcjc1Z3mmZwOkOK', 'man4@gmail.com', '1', '1', '1', '2021-09-16 13:56:26', 'driverimage.png', '', '1', NULL, '2021-09-16', '1', '', '1', '0', 'E1WiTFA0', '', '', '0.000000', '0.000000', '2021-09-19 17:59:12', '2021-09-16 13:56:26'),
(97, '', '', '', '12222122565661', '1986-02-02', '$2y$10$b2e4bpYVU3iehAdgAWHMa.R.utIyUDOpwICYU0i.e2e.YlASRroP6', 'ma3125@gmail.com', '1', '1', '1', '2021-09-21 15:29:10', 'file6149fa46d857a-1.jpg', '122221225656610e1c67e2aed4fdc8b7f3f6693ef59bd5.png', '5456', NULL, '2021-09-21', '1', '0', '1', '0', 'BI9jaIy9', '', '0', NULL, NULL, '2021-09-21 15:29:10', '2021-09-21 15:29:10'),
(98, '', '', '', '122221', '1986-02-02', '$2y$10$J8sEqBkjJF70ItStv.GhE.HZ7PUV3P6M/AtKdSYBSxlBTrrmtIXka', 'ma3125644565@gmail.com', '1', '1', '1', '2021-09-21 15:32:26', 'file6149fb0a43445-1.jpg', '122221d3a233100b11c2ed6458acefbed02092.png', '5456', NULL, '2021-09-21', '1', '0', '1', '0', '2vdNRhbJ', '', '0', NULL, NULL, '2021-09-21 15:32:26', '2021-09-21 15:32:26'),
(99, 'Manish', 'Kumar', 'Pathak', '8054251404', '2021-02-05', '$2y$10$6yhHaAFby4hYCkYkleYOXecBZoYm9Tuf2h0yN5Tj67/WcPMnNBLoe', 'mani@yopmail.com', '1', '2', '3', '2021-09-21 16:16:52', 'mani.jpg', '80542514041552245751960083f52cd7f9d168badb.png', '56465', NULL, '2021-09-21', '1', '0', '1', '0', '1wWQ2KXq', '', '0', '12.56465465', '13.54654656', '2021-09-21 16:16:52', '2021-09-21 16:16:52'),
(100, 'Manish', 'Kumar', 'Pathak', '8054251405', '2021-02-05', '$2y$10$g0Yl34lqOJ9XnJqztATZAOQ4j.nSR7wQdP8fxK6kc7r2dvaDpmFmW', 'manisd@yopmail.com', '1', '2', '3', '2021-09-21 15:56:14', 'mani.jpg', '8054251405f1618650f46521c19f909d9409a3e267.png', '547815', NULL, '2021-09-21', '1', '0', '1', '0', 'wKN3r4ZX', '', '0', '10.25458455', '14.25478541', '2021-09-21 15:56:14', '2021-09-21 15:56:14'),
(101, 'ravi', 'Kumar', 'Pathak', '8054251456', '2021-02-05', '$2y$10$pHQnP.8WWrnLEKwSr.B8QOUqfewIIqXuikO653528LsOhRof13OyO', 'manishd@yopmail.com', '1', '2', '3', '2021-09-21 15:58:04', 'mani.jpg', '805425145696168e263fb756cbaf936522a6e42ea3.png', '547815', NULL, '2021-09-21', '1', '0', '1', '0', 'ZdPK6hsv', '', '0', '10.25458455', '14.25478541', '2021-09-21 15:58:04', '2021-09-21 15:58:04'),
(102, 'raj', 'kumar', 'Pathak', '805425145655', '2021-02-05', '$2y$10$ki4.vtITiESKF3QJL9/5Sux67dYy.HlgqKc.FMQ0BBeeCR5o0sBiq', 'manish55d@yopmail.com', '1', '2', '3', '2021-09-21 16:18:13', 'file614a05c507758-4.jpg', '8054251456551cd12a7aa57217d2fd9410036e936426.png', '547815', NULL, '2021-09-21', '1', '0', '1', '0', 'LBlEbMd2', '', '0', '10.25458455', '14.25478541', '2021-09-21 16:18:13', '2021-09-21 16:18:13'),
(103, 'raj', 'kumar', 'Pathak', '8054251456556', '2021-02-05', '$2y$10$l1f5smrDtoxKT8kyMmjMUezxActT3knSx4Vp9TnmIyDnLVCNI1P7W', 'manish556d@yopmail.com', '1', '2', '3', '2021-09-21 16:19:54', 'file614a0629ee8f0-4.jpg', '8054251456556a790604eb022b8e997a679f3a907b769.png', '547815', NULL, '2021-09-21', '1', '0', '1', '0', 'qQYPJ8J6', '', '0', '10.25458455', '14.25478541', '2021-09-21 16:19:54', '2021-09-21 16:19:54');

-- --------------------------------------------------------

--
-- Table structure for table `driveusernotification`
--

CREATE TABLE `driveusernotification` (
  `id` bigint(20) NOT NULL,
  `notificationtype` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `datetime` tinyint(1) NOT NULL,
  `durauserid` bigint(20) NOT NULL,
  `createddatetime` datetime NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `driveusernotification`
--

INSERT INTO `driveusernotification` (`id`, `notificationtype`, `description`, `datetime`, `durauserid`, `createddatetime`, `created_at`, `updated_at`) VALUES
(1, 'testing noti', 'This description for driver notification', 2, 1, '2021-08-11 22:47:57', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `driveuserrating`
--

CREATE TABLE `driveuserrating` (
  `id` int(11) UNSIGNED NOT NULL,
  `userid` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `driverid` int(11) NOT NULL,
  `rating` decimal(2,1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `service_type` enum('Dura Drive','Dura Shop','Dura Eat') NOT NULL DEFAULT 'Dura Drive' COMMENT 'Dura Drive'',''Dura Shop'',''Dura Eat',
  `remarks` varchar(300) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `driveuserrating`
--

INSERT INTO `driveuserrating` (`id`, `userid`, `orderid`, `driverid`, `rating`, `status`, `service_type`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 149, 18, 5, 1.0, 1, 'Dura Drive', '', '2021-09-12 17:36:38', '2021-06-22 18:48:04'),
(2, 149, 16, 5, 4.0, 1, 'Dura Drive', '', '2021-09-12 17:36:29', '2021-06-22 18:48:04'),
(3, 149, 17, 5, 3.5, 1, 'Dura Drive', '', '2021-09-12 17:36:19', '2021-06-22 18:48:04'),
(4, 303, 5, 5, 5.0, 1, 'Dura Drive', 'This is the test', '2021-09-13 17:25:07', '2021-09-13 17:25:07'),
(5, 303, 5, 5, 5.0, 1, 'Dura Drive', 'This is the test', '2021-09-13 17:28:36', '2021-09-13 17:28:36'),
(6, 303, 5, 5, 5.0, 1, 'Dura Drive', 'This is the test', '2021-09-13 17:28:39', '2021-09-13 17:28:39'),
(7, 303, 5, 5, 5.0, 1, 'Dura Drive', 'This is the test', '2021-09-13 17:28:41', '2021-09-13 17:28:41'),
(8, 303, 5, 5, 5.0, 1, 'Dura Drive', 'This is the test', '2021-09-13 17:28:43', '2021-09-13 17:28:43'),
(9, 303, 5, 5, 5.0, 1, 'Dura Drive', 'This is the test', '2021-09-13 17:28:46', '2021-09-13 17:28:46'),
(10, 303, 5, 5, 5.0, 1, 'Dura Drive', 'This is the test', '2021-09-13 17:29:02', '2021-09-13 17:29:02'),
(11, 303, 5, 5, 5.0, 1, 'Dura Drive', 'This is the test', '2021-09-13 17:29:11', '2021-09-13 17:29:11'),
(12, 303, 5, 5, 5.0, 1, 'Dura Drive', 'This is the test', '2021-09-13 17:29:13', '2021-09-13 17:29:13'),
(13, 303, 5, 5, 5.0, 1, 'Dura Drive', 'This is the test', '2021-09-13 17:29:32', '2021-09-13 17:29:32'),
(14, 303, 5, 5, 5.0, 1, 'Dura Drive', 'This is the test', '2021-09-13 17:29:38', '2021-09-13 17:29:38'),
(15, 303, 5, 5, 5.0, 1, 'Dura Drive', 'This is the test', '2021-09-13 17:29:45', '2021-09-13 17:29:45'),
(16, 303, 5, 5, 5.0, 1, 'Dura Drive', 'This is the test', '2021-09-13 17:29:49', '2021-09-13 17:29:49'),
(17, 303, 5, 5, 5.0, 1, 'Dura Drive', 'This is the test', '2021-09-13 17:31:05', '2021-09-13 17:31:05'),
(18, 303, 5, 5, 5.0, 1, 'Dura Drive', 'This is the test', '2021-09-13 17:31:10', '2021-09-13 17:31:10');

-- --------------------------------------------------------

--
-- Table structure for table `driveuserreview`
--

CREATE TABLE `driveuserreview` (
  `reviewid` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `review1` int(11) NOT NULL,
  `review2` int(11) NOT NULL,
  `review3` int(11) NOT NULL,
  `likescount` bigint(20) NOT NULL DEFAULT 0,
  `positivereview` int(11) NOT NULL,
  `negativereview` int(11) NOT NULL,
  `reviewbyuserid` int(11) NOT NULL,
  `reviewdatetime` datetime NOT NULL,
  `description` varchar(300) NOT NULL,
  `remarks` varchar(300) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `driveusersetting`
--

CREATE TABLE `driveusersetting` (
  `id` int(11) NOT NULL,
  `driveuserid` int(11) NOT NULL,
  `enable_push` tinyint(1) NOT NULL,
  `enable_promos` tinyint(1) NOT NULL,
  `enable_orderpurchased` tinyint(1) NOT NULL,
  `defaultlanguage` varchar(100) NOT NULL,
  `rates` varchar(200) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `durapickupshedule`
--

CREATE TABLE `durapickupshedule` (
  `id` int(11) NOT NULL,
  `order_no` varchar(255) NOT NULL DEFAULT '1',
  `driver_id` int(11) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `pickup_address1` longtext DEFAULT NULL,
  `pickup_address2` longtext DEFAULT NULL,
  `pickup_name` varchar(255) NOT NULL,
  `pickup_mobile` varchar(255) NOT NULL,
  `destination_address1` longtext DEFAULT NULL,
  `destination_address2` longtext DEFAULT NULL,
  `destination_name` varchar(255) NOT NULL,
  `destination_mobile` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `pdate` varchar(255) NOT NULL,
  `stop_address1` longtext DEFAULT NULL,
  `stop_address2` longtext DEFAULT NULL,
  `stop_name` varchar(255) DEFAULT NULL,
  `stop_mobile` varchar(255) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `drivernote` text DEFAULT NULL,
  `tip` varchar(255) DEFAULT NULL,
  `itemphoto` text DEFAULT NULL,
  `itemtype` varchar(255) DEFAULT NULL,
  `acctype` varchar(255) DEFAULT NULL,
  `coupon` varchar(255) DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `finalprice` varchar(25) DEFAULT NULL,
  `pickuplat` varchar(255) DEFAULT NULL,
  `pickuplon` varchar(255) DEFAULT NULL,
  `destinationlat` varchar(255) DEFAULT NULL,
  `destinationlon` varchar(255) DEFAULT NULL,
  `stopData` longtext DEFAULT NULL,
  `stoplat` varchar(255) DEFAULT NULL,
  `stoplon` varchar(255) DEFAULT NULL,
  `paymentmode` varchar(255) DEFAULT 'COD',
  `status` enum('1','2','3','4') NOT NULL DEFAULT '1' COMMENT '1=Pending,2=Ongoing,3=Completed,4=Cancelled',
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `durapickupshedule`
--

INSERT INTO `durapickupshedule` (`id`, `order_no`, `driver_id`, `user_id`, `pickup_address1`, `pickup_address2`, `pickup_name`, `pickup_mobile`, `destination_address1`, `destination_address2`, `destination_name`, `destination_mobile`, `type`, `pdate`, `stop_address1`, `stop_address2`, `stop_name`, `stop_mobile`, `vehicle_id`, `price`, `drivernote`, `tip`, `itemphoto`, `itemtype`, `acctype`, `coupon`, `discount`, `finalprice`, `pickuplat`, `pickuplon`, `destinationlat`, `destinationlon`, `stopData`, `stoplat`, `stoplon`, `paymentmode`, `status`, `created_at`, `updated_at`) VALUES
(1, 'cnhIpbfDV2', 5, 149, ' Santa Clara County 94043 Mountain View United States', 'cv bcg', 'Abhay Lpu Noida', '+919560386426', ' Santa Clara County 94043 Mountain View United States', 'b cxv', 'Abhay Mca Hons Lpu', '+918377929856', 'asap', '09/06/2021', NULL, NULL, NULL, NULL, 1, '', '', '', '', '', '', '', '', '', '37.3903563', '-122.0817457', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '4', '2021-09-06 14:20:22', '2021-09-21 16:10:23'),
(2, '9HtPoSwg4y', 5, 298, 'Sector 11 East Delhi 201301 Noida India', 'djdjdn', 'didjdnd', '95353491949', 'Sector 22 Gautam Buddh Nagar 201301 Noida India', 'rjdiskje', 'didkskk', '567679446464', 'asap', '09/06/2021', NULL, NULL, NULL, NULL, 3, '45', '', '0', 'itemphoto613639ec4a9ee-ProductImage_FD6CL.jpg', 'ASAP', 'Personal', '', '', '45.00', '28.5985755', '77.3338783', '28.598843', '77.343635', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(3, 'fRDoBbNR8F', 5, 303, ' Santa Clara County 94043 Mountain View United States', 'ftbd', 'Aadesh Mishra', '07508516040', ' Santa Clara County 94043 Mountain View United States', 'fbf', 'Abhay Mca Hons Lpu', '+918377929856', 'asap', '09/07/2021', NULL, NULL, NULL, NULL, 1, '40', '', '50.7', 'itemphoto61372e1ff27d0-ProductImage_X26m3.jpg', 'ASAP', 'Personal', '', '', '40.00', '37.3930076', '-122.0777117', '37.4008596', '-122.0977936', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(6, 'M0liKngWjW', 5, 303, ' Santa Clara County 94043 Mountain View United States', 'jhvj', 'Aadesh Mishra', '07508516040', ' Santa Clara County 94043 Mountain View United States', 'jyhjk', 'Abhay Lpu Noida', '+919560386426', 'asap', '09/07/2021', NULL, NULL, NULL, NULL, 1, '40', '', '0', 'itemphoto6137362926af4-ProductImage_grI99.jpg', 'ASAP', 'Personal', '', '', '40.00', '37.3930076', '-122.0777117', '37.4008596', '-122.0977936', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(7, 'U98oTa7ITC', 5, 303, ' Santa Clara County 94043 Mountain View United States', 'rgrd', 'Aadesh Mishra', '07508516040', ' Santa Clara County 94043 Mountain View United States', 'tbdtf', 'Abhay Mca Hons Lpu', '+918377929856', 'asap', '09/07/2021', NULL, NULL, NULL, NULL, 1, '30', '', '0', 'itemphoto613740c2075fa-ProductImage_sT5i0.jpg', 'ASAP', 'Personal', '', '', '30.00', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(8, 'LsPcqOtAlI', 5, 303, ' Santa Clara County 94043 Mountain View United States', 'gb f', 'Abhay Lpu Noida', '+919560386426', ' Santa Clara County 94043 Mountain View United States', NULL, 'Abhay Mca Hons Lpu', '+918377929856', 'asap', '09/07/2021', NULL, NULL, NULL, NULL, 1, '30', '', '50', 'itemphoto61374477357b6-ProductImage_EWYMA.jpg', 'ASAP', 'Personal', '', '', '30.00', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(9, 'kxK0xmau7m', 5, 303, ' Santa Clara County 94043 Mountain View United States', 'tny', 'Aadesh Mishra', '07508516040', ' Santa Clara County 94043 Mountain View United States', 'ftnf', 'Abhay Mca Hons Lpu', '+918377929856', 'asap', '09/07/2021 14:14', NULL, NULL, NULL, NULL, 1, '40', '', '90', 'itemphoto613746ed79cb7-ProductImage_Fk5aw.jpg', 'ASAP', 'Personal', '', '', '40.00', '37.3860517', '-122.0838511', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(10, 'R63S7bFMhO', 5, 303, ' Santa Clara County 94043 Mountain View United States', 'byhf', 'Abhay Lpu Noida', '+919560386426', ' Santa Clara County 94043 Mountain View United States', 'f f', 'Abhay Mca Hons Lpu', '+918377929856', 'asap', '09/07/2021', NULL, NULL, NULL, NULL, 1, '35', '', '0', 'itemphoto61374e3375ccc-ProductImage_y2nAw.jpg', 'ASAP', 'Personal', '', '', '35.00', '37.3930076', '-122.0777117', '37.3860517', '-122.0838511', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(11, 'XvSNJgWcby', 5, 303, ' Santa Clara County 94043 Mountain View United States', 'hcdj', 'Abhay Lpu Noida', '+919560386426', ' Santa Clara County 94043 Mountain View United States', 'hv m', 'Abhay Mca Lpu', '9815089746', 'asap', '09/07/2021 17:21', NULL, NULL, NULL, NULL, 1, '35', '', '0', 'itemphoto6137529649527-ProductImage_Z8XHy.jpg', 'ASAP', 'Personal', '', '', '35.00', '37.3930076', '-122.0777117', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(12, 'Bv9pjaJOkB', 5, 303, ' Santa Clara County 94043 Mountain View United States', 'cbcg', 'Abhay Lpu Noida', '+919560386426', ' Santa Clara County 94043 Mountain View United States', NULL, 'Abhilash Patha', '+919803480218', 'asap', '09/07/2021 17:35', NULL, NULL, NULL, NULL, 1, '35', '', '0', 'itemphoto613755d396d9f-ProductImage_Ieulv.jpg', 'ASAP', 'Personal', '', '', '35.00', '37.3930076', '-122.0777117', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(13, 'Zl8JIW53GM', 5, 303, ' Santa Clara County 94043 Mountain View United States', 'btf', 'Aadesh Mishra', '07508516040', ' Santa Clara County 94043 Mountain View United States', 'fgbrf', 'Abhay Mca Lpu', '9815089746', 'asap', '09/07/2021 18:51', NULL, NULL, NULL, NULL, 1, '35', '', '0', 'itemphoto613767b2912d9-ProductImage_0HN4v.jpg', 'ASAP', 'Personal', '', '', '35.00', '37.3930076', '-122.0777117', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(14, 'H9CEyaB97p', 5, 303, ' Santa Clara County 94043 Mountain View United States', 'fbfccb', 'Abhay Mca Lpu', '9815089746', ' Santa Clara County 94043 Mountain View United States', 'fbdfgb ', 'Abhilash Patha', '+919803480218', 'asap', '09/07/2021 19:05', NULL, NULL, NULL, NULL, 1, '35', '', '0', 'itemphoto61376ac6a657d-ProductImage_iQDr1.jpg', 'ASAP', 'Personal', '', '', '35.00', '37.4062237', '-122.0781663', '37.3930076', '-122.0777117', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(15, 'Cfsqj1YAVD', 5, 303, 'Mohali Village Sahibzada Ajit Singh Nagar 140301 Sahibzada Ajit Singh Nagar India', 'dest', 'Abhay Mca Lpu', '9815089746', ' Sahibzada Ajit Singh Nagar 140301 Sahibzada Ajit Singh Nagar India', 'dest ', 'Abhilash Patha', '+919803480218', 'asap', '09/07/2021 20:40', NULL, NULL, NULL, NULL, 1, '50', '', '0', 'itemphoto613780fe9f1c2-ProductImage_ICRS6.jpg', 'ASAP', 'Personal', '', '', '50.00', '30.7302881', '76.7157608', '30.7405657', '76.6719399', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(16, 'K9iMbunwKl', 5, 298, 'Buddh Vihar Gautam Buddh Nagar 201301 Noida India', 'dhsjsj', 'hrjdjd', '464346.4646', 'Kondli East Delhi 110096 New Delhi India', 'rhsjsjsj', 'dhsjzj', '65343646464', 'asap', '09/07/2021 22:14', NULL, NULL, NULL, NULL, 5, '125', '', '650', 'itemphoto613798333df6c-ProductImage_P9grF.jpg', 'ASAP', 'Personal', '', '', '125.00', '28.5821195', '77.3266991', '28.6132908', '77.3289164', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(17, 'des7UVSBn8', 5, 298, 'Sector 11 East Delhi 201301 Noida India', 'dhsjsj', 'hdjdjs', '564649498646', 'Kondli East Delhi 110096 New Delhi India', 'rhsjsjsj', 'ejsjsj', '6534346794676', 'asap', '09/07/2021 22:21', NULL, NULL, NULL, NULL, 2, '40', '', '650', 'itemphoto613799057fd0f-ProductImage_w0zbp.jpg', 'ASAP', 'Personal', '', '', '40.00', '28.5967528', '77.3304576', '28.6132908', '77.3289164', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(18, 'TL3GxXGidE', 5, 298, 'Sector 11 East Delhi 201301 Noida India', 'iesnan', 'jfjsjsj', '5649494946.5.5', 'Sector 11 East Delhi 201301 Noida India', 'dj as ona', 'jrdi as jsn', '95.4.4..1.1.1.4', 'asap', '09/07/2021 23:41', NULL, NULL, NULL, NULL, 5, '500', '', '10', 'itemphoto6137abb07a034-ProductImage_4wppQ.jpg', 'ASAP', 'Personal', '', '', '500.00', '28.5967528', '77.3304576', '28.5985755', '77.3338783', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(19, '1', 0, 298, 'Sector 11 East Delhi 201301 Noida India', 'iesnanjdjs', 'jdjdjdjjs', '98949464646464', 'Sector 6 Gurgaon 122001 Gurugram India', 'hrjrjrj', 'ndenneenen', '594949491919', 'asap', '09/07/2021 23:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28.5985755', '77.3338783', '28.474928', '77.0302997', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(20, '7bkSBA1BFb', 5, 298, 'Sector 11 East Delhi 201301 Noida India', 'iesnanjdjs', 'jdjdjdjjs', '98949464646464', 'Sector 6 Gurgaon 122001 Gurugram India', 'hrjrjrj', 'ndenneenen', '594949491919', 'asap', '09/07/2021 23:50', NULL, NULL, NULL, NULL, 1, '1750', '', '10', 'itemphoto6137ae5079b93-ProductImage_zPpxA.jpg', 'ASAP', 'Personal', '', '', '1750.00', '28.5985755', '77.3338783', '28.474928', '77.0302997', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(21, '1', 0, 298, 'Sector 11 East Delhi 201301 Noida India', 'iesnanjdjs', 'hdjdjsj', '5679494965649', 'Sector 6 Gurgaon 122001 Gurugram India', 'hrjrjrj', 'shsjsnwn', '464949464649', 'asap', '09/07/2021 23:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28.5985755', '77.3338783', '28.474928', '77.0302997', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(22, 'CY4Quv7N3u', 5, 298, 'Sector 11 East Delhi 201301 Noida India', 'iesnanjdjs', 'hdjdjsj', '5679494965649', 'Sector 6 Gurgaon 122001 Gurugram India', 'hrjrjrj', 'shsjsnwn', '464949464649', 'asap', '09/07/2021 23:56', NULL, NULL, NULL, NULL, 2, '3500', '', '10', 'itemphoto6137af47cc756-ProductImage_Paq98.jpg', 'ASAP', 'Personal', '', '', '3500.00', '28.5985755', '77.3338783', '28.474928', '77.0302997', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(23, '1', 0, 298, 'St. Luke’s Medical Center, East Rodriguez Sr. Avenue, Quezon City, Metro Manila, Philippines', 'ehejwj', 'jejehj', '8635563556', 'St. Luke’s Medical Center, East Rodriguez Sr. Avenue, Quezon City, Metro Manila, Philippines', 'gghu', 'fgguggi', '88528663695', 'asap', '09/08/2021 01:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '14.6225416', '121.0232346', '14.6225416', '121.0232346', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(24, 'NnT0fRqeeU', 5, 298, 'St. Luke’s Medical Center, East Rodriguez Sr. Avenue, Quezon City, Metro Manila, Philippines', 'ehejwj', 'jejehj', '8635563556', 'St. Luke’s Medical Center, East Rodriguez Sr. Avenue, Quezon City, Metro Manila, Philippines', 'gghu', 'fgguggi', '88528663695', 'asap', '09/08/2021 01:49', NULL, NULL, NULL, NULL, 1, '100', '', '0', 'itemphoto6137ca526c54b-ProductImage_nYDoa.jpg', 'ASAP', 'Personal', '', '', '100.00', '14.6225416', '121.0232346', '14.6225416', '121.0232346', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(25, 'dEU42imkez', 5, 304, '  1233 Makati Philippines', '', 'Robert Martinez', '09159851768', 'Corinthian Executive Regency, Makati, Metro Manila, Philippines', '', 'Benjie Javier', '09081250030', 'asap', '09/08/2021 07:58', NULL, NULL, NULL, NULL, 1, '160', '', '0', 'itemphoto6137fd85c1295-ProductImage_kn9oc.jpg', 'ASAP', 'Personal', '', '', '160.00', '14.554729', '121.0244452', '14.560498', '121.017159', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(26, 'etoj4TLr3v', 0, 304, '  1233 Makati Philippines', '', 'Robert Martinez', '09159851768', '  1230 Makati Philippines', '1976 Capt. M. Reyes, Makati, Metro Manila, Philippines', 'Juan Dela', '09144563214', 'later', '09/30/2021 8:20', NULL, NULL, NULL, NULL, 1, '220', '', '0', 'itemphoto61380279d15f4-ProductImage_PJAhc.jpg', 'Later', 'Personal', '', '', '220.00', '14.554729', '121.0244452', '14.5448544', '121.0101673', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(27, 'WL6cW4Ebcn', 5, 305, '5th Ave  1400 Caloocan Philippines', 'test', 'EZEKIEl', '9158291795', 'SM City Marikina, Marikina-Infanta Highway, Marikina, Metro Manila, Philippines', 'lobby', 'Ezekiel', '+639158291795', 'asap', '09/08/2021 10:52', NULL, NULL, NULL, NULL, 1, '670', '', '0', 'itemphoto613825c632397-ProductImage_myece.jpg', 'ASAP', 'Personal', '', '', '670.00', '14.6460443', '120.984517', '14.6260403', '121.0837833', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(28, '1', 0, 312, 'Philippine Arena, Santa Maria, Bulacan, Philippines', 'San Felipe public market Philippines', 'Akash', '8882341937', 'St. Luke’s Medical Center, East Rodriguez Sr. Avenue, Quezon City, Metro Manila, Philippines', 'salcedo Saturday markets', 'Akash', '8882341937', 'asap', '09/08/2021 12:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '14.7938922', '120.953604', '14.5601227', '121.0234356', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(29, 'rwq2g54wkU', 5, 312, 'Philippine Arena, Santa Maria, Bulacan, Philippines', 'San Felipe public market Philippines', 'Akash', '8882341937', 'St. Luke’s Medical Center, East Rodriguez Sr. Avenue, Quezon City, Metro Manila, Philippines', 'salcedo Saturday markets', 'Akash', '8882341937', 'asap', '09/08/2021 12:54', NULL, NULL, NULL, NULL, 5, '7250', 'Test', '10', 'itemphoto613866ad04c1c-ProductImage_kZdOa.jpg', 'ASAP', 'Personal', '', '', '7250.00', '14.7938922', '120.953604', '14.5601227', '121.0234356', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(30, 'cwlD0THlbg', 5, 312, 'Philippine Arena, Santa Maria, Bulacan, Philippines', 'San Felipe public market Philippines', 'Akash', '8882341937', 'St. Luke’s Medical Center, East Rodriguez Sr. Avenue, Quezon City, Metro Manila, Philippines', 'salcedo Saturday markets', 'Akash', '8882341937', 'asap', '09/08/2021 13:01', NULL, NULL, NULL, NULL, 3, '4350', 'Test', '10', 'itemphoto6138671879b2b-ProductImage_TESRs.jpg', 'ASAP', 'Personal', '', '', '4350.00', '14.7938922', '120.953604', '14.5601227', '121.0234356', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(31, 'GtvMP8N7YG', 5, 312, 'Salarpur Gautam Buddh Nagar 201304 Noida India', 'San Felipe public market Philippines', 'Akash', '8882341937', 'St. Luke’s Medical Center, East Rodriguez Sr. Avenue, Quezon City, Metro Manila, Philippines', 'salcedo Saturday markets', 'Akash', '8882341937', 'asap', '09/08/2021 13:04', NULL, NULL, NULL, NULL, 1, '237200', 'Test', '10', 'itemphoto613867d35a68e-ProductImage_l4hVd.jpg', 'ASAP', 'Personal', '', '', '237200.00', '28.5456897', '77.3882686', '14.5601227', '121.0234356', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(32, '0kCm8hRKUW', 0, 312, 'Salarpur Gautam Buddh Nagar 201304 Noida India', 'Noida', 'Akash', '8882341937', 'Salarpur Gautam Buddh Nagar 201304 Noida India', 'Noida', 'Akash', '8882341937', 'later', '09/11/2021 11:50', NULL, NULL, NULL, NULL, 5, '500', '', '0', 'itemphoto613872e6de259-ProductImage_5Hc8q.jpg', 'Later', 'Personal', '', '', '500.00', '28.5456897', '77.3882686', '28.5456897', '77.3882686', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(33, 'mKL35Xpy7k', 5, 312, 'PITX - Parañaque Integrated Terminal Exchange, Tambo, Parañaque, Metro Manila, Philippines', 'sm market mall Dasmarinas kadiwa market', 'Akash', '9532152054', 'St. Luke’s Medical Center, East Rodriguez Sr. Avenue, Quezon City, Metro Manila, Philippines', 'Pasig City mega market', 'Akash', '9532152054', 'asap', '09/08/2021 14:18', NULL, NULL, NULL, NULL, 3, '5250', 'Test', '10', 'itemphoto61387935f3d21-ProductImage_IQ6ZT.jpg', 'ASAP', 'Personal', '', '', '5250.00', '14.3280545', '120.9597365', '14.6225416', '121.0232346', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(34, 'IY8TFYTEI3', 0, 312, 'Salarpur Gautam Buddh Nagar 201304 Noida India', 'sm market mall Dasmarinas kadiwa market', 'Akash', '8882341937', 'St. Luke’s Medical Center, East Rodriguez Sr. Avenue, Quezon City, Metro Manila, Philippines', 'Pasig City mega market', 'Akash', '8882341937', 'later', '09/10/2021 22:20', NULL, NULL, NULL, NULL, 5, '8750', 'Test', '10', 'itemphoto613879e200463-ProductImage_WkfES.jpg', 'Later', 'Personal', '', '', '8750.00', '14.3280545', '120.9597365', '14.6225416', '121.0232346', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(35, '9zhDrH1Nrf', 0, 312, 'Salarpur Gautam Buddh Nagar 201304 Noida India', 'sm market mall Dasmarinas kadiwa market', 'Akash', '8882341937', 'St. Luke’s Medical Center, East Rodriguez Sr. Avenue, Quezon City, Metro Manila, Philippines', 'Pasig City mega market', 'Akash', '8882341937', 'later', '09/10/2021 22:20', NULL, NULL, NULL, NULL, 5, '8750', '', '10', 'itemphoto61387a275dccd-ProductImage_jg5VG.jpg', 'Later', 'Personal', '', '', '8750.00', '14.3280545', '120.9597365', '14.6225416', '121.0232346', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(36, 'gB6dKyBSED', 5, 312, 'Salarpur Gautam Buddh Nagar 201304 Noida India', 'sm market mall Dasmarinas kadiwa market', 'Akash', '8882341937', 'St. Luke’s Medical Center, East Rodriguez Sr. Avenue, Quezon City, Metro Manila, Philippines', 'Pasig City mega market', 'Akash', '8882341937', 'asap', '09/08/2021 14:24', NULL, NULL, NULL, NULL, 5, '8750', '', '10', 'itemphoto61387a8f72950-ProductImage_jfUwE.jpg', 'ASAP', 'Personal', '', '', '8750.00', '14.3280545', '120.9597365', '14.6225416', '121.0232346', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(37, 'lRIQ5sjoeq', 5, 312, 'Salarpur Gautam Buddh Nagar 201304 Noida India', 'sm market mall Dasmarinas kadiwa market', 'Akash', '8882341937', 'St. Luke’s Medical Center, East Rodriguez Sr. Avenue, Quezon City, Metro Manila, Philippines', 'Pasig City mega market', 'Akash', '8882341937', 'asap', '09/08/2021 14:35', NULL, NULL, NULL, NULL, 5, '8750', '', '10', 'itemphoto61387cf767448-ProductImage_4By04.jpg', 'ASAP', 'Personal', '', '', '8750.00', '14.3280545', '120.9597365', '14.6225416', '121.0232346', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(38, '1', 0, 298, 'Salarpur Gautam Buddh Nagar 201304 Noida India', 'hrjdjsjen', 'rjsjsjsej', '56865943431611', 'Salarpur Gautam Buddh Nagar 201304 Noida India', 'jrieieiei', 'eheejej', '32949494646494', 'asap', '09/08/2021 16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28.545327', '77.3835439', '28.545327', '77.3835439', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(39, '76Y785HaFc', 5, 298, 'Sector 140 Gautam Buddh Nagar 201304 Noida India', 'gghjbbggvhj', 'vhjhh', '8558566666', 'Sector 89 Gautam Buddh Nagar 201305 Noida India', 'vshshshsssjsjsj', 'shsjsjsdj', '594946446464', 'asap', '09/08/2021 17:57', NULL, NULL, NULL, NULL, 1, '250', '', '0', 'itemphoto6138acc8bba8d-ProductImage_XRDeA.jpg', 'ASAP', 'Personal', '', '', '250.00', '28.499886', '77.403928', '28.5158135', '77.3742571', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(40, '7P8Ve6FKEv', 5, 303, ' Santa Clara County 94043 Mountain View United States', 'dbhdgbg', 'Abhay Lpu Noida', '+919560386426', ' Santa Clara County 94043 Mountain View United States', 'rgverve', 'Abhay Mca Hons Lpu', '+918377929856', 'asap', '09/08/2021 18:06', NULL, NULL, NULL, NULL, 1, '220', '', '0', 'itemphoto6138b0d357257-ProductImage_77Wy4.jpg', 'ASAP', 'Personal', '', '', '220.00', '37.4008596', '-122.0977936', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(41, 'Aqxb5V8y15', 5, 304, '  1443 Lungsod ng Valenzuela Philippines', '', 'Robert', '09159851738', '  1440 Valenzuela Philippines', NULL, 'Summer', '095212345698', 'asap', '09/08/2021 21:36', NULL, NULL, NULL, NULL, 1, '210', '', '0', 'itemphoto6138bcf04a751-ProductImage_d75un.jpg', 'ASAP', 'Personal', '', '', '210.00', '14.7010556', '120.9830225', '14.6937007', '120.9693286', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(42, 'AE0NWsxj7s', 5, 303, ' Santa Clara County 94043 Mountain View United States', 'ftbf', 'Abhay Lpu Noida', '+919560386426', ' Santa Clara County 94043 Mountain View United States', 'dbd', 'Abhay Mca Lpu', '9815089746', 'asap', '09/08/2021 21:51', NULL, NULL, NULL, NULL, 1, '170', '', '0', 'itemphoto6138e34e72d9d-ProductImage_9EZxg.jpg', 'ASAP', 'Personal', '', '', '170.00', '37.3930076', '-122.0777117', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(46, 'xnrMGXtdrV', 5, 303, ' Pangasinan  Aguilar Philippines', 'gvbte', 'Abhilash Patha', '+919803480218', ' Pangasinan  Bugallon Philippines', 'tgbter', 'Abhilash Patha', '+919803480218', 'asap', '09/09/2021 11:09', NULL, NULL, NULL, NULL, 1, '920', '', '0', 'itemphoto61399f207c463-ProductImage_TDAaa.jpg', 'ASAP', 'Personal', '', '', '920.00', '15.8491508', '120.1728693', '15.9861202', '120.2238006', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(47, 'C9joWkgsVo', 5, 303, '   Las Pinas Philippines', 'gbrd', 'Abhilash Patha', '+919803480218', 'Olivarez General Hospital, Doctor Arcadio Santos Avenue, Parañaque, Metro Manila, Philippines', 'tbfd', 'Abhinav New Number', '+917307647454', 'asap', '09/09/2021 19:55', NULL, NULL, NULL, NULL, 1, '320', '', '0', 'itemphoto613a199951685-ProductImage_Mwhmc.jpg', 'ASAP', 'Personal', '', '', '320.00', '14.4439425', '120.9932923', '14.4792298', '120.9968424', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(48, 'OltEmLPfwC', 5, 303, ' Negros Occidental  Bacolod Philippines', 'fhj', 'Abhay Mca Lpu', '9815089746', 'Eroreco Subdivision Park, Bacolod, Negros Occidental, Philippines', '', 'Abhishek Lpu Abhinav Room Mate', '+919780179013', 'asap', '09/09/2021 22:41', NULL, NULL, NULL, NULL, 1, '320', '', '0', 'itemphoto613a40624be96-ProductImage_hLdnV.jpg', 'ASAP', 'Personal', '', '', '320.00', '10.6573488', '122.9482942', '10.6830884', '122.9707026', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(49, 'yQrWoZ0FOM', 0, 298, 'Sector 11 East Delhi 201301 Noida India', 'rree', 'ffffd', '554445555555', 'Dhawalgiri Apartments East Delhi Noida India 201301', 'fdedd', 'ffffff', '855555555555', 'later', '09/09/2021 23:45', NULL, NULL, NULL, NULL, 1, '170', 'gddddx', '5444', 'itemphoto613a4c6f7e53f-ProductImage_hrdxN.jpg', 'Later', 'Corporate', '', '', '170.00', '28.5967528', '77.3304576', '28.602043', '77.339001', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(50, 'j50ENIBEcj', 5, 298, 'Dhawalgiri Apartments East Delhi Noida India 201301', 'fff', 'dddx', '584788555555', 'Dhawalgiri Apartments East Delhi Noida India 201301', 'dddds', 'xxddddd', '555555558885', 'asap', '09/09/2021 23:35', NULL, NULL, NULL, NULL, 1, '120', '', '5444', 'itemphoto613a4d76d0b42-ProductImage_ZQ0qn.jpg', 'ASAP', 'Personal', '', '', '120.00', '28.602043', '77.339001', '28.602043', '77.339001', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(51, 'ACzxOwro1u', 5, 303, 'Rizal  Tanay Philippines', 'dtbr', 'Abhay Mca Hons Lpu', '+918377929856', 'Rizal  Antipolo Philippines', 'dbd', 'Abhinaw Mca Lpu', '7508224247', 'asap', '09/10/2021 09:35', NULL, NULL, NULL, NULL, 1, '920', '', '0', 'itemphoto613ad9cf053bc-ProductImage_2idDV.jpg', 'ASAP', 'Personal', '', '', '920.00', '14.6063983', '121.3222847', '14.5859632', '121.1764869', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(52, 'Cav48Wb1iu', 0, 303, 'Lalawigan ng Rizal  Bayan ng Tanay Philippines', 'fvdf', 'Abhay Mca Hons Lpu', '+918377929856', 'Rizal  Tanay Philippines gt Tanay  Work', 'dfvdf', 'Abhinav New Number', '+917307647454', 'later', '09/11/2021 9:39', NULL, NULL, NULL, NULL, 1, '770', '', '56', 'itemphoto613adaf9c3f7e-ProductImage_J4iG2.jpg', 'Later', 'Personal', '', '', '770.00', '14.6063983', '121.3222847', '14.6028468', '121.4443138', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(53, 'MJeA94hB3m', 5, 303, 'Niugan Elementary School, Cabuyao, Laguna, Philippines', 'bfd', 'Abhay Mca Hons Lpu', '+918377929856', 'Nyugan Road, Dasmariñas, Cavite, Philippines', 'trvr', 'Abhinav New Number', '+917307647454', 'asap', '09/10/2021 09:49', NULL, NULL, NULL, NULL, 1, '920', '', '0', 'itemphoto613add20bd0d5-ProductImage_bAttm.jpg', 'ASAP', 'Personal', '', '', '920.00', '14.2629628', '121.1286152', '14.2877957', '120.9866971', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(54, 'rTbv1kKAK7', 0, 303, 'Cavite  Silang Philippines', 'bdfb', 'Aadesh Mishra', '07508516040', 'Nyugan Road, Dasmariñas, Cavite, Philippines', 'dfbdg', 'Abhinav New Number', '+917307647454', 'later', '09/11/2021 9:52', NULL, NULL, NULL, NULL, 1, '520', '', '0', 'itemphoto613addc8c73a1-ProductImage_CHgRH.jpg', 'Later', 'Personal', '', '', '520.00', '14.214175', '120.9687359', '14.2877957', '120.9866971', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(55, 'F5P7QOYZBS', 5, 312, 'Salarpur Gautam Buddh Nagar 201304 Noida India', '', 'Akash', '8882341937', 'Salarpur Gautam Buddh Nagar 201304 Noida India', NULL, 'Akash', '8882341937', 'asap', '09/10/2021 10:51', NULL, NULL, NULL, NULL, 9, '850', '', '0', 'itemphoto613aec5a51902-ProductImage_aB5eW.jpg', 'ASAP', 'Personal', '', '', '850.00', '28.5456897', '77.3882686', '28.5456897', '77.3882686', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(56, 'LjgdMDeM5r', 5, 303, 'Lalawigan ng Rizal  Cainta Philippines', 'dnei', 'Abhilash Patha', '+919803480218', 'Rizal  Cainta Philippines', 'djdj', 'Abhinav New Number', '+917307647454', 'asap', '09/10/2021 12:25', NULL, NULL, NULL, NULL, 1, '170', '', '0', 'itemphoto613b017386c1a-ProductImage_01TZr.jpg', 'ASAP', 'Personal', '', '', '170.00', '14.5734561', '121.1239196', '14.5738307', '121.1101544', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(57, 'iCHd3FXPhm', 0, 303, 'Youngstown Avenue, Cainta, Rizal, Philippines', 'dnd', 'Abhilash Patha', '+919803480218', 'Youngstown Avenue, Cainta, Rizal, Philippines', 'ejd', 'Abhinav New Number', '+917307647454', 'later', '09/11/2021 12:26', NULL, NULL, NULL, NULL, 2, '200', '', '0', 'itemphoto613b01e2e2599-ProductImage_Kr1nq.jpg', 'Later', 'Personal', '', '', '200.00', '14.5795936', '121.1206532', '14.5795936', '121.1206532', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(58, 'BEgehtLaRH', 5, 298, 'Phase-2 Gautam Buddh Nagar 201305 Noida India', 'jdsjsjsn', 'djdjddj', '9594646499894', 'D-9 Gautam Buddh Nagar Noida India 201304', 'brjdidjdjk', 'A4 Security', '+919599825552', 'asap', '09/10/2021 13:01', NULL, NULL, NULL, NULL, 1, '250', '', '0', 'itemphoto613b0a2702654-ProductImage_JKsks.jpg', 'ASAP', 'Personal', '', '', '250.00', '28.535549', '77.412893', '28.5160459', '77.3968677', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(59, 'sHS0GgsiXX', 5, 298, 'Phase-2 Gautam Buddh Nagar 201305 Noida India', 'jdsjsjsn', 'djdjddj', '9594646499894', 'D-9 Gautam Buddh Nagar Noida India 201304', 'brjdidjdjk', 'A4 Security', '+919599825552', 'asap', '09/10/2021 13:01', NULL, NULL, NULL, NULL, 1, '250', '', '0', 'itemphoto613b0a5219417-ProductImage_2DY2d.jpg', 'ASAP', 'Personal', '', '', '250.00', '28.535549', '77.412893', '28.5160459', '77.3968677', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(60, '1', 0, 298, 'Phase-2 Gautam Buddh Nagar 201305 Noida India', 'jdsjsjsn', 'djdjddj', '9594646499894', 'Manila North Cemetery, Cavite St, Santa Cruz, Manila, Metro Manila, Philippines', 'jrjdksksk', 'A4 Security', '+919599825552', 'asap', '09/10/2021 13:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28.535549', '77.412893', '14.6315086', '120.9890749', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(61, 'tanbxNe9ik', 5, 298, 'Phase-2 Gautam Buddh Nagar 201305 Noida India', 'jdsjsjsn', 'djdjddj', '9594646499894', 'Manila North Cemetery, Cavite St, Santa Cruz, Manila, Metro Manila, Philippines', 'jrjdksksk', 'A4 Security', '+919599825552', 'asap', '09/10/2021 13:01', NULL, NULL, NULL, NULL, 1, '236750', '', '0', 'itemphoto613b0b3e26fc8-ProductImage_fQ740.jpg', 'ASAP', 'Personal', '', '', '236750.00', '28.535549', '77.412893', '14.6315086', '120.9890749', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(62, '1', 0, 298, 'Phase-2 Gautam Buddh Nagar 201305 Noida India', 'jdsjsjsn', 'djdjddj', '9594646499894', 'Santa Cruz   Manila Philippines', 'jrjdksksk', 'A4 Security', '+919599825552', 'asap', '09/10/2021 13:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28.535549', '77.412893', '14.5993661', '120.9802968', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(63, 'ooITdPwqDe', 5, 298, 'Manila North Cemetery, Cavite St, Santa Cruz, Manila, Metro Manila, Philippines', 'jdjdjsjsj', 'hdjdjddkk', '6564949464646', 'La Loma   Quezon City Philippines', 'ndjdjejej', 'ndjdjdjdj', '9565676469494', 'asap', '09/10/2021 13:11', NULL, NULL, NULL, NULL, 1, '170', '', '0', 'itemphoto613b0e063bbf9-ProductImage_H20Mu.jpg', 'ASAP', 'Personal', '', '', '170.00', '14.6315086', '120.9890749', '14.6300714', '120.9956064', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(64, 'i4614czMh1', 5, 298, 'D-9 Gautam Buddh Nagar Noida India 201304', 'jrjejej', 'rjdjdjdk', '2626495949564', 'Phase-2 Gautam Buddh Nagar 201305 Noida India', 'jdjsjsks', 'ndjdjdjs', '9594646434346', 'asap', '09/10/2021 13:21', NULL, NULL, NULL, NULL, 1, '270', '', '0', 'itemphoto613b0ed90f0cd-ProductImage_4tSxK.jpg', 'ASAP', 'Personal', '', '', '270.00', '28.5160459', '77.3968677', '28.535549', '77.412893', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(65, '1', 0, 298, 'D-9 Gautam Buddh Nagar Noida India 201304', 'jrjejej', 'rjdjdjdk', '2626495949564', 'Phase-2 Gautam Buddh Nagar 201305 Noida India', 'jdjsjsks', 'ndjdjdjs', '9594646434346', 'asap', '09/10/2021 13:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28.5160459', '77.3968677', '28.535549', '77.412893', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(66, '1', 0, 298, 'D-9 Gautam Buddh Nagar Noida India 201304', 'jrjejej', 'rjdjdjdk', '2626495949564', 'Phase-2 Gautam Buddh Nagar 201305 Noida India', 'jdjdjeje', 'ndjdjdjs', '9594646434346', 'asap', '09/10/2021 13:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28.5160459', '77.3968677', '28.535549', '77.412893', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(67, 'PbZf6DNthd', 5, 292, 'Beta II Gautam Buddh Nagar 201308 Greater Noida India', 'testhjgf gdf', 'testrdfgh', '1234567890', 'Beta II Gautam Buddh Nagar 201308 Greater Noida India', 'webs', 'shresht', '0879654123', 'asap', '09-10-2021 13:58', NULL, NULL, NULL, NULL, 5, '500', '', '0', 'itemphoto613b17bfadd4b-ProductImage_e7L8P.jpg', 'ASAP', 'Personal', '', '', '500.00', '28.4814686', '77.5135471', '28.4815195', '77.5135475', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(68, '1', 0, 298, 'D-9 Gautam Buddh Nagar Noida India 201304', 'jrjejej', 'rjdjdjdk', '2626495949564', 'Phase-2 Gautam Buddh Nagar 201305 Noida India', 'jdjdjeje', 'ndjdjdjs', '9594646434346', 'asap', '09/10/2021 13:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28.5160459', '77.3968677', '28.535549', '77.412893', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(69, '1', 0, 316, 'Noida\'s Catering Services, Oro Vista Subdivision, Ephesians Street, Marikina, Metro Manila, Philippines', 'quiopo market', 'Akash', '8882341937', '1800 Marikina Philippines', 'salcedo Saturday markets', 'Akash', '8882341937', 'asap', '09/10/2021 16:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '14.6431893', '121.1101891', '14.5601227', '121.0234356', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(70, 'BOBj9Knhc7', 5, 316, 'Noida\'s Catering Services, Oro Vista Subdivision, Ephesians Street, Marikina, Metro Manila, Philippines', 'quiopo market', 'Akash', '8882341937', '1800 Marikina Philippines', 'salcedo Saturday markets', 'Akash', '8882341937', 'asap', '09/10/2021 16:11', NULL, NULL, NULL, NULL, 9, '6700', 'Test', '10', 'itemphoto613b3a10472c9-ProductImage_votYR.jpg', 'ASAP', 'Personal', '', '', '6700.00', '14.6431893', '121.1101891', '14.5601227', '121.0234356', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(71, 't8Vl0IEAx5', 5, 316, 'Philippine Arena, Santa Maria, Bulacan, Philippines', 'Legazpi Sunday market', 'Akash Sharma', '8882341937', 'Bulacan  Santa Maria Philippines', 'sm market', 'Akash', '8882341937', 'asap', '09/10/2021 16:36', NULL, NULL, NULL, NULL, 1, '270', 'eetyuuioklllllllllihhtttyyuuujjjjjjjjjkoppppppppppppppppppppppooooooooooooooooooooooookkkmbvbbjkkllllllllfggg', '10', 'itemphoto613b3d76adfb8-ProductImage_uBlv9.jpg', 'ASAP', 'Corporate', '', '', '270.00', '14.7938922', '120.953604', '14.822116', '120.961517', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(72, '1', 0, 292, 'Manila North Cemetery, Cavite St, Santa Cruz, Manila, Metro Manila, Philippines', 'heejejsij', 'jfndjejdje', '595956464949', 'Santa Cruz   Manila Philippines', 'bdjsjsjebw', 'fndjdjdj', '955946464664', 'asap', '09/10/2021 17:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '14.6315086', '120.9890749', '14.5993661', '120.9802968', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(73, '2KSaVR6rHU', 5, 292, 'D-8 Gautam Buddh Nagar Noida India 201304', 'nrjeiej', 'jdjdisj', '6264646464', 'D-8 Gautam Buddh Nagar Noida India 201304', 'heieiejej', 'brjejdeii', '95946434346', 'asap', '09/10/2021 17:27', NULL, NULL, NULL, NULL, 1, '100', '', '0', 'itemphoto613b484ab9d57-ProductImage_xUi6f.jpg', 'ASAP', 'Personal', '', '', '100.00', '28.5160459', '77.3968677', '28.5160459', '77.3968677', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(74, 'm6GNAvP6D6', 5, 303, 'Santa Clara County 94041 Mountain View United States', 'dbxdf', 'Aadesh Mishra', '07508516040', 'Santa Clara County 94043 Mountain View United States', 'btfd', 'Abhinaw Mca Lpu', '7508224247', 'asap', '09/10/2021 18:20', NULL, NULL, NULL, NULL, 1, '210', '', '0', 'itemphoto613b5528bf704-ProductImage_VdPp3.jpg', 'ASAP', 'Personal', '', '', '210.00', '37.386812', '-122.0751549', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(75, 'BAnLdxb3Jh', 5, 303, 'Justice Jose Abad Santos General Hospital, Numancia Street, Binondo, Manila, Metro Manila, Philippines', 'fb', 'Aadesh Mishra', '07508516040', 'Port Area  1018 Manila Philippines', 'dfb df', 'Abhinaw Mca Lpu', '7508224247', 'asap', '09/10/2021 19:06', NULL, NULL, NULL, NULL, 1, '170', '', '0', 'itemphoto613b5fa47a445-ProductImage_laaFM.jpg', 'ASAP', 'Personal', '', '', '170.00', '14.597597', '120.97194', '14.5867607', '120.9683176', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(76, '1', 0, 298, 'D-8 Gautam Buddh Nagar Noida India 201304', 'djdjdn', 'djfjdjxj', '5956873959495', 'D-8 Gautam Buddh Nagar Noida India 201304', 'djsnsnsjj', 'bdjsjzjzn', '5976767949494', 'asap', '09/10/2021 21:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28.5160459', '77.3968677', '28.5160459', '77.3968677', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(77, 'qQzXQTvQ7C', 5, 303, '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines', 'dfbgd', 'Abhay Lpu Noida', '+919560386426', '1600 Santa Clara Street, Pasig, Metro Manila, Philippines', 'gbf', 'Abhinav New Number', '+917307647454', 'asap', '09/10/2021 21:13', NULL, NULL, NULL, NULL, 1, '9720', '', '0', 'itemphoto613b7e42171b3-ProductImage_ORQm1.jpg', 'ASAP', 'Personal', '', '', '9720.00', '16.2955033', '121.0350167', '14.5669706', '121.0585746', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(78, 'mokODQt3Pa', 5, 303, '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines', 'bfbd', 'Aadesh Mishra', '07508516040', '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines', 'fged', 'Abhinav New Number', '+917307647454', 'asap', '09/10/2021 21:58', NULL, NULL, NULL, NULL, 1, '120', '', '0', 'itemphoto613b87d3c128c-ProductImage_M0gEw.jpg', 'ASAP', 'Personal', '', '', '120.00', '16.2955033', '121.0350167', '16.2955033', '121.0350167', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(79, 'IPQQmYY3Ss', 5, 304, '1976  Makati Philippines 1233', '1976 Capt. M. Reyes, Makati, Metro Manila, Philippines', 'Robert', '09159851768', '1230 Makati Philippines', '', 'Juan', '09124563111', 'asap', '09/11/2021 07:48', NULL, NULL, NULL, NULL, 1, '210', '', '0', 'itemphoto613bef2ef253b-ProductImage_X1z21.jpg', 'ASAP', 'Personal', '', '', '210.00', '14.5448544', '121.0101673', '14.554729', '121.0244452', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(80, 'ivkbMdNbqm', 5, 303, 'Albay  Guinobatan Philippines', 'vjjk', 'Abhinav New Number', '+917307647454', 'Guinobatan, Albay, Philippines', 'hjk', 'Abhinaw Mca Lpu', '7508224247', 'asap', '09/11/2021 08:25', NULL, NULL, NULL, NULL, 1, '120', '', '0', 'itemphoto613c1af28d6e2-ProductImage_qkEzB.jpg', 'ASAP', 'Personal', '', '', '120.00', '13.189288', '123.604723', '13.189288', '123.604723', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(81, '0baPHHemlj', 5, 305, '702  Caloocan Philippines 1400', 'Discord.io/badmancity', 'test', '091598291795', 'SM Marikina, Marikina, Metro Manila, Philippines', 'test', 'test', '09158291795', 'asap', '09/11/2021 11:46', NULL, NULL, NULL, NULL, 1, '870', '', '40', 'itemphoto613c273ca0fe5-ProductImage_KJnaH.jpg', 'ASAP', 'Personal', '', '', '870.00', '14.7565784', '121.0449768', '14.6260403', '121.0837833', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(82, '4WclC2SjQ8', 5, 305, '702  Caloocan Philippines 1400', 'test', 'test', '1234567890', '702  Caloocan Philippines 1400', 'jahwhs', 'hhshah', '1234567890', 'asap', '09/11/2021 11:54', NULL, NULL, NULL, NULL, 1, '100', '', '0', 'itemphoto613c28c8f14fa-ProductImage_z7YPk.jpg', 'ASAP', 'Personal', '', '', '100.00', '14.7565784', '121.0449768', '14.7565784', '121.0449768', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(83, '1', 0, 305, '702  Caloocan Philippines 1400', 'test', 'test', '1234567890', '702  Caloocan Philippines 1400', 'jahwhs', 'hhshah', '1234567890', 'asap', '09/11/2021 11:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '14.7565784', '121.0449768', '14.7565784', '121.0449768', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(84, 'vyOoP1vyQn', 5, 304, '1976  Makati Philippines 1233', '', 'Robert', '09159851768', '1976  Makati Philippines 1233', '', 'Juan', '+639159851768', 'asap', '09/11/2021 17:44', NULL, NULL, NULL, NULL, 1, '120', '', '0', 'itemphoto613c7b089c6fd-ProductImage_3a4DU.jpg', 'ASAP', 'Personal', '', '', '120.00', '14.554729', '121.0244452', '14.554729', '121.0244452', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(85, '1', 0, 298, 'D-8 Gautam Buddh Nagar Noida India 201304', 'nejdissisj', 'ndjsjsiddj', '9565646449', 'D-8 Gautam Buddh Nagar Noida India 201304', 'hdidisjen', 'nrndjssisi', '959594643434', 'asap', '09/11/2021 16:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28.5160459', '77.3968677', '28.5160459', '77.3968677', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(86, 'ZZGYeIQHfY', 5, 304, '3678a  Makati Philippines', '', 'Robert', '09159851768', '1233 Makati Philippines', '1976 Capt. M. Reyes, Makati, Metro Manila, Philippines', 'Juan', '09346112345', 'asap', '09/12/2021 08:55', NULL, NULL, NULL, NULL, 1, '210', '', '40', 'itemphoto613d5138abc41-ProductImage_XEQTw.jpg', 'ASAP', 'Personal', '', '', '210.00', '14.554729', '121.0244452', '14.5448544', '121.0101673', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(87, '1', 0, 298, 'Manila Cathedral, Cabildo Street, Intramuros, Manila, Metro Manila, Philippines', 'hdshsh', 'nxjsjsj', '656567665646', 'Manila Cathedral, Cabildo Street, Intramuros, Manila, Metro Manila, Philippines', 'jfjdjsjs', 'hdhdjdjddj', '56767649467', 'asap', '09/12/2021 19:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '14.5916543', '120.9734594', '14.5916543', '120.9734594', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(88, '1', 0, 298, 'Manila Cathedral, Cabildo Street, Intramuros, Manila, Metro Manila, Philippines', 'hdhsjsjsn', 'nxjsjsj', '656567665646', 'Manila Cathedral, Cabildo Street, Intramuros, Manila, Metro Manila, Philippines', 'jfjdjsjs', 'hdhdjdjddj', '56767649467', 'asap', '09/12/2021 19:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '14.5916543', '120.9734594', '14.5916543', '120.9734594', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(92, '1', 0, 298, 'Sector 11 East Delhi 201301 Noida India', 'gfdfd', 'johnd', '8585828582', 'Sector 11 East Delhi 201301 Noida India', 'ddd', 'ddcxdd', '885288877888', 'asap', '09/12/2021 22:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28.5967528', '77.3304576', '28.598843', '77.343635', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(93, 'BIGt3Qgsnc', 5, 303, '1600 Santa Clara County Mountain View United States 94043', 'dbfxdfg', 'john', '5252552555555', '1600 Santa Clara County Mountain View United States 94043', 'ddbtd', 'vive', '34443434343', 'asap', '09/12/2021 22:37', NULL, NULL, NULL, NULL, 1, '150', '', '0', 'itemphoto613e34b6dfa80-ProductImage_Bjolx.jpg', 'ASAP', 'Personal', '', '', '150.00', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(94, '1', 0, 298, 'Sector 11 East Delhi 201301 Noida India', 'gfdfd', 'johnd', '8585828582', 'Sector 11 East Delhi 201301 Noida India', 'ddd', 'ddcxdd', '885288877888', 'asap', '09/12/2021 22:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28.5967528', '77.3304576', '28.598843', '77.343635', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(95, 'VEIuYb8VaJ', 5, 303, '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', 'asap', '09/13/2021 14:54', NULL, NULL, NULL, NULL, 1, '150', '', '120', 'itemphoto613f1b1e741bd-ProductImage_WMukk.jpg', 'ASAP', 'Personal', '', '', '150.00', '16.2955033', '121.0350167', '16.2955033', '121.0350167', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(96, 'ZZQYX501Oq', 5, 303, '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', 'asap', '09/13/2021 15:28', NULL, NULL, NULL, NULL, 4, '450', '', '35', 'itemphoto613f21690c1b3-ProductImage_CI3w7.jpg', 'ASAP', 'Personal', '', '', '450.00', '16.2955033', '121.0350167', '16.2955033', '121.0350167', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(97, 'wza7xv1g0T', 5, 303, '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', 'asap', '09/13/2021 15:59', NULL, NULL, NULL, NULL, 1, '130', '', '80', 'itemphoto613f2872a5b1f-ProductImage_NWGJR.jpg', 'ASAP', 'Personal', '', '', '130.00', '16.2955033', '121.0350167', '16.2955033', '121.0350167', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(98, 'cT5chNifVJ', 5, 303, '1600 Iriga, Makati, Metro Manila, Philippines', 'bdf', 'vivek', '7837459544', '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', 'asap', '09/15/2021 14:22', NULL, NULL, NULL, NULL, 1, '9730', '', '0', 'itemphoto6141b478eeae1-ProductImage_oulDJ.jpg', 'ASAP', 'Personal', '', '', '9730.00', '14.568573', '121.02166', '16.2955033', '121.0350167', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(99, 'WBVI70T6MP', 5, 303, 'Philippine Arena, Santa Maria, Bulacan, Philippines', 'dfgdf', 'Aadesh Mishra', '07508516040', '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', 'asap', '09/15/2021 14:30', NULL, NULL, NULL, NULL, 1, '8470', '', '0', 'itemphoto6141b654442fb-ProductImage_b3xOf.jpg', 'ASAP', 'Personal', '', '', '8470.00', '14.7938922', '120.953604', '16.2955033', '121.0350167', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(100, 'TyR2BphJSe', 5, 303, '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', 'asap', '09/15/2021 18:00', NULL, NULL, NULL, NULL, 1, '120', '', '30', 'itemphoto6141e77784801-ProductImage_Ug9td.jpg', 'ASAP', 'Personal', '', '', '120.00', '16.2955033', '121.0350167', '16.2955033', '121.0350167', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(101, 'vbQwrCQeMB', 5, 303, '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', 'Rizal  Tanay Philippines gt Tanay  Work', 'gt', 'brtgbr fbt', '487784784847', 'asap', '09/15/2021 19:37', NULL, NULL, NULL, NULL, 1, '9420', '', '30', 'itemphoto6141fe6de5de2-ProductImage_tzwg6.jpg', 'ASAP', 'Personal', '', '', '9420.00', '16.2955033', '121.0350167', '14.6429193', '121.3246685', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(102, 'kCY0rYykqV', 5, 303, '1600 Iriga, Makati, Metro Manila, Philippines', 'bdf', 'vivek', '7837459544', '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', 'asap', '09/15/2021 21:09', NULL, NULL, NULL, NULL, 1, '9740', '', '30', 'itemphoto61421408a9447-ProductImage_MPQB5.jpg', 'ASAP', 'Personal', '', '', '9740.00', '14.568573', '121.02166', '16.2955033', '121.0350167', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(103, '1', 0, 298, 'Dhawalgiri Apartments East Delhi Noida India 201301', 'hreejj', 'ndjdjdj', '9564649494346', 'Dhawalgiri Apartments East Delhi Noida India 201301', 'bdjsjsjs', 'bdjdjdjs', '9564646464645', 'asap', '09/15/2021 22:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28.602043', '77.339001', '28.602043', '77.339001', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(104, 'w9XooFXZLz', 5, 303, '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', 'asap', '09/15/2021 22:10', NULL, NULL, NULL, NULL, 1, '120', '', '10', 'itemphoto614221fbd7a7a-ProductImage_IQ4a5.jpg', 'ASAP', 'Personal', '', '', '120.00', '16.2955033', '121.0350167', '16.2955033', '121.0350167', NULL, NULL, NULL, 'Wallet', '4', '2021-09-06 14:20:22', '2021-09-21 16:17:51'),
(105, '1', 0, 298, 'Dhawalgiri Apartments East Delhi Noida India 201301', 'jdjdjsjen', 'brjdjden11', '9946434665656', 'Buddh Vihar Gautam Buddh Nagar 201301 Noida India', 'jrisjsjsjs', 'uvsbsjsjs', '946434649464', 'later', '09/15/2021 22:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28.602043', '77.339001', '28.5821195', '77.3266991', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(106, 'cUsSEzX8kD', 5, 325, '23M9+5GF Palamu Daltonganj India 822101', 'daltonganj', 'ggghh', '5555555555', '23M9+5GF Palamu Daltonganj India 822101', 'daltonganj', 'fhhh', '8988888888', 'asap', '09/15/2021 22:22', NULL, NULL, NULL, NULL, 1, '110', '', '0', 'itemphoto614225094e599-ProductImage_Sx4G6.jpg', 'ASAP', 'Personal', '', '', '110.00', '24.0329375', '84.0687969', '24.0329375', '84.0687969', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19');
INSERT INTO `durapickupshedule` (`id`, `order_no`, `driver_id`, `user_id`, `pickup_address1`, `pickup_address2`, `pickup_name`, `pickup_mobile`, `destination_address1`, `destination_address2`, `destination_name`, `destination_mobile`, `type`, `pdate`, `stop_address1`, `stop_address2`, `stop_name`, `stop_mobile`, `vehicle_id`, `price`, `drivernote`, `tip`, `itemphoto`, `itemtype`, `acctype`, `coupon`, `discount`, `finalprice`, `pickuplat`, `pickuplon`, `destinationlat`, `destinationlon`, `stopData`, `stoplat`, `stoplon`, `paymentmode`, `status`, `created_at`, `updated_at`) VALUES
(107, '1', 0, 298, 'Dhawalgiri Apartments East Delhi Noida India 201301', 'jdjdjsjen', 'brjdjden11', '9946434665656', 'Buddh Vihar Gautam Buddh Nagar 201301 Noida India', 'jrisjsjsjs', 'uvsbsjsjs', '946434649464', 'asap', '09/15/2021 22:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28.602043', '77.339001', '28.5821195', '77.3266991', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(108, 'Z6UZdPiKfr', 5, 325, '23M9+5GF Palamu Daltonganj India 822101', 'daltonganj', 'ggghh', '5555555555', '23M9+5GF Palamu Daltonganj India 822101', 'daltonganj', 'fhhh', '8988888888', 'asap', '09/15/2021 22:24', NULL, NULL, NULL, NULL, 1, '100', '', '0', 'itemphoto6142257ed7e34-ProductImage_l6Gpq.jpg', 'ASAP', 'Personal', '', '', '100.00', '24.0329375', '84.0687969', '24.0329375', '84.0687969', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(109, '1', 0, 298, 'Dhawalgiri Apartments East Delhi Noida India 201301', 'ndjdjdj', 'ndndjdjd', '959464646434', 'Buddh Vihar East Delhi 110096 Delhi India', 'jdidnenej', 'bdjsjsjs', '959767346494', 'asap', '09/15/2021 22:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28.602043', '77.339001', '28.6071721', '77.3207755', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(110, '1', 0, 298, 'Dhawalgiri Apartments East Delhi Noida India 201301', 'hrjsen', 'ndjddjsj', '959464469794', 'Dhawalgiri Apartments East Delhi Noida India 201301', 'bdjsjsj', 'bdndjdj', '9594946.4346', 'asap', '09/15/2021 22:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28.602043', '77.339001', '28.602043', '77.339001', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(111, 'Xh8LHZVIVY', 5, 325, 'Belwatika Road Palamu Daltonganj India 822101', 'house no 1', 'Amit', '7979948924', 'Belwatika Palamu 822101 Daltonganj India', 'house 354', 'raj', '7979948924', 'asap', '09/15/2021 22:40', NULL, NULL, NULL, NULL, 1, '160', '', '10', 'itemphoto61422982bb80b-ProductImage_JFzZO.jpg', 'ASAP', 'Personal', '', '', '160.00', '24.0333053', '84.0686129', '24.0310142', '84.0735582', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(112, 'kf5m6hJxfH', 5, 325, 'Masbate  Milagros Philippines', 'house no2044', 'tester', '7979948924', 'Masbate  Cawayan Philippines', 'house no 3333', 'toko', '2566656555', 'asap', '09/15/2021 23:05', NULL, NULL, NULL, NULL, 2, '3410', '', '0', 'itemphoto61422f3a1e6c3-ProductImage_W4zV1.jpg', 'ASAP', 'Personal', '', '', '3410.00', '12.2446462', '123.5056016', '12.0557941', '123.7294198', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(113, 'RKnxmNnyYq', 5, 304, '1976  Makati Philippines 1233', '1976 Capt. M. Reyes, Makati, Metro Manila, Philippines', 'Robert', '09159851768', 'Corinthian Executive Regency Bldg. (Condominium), Corinthian Executive Regency, Ortigas Center, Pasig, Metro Manila, Philippines 2507 Corinthian Executive Regency Ortigas Center Pasig  Work', '2507 Corinthian Executive Regency Ortigas Center', 'Benjie Javier', '09081250030', 'asap', '09/16/2021 01:59', NULL, NULL, NULL, NULL, 1, '590', '', '0', 'itemphoto614234d3bc59c-ProductImage_oU6Sr.jpg', 'ASAP', 'Personal', '', '', '590.00', '14.5448544', '121.0101673', '14.5899269', '121.0616878', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(114, '1', 0, 298, 'Dhawalgiri Apartments East Delhi Noida India 201301', 'fdse', 'xdssed', '88444778525', 'Dhawalgiri Apartments East Delhi Noida India 201301', 'fzsedct', 'cfsdfd', '8554444444', 'asap', '09/15/2021 23:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28.602043', '77.339001', '28.602043', '77.339001', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(115, '3HGmTWsGzy', 5, 304, '1976  Makati Philippines 1233 1976 M Reyes Street Bangkal Makati  Home', '1976 M Reyes Street Bangkal', 'Robert', '09159851768', 'Corinthian Executive Regency Bldg. (Condominium), Corinthian Executive Regency, Ortigas Center, Pasig, Metro Manila, Philippines 2507 Corinthian Executive Regency Ortigas Center Pasig  Work', '2507 Corinthian Executive Regency Ortigas Center', 'Benjie Javier', '09081250030', 'asap', '09/16/2021 02:11', NULL, NULL, NULL, NULL, 1, '590', '', '20', 'itemphoto614237aa61631-ProductImage_2iP8q.jpg', 'ASAP', 'Personal', '', '', '590.00', '14.5448544', '121.0101673', '14.5899269', '121.0616878', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(116, 'DApg2esXOh', 5, 304, '1976  Makati Philippines 1233 1976 M Reyes Street Bangkal Makati  Home', '1976 M Reyes Street Bangkal', 'Robert', '09159851768', 'Corinthian Executive Regency Bldg. (Condominium), Corinthian Executive Regency, Ortigas Center, Pasig, Metro Manila, Philippines 2507 Corinthian Executive Regency Ortigas Center Pasig  Work', '2507 Corinthian Executive Regency Ortigas Center', 'Benjie Javier', '09081250030', 'asap', '09/16/2021 08:58', NULL, NULL, NULL, NULL, 1, '460', '', '0', 'itemphoto614296f8cf49c-ProductImage_H6a1W.jpg', 'ASAP', 'Personal', '', '', '460.00', '14.5448544', '121.0101673', '14.5899269', '121.0616878', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(117, 'YF1VTbqlcd', 5, 327, 'D-12 Gautam Buddh Nagar Noida India 201304', 'gghh', 'vvvv', '66666555855', 'D-12 Gautam Buddh Nagar Noida India 201304', 'vvvggg', 'vvvvg', '5888888888', 'asap', '09/16/2021 17:29', NULL, NULL, NULL, NULL, 1, '120', '', '10', 'itemphoto6143320273533-ProductImage_lLXJI.jpg', 'ASAP', 'Personal', '', '', '120.00', '28.5160459', '77.3968677', '28.5160459', '77.3968677', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(129, 'mrxbjItsdv', 5, 303, '1600 Santa Clara County Mountain View United States 94043', '', 'Aakash Newartchtech', '+9195321520', '1600 Santa Clara County Mountain View United States 94043', 'rgdg', 'Aakash Newartchtech', '+9195321520', 'asap', '09/16/2021 20:03', NULL, NULL, NULL, NULL, 1, '220', '', '40', 'itemphoto614356044ae63-ProductImage_iISGP.jpg', 'ASAP', 'Personal', '', '', '220.00', '37.4220656', '-122.0840897', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(130, '9PyYuMdbbH', 5, 303, '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', 'asap', '09/16/2021 20:07', NULL, NULL, NULL, NULL, 1, '240', '', '40', 'itemphoto614356ccc8d0d-ProductImage_jkZo3.jpg', 'ASAP', 'Personal', '', '', '240.00', '16.2955033', '121.0350167', '16.2955033', '121.0350167', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(131, 'wAKnwUGAfy', 5, 303, '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', 'asap', '09/16/2021 20:24', NULL, NULL, NULL, NULL, 1, '240', '', '30', 'itemphoto61435ad2027c6-ProductImage_dbdxT.jpg', 'ASAP', 'Personal', '', '', '240.00', '16.2955033', '121.0350167', '16.2955033', '121.0350167', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(132, 'WkcPvOSKfX', 5, 303, '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', 'asap', '09/16/2021 20:31', NULL, NULL, NULL, NULL, 1, '240', '', '40', 'itemphoto61435c9d58f6f-ProductImage_gUAYD.jpg', 'ASAP', 'Personal', '', '', '240.00', '16.2955033', '121.0350167', '16.2955033', '121.0350167', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(133, 'M3Et91zWZT', 5, 303, '1600 Santa Clara County Mountain View United States 94043', '', 'Aadesh Mishra', '07508516040', '1600 Santa Clara County Mountain View United States 94043', '', 'Aadesh Mishra', '07508516040', 'asap', '09/16/2021 20:45', NULL, NULL, NULL, NULL, 1, '240', '', '40', 'itemphoto61435f9d64dbf-ProductImage_HUnvv.jpg', 'ASAP', 'Personal', '', '', '280.00', '37.4220656', '-122.0840897', '37.4220656', '-122.0840897', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(134, 'cw91ZgAnqb', 5, 303, '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', 'asap', '09/16/2021 20:47', NULL, NULL, NULL, NULL, 1, '240', '', '40', 'itemphoto6143605e4be2a-ProductImage_A3eHD.jpg', 'ASAP', 'Personal', '', '', '280.00', '16.2955033', '121.0350167', '16.2955033', '121.0350167', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(135, '7mZTQNj1cV', 5, 304, '1976  Makati Philippines 1233 1976 M Reyes Street Bangkal Makati  Home', '1976 M Reyes Street Bangkal', 'Robert', '09159851768', 'Corinthian Executive Regency Bldg. (Condominium), Corinthian Executive Regency, Ortigas Center, Pasig, Metro Manila, Philippines 2507 Corinthian Executive Regency Ortigas Center Pasig  Work', '2507 Corinthian Executive Regency Ortigas Center', 'Benjie Javier', '09081250030', 'asap', '09/17/2021 14:39', NULL, NULL, NULL, NULL, 1, '460', '', '0', 'itemphoto6144385bc3213-ProductImage_32W0d.jpg', 'ASAP', 'Personal', '', '', '460.00', '14.5448544', '121.0101673', '14.5899269', '121.0616878', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(136, 'P0VRPpCFQr', 5, 303, '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', 'asap', '09/17/2021 12:46', NULL, NULL, NULL, NULL, 1, '240', '', '30', 'itemphoto614441126f9da-ProductImage_wWZJ9.jpg', 'ASAP', 'Personal', '', '', '270.00', '16.2955033', '121.0350167', '16.2955033', '121.0350167', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(137, 'Qcdu6wcmAJ', 0, 303, '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', 'later', '09/18/2021 14:43', NULL, NULL, NULL, NULL, 1, '120', '', '200', 'itemphoto61445ce8256cc-ProductImage_uuus6.jpg', 'Later', 'Personal', '', '', '320.00', '16.2955033', '121.0350167', '16.2955033', '121.0350167', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(138, 'TMmZqyKSYQ', 5, 304, '1976  Makati Philippines 1233 1976 M Reyes Street Bangkal Makati  Home', '1976 M Reyes Street Bangkal', 'Robert', '09159851768', 'Corinthian Executive Regency Bldg. (Condominium), Corinthian Executive Regency, Ortigas Center, Pasig, Metro Manila, Philippines 2507 Corinthian Executive Regency Ortigas Center Pasig  Work', '2507 Corinthian Executive Regency Ortigas Center', 'Benjie Javier', '09081250030', 'asap', '09/17/2021 22:21', NULL, NULL, NULL, NULL, 5, '2250', '', '0', 'itemphoto6144a4fad6a56-ProductImage_P8yWZ.jpg', 'ASAP', 'Personal', '', '', '2250.00', '14.5448544', '121.0101673', '14.5899269', '121.0616878', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(139, '1', 0, 325, '1600 Santa Clara County Mountain View United States 94043', 'fgggggg', 'gggggg', '88888888888', '1600 Santa Clara County Mountain View United States 94043', 'fffff', 'ccccgg', '888855555555', 'asap', '09/17/2021 20:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(140, '1', 0, 325, '1600 Santa Clara County Mountain View United States 94043', 'fgggggg', 'gggggg', '88888888888', '1600 Santa Clara County Mountain View United States 94043', 'fffff', 'ccccgg', '888855555555', 'asap', '09/17/2021 20:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(141, '3suuF9jTXE', 5, 303, '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', 'asap', '09/17/2021 20:41', NULL, NULL, NULL, NULL, 1, '240', '', '30', 'itemphoto6144b04da4406-ProductImage_xbWg5.jpg', 'ASAP', 'Personal', '', '', '270.00', '16.2955033', '121.0350167', '16.2955033', '121.0350167', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(142, '1', 0, 325, '1600 Santa Clara County Mountain View United States 94043', 'fff', 'fffff', '55555555555', '1600 Santa Clara County Mountain View United States 94043', 'rfgnjjjjj', 'fggggggg', '88888888888', 'asap', '09/17/2021 20:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(143, '1', 0, 325, '1600 Santa Clara County Mountain View United States 94043', 'fff', 'fffff', '55555555555', '1600 Santa Clara County Mountain View United States 94043', 'rfgnjjjjj', 'fggggggg', '88888888888', 'asap', '09/17/2021 20:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(144, 'rQOy5Kewjw', 5, 325, '1600 Santa Clara County Mountain View United States 94043', 'fff', 'fffff', '55555555555', '1600 Santa Clara County Mountain View United States 94043', 'rfgnjjjjj', 'fggggggg', '88888888888', 'asap', '09/17/2021 20:58', NULL, NULL, NULL, NULL, 1, '120', '', '0', 'itemphoto6144b4fad96c8-ProductImage_GqQCD.jpg', 'ASAP', 'Personal', '', '', '120.00', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(145, '1', 0, 325, '1600 Santa Clara County Mountain View United States 94043', 'cvvvv', 'vbbbv', '5555555555', '1600 Santa Clara County Mountain View United States 94043', 'ghhhhh', 'dfggg', '5555555555', 'asap', '09/17/2021 21:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(146, 'WZS25LH2M9', 5, 325, '1600 Santa Clara County Mountain View United States 94043', 'cvvvv', 'vbbbv', '5555555555', '1600 Santa Clara County Mountain View United States 94043', 'ghhhhh', 'dfggg', '5555555555', 'asap', '09/17/2021 21:22', NULL, NULL, NULL, NULL, 2, '210', '', '0', 'itemphoto6144baa49aa9f-ProductImage_qZxrw.jpg', 'ASAP', 'Personal', '', '', '210.00', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(147, 'PCo1CTzpOd', 5, 326, '1600 Santa Clara County Mountain View United States 94043', 'fggg', 'gggg', '85555588855', '1600 Santa Clara County Mountain View United States 94043', 'tghhh', 'cvbbh', '5566666666666', 'asap', '09/17/2021 22:47', NULL, NULL, NULL, NULL, 1, '110', '', '0', 'itemphoto6144cdf536252-ProductImage_0qzPg.jpg', 'ASAP', 'Personal', '', '', '110.00', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(148, 'XPHrfhc2ti', 5, 303, '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', 'asap', '09/18/2021 10:27', NULL, NULL, NULL, NULL, 1, '120', '', '30', 'itemphoto614571fc9004b-ProductImage_EKWUJ.jpg', 'ASAP', 'Personal', '', '', '150.00', '16.2955033', '121.0350167', '16.2955033', '121.0350167', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(150, 'FHWaDjjZ3M', 5, 303, 'Veronia Mongue, Pasay, Metro Manila, Philippines street alinagar', 'street alinagar', 'Aadesh Mishra', '07508516040', 'Veronia Mongue, Pasay, Metro Manila, Philippines street alinagar', 'street alinagar', 'Aadesh Mishra', '07508516040', 'asap', '09/18/2021 14:24', NULL, NULL, NULL, NULL, 1, '140', '', '20', 'itemphoto6145aa3525f26-ProductImage_Dw9RT.jpg', 'ASAP', 'Personal', '', '', '160.00', '14.5510807', '121.0198897', '14.5510807', '121.0198897', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(151, 'cWCcw8Yxb7', 5, 303, 'Veronia Mongue, Pasay, Metro Manila, Philippines street alinagar', 'street alinagar', 'Aadesh Mishra', '07508516040', 'Veronia Mongue, Pasay, Metro Manila, Philippines street alinagar', 'street alinagar', 'Aadesh Mishra', '07508516040', 'asap', '09/18/2021 14:42', NULL, NULL, NULL, NULL, 1, '140', '', '30', 'itemphoto6145ad99c6e7b-ProductImage_nMA8d.jpg', 'ASAP', 'Personal', '', '', '170.00', '14.5510807', '121.0198897', '14.5510807', '121.0198897', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(152, '3BDONXqE2V', 5, 303, 'Veronia Mongue, Pasay, Metro Manila, Philippines street alinagar', 'street alinagar', 'Aadesh Mishra', '07508516040', 'Veronia Mongue, Pasay, Metro Manila, Philippines', 'street alinagar', 'Aadesh Mishra', '07508516040', 'asap', '09/18/2021 14:47', NULL, NULL, NULL, NULL, 2, '240', '', '30', 'itemphoto6145aeafe7ef5-ProductImage_xn0Yk.jpg', 'ASAP', 'Personal', '', '', '240.00', '14.5510807', '121.0198897', '14.5510807', '121.0198897', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(153, '8jnfklT2nk', 5, 303, 'Veronia Mongue, Pasay, Metro Manila, Philippines street alinagar', 'street alinagar', 'Aadesh Mishra', '07508516040', 'Verve Residences Tower 1, 26th Street, Taguig, Metro Manila, Philippines', 'street alinagar', 'Aadesh Mishra', '07508516040', 'asap', '09/18/2021 15:01', NULL, NULL, NULL, NULL, 2, '540', '', '20', 'itemphoto6145b23f0fb18-ProductImage_5N5JC.jpg', 'ASAP', 'Personal', '', '', '560.00', '14.5510807', '121.0198897', '14.5486631', '121.0493149', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(154, 'igyKXnYssK', 5, 303, 'Veronia Mongue, Pasay, Metro Manila, Philippines street alinagar', 'street alinagar', 'Aadesh Mishra', '07508516040', 'K-3rd, Diliman, Quezon City, Metro Manila, Philippines', 'street alinagar', 'Aadesh Mishra', '07508516040', 'asap', '09/18/2021 15:08', NULL, NULL, NULL, NULL, 1, '570', '', '0', 'itemphoto6145b3c419dfb-ProductImage_5Lyoq.jpg', 'ASAP', 'Personal', '', '', '570.00', '14.5510807', '121.0198897', '14.6276258', '121.0395526', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(155, 'AzxcFK48Xc', 5, 325, 'Pru  Adapdrase Ghana', 'gggg', 'hhhh', '55555555555555', '1600 Santa Clara County Mountain View United States 94043', 'ffgg', 'ffff', '5666666666', 'asap', '09/18/2021 15:55', NULL, NULL, NULL, NULL, 2, '1207810', '', '10', 'itemphoto6145bfae85429-ProductImage_pa7nO.jpg', 'ASAP', 'Personal', '', '', '1207820.00', '7.9505877', '-1.2566141', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(156, '3He26Gl9xD', 5, 325, '1600 Santa Clara County Mountain View United States 94043', 'cvvg', 'ggg', '855588888888', '1600 Santa Clara County Mountain View United States 94043', 'fgggg', 'fgggg', '55555555555', 'asap', '09/18/2021 16:05', NULL, NULL, NULL, NULL, 1, '110', '', '10', 'itemphoto6145c139956dc-ProductImage_pfbDt.jpg', 'ASAP', 'Personal', '', '', '110.00', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(157, 'FlJiuwBKu9', 5, 303, 'Veronia Mongue, Pasay, Metro Manila, Philippines street alinagar', 'street alinagar', 'Aadesh Mishra', '07508516040', 'V Corporate Center, L.P. Leviste Street, Makati, Metro Manila, Philippines', 'street alinagar', 'Aadesh Mishra', '07508516040', 'asap', '09/18/2021 16:12', NULL, NULL, NULL, NULL, 1, '170', '', '20', 'itemphoto6145c2cc1958d-ProductImage_ZCvxW.jpg', 'ASAP', 'Personal', '', '', '190.00', '14.5510807', '121.0198897', '14.560282', '121.024759', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(158, 'CvTOUU8hUg', 5, 303, 'Veronia Mongue, Pasay, Metro Manila, Philippines street alinagar', 'street alinagar', 'Aadesh Mishra', '07508516040', 'Nuvali, Santa Rosa - Tagaytay Road, Don Jose, Santa Rosa, Laguna, Philippines', 'street alinagar', 'Aadesh Mishra', '07508516040', 'asap', '09/18/2021 16:14', NULL, NULL, NULL, NULL, 1, '1870', '', '0', 'itemphoto6145c33815ccd-ProductImage_RtLTA.jpg', 'ASAP', 'Personal', '', '', '1870.00', '14.5510807', '121.0198897', '14.2348481', '121.0564932', NULL, NULL, NULL, 'Wallet', '2', '2021-09-06 14:20:22', '2021-09-21 15:17:00'),
(159, 'AtNUfVpziv', 5, 303, 'Veronia Mongue, Pasay, Metro Manila, Philippines street alinagar', 'street alinagar', 'Aadesh Mishra', '07508516040', 'Breeze Residences - Home Sweet Home, Lourdes, Pasay, Metro Manila, Philippines', 'street alinagar', 'Aadesh Mishra', '07508516040', 'asap', '09/18/2021 16:53', NULL, NULL, NULL, NULL, 1, '290', '', '20', 'itemphoto6145cc68bb4a3-ProductImage_NrzK4.jpg', 'ASAP', 'Personal', '', '', '310.00', '14.5510807', '121.0198897', '14.5554584', '120.9891949', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(160, 'OJmBG5oaPM', 5, 303, 'Veronia Mongue, Pasay, Metro Manila, Philippines street alinagar', 'street alinagar', 'Aadesh Mishra', '07508516040', 'Pr Palces Resort, Malilipot, Albay, Philippines', 'street alinagar', 'Aadesh Mishra', '07508516040', 'asap', '09/18/2021 18:10', NULL, NULL, NULL, NULL, 1, '16370', '', '30', 'itemphoto6145de523f168-ProductImage_JpRaH.jpg', 'ASAP', 'Personal', '', '', '16400.00', '14.5510807', '121.0198897', '13.3125462', '123.7470914', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(161, 'FKmDUJKvz0', 5, 325, '1600 Santa Clara County Mountain View United States 94043', 'egggg', 'hhhhhhh', '52222222222', '1600 Santa Clara County Mountain View United States 94043', 'fggg', 'fgggg', '5555222222', 'asap', '09/18/2021 19:55', NULL, NULL, NULL, NULL, 1, '210', '', '0', 'itemphoto6145f9707d5d6-ProductImage_3Z74n.jpg', 'ASAP', 'Personal', '', '', '210.00', '37.4220656', '-122.0840897', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(162, 'LDaRS3bifa', 5, 325, '1600 Santa Clara County Mountain View United States 94043', 'vhhh', 'vvbbbb', '0555555555', '1600 Santa Clara County Mountain View United States 94043', 'chhh', 'fhhh', '099999999888', 'asap', '09/18/2021 20:10', NULL, NULL, NULL, NULL, 2, '210', '', '0', 'itemphoto6145faab7d7eb-ProductImage_fHog7.jpg', 'ASAP', 'Personal', '', '', '210.00', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(163, '1', 0, 298, 'Dhawalgiri Apartments East Delhi Noida India 201301', 'fdd', 'dd', '87444444444', 'Dhawalgiri Apartments East Delhi Noida India 201301', 'fds', 'fdde', '54444455454', 'asap', '09/18/2021 21:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28.602043', '77.339001', '28.602043', '77.339001', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(164, '1', 0, 298, 'Dhawalgiri Apartments East Delhi Noida India 201301', 'fdd', 'dd', '87444444444', 'Dhawalgiri Apartments East Delhi Noida India 201301 50-b dhawalgiri appartments sec-11 noida', '50-b dhawalgiri appartments sec-11 noida', 'kashish', '9650936880', 'asap', '09/18/2021 22:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28.602043', '77.339001', '28.602043', '77.339001', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(165, 'BAca74rfql', 5, 325, 'tender heart\'s international school Palamu Daltonganj India 822101', 'fhgg', 'vhhhh', '66666669666699', 'tender heart\'s international school Palamu Daltonganj India 822101', 'ghhbb', 'ghhbbbb', '66666666666666', 'asap', '09/18/2021 22:13', NULL, NULL, NULL, NULL, 1, '110', '', '10', 'itemphoto614617706b98b-ProductImage_ULEXD.jpg', 'ASAP', 'Personal', '', '', '120.00', '24.03209', '84.0691507', '24.03209', '84.0691507', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(166, '1', 0, 325, 'Belwatika Road Palamu Daltonganj India 822101', 'ghhh', 'hhh', '5888888555888', 'Belwatika Road Palamu Daltonganj India 822101', 'ghhh', 'hhjjjj', '5566669666666', 'asap', '09/18/2021 22:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '24.0332188', '84.0640506', '24.0332188', '84.0640506', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(167, 'RR1gq6052i', 5, 325, 'Belwatika Road Palamu Daltonganj India 822101', 'ghhh', 'hhhjjjjj', '5888888555888', 'Belwatika Road Palamu Daltonganj India 822101', 'ghhh', 'hhjjjj', '5566669666666', 'asap', '09/18/2021 22:21', NULL, NULL, NULL, NULL, 2, '210', '', '10', 'itemphoto6146198a9bb58-ProductImage_3RrUj.jpg', 'ASAP', 'Personal', '', '', '220.00', '24.0332188', '84.0640506', '24.0332188', '84.0640506', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(168, 'Y4Uu6VgnQN', 5, 325, 'Belwatika Road Palamu Daltonganj India 822101', 'test', 'test', '09888888885', 'Palamu 822123  India', 'ttt', 'test', '08888888888', 'asap', '09/18/2021 22:36', NULL, NULL, NULL, NULL, 1, '910', '', '15', 'itemphoto61461ced3f4bb-ProductImage_bkmS9.jpg', 'ASAP', 'Personal', '', '', '925.00', '24.0310142', '84.0735582', '24.1515012', '84.1646163', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(169, '1', 0, 325, '1600 Santa Clara County Mountain View United States 94043', 'dfdfgfdgf', 'dfgdfgdfg', '3434343434343', '1600 Santa Clara County Mountain View United States 94043', 'dfvcxvcdvcxv', 'xvxvxcvcxv', '79379373973972', 'asap', '09/18/2021 23:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(170, 'j4Fwyh1EhJ', 5, 325, '1600 Santa Clara County Mountain View United States 94043', 'dfdfgfdgf', 'dfgdfgdfg', '3434343434343', '1600 Santa Clara County Mountain View United States 94043', 'dfvcxvcdvcxv', 'xvxvxcvcxv', '79379373973972', 'asap', '09/18/2021 23:50', NULL, NULL, NULL, NULL, 1, '110', '', '10', 'itemphoto61462e0357968-ProductImage_XKIDB.jpg', 'ASAP', 'Personal', '', '', '110.00', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(171, 'Y1eazTKiBZ', 5, 325, '1600 Santa Clara County Mountain View United States 94043', 'vjjj', 'yhhhhhhh', '745555555555', '1600 Santa Clara County Mountain View United States 94043', 'trgggggg', 'ccccvv', '0888888888888', 'asap', '09/19/2021 00:09', NULL, NULL, NULL, NULL, 1, '110', '', '0', 'itemphoto61463290e521f-ProductImage_pSl48.jpg', 'ASAP', 'Personal', '', '', '110.00', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(172, 'RlIHDngT3U', 5, 325, '1600 Santa Clara County Mountain View United States 94043', 'dfd', 'sdfdsf', '324234234324', '1600 Santa Clara County Mountain View United States 94043', 'sdfdsfdf', 'sfdsfdsf', '234234324324', 'asap', '09/19/2021 00:21', NULL, NULL, NULL, NULL, 1, '110', '', '0', 'itemphoto6146356e09cba-ProductImage_BVc44.jpg', 'ASAP', 'Personal', '', '', '110.00', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(173, 'GIor4upVUA', 5, 325, '1600 Santa Clara County Mountain View United States 94043', 'sdfdsf', 'sdfdsfdsf', '423423423432', '1600 Santa Clara County Mountain View United States 94043', 'sfsdfdsf', 'dsfdsfdsf', '4234234234', 'asap', '09/19/2021 00:29', NULL, NULL, NULL, NULL, 1, '110', '', '0', 'itemphoto614637436a071-ProductImage_FBiQZ.jpg', 'ASAP', 'Personal', '', '', '110.00', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(174, 'dZYba4XlP8', 5, 325, '1600 Santa Clara County Mountain View United States 94043', 'sdfdsf', '223423sdfsdf', '7234234234', '1600 Santa Clara County Mountain View United States 94043', 'sdfdsf', 'dsfsdfdsf', '234234234234', 'asap', '09/19/2021 00:32', NULL, NULL, NULL, NULL, 1, '110', '', '0', 'itemphoto614637efa71e6-ProductImage_VC22g.jpg', 'ASAP', 'Personal', '', '', '110.00', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(175, 'cupbpRZGve', 5, 325, '1600 Santa Clara County Mountain View United States 94043', 'dsfdsf', 'dsfsdf', '4234234234324', '1600 Santa Clara County Mountain View United States 94043', 'sdfsdfds', 'sdfdsfdsfdsf', '23423423432', 'asap', '09/19/2021 00:38', NULL, NULL, NULL, NULL, 1, '110', '', '0', 'itemphoto6146396755aea-ProductImage_9byaN.jpg', 'ASAP', 'Personal', '', '', '110.00', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(176, 'RAIXYXXEK2', 5, 325, '1600 Santa Clara County Mountain View United States 94043', 'asdasds', 'dsfdsf', '3333333333333', '1600 Santa Clara County Mountain View United States 94043', 'sfsdfsdfdsf', '432234324', '3333333333', 'asap', '09/19/2021 00:47', NULL, NULL, NULL, NULL, 1, '110', '', '0', 'itemphoto61463bcaa7a00-ProductImage_VmCzZ.jpg', 'ASAP', 'Personal', '', '', '110.00', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(177, '0qfeNBUv6Z', 5, 298, 'Dhawalgiri Apartments East Delhi Noida India 201301', 'higiviviv', 'jvivivib', '69393838383838', 'Sector 12 Gautam Buddh Nagar 201301 Noida India', 'ugufuguc', 'hcucuv', '68383838383838', 'asap', '09/19/2021 06:33', NULL, NULL, NULL, NULL, 3, '470', '', '10', 'itemphoto61468ca85edfb-ProductImage_i0w5r.jpg', 'ASAP', 'Personal', '', '', '480.00', '28.602043', '77.339001', '28.598843', '77.343635', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(178, '3kYrdXuqiA', 5, 298, 'Dhawalgiri Apartments East Delhi Noida India 201301', 'brbrh', 'hrjej', '999688668966', 'Dhawalgiri Apartments East Delhi Noida India 201301', 'hdjejej', 'benejj', '92929292929', 'asap', '09/19/2021 06:35', NULL, NULL, NULL, NULL, 3, '310', '', '0', 'itemphoto61468ce71ec92-ProductImage_xU6Ny.jpg', 'ASAP', 'Personal', '', '', '310.00', '28.602043', '77.339001', '28.602043', '77.339001', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(179, '7RNUBRyoxh', 5, 304, '1976  Makati Philippines 1233 1976 M Reyes Street Bangkal Makati  Home', '1976 M Reyes Street Bangkal', 'Robert', '09159851768', 'Corinthian Executive Regency Bldg. (Condominium), Corinthian Executive Regency, Ortigas Center, Pasig, Metro Manila, Philippines 2507 Corinthian Executive Regency Ortigas Center Pasig  Work', '2507 Corinthian Executive Regency Ortigas Center', 'Benjie Javier', '09081250030', 'asap', '09/19/2021 09:26', NULL, NULL, NULL, NULL, 1, '460', '', '0', 'itemphoto614691d5c3e48-ProductImage_Gqk3B.jpg', 'ASAP', 'Personal', '', '', '460.00', '14.5448544', '121.0101673', '14.5899269', '121.0616878', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(180, 'AMdRLe4Yts', 5, 304, '1976  Makati Philippines 1233 1976 M Reyes Street Bangkal Makati  Home', '1976 M Reyes Street Bangkal', 'Robert', '09159851768', 'Corinthian Executive Regency Bldg. (Condominium), Corinthian Executive Regency, Ortigas Center, Pasig, Metro Manila, Philippines 2507 Corinthian Executive Regency Ortigas Center Pasig  Work', '2507 Corinthian Executive Regency Ortigas Center', 'Benjie Javier', '09081250030', 'asap', '09/19/2021 09:28', NULL, NULL, NULL, NULL, 2, '1040', '', '0', 'itemphoto614692698468a-ProductImage_nv6Ir.jpg', 'ASAP', 'Personal', '', '', '1040.00', '14.5448544', '121.0101673', '14.5899269', '121.0616878', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(181, '1', 0, 304, '1976  Makati Philippines 1233 1976 M Reyes Street Bangkal Makati  Home', '1976 M Reyes Street Bangkal', 'Robert', '09159851768', 'Corinthian Executive Regency Bldg. (Condominium), Corinthian Executive Regency, Ortigas Center, Pasig, Metro Manila, Philippines 2507 Corinthian Executive Regency Ortigas Center Pasig  Work', '2507 Corinthian Executive Regency Ortigas Center', 'Benjie Javier', '09081250030', 'asap', '09/19/2021 10:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '14.5448544', '121.0101673', '14.5899269', '121.0616878', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(182, '1', 0, 304, '1976  Makati Philippines 1233 1976 M Reyes Street Bangkal Makati  Home', '1976 M Reyes Street Bangkal', 'Robert', '09159851768', 'Corinthian Executive Regency Bldg. (Condominium), Corinthian Executive Regency, Ortigas Center, Pasig, Metro Manila, Philippines 2507 Corinthian Executive Regency Ortigas Center Pasig  Work', '2507 Corinthian Executive Regency Ortigas Center', 'Benjie Javier', '09081250030', 'asap', '09/19/2021 10:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '14.5448544', '121.0101673', '14.5899269', '121.0616878', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(183, '1', 0, 304, '1976  Makati Philippines 1233 1976 M Reyes Street Bangkal Makati  Home', '1976 M Reyes Street Bangkal', 'Robert', '09159851768', 'Corinthian Executive Regency Bldg. (Condominium), Corinthian Executive Regency, Ortigas Center, Pasig, Metro Manila, Philippines 2507 Corinthian Executive Regency Ortigas Center Pasig  Work', '2507 Corinthian Executive Regency Ortigas Center', 'Benjie Javier', '09081250030', 'asap', '09/19/2021 10:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '14.5448544', '121.0101673', '14.5899269', '121.0616878', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(184, '1', 0, 304, '1976  Makati Philippines 1233 1976 M Reyes Street Bangkal Makati  Home', '1976 M Reyes Street Bangkal', 'Robert', '09159851768', 'Corinthian Executive Regency Bldg. (Condominium), Corinthian Executive Regency, Ortigas Center, Pasig, Metro Manila, Philippines 2507 Corinthian Executive Regency Ortigas Center Pasig  Work', '2507 Corinthian Executive Regency Ortigas Center', 'Benjie Javier', '09081250030', 'asap', '09/19/2021 10:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '14.5448544', '121.0101673', '14.5899269', '121.0616878', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(189, 'Wl07Ni3scM', 5, 303, 'Philippine Heart Center, Diliman, Quezon City, Metro Manila, Philippines', 'uvjvj', 'Aadesh Mishra', '07508516040', 'Santa Clara County 94022 Los Altos United States fbdfb fcc Los Altos  Home', 'fbdfb fcc', 'fgbgf 99999', '387383347874', 'asap', '09/19/2021 10:58', NULL, NULL, NULL, NULL, 1, '562470', '', '10', 'itemphoto6146cacd18c73-ProductImage_n93wE.jpg', 'ASAP', 'Personal', '', '', '562480.00', '14.6440237', '121.0481304', '37.3694009', '-122.1405413', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(190, 'BQDOt6N7CH', 5, 303, 'Philippine Arena, Santa Maria, Bulacan, Philippines', 'g ycy', 'Aadesh Mishra', '07508516040', 'Philippine Arena, Santa Maria, Bulacan, Philippines', 'yvyv', 'Abhay Mca Lpu', '9815089746', 'asap', '09/19/2021 11:17', NULL, NULL, NULL, NULL, 1, '140', '', '10', 'itemphoto6146cfc12bbf7-ProductImage_Mh4IM.jpg', 'ASAP', 'Personal', '', '', '150.00', '14.7938922', '120.953604', '14.7938922', '120.953604', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(191, 'KtLYMdMzNy', 5, 303, 'Philippine Orthopedic Center, Maria Clara Street, Santa Mesa Heights, Quezon City, Metro Manila, Philippines', 'cuvuvu', 'Aadesh Mishra', '07508516040', '21 C. Benitez Street, Quezon City, Metro Manila, Philippines', 'dfvfd', 'Aadesh Mishra', '07508516040', 'asap', '09/19/2021 11:51', NULL, NULL, NULL, NULL, 1, '370', '', '20', 'itemphoto6146d6f963e58-ProductImage_kaB99.jpg', 'ASAP', 'Personal', '', '', '390.00', '14.6280361', '121.0033881', '14.6114512', '121.0448013', NULL, NULL, NULL, 'Wallet', '4', '2021-09-06 14:20:22', '2021-09-21 15:16:33'),
(193, '1', 0, 298, 'pranami mandir Road Saharanpur  India 247453', 'ggggg', 'ggggg', '55588885588855', 'pranami mandir Road Saharanpur  India 247453', 'ggggg', 'ggggg', '8855533555555', 'asap', '09/19/2021 13:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '29.6476323', '77.5254584', '29.6476323', '77.5254584', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(194, '1', 0, 298, 'pranami mandir Road Saharanpur  India 247453', 'ggggg', 'ggggg', '55588885588855', 'pranami mandir Road Saharanpur  India 247453', 'ggggg', 'ggggg', '8855533555555', 'asap', '09/19/2021 13:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '29.6476323', '77.5254584', '29.6476323', '77.5254584', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(195, '1', 0, 298, 'pranami mandir Road Saharanpur  India 247453', 'ggggg', 'ggggg', '55588885588855', 'Saharanpur 247453  India', 'ggggg', 'ggggg', '8855533555555', 'asap', '09/19/2021 13:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '29.6476323', '77.5254584', '29.6916065', '77.5676735', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(196, 'vAETC24Eox', 5, 325, '1600 Santa Clara County Mountain View United States 94043', 'sfdsf', '23234234423', '2342342343333', '1600 Santa Clara County Mountain View United States 94043', 'dgdfgdfg', '24432dsfdsfds', '23442342342342', 'asap', '09/19/2021 15:25', NULL, NULL, NULL, NULL, 1, '110', '', '0', 'itemphoto61470942323c4-ProductImage_OQkqr.jpg', 'ASAP', 'Personal', '', '', '110.00', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(197, 'vdbQpO67Ra', 5, 325, '1600 Santa Clara County Mountain View United States 94043', 'sfdsf', '23234234423', '2342342343333', '1600 Santa Clara County Mountain View United States 94043', 'dgdfgdfg', '24432dsfdsfds', '23442342342342', 'asap', '09/19/2021 15:25', NULL, NULL, NULL, NULL, 3, '300', '', '0', 'itemphoto614709605029f-ProductImage_1zMZB.jpg', 'ASAP', 'Personal', '', '', '300.00', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(198, 'sQxB9XdJG3', 5, 325, '1600 Santa Clara County Mountain View United States 94043', 'sfdsf', '23234234423', '2342342343333', '1600 Santa Clara County Mountain View United States 94043', 'dgdfgdfg', '24432dsfdsfds', '23442342342342', 'asap', '09/19/2021 15:25', NULL, NULL, NULL, NULL, 5, '500', '', '0', 'itemphoto6147096e42fbe-ProductImage_gFA5J.jpg', 'ASAP', 'Personal', '', '', '500.00', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(199, 'PaZne2zBKf', 5, 325, '1600 Santa Clara County Mountain View United States 94043', 'sfdsf', '23234234423', '2342342343333', '1600 Santa Clara County Mountain View United States 94043', 'dgdfgdfg', '24432dsfdsfds', '23442342342342', 'asap', '09/19/2021 15:27', NULL, NULL, NULL, NULL, 1, '110', '', '10', 'itemphoto6147099b5019d-ProductImage_JpUPZ.jpg', 'ASAP', 'Personal', '', '', '120.00', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(200, 'q77kAc9f4A', 5, 325, '1600 Santa Clara County Mountain View United States 94043', 'sfdsf', '23234234423', '2342342343333', '1600 Santa Clara County Mountain View United States 94043', 'dgdfgdfg', '24432dsfdsfds', '23442342342342', 'asap', '09/19/2021 15:27', NULL, NULL, NULL, NULL, 1, '100', '', '10', 'itemphoto61470b0876ee7-ProductImage_HCQav.jpg', 'ASAP', 'Personal', '', '', '100.00', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(201, 'P9Y5aIvff6', 5, 325, '1600 Santa Clara County Mountain View United States 94043', 'sfdsf', '23234234423', '2342342343333', '1600 Santa Clara County Mountain View United States 94043', 'dgdfgdfg', '24432dsfdsfds', '23442342342342', 'asap', '09/19/2021 15:34', NULL, NULL, NULL, NULL, 1, '110', '', '10', 'itemphoto61470b4583845-ProductImage_hgUGo.jpg', 'ASAP', 'Personal', '', '', '110.00', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(202, 'AB2nIR8qQl', 5, 325, '1600 Santa Clara County Mountain View United States 94043', 'sfdsf', '23234234423', '2342342343333', '1600 Santa Clara County Mountain View United States 94043', 'dgdfgdfg', '24432dsfdsfds', '23442342342342', 'asap', '09/19/2021 15:35', NULL, NULL, NULL, NULL, 1, '100', '', '10', 'itemphoto61470b606a2db-ProductImage_CT9Y6.jpg', 'ASAP', 'Personal', '', '', '100.00', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(203, '1', 0, 325, '1600 Santa Clara County Mountain View United States 94043', 'ddcf', 'dddfff', '555555555555', '1600 Santa Clara County Mountain View United States 94043', 'dddddd', 'ddffvvv', '855555555555', 'asap', '09/19/2021 15:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(205, 'rSS7UIBeH3', 5, 303, '2365 Chromium, San Andres Bukid, Manila, Metro Manila, Philippines', 'rgest', 'Aadesh Mishra', '07508516040', '21 C. Benitez Street, Quezon City, Metro Manila, Philippines', 'mohali', 'Aadesh Mishra', '07508516040', 'asap', '09/19/2021 15:50', NULL, NULL, NULL, NULL, 1, '400', '', '0', '', 'ASAP', 'Personal', '', '', '400', '14.573879', '121.005456', '14.6114512', '121.0448013', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 16:23:45'),
(206, 'f4QS11r1b2', 5, 303, '2365 Chromium, San Andres Bukid, Manila, Metro Manila, Philippines', 'rgest', 'Aadesh Mishra', '07508516040', '21 C. Benitez Street, Quezon City, Metro Manila, Philippines', 'mohali', 'Aadesh Mishra', '07508516040', 'asap', '09/19/2021 16:21', NULL, NULL, NULL, NULL, 1, '400', '', '0', 'itemphoto614716791e370-ProductImage_Voj0P.jpg', 'ASAP', 'Personal', '', '', '400', '14.573879', '121.005456', '14.6114512', '121.0448013', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(207, 'O1Fbf92kqp', 5, 325, '1600 Santa Clara County Mountain View United States 94043', 'ghhh', 'Akash', '+918882341937', '1600 Santa Clara County Mountain View United States 94043', 'gvvvv', 'ffff', '09999999999', 'asap', '09/19/2021 18:07', NULL, NULL, NULL, NULL, 1, '100', '', '0', 'itemphoto614731e48adaa-ProductImage_6tS1B.jpg', 'ASAP', 'Personal', '', '', '100', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(208, 'bNMnjCphkU', 5, 298, 'Sector 11b East Delhi 201301 Noida India', 'bsns', 'A G Techno', '9073838433', 'Buddh Vihar East Delhi 110096 Delhi India', 'nsns', 'nens', '9291911919', 'asap', '09/19/2021 19:40', NULL, NULL, NULL, NULL, 1, '250', '', '10', 'itemphoto6147450a9805f-ProductImage_Sla9Y.jpg', 'ASAP', 'Personal', '', '', '260', '28.5821195', '77.3266991', '28.6071721', '77.3207755', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(209, 'W5MdfgfHBx', 5, 332, '702  Caloocan Philippines 1400', 'dsi', 'j5', '09158291795', 'BDO ATM - SM Taytay Hypermarket Back Office, Taytay, Rizal, Philippines', 'lounge', 'j5', '09158291795', 'asap', '09/20/2021 10:43', NULL, NULL, NULL, NULL, 1, '1410', '', '0', 'itemphoto6147f61692610-ProductImage_bl3r7.jpg', 'ASAP', 'Personal', '', '', '1410', '14.7565784', '121.0449768', '14.5491125', '121.1356436', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(210, 'rVm4KvfX7a', 5, 304, 'Corinthian Executive Regency Bldg. (Condominium), Corinthian Executive Regency, Ortigas Center, Pasig, Metro Manila, Philippines 2507 Corinthian Executive Regency Ortigas Center', '2507 Corinthian Executive Regency Ortigas Center', 'Benjie Javier', '09081250030', 'Corinthian Executive Regency Bldg. (Condominium), Corinthian Executive Regency, Ortigas Center, Pasig, Metro Manila, Philippines 2507 Corinthian Executive Regency Ortigas Center', '2507 Corinthian Executive Regency Ortigas Center', 'Benjie Javier', '09081250030', 'asap', '09/20/2021 10:53', NULL, NULL, NULL, NULL, 1, '110', '', '0', 'itemphoto6147f81dd71f6-ProductImage_4KC7P.jpg', 'ASAP', 'Personal', '', '', '110', '14.5899067', '121.0616823', '14.5899067', '121.0616823', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(211, '1', 0, 304, 'Corinthian Executive Regency Bldg. (Condominium), Corinthian Executive Regency, Ortigas Center, Pasig, Metro Manila, Philippines 2507 Corinthian Executive Regency Ortigas Center', '2507 Corinthian Executive Regency Ortigas Center', 'Benjie Javier', '09081250030', '1976  Makati Philippines 1233 1976 M Reyes Street Bangkal', '1976 M Reyes Street Bangkal', 'Robert', '09159851768', 'asap', '09/20/2021 13:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '14.5899067', '121.0616823', '14.5448544', '121.0101673', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(212, '70fkI86ane', 5, 325, '1600 Santa Clara County Mountain View United States 94043', 'dfsfgfdg', 'dfgdfgfg', '43534534534', '1600 Santa Clara County Mountain View United States 94043', 'dfgdfg', 'dfgdfgfdg', '345345345345', 'asap', '09/20/2021 14:43', NULL, NULL, NULL, NULL, 1, '100', '', '0', 'itemphoto614850dc8503c-ProductImage_Z2joP.jpg', 'ASAP', 'Personal', '', '', '100', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(213, 'M8DAAtU6TD', 5, 325, '1600 Santa Clara County Mountain View United States 94043', 'ffgh', 'ghfghfghfgh', '6456456456', 'Dura Glass, Ortigas Avenue Extension, Cainta City, Rizal, Philippines', 'dfgfg', 'Addhar Update', '+916201552679', 'asap', '09/20/2021 15:56', NULL, NULL, NULL, NULL, 1, '562500', '', '0', 'itemphoto6148623045f20-ProductImage_C32TN.jpg', 'ASAP', 'Personal', '', '', '562500', '37.4062237', '-122.0781663', '14.581922', '121.130358', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(214, '9CN77OODmV', 5, 304, '1976  Makati Philippines 1233', '1976 M Reyes Street Bangkal', 'Robert', '09159851768', 'Corinthian Executive Regency Bldg. (Condominium), Corinthian Executive Regency, Ortigas Center, Pasig, Metro Manila, Philippines', '2507 Corinthian Executive Regency Ortigas Center', 'Benjie Javier', '09081250030', 'asap', '09/20/2021 18:51', NULL, NULL, NULL, NULL, 1, '460', '', '0', 'itemphoto614867e94eabf-ProductImage_SkkM5.jpg', 'ASAP', 'Personal', '', '', '460', '14.5448544', '121.0101673', '14.5899067', '121.0616823', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(215, '8o4nuiqfMc', 5, 325, '1600 Santa Clara County Mountain View United States 94043', 'fhhh', 'ghhh', '558888888888', '1600 Santa Clara County Mountain View United States 94043', 'dfgdfg', 'dfgdfgfdg', '8555555555566', 'asap', '09/20/2021 16:22', NULL, NULL, NULL, NULL, 1, '100', '', '0', 'itemphoto61486a61e7a76-ProductImage_AuNiX.jpg', 'ASAP', 'Personal', '', '', '100', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(216, 'YemmXvFV4L', 5, 325, '1600 Santa Clara County Mountain View United States 94043', 'tessssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss', 'test', '234234234234234', '1600 Santa Clara County Mountain View United States 94043', '34343dsfddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd', 'dsfdsf', '234234234234324', 'asap', '09/20/2021 19:06', NULL, NULL, NULL, NULL, 1, '100', '', '0', 'itemphoto61488eea585f9-ProductImage_fmHbN.jpg', 'ASAP', 'Personal', '', '', '100', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19');
INSERT INTO `durapickupshedule` (`id`, `order_no`, `driver_id`, `user_id`, `pickup_address1`, `pickup_address2`, `pickup_name`, `pickup_mobile`, `destination_address1`, `destination_address2`, `destination_name`, `destination_mobile`, `type`, `pdate`, `stop_address1`, `stop_address2`, `stop_name`, `stop_mobile`, `vehicle_id`, `price`, `drivernote`, `tip`, `itemphoto`, `itemtype`, `acctype`, `coupon`, `discount`, `finalprice`, `pickuplat`, `pickuplon`, `destinationlat`, `destinationlon`, `stopData`, `stoplat`, `stoplon`, `paymentmode`, `status`, `created_at`, `updated_at`) VALUES
(217, '1', 0, 304, '1976  Makati Philippines 1233', '1976 M Reyes Street Bangkal', 'Robert', '09159851768', 'Corinthian Executive Regency Bldg. (Condominium), Corinthian Executive Regency, Ortigas Center, Pasig, Metro Manila, Philippines', '2507 Corinthian Executive Regency Ortigas Center', 'Benjie Javier', '09081250030', 'asap', '09/20/2021 22:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '14.5448544', '121.0101673', '14.5899067', '121.0616823', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(218, 'ACMUI24njO', 5, 304, '1976  Makati Philippines 1233', '1976 M Reyes Street Bangkal', 'Robert', '09159851768', 'Corinthian Executive Regency Bldg. (Condominium), Corinthian Executive Regency, Ortigas Center, Pasig, Metro Manila, Philippines', '2507 Corinthian Executive Regency Ortigas Center', 'Benjie Javier', '09081250030', 'asap', '09/20/2021 22:07', NULL, NULL, NULL, NULL, 9, '4000', '', '0', 'itemphoto614895da0dd9b-ProductImage_JVEGN.jpg', 'ASAP', 'Personal', '', '', '4000', '14.5448544', '121.0101673', '14.5899067', '121.0616823', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(219, '1', 0, 298, 'Dhawalgiri Apartments East Delhi Noida India 201301', 'Kashish Gupta', 'gfd', '8554444444', 'Dhawalgiri Apartments East Delhi Noida India 201301', 'Kashish Gupta', 'fd', '55444445555', 'later', '09/22/2021 21:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28.6295233', '77.3123396', '28.6295233', '77.3123396', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(220, 'FAxgOEUOKF', 5, 325, '1600 Santa Clara County Mountain View United States 94043', 'vhhh', 'hhhh', '534534534534534', '1600 Santa Clara County Mountain View United States 94043', 'dgdfgfdg', 'dgdfgfdg', '334334334334', 'asap', '09/20/2021 21:16', NULL, NULL, NULL, NULL, 1, '100', '', '0', 'itemphoto6148ad09557af-ProductImage_XmHhE.jpg', 'ASAP', 'Personal', '', '', '100', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(221, 'FSHqF9BCJI', 0, 298, 'Dhawalgiri Apartments East Delhi Noida India 201301', 'Kashish Gupta', 'gfd', '8554444444', 'Dhawalgiri Apartments East Delhi Noida India 201301', 'Kashish Gupta', 'fd', '55444445555', 'later', '09/22/2021 21:13', NULL, NULL, NULL, NULL, 5, '500', '', '50', 'itemphoto6148ad3540b4d-ProductImage_2Qd2Z.jpg', 'Later', 'Personal', '', '', '550', '28.6295233', '77.3123396', '28.6295233', '77.3123396', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(222, '6IxZnYdnya', 5, 298, 'Dhawalgiri Apartments East Delhi Noida India 201301', 'jfjdjs', 'hdhdeh', '929292622656', 'Dhawalgiri Apartments East Delhi Noida India 201301', 'jdjdjs', 'jrjdjdjs', '9595946464', 'asap', '09/20/2021 21:25', NULL, NULL, NULL, NULL, 1, '100', '', '10', 'itemphoto6148afdde2139-ProductImage_RLee1.jpg', 'ASAP', 'Personal', '', '', '110', '28.602043', '77.339001', '28.602043', '77.339001', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(223, 'oyuZrm9fg0', 5, 303, '2365 Chromium, San Andres Bukid, Manila, Metro Manila, Philippines', 'rgest', 'Aadesh Mishra', '07508516040', '21 C. Benitez Street, Quezon City, Metro Manila, Philippines', 'mohali', 'Aadesh Mishra', '07508516040', 'asap', '09/20/2021 21:31', NULL, NULL, NULL, NULL, 1, '420', '', '0', 'itemphoto6148b0583aef2-ProductImage_Uk06p.jpg', 'ASAP', 'Personal', '', '', '420', '14.573879', '121.005456', '14.6114512', '121.0448013', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(224, 'kXe7PyY6Fi', 5, 298, 'Dhawalgiri Apartments East Delhi Noida India 201301', 'jrjej', 'bdhejej', '95959595949', 'Dhawalgiri Apartments East Delhi Noida India 201301', 'hdhshsb', 'A C Gas', '9650183522', 'asap', '09/20/2021 21:32', NULL, NULL, NULL, NULL, 1, '100', '', '10', 'itemphoto6148b0b821a78-ProductImage_58KgC.jpg', 'ASAP', 'Personal', '', '', '110', '28.602043', '77.339001', '28.602043', '77.339001', NULL, NULL, NULL, 'Wallet', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(225, 'ueT3objHxR', 5, 325, '1600 Santa Clara County Mountain View United States 94043', 'fgg', 'vvv', '8888888888', '1600 Santa Clara County Mountain View United States 94043', 'tggnnb', 'ffffggg', '0888888888888', 'asap', '09/20/2021 21:47', NULL, NULL, NULL, NULL, 1, '100', '', '0', 'itemphoto6148b43f77b4b-ProductImage_es9d2.jpg', 'ASAP', 'Personal', '', '', '100', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-09-06 14:20:22', '2021-09-21 08:34:19'),
(226, '1', 0, 1, 'paddress1', 'paddress1', 'pname', '1234567890', 'daddress1', 'daddress1', 'daddress1', '0987654321', 'later', '2021/05/9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1.2342353', '2.34535', '3.4545', '4.45645', NULL, NULL, NULL, 'COD', '1', '2021-05-09 00:00:00', '2021-09-21 08:51:38'),
(227, '1', 0, 1, 'paddress1', 'paddress1', 'pname', '1234567890', 'daddress1', 'daddress1', 'daddress1', '0987654321', 'later', '2021/05/9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1.2342353', '2.34535', '3.4545', '4.45645', NULL, NULL, NULL, 'COD', '1', '2021-05-09 00:00:00', '2021-09-21 09:35:57'),
(228, '1', 0, 1, 'paddress1', 'paddress1', 'pname', '1234567890', 'daddress1', 'daddress1', 'daddress1', '0987654321', 'later', '2021/05/9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1.2342353', '2.34535', '3.4545', '4.45645', NULL, NULL, NULL, 'COD', '1', '2021-05-09 00:00:00', '2021-09-21 09:36:15'),
(229, 'rmT9vmrEfG', 5, 325, '1600 Santa Clara County Mountain View United States 94043', 'rggg', 'ffggg', '678686787878768', '1600 Santa Clara County Mountain View United States 94043', 'tvgg', 'hjjjj', '566666666666666', 'asap', '09/21/2021 15:00', NULL, NULL, NULL, NULL, 1, '110', '', '0', 'itemphoto6149b41c49883-ProductImage_cM8sP.jpg', 'ASAP', 'Personal', '', '', '110', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '2021-05-09 00:00:00', '2021-09-21 10:35:11'),
(230, 'nN3VNLzYMz', 5, 325, '1600 Santa Clara County Mountain View United States 94043', 'dsfsdf', 'sdfsfdsf', '234234234234', '1600 Santa Clara County Mountain View United States 94043', 'sdfsdfdsf', 'sdfsdfsdf', '234234234324', 'asap', '09/21/2021 17:22', NULL, NULL, NULL, NULL, 1, '100', '', '0', 'itemphoto6149c7a60a66b-ProductImage_4xS7L.jpg', 'ASAP', 'Personal', '', '', '100', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '0001-01-01T00:00:00', '2021-09-21 11:53:10'),
(231, 'b9HwsPCK4p', 5, 325, '1600 Santa Clara County Mountain View United States 94043', 'dgggg', 'fggg', '545545555455455', '1600 Santa Clara County Mountain View United States 94043', 'gyghjhj', 'hjgjhghhj', '786767867867867', 'asap', '09/21/2021 17:26', NULL, NULL, NULL, NULL, 1, '100', '', '0', 'itemphoto6149c8a92210a-ProductImage_6mAJW.jpg', 'ASAP', 'Personal', '', '', '100', '37.4062237', '-122.0781663', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '0001-01-01T00:00:00', '2021-09-21 11:57:29'),
(232, 'R7bhhm9V4v', 5, 325, 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'asap', '09/21/2021 17:38', NULL, NULL, NULL, NULL, 1, '100', '', '0', 'itemphoto6149cb5044693-ProductImage_wlkmM.jpg', 'ASAP', 'Personal', '', '', '100', '24.0300108', '84.0700115', '24.0300108', '84.0700115', NULL, NULL, NULL, 'COD', '1', '0001-01-01T00:00:00', '2021-09-21 12:08:48'),
(233, 'fzJporzcaN', 5, 325, 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'asap', '09/21/2021 17:45', NULL, NULL, NULL, NULL, 1, '100', '', '0', 'itemphoto6149cd01a4521-ProductImage_bLXZ0.jpg', 'ASAP', 'Personal', '', '', '100', '24.0300108', '84.0700115', '24.0300108', '84.0700115', NULL, NULL, NULL, 'COD', '1', '0001-01-01T00:00:00', '2021-09-21 12:16:01'),
(234, 'UUgHTJHxFw', 5, 325, 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'asap', '09/21/2021 17:54', NULL, NULL, NULL, NULL, 1, '100', '', '0', 'itemphoto6149cf24c1d90-ProductImage_R14wg.jpg', 'ASAP', 'Personal', '', '', '100', '24.0300108', '84.0700115', '24.0300108', '84.0700115', NULL, NULL, NULL, 'COD', '1', '0001-01-01T00:00:00', '2021-09-21 12:25:08'),
(235, 'IMbfZhCEUR', 5, 325, '1600 Santa Clara County Mountain View United States 94043', 'cggg', 'Akash Tester Arknewtech', '+919532152054', 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'asap', '09/21/2021 17:57', NULL, NULL, NULL, NULL, 1, '632900', '', '0', 'itemphoto6149cfd0226af-ProductImage_yW4MK.jpg', 'ASAP', 'Personal', '', '', '632900', '37.4062237', '-122.0781663', '24.0300108', '84.0700115', NULL, NULL, NULL, 'COD', '1', '0001-01-01T00:00:00', '2021-09-21 12:28:00'),
(236, 'wyAirzm47Y', 5, 325, 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'asap', '09/21/2021 18:01', NULL, NULL, NULL, NULL, 1, '100', '', '0', 'itemphoto6149d0bf994d6-ProductImage_ghtAm.jpg', 'ASAP', 'Personal', '', '', '100', '24.0300108', '84.0700115', '24.0300108', '84.0700115', NULL, NULL, NULL, 'COD', '1', '0001-01-01T00:00:00', '2021-09-21 12:31:59'),
(237, '9BXYmabR5e', 5, 325, 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'asap', '09/21/2021 18:10', NULL, NULL, NULL, NULL, 1, '100', '', '0', 'itemphoto6149d2f3f2916-ProductImage_b1TXT.jpg', 'ASAP', 'Personal', '', '', '100', '24.0300108', '84.0700115', '24.0300108', '84.0700115', NULL, NULL, NULL, 'COD', '1', '0001-01-01T00:00:00', '2021-09-21 12:41:23'),
(238, 'rcCYlrhpIp', 5, 325, 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', '1600 Santa Clara County Mountain View United States 94043', 'vbbb', 'hhhhh', '555555555555555', 'asap', '09/21/2021 18:11', NULL, NULL, NULL, NULL, 1, '632900', '', '0', 'itemphoto6149d33147cf9-ProductImage_77kaE.jpg', 'ASAP', 'Personal', '', '', '632900', '24.0300108', '84.0700115', '37.4062237', '-122.0781663', NULL, NULL, NULL, 'COD', '1', '0001-01-01T00:00:00', '2021-09-21 12:42:25'),
(240, 'ktbOqUwF3P', 5, 325, 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'asap', '09/21/2021 18:17', NULL, NULL, NULL, NULL, 1, '100', '', '0', 'itemphoto6149d47520dcf-ProductImage_gprW9.jpg', 'ASAP', 'Personal', '', '', '100', '24.0300108', '84.0700115', '24.0300108', '84.0700115', NULL, NULL, NULL, 'COD', '1', '0001-01-01T00:00:00', '2021-09-21 12:47:49'),
(241, 'OGp2jM0NkE', 5, 325, 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'asap', '09/21/2021 18:19', NULL, NULL, NULL, NULL, 1, '100', '', '0', 'itemphoto6149d4eec8894-ProductImage_OzoVy.jpg', 'ASAP', 'Personal', '', '', '100', '24.0300108', '84.0700115', '24.0300108', '84.0700115', NULL, NULL, NULL, 'COD', '1', '0001-01-01T00:00:00', '2021-09-21 12:49:50'),
(242, 'roEudPgvX9', 5, 325, 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'asap', '09/21/2021 18:21', NULL, NULL, NULL, NULL, 1, '100', '', '0', 'itemphoto6149d573da186-ProductImage_uPsHk.jpg', 'ASAP', 'Personal', '', '', '100', '24.0300108', '84.0700115', '24.0300108', '84.0700115', NULL, NULL, NULL, 'COD', '1', '0001-01-01T00:00:00', '2021-09-21 12:52:03'),
(243, '2WqRVDfUaj', 5, 325, 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '085555555559', 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'asap', '09/21/2021 18:31', NULL, NULL, NULL, NULL, 1, '100', '', '0', 'itemphoto6149d7d899af4-ProductImage_FxE4l.jpg', 'ASAP', 'Personal', '', '', '100', '24.0300108', '84.0700115', '24.0300108', '84.0700115', NULL, NULL, NULL, 'COD', '1', '0001-01-01T00:00:00', '2021-09-21 13:02:16'),
(244, 'o1aX5LMQLW', 5, 325, 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'asap', '09/21/2021 19:00', NULL, NULL, NULL, NULL, 1, '100', '', '0', 'itemphoto6149de981b559-ProductImage_zA942.jpg', 'ASAP', 'Personal', '', '', '100', '24.0300108', '84.0700115', '24.0300108', '84.0700115', NULL, NULL, NULL, 'COD', '1', '0001-01-01T00:00:00', '2021-09-21 13:31:04'),
(245, '7fffP6aBFS', 5, 303, '2365 Chromium, San Andres Bukid, Manila, Metro Manila, Philippines', 'rgest', 'Aadesh Mishra', '07508516040', '216 General Luis, Novaliches, Quezon City, Metro Manila, Philippines', 'srgdr', 'Aadesh Mishra', '07508516040', 'asap', '09/21/2021 19:02', NULL, NULL, NULL, NULL, 1, '970', '', '10', 'itemphoto6149df1e957d4-ProductImage_56Fh9.jpg', 'ASAP', 'Personal', '', '', '980', '14.573879', '121.005456', '14.721707', '121.036082', NULL, NULL, NULL, 'Wallet', '3', '0001-01-01T00:00:00', '2021-09-21 15:15:35'),
(246, 'Tt653eTwSn', 5, 325, 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'asap', '09/21/2021 19:03', NULL, NULL, NULL, NULL, 1, '100', '', '0', 'itemphoto6149df6f0c732-ProductImage_vWCbl.jpg', 'ASAP', 'Personal', '', '', '100', '24.0300108', '84.0700115', '24.0300108', '84.0700115', NULL, NULL, NULL, 'COD', '1', '0001-01-01T00:00:00', '2021-09-21 13:34:39'),
(247, 'YhfrLG8Lnr', 5, 325, 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'asap', '09/21/2021 19:06', NULL, NULL, NULL, NULL, 1, '100', '', '0', 'itemphoto6149dfe955d80-ProductImage_p9kOb.jpg', 'ASAP', 'Personal', '', '', '100', '24.0300108', '84.0700115', '24.0300108', '84.0700115', NULL, NULL, NULL, 'COD', '1', '0001-01-01T00:00:00', '2021-09-21 13:36:41'),
(248, '654foDOmzx', 5, 325, 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'asap', '09/21/2021 19:10', NULL, NULL, NULL, NULL, 1, '100', '', '0', 'itemphoto6149e0d26e3cd-ProductImage_ZZJX5.jpg', 'ASAP', 'Personal', '', '', '100', '24.0300108', '84.0700115', '24.0300108', '84.0700115', NULL, NULL, NULL, 'COD', '1', '0001-01-01T00:00:00', '2021-09-21 13:40:34'),
(249, '1', 0, 325, 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'asap', '09/21/2021 19:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '24.0300108', '84.0700115', '24.0300108', '84.0700115', NULL, NULL, NULL, 'COD', '1', '0001-01-01T00:00:00', '2021-09-21 13:50:32'),
(250, '1', 0, 325, 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'asap', '09/21/2021 19:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '24.0300108', '84.0700115', '24.0300108', '84.0700115', NULL, NULL, NULL, 'COD', '1', '0001-01-01T00:00:00', '2021-09-21 13:51:03'),
(251, '1', 0, 325, 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'asap', '09/21/2021 21:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '24.0300108', '84.0700115', '24.0300108', '84.0700115', NULL, NULL, NULL, 'COD', '1', '0001-01-01T00:00:00', '2021-09-21 16:10:04'),
(252, '1', 0, 303, '2365 Chromium, San Andres Bukid, Manila, Metro Manila, Philippines', 'rgest', 'Aadesh Mishra', '07508516040', '216 General Luis, Novaliches, Quezon City, Metro Manila, Philippines', 'srgdr', 'Aadesh Mishra', '07508516040', 'asap', '09/21/2021 21:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '14.573879', '121.005456', '14.721707', '121.036082', NULL, NULL, NULL, 'COD', '1', '0001-01-01T00:00:00', '2021-09-21 16:19:54'),
(253, 'IE3YHkbaXk', 5, 325, 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'asap', '09/21/2021 21:55', NULL, NULL, NULL, NULL, 1, '100', '', '0', 'itemphoto614a0786dd93d-ProductImage_VX4b6.jpg', 'ASAP', 'Personal', '', '', '100', '24.0300108', '84.0700115', '24.0300108', '84.0700115', NULL, NULL, NULL, 'COD', '1', '0001-01-01T00:00:00', '2021-09-21 16:25:42'),
(254, '1', 0, 325, 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'asap', '09/21/2021 22:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '24.0300108', '84.0700115', '24.0300108', '84.0700115', NULL, NULL, NULL, 'COD', '1', '0001-01-01T00:00:00', '2021-09-21 16:45:59'),
(255, 'kjdNyf3yqq', 5, 325, 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'asap', '09/21/2021 22:14', NULL, NULL, NULL, NULL, 1, '100', '', '0', 'itemphoto614a0c5760939-ProductImage_eBM4g.jpg', 'ASAP', 'Personal', '', '', '100', '24.0300108', '84.0700115', '24.0300108', '84.0700115', NULL, NULL, NULL, 'COD', '1', '0001-01-01T00:00:00', '2021-09-21 16:46:15'),
(256, 'Vtx38hIYhL', 5, 325, 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'Belwatika Road Palamu Daltonganj India 822101', 'test123', 'tes', '08555555555', 'asap', '09/21/2021 22:22', NULL, NULL, NULL, NULL, 1, '100', '', '0', 'itemphoto614a0de6165f6-ProductImage_on8aQ.jpg', 'ASAP', 'Personal', '', '', '100', '24.0300108', '84.0700115', '24.0300108', '84.0700115', NULL, NULL, NULL, 'COD', '2', '0001-01-01T00:00:00', '2021-09-21 17:38:54'),
(257, 'KwD2mJqiAL', 5, 304, '1976  Makati Philippines 1233', '1976 M Reyes Street Bangkal', 'Robert', '09159851768', 'Corinthian Executive Regency Bldg. (Condominium), Corinthian Executive Regency, Ortigas Center, Pasig, Metro Manila, Philippines', '2507 Corinthian Executive Regency Ortigas Center', 'Benjie Javier', '09081250030', 'asap', '09/22/2021 01:39', NULL, NULL, NULL, NULL, 1, '460', '', '0', 'itemphoto614a190048ae6-ProductImage_n3kRl.jpg', 'ASAP', 'Personal', '', '', '460', '14.5448544', '121.0101673', '14.5899067', '121.0616823', NULL, NULL, NULL, 'Wallet', '1', '0001-01-01T00:00:00', '2021-09-21 17:40:21');

-- --------------------------------------------------------

--
-- Table structure for table `durapickup_services`
--

CREATE TABLE `durapickup_services` (
  `id` int(11) NOT NULL,
  `pickup_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `durapickup_services`
--

INSERT INTO `durapickup_services` (`id`, `pickup_id`, `service_id`, `created_at`, `updated_at`) VALUES
(21, 93, 1, '2021-09-12 17:11:18', '2021-09-12 17:11:18'),
(22, 93, 8, '2021-09-12 17:11:18', '2021-09-12 17:11:18'),
(23, 93, 6, '2021-09-12 17:11:18', '2021-09-12 17:11:18'),
(24, 95, 1, '2021-09-13 09:34:22', '2021-09-13 09:34:22'),
(25, 95, 4, '2021-09-13 09:34:22', '2021-09-13 09:34:22'),
(26, 95, 5, '2021-09-13 09:34:22', '2021-09-13 09:34:22'),
(27, 96, 1, '2021-09-13 10:01:13', '2021-09-13 10:01:13'),
(28, 96, 4, '2021-09-13 10:01:13', '2021-09-13 10:01:13'),
(29, 96, 6, '2021-09-13 10:01:13', '2021-09-13 10:01:13'),
(30, 97, 1, '2021-09-13 10:31:14', '2021-09-13 10:31:14'),
(31, 97, 8, '2021-09-13 10:31:14', '2021-09-13 10:31:14'),
(32, 98, 1, '2021-09-15 08:53:12', '2021-09-15 08:53:12'),
(33, 98, 5, '2021-09-15 08:53:12', '2021-09-15 08:53:12'),
(34, 99, 1, '2021-09-15 09:01:08', '2021-09-15 09:01:08'),
(35, 99, 2, '2021-09-15 09:01:08', '2021-09-15 09:01:08'),
(36, 100, 1, '2021-09-15 12:30:47', '2021-09-15 12:30:47'),
(37, 100, 2, '2021-09-15 12:30:47', '2021-09-15 12:30:47'),
(38, 101, 1, '2021-09-15 14:08:45', '2021-09-15 14:08:45'),
(39, 101, 2, '2021-09-15 14:08:45', '2021-09-15 14:08:45'),
(40, 102, 1, '2021-09-15 15:40:56', '2021-09-15 15:40:56'),
(41, 102, 2, '2021-09-15 15:40:56', '2021-09-15 15:40:56'),
(42, 102, 3, '2021-09-15 15:40:56', '2021-09-15 15:40:56'),
(43, 104, 1, '2021-09-15 16:40:27', '2021-09-15 16:40:27'),
(44, 104, 2, '2021-09-15 16:40:27', '2021-09-15 16:40:27'),
(47, 106, 1, '2021-09-15 16:53:29', '2021-09-15 16:53:29'),
(48, 108, 1, '2021-09-15 16:55:26', '2021-09-15 16:55:26'),
(49, 111, 1, '2021-09-15 17:12:34', '2021-09-15 17:12:34'),
(50, 112, 2, '2021-09-15 17:36:58', '2021-09-15 17:36:58'),
(51, 113, 1, '2021-09-15 18:00:51', '2021-09-15 18:00:51'),
(52, 113, 2, '2021-09-15 18:00:51', '2021-09-15 18:00:51'),
(53, 113, 3, '2021-09-15 18:00:51', '2021-09-15 18:00:51'),
(54, 113, 4, '2021-09-15 18:00:51', '2021-09-15 18:00:51'),
(55, 113, 5, '2021-09-15 18:00:51', '2021-09-15 18:00:51'),
(56, 113, 6, '2021-09-15 18:00:51', '2021-09-15 18:00:51'),
(57, 113, 7, '2021-09-15 18:00:51', '2021-09-15 18:00:51'),
(58, 113, 8, '2021-09-15 18:00:51', '2021-09-15 18:00:51'),
(59, 115, 1, '2021-09-15 18:12:58', '2021-09-15 18:12:58'),
(60, 115, 2, '2021-09-15 18:12:58', '2021-09-15 18:12:58'),
(61, 115, 3, '2021-09-15 18:12:58', '2021-09-15 18:12:58'),
(62, 115, 4, '2021-09-15 18:12:58', '2021-09-15 18:12:58'),
(63, 115, 5, '2021-09-15 18:12:58', '2021-09-15 18:12:58'),
(64, 115, 6, '2021-09-15 18:12:58', '2021-09-15 18:12:58'),
(65, 115, 7, '2021-09-15 18:12:58', '2021-09-15 18:12:58'),
(66, 115, 8, '2021-09-15 18:12:58', '2021-09-15 18:12:58'),
(67, 116, 2, '2021-09-16 00:59:36', '2021-09-16 00:59:36'),
(68, 117, 1, '2021-09-16 12:01:06', '2021-09-16 12:01:06'),
(69, 117, 2, '2021-09-16 12:01:06', '2021-09-16 12:01:06'),
(70, 129, 1, '2021-09-16 14:34:44', '2021-09-16 14:34:44'),
(71, 129, 2, '2021-09-16 14:34:44', '2021-09-16 14:34:44'),
(72, 130, 1, '2021-09-16 14:38:04', '2021-09-16 14:38:04'),
(73, 130, 2, '2021-09-16 14:38:04', '2021-09-16 14:38:04'),
(74, 130, 3, '2021-09-16 14:38:04', '2021-09-16 14:38:04'),
(75, 130, 4, '2021-09-16 14:38:04', '2021-09-16 14:38:04'),
(76, 130, 5, '2021-09-16 14:38:04', '2021-09-16 14:38:04'),
(77, 130, 6, '2021-09-16 14:38:04', '2021-09-16 14:38:04'),
(78, 130, 7, '2021-09-16 14:38:04', '2021-09-16 14:38:04'),
(79, 130, 8, '2021-09-16 14:38:04', '2021-09-16 14:38:04'),
(80, 131, 1, '2021-09-16 14:55:14', '2021-09-16 14:55:14'),
(81, 131, 2, '2021-09-16 14:55:14', '2021-09-16 14:55:14'),
(82, 131, 3, '2021-09-16 14:55:14', '2021-09-16 14:55:14'),
(83, 131, 4, '2021-09-16 14:55:14', '2021-09-16 14:55:14'),
(84, 131, 5, '2021-09-16 14:55:14', '2021-09-16 14:55:14'),
(85, 131, 6, '2021-09-16 14:55:14', '2021-09-16 14:55:14'),
(86, 131, 7, '2021-09-16 14:55:14', '2021-09-16 14:55:14'),
(87, 131, 8, '2021-09-16 14:55:14', '2021-09-16 14:55:14'),
(88, 132, 1, '2021-09-16 15:02:53', '2021-09-16 15:02:53'),
(89, 132, 2, '2021-09-16 15:02:53', '2021-09-16 15:02:53'),
(90, 132, 3, '2021-09-16 15:02:53', '2021-09-16 15:02:53'),
(91, 132, 4, '2021-09-16 15:02:53', '2021-09-16 15:02:53'),
(92, 132, 5, '2021-09-16 15:02:53', '2021-09-16 15:02:53'),
(93, 132, 6, '2021-09-16 15:02:53', '2021-09-16 15:02:53'),
(94, 132, 7, '2021-09-16 15:02:53', '2021-09-16 15:02:53'),
(95, 132, 8, '2021-09-16 15:02:53', '2021-09-16 15:02:53'),
(96, 133, 1, '2021-09-16 15:15:41', '2021-09-16 15:15:41'),
(97, 133, 2, '2021-09-16 15:15:41', '2021-09-16 15:15:41'),
(98, 133, 3, '2021-09-16 15:15:41', '2021-09-16 15:15:41'),
(99, 133, 4, '2021-09-16 15:15:41', '2021-09-16 15:15:41'),
(100, 133, 5, '2021-09-16 15:15:41', '2021-09-16 15:15:41'),
(101, 133, 6, '2021-09-16 15:15:41', '2021-09-16 15:15:41'),
(102, 133, 7, '2021-09-16 15:15:41', '2021-09-16 15:15:41'),
(103, 133, 8, '2021-09-16 15:15:41', '2021-09-16 15:15:41'),
(104, 134, 1, '2021-09-16 15:18:54', '2021-09-16 15:18:54'),
(105, 134, 2, '2021-09-16 15:18:54', '2021-09-16 15:18:54'),
(106, 134, 3, '2021-09-16 15:18:54', '2021-09-16 15:18:54'),
(107, 134, 4, '2021-09-16 15:18:54', '2021-09-16 15:18:54'),
(108, 134, 5, '2021-09-16 15:18:54', '2021-09-16 15:18:54'),
(109, 134, 6, '2021-09-16 15:18:54', '2021-09-16 15:18:54'),
(110, 134, 7, '2021-09-16 15:18:54', '2021-09-16 15:18:54'),
(111, 134, 8, '2021-09-16 15:18:54', '2021-09-16 15:18:54'),
(112, 135, 1, '2021-09-17 06:40:27', '2021-09-17 06:40:27'),
(113, 136, 1, '2021-09-17 07:17:38', '2021-09-17 07:17:38'),
(114, 136, 2, '2021-09-17 07:17:38', '2021-09-17 07:17:38'),
(115, 136, 3, '2021-09-17 07:17:38', '2021-09-17 07:17:38'),
(116, 136, 4, '2021-09-17 07:17:38', '2021-09-17 07:17:38'),
(117, 136, 5, '2021-09-17 07:17:38', '2021-09-17 07:17:38'),
(118, 136, 6, '2021-09-17 07:17:38', '2021-09-17 07:17:38'),
(119, 136, 7, '2021-09-17 07:17:38', '2021-09-17 07:17:38'),
(120, 136, 8, '2021-09-17 07:17:38', '2021-09-17 07:17:38'),
(121, 137, 1, '2021-09-17 09:16:24', '2021-09-17 09:16:24'),
(122, 137, 2, '2021-09-17 09:16:24', '2021-09-17 09:16:24'),
(124, 138, 1, '2021-09-17 14:23:54', '2021-09-17 14:23:54'),
(125, 141, 1, '2021-09-17 15:12:13', '2021-09-17 15:12:13'),
(126, 141, 2, '2021-09-17 15:12:13', '2021-09-17 15:12:13'),
(127, 141, 3, '2021-09-17 15:12:13', '2021-09-17 15:12:13'),
(128, 141, 4, '2021-09-17 15:12:13', '2021-09-17 15:12:13'),
(129, 141, 5, '2021-09-17 15:12:13', '2021-09-17 15:12:13'),
(130, 141, 6, '2021-09-17 15:12:13', '2021-09-17 15:12:13'),
(131, 141, 7, '2021-09-17 15:12:13', '2021-09-17 15:12:13'),
(132, 141, 8, '2021-09-17 15:12:13', '2021-09-17 15:12:13'),
(133, 144, 1, '2021-09-17 15:32:10', '2021-09-17 15:32:10'),
(134, 144, 2, '2021-09-17 15:32:10', '2021-09-17 15:32:10'),
(135, 146, 1, '2021-09-17 15:56:20', '2021-09-17 15:56:20'),
(136, 147, 1, '2021-09-17 17:18:45', '2021-09-17 17:18:45'),
(137, 148, 1, '2021-09-18 04:58:36', '2021-09-18 04:58:36'),
(138, 148, 2, '2021-09-18 04:58:36', '2021-09-18 04:58:36'),
(139, 149, 1, '2021-09-18 05:07:21', '2021-09-18 05:07:21'),
(140, 149, 2, '2021-09-18 05:07:21', '2021-09-18 05:07:21'),
(141, 149, 3, '2021-09-18 05:07:21', '2021-09-18 05:07:21'),
(142, 150, 1, '2021-09-18 08:58:29', '2021-09-18 08:58:29'),
(143, 150, 2, '2021-09-18 08:58:29', '2021-09-18 08:58:29'),
(144, 150, 3, '2021-09-18 08:58:29', '2021-09-18 08:58:29'),
(145, 151, 1, '2021-09-18 09:12:57', '2021-09-18 09:12:57'),
(146, 151, 2, '2021-09-18 09:12:57', '2021-09-18 09:12:57'),
(147, 151, 3, '2021-09-18 09:12:57', '2021-09-18 09:12:57'),
(148, 152, 1, '2021-09-18 09:17:35', '2021-09-18 09:17:35'),
(149, 152, 2, '2021-09-18 09:17:35', '2021-09-18 09:17:35'),
(150, 152, 3, '2021-09-18 09:17:35', '2021-09-18 09:17:35'),
(151, 152, 1, '2021-09-18 09:17:35', '2021-09-18 09:17:35'),
(152, 152, 2, '2021-09-18 09:17:35', '2021-09-18 09:17:35'),
(153, 152, 3, '2021-09-18 09:17:35', '2021-09-18 09:17:35'),
(154, 153, 1, '2021-09-18 09:32:47', '2021-09-18 09:32:47'),
(155, 153, 2, '2021-09-18 09:32:47', '2021-09-18 09:32:47'),
(156, 153, 3, '2021-09-18 09:32:47', '2021-09-18 09:32:47'),
(157, 154, 1, '2021-09-18 09:39:16', '2021-09-18 09:39:16'),
(158, 154, 2, '2021-09-18 09:39:16', '2021-09-18 09:39:16'),
(159, 154, 3, '2021-09-18 09:39:16', '2021-09-18 09:39:16'),
(160, 154, 1, '2021-09-18 09:39:16', '2021-09-18 09:39:16'),
(161, 154, 2, '2021-09-18 09:39:16', '2021-09-18 09:39:16'),
(162, 155, 1, '2021-09-18 10:30:06', '2021-09-18 10:30:06'),
(163, 156, 1, '2021-09-18 10:36:41', '2021-09-18 10:36:41'),
(164, 156, 2, '2021-09-18 10:36:41', '2021-09-18 10:36:41'),
(165, 157, 1, '2021-09-18 10:43:24', '2021-09-18 10:43:24'),
(166, 157, 2, '2021-09-18 10:43:24', '2021-09-18 10:43:24'),
(167, 158, 8, '2021-09-18 10:45:12', '2021-09-18 10:45:12'),
(168, 159, 1, '2021-09-18 11:24:24', '2021-09-18 11:24:24'),
(169, 159, 2, '2021-09-18 11:24:24', '2021-09-18 11:24:24'),
(170, 159, 3, '2021-09-18 11:24:24', '2021-09-18 11:24:24'),
(171, 160, 1, '2021-09-18 12:40:50', '2021-09-18 12:40:50'),
(172, 160, 2, '2021-09-18 12:40:50', '2021-09-18 12:40:50'),
(173, 161, 1, '2021-09-18 14:36:32', '2021-09-18 14:36:32'),
(174, 162, 2, '2021-09-18 14:41:47', '2021-09-18 14:41:47'),
(176, 165, 1, '2021-09-18 16:44:32', '2021-09-18 16:44:32'),
(178, 167, 1, '2021-09-18 16:53:30', '2021-09-18 16:53:30'),
(180, 168, 1, '2021-09-18 17:07:57', '2021-09-18 17:07:57'),
(181, 170, 1, '2021-09-18 18:20:51', '2021-09-18 18:20:51'),
(182, 171, 1, '2021-09-18 18:40:16', '2021-09-18 18:40:16'),
(183, 172, 1, '2021-09-18 18:52:30', '2021-09-18 18:52:30'),
(184, 173, 1, '2021-09-18 19:00:19', '2021-09-18 19:00:19'),
(185, 174, 1, '2021-09-18 19:03:11', '2021-09-18 19:03:11'),
(186, 175, 1, '2021-09-18 19:09:27', '2021-09-18 19:09:27'),
(187, 176, 1, '2021-09-18 19:19:38', '2021-09-18 19:19:38'),
(198, 177, 3, '2021-09-19 01:04:40', '2021-09-19 01:04:40'),
(199, 178, 1, '2021-09-19 01:05:43', '2021-09-19 01:05:43'),
(200, 179, 1, '2021-09-19 01:26:45', '2021-09-19 01:26:45'),
(201, 180, 1, '2021-09-19 01:29:13', '2021-09-19 01:29:13'),
(202, 180, 2, '2021-09-19 01:29:13', '2021-09-19 01:29:13'),
(203, 180, 3, '2021-09-19 01:29:13', '2021-09-19 01:29:13'),
(204, 180, 4, '2021-09-19 01:29:13', '2021-09-19 01:29:13'),
(205, 180, 5, '2021-09-19 01:29:13', '2021-09-19 01:29:13'),
(206, 180, 6, '2021-09-19 01:29:13', '2021-09-19 01:29:13'),
(207, 180, 7, '2021-09-19 01:29:13', '2021-09-19 01:29:13'),
(208, 180, 8, '2021-09-19 01:29:13', '2021-09-19 01:29:13'),
(209, 189, 1, '2021-09-19 05:29:49', '2021-09-19 05:29:49'),
(210, 189, 2, '2021-09-19 05:29:49', '2021-09-19 05:29:49'),
(211, 190, 1, '2021-09-19 05:50:57', '2021-09-19 05:50:57'),
(212, 190, 2, '2021-09-19 05:50:57', '2021-09-19 05:50:57'),
(213, 190, 3, '2021-09-19 05:50:57', '2021-09-19 05:50:57'),
(214, 191, 1, '2021-09-19 06:21:45', '2021-09-19 06:21:45'),
(215, 191, 2, '2021-09-19 06:21:45', '2021-09-19 06:21:45'),
(216, 196, 1, '2021-09-19 09:56:18', '2021-09-19 09:56:18'),
(218, 197, 1, '2021-09-19 09:56:48', '2021-09-19 09:56:48'),
(219, 198, 1, '2021-09-19 09:57:02', '2021-09-19 09:57:02'),
(222, 199, 1, '2021-09-19 09:57:47', '2021-09-19 09:57:47'),
(223, 199, 1, '2021-09-19 09:57:47', '2021-09-19 09:57:47'),
(239, 200, 1, '2021-09-19 10:03:52', '2021-09-19 10:03:52'),
(240, 200, 1, '2021-09-19 10:03:52', '2021-09-19 10:03:52'),
(249, 201, 1, '2021-09-19 10:04:53', '2021-09-19 10:04:53'),
(250, 201, 1, '2021-09-19 10:04:53', '2021-09-19 10:04:53'),
(251, 201, 1, '2021-09-19 10:04:53', '2021-09-19 10:04:53'),
(252, 202, 1, '2021-09-19 10:05:20', '2021-09-19 10:05:20'),
(253, 202, 1, '2021-09-19 10:05:20', '2021-09-19 10:05:20'),
(254, 202, 1, '2021-09-19 10:05:20', '2021-09-19 10:05:20'),
(281, 1, 1, '2021-09-19 10:38:49', '2021-09-19 10:38:49'),
(282, 1, 3, '2021-09-19 10:38:49', '2021-09-19 10:38:49'),
(287, 209, 1, '2021-09-20 02:46:46', '2021-09-20 02:46:46'),
(288, 209, 2, '2021-09-20 02:46:46', '2021-09-20 02:46:46'),
(289, 209, 3, '2021-09-20 02:46:46', '2021-09-20 02:46:46'),
(290, 209, 4, '2021-09-20 02:46:46', '2021-09-20 02:46:46'),
(291, 210, 1, '2021-09-20 02:55:25', '2021-09-20 02:55:25'),
(292, 214, 1, '2021-09-20 10:52:25', '2021-09-20 10:52:25'),
(293, 218, 4, '2021-09-20 14:08:26', '2021-09-20 14:08:26'),
(294, 218, 3, '2021-09-20 14:08:26', '2021-09-20 14:08:26'),
(295, 218, 2, '2021-09-20 14:08:26', '2021-09-20 14:08:26'),
(296, 218, 1, '2021-09-20 14:08:26', '2021-09-20 14:08:26'),
(297, 223, 1, '2021-09-20 16:01:28', '2021-09-20 16:01:28'),
(298, 223, 2, '2021-09-20 16:01:28', '2021-09-20 16:01:28'),
(300, 229, 1, '2021-09-21 10:29:48', '2021-09-21 10:29:48'),
(301, 245, 1, '2021-09-21 13:33:18', '2021-09-21 13:33:18'),
(302, 245, 2, '2021-09-21 13:33:18', '2021-09-21 13:33:18'),
(303, 205, 1, '2021-09-21 16:23:45', '2021-09-21 16:23:45'),
(304, 205, 3, '2021-09-21 16:23:45', '2021-09-21 16:23:45'),
(305, 257, 1, '2021-09-21 17:40:16', '2021-09-21 17:40:16');

-- --------------------------------------------------------

--
-- Table structure for table `dura_services_type`
--

CREATE TABLE `dura_services_type` (
  `id` int(11) NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dura_services_type`
--

INSERT INTO `dura_services_type` (`id`, `service_name`, `created_at`, `updated_at`) VALUES
(1, 'Dura Express', '2021-08-25 19:27:45', '2021-08-25 19:27:45'),
(2, 'Dura Eats', '2021-08-25 19:27:45', '2021-08-25 19:27:45'),
(3, 'Dura Shop', '2021-08-25 19:29:54', '2021-08-25 19:29:54');

-- --------------------------------------------------------

--
-- Table structure for table `emailconfiguration`
--

CREATE TABLE `emailconfiguration` (
  `id` int(11) NOT NULL,
  `hostname` varchar(255) DEFAULT NULL,
  `portnumber` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `encryption` varchar(255) DEFAULT NULL,
  `driver` varchar(255) DEFAULT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `subheading` varchar(255) DEFAULT NULL,
  `textmessage` text DEFAULT NULL,
  `facebook` text DEFAULT NULL,
  `twitter` text DEFAULT NULL,
  `instagram` text DEFAULT NULL,
  `linkedin` text DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `emailreceipt` text DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emailconfiguration`
--

INSERT INTO `emailconfiguration` (`id`, `hostname`, `portnumber`, `username`, `password`, `encryption`, `driver`, `heading`, `subheading`, `textmessage`, `facebook`, `twitter`, `instagram`, `linkedin`, `logo`, `image`, `emailreceipt`, `created_at`, `updated_at`) VALUES
(1, 'host', '10', 'upendra', 'Tiger!123', 'encryption', 'driver', 'heading', 'subheading', 'test messages', 'facebook', 'twitter', 'instagram', 'linkedin', '20210917180420-mvp300.jpg', '20210917180420-bike1.png', '20210917180420-WhatsApp Image 2021-08-01 at 6.32.18 PM.jpeg', '2021-09-17 18:04:20', '2021-09-17 12:34:20');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `client` varchar(250) DEFAULT NULL,
  `lead` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `start_date`, `end_date`, `client`, `lead`, `created_at`, `updated_at`) VALUES
(1, 'Lead- Lead One-16-10-2020 18:59:00', '2020-10-16 22:59:00', '2020-10-16 22:59:00', NULL, NULL, '2020-10-16 13:29:18', ''),
(2, 'Client- Client-17-10-2020 18:59:00', '2020-10-17 22:59:00', '2020-10-17 22:59:00', NULL, NULL, '2020-10-16 13:29:35', ''),
(3, 'Lead- Lead One-16-10-2020 17:37:00', '2020-10-16 21:37:00', '2020-10-16 21:37:00', NULL, NULL, '2020-10-16 13:37:51', ''),
(4, 'Lead- Lead One-30-09-2020 15:43:00', '2020-09-30 19:43:00', '2020-09-30 19:43:00', NULL, NULL, '2020-10-26 10:40:36', ''),
(5, 'Client- Client-11-11-2020 11:29:00', '2020-11-11 16:29:00', '2020-11-11 16:29:00', NULL, NULL, '2020-11-10 06:00:38', ''),
(6, 'Client- Client-30-11-2020 14:15:00', '2020-11-30 19:15:00', '2020-11-30 19:15:00', NULL, NULL, '2020-11-29 12:15:30', '');

-- --------------------------------------------------------

--
-- Table structure for table `ewallet_recharge`
--

CREATE TABLE `ewallet_recharge` (
  `id` int(11) NOT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `searchtext` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `receipt_number` text DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ewallet_recharge`
--

INSERT INTO `ewallet_recharge` (`id`, `user_type`, `searchtext`, `phone`, `payment_method`, `receipt_number`, `amount`, `description`, `created_at`, `updated_at`) VALUES
(1, 'user', 'phone', '07905848385', 'cash', 'testetgbbn', '100', '<p>test test</p>', '2021-09-18 16:33:30', '2021-09-18 11:03:30');

-- --------------------------------------------------------

--
-- Table structure for table `general_setting`
--

CREATE TABLE `general_setting` (
  `id` int(11) NOT NULL,
  `logo` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `android_maintenance_user` varchar(255) DEFAULT NULL,
  `android_user_version` varchar(255) DEFAULT NULL,
  `android_user_update` varchar(255) DEFAULT NULL,
  `android_maintenance_driver` varchar(255) DEFAULT NULL,
  `android_driver_version` varchar(255) DEFAULT NULL,
  `android_driver_update` varchar(255) DEFAULT NULL,
  `ios_maintenance_user` varchar(255) DEFAULT NULL,
  `ios_user_version` varchar(255) DEFAULT NULL,
  `ios_user_update` varchar(255) DEFAULT NULL,
  `ios_maintenance_driver` varchar(255) DEFAULT NULL,
  `ios_driver_version` varchar(255) DEFAULT NULL,
  `ios_driver_update` varchar(255) DEFAULT NULL,
  `user_walletone` varchar(255) DEFAULT NULL,
  `user_wallettwo` varchar(255) DEFAULT NULL,
  `user_walletthree` varchar(255) DEFAULT NULL,
  `driver_walletone` varchar(255) DEFAULT NULL,
  `driver_wallettwo` varchar(255) DEFAULT NULL,
  `driver_walletthree` varchar(255) DEFAULT NULL,
  `remind_for_doc` varchar(255) DEFAULT NULL,
  `fare_policy_text` varchar(255) DEFAULT NULL,
  `referral_value` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `issafe`
--

CREATE TABLE `issafe` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `watch_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `issafe`
--

INSERT INTO `issafe` (`id`, `user_id`, `watch_id`, `created_at`, `updated_at`) VALUES
(6, 144, 20, '2020-11-29 12:21:27', '2020-11-29 12:21:27');

-- --------------------------------------------------------

--
-- Table structure for table `itemduraexpress`
--

CREATE TABLE `itemduraexpress` (
  `itemid` bigint(20) NOT NULL,
  `itemtype` varchar(200) NOT NULL,
  `itemamount` decimal(10,0) NOT NULL,
  `itemremarks` varchar(500) NOT NULL,
  `itempicklocation` varchar(500) NOT NULL,
  `itempicklat` decimal(10,0) NOT NULL,
  `itempiclong` decimal(10,0) NOT NULL,
  `itemdroplocaion` varchar(500) NOT NULL,
  `itemdroplat` decimal(10,0) NOT NULL,
  `itemdroplong` decimal(10,0) NOT NULL,
  `itemschedule` datetime NOT NULL,
  `itemstoplocation` varchar(500) NOT NULL,
  `itemstoplat` decimal(10,0) NOT NULL,
  `itemstoplong` decimal(10,0) NOT NULL,
  `itemvichleId` int(11) NOT NULL,
  `itempayId` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `leadappointment`
--

CREATE TABLE `leadappointment` (
  `id` int(11) NOT NULL,
  `lead_id` int(11) DEFAULT 0,
  `client_id` int(11) DEFAULT 0,
  `event_id` int(11) DEFAULT NULL,
  `bookingdate` timestamp NULL DEFAULT current_timestamp(),
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leadappointment`
--

INSERT INTO `leadappointment` (`id`, `lead_id`, `client_id`, `event_id`, `bookingdate`, `comment`, `created_at`, `updated_at`) VALUES
(1, 0, 144, 6, '2020-11-30 19:15:00', 'kutyfhgv', '2020-11-29 12:15:30', '2020-11-29 12:15:30');

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` int(11) NOT NULL,
  `upload_by` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `gender` int(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL DEFAULT '''no-image.jpg''',
  `status` tinyint(4) DEFAULT NULL COMMENT '''0'' => Not-approve, ''1'' => Approve ''	',
  `status_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `upload_by`, `name`, `email`, `phone`, `country_id`, `address`, `dob`, `gender`, `image`, `status`, `status_id`, `created_at`, `updated_at`) VALUES
(5, 1, 'Lead One', 'leadone@gmail.comedit', '9020202020', 2, 'Street-4, Sanjay colony Sasni Hathras 204216', '14-09-2020', 0, '20200930121134-20130319_083314_1174_admin.png', NULL, 1, '2020-09-30 16:11:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `id` int(11) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `middlename` varchar(255) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `otp` varchar(6) NOT NULL,
  `otp_valid_until` datetime NOT NULL,
  `dob` date DEFAULT NULL,
  `city` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `manageraccountno` text DEFAULT NULL,
  `accname` text DEFAULT NULL,
  `gcashno` text DEFAULT NULL,
  `lastupdatedatetime` datetime NOT NULL,
  `profilephoto_url` text NOT NULL,
  `created_datetime` date NOT NULL,
  `isactive` tinyint(1) NOT NULL,
  `isvarified` tinyint(1) NOT NULL,
  `referralcode` varchar(200) NOT NULL,
  `isbusinessaccout` tinyint(1) NOT NULL,
  `latitude` decimal(12,9) NOT NULL,
  `longitude` decimal(12,9) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`id`, `firstname`, `middlename`, `lastname`, `mobile`, `otp`, `otp_valid_until`, `dob`, `city`, `state`, `country`, `password`, `email`, `manageraccountno`, `accname`, `gcashno`, `lastupdatedatetime`, `profilephoto_url`, `created_datetime`, `isactive`, `isvarified`, `referralcode`, `isbusinessaccout`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, 'mamager', 'manager', 'manager', '1234567890', '9192', '2021-07-03 13:59:03', '2021-07-03', '1', '1', '1', '$2a$08$TnLUue010iZQcUVL.b0bPeCaFvVqa221s0MmNopcnzeIg4q4jjxQa', 'manager@gmail.com', '1', '1', '1', '2021-09-03 23:21:27', '1', '2021-09-03', 1, 1, '1', 1, 15.545646500, 15.545646500, '2021-06-15 12:25:46', '2021-07-03 13:56:03');

-- --------------------------------------------------------

--
-- Table structure for table `marketplace`
--

CREATE TABLE `marketplace` (
  `id` int(11) NOT NULL,
  `watch_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `marketplace`
--

INSERT INTO `marketplace` (`id`, `watch_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 23, 144, '2020-11-18 07:39:46', '2020-11-18 07:39:46'),
(3, 19, 144, '2020-11-24 11:04:13', '2020-11-24 11:04:13'),
(4, 21, 144, '2020-11-27 11:51:28', '2020-11-27 11:51:28'),
(5, 19, 144, '2020-11-27 12:00:40', '2020-11-27 12:00:40');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `image` text DEFAULT NULL,
  `description` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `login_type` varchar(5) NOT NULL DEFAULT 'Ex',
  `is_read` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `user_id`, `image`, `description`, `type`, `login_type`, `is_read`, `reason`, `created_at`, `updated_at`) VALUES
(1, 298, NULL, 'Kashishgupta You have login successfully with Duradrive at September 10, 2021, 3:43 PM', 'login', 'Ex', 0, 'login', '2021-09-10 15:43:43', '2021-09-10 15:43:43'),
(2, 304, NULL, 'RobertMartinez You have login successfully with Duradrive at September 10, 2021, 11:47 PM', 'login', 'Ex', 1, 'login', '2021-09-10 23:47:56', '2021-09-10 23:47:56'),
(3, 303, NULL, 'VivekNigam You have login successfully with Duradrive at September 11, 2021, 2:52 AM', 'login', 'Ex', 1, 'login', '2021-09-11 02:52:37', '2021-09-11 02:52:37'),
(4, 303, NULL, ' You have add card successfully with Duradrive at September 11, 2021, 6:29 AM', 'cardupdate', 'Ex', 0, 'cardupdate', '2021-09-11 06:29:04', '2021-09-11 06:29:04'),
(5, 304, NULL, 'RobertMartinez You have login successfully with Duradrive at September 11, 2021, 12:08 PM', 'login', 'Ex', 1, 'login', '2021-09-11 12:08:37', '2021-09-11 12:08:37'),
(6, 304, NULL, 'RobertMartinez You have login successfully with Duradrive at September 11, 2021, 12:09 PM', 'login', 'Ex', 1, 'login', '2021-09-11 12:09:29', '2021-09-11 12:09:29'),
(7, 303, NULL, ' You have address deleted successfully with Duradrive at September 13, 2021, 9:03 AM', 'addressdeleted', 'Ex', 0, 'addressdeleted', '2021-09-13 09:03:35', '2021-09-13 09:03:35'),
(8, 303, NULL, ' You have delete docs successfully with Duradrive at September 15, 2021, 9:03 AM', 'deletedocs', 'Ex', 0, 'deletedocs', '2021-09-15 09:03:30', '2021-09-15 09:03:30'),
(9, 303, NULL, ' You have updated docs successfully with Duradrive at September 15, 2021, 9:03 AM', 'updatedocs', 'Ex', 0, 'updatedocs', '2021-09-15 09:03:47', '2021-09-15 09:03:47'),
(10, 323, NULL, ' You have register successfully with Duradrive atSeptember 15, 2021, 2:15 PM', 'registration', 'Ex', 0, 'registration', '2021-09-15 14:15:16', '2021-09-15 14:15:16'),
(11, 324, NULL, ' You have register successfully with Duradrive atSeptember 15, 2021, 2:43 PM', 'registration', 'Ex', 0, 'registration', '2021-09-15 14:43:42', '2021-09-15 14:43:42'),
(12, 324, NULL, ' You have update user name successfully with Duradrive at September 15, 2021, 2:47 PM', 'usernameupdate', 'Ex', 0, 'usernameupdate', '2021-09-15 14:47:05', '2021-09-15 14:47:05'),
(13, 324, NULL, ' You have update user name successfully with Duradrive at September 15, 2021, 2:50 PM', 'usernameupdate', 'Ex', 0, 'usernameupdate', '2021-09-15 14:50:55', '2021-09-15 14:50:55'),
(14, 324, NULL, ' You have phone update successfully with Duradrive at September 15, 2021, 2:57 PM', 'phoneupdate', 'Ex', 0, 'phoneupdate', '2021-09-15 14:57:12', '2021-09-15 14:57:12'),
(15, 324, NULL, ' You have update user name successfully with Duradrive at September 15, 2021, 2:57 PM', 'usernameupdate', 'Ex', 0, 'usernameupdate', '2021-09-15 14:57:36', '2021-09-15 14:57:36'),
(16, 324, NULL, ' You have update user name successfully with Duradrive at September 15, 2021, 2:59 PM', 'usernameupdate', 'Ex', 0, 'usernameupdate', '2021-09-15 14:59:17', '2021-09-15 14:59:17'),
(17, 303, NULL, 'VivekNigam You have login successfully with Duradrive at September 15, 2021, 3:38 PM', 'login', 'Ex', 0, 'login', '2021-09-15 15:38:44', '2021-09-15 15:38:44'),
(18, 325, NULL, ' You have register successfully with Duradrive atSeptember 15, 2021, 4:51 PM', 'registration', 'Ex', 1, 'registration', '2021-09-15 16:51:53', '2021-09-15 16:51:53'),
(19, 325, NULL, 'AmitSharan You have login successfully with Duradrive at September 15, 2021, 4:52 PM', 'login', 'Ex', 1, 'login', '2021-09-15 16:52:19', '2021-09-15 16:52:19'),
(20, 298, NULL, 'Kashishgupta You have login successfully with Duradrive at September 15, 2021, 4:55 PM', 'login', 'Ex', 0, 'login', '2021-09-15 16:55:34', '2021-09-15 16:55:34'),
(21, 298, NULL, 'Kashishgupta You have login successfully with Duradrive at September 15, 2021, 5:07 PM', 'login', 'Ex', 0, 'login', '2021-09-15 17:07:28', '2021-09-15 17:07:28'),
(22, 325, NULL, 'AmitSharan You have login successfully with Duradrive at September 15, 2021, 5:10 PM', 'login', 'Ex', 1, 'login', '2021-09-15 17:10:06', '2021-09-15 17:10:06'),
(23, 325, NULL, 'AmitSharan You have login successfully with Duradrive at September 15, 2021, 5:22 PM', 'login', 'Ex', 1, 'login', '2021-09-15 17:22:35', '2021-09-15 17:22:35'),
(24, 325, NULL, 'AmitSharan You have login successfully with Duradrive at September 15, 2021, 5:29 PM', 'login', 'Ex', 1, 'login', '2021-09-15 17:29:47', '2021-09-15 17:29:47'),
(25, 325, NULL, 'AmitSharan You have login successfully with Duradrive at September 15, 2021, 5:31 PM', 'login', 'Ex', 0, 'login', '2021-09-15 17:31:21', '2021-09-15 17:31:21'),
(26, 325, NULL, 'AmitSharan You have login successfully with Duradrive at September 15, 2021, 5:35 PM', 'login', 'Ex', 0, 'login', '2021-09-15 17:35:04', '2021-09-15 17:35:04'),
(27, 304, NULL, 'RobertMartinez You have login successfully with Duradrive at September 15, 2021, 5:59 PM', 'login', 'Ex', 1, 'login', '2021-09-15 17:59:45', '2021-09-15 17:59:45'),
(28, 304, NULL, 'RobertMartinez You have login successfully with Duradrive at September 15, 2021, 6:11 PM', 'login', 'Ex', 1, 'login', '2021-09-15 18:11:28', '2021-09-15 18:11:28'),
(29, 303, NULL, 'VivekNigam You have login successfully with Duradrive at September 16, 2021, 4:41 AM', 'login', 'Ex', 0, 'login', '2021-09-16 04:41:28', '2021-09-16 04:41:28'),
(30, 326, NULL, ' You have register successfully with Duradrive atSeptember 16, 2021, 5:36 AM', 'registration', 'Ex', 0, 'registration', '2021-09-16 05:36:14', '2021-09-16 05:36:14'),
(31, 327, NULL, ' You have register successfully with Duradrive atSeptember 16, 2021, 11:59 AM', 'registration', 'Ex', 0, 'registration', '2021-09-16 11:59:35', '2021-09-16 11:59:35'),
(32, 303, NULL, 'VivekNigam You have login successfully with Duradrive at September 16, 2021, 12:09 PM', 'login', 'Ex', 0, 'login', '2021-09-16 12:09:32', '2021-09-16 12:09:32'),
(33, 303, NULL, 'VivekNigam You have login successfully with Duradrive at September 16, 2021, 12:23 PM', 'login', 'Ex', 0, 'login', '2021-09-16 12:23:14', '2021-09-16 12:23:14'),
(34, 304, NULL, 'RobertMartinez You have login successfully with Duradrive at September 17, 2021, 6:39 AM', 'login', 'Ex', 1, 'login', '2021-09-17 06:39:49', '2021-09-17 06:39:49'),
(35, 303, NULL, 'VivekNigam You have login successfully with Duradrive at September 17, 2021, 7:15 AM', 'login', 'Ex', 0, 'login', '2021-09-17 07:15:28', '2021-09-17 07:15:28'),
(36, 303, NULL, 'VivekNigam You have login successfully with Duradrive at September 17, 2021, 9:12 AM', 'login', 'Ex', 0, 'login', '2021-09-17 09:12:22', '2021-09-17 09:12:22'),
(37, 328, NULL, ' You have register successfully with Duradrive atSeptember 17, 2021, 11:16 AM', 'registration', 'Ex', 0, 'registration', '2021-09-17 11:16:56', '2021-09-17 11:16:56'),
(38, 329, NULL, ' You have register successfully with Duradrive atSeptember 17, 2021, 11:16 AM', 'registration', 'Ex', 0, 'registration', '2021-09-17 11:16:56', '2021-09-17 11:16:56'),
(39, 303, NULL, 'VivekNigam You have login successfully with Duradrive at September 17, 2021, 1:46 PM', 'login', 'Ex', 0, 'login', '2021-09-17 13:46:45', '2021-09-17 13:46:45'),
(40, 303, NULL, 'VivekNigam You have login successfully with Duradrive at September 17, 2021, 1:51 PM', 'login', 'Ex', 0, 'login', '2021-09-17 13:51:59', '2021-09-17 13:51:59'),
(41, 303, NULL, 'VivekNigam You have login successfully with Duradrive at September 17, 2021, 1:58 PM', 'login', 'Ex', 0, 'login', '2021-09-17 13:58:14', '2021-09-17 13:58:14'),
(42, 304, NULL, 'RobertMartinez You have login successfully with Duradrive at September 17, 2021, 2:21 PM', 'login', 'Ex', 1, 'login', '2021-09-17 14:21:28', '2021-09-17 14:21:28'),
(43, 303, NULL, 'VivekNigam You have login successfully with Duradrive at September 17, 2021, 2:24 PM', 'login', 'Ex', 0, 'login', '2021-09-17 14:24:05', '2021-09-17 14:24:05'),
(44, 303, NULL, 'VivekNigam You have login successfully with Duradrive at September 17, 2021, 2:54 PM', 'login', 'Ex', 0, 'login', '2021-09-17 14:54:45', '2021-09-17 14:54:45'),
(45, 303, NULL, 'VivekNigam You have login successfully with Duradrive at September 17, 2021, 2:59 PM', 'login', 'Ex', 0, 'login', '2021-09-17 14:59:35', '2021-09-17 14:59:35'),
(46, 303, NULL, 'VivekNigam You have login successfully with Duradrive at September 17, 2021, 3:09 PM', 'login', 'Ex', 0, 'login', '2021-09-17 15:09:28', '2021-09-17 15:09:28'),
(47, 303, NULL, 'VivekNigam You have login successfully with Duradrive at September 18, 2021, 2:32 AM', 'login', 'Ex', 0, 'login', '2021-09-18 02:32:46', '2021-09-18 02:32:46'),
(48, 303, NULL, 'VivekNigam You have login successfully with Duradrive at September 18, 2021, 3:14 AM', 'login', 'Ex', 0, 'login', '2021-09-18 03:14:08', '2021-09-18 03:14:08'),
(49, 303, NULL, 'VivekNigam You have login successfully with Duradrive at September 18, 2021, 3:51 AM', 'login', 'Ex', 0, 'login', '2021-09-18 03:51:30', '2021-09-18 03:51:30'),
(50, 303, NULL, 'VivekNigam You have login successfully with Duradrive at September 18, 2021, 3:58 AM', 'login', 'Ex', 0, 'login', '2021-09-18 03:58:47', '2021-09-18 03:58:47'),
(51, 303, NULL, 'VivekNigam You have login successfully with Duradrive at September 18, 2021, 4:05 AM', 'login', 'Ex', 0, 'login', '2021-09-18 04:05:46', '2021-09-18 04:05:46'),
(52, 303, NULL, 'VivekNigam You have login successfully with Duradrive at September 18, 2021, 4:11 AM', 'login', 'Ex', 0, 'login', '2021-09-18 04:11:04', '2021-09-18 04:11:04'),
(53, 303, NULL, 'VivekNigam You have login successfully with Duradrive at September 18, 2021, 4:18 AM', 'login', 'Ex', 0, 'login', '2021-09-18 04:18:44', '2021-09-18 04:18:44'),
(54, 303, NULL, 'VivekNigam You have login successfully with Duradrive at September 18, 2021, 4:51 AM', 'login', 'Ex', 0, 'login', '2021-09-18 04:51:30', '2021-09-18 04:51:30'),
(55, 303, NULL, ' You have update user name successfully with Duradrive at September 18, 2021, 5:33 AM', 'usernameupdate', 'Ex', 0, 'usernameupdate', '2021-09-18 05:33:44', '2021-09-18 05:33:44'),
(56, 303, NULL, 'VivekNigam You have login successfully with Duradrive at September 18, 2021, 5:43 AM', 'login', 'Ex', 0, 'login', '2021-09-18 05:43:00', '2021-09-18 05:43:00'),
(57, 303, NULL, 'VivekNigam You have login successfully with Duradrive at September 18, 2021, 6:44 AM', 'login', 'Ex', 0, 'login', '2021-09-18 06:44:57', '2021-09-18 06:44:57'),
(58, 303, NULL, 'VivekNigam You have login successfully with Duradrive at September 18, 2021, 6:49 AM', 'login', 'Ex', 0, 'login', '2021-09-18 06:49:17', '2021-09-18 06:49:17'),
(59, 303, NULL, ' You have address deleted successfully with Duradrive at September 18, 2021, 6:49 AM', 'addressdeleted', 'Ex', 0, 'addressdeleted', '2021-09-18 06:49:54', '2021-09-18 06:49:54'),
(60, 303, NULL, ' You have address deleted successfully with Duradrive at September 18, 2021, 6:49 AM', 'addressdeleted', 'Ex', 0, 'addressdeleted', '2021-09-18 06:49:59', '2021-09-18 06:49:59'),
(61, 303, NULL, 'VivekNigam You have login successfully with Duradrive at September 18, 2021, 7:11 AM', 'login', 'Ex', 0, 'login', '2021-09-18 07:11:38', '2021-09-18 07:11:38'),
(62, 303, NULL, 'VivekNigam You have login successfully with Duradrive at September 18, 2021, 9:12 AM', 'login', 'Ex', 0, 'login', '2021-09-18 09:12:09', '2021-09-18 09:12:09'),
(63, 303, NULL, 'VivekNigam You have login successfully with Duradrive at September 18, 2021, 9:44 AM', 'login', 'Ex', 0, 'login', '2021-09-18 09:44:39', '2021-09-18 09:44:39'),
(64, 303, NULL, 'VivekNigam You have login successfully with Duradrive at September 18, 2021, 10:39 AM', 'login', 'Ex', 0, 'login', '2021-09-18 10:39:59', '2021-09-18 10:39:59'),
(65, 325, NULL, ' You have update user name successfully with Duradrive at September 18, 2021, 2:11 PM', 'usernameupdate', 'Ex', 1, 'usernameupdate', '2021-09-18 14:11:37', '2021-09-18 14:11:37'),
(66, 303, NULL, 'You have login successfully with Duradrive at September 18, 2021, 5:27 PM', 'login', 'Ex', 0, 'login', '2021-09-18 17:27:21', '2021-09-18 17:27:21'),
(67, 141, NULL, ' You have card deleted successfully with Duradrive at September 18, 2021, 6:31 PM', 'carddeleted', 'Ex', 0, 'carddeleted', '2021-09-18 18:31:02', '2021-09-18 18:31:02'),
(68, 141, NULL, ' You have add card successfully with Duradrive at September 18, 2021, 6:33 PM', 'addcard', 'Ex', 0, 'addcard', '2021-09-18 18:33:41', '2021-09-18 18:33:41'),
(69, 330, NULL, 'You have register successfully with Duradrive atSeptember 18, 2021, 6:41 PM', 'registration', 'Ex', 0, 'registration', '2021-09-18 18:41:08', '2021-09-18 18:41:08'),
(70, 330, NULL, 'You have login successfully with Duradrive at September 18, 2021, 6:41 PM', 'login', 'Ex', 0, 'login', '2021-09-18 18:41:59', '2021-09-18 18:41:59'),
(71, 330, NULL, 'You have login successfully with Duradrive at September 18, 2021, 6:47 PM', 'login', 'Ex', 0, 'login', '2021-09-18 18:47:39', '2021-09-18 18:47:39'),
(72, 1, NULL, ' You have address update successfully with Duradrive at September 18, 2021, 7:15 PM', 'addressupdate', 'Ex', 0, 'addressupdate', '2021-09-18 19:15:05', '2021-09-18 19:15:05'),
(73, 325, NULL, ' You have country update successfully with Duradrive at September 18, 2021, 7:21 PM', 'countryupdate', 'Ex', 0, 'countryupdate', '2021-09-18 19:21:39', '2021-09-18 19:21:39'),
(74, 325, NULL, ' You have card deleted successfully with Duradrive at September 18, 2021, 7:26 PM', 'carddeleted', 'Ex', 0, 'carddeleted', '2021-09-18 19:26:53', '2021-09-18 19:26:53'),
(75, 141, NULL, ' You have add card successfully with Duradrive at September 18, 2021, 7:26 PM', 'addcard', 'Ex', 0, 'addcard', '2021-09-18 19:26:55', '2021-09-18 19:26:55'),
(76, 325, NULL, ' You have card deleted successfully with Duradrive at September 18, 2021, 7:26 PM', 'carddeleted', 'Ex', 0, 'carddeleted', '2021-09-18 19:26:56', '2021-09-18 19:26:56'),
(77, 325, NULL, ' You have card deleted successfully with Duradrive at September 18, 2021, 7:26 PM', 'carddeleted', 'Ex', 0, 'carddeleted', '2021-09-18 19:26:57', '2021-09-18 19:26:57'),
(78, 325, NULL, ' You have add card successfully with Duradrive at September 18, 2021, 7:27 PM', 'addcard', 'Ex', 0, 'addcard', '2021-09-18 19:27:23', '2021-09-18 19:27:23'),
(79, 325, NULL, ' You have card deleted successfully with Duradrive at September 18, 2021, 7:27 PM', 'carddeleted', 'Ex', 0, 'carddeleted', '2021-09-18 19:27:27', '2021-09-18 19:27:27'),
(80, 325, NULL, ' You have add card successfully with Duradrive at September 18, 2021, 7:28 PM', 'addcard', 'Ex', 0, 'addcard', '2021-09-18 19:28:13', '2021-09-18 19:28:13'),
(81, 141, NULL, ' You have card deleted successfully with Duradrive at September 18, 2021, 7:28 PM', 'carddeleted', 'Ex', 0, 'carddeleted', '2021-09-18 19:28:15', '2021-09-18 19:28:15'),
(82, 325, NULL, ' You have address deleted successfully with Duradrive at September 18, 2021, 7:28 PM', 'addressdeleted', 'Ex', 0, 'addressdeleted', '2021-09-18 19:28:25', '2021-09-18 19:28:25'),
(83, 149, NULL, ' You have placed order successfully with Duradrive at September 18, 2021, 7:43 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-18 19:43:33', '2021-09-18 19:43:33'),
(84, 298, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 1:04 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 01:04:40', '2021-09-19 01:04:40'),
(85, 298, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 1:05 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 01:05:43', '2021-09-19 01:05:43'),
(86, 304, NULL, 'You have login successfully with Duradrive at September 19, 2021, 1:26 AM', 'login', 'Ex', 0, 'login', '2021-09-19 01:26:04', '2021-09-19 01:26:04'),
(87, 304, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 1:26 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 01:26:45', '2021-09-19 01:26:45'),
(88, 304, NULL, ' You have update user name successfully with Duradrive at September 19, 2021, 1:28 AM', 'usernameupdate', 'Ex', 0, 'usernameupdate', '2021-09-19 01:28:13', '2021-09-19 01:28:13'),
(89, 304, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 1:29 AM', 'placedorder', 'Ex', 1, 'placedorder', '2021-09-19 01:29:13', '2021-09-19 01:29:13'),
(90, 331, NULL, 'You have register successfully with Duradrive atSeptember 19, 2021, 1:33 AM', 'registration', 'Ex', 0, 'registration', '2021-09-19 01:33:11', '2021-09-19 01:33:11'),
(91, 304, NULL, 'You have login successfully with Duradrive at September 19, 2021, 2:30 AM', 'login', 'Ex', 0, 'login', '2021-09-19 02:30:30', '2021-09-19 02:30:30'),
(92, 303, NULL, ' You have card deleted successfully with Duradrive at September 19, 2021, 3:34 AM', 'carddeleted', 'Ex', 0, 'carddeleted', '2021-09-19 03:34:43', '2021-09-19 03:34:43'),
(93, 303, NULL, ' You have card deleted successfully with Duradrive at September 19, 2021, 3:34 AM', 'carddeleted', 'Ex', 0, 'carddeleted', '2021-09-19 03:34:46', '2021-09-19 03:34:46'),
(94, 303, NULL, ' You have add card successfully with Duradrive at September 19, 2021, 3:35 AM', 'addcard', 'Ex', 0, 'addcard', '2021-09-19 03:35:11', '2021-09-19 03:35:11'),
(95, 303, NULL, ' You have add card successfully with Duradrive at September 19, 2021, 3:35 AM', 'cardupdate', 'Ex', 0, 'cardupdate', '2021-09-19 03:35:19', '2021-09-19 03:35:19'),
(96, 303, NULL, ' You have add card successfully with Duradrive at September 19, 2021, 3:35 AM', 'cardupdate', 'Ex', 0, 'cardupdate', '2021-09-19 03:35:26', '2021-09-19 03:35:26'),
(97, 303, NULL, ' You have address deleted successfully with Duradrive at September 19, 2021, 3:35 AM', 'addressdeleted', 'Ex', 0, 'addressdeleted', '2021-09-19 03:35:37', '2021-09-19 03:35:37'),
(98, 303, NULL, 'You have login successfully with Duradrive at September 19, 2021, 3:55 AM', 'login', 'Ex', 0, 'login', '2021-09-19 03:55:19', '2021-09-19 03:55:19'),
(99, 303, NULL, 'You have login successfully with Duradrive at September 19, 2021, 3:57 AM', 'login', 'Ex', 0, 'login', '2021-09-19 03:57:13', '2021-09-19 03:57:13'),
(100, 303, NULL, 'You have login successfully with Duradrive at September 19, 2021, 4:07 AM', 'login', 'Ex', 0, 'login', '2021-09-19 04:07:07', '2021-09-19 04:07:07'),
(101, 303, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 5:29 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 05:29:49', '2021-09-19 05:29:49'),
(102, 303, NULL, 'You have login successfully with Duradrive at September 19, 2021, 5:42 AM', 'login', 'Ex', 0, 'login', '2021-09-19 05:42:35', '2021-09-19 05:42:35'),
(103, 303, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 5:50 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 05:50:57', '2021-09-19 05:50:57'),
(104, 303, NULL, ' You have address deleted successfully with Duradrive at September 19, 2021, 5:59 AM', 'addressdeleted', 'Ex', 0, 'addressdeleted', '2021-09-19 05:59:29', '2021-09-19 05:59:29'),
(105, 303, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 6:21 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 06:21:45', '2021-09-19 06:21:45'),
(106, 1, NULL, ' You have address update successfully with Duradrive at September 19, 2021, 7:32 AM', 'addressupdate', 'Ex', 0, 'addressupdate', '2021-09-19 07:32:42', '2021-09-19 07:32:42'),
(107, 303, NULL, ' You have address update successfully with Duradrive at September 19, 2021, 7:36 AM', 'addressupdate', 'Ex', 1, 'addressupdate', '2021-09-19 07:36:57', '2021-09-19 07:36:57'),
(108, 303, NULL, ' You have address update successfully with Duradrive at September 19, 2021, 7:37 AM', 'addressupdate', 'Ex', 0, 'addressupdate', '2021-09-19 07:37:31', '2021-09-19 07:37:31'),
(109, 303, NULL, ' You have address deleted successfully with Duradrive at September 19, 2021, 8:46 AM', 'addressdeleted', 'Ex', 0, 'addressdeleted', '2021-09-19 08:46:53', '2021-09-19 08:46:53'),
(110, 303, NULL, ' You have address deleted successfully with Duradrive at September 19, 2021, 9:07 AM', 'addressdeleted', 'Ex', 0, 'addressdeleted', '2021-09-19 09:07:18', '2021-09-19 09:07:18'),
(111, 303, NULL, ' You have update user name successfully with Duradrive at September 19, 2021, 9:51 AM', 'usernameupdate', 'Ex', 0, 'usernameupdate', '2021-09-19 09:51:23', '2021-09-19 09:51:23'),
(112, 325, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 9:56 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 09:56:18', '2021-09-19 09:56:18'),
(113, 325, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 9:56 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 09:56:40', '2021-09-19 09:56:40'),
(114, 325, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 9:56 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 09:56:48', '2021-09-19 09:56:48'),
(115, 325, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 9:57 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 09:57:02', '2021-09-19 09:57:02'),
(116, 325, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 9:57 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 09:57:30', '2021-09-19 09:57:30'),
(117, 325, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 9:57 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 09:57:47', '2021-09-19 09:57:47'),
(118, 325, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 9:58 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 09:58:12', '2021-09-19 09:58:12'),
(119, 325, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 9:58 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 09:58:22', '2021-09-19 09:58:22'),
(120, 325, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 9:58 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 09:58:26', '2021-09-19 09:58:26'),
(121, 325, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 9:58 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 09:58:33', '2021-09-19 09:58:33'),
(122, 325, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 9:58 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 09:58:39', '2021-09-19 09:58:39'),
(123, 325, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 10:03 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 10:03:52', '2021-09-19 10:03:52'),
(124, 325, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 10:04 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 10:04:27', '2021-09-19 10:04:27'),
(125, 325, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 10:04 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 10:04:36', '2021-09-19 10:04:36'),
(126, 325, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 10:04 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 10:04:45', '2021-09-19 10:04:45'),
(127, 325, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 10:04 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 10:04:53', '2021-09-19 10:04:53'),
(128, 325, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 10:05 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 10:05:20', '2021-09-19 10:05:20'),
(129, 149, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 10:29 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 10:29:00', '2021-09-19 10:29:00'),
(130, 149, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 10:29 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 10:29:02', '2021-09-19 10:29:02'),
(131, 149, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 10:29 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 10:29:05', '2021-09-19 10:29:05'),
(132, 149, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 10:29 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 10:29:06', '2021-09-19 10:29:06'),
(133, 149, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 10:29 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 10:29:08', '2021-09-19 10:29:08'),
(134, 149, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 10:29 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 10:29:09', '2021-09-19 10:29:09'),
(135, 149, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 10:29 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 10:29:11', '2021-09-19 10:29:11'),
(136, 149, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 10:29 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 10:29:12', '2021-09-19 10:29:12'),
(137, 149, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 10:29 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 10:29:14', '2021-09-19 10:29:14'),
(138, 149, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 10:29 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 10:29:16', '2021-09-19 10:29:16'),
(139, 149, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 10:29 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 10:29:46', '2021-09-19 10:29:46'),
(140, 149, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 10:29 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 10:29:48', '2021-09-19 10:29:48'),
(141, 149, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 10:38 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 10:38:49', '2021-09-19 10:38:49'),
(142, 303, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 10:45 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 10:45:23', '2021-09-19 10:45:23'),
(143, 303, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 10:49 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 10:49:22', '2021-09-19 10:49:22'),
(144, 303, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 10:49 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 10:49:43', '2021-09-19 10:49:43'),
(145, 303, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 10:52 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 10:52:41', '2021-09-19 10:52:41'),
(146, 325, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 12:49 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 12:49:40', '2021-09-19 12:49:40'),
(147, 298, NULL, ' You have placed order successfully with Duradrive at September 19, 2021, 2:11 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-19 14:11:22', '2021-09-19 14:11:22'),
(148, 332, NULL, 'You have register successfully with Duradrive atSeptember 20, 2021, 2:40 AM', 'registration', 'Ex', 0, 'registration', '2021-09-20 02:40:33', '2021-09-20 02:40:33'),
(149, 332, NULL, ' You have placed order successfully with Duradrive at September 20, 2021, 2:46 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-20 02:46:46', '2021-09-20 02:46:46'),
(150, 304, NULL, ' You have placed order successfully with Duradrive at September 20, 2021, 2:55 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-20 02:55:25', '2021-09-20 02:55:25'),
(151, 304, NULL, 'You have login successfully with Duradrive at September 20, 2021, 5:07 AM', 'login', 'Ex', 0, 'login', '2021-09-20 05:07:22', '2021-09-20 05:07:22'),
(152, 304, NULL, ' You have phone update successfully with Duradrive at September 20, 2021, 7:29 AM', 'phoneupdate', 'Ex', 0, 'phoneupdate', '2021-09-20 07:29:45', '2021-09-20 07:29:45'),
(153, 304, NULL, ' You have phone update successfully with Duradrive at September 20, 2021, 7:30 AM', 'phoneupdate', 'Ex', 0, 'phoneupdate', '2021-09-20 07:30:27', '2021-09-20 07:30:27'),
(154, 325, NULL, ' You have placed order successfully with Duradrive at September 20, 2021, 9:14 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-20 09:14:04', '2021-09-20 09:14:04'),
(155, 325, NULL, ' You have placed order successfully with Duradrive at September 20, 2021, 10:28 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-20 10:28:00', '2021-09-20 10:28:00'),
(156, 304, NULL, 'You have login successfully with Duradrive at September 20, 2021, 10:51 AM', 'login', 'Ex', 0, 'login', '2021-09-20 10:51:13', '2021-09-20 10:51:13'),
(157, 304, NULL, ' You have placed order successfully with Duradrive at September 20, 2021, 10:52 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-20 10:52:25', '2021-09-20 10:52:25'),
(158, 325, NULL, ' You have placed order successfully with Duradrive at September 20, 2021, 11:02 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-20 11:02:57', '2021-09-20 11:02:57'),
(159, 325, NULL, ' You have placed order successfully with Duradrive at September 20, 2021, 1:38 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-20 13:38:50', '2021-09-20 13:38:50'),
(160, 304, NULL, ' You have placed order successfully with Duradrive at September 20, 2021, 2:08 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-20 14:08:26', '2021-09-20 14:08:26'),
(161, 304, NULL, 'You have login successfully with Duradrive at September 20, 2021, 2:30 PM', 'login', 'Ex', 0, 'login', '2021-09-20 14:30:07', '2021-09-20 14:30:07'),
(162, 325, NULL, ' You have placed order successfully with Duradrive at September 20, 2021, 3:47 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-20 15:47:21', '2021-09-20 15:47:21'),
(163, 298, NULL, ' You have placed order successfully with Duradrive at September 20, 2021, 3:47 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-20 15:47:58', '2021-09-20 15:47:58'),
(164, 298, NULL, ' You have placed order successfully with Duradrive at September 20, 2021, 3:48 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-20 15:48:05', '2021-09-20 15:48:05'),
(165, 298, NULL, ' You have placed order successfully with Duradrive at September 20, 2021, 3:59 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-20 15:59:25', '2021-09-20 15:59:25'),
(166, 303, NULL, 'You have login successfully with Duradrive at September 20, 2021, 4:00 PM', 'login', 'Ex', 0, 'login', '2021-09-20 16:00:06', '2021-09-20 16:00:06'),
(167, 303, NULL, ' You have placed order successfully with Duradrive at September 20, 2021, 4:01 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-20 16:01:28', '2021-09-20 16:01:28'),
(168, 298, NULL, ' You have placed order successfully with Duradrive at September 20, 2021, 4:03 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-20 16:03:04', '2021-09-20 16:03:04'),
(169, 325, NULL, ' You have placed order successfully with Duradrive at September 20, 2021, 4:18 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-20 16:18:07', '2021-09-20 16:18:07'),
(170, 303, NULL, 'You have login successfully with Duradrive at September 21, 2021, 6:22 AM', 'login', 'Ex', 0, 'login', '2021-09-21 06:22:51', '2021-09-21 06:22:51'),
(171, 325, NULL, ' You have placed order successfully with Duradrive at September 21, 2021, 10:29 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-21 10:29:29', '2021-09-21 10:29:29'),
(172, 325, NULL, ' You have placed order successfully with Duradrive at September 21, 2021, 10:29 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-21 10:29:48', '2021-09-21 10:29:48'),
(173, 325, NULL, ' You have placed order successfully with Duradrive at September 21, 2021, 11:53 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-21 11:53:10', '2021-09-21 11:53:10'),
(174, 325, NULL, ' You have placed order successfully with Duradrive at September 21, 2021, 11:57 AM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-21 11:57:29', '2021-09-21 11:57:29'),
(175, 325, NULL, ' You have placed order successfully with Duradrive at September 21, 2021, 12:08 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-21 12:08:48', '2021-09-21 12:08:48'),
(176, 325, NULL, ' You have placed order successfully with Duradrive at September 21, 2021, 12:16 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-21 12:16:01', '2021-09-21 12:16:01'),
(177, 325, NULL, ' You have placed order successfully with Duradrive at September 21, 2021, 12:25 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-21 12:25:08', '2021-09-21 12:25:08'),
(178, 325, NULL, ' You have placed order successfully with Duradrive at September 21, 2021, 12:27 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-21 12:27:59', '2021-09-21 12:27:59'),
(179, 325, NULL, ' You have placed order successfully with Duradrive at September 21, 2021, 12:28 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-21 12:28:00', '2021-09-21 12:28:00'),
(180, 325, NULL, ' You have placed order successfully with Duradrive at September 21, 2021, 12:31 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-21 12:31:59', '2021-09-21 12:31:59'),
(181, 325, NULL, ' You have placed order successfully with Duradrive at September 21, 2021, 12:41 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-21 12:41:23', '2021-09-21 12:41:23'),
(182, 325, NULL, ' You have placed order successfully with Duradrive at September 21, 2021, 12:42 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-21 12:42:25', '2021-09-21 12:42:25'),
(183, 325, NULL, ' You have placed order successfully with Duradrive at September 21, 2021, 12:47 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-21 12:47:49', '2021-09-21 12:47:49'),
(184, 325, NULL, ' You have placed order successfully with Duradrive at September 21, 2021, 12:49 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-21 12:49:50', '2021-09-21 12:49:50'),
(185, 325, NULL, ' You have placed order successfully with Duradrive at September 21, 2021, 12:52 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-21 12:52:03', '2021-09-21 12:52:03'),
(186, 325, NULL, ' You have placed order successfully with Duradrive at September 21, 2021, 1:02 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-21 13:02:16', '2021-09-21 13:02:16'),
(187, 303, NULL, 'You have login successfully with Duradrive at September 21, 2021, 1:28 PM', 'login', 'Ex', 0, 'login', '2021-09-21 13:28:54', '2021-09-21 13:28:54'),
(188, 325, NULL, ' You have placed order successfully with Duradrive at September 21, 2021, 1:31 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-21 13:31:04', '2021-09-21 13:31:04'),
(189, 303, NULL, ' You have placed order successfully with Duradrive at September 21, 2021, 1:33 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-21 13:33:18', '2021-09-21 13:33:18'),
(190, 325, NULL, ' You have placed order successfully with Duradrive at September 21, 2021, 1:34 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-21 13:34:39', '2021-09-21 13:34:39'),
(191, 325, NULL, ' You have placed order successfully with Duradrive at September 21, 2021, 1:36 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-21 13:36:41', '2021-09-21 13:36:41'),
(192, 325, NULL, ' You have placed order successfully with Duradrive at September 21, 2021, 1:40 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-21 13:40:34', '2021-09-21 13:40:34'),
(193, 303, NULL, ' You have placed order successfully with Duradrive at September 21, 2021, 4:23 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-21 16:23:45', '2021-09-21 16:23:45'),
(194, 325, NULL, ' You have placed order successfully with Duradrive at September 21, 2021, 4:25 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-21 16:25:42', '2021-09-21 16:25:42'),
(195, 325, NULL, ' You have placed order successfully with Duradrive at September 21, 2021, 4:46 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-21 16:46:15', '2021-09-21 16:46:15'),
(196, 325, NULL, ' You have placed order successfully with Duradrive at September 21, 2021, 4:52 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-21 16:52:54', '2021-09-21 16:52:54'),
(197, 304, NULL, 'You have login successfully with Duradrive at September 21, 2021, 5:39 PM', 'login', 'Ex', 0, 'login', '2021-09-21 17:39:34', '2021-09-21 17:39:34'),
(198, 304, NULL, ' You have placed order successfully with Duradrive at September 21, 2021, 5:40 PM', 'placedorder', 'Ex', 0, 'placedorder', '2021-09-21 17:40:16', '2021-09-21 17:40:16');

-- --------------------------------------------------------

--
-- Table structure for table `notification_setting`
--

CREATE TABLE `notification_setting` (
  `id` int(11) NOT NULL,
  `web_key` text DEFAULT NULL,
  `rest_key` text DEFAULT NULL,
  `application_key` text DEFAULT NULL,
  `user_rest_key` text DEFAULT NULL,
  `driver_application_key` text DEFAULT NULL,
  `driver_rest_key` text DEFAULT NULL,
  `merchant_application_key` text DEFAULT NULL,
  `merchant_rest_key` text DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification_setting`
--

INSERT INTO `notification_setting` (`id`, `web_key`, `rest_key`, `application_key`, `user_rest_key`, `driver_application_key`, `driver_rest_key`, `merchant_application_key`, `merchant_rest_key`, `created_at`, `updated_at`) VALUES
(1, 'web key', 'rest key', 'user key', 'rest key', 'driver key', 'rest key', 'merchant key', 'm rest ket', NULL, '2021-09-19 05:55:27');

-- --------------------------------------------------------

--
-- Table structure for table `offer`
--

CREATE TABLE `offer` (
  `id` int(11) NOT NULL,
  `watch_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `modal` varchar(255) DEFAULT NULL,
  `offertype` varchar(250) DEFAULT NULL,
  `offer` varchar(255) DEFAULT NULL,
  `realprice` varchar(255) DEFAULT NULL,
  `finalprice` varchar(250) DEFAULT '0',
  `action` varchar(250) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `offer`
--

INSERT INTO `offer` (`id`, `watch_id`, `client_id`, `country`, `modal`, `offertype`, `offer`, `realprice`, `finalprice`, `action`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 36, 144, 'AFGHANISTAN', 'OYSTER PERPETUAL CLASSIQUES', 'percentage', '+10', NULL, '17930', NULL, 1, '2020-11-26 08:22:36', '2020-11-26 08:22:36', NULL),
(2, 19, 144, 'AFGHANISTAN', 'OYSTER PERPETUAL CLASSIQUES', 'percentage', '-10', '5800', '5220', NULL, 1, '2020-11-26 08:34:41', '2020-11-26 08:34:41', NULL),
(3, 20, 144, 'INDIA', 'OYSTER PERPETUAL CLASSIQUES', 'amount', '6800', '6850', '6800', NULL, 1, '2020-11-26 08:34:54', '2020-11-26 08:34:54', NULL),
(4, 20, 144, 'INDIA', 'OYSTER PERPETUAL CLASSIQUES', 'percentage', '+10', '6850', '7535', NULL, 1, '2020-11-26 08:35:50', '2020-11-26 08:35:50', NULL),
(5, 19, 144, 'INDIA', 'OYSTER PERPETUAL CLASSIQUES', 'amount', '6000', '5800', '6000', NULL, 1, '2020-11-26 08:38:48', '2020-11-26 08:38:48', NULL),
(6, 20, 144, 'AFGHANISTAN', 'OYSTER PERPETUAL CLASSIQUES', 'amount', '7000', '6850', '7000', NULL, 1, '2020-11-26 08:39:10', '2020-11-26 08:39:10', NULL),
(7, 23, 144, 'AFGHANISTAN', 'OYSTER PERPETUAL CLASSIQUES', 'percentage', '+10', '15200', '16720', NULL, 1, '2020-11-27 12:00:17', '2020-11-27 12:00:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `offeraction`
--

CREATE TABLE `offeraction` (
  `id` int(11) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `offeraction`
--

INSERT INTO `offeraction` (`id`, `offer_id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 144, 1, '2020-11-26 10:53:34', '2020-11-26 10:53:34'),
(2, 4, 144, 1, '2020-11-27 11:54:37', '2020-11-27 11:54:37');

-- --------------------------------------------------------

--
-- Table structure for table `offermaster`
--

CREATE TABLE `offermaster` (
  `offerid` bigint(20) NOT NULL,
  `offerdescription` varchar(300) NOT NULL,
  `promocode` varchar(100) NOT NULL,
  `discount_percentage` decimal(10,0) NOT NULL,
  `valid_till` datetime NOT NULL,
  `driveuserid` bigint(11) NOT NULL,
  `Isused` tinyint(1) NOT NULL,
  `apply_datetime` datetime NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int(11) NOT NULL,
  `options_name` text NOT NULL,
  `description` text NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `options_name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, '34343434343', 'hello', 'active', '2021-08-28 15:58:09', '2021-08-28 16:14:59'),
(2, '3434324', 'test3434', 'active', '2021-08-28 15:58:41', '2021-08-28 16:14:34'),
(3, 'Test option', 'test Option', 'active', '2021-08-28 16:22:31', '2021-08-29 22:52:02');

-- --------------------------------------------------------

--
-- Table structure for table `ordermaster`
--

CREATE TABLE `ordermaster` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ordernumber` varchar(300) NOT NULL,
  `orderdatetime` datetime NOT NULL DEFAULT current_timestamp(),
  `ordertypeid` bigint(20) NOT NULL,
  `itemid_productid` bigint(20) NOT NULL,
  `itemtype` varchar(200) NOT NULL,
  `itemqty` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `serviceproviderid` bigint(20) NOT NULL,
  `paymentid` int(11) NOT NULL,
  `orderdeliveryid` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ordertype_master`
--

CREATE TABLE `ordertype_master` (
  `id` bigint(20) NOT NULL,
  `typename` int(11) NOT NULL,
  `remarks` int(11) NOT NULL,
  `createddatetime` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_manage`
--

CREATE TABLE `order_manage` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `purchase_date` datetime DEFAULT NULL,
  `status` enum('1','2','3','4') DEFAULT NULL COMMENT '''Success''=>1, ''Pending''=>2, ''Process''=>3\r\n''cancel''=>4',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `app` varchar(255) DEFAULT NULL,
  `page_type` varchar(255) DEFAULT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `app`, `page_type`, `page_title`, `description`, `created_at`, `updated_at`) VALUES
(1, 'App', 'type', 'title update', '<p>description</p>', NULL, '2021-09-19 05:27:38');

-- --------------------------------------------------------

--
-- Table structure for table `paymentmaster`
--

CREATE TABLE `paymentmaster` (
  `paymentid` int(11) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `orderid` int(11) NOT NULL,
  `deliverychorge` decimal(10,0) NOT NULL,
  `totalamt` decimal(10,0) NOT NULL,
  `remarks` varchar(300) NOT NULL,
  `paymentbyuserId` int(11) NOT NULL,
  `createddatetime` datetime NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_mode`
--

CREATE TABLE `payment_mode` (
  `id` int(11) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_mode`
--

INSERT INTO `payment_mode` (`id`, `payment_method`, `status`, `created_at`, `updated_at`) VALUES
(0, 'Cash', 1, '0000-00-00 00:00:00', '2021-09-15 17:09:43');

-- --------------------------------------------------------

--
-- Table structure for table `pickup_stoplocation`
--

CREATE TABLE `pickup_stoplocation` (
  `id` int(11) NOT NULL,
  `pickup_id` int(11) NOT NULL,
  `stop_address1` longtext NOT NULL,
  `stop_address2` longtext NOT NULL,
  `stop_name` varchar(255) NOT NULL,
  `stop_mobile` varchar(255) NOT NULL,
  `stoplat` varchar(255) NOT NULL,
  `stoplon` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pickup_stoplocation`
--

INSERT INTO `pickup_stoplocation` (`id`, `pickup_id`, `stop_address1`, `stop_address2`, `stop_name`, `stop_mobile`, `stoplat`, `stoplon`, `created_at`, `updated_at`) VALUES
(1, 1, ' Santa Clara County 94043 Mountain View United States', 'gb cg', 'Abhay Lpu Noida', '+919560386426', '37.4062237', '-122.0781663', '2021-09-06 14:20:22', '2021-09-06 14:20:22'),
(2, 1, ' Santa Clara County 94043 Mountain View United States', '', 'Abhay Mca Lpu', '9815089746', '37.4062237', '-122.0781663', '2021-09-06 14:20:22', '2021-09-06 14:20:22'),
(3, 3, ' Santa Clara County 94043 Mountain View United States', 'dbfx', 'Abhilash Patha', '+919803480218', '37.3930076', '-122.0777117', '2021-09-07 09:13:10', '2021-09-07 09:13:10'),
(4, 3, ' Santa Clara County 94043 Mountain View United States', 'db', 'Abhay Mca Lpu', '9815089746', '37.3860517', '-122.0838511', '2021-09-07 09:13:10', '2021-09-07 09:13:10'),
(5, 8, ' Santa Clara County 94043 Mountain View United States', 'rbhrt', 'Abhay Mca Hons Lpu', '+918377929856', '37.4062237', '-122.0781663', '2021-09-07 10:51:45', '2021-09-07 10:51:45'),
(6, 9, ' Santa Clara County 94043 Mountain View United States', 'ghnrft', 'Abhay Mca Lpu', '9815089746', '37.3930076', '-122.0777117', '2021-09-07 11:01:26', '2021-09-07 11:01:26'),
(7, 9, ' Santa Clara County 94043 Mountain View United States', 'htr', 'Abhilash Patha', '+919803480218', '37.4062237', '-122.0781663', '2021-09-07 11:01:26', '2021-09-07 11:01:26'),
(8, 10, ' Santa Clara County 94043 Mountain View United States', 'fbgf', 'Abhay Mca Hons Lpu', '+918377929856', '37.3930076', '-122.0777117', '2021-09-07 11:33:14', '2021-09-07 11:33:14'),
(9, 10, ' Santa Clara County 94043 Mountain View United States', 'fbh gf', 'Abhishek Lpu Abhinav Room Mate', '+919780179013', '37.4062237', '-122.0781663', '2021-09-07 11:33:14', '2021-09-07 11:33:14'),
(10, 11, ' Santa Clara County 94043 Mountain View United States', 'gcn', 'Abhilash Patha', '+919803480218', '37.4062237', '-122.0781663', '2021-09-07 11:51:59', '2021-09-07 11:51:59'),
(11, 12, ' Santa Clara County 94043 Mountain View United States', 'gnfg', 'Abhay Mca Lpu', '9815089746', '37.3930076', '-122.0777117', '2021-09-07 12:06:02', '2021-09-07 12:06:02'),
(12, 12, ' Santa Clara County 94043 Mountain View United States', 'dfbdf', 'Abhay Mca Hons Lpu', '+918377929856', '37.3930076', '-122.0777117', '2021-09-07 12:06:02', '2021-09-07 12:06:02'),
(13, 13, ' Santa Clara County 94043 Mountain View United States', 'fgbfdgb', 'Abhilash Patha', '+919803480218', '37.3930076', '-122.0777117', '2021-09-07 13:22:16', '2021-09-07 13:22:16'),
(14, 13, ' Santa Clara County 94043 Mountain View United States', 'dbdt', 'Abhay Mca Lpu', '9815089746', '37.4062237', '-122.0781663', '2021-09-07 13:22:16', '2021-09-07 13:22:16'),
(15, 15, 'Mohali Village Sahibzada Ajit Singh Nagar 140301 Sahibzada Ajit Singh Nagar India', 'ghj', 'Abhilash Patha', '+919803480218', '30.7302881', '76.7157608', '2021-09-07 15:10:24', '2021-09-07 15:10:24'),
(16, 15, ' Sahibzada Ajit Singh Nagar 140301 Sahibzada Ajit Singh Nagar India', 'dest', 'Abhilash Patha', '+919803480218', '30.7405657', '76.6719399', '2021-09-07 15:10:24', '2021-09-07 15:10:24'),
(17, 16, 'Sector 12 Gautam Buddh Nagar 201301 Noida India', 'hdjsusi', 'hdhzusi', '656767346446464', '28.598843', '77.343635', '2021-09-07 16:46:51', '2021-09-07 16:46:51'),
(18, 17, 'Sector 12 Gautam Buddh Nagar 201301 Noida India', 'hdjsusi', 'hdhzusi', '656767346446464', '28.598843', '77.343635', '2021-09-07 16:52:53', '2021-09-07 16:52:53'),
(19, 17, 'Sector 11 East Delhi 201301 Noida India', 'djsjsjzj', 'disjsnajj', '6567766467979', '28.5967528', '77.3304576', '2021-09-07 16:52:53', '2021-09-07 16:52:53'),
(20, 18, 'Sector 11b East Delhi 201301 Noida India', 'dnsjsjsnw', 'djsjsjsksk', '4949494946464.1', '28.5967528', '77.3304576', '2021-09-07 18:12:32', '2021-09-07 18:12:32'),
(21, 18, 'Sector 11 East Delhi 201301 Noida India', 'ejwjwjwn', 'rjejsjsjwj', '2949494.1.1.411', '28.5985755', '77.3338783', '2021-09-07 18:12:32', '2021-09-07 18:12:32'),
(22, 18, 'Sector 11 East Delhi 201301 Noida India', 'rjsjsjsja', 'rjrjenenenem', '5959494.1499494', '28.5967528', '77.3304576', '2021-09-07 18:12:32', '2021-09-07 18:12:32'),
(23, 23, 'Sector 11 East Delhi 201301 Noida India', 'ugigiggg', 'givivivig', '6838383838', '28.5967528', '77.3304576', '2021-09-07 20:21:48', '2021-09-07 20:21:48'),
(24, 29, 'Philippine Arena, Santa Maria, Bulacan, Philippines', 'savemore matket banlic', 'Akash', '8882341937', '14.7938922', '120.953604', '2021-09-08 07:30:09', '2021-09-08 07:30:09'),
(25, 30, 'Philippine Arena, Santa Maria, Bulacan, Philippines', 'savemore matket banlic', 'Akash', '8882341937', '14.7938922', '120.953604', '2021-09-08 07:31:52', '2021-09-08 07:31:52'),
(26, 30, 'Philippine Arena, Santa Maria, Bulacan, Philippines', 'savemore matket banlic', 'Akash', '8882341937', '14.7938922', '120.953604', '2021-09-08 07:31:52', '2021-09-08 07:31:52'),
(27, 31, 'Philippine Arena, Santa Maria, Bulacan, Philippines', 'savemore matket banlic', 'Akash', '8882341937', '14.7938922', '120.953604', '2021-09-08 07:34:59', '2021-09-08 07:34:59'),
(28, 31, 'Philippine Arena, Santa Maria, Bulacan, Philippines', 'savemore matket banlic', 'Akash', '8882341937', '14.7938922', '120.953604', '2021-09-08 07:34:59', '2021-09-08 07:34:59'),
(29, 40, ' Santa Clara County 94043 Mountain View United States', 'dfgbfg', 'Abhay Mca Lpu', '9815089746', '37.4008596', '-122.0977936', '2021-09-08 12:46:37', '2021-09-08 12:46:37'),
(30, 40, ' Santa Clara County 94043 Mountain View United States', 'kvhjkb', 'Abhinav New Number', '+917307647454', '37.4062237', '-122.0781663', '2021-09-08 12:46:37', '2021-09-08 12:46:37'),
(31, 41, '   Manila Philippines', 'test', 'jgfvgf', '0915985174', '14.6130838', '120.9813579', '2021-09-08 13:38:24', '2021-09-08 13:38:24'),
(32, 42, ' Santa Clara County 94043 Mountain View United States', 'dfbdf', 'Abhay Mca Lpu', '9815089746', '37.3930076', '-122.0777117', '2021-09-08 16:21:22', '2021-09-08 16:21:22'),
(33, 43, ' Pangasinan  Eguia Philippines', 'dfvdf', 'Abhinav New Number', '+917307647454', '15.9087887', '119.8858592', '2021-09-09 05:39:38', '2021-09-09 05:39:38'),
(34, 43, ' Pangasinan  San Carlos City Philippines', 'rvd', 'Abhishek Lpu Abhinav Room Mate', '+919780179013', '15.9320266', '120.3443134', '2021-09-09 05:39:38', '2021-09-09 05:39:38'),
(35, 44, ' Pangasinan  Eguia Philippines', 'dfvdf', 'Abhinav New Number', '+917307647454', '15.9087887', '119.8858592', '2021-09-09 05:40:00', '2021-09-09 05:40:00'),
(36, 44, ' Pangasinan  San Carlos City Philippines', 'rvd', 'Abhishek Lpu Abhinav Room Mate', '+919780179013', '15.9320266', '120.3443134', '2021-09-09 05:40:00', '2021-09-09 05:40:00'),
(37, 45, ' Pangasinan  Eguia Philippines', 'dfvdf', 'Abhinav New Number', '+917307647454', '15.9087887', '119.8858592', '2021-09-09 05:40:47', '2021-09-09 05:40:47'),
(38, 45, ' Pangasinan  San Carlos City Philippines', 'rvd', 'Abhishek Lpu Abhinav Room Mate', '+919780179013', '15.9320266', '120.3443134', '2021-09-09 05:40:47', '2021-09-09 05:40:47'),
(39, 46, ' Pangasinan  Eguia Philippines', 'dfvdf', 'Abhinav New Number', '+917307647454', '15.9087887', '119.8858592', '2021-09-09 05:41:45', '2021-09-09 05:41:45'),
(40, 46, ' Pangasinan  San Carlos City Philippines', 'rvd', 'Abhishek Lpu Abhinav Room Mate', '+919780179013', '15.9320266', '120.3443134', '2021-09-09 05:41:45', '2021-09-09 05:41:45'),
(41, 47, '  1711 Parañaque Philippines', 'egser', 'Abhilash Patha', '+919803480218', '14.4793095', '121.0198229', '2021-09-09 14:26:03', '2021-09-09 14:26:03'),
(42, 48, ' Negros Occidental 6100 Bacolod Philippines', 'vhh', 'Abhinav New Number', '+917307647454', '10.6764916', '122.9508678', '2021-09-09 17:11:25', '2021-09-09 17:11:25'),
(43, 48, ' Negros Occidental  Bacolod Philippines', 'ghh', 'Abhinav New Number', '+917307647454', '10.6833049', '122.957629', '2021-09-09 17:11:25', '2021-09-09 17:11:25'),
(44, 51, 'Rizal  Tanay Philippines', 'dfbdf', 'Abhinav New Number', '+917307647454', '14.6063983', '121.3222847', '2021-09-10 04:05:54', '2021-09-10 04:05:54'),
(45, 52, 'Tanay Rural Bank, Rizal, Nueva Ecija, Philippines', 'dfbd', 'Abhay Mca Hons Lpu', '+918377929856', '15.6833333', '121.1666667', '2021-09-10 04:11:00', '2021-09-10 04:11:00'),
(46, 53, 'Nyugan Road, Dasmariñas, Cavite, Philippines', 'rbgdf', 'Abhinav New Number', '+917307647454', '14.2877957', '120.9866971', '2021-09-10 04:19:51', '2021-09-10 04:19:51'),
(47, 54, 'Cavite  Dasmariñas Philippines', 'dfbd', 'Abhinav New Number', '+917307647454', '14.3268518', '120.9574508', '2021-09-10 04:23:00', '2021-09-10 04:23:00'),
(48, 56, 'Rizal  Cainta Philippines', 'djd', 'Abhilash Patha', '+919803480218', '14.5738307', '121.1101544', '2021-09-10 06:55:15', '2021-09-10 06:55:15'),
(49, 57, 'Rizal 1900 Cainta Philippines', 'dnd', 'Abhinav New Number', '+917307647454', '14.5864844', '121.114876', '2021-09-10 06:57:12', '2021-09-10 06:57:12'),
(50, 58, 'D-9 Gautam Buddh Nagar Noida India 201304', 'bdjsisisjsj', 'jdjdjsiekis', '956767949464', '28.5160459', '77.3968677', '2021-09-10 07:32:13', '2021-09-10 07:32:13'),
(51, 59, 'D-9 Gautam Buddh Nagar Noida India 201304', 'bdjsisisjsj', 'jdjdjsiekis', '956767949464', '28.5160459', '77.3968677', '2021-09-10 07:33:12', '2021-09-10 07:33:12'),
(52, 60, 'D-9 Gautam Buddh Nagar Noida India 201304', 'bdjsisisjsj', 'jdjdjsiekis', '956767949464', '28.5160459', '77.3968677', '2021-09-10 07:36:08', '2021-09-10 07:36:08'),
(53, 62, 'D-9 Gautam Buddh Nagar Noida India 201304', 'bdjsisisjsj', 'jdjdjsiekis', '956767949464', '28.5160459', '77.3968677', '2021-09-10 07:38:07', '2021-09-10 07:38:07'),
(54, 63, 'Santa Cruz  1014 Manila Philippines', 'jdjdiek', 'ndjdjdjd', '9595646434946', '14.6262318', '120.9834023', '2021-09-10 07:43:33', '2021-09-10 07:43:33'),
(55, 69, 'Noida\'s Catering Services, Oro Vista Subdivision, Ephesians Street, Marikina, Metro Manila, Philippines', 'm.ocampo street Market', 'Akash', '8882341937', '14.6431893', '121.1101891', '2021-09-10 10:52:52', '2021-09-10 10:52:52'),
(56, 70, 'Noida\'s Catering Services, Oro Vista Subdivision, Ephesians Street, Marikina, Metro Manila, Philippines', 'm.ocampo street Market', 'Akash', '8882341937', '14.6431893', '121.1101891', '2021-09-10 10:53:39', '2021-09-10 10:53:39'),
(57, 71, 'Bulacan 3018 Bocaue Philippines', 'the market place', 'Akash', '8882341937', '14.7775483', '120.9346092', '2021-09-10 11:09:28', '2021-09-10 11:09:28'),
(58, 74, '1600 Santa Clara County Mountain View United States 94043', 'fbdfg', 'Abhinaw Mca Lpu', '7508224247', '37.4062237', '-122.0781663', '2021-09-10 12:50:56', '2021-09-10 12:50:56'),
(59, 75, 'Binondo   Manila Philippines', 'fvfd', 'Abhishek Lpu Abhinav Room Mate', '+919780179013', '14.6002465', '120.9747274', '2021-09-10 13:36:30', '2021-09-10 13:36:30'),
(60, 77, '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines', 'dbf', 'Abhinav New Number', '+917307647454', '16.2955033', '121.0350167', '2021-09-10 15:44:58', '2021-09-10 15:44:58'),
(61, 80, 'Albay  Jovellar Philippines', 'vjj', 'Abhinav New Number', '+917307647454', '13.07272', '123.598331', '2021-09-11 02:56:02', '2021-09-11 02:56:02'),
(62, 81, 'BDO ATM - SM Taytay Hypermarket Back Office, Taytay, Rizal, Philippines', 'test', 'test', '09158291795', '14.5491125', '121.1356436', '2021-09-11 03:48:44', '2021-09-11 03:48:44'),
(63, 82, '702  Caloocan Philippines 1400', 'jajan', 'jsjsjah', '1234567890', '14.7565784', '121.0449768', '2021-09-11 03:55:15', '2021-09-11 03:55:15'),
(64, 83, '702  Caloocan Philippines 1400', 'jajan', 'jsjsjah', '1234567890', '14.7565784', '121.0449768', '2021-09-11 03:56:08', '2021-09-11 03:56:08'),
(65, 84, 'Makati Philippines', '', 'Marie', '09153364563', '14.554729', '121.0244452', '2021-09-11 09:45:47', '2021-09-11 09:45:47'),
(66, 95, '1600 Santa Clara, Angeles, Pampanga, Philippines', 'bdf', 'vivek', '7837459544', '15.1383702', '120.6003389', '2021-09-13 09:25:46', '2021-09-13 09:25:46'),
(67, 97, '1600 Nueva, Taguig, Metro Manila, Philippines', 'bdf', 'vivek', '7837459544', '14.5203704', '121.0545022', '2021-09-13 10:30:31', '2021-09-13 10:30:31'),
(68, 102, '1600 Santa Ana, Marikina, Metro Manila, Philippines', 'bdf', 'vivek', '7837459544', '14.6246174', '121.1004939', '2021-09-15 15:40:34', '2021-09-15 15:40:34'),
(69, 108, 'Ahmednagar 414302 Devi Bhoyare India', 'daltonganj', 'gdhhxhx', '5555555558', '19.0025908', '74.3176876', '2021-09-15 16:55:21', '2021-09-15 16:55:21'),
(70, 115, '1976  Makati Philippines 1233 1976 M Reyes Street Bangkal Makati  Home', '1976 M Reyes Street Bangkal', 'Robert', '09159851768', '14.5448544', '121.0101673', '2021-09-15 18:12:30', '2021-09-15 18:12:30'),
(71, 115, 'Corinthian Executive Regency Bldg. (Condominium), Corinthian Executive Regency, Ortigas Center, Pasig, Metro Manila, Philippines 2507 Corinthian Executive Regency Ortigas Center Pasig  Work', '2507 Corinthian Executive Regency Ortigas Center', 'Benjie Javier', '09081250030', '14.5899269', '121.0616878', '2021-09-15 18:12:30', '2021-09-15 18:12:30'),
(72, 115, '1976  Makati Philippines 1233 1976 M Reyes Street Bangkal Makati  Home', '1976 M Reyes Street Bangkal', 'Robert', '09159851768', '14.5448544', '121.0101673', '2021-09-15 18:12:30', '2021-09-15 18:12:30'),
(73, 118, '1600 Santa Clara Road, Aritao, Nueva Vizcaya, Philippines bdf', 'bdf', 'vivek', '7837459544', '16.2955033', '121.0350167', '2021-09-16 12:33:02', '2021-09-16 12:33:02'),
(74, 150, 'Veronia Mongue, Pasay, Metro Manila, Philippines street alinagar', 'street alinagar', 'Aadesh Mishra', '07508516040', '14.5510807', '121.0198897', '2021-09-18 08:55:03', '2021-09-18 08:55:03'),
(75, 153, '89 Bagong Sibol Street, Maypajo, Manila, Metro Manila, Philippines', 'street alinagar', 'Aadesh Mishra', '07508516040', '14.6407929', '120.9713421', '2021-09-18 09:32:29', '2021-09-18 09:32:29'),
(76, 160, 'Veronia Mongue, Pasay, Metro Manila, Philippines street alinagar', 'street alinagar', 'Aadesh Mishra', '07508516040', '14.5510807', '121.0198897', '2021-09-18 12:40:30', '2021-09-18 12:40:30'),
(77, 190, 'Philippine Arena, Santa Maria, Bulacan, Philippines', 'fhjj', 'Aadesh Mishra', '07508516040', '14.7938922', '120.953604', '2021-09-19 05:48:13', '2021-09-19 05:48:13'),
(78, 209, '702  Caloocan Philippines 1400', 'dsi', 'j5', '09165882729', '14.7565784', '121.0449768', '2021-09-20 02:45:04', '2021-09-20 02:45:04'),
(79, 210, '1976  Makati Philippines 1233 1976 M Reyes Street Bangkal', '1976 M Reyes Street Bangkal', 'Robert', '09159851768', '14.5448544', '121.0101673', '2021-09-20 02:54:10', '2021-09-20 02:54:10'),
(80, 216, '1600 Santa Clara County Mountain View United States 94043', '234234234dsvccxvxxccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc', 'dsdsf', '343242342342342', '37.4062237', '-122.0781663', '2021-09-20 13:38:41', '2021-09-20 13:38:41'),
(81, 221, 'Dhawalgiri Apartments East Delhi Noida India 201301', 'sss', 'fdd', '55558555555', '28.602043', '77.339001', '2021-09-20 15:47:45', '2021-09-20 15:47:45');

-- --------------------------------------------------------

--
-- Table structure for table `pricecard`
--

CREATE TABLE `pricecard` (
  `id` int(11) NOT NULL,
  `service` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `vehicle_type` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `priceby` varchar(255) DEFAULT NULL,
  `baseprice` varchar(255) DEFAULT NULL,
  `stop` varchar(255) DEFAULT NULL,
  `services` varchar(255) DEFAULT NULL,
  `servicefee` varchar(255) DEFAULT NULL,
  `conviniencefor` varchar(255) DEFAULT NULL,
  `conviniencefee` varchar(255) DEFAULT NULL,
  `othercharges` varchar(255) DEFAULT NULL,
  `waitingfee` varchar(255) DEFAULT NULL,
  `standard` varchar(255) DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pricecard`
--

INSERT INTO `pricecard` (`id`, `service`, `area`, `vehicle_type`, `city`, `priceby`, `baseprice`, `stop`, `services`, `servicefee`, `conviniencefor`, `conviniencefee`, `othercharges`, `waitingfee`, `standard`, `discount`, `status`, `created_at`, `updated_at`) VALUES
(1, '1', 'philippines', '1', 'philippines', 'km', '10', '10', 'add bag', '10', 'bag', '10', '10', '10', 'test', '10', '', '2021-06-18 08:58:09', '2021-06-18 08:58:09'),
(2, '1', 'philippines', '1', 'philippines', 'km', '10', '10', 'service2', '10', '10', '10', '10', '10', 'test', '10', '', '2021-06-18 08:58:09', '2021-06-18 08:58:09'),
(3, '1', 'ANDORRA', '2', '5', 'Km', '20', '20', 'service2', '20', '20', '20', '20', '20', '20', '20', 'active', '2021-08-31 05:07:29', '2021-08-31 05:50:10'),
(4, '1', '5', '2', '5', 'Km', '20', '20', 'add bug', '20', '20', '20', '20', '20', '20', '20', 'active', '2021-08-30 20:06:48', '2021-08-31 05:47:57'),
(5, '1', '5', '3', '5', 'Km', '20', '20', 'add bug', '20', '20', '20', '20', '20', '20', '20', 'active', '2021-08-30 20:07:38', '2021-08-31 05:48:24'),
(6, '1', '5', '3', '5', 'Km', '20', '20', 'add bug', '20', '20', '20', '20', '20', '20', '20', 'active', '2021-08-30 20:15:27', '2021-08-31 05:45:27'),
(7, '1', '5', '4', '5', 'Km', '20', '20', 'add bug', '20', '20', '20', '20', '20', '20', '20', 'active', '2021-08-30 20:16:03', '2021-08-31 05:46:03'),
(8, '1', 'ANDORRA', '4', 'ANGOLA', '00', '20', '1', 'add bug', '20', '20', '20', '20', '20', '-2', '50', 'active', '2021-08-31 14:12:05', '2021-08-31 14:12:05');

-- --------------------------------------------------------

--
-- Table structure for table `pricecards`
--

CREATE TABLE `pricecards` (
  `id` int(11) NOT NULL,
  `country_name` varchar(255) NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `base_fare` varchar(255) NOT NULL,
  `base_fare_comission` varchar(255) NOT NULL,
  `per_km` varchar(255) NOT NULL,
  `per_km_comission` varchar(255) NOT NULL,
  `add_stop_price` varchar(255) NOT NULL,
  `add_stop_price_comission` varchar(255) NOT NULL,
  `additional_services` varchar(255) NOT NULL,
  `additional_services_com` varchar(255) NOT NULL,
  `convenience_fee` varchar(255) NOT NULL,
  `convenience_fee_com` varchar(255) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pricecards`
--

INSERT INTO `pricecards` (`id`, `country_name`, `service_name`, `base_fare`, `base_fare_comission`, `per_km`, `per_km_comission`, `add_stop_price`, `add_stop_price_comission`, `additional_services`, `additional_services_com`, `convenience_fee`, `convenience_fee_com`, `status`, `created_at`, `updated_at`) VALUES
(1, '', 'MOTORCYCLE\r\n', '50', '0', '6', '0', '25', '5', '25', '5', '', '', '1', '2021-09-07 22:00:11', '2021-09-07 22:00:11'),
(2, '', 'BIKE\r\n', '', '', '', '', '', '', '', '', '', '', '1', '2021-09-07 22:16:24', '2021-09-07 22:16:24'),
(3, '', 'SEDAN 200KG', '', '', '', '', '', '', '', '', '', '', '1', '2021-09-07 22:16:24', '2021-09-09 22:18:00'),
(4, '', 'MVP 300KG', '', '', '', '', '', '', '', '', '', '', '1', '2021-09-07 22:16:24', '2021-09-09 22:18:52'),
(5, '', 'MVP 600KG', '', '', '', '', '', '', '', '', '', '', '1', '2021-09-07 22:16:24', '2021-09-07 22:16:24'),
(6, '', 'VAN 1000KG', '', '', '', '', '', '', '', '', '', '', '1', '2021-09-07 22:16:24', '2021-09-07 22:16:24'),
(7, '', 'FB 1000KG', '', '', '', '', '', '', '', '', '', '', '1', '2021-09-07 22:16:24', '2021-09-07 22:16:24'),
(8, '', 'FB 2000KG', '', '', '', '', '', '', '', '', '', '', '1', '2021-09-07 22:16:24', '2021-09-07 22:16:24'),
(9, '', 'ALUMINUM 2000KG', '', '', '', '', '', '', '', '', '', '', '1', '2021-09-07 22:16:24', '2021-09-07 22:16:24'),
(10, '', 'FOOD', '50', '5', '', '', '', '', '', '', '', '', '1', '2021-09-07 22:16:24', '2021-09-07 22:16:24'),
(11, '', 'SHOP', '150', '50', '', '', '', '', '', '', '', '', '1', '2021-09-07 22:16:24', '2021-09-07 22:16:24');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `upload_by` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `id_no` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `features` varchar(255) DEFAULT NULL,
  `price` float(10,2) DEFAULT NULL,
  `percentage` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(11) DEFAULT NULL COMMENT '''o'' => show everyone, ''1'' => show only me',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `upload_by`, `brand_id`, `model_name`, `id_no`, `year`, `features`, `price`, `percentage`, `description`, `status`, `created_at`, `updated_at`) VALUES
(19, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '279160', '2018', '', 5800.00, '5', 'hi', 0, '2020-09-30 16:15:16', NULL),
(20, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '279174', '2018', '', 6850.00, '5', 'hi', 0, '2020-09-30 16:22:27', NULL),
(21, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '279173', '2018', '', 10150.00, '5', 'hi', 0, '2020-09-30 16:24:08', NULL),
(23, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '279383 RBR Cadran serti de 10 diamants', '2018', '', 15200.00, '5', 'hi', 0, '2020-09-30 16:33:57', NULL),
(24, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '279161', '2018', '', 8000.00, '5', 'Hi', 0, '2020-09-30 16:35:46', NULL),
(25, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '279171', '2018', '', 10450.00, '5', 'HI', 0, '2020-09-30 16:39:39', NULL),
(26, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '279381 RBR', '2018', '', 17900.00, '5', 'hI', 0, '2020-09-30 16:47:47', NULL),
(27, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '279178', '2018', '', 22500.00, '5', 'HI', 0, '2020-09-30 16:50:07', NULL),
(28, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '279138 RBR', '2018', '', 31900.00, '5', 'HI', 0, '2020-09-30 16:58:35', NULL),
(29, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '279165', '2018', '', 23600.00, '5', 'HI', 0, '2020-09-30 17:04:20', NULL),
(30, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '279135 RBR', '2018', '', 34900.00, '5', 'HI', 0, '2020-09-30 17:24:16', NULL),
(32, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '279135_1 RBR Cadran pavé de 291 diamants', '2018', '', 45500.00, '5', 'hi', 0, '2020-09-30 17:38:56', NULL),
(33, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '279166', '2018', '', 42100.00, '5', 'Hi', 0, '2020-09-30 17:41:43', NULL),
(34, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '279136 RBR', '2018', '', 52100.00, '5', 'Hi', 0, '2020-09-30 17:43:33', NULL),
(35, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '279174-1', '2018', '', 6750.00, '5', 'hi', 0, '2020-09-30 17:57:44', NULL),
(36, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '279384 RBR Cadran nacre blanche serti de 10 diamants', '2018', '', 16300.00, '5', 'hi', 0, '2020-09-30 17:59:34', NULL),
(37, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '279173_1', '2018', '', 8350.00, '5', 'Hy', 0, '2020-09-30 18:04:21', NULL),
(38, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '279161_1', '2018', '', 8550.00, '5', 'hy', 0, '2020-09-30 18:13:30', NULL),
(39, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '279138 RBR_1 Cadran pavé de 291 diamants', '2018', '', 43400.00, '5', 'hy', 0, '2020-09-30 18:16:38', NULL),
(40, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '118238', '2018', '', 31550.00, '5', 'hy', 0, '2020-09-30 18:19:18', NULL),
(41, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '118348', '2018', '', 56300.00, '5', 'hy', 0, '2020-09-30 18:20:37', NULL),
(42, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '118205 Cadran serti de 8 diamants & 2 rubis', '2018', '', 33.00, '5', 'hy', 0, '2020-09-30 18:25:19', NULL),
(43, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '118235 Cadran en météorite serti de 10 diamants', '2018', '', 36.00, '5', 'hy', 0, '2020-09-30 18:28:23', NULL),
(44, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '118239 Cadran serti de 8 diamants', '2018', '', 33950.00, '5', 'hy', 0, '2020-09-30 18:35:17', NULL),
(45, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '118206', '2018', '', 52.00, '5', 'hy', 0, '2020-09-30 18:38:03', NULL),
(46, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '118346', '2018', '', 67.00, '5', 'hy', 0, '2020-09-30 18:50:09', NULL),
(47, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '118389', '2018', '', 55.00, '5', 'hy', 0, '2020-09-30 18:52:14', NULL),
(48, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '118138 Appliques-or', '2018', '', 20.00, '5', 'hy', 0, '2020-09-30 18:55:15', NULL),
(49, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '118139 Appliques-or', '2018', '', 21.00, '5', 'hy', 0, '2020-09-30 19:01:44', NULL),
(50, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '118135 Appliques-or', '2018', '', 21.00, '5', 'hy', 0, '2020-09-30 19:06:36', NULL),
(51, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '228238', '2018', '', 31.00, '5', 'hy', 0, '2020-09-30 19:10:08', NULL),
(52, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '228348 RBR', '2018', '', 50700.00, '5', 'hy', 0, '2020-09-30 20:01:48', NULL),
(53, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '228398 TBR', '2018', '', 76700.00, '5', 'hy', 0, '2020-09-30 20:03:24', NULL),
(54, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '228239', '2018', '', 34400.00, '5', 'hy', 0, '2020-09-30 20:06:52', NULL),
(55, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '228349 RBR', '2018', '', 53.00, '5', 'hy', 0, '2020-09-30 20:16:17', NULL),
(56, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '228349 RBR_1 Cadran pavé de 549 diamants', '2018', '', 77.00, '5', 'hy', 0, '2020-09-30 20:20:30', NULL),
(57, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '228235', '2018', '', 34400.00, '5', 'hy', 0, '2020-09-30 21:00:12', NULL),
(58, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '228235_1', '2018', '', 38.00, '5', 'hy', 0, '2020-09-30 21:12:30', NULL),
(59, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '228345 RBR Cadran pavé de 549 diamants', '2018', '', 77300.00, '5', 'hy', 0, '2020-09-30 21:17:13', NULL),
(60, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '228206', '2018', '', 57200.00, '5', 'hy', 0, '2020-09-30 21:20:46', NULL),
(61, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '228396 TBR Cadran serti de 10 diamants', '2018', '', 105900.00, '5', 'hy', 0, '2020-09-30 21:23:37', NULL),
(62, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '326138', '2018', '', 34850.00, '5', 'hy', 0, '2020-09-30 21:31:54', NULL),
(63, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '326938', '2018', '', 42300.00, '5', 'hy', 0, '2020-09-30 21:33:53', NULL),
(64, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '326139', '2018', '', 36250.00, '5', 'hy', 0, '2020-09-30 21:36:02', NULL),
(65, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '326939', '2018', '', 44.00, '5', 'hy', 0, '2020-09-30 21:54:37', NULL),
(66, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '326135', '2018', '', 36.00, '5', 'hy', 0, '2020-09-30 21:56:01', NULL),
(67, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '326935', '2018', '', 44.00, '5', 'hy', 0, '2020-09-30 21:57:24', NULL),
(68, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '326934', '2018', '', 13150.00, '5', 'hy', 0, '2020-09-30 22:00:26', NULL),
(69, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '326933', '2018', '', 15.00, '5', 'hy', 0, '2020-10-01 15:23:11', NULL),
(70, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '178240', '2018', '', 5.00, '5', 'hy', 0, '2020-10-01 15:24:50', NULL),
(71, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '178274 Cadran serti de 10 diamants', '2018', '', 8.00, '5', 'hy', 0, '2020-10-01 15:35:15', NULL),
(72, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '178384 Cadran nacre blanche,VI serti de 11 diamants', '2018', '', 15.00, '5', 'hy', 0, '2020-10-01 15:39:13', NULL),
(73, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '178243', '2018', '', 8.00, '5', 'hy', 0, '2020-10-01 15:47:43', NULL),
(74, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '178273 Cadran serti de 10 diamants', '2018', '', 10.00, '5', 'hy', 0, '2020-10-01 15:50:31', NULL),
(75, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '178343 Cadran appliques-or, VI serti de 11 diamants', '2018', '', 13.00, '5', 'hy', 0, '2020-10-01 15:52:35', NULL),
(76, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '178383 Cadran nacre blanche serti de 10 diamants', '2018', '', 19.00, '5', 'hy', 0, '2020-10-01 15:55:17', NULL),
(77, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '178241 Cadran serti de 10 diamants', '2018', '', 10.00, '5', 'hy', 0, '2020-10-01 16:06:29', NULL),
(78, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '178271 Cadran serti de 10 diamants', '2018', '', 10.00, '5', 'hy', 0, '2020-10-01 16:10:45', NULL),
(79, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '178341 Cadran appliques-or, VI serti de 11 diamants', '2018', '', 13100.00, '5', 'hy', 0, '2020-10-01 16:15:22', NULL),
(81, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '178278 Cadran nacre blanche serti de 10 diamants', '2018', '', 28.00, '5', 'hy', 0, '2020-10-01 17:06:55', NULL),
(82, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '178288-0063 Cadran serti de 8 diamants, 6& 9 sertis de 32 rubis', '2018', '', 38.00, '5', 'hy', 0, '2020-10-01 16:18:26', NULL),
(83, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '178279', '2018', '', 28.00, '5', 'hy', 0, '2020-10-01 16:20:27', NULL),
(84, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '178159 Cadran serti de 10 diamants', '2018', '', 42.00, '5', 'hy', 0, '2020-10-01 16:22:56', NULL),
(85, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '178245 Cadran nacre blanche serti de 10 diamants', '2018', '', 30.00, '5', 'hy', 0, '2020-10-01 16:29:35', NULL),
(86, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '178275 Cadran serti de 10 diamants', '2018', '', 28.00, '5', 'hy', 0, '2020-10-01 16:31:12', NULL),
(87, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '178344', '2018', '', 9.00, '5', 'hy', 0, '2020-10-01 17:04:57', NULL),
(88, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '115200 Appliques-or', '2018', '', 5.00, '5', 'hy', 0, '2020-10-01 17:11:44', NULL),
(89, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '115234 Cadran serti de 5 diamants', '2018', '', 7.00, '5', 'hy', 0, '2020-10-01 17:14:58', NULL),
(90, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '115234-0012', '2018', '', 7700.00, '5', 'hi', 0, '2020-10-01 17:46:05', NULL),
(91, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '116203', '2018', '', 9450.00, '5', 'hi', 0, '2020-10-01 17:48:30', NULL),
(92, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '116233_1', '2018', 'or jaune et acier,36 mm,automatique,medium', 11350.00, '5', 'hi', 0, '2020-10-01 17:51:38', NULL),
(93, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '116200-0060', '2018', 'acier,36 mm,automatique,homme', 6100.00, '5', 'hi', 0, '2020-10-01 17:56:24', NULL),
(94, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '116200-0085', '2018', 'acier,36 mm,automatique,homme', 6100.00, '5', 'hi', 0, '2020-10-01 18:00:34', NULL),
(95, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '116234-0104', '2018', 'acier,36 mm,automatique,medium', 9050.00, '5', 'hi', 0, '2020-10-01 18:03:52', NULL),
(96, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '116244-0007', '2018', 'or gris et acie,36 mm,acier,automatique,medium', 13450.00, '5', 'hi', 0, '2020-10-01 18:06:24', NULL),
(97, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '116244', '2018', 'or gris et acier,36 mm,acier,automatique,medium', 17950.00, '5', 'hi', 0, '2020-10-01 18:09:29', NULL),
(98, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '116243', '2018', 'or jaune,36 mm,or jaune et acier,automatique,medium', 20600.00, '5', 'hi', 0, '2020-10-01 18:16:48', NULL),
(99, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '116238-0059', '2018', 'or jaune,36 mm,automatique,medium', 26600.00, '5', 'hi', 0, '2020-10-01 18:24:19', NULL),
(100, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '116238-0062', '2018', 'or jaune,36 mm,automatique,homme', 31000.00, '5', 'hi', 0, '2020-10-01 18:28:28', NULL),
(101, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '116231-0074', '2018', 'or rose et acier,36 mm,automatique,medium', 11650.00, '5', 'hi', 0, '2020-10-01 18:31:27', NULL),
(102, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '116231-0057', '2018', 'or rose et acier,36 mm,or et acier,automatique,medium', 12100.00, '5', 'hi', 0, '2020-10-01 18:34:48', NULL),
(103, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '116234', '2018', 'or gris et acier,36 mm,acier,automatique,medium', 9150.00, '5', 'hi', 0, '2020-10-01 18:46:13', NULL),
(104, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '116233', '2018', 'or jaune et acier,36 mm,automatique,medium', 11800.00, '5', 'hi', 0, '2020-10-01 18:48:41', NULL),
(105, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '116201', '2018', 'or rose et acier,36 mm,automatique,medium', 10200.00, '5', 'hi', 0, '2020-10-01 18:52:01', NULL),
(106, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '126300', '2018', 'acier,41 mm,acier,automatique', 6750.00, '5', 'hi', 0, '2020-10-01 19:02:50', NULL),
(107, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '126300_1', '2018', 'acier,41 mm,automatique,homme', 6850.00, '5', 'hi', 0, '2020-10-01 19:24:32', NULL),
(108, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '126334', '2018', 'or gris et acier,41 mm,acier,automatique,homme', 8600.00, '5', 'hi', 0, '2020-10-01 20:09:47', NULL),
(109, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '126334_2', '2018', 'or gris et acier,acier,41 mm,automatique,homme', 10400.00, '5', 'hi', 0, '2020-10-01 20:13:44', NULL),
(110, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '126334_3', '2018', 'or gris et acier,41 mm,acier,automatique,homme', 13100.00, '5', 'hi', 0, '2020-10-01 20:18:29', NULL),
(111, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '126303', '2018', 'or jaune et acier,41 mm,automatique,homme', 11000.00, '5', 'hi', 0, '2020-10-01 20:24:35', NULL),
(112, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '126303_1', '2018', 'or jaune et acier,41 mm,automatique,homme', 13350.00, '5', 'hi', 0, '2020-10-01 20:56:10', NULL),
(113, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '126333', '2018', 'or jaune et acier,41 mm,automatique,homme', 11100.00, '5', 'hi', 0, '2020-10-01 20:58:04', NULL),
(114, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '126333_1', '2018', 'or jaune et acier,41 mm,automatique,homme', 11650.00, '5', 'hi', 0, '2020-10-01 21:06:51', NULL),
(115, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '126333_2', '2018', 'or jaune et acier,41 mm,automatique,homme', 16050.00, '5', 'hi', 0, '2020-10-01 21:10:47', NULL),
(116, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '126301', '2018', 'or rose et acier,41 mm,automatique,homme', 11300.00, '5', 'hi', 0, '2020-10-01 21:13:42', NULL),
(117, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '126301_1', '2018', 'or rose et acier,41 mm,automatique,homme', 15700.00, '5', 'hi', 0, '2020-10-01 21:16:20', NULL),
(118, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '126331', '2018', '41 mm,or rose et acier,automatique,homme', 11400.00, '5', 'hi', 0, '2020-10-01 21:37:43', NULL),
(119, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '126331_1', '2018', 'or rose et acier,41 mm,automatique,homme', 13750.00, '5', 'hi', 0, '2020-10-01 21:40:34', NULL),
(120, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '176200', '2018', 'acier,26 mm,26 mm,dame', 4400.00, '5', 'hi', 0, '2020-10-05 16:10:51', NULL),
(121, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '177200', '2018', 'acier,31 mm,automatique,medium', 4500.00, '5', 'hi', 0, '2020-10-05 16:16:06', NULL),
(122, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '114200', '2018', 'acier,34 mm,automatique,medium', 4600.00, '5', 'hi', 0, '2020-10-05 16:21:21', NULL),
(123, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '116000', '2018', 'acier,36 mm,automatique,medium', 4900.00, '5', 'hi', 0, '2020-10-05 16:24:41', NULL),
(124, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '114300', '2018', 'acier,39 mm,automatique,homme', 5200.00, '5', 'hi', 0, '2020-10-05 16:42:09', NULL),
(125, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '80318', '2018', 'or jaune,29 mm,automatique,dame', 27700.00, '5', 'hi', 0, '2020-10-05 16:44:11', NULL),
(126, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '80298', '2018', 'or jaune,29 mm,automatique,dame', 41700.00, '5', 'hi', 0, '2020-10-05 16:48:00', NULL),
(127, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '80319', '2018', 'or gris,29 mm,automatique,dame', 31250.00, '5', 'hi', 0, '2020-10-05 17:03:36', NULL),
(128, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '80299', '2018', 'or gris,29 mm,automatique,dame', 64850.00, '5', 'hi', 0, '2020-10-05 17:06:57', NULL),
(129, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '80315', '2018', 'or rose,29 mm,automatique,dame', 29800.00, '5', 'hi', 0, '2020-10-05 17:25:44', NULL),
(130, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '80315_1', '2018', 'or rose,29 mm,automatique,dame', 31250.00, '5', 'hi', 0, '2020-10-05 17:59:35', NULL),
(131, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '80285', '2018', 'or rose,29 mm,automatique,dame', 49350.00, '5', 'hi', 0, '2020-10-05 18:01:24', NULL),
(132, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '80285_1', '2018', 'or rose,29 mm,automatique,dame', 76250.00, '5', 'hi', 0, '2020-10-05 18:03:47', NULL),
(133, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '81318', '2018', 'or jaune,34 mm,automatique,medium', 33150.00, '5', 'hi', 0, '2020-10-05 18:06:31', NULL),
(134, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '81298', '2018', 'or jaune,34 mm,automatique,medium', 44400.00, '5', 'hi', 0, '2020-10-05 18:08:55', NULL),
(135, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '81299', '2018', 'or gris,34 mm,automatique,dame', 48700.00, '5', 'hi', 0, '2020-10-05 18:14:35', NULL),
(136, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '81409', '2018', 'or gris serti de diamants,34 mm,automatique,dame', 149750.00, '5', 'hi', 0, '2020-10-05 18:18:15', NULL),
(137, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '81315', '2018', 'or rose,34 mm,automatique,dame', 35250.00, '5', 'hi', 0, '2020-10-05 18:33:39', NULL),
(138, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '81405', '2018', 'or rose et diamants,34 mm,automatique,dame', 149750.00, '5', 'hi', 0, '2020-10-05 18:37:45', NULL),
(139, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '86289', '2018', 'or gris serti de diamants,39 mm,or gris,automatique,homme', 59200.00, '5', 'hi', 0, '2020-10-05 18:40:38', NULL),
(140, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '86289_1', '2018', 'or gris serti de diamants,39 mm,automatique,dame', 113400.00, '5', 'hi', 0, '2020-10-05 18:50:27', NULL),
(141, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '86409', '2018', 'or gris serti de diamants,39 mm,automatique,medium', 186250.00, '5', 'hi', 0, '2020-10-05 19:25:05', NULL),
(142, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '86285', '2018', 'or rose serti de diamants,39 mm,or rose,automatique,medium', 58800.00, '5', 'hi', 0, '2020-10-05 19:26:58', NULL),
(143, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '86285_1', '2018', 'or rose serti de diamants,39 mm,automatique,homme', 113400.00, '5', 'hi', 0, '2020-10-05 19:29:10', NULL),
(144, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '86405', '2018', 'or rose serti de diamants,39 mm,automatique,medium', 186250.00, '5', 'hi', 0, '2020-10-05 19:43:58', NULL),
(145, 1, 1, 'COLLECTION PROFESSIONNELLES', '214270', '2018', 'acier,39 mm,automatique,medium', 6000.00, '5', 'hi', 0, '2020-10-05 20:01:23', NULL),
(146, 1, 1, 'COLLECTION PROFESSIONNELLES', '216570-0001', '2018', 'acier,42 mm,automatique,homme', 7450.00, '5', 'hi', 0, '2020-10-05 20:05:53', NULL),
(147, 1, 1, 'COLLECTION PROFESSIONNELLES', '216570-0002', '2018', 'acier,42 mm,automatique,homme', 7450.00, '5', 'hi', 0, '2020-10-05 20:11:06', NULL),
(148, 1, 1, 'COLLECTION PROFESSIONNELLES', '214270', '2018', 'acier,39 mm,39 mm,medium', 6000.00, '5', 'hi', 0, '2020-10-05 20:15:02', NULL),
(149, 1, 1, 'COLLECTION PROFESSIONNELLES', '114060', '2018', 'acier,40 mm,automatique,homme', 6850.00, '5', 'hi', 0, '2020-10-05 20:21:46', NULL),
(150, 1, 1, 'COLLECTION PROFESSIONNELLES', '116618', '2018', 'or jaune,40 mm,automatique,homme', 31300.00, '5', 'hi', 0, '2020-10-05 20:23:35', NULL),
(151, 1, 1, 'COLLECTION PROFESSIONNELLES', '116618', '2018', 'or jaune,40 mm,automatique,homme', 31300.00, '5', 'hi', 0, '2020-10-05 20:31:53', NULL),
(152, 1, 1, 'COLLECTION PROFESSIONNELLES', '116619', '2018', 'or gris,40 mm,automatique,homme', 33800.00, '5', 'hi', 0, '2020-10-05 20:34:30', NULL),
(153, 1, 1, 'COLLECTION PROFESSIONNELLES', '116610', '2018', 'acier,40 mm,automatique,homme', 7.00, '5', 'hi', 0, '2020-10-05 20:38:27', NULL),
(154, 1, 1, 'COLLECTION PROFESSIONNELLES', '116613', '2018', 'or jaune et acier,40 mm,automatique,homme', 12350.00, '5', 'hi', 0, '2020-10-05 20:44:50', NULL),
(155, 1, 1, 'COLLECTION PROFESSIONNELLES', '116613', '2018', 'or jaune et acier,40 mm,automatique,homme', 12350.00, '5', 'hi', 0, '2020-10-05 20:48:41', NULL),
(156, 1, 1, 'COLLECTION PROFESSIONNELLES', '116610', '2018', 'acier,40 mm,automatique,homme', 8300.00, '5', 'hi', 0, '2020-10-05 20:50:42', NULL),
(157, 1, 1, 'COLLECTION PROFESSIONNELLES', '116660_1', '2018', 'acier,44 mm,automatique,homme', 11350.00, '5', 'hi', 0, '2020-10-05 20:56:18', NULL),
(158, 1, 1, 'COLLECTION PROFESSIONNELLES', '116660', '2018', 'acier,44 mm,automatique,homme', 11050.00, '5', 'hi', 0, '2020-10-05 20:58:17', NULL),
(159, 1, 1, 'COLLECTION PROFESSIONNELLES', '116710', '2018', 'acier,44 mm,automatique,homme', 7700.00, '5', 'hi', 0, '2020-10-05 21:01:48', NULL),
(160, 1, 1, 'COLLECTION PROFESSIONNELLES', '116713', '2018', 'or jaune et acier,40 mm,automatique,homme', 11950.00, '5', 'hi', 0, '2020-10-05 21:04:17', NULL),
(161, 1, 1, 'COLLECTION PROFESSIONNELLES', '116718', '2018', 'or jaune,40 mm,automatique,homme', 30500.00, '5', 'hi', 0, '2020-10-05 21:06:17', NULL),
(162, 1, 1, 'COLLECTION PROFESSIONNELLES', '116710', '2018', 'acier,automatique,homme', 8200.00, '5', 'hi', 0, '2020-10-05 21:08:46', NULL),
(163, 1, 1, 'COLLECTION PROFESSIONNELLES', '116719', '2018', 'or gris,40 mm,automatique,homme', 35.00, '5', 'hi', 0, '2020-10-05 21:20:11', NULL),
(164, 1, 1, 'COLLECTION PROFESSIONNELLES', '116622', '2018', 'platine et acier,40 mm,automatique,homme', 10600.00, '5', 'hi', 0, '2020-10-05 21:22:11', NULL),
(165, 1, 1, 'COLLECTION PROFESSIONNELLES', '116655', '2018', 'or rose,40 mm,caoutchouc,automatique,homme', 22850.00, '5', 'hi', 0, '2020-10-05 21:26:09', NULL),
(166, 1, 1, 'COLLECTION PROFESSIONNELLES', '268655', '2018', 'or rose,37 mm,caoutchouc,automatique,homme', 20200.00, '5', 'hi', 0, '2020-10-05 21:49:20', NULL),
(167, 1, 1, 'COLLECTION PROFESSIONNELLES', '268622', '2018', 'platine et acier,37 mm,acier,automatique,medium', 10150.00, '5', 'hi', 0, '2020-10-05 21:52:25', NULL),
(168, 1, 1, 'COLLECTION PROFESSIONNELLES', '268621', '2018', 'or rose et acier,37 mm,automatique,medium', 11800.00, '5', 'hi', 0, '2020-10-05 21:58:19', NULL),
(169, 1, 1, 'COLLECTION PROFESSIONNELLES', '116621', '2018', 'or rose et acier,40 mm,automatique,homme', 12900.00, '5', 'hi', 0, '2020-10-05 22:00:11', NULL),
(170, 1, 1, 'COLLECTION PROFESSIONNELLES', '116688', '2018', 'or jaune,44 mm,automatique,homme', 39900.00, '5', 'hi', 0, '2020-10-05 22:02:23', NULL),
(171, 1, 1, 'COLLECTION PROFESSIONNELLES', '116689', '2018', 'or gris,44 mm,automatique,homme', 44100.00, '5', 'hi', 0, '2020-10-05 22:21:08', NULL),
(172, 1, 1, 'COLLECTION PROFESSIONNELLES', '116681', '2018', 'or rose et acier,44 mm,automatique,homme', 23050.00, '5', 'hi', 0, '2020-10-05 22:24:36', NULL),
(173, 1, 1, 'COLLECTION PROFESSIONNELLES', '116680', '2018', 'acier,44 mm,automatique,homme', 17150.00, '5', 'hi', 0, '2020-10-05 22:27:57', NULL),
(174, 1, 1, 'COLLECTION PROFESSIONNELLES', '116505-0001', '2018', 'or rose,40 mm,automatique,homme', 34300.00, '5', 'hi', 0, '2020-10-05 22:30:36', NULL),
(175, 1, 1, 'COLLECTION PROFESSIONNELLES', '116515', '2018', 'or rose,40 mm,croco,automatique,homme', 26350.00, '5', 'hi', 0, '2020-10-05 22:33:10', NULL),
(176, 1, 1, 'COLLECTION PROFESSIONNELLES', '116506-0001', '2018', 'platine,40 mm,automatique,homme', 68700.00, '5', 'hi', 0, '2020-10-05 22:36:06', NULL),
(177, 1, 1, 'COLLECTION PROFESSIONNELLES', '116500', '2018', '- Boîtier: Acier,- Diamètre du boîtier: 40 mm,- Mouvement: Automatique,- Sexe : Homme/Unisexe', 23500.00, '5', 'hi', 0, '2020-10-27 17:50:07', NULL),
(178, 1, 1, 'COLLECTION PROFESSIONNELLES', '116503', '2018', 'or jaune et acier,', 15500.00, '5', 'hi', 0, '2020-10-06 14:58:10', NULL),
(179, 1, 1, 'Cosmograph Daytona Or Jaune Oysterflex', '116518', '2019', '- Boîtier: Or Jaune,- Mouvement: Automatique,- Bracelet : Caoutchouc,- Mouvement: Automatique,- Sexe : Homme/Unisexe', 31400.00, '18', 'Cette Oyster Perpetual Cosmograph Daytona en Or jaune 18 ct assortie d’un cadran couleur champagne et noir et d’un bracelet Oysterflex est dotée d’une lunette Cerachrom noire et d’une échelle tachymétrique. Ce chronographe a été conçu pour être le meilleur outil de chronométrage des pilotes de course d’endurance. Plus de cinquante ans après son lancement, le Cosmograph Daytona conserve un statut à nul autre pareil parmi les chronographes de sport, et continue de transcender les époques.\r\nPrix magasin : 26 800 €', 0, '2020-10-27 17:44:04', NULL),
(180, 1, 1, 'Cosmograph Daytona Or Jaune Cadran Vert', '116508', '2018', '- Boîtier: Or Jaune,- Diamètre du boîtier: 40 mm,- Mouvement: Automatique,- Sexe : Homme/Unisexe', 46800.00, '35', '.\r\nCette Oyster Perpetual Cosmograph Daytona en Or jaune 18 ct est assortie d’un cadran vert et d’un bracelet Oyster. Elle est dotée d’une lunette Or jaune 18 ct et d’une échelle tachymétrique moulée.\r\nCe chronographe a été conçu pour être le meilleur outil de chronométrage des pilotes de course d’endurance. Plus de cinquante ans après son lancement, le Cosmograph Daytona conserve un statut à nul autre pareil parmi les chronographes de sport, et continue de transcender les époques.\r\nPrix magasin : 34 500 €', 0, '2020-10-27 17:23:28', NULL),
(181, 1, 1, 'Cosmograph Daytona Or Gris Oysterflex', '116519', '2020', '- Boîtier: Or Gris,- Diamètre du boîtier: 40 mm,- Bracelet: Caoutchouc,- Mouvement: Automatique,- Sexe : Homme/Unisexe', 31800.00, '21', 'Cette Oyster Perpetual Cosmograph Daytona en Or gris 18 ct assortie d’un cadran Acier et noir et d’un bracelet Oysterflex est dotée d’une lunette Cerachrom noire et d’une échelle tachymétrique.\r\nCe chronographe a été conçu pour être le meilleur outil de chronométrage des pilotes de course d’endurance. Plus de cinquante ans après son lancement, le Cosmograph Daytona conserve un statut à nul autre pareil parmi les chronographes de sport, et continue de transcender les époques.\r\nPrix magasin 28 000 €', 0, '2020-10-27 17:32:53', NULL),
(182, 1, 1, 'Cosmograph Daytona Or Gris', '116509', '2020', '- Boîtier: Or Gris,- Diamètre du boîtier: 40 mm,- Mouvement: Automatique,- Sexe : Homme/Unisexe', 36800.00, '0', '.\r\nCette Oyster Perpetual Cosmograph Daytona en Or gris 18 ct est assortie d’un cadran Acier et noir et d’un bracelet Oyster. Elle est dotée d’une lunette Or gris 18 ct et d’une échelle tachymétrique moulée. Ce chronographe a été conçu pour être le meilleur outil de chronométrage des pilotes de course d’endurance. Plus de cinquante ans après son lancement, le Cosmograph Daytona conserve un statut à nul autre pareil parmi les chronographes de sport, et continue de transcender les époques.\r\nPrix magasin : 37 100 €.', 0, '2020-10-27 17:32:06', NULL),
(183, 1, 1, 'Cosmograph Daytona Platine', '116506-0002', '2018', '- Boîtier: Platine,- Diamètre du boîtier: 40 mm,- Mouvement: Automatique,- Sexe : Homme/Unisexe', 78800.00, '6', '.\r\nCette Oyster Perpetual Cosmograph Daytona en Platine assortie d’un cadran bleu glacier et d’un bracelet Oyster est dotée d’une lunette Cerachrom marron et d’une échelle tachymétrique.\r\nCe chronographe a été conçu pour être le meilleur outil de chronométrage des pilotes de course d’endurance. Plus de cinquante ans après son lancement, le Cosmograph Daytona conserve un statut à nul autre pareil parmi les chronographes de sport, et continue de transcender les époques. Prix magasin : 74 450 €', 0, '2020-10-27 00:55:15', NULL),
(184, 1, 1, 'OYSTER PERPETUAL CLASSIQUES', '116400', '2018', '7 500,acier,automatique,homme', 40.00, '5', 'hi', 0, '2020-10-06 15:56:01', NULL),
(185, 1, 1, 'Milgauss', '116400 GV', '2020', '- Boîtier: Acier,- Diamètre du boîtier: 40 mm,- Mouvement: Automatique,- Sexe: Homme/Unisexe', 11300.00, '50', '.\r\nLa glace saphir vert développée en exclusivité par Rolex est pratiquement inrayable, d’une couleur inaltérable et disponible uniquement dans la collection Milgauss. Son vert clair teinté dans la masse de la glace devient presque luminescent le long de son contour biseauté. Le fruit d’un procédé secret ayant demandé des années de développement pour en acquérir la maîtrise et requérant des semaines de production. L’Oyster Perpetual Milgauss est dotée d’un cadran noir avec des index luminescents et d’une glace saphir vert qui émet des reflets lumineux tout en conservant une lisibilité optimale.\r\nPrix magasin : 7 850 €', 0, '2020-10-27 17:29:55', NULL),
(186, 1, 1, 'Sea-Dweller', '126600', '2019', '- Boîtier: Acier,- Diamètre du boîtier: 43 mm,- Mouvement: Automatique,- Sexe : Montre Homme/Unisexe', 13300.00, '28', '.\r\nL’Oyster Perpetual Sea‑Dweller en Acier Oystersteel est dotée d’une lunette en céramique noire et d’un bracelet Oyster.\r\nElle est dotée d’un cadran noir distinctif et de grands index luminescents. Étanche jusqu\'à 1 220 mètres, dotée d’une lunette tournante unidirectionnelle 60 minutes, la Rolex Sea-Dweller fait partie des montres de plongée ultra-résistantes conçues par Rolex pour l’exploration sous-marine.  \r\nPrix magasin : 10 950 €', 0, '2020-10-27 17:26:04', NULL),
(187, 1, 1, 'Air-King', '116900', '2018', '- Boîtier: Acier,- Diamètre du boîtier: 40 mm,- Mouvement: Automatique,- Sexe: Homme/Unisexe', 6700.00, '17', '.\r\nDotée d’un boîtier 40 mm en Acier Oystersteel, d’un bracelet Oyster à maillons massifs avec fermoir Oysterclasp et d’un cadran Noir caractéristique, l’Air-King perpétue la tradition aéronautique de la Rolex Oyster originale. Le cadran Air-King se distingue par son cadran noir combinant de grands repères 3, 6 et 9 pour les heures et une échelle des minutes au premier plan pour la lecture des temps de navigation. Il arbore le nom Air-King écrit dans les caractères créés spéciﬁquement pour ce modèle dans les années 1950.\r\nPrix magasin : 6 050 €.', 0, '2020-10-27 17:25:01', NULL),
(188, 1, 1, 'COLLECTION CELLINI', '50535', '2018', 'or rose,39 mm,cuir,automatique,homme', 24550.00, '5', 'hi', 0, '2020-10-06 16:18:25', NULL),
(189, 1, 1, 'COLLECTION CELLINI', '50529', '2018', 'or gris,39 mm,cuir,automatique,homme', 17.00, '5', 'hi', 0, '2020-10-06 16:22:52', NULL),
(190, 1, 1, 'COLLECTION CELLINI', '50525', '2018', 'or rose,39 mm,cuir,automatique,homme', 17750.00, '5', 'hi', 0, '2020-10-06 16:26:03', NULL),
(191, 1, 1, 'COLLECTION CELLINI', '50515', '2018', 'or rose,39 mm,automatique,homme', 16350.00, '5', 'hi', 0, '2020-10-06 16:51:48', NULL),
(192, 1, 1, 'COLLECTION CELLINI', '50509', '2018', 'or gris,39 mm,cuir,automatique,homme', 13950.00, '5', 'hi', 0, '2020-10-06 17:00:20', NULL),
(193, 1, 1, 'COLLECTION CELLINI', '50709', '2018', '39 mm,cuir,automatique,homme', 21050.00, '5', 'hi', 0, '2020-10-06 17:02:50', NULL),
(194, 1, 1, 'COLLECTION CELLINI', '50505', '2018', 'or rose,39 mm,cuir,automatique,homme', 13950.00, '5', 'hi', 0, '2020-10-06 17:05:34', NULL),
(195, 1, 1, 'COLLECTION CELLINI', '50605', '2018', 'or rose serti de diamants,39 mm,cuir,automatique,homme', 19000.00, '5', 'hi', 0, '2020-10-06 17:08:37', NULL),
(196, 1, 11, 'COLLECTION SPORT', '25865BC.OO.1105BC.01', '2013', 'or gris,44x58,5 mm,automatique,homme', 629160.00, '5', 'hi', 0, '2020-10-06 18:11:21', NULL),
(197, 1, 11, 'COLLECTION SPORT', '25829ST.OO.0944ST.01', '2013', 'acier,automatique,homme', 71.00, '5', 'hi', 0, '2020-10-06 18:32:41', NULL),
(198, 1, 11, 'COLLECTION SPORT', '25865BC.OO.1105BC.04', '2013', 'or gris,44x58,5 mm,automatique,homme', 629160.00, '5', 'hi', 0, '2020-10-06 18:31:45', NULL),
(199, 1, 11, 'COLLECTION SPORT', '26068BC.ZZ.D002CR.01', '2013', 'or serti diamants,39x49,5 mm,croco,automatique,homme', 76020.00, '5', 'hi', 0, '2020-10-06 18:31:20', NULL),
(200, 1, 11, 'COLLECTION SPORT', '26120BA.OO.D088CR.01', '2013', 'or jaune,39 mm,croco,automatique,homme', 28970.00, '5', 'hi', 0, '2020-10-06 18:34:17', NULL),
(201, 1, 11, 'COLLECTION SPORT', '26120OR.OO.D002CR.01', '2013', 'or rose,39x49,5 mm,croco,automatique,homme', 28970.00, '5', 'hi', 0, '2020-10-06 19:02:46', NULL),
(202, 1, 11, 'COLLECTION SPORT', '26120ST.OO.1220ST.01', '2013', '', 17590.00, '5', 'hi', 0, '2020-10-06 19:10:38', NULL),
(203, 1, 11, 'COLLECTION SPORT', '26120ST.OO.1220ST.02', '2013', 'acier,39x49,5 mm,automatique,homme', 17590.00, '5', 'hi', 0, '2020-10-06 19:12:44', NULL),
(204, 1, 11, 'COLLECTION SPORT', '26252OR.OO.D092CR.01', '2013', '', 56350.00, '5', 'hi', 0, '2020-10-06 19:13:49', NULL),
(205, 1, 11, 'COLLECTION SPORT', '15154BC.ZZ.D004CU.01', '2013', '', 69210.00, '5', 'hi', 0, '2020-10-06 19:19:13', NULL),
(206, 1, 11, 'COLLECTION SPORT', '15305OR.OO.D088CR.01', '2013', 'or rose,39x49,5 mm,croco,automatique,homme', 42120.00, '5', 'hi', 0, '2020-10-06 19:21:07', NULL),
(207, 1, 11, 'COLLECTION SPORT', '15305ST.OO.1220ST.01', '2013', '', 30.00, '5', 'hi', 0, '2020-10-06 19:22:38', NULL),
(208, 1, 11, 'COLLECTION SPORT', '26603ST.OO.D002CR.01', '2013', 'acier,42 mm,croco,automatique,homme', 57.00, '5', 'hi', 0, '2020-10-06 19:26:53', NULL),
(209, 1, 11, 'COLLECTION SPORT', '26330OR.OO.D088CR.01', '2013', 'or rose,39 mm,croco,automatique,homme', 26700.00, '5', 'hi', 0, '2020-10-06 19:31:39', NULL),
(210, 1, 11, 'COLLECTION SPORT', '26330ST.OO.1220ST.01', '2013', 'acier,39 mm,automatique,homme', 15450.00, '5', 'hi', 0, '2020-10-06 19:37:01', NULL),
(211, 1, 11, 'COLLECTION SPORT', '25966BC.ZZ.1185BC.01', '2013', 'or gris,39x49,5 mm,automatique,homme', 54380.00, '5', 'hi', 0, '2020-10-06 19:39:24', NULL),
(212, 1, 11, 'COLLECTION SPORT', '25967BC.ZZ.1185BC.01', '2013', 'or serti diamants,39x49,5 mm,or gris,automatique,homme', 103790.00, '5', 'hi', 0, '2020-10-06 19:43:15', NULL),
(213, 1, 11, 'COLLECTION SPORT', '25978BC.ZZ.1190BC.01', '2013', 'or serti diamants,39x49,5 mm,or gris,automatique,homme', 160140.00, '5', 'hi', 0, '2020-10-06 20:14:43', NULL),
(214, 1, 11, 'COLLECTION SPORT', '26120ST.OO.1220ST.03', '2013', 'acier,39x49,5 mm,automatique,homme', 17590.00, '5', 'hi', 0, '2020-10-06 20:44:32', NULL),
(215, 1, 11, 'COLLECTION SPORT', '26120OR.OO.D088CR.01', '2013', 'or rose,39x49,5 mm,croco,automatique,homme', 28970.00, '5', 'hi', 0, '2020-10-06 20:52:33', NULL),
(216, 1, 11, 'COLLECTION SPORT', '26252OR.OO.D092CR.02', '2013', 'or rose,39x49 mm,croco,automatique,homme', 56350.00, '5', 'hi', 0, '2020-10-06 20:55:47', NULL),
(217, 1, 11, 'COLLECTION SPORT', '25820ST.OO.0944ST.03', '2013', 'acier,39x49 mm,automatique,homme', 44780.00, '5', 'hi', 0, '2020-10-06 20:58:50', NULL),
(218, 1, 11, 'COLLECTION SPORT', '25820ST.OO.0944ST.04', '2013', 'acier,39x49 mm,automatique,homme', 44780.00, '5', 'hi', 0, '2020-10-06 21:13:11', NULL),
(219, 1, 11, 'COLLECTION SPORT', '25820ST.OO.0944ST.05', '2013', 'acier,39x49 mm,automatique,homme', 44780.00, '5', 'hi', 0, '2020-10-06 21:36:55', NULL),
(220, 1, 11, 'COLLECTION SPORT', '25829OR.OO.0944OR.01', '2013', 'or rose,39x49 mm,automatique,homme', 94900.00, '5', 'hi', 0, '2020-10-06 21:41:44', NULL),
(221, 1, 11, 'COLLECTION SPORT', '25829OR.OO.0944OR.01', '2013', 'or rose,39x49 mm,automatique,homme', 94900.00, '5', 'hi', 0, '2020-10-06 21:42:07', NULL),
(222, 1, 11, 'COLLECTION SPORT', '25829PT.OO.0944PT.01', '2013', 'platine,39x49 mm,platine,automatique,homme', 121090.00, '5', 'hi', 0, '2020-10-06 21:51:44', NULL),
(223, 1, 11, 'COLLECTION SPORT', '15130BC.ZZ.8042BC.01', '2013', 'or gris serti diamants,42 mm,or blanc et diamants,automatique,homme', 1113210.00, '5', 'hi', 0, '2020-10-06 21:55:46', NULL),
(224, 1, 11, 'COLLECTION SPORT', '15202OR.OO.1240OR.01', '2013', 'or rose,39 mm,or rose,automatique,homme', 42120.00, '5', 'hi', 0, '2020-10-06 22:00:33', NULL),
(225, 1, 11, 'COLLECTION SPORT', '15202ST.OO.1240ST.01', '2013', 'acier,39 mm,automatique,homme', 18160.00, '5', 'hi', 0, '2020-10-06 22:08:21', NULL),
(226, 1, 11, 'COLLECTION SPORT', '15203PT.OO.1240PT.01', '2013', 'platine,39 mm,,automatique,homme', 114580.00, '5', 'hi', 0, '2020-10-07 15:57:00', NULL),
(227, 1, 11, 'COLLECTION SPORT', '15400OR.OO.1220OR.01', '2013', 'or rose,41 mm,automatique,homme', 41820.00, '5', 'hi', 0, '2020-10-06 22:24:10', NULL),
(228, 1, 11, 'COLLECTION SPORT', '15400OR.OO.1220OR.02', '2013', 'or rose,41 mm,automatique,homme', 41820.00, '5', 'hi', 0, '2020-10-06 22:29:21', NULL),
(229, 1, 11, 'COLLECTION SPORT', '15400OR.OO.1220OR.02', '2013', 'or rose,41 mm,automatique,homme', 41820.00, '5', 'hi', 0, '2020-10-06 22:29:31', NULL),
(230, 1, 11, 'COLLECTION SPORT', '15400OR.OO.D002CR.01', '2013', 'or rose,41 mm,croco,automatique,homme', 26500.00, '5', 'hi', 0, '2020-10-06 22:32:12', NULL),
(231, 1, 11, 'COLLECTION SPORT', '15400ST.OO.1220ST.01', '2013', 'acier,41 mm,automatique,homme', 13660.00, '5', 'hi', 0, '2020-10-06 22:34:16', NULL),
(232, 1, 11, 'COLLECTION SPORT', '15400ST.OO.1220ST.03', '2013', 'acier,41 mm,automatique,homme', 13660.00, '5', 'hi', 0, '2020-10-07 16:01:13', NULL),
(233, 1, 11, 'COLLECTION SPORT', '15450OR.OO.D002CR.01', '2013', 'or rose,37 mm,croco,automatique,medium', 23730.00, '5', 'hi', 0, '2020-10-07 16:12:01', NULL),
(234, 1, 11, 'COLLECTION SPORT', '15450OR.OO.D088CR.01', '2013', 'or rose,37 mm,croco,automatique,medium', 23730.00, '5', 'hi', 0, '2020-10-07 16:14:40', NULL),
(235, 1, 11, 'COLLECTION SPORT', '15450ST.OO.1256ST.01', '2013', 'acier,37 mm,automatique,medium', 13180.00, '5', 'hi', 0, '2020-10-07 16:19:22', NULL),
(236, 1, 11, 'COLLECTION SPORT', '15451OR.ZZ.1256OR.01', '2013', 'or rose serti diamants,37 mm,or rose', 40440.00, '5', 'hi', 0, '2020-10-07 16:22:51', NULL),
(237, 1, 11, 'COLLECTION SPORT', '15451ST.ZZ.1256ST.01', '2013', 'acier serti diamants,37 mm,acier,automatique,medium', 20060.00, '5', 'hi', 0, '2020-10-07 16:32:02', NULL),
(238, 1, 11, 'COLLECTION SPORT', '15451ST.ZZ.D011CR.01', '2013', 'acier serti diamants,37 mm,croco,automatique,medium', 18910.00, '5', 'hi', 0, '2020-10-07 16:34:40', NULL),
(239, 1, 11, 'COLLECTION SPORT', '15452BC.ZZ.D019CR.01', '2013', 'or gris serti diamants,37 mm,croco,automatique,medium', 65250.00, '5', 'hi', 0, '2020-10-07 16:43:39', NULL),
(240, 1, 11, 'COLLECTION SPORT', '15452OR.ZZ.D003CR.01', '2013', 'or rose serti diamants,37 mm,croco,automatique,medium', 40240.00, '5', 'hi', 0, '2020-10-07 16:50:06', NULL),
(241, 1, 11, 'COLLECTION SPORT', '25865ST.OO.1105ST.02', '2013', 'acier,44 mm,acier,automatique,homme', 548310.00, '5', 'hi', 0, '2020-10-07 16:52:39', NULL),
(242, 1, 11, 'COLLECTION SPORT', '25977OR.OO.D005CR.01', '2013', 'or rose,44x58 mm,croco,mécanique à remontage manuel,homme', 200260.00, '5', 'hi', 0, '2020-10-07 16:58:29', NULL),
(243, 1, 11, 'COLLECTION SPORT', '25990OR.ZZ.D002CR.01', '2013', 'or rose serti diamants,44x58,5 mm,croco,automatique,homme', 665790.00, '5', 'hi', 0, '2020-10-07 17:05:43', NULL),
(244, 1, 11, 'COLLECTION SPORT', '26065IS.OO.D002CR.01', '2013', 'titane,44 mm,croco,automatique,homme', 625520.00, '5', 'hi', 0, '2020-10-07 17:19:03', NULL),
(245, 1, 11, 'COLLECTION SPORT', '26122OR.OO.D002CR.01', '2013', '', 35.00, '5', 'hi', 0, '2020-10-07 17:27:05', NULL),
(246, 1, 11, 'COLLECTION SPORT', '26123OR.OO.D002CR.01', '2013', 'or rose,39x49,5 mm,croco,automatique,homme', 40720.00, '5', 'hi', 0, '2020-10-07 17:32:47', NULL),
(247, 1, 11, 'COLLECTION SPORT', '26127OR.ZZ.D011CR.01', '2013', 'or rose serti diamants,39x49,5 mm,croco,automatique,homme', 69210.00, '5', 'hi', 0, '2020-10-07 17:41:08', NULL),
(248, 1, 11, 'COLLECTION SPORT', '26128OR.ZZ.D002CR.01', '2013', 'or rose serti diamants,39x49,5 mm,croco,automatique,homme', 69210.00, '5', 'hi', 0, '2020-10-07 18:03:58', NULL),
(249, 1, 11, 'COLLECTION SPORT', '26129OR.ZZ.D080CA.01', '2013', 'or rose serti diamants,39x49,5 mm,croco,automatique,homme', 69210.00, '5', 'hi', 0, '2020-10-07 19:03:17', NULL),
(250, 1, 11, 'COLLECTION SPORT', '26320OR.OO.1220OR.01', '2013', 'or rose,41 mm,or rose,automatique,homme', 45480.00, '5', 'hi', 0, '2020-10-07 19:06:52', NULL),
(251, 1, 11, 'COLLECTION SPORT', '26320OR.OO.1220OR.02', '2013', 'or rose,41 mm,automatique,homme', 45480.00, '5', 'hi', 0, '2020-10-07 19:10:08', NULL),
(252, 1, 11, 'COLLECTION SPORT', '26320OR.OO.D002CR.01', '2013', 'or rose,41 mm,croco,automatique,homme', 31450.00, '5', 'hi', 0, '2020-10-07 19:15:43', NULL),
(253, 1, 11, 'COLLECTION SPORT', '26320OR.OO.D088CR.01', '2013', 'or rose,41 mm,croco,automatique,homme', 31450.00, '5', 'hi', 0, '2020-10-07 19:25:54', NULL),
(254, 1, 11, 'COLLECTION SPORT', '26320ST.OO.1220ST.01', '2013', 'acier,41 mm,automatique,homme', 19390.00, '5', 'hi', 0, '2020-10-07 19:31:55', NULL),
(255, 1, 11, 'COLLECTION SPORT', '26320ST.OO.1220ST.02', '2013', 'acier,41 mm,automatique,homme', 19390.00, '5', 'hi', 0, '2020-10-07 20:48:37', NULL),
(256, 1, 11, 'COLLECTION SPORT', '26320ST.OO.1220ST.03', '2013', 'acier,41 mm,automatique,homme', 19390.00, '5', 'hi', 0, '2020-10-07 20:53:26', NULL),
(257, 1, 11, 'COLLECTION SPORT', '26325OL.OO.D005CR.01', '2013', 'or rose,41 mm,croco,automatique,homme', 41640.00, '5', 'hi', 0, '2020-10-07 20:58:36', NULL),
(258, 1, 11, 'COLLECTION SPORT', '26325PL.OO.D310CR.01', '2013', '', 67480.00, '5', 'hi', 0, '2020-10-07 21:06:09', NULL),
(259, 1, 11, 'COLLECTION SPORT', '26325TS.OO.D005CR.01', '2013', 'acier,41 mm,croco,automatique,homme', 24630.00, '5', 'hi', 0, '2020-10-07 21:08:39', NULL),
(260, 1, 11, 'COLLECTION SPORT', '26510OR.OO.1220OR.01', '2013', 'or rose,41 mm,mécanique à remontage manuel,homme', 138790.00, '5', 'hi', 0, '2020-10-07 21:17:55', NULL),
(261, 1, 11, 'COLLECTION SPORT', '26510ST.OO.1220ST.01', '2013', 'acier,41 mm,mécanique à remontage manuel,homme', 113680.00, '5', 'hi', 0, '2020-10-07 21:20:40', NULL),
(262, 1, 11, 'COLLECTION SPORT', '26511PT.OO.1220PT.01', '2013', 'platine,41 mm,mécanique à remontage manuel,homme', 286460.00, '5', 'hi', 0, '2020-10-07 21:23:57', NULL),
(263, 1, 11, 'COLLECTION SPORT', '26552BC.OO.D002CR.01', '2013', 'or gris,44 mm,croco,automatique,homme', 626970.00, '5', 'hi', 0, '2020-10-07 21:27:41', NULL),
(264, 1, 11, 'COLLECTION SPORT', '26560IO.OO.D002CA.01', '2013', 'titane,44 mm,caoutchouc,mécanique à remontage manuel,homme', 173200.00, '5', 'hi', 0, '2020-10-07 21:30:14', NULL),
(265, 1, 11, 'COLLECTION SPORT', '26603OR.OO.D092CR.01', '2013', '', 70.00, '5', 'hi', 0, '2020-10-07 21:31:48', NULL),
(266, 1, 11, 'COLLECTION SPORT', '67651OR.ZZ.D010CA.01', '2013', 'or rose serti diamants,33 mm,caoutchouc,quartz,medium', 20370.00, '5', 'hi', 0, '2020-10-07 21:37:43', NULL),
(267, 1, 11, 'COLLECTION SPORT', '67651OR.ZZ.D080CA.01', '2013', 'or rose serti diamants,33 mm,caoutchouc,quartz,medium', 20370.00, '5', 'hi', 0, '2020-10-07 21:44:40', NULL),
(268, 1, 11, 'COLLECTION SPORT', '67651ST.ZZ.1261ST.01', '2013', 'acier serti diamants,33 mm,acier,quartz,medium', 12230.00, '5', 'hi', 0, '2020-10-07 21:47:58', NULL),
(269, 1, 11, 'COLLECTION SPORT', '67651ST.ZZ.D002CR.01', '2013', 'acier serti diamants,33 mm,croco,quartz,medium', 11340.00, '5', 'hi', 0, '2020-10-07 21:51:00', NULL),
(270, 1, 11, 'COLLECTION SPORT', '67651ST.ZZ.D011CR.01', '2013', 'acier serti diamants,33 mm,croco,quartz,medium', 11340.00, '5', 'hi', 0, '2020-10-07 21:55:30', NULL),
(271, 1, 11, 'COLLECTION SPORT', '15400OR.OO.D088CR.01', '2013', 'or rose,41 mm,croco,automatique,homme', 26500.00, '5', 'hi', 0, '2020-10-07 21:59:00', NULL),
(272, 1, 11, 'COLLECTION CLASSIQUE', '25866PT.OO.D002CR.01', '2013', 'platine,42 mm,croco,automatique,homme', 58536.00, '5', 'hi', 0, '2020-10-08 15:00:01', NULL),
(273, 1, 11, 'COLLECTION CLASSIQUE', '25996PT.OO.D002CR.01', '2013', 'platine,42 mm,croco,automatique,homme', 687690.00, '5', 'hi', 0, '2020-10-08 14:59:35', NULL),
(274, 1, 11, 'COLLECTION CLASSIQUE', '26003OR.OO.D088CR.01', '2013', 'or rose,43 mm,croco,automatique,homme', 66240.00, '5', 'hi', 0, '2020-10-08 14:57:53', NULL),
(275, 1, 11, 'COLLECTION CLASSIQUE', '26003BC.OO.D002CR.01', '2013', 'or gris,43 mm,croco,automatique,homme', 69210.00, '5', 'hi', 0, '2020-10-08 14:57:29', NULL),
(276, 1, 11, 'COLLECTION CLASSIQUE', '26003BA.OO.D088CR.01', '2013', 'or jaune,43 mm,croco,automatique,homme', 66240.00, '5', 'hi', 0, '2020-10-08 14:55:36', NULL),
(277, 1, 11, 'COLLECTION CLASSIQUE', '26003OR.OO.D002CR.01', '2013', 'or rose,43 mm,croco,automatique,homme', 66240.00, '5', 'hi', 0, '2020-10-08 14:55:00', NULL),
(278, 1, 11, 'COLLECTION CLASSIQUE', '26053PT.OO.D002CR.01', '2013', 'platine,43 mm,croco,automatique,homme', 100040.00, '5', 'hi', 0, '2020-10-08 14:54:22', NULL),
(279, 1, 11, 'COLLECTION CLASSIQUE', '26153PT.OO.D028CR.01', '2013', 'platine,43 mm,croco,mécanique à remontage manuel,homme', 275710.00, '5', 'hi', 0, '2020-10-08 14:53:37', NULL),
(280, 1, 11, 'COLLECTION CLASSIQUE', '26353PT.OO.D028CR.01', '2013', 'platine,43 mm,croco,mécanique à remontage manuel,homme', 281080.00, '5', 'hi', 0, '2020-10-08 14:52:50', NULL),
(281, 1, 11, 'COLLECTION CLASSIQUE', '26356PT.OO.D028CR.01', '2013', 'platine,43 mm,croco,mécanique à remontage manuel,homme', 352680.00, '5', 'hi', 0, '2020-10-08 14:51:44', NULL),
(282, 1, 11, 'COLLECTION CLASSIQUE', '26390OR.OO.D088CR.01', '2013', 'or rose,or rose,41 mm,croco,automatique,homme', 51410.00, '5', 'hi', 0, '2020-10-08 14:51:21', NULL),
(283, 1, 11, 'COLLECTION CLASSIQUE', '26390OR.OO.D093CR.01', '2013', 'or rose,41 mm,croco,automatique,homme,', 51410.00, '5', 'hi', 0, '2020-10-08 14:50:38', NULL),
(284, 1, 11, 'COLLECTION CLASSIQUE', '26100BC.OO.D002CR.01', '2013', 'or gris,41 mm,croco,automatique,homme', 35490.00, '5', 'hi', 0, '2020-10-08 15:06:43', NULL),
(285, 1, 11, 'COLLECTION CLASSIQUE', '26100OR.OO.D088CR.01', '2013', 'or rose,41 mm,croco,automatique,homme', 31.00, '5', 'hi', 0, '2020-10-08 16:03:50', NULL),
(286, 1, 11, 'COLLECTION CLASSIQUE', '15180OR.OO.A088CR.01', '2013', 'or rose,41 mm,croco,automatique,homme', 20220.00, '5', 'hi', 0, '2020-10-08 16:15:15', NULL),
(287, 1, 11, 'COLLECTION CLASSIQUE', '15180OR.OO.A002CR.01', '2013', 'or rose', 20220.00, '5', 'hi', 0, '2020-10-08 16:17:46', NULL),
(288, 1, 11, 'COLLECTION CLASSIQUE', '15159BC.ZZ.D002CR.01', '2013', 'or gris serti diamants,43 mm,croco,automatique,homme', 94750.00, '5', 'hi', 0, '2020-10-08 16:20:11', NULL),
(289, 1, 11, 'COLLECTION CLASSIQUE', '15159OR.ZZ.D002CR.01', '2013', 'or rose serti diamants,43 mm,croco,automatique,homme', 91330.00, '5', 'hi', 0, '2020-10-08 16:23:05', NULL),
(290, 1, 11, 'COLLECTION CLASSIQUE', '15170BC.OO.A002CR.01', '2013', 'or gris,39 mm,croco,automatique,medium', 18510.00, '5', 'hi', 0, '2020-10-08 16:31:16', NULL),
(291, 1, 11, 'COLLECTION CLASSIQUE', '15170OR.OO.A002CR.01', '2013', 'or rose,39 mm,croco,automatique,medium', 16800.00, '5', 'hi', 0, '2020-10-08 16:34:50', NULL),
(292, 1, 11, 'COLLECTION CLASSIQUE', '15170OR.OO.A088CR.01', '2013', 'or rose,39 mm,croco,automatique,medium', 16800.00, '5', 'hi', 0, '2020-10-08 16:37:35', NULL),
(293, 1, 11, 'COLLECTION CLASSIQUE', '15171BC.ZZ.A002CR.01', '2013', 'or gris serti diamants,39 mm,croco,automatique,medium', 22990.00, '5', 'hi', 0, '2020-10-08 16:40:50', NULL),
(294, 1, 11, 'COLLECTION CLASSIQUE', '15171OR.ZZ.A002CR.01', '2013', 'or rose serti diamants,39 mm,croco,automatique,medium', 21270.00, '5', 'hi', 0, '2020-10-08 16:46:37', NULL),
(295, 1, 11, 'COLLECTION CLASSIQUE', '15171OR.ZZ.A088CR.01', '2013', 'or rose serti diamants,39 mm,croco,automatique,medium', 21270.00, '5', 'hi', 0, '2020-10-08 16:49:30', NULL),
(296, 1, 11, 'COLLECTION CLASSIQUE', '15180BC.OO.A002CR.01', '2013', 'or gris', 21950.00, '5', 'hi', 0, '2020-10-08 16:52:02', NULL),
(297, 1, 11, 'COLLECTION CLASSIQUE', '25866BA.OO.D002CR.01', '2013', 'or rose,42 mm,croco,automatique,homme', 575190.00, '5', 'hi', 0, '2020-10-08 16:58:57', NULL),
(298, 1, 11, 'COLLECTION CLASSIQUE', '25866BA.OO.D002CR.02', '2013', 'or jaune,42 mm,croco,automatique,homme', 575190.00, '5', 'hi', 0, '2020-10-08 17:04:23', NULL),
(299, 1, 11, 'COLLECTION CLASSIQUE', '25866OR.OO.D002CR.01', '2013', 'or rose,42 mm,croco,automatique,homme', 575190.00, '5', 'hi', 0, '2020-10-08 17:14:58', NULL),
(300, 1, 11, 'COLLECTION CLASSIQUE', '25866OR.OO.D002CR.02', '2013', '42 mm,or rose,croco,automatique,homme', 575190.00, '5', 'hi', 0, '2020-10-08 17:22:27', NULL),
(301, 1, 11, 'COLLECTION CLASSIQUE', '25866PT.OO.D002CR.02', '2013', 'platine,42 mm,croco,automatique,homme', 585360.00, '5', 'hi', 0, '2020-10-08 17:27:20', NULL),
(302, 1, 11, 'COLLECTION CLASSIQUE', '26153OR.OO.D088CR.01', '2013', 'or rose,46 mm,croco,mécanique à remontage manuel,homme', 167180.00, '5', 'hi', 0, '2020-10-08 18:07:04', NULL),
(303, 1, 11, 'COLLECTION CLASSIQUE', '26380BC.OO.D002CR.01', '2013', 'or gris,41 mm,croco,automatique,homme', 29530.00, '5', 'hi', 0, '2020-10-08 18:36:23', NULL),
(304, 1, 11, 'COLLECTION CLASSIQUE', '26380OR.OO.D002CR.01', '2013', 'or gris,41 mm,croco,automatique,homme', 26950.00, '5', 'hi', 0, '2020-10-08 18:38:40', NULL),
(305, 1, 11, 'COLLECTION CLASSIQUE', '26380OR.OO.D088CR.0', '2013', 'or rose,41 mm,croco,automatique,homme', 26950.00, '5', 'hi', 0, '2020-10-08 18:44:44', NULL),
(306, 1, 11, 'COLLECTION CLASSIQUE', '26385OR.OO.A088CR.01', '2013', 'or rose,39 mm,croco,automatique,medium', 24160.00, '5', 'hi', 0, '2020-10-08 18:49:16', NULL),
(307, 1, 11, 'COLLECTION CLASSIQUE', '26391OR.OO.D088CR.01', '2013', 'or rose,41 mm,croco,automatique,homme', 77100.00, '5', 'hi', 0, '2020-10-08 18:57:08', NULL),
(308, 1, 11, 'COLLECTION CLASSIQUE', '26559OR.OO.D002CR.01', '2013', 'or rose,41 mm,croco,mécanique à remontage manuel,homme', 191330.00, '5', 'hi', 0, '2020-10-08 19:00:27', NULL),
(309, 1, 11, 'COLLECTION CLASSIQUE', '26559OR.OO.D088CR.01', '2013', 'or rose,41 mm,croco,mécanique à remontage manuel,homme', 191330.00, '5', 'hi', 0, '2020-10-08 19:04:19', NULL),
(310, 1, 11, 'COLLECTION CLASSIQUE', '26561BC.OO.D002CR.01', '2013', 'or gris,41 mm,croco,mécanique à remontage manuel,homme', 115170.00, '5', 'hi', 0, '2020-10-08 19:06:35', NULL),
(311, 1, 11, 'COLLECTION CLASSIQUE', '26561OR.OO.D088CR.01', '2013', 'or rose,41 mm,croco,mécanique à remontage manuel,homme', 113290.00, '5', 'hi', 0, '2020-10-08 19:10:01', NULL),
(312, 1, 11, 'COLLECTION CLASSIQUE', '26569BC.OO.D002CR.01', '2013', 'platine,croco,mécanique à remontage manuel,homme', 173690.00, '5', 'hi', 0, '2020-10-08 19:12:21', NULL),
(313, 1, 11, 'COLLECTION CLASSIQUE', '77238BC.OO.A002CR.01', '2013', '33 mm,or gris,croco,mécanique à remontage manuel,medium', 14880.00, '5', 'hi', 0, '2020-10-08 19:19:01', NULL),
(314, 1, 11, 'COLLECTION CLASSIQUE', '77238OR.OO.A088CR.01', '2013', 'or rose,33 mm,croco,mécanique à remontage manuel,medium', 13530.00, '5', 'hi', 0, '2020-10-08 19:21:47', NULL),
(315, 1, 11, 'COLLECTION CLASSIQUE', '77239BC.ZZ.A002CR.01', '2013', '33 mm,or gris serti diamants,croco,mécanique à remontage manuel,medium', 19340.00, '5', 'hi', 0, '2020-10-08 19:30:27', NULL),
(316, 1, 11, 'COLLECTION CLASSIQUE', '77239OR.ZZ.A088CR.01', '2013', 'or rose serti diamants,33 mm,croco,mécanique à remontage manuel,medium', 17990.00, '5', 'hi', 0, '2020-10-08 19:34:26', NULL),
(317, 1, 11, 'COLLECTION CLASSIQUE', '77240BC.ZZ.A808CR.01', '2013', 'or gris serti diamants,33 mm,croco,mécanique à remontage manuel,medium', 21.00, '5', 'hi', 0, '2020-10-08 19:36:33', NULL),
(318, 1, 11, 'COLLECTION CLASSIQUE', '77251OR.ZZ.1270OR.01', '2013', 'or rose serti diamants,33 mm,or rose,mécanique à remontage manuel,medium', 30020.00, '5', 'hi', 0, '2020-10-08 19:42:53', NULL),
(319, 1, 11, 'COLLECTION CLASSIQUE', '26569OR.OO.D088CR.01', '2013', 'or rose,croco,mécanique à remontage manuel,homme', 165330.00, '5', 'hi', 0, '2020-10-08 19:45:47', NULL);
INSERT INTO `product` (`id`, `upload_by`, `brand_id`, `model_name`, `id_no`, `year`, `features`, `price`, `percentage`, `description`, `status`, `created_at`, `updated_at`) VALUES
(320, 1, 11, 'COLLECTION CLASSIQUE', '26357PT.ZZ.D028CR.01', '2013', 'platine serti diamants,39 mm,croco,mécanique à remontage manuel,dame', 209470.00, '5', 'hi', 0, '2020-10-08 19:56:51', NULL),
(321, 1, 11, 'COLLECTION CLASSIQUE', '26083BC.ZZ.D102CR.01', '2013', 'or gris serti diamants,41 mm,croco,mécanique à remontage manuel,dame', 257360.00, '5', 'hi', 0, '2020-10-08 20:05:55', NULL),
(322, 1, 11, 'COLLECTION CLASSIQUE', '26051PT.00.D092CR.01', '2013', 'platine,47 mm,croco,mécanique à remontage manuel,homme', 135020.00, '5', 'hi', 0, '2020-10-08 20:13:08', NULL),
(323, 1, 11, 'COLLECTION CLASSIQUE', '15160PT.OO.A092CR.01', '2013', 'platine,43 mm,croco,automatique,homme', 52830.00, '5', 'hi', 0, '2020-10-08 20:15:48', NULL),
(324, 1, 11, 'COLLECTION CLASSIQUE', '15335OR.OO.A092CR.01', '2013', 'or rose,43 mm,croco,automatique,homme', 26970.00, '5', 'hi', 0, '2020-10-08 20:18:04', NULL),
(325, 1, 11, 'COLLECTION CLASSIQUE', '15337OR.ZZ.A810CR.01', '2013', 'or rose serti diamants,43 mm,croco,automatique,homme', 44930.00, '5', 'hi', 0, '2020-10-08 20:19:46', NULL),
(326, 1, 11, 'COLLECTION CLASSIQUE', '26564IC.OO.D002CR.01', '2013', 'titane,47 mm,croco,mécanique à remontage manuel,homme', 381940.00, '5', 'hi', 0, '2020-10-08 20:24:40', NULL),
(327, 1, 11, 'COLLECTION CLASSIQUE', '25712BA.OO.0000xx.01', '2013', 'or jaune,59 mm,mécanique à remontage manuel,homme', 721110.00, '5', 'hi', 0, '2020-10-08 20:49:57', NULL),
(328, 1, 11, 'COLLECTION CLASSIQUE', '25701BA.OO.0000XX.02', '2013', 'or jaune,52 mm,mécanique à remontage manuel,homme', 814720.00, '5', 'hi', 0, '2020-10-08 20:54:00', NULL),
(329, 1, 11, 'COLLECTION CLASSIQUE', '25712PT.OO.0000xx.01', '2013', 'platine,59 mm,mécanique à remontage manuel,homme', 813230.00, '5', 'hi', 0, '2020-10-08 20:56:53', NULL),
(330, 1, 11, 'COLLECTION CLASSIQUE', '25701OR.OO.0000XX.03', '2013', 'or rose,mécanique à remontage manuel,homme', 810900.00, '5', 'hi', 0, '2020-10-08 20:58:44', NULL),
(331, 1, 11, 'COLLECTION CONTEMPORAINE', '15327BC.ZZ.D022CR.01', '2013', 'or serti diamants,39 mm,croco,automatique,medium', 550140.00, '5', 'hi', 0, '2020-10-08 21:03:57', NULL),
(332, 1, 11, 'COLLECTION CONTEMPORAINE', '26145OR.OO.D093CR.01', '2013', 'or rose,47 mm,croco,automatique,homme', 34430.00, '5', 'hi', 0, '2020-10-08 21:09:45', NULL),
(333, 1, 11, 'COLLECTION CONTEMPORAINE', '26145OR.OO.D095CR.01', '2013', 'or rose,47 mm,croco,automatique,homme', 34430.00, '5', 'hi', 0, '2020-10-08 21:13:13', NULL),
(334, 1, 11, 'COLLECTION CONTEMPORAINE', '15350OR.OO.D093CR.01', '2013', 'or rose,47 mm,croco,automatique,homme', 32270.00, '5', 'hi', 0, '2020-10-08 21:16:22', NULL),
(335, 1, 11, 'COLLECTION CONTEMPORAINE', '15350ST.OO.D002CR.01', '2013', 'acier,47 mm,croco,automatique,homme', 19580.00, '5', 'hi', 0, '2020-10-08 21:34:56', NULL),
(336, 1, 11, 'COLLECTION CONTEMPORAINE', '26354OR.ZZ.D002CR.01', '2013', 'or rose serti diamants,45 mm,croco,mécanique à remontage manuel,homme', 386470.00, '5', 'hi', 0, '2020-10-08 21:38:47', NULL),
(337, 1, 11, 'COLLECTION CONTEMPORAINE', '26371TI.OO.D002CR.01', '2013', 'titane,47 mm,croco,mécanique à remontage manuel,homme', 381900.00, '5', 'hi', 0, '2020-10-08 21:41:46', NULL),
(338, 1, 11, 'COLLECTION CONTEMPORAINE', '77316BC.ZZ.D007SU.01', '2013', 'or serti diamants,39 mm,satin,automatique,dame', 67870.00, '5', 'hi', 0, '2020-10-08 22:11:21', NULL),
(339, 1, 11, 'COLLECTION CONTEMPORAINE', '77315BC.ZZ.D007SU.01', '2013', 'or serti diamants,39 mm,satin,automatique,dame', 45970.00, '5', 'hi', 0, '2020-10-08 22:19:31', NULL),
(340, 1, 11, 'COLLECTION CONTEMPORAINE', '77315OR.ZZ.D013SU.01', '2013', 'or rose serti diamants,39 mm,satin,automatique,dame', 39010.00, '5', 'hi', 0, '2020-10-08 22:24:27', NULL),
(341, 1, 11, 'COLLECTION CONTEMPORAINE', '77301OR.ZZ.D015CR.01', '2013', 'or rose serti diamants,39 mm,croco,automatique,dame', 24770.00, '5', 'hi', 0, '2020-10-09 15:08:35', NULL),
(342, 1, 11, 'COLLECTION CONTEMPORAINE', '77301ST.ZZ.D002CR.01', '2013', 'acier serti diamants,39 mm,croco,automatique,dame', 13470.00, '5', 'hi', 0, '2020-10-09 15:11:24', NULL),
(343, 1, 11, 'COLLECTION CONTEMPORAINE', '77301ST.ZZ.D015CR.01', '2013', 'acier serti diamants,39 mm,croco,automatique,dame', 13470.00, '5', 'hi', 0, '2020-10-09 15:16:34', NULL),
(344, 1, 11, 'COLLECTION CONTEMPORAINE', '77302BC.ZZ.D001CR.01', '2013', 'or gris serti diamants,39 mm,croco,automatique', 53100.00, '5', 'hi', 0, '2020-10-09 15:20:13', NULL),
(345, 1, 11, 'COLLECTION CONTEMPORAINE', '77303BC.ZZ.D007SU.01', '2013', 'or gris serti diamants,39 mm,satin,automatique,dame', 61170.00, '5', 'hi', 0, '2020-10-09 15:22:08', NULL),
(346, 1, 11, 'COLLECTION CONTEMPORAINE', '77303OR.ZZ.D009SU.01', '2013', 'or rose serti diamants,39 mm,satin,automatique,dame', 59200.00, '5', 'hi', 0, '2020-10-09 15:26:56', NULL),
(347, 1, 11, 'COLLECTION CONTEMPORAINE', '77306BC.ZZ.D007SU.01', '2013', 'or serti diamants,39 mm,satin,automatique,dame', 433000.00, '5', 'hi', 0, '2020-10-09 15:31:02', NULL),
(348, 1, 11, 'COLLECTION CONTEMPORAINE', '26354OR.ZZ.D088CR.01', '2013', 'or rose serti diamants,45 mm,croco,mécanique à remontage manuel,homme', 386470.00, '5', 'hi', 0, '2020-10-09 15:33:50', NULL),
(349, 1, 12, 'LES MONTRES COMPLIQUÉES', '5146J-001', '2012', 'or jaune,39 mm,croco,automatique,homme', 32210.00, '5', 'hi', 0, '2020-10-09 16:23:02', NULL),
(350, 1, 12, 'LES MONTRES COMPLIQUÉES', '5146G-001', '2012', 'or blanc,39 mm,croco,automatique,homme', 33680.00, '5', 'hi', 0, '2020-10-09 16:23:28', NULL),
(351, 1, 12, 'LES MONTRES COMPLIQUÉES', '5146R-001', '2012', 'or rose,39 mm,croco,automatique,homme', 33680.00, '5', 'hi', 0, '2020-10-09 16:24:26', NULL),
(352, 1, 12, 'LES MONTRES COMPLIQUÉES', '5146P-001', '2012', 'platine,39 mm,croco,automatique,homme', 52140.00, '5', 'hi', 0, '2020-10-09 16:24:54', NULL),
(353, 1, 12, 'LES MONTRES COMPLIQUÉES', '4936G-001', '2012', 'or blanc serti diamants,37 mm,croco,automatique,dame', 37470.00, '5', 'hi', 0, '2020-10-09 16:25:23', NULL),
(354, 1, 12, 'LES MONTRES COMPLIQUÉES', '4936J-001', '2012', 'or jaune serti diamants,37 mm,croco,automatique,dame', 35990.00, '5', 'hi', 0, '2020-10-09 16:28:31', NULL),
(355, 1, 12, 'LES MONTRES COMPLIQUÉES', '4936R-001', '2012', 'or rose serti diamants,37 mm,croco,automatique,medium', 37470.00, '5', 'hi', 0, '2020-10-09 16:28:57', NULL),
(356, 1, 12, 'LES MONTRES COMPLIQUÉES', '5146/1J-001', '2012', 'or jaune,39 mm,or jaune,automatique,homme', 52.00, '5', 'hi', 0, '2020-10-09 16:29:13', NULL),
(357, 1, 12, 'LES MONTRES COMPLIQUÉES', '5146/1G-001', '2012', 'or blanc,39 mm,automatique,homme', 53800.00, '5', 'hi', 0, '2020-10-09 16:21:35', NULL),
(358, 1, 12, 'LES MONTRES COMPLIQUÉES', '5147G-001', '2012', 'or blanc serti diamants,39 mm,croco,automatique,homme', 40420.00, '5', 'hi', 0, '2020-10-09 16:32:00', NULL),
(359, 1, 12, 'LES MONTRES COMPLIQUÉES', '5205G-001', '2012', 'or blanc,40 mm,croco,automatique,homme', 37650.00, '5', 'hi', 0, '2020-10-09 16:33:53', NULL),
(360, 1, 12, 'LES MONTRES COMPLIQUÉES', '5396G-011', '2012', 'or blanc,38 mm,croco,automatique,homme', 39040.00, '5', 'hi', 0, '2020-10-09 16:35:59', NULL),
(361, 1, 12, 'LES MONTRES COMPLIQUÉES', '5396R-011', '2012', 'or rose,38 mm,croco,automatique,homme', 39040.00, '5', 'hi', 0, '2020-10-09 16:38:34', NULL),
(362, 1, 12, 'LES MONTRES COMPLIQUÉES', '5180/1G-001', '2012', 'or blanc,39 mm,automatique,homme', 79460.00, '5', 'hi', 0, '2020-10-09 16:44:42', NULL),
(363, 1, 12, 'LES MONTRES COMPLIQUÉES', '5146/1G-010', '2012', 'or blanc,39 mm,automatique,homme', 53800.00, '5', 'hi', 0, '2020-10-09 16:47:30', NULL),
(364, 1, 12, 'LES MONTRES COMPLIQUÉES', '5146G_010', '2012', 'or blanc,39 mm,croco,automatique,homme', 33680.00, '5', 'hi', 0, '2020-10-09 16:51:31', NULL),
(365, 1, 12, 'LES MONTRES COMPLIQUÉES', '5146J-010', '2012', 'or jaune,39 mm,croco,automatique,homme', 32210.00, '5', 'hi', 0, '2020-10-09 16:53:22', NULL),
(366, 1, 12, 'LES MONTRES COMPLIQUÉES', '5205G-010', '2012', 'or blanc,40 mm,croco,automatique,homme', 37650.00, '5', 'hi', 0, '2020-10-09 19:58:26', NULL),
(367, 1, 12, 'LES MONTRES COMPLIQUÉES', '5139G-001', '2012', 'or blanc,38 mm,croco,automatique,homme', 69120.00, '5', 'hi', 0, '2020-10-09 20:03:05', NULL),
(368, 1, 12, 'LES MONTRES COMPLIQUÉES', '5140J-001', '2012', 'or jaune,37 mm,croco,automatique,homme', 67280.00, '5', 'hi', 0, '2020-10-09 20:08:42', NULL),
(369, 1, 12, 'LES MONTRES COMPLIQUÉES', '5140G-001', '2012', 'or blanc,37 mm,croco,automatique,homme', 69120.00, '5', 'hi', 0, '2020-10-09 20:16:50', NULL),
(370, 1, 12, 'LES MONTRES COMPLIQUÉES', '5140R-001', '2012', 'or rose,37 mm,croco,automatique,homme', 69120.00, '5', 'hi', 0, '2020-10-09 20:32:15', NULL),
(371, 1, 12, 'LES MONTRES COMPLIQUÉES', '5140P-001', '2012', 'platine,37 mm,croco,automatique,homme', 86190.00, '5', 'hi', 0, '2020-10-09 20:30:51', NULL),
(372, 1, 12, 'LES MONTRES COMPLIQUÉES', '5159J-001', '2012', 'or jaune,38 mm,croco,automatique,homme', 75300.00, '5', 'hi', 0, '2020-10-09 20:37:51', NULL),
(373, 1, 12, 'LES MONTRES COMPLIQUÉES', '5159G-001', '2012', 'or blanc,38 mm,croco,automatique,homme', 76870.00, '5', 'hi', 0, '2020-10-09 20:43:11', NULL),
(374, 1, 12, 'LES MONTRES COMPLIQUÉES', '5159R-001', '2012', 'or rose,38 mm,croco,automatique,homme', 76870.00, '5', 'hi', 0, '2020-10-09 20:45:29', NULL),
(375, 1, 12, 'LES MONTRES COMPLIQUÉES', '5160J-001', '2012', 'or jaune,38 mm,croco,automatique,homme', 122090.00, '5', 'hi', 0, '2020-10-09 20:51:31', NULL),
(376, 1, 12, 'LES MONTRES COMPLIQUÉES', '5160G-001', '2012', 'or blanc,38 mm,croco,automatique,homme', 124030.00, '5', 'hi', 0, '2020-10-09 21:11:14', NULL),
(377, 1, 12, 'LES MONTRES COMPLIQUÉES', '5139G-010', '2012', 'or blanc,38 mm,croco,automatique,homme', 69120.00, '5', 'hi', 0, '2020-10-09 21:16:28', NULL),
(378, 1, 12, 'LES MONTRES COMPLIQUÉES', '4937G-001', '2012', 'or blanc serti diamants,37 mm,croco,automatique,dame', 55650.00, '5', 'hi', 0, '2020-10-09 21:47:48', NULL),
(379, 1, 12, 'LES MONTRES COMPLIQUÉES', '4937R-001', '2012', 'or rose serti diamants,37 mm,croco,automatique', 55650.00, '5', 'hi', 0, '2020-10-09 21:50:04', NULL),
(380, 1, 12, 'LES MONTRES COMPLIQUÉES', '4958/1J-001', '2012', 'or jaune serti diamants,31 mm,or jaune,mécanique à remontage manuel,dame', 37100.00, '5', 'hi', 0, '2020-10-09 22:01:27', NULL),
(381, 1, 12, 'LES MONTRES COMPLIQUÉES', '4958/1G-001', '2012', 'or blanc serti diamants,31 mm,or blanc,mécanique à remontage manuel,dame', 40240.00, '5', 'hi', 0, '2020-10-09 22:04:32', NULL),
(382, 1, 12, 'LES MONTRES COMPLIQUÉES', '4958/1G-010', '2012', 'or blanc serti diamants,31 mm,or blanc,mécanique à remontage manuel,dame', 40240.00, '5', 'hi', 0, '2020-10-09 22:27:11', NULL),
(383, 1, 12, 'LES MONTRES COMPLIQUÉES', '7071R-001', '2012', 'or rose serti diamants,35x39 mm,croco,mécanique à remontage manuel,dame', 74470.00, '5', 'hi', 0, '2020-10-09 22:28:59', NULL),
(384, 1, 12, 'LES MONTRES COMPLIQUÉES', '7071R-010', '2012', 'or rose serti diamants,35x39 mm,croco,mécanique à remontage manuel,dame', 74470.00, '5', 'hi', 0, '2020-10-09 22:31:30', NULL),
(385, 1, 12, 'LES MONTRES COMPLIQUÉES', '4958J-001', '2012', 'or jaune serti diamants,31 mm,satin,mécanique à remontage manuel,dame', 22890.00, '5', 'hi', 0, '2020-10-09 22:33:18', NULL),
(386, 1, 12, 'LES MONTRES COMPLIQUÉES', '4958G-001', '2012', 'or blanc serti diamants,31 mm,satin,mécanique à remontage manuel,dame', 24360.00, '5', 'hi', 0, '2020-10-09 22:38:15', NULL),
(387, 1, 12, 'LES MONTRES COMPLIQUÉES', '4934G-001', '2012', 'or blanc serti diamants,35 mm,croco,mécanique à remontage manuel,dame', 31280.00, '5', 'hi', 0, '2020-10-09 22:41:22', NULL),
(388, 1, 12, 'LES MONTRES COMPLIQUÉES', '4934R-001', '2012', 'or rose serti diamants,35 mm,croco,mécanique à remontage manuel,dame', 31280.00, '5', 'hi', 0, '2020-10-09 22:44:27', NULL),
(389, 1, 12, 'LES MONTRES COMPLIQUÉES', '7000R-001', '2012', 'or rose,33,7 mm,croco,automatique,dame', 291420.00, '5', 'hi', 0, '2020-10-09 22:47:27', NULL),
(390, 1, 12, 'LES MONTRES COMPLIQUÉES', '7059R-001', '2012', 'or rose,33,2 mm,croco,mécanique à remontage manuel,dame', 362200.00, '5', 'hi', 0, '2020-10-09 22:49:49', NULL),
(391, 1, 12, 'LES MONTRES COMPLIQUÉES', '7130G-001', '2012', 'or blanc,36 mm,croco,automatique,dame', 41530.00, '5', 'hi', 0, '2020-10-09 22:58:32', NULL),
(392, 1, 12, 'LES MONTRES COMPLIQUÉES', '7180/1G-001', '2012', 'or blanc,31,4 mm,or blanc,mécanique à remontage manuel,dame', 69210.00, '5', 'hi', 0, '2020-10-12 14:49:43', NULL),
(393, 1, 12, 'LES MONTRES COMPLIQUÉES', '5130G-001', '2012', 'or blanc,39,5 mm,croco,automatique,homme', 35810.00, '5', 'hi', 0, '2020-10-12 14:51:48', NULL),
(394, 1, 12, 'LES MONTRES COMPLIQUÉES', '5130R-001', '2012', 'or rose,39,5 mm,croco,automatique,homme', 35810.00, '5', 'hi', 0, '2020-10-12 14:57:30', NULL),
(395, 1, 12, 'LES MONTRES COMPLIQUÉES', '5130P-001', '2012', 'platine,39,5 mm,croco,automatique,homme', 49560.00, '5', 'hi', 0, '2020-10-12 15:03:43', NULL),
(396, 1, 12, 'LES MONTRES COMPLIQUÉES', '5131J-001', '2012', 'or jaune,39,5 mm,croco,automatique,homme', 49650.00, '5', 'hi', 0, '2020-10-12 15:08:37', NULL),
(397, 1, 12, 'LES MONTRES COMPLIQUÉES', '5131G-001', '2012', 'or blanc,39,5 mm,croco,automatique,homme', 51680.00, '5', 'hi', 0, '2020-10-12 15:11:42', NULL),
(398, 1, 12, 'LES MONTRES COMPLIQUÉES', '5004R-014', '2012', '36,7 mm,croco,mécanique à remontage manuel,homme', 202380.00, '5', 'hi', 0, '2020-10-12 15:13:54', NULL),
(399, 1, 12, 'LES MONTRES COMPLIQUÉES', '5004G-013', '2012', 'or blanc,36,7 mm,croco,mécanique à remontage manuel,homme', 202380.00, '5', 'hi', 0, '2020-10-12 15:16:43', NULL),
(400, 1, 12, 'LES MONTRES COMPLIQUÉES', '5004P-021', '2012', 'platine,36,7 mm,croco,mécanique à remontage manuel,homme', 220370.00, '5', 'hi', 0, '2020-10-12 15:39:39', NULL),
(401, 1, 12, 'LES MONTRES COMPLIQUÉES', '5170J-001', '2012', 'or jaune,29,6 mm,croco,mécanique à remontage manuel,homme', 64510.00, '5', 'hi', 0, '2020-10-12 15:43:30', NULL),
(402, 1, 12, 'LES MONTRES COMPLIQUÉES', '5950A-001', '2012', 'acier,37x44,60 mm,croco,mécanique à remontage manuel,homme', 367690.00, '5', 'hi', 0, '2020-10-12 15:47:26', NULL),
(403, 1, 12, 'LES MONTRES COMPLIQUÉES', '5951P-001', '2012', 'platine,37x45,0 mm,croco,mécanique à remontage manuel,homme', 417900.00, '5', 'hi', 0, '2020-10-12 15:50:05', NULL),
(404, 1, 12, 'LES MONTRES COMPLIQUÉES', '5950A-001', '2012', 'acier,37x44,60 mm,croco,mécanique à remontage manuel,homme', 367690.00, '5', 'hi', 0, '2020-10-12 15:51:19', NULL),
(405, 1, 12, 'LES MONTRES COMPLIQUÉES', '5959P-011', '2012', 'platine,33 mm,croco,mécanique à remontage manuel,homme', 367690.00, '5', 'hi', 0, '2020-10-12 16:00:43', NULL),
(406, 1, 12, 'LES MONTRES COMPLIQUÉES', '5960R-001', '2012', 'or rose,40 mm,croco,automatique,homme', 60540.00, '5', 'hi', 0, '2020-10-12 15:54:37', NULL),
(407, 1, 12, 'LES MONTRES COMPLIQUÉES', '5960P-015', '2012', 'platine,40,5 mm,croco,automatique,homme', 72170.00, '5', 'hi', 0, '2020-10-12 16:01:01', NULL),
(408, 1, 12, 'LES MONTRES COMPLIQUÉES', '5971P-001', '2012', 'platine serti diamants,40 mm,croco,mécanique à remontage manuel,homme', 200350.00, '5', 'hi', 0, '2020-10-12 16:00:10', NULL),
(409, 1, 12, 'LES MONTRES COMPLIQUÉES', '5959P-001', '2012', 'platine,33 mm,croco,mécanique à remontage manuel,homme', 367690.00, '5', 'hi', 0, '2020-10-12 16:02:25', NULL),
(410, 1, 12, 'LES MONTRES COMPLIQUÉES', '5960P-001', '2012', 'platine,40,5 mm,croco,automatique,homme', 72170.00, '5', 'hi', 0, '2020-10-12 16:05:35', NULL),
(411, 1, 12, 'LES MONTRES COMPLIQUÉES', '5961P-001', '2012', 'platine,40,5 mm,croco,automatique,homme', 119970.00, '5', 'hi', 0, '2020-10-12 16:09:21', NULL),
(412, 1, 12, 'LES MONTRES COMPLIQUÉES', '5970J-001', '2012', 'or jaune,40 mm,croco,mécanique à remontage manuel,homme', 118400.00, '5', 'hi', 0, '2020-10-12 16:13:34', NULL),
(413, 1, 12, 'LES MONTRES COMPLIQUÉES', '5002G-001', '2012', 'or blanc,42,8 mm,croco,mécanique à remontage manuel,homme', 936050.00, '5', 'hi', 0, '2020-10-12 16:15:25', NULL),
(414, 1, 12, 'LES MONTRES COMPLIQUÉES', '5002J-001', '2012', 'or jaune,42,8 mm,croco,mécanique à remontage manuel,homme', 919310.00, '5', 'hi', 0, '2020-10-12 16:17:04', NULL),
(415, 1, 12, 'LES MONTRES COMPLIQUÉES', '5002R-001', '2012', 'or rose,42,8 mm,croco,mécanique à remontage manuel,homme', 936050.00, '5', 'hi', 0, '2020-10-12 16:19:13', NULL),
(416, 1, 12, 'LES MONTRES COMPLIQUÉES', '5013G-001', '2012', 'or blanc,36x46,4 mm,croco,automatique,homme', 505580.00, '5', 'hi', 0, '2020-10-12 16:26:39', NULL),
(417, 1, 12, 'LES MONTRES COMPLIQUÉES', '5013J-001', '2012', 'or jaune,36x46,4 mm,croco,automatique,homme', 501410.00, '5', 'hi', 0, '2020-10-12 16:30:27', NULL),
(418, 1, 12, 'LES MONTRES COMPLIQUÉES', '5013P-001', '2012', 'platine,36x46,4 mm,croco,automatique,homme', 522310.00, '5', 'hi', 0, '2020-10-12 16:32:13', NULL),
(419, 1, 12, 'LES MONTRES COMPLIQUÉES', '5013R-001', '2012', 'or rose,36x46,4 mm,croco,automatique,homme', 505580.00, '5', 'hi', 0, '2020-10-12 16:42:12', NULL),
(420, 1, 12, 'LES MONTRES COMPLIQUÉES', '5016G-010', '2012', 'or blanc,36,8 mm,croco,mécanique à remontage manuel,homme', 559950.00, '5', 'hi', 0, '2020-10-12 16:44:19', NULL),
(421, 1, 12, 'LES MONTRES COMPLIQUÉES', '5016J-011', '2012', '36,8 mm,croco,or jaune,mécanique à remontage manuel,homme', 555.00, '5', 'hi', 0, '2020-10-12 16:46:26', NULL),
(422, 1, 12, 'LES MONTRES COMPLIQUÉES', '5016R-010', '2012', 'or rose,36,8 mm,croco,mécanique à remontage manuel,homme', 559950.00, '5', 'hi', 0, '2020-10-12 16:48:21', NULL),
(423, 1, 12, 'LES MONTRES COMPLIQUÉES', '5016P-010', '2012', 'platine,36,8 mm,croco,mécanique à remontage manuel,homme', 576680.00, '5', 'hi', 0, '2020-10-12 16:53:28', NULL),
(424, 1, 12, 'LES MONTRES COMPLIQUÉES', '5074P-001', '2012', 'platine,42 mm,croco,automatique,homme', 484760.00, '5', 'hi', 0, '2020-10-12 16:57:35', NULL),
(425, 1, 12, 'LES MONTRES COMPLIQUÉES', '5078P-001', '2012', 'platine,38 mm,croco,mécanique à remontage manuel,homme', 300830.00, '5', 'hi', 0, '2020-10-12 17:05:59', NULL),
(426, 1, 12, 'LES MONTRES COMPLIQUÉES', '5101R-001', '2012', 'or rose,29,6x51,7 mm,croco,mécanique à remontage manuel,homme', 278430.00, '5', 'hi', 0, '2020-10-12 17:07:48', NULL),
(427, 1, 12, 'LES MONTRES COMPLIQUÉES', '5102PR-001', '2012', 'platine,43,1 mm,croco,mécanique à remontage manuel,homme', 245480.00, '5', 'hi', 0, '2020-10-12 17:11:35', NULL),
(428, 1, 12, 'LES MONTRES COMPLIQUÉES', '5104P-001', '2012', 'platine,43 mm,croco,automatique,homme', 501410.00, '5', 'hi', 0, '2020-10-12 17:14:13', NULL),
(429, 1, 12, 'LES MONTRES COMPLIQUÉES', '5339R-001', '2012', 'or rose,36 mm,croco,mécanique à remontage manuel,homme', 409490.00, '5', 'hi', 0, '2020-10-12 18:48:16', NULL),
(430, 1, 12, 'LES MONTRES COMPLIQUÉES', '6104G-001', '2012', 'or blanc serti diamants,44 mm,croco,automatique,homme', 317550.00, '5', 'hi', 0, '2020-10-12 18:53:33', NULL),
(431, 1, 12, 'LES MONTRES COMPLIQUÉES', '5002P-001', '2012', 'platine,42,5 mm,croco,mécanique à remontage manuel,homme', 969440.00, '5', 'hi', 0, '2020-10-12 19:00:52', NULL),
(432, 1, 12, 'LES MONTRES COMPLIQUÉES', '5013G-010', '2012', 'or blanc,36x46,4 mm,croco,mécanique à remontage manuel,homme', 505580.00, '5', 'hi', 0, '2020-10-12 19:04:29', NULL),
(433, 1, 12, 'LES MONTRES COMPLIQUÉES', '5013J-010', '2012', 'or jaune,36x46,4 mm,croco,automatique,homme', 501410.00, '5', 'hi', 0, '2020-10-12 19:19:22', NULL),
(434, 1, 12, 'LES MONTRES COMPLIQUÉES', '5013P-010', '2012', 'platine,36x46,4 mm,croco,automatique,homme', 522310.00, '5', 'hi', 0, '2020-10-12 19:23:08', NULL),
(435, 1, 12, 'LES MONTRES COMPLIQUÉES', '5013R-010', '2012', 'or rose,36x46,4 mm,croco,automatique,homme', 505580.00, '5', 'hi', 0, '2020-10-12 19:31:16', NULL),
(436, 1, 12, 'LES MONTRES COMPLIQUÉES', '5016G-012', '2012', 'or blanc,36,8 mm,croco,mécanique à remontage manuel,homme', 559950.00, '5', 'hi', 0, '2020-10-12 19:42:52', NULL),
(437, 1, 12, 'LES MONTRES COMPLIQUÉES', '5016J-012', '2012', 'or jaune,36,8 mm,croco,mécanique à remontage manuel,homme', 555790.00, '5', 'hi', 0, '2020-10-12 19:59:57', NULL),
(438, 1, 12, 'LES MONTRES COMPLIQUÉES', '5016P-018', '2012', 'platine,36,8 mm,croco,mécanique à remontage manuel,homme', 576680.00, '5', 'hi', 0, '2020-10-12 19:51:48', NULL),
(439, 1, 12, 'LES MONTRES COMPLIQUÉES', '5016R-011', '2012', 'or rose,36,8 mm,croco,mécanique à remontage manuel,homme', 559950.00, '5', 'hi', 0, '2020-10-12 19:59:12', NULL),
(440, 1, 12, 'LES MONTRES COMPLIQUÉES', '5073P-001', '2012', 'platine serti diamants,42 mm,croco,mécanique à remontage manuel,homme', 566190.00, '5', 'hi', 0, '2020-10-12 20:48:52', NULL),
(441, 1, 12, 'LES MONTRES COMPLIQUÉES', '5074R-001', '2012', 'or rose,42 mm,croco,automatique,homme', 451290.00, '5', 'hi', 0, '2020-10-12 20:50:44', NULL),
(442, 1, 12, 'LES MONTRES COMPLIQUÉES', '5078P-010', '2012', 'platine,38 mm,croco,mécanique à remontage manuel,homme', 300830.00, '5', 'hi', 0, '2020-10-12 20:57:32', NULL),
(443, 1, 12, 'LES MONTRES COMPLIQUÉES', '5101G-001', '2012', 'or blanc,29,6x51,7 mm,croco,mécanique à remontage manuel,homme', 278430.00, '5', 'hi', 0, '2020-10-12 20:59:40', NULL),
(444, 1, 12, 'LES MONTRES COMPLIQUÉES', '5207P-001', '2012', 'platine,41 mm,croco,mécanique à remontage manuel,homme', 605910.00, '5', 'hi', 0, '2020-10-12 21:03:03', NULL),
(445, 1, 12, 'LES MONTRES COMPLIQUÉES', '5208P-001', '2012', 'platine,42 mm,croco,automatique,homme', 686930.00, '5', 'hi', 0, '2020-10-12 21:11:15', NULL),
(446, 1, 12, 'LES MONTRES COMPLIQUÉES', '5216R-001', '2012', 'or rose,39,5 mm,croco,mécanique à remontage manuel,homme', 578680.00, '5', 'hi', 0, '2020-10-12 21:13:25', NULL),
(447, 1, 12, 'LES MONTRES COMPLIQUÉES', '5235G-001', '2012', 'or blanc,40,5 mm,croco,automatique,homme', 40600.00, '5', 'hi', 0, '2020-10-12 21:20:57', NULL),
(448, 1, 12, 'LES MONTRES COMPLIQUÉES', '5270G-001', '2012', 'or blanc,41 mm,croco,mécanique à remontage manuel,homme', 133810.00, '5', 'hi', 0, '2020-10-12 21:23:36', NULL),
(449, 1, 12, 'LES MONTRES COMPLIQUÉES', '5496P-001', '2012', 'platine,39,5 mm,croco,automatique,homme', 87670.00, '5', 'hi', 0, '2020-10-12 21:33:18', NULL),
(450, 1, 12, 'L’ESSENCE DU CLASSICISME', '5120/1G-001', '2012', 'or blanc,35 mm,automatique,homme', 38300.00, '5', 'hi', 0, '2020-10-13 14:33:16', NULL),
(451, 1, 12, 'L’ESSENCE DU CLASSICISME', '5120/1J-001', '2012', 'or jaune,35 mm,automatique,homme', 34420.00, '5', 'hi', 0, '2020-10-13 14:44:51', NULL),
(452, 1, 12, 'L’ESSENCE DU CLASSICISME', '5120J-001', '2012', 'or jaune,35 mm,croco,homme', 19200.00, '5', 'hi', 0, '2020-10-13 14:50:04', NULL),
(453, 1, 12, 'L’ESSENCE DU CLASSICISME', '5120G-001', '2012', 'or blanc,35 mm,croco,automatique,homme', 20580.00, '5', 'hi', 0, '2020-10-13 14:54:38', NULL),
(454, 1, 12, 'L’ESSENCE DU CLASSICISME', '5296G-001', '2012', 'or blanc,38 mm,croco,automatique,homme', 21960.00, '5', 'hi', 0, '2020-10-13 14:59:33', NULL),
(455, 1, 12, 'L’ESSENCE DU CLASSICISME', '5296R-001', '2012', 'or rose,38 mm,croco,automatique,homme', 21960.00, '5', 'hi', 0, '2020-10-13 15:05:22', NULL),
(456, 1, 12, 'L’ESSENCE DU CLASSICISME', '6000G-010', '2012', 'or blanc', 22790.00, '5', 'hi', 0, '2020-10-13 15:08:08', NULL),
(457, 1, 12, 'L’ESSENCE DU CLASSICISME', '5127G-001', '2012', 'or blanc,37 mm,croco,automatique,homme', 21960.00, '5', 'hi', 0, '2020-10-13 15:18:15', NULL),
(458, 1, 12, 'L’ESSENCE DU CLASSICISME', '5127J-001', '2012', 'or jaune,37 mm,croco,automatique,homme', 20390.00, '5', 'hi', 0, '2020-10-13 15:26:16', NULL),
(459, 1, 12, 'L’ESSENCE DU CLASSICISME', '5127R-001', '2012', 'or rose,37 mm,croco,automatique,homme', 21960.00, '5', 'hi', 0, '2020-10-13 15:30:53', NULL),
(460, 1, 12, 'L’ESSENCE DU CLASSICISME', '5196J-001', '2012', 'or jaune,37 mm,croco,mécanique à remontage manuel,homme', 16330.00, '5', 'hi', 0, '2020-10-13 15:55:38', NULL),
(461, 1, 12, 'L’ESSENCE DU CLASSICISME', '5196G-001', '2012', 'or blanc,37 mm,croco,mécanique à remontage manuel,homme', 17900.00, '5', 'hi', 0, '2020-10-13 16:08:00', NULL),
(462, 1, 12, 'L’ESSENCE DU CLASSICISME', '5196R-001', '2012', 'or rose,37 mm,croco,mécanique à remontage manuel,homme', 17900.00, '5', 'hi', 0, '2020-10-13 16:27:15', NULL),
(463, 1, 12, 'L’ESSENCE DU CLASSICISME', '5196P-001', '2012', 'platine,37 mm,croco,mécanique à remontage manuel,homme', 30080.00, '5', 'hi', 0, '2020-10-13 16:33:17', NULL),
(464, 1, 12, 'L’ESSENCE DU CLASSICISME', '5118P-001', '2012', 'platine serti diamants,37 mm,croco,automatique,homme', 90160.00, '5', 'hi', 0, '2020-10-13 16:35:10', NULL),
(465, 1, 12, 'L’ESSENCE DU CLASSICISME', '5116G-001', '2012', 'or blanc serti diamants,36 mm,croco,mécanique à remontage manuel,homme', 20210.00, '5', 'hi', 0, '2020-10-13 16:37:27', NULL),
(466, 1, 12, 'L’ESSENCE DU CLASSICISME', '5119J-001', '2012', 'or jaune,36 mm,croco,mécanique à remontage manuel,homme', 16060.00, '5', 'hi', 0, '2020-10-13 16:40:32', NULL),
(467, 1, 12, 'L’ESSENCE DU CLASSICISME', '5119G-001', '2012', 'or blanc,36 mm,croco,mécanique à remontage manuel,homme', 17530.00, '5', 'hi', 0, '2020-10-13 16:44:39', NULL),
(468, 1, 12, 'L’ESSENCE DU CLASSICISME', '5153J-001', '2012', 'or jaune,or jaune,38 mm,croco,automatique,homme', 26300.00, '5', 'hi', 0, '2020-10-13 17:11:27', NULL),
(469, 1, 12, 'L’ESSENCE DU CLASSICISME', '5297G-001', '2012', 'or blanc serti diamants,38 mm,croco,automatique,homme', 31750.00, '5', 'hi', 0, '2020-10-13 17:14:29', NULL),
(470, 1, 12, 'L’ESSENCE DU CLASSICISME', '4897G-001', '2012', 'or blanc serti diamants,33 mm,satin,mécanique à remontage manuel,dame', 23350.00, '5', 'hi', 0, '2020-10-13 17:20:03', NULL),
(471, 1, 12, 'L’ESSENCE DU CLASSICISME', '4897R-001', '2012', 'or rose serti diamants,33 mm,satin,mécanique à remontage manuel,dame', 23350.00, '5', 'hi', 0, '2020-10-13 17:52:56', NULL),
(472, 1, 12, 'L’ESSENCE DU CLASSICISME', '7119J-012', '2012', 'or jaune,31 mm,croco,mécanique à remontage manuel,dame', 15690.00, '5', 'hi', 0, '2020-10-13 18:03:11', NULL),
(473, 1, 12, 'L’ESSENCE DU CLASSICISME', '7119G-010', '2012', 'or blanc,31 mm,croco,mécanique à remontage manuel,dame', 17160.00, '5', 'hi', 0, '2020-10-13 18:05:36', NULL),
(474, 1, 12, 'L’ESSENCE DU CLASSICISME', '7119/1J-010', '2012', 'or jaune,31 mm,mécanique à remontage manuel,dame', 29440.00, '5', 'hi', 0, '2020-10-13 18:13:28', NULL),
(475, 1, 12, 'L’ESSENCE DU CLASSICISME', '7119/1G-010', '2012', 'or blanc,31 mm,mécanique à remontage manuel,dame', 30920.00, '5', 'hi', 0, '2020-10-13 18:15:26', NULL),
(476, 1, 12, 'L’ESSENCE DU CLASSICISME', '7120G-001', '2012', 'or blanc serti diamants,31 mm,satin,mécanique à remontage manuel,dame', 24820.00, '5', 'hi', 0, '2020-10-13 18:21:32', NULL),
(477, 1, 12, 'L’ESSENCE DU CLASSICISME', '7120R-001', '2012', 'or rose serti diamants,31 mm,satin,mécanique à remontage manuel,dame', 24820.00, '5', 'hi', 0, '2020-10-13 18:54:49', NULL),
(478, 1, 12, 'L’ESSENCE DU CLASSICISME', '4897R-010', '2012', 'or rose serti diamants,33 mm,satin,mécanique à remontage manuel,dame', 23350.00, '5', 'hi', 0, '2020-10-13 19:00:00', NULL),
(479, 1, 12, 'L’ESSENCE DU CLASSICISME', '5153G-001', '2012', 'or blanc,38 mm,automatique,homme', 28150.00, '5', 'hi', 0, '2020-10-13 19:02:46', NULL),
(480, 1, 12, 'L’ESSENCE DU CLASSICISME', '5296G-010', '2012', 'or blanc,38 mm,croco,automatique,homme', 21960.00, '5', 'hi', 0, '2020-10-13 19:05:53', NULL),
(481, 1, 12, 'L’ESSENCE DU CLASSICISME', '5296R-010', '2012', 'or rose,38 mm,croco,automatique,homme', 21960.00, '5', 'hi', 0, '2020-10-13 19:08:05', NULL),
(482, 1, 12, 'L’ESSENCE DU CLASSICISME', '5298P-001', '2012', 'platine,38 mm,croco,automatique,homme', 69210.00, '5', 'hi', 0, '2020-10-13 19:11:08', NULL),
(483, 1, 12, 'L’ESSENCE DU CLASSICISME', '6000R-001', '2012', 'or rose,croco,automatique,homme', 22790.00, '5', 'hi', 0, '2020-10-13 19:13:48', NULL),
(484, 1, 12, 'L’ESSENCE DU CLASSICISME', '5098R-001', '2012', 'or rose,32x42 mm,croco,mécanique à remontage manuel,homme', 29350.00, '5', 'hi', 0, '2020-10-13 19:15:59', NULL),
(485, 1, 12, 'L’ESSENCE DU CLASSICISME', '5098P-001', '2012', 'platine,32x42 mm,croco,mécanique à remontage manuel,homme', 40050.00, '5', 'hi', 0, '2020-10-13 19:19:51', NULL),
(486, 1, 12, 'L’ESSENCE DU CLASSICISME', '5124G-001', '2012', 'or blanc,33,4x43 mm,croco,mécanique à remontage manuel,homme', 20670.00, '5', 'hi', 0, '2020-10-13 19:24:40', NULL),
(487, 1, 12, 'L’ESSENCE DU CLASSICISME', '5124J-001', '2012', 'or jaune,33,4x43 mm,croco,mécanique à remontage manuel,homme', 19290.00, '5', 'hi', 0, '2020-10-13 19:26:52', NULL),
(488, 1, 12, 'L’ESSENCE DU CLASSICISME', '4972G-001', '2012', 'or blanc serti diamants,27,4 x 39,7 mm,satin,quartz,dame', 29720.00, '5', 'hi', 0, '2020-10-13 19:37:31', NULL),
(489, 1, 12, 'L’ESSENCE DU CLASSICISME', '4972/1G-001', '2012', 'or blanc serti diamants,27,4 x 39,7 mm,or blanc,quartz,dame', 46420.00, '5', 'hi', 0, '2020-10-13 19:40:19', NULL),
(490, 1, 12, 'L’ESSENCE DU CLASSICISME', '4973G-001', '2012', 'or blanc serti diamants,27,4 x 39,7 mm,satin,quartz,dame', 38850.00, '5', 'hi', 0, '2020-10-13 19:42:22', NULL),
(491, 1, 12, 'L’ESSENCE DU CLASSICISME', '7041R-001', '2012', 'or rose,30×33,8 mm,croco,mécanique à remontage manuel,dame', 24920.00, '5', 'hi', 0, '2020-10-13 19:45:48', NULL),
(492, 1, 12, 'L’ESSENCE DU CLASSICISME', '3738/100J-012', '2012', 'or jaune,31,1x35,6 mm,croco,automatique,homme', 20030.00, '5', 'kkk', 0, '2020-10-13 20:06:48', NULL),
(493, 1, 12, 'L’ESSENCE DU CLASSICISME', '3738/100G-012', '2012', 'or blanc,31,1x35,6 mm,croco,automatique,homme', 21590.00, '5', 'hi', 0, '2020-10-13 20:11:55', NULL),
(494, 1, 12, 'L’ESSENCE DU CLASSICISME', '3738/100R-001', '2012', 'or rose,31,1x35,6 mm,croco,automatique,homme', 21590.00, '5', 'hi', 0, '2020-10-13 20:14:50', NULL),
(495, 1, 12, 'L’ESSENCE DU CLASSICISME', '3738/100P-001', '2012', 'platine,31,1x35,6 mm,croco,automatique,homme', 35070.00, '5', 'hi', 0, '2020-10-13 20:18:39', NULL),
(496, 1, 12, 'L’ESSENCE DU CLASSICISME', '5738P-001', '2012', 'platine,34,5×39,5 mm,croco,automatique,homme', 41070.00, '5', 'hi', 0, '2020-10-13 20:20:44', NULL),
(497, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '5711/1A-010', '2012', 'acier,40 mm,acier,automatique,homme', 20210.00, '5', 'hi', 0, '2020-10-13 20:32:37', NULL),
(498, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '5712G-001', '2012', 'or blanc,40 mm,croco,automatique,homme', 35440.00, '5', 'hi', 0, '2020-10-13 20:32:05', NULL),
(499, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '5712R-001', '2012', 'or rose,40 mm,croco,automatique,homme', 35440.00, '5', 'hi', 0, '2020-10-13 20:36:05', NULL),
(500, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '5712/1A-001', '2012', 'acier,40 mm,acier,automatique,homme', 27040.00, '5', 'hi', 0, '2020-10-13 20:39:32', NULL),
(501, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '5713/1G-010', '2012', 'or blanc serti diamants,40 mm,automatique,homme', 71150.00, '5', 'hi', 0, '2020-10-13 20:44:08', NULL),
(502, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '5719/1G-001', '2012', 'or blanc serti diamants,40 mm,or blanc,automatique,homme', 216410.00, '5', 'hi', 0, '2020-10-13 20:47:14', NULL),
(503, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '5722G-001', '2012', 'or blanc serti diamants,40 mm,croco,automatique,homme', 13160.00, '5', 'hi', 0, '2020-10-13 20:50:12', NULL),
(504, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '5724G-001', '2012', 'or blanc serti diamants,40 mm,croco,automatique,homme', 156700.00, '5', 'hi', 0, '2020-10-13 20:52:55', NULL),
(505, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '5724R-001', '2012', 'or rose serti diamants,40 mm,croco,automatique,homme', 156700.00, '5', 'hi', 0, '2020-10-13 20:57:52', NULL),
(506, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '5726A-001', '2012', 'acier,40,50 mm,croco,automatique,homme', 32110.00, '5', 'hi', 0, '2020-10-13 21:03:17', NULL),
(507, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '5980/1A-001', '2012', 'acier,40,5 mm,acier,automatique,homme', 38760.00, '5', 'hi', 0, '2020-10-13 21:06:03', NULL),
(508, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '7010/1G-001', '2012', '32 mm,or blanc serti diamants,or blanc,quartz,dame', 35070.00, '5', 'hi', 0, '2020-10-13 21:09:47', NULL),
(509, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '7010/1R-001', '2012', 'or rose serti diamants,32 mm,or rose,quartz,dame', 35070.00, '5', 'hi', 0, '2020-10-14 15:03:02', NULL),
(510, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '7010/1R-010', '2012', 'or rose serti diamants,32 mm,or rose,quartz,dame', 35070.00, '5', 'hi', 0, '2020-10-14 15:10:44', NULL),
(511, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '7011/1G-001', '2012', 'or gris,32 mm,or blanc,quartz,dame', 27780.00, '5', 'hi', 0, '2020-10-14 15:26:47', NULL),
(512, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '7011/1G-010', '2012', 'or blanc,32 mm,quartz,dame', 27780.00, '5', 'hi', 0, '2020-10-14 15:34:03', NULL),
(513, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '7010G-001', '2012', 'or blanc serti diamants,32 mm,croco,quartz,dame', 24820.00, '5', 'hi', 0, '2020-10-14 15:41:33', NULL),
(514, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '7010G-010', '2012', 'or blanc serti diamants,32 mm,croco,quartz,dame', 24820.00, '5', 'hi', 0, '2020-10-14 15:49:24', NULL),
(515, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '7010R-001', '2012', 'or rose serti diamants,32 mm,croco,quartz,dame', 24820.00, '5', 'hi', 0, '2020-10-14 15:56:33', NULL),
(516, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '7010R-010', '2012', 'or rose serti diamants,32 mm,croco,quartz,dame', 24820.00, '5', 'hi', 0, '2020-10-14 16:16:46', NULL),
(517, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '7021/1G-001', '2012', 'or blanc serti diamants,37 mm,or blanc,automatique,dame', 252860.00, '5', 'hi', 0, '2020-10-14 16:50:22', NULL),
(518, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '5712GR-001', '2012', 'or rose,40 mm,croco,automatique,homme', 36730.00, '5', 'hi', 0, '2020-10-14 16:52:13', NULL),
(519, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '5980/1A-014', '2012', 'acier,40,5 mm,automatique,homme', 38760.00, '5', 'hi', 0, '2020-10-14 17:00:25', NULL),
(520, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '5980R-001', '2012', 'or rose,40,5 mm,croco,automatique,homme', 48630.00, '5', 'hi', 0, '2020-10-14 17:02:14', NULL),
(521, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '7008/1A-001', '2012', 'acier serti diamants,33,6 mm,acier,automatique,dame', 27220.00, '5', 'hi', 0, '2020-10-14 17:03:54', NULL),
(522, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '7008/1A-010', '2012', 'acier serti diamants,33,6 mm,acier,automatique,dame', 27220.00, '5', 'hi', 0, '2020-10-14 17:06:17', NULL),
(523, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '7008/1A-011', '2012', 'acier serti diamants,33,6 mm,acier,automatique,dame', 25380.00, '5', 'hi', 0, '2020-10-14 17:09:43', NULL),
(524, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '5067A-001', '2012', 'acier serti diamants,35,2 mm,caoutchouc,quartz,dame', 13200.00, '5', 'hi', 0, '2020-10-14 17:11:53', NULL),
(525, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '5067A-011', '2012', 'acier serti diamants,35,2 mm,caoutchouc,quartz,dame', 13200.00, '5', 'hi', 0, '2020-10-14 17:13:44', NULL),
(526, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '5069G-001', '2012', 'or blanc serti diamants,35,2 mm,caoutchouc,automatique,dame', 66170.00, '5', 'hi', 0, '2020-10-14 17:20:54', NULL),
(527, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '5069G-011', '2012', 'or blanc serti diamants,35,2 mm,caoutchouc,automatique,dame', 66170.00, '5', 'hi', 0, '2020-10-14 18:02:21', NULL),
(528, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '5165A-001', '2012', 'acier,38 mm,caoutchouc,automatique,homme', 15410.00, '5', 'hi', 0, '2020-10-14 18:04:31', NULL),
(529, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '5167A-001', '2012', 'acier,40 mm,caoutchouc,automatique,homme', 15410.00, '5', 'hi', 0, '2020-10-14 18:15:34', NULL),
(530, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '5167R-001', '2012', 'or rose,40 mm,caoutchouc,automatique,homme', 28880.00, '5', 'hi', 0, '2020-10-14 18:18:06', NULL),
(531, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '5167/1A-001', '2012', 'acier,40 mm,automatique,homme', 17810.00, '5', 'hi', 0, '2020-10-14 20:28:17', NULL),
(532, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '5068R-001', '2012', 'or rose serti diamants,35,2 mm,caoutchouc,automatique,dame', 31750.00, '5', 'hi', 0, '2020-10-14 20:33:28', NULL),
(533, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '5087/1A-001', '2012', 'acier serti diamants,35,2 mm,acier,quartz,dame', 16330.00, '5', 'hi', 0, '2020-10-14 20:49:56', NULL),
(534, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '5087/1A-010', '2012', 'acier serti diamants,35,2 mm,acier,quartz,dame', 16330.00, '5', 'hi', 0, '2020-10-14 20:52:06', NULL),
(535, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '5069R-001', '2012', 'or rose serti diamants,35,2 mm,caoutchouc,automatique,dame', 66170.00, '5', 'hi', 0, '2020-10-14 20:56:06', NULL),
(536, 1, 12, 'L’ÉLÉGANCE SPORTIVE', '5164A-001', '2012', 'acier', 27.00, '5', 'hi', 0, '2020-10-14 21:00:50', NULL),
(537, 1, 12, 'LES MONTRES BIJOUX', '4910/11R-010', '2012', 'or rose,25x30 mm,quartz,dame', 34050.00, '5', 'hi', 0, '2020-10-14 22:22:03', NULL),
(538, 1, 12, 'LES MONTRES BIJOUX', '4908/11R-001', '2012', 'or rose serti diamants,22x26,3 mm,or rose,quartz,dame', 31930.00, '5', 'hi', 0, '2020-10-14 22:22:34', NULL),
(539, 1, 12, 'LES MONTRES BIJOUX', '4908/11R-010', '2012', 'or rose,2x26,3 mm,or rose,quartz,dame', 31930.00, '5', 'hi', 0, '2020-10-14 22:23:27', NULL),
(540, 1, 12, 'LES MONTRES BIJOUX', '4910/10A-001', '2012', 'acier serti diamants,25x30 mm,acier,quartz,dame', 9870.00, '5', 'hi', 0, '2020-10-14 22:23:53', NULL),
(541, 1, 12, 'LES MONTRES BIJOUX', '4908/200G-001', '2012', 'or blanc serti diamants,22 x 26,3 mm,or blanc,quartz,dame', 38110.00, '5', 'hi', 0, '2020-10-14 22:24:33', NULL),
(542, 1, 12, 'LES MONTRES BIJOUX', '4920G-001', '2012', 'or blanc,25x30 mm,tissus,quartz,dame', 18270.00, '5', 'hi', 0, '2020-10-14 22:25:33', NULL),
(543, 1, 12, 'LES MONTRES BIJOUX', '4920G-010', '2012', 'or blanc,25x30 mm,tissus,quartz,dame', 18270.00, '5', 'hi', 0, '2020-10-14 22:25:51', NULL),
(544, 1, 12, 'LES MONTRES BIJOUX', '4920R-001', '2012', 'or rose,25x30 mm,tissus,quartz,dame', 18270.00, '5', 'hi', 0, '2020-10-14 22:27:51', NULL),
(545, 1, 12, 'LES MONTRES BIJOUX', '4920R-010', '2012', 'or rose,25x30 mm,tissus,quartz,dame', 18270.00, '5', 'hi', 0, '2020-10-14 22:28:04', NULL),
(546, 1, 12, 'LES MONTRES BIJOUX', '4908/200G-011', '2012', 'or blanc serti diamants,22x26,3 mm,or blanc,quartz,dame', 38110.00, '5', 'hi', 0, '2020-10-14 22:30:37', NULL),
(547, 1, 12, 'LES MONTRES BIJOUX', '4910/10A-010', '2012', 'acier serti diamants,25x30 mm,acier,quartz,dame', 9870.00, '5', 'hi', 0, '2020-10-14 22:33:33', NULL),
(548, 1, 12, 'LES MONTRES BIJOUX', '4910/10A-011', '2012', 'acier serti diamants,25x30 mm,acier,quartz,dame', 9870.00, '5', 'hi', 0, '2020-10-14 22:35:16', NULL),
(549, 1, 12, 'LES MONTRES BIJOUX', '4910/10A-012', '2012', 'acier serti diamants,25x30 mm,acier,quartz,dame', 9870.00, '5', 'hi', 0, '2020-10-14 22:37:21', NULL),
(550, 1, 12, 'LES MONTRES BIJOUX', '4910/11R-011', '2012', 'or rose,25x30 mm,or rose,quartz,dame', 34050.00, '5', 'hi', 0, '2020-10-14 22:39:04', NULL),
(551, 1, 12, 'LES MONTRES BIJOUX', '4908/11R-011', '2012', 'or rose serti diamants,22x26,3 mm,or rose,quartz,dame', 31930.00, '5', 'hi', 0, '2020-10-14 22:40:51', NULL),
(552, 1, 12, 'LES MONTRES DE POCHE', '972/1J-010', '2012', 'or jaune,or jaune,44 mm,mécanique à remontage manuel,homme', 33.00, '5', 'hi', 0, '2020-10-14 22:48:54', NULL),
(553, 1, 12, 'LES MONTRES DE POCHE', '973J-010', '2012', 'or jaune,44 mm,mécanique à remontage manuel,homme', 31750.00, '5', 'hi', 0, '2020-10-14 22:48:20', NULL),
(554, 1, 12, 'LES MONTRES DE POCHE', '980J-011', '2012', 'or jaune,48 mm,mécanique à remontage manuel,homme', 39040.00, '5', 'hi', 0, '2020-10-14 22:51:33', NULL),
(555, 1, 12, 'LES MONTRES DE POCHE', '980G-010', '2012', 'or blanc,48 mm,mécanique à remontage manuel,homme', 41900.00, '5', 'hi', 0, '2020-10-14 23:08:57', NULL),
(556, 1, 12, 'LES MONTRES DE POCHE', '980R-001', '2012', 'or rose,48 mm,mécanique à remontage manuel,homme', 41900.00, '5', 'hi', 0, '2020-10-14 23:13:26', NULL),
(557, 1, 12, 'LES MONTRES DE POCHE', '983J-001', '2012', 'or jaune,48 mm,mécanique à remontage manuel,homme', 41250.00, '5', 'hi', 0, '2020-10-14 23:15:38', NULL),
(558, 1, 12, 'LES MONTRES DE POCHE', '980G-001', '2012', 'or blanc,48 mm,mécanique à remontage manuel,homme', 41900.00, '5', 'hi', 0, '2020-10-14 23:18:32', NULL),
(559, 1, 12, 'LES MONTRES DE POCHE', '980J-010', '2012', 'or jaune,48 mm,mécanique à remontage manuel,homme', 39040.00, '5', 'hi', 0, '2020-10-14 23:20:28', NULL),
(560, 1, 14, 'VINTAGE COLLECTION, EDITION JUBILÉ', 'IW323101', '2013', 'acier,44 mm,caoutchouc,automatique,homme', 5650.00, '5', 'hi', 0, '2020-10-15 16:34:41', NULL),
(561, 1, 14, 'VINTAGE COLLECTION, EDITION JUBILÉ', 'IW323103', '2013', 'or rose,44 mm,croco,automatique,homme', 12600.00, '5', 'hi', 0, '2020-10-15 16:37:04', NULL),
(562, 1, 14, 'VINTAGE COLLECTION, EDITION JUBILÉ', 'IW323104', '2013', 'or gris,44 mm,croco,automatique,homme', 14400.00, '5', 'hi', 0, '2020-10-15 16:40:21', NULL),
(563, 1, 14, 'VINTAGE COLLECTION, EDITION JUBILÉ', 'IW323105', '2013', 'platine,44 mm,croco,automatique,homme', 30000.00, '5', 'hi', 0, '2020-10-15 16:50:55', NULL),
(564, 1, 14, 'VINTAGE COLLECTION, EDITION JUBILÉ', 'IW323105', '2013', 'platine,44 mm,croco,automatique,homme', 30000.00, '5', 'hi', 0, '2020-10-15 17:31:24', NULL),
(565, 1, 14, 'VINTAGE COLLECTION, EDITION JUBILÉ', 'IW323301', '2013', 'acier,42,5 mm,croco,automatique,homme', 5650.00, '5', 'hi', 0, '2020-10-15 17:37:55', NULL),
(566, 1, 14, 'VINTAGE COLLECTION, EDITION JUBILÉ', 'IW323303', '2013', 'or rose,42,5 mm,croco,automatique,homme', 12600.00, '5', 'hi', 0, '2020-10-15 17:39:31', NULL),
(567, 1, 14, 'VINTAGE COLLECTION, EDITION JUBILÉ', 'IW323304', '2013', 'or gris,42,5 mm,croco,automatique,homme', 14400.00, '5', 'hi', 0, '2020-10-15 17:41:31', NULL),
(568, 1, 14, 'VINTAGE COLLECTION, EDITION JUBILÉ', 'IW323305', '2013', 'platine,42,5 mm,croco,automatique,homme', 30000.00, '5', 'hi', 0, '2020-10-15 17:43:47', NULL),
(569, 1, 14, 'VINTAGE COLLECTION, EDITION JUBILÉ', 'IW544501', '2013', 'acier,44 mm,croco,mécanique à remontage manuel,homme', 8250.00, '5', 'hi', 0, '2020-10-15 17:47:07', NULL),
(570, 1, 14, 'VINTAGE COLLECTION, EDITION JUBILÉ', 'IW544503', '2013', 'or rose,44 mm,croco,mécanique à remontage manuel,homme', 14800.00, '5', 'hi', 0, '2020-10-15 17:49:47', NULL),
(571, 1, 14, 'VINTAGE COLLECTION, EDITION JUBILÉ', 'IW544504', '2013', 'or gris,44 mm,croco,mécanique à remontage manuel,homme', 16700.00, '5', 'hi', 0, '2020-10-15 17:51:25', NULL),
(572, 1, 14, 'VINTAGE COLLECTION, EDITION JUBILÉ', 'IW544505', '2013', 'platine,44 mm,croco,mécanique à remontage manuel,homme', 32100.00, '5', 'hi', 0, '2020-10-15 17:52:57', NULL),
(573, 1, 14, 'VINTAGE COLLECTION, EDITION JUBILÉ', 'IW546101', '2013', 'acier,41 mm,croco,automatique,homme', 5650.00, '5', 'hi', 0, '2020-10-15 17:54:43', NULL),
(574, 1, 14, 'VINTAGE COLLECTION, EDITION JUBILÉ', 'IW546103', '2013', 'or rose,41 mm,croco,automatique,homme', 12600.00, '5', 'hi', 0, '2020-10-15 17:56:41', NULL),
(575, 1, 14, 'VINTAGE COLLECTION, EDITION JUBILÉ', 'IW546104', '2013', 'or gris,41 mm,croco,automatique,homme', 14400.00, '5', 'hi', 0, '2020-10-15 18:02:57', NULL),
(576, 1, 14, 'VINTAGE COLLECTION, EDITION JUBILÉ', 'IW325401', '2013', 'acier,44 mm,croco,mécanique à remontage manuel,homme', 7500.00, '5', 'hi', 0, '2020-10-15 18:07:00', NULL),
(577, 1, 14, 'VINTAGE COLLECTION, EDITION JUBILÉ', 'IW325403', '2013', 'or rose,44 mm,croco,mécanique à remontage manuel,homme', 13700.00, '5', 'hi', 0, '2020-10-15 18:08:41', NULL),
(578, 1, 14, 'VINTAGE COLLECTION, EDITION JUBILÉ', 'IW325404', '2013', 'or gris,44 mm,croco,mécanique à remontage manuel,homme', 15600.00, '5', 'hi', 0, '2020-10-15 18:10:19', NULL),
(579, 1, 14, 'VINTAGE COLLECTION, EDITION JUBILÉ', 'IW325405', '2013', 'platine,44 mm,cuir,mécanique à remontage manuel,homme', 32100.00, '5', 'hi', 0, '2020-10-15 18:12:14', NULL),
(580, 1, 14, 'VINTAGE COLLECTION, EDITION JUBILÉ', 'IW544801', '2013', 'acier,46 mm,croco,mécanique à remontage manuel,homme', 9000.00, '5', 'hi', 0, '2020-10-15 18:16:29', NULL),
(581, 1, 14, 'VINTAGE COLLECTION, EDITION JUBILÉ', 'IW544803', '2013', 'or rose,46 mm,croco,mécanique à remontage manuel,homme', 16300.00, '5', 'hi', 0, '2020-10-15 18:20:42', NULL),
(582, 1, 14, 'VINTAGE COLLECTION, EDITION JUBILÉ', 'IW544803', '2013', 'or rose,46 mm,croco,mécanique à remontage manuel,homme', 16300.00, '5', 'hi', 0, '2020-10-15 18:24:47', NULL),
(583, 1, 14, 'VINTAGE COLLECTION, EDITION JUBILÉ', 'IW544804', '2013', 'or gris,46 mm,croco,mécanique à remontage manuel,homme', 18200.00, '5', 'hi', 0, '2020-10-15 18:33:13', NULL),
(584, 1, 14, 'VINTAGE COLLECTION, EDITION JUBILÉ', 'IW544805', '2013', 'platine,46 mm,croco,mécanique à remontage manuel,homme', 34200.00, '5', 'hi', 0, '2020-10-15 19:01:30', NULL),
(585, 1, 14, 'PORTUGAISE', 'IW504401', '2013', 'platine,44,2 mm,croco,automatique,homme', 115000.00, '5', 'hi', 0, '2020-10-15 19:23:07', NULL),
(586, 1, 14, 'PORTUGAISE', 'IW504402', '2013', 'or rouge,44,2 mm,croco,automatique,homme', 93500.00, '5', 'hi', 0, '2020-10-15 19:22:41', NULL),
(587, 1, 14, 'PORTUGAISE', 'IW544906', '2013', 'platine,44 mm,croco,mécanique à remontage manuel,homme', 97500.00, '5', 'hi', 0, '2020-10-15 19:22:14', NULL),
(588, 1, 14, 'PORTUGAISE', 'IW544907', '2013', 'or rouge,44 mm,croco,croco,homme', 77800.00, '5', 'hi', 0, '2020-10-15 19:21:58', NULL),
(589, 1, 14, 'PORTUGAISE', 'IW503203', '2013', 'or gris,44,2 mm,croco,automatique,homme', 37500.00, '5', 'hi', 0, '2020-10-15 19:21:30', NULL),
(590, 1, 14, 'PORTUGAISE', 'IW503202', '2013', 'or rouge,44,2 mm,croco,automatique,homme', 34500.00, '5', 'hi', 0, '2020-10-15 19:25:35', NULL),
(591, 1, 14, 'PORTUGAISE', 'IW502305', '2013', 'platine,44,2 mm,croco,automatique,homme', 45200.00, '5', 'hi', 0, '2020-10-15 19:29:33', NULL),
(592, 1, 14, 'PORTUGAISE', 'IW502307', '2013', 'or gris,44,2 mm,croco,automatique,homme', 36700.00, '5', 'hi', 0, '2020-10-15 19:31:21', NULL),
(593, 1, 14, 'PORTUGAISE', 'IW502306', '2013', 'or rouge,44,2 mm,croco,automatique,homme', 33700.00, '5', 'hi', 0, '2020-10-15 19:44:40', NULL),
(594, 1, 14, 'PORTUGAISE', 'IW500106', '2013', 'or blanc,42,3 mm,croco,automatique,homme', 22600.00, '5', 'hi', 0, '2020-10-15 19:46:03', NULL),
(595, 1, 14, 'PORTUGAISE', 'IW500107', '2013', 'acier,42,30 mm,croco,automatique,homme', 11800.00, '5', 'hi', 0, '2020-10-15 19:57:11', NULL),
(596, 1, 14, 'PORTUGAISE', 'IW500109', '2013', 'acier,42,3 mm,croco,automatique,homme', 11800.00, '5', 'hi', 0, '2020-10-15 19:58:59', NULL),
(597, 1, 14, 'PORTUGAISE', 'IW500113', '2013', 'or rose,42,3 mm,croco,automatique,homme', 21000.00, '5', 'hi', 0, '2020-10-15 20:00:39', NULL),
(598, 1, 14, 'PORTUGAISE', 'IW500114', '2013', '42,3 mm,acier,croco,automatique,homme', 11800.00, '5', 'hi', 0, '2020-10-15 20:02:40', NULL),
(599, 1, 14, 'PORTUGAISE', 'IW371445', '2013', 'acier,40,9 mm,croco,automatique,homme', 7300.00, '5', 'hi', 0, '2020-10-15 20:04:37', NULL),
(600, 1, 14, 'PORTUGAISE', 'IW371446', '2013', 'acier,40,9 mm,croco,automatique,homme', 7300.00, '5', 'hi', 0, '2020-10-15 20:06:29', NULL),
(601, 1, 14, 'PORTUGAISE', 'IW371447', '2013', 'acier,40,9 mm,croco,automatique,homme', 7300.00, '5', 'hi', 0, '2020-10-15 20:08:24', NULL),
(602, 1, 14, 'PORTUGAISE', 'IW371480', '2013', 'or rouge,40,9 mm,croco,automatique,homme', 15700.00, '5', 'hi', 0, '2020-10-15 20:20:28', NULL),
(603, 1, 14, 'PORTUGAISE', 'IW371482', '2013', 'or rouge,40,9 mm,croco,automatique,homme', 15700.00, '5', 'hi', 0, '2020-10-15 20:41:59', NULL),
(604, 1, 14, 'PORTUGAISE', 'IW377402', '2013', 'or rose,45 mm,croco,automatique,homme', 184000.00, '5', 'hi', 0, '2020-10-15 20:43:34', NULL),
(605, 1, 14, 'PORTUGAISE', 'IW377401', '2013', 'platine,45 mm,croco,automatique,homme', 210000.00, '5', 'hi', 0, '2020-10-15 20:45:17', NULL),
(606, 1, 14, 'PORTUGAISE', 'IW390209', '2013', 'or rouge,45,4 mm,caoutchouc,automatique,homme', 23500.00, '5', 'hi', 0, '2020-10-15 20:47:46', NULL),
(607, 1, 14, 'PORTUGAISE', 'IW390210', '2013', 'acier,45,4 mm,caoutchouc,automatique,homme', 12000.00, '5', 'hi', 0, '2020-10-15 20:49:25', NULL),
(608, 1, 14, 'PORTUGAISE', 'IW390211', '2013', 'acier,45,4 mm,caoutchouc,automatique,homme', 12000.00, '5', 'hi', 0, '2020-10-15 20:50:49', NULL),
(609, 1, 14, 'PORTUGAISE', 'IW390212', '2013', 'titane,45,4 mm,caoutchouc,automatique,homme', 12500.00, '5', 'hi', 0, '2020-10-15 20:52:10', NULL),
(610, 1, 14, 'PORTUGAISE', 'IW544705', '2013', 'or rouge,43,1 mm,croco,mécanique à remontage manuel,homme', 48600.00, '5', 'hi', 0, '2020-10-15 20:53:57', NULL),
(611, 1, 14, 'PORTUGAISE', 'IW545407', '2013', 'acier,44 mm,croco,mécanique à remontage manuel,homme', 7100.00, '5', 'hi', 0, '2020-10-15 21:05:17', NULL),
(612, 1, 14, 'PORTUGAISE', 'IW545408', '2013', 'acier,44 mm,croco,mécanique à remontage manuel,homme', 7100.00, '5', 'hi', 0, '2020-10-15 21:08:24', NULL),
(613, 1, 14, 'PORTUGAISE', 'IW545406', '2013', 'or rose,44 mm,croco,mécanique à remontage manuel,homme', 14700.00, '5', 'hi', 0, '2020-10-15 21:10:16', NULL),
(614, 1, 14, 'DA VINCI', 'IW376601', '2013', 'céramique de titane,44x52,8 mm,cuir,automatique,homme', 13700.00, '5', 'hi', 0, '2020-10-15 21:14:02', NULL),
(615, 1, 14, 'DA VINCI', 'IW376601', '2013', 'céramique de titane,44x52,8 mm,cuir,automatique,homme', 13700.00, '5', 'hi', 0, '2020-10-15 21:17:38', NULL),
(616, 1, 14, 'DA VINCI', 'IW376207', '2013', 'acier,43,1x51 mm,croco,automatique,homme', 19900.00, '5', 'hi', 0, '2020-10-15 21:50:38', NULL),
(617, 1, 14, 'DA VINCI', 'IW376206', '2013', 'or rouge,43,1x51 mm,croco,automatique,homme', 30400.00, '5', 'hi', 0, '2020-10-15 21:52:59', NULL),
(618, 1, 14, 'DA VINCI', 'IW376404', '2013', 'acier,43,1x51 mm,croco,automatique,homme', 11700.00, '5', 'hi', 0, '2020-10-16 15:37:32', NULL),
(619, 1, 14, 'DA VINCI', 'IW376417', '2013', 'or gris,43,1x51 mm,croco,automatique,homme', 22300.00, '5', 'hi', 0, '2020-10-15 21:56:24', NULL),
(620, 1, 14, 'DA VINCI', 'IW376420', '2013', 'or rose,43,1x51 mm,croco,automatique,homme', 19700.00, '5', 'hi', 0, '2020-10-15 22:26:37', NULL),
(621, 1, 14, 'DA VINCI', 'IW376421', '2013', 'acier,43,1x51 mm,croco,automatique,homme', 11000.00, '5', 'hi', 0, '2020-10-15 22:28:29', NULL),
(622, 1, 14, 'DA VINCI', 'IW376416', '2013', 'platine,43,1x51 mm,croco,automatique,homme', 40300.00, '5', 'hi', 0, '2020-10-16 15:06:08', NULL),
(623, 1, 14, 'DA VINCI', 'IW376422', '2013', 'acier,43,1x51 mm,automatique,homme', 13300.00, '5', 'hi', 0, '2020-10-16 15:35:22', NULL);
INSERT INTO `product` (`id`, `upload_by`, `brand_id`, `model_name`, `id_no`, `year`, `features`, `price`, `percentage`, `description`, `status`, `created_at`, `updated_at`) VALUES
(624, 1, 14, 'DA VINCI', 'IW452306', '2013', 'acier,35,6x42,5 mm,croco,automatique,medium', 5400.00, '5', 'hi', 0, '2020-10-16 15:46:31', NULL),
(625, 1, 14, 'DA VINCI', 'IW452311', '2013', 'or rose,35,6x42,5 mm,croco,automatique,medium', 13300.00, '5', 'hi', 0, '2020-10-16 15:48:15', NULL),
(626, 1, 14, 'DA VINCI', 'IW452314', '2013', 'acier,35,6x42,5 mm,croco,automatique,medium', 5400.00, '5', 'hi', 0, '2020-10-16 15:52:05', NULL),
(627, 1, 14, 'DA VINCI', 'IW452312', '2013', 'acier,35,6x42,5 mm,croco,automatique,medium', 5400.00, '5', 'hi', 0, '2020-10-16 15:59:23', NULL),
(628, 1, 14, 'DA VINCI', 'IW376106', '2013', 'platine,44x52,8 mm,croco,automatique,homme', 58500.00, '5', 'hi', 0, '2020-10-16 16:01:32', NULL),
(629, 1, 14, 'DA VINCI', 'IW376107', '2013', 'or rose,44x52,8 mm,croco,automatique,homme', 37100.00, '5', 'hi', 0, '2020-10-16 16:11:55', NULL),
(630, 1, 14, 'INGENIEUR', 'IW500502', '2013', 'platine,45,5 mm,croco,automatique,homme', 34600.00, '5', 'hi', 0, '2020-10-16 16:15:30', NULL),
(631, 1, 14, 'INGENIEUR', 'IW500503', '2013', 'or rose,45,5 mm,croco,automatique,homme', 20600.00, '5', 'hi', 0, '2020-10-16 16:18:38', NULL),
(632, 1, 14, 'INGENIEUR', 'IW500501', '2013', 'acier,45,5 mm,croco,automatique,homme', 11000.00, '5', 'hi', 0, '2020-10-16 16:22:43', NULL),
(633, 1, 14, 'INGENIEUR', 'IW500505', '2013', 'acier,45,5 mm,acier,automatique,homme', 11900.00, '5', 'hi', 0, '2020-10-16 16:25:45', NULL),
(634, 1, 14, 'INGENIEUR', 'IW500508', '2013', 'acier,45,5 mm,croco,automatique,homme', 11100.00, '5', 'hi', 0, '2020-10-16 16:27:54', NULL),
(635, 1, 14, 'INGENIEUR', 'IW323310', '2013', 'acier,44 mm,croco,automatique,homme', 6200.00, '5', 'hi', 0, '2020-10-16 16:30:37', NULL),
(636, 1, 14, 'INGENIEUR', 'IW323601', '2013', 'acier,46 mm,caoutchouc,automatique,homme', 6500.00, '5', 'hi', 0, '2020-10-16 16:33:26', NULL),
(637, 1, 14, 'INGENIEUR', 'IW323604', '2013', 'acier,46 mm,automatique,homme', 7450.00, '5', 'hi', 0, '2020-10-16 16:36:49', NULL),
(638, 1, 14, 'INGENIEUR', 'IW323608', '2013', 'acier,46 mm,caoutchouc,automatique,homme', 7000.00, '5', 'hi', 0, '2020-10-16 16:38:38', NULL),
(639, 1, 14, 'INGENIEUR', 'IW378402', '2013', 'or rose,45,5 mm,croco,automatique,homme', 22000.00, '5', 'hi', 0, '2020-10-16 16:41:54', NULL),
(640, 1, 14, 'INGENIEUR', 'IW378403', '2013', 'platine,45,5 mm,croco,automatique,homme', 37800.00, '5', 'hi', 0, '2020-10-16 16:45:17', NULL),
(641, 1, 14, 'INGENIEUR', 'IW378405', '2013', 'acier,45,5 mm,croco,automatique,homme', 12200.00, '5', 'hi', 0, '2020-10-16 16:53:19', NULL),
(642, 1, 14, 'INGENIEUR', 'IW378406', '2013', 'acier,45,5 mm,croco,automatique,homme', 12200.00, '5', 'hi', 0, '2020-10-16 16:55:22', NULL),
(643, 1, 14, 'INGENIEUR', 'IW376501', '2013', 'titane,45 mm', 11000.00, '5', 'hi', 0, '2020-10-16 17:14:23', NULL),
(644, 1, 14, 'MONTRES D’AVIATEUR', 'IW502617', '2013', 'or rouge,46 mm,cuir,automatique,homme', 39600.00, '5', 'hi', 0, '2020-10-16 17:18:49', NULL),
(645, 1, 14, 'MONTRES D’AVIATEUR', 'IW500901', '2013', 'acier,42 mm,croco,automatique,homme', 12900.00, '5', 'hi', 0, '2020-10-16 17:20:39', NULL),
(646, 1, 14, 'MONTRES D’AVIATEUR', 'IW377701', '2013', 'acier,43 mm,croco,automatique,homme', 5300.00, '5', 'hi', 0, '2020-10-16 17:23:53', NULL),
(647, 1, 14, 'MONTRES D’AVIATEUR', 'IW377704', '2013', '', 6400.00, '5', 'hi', 0, '2020-10-16 17:24:57', NULL),
(648, 1, 14, 'MONTRES D’AVIATEUR', 'IW377801', '2013', '', 11100.00, '5', 'hi', 0, '2020-10-16 17:26:35', NULL),
(649, 1, 14, 'MONTRES D’AVIATEUR', 'IW326501', '2013', '', 4300.00, '5', 'hi', 0, '2020-10-16 17:27:56', NULL),
(650, 1, 14, 'MONTRES D’AVIATEUR', 'IW326504', '2013', '', 5400.00, '5', 'hi', 0, '2020-10-16 17:29:05', NULL),
(651, 1, 14, 'MONTRES D’AVIATEUR', 'IW388001', '2013', '', 11300.00, '5', 'hi', 0, '2020-10-16 17:30:52', NULL),
(652, 1, 14, 'MONTRES D’AVIATEUR', 'IW388002', '2013', '', 11300.00, '5', 'hi', 0, '2020-10-16 17:40:26', NULL),
(653, 1, 14, 'MONTRES D’AVIATEUR', 'IW326201', '2013', '', 8550.00, '5', 'hi', 0, '2020-10-16 18:08:16', NULL),
(654, 1, 14, 'MONTRES D’AVIATEUR', 'IW326201', '2013', '', 16100.00, '5', 'hi', 0, '2020-10-16 18:12:23', NULL),
(655, 1, 14, 'MONTRES D’AVIATEUR', 'IW501902', '2013', '', 16100.00, '5', 'hi', 0, '2020-10-16 18:14:01', NULL),
(656, 1, 14, 'MONTRES D’AVIATEUR', 'IW502902', '2013', '', 34200.00, '5', 'hi', 0, '2020-10-16 18:15:29', NULL),
(657, 1, 14, 'MONTRES D’AVIATEUR', 'IW500906', '2013', '', 14900.00, '5', 'hi', 0, '2020-10-16 18:17:38', NULL),
(658, 1, 14, 'MONTRES D’AVIATEUR', 'IW325519', '2013', '', 4300.00, '5', 'hi', 0, '2020-10-16 18:18:55', NULL),
(659, 1, 14, 'MONTRES D’AVIATEUR', 'IW387805', '2013', '', 29700.00, '5', 'hi', 0, '2020-10-16 18:20:14', NULL),
(660, 1, 14, 'MONTRES D’AVIATEUR', 'IW387806', '2013', '', 12.00, '5', 'hi', 0, '2020-10-16 18:21:55', NULL),
(661, 1, 14, 'MONTRES D’AVIATEUR', 'IW379103', '2013', '', 49500.00, '5', 'hi', 0, '2020-10-16 18:23:34', NULL),
(662, 1, 14, 'MONTRES D’AVIATEUR', 'IW387803', '2013', '', 24300.00, '5', 'hi', 0, '2020-10-16 18:25:56', NULL),
(663, 1, 14, 'MONTRES D’AVIATEUR', 'IW387802', '2013', '', 9700.00, '5', 'hi', 0, '2020-10-16 18:27:34', NULL),
(664, 1, 14, 'MONTRES D’AVIATEUR', 'IW387804', '2013', '', 10500.00, '5', 'hi', 0, '2020-10-16 18:28:47', NULL),
(665, 1, 14, 'AQUATIMER', 'IW376708', '2013', '', 6100.00, '5', 'hhhhi', 0, '2020-10-16 18:46:22', NULL),
(666, 1, 14, 'AQUATIMER', 'IW376709', '2013', '', 5.00, '5', 'hi', 0, '2020-10-16 18:47:37', NULL),
(667, 1, 14, 'AQUATIMER', 'IW376710', '2013', '', 6100.00, '5', 'hi', 0, '2020-10-16 18:48:46', NULL),
(668, 1, 14, 'AQUATIMER', 'IW376711', '2013', '', 5100.00, '5', 'hi', 0, '2020-10-16 18:51:11', NULL),
(669, 1, 14, 'AQUATIMER', 'IW376706', '2013', '', 5600.00, '5', 'hi', 0, '2020-10-16 18:52:08', NULL),
(670, 1, 14, 'AQUATIMER', 'IW376705', '2013', '', 6250.00, '5', 'hi', 0, '2020-10-16 18:53:23', NULL),
(671, 1, 14, 'PORTOFINO', 'IW391001', '2013', 'acier,42 mm,croco,automatique,homme', 5200.00, '5', 'hi', 0, '2020-10-19 15:27:18', NULL),
(672, 1, 14, 'PORTOFINO', 'IW391002', '2013', 'acier,42 mm,croco,automatique,homme', 5200.00, '5', 'hi', 0, '2020-10-19 15:29:07', NULL),
(673, 1, 14, 'PORTOFINO', 'IW391005', '2013', 'acier,42 mm,automatique,homme', 6050.00, '5', 'hi', 0, '2020-10-19 15:32:06', NULL),
(674, 1, 14, 'PORTOFINO', 'IW391006', '2013', 'acier,42 mm,automatique,homme', 6050.00, '5', 'hi', 0, '2020-10-19 15:43:40', NULL),
(675, 1, 14, 'PORTOFINO', 'IW391019', '2013', 'acier,40 mm,croco,automatique,homme', 5600.00, '5', 'hi', 0, '2020-10-19 15:46:02', NULL),
(676, 1, 14, 'PORTOFINO', 'IW356501', '2013', 'acier,40 mm,croco,automatique,medium', 4120.00, '5', 'hi', 0, '2020-10-19 15:47:48', NULL),
(677, 1, 14, 'PORTOFINO', 'IW356502', '2013', 'acier,40 mm,croco,automatique,medium', 4120.00, '5', 'hi', 0, '2020-10-19 15:50:57', NULL),
(678, 1, 14, 'PORTOFINO', 'IW356504', '2013', 'or rouge,40 mm,croco,automatique,medium', 10700.00, '5', 'hi', 0, '2020-10-19 15:56:37', NULL),
(679, 1, 14, 'PORTOFINO', 'IW356505', '2013', 'acier', 4970.00, '5', 'hi', 0, '2020-10-19 15:58:38', NULL),
(680, 1, 14, 'PORTOFINO', 'IW356506', '2013', 'acier,40 mm,automatique,medium', 4970.00, '5', 'hi', 0, '2020-10-19 16:03:44', NULL),
(681, 1, 14, 'PORTOFINO', 'IW510102', '2013', 'acier,45 mm,croco,mécanique à remontage manuel,homme', 9550.00, '5', 'hi', 0, '2020-10-19 16:08:56', NULL),
(682, 1, 14, 'PORTOFINO', 'IW510103', '2013', 'acier,45 mm,croco,mécanique à remontage manuel,homme', 9550.00, '5', 'hi', 0, '2020-10-19 16:10:47', NULL),
(683, 1, 14, 'PORTOFINO', 'IW510104', '2013', 'or rouge,45 mm,croco,mécanique à remontage manuel,homme', 18100.00, '5', 'hi', 0, '2020-10-19 16:33:02', NULL),
(684, 1, 14, 'PORTOFINO', 'IW510107', '2013', 'or rouge', 18100.00, '5', 'hi', 0, '2020-10-19 16:44:21', NULL),
(685, 1, 15, 'RM 002', 'RG 501.04.91', '2014', 'or rouge,45x38,30x11,95 mm,cuir,tourbillon,homme', 299000.00, '5', 'HI', 0, '2020-10-19 17:07:12', NULL),
(686, 1, 15, 'RM 002', 'WG 501.06.91', '2014', 'or blanc,45x38,30x11,95 mm,cuir,tourbillon,homme', 305000.00, '5', 'hi', 0, '2020-10-19 17:09:07', NULL),
(687, 1, 15, 'RM 002', 'Ti 501.45.91', '2014', 'titane,45x38,30x11,95 mm,cuir,tourbillon,homme', 293500.00, '5', 'hi', 0, '2020-10-19 17:11:19', NULL),
(688, 1, 15, 'RM 002', 'Pt All Grey 501.48A.91', '2014', 'platine,45x38,30x11,95 mm,cuir,tourbillon,homme', 347000.00, '5', 'hi', 0, '2020-10-19 17:21:31', NULL),
(689, 1, 15, 'RM 003', 'RG 502.04.91', '2014', 'or rouge,48x39,30x13,mm,cuir,tourbillon,homme', 344000.00, '5', 'hi', 0, '2020-10-19 17:20:57', NULL),
(690, 1, 15, 'RM 003', 'WG 502.06.91', '2014', 'or blanc,48x39,70x13,65 mm,cuir,tourbillon,homme', 351000.00, '5', 'hi', 0, '2020-10-19 17:20:15', NULL),
(691, 1, 15, 'RM 003', 'Ti 502.45.91', '2014', 'titane,48x39,70x13,65 mm,cuir,tourbillon,homme', 334000.00, '5', 'hi', 0, '2020-10-19 17:24:28', NULL),
(692, 1, 15, 'RM 003', 'Ti DLC Boutique Edition 502.45B.91B', '2014', 'titane,48x39,70x13,65 mm,cuir,tourbillon,homme', 336000.00, '5', 'hi', 0, '2020-10-19 17:27:43', NULL),
(693, 1, 15, 'RM 003', 'Pt All Grey 502.48C.91', '2014', 'platine,48x39,70x13,65 mm,cuir,tourbillon,homme', 417000.00, '5', 'hi', 0, '2020-10-19 17:29:46', NULL),
(694, 1, 15, 'RM 003', 'Carbon 503.72.91', '2014', 'composite de carbone,48x39,70x13,65 mm,caoutchouc,tourbillon,homme', 401000.00, '5', 'hi', 0, '2020-10-19 19:20:20', NULL),
(695, 1, 15, 'RM 004', 'RG 503.04.91', '2014', 'or rouge,48x39,00x15, mm,croco,mécanique à remontage manuel,homme', 252000.00, '5', 'hi', 0, '2020-10-19 19:24:42', NULL),
(696, 1, 15, 'RM 004', 'RG Felipe Massa 503.04C.91', '2014', 'or rouge,48x39,70x14,95 mm,cuir,mécanique à remontage manuel,homme', 267500.00, '5', 'hi', 0, '2020-10-19 19:29:02', NULL),
(697, 1, 15, 'RM 004', 'WG 503.06.91', '2014', 'or blanc,48x39,00x15, mm,croco,mécanique à remontage manuel,homme', 263500.00, '5', 'hi', 0, '2020-10-19 19:38:40', NULL),
(698, 1, 15, 'RM 004', 'Ti 503.45.91', '2014', 'titane,48x39,00x15, mm,croco,mécanique à remontage manuel,homme', 239500.00, '5', 'hi', 0, '2020-10-19 19:44:05', NULL),
(699, 1, 15, 'RM 004', 'Pt 503.48.91', '2014', 'platine,48x39,70x14,95 mm,cuir,mécanique à remontage manuel,homme', 312000.00, '5', 'hi', 0, '2020-10-19 19:50:01', NULL),
(700, 1, 15, 'RM 007', 'RG plain case, sapphire dial 506.04.91', '2014', 'or rouge,45x31x10,95 mm,satin,automatique,dame', 66000.00, '5', 'hi', 0, '2020-10-19 19:54:03', NULL),
(701, 1, 15, 'RM 007', 'RG plain case, half set dial 506.04.XXXX', '2014', 'or serti diamants,45x31x10,95 mm,croco,automatique,dame', 83000.00, '5', 'hi', 0, '2020-10-19 19:58:05', NULL),
(702, 1, 15, 'RM 007', 'WG plain case, sapphire dial 506.06.91', '2014', 'or blanc,45x31x10,95 mm,cuir,automatique,dame', 71500.00, '5', 'hi', 0, '2020-10-19 20:00:33', NULL),
(703, 1, 15, 'RM 008', 'RG 507.04.91', '2014', 'or rouge,48x39,70x14,95 mm,croco,tourbillon,homme', 683000.00, '5', 'hi', 0, '2020-10-19 20:07:07', NULL),
(704, 1, 15, 'RM 008', 'WG Felipe Massa 507.06D.91', '2014', 'or blanc,48x39,70x14,95 mm,cuir,tourbillon,homme', 71250.00, '5', 'hi', 0, '2020-10-19 20:08:42', NULL),
(705, 1, 15, 'RM 010', 'RG 509.04.91', '2014', 'or rouge,48x39,30x13,84 mm,cuir,automatique,medium', 84500.00, '5', 'hi', 0, '2020-10-19 20:29:36', NULL),
(706, 1, 15, 'RM 010', 'RG medium set 509.041.91-1', '2014', 'or serti diamants,48x39,30x13,84 mm,caoutchouc,automatique,medium', 113500.00, '5', 'hi', 0, '2020-10-19 20:33:40', NULL),
(707, 1, 15, 'RM 010', 'RG full set 509.042.91-1', '2014', 'or serti diamants,48x39,30x13,84 mm,caoutchouc,automatique,medium', 200000.00, '5', 'hi', 0, '2020-10-19 20:38:13', NULL),
(708, 1, 15, 'RM 010', 'WG 509.06.91', '2014', 'or blanc,48x39,30x13,84 mm,cuir,automatique,medium', 91500.00, '5', 'hi', 0, '2020-10-19 20:41:58', NULL),
(709, 1, 15, 'RM 010', 'WG medium set 509.061.91-1', '2014', 'or blanc serti de diamants,48x39,30x13,84 mm,croco,automatique,medium', 121000.00, '5', 'hi', 0, '2020-10-19 20:45:17', NULL),
(710, 1, 15, 'RM 010', 'WG full set 509.062.91-1', '2014', 'or blanc serti de diamants,48x39,30x13,84 mm,croco,automatique,medium', 207500.00, '5', 'hi', 0, '2020-10-19 20:47:41', NULL),
(711, 1, 15, 'RM 010', 'Ti 509.45.91', '2014', 'titane,48x39,30x13,84 mm,cuir,automatique,automatique', 67500.00, '5', 'hi', 0, '2020-10-19 20:51:10', NULL),
(712, 1, 15, 'RM 011', 'RG 511.04A.91-1', '2014', 'or rouge,50x40x16,15 mm,caoutchouc,automatique,homme', 111000.00, '5', 'hi', 0, '2020-10-19 20:55:22', NULL),
(713, 1, 15, 'RM 011', 'Full RG Ivory 511.04.91X-1', '2014', 'or rouge,50x40x16,15 mm,caoutchouc,automatique,homme', 13700.00, '5', 'hi', 0, '2020-10-19 20:57:23', NULL),
(714, 1, 15, 'RM 011', 'WG 511.06A.91-1', '2014', 'or blanc,50x40x16,15 mm,caoutchouc,automatique,homme', 116500.00, '5', 'hi', 0, '2020-10-19 21:03:49', NULL),
(715, 1, 15, 'RM 011', 'Ti 511.45AG.91-1', '2014', 'titane,50x40x16,15 mm,cuir,automatique,homme', 98500.00, '5', 'hi', 0, '2020-10-19 21:10:37', NULL),
(716, 1, 15, 'RM 011', 'Titalyt 511.45U.91-1', '2014', 'titane,50x40x16,15 mm,caoutchouc,automatique,homme', 103000.00, '5', 'hi', 0, '2020-10-19 21:16:08', NULL),
(717, 1, 15, 'RM 011', 'Ti Shot Blasted 511.45AS.91R-1', '2014', 'titane,50x40x16,15 mm,caoutchouc,automatique,homme', 100000.00, '5', 'hi', 0, '2020-10-19 21:18:13', NULL),
(718, 1, 15, 'RM 011', 'Ti LMC 511.45AR.91Z-1', '2014', 'titane,50x40x16,15 mm,caoutchouc,automatique,homme', 108500.00, '5', 'hi', 0, '2020-10-19 21:21:03', NULL),
(719, 1, 15, 'RM 011', 'Ti Spa Classic 511.45.XXX', '2014', 'titane,50x40x16,15 mm,caoutchouc,automatique,homme', 108500.00, '5', 'hi', 0, '2020-10-19 21:32:39', NULL),
(720, 1, 15, 'RM 011', 'RM11-01 Ti Roberto Mancini 549.45.91-1', '2014', 'titane,50x40x16,15 mm,caoutchouc,automatique,homme', 114500.00, '5', 'hi', 0, '2020-10-19 21:54:43', NULL),
(721, 1, 15, 'RM 011', 'Carbon 511.72.91S-1', '2014', 'composite de carbone,50x40x16,15 mm,caoutchouc,automatique,homme', 123000.00, '5', 'hi', 0, '2020-10-20 15:15:30', NULL),
(722, 1, 15, 'RM 014', 'RG Perini Navi 514.04.91', '2014', 'or rouge,45x38,90x11, mm,cuir,tourbillon,homme', 310000.00, '5', 'hi', 0, '2020-10-20 15:20:03', NULL),
(723, 1, 15, 'RM 014', 'WG Perini Navi 514.06.91', '2014', 'or blanc,45x38,90x11, mm,satin,tourbillon,homme', 323000.00, '5', 'hi', 0, '2020-10-20 15:24:47', NULL),
(724, 1, 15, 'RM 014', 'Pt Perini Navi 514.48.91', '2014', 'platine,45x38,90x11, mm,cuir,tourbillon,homme', 364000.00, '5', 'hi', 0, '2020-10-20 15:27:19', NULL),
(725, 1, 15, 'RM 015', 'RG Perini Navi 515.04.91 Tourbillon V2 Dual Time Marine', '2014', 'or rouge,48x39,30x13, mm,croco,tourbillon,homme', 363000.00, '5', 'hi', 0, '2020-10-20 15:30:09', NULL),
(726, 1, 15, 'RM 015', 'WG Perini Navi 515.06.91', '2014', 'or blanc,48x39,30x13, mm,croco,tourbillon,homme', 373000.00, '5', 'hi', 0, '2020-10-20 15:38:00', NULL),
(727, 1, 15, 'RM 016', 'RG 516.04.91-1', '2014', 'or rouge,49,8x38x8,25 mm,cuir,automatique,medium', 86500.00, '5', 'hi', 0, '2020-10-20 15:42:13', NULL),
(728, 1, 15, 'RM 016', 'RG full set 516.0410.91-1', '2014', '49,8x38x8,25 mm,tissus,automatique,dame', 159000.00, '5', 'hi', 0, '2020-10-20 15:46:20', NULL),
(729, 1, 15, 'RM 016', 'RG \"Pic\" setting - black sapphires 516.0424.91', '2014', 'or serti diamants,49,80x38x8,25 mm,cuir,automatique,dame', 82500.00, '5', 'hi', 0, '2020-10-20 15:48:42', NULL),
(730, 1, 15, 'RM 016', 'RG \"Pic\" setting - white round diamonds 516.0425.91', '2014', '49,80x38x8,25 mm,tissus,automatique,dame', 96500.00, '5', 'hi', 0, '2020-10-20 16:00:01', NULL),
(731, 1, 15, 'RM 016', 'WG 516.06.91-1', '2014', 'or blanc,49,8x38x8,25 mm,cuir,mécanique à remontage manuel,medium', 94500.00, '5', 'hi', 0, '2020-10-20 16:07:25', NULL),
(732, 1, 15, 'RM 016', 'WG medium set 516.061.91-1', '2014', 'or blanc serti de diamants,49,8x38x8,25 mm,tissus,automatique,dame', 124500.00, '5', 'hi', 0, '2020-10-20 16:20:04', NULL),
(733, 1, 15, 'RM 016', 'WG full set 516.0610.91-1', '2014', 'or blanc serti de diamants,49,8x38x8,25 mm,cuir,automatique,dame', 167500.00, '5', 'hi', 0, '2020-10-20 16:23:12', NULL),
(734, 1, 15, 'RM 016', 'WG \"Pic\" setting - black sapphires 516.0624.91', '2014', '49,8x38x8,25 mm,cuir,mécanique à remontage manuel,medium', 87500.00, '5', 'hi', 0, '2020-10-20 16:31:23', NULL),
(735, 1, 15, 'RM 016', 'Ti 516.45.91-1', '2014', 'titane,49,8x38x8,25 mm,cuir,automatique,medium', 71000.00, '5', 'hi', 0, '2020-10-20 16:35:23', NULL),
(736, 1, 15, 'RM 016', 'Titalyt 516.45C.91B-1', '2014', 'titane,49,80x38,00x8,2 mm,cuir,automatique,medium', 72000.00, '5', 'hi', 0, '2020-10-20 16:37:31', NULL),
(737, 1, 15, 'RM 016', 'Ti DLC 516.45I.91-1', '2014', 'titane,49,8x38x8,25 mm,cuir,automatique,medium', 72000.00, '5', 'hi', 0, '2020-10-20 16:40:32', NULL),
(738, 1, 15, 'RM 017', 'RG 517.04.91', '2014', 'or rouge,49,80x38x8,70 mm,cuir,tourbillon,homme', 382000.00, '5', 'hi', 0, '2020-10-20 16:42:55', NULL),
(739, 1, 15, 'RM 017', 'RG full set 517.041.91', '2014', '49,80x38x8,70 mm,cuir,tourbillon,homme,', 466500.00, '5', 'hi', 0, '2020-10-20 16:46:35', NULL),
(740, 1, 15, 'RM 017', 'WG 517.06.91 Tourbillon Extra Plate', '2014', 'or blanc,49,80x38x8,70 mm,croco,tourbillon,homme', 390000.00, '5', 'hi', 0, '2020-10-20 17:39:17', NULL),
(741, 1, 15, 'RM 017', 'WG full set 517.061.91', '2014', '49,80x38x8,70 mm,croco,tourbillon,homme', 474500.00, '5', 'hi', 0, '2020-10-20 17:57:06', NULL),
(742, 1, 15, 'RM 017', 'Ti 517.45.91 Tourbillon Extra Plate', '2014', 'titane,49,80x38x8,70 mm,croco,tourbillon,homme', 353500.00, '5', 'hi', 0, '2020-10-20 17:59:22', NULL),
(743, 1, 15, 'RM 020', 'RG 520.04A.91 Montre de Poche', '2014', 'or rouge,62x52x15,60 mm,tourbillon,homme', 460000.00, '5', 'hi', 0, '2020-10-20 18:02:01', NULL),
(744, 1, 15, 'RM 020', 'WG 520.06A.91 Montre de Poche', '2014', 'or blanc,62x52x15,60 mm,tourbillon,homme', 466000.00, '5', 'hi', 0, '2020-10-20 18:04:37', NULL),
(745, 1, 15, 'RM 020', 'Ti 520.45.91 Montre de Poche', '2014', 'titane', 431000.00, '5', 'hi', 0, '2020-10-20 18:18:00', NULL),
(746, 1, 15, 'RM 021', 'RG 521.04.91', '2014', 'or rouge,48x39,30x19,95 mm,croco,tourbillon,homme', 411500.00, '5', 'hi', 0, '2020-10-20 18:23:25', NULL),
(747, 1, 15, 'RM 021', 'WG 521.06.91', '2014', 'or blanc,48x39,3x19,95 mm,croco,tourbillon,homme', 423500.00, '5', 'hi', 0, '2020-10-20 18:32:03', NULL),
(748, 1, 15, 'RM 021', 'Ti 521.45.91', '2014', 'titane,48x39,30x19,95 mm,croco,tourbillon,homme', 37400.00, '5', 'hi', 0, '2020-10-20 18:40:22', NULL),
(749, 1, 15, 'RM 021', 'Carbon 521.72.91', '2014', 'composite de carbone,48x39,30x19,95 mm,tourbillon,homme', 443000.00, '5', 'hi', 0, '2020-10-20 18:43:19', NULL),
(750, 1, 15, 'RM 022', 'RG 522.04.91 Tourbillon', '2014', 'or rouge,48x39,30x19,95 mm,croco,tourbillon,homme', 43800.00, '5', 'hi', 0, '2020-10-20 18:46:27', NULL),
(751, 1, 15, 'RM 022', 'WG 522.06.91', '2014', 'or blanc,48x39,30x19,95 mm,croco,tourbillon,homme', 450500.00, '5', 'hi', 0, '2020-10-20 18:48:26', NULL),
(752, 1, 15, 'RM 023', 'RG 523.04.91-1', '2014', 'or rouge,45x39,30x11,25 mm,croco,automatique,medium', 85000.00, '5', 'hi', 0, '2020-10-20 18:51:00', NULL),
(753, 1, 15, 'RM 023', 'RG medium set 523.041.91-1', '2014', 'or serti diamants,45x39,30x11,25 mm,croco,automatique,dame', 114000.00, '5', 'hi', 0, '2020-10-20 18:53:50', NULL),
(754, 1, 15, 'RM 023', 'RG full set 523.042.91-1', '2014', 'or serti diamants,45x39,30x11,25 mm,croco,automatique,dame', 165000.00, '5', 'hi', 0, '2020-10-20 18:56:07', NULL),
(755, 1, 15, 'RM 023', 'WG 523.06.91', '2014', 'or blanc,45x39,30x11,25 mm,croco,automatique,medium', 90500.00, '5', 'hi', 0, '2020-10-20 18:58:12', NULL),
(756, 1, 15, 'RM 023', 'WG medium set 523.061.91-1', '2014', 'or blanc serti de diamants,45x39,30x11,25 mm,croco,automatique,dame', 120000.00, '5', 'hi', 0, '2020-10-20 19:01:04', NULL),
(757, 1, 15, 'RM 023', 'WG full set 523.062.91-1', '2014', 'or blanc serti de diamants,45x39,30x11,25 mm,croco,automatique,dame', 171000.00, '5', 'hi', 0, '2020-10-20 19:03:26', NULL),
(758, 1, 15, 'RM 023', 'Ti 523.45.91', '2014', 'titane,45x39,30x11,25 mm,croco,automatique,medium', 68000.00, '5', 'hi', 0, '2020-10-20 19:08:11', NULL),
(759, 1, 15, 'RM 025', 'Ti 525.45.91 Tourbillon', '2014', 'titane,50,70x19,20 mm,perfluoroelastomère Kalrez,tourbillon,homme', 611000.00, '5', 'hi', 0, '2020-10-20 19:13:02', NULL),
(760, 1, 15, 'RM 026', 'RG Panda 547.04.91', '2014', 'or serti diamants,45x39,7x12,60 mm,croco,tourbillon,dame', 501000.00, '5', 'hi', 0, '2020-10-20 19:23:30', NULL),
(761, 1, 15, 'RM 026', 'WG Panda 547.06.91', '2014', 'or blanc,45x39,7x12,60 mm,croco,tourbillon,dame', 515500.00, '5', 'hi', 0, '2020-10-20 19:25:54', NULL),
(762, 1, 15, 'RM 027', 'RM27-01 Rafael Nadal 545.72.91', '2014', 'nanotubes de carbone,45,98x38,90x10, mm,velcro,tourbillon,homme', 658000.00, '5', 'hi', 0, '2020-10-20 19:34:08', NULL),
(763, 1, 15, 'RM 027', 'RM27-01 Rafael Nadal 545.72.91', '2014', 'nanotubes de carbone,45,98x38,90x10, mm,velcro,tourbillon,homme', 658000.00, '5', 'hi', 0, '2020-10-20 19:34:53', NULL),
(764, 1, 15, 'RM 028', 'RG 528.04.91', '2014', 'or rouge', 125500.00, '5', 'hi', 0, '2020-10-20 19:45:06', NULL),
(765, 1, 15, 'RM 028', 'Ti 528.45.91', '2014', 'titane,47x14,6 mm,cuir,automatique,homme', 86000.00, '5', 'hi', 0, '2020-10-20 19:50:56', NULL),
(766, 1, 15, 'RM 028', 'Brown PVD 528.45L.91B-1', '2014', 'pvd,47x14,6 mm,caoutchouc,automatique,homme', 92500.00, '5', 'hi', 0, '2020-10-20 19:58:52', NULL),
(767, 1, 15, 'RM 028', 'Ti DLC \"Orange Flash\" 528.45M.91K-1', '2014', 'titane,47x14,6 mm,caoutchouc,automatique,homme', 93000.00, '5', 'hi', 0, '2020-10-20 20:05:19', NULL),
(768, 1, 15, 'RM 028', 'Voiles de St Barth 528.45A.91C-1', '2014', 'titane,47x14,6 mm,caoutchouc,automatique,homme', 83500.00, '5', 'hi', 0, '2020-10-20 20:08:04', NULL),
(769, 1, 15, 'RM 029', 'RG 529.04.91', '2014', 'or rouge,48x39,70x12,60 mm,caoutchouc,automatique,homme', 86000.00, '5', 'hi', 0, '2020-10-20 20:11:35', NULL),
(770, 1, 15, 'RM 029', 'RG 529.04.91', '2014', 'or rouge,48x39,70x12,60 mm,caoutchouc,automatique,homme', 86000.00, '5', 'hi', 0, '2020-10-21 15:33:35', NULL),
(771, 1, 15, 'RM 029', 'WG 529.06.91', '2014', 'or blanc,48x39,70x12,60 mm,caoutchouc,automatique,homme', 96500.00, '5', 'hi', 0, '2020-10-21 15:46:03', NULL),
(772, 1, 15, 'RM 029', 'Ti 529.45.91', '2014', 'titane,48x39,70x12,60 mm,caoutchouc,automatique,homme', 70000.00, '5', 'hi', 0, '2020-10-21 15:48:38', NULL),
(773, 1, 15, 'RM 030', 'RG 530.04A.91', '2014', 'or rouge,50x42,70x13,95 mm,caoutchouc,automatique,homme', 105000.00, '5', 'hi', 0, '2020-10-21 15:57:13', NULL),
(774, 1, 15, 'RM 030', 'Ti 530.45.91 A', '2014', 'titane,50x42,70x13,95 mm,caoutchouc,automatique,homme', 81000.00, '5', 'hi', 0, '2020-10-21 17:15:19', NULL),
(775, 1, 15, 'RM 030', 'Ti DLC Black Night 530.45D.91C', '2014', 'titane,50x42,70x13,95 mm,caoutchouc,automatique,homme', 82500.00, '5', 'hi', 0, '2020-10-21 17:21:25', NULL),
(776, 1, 15, 'RM 031', 'Haute performance 531.48.91', '2014', 'platine,50 mm,caoutchouc,tourbillon,homme', 923000.00, '5', 'hi', 0, '2020-10-21 17:24:49', NULL),
(777, 1, 15, 'RM 032', 'RG 532.04.91', '2014', '', 168000.00, '5', 'hi', 0, '2020-10-21 17:26:42', NULL),
(778, 1, 15, 'RM 032', 'Ti 532.45.91', '2014', '', 129000.00, '5', 'hi', 0, '2020-10-21 17:28:32', NULL),
(779, 1, 15, 'RM 032', 'Brown PVD 532.45C.91D-1', '2014', 'pvd,50x17,8 mm,caoutchouc,automatique,homme', 135500.00, '5', 'hi', 0, '2020-10-21 17:31:27', NULL),
(780, 1, 15, 'RM 033', 'RG 533.04.91', '2014', '', 103000.00, '5', 'hi', 0, '2020-10-21 17:37:00', NULL),
(781, 1, 15, 'RM 033', 'RG medium set \"Triangle\" 533.042.91-1', '2014', '', 131500.00, '5', 'hi', 0, '2020-10-21 17:42:18', NULL),
(782, 1, 15, 'RM 033', 'RG full set 533.041.91-1', '2014', '', 161500.00, '5', 'hi', 0, '2020-10-21 17:47:47', NULL),
(783, 1, 15, 'RM 033', 'WG 533.06.91', '2014', '', 108.00, '5', 'hi', 0, '2020-10-21 17:50:04', NULL),
(784, 1, 15, 'RM 033', 'WG medium set \"Triangle\" 533.062.91-1', '2014', '', 137000.00, '5', 'hi', 0, '2020-10-21 17:52:03', NULL),
(785, 1, 15, 'RM 033', 'WG full set 533.061.91-1', '2014', '', 167000.00, '5', 'hi', 0, '2020-10-21 17:53:57', NULL),
(786, 1, 15, 'RM 033', 'Ti 533.45.91', '2014', '', 82000.00, '5', 'hi', 0, '2020-10-21 17:55:53', NULL),
(787, 1, 15, 'RM 035', 'RM035 Rafael Nadal 535.24.91', '2014', '', 90000.00, '5', 'hi', 0, '2020-10-21 17:58:08', NULL),
(788, 1, 15, 'RM 035', 'RM035-01 Rafael Nadal', '2014', '', 91000.00, '5', 'hi', 0, '2020-10-21 18:00:10', NULL),
(789, 1, 15, 'RM 036', 'Jean Todt G Sensor 536.45.91', '2014', '', 437500.00, '5', 'hi', 0, '2020-10-21 18:01:34', NULL),
(790, 1, 15, 'RM 036', 'RM036-01 S. Loeb Sensor', '2014', '', 550.00, '5', 'hi', 0, '2020-10-21 18:02:57', NULL),
(791, 1, 15, 'RM 038', 'Bubba Watson 538.25.91', '2014', '', 500000.00, '5', 'hi', 0, '2020-10-21 18:06:18', NULL),
(792, 1, 15, 'RM 039', 'Aviation E6-B Flyback', '2014', '', 872500.00, '5', 'hi', 0, '2020-10-21 18:09:45', NULL),
(793, 1, 15, 'RM 039', 'RM 39-01 Ti Aviation 542.45.91-1', '2014', '', 124000.00, '5', 'hi', 0, '2020-10-21 18:09:20', NULL),
(794, 1, 15, 'RM 051', 'Michelle Yeoh RG Full Set 551.0411.94', '2014', '', 716500.00, '5', 'hi', 0, '2020-10-21 18:11:12', NULL),
(795, 1, 15, 'RM 051', 'RM51-01 RG Michelle Yeoh Tiger & Dragon', '2014', '', 639500.00, '5', 'hi', 0, '2020-10-21 18:25:21', NULL),
(796, 1, 15, 'RM 052', 'RG Black Skull 552.04.XXX', '2014', '', 531000.00, '5', 'hi', 0, '2020-10-21 18:28:00', NULL),
(797, 1, 15, 'RM 052', 'Black Ceramic & Red Gold Skull TBC', '2014', '', 515500.00, '5', 'hi', 0, '2020-10-21 18:29:29', NULL),
(798, 1, 15, 'RM 053', 'Pablo MacDonough 553.45.91', '2014', '', 541.00, '5', 'hi', 0, '2020-10-21 18:31:24', NULL),
(799, 1, 15, 'RM 055', 'Bubba Watson 555.45A.91-1', '2014', '', 91000.00, '5', 'hi', 0, '2020-10-21 18:35:11', NULL),
(800, 1, 15, 'RM 055', 'Bubba Watson All Black 555.XXX', '2014', '', 97000.00, '5', 'HI', 0, '2020-10-21 18:37:41', NULL),
(801, 1, 15, 'RM 56', 'RM56-01 Sapphire 544.52.91', '2014', '', 1636500.00, '5', 'hi', 0, '2020-10-21 18:42:35', NULL),
(802, 1, 15, 'RM 057', 'RG Red Dragon 557.04.91/x', '2014', '', 564000.00, '5', 'hi', 0, '2020-10-21 19:10:32', NULL),
(803, 1, 15, 'RM 057', 'RG Full Set Green Dragon 557.042.91/K', '2014', 'or serti diamants,50x42,70x14,55 mm,caoutchouc,tourbillon,homme', 685500.00, '5', 'hi', 0, '2020-10-21 19:12:42', NULL),
(804, 1, 15, 'RM 057', 'WG Green Dragon 557.06.91/G', '2014', 'or blanc,50x42,70x14,55 mm,caoutchouc,tourbillon,homme', 574500.00, '5', 'hi', 0, '2020-10-21 19:15:18', NULL),
(805, 1, 15, 'RM 58', 'RM58-01 Jean Todt World Timer 543.04A.91', '2014', '50x15,35 mm,caoutchouc,tourbillon,homme', 572500.00, '5', 'hi', 0, '2020-10-21 19:17:43', NULL),
(806, 1, 15, 'RM 59', 'RM59-01 Yohan Blake 548.72.91', '2014', 'nanotubes de carbone,50,24x42,70x15, mm,caoutchouc,tourbillon,homme', 562500.00, '5', 'hi', 0, '2020-10-21 19:19:31', NULL),
(807, 1, 15, 'RM 60', 'RM60-01 Ti Navigation Regatta', '2014', 'titane,50 x 16,33 mm,caoutchouc,automatique,homme', 134000.00, '5', 'hi', 0, '2020-10-21 19:30:59', NULL),
(808, 1, 15, 'RM 61', 'RM 61-01 Yohan Blake', '2014', 'composite de carbone,50,23 x 42,70 x mm,cuir,automatique,homme', 102000.00, '5', 'hi', 0, '2020-10-21 19:35:57', NULL),
(809, 1, 15, 'RM 63-01RG Dizzy Hands', 'RM 63-01', '2019', '- Boîtier: Or rose,- Diamètre du boîtier: 42.7 mm,- Mouvement: Automatique,- Bracelet: Caoutchouc,- Année de fabrication: 2018,- État: Neuf,sans trace d\'usure,- Contenu livré: Avec boîte d\'origine et papier d\'origine,- Sexe: Montre Homme/Unisexe', 68300.00, '0', '-\r\nAu premier coup d’oeil, rien, hormis peut-être le mode d’affichage des heures, ne laisse présager des merveilles horlogères nichées au coeur de la RM 63-01, hormis peut-être le mode d’affichage des heures. L’esprit authentique de Richard Mille s’insinue pourtant dans chaque détail, chaque composant et chaque solution mécanique.\r\nUne simple pression sur le bouton poussoir logé au centre de la couronne déclenche un véritable ballet au ralenti : le cadran, protégé par un verre saphir, commence à se mouvoir doucement dans le sens inverse des aiguilles d’une montre, tandis que l’aiguille des heures adopte une cadence différente.\r\n Prix magasin : 107 000 €', 0, '2020-10-26 22:06:22', NULL),
(810, 1, 16, 'DIOR VIII', 'CD1221E0C001', '2014', '', 4750.00, '5', 'hi', 0, '2020-10-21 22:44:46', NULL),
(811, 1, 16, 'DIOR VIII', 'CD1221E1C001', '2014', '', 5950.00, '5', 'hi', 0, '2020-10-21 22:49:13', NULL),
(812, 1, 16, 'DIOR VIII', 'CD1221E5C001', '2014', '', 10600.00, '5', 'hi', 0, '2020-10-21 22:54:16', NULL),
(813, 1, 16, 'DIOR VIII', 'CD1231E0C001', '2014', '', 3850.00, '5', 'hi', 0, '2020-10-21 22:56:02', NULL),
(814, 1, 16, 'DIOR VIII', 'CD1231E0C002', '2014', '', 4950.00, '5', 'hi', 0, '2020-10-21 22:57:22', NULL),
(815, 1, 16, 'DIOR VIII', 'CD1235E2C001', '2014', 'acier et céramique,33 mm,céramique,automatique,dame', 5850.00, '5', 'hi', 0, '2020-10-21 23:00:16', NULL),
(816, 1, 16, 'DIOR VIII', 'CD1231E1C001', '2014', 'acier, céramique et diamants,33 mm,céramique,quartz,dame', 6850.00, '5', 'hi', 0, '2020-10-21 23:03:58', NULL),
(817, 1, 16, 'DIOR VIII', 'CD1235E1C001', '2014', 'acier, céramique et diamants,33 mm,céramique,automatique,dame', 12100.00, '5', 'hi', 0, '2020-10-21 23:06:37', NULL),
(818, 1, 16, 'DIOR VIII', 'CD1245E0C001', '2014', 'acier et céramique,38 mm,céramique,automatique,medium', 4650.00, '5', 'hi', 0, '2020-10-21 23:08:52', NULL),
(819, 1, 16, 'DIOR VIII', 'CD1245E7C001', '2014', 'acier et céramique,38 mm,céramique,automatique,dame', 5650.00, '5', 'hi', 0, '2020-10-21 23:11:15', NULL),
(820, 1, 16, 'DIOR VIII', 'CD1245E0C002', '2014', 'acier et céramique,38 mm,céramique,automatique,medium', 5950.00, '5', 'hi', 0, '2020-10-21 23:14:29', NULL),
(821, 1, 16, 'DIOR VIII', 'CD1241E0C001', '2014', 'acier, céramique et diamants,38 mm,céramique,quartz,medium', 7750.00, '5', 'hi', 0, '2020-10-21 23:16:39', NULL),
(822, 1, 16, 'DIOR VIII', 'CD1245E1C001', '2014', 'acier, céramique et diamants,38 mm,céramique,quartz,medium', 8650.00, '5', 'hi', 0, '2020-10-21 23:18:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `productdurashop`
--

CREATE TABLE `productdurashop` (
  `productid` bigint(20) NOT NULL,
  `productname` varchar(300) NOT NULL,
  `productcategoryid` bigint(20) NOT NULL,
  `productdescription` varchar(400) NOT NULL,
  `productprice` decimal(10,0) NOT NULL,
  `createdbyuserid` bigint(11) NOT NULL,
  `createddatetime` datetime NOT NULL,
  `isactive` tinyint(1) NOT NULL,
  `productsize` varchar(200) NOT NULL,
  `productcolor` varchar(200) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_gallery`
--

CREATE TABLE `product_gallery` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_gallery`
--

INSERT INTO `product_gallery` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, '20200909153542-product_img.png', '2020-09-09 07:21:01', ''),
(2, 1, '20200909125101-RX049-2 (1).jpg', '2020-09-09 07:21:01', ''),
(4, 1, '20200909125133-rolex-watch-500x500.jpg', NULL, ''),
(5, 2, '20200909152012-rolex-watch-500x500.jpg', '2020-09-09 09:50:12', ''),
(6, 2, '20200909152012-RX049-1-1.jpg', '2020-09-09 09:50:12', ''),
(7, 2, '20200909152012-RX049-2 (1).jpg', '2020-09-09 09:50:12', ''),
(8, 2, '20200909152012-RX049-2.jpg', '2020-09-09 09:50:12', ''),
(9, 3, '20200909155246-rolex-watch-500x500.jpg', '2020-09-09 10:22:46', ''),
(10, 3, '20200909155246-RX049-1-1.jpg', '2020-09-09 10:22:46', ''),
(11, 3, '20200909155246-RX049-2 (1).jpg', '2020-09-09 10:22:46', ''),
(12, 4, '20200910130741-rolex-watch-500x500.jpg', '2020-09-10 07:37:41', ''),
(13, 4, '20200910130741-RX049-1-1.jpg', '2020-09-10 07:37:41', ''),
(14, 4, '20200910130741-RX049-2 (1).jpg', '2020-09-10 07:37:41', ''),
(15, 4, '20200910130741-RX049-2.jpg', '2020-09-10 07:37:41', ''),
(16, 13, '20200925120228-20130319_083314_1174_admin.png', '2020-09-25 06:32:28', ''),
(17, 13, '20200925120228-default_female600x600-3702af30bd630e7b0fa62af75cd2e67c.png', '2020-09-25 06:32:28', ''),
(18, 13, '20200925120228-images (1).jfif', '2020-09-25 06:32:28', ''),
(19, 13, '20200925120228-images.jfif', '2020-09-25 06:32:28', ''),
(20, 14, '20200925120718-myavatar.png', '2020-09-25 06:37:18', ''),
(21, 14, '20200925120718-negris_avatar.jpg', '2020-09-25 06:37:18', ''),
(22, 15, '20200925122804-20130319_083314_1174_admin.png', '2020-09-25 06:58:04', ''),
(23, 15, '20200925122805-default_female600x600-3702af30bd630e7b0fa62af75cd2e67c.png', '2020-09-25 06:58:05', ''),
(24, 16, '20200925123051-20130319_083314_1174_admin.png', '2020-09-25 07:00:51', ''),
(25, 17, '20200930111320-RX049-1-1.jpg', '2020-09-29 16:17:59', ''),
(26, 17, '20200930111340-RX049-2 (1).jpg', '2020-09-29 16:17:59', ''),
(27, 17, '20200930111416-rolex-watch-500x500.jpg', '2020-09-29 16:17:59', ''),
(28, 18, '20200929131012-RX049-1-1.jpg', '2020-09-29 17:10:12', ''),
(29, 18, '20200929131012-RX049-2 (1).jpg', '2020-09-29 17:10:12', ''),
(30, 18, '20200929131012-RX049-2.jpg', '2020-09-29 17:10:12', ''),
(31, 18, '20200929131042-rolex-watch-500x500.jpg', NULL, ''),
(32, 19, '20200930121516-Rolex-279160.jpg', '2020-09-30 16:15:16', ''),
(33, 20, '20200930122227-Rolex-279174.jpg', '2020-09-30 16:22:27', ''),
(34, 21, '20200930122408-Rolex-279173.jpg', '2020-09-30 16:24:08', ''),
(36, 23, '20200930123357-Rolex-279383-RBR.jpg', '2020-09-30 16:33:57', ''),
(37, 24, '20200930123546-Rolex-279161.jpg', '2020-09-30 16:35:46', ''),
(38, 25, '20200930123939-Rolex-279171.jpg', '2020-09-30 16:39:39', ''),
(39, 26, '20200930124747-Rolex-279381-RBR.jpg', '2020-09-30 16:47:47', ''),
(40, 27, '20200930125007-Rolex-279178.jpg', '2020-09-30 16:50:07', ''),
(41, 28, '20200930125835-Rolex-279138-RBR.jpg', '2020-09-30 16:58:35', ''),
(42, 29, '20200930130420-Rolex-279165.jpg', '2020-09-30 17:04:20', ''),
(43, 30, '20200930132416-Rolex-279135-RBR.jpg', '2020-09-30 17:24:16', ''),
(44, 31, '20200930133703-Rolex-279160.jpg', '2020-09-30 17:37:03', ''),
(45, 32, '20200930133856-Rolex-279135-1-RBR.jpg', '2020-09-30 17:38:56', ''),
(46, 33, '20200930134143-Rolex-279166.jpg', '2020-09-30 17:41:43', ''),
(47, 34, '20200930134333-Rolex-279136-RBR.jpg', '2020-09-30 17:43:33', ''),
(48, 35, '20200930135744-Rolex-279174-1.jpg', '2020-09-30 17:57:44', ''),
(49, 36, '20200930135934-Rolex-279384-RBR.jpg', '2020-09-30 17:59:34', ''),
(50, 37, '20200930140421-Rolex-279173-1.jpg', '2020-09-30 18:04:21', ''),
(51, 38, '20200930141330-Rolex-279161-1.jpg', '2020-09-30 18:13:30', ''),
(52, 39, '20200930141638-Rolex-279138-RBR-1.jpg', '2020-09-30 18:16:38', ''),
(53, 40, '20200930141918-Rolex-118238.jpg', '2020-09-30 18:19:18', ''),
(54, 41, '20200930142037-Rolex-118348.jpg', '2020-09-30 18:20:37', ''),
(55, 42, '20200930142519-Rolex-118205.jpg', '2020-09-30 18:25:19', ''),
(56, 43, '20200930142823-Rolex-118235.jpg', '2020-09-30 18:28:23', ''),
(57, 44, '20200930143517-Rolex-118239.jpg', '2020-09-30 18:35:17', ''),
(58, 45, '20200930143803-Rolex-118206.jpg', '2020-09-30 18:38:03', ''),
(59, 46, '20200930145009-Rolex-118346.jpg', '2020-09-30 18:50:09', ''),
(60, 47, '20200930145214-Rolex-118389.jpg', '2020-09-30 18:52:14', ''),
(61, 48, '20200930145515-Rolex-118138.jpg', '2020-09-30 18:55:15', ''),
(62, 49, '20200930150144-Rolex-118139.jpg', '2020-09-30 19:01:44', ''),
(63, 50, '20200930150636-Rolex-118135.jpg', '2020-09-30 19:06:36', ''),
(64, 51, '20200930151008-Rolex-228238.jpg', '2020-09-30 19:10:08', ''),
(65, 52, '20200930160148-Rolex-228348-RBR.jpg', '2020-09-30 20:01:48', ''),
(66, 53, '20200930160324-Rolex-228398-TBR.jpg', '2020-09-30 20:03:24', ''),
(67, 54, '20200930160652-Rolex-228239.jpg', '2020-09-30 20:06:52', ''),
(68, 55, '20200930161617-Rolex-228349-RBR.jpg', '2020-09-30 20:16:17', ''),
(69, 56, '20200930162030-Rolex-228349-RBR-1.jpg', '2020-09-30 20:20:30', ''),
(70, 57, '20200930170012-Rolex-228235.jpg', '2020-09-30 21:00:12', ''),
(71, 58, '20200930171230-Rolex-228235-1.jpg', '2020-09-30 21:12:30', ''),
(72, 59, '20200930171713-Rolex-228345-RBR.jpg', '2020-09-30 21:17:13', ''),
(73, 60, '20200930172046-Rolex-228206.jpg', '2020-09-30 21:20:46', ''),
(74, 61, '20200930172337-Rolex-228396-TBR.jpg', '2020-09-30 21:23:37', ''),
(75, 62, '20200930173154-Rolex-326138.jpg', '2020-09-30 21:31:54', ''),
(76, 63, '20200930173353-Rolex-326938.jpg', '2020-09-30 21:33:53', ''),
(77, 64, '20200930173602-Rolex-326139.jpg', '2020-09-30 21:36:02', ''),
(78, 65, '20200930175437-Rolex-326939.jpg', '2020-09-30 21:54:37', ''),
(79, 66, '20200930175601-Rolex-326135.jpg', '2020-09-30 21:56:01', ''),
(80, 67, '20200930175724-Rolex-326935.jpg', '2020-09-30 21:57:24', ''),
(81, 68, '20200930180026-Rolex-326934.jpg', '2020-09-30 22:00:26', ''),
(82, 69, '20201001112311-Rolex-326933.jpg', '2020-10-01 15:23:11', ''),
(83, 70, '20201001112450-Rolex-178240.jpg', '2020-10-01 15:24:50', ''),
(84, 71, '20201001113515-Rolex-178274.jpg', '2020-10-01 15:35:15', ''),
(85, 72, '20201001113913-Rolex-178384.jpg', '2020-10-01 15:39:13', ''),
(86, 73, '20201001114743-Rolex-178243.jpg', '2020-10-01 15:47:43', ''),
(87, 74, '20201001115031-Rolex-178273.jpg', '2020-10-01 15:50:31', ''),
(88, 75, '20201001115235-Rolex-178343.jpg', '2020-10-01 15:52:35', ''),
(89, 76, '20201001115517-Rolex-178383.jpg', '2020-10-01 15:55:17', ''),
(90, 77, '20201001120629-Rolex-178241.jpg', '2020-10-01 16:06:29', ''),
(91, 78, '20201001121045-Rolex-178271.jpg', '2020-10-01 16:10:45', ''),
(92, 79, '20201001121522-Rolex-178341.jpg', '2020-10-01 16:15:22', ''),
(93, 80, '20201001121655-Rolex-178278.jpg', '2020-10-01 16:16:55', ''),
(94, 82, '20201001121826-Rolex-178288-0063.jpg', '2020-10-01 16:18:26', ''),
(95, 83, '20201001122027-Rolex-178279.jpg', '2020-10-01 16:20:27', ''),
(96, 84, '20201001122256-Rolex-178159.jpg', '2020-10-01 16:22:56', ''),
(97, 85, '20201001122935-Rolex-178245.jpg', '2020-10-01 16:29:35', ''),
(98, 86, '20201001123112-Rolex-178275.jpg', '2020-10-01 16:31:12', ''),
(100, 87, '20201001130457-Rolex-178344.jpg', '2020-10-01 17:04:57', ''),
(101, 88, '20201001131144-Rolex-115200.jpg', '2020-10-01 17:11:44', ''),
(102, 89, '20201001131458-Rolex-115234.jpg', '2020-10-01 17:14:58', ''),
(103, 90, '20201001131645-Rolex-115234-0012.jpg', '2020-10-01 17:16:45', ''),
(104, 91, '20201001134830-Rolex-116203.jpg', '2020-10-01 17:48:30', ''),
(105, 92, '20201001135138-Rolex-116233-1.jpg', '2020-10-01 17:51:38', ''),
(106, 93, '20201001135624-Rolex-116200-0060.jpg', '2020-10-01 17:56:24', ''),
(107, 94, '20201001140034-Rolex-116200-0085.jpg', '2020-10-01 18:00:34', ''),
(108, 95, '20201001140352-Rolex-116234-0104.jpg', '2020-10-01 18:03:52', ''),
(109, 96, '20201001140624-Rolex-116244-0007.jpg', '2020-10-01 18:06:24', ''),
(110, 97, '20201001140929-Rolex-116244.jpg', '2020-10-01 18:09:29', ''),
(111, 98, '20201001141648-Rolex-116243.jpg', '2020-10-01 18:16:48', ''),
(112, 99, '20201001142419-Rolex-116238-0059.jpg', '2020-10-01 18:24:19', ''),
(113, 100, '20201001142828-Rolex-116238-0062.jpg', '2020-10-01 18:28:28', ''),
(114, 101, '20201001143127-Rolex-116231-0074.jpg', '2020-10-01 18:31:27', ''),
(115, 102, '20201001143448-Rolex-116231-0057.jpg', '2020-10-01 18:34:48', ''),
(116, 103, '20201001144613-Rolex-116234.jpg', '2020-10-01 18:46:13', ''),
(117, 104, '20201001144841-Rolex-116233.jpg', '2020-10-01 18:48:41', ''),
(118, 105, '20201001145201-Rolex-116201.jpg', '2020-10-01 18:52:01', ''),
(119, 106, '20201001150250-Rolex-126300.jpg', '2020-10-01 19:02:50', ''),
(120, 107, '20201001152432-Rolex-126300-1.jpg', '2020-10-01 19:24:32', ''),
(121, 108, '20201001160947-Rolex-126334.jpg', '2020-10-01 20:09:47', ''),
(122, 109, '20201001161344-Rolex-126334-2.jpg', '2020-10-01 20:13:44', ''),
(123, 110, '20201001161829-Rolex-126334-3.jpg', '2020-10-01 20:18:29', ''),
(124, 111, '20201001162435-Rolex-126303.jpg', '2020-10-01 20:24:35', ''),
(125, 112, '20201001165610-Rolex-126303-1.jpg', '2020-10-01 20:56:10', ''),
(126, 113, '20201001165804-Rolex-126333.jpg', '2020-10-01 20:58:04', ''),
(127, 114, '20201001170651-Rolex-126333-1.jpg', '2020-10-01 21:06:51', ''),
(128, 115, '20201001171047-Rolex-126333-2.jpg', '2020-10-01 21:10:47', ''),
(129, 116, '20201001171342-Rolex-126301.jpg', '2020-10-01 21:13:42', ''),
(130, 117, '20201001171620-Rolex-126301-1.jpg', '2020-10-01 21:16:20', ''),
(131, 118, '20201001173743-Rolex-126331.jpg', '2020-10-01 21:37:43', ''),
(132, 119, '20201001174034-Rolex-126331-1.jpg', '2020-10-01 21:40:34', ''),
(133, 120, '20201005121051-Rolex-176200.jpg', '2020-10-05 16:10:51', ''),
(134, 121, '20201005121606-Rolex-177200.jpg', '2020-10-05 16:16:06', ''),
(135, 122, '20201005122121-Rolex-114200.jpg', '2020-10-05 16:21:21', ''),
(136, 123, '20201005122441-Rolex-116000.jpg', '2020-10-05 16:24:41', ''),
(137, 124, '20201005124209-Rolex-114300.jpg', '2020-10-05 16:42:09', ''),
(138, 125, '20201005124411-Rolex-80318.jpg', '2020-10-05 16:44:11', ''),
(139, 126, '20201005124800-Rolex-80298.jpg', '2020-10-05 16:48:00', ''),
(140, 127, '20201005130336-Rolex-80319.jpg', '2020-10-05 17:03:36', ''),
(141, 128, '20201005130657-Rolex-80299.jpg', '2020-10-05 17:06:57', ''),
(142, 129, '20201005132544-Rolex-80315.jpg', '2020-10-05 17:25:44', ''),
(143, 130, '20201005135935-Rolex-80315-1.jpg', '2020-10-05 17:59:35', ''),
(144, 131, '20201005140124-Rolex-80285.jpg', '2020-10-05 18:01:24', ''),
(145, 132, '20201005140347-Rolex-80285-1.jpg', '2020-10-05 18:03:47', ''),
(146, 133, '20201005140631-Rolex-81318.jpg', '2020-10-05 18:06:31', ''),
(147, 134, '20201005140855-Rolex-81298.jpg', '2020-10-05 18:08:55', ''),
(148, 135, '20201005141435-Rolex-81299.jpg', '2020-10-05 18:14:35', ''),
(149, 136, '20201005141815-Rolex-81409-RBR.jpg', '2020-10-05 18:18:15', ''),
(150, 137, '20201005143339-Rolex-81315.jpg', '2020-10-05 18:33:39', ''),
(151, 138, '20201005143745-Rolex-81405-RBR.jpg', '2020-10-05 18:37:45', ''),
(152, 139, '20201005144038-Rolex-86289.jpg', '2020-10-05 18:40:38', ''),
(153, 140, '20201005145027-Rolex-86289-1.jpg', '2020-10-05 18:50:27', ''),
(154, 141, '20201005152505-Rolex-86409-RBR.jpg', '2020-10-05 19:25:05', ''),
(155, 142, '20201005152658-Rolex-86285.jpg', '2020-10-05 19:26:58', ''),
(156, 143, '20201005152910-Rolex-86285-1.jpg', '2020-10-05 19:29:10', ''),
(157, 144, '20201005154358-Rolex-86405-RBR.jpg', '2020-10-05 19:43:58', ''),
(158, 145, '20201005160123-Rolex-214270.jpg', '2020-10-05 20:01:23', ''),
(159, 146, '20201005160553-Rolex-216570-0001.jpg', '2020-10-05 20:05:53', ''),
(160, 147, '20201005161106-Rolex-216570-0002.jpg', '2020-10-05 20:11:06', ''),
(161, 148, '20201005161502-Rolex-214270.jpg', '2020-10-05 20:15:02', ''),
(162, 149, '20201005162146-Rolex-114060.jpg', '2020-10-05 20:21:46', ''),
(163, 150, '20201005162335-Rolex-116618-LN.jpg', '2020-10-05 20:23:35', ''),
(164, 151, '20201005163153-Rolex-116618-LB.jpg', '2020-10-05 20:31:53', ''),
(165, 152, '20201005163430-Rolex-116619-LB.jpg', '2020-10-05 20:34:30', ''),
(166, 153, '20201005163827-Rolex-116610-LN.jpg', '2020-10-05 20:38:27', ''),
(167, 154, '20201005164450-Rolex-116613-LB.jpg', '2020-10-05 20:44:50', ''),
(168, 155, '20201005164841-Rolex-116613-LN.jpg', '2020-10-05 20:48:41', ''),
(169, 156, '20201005165042-Rolex-116610-LV.jpg', '2020-10-05 20:50:42', ''),
(170, 157, '20201005165618-Rolex-116660-1.jpg', '2020-10-05 20:56:18', ''),
(171, 158, '20201005165817-Rolex-116660.jpg', '2020-10-05 20:58:17', ''),
(172, 159, '20201005170148-Rolex-116710-LN.jpg', '2020-10-05 21:01:48', ''),
(173, 160, '20201005170417-Rolex-116713-LN.jpg', '2020-10-05 21:04:17', ''),
(174, 161, '20201005170617-Rolex-116718-LN.jpg', '2020-10-05 21:06:17', ''),
(175, 162, '20201005170846-Rolex-116710-BLNR.jpg', '2020-10-05 21:08:46', ''),
(176, 163, '20201005172011-Rolex-116719-BLRO.jpg', '2020-10-05 21:20:11', ''),
(177, 164, '20201005172211-Rolex-116622.jpg', '2020-10-05 21:22:11', ''),
(178, 165, '20201005172609-Rolex-116655.jpg', '2020-10-05 21:26:09', ''),
(179, 166, '20201005174920-Rolex-268655.jpg', '2020-10-05 21:49:20', ''),
(180, 167, '20201005175225-Rolex-268622.jpg', '2020-10-05 21:52:25', ''),
(181, 168, '20201005175819-Rolex-268621.jpg', '2020-10-05 21:58:19', ''),
(182, 169, '20201005180011-Rolex-116621.jpg', '2020-10-05 22:00:11', ''),
(183, 170, '20201005180223-Rolex-116688.jpg', '2020-10-05 22:02:23', ''),
(184, 171, '20201005182108-Rolex-116689.jpg', '2020-10-05 22:21:08', ''),
(185, 172, '20201005182436-Rolex-116681.jpg', '2020-10-05 22:24:36', ''),
(186, 173, '20201005182757-Rolex-116680.jpg', '2020-10-05 22:27:57', ''),
(187, 174, '20201005183036-Rolex-116505-0001.jpg', '2020-10-05 22:30:36', ''),
(188, 175, '20201005183310-Rolex-116515-LN.jpg', '2020-10-05 22:33:10', ''),
(189, 176, '20201005183606-Rolex-116506-0001.jpg', '2020-10-05 22:36:06', ''),
(190, 177, '20201005185036-Rolex-116500-LN.jpg', '2020-10-05 22:50:36', ''),
(191, 178, '20201006105810-Rolex-116503.jpg', '2020-10-06 14:58:10', ''),
(194, 181, '20201006114152-Rolex-116519-LN.jpg', '2020-10-06 15:41:52', ''),
(195, 182, '20201006114703-Rolex-116509.jpg', '2020-10-06 15:47:03', ''),
(196, 183, '20201006114905-Rolex-116506-0002.jpg', '2020-10-06 15:49:05', ''),
(197, 184, '20201006115601-Rolex-116400-GV.jpg', '2020-10-06 15:56:01', ''),
(200, 187, '20201006121505-Rolex-116900.jpg', '2020-10-06 16:15:05', ''),
(201, 188, '20201006121825-Rolex-50535.jpg', '2020-10-06 16:18:25', ''),
(202, 189, '20201006122252-Rolex-50529.jpg', '2020-10-06 16:22:52', ''),
(203, 190, '20201006122603-Rolex-50525.jpg', '2020-10-06 16:26:03', ''),
(204, 191, '20201006125148-Rolex-50515.jpg', '2020-10-06 16:51:48', ''),
(205, 192, '20201006130020-Rolex-50509.jpg', '2020-10-06 17:00:20', ''),
(206, 193, '20201006130250-Rolex-50709-RBR.jpg', '2020-10-06 17:02:50', ''),
(207, 194, '20201006130534-Rolex-50505.jpg', '2020-10-06 17:05:34', ''),
(208, 195, '20201006130837-Rolex-50605-RBR.jpg', '2020-10-06 17:08:37', ''),
(209, 196, '20201006141121-Audemars-Piguet-25865BC-OO-1105BC-01.jpg', '2020-10-06 18:11:21', ''),
(210, 197, '20201006142436-Audemars-Piguet-25829ST-OO-0944ST-01.jpg', '2020-10-06 18:24:36', ''),
(211, 198, '20201006142626-Audemars-Piguet-25865BC-OO-1105BC-04.jpg', '2020-10-06 18:26:26', ''),
(212, 199, '20201006143120-Audemars-Piguet-26068BC-ZZ-D002CR-01.jpg', '2020-10-06 18:31:20', ''),
(213, 200, '20201006143417-Audemars-Piguet-26120BA-OO-D088CR-01.jpg', '2020-10-06 18:34:17', ''),
(214, 201, '20201006150246-Audemars-Piguet-26120OR-OO-D002CR-01.jpg', '2020-10-06 19:02:46', ''),
(215, 202, '20201006151038-Audemars-Piguet-26120ST-OO-1220ST-01.jpg', '2020-10-06 19:10:38', ''),
(216, 203, '20201006151244-Audemars-Piguet-26120ST-OO-1220ST-02.jpg', '2020-10-06 19:12:44', ''),
(217, 204, '20201006151349-Audemars-Piguet-26252OR-OO-D092CR-01.jpg', '2020-10-06 19:13:49', ''),
(218, 205, '20201006151913-Audemars-Piguet-15154BC-ZZ-D004CU-01.jpg', '2020-10-06 19:19:13', ''),
(219, 206, '20201006152107-Audemars-Piguet-15305OR-OO-D088CR-01.jpg', '2020-10-06 19:21:07', ''),
(220, 207, '20201006152238-Audemars-Piguet-15305ST-OO-1220ST-01.jpg', '2020-10-06 19:22:38', ''),
(221, 208, '20201006152653-Audemars-Piguet-26603ST-OO-D002CR-01.jpg', '2020-10-06 19:26:53', ''),
(222, 209, '20201006153139-Audemars-Piguet-26330OR-OO-D088CR-01.jpg', '2020-10-06 19:31:39', ''),
(223, 210, '20201006153701-Audemars-Piguet-26330ST-OO-1220ST-01.jpg', '2020-10-06 19:37:01', ''),
(224, 211, '20201006153924-Audemars-Piguet-25966BC-ZZ-1185BC-01.jpg', '2020-10-06 19:39:24', ''),
(225, 212, '20201006154315-Audemars-Piguet-25967BC-ZZ-1185BC-01.jpg', '2020-10-06 19:43:15', ''),
(226, 213, '20201006161443-Audemars-Piguet-25978BC-ZZ-1190BC-01.jpg', '2020-10-06 20:14:43', ''),
(227, 214, '20201006164432-Audemars-Piguet-26120ST-OO-1220ST-03.jpg', '2020-10-06 20:44:32', ''),
(228, 215, '20201006165233-Audemars-Piguet-26120OR-OO-D088CR-01.jpg', '2020-10-06 20:52:33', ''),
(229, 216, '20201006165547-Audemars-Piguet-26252OR-OO-D092CR-02.jpg', '2020-10-06 20:55:47', ''),
(230, 217, '20201006165850-Audemars-Piguet-25820ST-OO-0944ST-03.jpg', '2020-10-06 20:58:50', ''),
(231, 218, '20201006171311-Audemars-Piguet-25820ST-OO-0944ST-04.jpg', '2020-10-06 21:13:11', ''),
(232, 219, '20201006173655-Audemars-Piguet-25820ST-OO-0944ST-05.jpg', '2020-10-06 21:36:55', ''),
(233, 221, '20201006174207-Audemars-Piguet-25829OR-OO-0944OR-01.jpg', '2020-10-06 21:42:07', ''),
(234, 222, '20201006175144-Audemars-Piguet-25829PT-OO-0944PT-01.jpg', '2020-10-06 21:51:44', ''),
(235, 223, '20201006175546-Audemars-Piguet-15130BC-ZZ-8042BC-01.jpg', '2020-10-06 21:55:46', ''),
(236, 224, '20201006180033-Audemars-Piguet-15202OR-OO-1240OR-01.jpg', '2020-10-06 22:00:33', ''),
(237, 225, '20201006180821-Audemars-Piguet-15202ST-OO-1240ST-01.jpg', '2020-10-06 22:08:21', ''),
(238, 226, '20201006181944-Audemars-Piguet-15203PT-OO-1240PT-01.jpg', '2020-10-06 22:19:44', ''),
(239, 227, '20201006182410-Audemars-Piguet-15400OR-OO-1220OR-01.jpg', '2020-10-06 22:24:10', ''),
(240, 229, '20201006182931-Audemars-Piguet-15400OR-OO-1220OR-02.jpg', '2020-10-06 22:29:31', ''),
(241, 230, '20201006183212-Audemars-Piguet-15400OR-OO-D002CR-01.jpg', '2020-10-06 22:32:12', ''),
(242, 231, '20201006183416-Audemars-Piguet-15400ST-OO-1220ST-01.jpg', '2020-10-06 22:34:16', ''),
(243, 232, '20201007120113-Audemars-Piguet-15400ST-OO-1220ST-03.jpg', '2020-10-07 16:01:13', ''),
(244, 233, '20201007121201-Audemars-Piguet-15450OR-OO-D002CR-01.jpg', '2020-10-07 16:12:01', ''),
(245, 234, '20201007121440-Audemars-Piguet-15450OR-OO-D088CR-01.jpg', '2020-10-07 16:14:40', ''),
(246, 235, '20201007121922-Audemars-Piguet-15450ST-OO-1256ST-01.jpg', '2020-10-07 16:19:22', ''),
(247, 236, '20201007122251-Audemars-Piguet-15451OR-ZZ-1256OR-01.jpg', '2020-10-07 16:22:51', ''),
(248, 237, '20201007123202-Audemars-Piguet-15451ST-ZZ-1256ST-01.jpg', '2020-10-07 16:32:02', ''),
(249, 238, '20201007123440-Audemars-Piguet-15451ST-ZZ-D011CR-01.jpg', '2020-10-07 16:34:40', ''),
(250, 239, '20201007124339-Audemars-Piguet-15452BC-ZZ-D019CR-01.jpg', '2020-10-07 16:43:39', ''),
(251, 240, '20201007125006-Audemars-Piguet-15452OR-ZZ-D003CR-01.jpg', '2020-10-07 16:50:06', ''),
(252, 241, '20201007125239-Audemars-Piguet-25865ST-OO-1105ST-02.jpg', '2020-10-07 16:52:39', ''),
(253, 242, '20201007125829-Audemars-Piguet-25977OR-OO-D005CR-01.jpg', '2020-10-07 16:58:29', ''),
(254, 243, '20201007130543-Audemars-Piguet-25990OR-ZZ-D002CR-01.jpg', '2020-10-07 17:05:43', ''),
(255, 244, '20201007131903-Audemars-Piguet-26065IS-OO-D002CR-01.jpg', '2020-10-07 17:19:03', ''),
(256, 245, '20201007132705-Audemars-Piguet-26122OR-OO-D002CR-01.jpg', '2020-10-07 17:27:05', ''),
(257, 246, '20201007133247-Audemars-Piguet-26123OR-OO-D002CR-01.jpg', '2020-10-07 17:32:47', ''),
(258, 247, '20201007134108-Audemars-Piguet-26127OR-ZZ-D011CR-01.jpg', '2020-10-07 17:41:08', ''),
(259, 248, '20201007140359-Audemars-Piguet-26128OR-ZZ-D002CR-01.jpg', '2020-10-07 18:03:59', ''),
(260, 249, '20201007150317-Audemars-Piguet-26129OR-ZZ-D080CA-01.jpg', '2020-10-07 19:03:17', ''),
(261, 250, '20201007150652-Audemars-Piguet-26320OR-OO-1220OR-01.jpg', '2020-10-07 19:06:52', ''),
(262, 251, '20201007151008-Audemars-Piguet-26320OR-OO-1220OR-02.jpg', '2020-10-07 19:10:08', ''),
(263, 252, '20201007151543-Audemars-Piguet-26320OR-OO-D002CR-01.jpg', '2020-10-07 19:15:43', ''),
(264, 253, '20201007152554-Audemars-Piguet-26320OR-OO-D088CR-01.jpg', '2020-10-07 19:25:54', ''),
(265, 254, '20201007153155-Audemars-Piguet-26320ST-OO-1220ST-01.jpg', '2020-10-07 19:31:55', ''),
(266, 255, '20201007164837-Audemars-Piguet-26320ST-OO-1220ST-02.jpg', '2020-10-07 20:48:37', ''),
(267, 256, '20201007165326-Audemars-Piguet-26320ST-OO-1220ST-03.jpg', '2020-10-07 20:53:26', ''),
(268, 257, '20201007165836-Audemars-Piguet-26325OL-OO-D005CR-01.jpg', '2020-10-07 20:58:36', ''),
(269, 258, '20201007170609-Audemars-Piguet-26325PL-OO-D310CR-01.jpg', '2020-10-07 21:06:09', ''),
(270, 259, '20201007170839-Audemars-Piguet-26325TS-OO-D005CR-01.jpg', '2020-10-07 21:08:39', ''),
(271, 260, '20201007171755-Audemars-Piguet-26510OR-OO-1220OR-01.jpg', '2020-10-07 21:17:55', ''),
(272, 261, '20201007172040-Audemars-Piguet-26510ST-OO-1220ST-01.jpg', '2020-10-07 21:20:40', ''),
(273, 262, '20201007172357-Audemars-Piguet-26511PT-OO-1220PT-01.jpg', '2020-10-07 21:23:57', ''),
(274, 263, '20201007172741-Audemars-Piguet-26552BC-OO-D002CR-01.jpg', '2020-10-07 21:27:41', ''),
(275, 264, '20201007173014-Audemars-Piguet-26560IO-OO-D002CA-01.jpg', '2020-10-07 21:30:14', ''),
(276, 265, '20201007173148-Audemars-Piguet-26603OR-OO-D092CR-01.jpg', '2020-10-07 21:31:48', ''),
(277, 266, '20201007173743-Audemars-Piguet-67651OR-ZZ-D010CA-01.jpg', '2020-10-07 21:37:43', ''),
(278, 267, '20201007174440-Audemars-Piguet-67651OR-ZZ-D080CA-01.jpg', '2020-10-07 21:44:40', ''),
(279, 268, '20201007174758-Audemars-Piguet-67651ST-ZZ-1261ST-01.jpg', '2020-10-07 21:47:58', ''),
(280, 269, '20201007175100-Audemars-Piguet-67651ST-ZZ-D002CR-01.jpg', '2020-10-07 21:51:00', ''),
(281, 270, '20201007175530-Audemars-Piguet-67651ST-ZZ-D011CR-01.jpg', '2020-10-07 21:55:30', ''),
(282, 271, '20201007175900-Audemars-Piguet-15400OR-OO-D088CR-01.jpg', '2020-10-07 21:59:00', ''),
(283, 272, '20201007180339-Audemars-Piguet-25866PT-OO-D002CR-01.jpg', '2020-10-07 22:03:39', ''),
(284, 273, '20201007180628-Audemars-Piguet-25996PT-OO-D002CR-01.jpg', '2020-10-07 22:06:28', ''),
(285, 274, '20201007184827-Audemars-Piguet-26003OR-OO-D088CR-01.jpg', '2020-10-07 22:48:27', ''),
(286, 275, '20201007191006-Audemars-Piguet-26003BC-OO-D002CR-01.jpg', '2020-10-07 23:10:06', ''),
(287, 276, '20201007191205-Audemars-Piguet-26003BA-OO-D088CR-01.jpg', '2020-10-07 23:12:05', ''),
(288, 277, '20201007191727-Audemars-Piguet-26003OR-OO-D002CR-01.jpg', '2020-10-07 23:17:27', ''),
(289, 278, '20201007192010-Audemars-Piguet-26053PT-OO-D002CR-01.jpg', '2020-10-07 23:20:10', ''),
(290, 279, '20201007192235-Audemars-Piguet-26153PT-OO-D028CR-01.jpg', '2020-10-07 23:22:35', ''),
(291, 280, '20201007192537-Audemars-Piguet-26353PT-OO-D028CR-01.jpg', '2020-10-07 23:25:37', ''),
(292, 281, '20201007192813-Audemars-Piguet-26356PT-OO-D028CR-01.jpg', '2020-10-07 23:28:13', ''),
(293, 282, '20201007193048-Audemars-Piguet-26390OR-OO-D088CR-01.jpg', '2020-10-07 23:30:48', ''),
(294, 283, '20201007193505-Audemars-Piguet-26390OR-OO-D093CR-01.jpg', '2020-10-07 23:35:05', ''),
(295, 284, '20201008110643-Audemars-Piguet-26100BC-OO-D002CR-01.jpg', '2020-10-08 15:06:43', ''),
(296, 285, '20201008120350-Audemars-Piguet-26100OR-OO-D088CR-01.jpg', '2020-10-08 16:03:50', ''),
(297, 286, '20201008121515-Audemars-Piguet-15180OR-OO-A088CR-01.jpg', '2020-10-08 16:15:15', ''),
(298, 287, '20201008121746-Audemars-Piguet-15180OR-OO-A002CR-01.jpg', '2020-10-08 16:17:46', ''),
(299, 288, '20201008122011-Audemars-Piguet-15159BC-ZZ-D002CR-01.jpg', '2020-10-08 16:20:11', ''),
(300, 289, '20201008122305-Audemars-Piguet-15159OR-ZZ-D002CR-01.jpg', '2020-10-08 16:23:05', ''),
(301, 290, '20201008123116-Audemars-Piguet-15170BC-OO-A002CR-01.jpg', '2020-10-08 16:31:16', ''),
(302, 291, '20201008123450-Audemars-Piguet-15170OR-OO-A002CR-01.jpg', '2020-10-08 16:34:50', ''),
(303, 292, '20201008123735-Audemars-Piguet-15170OR-OO-A002CR-01.jpg', '2020-10-08 16:37:35', ''),
(304, 293, '20201008124050-Audemars-Piguet-15171BC-ZZ-A002CR-01.jpg', '2020-10-08 16:40:50', ''),
(305, 294, '20201008124637-Audemars-Piguet-15171OR-ZZ-A002CR-01.jpg', '2020-10-08 16:46:37', ''),
(306, 295, '20201008124930-Audemars-Piguet-15171OR-ZZ-A088CR-01.jpg', '2020-10-08 16:49:30', ''),
(307, 296, '20201008125202-Audemars-Piguet-15180BC-OO-A002CR-01.jpg', '2020-10-08 16:52:02', ''),
(308, 297, '20201008125857-Audemars-Piguet-25866BA-OO-D002CR-01.jpg', '2020-10-08 16:58:57', ''),
(309, 298, '20201008130423-Audemars-Piguet-25866BA-OO-D002CR-02.jpg', '2020-10-08 17:04:23', ''),
(310, 299, '20201008131458-Audemars-Piguet-25866OR-OO-D002CR-01.jpg', '2020-10-08 17:14:58', ''),
(311, 300, '20201008132227-Audemars-Piguet-25866OR-OO-D002CR-02.jpg', '2020-10-08 17:22:27', ''),
(312, 301, '20201008132720-Audemars-Piguet-25866PT-OO-D002CR-02.jpg', '2020-10-08 17:27:20', ''),
(313, 302, '20201008140704-Audemars-Piguet-26153OR-OO-D088CR-01.jpg', '2020-10-08 18:07:04', ''),
(314, 303, '20201008143623-Audemars-Piguet-26380BC-OO-D002CR-01.jpg', '2020-10-08 18:36:23', ''),
(315, 304, '20201008143840-Audemars-Piguet-26380OR-OO-D002CR-01.jpg', '2020-10-08 18:38:40', ''),
(316, 305, '20201008144444-Audemars-Piguet-26380OR-OO-D088CR-01.jpg', '2020-10-08 18:44:44', ''),
(317, 306, '20201008144916-Audemars-Piguet-26385OR-OO-A088CR-01.jpg', '2020-10-08 18:49:16', ''),
(318, 307, '20201008145708-Audemars-Piguet-26391OR-OO-D088CR-01.jpg', '2020-10-08 18:57:08', ''),
(319, 308, '20201008150027-Audemars-Piguet-26559OR-OO-D002CR-01.jpg', '2020-10-08 19:00:27', ''),
(320, 309, '20201008150419-Audemars-Piguet-26559OR-OO-D088CR-01.jpg', '2020-10-08 19:04:19', ''),
(321, 310, '20201008150635-Audemars-Piguet-26561BC-OO-D002CR-01.jpg', '2020-10-08 19:06:35', ''),
(322, 311, '20201008151001-Audemars-Piguet-26561OR-OO-D088CR-01.jpg', '2020-10-08 19:10:01', ''),
(323, 312, '20201008151221-Audemars-Piguet-26569BC-OO-D002CR-01.jpg', '2020-10-08 19:12:21', ''),
(324, 313, '20201008151901-Audemars-Piguet-77238BC-OO-A002CR-01.jpg', '2020-10-08 19:19:01', ''),
(325, 314, '20201008152147-Audemars-Piguet-77238OR-OO-A088CR-01.jpg', '2020-10-08 19:21:47', ''),
(326, 315, '20201008153027-Audemars-Piguet-77239BC-ZZ-A002CR-01.jpg', '2020-10-08 19:30:27', ''),
(327, 316, '20201008153426-Audemars-Piguet-77239OR-ZZ-A088CR-01.jpg', '2020-10-08 19:34:26', ''),
(328, 317, '20201008153633-Audemars-Piguet-77240BC-ZZ-A808CR-01.jpg', '2020-10-08 19:36:33', ''),
(329, 318, '20201008154253-Audemars-Piguet-77251OR-ZZ-1270OR-01.jpg', '2020-10-08 19:42:53', ''),
(330, 319, '20201008154547-Audemars-Piguet-26569OR-OO-D088CR-01.jpg', '2020-10-08 19:45:47', ''),
(331, 320, '20201008155651-Audemars-Piguet-26357PT-ZZ-D028CR-01.jpg', '2020-10-08 19:56:51', ''),
(332, 321, '20201008160555-Audemars-Piguet-26083BC-ZZ-D102CR-01.jpg', '2020-10-08 20:05:55', ''),
(333, 322, '20201008161308-Audemars-Piguet-26051PT-00-D092CR-01.jpg', '2020-10-08 20:13:08', ''),
(334, 323, '20201008161548-Audemars-Piguet-15160PT-OO-A092CR-01.jpg', '2020-10-08 20:15:48', ''),
(335, 324, '20201008161804-Audemars-Piguet-15335OR-OO-A092CR-01.jpg', '2020-10-08 20:18:04', ''),
(336, 325, '20201008161946-Audemars-Piguet-15337OR-ZZ-A810CR-01.jpg', '2020-10-08 20:19:46', ''),
(337, 326, '20201008162320-Audemars-Piguet-26564IC-OO-D002CR-01.jpg', '2020-10-08 20:23:20', ''),
(338, 327, '20201008164957-Audemars-Piguet-25712BA-OO-0000xx-01.jpg', '2020-10-08 20:49:57', ''),
(339, 328, '20201008165400-Audemars-Piguet-25701BA-OO-0000XX-02.jpg', '2020-10-08 20:54:00', ''),
(340, 329, '20201008165653-Audemars-Piguet-25712PT-OO-0000xx-01.jpg', '2020-10-08 20:56:53', ''),
(341, 330, '20201008165844-Audemars-Piguet-25701OR-OO-0000XX-03.jpg', '2020-10-08 20:58:44', ''),
(342, 331, '20201008170357-Audemars-Piguet-15327BC-ZZ-D022CR-01.jpg', '2020-10-08 21:03:57', ''),
(343, 332, '20201008170945-Audemars-Piguet-26145OR-OO-D093CR-01.jpg', '2020-10-08 21:09:45', ''),
(344, 333, '20201008171313-Audemars-Piguet-26145OR-OO-D095CR-01.jpg', '2020-10-08 21:13:13', ''),
(345, 334, '20201008171622-Audemars-Piguet-15350OR-OO-D093CR-01.jpg', '2020-10-08 21:16:22', ''),
(346, 335, '20201008173456-Audemars-Piguet-15350ST-OO-D002CR-01.jpg', '2020-10-08 21:34:56', ''),
(347, 336, '20201008173847-Audemars-Piguet-26354OR-ZZ-D002CR-01.jpg', '2020-10-08 21:38:47', ''),
(348, 337, '20201008174146-Audemars-Piguet-26371TI-OO-D002CR-01.jpg', '2020-10-08 21:41:46', ''),
(349, 338, '20201008181121-Audemars-Piguet-77316BC-ZZ-D007SU-01.jpg', '2020-10-08 22:11:21', ''),
(350, 339, '20201008181931-Audemars-Piguet-77315BC-ZZ-D007SU-01.jpg', '2020-10-08 22:19:31', ''),
(351, 340, '20201008182427-Audemars-Piguet-77315OR-ZZ-D013SU-01.jpg', '2020-10-08 22:24:27', ''),
(352, 341, '20201130123538-Audemars-Piguet-77301OR-ZZ-D015CR-01.jpg', '2020-10-09 15:08:35', ''),
(353, 342, '20201130130534-Audemars-Piguet-77301ST-ZZ-D002CR-01.jpg', '2020-10-09 15:11:24', ''),
(354, 343, '20201130130801-Audemars-Piguet-77301ST-ZZ-D015CR-01.jpg', '2020-10-09 15:16:34', ''),
(355, 344, '20201130142929-Audemars-Piguet-77302BC-ZZ-D001CR-01.jpg', '2020-10-09 15:19:29', ''),
(356, 345, '20201130143200-Audemars-Piguet-77303BC-ZZ-D007SU-01.jpg', '2020-10-09 15:22:08', ''),
(357, 346, '20201130143950-Audemars-Piguet-77303OR-ZZ-D009SU-01.jpg', '2020-10-09 15:26:56', ''),
(358, 347, '20201009113102-Audemars-Piguet-77306BC-ZZ-D007SU-01.jpg', '2020-10-09 15:31:02', ''),
(359, 348, '20201009113350-Audemars-Piguet-26354OR-ZZ-D088CR-01.jpg', '2020-10-09 15:33:50', ''),
(360, 349, '20201201181930-download - 2020-12-01T181924.802.jpg', '2020-10-09 15:43:18', ''),
(361, 350, '20201201181842-download - 2020-12-01T181836.225.jpg', '2020-10-09 15:51:26', ''),
(362, 351, '20201201181826-download - 2020-12-01T181819.104.jpg', '2020-10-09 15:59:39', ''),
(363, 352, '20201201181811-download - 2020-12-01T181802.107.jpg', '2020-10-09 16:05:13', ''),
(364, 353, '20201201181753-download - 2020-12-01T181745.365.jpg', '2020-10-09 16:08:40', ''),
(365, 354, '20201201181737-download - 2020-12-01T181728.631.jpg', '2020-10-09 16:13:48', ''),
(366, 355, '20201201181652-download - 2020-12-01T181644.265.jpg', '2020-10-09 16:16:15', ''),
(367, 356, '20201201181626-download - 2020-12-01T181616.489.jpg', '2020-10-09 16:19:17', ''),
(368, 357, '20201201180807-download - 2020-12-01T180756.359.jpg', '2020-10-09 16:21:35', ''),
(369, 358, '20201201180747-download - 2020-12-01T180741.591.jpg', '2020-10-09 16:32:00', ''),
(370, 359, '20201201180728-download - 2020-12-01T180721.205.jpg', '2020-10-09 16:33:53', ''),
(371, 360, '20201201180449-download - 2020-12-01T180442.241.jpg', '2020-10-09 16:35:59', ''),
(372, 361, '20201201180433-download - 2020-12-01T180427.028.jpg', '2020-10-09 16:38:34', ''),
(373, 362, '20201201180418-download - 2020-12-01T180410.312.jpg', '2020-10-09 16:44:42', ''),
(374, 363, '20201201180358-download - 2020-12-01T180351.492.jpg', '2020-10-09 16:47:30', ''),
(375, 364, '20201201180127-download - 2020-12-01T180120.220.jpg', '2020-10-09 16:51:31', ''),
(376, 365, '20201201180111-download - 2020-12-01T180104.941.jpg', '2020-10-09 16:53:22', ''),
(377, 366, '20201201180038-download - 2020-12-01T180032.776.jpg', '2020-10-09 19:58:26', ''),
(378, 367, '20201201175933-download - 2020-12-01T175924.924.jpg', '2020-10-09 20:03:05', ''),
(379, 368, '20201201175914-download - 2020-12-01T175906.737.jpg', '2020-10-09 20:08:42', ''),
(380, 369, '20201201175857-download - 2020-12-01T175850.766.jpg', '2020-10-09 20:16:50', ''),
(381, 370, '20201201175711-download - 2020-12-01T175704.754.jpg', '2020-10-09 20:24:45', ''),
(382, 371, '20201201175654-download - 2020-12-01T175649.416.jpg', '2020-10-09 20:30:51', ''),
(383, 372, '20201201175639-download - 2020-12-01T175625.298.jpg', '2020-10-09 20:37:51', ''),
(384, 373, '20201201175604-download - 2020-12-01T175559.131.jpg', '2020-10-09 20:43:11', ''),
(385, 374, '20201201175551-download - 2020-12-01T175546.560.jpg', '2020-10-09 20:45:29', ''),
(386, 375, '20201201175538-download - 2020-12-01T175530.959.jpg', '2020-10-09 20:51:31', ''),
(387, 376, '20201201175522-download - 2020-12-01T175515.191.jpg', '2020-10-09 21:11:14', ''),
(388, 377, '20201201175506-download - 2020-12-01T175454.706.jpg', '2020-10-09 21:16:28', ''),
(389, 378, '20201201175437-download - 2020-12-01T175431.036.jpg', '2020-10-09 21:47:48', ''),
(390, 379, '20201201175420-download - 2020-12-01T175413.975.jpg', '2020-10-09 21:50:04', ''),
(391, 380, '20201201175312-download - 2020-12-01T175305.237.jpg', '2020-10-09 22:01:27', ''),
(392, 381, '20201201175256-download - 2020-12-01T175251.367.jpg', '2020-10-09 22:04:32', ''),
(393, 382, '20201201175243-download - 2020-12-01T175237.946.jpg', '2020-10-09 22:27:11', ''),
(394, 383, '20201201175227-download - 2020-12-01T175222.353.jpg', '2020-10-09 22:28:59', ''),
(395, 384, '20201201175213-download - 2020-12-01T175208.092.jpg', '2020-10-09 22:31:30', ''),
(396, 385, '20201201175200-download - 2020-12-01T175153.082.jpg', '2020-10-09 22:33:18', ''),
(397, 386, '20201201174158-download - 2020-12-01T174152.052.jpg', '2020-10-09 22:38:15', ''),
(398, 387, '20201201174143-download - 2020-12-01T174138.063.jpg', '2020-10-09 22:41:22', ''),
(399, 388, '20201201174129-images (20).jpg', '2020-10-09 22:44:27', ''),
(400, 389, '20201201174112-download - 2020-12-01T174101.323.jpg', '2020-10-09 22:47:27', ''),
(401, 390, '20201201173347-download - 2020-12-01T173338.069.jpg', '2020-10-09 22:49:49', ''),
(402, 391, '20201201173327-download - 2020-12-01T173321.305.jpg', '2020-10-09 22:58:32', ''),
(403, 392, '20201201173312-download - 2020-12-01T173303.659.jpg', '2020-10-12 14:49:43', ''),
(404, 393, '20201201173254-images (19).jpg', '2020-10-12 14:51:48', ''),
(405, 394, '20201201173235-images (18).jpg', '2020-10-12 14:57:30', ''),
(406, 395, '20201201173214-download - 2020-12-01T173208.591.jpg', '2020-10-12 15:03:43', ''),
(407, 396, '20201201173158-download - 2020-12-01T173152.068.jpg', '2020-10-12 15:08:37', ''),
(408, 397, '20201201173135-download - 2020-12-01T173125.457.jpg', '2020-10-12 15:11:42', ''),
(409, 398, '20201201173115-download - 2020-12-01T173107.963.jpg', '2020-10-12 15:13:54', ''),
(410, 399, '20201201173058-download - 2020-12-01T173051.515.jpg', '2020-10-12 15:16:43', ''),
(411, 400, '20201201172155-images (17).jpg', '2020-10-12 15:39:39', ''),
(412, 401, '20201201172137-download - 2020-12-01T172129.791.jpg', '2020-10-12 15:43:30', ''),
(413, 402, '20201201172120-download - 2020-12-01T172113.533.jpg', '2020-10-12 15:47:26', ''),
(414, 403, '20201201172058-download - 2020-12-01T172045.706.jpg', '2020-10-12 15:50:05', ''),
(415, 405, '20201201172019-download - 2020-12-01T172010.806.jpg', '2020-10-12 15:52:51', ''),
(416, 406, '20201201171958-download - 2020-12-01T171947.402.jpg', '2020-10-12 15:54:37', ''),
(417, 407, '20201201171931-download - 2020-12-01T171926.162.jpg', '2020-10-12 15:56:41', ''),
(418, 408, '20201201171915-download - 2020-12-01T171909.635.jpg', '2020-10-12 16:00:10', ''),
(419, 409, '20201201171858-download - 2020-12-01T171852.431.jpg', '2020-10-12 16:02:25', ''),
(420, 410, '20201201171741-download - 2020-12-01T171735.956.jpg', '2020-10-12 16:05:35', ''),
(421, 411, '20201201171726-download - 2020-12-01T171719.478.jpg', '2020-10-12 16:09:21', ''),
(422, 412, '20201201171708-download - 2020-12-01T171654.704.jpg', '2020-10-12 16:13:34', ''),
(423, 413, '20201201171643-download - 2020-12-01T171637.574.jpg', '2020-10-12 16:15:25', ''),
(424, 414, '20201201171628-download - 2020-12-01T171621.359.jpg', '2020-10-12 16:17:04', ''),
(425, 415, '20201201171611-download - 2020-12-01T171605.095.jpg', '2020-10-12 16:19:13', ''),
(426, 416, '20201201171556-download - 2020-12-01T171548.309.jpg', '2020-10-12 16:26:39', ''),
(427, 417, '20201201171420-download - 2020-12-01T171414.000.jpg', '2020-10-12 16:30:27', ''),
(428, 418, '20201201171352-download - 2020-12-01T171344.009.jpg', '2020-10-12 16:32:13', ''),
(429, 419, '20201201171333-download - 2020-12-01T171326.641.jpg', '2020-10-12 16:42:12', ''),
(430, 420, '20201201171246-download - 2020-12-01T171239.724.jpg', '2020-10-12 16:44:19', ''),
(431, 421, '20201201171229-download - 2020-12-01T171223.623.jpg', '2020-10-12 16:46:26', ''),
(432, 422, '20201201171215-download - 2020-12-01T171205.124.jpg', '2020-10-12 16:48:21', ''),
(433, 423, '20201201171156-download - 2020-12-01T171141.875.jpg', '2020-10-12 16:53:28', ''),
(434, 424, '20201201171131-images (15).jpg', '2020-10-12 16:57:35', ''),
(435, 425, '20201201171116-download - 2020-12-01T171109.823.jpg', '2020-10-12 17:05:59', ''),
(436, 426, '20201201171058-download - 2020-12-01T171051.761.jpg', '2020-10-12 17:07:48', ''),
(437, 427, '20201201171037-download - 2020-12-01T171029.509.jpg', '2020-10-12 17:11:35', ''),
(438, 428, '20201201171002-download - 2020-12-01T170953.893.jpg', '2020-10-12 17:14:13', ''),
(439, 429, '20201201170935-download - 2020-12-01T170927.301.jpg', '2020-10-12 18:48:16', ''),
(440, 430, '20201201165524-download - 2020-12-01T165516.723.jpg', '2020-10-12 18:53:33', ''),
(441, 431, '20201201165507-download - 2020-12-01T165459.420.jpg', '2020-10-12 19:00:52', ''),
(442, 432, '20201201165449-download - 2020-12-01T165441.971.jpg', '2020-10-12 19:04:29', ''),
(443, 433, '20201201165427-download - 2020-12-01T165420.183.jpg', '2020-10-12 19:19:22', ''),
(444, 434, '20201201165409-download - 2020-12-01T165350.747.jpg', '2020-10-12 19:23:08', ''),
(445, 435, '20201201165334-download - 2020-12-01T165327.445.jpg', '2020-10-12 19:31:16', ''),
(446, 436, '20201201165318-download - 2020-12-01T165311.902.jpg', '2020-10-12 19:42:52', ''),
(447, 437, '20201201165302-download - 2020-12-01T165255.218.jpg', '2020-10-12 19:49:18', ''),
(448, 438, '20201201165244-download - 2020-12-01T165239.044.jpg', '2020-10-12 19:51:48', ''),
(449, 439, '20201201165231-download - 2020-12-01T165222.107.jpg', '2020-10-12 19:59:12', ''),
(450, 440, '20201201165008-download - 2020-12-01T165001.689.jpg', '2020-10-12 20:48:52', ''),
(451, 441, '20201201164953-download - 2020-12-01T164935.101.jpg', '2020-10-12 20:50:44', ''),
(452, 442, '20201201164941-download - 2020-12-01T164935.101.jpg', '2020-10-12 20:57:32', ''),
(453, 443, '20201201164742-download - 2020-12-01T164735.344.jpg', '2020-10-12 20:59:40', ''),
(454, 444, '20201201164715-images (14).jpg', '2020-10-12 21:03:03', ''),
(455, 445, '20201201164655-download - 2020-12-01T164642.003.jpg', '2020-10-12 21:11:15', ''),
(456, 446, '20201201164632-download - 2020-12-01T164624.245.jpg', '2020-10-12 21:13:25', ''),
(457, 447, '20201201164615-download - 2020-12-01T164607.512.jpg', '2020-10-12 21:20:57', ''),
(458, 448, '20201201164557-download - 2020-12-01T164549.610.jpg', '2020-10-12 21:23:36', ''),
(459, 449, '20201201164429-download - 2020-12-01T164423.273.jpg', '2020-10-12 21:33:18', ''),
(460, 450, '20201201164321-images (13).jpg', '2020-10-13 14:33:16', ''),
(461, 451, '20201201164251-images (12).jpg', '2020-10-13 14:44:03', ''),
(462, 452, '20201201164234-download - 2020-12-01T164223.665.jpg', '2020-10-13 14:50:04', ''),
(463, 453, '20201201164206-download - 2020-12-01T164158.638.jpg', '2020-10-13 14:54:38', ''),
(464, 454, '20201201164146-download - 2020-12-01T164138.339.jpg', '2020-10-13 14:59:33', ''),
(465, 455, '20201201164125-download - 2020-12-01T164119.945.jpg', '2020-10-13 15:05:22', ''),
(466, 456, '20201201164110-download - 2020-12-01T163912.592.jpg', '2020-10-13 15:08:08', ''),
(467, 457, '20201201163901-download - 2020-12-01T163855.906.jpg', '2020-10-13 15:18:15', ''),
(468, 458, '20201201163846-download - 2020-12-01T163838.865.jpg', '2020-10-13 15:26:16', ''),
(469, 459, '20201201163829-download - 2020-12-01T163819.275.jpg', '2020-10-13 15:30:53', ''),
(470, 460, '20201201163247-download - 2020-12-01T163239.884.jpg', '2020-10-13 15:55:38', ''),
(471, 461, '20201201163227-download - 2020-12-01T163216.930.jpg', '2020-10-13 16:08:01', ''),
(472, 462, '20201201163201-download - 2020-12-01T163156.389.jpg', '2020-10-13 16:27:15', ''),
(473, 463, '20201201163141-download - 2020-12-01T163132.651.jpg', '2020-10-13 16:33:17', ''),
(474, 464, '20201201163121-download - 2020-12-01T163112.338.jpg', '2020-10-13 16:35:10', ''),
(475, 465, '20201201163102-download - 2020-12-01T163052.070.jpg', '2020-10-13 16:37:27', ''),
(476, 466, '20201201163042-download - 2020-12-01T163033.723.jpg', '2020-10-13 16:40:32', ''),
(477, 467, '20201201163021-download - 2020-12-01T163010.711.jpg', '2020-10-13 16:42:56', ''),
(478, 468, '20201201163001-download - 2020-12-01T162953.651.jpg', '2020-10-13 17:11:27', ''),
(479, 469, '20201201162943-download - 2020-12-01T162936.718.jpg', '2020-10-13 17:14:29', ''),
(480, 470, '20201201162705-download - 2020-12-01T162700.402.jpg', '2020-10-13 17:20:03', ''),
(481, 471, '20201201162650-download - 2020-12-01T162645.378.jpg', '2020-10-13 17:52:56', ''),
(482, 472, '20201201162634-download - 2020-12-01T162629.170.jpg', '2020-10-13 18:03:11', ''),
(483, 473, '20201201162610-images (11).jpg', '2020-10-13 18:05:36', ''),
(484, 474, '20201201162555-images (10).jpg', '2020-10-13 18:13:28', ''),
(485, 475, '20201201162539-download - 2020-12-01T162531.919.jpg', '2020-10-13 18:15:26', ''),
(486, 476, '20201201162517-download - 2020-12-01T162512.939.jpg', '2020-10-13 18:21:32', ''),
(487, 477, '20201201162502-download - 2020-12-01T162457.899.jpg', '2020-10-13 18:54:49', ''),
(488, 478, '20201201162447-download - 2020-12-01T162441.115.jpg', '2020-10-13 19:00:00', ''),
(489, 479, '20201201162431-download - 2020-12-01T162425.041.jpg', '2020-10-13 19:02:46', ''),
(490, 480, '20201201162352-download - 2020-12-01T162345.260.jpg', '2020-10-13 19:05:53', ''),
(491, 481, '20201201162333-download - 2020-12-01T162326.494.jpg', '2020-10-13 19:08:05', ''),
(492, 482, '20201201162315-download - 2020-12-01T162307.698.jpg', '2020-10-13 19:11:08', ''),
(493, 483, '20201201162258-download - 2020-12-01T162254.322.jpg', '2020-10-13 19:13:48', ''),
(494, 484, '20201201162240-download - 2020-12-01T162230.119.jpg', '2020-10-13 19:15:59', ''),
(495, 485, '20201201162219-download - 2020-12-01T162206.191.jpg', '2020-10-13 19:19:51', ''),
(496, 486, '20201201162153-download - 2020-12-01T162146.117.jpg', '2020-10-13 19:24:40', ''),
(497, 487, '20201201162136-download - 2020-12-01T162125.920.jpg', '2020-10-13 19:26:52', ''),
(498, 488, '20201201162058-download - 2020-12-01T162048.400.jpg', '2020-10-13 19:37:31', ''),
(499, 489, '20201201162039-download - 2020-12-01T162031.256.jpg', '2020-10-13 19:40:19', ''),
(500, 490, '20201201161929-download - 2020-12-01T161920.085.jpg', '2020-10-13 19:42:22', ''),
(501, 491, '20201201161910-download - 2020-12-01T161902.950.jpg', '2020-10-13 19:45:48', ''),
(502, 492, '20201201161854-download - 2020-12-01T161849.139.jpg', '2020-10-13 20:06:48', ''),
(503, 493, '20201201161837-download - 2020-12-01T161832.237.jpg', '2020-10-13 20:11:55', ''),
(504, 494, '20201201161822-download - 2020-12-01T161805.306.jpg', '2020-10-13 20:14:50', ''),
(505, 495, '20201201161754-images (9).jpg', '2020-10-13 20:18:39', ''),
(506, 496, '20201201161738-download - 2020-12-01T161732.613.jpg', '2020-10-13 20:20:44', ''),
(507, 497, '20201201161722-download - 2020-12-01T161715.927.jpg', '2020-10-13 20:27:50', ''),
(508, 498, '20201201161706-download - 2020-12-01T161700.226.jpg', '2020-10-13 20:30:11', ''),
(509, 499, '20201201161649-download - 2020-12-01T161637.174.jpg', '2020-10-13 20:36:05', ''),
(510, 500, '20201201161508-download - 2020-12-01T161442.399.jpg', '2020-10-13 20:39:32', ''),
(511, 501, '20201201161452-download - 2020-12-01T161442.399.jpg', '2020-10-13 20:41:38', ''),
(512, 502, '20201201161433-download - 2020-12-01T161426.031.jpg', '2020-10-13 20:47:14', ''),
(513, 503, '20201201161415-download - 2020-12-01T161408.290.jpg', '2020-10-13 20:50:12', ''),
(514, 504, '20201201161358-download - 2020-12-01T161349.989.jpg', '2020-10-13 20:52:55', ''),
(515, 505, '20201201161339-download - 2020-12-01T161329.866.jpg', '2020-10-13 20:57:52', ''),
(516, 506, '20201201161312-download - 2020-12-01T161303.918.jpg', '2020-10-13 21:03:17', ''),
(517, 507, '20201201161254-download - 2020-12-01T161246.583.jpg', '2020-10-13 21:06:03', ''),
(518, 508, '20201201161219-download - 2020-12-01T161211.779.jpg', '2020-10-13 21:09:47', ''),
(519, 509, '20201201161152-download - 2020-12-01T161144.557.jpg', '2020-10-14 15:03:02', ''),
(520, 510, '20201201161108-download - 2020-12-01T161101.362.jpg', '2020-10-14 15:10:44', ''),
(521, 511, '20201201161052-download - 2020-12-01T161040.602.jpg', '2020-10-14 15:26:47', ''),
(522, 512, '20201201161031-download - 2020-12-01T161024.652.jpg', '2020-10-14 15:34:03', ''),
(523, 513, '20201201161015-download - 2020-12-01T160939.959.jpg', '2020-10-14 15:41:33', ''),
(524, 514, '20201201160947-download - 2020-12-01T160939.959.jpg', '2020-10-14 15:49:24', ''),
(525, 515, '20201201160930-download - 2020-12-01T160925.345.jpg', '2020-10-14 15:56:33', ''),
(526, 516, '20201201160913-download - 2020-12-01T160907.255.jpg', '2020-10-14 16:16:46', ''),
(527, 517, '20201201160856-download - 2020-12-01T160846.662.jpg', '2020-10-14 16:50:22', ''),
(528, 518, '20201201160834-download - 2020-12-01T160827.846.jpg', '2020-10-14 16:52:13', ''),
(529, 519, '20201201160818-download - 2020-12-01T160810.828.jpg', '2020-10-14 17:00:25', ''),
(530, 520, '20201201154429-download - 2020-12-01T154422.948.jpg', '2020-10-14 17:02:14', ''),
(531, 521, '20201201154414-download - 2020-12-01T154405.136.jpg', '2020-10-14 17:03:54', ''),
(532, 522, '20201201154355-download (100).jpg', '2020-10-14 17:06:17', ''),
(533, 523, '20201201154332-download (99).jpg', '2020-10-14 17:09:43', ''),
(534, 524, '20201201154312-download (98).jpg', '2020-10-14 17:11:53', ''),
(535, 525, '20201201154257-download (98).jpg', '2020-10-14 17:13:44', ''),
(536, 526, '20201201154140-download (97).jpg', '2020-10-14 17:20:54', ''),
(537, 527, '20201201153648-download (96).jpg', '2020-10-14 18:02:21', ''),
(538, 528, '20201201153546-download (95).jpg', '2020-10-14 18:04:31', ''),
(539, 529, '20201201153421-download (94).jpg', '2020-10-14 18:15:34', ''),
(540, 530, '20201201152235-download (93).jpg', '2020-10-14 18:18:06', ''),
(541, 531, '20201201152218-download (92).jpg', '2020-10-14 20:28:17', ''),
(542, 532, '20201201152154-download (91).jpg', '2020-10-14 20:33:28', ''),
(543, 533, '20201201152137-download (90).jpg', '2020-10-14 20:49:56', ''),
(544, 534, '20201201152121-download (89).jpg', '2020-10-14 20:52:06', ''),
(545, 535, '20201201152100-download (88).jpg', '2020-10-14 20:56:06', ''),
(546, 536, '20201201152032-download (87).jpg', '2020-10-14 21:00:50', ''),
(547, 537, '20201201152007-download (86).jpg', '2020-10-14 21:15:27', ''),
(548, 538, '20201201151944-download (85).jpg', '2020-10-14 21:31:26', ''),
(549, 539, '20201201151925-download (84).jpg', '2020-10-14 21:36:43', ''),
(550, 540, '20201201151730-download (83).jpg', '2020-10-14 21:39:13', ''),
(551, 541, '20201201151709-download (82).jpg', '2020-10-14 21:42:02', ''),
(552, 542, '20201201151646-download (81).jpg', '2020-10-14 21:44:31', ''),
(553, 543, '20201201151626-download (80).jpg', '2020-10-14 21:48:08', ''),
(554, 544, '20201201151606-download (79).jpg', '2020-10-14 21:57:27', ''),
(555, 545, '20201201151539-download (78).jpg', '2020-10-14 21:59:16', ''),
(556, 546, '20201201151520-download (77).jpg', '2020-10-14 22:30:37', ''),
(557, 547, '20201201151406-download (76).jpg', '2020-10-14 22:33:33', ''),
(558, 548, '20201201151343-download (75).jpg', '2020-10-14 22:35:16', ''),
(559, 549, '20201201151320-download (74).jpg', '2020-10-14 22:37:21', ''),
(560, 550, '20201201151231-download (73).jpg', '2020-10-14 22:39:04', ''),
(561, 551, '20201201151211-download (72).jpg', '2020-10-14 22:40:51', ''),
(562, 552, '20201201151151-download (71).jpg', '2020-10-14 22:43:18', ''),
(563, 553, '20201201151116-download (70).jpg', '2020-10-14 22:47:37', ''),
(564, 554, '20201201151053-download (69).jpg', '2020-10-14 22:51:33', ''),
(565, 555, '20201201151026-download (68).jpg', '2020-10-14 23:08:57', ''),
(566, 556, '20201201151005-download (67).jpg', '2020-10-14 23:13:26', ''),
(567, 557, '20201201150934-download (66).jpg', '2020-10-14 23:15:38', ''),
(568, 558, '20201201150908-download (65).jpg', '2020-10-14 23:18:32', ''),
(569, 559, '20201201150357-download (64).jpg', '2020-10-14 23:20:28', ''),
(570, 560, '20201130181840-IW323101.jpg', '2020-10-15 16:34:41', ''),
(571, 561, '20201130182019-download.jpg', '2020-10-15 16:37:04', ''),
(572, 562, '20201130181941-IW323104.jpg', '2020-10-15 16:40:21', ''),
(573, 564, '20201130181900-IW323105-iwc-vintage-aquatimer-automatic-platinum.jpg', '2020-10-15 17:31:24', ''),
(574, 565, '20201130182725-download (3).jpg', '2020-10-15 17:37:55', ''),
(575, 566, '20201130182706-IW323303-new.jpg', '2020-10-15 17:39:31', ''),
(576, 567, '20201130182638-download (2).jpg', '2020-10-15 17:41:31', ''),
(577, 568, '20201130182601-IW323305-iwc-vintage-ingenieur-automatic-platinum.jpg', '2020-10-15 17:43:47', ''),
(578, 569, '20201130182532-IW544501.jpg', '2020-10-15 17:47:07', ''),
(579, 570, '20201130182509-IW544503.jpg', '2020-10-15 17:49:47', ''),
(580, 571, '20201130182408-IW544504-new.jpg', '2020-10-15 17:51:25', ''),
(581, 572, '20201130182343-download (1).jpg', '2020-10-15 17:52:57', ''),
(582, 573, '20201130182242-81WKrql2CKL._UL1500_.jpg', '2020-10-15 17:54:43', ''),
(583, 574, '20201130182215-IW546103.jpg', '2020-10-15 17:56:41', ''),
(584, 575, '20201130182823-23923_MAIN_260.jpg', '2020-10-15 18:02:57', ''),
(585, 576, '20201130183231-IW325401.jpg', '2020-10-15 18:07:00', ''),
(586, 577, '20201130183209-download (7).jpg', '2020-10-15 18:08:41', ''),
(587, 578, '20201130183147-download (6).jpg', '2020-10-15 18:10:19', ''),
(588, 579, '20201130183128-images.jpg', '2020-10-15 18:12:14', ''),
(589, 580, '20201130183051-IW544803.jpg', '2020-10-15 18:16:29', ''),
(590, 581, '20201130183013-IW544803.jpg', '2020-10-15 18:20:43', ''),
(591, 583, '20201130182925-iw544804-64.jpg', '2020-10-15 18:33:13', ''),
(592, 584, '20201130182845-download (4).jpg', '2020-10-15 19:01:30', ''),
(593, 585, '20201130183831-download (13).jpg', '2020-10-15 19:10:49', ''),
(594, 586, '20201130183819-IWC-PortugueseTourbillon-IW504402-18212-180215-153852-.jpg', '2020-10-15 19:13:18', ''),
(595, 587, '20201130183729-download (12).jpg', '2020-10-15 19:14:58', ''),
(596, 588, '20201130183700-iwc-portuguese-minute-repeater-iw544907-40.jpg', '2020-10-15 19:16:54', ''),
(597, 589, '20201130183628-download (11).jpg', '2020-10-15 19:21:30', ''),
(598, 590, '20201130183601-IW502307.jpg', '2020-10-15 19:25:35', ''),
(599, 591, '20201130183357-download (10).jpg', '2020-10-15 19:29:33', ''),
(600, 592, '20201130183332-download (9).jpg', '2020-10-15 19:31:21', ''),
(601, 593, '20201130183515-IW503202--.jpg', '2020-10-15 19:44:40', ''),
(602, 594, '20201130183314-download (8).jpg', '2020-10-15 19:46:03', '');
INSERT INTO `product_gallery` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(603, 595, '20201130185137-IW500107-new.jpg', '2020-10-15 19:57:11', ''),
(604, 596, '20201130185051-16008054-xzbhyk3tei76wu608v4yqogt-ExtraLarge.jpg', '2020-10-15 19:58:59', ''),
(605, 597, '20201130184951-iwc-portuguese-automatic-iw500113-86.jpg', '2020-10-15 20:00:39', ''),
(606, 598, '20201130184911-iwc-portuguese-automatic-iw500114-99.jpg', '2020-10-15 20:02:40', ''),
(607, 599, '20201130184848-511dEtTXb8L._AC_UX522_.jpg', '2020-10-15 20:04:37', ''),
(608, 600, '20201130184712-IWC-PortugueseTourbillon-IW504402-18212-180215-153852-.jpg', '2020-10-15 20:06:29', ''),
(609, 601, '20201130184556-images (1).jpg', '2020-10-15 20:08:24', ''),
(610, 602, '20201130184517-IW371480-new.jpg', '2020-10-15 20:20:28', ''),
(611, 603, '20201130184436-71e+Uk4UYVL._AC_UX679_.jpg', '2020-10-15 20:41:59', ''),
(612, 604, '20201130184030-56958-336438853.jpg', '2020-10-15 20:43:34', ''),
(613, 605, '20201130185940-download (16).jpg', '2020-10-15 20:45:17', ''),
(614, 606, '20201130185906-download (15).jpg', '2020-10-15 20:47:46', ''),
(615, 607, '20201130185848-images (2).jpg', '2020-10-15 20:49:25', ''),
(616, 608, '20201130185825-download (14).jpg', '2020-10-15 20:50:49', ''),
(617, 609, '20201130185748-16669379-dmc9bqz5lghudlbs0r9v0lhq-ExtraLarge.jpg', '2020-10-15 20:52:10', ''),
(618, 610, '20201130185724-15802290-rm8m305x7bx93syukxei6rhs-ExtraLarge.jpg', '2020-10-15 20:53:57', ''),
(619, 611, '20201130185702-1945128.png', '2020-10-15 21:05:17', ''),
(620, 612, '20201130185632-iwc-portuguese-hand-wound-iw545408-34.jpg', '2020-10-15 21:08:24', ''),
(621, 613, '20201130185607-1945126.png', '2020-10-15 21:10:16', ''),
(622, 614, '20201130185446-iwc-da-vinci-chronograph-ceramic-iw376601-33.jpg', '2020-10-15 21:14:02', ''),
(623, 616, '20201201132443-download (62).jpg', '2020-10-15 21:50:38', ''),
(624, 617, '20201201132427-download (61).jpg', '2020-10-15 21:52:59', ''),
(625, 618, '20201201132411-download (60).jpg', '2020-10-15 21:54:31', ''),
(626, 619, '20201201132357-download (59).jpg', '2020-10-15 21:56:24', ''),
(627, 620, '20201201132332-download (58).jpg', '2020-10-15 22:26:37', ''),
(628, 621, '20201201132309-download (57).jpg', '2020-10-15 22:28:29', ''),
(629, 622, '20201201132249-download (56).jpg', '2020-10-16 15:06:08', ''),
(630, 623, '20201201132227-download (55).jpg', '2020-10-16 15:35:22', ''),
(631, 624, '20201201132211-download (54).jpg', '2020-10-16 15:46:31', ''),
(632, 625, '20201201131957-download (53).jpg', '2020-10-16 15:48:15', ''),
(633, 626, '20201201131941-download (52).jpg', '2020-10-16 15:52:05', ''),
(634, 627, '20201201131922-download (51).jpg', '2020-10-16 15:59:23', ''),
(635, 628, '20201201131902-images (8).jpg', '2020-10-16 16:01:32', ''),
(636, 629, '20201201131845-download (50).jpg', '2020-10-16 16:11:55', ''),
(637, 630, '20201201131823-download (49).jpg', '2020-10-16 16:15:30', ''),
(638, 631, '20201201131806-download (48).jpg', '2020-10-16 16:18:38', ''),
(639, 632, '20201201131725-download (47).jpg', '2020-10-16 16:22:43', ''),
(640, 633, '20201201131651-download (46).jpg', '2020-10-16 16:25:45', ''),
(641, 634, '20201201131607-images (7).jpg', '2020-10-16 16:27:54', ''),
(642, 635, '20201201131435-download (45).jpg', '2020-10-16 16:30:37', ''),
(643, 636, '20201201131420-images (6).jpg', '2020-10-16 16:33:26', ''),
(644, 637, '20201201131348-download (44).jpg', '2020-10-16 16:36:49', ''),
(645, 638, '20201201131328-download (43).jpg', '2020-10-16 16:38:38', ''),
(646, 639, '20201201131306-download (42).jpg', '2020-10-16 16:41:54', ''),
(647, 640, '20201201131248-download (41).jpg', '2020-10-16 16:45:17', ''),
(648, 641, '20201201131221-download (40).jpg', '2020-10-16 16:53:19', ''),
(649, 642, '20201201131157-download (39).jpg', '2020-10-16 16:55:22', ''),
(650, 643, '20201201131134-download (38).jpg', '2020-10-16 17:14:23', ''),
(651, 644, '20201201131034-download (37).jpg', '2020-10-16 17:18:49', ''),
(652, 645, '20201201130950-download (36).jpg', '2020-10-16 17:20:39', ''),
(653, 646, '20201201130931-download (35).jpg', '2020-10-16 17:23:53', ''),
(654, 647, '20201201130915-download (34).jpg', '2020-10-16 17:24:57', ''),
(655, 648, '20201201130858-download (33).jpg', '2020-10-16 17:26:35', ''),
(656, 649, '20201201130842-download (32).jpg', '2020-10-16 17:27:56', ''),
(657, 650, '20201201130817-download (31).jpg', '2020-10-16 17:29:05', ''),
(658, 651, '20201201130749-download (30).jpg', '2020-10-16 17:30:52', ''),
(659, 652, '20201201130727-download (29).jpg', '2020-10-16 17:40:26', ''),
(660, 653, '20201201130700-download (28).jpg', '2020-10-16 18:08:16', ''),
(661, 654, '20201201130638-download (27).jpg', '2020-10-16 18:12:23', ''),
(662, 655, '20201201125631-download (26).jpg', '2020-10-16 18:14:01', ''),
(663, 656, '20201201125556-download (25).jpg', '2020-10-16 18:15:29', ''),
(664, 657, '20201201125536-download (24).jpg', '2020-10-16 18:17:38', ''),
(665, 658, '20201201125511-images (5).jpg', '2020-10-16 18:18:55', ''),
(666, 659, '20201201125455-images (5).jpg', '2020-10-16 18:20:14', ''),
(667, 660, '20201201125427-images (4).jpg', '2020-10-16 18:21:55', ''),
(668, 661, '20201201125400-download (23).jpg', '2020-10-16 18:23:34', ''),
(669, 662, '20201201125341-iwc-spitfire-chronograph-iw387803-91.jpg', '2020-10-16 18:25:56', ''),
(670, 663, '20201201125301-iwc-spitfire-chronograph-iw387802-80.jpg', '2020-10-16 18:27:34', ''),
(671, 664, '20201201125239-iwc-spitfire-chronograph-iw387804-70 (1).jpg', '2020-10-16 18:28:47', ''),
(672, 665, '20201201125057-IWC_IW376708_37405_01.jpg', '2020-10-16 18:46:22', ''),
(673, 666, '20201201125002-iwc-aquatimer-chronograph-men_s-watch-iw376709.jpg', '2020-10-16 18:47:37', ''),
(674, 667, '20201201124836-1921827.png.transform.buying-options_watch_1000.jpeg', '2020-10-16 18:48:46', ''),
(675, 668, '20201201124809-1921828.png.transform.buying-options_watch_1000.jpeg', '2020-10-16 18:51:11', ''),
(676, 669, '20201201124623-images (3).jpg', '2020-10-16 18:52:08', ''),
(677, 670, '20201201124600-iwc-aquatimer-chrono-automatic-iw376705-43.jpg', '2020-10-16 18:53:23', ''),
(678, 671, '20201201124456-3f2b4012512aa3f9e2a0c2eed99ee919.jpg', '2020-10-16 21:58:20', ''),
(679, 671, '20201201124515-download (22).jpg', '2020-10-19 15:27:18', ''),
(680, 672, '20201201124421-IW391002.jpg', '2020-10-19 15:29:07', ''),
(681, 673, '20201201124308-IW391005-new.jpg', '2020-10-19 15:32:06', ''),
(682, 674, '20201201124125-IW391006_main.jpg', '2020-10-19 15:43:40', ''),
(683, 675, '20201201123938-download (21).jpg', '2020-10-19 15:46:02', ''),
(684, 676, '20201201123917-download (20).jpg', '2020-10-19 15:47:48', ''),
(685, 677, '20201201123850-download (19).jpg', '2020-10-19 15:50:57', ''),
(686, 678, '20201201123807-iw356504-iwc.jpg', '2020-10-19 15:56:37', ''),
(687, 679, '20201201123732-download (18).jpg', '2020-10-19 15:58:38', ''),
(688, 680, '20201201123645-download (18).jpg', '2020-10-19 16:03:44', ''),
(689, 681, '20201201123529-iw510102-.jpg', '2020-10-19 16:08:56', ''),
(690, 682, '20201201123432-download (17).jpg', '2020-10-19 16:10:47', ''),
(691, 683, '20201201123413-iw510104.jpg', '2020-10-19 16:33:02', ''),
(692, 684, '20201201123247-iwc-portofino-hand-wound-8-days-iw510107-96.jpg', '2020-10-19 16:44:21', ''),
(693, 685, '20201130155336-download (8).jpg', '2020-10-19 17:06:38', ''),
(694, 686, '20201130155515-download (3).jpg', '2020-10-19 17:09:07', ''),
(695, 687, '20201130155446-download (2).jpg', '2020-10-19 17:11:19', ''),
(696, 688, '20201130155423-download (1).jpg', '2020-10-19 17:14:47', ''),
(697, 689, '20201130155400-download.jpg', '2020-10-19 17:18:19', ''),
(698, 690, '20201130160213-download (11).jpg', '2020-10-19 17:20:15', ''),
(699, 691, '20201130160147-download (10).jpg', '2020-10-19 17:24:28', ''),
(700, 692, '20201130160121-RICHARD MILLE RM 003 Ti DLC Boutique Edition 502.45B.91B.jpg', '2020-10-19 17:27:43', ''),
(701, 693, '20201130160046-RICHARD MILLE RM 003 Pt All Grey 502.48C.91.jpg', '2020-10-19 17:29:46', ''),
(702, 694, '20201130155958-download (9).jpg', '2020-10-19 19:20:20', ''),
(703, 695, '20201130155912-Richard-Mille-RG-503-04-91.jpg', '2020-10-19 19:24:42', ''),
(704, 696, '20201130155714-download (7).jpg', '2020-10-19 19:29:02', ''),
(705, 697, '20201130155653-download (6).jpg', '2020-10-19 19:38:40', ''),
(706, 698, '20201130155622-download (5).jpg', '2020-10-19 19:44:05', ''),
(707, 699, '20201130155559-download (4).jpg', '2020-10-19 19:50:01', ''),
(708, 700, '20201130160852-download (17).jpg', '2020-10-19 19:54:03', ''),
(709, 701, '20201130160827-unnamed.jpg', '2020-10-19 19:58:05', ''),
(710, 702, '20201130160744-download (16).jpg', '2020-10-19 20:00:33', ''),
(711, 703, '20201130160715-RICHARD MILLE RM 008 RG Felipe Massa 507.04D.91.jpg', '2020-10-19 20:05:58', ''),
(712, 704, '20201130160642-download (15).jpg', '2020-10-19 20:08:42', ''),
(713, 705, '20201130160542-download (14).jpg', '2020-10-19 20:29:36', ''),
(714, 706, '20201130160507-RICHARD MILLE RM 010 RG full set 509.042.91-1 Full set.jpg', '2020-10-19 20:33:40', ''),
(715, 707, '20201130160422-download (13).jpg', '2020-10-19 20:38:13', ''),
(716, 708, '20201130160358-Richard-Mille-WG-509-06-91.jpg', '2020-10-19 20:41:58', ''),
(717, 709, '20201130160325-download (12).jpg', '2020-10-19 20:45:17', ''),
(718, 710, '20201130161450-RICHARD MILLE RM 010 WG full set 509.062.91-1.jpg', '2020-10-19 20:47:41', ''),
(719, 711, '20201130161417-unnamed (3).jpg', '2020-10-19 20:51:10', ''),
(720, 712, '20201130161342-unnamed (2).jpg', '2020-10-19 20:55:22', ''),
(721, 713, '20201130161311-download (20).jpg', '2020-10-19 20:57:23', ''),
(722, 714, '20201130161242-download (19).jpg', '2020-10-19 21:03:49', ''),
(723, 715, '20201130161151-unnamed (1).jpg', '2020-10-19 21:10:37', ''),
(724, 716, '20201130161124-download (18).jpg', '2020-10-19 21:16:08', ''),
(725, 717, '20201130161054-RICHARD MILLE RM 011 Ti Shot Blasted 511.45AS.91R-1.jpg', '2020-10-19 21:18:13', ''),
(726, 718, '20201130161024-RICHARD MILLE RM 011 Ti LMC 511.45AR.91Z-1.jpg', '2020-10-19 21:21:03', ''),
(727, 719, '20201130160957-RICHARD MILLE RM 011 Ti Spa Classic 511.45.XXX.jpg', '2020-10-19 21:32:39', ''),
(728, 720, '20201130162206-unnamed (7).jpg', '2020-10-19 21:54:43', ''),
(729, 721, '20201130162135-RICHARD MILLE RM 011 Carbon 511.72.91S-1.jpg', '2020-10-20 15:15:30', ''),
(730, 722, '20201130162102-download (24).jpg', '2020-10-20 15:20:03', ''),
(731, 723, '20201130162034-unnamed (6).jpg', '2020-10-20 15:24:47', ''),
(732, 724, '20201130162007-download (23).jpg', '2020-10-20 15:27:19', ''),
(733, 725, '20201130161838-unnamed (5).jpg', '2020-10-20 15:30:09', ''),
(734, 726, '20201130161802-download (22).jpg', '2020-10-20 15:38:00', ''),
(735, 727, '20201130161733-Richard Mille RM 016 Watch 516-04-91-1.jpg', '2020-10-20 15:42:13', ''),
(736, 728, '20201130161630-unnamed (4).jpg', '2020-10-20 15:46:20', ''),
(737, 729, '20201130161548-download (21).jpg', '2020-10-20 15:48:42', ''),
(738, 730, '20201130163006-download (29).jpg', '2020-10-20 16:00:01', ''),
(739, 731, '20201130162941-download (28).jpg', '2020-10-20 16:07:25', ''),
(740, 732, '20201130162913-unnamed (10).jpg', '2020-10-20 16:20:04', ''),
(741, 733, '20201130162843-unnamed (9).jpg', '2020-10-20 16:23:12', ''),
(742, 734, '20201130162817-unnamed (8).jpg', '2020-10-20 16:31:23', ''),
(743, 735, '20201130162749-RICHARD MILLE RM 016 Ti 516.45.91-1.jpg', '2020-10-20 16:35:23', ''),
(744, 736, '20201130162655-download (27).jpg', '2020-10-20 16:37:31', ''),
(745, 737, '20201130162615-download (27).jpg', '2020-10-20 16:40:32', ''),
(746, 738, '20201130162550-download (26).jpg', '2020-10-20 16:42:55', ''),
(747, 739, '20201130162415-download (25).jpg', '2020-10-20 16:46:35', ''),
(748, 740, '20201130163625-download (31).jpg', '2020-10-20 17:30:12', ''),
(749, 741, '20201130163604-unnamed (13).jpg', '2020-10-20 17:57:06', ''),
(750, 742, '20201130163539-RICHARD MILLE RM 017 Ti 517.45.91 Tourbillon Extra Plate .jpg', '2020-10-20 17:59:22', ''),
(751, 743, '20201130163511-RICHARD MILLE RM 020 Ti DLC 520.45C.91 Montre de Poche.jpg', '2020-10-20 18:02:01', ''),
(752, 744, '20201130163420-download (30).jpg', '2020-10-20 18:04:37', ''),
(753, 745, '20201130163343-gphg2010_ricahrdmille_10_0706_rm020_01.jpg', '2020-10-20 18:06:35', ''),
(754, 746, '20201130163302-RICHARD MILLE RM 021 RG 521.04.91.jpg', '2020-10-20 18:23:25', ''),
(755, 747, '20201130163211-Richard-Mille-WG-509-06-91.jpg', '2020-10-20 18:32:03', ''),
(756, 748, '20201130163140-unnamed (12).jpg', '2020-10-20 18:40:22', ''),
(757, 749, '20201130163123-unnamed (11).jpg', '2020-10-20 18:43:19', ''),
(758, 750, '20201130164249-unnamed (17).jpg', '2020-10-20 18:46:27', ''),
(759, 751, '20201130164216-RICHARD MILLE RM 022 Ti 522.45.91.jpg', '2020-10-20 18:48:26', ''),
(760, 752, '20201130164150-unnamed (16).jpg', '2020-10-20 18:51:00', ''),
(761, 753, '20201130164113-download (34).jpg', '2020-10-20 18:53:50', ''),
(762, 754, '20201130164050-download (33).jpg', '2020-10-20 18:56:07', ''),
(763, 755, '20201130164026-unnamed (15).jpg', '2020-10-20 18:58:12', ''),
(764, 756, '20201130163937-download (32).jpg', '2020-10-20 19:01:04', ''),
(765, 757, '20201130163908-unnamed (14).jpg', '2020-10-20 19:03:26', ''),
(766, 758, '20201130163837-RICHARD MILLE RM 023 Ti 523.45.91 .jpg', '2020-10-20 19:08:11', ''),
(767, 759, '20201130163744-6cb7bd477f8c4e1d39ccd898555dc119.jpg', '2020-10-20 19:13:02', ''),
(768, 760, '20201130164812-unnamed (20).jpg', '2020-10-20 19:23:30', ''),
(769, 761, '20201130164718-download (38).jpg', '2020-10-20 19:25:54', ''),
(770, 763, '20201130164623-unnamed (18).jpg', '2020-10-20 19:34:53', ''),
(771, 764, '20201130164554-RICHARD MILLE RM 028 Ti DLC Orange Flash 528.45M.91K-1.jpg', '2020-10-20 19:45:06', ''),
(772, 765, '20201130164516-download (37).jpg', '2020-10-20 19:50:56', ''),
(773, 766, '20201130164454-RICHARD MILLE RM 028 Ti DLC Orange Flash 528.45M.91K-1.jpg', '2020-10-20 19:58:52', ''),
(774, 767, '20201130164433-RICHARD MILLE RM 028 Ti DLC Orange Flash 528.45M.91K-1.jpg', '2020-10-20 20:05:19', ''),
(775, 768, '20201130164407-download (36).jpg', '2020-10-20 20:08:04', ''),
(776, 769, '20201130164341-download (35).jpg', '2020-10-20 20:11:35', ''),
(777, 770, '20201130173520-unnamed (21).jpg', '2020-10-21 15:33:35', ''),
(778, 771, '20201130173458-Richard-Mille-RG-503-04-91 (1).jpg', '2020-10-21 15:46:03', ''),
(779, 772, '20201130173416-RICHARD MILLE RM 029 RG 529.04.91.jpg', '2020-10-21 15:48:38', ''),
(780, 773, '20201130173303-download (43).jpg', '2020-10-21 15:57:13', ''),
(781, 774, '20201130173240-download (42).jpg', '2020-10-21 17:15:19', ''),
(782, 775, '20201130173211-Richard-Mille-Ti-DLC-Black-Night-530-45D-91C.jpg', '2020-10-21 17:21:25', ''),
(783, 776, '20201130173105-download (41).jpg', '2020-10-21 17:24:49', ''),
(784, 777, '20201130173029-download (40).jpg', '2020-10-21 17:26:42', ''),
(785, 778, '20201130173009-Richard Mille RM 032 Ti 532.45.91.jpg', '2020-10-21 17:28:32', ''),
(786, 779, '20201130172941-download (39).jpg', '2020-10-21 17:31:27', ''),
(787, 780, '20201130175433-RICHARD MILLE RM 033 RG 533.04.91.jpg', '2020-10-21 17:37:00', ''),
(788, 781, '20201130175410-Richard-Mille-RG-medium-set-Triangle-533-042-91-1.jpg', '2020-10-21 17:42:18', ''),
(789, 782, '20201130175341-unnamed (22).jpg', '2020-10-21 17:47:47', ''),
(790, 783, '20201130174018-RICHARD MILLE RM 033 Ti 533.45.91 .jpg', '2020-10-21 17:50:04', ''),
(791, 784, '20201130173911-RICHARD MILLE RM 033 WG 533.06.91 .jpg', '2020-10-21 17:52:03', ''),
(792, 785, '20201130173826-download (47).jpg', '2020-10-21 17:53:57', ''),
(793, 786, '20201130173804-download (46).jpg', '2020-10-21 17:55:53', ''),
(794, 787, '20201130173730-download (45).jpg', '2020-10-21 17:58:08', ''),
(795, 788, '20201130173651-Richard-Mille-RM-35-01-Rafael-Nadal-10.jpg', '2020-10-21 18:00:10', ''),
(796, 789, '20201130173617-download (44).jpg', '2020-10-21 18:01:34', ''),
(797, 790, '20201130180028-Richard-Mille-RM36-01-G-Sensor-Sebastien-Loeb-Front-Featured-image.jpg', '2020-10-21 18:02:57', ''),
(798, 791, '20201130180004-download (51).jpg', '2020-10-21 18:06:18', ''),
(799, 792, '20201130175942-Richard-Mille-RM-039-Tourbillon-Aviation-E6-B-Flyback-Chronograph-aBlogtoWatch-7.jpg', '2020-10-21 18:07:23', ''),
(800, 793, '20201130175911-download (50).jpg', '2020-10-21 18:08:40', ''),
(801, 794, '20201130175847-RICHARD MILLE RM 051 Michelle Yeoh RG Full Set 551.0411.94.jpg', '2020-10-21 18:11:12', ''),
(802, 795, '20201130175749-RM-51-01.jpg', '2020-10-21 18:25:21', ''),
(803, 796, '20201130175725-Richard Mille RM 052 Tourbillon Skull Titanium Watch.jpg', '2020-10-21 18:28:00', ''),
(804, 797, '20201130175656-download (49).jpg', '2020-10-21 18:29:29', ''),
(805, 798, '20201130175638-download (48).jpg', '2020-10-21 18:31:24', ''),
(806, 799, '20201130175618-RICHARD MILLE RM 055 Bubba Watson 555.45A.91-1.jpg', '2020-10-21 18:35:11', ''),
(807, 800, '20201130180952-Richard-Mille-Bubba-Watson-All-Black-555-XXX.jpg', '2020-10-21 18:37:41', ''),
(808, 801, '20201130180922-46f092ec8ec0ed4aadc44527722565d7.jpg', '2020-10-21 18:42:35', ''),
(809, 802, '20201130180853-unnamed (24).jpg', '2020-10-21 19:10:32', ''),
(810, 803, '20201130180829-unnamed (23).jpg', '2020-10-21 19:12:42', ''),
(811, 804, '20201130180733-download (54).jpg', '2020-10-21 19:15:18', ''),
(812, 805, '20201130180655-download (53).jpg', '2020-10-21 19:17:43', ''),
(813, 806, '20201130180630-download (52).jpg', '2020-10-21 19:19:31', ''),
(814, 807, '20201130180612-Richard-Mille-RM-61-01-Yohan-Black-Full-Black-5.jpg', '2020-10-21 19:30:59', ''),
(815, 808, '20201130180535-Richard-Mille-RM-61-01-Yohan-Black-Full-Black-5.jpg', '2020-10-21 19:35:57', ''),
(817, 810, '20201130153338-download.jpg', '2020-10-21 22:44:46', ''),
(818, 811, '20201130154207-Dior-CD1221E0C001.jpg', '2020-10-21 22:49:13', ''),
(819, 812, '20201130154351-1393576310_bp.jpg', '2020-10-21 22:54:16', ''),
(820, 813, '20201130154532-download (1).jpg', '2020-10-21 22:56:02', ''),
(821, 814, '20201130154609-Dior-CD1221E0C001.jpg', '2020-10-21 22:57:22', ''),
(822, 815, '20201130154632-download (1).jpg', '2020-10-21 23:00:16', ''),
(823, 816, '20201130154712-download (2).jpg', '2020-10-21 23:03:58', ''),
(824, 817, '20201130154754-images.jpg', '2020-10-21 23:06:37', ''),
(825, 818, '20201130154857-download (3).jpg', '2020-10-21 23:08:52', ''),
(826, 819, '20201130154957-download (4).jpg', '2020-10-21 23:11:15', ''),
(827, 820, '20201130155026-download (5).jpg', '2020-10-21 23:14:29', ''),
(828, 821, '20201130155109-download (6).jpg', '2020-10-21 23:16:39', ''),
(829, 822, '20201130155133-download (7).jpg', '2020-10-21 23:18:49', ''),
(830, 809, '20201130180301-Richard-Mille-RM36-01-G-Sensor-Sebastien-Loeb-Front-Featured-image.jpg', NULL, ''),
(831, 809, '20201130180334-76677975842380.jpg', NULL, ''),
(832, 187, '20201026192207-Rolex-116900 AirKing.jpg', NULL, ''),
(833, 186, '20201026192953-Rolex-Sea-Dweller-126600-Black-front.jpg', NULL, ''),
(834, 185, '20201026193903-Rolex-116400-GV Milgauss.jpg', NULL, ''),
(835, 0, '20201027132317-rolex 116508 green dial.jpg', NULL, ''),
(836, 0, '20201027134359-Rolex 116518 or jaune chrono noir.jpg', NULL, ''),
(837, 823, '20201110115245-background-image.png', '2020-11-10 16:52:45', ''),
(838, 823, '20201110120027-background-image.png', NULL, ''),
(839, 0, '20201130164651-unnamed (19).jpg', NULL, ''),
(840, 0, '20201130181919-IW323105-iwc-vintage-aquatimer-automatic-platinum (1).jpg', NULL, ''),
(841, 0, '20201130182950-download (5).jpg', NULL, ''),
(842, 0, '20201201132512-download (63).jpg', NULL, ''),
(843, 0, '20201201172035-images (16).jpg', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `product_item_picture`
--

CREATE TABLE `product_item_picture` (
  `id` bigint(20) NOT NULL,
  `product_item_id` int(11) NOT NULL,
  `url` int(11) NOT NULL,
  `createddatetime` datetime NOT NULL DEFAULT current_timestamp(),
  `createdby` bigint(20) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `promocode`
--

CREATE TABLE `promocode` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `merchant` varchar(255) DEFAULT NULL,
  `promotype` varchar(255) DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `application` varchar(255) DEFAULT NULL,
  `promocodelimit` varchar(255) DEFAULT NULL,
  `limitperuser` varchar(255) DEFAULT NULL,
  `maxdiscount` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `valid_date` date DEFAULT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `promocode`
--

INSERT INTO `promocode` (`id`, `name`, `area`, `merchant`, `promotype`, `discount`, `application`, `promocodelimit`, `limitperuser`, `maxdiscount`, `created_at`, `valid_date`, `updated_at`) VALUES
(1, 'FIRSTPROMO', 'philippines', 'express', 'type', '50', 'Get 50% off on first Order', '100', '1', '100', '2021-09-01', '2021-06-30', '');

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`id`, `name`) VALUES
(1, 'Abra'),
(2, 'Agusan del Norte'),
(3, 'Agusan del Sur'),
(4, 'Aklan'),
(5, 'Albay'),
(6, 'Antique'),
(7, 'Apayao'),
(8, 'Aurora'),
(9, 'Basilan'),
(10, 'Bataan'),
(11, 'Batanes'),
(12, 'Batangas'),
(13, 'Benguet'),
(14, 'Biliran'),
(15, 'Bohol'),
(16, 'Bukidnon'),
(17, 'Bulacan'),
(18, 'Cagayan'),
(19, 'Camarines Norte'),
(20, 'Camarines Sur'),
(21, 'Camiguin'),
(22, 'Capiz'),
(23, 'Catanduanes'),
(24, 'Cavite'),
(25, 'Cebu'),
(26, 'Compostela Valley'),
(27, 'Cotabato'),
(28, 'Davao del Norte'),
(29, 'Davao del Sur'),
(30, 'Davao Oriental'),
(31, 'Eastern Samar'),
(32, 'Guimaras'),
(33, 'Ifugao'),
(34, 'Ilocos Norte'),
(35, 'Ilocos Sur'),
(36, 'Iloilo'),
(37, 'Isabela'),
(38, 'Kalinga'),
(39, 'La Union'),
(40, 'Laguna'),
(41, 'Lanao del Norte'),
(42, 'Lanao del Sur'),
(43, 'Leyte'),
(44, 'Maguindanao'),
(45, 'Marinduque'),
(46, 'Masbate'),
(47, 'Metro Manila'),
(48, 'Misamis Occidental'),
(49, 'Misamis Oriental'),
(50, 'Mountain Province'),
(51, 'Negros Occidental'),
(52, 'Negros Oriental'),
(53, 'Northern Samar'),
(54, 'Nueva Ecija'),
(55, 'Nueva Vizcaya'),
(56, 'Occidental Mindoro'),
(57, 'Oriental Mindoro'),
(58, 'Palawan'),
(59, 'Pampanga'),
(60, 'Pangasinan'),
(61, 'Quezon'),
(62, 'Quirino'),
(63, 'Rizal'),
(64, 'Romblon'),
(65, 'Samar'),
(66, 'Sarangani'),
(67, 'Siquijor'),
(68, 'Sorsogon'),
(69, 'South Cotabato'),
(70, 'Southern Leyte'),
(71, 'Sultan Kudarat'),
(72, 'Sulu'),
(73, 'Surigao del Norte'),
(74, 'Surigao del Sur'),
(75, 'Tarlac'),
(76, 'Tawi-Tawi'),
(77, 'Zambales'),
(78, 'Zamboanga del Norte'),
(79, 'Zamboanga del Sur'),
(80, 'Zamboanga Sibugay');

-- --------------------------------------------------------

--
-- Table structure for table `reference_codemaster`
--

CREATE TABLE `reference_codemaster` (
  `id` int(11) NOT NULL,
  `refid` int(11) NOT NULL,
  `recode` varchar(100) NOT NULL,
  `issued` tinyint(1) NOT NULL,
  `usedbyuserid` int(11) NOT NULL,
  `createddatetime` datetime NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reference_codemaster`
--

INSERT INTO `reference_codemaster` (`id`, `refid`, `recode`, `issued`, `usedbyuserid`, `createddatetime`, `created_at`, `updated_at`) VALUES
(1, 1, 'TESTCODE', 1, 1, '2021-07-31 00:00:00', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `refer_code`
--

CREATE TABLE `refer_code` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resturentmaster`
--

CREATE TABLE `resturentmaster` (
  `resturentid` bigint(20) NOT NULL,
  `resturentname` bigint(20) NOT NULL,
  `rating` int(11) NOT NULL,
  `address` varchar(400) NOT NULL,
  `reviewcount` int(11) NOT NULL,
  `opentime` varchar(200) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createddatetime` datetime NOT NULL,
  `latitude` decimal(10,0) NOT NULL,
  `longitude` decimal(10,0) NOT NULL,
  `zipcode` varchar(100) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `search_driver`
--

CREATE TABLE `search_driver` (
  `id` int(11) NOT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `pickup_id` int(11) NOT NULL,
  `km` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `search_driver`
--

INSERT INTO `search_driver` (`id`, `driver_id`, `vehicle_id`, `pickup_id`, `km`, `time`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 144, '10982', '10', '2021-08-27 11:15:51', '2021-08-27 11:15:51'),
(2, 8, 1, 144, '10982', '10', '2021-08-27 11:15:51', '2021-08-27 11:15:51'),
(3, 5, 1, 1, '12712', '10', '2021-08-27 11:16:06', '2021-08-27 11:16:06'),
(4, 8, 1, 1, '12712', '10', '2021-08-27 11:16:06', '2021-08-27 11:16:06'),
(5, 5, 1, 1, '12712', '10', '2021-08-27 11:21:09', '2021-08-27 11:21:09'),
(6, 8, 1, 1, '12712', '10', '2021-08-27 11:21:09', '2021-08-27 11:21:09'),
(7, 5, 1, 2, '12712', '10', '2021-08-27 11:38:15', '2021-08-27 11:38:15'),
(8, 8, 1, 2, '12712', '10', '2021-08-27 11:38:15', '2021-08-27 11:38:15'),
(9, 5, 1, 3, '12712', '10', '2021-08-27 11:47:36', '2021-08-27 11:47:36'),
(10, 8, 1, 3, '12712', '10', '2021-08-27 11:47:36', '2021-08-27 11:47:36'),
(11, 5, 1, 4, '12712', '10', '2021-08-27 12:09:09', '2021-08-27 12:09:09'),
(12, 8, 1, 4, '12712', '10', '2021-08-27 12:09:09', '2021-08-27 12:09:09'),
(13, 5, 1, 5, '12712', '10', '2021-08-27 16:44:04', '2021-08-27 16:44:04'),
(14, 8, 1, 5, '12712', '10', '2021-08-27 16:44:04', '2021-08-27 16:44:04'),
(15, 5, 5, 8, '6946', '10', '2021-08-28 05:24:44', '2021-08-28 05:24:44'),
(16, 8, 5, 8, '6946', '10', '2021-08-28 05:24:44', '2021-08-28 05:24:44'),
(17, 5, 5, 9, '6944', '10', '2021-08-28 05:30:26', '2021-08-28 05:30:26'),
(18, 8, 5, 9, '6944', '10', '2021-08-28 05:30:26', '2021-08-28 05:30:26'),
(19, 5, 5, 13, '6944', '10', '2021-08-28 05:39:28', '2021-08-28 05:39:28'),
(20, 8, 5, 13, '6944', '10', '2021-08-28 05:39:28', '2021-08-28 05:39:28'),
(21, 5, 5, 14, '6944', '10', '2021-08-28 05:50:15', '2021-08-28 05:50:15'),
(22, 8, 5, 14, '6944', '10', '2021-08-28 05:50:15', '2021-08-28 05:50:15'),
(23, 5, 5, 15, '6946', '10', '2021-08-28 05:53:06', '2021-08-28 05:53:06'),
(24, 8, 5, 15, '6946', '10', '2021-08-28 05:53:06', '2021-08-28 05:53:06'),
(25, 5, 5, 16, '6944', '10', '2021-08-28 05:57:54', '2021-08-28 05:57:54'),
(26, 8, 5, 16, '6944', '10', '2021-08-28 05:57:54', '2021-08-28 05:57:54'),
(27, 5, 5, 17, '6944', '10', '2021-08-28 06:07:57', '2021-08-28 06:07:57'),
(28, 8, 5, 17, '6944', '10', '2021-08-28 06:07:57', '2021-08-28 06:07:57'),
(29, 5, 5, 18, '6946', '10', '2021-08-28 06:10:44', '2021-08-28 06:10:44'),
(30, 8, 5, 18, '6946', '10', '2021-08-28 06:10:44', '2021-08-28 06:10:44'),
(31, 5, 5, 19, '6944', '10', '2021-08-28 06:14:25', '2021-08-28 06:14:25'),
(32, 8, 5, 19, '6944', '10', '2021-08-28 06:14:25', '2021-08-28 06:14:25'),
(33, 5, 5, 20, '6944', '10', '2021-08-28 06:16:48', '2021-08-28 06:16:48'),
(34, 8, 5, 20, '6944', '10', '2021-08-28 06:16:48', '2021-08-28 06:16:48'),
(35, 5, 5, 21, '6946', '10', '2021-08-28 08:14:43', '2021-08-28 08:14:43'),
(36, 8, 5, 21, '6946', '10', '2021-08-28 08:14:43', '2021-08-28 08:14:43'),
(37, 5, 1, 22, '12712', '10', '2021-08-29 11:01:40', '2021-08-29 11:01:40'),
(38, 8, 1, 22, '12712', '10', '2021-08-29 11:01:40', '2021-08-29 11:01:40'),
(39, 5, 1, 27, '6885', '10', '2021-08-30 02:09:20', '2021-08-30 02:09:20'),
(40, 8, 1, 27, '6885', '10', '2021-08-30 02:09:20', '2021-08-30 02:09:20'),
(41, 5, 1, 28, '12712', '10', '2021-08-30 02:23:59', '2021-08-30 02:23:59'),
(42, 8, 1, 28, '12712', '10', '2021-08-30 02:23:59', '2021-08-30 02:23:59'),
(43, 5, 1, 31, '12712', '10', '2021-08-30 03:07:24', '2021-08-30 03:07:24'),
(44, 8, 1, 31, '12712', '10', '2021-08-30 03:07:24', '2021-08-30 03:07:24'),
(45, 5, 1, 36, '12712', '10', '2021-08-30 08:08:02', '2021-08-30 08:08:02'),
(46, 8, 1, 36, '12712', '10', '2021-08-30 08:08:02', '2021-08-30 08:08:02'),
(47, 5, 1, 37, '12712', '10', '2021-08-30 08:32:30', '2021-08-30 08:32:30'),
(48, 8, 1, 37, '12712', '10', '2021-08-30 08:32:30', '2021-08-30 08:32:30'),
(49, 5, 1, 39, '12712', '10', '2021-08-30 08:45:01', '2021-08-30 08:45:01'),
(50, 8, 1, 39, '12712', '10', '2021-08-30 08:45:01', '2021-08-30 08:45:01'),
(51, 5, 1, 41, '12712', '10', '2021-08-30 12:53:42', '2021-08-30 12:53:42'),
(52, 8, 1, 41, '12712', '10', '2021-08-30 12:53:42', '2021-08-30 12:53:42'),
(53, 5, 5, 44, '6944', '10', '2021-08-31 10:20:38', '2021-08-31 10:20:38'),
(54, 8, 5, 44, '6944', '10', '2021-08-31 10:20:38', '2021-08-31 10:20:38'),
(55, 5, 5, 48, '6944', '10', '2021-08-31 10:51:56', '2021-08-31 10:51:56'),
(56, 8, 5, 48, '6944', '10', '2021-08-31 10:51:56', '2021-08-31 10:51:56'),
(57, 5, 5, 50, '6944', '10', '2021-08-31 10:54:35', '2021-08-31 10:54:35'),
(58, 8, 5, 50, '6944', '10', '2021-08-31 10:54:35', '2021-08-31 10:54:35'),
(59, 5, 5, 51, '6944', '10', '2021-08-31 10:56:53', '2021-08-31 10:56:53'),
(60, 8, 5, 51, '6944', '10', '2021-08-31 10:56:53', '2021-08-31 10:56:53'),
(61, 5, 1, 57, '7628', '10', '2021-08-31 13:04:43', '2021-08-31 13:04:43'),
(62, 8, 1, 57, '7628', '10', '2021-08-31 13:04:43', '2021-08-31 13:04:43'),
(63, 5, 1, 58, '6885', '10', '2021-08-31 13:17:41', '2021-08-31 13:17:41'),
(64, 8, 1, 58, '6885', '10', '2021-08-31 13:17:41', '2021-08-31 13:17:41'),
(65, 5, 1, 59, '6885', '10', '2021-08-31 13:21:52', '2021-08-31 13:21:52'),
(66, 8, 1, 59, '6885', '10', '2021-08-31 13:21:52', '2021-08-31 13:21:52'),
(67, 5, 5, 60, '6946', '10', '2021-08-31 13:47:40', '2021-08-31 13:47:40'),
(68, 8, 5, 60, '6946', '10', '2021-08-31 13:47:40', '2021-08-31 13:47:40'),
(69, 5, 5, 61, '6910', '10', '2021-08-31 16:59:48', '2021-08-31 16:59:48'),
(70, 8, 5, 61, '6910', '10', '2021-08-31 16:59:48', '2021-08-31 16:59:48'),
(71, 5, 3, 63, '7720', '10', '2021-09-01 08:42:02', '2021-09-01 08:42:02'),
(72, 8, 3, 63, '7720', '10', '2021-09-01 08:42:02', '2021-09-01 08:42:02'),
(73, 5, 1, 3, '11622', '10', '2021-09-02 18:22:05', '2021-09-02 18:22:05'),
(74, 8, 1, 3, '11622', '10', '2021-09-02 18:22:05', '2021-09-02 18:22:05'),
(75, 5, 1, 5, '11621', '10', '2021-09-03 01:22:13', '2021-09-03 01:22:13'),
(76, 8, 1, 5, '11621', '10', '2021-09-03 01:22:13', '2021-09-03 01:22:13'),
(77, 5, 1, 7, '11618', '10', '2021-09-03 01:33:25', '2021-09-03 01:33:25'),
(78, 8, 1, 7, '11618', '10', '2021-09-03 01:33:25', '2021-09-03 01:33:25'),
(79, 5, 1, 8, '11625', '10', '2021-09-03 01:34:04', '2021-09-03 01:34:04'),
(80, 8, 1, 8, '11625', '10', '2021-09-03 01:34:04', '2021-09-03 01:34:04'),
(81, 5, 1, 9, '11621', '10', '2021-09-03 01:59:24', '2021-09-03 01:59:24'),
(82, 8, 1, 9, '11621', '10', '2021-09-03 01:59:24', '2021-09-03 01:59:24'),
(83, 5, 5, 10, '6940', '10', '2021-09-03 05:35:11', '2021-09-03 05:35:11'),
(84, 8, 5, 10, '6940', '10', '2021-09-03 05:35:11', '2021-09-03 05:35:11'),
(85, 1, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(86, 2, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(87, 3, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(88, 4, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(89, 5, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(90, 6, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(91, 7, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(92, 8, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(93, 9, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(94, 10, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(95, 11, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(96, 12, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(97, 13, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(98, 14, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(99, 15, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(100, 16, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(101, 17, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(102, 18, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(103, 19, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(104, 20, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(105, 21, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(106, 22, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(107, 23, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(108, 24, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(109, 25, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(110, 26, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(111, 27, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(112, 28, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(113, 29, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(114, 30, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(115, 31, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(116, 32, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(117, 33, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(118, 34, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(119, 35, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(120, 36, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(121, 40, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(122, 42, 1, 12, '10982', '10', '2021-09-04 13:02:16', '2021-09-04 13:02:16'),
(123, 1, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(124, 2, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(125, 3, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(126, 4, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(127, 5, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(128, 6, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(129, 7, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(130, 8, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(131, 9, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(132, 10, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(133, 11, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(134, 12, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(135, 13, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(136, 14, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(137, 15, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(138, 16, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(139, 17, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(140, 18, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(141, 19, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(142, 20, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(143, 21, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(144, 22, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(145, 23, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(146, 24, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(147, 25, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(148, 26, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(149, 27, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(150, 28, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(151, 29, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(152, 30, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(153, 31, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(154, 32, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(155, 33, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(156, 34, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(157, 35, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(158, 36, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(159, 40, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(160, 42, 1, 13, '8797', '10', '2021-09-04 13:56:49', '2021-09-04 13:56:49'),
(161, 1, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(162, 2, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(163, 3, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(164, 4, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(165, 5, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(166, 6, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(167, 7, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(168, 8, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(169, 9, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(170, 10, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(171, 11, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(172, 12, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(173, 13, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(174, 14, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(175, 15, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(176, 16, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(177, 17, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(178, 18, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(179, 19, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(180, 20, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(181, 21, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(182, 22, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(183, 23, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(184, 24, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(185, 25, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(186, 26, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(187, 27, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(188, 28, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(189, 29, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(190, 30, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(191, 31, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(192, 32, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(193, 33, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(194, 34, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(195, 35, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(196, 36, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(197, 40, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(198, 42, 1, 17, '11623', '10', '2021-09-04 15:28:22', '2021-09-04 15:28:22'),
(199, 1, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(200, 2, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(201, 3, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(202, 4, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(203, 5, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(204, 6, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(205, 7, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(206, 8, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(207, 9, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(208, 10, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(209, 11, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(210, 12, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(211, 13, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(212, 14, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(213, 15, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(214, 16, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(215, 17, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(216, 18, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(217, 19, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(218, 20, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(219, 21, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(220, 22, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(221, 23, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(222, 24, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(223, 25, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(224, 26, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(225, 27, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(226, 28, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(227, 29, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(228, 30, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(229, 31, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(230, 32, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(231, 33, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(232, 34, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(233, 35, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(234, 36, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(235, 40, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(236, 42, 1, 19, '11623', '10', '2021-09-04 16:06:37', '2021-09-04 16:06:37'),
(237, 1, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(238, 2, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(239, 3, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(240, 4, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(241, 5, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(242, 6, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(243, 7, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(244, 8, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(245, 9, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(246, 10, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(247, 11, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(248, 12, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(249, 13, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(250, 14, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(251, 15, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(252, 16, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(253, 17, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(254, 18, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(255, 19, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(256, 20, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(257, 21, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(258, 22, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(259, 23, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(260, 24, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(261, 25, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(262, 26, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(263, 27, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(264, 28, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(265, 29, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(266, 30, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(267, 31, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(268, 32, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(269, 33, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(270, 34, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(271, 35, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(272, 36, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(273, 40, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(274, 42, 1, 23, '12710', '10', '2021-09-05 08:23:29', '2021-09-05 08:23:29'),
(275, 1, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(276, 2, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(277, 3, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(278, 4, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(279, 5, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(280, 6, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(281, 7, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(282, 8, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(283, 9, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(284, 10, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(285, 11, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(286, 12, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(287, 13, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(288, 14, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(289, 15, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(290, 16, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(291, 17, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(292, 18, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(293, 19, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(294, 20, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(295, 21, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(296, 22, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(297, 23, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(298, 24, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(299, 25, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(300, 26, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(301, 27, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(302, 28, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(303, 29, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(304, 30, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(305, 31, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(306, 32, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(307, 33, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(308, 34, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(309, 35, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(310, 36, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(311, 40, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(312, 42, 1, 24, '12713', '10', '2021-09-05 09:16:50', '2021-09-05 09:16:50'),
(313, 1, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(314, 2, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(315, 3, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(316, 4, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(317, 5, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(318, 6, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(319, 7, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(320, 8, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(321, 9, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(322, 10, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(323, 11, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(324, 12, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(325, 13, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(326, 14, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(327, 15, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(328, 16, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(329, 17, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(330, 18, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(331, 19, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(332, 20, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(333, 21, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(334, 22, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(335, 23, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(336, 24, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(337, 25, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(338, 26, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(339, 27, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(340, 28, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(341, 29, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(342, 30, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(343, 31, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(344, 32, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(345, 33, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(346, 34, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(347, 35, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(348, 36, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(349, 40, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(350, 42, 1, 26, '11618', '10', '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(351, 1, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(352, 2, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(353, 3, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(354, 4, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(355, 5, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(356, 6, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(357, 7, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(358, 8, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(359, 9, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(360, 10, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(361, 11, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(362, 12, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(363, 13, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(364, 14, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(365, 15, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(366, 16, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(367, 17, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(368, 18, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(369, 19, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(370, 20, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(371, 21, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(372, 22, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(373, 23, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(374, 24, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(375, 25, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(376, 26, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(377, 27, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(378, 28, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(379, 29, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(380, 30, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(381, 31, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(382, 32, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(383, 33, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(384, 34, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(385, 35, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(386, 36, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(387, 40, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(388, 42, 1, 27, '11623', '10', '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(389, 1, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(390, 2, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(391, 3, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(392, 4, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(393, 5, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(394, 6, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(395, 7, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(396, 8, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(397, 9, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(398, 10, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(399, 11, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(400, 12, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(401, 13, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(402, 14, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(403, 15, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(404, 16, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(405, 17, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(406, 18, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(407, 19, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(408, 20, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(409, 21, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(410, 22, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(411, 23, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(412, 24, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(413, 25, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(414, 26, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(415, 27, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(416, 28, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(417, 29, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(418, 30, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(419, 31, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(420, 32, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(421, 33, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(422, 34, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(423, 35, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(424, 36, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(425, 40, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(426, 42, 3, 34, '6944', '10', '2021-09-06 11:39:19', '2021-09-06 11:39:19'),
(427, 1, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(428, 2, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(429, 3, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(430, 4, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(431, 5, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(432, 6, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(433, 7, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(434, 8, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(435, 9, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(436, 10, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(437, 11, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(438, 12, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(439, 13, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(440, 14, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(441, 15, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(442, 16, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(443, 17, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(444, 18, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(445, 19, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(446, 20, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(447, 21, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(448, 22, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(449, 23, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(450, 24, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(451, 25, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(452, 26, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(453, 27, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(454, 28, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(455, 29, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(456, 30, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(457, 31, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(458, 32, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(459, 33, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(460, 34, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(461, 35, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(462, 36, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(463, 40, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(464, 42, 3, 2, '6939', '10', '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(465, 1, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(466, 2, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(467, 3, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(468, 4, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(469, 5, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(470, 6, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(471, 7, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(472, 8, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(473, 9, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(474, 10, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(475, 11, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(476, 12, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(477, 13, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(478, 14, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(479, 15, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(480, 16, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(481, 17, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(482, 18, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(483, 19, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(484, 20, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(485, 21, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(486, 22, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(487, 23, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(488, 24, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(489, 25, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(490, 26, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(491, 27, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(492, 28, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(493, 29, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(494, 30, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(495, 31, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(496, 32, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(497, 33, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(498, 34, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(499, 35, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(500, 36, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(501, 40, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(502, 42, 1, 3, '12713', '10', '2021-09-07 09:18:37', '2021-09-07 09:18:37'),
(503, 1, 1, 6, '12713', '10', '2021-09-07 09:51:59', '2021-09-07 09:51:59'),
(504, 2, 1, 6, '12713', '10', '2021-09-07 09:51:59', '2021-09-07 09:51:59'),
(505, 3, 1, 6, '12713', '10', '2021-09-07 09:51:59', '2021-09-07 09:51:59'),
(506, 4, 1, 6, '12713', '10', '2021-09-07 09:51:59', '2021-09-07 09:51:59'),
(507, 5, 1, 6, '12713', '10', '2021-09-07 09:51:59', '2021-09-07 09:51:59'),
(508, 6, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(509, 7, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(510, 8, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(511, 9, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(512, 10, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(513, 11, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(514, 12, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(515, 13, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(516, 14, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(517, 15, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(518, 16, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(519, 17, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(520, 18, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(521, 19, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(522, 20, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(523, 21, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(524, 22, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(525, 23, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(526, 24, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(527, 25, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(528, 26, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(529, 27, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(530, 28, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(531, 29, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(532, 30, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(533, 31, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(534, 32, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(535, 33, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(536, 34, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(537, 35, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(538, 36, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(539, 40, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(540, 42, 1, 6, '12713', '10', '2021-09-07 09:52:00', '2021-09-07 09:52:00'),
(541, 1, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(542, 2, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(543, 3, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(544, 4, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(545, 5, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(546, 6, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(547, 7, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(548, 8, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(549, 9, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(550, 10, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(551, 11, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(552, 12, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(553, 13, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(554, 14, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(555, 15, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(556, 16, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(557, 17, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(558, 18, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(559, 19, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(560, 20, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(561, 21, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(562, 22, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(563, 23, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(564, 24, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(565, 25, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(566, 26, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(567, 27, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(568, 28, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(569, 29, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(570, 30, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(571, 31, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(572, 32, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(573, 33, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(574, 34, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(575, 35, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(576, 36, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(577, 40, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(578, 42, 1, 7, '12712', '10', '2021-09-07 10:37:23', '2021-09-07 10:37:23'),
(579, 1, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(580, 2, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(581, 3, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(582, 4, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(583, 5, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(584, 6, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(585, 7, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(586, 8, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(587, 9, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(588, 10, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(589, 11, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(590, 12, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(591, 13, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(592, 14, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(593, 15, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(594, 16, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(595, 17, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(596, 18, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(597, 19, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(598, 20, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(599, 21, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(600, 22, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(601, 23, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(602, 24, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(603, 25, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(604, 26, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(605, 27, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(606, 28, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(607, 29, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(608, 30, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(609, 31, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(610, 32, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(611, 33, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(612, 34, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(613, 35, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(614, 36, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(615, 40, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(616, 42, 1, 8, '12712', '10', '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(617, 1, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(618, 2, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(619, 3, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(620, 4, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(621, 5, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(622, 6, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(623, 7, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(624, 8, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(625, 9, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(626, 10, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(627, 11, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(628, 12, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(629, 13, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(630, 14, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(631, 15, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(632, 16, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(633, 17, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(634, 18, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(635, 19, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(636, 20, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(637, 21, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(638, 22, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(639, 23, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(640, 24, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(641, 25, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(642, 26, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(643, 27, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(644, 28, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(645, 29, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(646, 30, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(647, 31, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(648, 32, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(649, 33, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(650, 34, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(651, 35, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(652, 36, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(653, 40, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(654, 42, 1, 9, '12714', '10', '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(655, 1, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(656, 2, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(657, 3, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51');
INSERT INTO `search_driver` (`id`, `driver_id`, `vehicle_id`, `pickup_id`, `km`, `time`, `created_at`, `updated_at`) VALUES
(658, 4, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(659, 5, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(660, 6, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(661, 7, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(662, 8, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(663, 9, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(664, 10, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(665, 11, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(666, 12, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(667, 13, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(668, 14, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(669, 15, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(670, 16, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(671, 17, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(672, 18, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(673, 19, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(674, 20, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(675, 21, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(676, 22, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(677, 23, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(678, 24, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(679, 25, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(680, 26, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(681, 27, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(682, 28, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(683, 29, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(684, 30, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(685, 31, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(686, 32, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(687, 33, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(688, 34, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(689, 35, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(690, 36, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(691, 40, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(692, 42, 1, 6, '12713', '10', '2021-09-07 11:06:51', '2021-09-07 11:06:51'),
(693, 1, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(694, 2, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(695, 3, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(696, 4, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(697, 5, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(698, 6, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(699, 7, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(700, 8, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(701, 9, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(702, 10, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(703, 11, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(704, 12, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(705, 13, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(706, 14, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(707, 15, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(708, 16, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(709, 17, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(710, 18, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(711, 19, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(712, 20, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(713, 21, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(714, 22, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(715, 23, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(716, 24, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(717, 25, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(718, 26, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(719, 27, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(720, 28, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(721, 29, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(722, 30, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(723, 31, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(724, 32, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(725, 33, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(726, 34, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(727, 35, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(728, 36, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(729, 40, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(730, 42, 1, 10, '12713', '10', '2021-09-07 11:34:27', '2021-09-07 11:34:27'),
(731, 1, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(732, 2, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(733, 3, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(734, 4, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(735, 5, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(736, 6, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(737, 7, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(738, 8, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(739, 9, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(740, 10, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(741, 11, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(742, 12, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(743, 13, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(744, 14, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(745, 15, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(746, 16, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(747, 17, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(748, 18, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(749, 19, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(750, 20, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(751, 21, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(752, 22, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(753, 23, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(754, 24, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(755, 25, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(756, 26, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(757, 27, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(758, 28, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(759, 29, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(760, 30, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(761, 31, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(762, 32, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(763, 33, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(764, 34, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(765, 35, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(766, 36, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(767, 40, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(768, 42, 1, 11, '12713', '10', '2021-09-07 11:53:11', '2021-09-07 11:53:11'),
(769, 1, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(770, 2, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(771, 3, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(772, 4, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(773, 5, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(774, 6, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(775, 7, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(776, 8, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(777, 9, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(778, 10, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(779, 11, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(780, 12, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(781, 13, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(782, 14, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(783, 15, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(784, 16, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(785, 17, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(786, 18, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(787, 19, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(788, 20, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(789, 21, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(790, 22, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(791, 23, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(792, 24, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(793, 25, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(794, 26, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(795, 27, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(796, 28, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(797, 29, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(798, 30, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(799, 31, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(800, 32, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(801, 33, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(802, 34, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(803, 35, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(804, 36, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(805, 40, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(806, 42, 1, 12, '12713', '10', '2021-09-07 12:07:02', '2021-09-07 12:07:02'),
(807, 1, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(808, 2, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(809, 3, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(810, 4, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(811, 5, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(812, 6, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(813, 7, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(814, 8, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(815, 9, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(816, 10, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(817, 11, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(818, 12, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(819, 13, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(820, 14, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(821, 15, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(822, 16, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(823, 17, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(824, 18, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(825, 19, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(826, 20, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(827, 21, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(828, 22, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(829, 23, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(830, 24, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(831, 25, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(832, 26, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(833, 27, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(834, 28, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(835, 29, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(836, 30, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(837, 31, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(838, 32, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(839, 33, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(840, 34, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(841, 35, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(842, 36, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(843, 40, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(844, 42, 1, 13, '12713', '10', '2021-09-07 13:23:17', '2021-09-07 13:23:17'),
(845, 1, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(846, 2, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(847, 3, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(848, 4, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(849, 5, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(850, 6, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(851, 7, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(852, 8, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(853, 9, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(854, 10, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(855, 11, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(856, 12, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(857, 13, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(858, 14, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(859, 15, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(860, 16, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(861, 17, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(862, 18, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(863, 19, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(864, 20, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(865, 21, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(866, 22, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(867, 23, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(868, 24, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(869, 25, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(870, 26, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(871, 27, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(872, 28, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(873, 29, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(874, 30, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(875, 31, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(876, 32, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(877, 33, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(878, 34, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(879, 35, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(880, 36, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(881, 40, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(882, 42, 1, 6, '12713', '10', '2021-09-07 13:30:48', '2021-09-07 13:30:48'),
(883, 1, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(884, 2, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(885, 3, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(886, 4, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(887, 5, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(888, 6, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(889, 7, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(890, 8, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(891, 9, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(892, 10, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(893, 11, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(894, 12, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(895, 13, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(896, 14, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(897, 15, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(898, 16, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(899, 17, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(900, 18, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(901, 19, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(902, 20, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(903, 21, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(904, 22, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(905, 23, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(906, 24, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(907, 25, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(908, 26, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(909, 27, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(910, 28, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(911, 29, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(912, 30, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(913, 31, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(914, 32, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(915, 33, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(916, 34, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(917, 35, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(918, 36, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(919, 40, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(920, 42, 1, 6, '12713', '10', '2021-09-07 13:32:55', '2021-09-07 13:32:55'),
(921, 1, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(922, 2, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(923, 3, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(924, 4, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(925, 5, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(926, 6, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(927, 7, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(928, 8, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(929, 9, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(930, 10, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(931, 11, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(932, 12, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(933, 13, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(934, 14, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(935, 15, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(936, 16, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(937, 17, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(938, 18, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(939, 19, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(940, 20, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(941, 21, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(942, 22, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(943, 23, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(944, 24, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(945, 25, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(946, 26, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(947, 27, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(948, 28, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(949, 29, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(950, 30, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(951, 31, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(952, 32, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(953, 33, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(954, 34, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(955, 35, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(956, 36, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(957, 40, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(958, 42, 1, 6, '12713', '10', '2021-09-07 13:33:03', '2021-09-07 13:33:03'),
(959, 1, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(960, 2, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(961, 3, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(962, 4, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(963, 5, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(964, 6, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(965, 7, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(966, 8, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(967, 9, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(968, 10, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(969, 11, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(970, 12, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(971, 13, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(972, 14, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(973, 15, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(974, 16, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(975, 17, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(976, 18, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(977, 19, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(978, 20, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(979, 21, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(980, 22, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(981, 23, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(982, 24, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(983, 25, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(984, 26, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(985, 27, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(986, 28, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(987, 29, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(988, 30, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(989, 31, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(990, 32, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(991, 33, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(992, 34, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(993, 35, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(994, 36, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(995, 40, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(996, 42, 1, 6, '12713', '10', '2021-09-07 13:34:28', '2021-09-07 13:34:28'),
(997, 1, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(998, 2, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(999, 3, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1000, 4, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1001, 5, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1002, 6, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1003, 7, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1004, 8, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1005, 9, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1006, 10, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1007, 11, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1008, 12, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1009, 13, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1010, 14, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1011, 15, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1012, 16, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1013, 17, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1014, 18, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1015, 19, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1016, 20, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1017, 21, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1018, 22, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1019, 23, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1020, 24, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1021, 25, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1022, 26, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1023, 27, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1024, 28, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1025, 29, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1026, 30, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1027, 31, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1028, 32, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1029, 33, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1030, 34, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1031, 35, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1032, 36, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1033, 40, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1034, 42, 1, 14, '12712', '10', '2021-09-07 13:36:23', '2021-09-07 13:36:23'),
(1035, 1, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1036, 2, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1037, 3, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1038, 4, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1039, 5, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1040, 6, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1041, 7, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1042, 8, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1043, 9, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1044, 10, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1045, 11, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1046, 12, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1047, 13, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1048, 14, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1049, 15, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1050, 16, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1051, 17, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1052, 18, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1053, 19, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1054, 20, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1055, 21, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1056, 22, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1057, 23, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1058, 24, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1059, 25, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1060, 26, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1061, 27, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1062, 28, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1063, 29, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1064, 30, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1065, 31, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1066, 32, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1067, 33, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1068, 34, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1069, 35, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1070, 36, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1071, 40, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1072, 42, 1, 15, '6885', '10', '2021-09-07 15:11:18', '2021-09-07 15:11:18'),
(1073, 1, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1074, 2, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1075, 3, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1076, 4, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1077, 5, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1078, 6, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1079, 7, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1080, 8, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1081, 9, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1082, 10, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1083, 11, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1084, 12, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1085, 13, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1086, 14, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1087, 15, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1088, 16, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1089, 17, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1090, 18, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1091, 19, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1092, 20, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1093, 21, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1094, 22, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1095, 23, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1096, 24, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1097, 25, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1098, 26, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1099, 27, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1100, 28, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1101, 29, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1102, 30, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1103, 31, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1104, 32, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1105, 33, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1106, 34, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1107, 35, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1108, 36, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1109, 40, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1110, 42, 5, 16, '6938', '10', '2021-09-07 16:50:04', '2021-09-07 16:50:04'),
(1111, 1, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1112, 2, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1113, 3, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1114, 4, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1115, 5, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1116, 6, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1117, 7, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1118, 8, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1119, 9, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1120, 10, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1121, 11, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1122, 12, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1123, 13, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1124, 14, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1125, 15, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1126, 16, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1127, 17, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1128, 18, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1129, 19, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1130, 20, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1131, 21, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1132, 22, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1133, 23, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1134, 24, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1135, 25, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1136, 26, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1137, 27, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1138, 28, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1139, 29, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1140, 30, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1141, 31, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1142, 32, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1143, 33, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1144, 34, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1145, 35, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1146, 36, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1147, 40, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1148, 42, 2, 17, '6939', '10', '2021-09-07 16:53:31', '2021-09-07 16:53:31'),
(1149, 1, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1150, 2, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1151, 3, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1152, 4, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1153, 5, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1154, 6, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1155, 7, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1156, 8, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1157, 9, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1158, 10, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1159, 11, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1160, 12, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1161, 13, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1162, 14, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1163, 15, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1164, 16, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1165, 17, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1166, 18, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1167, 19, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1168, 20, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1169, 21, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1170, 22, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1171, 23, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1172, 24, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1173, 25, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1174, 26, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1175, 27, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1176, 28, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1177, 29, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1178, 30, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1179, 31, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1180, 32, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1181, 33, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1182, 34, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1183, 35, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1184, 36, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1185, 40, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1186, 42, 5, 18, '6939', '10', '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(1187, 1, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1188, 2, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1189, 3, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1190, 4, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1191, 5, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1192, 6, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1193, 7, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1194, 8, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1195, 9, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1196, 10, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1197, 11, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1198, 12, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1199, 13, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1200, 14, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1201, 15, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1202, 16, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1203, 17, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1204, 18, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1205, 19, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1206, 20, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1207, 21, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1208, 22, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1209, 23, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1210, 24, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1211, 25, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1212, 26, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1213, 27, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1214, 28, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1215, 29, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1216, 30, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1217, 31, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1218, 32, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1219, 33, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1220, 34, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1221, 35, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1222, 36, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1223, 40, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1224, 42, 1, 20, '6939', '10', '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(1225, 1, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1226, 2, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1227, 3, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1228, 4, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1229, 5, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1230, 6, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1231, 7, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1232, 8, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1233, 9, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1234, 10, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1235, 11, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1236, 12, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1237, 13, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1238, 14, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1239, 15, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1240, 16, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1241, 17, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1242, 18, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1243, 19, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1244, 20, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1245, 21, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1246, 22, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1247, 23, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1248, 24, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1249, 25, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1250, 26, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1251, 27, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1252, 28, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1253, 29, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1254, 30, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1255, 31, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1256, 32, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1257, 33, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1258, 34, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1259, 35, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1260, 36, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1261, 40, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1262, 42, 2, 22, '6939', '10', '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(1263, 1, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1264, 2, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1265, 3, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1266, 4, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1267, 5, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1268, 6, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1269, 7, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1270, 8, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1271, 9, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1272, 10, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1273, 11, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1274, 12, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1275, 13, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1276, 14, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1277, 15, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1278, 16, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1279, 17, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1280, 18, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1281, 19, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1282, 20, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1283, 21, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1284, 22, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1285, 23, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1286, 24, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1287, 25, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1288, 26, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1289, 27, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1290, 28, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1291, 29, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1292, 30, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1293, 31, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1294, 32, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1295, 33, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1296, 34, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1297, 35, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1298, 36, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1299, 40, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1300, 42, 1, 24, '11622', '10', '2021-09-07 20:24:00', '2021-09-07 20:24:00'),
(1301, 1, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1302, 2, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1303, 3, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1304, 4, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1305, 5, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1306, 6, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1307, 7, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1308, 8, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49');
INSERT INTO `search_driver` (`id`, `driver_id`, `vehicle_id`, `pickup_id`, `km`, `time`, `created_at`, `updated_at`) VALUES
(1309, 9, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1310, 10, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1311, 11, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1312, 12, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1313, 13, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1314, 14, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1315, 15, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1316, 16, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1317, 17, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1318, 18, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1319, 19, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1320, 20, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1321, 21, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1322, 22, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1323, 23, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1324, 24, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1325, 25, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1326, 26, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1327, 27, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1328, 28, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1329, 29, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1330, 30, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1331, 31, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1332, 32, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1333, 33, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1334, 34, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1335, 35, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1336, 36, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1337, 40, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1338, 42, 1, 25, '11625', '10', '2021-09-08 00:02:49', '2021-09-08 00:02:49'),
(1339, 1, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1340, 2, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1341, 3, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1342, 4, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1343, 5, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1344, 6, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1345, 7, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1346, 8, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1347, 9, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1348, 10, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1349, 11, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1350, 12, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1351, 13, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1352, 14, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1353, 15, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1354, 16, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1355, 17, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1356, 18, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1357, 19, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1358, 20, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1359, 21, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1360, 22, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1361, 23, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1362, 24, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1363, 25, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1364, 26, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1365, 27, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1366, 28, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1367, 29, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1368, 30, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1369, 31, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1370, 32, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1371, 33, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1372, 34, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1373, 35, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1374, 36, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1375, 40, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1376, 42, 1, 27, '11617', '10', '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(1377, 1, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1378, 2, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1379, 3, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1380, 4, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1381, 5, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1382, 6, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1383, 7, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1384, 8, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1385, 9, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1386, 10, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1387, 11, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1388, 12, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1389, 13, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1390, 14, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1391, 15, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1392, 16, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1393, 17, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1394, 18, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1395, 19, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1396, 20, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1397, 21, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1398, 22, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1399, 23, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1400, 24, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1401, 25, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1402, 26, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1403, 27, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1404, 28, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1405, 29, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1406, 30, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1407, 31, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1408, 32, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1409, 33, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1410, 34, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1411, 35, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1412, 36, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1413, 40, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1414, 42, 3, 30, '11609', '10', '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(1415, 1, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1416, 2, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1417, 3, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1418, 4, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1419, 5, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1420, 6, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1421, 7, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1422, 8, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1423, 9, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1424, 10, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1425, 11, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1426, 12, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1427, 13, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1428, 14, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1429, 15, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1430, 16, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1431, 17, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1432, 18, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1433, 19, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1434, 20, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1435, 21, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1436, 22, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1437, 23, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1438, 24, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1439, 25, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1440, 26, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1441, 27, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1442, 28, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1443, 29, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1444, 30, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1445, 31, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1446, 32, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1447, 33, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1448, 34, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1449, 35, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1450, 36, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1451, 40, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1452, 42, 1, 31, '6944', '10', '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(1453, 1, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1454, 2, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1455, 3, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1456, 4, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1457, 5, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1458, 6, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1459, 7, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1460, 8, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1461, 9, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1462, 10, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1463, 11, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1464, 12, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1465, 13, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1466, 14, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1467, 15, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1468, 16, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1469, 17, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1470, 18, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1471, 19, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1472, 20, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1473, 21, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1474, 22, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1475, 23, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1476, 24, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1477, 25, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1478, 26, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1479, 27, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1480, 28, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1481, 29, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1482, 30, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1483, 31, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1484, 32, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1485, 33, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1486, 34, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1487, 35, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1488, 36, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1489, 40, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1490, 42, 3, 33, '11625', '10', '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(1491, 1, 5, 36, '11625', '10', '2021-09-08 08:56:06', '2021-09-08 08:56:06'),
(1492, 2, 5, 36, '11625', '10', '2021-09-08 08:56:06', '2021-09-08 08:56:06'),
(1493, 3, 5, 36, '11625', '10', '2021-09-08 08:56:06', '2021-09-08 08:56:06'),
(1494, 4, 5, 36, '11625', '10', '2021-09-08 08:56:06', '2021-09-08 08:56:06'),
(1495, 5, 5, 36, '11625', '10', '2021-09-08 08:56:06', '2021-09-08 08:56:06'),
(1496, 6, 5, 36, '11625', '10', '2021-09-08 08:56:06', '2021-09-08 08:56:06'),
(1497, 7, 5, 36, '11625', '10', '2021-09-08 08:56:06', '2021-09-08 08:56:06'),
(1498, 8, 5, 36, '11625', '10', '2021-09-08 08:56:06', '2021-09-08 08:56:06'),
(1499, 9, 5, 36, '11625', '10', '2021-09-08 08:56:06', '2021-09-08 08:56:06'),
(1500, 10, 5, 36, '11625', '10', '2021-09-08 08:56:06', '2021-09-08 08:56:06'),
(1501, 11, 5, 36, '11625', '10', '2021-09-08 08:56:06', '2021-09-08 08:56:06'),
(1502, 12, 5, 36, '11625', '10', '2021-09-08 08:56:06', '2021-09-08 08:56:06'),
(1503, 13, 5, 36, '11625', '10', '2021-09-08 08:56:06', '2021-09-08 08:56:06'),
(1504, 14, 5, 36, '11625', '10', '2021-09-08 08:56:06', '2021-09-08 08:56:06'),
(1505, 15, 5, 36, '11625', '10', '2021-09-08 08:56:06', '2021-09-08 08:56:06'),
(1506, 16, 5, 36, '11625', '10', '2021-09-08 08:56:06', '2021-09-08 08:56:06'),
(1507, 17, 5, 36, '11625', '10', '2021-09-08 08:56:06', '2021-09-08 08:56:06'),
(1508, 18, 5, 36, '11625', '10', '2021-09-08 08:56:06', '2021-09-08 08:56:06'),
(1509, 19, 5, 36, '11625', '10', '2021-09-08 08:56:07', '2021-09-08 08:56:07'),
(1510, 20, 5, 36, '11625', '10', '2021-09-08 08:56:07', '2021-09-08 08:56:07'),
(1511, 21, 5, 36, '11625', '10', '2021-09-08 08:56:07', '2021-09-08 08:56:07'),
(1512, 22, 5, 36, '11625', '10', '2021-09-08 08:56:07', '2021-09-08 08:56:07'),
(1513, 23, 5, 36, '11625', '10', '2021-09-08 08:56:07', '2021-09-08 08:56:07'),
(1514, 24, 5, 36, '11625', '10', '2021-09-08 08:56:07', '2021-09-08 08:56:07'),
(1515, 25, 5, 36, '11625', '10', '2021-09-08 08:56:07', '2021-09-08 08:56:07'),
(1516, 26, 5, 36, '11625', '10', '2021-09-08 08:56:07', '2021-09-08 08:56:07'),
(1517, 27, 5, 36, '11625', '10', '2021-09-08 08:56:07', '2021-09-08 08:56:07'),
(1518, 28, 5, 36, '11625', '10', '2021-09-08 08:56:07', '2021-09-08 08:56:07'),
(1519, 29, 5, 36, '11625', '10', '2021-09-08 08:56:07', '2021-09-08 08:56:07'),
(1520, 30, 5, 36, '11625', '10', '2021-09-08 08:56:07', '2021-09-08 08:56:07'),
(1521, 31, 5, 36, '11625', '10', '2021-09-08 08:56:07', '2021-09-08 08:56:07'),
(1522, 32, 5, 36, '11625', '10', '2021-09-08 08:56:07', '2021-09-08 08:56:07'),
(1523, 33, 5, 36, '11625', '10', '2021-09-08 08:56:07', '2021-09-08 08:56:07'),
(1524, 34, 5, 36, '11625', '10', '2021-09-08 08:56:07', '2021-09-08 08:56:07'),
(1525, 35, 5, 36, '11625', '10', '2021-09-08 08:56:07', '2021-09-08 08:56:07'),
(1526, 36, 5, 36, '11625', '10', '2021-09-08 08:56:07', '2021-09-08 08:56:07'),
(1527, 40, 5, 36, '11625', '10', '2021-09-08 08:56:07', '2021-09-08 08:56:07'),
(1528, 42, 5, 36, '11625', '10', '2021-09-08 08:56:07', '2021-09-08 08:56:07'),
(1529, 1, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1530, 2, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1531, 3, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1532, 4, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1533, 5, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1534, 6, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1535, 7, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1536, 8, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1537, 9, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1538, 10, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1539, 11, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1540, 12, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1541, 13, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1542, 14, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1543, 15, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1544, 16, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1545, 17, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1546, 18, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1547, 19, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1548, 20, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1549, 21, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1550, 22, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1551, 23, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1552, 24, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1553, 25, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1554, 26, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1555, 27, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1556, 28, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1557, 29, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1558, 30, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1559, 31, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1560, 32, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1561, 33, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1562, 34, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1563, 35, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1564, 36, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1565, 40, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1566, 42, 5, 37, '11625', '10', '2021-09-08 09:06:07', '2021-09-08 09:06:07'),
(1567, 5, 1, 25, '4731', '10', '2021-09-08 12:17:19', '2021-09-08 12:17:19'),
(1568, 5, 1, 25, '4731', '10', '2021-09-08 12:17:44', '2021-09-08 12:17:44'),
(1569, 5, 1, 25, '4731', '10', '2021-09-08 12:19:30', '2021-09-08 12:19:30'),
(1570, 5, 1, 25, '4731', '10', '2021-09-08 12:20:17', '2021-09-08 12:20:17'),
(1571, 5, 1, 24, '4727', '10', '2021-09-08 12:22:02', '2021-09-08 12:22:02'),
(1572, 5, 1, 24, '160', '10', '2021-09-08 12:23:26', '2021-09-08 12:23:26'),
(1573, 5, 1, 24, '160', '10', '2021-09-08 12:24:51', '2021-09-08 12:24:51'),
(1574, 5, 1, 24, '160', '10', '2021-09-08 12:25:17', '2021-09-08 12:25:17'),
(1575, 5, 1, 24, '160', '10', '2021-09-08 12:28:14', '2021-09-08 12:28:14'),
(1576, 5, 1, 24, '160', '10', '2021-09-08 12:29:48', '2021-09-08 12:29:48'),
(1577, 5, 1, 39, '4695', '10', '2021-09-08 12:30:04', '2021-09-08 12:30:04'),
(1578, 5, 1, 24, '0', '10', '2021-09-08 12:32:05', '2021-09-08 12:32:05'),
(1579, 5, 1, 25, '8', '10', '2021-09-08 12:32:36', '2021-09-08 12:32:36'),
(1580, 5, 1, 25, '8', '10', '2021-09-08 12:33:04', '2021-09-08 12:33:04'),
(1581, 5, 1, 39, '4737', '10', '2021-09-08 12:35:55', '2021-09-08 12:35:55'),
(1582, 5, 1, 40, '11252', '10', '2021-09-08 12:47:30', '2021-09-08 12:47:30'),
(1583, 5, 1, 40, '11252', '10', '2021-09-08 12:47:43', '2021-09-08 12:47:43'),
(1584, 5, 1, 25, '8', '10', '2021-09-08 12:48:59', '2021-09-08 12:48:59'),
(1585, 5, 1, 20, '4746', '10', '2021-09-08 12:49:13', '2021-09-08 12:49:13'),
(1586, 5, 1, 40, '11252', '10', '2021-09-08 12:50:25', '2021-09-08 12:50:25'),
(1587, 5, 1, 40, '11252', '10', '2021-09-08 12:58:17', '2021-09-08 12:58:17'),
(1588, 5, 1, 40, '11252', '10', '2021-09-08 12:59:37', '2021-09-08 12:59:37'),
(1589, 5, 1, 41, '10', '10', '2021-09-08 13:39:02', '2021-09-08 13:39:02'),
(1590, 5, 1, 46, '164', '10', '2021-09-09 05:44:22', '2021-09-09 05:44:22'),
(1591, 43, 1, 46, '13222', '10', '2021-09-09 05:44:22', '2021-09-09 05:44:22'),
(1592, 44, 1, 46, '13222', '10', '2021-09-09 05:44:22', '2021-09-09 05:44:22'),
(1593, 45, 1, 46, '13222', '10', '2021-09-09 05:44:22', '2021-09-09 05:44:22'),
(1594, 46, 1, 46, '13222', '10', '2021-09-09 05:44:22', '2021-09-09 05:44:22'),
(1595, 47, 1, 46, '13222', '10', '2021-09-09 05:44:22', '2021-09-09 05:44:22'),
(1596, 48, 1, 46, '13222', '10', '2021-09-09 05:44:22', '2021-09-09 05:44:22'),
(1597, 50, 1, 46, '13222', '10', '2021-09-09 05:44:22', '2021-09-09 05:44:22'),
(1598, 51, 1, 46, '13222', '10', '2021-09-09 05:44:22', '2021-09-09 05:44:22'),
(1599, 52, 1, 46, '13222', '10', '2021-09-09 05:44:22', '2021-09-09 05:44:22'),
(1600, 53, 1, 46, '13222', '10', '2021-09-09 05:44:22', '2021-09-09 05:44:22'),
(1601, 5, 1, 47, '20', '10', '2021-09-09 14:26:38', '2021-09-09 14:26:38'),
(1602, 54, 1, 47, '13333', '10', '2021-09-09 14:26:38', '2021-09-09 14:26:38'),
(1603, 55, 1, 47, '13333', '10', '2021-09-09 14:26:38', '2021-09-09 14:26:38'),
(1604, 56, 1, 47, '13333', '10', '2021-09-09 14:26:38', '2021-09-09 14:26:38'),
(1605, 57, 1, 47, '13333', '10', '2021-09-09 14:26:38', '2021-09-09 14:26:38'),
(1606, 59, 1, 47, '13333', '10', '2021-09-09 14:26:38', '2021-09-09 14:26:38'),
(1607, 60, 1, 47, '13333', '10', '2021-09-09 14:26:38', '2021-09-09 14:26:38'),
(1608, 61, 1, 47, '13333', '10', '2021-09-09 14:26:38', '2021-09-09 14:26:38'),
(1609, 62, 1, 47, '13333', '10', '2021-09-09 14:26:38', '2021-09-09 14:26:38'),
(1610, 63, 1, 47, '13333', '10', '2021-09-09 14:26:38', '2021-09-09 14:26:38'),
(1611, 64, 1, 47, '13333', '10', '2021-09-09 14:26:38', '2021-09-09 14:26:38'),
(1612, 65, 1, 47, '13333', '10', '2021-09-09 14:26:38', '2021-09-09 14:26:38'),
(1613, 66, 1, 47, '13333', '10', '2021-09-09 14:26:38', '2021-09-09 14:26:38'),
(1614, 67, 1, 47, '13333', '10', '2021-09-09 14:26:38', '2021-09-09 14:26:38'),
(1615, 69, 1, 47, '13333', '10', '2021-09-09 14:26:38', '2021-09-09 14:26:38'),
(1616, 70, 1, 47, '13333', '10', '2021-09-09 14:26:38', '2021-09-09 14:26:38'),
(1617, 5, 1, 48, '488', '10', '2021-09-09 17:12:07', '2021-09-09 17:12:07'),
(1618, 78, 1, 48, '488', '10', '2021-09-09 17:12:07', '2021-09-09 17:12:07'),
(1619, 5, 1, 50, '4745', '10', '2021-09-09 18:06:37', '2021-09-09 18:06:37'),
(1620, 78, 1, 50, '4745', '10', '2021-09-09 18:06:37', '2021-09-09 18:06:37'),
(1621, 5, 1, 50, '4745', '10', '2021-09-09 18:06:41', '2021-09-09 18:06:41'),
(1622, 78, 1, 50, '4745', '10', '2021-09-09 18:06:41', '2021-09-09 18:06:41'),
(1623, 5, 1, 50, '4745', '10', '2021-09-09 18:06:44', '2021-09-09 18:06:44'),
(1624, 78, 1, 50, '4745', '10', '2021-09-09 18:06:44', '2021-09-09 18:06:44'),
(1625, 5, 1, 50, '4745', '10', '2021-09-09 18:07:32', '2021-09-09 18:07:32'),
(1626, 78, 1, 50, '4745', '10', '2021-09-09 18:07:32', '2021-09-09 18:07:32'),
(1627, 5, 1, 50, '4745', '10', '2021-09-09 18:07:43', '2021-09-09 18:07:43'),
(1628, 78, 1, 50, '4745', '10', '2021-09-09 18:07:43', '2021-09-09 18:07:43'),
(1629, 5, 1, 51, '32', '10', '2021-09-10 04:06:44', '2021-09-10 04:06:44'),
(1630, 78, 1, 51, '32', '10', '2021-09-10 04:06:44', '2021-09-10 04:06:44'),
(1631, 5, 1, 53, '42', '10', '2021-09-10 04:21:02', '2021-09-10 04:21:02'),
(1632, 78, 1, 53, '42', '10', '2021-09-10 04:21:02', '2021-09-10 04:21:02'),
(1633, 5, 9, 55, '4739', '10', '2021-09-10 05:26:03', '2021-09-10 05:26:03'),
(1634, 78, 9, 55, '4739', '10', '2021-09-10 05:26:03', '2021-09-10 05:26:03'),
(1635, 5, 9, 55, '4739', '10', '2021-09-10 05:26:08', '2021-09-10 05:26:08'),
(1636, 78, 9, 55, '4739', '10', '2021-09-10 05:26:08', '2021-09-10 05:26:08'),
(1637, 5, 9, 55, '4739', '10', '2021-09-10 05:26:16', '2021-09-10 05:26:16'),
(1638, 78, 9, 55, '4739', '10', '2021-09-10 05:26:16', '2021-09-10 05:26:16'),
(1639, 5, 9, 55, '4739', '10', '2021-09-10 05:27:05', '2021-09-10 05:27:05'),
(1640, 78, 9, 55, '4739', '10', '2021-09-10 05:27:05', '2021-09-10 05:27:05'),
(1641, 5, 1, 56, '12', '10', '2021-09-10 06:55:51', '2021-09-10 06:55:51'),
(1642, 78, 1, 56, '12', '10', '2021-09-10 06:55:51', '2021-09-10 06:55:51'),
(1643, 5, 1, 58, '4737', '10', '2021-09-10 07:32:59', '2021-09-10 07:32:59'),
(1644, 78, 1, 58, '4737', '10', '2021-09-10 07:32:59', '2021-09-10 07:32:59'),
(1645, 5, 1, 59, '4737', '10', '2021-09-10 07:33:40', '2021-09-10 07:33:40'),
(1646, 78, 1, 59, '4737', '10', '2021-09-10 07:33:40', '2021-09-10 07:33:40'),
(1647, 5, 1, 63, '4', '10', '2021-09-10 07:49:30', '2021-09-10 07:49:30'),
(1648, 78, 1, 63, '4', '10', '2021-09-10 07:49:30', '2021-09-10 07:49:30'),
(1649, 5, 1, 64, '4738', '10', '2021-09-10 07:53:09', '2021-09-10 07:53:09'),
(1650, 78, 1, 64, '4738', '10', '2021-09-10 07:53:09', '2021-09-10 07:53:09'),
(1651, 5, 9, 70, '10', '10', '2021-09-10 10:58:47', '2021-09-10 10:58:47'),
(1652, 78, 9, 70, '10', '10', '2021-09-10 10:58:47', '2021-09-10 10:58:47'),
(1653, 5, 1, 71, '20', '10', '2021-09-10 11:12:41', '2021-09-10 11:12:41'),
(1654, 78, 1, 71, '20', '10', '2021-09-10 11:12:41', '2021-09-10 11:12:41'),
(1655, 5, 1, 73, '4738', '10', '2021-09-10 12:00:24', '2021-09-10 12:00:24'),
(1656, 78, 1, 73, '4738', '10', '2021-09-10 12:00:24', '2021-09-10 12:00:24'),
(1657, 5, 1, 74, '11255', '10', '2021-09-10 12:53:13', '2021-09-10 12:53:13'),
(1658, 78, 1, 74, '11255', '10', '2021-09-10 12:53:13', '2021-09-10 12:53:13'),
(1659, 5, 1, 74, '11255', '10', '2021-09-10 12:53:24', '2021-09-10 12:53:24'),
(1660, 78, 1, 74, '11255', '10', '2021-09-10 12:53:24', '2021-09-10 12:53:24'),
(1661, 5, 1, 75, '6', '10', '2021-09-10 13:37:57', '2021-09-10 13:37:57'),
(1662, 78, 1, 75, '6', '10', '2021-09-10 13:37:57', '2021-09-10 13:37:57'),
(1663, 5, 1, 78, '186', '10', '2021-09-10 16:33:15', '2021-09-10 16:33:15'),
(1664, 78, 1, 78, '186', '10', '2021-09-10 16:33:15', '2021-09-10 16:33:15'),
(1665, 5, 1, 79, '9', '10', '2021-09-10 23:50:23', '2021-09-10 23:50:23'),
(1666, 78, 1, 79, '9', '10', '2021-09-10 23:50:23', '2021-09-10 23:50:23'),
(1667, 5, 1, 80, '321', '10', '2021-09-11 03:00:00', '2021-09-11 03:00:00'),
(1668, 78, 1, 80, '321', '10', '2021-09-11 03:00:00', '2021-09-11 03:00:00'),
(1669, 5, 1, 81, '15', '10', '2021-09-11 03:49:22', '2021-09-11 03:49:22'),
(1670, 78, 1, 81, '15', '10', '2021-09-11 03:49:22', '2021-09-11 03:49:22'),
(1671, 5, 1, 84, '8', '10', '2021-09-11 09:47:35', '2021-09-11 09:47:35'),
(1672, 78, 1, 84, '11797', '10', '2021-09-11 09:47:35', '2021-09-11 09:47:35'),
(1673, 79, 1, 84, '13334', '10', '2021-09-11 09:47:35', '2021-09-11 09:47:35'),
(1674, 80, 1, 84, '13334', '10', '2021-09-11 09:47:35', '2021-09-11 09:47:35'),
(1675, 5, 1, 86, '8', '10', '2021-09-12 01:00:43', '2021-09-12 01:00:43'),
(1676, 78, 1, 86, '11797', '10', '2021-09-12 01:00:43', '2021-09-12 01:00:43'),
(1677, 79, 1, 86, '13334', '10', '2021-09-12 01:00:43', '2021-09-12 01:00:43'),
(1678, 80, 1, 86, '13334', '10', '2021-09-12 01:00:43', '2021-09-12 01:00:43'),
(1679, 81, 1, 86, '13334', '10', '2021-09-12 01:00:43', '2021-09-12 01:00:43'),
(1680, 5, 1, 93, '11253', '10', '2021-09-12 17:11:43', '2021-09-12 17:11:43'),
(1681, 78, 1, 93, '12607', '10', '2021-09-12 17:11:43', '2021-09-12 17:11:43'),
(1682, 79, 1, 93, '12781', '10', '2021-09-12 17:11:43', '2021-09-12 17:11:43'),
(1683, 80, 1, 93, '12781', '10', '2021-09-12 17:11:43', '2021-09-12 17:11:43'),
(1684, 81, 1, 93, '12781', '10', '2021-09-12 17:11:43', '2021-09-12 17:11:43'),
(1685, 5, 1, 93, '11253', '10', '2021-09-12 17:11:52', '2021-09-12 17:11:52'),
(1686, 78, 1, 93, '12607', '10', '2021-09-12 17:11:52', '2021-09-12 17:11:52'),
(1687, 79, 1, 93, '12781', '10', '2021-09-12 17:11:52', '2021-09-12 17:11:52'),
(1688, 80, 1, 93, '12781', '10', '2021-09-12 17:11:52', '2021-09-12 17:11:52'),
(1689, 81, 1, 93, '12781', '10', '2021-09-12 17:11:52', '2021-09-12 17:11:52'),
(1690, 5, 1, 95, '186', '10', '2021-09-13 09:34:50', '2021-09-13 09:34:50'),
(1691, 78, 1, 95, '11738', '10', '2021-09-13 09:34:50', '2021-09-13 09:34:50'),
(1692, 79, 1, 95, '13305', '10', '2021-09-13 09:34:50', '2021-09-13 09:34:50'),
(1693, 80, 1, 95, '13305', '10', '2021-09-13 09:34:50', '2021-09-13 09:34:50'),
(1694, 81, 1, 95, '13305', '10', '2021-09-13 09:34:50', '2021-09-13 09:34:50'),
(1695, 5, 4, 96, '186', '10', '2021-09-13 10:01:29', '2021-09-13 10:01:29'),
(1696, 78, 4, 96, '11738', '10', '2021-09-13 10:01:29', '2021-09-13 10:01:29'),
(1697, 79, 4, 96, '13305', '10', '2021-09-13 10:01:29', '2021-09-13 10:01:29'),
(1698, 80, 4, 96, '13305', '10', '2021-09-13 10:01:29', '2021-09-13 10:01:29'),
(1699, 81, 4, 96, '13305', '10', '2021-09-13 10:01:29', '2021-09-13 10:01:29'),
(1700, 5, 1, 97, '186', '10', '2021-09-13 10:31:27', '2021-09-13 10:31:27'),
(1701, 78, 1, 97, '11738', '10', '2021-09-13 10:31:27', '2021-09-13 10:31:27'),
(1702, 79, 1, 97, '13305', '10', '2021-09-13 10:31:27', '2021-09-13 10:31:27'),
(1703, 80, 1, 97, '13305', '10', '2021-09-13 10:31:27', '2021-09-13 10:31:27'),
(1704, 81, 1, 97, '13305', '10', '2021-09-13 10:31:27', '2021-09-13 10:31:27'),
(1705, 5, 1, 98, '6', '10', '2021-09-15 08:53:28', '2021-09-15 08:53:28'),
(1706, 78, 1, 98, '6', '10', '2021-09-15 08:53:28', '2021-09-15 08:53:28'),
(1707, 79, 1, 98, '13334', '10', '2021-09-15 08:53:28', '2021-09-15 08:53:28'),
(1708, 5, 1, 99, '20', '10', '2021-09-15 09:01:22', '2021-09-15 09:01:22'),
(1709, 78, 1, 99, '20', '10', '2021-09-15 09:01:22', '2021-09-15 09:01:22'),
(1710, 79, 1, 99, '13323', '10', '2021-09-15 09:01:22', '2021-09-15 09:01:22'),
(1711, 5, 1, 100, '186', '10', '2021-09-15 12:31:00', '2021-09-15 12:31:00'),
(1712, 78, 1, 100, '186', '10', '2021-09-15 12:31:00', '2021-09-15 12:31:00'),
(1713, 79, 1, 100, '13305', '10', '2021-09-15 12:31:00', '2021-09-15 12:31:00'),
(1714, 5, 1, 101, '186', '10', '2021-09-15 14:10:21', '2021-09-15 14:10:21'),
(1715, 78, 1, 101, '186', '10', '2021-09-15 14:10:21', '2021-09-15 14:10:21'),
(1716, 79, 1, 101, '13305', '10', '2021-09-15 14:10:21', '2021-09-15 14:10:21'),
(1717, 5, 1, 102, '6', '10', '2021-09-15 15:41:02', '2021-09-15 15:41:02'),
(1718, 78, 1, 102, '6', '10', '2021-09-15 15:41:02', '2021-09-15 15:41:02'),
(1719, 79, 1, 102, '13334', '10', '2021-09-15 15:41:02', '2021-09-15 15:41:02'),
(1720, 5, 1, 104, '186', '10', '2021-09-15 16:40:32', '2021-09-15 16:40:32'),
(1721, 78, 1, 104, '11738', '10', '2021-09-15 16:40:32', '2021-09-15 16:40:32'),
(1722, 79, 1, 104, '13305', '10', '2021-09-15 16:40:32', '2021-09-15 16:40:32'),
(1723, 5, 1, 111, '4003', '10', '2021-09-15 17:13:48', '2021-09-15 17:13:48'),
(1724, 78, 1, 111, '7797', '10', '2021-09-15 17:13:48', '2021-09-15 17:13:48'),
(1725, 79, 1, 111, '9405', '10', '2021-09-15 17:13:48', '2021-09-15 17:13:48'),
(1726, 5, 1, 111, '4003', '10', '2021-09-15 17:13:55', '2021-09-15 17:13:55'),
(1727, 78, 1, 111, '7797', '10', '2021-09-15 17:13:55', '2021-09-15 17:13:55'),
(1728, 79, 1, 111, '9405', '10', '2021-09-15 17:13:55', '2021-09-15 17:13:55'),
(1729, 5, 1, 111, '4003', '10', '2021-09-15 17:13:58', '2021-09-15 17:13:58'),
(1730, 78, 1, 111, '7797', '10', '2021-09-15 17:13:58', '2021-09-15 17:13:58'),
(1731, 79, 1, 111, '9405', '10', '2021-09-15 17:13:58', '2021-09-15 17:13:58'),
(1732, 5, 1, 111, '4003', '10', '2021-09-15 17:14:01', '2021-09-15 17:14:01'),
(1733, 78, 1, 111, '7797', '10', '2021-09-15 17:14:01', '2021-09-15 17:14:01'),
(1734, 79, 1, 111, '9405', '10', '2021-09-15 17:14:01', '2021-09-15 17:14:01'),
(1735, 5, 1, 111, '4003', '10', '2021-09-15 17:14:03', '2021-09-15 17:14:03'),
(1736, 78, 1, 111, '7797', '10', '2021-09-15 17:14:03', '2021-09-15 17:14:03'),
(1737, 79, 1, 111, '9405', '10', '2021-09-15 17:14:03', '2021-09-15 17:14:03'),
(1738, 5, 1, 111, '4003', '10', '2021-09-15 17:14:05', '2021-09-15 17:14:05'),
(1739, 78, 1, 111, '7797', '10', '2021-09-15 17:14:05', '2021-09-15 17:14:05'),
(1740, 79, 1, 111, '9405', '10', '2021-09-15 17:14:05', '2021-09-15 17:14:05'),
(1741, 5, 1, 111, '4003', '10', '2021-09-15 17:14:07', '2021-09-15 17:14:07'),
(1742, 78, 1, 111, '7797', '10', '2021-09-15 17:14:07', '2021-09-15 17:14:07'),
(1743, 79, 1, 111, '9405', '10', '2021-09-15 17:14:07', '2021-09-15 17:14:07'),
(1744, 5, 1, 111, '4003', '10', '2021-09-15 17:14:10', '2021-09-15 17:14:10'),
(1745, 78, 1, 111, '7797', '10', '2021-09-15 17:14:10', '2021-09-15 17:14:10'),
(1746, 79, 1, 111, '9405', '10', '2021-09-15 17:14:10', '2021-09-15 17:14:10'),
(1747, 5, 1, 111, '4003', '10', '2021-09-15 17:14:12', '2021-09-15 17:14:12'),
(1748, 78, 1, 111, '7797', '10', '2021-09-15 17:14:12', '2021-09-15 17:14:12'),
(1749, 79, 1, 111, '9405', '10', '2021-09-15 17:14:12', '2021-09-15 17:14:12'),
(1750, 5, 1, 111, '4003', '10', '2021-09-15 17:14:23', '2021-09-15 17:14:23'),
(1751, 78, 1, 111, '7797', '10', '2021-09-15 17:14:23', '2021-09-15 17:14:23'),
(1752, 79, 1, 111, '9405', '10', '2021-09-15 17:14:23', '2021-09-15 17:14:23'),
(1753, 5, 1, 111, '4003', '10', '2021-09-15 17:14:39', '2021-09-15 17:14:39'),
(1754, 78, 1, 111, '7797', '10', '2021-09-15 17:14:39', '2021-09-15 17:14:39'),
(1755, 79, 1, 111, '9405', '10', '2021-09-15 17:14:39', '2021-09-15 17:14:39'),
(1756, 5, 1, 111, '4003', '10', '2021-09-15 17:19:05', '2021-09-15 17:19:05'),
(1757, 78, 1, 111, '7797', '10', '2021-09-15 17:19:05', '2021-09-15 17:19:05'),
(1758, 79, 1, 111, '9405', '10', '2021-09-15 17:19:05', '2021-09-15 17:19:05'),
(1759, 5, 2, 112, '377', '10', '2021-09-15 17:37:07', '2021-09-15 17:37:07'),
(1760, 78, 2, 112, '12130', '10', '2021-09-15 17:37:07', '2021-09-15 17:37:07'),
(1761, 79, 2, 112, '13637', '10', '2021-09-15 17:37:07', '2021-09-15 17:37:07'),
(1762, 5, 1, 113, '9', '10', '2021-09-15 18:00:55', '2021-09-15 18:00:55'),
(1763, 78, 1, 113, '11795', '10', '2021-09-15 18:00:55', '2021-09-15 18:00:55'),
(1764, 79, 1, 113, '13333', '10', '2021-09-15 18:00:55', '2021-09-15 18:00:55'),
(1765, 5, 1, 115, '9', '10', '2021-09-15 18:13:02', '2021-09-15 18:13:02'),
(1766, 78, 1, 115, '11795', '10', '2021-09-15 18:13:02', '2021-09-15 18:13:02'),
(1767, 79, 1, 115, '13333', '10', '2021-09-15 18:13:02', '2021-09-15 18:13:02'),
(1768, 5, 1, 116, '9', '10', '2021-09-16 00:59:41', '2021-09-16 00:59:41'),
(1769, 78, 1, 116, '11795', '10', '2021-09-16 00:59:41', '2021-09-16 00:59:41'),
(1770, 79, 1, 116, '13333', '10', '2021-09-16 00:59:41', '2021-09-16 00:59:41'),
(1771, 5, 1, 117, '4738', '10', '2021-09-16 12:01:20', '2021-09-16 12:01:20'),
(1772, 78, 1, 117, '7110', '10', '2021-09-16 12:01:20', '2021-09-16 12:01:20'),
(1773, 79, 1, 117, '8778', '10', '2021-09-16 12:01:20', '2021-09-16 12:01:20'),
(1774, 5, 1, 117, '4738', '10', '2021-09-16 12:01:27', '2021-09-16 12:01:27'),
(1775, 78, 1, 117, '7110', '10', '2021-09-16 12:01:27', '2021-09-16 12:01:27'),
(1776, 79, 1, 117, '8778', '10', '2021-09-16 12:01:27', '2021-09-16 12:01:27'),
(1777, 5, 1, 129, '11252', '10', '2021-09-16 14:34:59', '2021-09-16 14:34:59'),
(1778, 78, 1, 129, '12607', '10', '2021-09-16 14:34:59', '2021-09-16 14:34:59'),
(1779, 79, 1, 129, '12781', '10', '2021-09-16 14:34:59', '2021-09-16 14:34:59'),
(1780, 83, 1, 129, '12781', '10', '2021-09-16 14:34:59', '2021-09-16 14:34:59'),
(1781, 5, 1, 130, '186', '10', '2021-09-16 14:38:10', '2021-09-16 14:38:10'),
(1782, 78, 1, 130, '11738', '10', '2021-09-16 14:38:10', '2021-09-16 14:38:10'),
(1783, 79, 1, 130, '13305', '10', '2021-09-16 14:38:10', '2021-09-16 14:38:10'),
(1784, 83, 1, 130, '13305', '10', '2021-09-16 14:38:10', '2021-09-16 14:38:10'),
(1785, 5, 1, 131, '186', '10', '2021-09-16 14:55:44', '2021-09-16 14:55:44'),
(1786, 78, 1, 131, '11738', '10', '2021-09-16 14:55:44', '2021-09-16 14:55:44'),
(1787, 79, 1, 131, '13305', '10', '2021-09-16 14:55:44', '2021-09-16 14:55:44'),
(1788, 83, 1, 131, '13305', '10', '2021-09-16 14:55:44', '2021-09-16 14:55:44'),
(1789, 84, 1, 131, '13305', '10', '2021-09-16 14:55:44', '2021-09-16 14:55:44'),
(1790, 5, 1, 132, '186', '10', '2021-09-16 15:03:30', '2021-09-16 15:03:30'),
(1791, 78, 1, 132, '11738', '10', '2021-09-16 15:03:30', '2021-09-16 15:03:30'),
(1792, 79, 1, 132, '13305', '10', '2021-09-16 15:03:30', '2021-09-16 15:03:30'),
(1793, 83, 1, 132, '13305', '10', '2021-09-16 15:03:30', '2021-09-16 15:03:30'),
(1794, 84, 1, 132, '11738', '10', '2021-09-16 15:03:30', '2021-09-16 15:03:30'),
(1795, 5, 1, 133, '11252', '10', '2021-09-16 15:15:55', '2021-09-16 15:15:55'),
(1796, 78, 1, 133, '12607', '10', '2021-09-16 15:15:55', '2021-09-16 15:15:55'),
(1797, 79, 1, 133, '12781', '10', '2021-09-16 15:15:55', '2021-09-16 15:15:55'),
(1798, 83, 1, 133, '12781', '10', '2021-09-16 15:15:55', '2021-09-16 15:15:55'),
(1799, 84, 1, 133, '12607', '10', '2021-09-16 15:15:55', '2021-09-16 15:15:55'),
(1800, 5, 1, 134, '186', '10', '2021-09-16 15:19:20', '2021-09-16 15:19:20'),
(1801, 78, 1, 134, '11738', '10', '2021-09-16 15:19:20', '2021-09-16 15:19:20'),
(1802, 79, 1, 134, '13305', '10', '2021-09-16 15:19:20', '2021-09-16 15:19:20'),
(1803, 83, 1, 134, '13305', '10', '2021-09-16 15:19:20', '2021-09-16 15:19:20'),
(1804, 84, 1, 134, '11738', '10', '2021-09-16 15:19:20', '2021-09-16 15:19:20'),
(1805, 5, 1, 136, '186', '10', '2021-09-17 07:17:43', '2021-09-17 07:17:43'),
(1806, 78, 1, 136, '11738', '10', '2021-09-17 07:17:43', '2021-09-17 07:17:43'),
(1807, 79, 1, 136, '13305', '10', '2021-09-17 07:17:43', '2021-09-17 07:17:43'),
(1808, 83, 1, 136, '13305', '10', '2021-09-17 07:17:43', '2021-09-17 07:17:43'),
(1809, 84, 1, 136, '11738', '10', '2021-09-17 07:17:43', '2021-09-17 07:17:43'),
(1810, 5, 5, 138, '9', '10', '2021-09-17 14:23:58', '2021-09-17 14:23:58'),
(1811, 78, 5, 138, '11795', '10', '2021-09-17 14:23:58', '2021-09-17 14:23:58'),
(1812, 79, 5, 138, '13333', '10', '2021-09-17 14:23:58', '2021-09-17 14:23:58'),
(1813, 83, 5, 138, '13333', '10', '2021-09-17 14:23:58', '2021-09-17 14:23:58'),
(1814, 84, 5, 138, '11795', '10', '2021-09-17 14:23:58', '2021-09-17 14:23:58'),
(1815, 5, 1, 141, '0', '10', '2021-09-17 15:12:21', '2021-09-17 15:12:21'),
(1816, 78, 1, 141, '0', '10', '2021-09-17 15:12:21', '2021-09-17 15:12:21'),
(1817, 79, 1, 141, '0', '10', '2021-09-17 15:12:21', '2021-09-17 15:12:21'),
(1818, 83, 1, 141, '0', '10', '2021-09-17 15:12:21', '2021-09-17 15:12:21'),
(1819, 84, 1, 141, '0', '10', '2021-09-17 15:12:21', '2021-09-17 15:12:21'),
(1820, 5, 1, 144, '0', '10', '2021-09-17 15:32:14', '2021-09-17 15:32:14'),
(1821, 78, 1, 144, '0', '10', '2021-09-17 15:32:14', '2021-09-17 15:32:14'),
(1822, 79, 1, 144, '0', '10', '2021-09-17 15:32:14', '2021-09-17 15:32:14'),
(1823, 83, 1, 144, '0', '10', '2021-09-17 15:32:14', '2021-09-17 15:32:14'),
(1824, 84, 1, 144, '0', '10', '2021-09-17 15:32:14', '2021-09-17 15:32:14'),
(1825, 5, 1, 144, '0', '10', '2021-09-17 15:32:21', '2021-09-17 15:32:21'),
(1826, 78, 1, 144, '0', '10', '2021-09-17 15:32:21', '2021-09-17 15:32:21'),
(1827, 79, 1, 144, '0', '10', '2021-09-17 15:32:21', '2021-09-17 15:32:21'),
(1828, 83, 1, 144, '0', '10', '2021-09-17 15:32:21', '2021-09-17 15:32:21'),
(1829, 84, 1, 144, '0', '10', '2021-09-17 15:32:21', '2021-09-17 15:32:21'),
(1830, 5, 2, 146, '0', '10', '2021-09-17 15:56:23', '2021-09-17 15:56:23'),
(1831, 78, 2, 146, '0', '10', '2021-09-17 15:56:23', '2021-09-17 15:56:23'),
(1832, 79, 2, 146, '0', '10', '2021-09-17 15:56:23', '2021-09-17 15:56:23'),
(1833, 83, 2, 146, '0', '10', '2021-09-17 15:56:23', '2021-09-17 15:56:23'),
(1834, 84, 2, 146, '0', '10', '2021-09-17 15:56:23', '2021-09-17 15:56:23'),
(1835, 5, 1, 147, '0', '10', '2021-09-17 17:18:48', '2021-09-17 17:18:48'),
(1836, 78, 1, 147, '0', '10', '2021-09-17 17:18:48', '2021-09-17 17:18:48'),
(1837, 79, 1, 147, '0', '10', '2021-09-17 17:18:48', '2021-09-17 17:18:48'),
(1838, 83, 1, 147, '0', '10', '2021-09-17 17:18:48', '2021-09-17 17:18:48'),
(1839, 84, 1, 147, '0', '10', '2021-09-17 17:18:48', '2021-09-17 17:18:48'),
(1840, 5, 1, 147, '0', '10', '2021-09-17 17:20:44', '2021-09-17 17:20:44'),
(1841, 78, 1, 147, '0', '10', '2021-09-17 17:20:45', '2021-09-17 17:20:45'),
(1842, 79, 1, 147, '0', '10', '2021-09-17 17:20:45', '2021-09-17 17:20:45'),
(1843, 83, 1, 147, '0', '10', '2021-09-17 17:20:45', '2021-09-17 17:20:45'),
(1844, 84, 1, 147, '0', '10', '2021-09-17 17:20:45', '2021-09-17 17:20:45'),
(1845, 5, 1, 147, '0', '10', '2021-09-17 17:22:16', '2021-09-17 17:22:16'),
(1846, 78, 1, 147, '0', '10', '2021-09-17 17:22:16', '2021-09-17 17:22:16'),
(1847, 79, 1, 147, '0', '10', '2021-09-17 17:22:16', '2021-09-17 17:22:16'),
(1848, 83, 1, 147, '0', '10', '2021-09-17 17:22:16', '2021-09-17 17:22:16'),
(1849, 84, 1, 147, '0', '10', '2021-09-17 17:22:16', '2021-09-17 17:22:16'),
(1850, 5, 1, 147, '0', '10', '2021-09-17 17:22:40', '2021-09-17 17:22:40'),
(1851, 78, 1, 147, '0', '10', '2021-09-17 17:22:40', '2021-09-17 17:22:40'),
(1852, 79, 1, 147, '0', '10', '2021-09-17 17:22:40', '2021-09-17 17:22:40'),
(1853, 83, 1, 147, '0', '10', '2021-09-17 17:22:40', '2021-09-17 17:22:40'),
(1854, 84, 1, 147, '0', '10', '2021-09-17 17:22:40', '2021-09-17 17:22:40'),
(1855, 5, 1, 147, '0', '10', '2021-09-17 17:26:42', '2021-09-17 17:26:42'),
(1856, 78, 1, 147, '0', '10', '2021-09-17 17:26:42', '2021-09-17 17:26:42'),
(1857, 79, 1, 147, '0', '10', '2021-09-17 17:26:42', '2021-09-17 17:26:42'),
(1858, 83, 1, 147, '0', '10', '2021-09-17 17:26:42', '2021-09-17 17:26:42'),
(1859, 84, 1, 147, '0', '10', '2021-09-17 17:26:42', '2021-09-17 17:26:42'),
(1860, 5, 1, 1, '2', '10', '2021-09-17 18:11:04', '2021-09-17 18:11:04'),
(1861, 78, 1, 1, '2', '10', '2021-09-17 18:11:04', '2021-09-17 18:11:04'),
(1862, 79, 1, 1, '2', '10', '2021-09-17 18:11:04', '2021-09-17 18:11:04'),
(1863, 83, 1, 1, '2', '10', '2021-09-17 18:11:04', '2021-09-17 18:11:04'),
(1864, 84, 1, 1, '2', '10', '2021-09-17 18:11:04', '2021-09-17 18:11:04'),
(1865, 5, 1, 1, '2', '10', '2021-09-17 18:14:30', '2021-09-17 18:14:30'),
(1866, 78, 1, 1, '2', '10', '2021-09-17 18:14:30', '2021-09-17 18:14:30'),
(1867, 79, 1, 1, '2', '10', '2021-09-17 18:14:30', '2021-09-17 18:14:30'),
(1868, 83, 1, 1, '2', '10', '2021-09-17 18:14:30', '2021-09-17 18:14:30'),
(1869, 84, 1, 1, '2', '10', '2021-09-17 18:14:30', '2021-09-17 18:14:30'),
(1870, 5, 1, 1, '2', '10', '2021-09-17 18:15:01', '2021-09-17 18:15:01'),
(1871, 78, 1, 1, '2', '10', '2021-09-17 18:15:01', '2021-09-17 18:15:01'),
(1872, 79, 1, 1, '2', '10', '2021-09-17 18:15:01', '2021-09-17 18:15:01'),
(1873, 83, 1, 1, '2', '10', '2021-09-17 18:15:01', '2021-09-17 18:15:01'),
(1874, 84, 1, 1, '2', '10', '2021-09-17 18:15:01', '2021-09-17 18:15:01'),
(1875, 5, 1, 1, '2', '10', '2021-09-17 18:15:08', '2021-09-17 18:15:08'),
(1876, 78, 1, 1, '2', '10', '2021-09-17 18:15:08', '2021-09-17 18:15:08'),
(1877, 79, 1, 1, '2', '10', '2021-09-17 18:15:08', '2021-09-17 18:15:08'),
(1878, 83, 1, 1, '2', '10', '2021-09-17 18:15:08', '2021-09-17 18:15:08'),
(1879, 84, 1, 1, '2', '10', '2021-09-17 18:15:08', '2021-09-17 18:15:08'),
(1880, 5, 1, 1, '2', '10', '2021-09-17 18:17:35', '2021-09-17 18:17:35'),
(1881, 78, 1, 1, '2', '10', '2021-09-17 18:17:35', '2021-09-17 18:17:35'),
(1882, 79, 1, 1, '2', '10', '2021-09-17 18:17:35', '2021-09-17 18:17:35'),
(1883, 83, 1, 1, '2', '10', '2021-09-17 18:17:35', '2021-09-17 18:17:35'),
(1884, 84, 1, 1, '2', '10', '2021-09-17 18:17:35', '2021-09-17 18:17:35'),
(1885, 5, 1, 1, '2', '10', '2021-09-17 18:17:40', '2021-09-17 18:17:40'),
(1886, 78, 1, 1, '2', '10', '2021-09-17 18:17:40', '2021-09-17 18:17:40'),
(1887, 79, 1, 1, '2', '10', '2021-09-17 18:17:40', '2021-09-17 18:17:40'),
(1888, 83, 1, 1, '2', '10', '2021-09-17 18:17:40', '2021-09-17 18:17:40'),
(1889, 84, 1, 1, '2', '10', '2021-09-17 18:17:40', '2021-09-17 18:17:40'),
(1890, 5, 1, 1, '2', '10', '2021-09-17 18:18:11', '2021-09-17 18:18:11'),
(1891, 78, 1, 1, '2', '10', '2021-09-17 18:18:11', '2021-09-17 18:18:11'),
(1892, 79, 1, 1, '2', '10', '2021-09-17 18:18:11', '2021-09-17 18:18:11'),
(1893, 83, 1, 1, '2', '10', '2021-09-17 18:18:11', '2021-09-17 18:18:11'),
(1894, 84, 1, 1, '2', '10', '2021-09-17 18:18:11', '2021-09-17 18:18:11'),
(1895, 5, 1, 1, '2', '10', '2021-09-17 18:18:53', '2021-09-17 18:18:53'),
(1896, 78, 1, 1, '2', '10', '2021-09-17 18:18:53', '2021-09-17 18:18:53'),
(1897, 79, 1, 1, '2', '10', '2021-09-17 18:18:53', '2021-09-17 18:18:53'),
(1898, 83, 1, 1, '2', '10', '2021-09-17 18:18:53', '2021-09-17 18:18:53'),
(1899, 84, 1, 1, '2', '10', '2021-09-17 18:18:53', '2021-09-17 18:18:53'),
(1900, 5, 1, 1, '2', '10', '2021-09-17 18:21:22', '2021-09-17 18:21:22'),
(1901, 78, 1, 1, '2', '10', '2021-09-17 18:21:22', '2021-09-17 18:21:22'),
(1902, 79, 1, 1, '2', '10', '2021-09-17 18:21:22', '2021-09-17 18:21:22'),
(1903, 83, 1, 1, '2', '10', '2021-09-17 18:21:22', '2021-09-17 18:21:22'),
(1904, 84, 1, 1, '2', '10', '2021-09-17 18:21:22', '2021-09-17 18:21:22'),
(1905, 5, 1, 1, '2', '10', '2021-09-17 18:23:23', '2021-09-17 18:23:23'),
(1906, 78, 1, 1, '2', '10', '2021-09-17 18:23:23', '2021-09-17 18:23:23'),
(1907, 79, 1, 1, '2', '10', '2021-09-17 18:23:23', '2021-09-17 18:23:23'),
(1908, 83, 1, 1, '2', '10', '2021-09-17 18:23:23', '2021-09-17 18:23:23'),
(1909, 84, 1, 1, '2', '10', '2021-09-17 18:23:23', '2021-09-17 18:23:23'),
(1910, 5, 1, 1, '2', '10', '2021-09-17 18:25:30', '2021-09-17 18:25:30'),
(1911, 78, 1, 1, '2', '10', '2021-09-17 18:25:30', '2021-09-17 18:25:30'),
(1912, 79, 1, 1, '2', '10', '2021-09-17 18:25:30', '2021-09-17 18:25:30'),
(1913, 83, 1, 1, '2', '10', '2021-09-17 18:25:30', '2021-09-17 18:25:30'),
(1914, 84, 1, 1, '2', '10', '2021-09-17 18:25:30', '2021-09-17 18:25:30'),
(1915, 5, 1, 1, '2', '10', '2021-09-17 18:29:12', '2021-09-17 18:29:12'),
(1916, 78, 1, 1, '2', '10', '2021-09-17 18:29:12', '2021-09-17 18:29:12'),
(1917, 79, 1, 1, '2', '10', '2021-09-17 18:29:12', '2021-09-17 18:29:12'),
(1918, 83, 1, 1, '2', '10', '2021-09-17 18:29:12', '2021-09-17 18:29:12'),
(1919, 84, 1, 1, '2', '10', '2021-09-17 18:29:12', '2021-09-17 18:29:12'),
(1920, 5, 1, 1, '2', '10', '2021-09-17 18:30:38', '2021-09-17 18:30:38'),
(1921, 78, 1, 1, '2', '10', '2021-09-17 18:30:38', '2021-09-17 18:30:38'),
(1922, 79, 1, 1, '2', '10', '2021-09-17 18:30:38', '2021-09-17 18:30:38'),
(1923, 83, 1, 1, '2', '10', '2021-09-17 18:30:38', '2021-09-17 18:30:38'),
(1924, 84, 1, 1, '2', '10', '2021-09-17 18:30:38', '2021-09-17 18:30:38'),
(1925, 5, 1, 148, '0', '10', '2021-09-18 04:58:43', '2021-09-18 04:58:43'),
(1926, 78, 1, 148, '0', '10', '2021-09-18 04:58:43', '2021-09-18 04:58:43'),
(1927, 79, 1, 148, '0', '10', '2021-09-18 04:58:43', '2021-09-18 04:58:43'),
(1928, 83, 1, 148, '0', '10', '2021-09-18 04:58:43', '2021-09-18 04:58:43'),
(1929, 84, 1, 148, '0', '10', '2021-09-18 04:58:43', '2021-09-18 04:58:43'),
(1930, 5, 1, 149, '0', '10', '2021-09-18 05:07:28', '2021-09-18 05:07:28'),
(1931, 78, 1, 149, '0', '10', '2021-09-18 05:07:28', '2021-09-18 05:07:28'),
(1932, 79, 1, 149, '0', '10', '2021-09-18 05:07:28', '2021-09-18 05:07:28'),
(1933, 83, 1, 149, '0', '10', '2021-09-18 05:07:28', '2021-09-18 05:07:28'),
(1934, 84, 1, 149, '0', '10', '2021-09-18 05:07:28', '2021-09-18 05:07:28'),
(1935, 5, 1, 1, '2', '10', '2021-09-18 08:01:26', '2021-09-18 08:01:26'),
(1936, 78, 1, 1, '2', '10', '2021-09-18 08:01:26', '2021-09-18 08:01:26'),
(1937, 79, 1, 1, '2', '10', '2021-09-18 08:01:26', '2021-09-18 08:01:26'),
(1938, 83, 1, 1, '2', '10', '2021-09-18 08:01:26', '2021-09-18 08:01:26'),
(1939, 84, 1, 1, '2', '10', '2021-09-18 08:01:26', '2021-09-18 08:01:26'),
(1940, 5, 1, 150, '0', '10', '2021-09-18 08:58:45', '2021-09-18 08:58:45'),
(1941, 78, 1, 150, '0', '10', '2021-09-18 08:58:45', '2021-09-18 08:58:45'),
(1942, 79, 1, 150, '0', '10', '2021-09-18 08:58:45', '2021-09-18 08:58:45'),
(1943, 83, 1, 150, '0', '10', '2021-09-18 08:58:45', '2021-09-18 08:58:45'),
(1944, 84, 1, 150, '0', '10', '2021-09-18 08:58:45', '2021-09-18 08:58:45'),
(1945, 5, 1, 151, '0', '10', '2021-09-18 09:13:03', '2021-09-18 09:13:03'),
(1946, 78, 1, 151, '0', '10', '2021-09-18 09:13:03', '2021-09-18 09:13:03'),
(1947, 79, 1, 151, '0', '10', '2021-09-18 09:13:03', '2021-09-18 09:13:03'),
(1948, 83, 1, 151, '0', '10', '2021-09-18 09:13:03', '2021-09-18 09:13:03'),
(1949, 84, 1, 151, '0', '10', '2021-09-18 09:13:03', '2021-09-18 09:13:03'),
(1950, 5, 2, 152, '0', '10', '2021-09-18 09:17:54', '2021-09-18 09:17:54'),
(1951, 78, 2, 152, '0', '10', '2021-09-18 09:17:54', '2021-09-18 09:17:54'),
(1952, 79, 2, 152, '0', '10', '2021-09-18 09:17:54', '2021-09-18 09:17:54'),
(1953, 83, 2, 152, '0', '10', '2021-09-18 09:17:54', '2021-09-18 09:17:54'),
(1954, 84, 2, 152, '0', '10', '2021-09-18 09:17:54', '2021-09-18 09:17:54'),
(1955, 5, 2, 153, '3', '10', '2021-09-18 09:32:51', '2021-09-18 09:32:51'),
(1956, 78, 2, 153, '3', '10', '2021-09-18 09:32:51', '2021-09-18 09:32:51'),
(1957, 79, 2, 153, '3', '10', '2021-09-18 09:32:51', '2021-09-18 09:32:51'),
(1958, 83, 2, 153, '3', '10', '2021-09-18 09:32:51', '2021-09-18 09:32:51'),
(1959, 84, 2, 153, '3', '10', '2021-09-18 09:32:51', '2021-09-18 09:32:51');
INSERT INTO `search_driver` (`id`, `driver_id`, `vehicle_id`, `pickup_id`, `km`, `time`, `created_at`, `updated_at`) VALUES
(1960, 5, 1, 154, '9', '10', '2021-09-18 09:39:22', '2021-09-18 09:39:22'),
(1961, 78, 1, 154, '9', '10', '2021-09-18 09:39:22', '2021-09-18 09:39:22'),
(1962, 79, 1, 154, '9', '10', '2021-09-18 09:39:22', '2021-09-18 09:39:22'),
(1963, 83, 1, 154, '9', '10', '2021-09-18 09:39:22', '2021-09-18 09:39:22'),
(1964, 84, 1, 154, '9', '10', '2021-09-18 09:39:22', '2021-09-18 09:39:22'),
(1965, 5, 2, 155, '12076', '10', '2021-09-18 10:30:09', '2021-09-18 10:30:09'),
(1966, 78, 2, 155, '12076', '10', '2021-09-18 10:30:09', '2021-09-18 10:30:09'),
(1967, 79, 2, 155, '12076', '10', '2021-09-18 10:30:09', '2021-09-18 10:30:09'),
(1968, 83, 2, 155, '12076', '10', '2021-09-18 10:30:09', '2021-09-18 10:30:09'),
(1969, 84, 2, 155, '12076', '10', '2021-09-18 10:30:09', '2021-09-18 10:30:09'),
(1970, 5, 1, 156, '0', '10', '2021-09-18 10:36:45', '2021-09-18 10:36:45'),
(1971, 78, 1, 156, '0', '10', '2021-09-18 10:36:45', '2021-09-18 10:36:45'),
(1972, 79, 1, 156, '0', '10', '2021-09-18 10:36:45', '2021-09-18 10:36:45'),
(1973, 83, 1, 156, '0', '10', '2021-09-18 10:36:45', '2021-09-18 10:36:45'),
(1974, 84, 1, 156, '0', '10', '2021-09-18 10:36:45', '2021-09-18 10:36:45'),
(1975, 5, 1, 157, '1', '10', '2021-09-18 10:43:28', '2021-09-18 10:43:28'),
(1976, 78, 1, 157, '1', '10', '2021-09-18 10:43:28', '2021-09-18 10:43:28'),
(1977, 79, 1, 157, '1', '10', '2021-09-18 10:43:28', '2021-09-18 10:43:28'),
(1978, 83, 1, 157, '1', '10', '2021-09-18 10:43:28', '2021-09-18 10:43:28'),
(1979, 84, 1, 157, '1', '10', '2021-09-18 10:43:28', '2021-09-18 10:43:28'),
(1980, 5, 1, 158, '35', '10', '2021-09-18 10:45:17', '2021-09-18 10:45:17'),
(1981, 78, 1, 158, '35', '10', '2021-09-18 10:45:17', '2021-09-18 10:45:17'),
(1982, 79, 1, 158, '35', '10', '2021-09-18 10:45:17', '2021-09-18 10:45:17'),
(1983, 83, 1, 158, '35', '10', '2021-09-18 10:45:17', '2021-09-18 10:45:17'),
(1984, 84, 1, 158, '35', '10', '2021-09-18 10:45:17', '2021-09-18 10:45:17'),
(1985, 5, 1, 159, '3', '10', '2021-09-18 11:24:33', '2021-09-18 11:24:33'),
(1986, 78, 1, 159, '3', '10', '2021-09-18 11:24:33', '2021-09-18 11:24:33'),
(1987, 79, 1, 159, '3', '10', '2021-09-18 11:24:33', '2021-09-18 11:24:33'),
(1988, 83, 1, 159, '3', '10', '2021-09-18 11:24:33', '2021-09-18 11:24:33'),
(1989, 84, 1, 159, '3', '10', '2021-09-18 11:24:33', '2021-09-18 11:24:33'),
(1990, 5, 1, 160, '325', '10', '2021-09-18 12:40:57', '2021-09-18 12:40:57'),
(1991, 78, 1, 160, '325', '10', '2021-09-18 12:40:57', '2021-09-18 12:40:57'),
(1992, 79, 1, 160, '325', '10', '2021-09-18 12:40:57', '2021-09-18 12:40:57'),
(1993, 83, 1, 160, '325', '10', '2021-09-18 12:40:57', '2021-09-18 12:40:57'),
(1994, 84, 1, 160, '325', '10', '2021-09-18 12:40:57', '2021-09-18 12:40:57'),
(1995, 5, 1, 161, '2', '10', '2021-09-18 14:36:35', '2021-09-18 14:36:35'),
(1996, 78, 1, 161, '2', '10', '2021-09-18 14:36:35', '2021-09-18 14:36:35'),
(1997, 79, 1, 161, '2', '10', '2021-09-18 14:36:35', '2021-09-18 14:36:35'),
(1998, 83, 1, 161, '2', '10', '2021-09-18 14:36:35', '2021-09-18 14:36:35'),
(1999, 84, 1, 161, '2', '10', '2021-09-18 14:36:35', '2021-09-18 14:36:35'),
(2000, 85, 1, 161, '2', '10', '2021-09-18 14:36:35', '2021-09-18 14:36:35'),
(2001, 86, 1, 161, '2', '10', '2021-09-18 14:36:35', '2021-09-18 14:36:35'),
(2002, 5, 2, 162, '0', '10', '2021-09-18 14:41:50', '2021-09-18 14:41:50'),
(2003, 78, 2, 162, '0', '10', '2021-09-18 14:41:50', '2021-09-18 14:41:50'),
(2004, 79, 2, 162, '0', '10', '2021-09-18 14:41:50', '2021-09-18 14:41:50'),
(2005, 83, 2, 162, '0', '10', '2021-09-18 14:41:50', '2021-09-18 14:41:50'),
(2006, 84, 2, 162, '0', '10', '2021-09-18 14:41:50', '2021-09-18 14:41:50'),
(2007, 85, 2, 162, '0', '10', '2021-09-18 14:41:50', '2021-09-18 14:41:50'),
(2008, 86, 2, 162, '0', '10', '2021-09-18 14:41:50', '2021-09-18 14:41:50'),
(2009, 5, 1, 165, '0', '10', '2021-09-18 16:44:35', '2021-09-18 16:44:35'),
(2010, 78, 1, 165, '0', '10', '2021-09-18 16:44:35', '2021-09-18 16:44:35'),
(2011, 79, 1, 165, '0', '10', '2021-09-18 16:44:35', '2021-09-18 16:44:35'),
(2012, 83, 1, 165, '0', '10', '2021-09-18 16:44:35', '2021-09-18 16:44:35'),
(2013, 84, 1, 165, '0', '10', '2021-09-18 16:44:35', '2021-09-18 16:44:35'),
(2014, 85, 1, 165, '0', '10', '2021-09-18 16:44:35', '2021-09-18 16:44:35'),
(2015, 86, 1, 165, '0', '10', '2021-09-18 16:44:35', '2021-09-18 16:44:35'),
(2016, 5, 1, 168, '16', '10', '2021-09-18 17:08:20', '2021-09-18 17:08:20'),
(2017, 78, 1, 168, '16', '10', '2021-09-18 17:08:20', '2021-09-18 17:08:20'),
(2018, 79, 1, 168, '16', '10', '2021-09-18 17:08:20', '2021-09-18 17:08:20'),
(2019, 83, 1, 168, '16', '10', '2021-09-18 17:08:20', '2021-09-18 17:08:20'),
(2020, 84, 1, 168, '16', '10', '2021-09-18 17:08:20', '2021-09-18 17:08:20'),
(2021, 85, 1, 168, '16', '10', '2021-09-18 17:08:20', '2021-09-18 17:08:20'),
(2022, 86, 1, 168, '16', '10', '2021-09-18 17:08:20', '2021-09-18 17:08:20'),
(2023, 5, 1, 171, '0', '10', '2021-09-18 18:40:30', '2021-09-18 18:40:30'),
(2024, 78, 1, 171, '0', '10', '2021-09-18 18:40:30', '2021-09-18 18:40:30'),
(2025, 79, 1, 171, '0', '10', '2021-09-18 18:40:30', '2021-09-18 18:40:30'),
(2026, 83, 1, 171, '0', '10', '2021-09-18 18:40:30', '2021-09-18 18:40:30'),
(2027, 84, 1, 171, '0', '10', '2021-09-18 18:40:30', '2021-09-18 18:40:30'),
(2028, 85, 1, 171, '0', '10', '2021-09-18 18:40:30', '2021-09-18 18:40:30'),
(2029, 86, 1, 171, '0', '10', '2021-09-18 18:40:30', '2021-09-18 18:40:30'),
(2030, 5, 1, 172, '0', '10', '2021-09-18 18:52:32', '2021-09-18 18:52:32'),
(2031, 78, 1, 172, '0', '10', '2021-09-18 18:52:32', '2021-09-18 18:52:32'),
(2032, 79, 1, 172, '0', '10', '2021-09-18 18:52:32', '2021-09-18 18:52:32'),
(2033, 83, 1, 172, '0', '10', '2021-09-18 18:52:32', '2021-09-18 18:52:32'),
(2034, 84, 1, 172, '0', '10', '2021-09-18 18:52:32', '2021-09-18 18:52:32'),
(2035, 85, 1, 172, '0', '10', '2021-09-18 18:52:32', '2021-09-18 18:52:32'),
(2036, 86, 1, 172, '0', '10', '2021-09-18 18:52:32', '2021-09-18 18:52:32'),
(2037, 5, 1, 173, '0', '10', '2021-09-18 19:00:22', '2021-09-18 19:00:22'),
(2038, 78, 1, 173, '0', '10', '2021-09-18 19:00:22', '2021-09-18 19:00:22'),
(2039, 79, 1, 173, '0', '10', '2021-09-18 19:00:22', '2021-09-18 19:00:22'),
(2040, 83, 1, 173, '0', '10', '2021-09-18 19:00:22', '2021-09-18 19:00:22'),
(2041, 84, 1, 173, '0', '10', '2021-09-18 19:00:22', '2021-09-18 19:00:22'),
(2042, 85, 1, 173, '0', '10', '2021-09-18 19:00:22', '2021-09-18 19:00:22'),
(2043, 86, 1, 173, '0', '10', '2021-09-18 19:00:22', '2021-09-18 19:00:22'),
(2044, 87, 1, 173, '0', '10', '2021-09-18 19:00:22', '2021-09-18 19:00:22'),
(2045, 5, 1, 174, '0', '10', '2021-09-18 19:03:14', '2021-09-18 19:03:14'),
(2046, 78, 1, 174, '0', '10', '2021-09-18 19:03:14', '2021-09-18 19:03:14'),
(2047, 79, 1, 174, '0', '10', '2021-09-18 19:03:14', '2021-09-18 19:03:14'),
(2048, 83, 1, 174, '0', '10', '2021-09-18 19:03:14', '2021-09-18 19:03:14'),
(2049, 84, 1, 174, '0', '10', '2021-09-18 19:03:14', '2021-09-18 19:03:14'),
(2050, 85, 1, 174, '0', '10', '2021-09-18 19:03:14', '2021-09-18 19:03:14'),
(2051, 86, 1, 174, '0', '10', '2021-09-18 19:03:14', '2021-09-18 19:03:14'),
(2052, 87, 1, 174, '0', '10', '2021-09-18 19:03:14', '2021-09-18 19:03:14'),
(2053, 5, 1, 175, '0', '10', '2021-09-18 19:09:30', '2021-09-18 19:09:30'),
(2054, 78, 1, 175, '0', '10', '2021-09-18 19:09:30', '2021-09-18 19:09:30'),
(2055, 79, 1, 175, '0', '10', '2021-09-18 19:09:30', '2021-09-18 19:09:30'),
(2056, 83, 1, 175, '0', '10', '2021-09-18 19:09:30', '2021-09-18 19:09:30'),
(2057, 84, 1, 175, '0', '10', '2021-09-18 19:09:30', '2021-09-18 19:09:30'),
(2058, 85, 1, 175, '0', '10', '2021-09-18 19:09:30', '2021-09-18 19:09:30'),
(2059, 86, 1, 175, '0', '10', '2021-09-18 19:09:30', '2021-09-18 19:09:30'),
(2060, 87, 1, 175, '0', '10', '2021-09-18 19:09:30', '2021-09-18 19:09:30'),
(2061, 5, 1, 176, '0', '10', '2021-09-18 19:19:41', '2021-09-18 19:19:41'),
(2062, 78, 1, 176, '0', '10', '2021-09-18 19:19:41', '2021-09-18 19:19:41'),
(2063, 79, 1, 176, '0', '10', '2021-09-18 19:19:41', '2021-09-18 19:19:41'),
(2064, 83, 1, 176, '0', '10', '2021-09-18 19:19:41', '2021-09-18 19:19:41'),
(2065, 84, 1, 176, '0', '10', '2021-09-18 19:19:41', '2021-09-18 19:19:41'),
(2066, 85, 1, 176, '0', '10', '2021-09-18 19:19:41', '2021-09-18 19:19:41'),
(2067, 86, 1, 176, '0', '10', '2021-09-18 19:19:41', '2021-09-18 19:19:41'),
(2068, 87, 1, 176, '0', '10', '2021-09-18 19:19:41', '2021-09-18 19:19:41'),
(2069, 5, 3, 177, '1', '10', '2021-09-19 01:04:48', '2021-09-19 01:04:48'),
(2070, 78, 3, 177, '1', '10', '2021-09-19 01:04:48', '2021-09-19 01:04:48'),
(2071, 79, 3, 177, '1', '10', '2021-09-19 01:04:48', '2021-09-19 01:04:48'),
(2072, 83, 3, 177, '1', '10', '2021-09-19 01:04:48', '2021-09-19 01:04:48'),
(2073, 84, 3, 177, '1', '10', '2021-09-19 01:04:48', '2021-09-19 01:04:48'),
(2074, 85, 3, 177, '1', '10', '2021-09-19 01:04:48', '2021-09-19 01:04:48'),
(2075, 86, 3, 177, '1', '10', '2021-09-19 01:04:48', '2021-09-19 01:04:48'),
(2076, 87, 3, 177, '1', '10', '2021-09-19 01:04:48', '2021-09-19 01:04:48'),
(2077, 5, 3, 178, '0', '10', '2021-09-19 01:05:50', '2021-09-19 01:05:50'),
(2078, 78, 3, 178, '0', '10', '2021-09-19 01:05:50', '2021-09-19 01:05:50'),
(2079, 79, 3, 178, '0', '10', '2021-09-19 01:05:50', '2021-09-19 01:05:50'),
(2080, 83, 3, 178, '0', '10', '2021-09-19 01:05:50', '2021-09-19 01:05:50'),
(2081, 84, 3, 178, '0', '10', '2021-09-19 01:05:50', '2021-09-19 01:05:50'),
(2082, 85, 3, 178, '0', '10', '2021-09-19 01:05:50', '2021-09-19 01:05:50'),
(2083, 86, 3, 178, '0', '10', '2021-09-19 01:05:50', '2021-09-19 01:05:50'),
(2084, 87, 3, 178, '0', '10', '2021-09-19 01:05:50', '2021-09-19 01:05:50'),
(2085, 5, 1, 179, '7', '10', '2021-09-19 01:26:51', '2021-09-19 01:26:51'),
(2086, 78, 1, 179, '7', '10', '2021-09-19 01:26:51', '2021-09-19 01:26:51'),
(2087, 79, 1, 179, '7', '10', '2021-09-19 01:26:51', '2021-09-19 01:26:51'),
(2088, 83, 1, 179, '7', '10', '2021-09-19 01:26:51', '2021-09-19 01:26:51'),
(2089, 84, 1, 179, '7', '10', '2021-09-19 01:26:51', '2021-09-19 01:26:51'),
(2090, 85, 1, 179, '7', '10', '2021-09-19 01:26:51', '2021-09-19 01:26:51'),
(2091, 86, 1, 179, '7', '10', '2021-09-19 01:26:51', '2021-09-19 01:26:51'),
(2092, 87, 1, 179, '7', '10', '2021-09-19 01:26:51', '2021-09-19 01:26:51'),
(2093, 5, 2, 180, '7', '10', '2021-09-19 01:30:11', '2021-09-19 01:30:11'),
(2094, 78, 2, 180, '7', '10', '2021-09-19 01:30:11', '2021-09-19 01:30:11'),
(2095, 79, 2, 180, '7', '10', '2021-09-19 01:30:11', '2021-09-19 01:30:11'),
(2096, 83, 2, 180, '7', '10', '2021-09-19 01:30:11', '2021-09-19 01:30:11'),
(2097, 84, 2, 180, '7', '10', '2021-09-19 01:30:11', '2021-09-19 01:30:11'),
(2098, 85, 2, 180, '7', '10', '2021-09-19 01:30:11', '2021-09-19 01:30:11'),
(2099, 86, 2, 180, '7', '10', '2021-09-19 01:30:11', '2021-09-19 01:30:11'),
(2100, 87, 2, 180, '7', '10', '2021-09-19 01:30:11', '2021-09-19 01:30:11'),
(2101, 5, 1, 189, '11247', '10', '2021-09-19 05:30:13', '2021-09-19 05:30:13'),
(2102, 78, 1, 189, '11247', '10', '2021-09-19 05:30:13', '2021-09-19 05:30:13'),
(2103, 79, 1, 189, '11247', '10', '2021-09-19 05:30:13', '2021-09-19 05:30:13'),
(2104, 83, 1, 189, '11247', '10', '2021-09-19 05:30:13', '2021-09-19 05:30:13'),
(2105, 84, 1, 189, '11247', '10', '2021-09-19 05:30:13', '2021-09-19 05:30:13'),
(2106, 85, 1, 189, '11247', '10', '2021-09-19 05:30:13', '2021-09-19 05:30:13'),
(2107, 86, 1, 189, '11247', '10', '2021-09-19 05:30:13', '2021-09-19 05:30:13'),
(2108, 87, 1, 189, '11247', '10', '2021-09-19 05:30:13', '2021-09-19 05:30:13'),
(2109, 5, 1, 190, '0', '10', '2021-09-19 05:51:05', '2021-09-19 05:51:05'),
(2110, 78, 1, 190, '0', '10', '2021-09-19 05:51:05', '2021-09-19 05:51:05'),
(2111, 79, 1, 190, '0', '10', '2021-09-19 05:51:05', '2021-09-19 05:51:05'),
(2112, 83, 1, 190, '0', '10', '2021-09-19 05:51:05', '2021-09-19 05:51:05'),
(2113, 84, 1, 190, '0', '10', '2021-09-19 05:51:05', '2021-09-19 05:51:05'),
(2114, 85, 1, 190, '0', '10', '2021-09-19 05:51:05', '2021-09-19 05:51:05'),
(2115, 86, 1, 190, '0', '10', '2021-09-19 05:51:05', '2021-09-19 05:51:05'),
(2116, 87, 1, 190, '0', '10', '2021-09-19 05:51:05', '2021-09-19 05:51:05'),
(2117, 5, 1, 191, '5', '10', '2021-09-19 06:21:50', '2021-09-19 06:21:50'),
(2118, 78, 1, 191, '5', '10', '2021-09-19 06:21:50', '2021-09-19 06:21:50'),
(2119, 79, 1, 191, '5', '10', '2021-09-19 06:21:50', '2021-09-19 06:21:50'),
(2120, 83, 1, 191, '5', '10', '2021-09-19 06:21:50', '2021-09-19 06:21:50'),
(2121, 84, 1, 191, '5', '10', '2021-09-19 06:21:50', '2021-09-19 06:21:50'),
(2122, 85, 1, 191, '5', '10', '2021-09-19 06:21:50', '2021-09-19 06:21:50'),
(2123, 86, 1, 191, '5', '10', '2021-09-19 06:21:50', '2021-09-19 06:21:50'),
(2124, 87, 1, 191, '5', '10', '2021-09-19 06:21:50', '2021-09-19 06:21:50'),
(2125, 5, 1, 207, '0', '10', '2021-09-19 12:49:43', '2021-09-19 12:49:43'),
(2126, 78, 1, 207, '0', '10', '2021-09-19 12:49:43', '2021-09-19 12:49:43'),
(2127, 79, 1, 207, '0', '10', '2021-09-19 12:49:43', '2021-09-19 12:49:43'),
(2128, 83, 1, 207, '0', '10', '2021-09-19 12:49:43', '2021-09-19 12:49:43'),
(2129, 85, 1, 207, '0', '10', '2021-09-19 12:49:43', '2021-09-19 12:49:43'),
(2130, 86, 1, 207, '0', '10', '2021-09-19 12:49:43', '2021-09-19 12:49:43'),
(2131, 87, 1, 207, '0', '10', '2021-09-19 12:49:43', '2021-09-19 12:49:43'),
(2132, 5, 1, 208, '3', '10', '2021-09-19 14:11:29', '2021-09-19 14:11:29'),
(2133, 78, 1, 208, '3', '10', '2021-09-19 14:11:29', '2021-09-19 14:11:29'),
(2134, 79, 1, 208, '3', '10', '2021-09-19 14:11:29', '2021-09-19 14:11:29'),
(2135, 83, 1, 208, '3', '10', '2021-09-19 14:11:29', '2021-09-19 14:11:29'),
(2136, 85, 1, 208, '3', '10', '2021-09-19 14:11:29', '2021-09-19 14:11:29'),
(2137, 86, 1, 208, '3', '10', '2021-09-19 14:11:29', '2021-09-19 14:11:29'),
(2138, 87, 1, 208, '3', '10', '2021-09-19 14:11:29', '2021-09-19 14:11:29'),
(2139, 5, 1, 209, '25', '10', '2021-09-20 02:46:51', '2021-09-20 02:46:51'),
(2140, 78, 1, 209, '25', '10', '2021-09-20 02:46:51', '2021-09-20 02:46:51'),
(2141, 79, 1, 209, '25', '10', '2021-09-20 02:46:51', '2021-09-20 02:46:51'),
(2142, 83, 1, 209, '25', '10', '2021-09-20 02:46:51', '2021-09-20 02:46:51'),
(2143, 85, 1, 209, '25', '10', '2021-09-20 02:46:51', '2021-09-20 02:46:51'),
(2144, 86, 1, 209, '25', '10', '2021-09-20 02:46:51', '2021-09-20 02:46:51'),
(2145, 87, 1, 209, '25', '10', '2021-09-20 02:46:51', '2021-09-20 02:46:51'),
(2146, 5, 1, 210, '0', '10', '2021-09-20 02:55:29', '2021-09-20 02:55:29'),
(2147, 78, 1, 210, '0', '10', '2021-09-20 02:55:29', '2021-09-20 02:55:29'),
(2148, 79, 1, 210, '0', '10', '2021-09-20 02:55:29', '2021-09-20 02:55:29'),
(2149, 83, 1, 210, '0', '10', '2021-09-20 02:55:29', '2021-09-20 02:55:29'),
(2150, 85, 1, 210, '0', '10', '2021-09-20 02:55:29', '2021-09-20 02:55:29'),
(2151, 86, 1, 210, '0', '10', '2021-09-20 02:55:29', '2021-09-20 02:55:29'),
(2152, 87, 1, 210, '0', '10', '2021-09-20 02:55:29', '2021-09-20 02:55:29'),
(2153, 5, 1, 212, '0', '10', '2021-09-20 09:14:08', '2021-09-20 09:14:08'),
(2154, 78, 1, 212, '0', '10', '2021-09-20 09:14:08', '2021-09-20 09:14:08'),
(2155, 79, 1, 212, '0', '10', '2021-09-20 09:14:08', '2021-09-20 09:14:08'),
(2156, 83, 1, 212, '0', '10', '2021-09-20 09:14:08', '2021-09-20 09:14:08'),
(2157, 85, 1, 212, '0', '10', '2021-09-20 09:14:08', '2021-09-20 09:14:08'),
(2158, 86, 1, 212, '0', '10', '2021-09-20 09:14:08', '2021-09-20 09:14:08'),
(2159, 87, 1, 212, '0', '10', '2021-09-20 09:14:08', '2021-09-20 09:14:08'),
(2160, 5, 1, 213, '11248', '10', '2021-09-20 10:28:03', '2021-09-20 10:28:03'),
(2161, 78, 1, 213, '11248', '10', '2021-09-20 10:28:03', '2021-09-20 10:28:03'),
(2162, 79, 1, 213, '11248', '10', '2021-09-20 10:28:03', '2021-09-20 10:28:03'),
(2163, 83, 1, 213, '11248', '10', '2021-09-20 10:28:03', '2021-09-20 10:28:03'),
(2164, 85, 1, 213, '11248', '10', '2021-09-20 10:28:03', '2021-09-20 10:28:03'),
(2165, 86, 1, 213, '11248', '10', '2021-09-20 10:28:03', '2021-09-20 10:28:03'),
(2166, 87, 1, 213, '11248', '10', '2021-09-20 10:28:03', '2021-09-20 10:28:03'),
(2167, 5, 1, 214, '7', '10', '2021-09-20 10:52:29', '2021-09-20 10:52:29'),
(2168, 78, 1, 214, '7', '10', '2021-09-20 10:52:29', '2021-09-20 10:52:29'),
(2169, 79, 1, 214, '7', '10', '2021-09-20 10:52:29', '2021-09-20 10:52:29'),
(2170, 83, 1, 214, '7', '10', '2021-09-20 10:52:29', '2021-09-20 10:52:29'),
(2171, 85, 1, 214, '7', '10', '2021-09-20 10:52:29', '2021-09-20 10:52:29'),
(2172, 86, 1, 214, '7', '10', '2021-09-20 10:52:29', '2021-09-20 10:52:29'),
(2173, 87, 1, 214, '7', '10', '2021-09-20 10:52:29', '2021-09-20 10:52:29'),
(2174, 5, 1, 215, '0', '10', '2021-09-20 11:03:00', '2021-09-20 11:03:00'),
(2175, 78, 1, 215, '0', '10', '2021-09-20 11:03:00', '2021-09-20 11:03:00'),
(2176, 79, 1, 215, '0', '10', '2021-09-20 11:03:00', '2021-09-20 11:03:00'),
(2177, 83, 1, 215, '0', '10', '2021-09-20 11:03:00', '2021-09-20 11:03:00'),
(2178, 85, 1, 215, '0', '10', '2021-09-20 11:03:00', '2021-09-20 11:03:00'),
(2179, 86, 1, 215, '0', '10', '2021-09-20 11:03:00', '2021-09-20 11:03:00'),
(2180, 87, 1, 215, '0', '10', '2021-09-20 11:03:00', '2021-09-20 11:03:00'),
(2181, 5, 1, 216, '0', '10', '2021-09-20 13:38:53', '2021-09-20 13:38:53'),
(2182, 78, 1, 216, '0', '10', '2021-09-20 13:38:53', '2021-09-20 13:38:53'),
(2183, 79, 1, 216, '0', '10', '2021-09-20 13:38:53', '2021-09-20 13:38:53'),
(2184, 83, 1, 216, '0', '10', '2021-09-20 13:38:53', '2021-09-20 13:38:53'),
(2185, 85, 1, 216, '0', '10', '2021-09-20 13:38:53', '2021-09-20 13:38:53'),
(2186, 86, 1, 216, '0', '10', '2021-09-20 13:38:53', '2021-09-20 13:38:53'),
(2187, 87, 1, 216, '0', '10', '2021-09-20 13:38:53', '2021-09-20 13:38:53'),
(2188, 88, 1, 216, '0', '10', '2021-09-20 13:38:53', '2021-09-20 13:38:53'),
(2189, 5, 9, 218, '7', '10', '2021-09-20 14:08:32', '2021-09-20 14:08:32'),
(2190, 78, 9, 218, '7', '10', '2021-09-20 14:08:32', '2021-09-20 14:08:32'),
(2191, 79, 9, 218, '7', '10', '2021-09-20 14:08:32', '2021-09-20 14:08:32'),
(2192, 83, 9, 218, '7', '10', '2021-09-20 14:08:32', '2021-09-20 14:08:32'),
(2193, 85, 9, 218, '7', '10', '2021-09-20 14:08:32', '2021-09-20 14:08:32'),
(2194, 86, 9, 218, '7', '10', '2021-09-20 14:08:32', '2021-09-20 14:08:32'),
(2195, 87, 9, 218, '7', '10', '2021-09-20 14:08:32', '2021-09-20 14:08:32'),
(2196, 88, 9, 218, '7', '10', '2021-09-20 14:08:32', '2021-09-20 14:08:32'),
(2197, 89, 9, 218, '7', '10', '2021-09-20 14:08:32', '2021-09-20 14:08:32'),
(2198, 5, 1, 220, '0', '10', '2021-09-20 15:47:24', '2021-09-20 15:47:24'),
(2199, 78, 1, 220, '0', '10', '2021-09-20 15:47:24', '2021-09-20 15:47:24'),
(2200, 79, 1, 220, '0', '10', '2021-09-20 15:47:24', '2021-09-20 15:47:24'),
(2201, 83, 1, 220, '0', '10', '2021-09-20 15:47:24', '2021-09-20 15:47:24'),
(2202, 85, 1, 220, '0', '10', '2021-09-20 15:47:24', '2021-09-20 15:47:24'),
(2203, 86, 1, 220, '0', '10', '2021-09-20 15:47:24', '2021-09-20 15:47:24'),
(2204, 87, 1, 220, '0', '10', '2021-09-20 15:47:24', '2021-09-20 15:47:24'),
(2205, 88, 1, 220, '0', '10', '2021-09-20 15:47:24', '2021-09-20 15:47:24'),
(2206, 89, 1, 220, '0', '10', '2021-09-20 15:47:24', '2021-09-20 15:47:24'),
(2207, 90, 1, 220, '0', '10', '2021-09-20 15:47:24', '2021-09-20 15:47:24'),
(2208, 91, 1, 220, '0', '10', '2021-09-20 15:47:24', '2021-09-20 15:47:24'),
(2209, 92, 1, 220, '0', '10', '2021-09-20 15:47:24', '2021-09-20 15:47:24'),
(2210, 5, 1, 222, '0', '10', '2021-09-20 15:59:28', '2021-09-20 15:59:28'),
(2211, 78, 1, 222, '0', '10', '2021-09-20 15:59:28', '2021-09-20 15:59:28'),
(2212, 79, 1, 222, '0', '10', '2021-09-20 15:59:28', '2021-09-20 15:59:28'),
(2213, 83, 1, 222, '0', '10', '2021-09-20 15:59:28', '2021-09-20 15:59:28'),
(2214, 85, 1, 222, '0', '10', '2021-09-20 15:59:28', '2021-09-20 15:59:28'),
(2215, 86, 1, 222, '0', '10', '2021-09-20 15:59:28', '2021-09-20 15:59:28'),
(2216, 87, 1, 222, '0', '10', '2021-09-20 15:59:28', '2021-09-20 15:59:28'),
(2217, 88, 1, 222, '0', '10', '2021-09-20 15:59:28', '2021-09-20 15:59:28'),
(2218, 89, 1, 222, '0', '10', '2021-09-20 15:59:28', '2021-09-20 15:59:28'),
(2219, 90, 1, 222, '0', '10', '2021-09-20 15:59:28', '2021-09-20 15:59:28'),
(2220, 91, 1, 222, '0', '10', '2021-09-20 15:59:28', '2021-09-20 15:59:28'),
(2221, 92, 1, 222, '0', '10', '2021-09-20 15:59:28', '2021-09-20 15:59:28'),
(2222, 5, 1, 223, '6', '10', '2021-09-20 16:01:31', '2021-09-20 16:01:31'),
(2223, 78, 1, 223, '6', '10', '2021-09-20 16:01:31', '2021-09-20 16:01:31'),
(2224, 79, 1, 223, '6', '10', '2021-09-20 16:01:31', '2021-09-20 16:01:31'),
(2225, 83, 1, 223, '6', '10', '2021-09-20 16:01:31', '2021-09-20 16:01:31'),
(2226, 85, 1, 223, '6', '10', '2021-09-20 16:01:31', '2021-09-20 16:01:31'),
(2227, 86, 1, 223, '6', '10', '2021-09-20 16:01:31', '2021-09-20 16:01:31'),
(2228, 87, 1, 223, '6', '10', '2021-09-20 16:01:31', '2021-09-20 16:01:31'),
(2229, 88, 1, 223, '6', '10', '2021-09-20 16:01:31', '2021-09-20 16:01:31'),
(2230, 89, 1, 223, '6', '10', '2021-09-20 16:01:31', '2021-09-20 16:01:31'),
(2231, 90, 1, 223, '6', '10', '2021-09-20 16:01:31', '2021-09-20 16:01:31'),
(2232, 91, 1, 223, '6', '10', '2021-09-20 16:01:31', '2021-09-20 16:01:31'),
(2233, 92, 1, 223, '6', '10', '2021-09-20 16:01:31', '2021-09-20 16:01:31'),
(2234, 5, 1, 224, '0', '10', '2021-09-20 16:03:15', '2021-09-20 16:03:15'),
(2235, 78, 1, 224, '0', '10', '2021-09-20 16:03:15', '2021-09-20 16:03:15'),
(2236, 79, 1, 224, '0', '10', '2021-09-20 16:03:15', '2021-09-20 16:03:15'),
(2237, 83, 1, 224, '0', '10', '2021-09-20 16:03:15', '2021-09-20 16:03:15'),
(2238, 85, 1, 224, '0', '10', '2021-09-20 16:03:15', '2021-09-20 16:03:15'),
(2239, 86, 1, 224, '0', '10', '2021-09-20 16:03:15', '2021-09-20 16:03:15'),
(2240, 87, 1, 224, '0', '10', '2021-09-20 16:03:15', '2021-09-20 16:03:15'),
(2241, 88, 1, 224, '0', '10', '2021-09-20 16:03:15', '2021-09-20 16:03:15'),
(2242, 89, 1, 224, '0', '10', '2021-09-20 16:03:15', '2021-09-20 16:03:15'),
(2243, 90, 1, 224, '0', '10', '2021-09-20 16:03:15', '2021-09-20 16:03:15'),
(2244, 91, 1, 224, '0', '10', '2021-09-20 16:03:15', '2021-09-20 16:03:15'),
(2245, 92, 1, 224, '0', '10', '2021-09-20 16:03:15', '2021-09-20 16:03:15'),
(2246, 5, 1, 225, '0', '10', '2021-09-20 16:18:10', '2021-09-20 16:18:10'),
(2247, 78, 1, 225, '0', '10', '2021-09-20 16:18:10', '2021-09-20 16:18:10'),
(2248, 79, 1, 225, '0', '10', '2021-09-20 16:18:10', '2021-09-20 16:18:10'),
(2249, 83, 1, 225, '0', '10', '2021-09-20 16:18:10', '2021-09-20 16:18:10'),
(2250, 85, 1, 225, '0', '10', '2021-09-20 16:18:10', '2021-09-20 16:18:10'),
(2251, 86, 1, 225, '0', '10', '2021-09-20 16:18:10', '2021-09-20 16:18:10'),
(2252, 87, 1, 225, '0', '10', '2021-09-20 16:18:10', '2021-09-20 16:18:10'),
(2253, 88, 1, 225, '0', '10', '2021-09-20 16:18:10', '2021-09-20 16:18:10'),
(2254, 89, 1, 225, '0', '10', '2021-09-20 16:18:10', '2021-09-20 16:18:10'),
(2255, 90, 1, 225, '0', '10', '2021-09-20 16:18:10', '2021-09-20 16:18:10'),
(2256, 91, 1, 225, '0', '10', '2021-09-20 16:18:10', '2021-09-20 16:18:10'),
(2257, 92, 1, 225, '0', '10', '2021-09-20 16:18:10', '2021-09-20 16:18:10'),
(2258, 5, 1, 229, '0', '10', '2021-09-21 10:29:51', '2021-09-21 10:29:51'),
(2259, 78, 1, 229, '0', '10', '2021-09-21 10:29:51', '2021-09-21 10:29:51'),
(2260, 79, 1, 229, '0', '10', '2021-09-21 10:29:51', '2021-09-21 10:29:51'),
(2261, 83, 1, 229, '0', '10', '2021-09-21 10:29:51', '2021-09-21 10:29:51'),
(2262, 85, 1, 229, '0', '10', '2021-09-21 10:29:51', '2021-09-21 10:29:51'),
(2263, 86, 1, 229, '0', '10', '2021-09-21 10:29:51', '2021-09-21 10:29:51'),
(2264, 87, 1, 229, '0', '10', '2021-09-21 10:29:51', '2021-09-21 10:29:51'),
(2265, 88, 1, 229, '0', '10', '2021-09-21 10:29:51', '2021-09-21 10:29:51'),
(2266, 89, 1, 229, '0', '10', '2021-09-21 10:29:51', '2021-09-21 10:29:51'),
(2267, 90, 1, 229, '0', '10', '2021-09-21 10:29:51', '2021-09-21 10:29:51'),
(2268, 91, 1, 229, '0', '10', '2021-09-21 10:29:51', '2021-09-21 10:29:51'),
(2269, 92, 1, 229, '0', '10', '2021-09-21 10:29:51', '2021-09-21 10:29:51'),
(2270, 5, 1, 230, '0', '10', '2021-09-21 11:53:13', '2021-09-21 11:53:13'),
(2271, 78, 1, 230, '0', '10', '2021-09-21 11:53:13', '2021-09-21 11:53:13'),
(2272, 79, 1, 230, '0', '10', '2021-09-21 11:53:13', '2021-09-21 11:53:13'),
(2273, 83, 1, 230, '0', '10', '2021-09-21 11:53:13', '2021-09-21 11:53:13'),
(2274, 85, 1, 230, '0', '10', '2021-09-21 11:53:13', '2021-09-21 11:53:13'),
(2275, 86, 1, 230, '0', '10', '2021-09-21 11:53:13', '2021-09-21 11:53:13'),
(2276, 87, 1, 230, '0', '10', '2021-09-21 11:53:13', '2021-09-21 11:53:13'),
(2277, 88, 1, 230, '0', '10', '2021-09-21 11:53:13', '2021-09-21 11:53:13'),
(2278, 89, 1, 230, '0', '10', '2021-09-21 11:53:13', '2021-09-21 11:53:13'),
(2279, 90, 1, 230, '0', '10', '2021-09-21 11:53:13', '2021-09-21 11:53:13'),
(2280, 91, 1, 230, '0', '10', '2021-09-21 11:53:13', '2021-09-21 11:53:13'),
(2281, 92, 1, 230, '0', '10', '2021-09-21 11:53:13', '2021-09-21 11:53:13'),
(2282, 5, 1, 231, '0', '10', '2021-09-21 11:57:32', '2021-09-21 11:57:32'),
(2283, 78, 1, 231, '0', '10', '2021-09-21 11:57:32', '2021-09-21 11:57:32'),
(2284, 79, 1, 231, '0', '10', '2021-09-21 11:57:32', '2021-09-21 11:57:32'),
(2285, 83, 1, 231, '0', '10', '2021-09-21 11:57:32', '2021-09-21 11:57:32'),
(2286, 85, 1, 231, '0', '10', '2021-09-21 11:57:32', '2021-09-21 11:57:32'),
(2287, 86, 1, 231, '0', '10', '2021-09-21 11:57:32', '2021-09-21 11:57:32'),
(2288, 87, 1, 231, '0', '10', '2021-09-21 11:57:32', '2021-09-21 11:57:32'),
(2289, 88, 1, 231, '0', '10', '2021-09-21 11:57:32', '2021-09-21 11:57:32'),
(2290, 89, 1, 231, '0', '10', '2021-09-21 11:57:32', '2021-09-21 11:57:32'),
(2291, 90, 1, 231, '0', '10', '2021-09-21 11:57:32', '2021-09-21 11:57:32'),
(2292, 91, 1, 231, '0', '10', '2021-09-21 11:57:32', '2021-09-21 11:57:32'),
(2293, 92, 1, 231, '0', '10', '2021-09-21 11:57:32', '2021-09-21 11:57:32'),
(2294, 5, 1, 232, '0', '10', '2021-09-21 12:08:50', '2021-09-21 12:08:50'),
(2295, 78, 1, 232, '0', '10', '2021-09-21 12:08:50', '2021-09-21 12:08:50'),
(2296, 79, 1, 232, '0', '10', '2021-09-21 12:08:50', '2021-09-21 12:08:50'),
(2297, 83, 1, 232, '0', '10', '2021-09-21 12:08:50', '2021-09-21 12:08:50'),
(2298, 85, 1, 232, '0', '10', '2021-09-21 12:08:50', '2021-09-21 12:08:50'),
(2299, 86, 1, 232, '0', '10', '2021-09-21 12:08:50', '2021-09-21 12:08:50'),
(2300, 87, 1, 232, '0', '10', '2021-09-21 12:08:50', '2021-09-21 12:08:50'),
(2301, 88, 1, 232, '0', '10', '2021-09-21 12:08:50', '2021-09-21 12:08:50'),
(2302, 89, 1, 232, '0', '10', '2021-09-21 12:08:50', '2021-09-21 12:08:50'),
(2303, 90, 1, 232, '0', '10', '2021-09-21 12:08:50', '2021-09-21 12:08:50'),
(2304, 91, 1, 232, '0', '10', '2021-09-21 12:08:50', '2021-09-21 12:08:50'),
(2305, 92, 1, 232, '0', '10', '2021-09-21 12:08:50', '2021-09-21 12:08:50'),
(2306, 93, 1, 232, '0', '10', '2021-09-21 12:08:50', '2021-09-21 12:08:50'),
(2307, 5, 1, 233, '0', '10', '2021-09-21 12:16:04', '2021-09-21 12:16:04'),
(2308, 78, 1, 233, '0', '10', '2021-09-21 12:16:04', '2021-09-21 12:16:04'),
(2309, 79, 1, 233, '0', '10', '2021-09-21 12:16:04', '2021-09-21 12:16:04'),
(2310, 83, 1, 233, '0', '10', '2021-09-21 12:16:04', '2021-09-21 12:16:04'),
(2311, 85, 1, 233, '0', '10', '2021-09-21 12:16:04', '2021-09-21 12:16:04'),
(2312, 86, 1, 233, '0', '10', '2021-09-21 12:16:04', '2021-09-21 12:16:04'),
(2313, 87, 1, 233, '0', '10', '2021-09-21 12:16:04', '2021-09-21 12:16:04'),
(2314, 88, 1, 233, '0', '10', '2021-09-21 12:16:04', '2021-09-21 12:16:04'),
(2315, 89, 1, 233, '0', '10', '2021-09-21 12:16:04', '2021-09-21 12:16:04'),
(2316, 90, 1, 233, '0', '10', '2021-09-21 12:16:04', '2021-09-21 12:16:04'),
(2317, 91, 1, 233, '0', '10', '2021-09-21 12:16:04', '2021-09-21 12:16:04'),
(2318, 92, 1, 233, '0', '10', '2021-09-21 12:16:04', '2021-09-21 12:16:04'),
(2319, 93, 1, 233, '0', '10', '2021-09-21 12:16:05', '2021-09-21 12:16:05'),
(2320, 94, 1, 233, '0', '10', '2021-09-21 12:16:05', '2021-09-21 12:16:05'),
(2321, 5, 1, 234, '0', '10', '2021-09-21 12:25:12', '2021-09-21 12:25:12'),
(2322, 78, 1, 234, '0', '10', '2021-09-21 12:25:12', '2021-09-21 12:25:12'),
(2323, 79, 1, 234, '0', '10', '2021-09-21 12:25:12', '2021-09-21 12:25:12'),
(2324, 83, 1, 234, '0', '10', '2021-09-21 12:25:12', '2021-09-21 12:25:12'),
(2325, 85, 1, 234, '0', '10', '2021-09-21 12:25:12', '2021-09-21 12:25:12'),
(2326, 86, 1, 234, '0', '10', '2021-09-21 12:25:12', '2021-09-21 12:25:12'),
(2327, 87, 1, 234, '0', '10', '2021-09-21 12:25:12', '2021-09-21 12:25:12'),
(2328, 88, 1, 234, '0', '10', '2021-09-21 12:25:12', '2021-09-21 12:25:12'),
(2329, 89, 1, 234, '0', '10', '2021-09-21 12:25:12', '2021-09-21 12:25:12'),
(2330, 90, 1, 234, '0', '10', '2021-09-21 12:25:12', '2021-09-21 12:25:12'),
(2331, 91, 1, 234, '0', '10', '2021-09-21 12:25:12', '2021-09-21 12:25:12'),
(2332, 92, 1, 234, '0', '10', '2021-09-21 12:25:12', '2021-09-21 12:25:12'),
(2333, 93, 1, 234, '0', '10', '2021-09-21 12:25:12', '2021-09-21 12:25:12'),
(2334, 94, 1, 234, '0', '10', '2021-09-21 12:25:12', '2021-09-21 12:25:12'),
(2335, 5, 1, 235, '12656', '10', '2021-09-21 12:28:01', '2021-09-21 12:28:01'),
(2336, 78, 1, 235, '12656', '10', '2021-09-21 12:28:01', '2021-09-21 12:28:01'),
(2337, 79, 1, 235, '12656', '10', '2021-09-21 12:28:01', '2021-09-21 12:28:01'),
(2338, 83, 1, 235, '12656', '10', '2021-09-21 12:28:01', '2021-09-21 12:28:01'),
(2339, 85, 1, 235, '12656', '10', '2021-09-21 12:28:01', '2021-09-21 12:28:01'),
(2340, 86, 1, 235, '12656', '10', '2021-09-21 12:28:01', '2021-09-21 12:28:01'),
(2341, 87, 1, 235, '12656', '10', '2021-09-21 12:28:01', '2021-09-21 12:28:01'),
(2342, 88, 1, 235, '12656', '10', '2021-09-21 12:28:01', '2021-09-21 12:28:01'),
(2343, 89, 1, 235, '12656', '10', '2021-09-21 12:28:01', '2021-09-21 12:28:01'),
(2344, 90, 1, 235, '12656', '10', '2021-09-21 12:28:01', '2021-09-21 12:28:01'),
(2345, 91, 1, 235, '12656', '10', '2021-09-21 12:28:01', '2021-09-21 12:28:01'),
(2346, 92, 1, 235, '12656', '10', '2021-09-21 12:28:01', '2021-09-21 12:28:01'),
(2347, 93, 1, 235, '12656', '10', '2021-09-21 12:28:01', '2021-09-21 12:28:01'),
(2348, 94, 1, 235, '12656', '10', '2021-09-21 12:28:01', '2021-09-21 12:28:01'),
(2349, 5, 1, 236, '0', '10', '2021-09-21 12:32:02', '2021-09-21 12:32:02'),
(2350, 78, 1, 236, '0', '10', '2021-09-21 12:32:02', '2021-09-21 12:32:02'),
(2351, 79, 1, 236, '0', '10', '2021-09-21 12:32:02', '2021-09-21 12:32:02'),
(2352, 83, 1, 236, '0', '10', '2021-09-21 12:32:02', '2021-09-21 12:32:02'),
(2353, 85, 1, 236, '0', '10', '2021-09-21 12:32:02', '2021-09-21 12:32:02'),
(2354, 86, 1, 236, '0', '10', '2021-09-21 12:32:02', '2021-09-21 12:32:02'),
(2355, 87, 1, 236, '0', '10', '2021-09-21 12:32:02', '2021-09-21 12:32:02'),
(2356, 88, 1, 236, '0', '10', '2021-09-21 12:32:02', '2021-09-21 12:32:02'),
(2357, 89, 1, 236, '0', '10', '2021-09-21 12:32:02', '2021-09-21 12:32:02'),
(2358, 90, 1, 236, '0', '10', '2021-09-21 12:32:02', '2021-09-21 12:32:02'),
(2359, 91, 1, 236, '0', '10', '2021-09-21 12:32:02', '2021-09-21 12:32:02'),
(2360, 92, 1, 236, '0', '10', '2021-09-21 12:32:02', '2021-09-21 12:32:02'),
(2361, 93, 1, 236, '0', '10', '2021-09-21 12:32:02', '2021-09-21 12:32:02'),
(2362, 94, 1, 236, '0', '10', '2021-09-21 12:32:02', '2021-09-21 12:32:02'),
(2363, 5, 1, 237, '0', '10', '2021-09-21 12:41:27', '2021-09-21 12:41:27'),
(2364, 78, 1, 237, '0', '10', '2021-09-21 12:41:27', '2021-09-21 12:41:27'),
(2365, 79, 1, 237, '0', '10', '2021-09-21 12:41:27', '2021-09-21 12:41:27'),
(2366, 83, 1, 237, '0', '10', '2021-09-21 12:41:27', '2021-09-21 12:41:27'),
(2367, 85, 1, 237, '0', '10', '2021-09-21 12:41:27', '2021-09-21 12:41:27'),
(2368, 86, 1, 237, '0', '10', '2021-09-21 12:41:27', '2021-09-21 12:41:27'),
(2369, 87, 1, 237, '0', '10', '2021-09-21 12:41:27', '2021-09-21 12:41:27'),
(2370, 88, 1, 237, '0', '10', '2021-09-21 12:41:27', '2021-09-21 12:41:27'),
(2371, 89, 1, 237, '0', '10', '2021-09-21 12:41:27', '2021-09-21 12:41:27'),
(2372, 90, 1, 237, '0', '10', '2021-09-21 12:41:27', '2021-09-21 12:41:27'),
(2373, 91, 1, 237, '0', '10', '2021-09-21 12:41:27', '2021-09-21 12:41:27'),
(2374, 92, 1, 237, '0', '10', '2021-09-21 12:41:27', '2021-09-21 12:41:27'),
(2375, 93, 1, 237, '0', '10', '2021-09-21 12:41:27', '2021-09-21 12:41:27'),
(2376, 94, 1, 237, '0', '10', '2021-09-21 12:41:27', '2021-09-21 12:41:27'),
(2377, 5, 1, 238, '12656', '10', '2021-09-21 12:42:27', '2021-09-21 12:42:27'),
(2378, 78, 1, 238, '12656', '10', '2021-09-21 12:42:27', '2021-09-21 12:42:27'),
(2379, 79, 1, 238, '12656', '10', '2021-09-21 12:42:27', '2021-09-21 12:42:27'),
(2380, 83, 1, 238, '12656', '10', '2021-09-21 12:42:27', '2021-09-21 12:42:27'),
(2381, 85, 1, 238, '12656', '10', '2021-09-21 12:42:27', '2021-09-21 12:42:27'),
(2382, 86, 1, 238, '12656', '10', '2021-09-21 12:42:27', '2021-09-21 12:42:27'),
(2383, 87, 1, 238, '12656', '10', '2021-09-21 12:42:27', '2021-09-21 12:42:27'),
(2384, 88, 1, 238, '12656', '10', '2021-09-21 12:42:27', '2021-09-21 12:42:27'),
(2385, 89, 1, 238, '12656', '10', '2021-09-21 12:42:27', '2021-09-21 12:42:27'),
(2386, 90, 1, 238, '12656', '10', '2021-09-21 12:42:27', '2021-09-21 12:42:27'),
(2387, 91, 1, 238, '12656', '10', '2021-09-21 12:42:27', '2021-09-21 12:42:27'),
(2388, 92, 1, 238, '12656', '10', '2021-09-21 12:42:27', '2021-09-21 12:42:27'),
(2389, 93, 1, 238, '12656', '10', '2021-09-21 12:42:27', '2021-09-21 12:42:27'),
(2390, 94, 1, 238, '12656', '10', '2021-09-21 12:42:27', '2021-09-21 12:42:27'),
(2391, 5, 1, 240, '0', '10', '2021-09-21 12:47:55', '2021-09-21 12:47:55'),
(2392, 78, 1, 240, '0', '10', '2021-09-21 12:47:55', '2021-09-21 12:47:55'),
(2393, 79, 1, 240, '0', '10', '2021-09-21 12:47:55', '2021-09-21 12:47:55'),
(2394, 83, 1, 240, '0', '10', '2021-09-21 12:47:55', '2021-09-21 12:47:55'),
(2395, 85, 1, 240, '0', '10', '2021-09-21 12:47:55', '2021-09-21 12:47:55'),
(2396, 86, 1, 240, '0', '10', '2021-09-21 12:47:55', '2021-09-21 12:47:55'),
(2397, 87, 1, 240, '0', '10', '2021-09-21 12:47:55', '2021-09-21 12:47:55'),
(2398, 88, 1, 240, '0', '10', '2021-09-21 12:47:55', '2021-09-21 12:47:55'),
(2399, 89, 1, 240, '0', '10', '2021-09-21 12:47:55', '2021-09-21 12:47:55'),
(2400, 90, 1, 240, '0', '10', '2021-09-21 12:47:55', '2021-09-21 12:47:55'),
(2401, 91, 1, 240, '0', '10', '2021-09-21 12:47:55', '2021-09-21 12:47:55'),
(2402, 92, 1, 240, '0', '10', '2021-09-21 12:47:55', '2021-09-21 12:47:55'),
(2403, 93, 1, 240, '0', '10', '2021-09-21 12:47:55', '2021-09-21 12:47:55'),
(2404, 94, 1, 240, '0', '10', '2021-09-21 12:47:55', '2021-09-21 12:47:55'),
(2405, 5, 1, 241, '0', '10', '2021-09-21 12:49:53', '2021-09-21 12:49:53'),
(2406, 78, 1, 241, '0', '10', '2021-09-21 12:49:53', '2021-09-21 12:49:53'),
(2407, 79, 1, 241, '0', '10', '2021-09-21 12:49:53', '2021-09-21 12:49:53'),
(2408, 83, 1, 241, '0', '10', '2021-09-21 12:49:53', '2021-09-21 12:49:53'),
(2409, 85, 1, 241, '0', '10', '2021-09-21 12:49:53', '2021-09-21 12:49:53'),
(2410, 86, 1, 241, '0', '10', '2021-09-21 12:49:53', '2021-09-21 12:49:53'),
(2411, 87, 1, 241, '0', '10', '2021-09-21 12:49:53', '2021-09-21 12:49:53'),
(2412, 88, 1, 241, '0', '10', '2021-09-21 12:49:53', '2021-09-21 12:49:53'),
(2413, 89, 1, 241, '0', '10', '2021-09-21 12:49:53', '2021-09-21 12:49:53'),
(2414, 90, 1, 241, '0', '10', '2021-09-21 12:49:53', '2021-09-21 12:49:53'),
(2415, 91, 1, 241, '0', '10', '2021-09-21 12:49:53', '2021-09-21 12:49:53'),
(2416, 92, 1, 241, '0', '10', '2021-09-21 12:49:53', '2021-09-21 12:49:53'),
(2417, 93, 1, 241, '0', '10', '2021-09-21 12:49:53', '2021-09-21 12:49:53'),
(2418, 94, 1, 241, '0', '10', '2021-09-21 12:49:53', '2021-09-21 12:49:53'),
(2419, 5, 1, 242, '0', '10', '2021-09-21 12:52:06', '2021-09-21 12:52:06'),
(2420, 78, 1, 242, '0', '10', '2021-09-21 12:52:06', '2021-09-21 12:52:06'),
(2421, 79, 1, 242, '0', '10', '2021-09-21 12:52:06', '2021-09-21 12:52:06'),
(2422, 83, 1, 242, '0', '10', '2021-09-21 12:52:06', '2021-09-21 12:52:06'),
(2423, 85, 1, 242, '0', '10', '2021-09-21 12:52:06', '2021-09-21 12:52:06'),
(2424, 86, 1, 242, '0', '10', '2021-09-21 12:52:06', '2021-09-21 12:52:06'),
(2425, 87, 1, 242, '0', '10', '2021-09-21 12:52:06', '2021-09-21 12:52:06'),
(2426, 88, 1, 242, '0', '10', '2021-09-21 12:52:06', '2021-09-21 12:52:06'),
(2427, 89, 1, 242, '0', '10', '2021-09-21 12:52:06', '2021-09-21 12:52:06'),
(2428, 90, 1, 242, '0', '10', '2021-09-21 12:52:06', '2021-09-21 12:52:06'),
(2429, 91, 1, 242, '0', '10', '2021-09-21 12:52:06', '2021-09-21 12:52:06'),
(2430, 92, 1, 242, '0', '10', '2021-09-21 12:52:06', '2021-09-21 12:52:06'),
(2431, 93, 1, 242, '0', '10', '2021-09-21 12:52:06', '2021-09-21 12:52:06'),
(2432, 94, 1, 242, '0', '10', '2021-09-21 12:52:06', '2021-09-21 12:52:06'),
(2433, 5, 1, 243, '0', '10', '2021-09-21 13:02:19', '2021-09-21 13:02:19'),
(2434, 78, 1, 243, '0', '10', '2021-09-21 13:02:19', '2021-09-21 13:02:19'),
(2435, 79, 1, 243, '0', '10', '2021-09-21 13:02:19', '2021-09-21 13:02:19'),
(2436, 83, 1, 243, '0', '10', '2021-09-21 13:02:19', '2021-09-21 13:02:19'),
(2437, 85, 1, 243, '0', '10', '2021-09-21 13:02:19', '2021-09-21 13:02:19'),
(2438, 86, 1, 243, '0', '10', '2021-09-21 13:02:19', '2021-09-21 13:02:19'),
(2439, 87, 1, 243, '0', '10', '2021-09-21 13:02:19', '2021-09-21 13:02:19'),
(2440, 88, 1, 243, '0', '10', '2021-09-21 13:02:19', '2021-09-21 13:02:19'),
(2441, 89, 1, 243, '0', '10', '2021-09-21 13:02:19', '2021-09-21 13:02:19'),
(2442, 90, 1, 243, '0', '10', '2021-09-21 13:02:19', '2021-09-21 13:02:19'),
(2443, 91, 1, 243, '0', '10', '2021-09-21 13:02:19', '2021-09-21 13:02:19'),
(2444, 92, 1, 243, '0', '10', '2021-09-21 13:02:19', '2021-09-21 13:02:19'),
(2445, 93, 1, 243, '0', '10', '2021-09-21 13:02:19', '2021-09-21 13:02:19'),
(2446, 94, 1, 243, '0', '10', '2021-09-21 13:02:19', '2021-09-21 13:02:19'),
(2447, 5, 1, 244, '0', '10', '2021-09-21 13:31:07', '2021-09-21 13:31:07'),
(2448, 78, 1, 244, '0', '10', '2021-09-21 13:31:07', '2021-09-21 13:31:07'),
(2449, 79, 1, 244, '0', '10', '2021-09-21 13:31:07', '2021-09-21 13:31:07'),
(2450, 83, 1, 244, '0', '10', '2021-09-21 13:31:07', '2021-09-21 13:31:07'),
(2451, 85, 1, 244, '0', '10', '2021-09-21 13:31:07', '2021-09-21 13:31:07'),
(2452, 86, 1, 244, '0', '10', '2021-09-21 13:31:07', '2021-09-21 13:31:07'),
(2453, 87, 1, 244, '0', '10', '2021-09-21 13:31:07', '2021-09-21 13:31:07'),
(2454, 88, 1, 244, '0', '10', '2021-09-21 13:31:07', '2021-09-21 13:31:07'),
(2455, 89, 1, 244, '0', '10', '2021-09-21 13:31:07', '2021-09-21 13:31:07'),
(2456, 90, 1, 244, '0', '10', '2021-09-21 13:31:07', '2021-09-21 13:31:07'),
(2457, 91, 1, 244, '0', '10', '2021-09-21 13:31:07', '2021-09-21 13:31:07'),
(2458, 92, 1, 244, '0', '10', '2021-09-21 13:31:07', '2021-09-21 13:31:07'),
(2459, 93, 1, 244, '0', '10', '2021-09-21 13:31:07', '2021-09-21 13:31:07'),
(2460, 94, 1, 244, '0', '10', '2021-09-21 13:31:07', '2021-09-21 13:31:07'),
(2461, 5, 1, 245, '17', '10', '2021-09-21 13:33:24', '2021-09-21 13:33:24'),
(2462, 78, 1, 245, '17', '10', '2021-09-21 13:33:24', '2021-09-21 13:33:24'),
(2463, 79, 1, 245, '17', '10', '2021-09-21 13:33:24', '2021-09-21 13:33:24'),
(2464, 83, 1, 245, '17', '10', '2021-09-21 13:33:24', '2021-09-21 13:33:24'),
(2465, 85, 1, 245, '17', '10', '2021-09-21 13:33:24', '2021-09-21 13:33:24'),
(2466, 86, 1, 245, '17', '10', '2021-09-21 13:33:24', '2021-09-21 13:33:24'),
(2467, 87, 1, 245, '17', '10', '2021-09-21 13:33:24', '2021-09-21 13:33:24'),
(2468, 88, 1, 245, '17', '10', '2021-09-21 13:33:24', '2021-09-21 13:33:24'),
(2469, 89, 1, 245, '17', '10', '2021-09-21 13:33:24', '2021-09-21 13:33:24'),
(2470, 90, 1, 245, '17', '10', '2021-09-21 13:33:24', '2021-09-21 13:33:24'),
(2471, 91, 1, 245, '17', '10', '2021-09-21 13:33:24', '2021-09-21 13:33:24'),
(2472, 92, 1, 245, '17', '10', '2021-09-21 13:33:24', '2021-09-21 13:33:24'),
(2473, 93, 1, 245, '17', '10', '2021-09-21 13:33:24', '2021-09-21 13:33:24'),
(2474, 94, 1, 245, '17', '10', '2021-09-21 13:33:24', '2021-09-21 13:33:24'),
(2475, 5, 1, 246, '0', '10', '2021-09-21 13:34:41', '2021-09-21 13:34:41'),
(2476, 78, 1, 246, '0', '10', '2021-09-21 13:34:41', '2021-09-21 13:34:41'),
(2477, 79, 1, 246, '0', '10', '2021-09-21 13:34:41', '2021-09-21 13:34:41'),
(2478, 83, 1, 246, '0', '10', '2021-09-21 13:34:41', '2021-09-21 13:34:41'),
(2479, 85, 1, 246, '0', '10', '2021-09-21 13:34:41', '2021-09-21 13:34:41'),
(2480, 86, 1, 246, '0', '10', '2021-09-21 13:34:41', '2021-09-21 13:34:41'),
(2481, 87, 1, 246, '0', '10', '2021-09-21 13:34:41', '2021-09-21 13:34:41'),
(2482, 88, 1, 246, '0', '10', '2021-09-21 13:34:41', '2021-09-21 13:34:41'),
(2483, 89, 1, 246, '0', '10', '2021-09-21 13:34:41', '2021-09-21 13:34:41'),
(2484, 90, 1, 246, '0', '10', '2021-09-21 13:34:41', '2021-09-21 13:34:41'),
(2485, 91, 1, 246, '0', '10', '2021-09-21 13:34:41', '2021-09-21 13:34:41'),
(2486, 92, 1, 246, '0', '10', '2021-09-21 13:34:41', '2021-09-21 13:34:41'),
(2487, 93, 1, 246, '0', '10', '2021-09-21 13:34:41', '2021-09-21 13:34:41'),
(2488, 94, 1, 246, '0', '10', '2021-09-21 13:34:41', '2021-09-21 13:34:41'),
(2489, 5, 1, 247, '0', '10', '2021-09-21 13:36:44', '2021-09-21 13:36:44'),
(2490, 78, 1, 247, '0', '10', '2021-09-21 13:36:44', '2021-09-21 13:36:44'),
(2491, 79, 1, 247, '0', '10', '2021-09-21 13:36:44', '2021-09-21 13:36:44'),
(2492, 83, 1, 247, '0', '10', '2021-09-21 13:36:44', '2021-09-21 13:36:44'),
(2493, 85, 1, 247, '0', '10', '2021-09-21 13:36:44', '2021-09-21 13:36:44'),
(2494, 86, 1, 247, '0', '10', '2021-09-21 13:36:44', '2021-09-21 13:36:44'),
(2495, 87, 1, 247, '0', '10', '2021-09-21 13:36:44', '2021-09-21 13:36:44'),
(2496, 88, 1, 247, '0', '10', '2021-09-21 13:36:44', '2021-09-21 13:36:44'),
(2497, 89, 1, 247, '0', '10', '2021-09-21 13:36:44', '2021-09-21 13:36:44'),
(2498, 90, 1, 247, '0', '10', '2021-09-21 13:36:44', '2021-09-21 13:36:44'),
(2499, 91, 1, 247, '0', '10', '2021-09-21 13:36:44', '2021-09-21 13:36:44'),
(2500, 92, 1, 247, '0', '10', '2021-09-21 13:36:44', '2021-09-21 13:36:44'),
(2501, 93, 1, 247, '0', '10', '2021-09-21 13:36:44', '2021-09-21 13:36:44'),
(2502, 94, 1, 247, '0', '10', '2021-09-21 13:36:44', '2021-09-21 13:36:44'),
(2503, 5, 1, 248, '0', '10', '2021-09-21 13:40:37', '2021-09-21 13:40:37'),
(2504, 78, 1, 248, '0', '10', '2021-09-21 13:40:37', '2021-09-21 13:40:37'),
(2505, 79, 1, 248, '0', '10', '2021-09-21 13:40:37', '2021-09-21 13:40:37'),
(2506, 83, 1, 248, '0', '10', '2021-09-21 13:40:37', '2021-09-21 13:40:37'),
(2507, 85, 1, 248, '0', '10', '2021-09-21 13:40:37', '2021-09-21 13:40:37'),
(2508, 86, 1, 248, '0', '10', '2021-09-21 13:40:37', '2021-09-21 13:40:37'),
(2509, 87, 1, 248, '0', '10', '2021-09-21 13:40:37', '2021-09-21 13:40:37'),
(2510, 88, 1, 248, '0', '10', '2021-09-21 13:40:37', '2021-09-21 13:40:37'),
(2511, 89, 1, 248, '0', '10', '2021-09-21 13:40:37', '2021-09-21 13:40:37'),
(2512, 90, 1, 248, '0', '10', '2021-09-21 13:40:37', '2021-09-21 13:40:37'),
(2513, 91, 1, 248, '0', '10', '2021-09-21 13:40:37', '2021-09-21 13:40:37'),
(2514, 92, 1, 248, '0', '10', '2021-09-21 13:40:37', '2021-09-21 13:40:37'),
(2515, 93, 1, 248, '0', '10', '2021-09-21 13:40:37', '2021-09-21 13:40:37'),
(2516, 94, 1, 248, '0', '10', '2021-09-21 13:40:37', '2021-09-21 13:40:37'),
(2517, 5, 1, 255, '0', '10', '2021-09-21 16:46:19', '2021-09-21 16:46:19'),
(2518, 78, 1, 255, '0', '10', '2021-09-21 16:46:19', '2021-09-21 16:46:19'),
(2519, 79, 1, 255, '0', '10', '2021-09-21 16:46:19', '2021-09-21 16:46:19'),
(2520, 83, 1, 255, '0', '10', '2021-09-21 16:46:19', '2021-09-21 16:46:19'),
(2521, 97, 1, 255, '0', '10', '2021-09-21 16:46:19', '2021-09-21 16:46:19'),
(2522, 98, 1, 255, '0', '10', '2021-09-21 16:46:19', '2021-09-21 16:46:19'),
(2523, 99, 1, 255, '0', '10', '2021-09-21 16:46:19', '2021-09-21 16:46:19'),
(2524, 100, 1, 255, '0', '10', '2021-09-21 16:46:19', '2021-09-21 16:46:19'),
(2525, 101, 1, 255, '0', '10', '2021-09-21 16:46:19', '2021-09-21 16:46:19'),
(2526, 102, 1, 255, '0', '10', '2021-09-21 16:46:19', '2021-09-21 16:46:19'),
(2527, 103, 1, 255, '0', '10', '2021-09-21 16:46:19', '2021-09-21 16:46:19'),
(2528, 5, 1, 256, '0', '10', '2021-09-21 16:52:56', '2021-09-21 16:52:56'),
(2529, 78, 1, 256, '0', '10', '2021-09-21 16:52:56', '2021-09-21 16:52:56'),
(2530, 79, 1, 256, '0', '10', '2021-09-21 16:52:56', '2021-09-21 16:52:56'),
(2531, 83, 1, 256, '0', '10', '2021-09-21 16:52:56', '2021-09-21 16:52:56'),
(2532, 97, 1, 256, '0', '10', '2021-09-21 16:52:56', '2021-09-21 16:52:56'),
(2533, 98, 1, 256, '0', '10', '2021-09-21 16:52:56', '2021-09-21 16:52:56'),
(2534, 99, 1, 256, '0', '10', '2021-09-21 16:52:56', '2021-09-21 16:52:56'),
(2535, 100, 1, 256, '0', '10', '2021-09-21 16:52:56', '2021-09-21 16:52:56'),
(2536, 101, 1, 256, '0', '10', '2021-09-21 16:52:56', '2021-09-21 16:52:56'),
(2537, 102, 1, 256, '0', '10', '2021-09-21 16:52:56', '2021-09-21 16:52:56'),
(2538, 103, 1, 256, '0', '10', '2021-09-21 16:52:56', '2021-09-21 16:52:56'),
(2539, 5, 1, 257, '7', '10', '2021-09-21 17:40:22', '2021-09-21 17:40:22'),
(2540, 78, 1, 257, '7', '10', '2021-09-21 17:40:22', '2021-09-21 17:40:22'),
(2541, 79, 1, 257, '7', '10', '2021-09-21 17:40:22', '2021-09-21 17:40:22'),
(2542, 83, 1, 257, '7', '10', '2021-09-21 17:40:22', '2021-09-21 17:40:22'),
(2543, 97, 1, 257, '7', '10', '2021-09-21 17:40:22', '2021-09-21 17:40:22'),
(2544, 98, 1, 257, '7', '10', '2021-09-21 17:40:22', '2021-09-21 17:40:22'),
(2545, 99, 1, 257, '7', '10', '2021-09-21 17:40:22', '2021-09-21 17:40:22'),
(2546, 100, 1, 257, '7', '10', '2021-09-21 17:40:22', '2021-09-21 17:40:22'),
(2547, 101, 1, 257, '7', '10', '2021-09-21 17:40:22', '2021-09-21 17:40:22'),
(2548, 102, 1, 257, '7', '10', '2021-09-21 17:40:22', '2021-09-21 17:40:22'),
(2549, 103, 1, 257, '7', '10', '2021-09-21 17:40:22', '2021-09-21 17:40:22');

-- --------------------------------------------------------

--
-- Table structure for table `service_area`
--

CREATE TABLE `service_area` (
  `id` int(11) NOT NULL,
  `service_name` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `timezone` varchar(255) NOT NULL,
  `vehicle_service` varchar(255) NOT NULL,
  `driver_doc` text NOT NULL,
  `vehicle_doc` text NOT NULL,
  `driver_minbal` varchar(255) NOT NULL,
  `delivery_area` varchar(255) NOT NULL,
  `max_tollprice` varchar(255) NOT NULL,
  `bill_method` varchar(255) NOT NULL,
  `latitute` varchar(255) DEFAULT NULL,
  `longitute` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_area`
--

INSERT INTO `service_area` (`id`, `service_name`, `country`, `area`, `timezone`, `vehicle_service`, `driver_doc`, `vehicle_doc`, `driver_minbal`, `delivery_area`, `max_tollprice`, `bill_method`, `latitute`, `longitute`, `created_at`, `updated_at`) VALUES
(1, '1', 'AFGHANISTAN', 'fgfd', '1', 'Motercycle', 'driver_doc-1630165591.jpg', 'vehicle_doc-1630165591.jpg', '', '', '', '', '', '', '2021-08-28 21:16:31', '2021-08-29 01:16:31'),
(4, 'Dura Express', 'ANGOLA', 'sdss', '1', 'Motercycle', 'driver_doc-1630165849.jpg', 'vehicle_doc-1630165849.jpg', '', '', '', '', '', '', '2021-08-28 21:20:49', '2021-08-29 01:20:49'),
(6, 'Dura Express', 'ARMENIA', '4564654', 'ARUBA', 'Motercycle', 'driver_doc-1630146570.jpg', 'vehicle_doc-1630146570.jpg', '', '', '', '', '', '', '2021-08-28 15:59:30', '2021-08-28 19:59:30'),
(7, '1', 'PHILIPPINES', 'test500222', '0', 'Motercycle1', 'driver_doc-1630146929.webp', 'vehicle_doc-1630146929.webp', '', '', '', '', '', '', '2021-08-28 16:05:29', '2021-08-28 20:05:29'),
(9, 'Dura Express', 'INDIA', 'Noida', 'INDIA', 'Motercycle', 'driver_doc-1630146570.jpg', 'vehicle_doc-1630146570.jpg', '', '', '', '', '', '', '2021-08-28 15:59:30', '2021-08-28 19:59:30'),
(10, 'Dura Express', 'INDIA', 'Mohali', 'INDIA', 'Motercycle', 'driver_doc-1630146570.jpg', 'vehicle_doc-1630146570.jpg', '', '', '', '', '', '', '2021-08-28 15:59:30', '2021-08-28 19:59:30'),
(11, 'Dura Express', 'INDIA', 'Chandigarh', 'INDIA', 'Motercycle', 'driver_doc-1630146570.jpg', 'vehicle_doc-1630146570.jpg', '', '', '', '', '', '', '2021-08-28 15:59:30', '2021-08-28 19:59:30');

-- --------------------------------------------------------

--
-- Table structure for table `shedulecancel`
--

CREATE TABLE `shedulecancel` (
  `id` int(11) NOT NULL,
  `pickup_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT 0,
  `driver_id` int(11) DEFAULT 0,
  `canceledby` varchar(255) NOT NULL,
  `reason` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shedulecancel`
--

INSERT INTO `shedulecancel` (`id`, `pickup_id`, `user_id`, `driver_id`, `canceledby`, `reason`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, 'user', 'test', '2021-08-24 13:12:51', '2021-08-24 13:12:51'),
(2, 1, 1, 0, 'user', 'test', '2021-08-24 13:38:21', '2021-08-24 13:38:21'),
(3, 138, 149, 0, 'user', 'nothing', '2021-08-24 14:32:47', '2021-08-24 14:32:47'),
(4, 139, 149, 0, 'user', 'Test', '2021-08-24 14:58:40', '2021-08-24 14:58:40'),
(5, 1, 149, 0, 'user', 'cancel', '2021-08-27 11:22:15', '2021-08-27 11:22:15'),
(6, 3, 149, 0, 'user', 'cancel', '2021-08-27 11:48:00', '2021-08-27 11:48:00'),
(7, 4, 149, 0, 'user', 'text', '2021-08-27 12:09:30', '2021-08-27 12:09:30'),
(8, 5, 149, 0, 'user', 'test', '2021-08-27 16:44:23', '2021-08-27 16:44:23'),
(9, 8, 149, 0, 'user', 'no ', '2021-08-28 05:25:18', '2021-08-28 05:25:18'),
(10, 16, 149, 0, 'user', 'ht', '2021-08-28 05:58:07', '2021-08-28 05:58:07'),
(11, 18, 298, 0, 'user', 'ihh', '2021-09-07 18:13:37', '2021-09-07 18:13:37'),
(12, 30, 312, 0, 'user', 'no', '2021-09-08 07:33:45', '2021-09-08 07:33:45'),
(13, 70, 316, 0, 'user', 'no', '2021-09-10 10:59:02', '2021-09-10 10:59:02'),
(14, 225, 325, 0, 'user', 'text', '2021-09-20 16:20:04', '2021-09-20 16:20:04'),
(15, 75, 303, 0, 'user', 'cancelled', '2021-09-21 15:52:41', '2021-09-21 15:52:41'),
(16, 206, 303, 0, 'user', 'h tt ', '2021-09-21 15:56:34', '2021-09-21 15:56:34'),
(17, 206, 303, 0, 'user', 'h tt ', '2021-09-21 15:57:04', '2021-09-21 15:57:04'),
(18, 97, 303, 0, 'user', 'tbg t ', '2021-09-21 16:01:38', '2021-09-21 16:01:38'),
(19, 1, 1, 0, 'user', 'test', '2021-09-21 16:07:43', '2021-09-21 16:07:43'),
(20, 1, 1, 0, 'user', 'test', '2021-09-21 16:10:23', '2021-09-21 16:10:23'),
(21, 104, 303, 0, 'user', 'vyhvbkjgkj', '2021-09-21 16:17:51', '2021-09-21 16:17:51');

-- --------------------------------------------------------

--
-- Table structure for table `standard_rules`
--

CREATE TABLE `standard_rules` (
  `id` int(11) NOT NULL,
  `vehicle_id` varchar(255) NOT NULL,
  `service_area_id` varchar(255) NOT NULL,
  `delivery_type` varchar(255) NOT NULL,
  `service_type` varchar(255) NOT NULL,
  `base_fare` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `standard_rules`
--

INSERT INTO `standard_rules` (`id`, `vehicle_id`, `service_area_id`, `delivery_type`, `service_type`, `base_fare`, `status`, `created_at`, `updated_at`) VALUES
(0, '1', '7', '1', 'Dura Express, Dura Eats, Dura Shop', '50', 1, '2021-09-05 19:28:26', '2021-09-05 19:28:26');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `upload_by` int(11) DEFAULT NULL,
  `status_name` varchar(255) DEFAULT NULL,
  `status` tinyint(11) DEFAULT NULL COMMENT '''0''=> Active, ''1''=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `upload_by`, `status_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Active', 0, '2020-09-09 07:15:35', ''),
(2, 1, 'Inactive', 0, '2020-09-09 07:15:43', ''),
(3, 1, 'No reply', 0, '2020-09-09 07:15:58', ''),
(4, 1, 'Contact Tomorrow', 0, '2020-09-09 07:16:24', '');

-- --------------------------------------------------------

--
-- Table structure for table `styles`
--

CREATE TABLE `styles` (
  `id` int(11) NOT NULL,
  `style_name` text NOT NULL,
  `description` text NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `styles`
--

INSERT INTO `styles` (`id`, `style_name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Driving', 'test1', 'inactive', '2021-08-24 15:17:44', '2021-08-28 19:56:18'),
(2, 'Casual drivein', 'add-Styles', 'active', '2021-08-24 15:53:40', '2021-08-24 15:53:40'),
(3, 'Driving1111', 'test111', 'inactive', '2021-08-28 19:57:01', '2021-08-28 19:57:01');

-- --------------------------------------------------------

--
-- Table structure for table `tipprice`
--

CREATE TABLE `tipprice` (
  `id` int(11) NOT NULL,
  `currency` text NOT NULL,
  `price` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipprice`
--

INSERT INTO `tipprice` (`id`, `currency`, `price`, `created_at`, `updated_at`) VALUES
(1, '', '10', '2021-07-18 13:18:34', ''),
(2, '', '20', '2021-07-18 13:18:34', ''),
(3, '', '30', '2021-07-18 13:18:50', ''),
(4, '', '40', '2021-07-18 13:18:50', ''),
(5, '', '50', '2021-07-18 13:19:11', '');

-- --------------------------------------------------------

--
-- Table structure for table `transactionmaster`
--

CREATE TABLE `transactionmaster` (
  `transactiontypeId` int(11) NOT NULL,
  `description` varchar(300) NOT NULL,
  `remarks` varchar(500) NOT NULL,
  `inactive` tinyint(1) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactionmaster`
--

INSERT INTO `transactionmaster` (`transactiontypeId`, `description`, `remarks`, `inactive`, `created_at`, `updated_at`) VALUES
(1, 'Dura Express', 'Transaction due to dura express', 0, '', ''),
(2, 'Money added to wallet', 'Money load to wallet from bank', 0, '', ''),
(1, 'Dura Express', 'Transaction due to dura express', 0, '', ''),
(2, 'Money added to wallet', 'Money load to wallet from bank', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `units_measurement`
--

CREATE TABLE `units_measurement` (
  `id` int(11) NOT NULL,
  `unitName` text NOT NULL,
  `unitDescription` text NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `units_measurement`
--

INSERT INTO `units_measurement` (`id`, `unitName`, `unitDescription`, `status`, `created_at`, `updated_at`) VALUES
(1, 'mg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry......', 'inactive', '2021-08-18 12:31:17', '2021-08-28 16:44:36'),
(2, 'Mg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'active', '2021-08-18 12:31:17', '2021-08-18 12:31:17'),
(3, 'Mg', 'Lorem ipsum dolor sit amet consectetur adipisicing elit.', 'active', '2021-08-18 18:01:29', '2021-08-21 19:58:46'),
(4, 'mlllll', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia', 'active', '2021-08-18 18:02:48', '2021-08-25 16:47:11'),
(5, 'mg', 'Lorem ipsum dolor sit amet consectetur adipisicing elit.', 'inactive', '2021-08-28 16:45:34', '2021-08-28 16:45:59');

-- --------------------------------------------------------

--
-- Table structure for table `useraddress`
--

CREATE TABLE `useraddress` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(300) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `contactperson` varchar(255) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `isdefault` enum('1','0') NOT NULL DEFAULT '0',
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `useraddress`
--

INSERT INTO `useraddress` (`id`, `user_id`, `address1`, `address2`, `country`, `contactperson`, `mobile`, `isdefault`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(2, 1, 'addressupdate', 'address2', NULL, 'test', '1234567890', '0', NULL, NULL, '2021-07-31 12:20:55', '2021-07-31 12:20:55'),
(3, 1, 'address1', 'address2', NULL, 'test', '1234567890', '0', NULL, NULL, '2021-08-06 10:41:01', '2021-08-06 10:41:01'),
(4, 1, 'address1', 'address2', NULL, 'test', '1234567890', '0', '30.703852800000003', '76.7076768', '2021-08-06 11:58:50', '2021-08-06 11:58:50'),
(12, 175, 'Noida phase 2', 'B block', NULL, 'Akash', '8882341937', '0', '28.5385481', '77.4075181', '2021-08-16 05:47:40', '2021-08-16 05:47:40'),
(13, 175, 'Noida phase 2', 'b block', NULL, 'Akash', '8882341937', '1', '28.5385481', '77.4075181', '2021-08-16 05:48:48', '2021-08-16 05:48:48'),
(14, 281, 'j-802 would Bank Barra Kanpur Nagar', 'j block', NULL, 'Akash', '8882341937', '1', '28.5333051', '77.4140122', '2021-08-31 11:07:35', '2021-08-31 11:07:35'),
(15, 288, 'j-802 would Bank Barra Kanpur', 'j block', NULL, 'Akash', '8882341937', '1', '28.6265329', '77.0280072', '2021-09-01 02:17:38', '2021-09-01 02:17:38'),
(22, 304, '1976  Makati Philippines 1233', '1976 M Reyes Street Bangkal', NULL, 'Robert', '09159851768', '1', '14.5448331', '121.0100527', '2021-09-10 23:55:19', '2021-09-10 23:55:19'),
(23, 304, 'Corinthian Executive Regency Bldg. (Condominium), Corinthian Executive Regency, Ortigas Center, Pasig, Metro Manila, Philippines', '2507 Corinthian Executive Regency Ortigas Center', NULL, 'Benjie Javier', '09081250030', '0', '14.5899067', '121.0616823', '2021-09-10 23:56:36', '2021-09-10 23:56:36'),
(25, 327, 'D-12 Gautam Buddh Nagar Noida India 201304', 'jrjejsjek', NULL, 'jdjejdjdj', '95956464949', '1', '28.5338455', '77.4140747', '2021-09-16 12:02:18', '2021-09-16 12:02:18'),
(27, 298, 'Dhawalgiri Apartments East Delhi Noida India 201301', '50-b dhawalgiri appartments sec-11 noida', NULL, 'kashish', '9650936880', '1', '28.6018371', '77.3377309', '2021-09-18 16:32:25', '2021-09-18 16:32:25'),
(28, 325, 'Belwatika Road Palamu Daltonganj India 822101', 'test123', NULL, 'tes', '08555555555', '0', '24.03243453', '84.06863662', '2021-09-18 17:03:30', '2021-09-18 17:03:30'),
(30, 1, 'address1', 'address2', NULL, 'test', '1234567890', '0', '30.703852800000003', '76.7076768', '2021-09-18 19:10:48', '2021-09-18 19:10:48'),
(32, 1, 'address1', 'address2', NULL, 'test', '1234567890', '1', '30.703852800000003', '76.7076768', '2021-09-19 08:24:13', '2021-09-19 08:24:13'),
(33, 303, '21 C. Benitez Street, Quezon City, Metro Manila, Philippines', 'mohali', NULL, 'Aadesh Mishra', '07508516040', '0', '14.6114512', '121.0448013', '2021-09-19 08:47:49', '2021-09-19 09:06:43'),
(35, 303, '216 General Luis, Novaliches, Quezon City, Metro Manila, Philippines', 'srgdr', NULL, 'Aadesh Mishra', '07508516040', '0', '14.721707', '121.036082', '2021-09-19 08:53:32', '2021-09-19 09:07:04'),
(36, 303, '2365 Chromium, San Andres Bukid, Manila, Metro Manila, Philippines', 'rgest', NULL, 'Aadesh Mishra', '07508516040', '0', '14.573879', '121.005456', '2021-09-19 09:04:26', '2021-09-19 09:04:26'),
(37, 303, '2365 Chromium, San Andres Bukid, Manila, Metro Manila, Philippines', 'rgdf', NULL, 'Aadesh Mishra', '07508516040', '1', '14.573879', '121.005456', '2021-09-19 09:08:19', '2021-09-19 09:08:19');

-- --------------------------------------------------------

--
-- Table structure for table `userdocument`
--

CREATE TABLE `userdocument` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  `frontimage` text DEFAULT NULL,
  `backimage` text DEFAULT NULL,
  `status` int(10) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userdocument`
--

INSERT INTO `userdocument` (`id`, `user_id`, `document_id`, `frontimage`, `backimage`, `status`, `created_at`, `updated_at`) VALUES
(3, 1, 2, 'frontimage61125fc25024c-WhatsApp Image 2021-08-01 at 6.32.18 PM.jpeg', 'backimage61125f8803bc1-zero.png', 0, '2021-08-10 11:14:16', '2021-08-10 11:14:16'),
(4, 1, 1, 'frontimage61125f9bd2cf3-WhatsApp Image 2021-08-01 at 6.32.18 PM.jpeg', 'backimage61125faa3838a-zero.png', 0, '2021-08-10 11:14:35', '2021-08-10 11:14:35'),
(11, 149, 1, NULL, 'backimage611770808f74a-DocumentImage_backimage8o1Qy.jpg', 0, '2021-08-14 07:28:00', '2021-08-14 07:28:00'),
(15, 149, 4, NULL, 'backimage61177c1a3d204-DocumentImage_backimagew4AUG.jpg', 0, '2021-08-14 08:17:30', '2021-08-14 08:17:30'),
(16, 149, 3, 'frontimage6117852deb04b-DocumentImage_frontimageVU089.jpg', NULL, 0, '2021-08-14 08:56:13', '2021-08-14 08:56:13'),
(17, 196, 2, NULL, 'backimage6121723a5e04d-DocumentImage_backimageeji9r.jpg', 0, '2021-08-21 21:38:02', '2021-08-21 21:38:02'),
(18, 149, 2, 'frontimage612bb982a4e1f-DocumentImage_frontimagec8zut.jpg', NULL, 0, '2021-08-29 16:44:50', '2021-08-29 16:44:50'),
(19, 300, 1, 'frontimage6131b61e145b5-DocumentImage_frontimagedX5Iu.jpg', 'backimage6131b60e174ca-DocumentImage_backimageJxUNU.jpg', 0, '2021-09-03 05:43:42', '2021-09-03 05:43:42'),
(20, 300, 2, 'frontimage6131b631b87f1-DocumentImage_frontimageVY4Rk.jpg', 'backimage6131b63d62d85-DocumentImage_backimageQERtB.jpg', 0, '2021-09-03 05:44:17', '2021-09-03 05:44:17'),
(21, 312, 1, 'frontimage6138692254094-DocumentImage_frontimage5s9eI.jpg', 'backimage6138692e18073-DocumentImage_backimagei9MW3.jpg', 0, '2021-09-08 07:41:22', '2021-09-08 07:41:22'),
(22, 312, 2, 'frontimage6138693c4c8d4-DocumentImage_frontimageXtvAc.jpg', 'backimage61386944af384-DocumentImage_backimagenfvc5.jpg', 0, '2021-09-08 07:41:48', '2021-09-08 07:41:48'),
(23, 303, 1, 'frontimage6141b6f3c0e8a-DocumentImage_frontimage5Ey80.jpg', NULL, 0, '2021-09-09 07:22:45', '2021-09-09 07:22:45'),
(25, 1, 3, 'frontimage613e17717790f-APK NewTech - Ou (1).png', NULL, 0, '2021-09-12 15:06:25', '2021-09-12 15:06:25'),
(26, 303, 4, NULL, 'backimage6141b71093036-DocumentImage_backimageXqrnh.jpg', 0, '2021-09-15 09:04:16', '2021-09-15 09:04:16'),
(27, 303, 2, NULL, 'backimage614214b3b30c2-DocumentImage_backimage4T8KG.jpg', 0, '2021-09-15 15:43:47', '2021-09-15 15:43:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `facebook_id` varchar(255) DEFAULT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `users_role` enum('1','2','3','4','5') DEFAULT '1' COMMENT '''1''=>''Admin'', ''2''=>''White label'', ''3''=>''manager'', ''4''=>''employee, ''5''=>''Client''''',
  `upload_by` int(11) DEFAULT NULL,
  `white_label_id` int(11) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `view_password` varchar(250) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `dob` varchar(50) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL COMMENT '0=>mail, 1=>femail, 2=>other',
  `bill` varchar(255) DEFAULT NULL,
  `passport` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `remember_token` varchar(100) DEFAULT NULL,
  `referral_code` varchar(255) DEFAULT NULL,
  `referral_by` varchar(255) NOT NULL,
  `status` enum('0','1') DEFAULT '1' COMMENT '''1'' Active , ''0'' Inactive',
  `google` varchar(255) DEFAULT '0',
  `facebook` varchar(255) DEFAULT '0',
  `login_type` varchar(255) NOT NULL,
  `logged_in` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `facebook_id`, `google_id`, `country_code`, `users_role`, `upload_by`, `white_label_id`, `profile_image`, `name`, `first_name`, `last_name`, `password`, `view_password`, `email`, `country_id`, `city_id`, `address`, `phone`, `dob`, `gender`, `bill`, `passport`, `area`, `email_verified_at`, `remember_token`, `referral_code`, `referral_by`, `status`, `google`, `facebook`, `login_type`, `logged_in`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, '1', 0, NULL, '20200909165314-images.jfif', 'SuperAdmin', NULL, NULL, '$2a$08$TnLUue010iZQcUVL.b0bPeCaFvVqa221s0MmNopcnzeIg4q4jjxQa', '', 'admin@gmail.com', 0, NULL, NULL, '9020202020', '1993-05-04', 0, NULL, NULL, NULL, '2021-09-15 13:46:35', 'wtbye8dm9CIzDbq1DHcynTwf90yTKzbiNQpNOV05Q2oDDeHGGt9fEPaSqxFc', 'U5n2Pu0i', '', '1', NULL, NULL, '', 0, '2020-05-12 18:59:20', '2020-05-12 18:59:20'),
(141, NULL, NULL, NULL, '1', 1, NULL, 'photo610810f9910eb-WhatsApp Image 2021-08-01 at 6.32.18 PM.jpeg', 'first', NULL, NULL, '$2y$10$R5xSMc26e35bvD9tvyoU8.LYqAZ3jofJpX3QAJCdvwySz0dlStSyG', '12345678', 'manager@gmail.com', 1, NULL, 'Street-4, Sanjay colony Sasni Hathras 204216', '1234567890', '', 0, NULL, NULL, NULL, '2021-09-15 13:46:35', 'W1zBeyNgTmNVIwuxAjnJQnZx3Urcn8KDGvQf25Y1opNRXyoJ4VeQi46B9R2e', 'xJgWT18k', '', '1', NULL, NULL, '', 0, '2020-09-30 14:52:01', '2020-09-30 05:22:01'),
(292, NULL, NULL, '+63', '1', NULL, NULL, 'file612f4c6595a19-meetingscreen.png', NULL, 'up', 'senior', '$2y$10$QrlirBHy5MB4mULPSFZYg.4aL4zpWsX72a6zTjQ4tv8gB.70pG6HS', NULL, 'up@gmail.com', 169, NULL, NULL, '7905848385', NULL, NULL, NULL, NULL, 'area', '2021-09-18 19:58:42', NULL, 'RGimSRdS', '', '1', '0', '0', 'normal', 0, '2021-09-01 09:48:21', '2021-09-01 09:48:21'),
(293, NULL, NULL, '+374', '1', NULL, NULL, 'photo6130be4dd0385-ProductImage_8YgnR.jpg', 'vivek nigam', 'Vivek', 'Nigam', '$2y$10$UpY4i/sEaEI/8ACNx8U1gu8Ukvgx2n2Nl1lD2EPnm.oUcm5ZMInzK', NULL, 'abc@gmail.com', 99, NULL, NULL, '7837459511', NULL, NULL, NULL, NULL, 'INDIA', '2021-09-18 19:58:42', NULL, '1Kk4Moa1', '', '1', '0', '0', 'normal', 0, '2021-09-01 11:28:00', '2021-09-01 11:28:00'),
(296, NULL, NULL, '+91', '1', NULL, NULL, 'file6130fa4dc663c-User_Profile_XuTrY.jpg', NULL, 'dhd', 'djdjd', '$2y$10$7i8DsETRNmMz07JYIhV1AuyL9BN8REl.PToLN7uxbQhG2QoOFWxi.', NULL, 'djd@g.com', 99, NULL, NULL, '9023766630', NULL, NULL, NULL, NULL, 'INDIA', '2021-09-18 19:58:42', NULL, '8q0j6coq', '', '1', '0', '0', 'normal', 0, '2021-09-02 16:22:37', '2021-09-02 16:22:37'),
(298, NULL, NULL, '+63', '1', NULL, NULL, 'file61310f8d4ab07-User_Profile_gwZhK.jpg', NULL, 'Kashish', 'gupta', '$2y$10$QkoargDdxfBjrOzmmB6hie9lx6i/ElS98Piy2PZoMJuPNI/757Wai', NULL, 'kashishtheleader@gmail.com', 169, NULL, NULL, '9650936880', NULL, NULL, NULL, NULL, 'PHILIPPINES', '2021-09-18 19:58:42', NULL, 'yoOnbpqw', '', '1', '0', '0', 'normal', 0, '2021-09-02 17:53:17', '2021-09-02 17:53:17'),
(299, NULL, NULL, '+63', '1', NULL, NULL, 'file613115995d230-User_Profile_XzNbk.jpg', NULL, 'Elvira', 'Corpus', '$2y$10$LEVu85LDXKToA5YV6TgrjeYZaQt2ZYZNc/aVhE8rcYXWTnURggBRa', NULL, 'ecorpus1@hotmail.com', 169, NULL, NULL, '9369578679', NULL, NULL, NULL, NULL, 'PHILIPPINES', '2021-09-18 19:58:42', NULL, '6trgyghP', '', '1', '0', '0', 'normal', 0, '2021-09-02 18:19:05', '2021-09-02 18:19:05'),
(301, NULL, NULL, '+91', '1', NULL, NULL, 'file6131dc5b4e269-3wheeler.jpg', NULL, 'up', 'senior', '$2y$10$LACDUlWI1CXSItICu8Yvo.fhWu2C2zetIV/qCa8dTzONoyqHra2ha', NULL, 'upnormal@gmail.com', 1, NULL, NULL, '7905848388', NULL, NULL, NULL, NULL, 'area', '2021-09-18 19:58:42', NULL, 'XLmwMlOv', '', '1', '0', '0', 'normal', 0, '2021-09-03 08:27:07', '2021-09-03 08:27:07'),
(303, NULL, NULL, '+91', '1', NULL, NULL, 'photo6147081b71b52-ProductImage_ogxuo.jpg', 'vivek nigam k', 'Vivek', 'Nigam', '$2y$10$.cvkjOgGj2zt90/b3tJbYeKOZmT.WpsIFZSTWGZ9ZbKMtJNXoTMrW', NULL, 'abcd@gmail.com', 99, NULL, NULL, '7837459544', NULL, NULL, NULL, NULL, 'PHILIPPINES', '2021-09-19 09:51:23', NULL, 'C17zMntg', '', '1', NULL, 'www.facebook.com', 'normal', 0, '2021-09-04 04:30:39', '2021-09-04 04:30:39'),
(304, NULL, NULL, '+63', '1', NULL, NULL, 'photo6146922d2dbd8-ProductImage_ndcwG.jpg', 'Robert Martinez', 'Robert', 'Martinez', '$2y$10$XBzuE0t2nFSdy8ueF8IAUOsd1yamwj/3HlSX.UBasbwvCOJH7A9pe', NULL, 'rmartinez@live.com.ph', 169, NULL, NULL, '9159851768', NULL, NULL, NULL, NULL, 'PHILIPPINES', '2021-09-19 01:28:13', NULL, 'NsIKPPok', '', '1', '0', '0', 'normal', 0, '2021-09-04 15:19:46', '2021-09-04 15:19:46'),
(305, NULL, NULL, '+63', '1', NULL, NULL, 'file6135705d76c44-User_Profile_b3zLU.jpg', NULL, 'ezekiel', 'jacinto', '$2y$10$FDcweViY5k9Oo1HMWmMTk.57j5PO8tipWujkgOqRoABEQDbhdlJ/C', NULL, 'ezekieljacintowww@gmail.com', 169, NULL, NULL, '9158291795', NULL, NULL, NULL, NULL, 'PHILIPPINES', '2021-09-18 19:58:42', NULL, 'l7FKMYJn', '', '1', '0', '0', 'normal', 0, '2021-09-06 01:35:25', '2021-09-06 01:35:25'),
(313, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, 'pankjaj', 'senior', '$2y$10$G7LA4dPUUFa2xYZgXODJoOn/6MdGlXD42OND91nqwl8J2DEVtmfO6', NULL, 'pankaj@gmail.com', NULL, NULL, NULL, '9627204181', NULL, NULL, NULL, NULL, 'area', '2021-09-18 19:58:42', NULL, 'D8iPcovr', '', '1', '0', '0', 'normal', 0, '2021-09-08 20:54:05', '2021-09-08 20:54:05'),
(314, 'newfacebookid', NULL, '+91', '1', NULL, NULL, NULL, NULL, 'up', 'senior', '$2y$10$OE7/JVZmLr9qeWZ0Pb4IdOg1hdlGl4a5kR28WR0N9d.uC.jXaMjfe', NULL, 'upendraleaderfb@gmail.com', 1, NULL, NULL, '7905848300', NULL, NULL, NULL, NULL, 'area', '2021-09-18 19:58:42', NULL, 'wxyYSiCL', '', '1', '0', '0', 'facebook', 0, '2021-09-10 07:24:29', '2021-09-10 07:24:29'),
(315, NULL, NULL, '+91', '1', NULL, NULL, 'file613b231167f96-User_Profile_NAZqb.jpg', NULL, 'Akash', 'Sharma', '$2y$10$RasO14KLTWZmPINBeSldZucg7HhGjPfW8ZvGWurptruOvtzvrodqi', NULL, 'akashsharma@arknewtech.com', 99, NULL, NULL, '9532152054', NULL, NULL, NULL, NULL, 'INDIA', '2021-09-18 19:58:42', NULL, 'klGTtmaK', '', '1', '0', '0', 'normal', 0, '2021-09-10 09:19:13', '2021-09-10 09:19:13'),
(316, NULL, NULL, '+91', '1', NULL, NULL, 'photo613b41dce2df4-ProductImage_5HxKt.jpg', 'Akash Sharma', 'Akash', 'Sharma', '$2y$10$hlmiXtAIiB2076ZUAGa0Oe03G0MDJEpLmPAEZeqHNNbcxDAaDs90C', NULL, 'as6017651@gmail.com', 99, NULL, NULL, '8882341937', NULL, NULL, NULL, NULL, 'INDIA', '2021-09-18 19:58:42', NULL, 'WuAoOfsv', '', '1', 'https://families.google.com/familylink/', 'https://www.google.com/search?q=fb+login&oq=fb&aqs=chrome.1.69i57j35i39j69i60j5j5i44i273.1392j0j7&client=ms-android-oppo&sourceid=chrome-mobile&ie=UTF-8', 'normal', 0, '2021-09-10 09:33:25', '2021-09-10 09:33:25'),
(317, '110593451333702', NULL, NULL, '1', NULL, NULL, NULL, NULL, 'Taster', 'Arknewtech', '$2y$10$L1B6Qm9RuO37WPMVm4FGAO48gCwXpJIwRqBKdHTB4PfsCnebRDrXy', NULL, 'testerarknewtech@gmail.com', 169, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2021-09-18 19:58:42', NULL, 'sOkSyewc', '', '1', '0', '0', 'facebook', 0, '2021-09-10 16:52:10', '2021-09-10 16:52:10'),
(318, '169782481957418', NULL, NULL, '1', NULL, NULL, NULL, NULL, 'Akash', 'Sharma', '$2y$10$eEcLlSx3sePT522PN5cLoOSAboXMffp/MRIxBSktXNnyOtrOV8xMi', NULL, 'akashvlog00@gmail.com', 169, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2021-09-18 19:58:42', NULL, '26PoFZGM', '', '1', '0', '0', 'facebook', 0, '2021-09-11 05:09:50', '2021-09-11 05:09:50'),
(319, '2154366668035620', NULL, NULL, '1', NULL, NULL, NULL, NULL, 'Shivendra', 'Singh', '$2y$10$UfbcFvkj6baj7TJjtFKO/.iwDO8JrUgBR2tp4MEdPdGtSSCFbvrOC', NULL, 'shivendra2396@gmail.com', 169, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2021-09-18 19:58:42', NULL, 'kIfh0xYA', '', '1', '0', '0', 'facebook', 0, '2021-09-11 13:01:55', '2021-09-11 13:01:55'),
(320, NULL, '110024403907917990583', NULL, '1', NULL, NULL, NULL, NULL, '', '', '$2y$10$Z1bk2aZXUk1jjb0ug4zwfuHeV3KItkDAcrhawo5KBxVaMQGL.GtHe', NULL, 'radha@thehorizonnews.com', 169, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2021-09-18 19:58:42', NULL, 'gDQoGp20', '', '1', '0', '0', 'google', 0, '2021-09-12 14:36:11', '2021-09-12 14:36:11'),
(321, NULL, '110742697844412353777', NULL, '1', NULL, NULL, NULL, NULL, '', '', '$2y$10$1/MIdYqT8sxYkaT0LQT5SeskR/l4OEsZi0e3BlTs2PXmBnXurPw92', NULL, 'royalshiv156@gmail.com', 169, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2021-09-18 19:58:42', NULL, 'KghBQJfW', '', '1', '0', '0', 'google', 0, '2021-09-12 14:36:53', '2021-09-12 14:36:53'),
(322, NULL, '115625763899162609778', NULL, '1', NULL, NULL, NULL, NULL, '', '', '$2y$10$bkTyl42sFzpTbDAajZXpb.nj2fQbW9xxvHzIyupkqk8QPopua7pb2', NULL, 'testerarknewtech001@gmail.com', 169, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2021-09-18 19:58:42', NULL, '1GieW9qE', '', '1', '0', '0', 'google', 0, '2021-09-13 05:45:37', '2021-09-13 05:45:37'),
(323, NULL, '105516464891398873388', NULL, '1', NULL, NULL, NULL, NULL, '', '', '$2y$10$3wBzH.Zx7EUFLDvHcsG37OvNxSJDyU1Ug94ww2.FqZQnNjqWBje4K', NULL, 'sprakesh093@gmail.com', 169, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2021-09-18 19:58:42', NULL, '2lA6F72I', '', '1', '0', '0', 'google', 0, '2021-09-15 14:15:16', '2021-09-15 14:15:16'),
(324, NULL, '102981407137635125743', '+91', '1', NULL, NULL, 'photo61420a4536c6f-ProductImage_AZwuw.jpg', 'Manish Kumar Pathak', 'Manish', '', '$2y$10$Yx5/CGtcaQuQBBo2Vzk46.F2qpxqEJ3WXUvbV8rpmx3oYPR0udz.i', NULL, 'viveklpu2011@gmail.com', 169, NULL, NULL, '9023766560', NULL, NULL, NULL, NULL, NULL, '2021-09-18 19:58:42', NULL, 'RLWl7oAq', '', '1', '0', '0', 'google', 0, '2021-09-15 14:43:42', '2021-09-15 14:43:42'),
(325, NULL, NULL, '+91', '1', NULL, NULL, 'photo6145f399420ed-ProductImage_XcJPb.jpg', 'Amit', 'Amit', 'Sharan', '$2y$10$EnemYsYaw8IwOPCaZ7Ag5ObnpKR8S2vfQW39RMWqjoZqsbQUK.dDK', NULL, 'amitsharan2017@gmail.com', 171, NULL, NULL, '7979948924', NULL, NULL, NULL, NULL, 'PHILIPPINES', '2021-09-18 19:58:42', NULL, 'yTZLs6Bj', '', '1', '0', '0', 'normal', 0, '2021-09-15 16:51:53', '2021-09-15 16:51:53'),
(326, '6092044614201377', NULL, 'PH', '1', NULL, NULL, NULL, NULL, 'Amit', 'Sharan', '$2y$10$eQ7K88.X771CWOIn8YNjseM4H5RxVxVLxk6VffN1yf0vIYBVknVNW', NULL, 'amit.sharan2013@gmail.com', 63, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2021-09-18 19:58:42', NULL, 'T9thyeBz', '', '1', '0', '0', 'facebook', 0, '2021-09-16 05:36:14', '2021-09-16 05:36:14'),
(327, NULL, '102050208936850909423', 'PH', '1', NULL, NULL, NULL, NULL, 'Kashish Gupta', '', '$2y$10$tBNUbJjlQzEgUpmuK4dVyeSW7viPWYyG7ymO/9sLW3ZFU6rmH3KeW', NULL, 'kgmoulders@gmail.com', 63, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2021-09-18 19:58:42', NULL, 'ggNFciEq', '', '1', '0', '0', 'google', 0, '2021-09-16 11:59:35', '2021-09-16 11:59:35'),
(328, '4068314913277360', NULL, 'PH', '1', NULL, NULL, NULL, NULL, 'VKvicky', 'Nigam', '$2y$10$aDzZYrpiHBJhdWkdkKW.OumeyRlb2n82JFU.uV3sUbcREbpveWCFu', NULL, 'vnigam82@gmail.com', 63, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2021-09-18 19:58:42', NULL, 'hZ1paBOj', '', '1', '0', '0', 'facebook', 0, '2021-09-17 11:16:56', '2021-09-17 11:16:56'),
(329, '4068314913277360', NULL, 'PH', '1', NULL, NULL, NULL, NULL, 'VKvicky', 'Nigam', '$2y$10$0BQbhwA6HAjHQ/.guyHB8uc4yAtKqJgyC58VDBpLkVs0jHRYVaVke', NULL, 'vnigam82@gmail.com', 63, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2021-09-18 19:58:42', NULL, '9KG1hSVq', '', '1', '0', '0', 'facebook', 0, '2021-09-17 11:16:56', '2021-09-17 11:16:56'),
(330, NULL, NULL, '+91', '1', NULL, NULL, 'file614632c49a9d7-User_Profile_G9bpW.jpg', NULL, 'Akash', 'Sharma', '$2y$10$UyvYQJTNqg6edamonlXdSOk9ktnECFls1LGa8eI9B0qUpCZUcl1oW', NULL, 'tmanav41@gmail.com', 99, NULL, NULL, '7505454870', NULL, NULL, NULL, NULL, 'INDIA', '2021-09-18 19:58:42', NULL, 'IqxmUos8', '', '1', '0', '0', 'normal', 0, '2021-09-18 18:41:08', '2021-09-18 18:41:08'),
(331, NULL, '112990478215675153837', '+63', '1', NULL, NULL, NULL, NULL, 'Robert Martinez', '', '$2y$10$pZeVXmOasJgExWoMcM0Y6.zbuUSRAsL7ExPYgRzrB/ZGL/a0n34nu', NULL, 'robertaristamartinez@gmail.com', 169, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2021-09-19 01:33:11', NULL, 'BwGCNuUS', '', '0', '0', '0', 'google', 0, '2021-09-19 01:33:11', '2021-09-19 01:33:11'),
(332, NULL, '107322746078353438350', '+63', '1', NULL, NULL, NULL, NULL, 'Ezekiel Jacinto', '', '$2y$10$ghMtcrFtDQc40TfilajesewzyHeUF72e0Y1lXocDijfY1cQVLWf7K', NULL, 'jacintowwwezekiel@gmail.com', 169, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2021-09-20 02:40:33', NULL, 'AtFFiPOJ', '', '0', '0', '0', 'google', 0, '2021-09-20 02:40:33', '2021-09-20 02:40:33');

-- --------------------------------------------------------

--
-- Table structure for table `users_otp`
--

CREATE TABLE `users_otp` (
  `id` int(11) NOT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `otp` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `email` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_otp`
--

INSERT INTO `users_otp` (`id`, `country_code`, `phone`, `otp`, `created`, `email`, `created_at`, `updated_at`) VALUES
(48, '+91', '8054251404', 8439, '2021-06-04 12:59:44', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(49, '+91', '8054251404', 5792, '2021-06-04 13:03:26', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(69, '+91', '8054251404', 9209, '2021-06-06 08:24:00', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(72, '+91', '8054251404', 1735, '2021-06-06 12:03:37', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(77, '+91', '8054251404', 4661, '2021-06-06 14:53:39', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(78, '+91', '8054251404', 2470, '2021-06-13 13:24:51', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(96, '+91', '8054251404', 6187, '2021-06-16 08:46:20', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(97, '+91', '8054251404', 3566, '2021-06-16 08:46:30', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(99, '+91', '8054251404', 212, '2021-06-30 01:00:51', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(100, '+91', '8054251404', 3789, '2021-06-30 01:02:12', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(101, '+91', '8054251404', 6814, '2021-06-30 01:23:41', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(102, '+91', '8054251404', 2910, '2021-06-30 01:24:32', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(104, '+91', '8054251404', 6356, '2021-06-30 06:38:43', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(105, '+91', '8054251404', 301, '2021-06-30 06:43:08', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(106, '+91', '8054251404', 4364, '2021-06-30 06:48:53', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(107, '+91', '8054251404', 8715, '2021-07-02 08:18:37', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(113, '+91', '8054251404', 8077, '2021-07-03 17:03:04', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(114, '+91', '8054251404', 9662, '2021-07-03 17:03:13', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(115, '+91', '8054251404', 3222, '2021-07-05 04:38:07', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(121, '+91', '8054251404', 4213, '2021-07-07 08:24:53', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(122, '+91', '8054251404', 1957, '2021-07-07 08:26:04', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(124, '+91', '8054251404', 2311, '2021-07-07 09:15:14', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(125, '+91', '8054251404', 9718, '2021-07-07 09:17:09', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(126, '+91', '8054251404', 9719, '2021-07-07 09:18:21', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(128, '+91', '8054251404', 6151, '2021-07-08 07:17:06', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(129, '+91', '8054251404', 8846, '2021-07-08 07:17:29', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(130, '+91', '8054251404', 88, '2021-07-08 07:18:21', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(131, '+91', '8054251404', 7980, '2021-07-08 07:18:54', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(132, '+91', '8054251404', 5533, '2021-07-08 07:19:25', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(133, '+91', '8054251404', 8837, '2021-07-08 07:20:34', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(135, '+91', '8054251404', 45, '2021-07-08 07:43:28', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(187, '+91', '8054251404', 3402, '2021-07-26 07:55:12', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(188, '+91', '8054251404', 451, '2021-07-26 07:55:40', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(193, '+91', '8054251404', 5999, '2021-07-29 04:10:27', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(199, '+91', '8054251404', 7345, '2021-08-01 23:55:00', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(201, '+91', '8054251404', 4662, '2021-08-11 13:42:15', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(202, '+91', '8054251404', 8875, '2021-08-12 07:24:20', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(203, '+91', '8054251404', 4571, '2021-08-12 09:23:00', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(210, '+91', '8054251404', 8129, '2021-08-12 10:48:22', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(211, '+91', '8054251404', 2178, '2021-08-12 10:49:15', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(212, '+91', '8054251404', 201, '2021-08-12 11:32:01', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(213, '+91', '8054251404', 958, '2021-08-12 11:35:28', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(218, '+91', '8054251404', 9341, '2021-08-14 15:59:30', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(219, '+91', '8054251404', 4471, '2021-08-14 16:06:06', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(220, '+91', '8054251404', 277, '2021-08-14 16:06:28', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(221, '+91', '8054251404', 5605, '2021-08-14 16:07:08', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(245, '+91', '8054251404', 5013, '2021-08-15 17:00:47', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(250, '+91', '8054251404', 4145, '2021-08-17 17:11:26', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(251, '+91', '8054251404', 8011, '2021-08-17 17:12:14', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(252, '+91', '8054251404', 9031, '2021-08-17 17:23:15', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(253, '+91', '8054251404', 7089, '2021-08-17 17:23:56', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(254, '+91', '8054251404', 1374, '2021-08-17 17:24:08', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(255, '+91', '8054251404', 9332, '2021-08-17 17:26:07', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(256, '+91', '8054251404', 8695, '2021-08-18 16:58:20', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(261, '+91', '8054251404', 7633, '2021-08-18 19:17:41', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(262, '+91', '8054251404', 7494, '2021-08-18 19:18:07', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(263, '+91', '8054251404', 450, '2021-08-18 19:20:52', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(264, '+91', '8054251404', 1653, '2021-08-18 19:27:03', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(271, '+91', '8054251404', 694, '2021-08-18 20:04:36', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(272, '+91', '8054251404', 1333, '2021-08-18 20:05:02', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(273, '+91', '8054251404', 3491, '2021-08-18 20:05:22', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(274, '+91', '8054251404', 4323, '2021-08-18 20:06:05', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(275, '+91', '8054251404', 6860, '2021-08-18 20:06:51', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(276, '+91', '8054251404', 1124, '2021-08-18 20:07:03', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(277, '+91', '8054251404', 1490, '2021-08-18 20:08:01', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(278, '+91', '8054251404', 7929, '2021-08-18 20:08:17', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(279, '+91', '8054251404', 9618, '2021-08-18 20:09:47', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(292, '+91', '8054251404', 5932, '2021-08-19 10:49:29', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(293, '+91', '8054251404', 4397, '2021-08-19 10:51:51', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(294, '+91', '8054251404', 3298, '2021-08-19 10:52:50', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(301, '+91', '8054251404', 7210, '2021-08-19 15:59:37', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(302, '+91', '8054251404', 1745, '2021-08-19 15:59:54', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(303, '+91', '8054251404', 7002, '2021-08-19 16:01:02', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(305, '+91', '8054251404', 9892, '2021-08-19 16:05:24', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(306, '+91', '8054251404', 4842, '2021-08-19 16:14:21', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(310, '+91', '8054251404', 4250, '2021-08-19 16:34:18', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(311, '+91', '8054251404', 1638, '2021-08-19 16:36:26', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(316, '+91', '8054251404', 2879, '2021-08-19 16:49:27', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(331, '+91', '8054251404', 8233, '2021-08-19 17:34:18', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(332, '+91', '8054251404', 319, '2021-08-19 17:36:21', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(342, '+91', '8054251404', 9739, '2021-08-19 18:44:15', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(343, '+91', '8054251404', 8505, '2021-08-19 18:46:10', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(349, '+91', '8054251404', 8534, '2021-08-19 19:21:59', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(377, '+91', '8054251404', 4766, '2021-08-21 08:50:43', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(382, '+91', '8054251404', 836, '2021-08-21 12:42:00', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(383, '+91', '8054251404', 1060, '2021-08-21 12:42:42', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(385, '+91', '8054251404', 4257, '2021-08-21 21:28:56', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(392, '+91', '8054251404', 4704, '2021-08-22 06:06:43', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(393, '+91', '8054251404', 7618, '2021-08-22 06:06:56', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(395, '+91', '8054251404', 2135, '2021-08-22 06:11:53', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(396, '+91', '8054251404', 7511, '2021-08-22 06:21:54', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(415, '+91', '8054251404', 9789, '2021-08-22 11:02:00', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(416, '+91', '8054251404', 9204, '2021-08-22 11:02:21', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(418, '+91', '8054251404', 5003, '2021-08-22 11:03:14', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(419, '+91', '8054251404', 5874, '2021-08-22 11:04:39', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(420, '+91', '8054251404', 1858, '2021-08-22 11:05:02', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(422, '+91', '8054251404', 1061, '2021-08-22 11:16:07', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(427, '+91', '8054251404', 9456, '2021-08-23 06:12:02', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(442, '+91', '8054251404', 2570, '2021-08-23 19:47:29', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(443, '+91', '8054251404', 8112, '2021-08-23 19:59:33', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(444, '+91', '8054251404', 7047, '2021-08-23 20:18:44', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(455, '+91', '8054251404', 4592, '2021-08-23 21:50:57', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(456, '+91', '8054251404', 7445, '2021-08-23 21:51:18', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(460, '+91', '8054251404', 2657, '2021-08-24 00:15:23', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(464, '+91', '8054251404', 9036, '2021-08-24 00:57:42', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(465, '+91', '8054251404', 2158, '2021-08-24 00:57:42', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(467, '+91', '8054251404', 5885, '2021-08-24 01:09:52', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(475, '+91', '8054251404', 652, '2021-08-24 09:08:23', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(478, '+91', '8054251404', 3253, '2021-08-24 15:42:49', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(487, '+91', '8054251404', 7678, '2021-08-24 17:40:39', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(488, '+91', '8054251404', 7329, '2021-08-24 18:18:36', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(490, '+91', '8054251404', 9960, '2021-08-24 18:30:08', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(491, '+91', '8054251404', 4965, '2021-08-25 04:54:44', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(492, '+91', '8054251404', 843, '2021-08-25 04:55:01', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(493, '+91', '8054251404', 1443, '2021-08-25 04:55:32', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(503, '+91', '8054251404', 6944, '2021-08-25 16:42:33', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(504, '+91', '8054251404', 3637, '2021-08-25 16:44:29', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(505, '+91', '8054251404', 2777, '2021-08-25 20:12:33', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(507, '+91', '8054251404', 6324, '2021-08-26 03:53:51', '8054251404', '2021-08-30 05:30:18', '2021-08-30 05:30:18'),
(530, '+91', '8054251404', 6226, '2021-08-30 06:05:57', '8054251404', '2021-08-30 06:05:57', '2021-08-30 06:05:57'),
(531, '+91', '8054251404', 4537, '2021-08-30 06:07:37', '8054251404', '2021-08-30 06:07:37', '2021-08-30 06:07:37'),
(532, '+91', '8054251404', 3232, '2021-08-30 06:07:45', '8054251404', '2021-08-30 06:07:45', '2021-08-30 06:07:45'),
(533, '+91', '8054251404', 336, '2021-08-30 06:12:45', '8054251404', '2021-08-30 06:12:45', '2021-08-30 06:12:45'),
(535, '+91', '8054251404', 4155, '2021-08-30 06:20:07', '8054251404', '2021-08-30 06:20:07', '2021-08-30 06:20:07'),
(544, '+91', '8054251404', 2817, '2021-08-30 08:04:24', '8054251404', '2021-08-30 08:04:24', '2021-08-30 08:04:24'),
(551, '+91', '8054251404', 2087, '2021-08-30 08:16:43', '8054251404', '2021-08-30 08:16:43', '2021-08-30 08:16:43'),
(552, '+91', '8054251404', 7976, '2021-08-30 09:01:52', '8054251404', '2021-08-30 09:01:52', '2021-08-30 09:01:52'),
(554, '+91', '8054251404', 8646, '2021-08-30 09:06:48', '8054251404', '2021-08-30 09:06:48', '2021-08-30 09:06:48'),
(555, '+91', '8054251404', 6145, '2021-08-30 09:07:33', '8054251404', '2021-08-30 09:07:33', '2021-08-30 09:07:33'),
(560, '+91', '8054251404', 2807, '2021-08-30 09:20:08', '8054251404', '2021-08-30 09:20:08', '2021-08-30 09:20:08'),
(561, '+91', '8054251404', 1853, '2021-08-30 09:32:27', '8054251404', '2021-08-30 09:32:27', '2021-08-30 09:32:27'),
(562, '+91', '8054251404', 4557, '2021-08-30 09:39:17', '8054251404', '2021-08-30 09:39:17', '2021-08-30 09:39:17'),
(564, '+91', '8054251404', 3856, '2021-08-30 09:44:21', '8054251404', '2021-08-30 09:44:21', '2021-08-30 09:44:21'),
(565, '+91', '8054251404', 4339, '2021-08-30 09:46:17', '8054251404', '2021-08-30 09:46:17', '2021-08-30 09:46:17'),
(575, '+91', '8054251404', 9845, '2021-08-30 10:28:13', '8054251404', '2021-08-30 10:28:13', '2021-08-30 10:28:13'),
(580, '+91', '8054251404', 8539, '2021-08-30 10:54:55', '8054251404', '2021-08-30 10:54:55', '2021-08-30 10:54:55'),
(581, '+91', '8054251404', 4850, '2021-08-30 10:56:16', '8054251404', '2021-08-30 10:56:16', '2021-08-30 10:56:16'),
(582, '+91', '8054251404', 4684, '2021-08-30 10:58:45', '8054251404', '2021-08-30 10:58:45', '2021-08-30 10:58:45'),
(589, '+91', '8054251404', 482, '2021-08-30 11:45:18', '8054251404', '2021-08-30 11:45:18', '2021-08-30 11:45:18'),
(592, '+91', '8054251404', 105, '2021-08-30 13:57:45', '8054251404', '2021-08-30 13:57:45', '2021-08-30 13:57:45'),
(593, '+91', '8054251404', 1562, '2021-08-30 13:58:02', '8054251404', '2021-08-30 13:58:02', '2021-08-30 13:58:02'),
(599, '+91', '8054251404', 8046, '2021-08-30 17:20:26', '8054251404', '2021-08-30 17:20:26', '2021-08-30 17:20:26'),
(601, '+91', '8054251404', 3010, '2021-08-30 17:26:46', '8054251404', '2021-08-30 17:26:46', '2021-08-30 17:26:46'),
(622, '+91', '8054251404', 8404, '2021-09-01 06:44:15', '8054251404', '2021-09-01 06:44:15', '2021-09-01 06:44:15'),
(623, '+91', '8054251404', 5378, '2021-09-01 06:53:33', '8054251404', '2021-09-01 06:53:33', '2021-09-01 06:53:33'),
(624, '+91', '8054251404', 503, '2021-09-01 06:56:32', '8054251404', '2021-09-01 06:56:32', '2021-09-01 06:56:32'),
(635, '+91', '8054251404', 312, '2021-09-02 10:46:20', '8054251404', '2021-09-02 10:46:20', '2021-09-02 10:46:20'),
(636, '+91', '8054251404', 7581, '2021-09-02 10:47:36', '8054251404', '2021-09-02 10:47:36', '2021-09-02 10:47:36'),
(639, '+91', '8054251404', 8548, '2021-09-02 12:56:45', '8054251404', '2021-09-02 12:56:45', '2021-09-02 12:56:45'),
(640, '+91', '8054251404', 3739, '2021-09-02 13:00:21', '8054251404', '2021-09-02 13:00:21', '2021-09-02 13:00:21'),
(656, '+91', '8054251404', 7226, '2021-09-02 16:07:20', '8054251404', '2021-09-02 16:07:20', '2021-09-02 16:07:20'),
(657, '+91', '8054251404', 8845, '2021-09-02 16:07:41', '8054251404', '2021-09-02 16:07:41', '2021-09-02 16:07:41'),
(658, '+91', '8054251404', 1005, '2021-09-02 16:07:57', '8054251404', '2021-09-02 16:07:57', '2021-09-02 16:07:57'),
(659, '+91', '8054251404', 3694, '2021-09-02 16:08:19', '8054251404', '2021-09-02 16:08:19', '2021-09-02 16:08:19'),
(669, '+91', '8054251404', 6412, '2021-09-03 08:24:46', '8054251404', '2021-09-03 08:24:46', '2021-09-03 08:24:46'),
(690, '+91', '8054251404', 1345, '2021-09-04 06:58:16', '8054251404', '2021-09-04 06:58:16', '2021-09-04 06:58:16'),
(692, '+91', '8054251404', 4928, '2021-09-04 14:21:15', '8054251404', '2021-09-04 14:21:15', '2021-09-04 14:21:15'),
(705, '+91', '8054251404', 5089, '2021-09-06 06:40:24', '8054251404', '2021-09-06 06:40:24', '2021-09-06 06:40:24'),
(706, '+91', '8054251404', 575, '2021-09-06 06:40:34', '8054251404', '2021-09-06 06:40:34', '2021-09-06 06:40:34'),
(707, '+91', '8054251404', 1778, '2021-09-06 06:40:52', '8054251404', '2021-09-06 06:40:52', '2021-09-06 06:40:52'),
(708, '+91', '8054251404', 4508, '2021-09-06 06:41:01', '8054251404', '2021-09-06 06:41:01', '2021-09-06 06:41:01'),
(712, '+91', '8054251404', 3831, '2021-09-06 06:47:44', '8054251404', '2021-09-06 06:47:44', '2021-09-06 06:47:44'),
(713, '+91', '8054251404', 0, '2021-09-06 06:47:52', '8054251404', '2021-09-06 06:47:52', '2021-09-06 06:47:52'),
(714, '+91', '8054251404', 8302, '2021-09-06 06:48:18', '8054251404', '2021-09-06 06:48:18', '2021-09-06 06:48:18'),
(715, '+91', '8054251404', 4760, '2021-09-06 06:48:27', '8054251404', '2021-09-06 06:48:27', '2021-09-06 06:48:27'),
(716, '+91', '8054251404', 8552, '2021-09-06 06:56:51', '8054251404', '2021-09-06 06:56:51', '2021-09-06 06:56:51'),
(717, '+91', '8054251404', 9050, '2021-09-06 06:57:17', '8054251404', '2021-09-06 06:57:17', '2021-09-06 06:57:17'),
(718, '+91', '8054251404', 7920, '2021-09-06 06:57:51', '8054251404', '2021-09-06 06:57:51', '2021-09-06 06:57:51'),
(719, '+91', '8054251404', 2262, '2021-09-06 06:58:19', '8054251404', '2021-09-06 06:58:19', '2021-09-06 06:58:19'),
(722, '+91', '8054251404', 1841, '2021-09-06 07:03:50', '8054251404', '2021-09-06 07:03:50', '2021-09-06 07:03:50'),
(723, '+91', '8054251404', 7046, '2021-09-06 07:03:53', '8054251404', '2021-09-06 07:03:53', '2021-09-06 07:03:53'),
(724, '+91', '8054251404', 2006, '2021-09-06 07:06:46', '8054251404', '2021-09-06 07:06:46', '2021-09-06 07:06:46'),
(726, '+91', '8054251404', 317, '2021-09-06 15:35:02', '8054251404', '2021-09-06 15:35:02', '2021-09-06 15:35:02'),
(727, '+91', '8054251404', 8270, '2021-09-06 15:35:54', '8054251404', '2021-09-06 15:35:54', '2021-09-06 15:35:54'),
(728, '+91', '8054251404', 2598, '2021-09-06 15:38:44', '8054251404', '2021-09-06 15:38:44', '2021-09-06 15:38:44'),
(729, '+91', '8054251404', 4771, '2021-09-06 15:40:28', '8054251404', '2021-09-06 15:40:28', '2021-09-06 15:40:28'),
(731, '+91', '8054251404', 9040, '2021-09-07 16:14:29', '8054251404', '2021-09-07 16:14:29', '2021-09-07 16:14:29'),
(732, '+91', '8054251404', 3946, '2021-09-07 16:19:26', '8054251404', '2021-09-07 16:19:26', '2021-09-07 16:19:26'),
(733, '+91', '8054251404', 4319, '2021-09-07 16:38:17', '8054251404', '2021-09-07 16:38:17', '2021-09-07 16:38:17'),
(734, '+91', '8054251404', 2953, '2021-09-07 16:38:42', '8054251404', '2021-09-07 16:38:42', '2021-09-07 16:38:42'),
(735, '+91', '8054251404', 2098, '2021-09-07 16:39:17', '8054251404', '2021-09-07 16:39:17', '2021-09-07 16:39:17'),
(736, '+91', '8054251404', 8681, '2021-09-07 16:40:37', '8054251404', '2021-09-07 16:40:37', '2021-09-07 16:40:37'),
(737, '+91', '8054251404', 357, '2021-09-07 16:40:54', '8054251404', '2021-09-07 16:40:54', '2021-09-07 16:40:54'),
(738, '+91', '8054251404', 9236, '2021-09-07 16:41:46', '8054251404', '2021-09-07 16:41:46', '2021-09-07 16:41:46'),
(739, '+91', '8054251404', 8031, '2021-09-07 16:42:45', '8054251404', '2021-09-07 16:42:45', '2021-09-07 16:42:45'),
(740, '+91', '8054251404', 8303, '2021-09-07 16:43:26', '8054251404', '2021-09-07 16:43:26', '2021-09-07 16:43:26'),
(741, '+91', '8054251404', 2145, '2021-09-07 17:07:18', '8054251404', '2021-09-07 17:07:18', '2021-09-07 17:07:18'),
(745, '+91', '8054251404', 3401, '2021-09-07 19:09:51', '8054251404', '2021-09-07 19:09:51', '2021-09-07 19:09:51'),
(746, '+91', '8054251404', 4145, '2021-09-07 19:10:06', '8054251404', '2021-09-07 19:10:06', '2021-09-07 19:10:06'),
(747, '+91', '8054251404', 3640, '2021-09-07 19:11:40', '8054251404', '2021-09-07 19:11:40', '2021-09-07 19:11:40'),
(751, '+91', '8054251404', 5951, '2021-09-08 06:03:54', '8054251404', '2021-09-08 06:03:54', '2021-09-08 06:03:54'),
(755, '+91', '8054251404', 9774, '2021-09-08 06:12:14', '8054251404', '2021-09-08 06:12:14', '2021-09-08 06:12:14'),
(761, NULL, NULL, 3164, '2021-09-08 10:28:22', 'viveklpu2011@gmail.com', '2021-09-08 10:28:22', '2021-09-08 10:28:22'),
(762, NULL, NULL, 3105, '2021-09-08 10:29:06', 'viveklpu2011@gmail.com', '2021-09-08 10:29:06', '2021-09-08 10:29:06'),
(764, '+63', '1234567898', 9318, '2021-09-08 10:43:31', NULL, '2021-09-08 10:43:31', '2021-09-08 10:43:31'),
(765, '+63', '1234567898', 1194, '2021-09-08 10:44:01', NULL, '2021-09-08 10:44:01', '2021-09-08 10:44:01'),
(766, '+63', '1234567898', 2819, '2021-09-08 10:48:25', NULL, '2021-09-08 10:48:25', '2021-09-08 10:48:25'),
(767, '+63', '1234567898', 2845, '2021-09-08 10:48:38', NULL, '2021-09-08 10:48:38', '2021-09-08 10:48:38'),
(768, '+63', '1234567898', 6319, '2021-09-08 10:50:34', NULL, '2021-09-08 10:50:34', '2021-09-08 10:50:34'),
(769, '+63', '1234567898', 6987, '2021-09-08 10:53:24', NULL, '2021-09-08 10:53:24', '2021-09-08 10:53:24'),
(770, '+63', '1234567898', 9843, '2021-09-08 10:54:19', NULL, '2021-09-08 10:54:19', '2021-09-08 10:54:19'),
(771, '+63', '1234567898', 939, '2021-09-08 10:54:39', NULL, '2021-09-08 10:54:39', '2021-09-08 10:54:39'),
(772, '+63', '1234567898', 4018, '2021-09-08 10:54:43', NULL, '2021-09-08 10:54:43', '2021-09-08 10:54:43'),
(773, '+63', '1234567898', 2889, '2021-09-08 10:54:53', NULL, '2021-09-08 10:54:53', '2021-09-08 10:54:53'),
(774, '+63', '1234567898', 4056, '2021-09-08 10:55:11', NULL, '2021-09-08 10:55:11', '2021-09-08 10:55:11'),
(776, '+63', '1234567898', 5224, '2021-09-08 10:56:26', NULL, '2021-09-08 10:56:26', '2021-09-08 10:56:26'),
(777, '+63', '1234567898', 5715, '2021-09-08 10:57:38', NULL, '2021-09-08 10:57:38', '2021-09-08 10:57:38'),
(779, '+63', '1234567898', 1276, '2021-09-08 11:02:27', NULL, '2021-09-08 11:02:27', '2021-09-08 11:02:27'),
(781, '+63', '1234567898', 2931, '2021-09-08 11:05:40', NULL, '2021-09-08 11:05:40', '2021-09-08 11:05:40'),
(784, '+91', '8054251404', 1891, '2021-09-08 17:07:59', '8054251404', '2021-09-08 17:07:59', '2021-09-08 17:07:59'),
(795, '+91', '8054251404', 6473, '2021-09-08 17:45:05', '8054251404', '2021-09-08 17:45:05', '2021-09-08 17:45:05'),
(800, '+91', '8054251404', 8548, '2021-09-08 17:52:02', '8054251404', '2021-09-08 17:52:02', '2021-09-08 17:52:02'),
(802, '+91', '8054251404', 4928, '2021-09-08 17:56:11', '8054251404', '2021-09-08 17:56:11', '2021-09-08 17:56:11'),
(803, '+91', '8054251404', 1701, '2021-09-08 18:08:40', '8054251404', '2021-09-08 18:08:40', '2021-09-08 18:08:40'),
(814, '+92', '8054251404', 9876, '2021-09-08 20:47:48', '8054251404', '2021-09-08 20:47:48', '2021-09-08 20:47:48'),
(815, '+92', '8054251404', 9876, '2021-09-08 20:50:11', '8054251404', '2021-09-08 20:50:11', '2021-09-08 20:50:11'),
(826, '+91', '8427990565', 9183, '2021-09-08 21:28:51', '8427990565', '2021-09-08 21:28:51', '2021-09-08 21:28:51'),
(864, NULL, NULL, 9577, '2021-09-10 08:53:09', '79799 48924', '2021-09-10 08:53:09', '2021-09-10 08:53:09'),
(866, '+91', '8427990565', 4975, '2021-09-10 09:03:51', NULL, '2021-09-10 09:03:51', '2021-09-10 09:03:51'),
(867, '+91', '7307177490', 4210, '2021-09-10 09:04:12', NULL, '2021-09-10 09:04:12', '2021-09-10 09:04:12'),
(870, '+91', '9532152051', 459, '2021-09-10 09:27:44', NULL, '2021-09-10 09:27:44', '2021-09-10 09:27:44'),
(871, '+91', '9532152051', 7187, '2021-09-10 09:28:19', NULL, '2021-09-10 09:28:19', '2021-09-10 09:28:19'),
(875, NULL, NULL, 8013, '2021-09-10 10:25:07', 'akashsharma@arknewtech.com', '2021-09-10 10:25:07', '2021-09-10 10:25:07'),
(876, '+91', '9532152051', 3297, '2021-09-10 10:31:12', NULL, '2021-09-10 10:31:12', '2021-09-10 10:31:12'),
(878, NULL, NULL, 3536, '2021-09-10 10:32:54', 'as6017651@gmail.com', '2021-09-10 10:32:54', '2021-09-10 10:32:54'),
(879, NULL, NULL, 2844, '2021-09-10 10:35:26', 'as6017651@gmail.com', '2021-09-10 10:35:26', '2021-09-10 10:35:26'),
(891, NULL, '8054251404', 7116, '2021-09-14 17:53:12', NULL, '2021-09-14 17:53:12', '2021-09-14 17:53:12'),
(892, '+91', '7678160324', 8074, '2021-09-15 07:59:46', '7678160324', '2021-09-15 07:59:46', '2021-09-15 07:59:46'),
(894, '+91', '7678160324', 8888, '2021-09-15 08:07:44', '7678160324', '2021-09-15 08:07:44', '2021-09-15 08:07:44'),
(906, '+91', '7999532145', 4852, '2021-09-20 14:57:13', '7999532145', '2021-09-20 14:57:13', '2021-09-20 14:57:13'),
(909, '+91', '8054251404', 9876, '2021-09-21 08:10:33', '8054251404', '2021-09-21 08:10:33', '2021-09-21 08:10:33'),
(910, '+91', '8054251404', 9876, '2021-09-21 08:10:48', '8054251404', '2021-09-21 08:10:48', '2021-09-21 08:10:48');

-- --------------------------------------------------------

--
-- Table structure for table `user_card`
--

CREATE TABLE `user_card` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `expirydate` text DEFAULT NULL,
  `securitycode` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_card`
--

INSERT INTO `user_card` (`id`, `name`, `number`, `expirydate`, `securitycode`, `user_id`, `created_at`, `updated_at`) VALUES
(6, 'Vivek', '7696-9696-9769-6966', '98/6969', '675', 149, '2021-08-04 11:13:06', '2021-08-04 11:13:06'),
(7, 'Vk nigam', '4869-6998-6966-9996', '77/7878', '544', 149, '2021-08-04 11:23:26', '2021-08-04 11:23:26'),
(16, 'shiv', '8676-4545-7645-3557', '09/2098', '123', 179, '2021-08-17 17:21:21', '2021-08-17 17:21:21'),
(18, 'Akash', '6521-6014-9154-8238', '11/23', '842', 281, '2021-08-31 11:06:23', '2021-08-31 11:06:23'),
(21, 'test', '123456789087654', '2021-10-21', '123', 141, '2021-09-06 16:00:29', '2021-09-06 16:00:29'),
(23, 'Vivek nigam v', '4111-1111-1111-1112', '12/2222', '123', 303, '2021-09-09 07:27:41', '2021-09-09 07:27:41'),
(25, 'Consumer', '5577-0000-5577-0004', '03/2030', '737', 304, '2021-09-15 18:04:17', '2021-09-15 18:04:17'),
(26, 'Consumer', '5577-0000-5577-0004', '03/2030', '737', 304, '2021-09-15 18:04:21', '2021-09-15 18:04:21'),
(38, 'hsjs', '4546-9464-6649-4649', '46/4646', '454', 303, '2021-09-18 17:28:04', '2021-09-18 17:28:04'),
(41, 'test', '123456789087654', '2021-10-21', '123', 141, '2021-09-18 18:33:41', '2021-09-18 18:33:41'),
(42, 'test', '123456789087654', '2021-10-21', '123', 141, '2021-09-18 19:26:55', '2021-09-18 19:26:55'),
(44, 'jkh', '6666-6666-6666-6666', '09/8888', '787', 325, '2021-09-18 19:28:13', '2021-09-18 19:28:13'),
(45, 'hehhell9', '4949-4646-6464-64', '46/4646', '467', 303, '2021-09-19 03:35:11', '2021-09-19 03:35:11');

-- --------------------------------------------------------

--
-- Table structure for table `user_rating_review`
--

CREATE TABLE `user_rating_review` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `rating` varchar(255) NOT NULL,
  `remarks` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_rating_review`
--

INSERT INTO `user_rating_review` (`id`, `user_id`, `order_id`, `driver_id`, `rating`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 303, 1, 5, '3', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,\r\nmolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum\r\nnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium\r\noptio, eaque rerum! Provident similique accusantium nemo autem.', '2021-09-13 03:24:06', '2021-09-13 17:00:23'),
(2, 303, 1, 5, '2', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,\r\nmolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum\r\nnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium\r\noptio, eaque rerum! Provident similique accusantium nemo autem.', '2021-09-13 03:24:06', '2021-09-13 17:00:34'),
(3, 303, 1, 5, '1', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,\r\nmolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum\r\nnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium\r\noptio, eaque rerum! Provident similique accusantium nemo autem.', '2021-09-13 03:24:06', '2021-09-13 17:00:44'),
(4, 303, 1, 5, '5', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,\r\nmolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum\r\nnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium\r\noptio, eaque rerum! Provident similique accusantium nemo autem.', '2021-09-13 03:24:06', '2021-09-13 17:00:53');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `id` int(11) NOT NULL,
  `service` varchar(255) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `vehicle_type` varchar(255) DEFAULT NULL,
  `weight_limit` varchar(255) DEFAULT NULL,
  `size_limit` varchar(255) DEFAULT NULL,
  `priceby` varchar(255) DEFAULT NULL,
  `basefare` varchar(255) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `kmfare` varchar(255) DEFAULT NULL,
  `priceafterbasefare` varchar(255) DEFAULT NULL,
  `stopprice` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`id`, `service`, `city`, `vehicle_type`, `weight_limit`, `size_limit`, `priceby`, `basefare`, `image`, `kmfare`, `priceafterbasefare`, `stopprice`, `description`, `created_at`, `updated_at`) VALUES
(1, '1', 'philippines', 'Motorcycle', '20kg', '0.5*0.4*0.4 Meter up to 20kg', 'km', '100', 'bike.png', '50', '5', '5', 'Cheapest delivery option', '2021-06-15 18:52:16', '2021-06-15 09:36:51'),
(2, '1', 'philippines', ' BIKE', '100kg', '2.1*1.2*1.1 Meter upto 600kg', 'km', '200', 'bike1.png', '100', '5', '5', 'feasible and affordable', '2021-06-15 22:50:03', '2021-06-15 13:25:12'),
(3, '1', 'philippines', 'SEDAN 200KG\r\n', '200kg', '2.1*1.2*1.1 Meter upto 1000kg', 'km', '300', 'sedan.png', '150', '5', '5', 'Compact & compatible', '2021-06-15 23:03:29', '2021-06-15 13:38:56'),
(4, '1', 'philippines', 'MVP 300KG', '300 kg', '2.1*1.2*1.1 Meter upto 1000kg', 'km', '400', 'mvp300.jpg', '200', '5', '5', 'All-around 4 wheeler option', '2021-06-15 23:03:29', '2021-06-15 13:38:56'),
(5, '1', 'philippines', 'MVP 600KG', '600 kg', '2.1*1.2*1.1 Meter upto 2000kg', 'km', '500', 'big4wheeler.jpg', '250', '5', '5', 'Biggest 4 wheeler option', '2021-06-15 23:09:40', '2021-06-15 13:41:31'),
(6, '1', 'philippines', 'VAN 1000KG', '1000kg', '2.1*1.2*1.1 Meter upto 1000kg', 'km', '600', 'van1.png', '300', '5', '5', NULL, '2021-09-08 22:18:27', '2021-09-08 12:44:06'),
(7, '1', 'philippines', 'FB 1000KG\r\n', '1000kg', '2.1*1.2*1.1 Meter upto 1000kg', 'km', '700', 'fb1.png', '350', '5', '5', NULL, '2021-09-08 22:18:31', '2021-09-08 12:44:06'),
(8, '1', 'philippines', 'FB 2000KG', '2000kg', '2.1*1.2*1.1 Meter upto 2000kg', 'km', '800', 'fb2.jpg', '400', '5', '5', NULL, '2021-09-08 22:18:34', '2021-09-08 12:44:19'),
(9, '1', 'philippines', 'ALUMINUM 2000KG', '2000kg', '2.1*1.2*1.1 Meter upto 2000kg', 'km', '850', 'alluminium.jpg', '450', '5', '5', NULL, '2021-09-09 03:18:54', '2021-09-08 17:47:36');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_make`
--

CREATE TABLE `vehicle_make` (
  `id` int(11) NOT NULL,
  `vehicle_types` varchar(255) NOT NULL,
  `vehicle_logo` varchar(255) NOT NULL,
  `m_description` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` varchar(110) NOT NULL,
  `updated_at` varchar(110) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicle_make`
--

INSERT INTO `vehicle_make` (`id`, `vehicle_types`, `vehicle_logo`, `m_description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'test1', 'vehicle_logo-1630139692.webp', 'Lorem ipsum dolor sit amet consectetur adipisicing elit.', 'ertre', '0', '2021-08-28 14:04:52'),
(2, 'test5', 'vehicle_logo-1630139668.webp', 'Lorem ipsum dolor sit amet consectetur adipisicing elit.', '', '2021-08-28 14:04:28', '2021-08-28 14:04:28'),
(3, 'test51', 'vehicle_logo-1630140235.webp', 'test', '', '2021-08-28 14:13:55', '2021-08-28 14:13:55'),
(4, 'test51', 'vehicle_logo-1630140365.webp', 'test', '', '2021-08-28 14:16:05', '2021-08-28 14:16:05'),
(5, 'test51', 'vehicle_logo-1630140582.webp', 'test20', '', '2021-08-28 14:19:42', '2021-08-28 14:19:42'),
(6, 'Suzuki', 'vehicle_logo-1630142865.jpg', '56465', 'active', '2021-08-28 14:57:45', '2021-08-28 14:57:45');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_model`
--

CREATE TABLE `vehicle_model` (
  `id` int(11) NOT NULL,
  `model_types` text NOT NULL,
  `model_makes` text NOT NULL,
  `vehicles_model` text NOT NULL,
  `description` text NOT NULL,
  `no_of_seats` text NOT NULL,
  `status` text NOT NULL,
  `created_at` text NOT NULL,
  `updated_at` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicle_model`
--

INSERT INTO `vehicle_model` (`id`, `model_types`, `model_makes`, `vehicles_model`, `description`, `no_of_seats`, `status`, `created_at`, `updated_at`) VALUES
(1, 'fdsfsddsfds', 'sdf4543', 'dsfdskjhkj', 'ugui 5465456465jkhkj', '5', 'active', '', '2021-08-22 00:41:18'),
(2, '5456465', '46546', '56465mm', 'jknknk', '545', 'active', '2021-08-28 15:32:44', '2021-08-28 15:45:28'),
(3, 'light121', 'test1111', 'test20111', 'test11111', '40', 'active', '2021-08-28 15:32:55', '2021-08-28 15:49:05'),
(4, '11111111', 'test1', 'test20', 'test', '40', 'active', '2021-08-28 15:49:33', '2021-08-28 15:49:33'),
(5, 'car', '00', '00', '000', '4', 'active', '2021-08-31 11:25:51', '2021-08-31 11:26:32');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_type`
--

CREATE TABLE `vehicle_type` (
  `id` int(11) NOT NULL,
  `v_type` text NOT NULL,
  `v_rank` text NOT NULL,
  `v_image` varchar(255) NOT NULL,
  `v_description` text NOT NULL,
  `delivery_type` varchar(250) NOT NULL,
  `v_for` varchar(255) NOT NULL,
  `v_sequence` varchar(255) NOT NULL,
  `v_status` varchar(11) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicle_type`
--

INSERT INTO `vehicle_type` (`id`, `v_type`, `v_rank`, `v_image`, `v_description`, `delivery_type`, `v_for`, `v_sequence`, `v_status`, `created_at`, `updated_at`) VALUES
(1, 'Motercycle', '5', 'v_image-1629553398.jpg', 'Lorem ipsum dolor sit amet consectetur adipisicing elit.', 'light', 'dilivery', '4', 'active', '', '2021-08-21 19:13:18'),
(2, 'Motercycle1', '5100', 'v_image-1630145847.jpg', 'Lorem ipsum dolor..........', 'Delivery', 'Heavy 1', '100', 'active', '2021-08-21 18:20:36', '2021-08-28 15:47:27');

-- --------------------------------------------------------

--
-- Table structure for table `wallerpackage`
--

CREATE TABLE `wallerpackage` (
  `id` int(11) NOT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wallerpackage`
--

INSERT INTO `wallerpackage` (`id`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(1, '300', 1, '2021-06-18 11:30:21', '2021-06-18 11:30:21'),
(2, '500', 1, '2021-06-18 11:30:21', '2021-06-18 11:30:21'),
(3, '1000', 1, '2021-06-18 11:30:35', '2021-06-18 11:30:35'),
(4, '2000', 1, '2021-06-18 11:30:35', '2021-06-18 11:30:35'),
(5, '5000', 1, '2021-06-18 11:30:42', '2021-06-18 11:30:42'),
(6, '50000', 0, '2021-09-15 12:36:53', '2021-09-15 14:32:13');

-- --------------------------------------------------------

--
-- Table structure for table `walletmaster`
--

CREATE TABLE `walletmaster` (
  `id` bigint(20) NOT NULL,
  `transactiontypeId` bigint(20) NOT NULL,
  `ordered` int(11) NOT NULL,
  `amount` decimal(11,0) NOT NULL,
  `datetime` datetime NOT NULL,
  `createdbyuserid` bigint(20) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_recharge`
--

CREATE TABLE `wallet_recharge` (
  `id` int(11) NOT NULL,
  `transactionid` varchar(255) DEFAULT NULL,
  `transactiontype` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT '0',
  `method` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `change_amount` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wallet_recharge`
--

INSERT INTO `wallet_recharge` (`id`, `transactionid`, `transactiontype`, `user_id`, `phone`, `method`, `amount`, `change_amount`, `description`, `created_at`, `updated_at`) VALUES
(15, '123RDF', 'user', 149, '0', 'debit', '24400', '200', NULL, '2021-08-22 10:07:53', '2021-08-22 10:07:53'),
(16, 'XDR123', 'user', 149, '0', 'debit', '12090', '12310', NULL, '2021-08-22 10:23:13', '2021-08-22 10:23:13'),
(17, '12VDSK', 'user', 149, '0', 'credit', '100000', '100000', NULL, '', '2021-08-22 10:35:57'),
(18, 'TEST65', 'user', 149, '0', 'debit', '36045', '63955', NULL, '2021-08-22 10:38:56', '2021-08-22 10:38:56'),
(19, 'IDS123', 'user', 149, '0', 'debit', '18665', '17380', NULL, '2021-08-22 10:53:48', '2021-08-22 10:53:48'),
(20, 'IUw5IdoV3h', 'user', 149, '0', 'credit', '19665', '1000', NULL, '2021-08-22 15:36:14', '2021-08-22 15:36:14'),
(21, 'KQAm6eiTOy', 'user', 149, '0', 'credit', '20665', '1000', NULL, '2021-08-22 15:40:04', '2021-08-22 15:40:04'),
(22, 'qU4qlwCIJo', 'user', 149, '0', 'debit', '1590', '19075', NULL, '2021-08-23 05:13:27', '2021-08-23 05:13:27'),
(23, 'mAlrKPaX83', 'user', 149, '0', 'debit', '1590', '0', NULL, '2021-08-23 05:15:38', '2021-08-23 05:15:38'),
(24, 'HrQ5DX6fx5', 'user', 175, '0', 'credit', '5000', '5000', NULL, '2021-08-24 02:00:53', '2021-08-24 02:00:53'),
(25, 'Q8forUbNQe', 'user', 175, '0', 'debit', '5000', '0', NULL, '2021-08-24 02:01:07', '2021-08-24 02:01:07'),
(26, '54pgCLWWpr', 'user', 149, '0', 'debit', '1590', '0', NULL, '2021-08-24 02:54:08', '2021-08-24 02:54:08'),
(27, 'FN2wv6N9yD', 'user', 175, '0', 'debit', '5000', '0', NULL, '2021-08-24 03:12:58', '2021-08-24 03:12:58'),
(28, 'uHFaVKcq8A', 'user', 175, '0', 'debit', '5000', '0', NULL, '2021-08-24 04:22:35', '2021-08-24 04:22:35'),
(29, '1Xn4ZJq6RS', 'user', 175, '0', 'debit', '5000', '0', NULL, '2021-08-24 04:27:02', '2021-08-24 04:27:02'),
(30, '1mbZpM3rQC', 'user', 175, '0', 'debit', '5000', '0', NULL, '2021-08-24 04:57:39', '2021-08-24 04:57:39'),
(31, 'FlzQ4m7z3j', 'user', 175, '0', 'debit', '5000', '0', NULL, '2021-08-24 05:37:24', '2021-08-24 05:37:24'),
(32, '2w90g7LQlE', 'user', 175, '0', 'credit', '5500', '500', NULL, '2021-08-24 06:02:20', '2021-08-24 06:02:20'),
(33, 'YSzOch98fe', 'user', 175, '0', 'credit', '7500', '2000', NULL, '2021-08-24 06:02:40', '2021-08-24 06:02:40'),
(34, 'h0DoIlxH3m', 'user', 175, '0', 'debit', '7450', '50', NULL, '2021-08-24 06:03:03', '2021-08-24 06:03:03'),
(35, 'gQzYY3NaDg', 'user', 175, '0', 'debit', '7450', '0', NULL, '2021-08-24 06:07:38', '2021-08-24 06:07:38'),
(36, 'OwHSp2gZTY', 'user', 175, '0', 'debit', '7400', '50', NULL, '2021-08-24 07:01:37', '2021-08-24 07:01:37'),
(37, 'N7aA2FaRQD', 'user', 175, '0', 'debit', '7400', '0', NULL, '2021-08-24 07:03:25', '2021-08-24 07:03:25'),
(38, 'BB4JxEQQrZ', 'user', 175, '0', 'debit', '7430', '-30', NULL, '2021-08-24 07:05:29', '2021-08-24 07:05:29'),
(39, '0fHQD0CFXc', 'user', 175, '0', 'debit', '7430', '0', NULL, '2021-08-24 07:23:17', '2021-08-24 07:23:17'),
(40, '165kAeRnOE', 'user', 175, '0', 'credit', '9430', '2000', NULL, '2021-08-24 07:34:31', '2021-08-24 07:34:31'),
(41, 'r7Yfq88470', 'user', 175, '0', 'debit', '9430', '0', NULL, '2021-08-24 07:34:46', '2021-08-24 07:34:46'),
(42, 'nsiLS7DI6q', 'user', 149, '0', 'credit', '6590', '5000', NULL, '2021-08-24 09:35:59', '2021-08-24 09:35:59'),
(43, 'd0N36a4Y3c', 'user', 149, '0', 'debit', '4085', '2505', NULL, '2021-08-24 09:36:06', '2021-08-24 09:36:06'),
(44, 'DRJpCAQr5q', 'user', 149, '0', 'debit', '4070', '15', NULL, '2021-08-24 10:05:19', '2021-08-24 10:05:19'),
(45, 'YFy2olKBx4', 'user', 149, '0', 'debit', '4040', '30', NULL, '2021-08-24 10:13:43', '2021-08-24 10:13:43'),
(46, 'a7kBI2x4yj', 'user', 175, '0', 'credit', '11430', '2000', NULL, '2021-08-24 10:33:25', '2021-08-24 10:33:25'),
(47, 'QHIrtLPZeC', 'user', 175, '0', 'debit', '11450', '-20', NULL, '2021-08-24 10:33:47', '2021-08-24 10:33:47'),
(48, 'bkvF6bVo0z', 'user', 149, '0', 'debit', '4010', '30', NULL, '2021-08-24 12:41:30', '2021-08-24 12:41:30'),
(49, 'pSItduTVOM', 'user', 149, '0', 'debit', '3980', '30', NULL, '2021-08-24 13:04:50', '2021-08-24 13:04:50'),
(50, 'iSaAGl2cK1', 'user', 149, '0', 'debit', '3950', '30', NULL, '2021-08-24 14:26:14', '2021-08-24 14:26:14'),
(51, 'v7JvqeMbqN', 'user', 149, '0', 'debit', '3950', '0', NULL, '2021-08-24 14:58:10', '2021-08-24 14:58:10'),
(52, 'VPcZ9jlaNX', 'user', 253, '0', 'credit', '500', '500', NULL, '2021-08-26 06:24:12', '2021-08-26 06:24:12'),
(53, '8SKQc6i6e6', 'user', 253, '0', 'credit', '1000', '500', NULL, '2021-08-26 06:24:15', '2021-08-26 06:24:15'),
(56, 'testid', 'type', 1, '0', 'credit', '0', '0', NULL, '2021-08-26 15:29:12', '2021-08-26 15:29:12'),
(57, NULL, NULL, 1, '0', 'credit', '0', '0', NULL, '2021-08-26 15:29:41', '2021-08-26 15:29:41'),
(58, NULL, NULL, 1, '0', 'credit', '100', '100', NULL, '2021-08-26 15:29:50', '2021-08-26 15:29:50'),
(59, NULL, NULL, 1, '0', 'credit', '100', '0', NULL, '2021-08-26 15:30:01', '2021-08-26 15:30:01'),
(60, 'bal_txn_wxEFHnMVidimZxEfsxxZmxR9', 'gcash', 149, '0', 'credit', '203950', '200000', NULL, '2021-08-27 10:18:51', '2021-08-27 10:18:51'),
(61, 'bal_txn_MqTuinMKUgpjXY75UVeMtQQD', 'gcash', 149, '0', 'credit', '233950', '30000', NULL, '2021-08-27 10:24:23', '2021-08-27 10:24:23'),
(62, 'bal_txn_96dfgBvi3gns1jFmPxvd7Jwf', 'gcash', 149, '0', 'credit', '263950', '30000', NULL, '2021-08-27 10:34:35', '2021-08-27 10:34:35'),
(63, 'bal_txn_X8SXnkVUL2nnhjGhckXx1AXg', 'gcash', 149, '0', 'credit', '293950', '30000', NULL, '2021-08-27 10:44:31', '2021-08-27 10:44:31'),
(64, 'bal_txn_WVYA52LtGSmpkkKQ9MdbqdMD', 'gcash', 149, '0', 'credit', '323950', '30000', NULL, '2021-08-27 10:48:58', '2021-08-27 10:48:58'),
(65, 'bal_txn_VZ5ZWnVpyLuhL1aPG14ufM45', 'gcash', 149, '0', 'credit', '353950', '30000', NULL, '2021-08-27 10:53:26', '2021-08-27 10:53:26'),
(66, 'RXJgFGdRuD', 'sheduled', 149, '0', 'debit', '353920', '30', NULL, '2021-08-27 11:08:05', '2021-08-27 11:08:05'),
(67, 'jeEUNOgunp', 'sheduled', 149, '0', 'debit', '353890', '30', NULL, '2021-08-27 11:20:49', '2021-08-27 11:20:49'),
(68, 'Eh2hR0TD6t', 'sheduled', 149, '0', 'debit', '353860', '30', NULL, '2021-08-27 11:38:02', '2021-08-27 11:38:02'),
(69, 'KuwyDfumtz', 'sheduled', 149, '0', 'debit', '353830', '30', NULL, '2021-08-27 11:47:14', '2021-08-27 11:47:14'),
(70, 'a7cjdEolPT', 'sheduled', 149, '0', 'debit', '353800', '30', NULL, '2021-08-27 12:08:56', '2021-08-27 12:08:56'),
(71, 'bal_txn_wY2JjkTuTFmQicNcXcuQwtNH', 'gcash', 149, '0', 'credit', '383800', '30000', NULL, '2021-08-27 16:43:21', '2021-08-27 16:43:21'),
(72, 'APE8BJB0eb', 'sheduled', 149, '0', 'debit', '383770', '30', NULL, '2021-08-27 16:44:04', '2021-08-27 16:44:04'),
(73, 'WDcLBEb9sE', 'sheduled', 149, '0', 'debit', '383645', '125', NULL, '2021-08-28 05:24:44', '2021-08-28 05:24:44'),
(74, 'U2ZWXzp7I0', 'sheduled', 149, '0', 'debit', '383620', '25', NULL, '2021-08-28 05:30:25', '2021-08-28 05:30:25'),
(75, '3bdf7WfbZ7', 'sheduled', 149, '0', 'debit', '383407.5', '212.5', NULL, '2021-08-28 05:39:27', '2021-08-28 05:39:27'),
(76, 'kFljG01GBh', 'sheduled', 149, '0', 'debit', '383407.5', '0', NULL, '2021-08-28 05:50:15', '2021-08-28 05:50:15'),
(77, '0leQPuy1EF', 'sheduled', 149, '0', 'debit', '383357.5', '50', NULL, '2021-08-28 05:53:05', '2021-08-28 05:53:05'),
(78, 'QUs7h5ZUkE', 'sheduled', 149, '0', 'debit', '383257.5', '100', NULL, '2021-08-28 05:57:53', '2021-08-28 05:57:53'),
(79, 'ZvfFEAxyN8', 'sheduled', 149, '0', 'debit', '383232.5', '25', NULL, '2021-08-28 06:07:57', '2021-08-28 06:07:57'),
(80, 'OFeUJZUv9E', 'sheduled', 149, '0', 'debit', '383157.5', '75', NULL, '2021-08-28 06:10:44', '2021-08-28 06:10:44'),
(81, 'uYew8Y3SUF', 'sheduled', 149, '0', 'debit', '370407.5', '12750', NULL, '2021-08-28 06:14:24', '2021-08-28 06:14:24'),
(82, 'gRUhfEuExw', 'sheduled', 149, '0', 'debit', '370307.5', '100', NULL, '2021-08-28 06:16:48', '2021-08-28 06:16:48'),
(83, 'bal_txn_bZnFMbamhFipmipjBnDCeogb', 'gcash', 149, '0', 'credit', '870307.5', '500000', NULL, '2021-08-28 06:20:16', '2021-08-28 06:20:16'),
(84, '0MOz8Y6XPM', 'sheduled', 149, '0', 'debit', '870182.5', '125', NULL, '2021-08-28 08:14:42', '2021-08-28 08:14:42'),
(85, 'bal_txn_H3bWGcmXBHWBEaBJ3MeyfWhi', 'gcash', 149, '0', 'credit', '1370182.5', '500000', NULL, '2021-08-28 09:07:59', '2021-08-28 09:07:59'),
(86, 'bal_txn_NYk9f1sApjjyHxnysunLiRDV', 'gcash', 149, '0', 'credit', '1870182.5', '500000', NULL, '2021-08-28 09:08:54', '2021-08-28 09:08:54'),
(87, 'bal_txn_wGCYS4BkKG4BjKiNgq3xBv6W', 'gcash', 149, '0', 'credit', '1900182.5', '30000', NULL, '2021-08-28 09:10:01', '2021-08-28 09:10:01'),
(88, 'bal_txn_GhgAoJ8q9PYyYTBZfrc2uHw6', 'gcash', 149, '0', 'credit', '2400182.5', '500000', NULL, '2021-08-28 09:10:57', '2021-08-28 09:10:57'),
(89, 'bal_txn_cxeJVsLeNkK3XHTYWFHcmDiN', 'gcash', 149, '0', 'credit', '2450182.5', '50000', NULL, '2021-08-28 09:11:44', '2021-08-28 09:11:44'),
(90, 'bal_txn_8gJcUdJQq6J5PYjqXvvsLvpX', 'gcash', 149, '0', 'credit', '2550182.5', '100000', NULL, '2021-08-28 09:16:54', '2021-08-28 09:16:54'),
(91, 'bal_txn_zmmaM9AdDxxBUXF4yQc5dARH', 'gcash', 149, '0', 'credit', '2750182.5', '200000', NULL, '2021-08-28 09:18:12', '2021-08-28 09:18:12'),
(92, '4cBdONXUdQ', 'sheduled', 149, '0', 'debit', '2750167.5', '15', NULL, '2021-08-29 11:01:38', '2021-08-29 11:01:38'),
(93, '86gsOj80CZ', 'sheduled', 149, '0', 'debit', '2750152.5', '15', NULL, '2021-08-29 12:38:21', '2021-08-29 12:38:21'),
(94, '7oOBDW9u8q', 'sheduled', 149, '0', 'debit', '2750122.5', '30', NULL, '2021-08-29 12:49:58', '2021-08-29 12:49:58'),
(95, 'bal_txn_EnVkenmbZAxstLs5jRX6Xdwp', 'gcash', 149, '0', 'credit', '2750422.5', '300', NULL, '2021-08-29 16:49:55', '2021-08-29 16:49:55'),
(96, '3Vrm10ztLi', 'sheduled', 149, '0', 'debit', '2750407.5', '15', NULL, '2021-08-30 01:56:31', '2021-08-30 01:56:31'),
(97, 'bal_txn_fiFq7Fk95t8B2Cj7o1wuVnga', 'gcash', 149, '0', 'credit', '2750707.5', '300', NULL, '2021-08-30 02:08:51', '2021-08-30 02:08:51'),
(98, 'GFPTw8b5Kb', 'sheduled', 149, '0', 'debit', '2750677.5', '30', NULL, '2021-08-30 02:09:19', '2021-08-30 02:09:19'),
(99, 'iQgJ5aGUSh', 'sheduled', 149, '0', 'debit', '2750662.5', '15', NULL, '2021-08-30 02:23:57', '2021-08-30 02:23:57'),
(100, 'S8lTRvHciE', 'sheduled', 149, '0', 'debit', '2750647.5', '15', NULL, '2021-08-30 03:03:22', '2021-08-30 03:03:22'),
(101, '0XnrwQWChp', 'sheduled', 149, '0', 'debit', '2750632.5', '15', NULL, '2021-08-30 03:07:24', '2021-08-30 03:07:24'),
(102, 'Lv4HQctdSh', 'sheduled', 149, '0', 'debit', '2750602.5', '30', NULL, '2021-08-30 05:48:48', '2021-08-30 05:48:48'),
(103, 'CIjxkXO8ZJ', 'sheduled', 149, '0', 'debit', '2750572.5', '30', NULL, '2021-08-30 05:57:34', '2021-08-30 05:57:34'),
(104, 'wkHlSiKkXw', 'sheduled', 149, '0', 'debit', '2750542.5', '30', NULL, '2021-08-30 05:59:31', '2021-08-30 05:59:31'),
(105, 'KZjycOMvgk', 'sheduled', 149, '0', 'debit', '2750512.5', '30', NULL, '2021-08-30 07:51:24', '2021-08-30 07:51:24'),
(106, 'wnkvrw8CMu', 'sheduled', 149, '0', 'debit', '2750482.5', '30', NULL, '2021-08-30 08:08:01', '2021-08-30 08:08:01'),
(107, 'zitqCyXhpG', 'sheduled', 149, '0', 'debit', '2750467.5', '15', NULL, '2021-08-30 08:32:29', '2021-08-30 08:32:29'),
(108, 'HpkU0eFh1R', 'sheduled', 149, '0', 'debit', '2750452.5', '15', NULL, '2021-08-30 08:45:01', '2021-08-30 08:45:01'),
(109, 'AhystDfx2X', 'sheduled', 149, '0', 'debit', '2750422.5', '30', NULL, '2021-08-30 12:45:14', '2021-08-30 12:45:14'),
(110, 'LGYaEALpJM', 'sheduled', 149, '0', 'debit', '2750392.5', '30', NULL, '2021-08-30 12:53:42', '2021-08-30 12:53:42'),
(111, 'bal_txn_5UpzNQhTE4HBV1rG6Jud7zAm', 'gcash', 149, '0', 'credit', '2750692.5', '300', NULL, '2021-08-31 06:29:27', '2021-08-31 06:29:27'),
(112, '9kRBXPZz7O', 'sheduled', 149, '0', 'debit', '2750677.5', '15', NULL, '2021-08-31 06:32:09', '2021-08-31 06:32:09'),
(113, 'bal_txn_ACnrS1vcjAG6JDa3nWPinDxL', 'gcash', 281, '0', 'credit', '5000', '5000', NULL, '2021-08-31 10:20:31', '2021-08-31 10:20:31'),
(114, 'QSpJpHTCRO', 'sheduled', 281, '0', 'debit', '4975', '25', NULL, '2021-08-31 10:20:37', '2021-08-31 10:20:37'),
(115, 'bal_txn_YhqpN1eXZG6WZCy4XdE1MpGA', 'gcash', 281, '0', 'credit', '9975', '5000', NULL, '2021-08-31 10:38:38', '2021-08-31 10:38:38'),
(116, 'bal_txn_KmLQL2DcuzWhDpj6uFYzaUnA', 'gcash', 281, '0', 'credit', '14975', '5000', NULL, '2021-08-31 10:39:19', '2021-08-31 10:39:19'),
(117, 'bal_txn_FHYqBbuMbdNoj73q59fTjWir', 'gcash', 281, '0', 'credit', '19975', '5000', NULL, '2021-08-31 10:51:42', '2021-08-31 10:51:42'),
(118, 'iS9qheLL6w', 'sheduled', 281, '0', 'debit', '19875', '100', NULL, '2021-08-31 10:51:56', '2021-08-31 10:51:56'),
(119, 'hQGmP5MM16', 'sheduled', 281, '0', 'debit', '19850', '25', NULL, '2021-08-31 10:54:34', '2021-08-31 10:54:34'),
(120, '8tgOnSjKZy', 'sheduled', 281, '0', 'debit', '19750', '100', NULL, '2021-08-31 10:56:52', '2021-08-31 10:56:52'),
(121, 'bal_txn_wyte5mRBR3M22NJRpqESkBME', 'gcash', 281, '0', 'credit', '24750', '5000', NULL, '2021-08-31 10:59:07', '2021-08-31 10:59:07'),
(122, 'bal_txn_MDmWk6KwwauatN3tN9smj1VV', 'gcash', 281, '0', 'credit', '29750', '5000', NULL, '2021-08-31 11:05:27', '2021-08-31 11:05:27'),
(123, 'bal_txn_A7CTHNzCbjWPfX8HZPnP7Y8B', 'gcash', 287, '0', 'credit', '300', '300', NULL, '2021-08-31 13:04:36', '2021-08-31 13:04:36'),
(124, '4NctL2YMWG', 'sheduled', 287, '0', 'debit', '290', '10', NULL, '2021-08-31 13:04:43', '2021-08-31 13:04:43'),
(125, 'bal_txn_EyTsxQ9N3a9e2FQaRj4PA1nD', 'gcash', 149, '0', 'credit', '2750977.5', '300', NULL, '2021-08-31 13:17:24', '2021-08-31 13:17:24'),
(126, 'G3qUrAP2pf', 'sheduled', 149, '0', 'debit', '2750962.5', '15', NULL, '2021-08-31 13:17:40', '2021-08-31 13:17:40'),
(127, 'bal_txn_RoUEsnwkhdH4Za1DoufZWFgV', 'gcash', 149, '0', 'credit', '2751262.5', '300', NULL, '2021-08-31 13:21:32', '2021-08-31 13:21:32'),
(128, '4wR7XhAZnK', 'sheduled', 149, '0', 'debit', '2751247.5', '15', NULL, '2021-08-31 13:21:51', '2021-08-31 13:21:51'),
(129, 'bal_txn_VvhYhwWA4S23zUQyAddJR8va', 'gcash', 288, '0', 'credit', '5000', '5000', NULL, '2021-08-31 13:47:32', '2021-08-31 13:47:32'),
(130, '52z6UMRKnO', 'sheduled', 288, '0', 'debit', '4875', '125', NULL, '2021-08-31 13:47:40', '2021-08-31 13:47:40'),
(131, 'bal_txn_NbHzkKtwU6by1P71xouoqewd', 'gcash', 289, '0', 'credit', '5000', '5000', NULL, '2021-08-31 16:59:23', '2021-08-31 16:59:23'),
(132, '1taWmF9DvB', 'sheduled', 289, '0', 'debit', '5000', '0', NULL, '2021-08-31 16:59:47', '2021-08-31 16:59:47'),
(133, 'bal_txn_aFPYVxEGZCeDpS8KtKoqaRD4', 'gcash', 288, '0', 'credit', '9875', '5000', NULL, '2021-09-01 02:16:24', '2021-09-01 02:16:24'),
(134, 'bal_txn_8QKRBbxwsQR8GXd4VjyYJfc8', 'gcash', 287, '0', 'credit', '590', '300', NULL, '2021-09-01 08:41:35', '2021-09-01 08:41:35'),
(135, 'CnGEXuXHiI', 'sheduled', 287, '0', 'debit', '590', '0', NULL, '2021-09-01 08:42:01', '2021-09-01 08:42:01'),
(136, 'bal_txn_97vd3SLKR47HABMT8r5C95EX', 'gcash', 299, '0', 'credit', '1000', '1000', NULL, '2021-09-02 18:21:54', '2021-09-02 18:21:54'),
(137, 'kj7q3UEbaC', 'sheduled', 299, '0', 'debit', '965', '35', NULL, '2021-09-02 18:22:04', '2021-09-02 18:22:04'),
(138, 'bal_txn_vE3nzXn8N6Cp2N4BntpNTy5z', 'gcash', 298, '0', 'credit', '2000', '2000', NULL, '2021-09-03 01:22:07', '2021-09-03 01:22:07'),
(139, 'KRBhriDJfp', 'sheduled', 298, '0', 'debit', '1965', '35', NULL, '2021-09-03 01:22:13', '2021-09-03 01:22:13'),
(140, 'DEHGryPb2d', 'sheduled', 298, '0', 'debit', '1965', '0', NULL, '2021-09-03 01:33:25', '2021-09-03 01:33:25'),
(141, 'bal_txn_UqRHERmAMCs7bPMk3TJKXrYV', 'gcash', 298, '0', 'credit', '6965', '5000', NULL, '2021-09-03 01:33:56', '2021-09-03 01:33:56'),
(142, '3A6Nx4FI6i', 'sheduled', 298, '0', 'debit', '6945', '20', NULL, '2021-09-03 01:34:04', '2021-09-03 01:34:04'),
(143, 'nCK6oodEzJ', 'sheduled', 298, '0', 'debit', '6945', '0', NULL, '2021-09-03 01:59:24', '2021-09-03 01:59:24'),
(144, 'bal_txn_yqU5VKVjpKEnxJ1eJBLLPupx', 'gcash', 298, '0', 'credit', '7445', '500', NULL, '2021-09-03 02:08:34', '2021-09-03 02:08:34'),
(145, 'bal_txn_2aGFB9uczgMMXZuMosKosnh8', 'gcash', 300, '0', 'credit', '5000', '5000', NULL, '2021-09-03 05:32:34', '2021-09-03 05:32:34'),
(146, 'bal_txn_CYBhmqNQ16spauPpVuuAkNgn', 'gcash', 300, '0', 'credit', '10000', '5000', NULL, '2021-09-03 05:34:37', '2021-09-03 05:34:37'),
(147, 'A5P24xzsQ2', 'sheduled', 300, '0', 'debit', '10000', '0', NULL, '2021-09-03 05:35:10', '2021-09-03 05:35:10'),
(148, 'bal_txn_qj3fhmdCtgF53kfd8SazkXeY', 'gcash', 303, '0', 'credit', '5000', '5000', NULL, '2021-09-04 13:02:03', '2021-09-04 13:02:03'),
(149, 'xjilXHq6tR', 'sheduled', 303, '0', 'debit', '5000', '0', NULL, '2021-09-04 13:02:15', '2021-09-04 13:02:15'),
(150, 'kAxua6xYGN', 'sheduled', 303, '0', 'debit', '5000', '0', NULL, '2021-09-04 13:56:48', '2021-09-04 13:56:48'),
(151, 'FJZQpjQWiO', 'sheduled', 298, '0', 'debit', '7445', '0', NULL, '2021-09-04 15:03:35', '2021-09-04 15:03:35'),
(152, 'bal_txn_cPdqkh1zqWxCNegDNb9qT7gK', 'gcash', 304, '0', 'credit', '1000', '1000', NULL, '2021-09-04 15:28:15', '2021-09-04 15:28:15'),
(153, 'IklfsUkaHy', 'sheduled', 304, '0', 'debit', '970', '30', NULL, '2021-09-04 15:28:21', '2021-09-04 15:28:21'),
(154, 'XkrFP2pex3', 'sheduled', 304, '0', 'debit', '970', '0', NULL, '2021-09-04 16:06:36', '2021-09-04 16:06:36'),
(155, 'BXbay8zjj0', 'sheduled', 303, '0', 'debit', '4810', '190', NULL, '2021-09-05 08:23:28', '2021-09-05 08:23:28'),
(156, 'FhEqU47Lzq', 'sheduled', 303, '0', 'debit', '4765', '45', NULL, '2021-09-05 09:16:49', '2021-09-05 09:16:49'),
(157, 'bal_txn_oRRMurtZkAx2nVnfD1gdAzDS', 'gcash', 305, '0', 'credit', '500', '500', NULL, '2021-09-06 01:38:39', '2021-09-06 01:38:39'),
(158, 'GpGbZNYE1A', 'sheduled', 305, '0', 'debit', '480', '20', NULL, '2021-09-06 01:38:55', '2021-09-06 01:38:55'),
(159, '4CIOD5r9gF', 'sheduled', 304, '0', 'debit', '940', '30', NULL, '2021-09-06 01:43:30', '2021-09-06 01:43:30'),
(160, 'bal_txn_jdUD8tinQqeUiaw2WDvN9sVp', 'gcash', 304, '0', 'credit', '1440', '500', NULL, '2021-09-06 01:46:24', '2021-09-06 01:46:24'),
(161, 'bal_txn_LhZFa6nCe1HoViDE56XrdKPt', 'gcash', 298, '0', 'credit', '8445', '1000', NULL, '2021-09-06 10:51:01', '2021-09-06 10:51:01'),
(162, 'KTh42Lx84N', 'sheduled', 298, '0', 'debit', '8395', '50', NULL, '2021-09-06 11:19:36', '2021-09-06 11:19:36'),
(163, '0e13KgGV1K', 'sheduled', 298, '0', 'debit', '8365', '30', NULL, '2021-09-06 11:39:18', '2021-09-06 11:39:18'),
(164, 'YCcxCAMu6Y', 'sheduled', 298, '0', 'debit', '8320', '45', NULL, '2021-09-06 15:55:29', '2021-09-06 15:55:29'),
(165, 'z78qXPrkPf', 'sheduled', 303, '0', 'debit', '4725', '40', NULL, '2021-09-07 09:18:33', '2021-09-07 09:18:33'),
(166, 'kxInFvIjB3', 'sheduled', 303, '0', 'debit', '4685', '40', NULL, '2021-09-07 09:51:57', '2021-09-07 09:51:57'),
(167, 'emSSIojpA7', 'sheduled', 303, '0', 'debit', '4655', '30', NULL, '2021-09-07 10:37:16', '2021-09-07 10:37:16'),
(168, 'BbVoaiL3ED', 'sheduled', 303, '0', 'debit', '4625', '30', NULL, '2021-09-07 10:53:02', '2021-09-07 10:53:02'),
(169, 'dJwTfJYlyV', 'sheduled', 303, '0', 'debit', '4585', '40', NULL, '2021-09-07 11:03:27', '2021-09-07 11:03:27'),
(170, 'EdDEqhqgAb', 'sheduled', 303, '0', 'debit', '4550', '35', NULL, '2021-09-07 11:34:25', '2021-09-07 11:34:25'),
(171, 'GpAdpgWMxv', 'sheduled', 303, '0', 'debit', '4515', '35', NULL, '2021-09-07 11:53:09', '2021-09-07 11:53:09'),
(172, 'NCDP3qPZk7', 'sheduled', 303, '0', 'debit', '4480', '35', NULL, '2021-09-07 12:06:59', '2021-09-07 12:06:59'),
(173, 'hAyeU4yhYF', 'sheduled', 303, '0', 'debit', '4445', '35', NULL, '2021-09-07 13:23:15', '2021-09-07 13:23:15'),
(174, 'nZAHv3ZbkC', 'sheduled', 303, '0', 'debit', '4410', '35', NULL, '2021-09-07 13:36:21', '2021-09-07 13:36:21'),
(175, 'q65DrAMP8t', 'sheduled', 303, '0', 'debit', '4360', '50', NULL, '2021-09-07 15:11:17', '2021-09-07 15:11:17'),
(176, 'bal_txn_kiqUcgGMSLN5om7UhgD2hCXp', 'gcash', 303, '0', 'credit', '4660', '300', NULL, '2021-09-07 15:13:08', '2021-09-07 15:13:08'),
(177, 'oW1KLP22eW', 'sheduled', 298, '0', 'debit', '8320', '0', NULL, '2021-09-07 16:50:03', '2021-09-07 16:50:03'),
(178, 'RqG2NrpGKO', 'sheduled', 298, '0', 'debit', '8320', '0', NULL, '2021-09-07 16:53:30', '2021-09-07 16:53:30'),
(179, 'h033NFFa14', 'sheduled', 298, '0', 'debit', '7820', '500', NULL, '2021-09-07 18:13:12', '2021-09-07 18:13:12'),
(180, 'M2kyMRRjl8', 'sheduled', 298, '0', 'debit', '6070', '1750', NULL, '2021-09-07 18:24:22', '2021-09-07 18:24:22'),
(181, 'e1qejYSERy', 'sheduled', 298, '0', 'debit', '2570', '3500', NULL, '2021-09-07 18:29:16', '2021-09-07 18:29:16'),
(182, 'IvZTAg23n7', 'sheduled', 298, '0', 'debit', '2570', '0', NULL, '2021-09-07 20:23:59', '2021-09-07 20:23:59'),
(183, 'bal_txn_HL7UQ2W6Aw4rdgyzMEXwPTjP', 'gcash', 304, '0', 'credit', '2440', '1000', NULL, '2021-09-08 00:02:42', '2021-09-08 00:02:42'),
(184, 't7tMqAFmRc', 'sheduled', 304, '0', 'debit', '2280', '160', NULL, '2021-09-08 00:02:48', '2021-09-08 00:02:48'),
(185, 'gZ3nRx5xnc', 'sheduled', 304, '0', 'debit', '2280', '0', NULL, '2021-09-08 00:23:24', '2021-09-08 00:23:24'),
(186, 'rNs3aJP7w8', 'sheduled', 305, '0', 'debit', '480', '0', NULL, '2021-09-08 02:54:09', '2021-09-08 02:54:09'),
(187, 'bal_txn_2WMt5qgHrChY9gqJnsbTdjno', 'gcash', 312, '0', 'credit', '5000', '5000', NULL, '2021-09-08 07:33:12', '2021-09-08 07:33:12'),
(188, 'pIKmnt5fZh', 'sheduled', 312, '0', 'debit', '650', '4350', NULL, '2021-09-08 07:33:20', '2021-09-08 07:33:20'),
(189, 'aordrazlzj', 'sheduled', 312, '0', 'debit', '650', '0', NULL, '2021-09-08 07:36:01', '2021-09-08 07:36:01'),
(190, 'IMrQmGsvy8', 'sheduled', 312, '0', 'debit', '150', '500', NULL, '2021-09-08 08:23:06', '2021-09-08 08:23:06'),
(191, 'bal_txn_HqqUuH2PoEaVcDCWBnnGa391', 'gcash', 312, '0', 'credit', '5150', '5000', NULL, '2021-09-08 08:29:53', '2021-09-08 08:29:53'),
(192, 'gzUB0QtdM7', 'sheduled', 312, '0', 'debit', '5150', '0', NULL, '2021-09-08 08:50:03', '2021-09-08 08:50:03'),
(193, 'fuyHt5B9mX', 'sheduled', 312, '0', 'debit', '5150', '0', NULL, '2021-09-08 08:52:58', '2021-09-08 08:52:58'),
(194, '6PqgjOnvzl', 'sheduled', 312, '0', 'debit', '5150', '0', NULL, '2021-09-08 08:54:20', '2021-09-08 08:54:20'),
(195, 'USfS7F2Eb9', 'sheduled', 312, '0', 'debit', '5150', '0', NULL, '2021-09-08 08:56:06', '2021-09-08 08:56:06'),
(196, 'FxpZevsme1', 'sheduled', 312, '0', 'debit', '5150', '0', NULL, '2021-09-08 09:06:06', '2021-09-08 09:06:06'),
(197, 'yjOL37NSSz', 'sheduled', 298, '0', 'debit', '2570', '0', NULL, '2021-09-08 12:30:02', '2021-09-08 12:30:02'),
(198, 'bTqnDjkamx', 'sheduled', 298, '0', 'debit', '2570', '0', NULL, '2021-09-08 12:35:53', '2021-09-08 12:35:53'),
(199, 'ZMTMGmb4vy', 'sheduled', 303, '0', 'debit', '4440', '220', NULL, '2021-09-08 12:47:28', '2021-09-08 12:47:28'),
(200, 'E7OegHXBGL', 'sheduled', 304, '0', 'debit', '2070', '210', NULL, '2021-09-08 13:39:01', '2021-09-08 13:39:01'),
(201, 'AMibGwgoXM', 'sheduled', 303, '0', 'debit', '3520', '920', NULL, '2021-09-09 05:44:17', '2021-09-09 05:44:17'),
(202, 'X9JgDyEPCu', 'sheduled', 303, '0', 'debit', '3200', '320', NULL, '2021-09-09 14:26:37', '2021-09-09 14:26:37'),
(203, '4yLl993z0C', 'sheduled', 303, '0', 'debit', '2880', '320', NULL, '2021-09-09 17:12:07', '2021-09-09 17:12:07'),
(204, 'JrDadCw65j', 'sheduled', 298, '0', 'debit', '2400', '170', NULL, '2021-09-09 18:03:36', '2021-09-09 18:03:36'),
(205, 'Lea7k0foEw', 'sheduled', 298, '0', 'debit', '2280', '120', NULL, '2021-09-09 18:06:37', '2021-09-09 18:06:37'),
(206, 'g0CTH39q8b', 'sheduled', 298, '0', 'debit', '2280', '0', NULL, '2021-09-09 18:07:31', '2021-09-09 18:07:31'),
(207, 'PEtiWSASTV', 'sheduled', 298, '0', 'debit', '2160', '120', NULL, '2021-09-09 18:07:42', '2021-09-09 18:07:42'),
(208, '4fdWXKENoG', 'sheduled', 303, '0', 'debit', '1960', '920', NULL, '2021-09-10 04:06:44', '2021-09-10 04:06:44'),
(209, 'O7nn1rJ5SH', 'sheduled', 303, '0', 'debit', '1190', '770', NULL, '2021-09-10 04:11:43', '2021-09-10 04:11:43'),
(210, 'NRtx4YWxCr', 'sheduled', 303, '0', 'debit', '270', '920', NULL, '2021-09-10 04:21:02', '2021-09-10 04:21:02'),
(211, 'bal_txn_CDoDH4UxYYNtxK67pbcbrEdS', 'gcash', 303, '0', 'credit', '5270', '5000', NULL, '2021-09-10 04:24:19', '2021-09-10 04:24:19'),
(212, 'Acd4e0ksIj', 'sheduled', 303, '0', 'debit', '4750', '520', NULL, '2021-09-10 04:24:26', '2021-09-10 04:24:26'),
(213, 'c3XlA2cWSg', 'sheduled', 312, '0', 'debit', '4300', '850', NULL, '2021-09-10 05:26:03', '2021-09-10 05:26:03'),
(214, 'qbkO1ls4cC', 'sheduled', 303, '0', 'debit', '4580', '170', NULL, '2021-09-10 06:55:51', '2021-09-10 06:55:51'),
(215, 'PEWBuYkTi2', 'sheduled', 303, '0', 'debit', '4380', '200', NULL, '2021-09-10 06:57:46', '2021-09-10 06:57:46'),
(216, 'aqFnDzXuYF', 'sheduled', 298, '0', 'debit', '2160', '0', NULL, '2021-09-10 07:32:59', '2021-09-10 07:32:59'),
(217, 'wTo7dTozI1', 'sheduled', 298, '0', 'debit', '2160', '0', NULL, '2021-09-10 07:33:40', '2021-09-10 07:33:40'),
(218, 'UkWIxhZygl', 'sheduled', 298, '0', 'debit', '2160', '0', NULL, '2021-09-10 07:49:30', '2021-09-10 07:49:30'),
(219, 'CpJ2x3dAI8', 'sheduled', 298, '0', 'debit', '2160', '0', NULL, '2021-09-10 07:53:08', '2021-09-10 07:53:08'),
(220, 'bal_txn_EvEGitvoQdhuQDG9PYVzKEAJ', 'gcash', 316, '0', 'credit', '5000', '5000', NULL, '2021-09-10 10:58:39', '2021-09-10 10:58:39'),
(221, '5GRJUUHIe7', 'sheduled', 316, '0', 'debit', '5000', '0', NULL, '2021-09-10 10:58:47', '2021-09-10 10:58:47'),
(222, 'bal_txn_D5QjefuRxoyCf8RA9KYSZFkQ', 'gcash', 316, '0', 'credit', '10000', '5000', NULL, '2021-09-10 11:12:29', '2021-09-10 11:12:29'),
(223, 'sLB1vwEnFe', 'sheduled', 316, '0', 'debit', '9730', '270', NULL, '2021-09-10 11:12:40', '2021-09-10 11:12:40'),
(224, 'bal_txn_YpvuLzbnXF9AiWFZPCUcGTKE', 'gcash', 316, '0', 'credit', '14730', '5000', NULL, '2021-09-10 11:33:35', '2021-09-10 11:33:35'),
(225, 'bal_txn_8BCAawCxXuTPzQVFyKUZ7PLw', 'gcash', 292, '0', 'credit', '5000', '5000', NULL, '2021-09-10 12:00:12', '2021-09-10 12:00:12'),
(226, 'dKryDkipWv', 'sheduled', 292, '0', 'debit', '4900', '100', NULL, '2021-09-10 12:00:24', '2021-09-10 12:00:24'),
(227, 'FbErZuyfEN', 'sheduled', 303, '0', 'debit', '4170', '210', NULL, '2021-09-10 12:53:11', '2021-09-10 12:53:11'),
(228, 'bal_txn_fXZ8VZqF9oWA4J5MCF9AAmdo', 'gcash', 303, '0', 'credit', '5170', '1000', NULL, '2021-09-10 13:28:39', '2021-09-10 13:28:39'),
(229, 'wiUr8D8M3H', 'sheduled', 303, '0', 'debit', '5000', '170', NULL, '2021-09-10 13:37:56', '2021-09-10 13:37:56'),
(230, 'bal_txn_Ai3usKtHW8frykjM2mMWCKVm', 'gcash', 303, '0', 'credit', '5500', '500', NULL, '2021-09-10 15:16:54', '2021-09-10 15:16:54'),
(231, 'bal_txn_gZDRkrfAVdDgSj5u96ndv39D', 'gcash', 303, '0', 'credit', '7500', '2000', NULL, '2021-09-10 15:50:41', '2021-09-10 15:50:41'),
(232, 'bal_txn_tRuamSEhfHXgJ9HqwWjAYZaP', 'gcash', 303, '0', 'credit', '12500', '5000', NULL, '2021-09-10 15:51:40', '2021-09-10 15:51:40'),
(233, 'ixeazeea3e', 'sheduled', 303, '0', 'debit', '2780', '9720', NULL, '2021-09-10 15:51:47', '2021-09-10 15:51:47'),
(234, 'bal_txn_Zg4hSfEgQPwvwVAsxXcqfo9r', 'gcash', 303, '0', 'credit', '7780', '5000', NULL, '2021-09-10 16:19:59', '2021-09-10 16:19:59'),
(235, 'bal_txn_DtqAcLoTA9yVQWAjVwEvDqxo', 'gcash', 303, '0', 'credit', '12780', '5000', NULL, '2021-09-10 16:20:27', '2021-09-10 16:20:27'),
(236, 'MSWMjWJWCm', 'sheduled', 303, '0', 'debit', '12660', '120', NULL, '2021-09-10 16:33:10', '2021-09-10 16:33:10'),
(237, 'MmlH33jSQn', 'sheduled', 304, '0', 'debit', '1860', '210', NULL, '2021-09-10 23:50:23', '2021-09-10 23:50:23'),
(238, 'bal_txn_gd85b2mQJ9CfckQ4kJvAk5cg', 'gcash', 304, '0', 'credit', '2360', '500', NULL, '2021-09-10 23:54:27', '2021-09-10 23:54:27'),
(239, 'bal_txn_ADX9oQEXsWkVCzwA1wbPNGvr', 'gcash', 303, '0', 'credit', '13660', '1000', NULL, '2021-09-11 02:59:50', '2021-09-11 02:59:50'),
(240, 'ea9K12mYas', 'sheduled', 303, '0', 'debit', '13540', '120', NULL, '2021-09-11 02:59:59', '2021-09-11 02:59:59'),
(241, 'ehCK9WEK4g', 'sheduled', 305, '0', 'debit', '480', '0', NULL, '2021-09-11 03:49:22', '2021-09-11 03:49:22'),
(242, 'bal_txn_dQFbz2gNY9hjbDYxCDzN9ABG', 'gcash', 304, '0', 'credit', '2660', '300', NULL, '2021-09-11 09:47:23', '2021-09-11 09:47:23'),
(243, 'HzJCiZjSa6', 'sheduled', 304, '0', 'debit', '2540', '120', NULL, '2021-09-11 09:47:35', '2021-09-11 09:47:35'),
(244, 'k9lwx0tQGc', 'sheduled', 304, '0', 'debit', '2540', '0', NULL, '2021-09-12 01:00:42', '2021-09-12 01:00:42'),
(245, 'gjES5CodvO', 'sheduled', 303, '0', 'debit', '13390', '150', NULL, '2021-09-12 17:11:40', '2021-09-12 17:11:40'),
(246, 'ETEsVPVWwS', 'sheduled', 303, '0', 'debit', '13240', '150', NULL, '2021-09-13 09:34:48', '2021-09-13 09:34:48'),
(247, 'FOBX1X6p2D', 'sheduled', 303, '0', 'debit', '12790', '450', NULL, '2021-09-13 10:01:27', '2021-09-13 10:01:27'),
(248, '0aNgsezUUs', 'sheduled', 303, '0', 'debit', '12660', '130', NULL, '2021-09-13 10:31:26', '2021-09-13 10:31:26'),
(249, 'igt5aDm4Xg', 'sheduled', 303, '0', 'debit', '2930', '9730', NULL, '2021-09-15 08:53:25', '2021-09-15 08:53:25'),
(250, 'y04ELZAuKx', 'sheduled', 303, '0', 'debit', '2930', '0', NULL, '2021-09-15 09:01:19', '2021-09-15 09:01:19'),
(251, 'rHOdcMXLc3', 'sheduled', 303, '0', 'debit', '2810', '120', NULL, '2021-09-15 12:30:58', '2021-09-15 12:30:58'),
(252, 'rHOdcMXLc3', 'sheduled', 319, '0', '', '0', '0', NULL, '2021-09-15 12:30:58', '2021-09-15 12:30:58'),
(253, 'bal_txn_AMRrjx2aN4Deg9o59NYkRjfJ', 'gcash', 303, '0', 'credit', '52810', '50000', NULL, '2021-09-15 14:10:00', '2021-09-15 14:10:00'),
(254, 'LqpX5lQBI4', 'sheduled', 303, '0', 'debit', '43390', '9420', NULL, '2021-09-15 14:10:17', '2021-09-15 14:10:17'),
(255, '', '', 323, '', '', '0', '0', '', '2021-09-15 14:15:16', '2021-09-15 14:15:16'),
(256, '', '', 324, '', '', '0', '0', '', '2021-09-15 14:43:42', '2021-09-15 14:43:42'),
(257, 'bPn5Q1HIEI', 'sheduled', 303, '0', 'debit', '33650', '9740', NULL, '2021-09-15 15:41:01', '2021-09-15 15:41:01'),
(258, 'WdRneDNT8A', 'sheduled', 303, '0', 'debit', '33530', '120', NULL, '2021-09-15 16:40:32', '2021-09-15 16:40:32'),
(259, '', '', 325, '', '', '0', '0', '', '2021-09-15 16:51:53', '2021-09-15 16:51:53'),
(260, 'bal_txn_ghfL8A1S8FYjueEvamVhnJhE', 'gcash', 325, '0', 'credit', '300', '300', NULL, '2021-09-15 17:13:30', '2021-09-15 17:13:30'),
(261, 'zForyhvEQ5', 'sheduled', 325, '0', 'debit', '140', '160', NULL, '2021-09-15 17:13:48', '2021-09-15 17:13:48'),
(262, '4RQp9aMvgA', 'sheduled', 325, '0', 'debit', '140', '0', NULL, '2021-09-15 17:14:39', '2021-09-15 17:14:39'),
(263, 'RTgWRlpLfi', 'sheduled', 325, '0', 'debit', '140', '0', NULL, '2021-09-15 17:37:06', '2021-09-15 17:37:06'),
(264, 'kul6QKxHi7', 'sheduled', 304, '0', 'debit', '2540', '0', NULL, '2021-09-15 18:00:55', '2021-09-15 18:00:55'),
(265, 'O9u8ul9WAH', 'sheduled', 304, '0', 'debit', '1950', '590', NULL, '2021-09-15 18:13:02', '2021-09-15 18:13:02'),
(266, 'cbO211C7yG', 'sheduled', 304, '0', 'debit', '1950', '0', NULL, '2021-09-16 00:59:40', '2021-09-16 00:59:40'),
(267, '', '', 326, '', '', '0', '0', '', '2021-09-16 05:36:14', '2021-09-16 05:36:14'),
(268, '', '', 327, '', '', '0', '0', '', '2021-09-16 11:59:35', '2021-09-16 11:59:35'),
(269, 'Qe8CDZAK1Y', 'sheduled', 327, '0', 'debit', '0', '0', NULL, '2021-09-16 12:01:15', '2021-09-16 12:01:15'),
(270, '2oZXwlEulT', 'sheduled', 303, '0', 'debit', '33270', '260', NULL, '2021-09-16 14:34:59', '2021-09-16 14:34:59'),
(271, 'I6HvcbBSiO', 'sheduled', 303, '0', 'debit', '32990', '280', NULL, '2021-09-16 14:38:09', '2021-09-16 14:38:09'),
(272, 'H4B1UoJJt7', 'sheduled', 303, '0', 'debit', '32720', '270', NULL, '2021-09-16 14:55:43', '2021-09-16 14:55:43'),
(273, 'BcJ0ML6Kee', 'sheduled', 303, '0', 'debit', '32440', '280', NULL, '2021-09-16 15:03:27', '2021-09-16 15:03:27'),
(274, 'lBPoik2HU6', 'sheduled', 303, '0', 'debit', '32160', '280', NULL, '2021-09-16 15:15:54', '2021-09-16 15:15:54'),
(275, 'RFczRkLXHU', 'sheduled', 303, '0', 'debit', '31880', '280', NULL, '2021-09-16 15:19:19', '2021-09-16 15:19:19'),
(276, 'E3H2VS7CMP', 'sheduled', 303, '0', 'debit', '31610', '270', NULL, '2021-09-17 07:17:42', '2021-09-17 07:17:42'),
(277, 'wkphooDbP8', 'sheduled', 303, '0', 'debit', '31290', '320', NULL, '2021-09-17 09:16:28', '2021-09-17 09:16:28'),
(278, '', '', 328, '', '', '0', '0', '', '2021-09-17 11:16:56', '2021-09-17 11:16:56'),
(279, '', '', 329, '', '', '0', '0', '', '2021-09-17 11:16:56', '2021-09-17 11:16:56'),
(280, 'gtJziVFRHp', 'sheduled', 304, '0', 'debit', '1950', '0', NULL, '2021-09-17 14:23:57', '2021-09-17 14:23:57'),
(281, 'uDgBHDkyEb', 'sheduled', 303, '0', 'debit', '31020', '270', NULL, '2021-09-17 15:12:20', '2021-09-17 15:12:20'),
(282, 'G2ySeaFivU', 'sheduled', 325, '0', 'debit', '140', '0', NULL, '2021-09-17 15:32:13', '2021-09-17 15:32:13'),
(283, 'KcEcKbQuvY', 'sheduled', 325, '0', 'debit', '140', '0', NULL, '2021-09-17 15:56:22', '2021-09-17 15:56:22'),
(284, 'TJJ1gwALoF', 'sheduled', 326, '0', 'debit', '0', '0', NULL, '2021-09-17 17:18:48', '2021-09-17 17:18:48'),
(285, 'NrhxCHa4XG', 'sheduled', 326, '0', 'debit', '0', '0', NULL, '2021-09-17 17:22:16', '2021-09-17 17:22:16'),
(286, 'NrVc67QSKs', 'sheduled', 326, '0', 'debit', '0', '0', NULL, '2021-09-17 17:22:40', '2021-09-17 17:22:40'),
(287, 'H6gjsAb0TS', 'sheduled', 326, '0', 'debit', '0', '0', NULL, '2021-09-17 17:26:42', '2021-09-17 17:26:42'),
(288, '7gTvEBSLV3', 'sheduled', 303, '0', 'debit', '30870', '150', NULL, '2021-09-18 04:58:42', '2021-09-18 04:58:42'),
(289, 'OGOEN0gQxF', 'sheduled', 303, '0', 'debit', '30720', '150', NULL, '2021-09-18 05:07:27', '2021-09-18 05:07:27'),
(290, 'bal_txn_81S995FpK1UuGGWLDunv9gtQ', 'gcash', 303, '0', 'credit', '31020', '300', NULL, '2021-09-18 07:30:15', '2021-09-18 07:30:15'),
(291, '2aEtef47MF', 'sheduled', 303, '0', 'debit', '30860', '160', NULL, '2021-09-18 08:58:43', '2021-09-18 08:58:43'),
(292, 'XIe3Aa4nPG', 'sheduled', 303, '0', 'debit', '30690', '170', NULL, '2021-09-18 09:13:02', '2021-09-18 09:13:02'),
(293, '572taxsrEl', 'sheduled', 303, '0', 'debit', '30450', '240', NULL, '2021-09-18 09:17:48', '2021-09-18 09:17:48'),
(294, 'cB6dl2kOlM', 'sheduled', 303, '0', 'debit', '29890', '560', NULL, '2021-09-18 09:32:51', '2021-09-18 09:32:51'),
(295, '0eJawAysG1', 'sheduled', 303, '0', 'debit', '29320', '570', NULL, '2021-09-18 09:39:22', '2021-09-18 09:39:22'),
(296, 'z0gvljacOG', 'sheduled', 325, '0', 'debit', '140', '0', NULL, '2021-09-18 10:30:09', '2021-09-18 10:30:09'),
(297, 'zesEAciVg6', 'sheduled', 325, '0', 'debit', '140', '0', NULL, '2021-09-18 10:36:45', '2021-09-18 10:36:45'),
(298, 'z7u2XFdfGk', 'sheduled', 303, '0', 'debit', '29130', '190', NULL, '2021-09-18 10:43:28', '2021-09-18 10:43:28'),
(299, 'dzeqWd1o81', 'sheduled', 303, '0', 'debit', '27260', '1870', NULL, '2021-09-18 10:45:16', '2021-09-18 10:45:16'),
(300, 'WSRbYEBpzm', 'sheduled', 303, '0', 'debit', '26950', '310', NULL, '2021-09-18 11:24:32', '2021-09-18 11:24:32'),
(301, 'OJmBG5oaPM', 'sheduled', 303, '0', 'debit', '10550', '16400', NULL, '09/18/2021 18:10', '2021-09-18 12:40:57'),
(302, '', '', 330, '', '', '0', '0', '', '2021-09-18 18:41:08', '2021-09-18 18:41:08'),
(303, '0qfeNBUv6Z', 'sheduled', 298, '0', 'debit', '1680', '480', NULL, '09/19/2021 06:33', '2021-09-19 01:04:47'),
(304, '3kYrdXuqiA', 'sheduled', 298, '0', 'debit', '1370', '310', NULL, '09/19/2021 06:35', '2021-09-19 01:05:50'),
(305, '7RNUBRyoxh', 'sheduled', 304, '0', 'debit', '1490', '460', NULL, '09/19/2021 09:26', '2021-09-19 01:26:50'),
(306, 'bal_txn_AXbkTfHiKP38mHKzhDBGMEBE', 'gcash', 304, '0', 'credit', '2490', '1000', NULL, '2021-09-19 01:29:50', '2021-09-19 01:29:50'),
(307, '', '', 331, '', '', '0', '0', '', '2021-09-19 01:33:11', '2021-09-19 01:33:11'),
(308, 'BQDOt6N7CH', 'sheduled', 303, '0', 'debit', '10400', '150', NULL, '09/19/2021 11:17', '2021-09-19 05:51:04'),
(309, 'KtLYMdMzNy', 'sheduled', 303, '0', 'debit', '10010', '390', NULL, '09/19/2021 11:51', '2021-09-19 06:21:50'),
(310, 'bNMnjCphkU', 'sheduled', 298, '0', 'debit', '1110', '260', NULL, '09/19/2021 19:40', '2021-09-19 14:11:28'),
(311, '', '', 332, '', '', '0', '0', '', '2021-09-20 02:40:33', '2021-09-20 02:40:33'),
(312, '9CN77OODmV', 'sheduled', 304, '0', 'debit', '2030', '460', NULL, '09/20/2021 18:51', '2021-09-20 10:52:28'),
(313, 'oyuZrm9fg0', 'sheduled', 303, '0', 'debit', '9590', '420', NULL, '09/20/2021 21:31', '2021-09-20 16:01:31'),
(314, 'kXe7PyY6Fi', 'sheduled', 298, '0', 'debit', '1000', '110', NULL, '09/20/2021 21:32', '2021-09-20 16:03:15'),
(315, '7fffP6aBFS', 'sheduled', 303, '0', 'debit', '8610', '980', NULL, '09/21/2021 19:02', '2021-09-21 13:33:23'),
(316, 'KwD2mJqiAL', 'sheduled', 304, '0', 'debit', '1570', '460', NULL, '09/22/2021 01:39', '2021-09-21 17:40:21');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transaction`
--

CREATE TABLE `wallet_transaction` (
  `id` int(11) NOT NULL,
  `trans_id` varchar(255) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `deposit` decimal(7,2) DEFAULT NULL,
  `withdrawal` decimal(7,2) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `payment_mode` varchar(255) DEFAULT NULL COMMENT '''0''=>credit card, ''1''=>debit card ',
  `available_balance` decimal(7,2) DEFAULT NULL,
  `cr_dr_status` tinyint(11) DEFAULT NULL COMMENT '''0''=>credit, ''1''=>debit',
  `status` int(11) DEFAULT NULL COMMENT '''0''=>success, ''1''=>pending',
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_type`
--
ALTER TABLE `account_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `areservice`
--
ALTER TABLE `areservice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cardmaster`
--
ALTER TABLE `cardmaster`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cartmaster`
--
ALTER TABLE `cartmaster`
  ADD PRIMARY KEY (`cartid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categorymaster`
--
ALTER TABLE `categorymaster`
  ADD PRIMARY KEY (`categoryid`);

--
-- Indexes for table `chasout_request`
--
ALTER TABLE `chasout_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_all`
--
ALTER TABLE `country_all`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drivecardmaster`
--
ALTER TABLE `drivecardmaster`
  ADD PRIMARY KEY (`cardtypeid`);

--
-- Indexes for table `drivepersonaldoc`
--
ALTER TABLE `drivepersonaldoc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `driverconfiguration`
--
ALTER TABLE `driverconfiguration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `driverdecline`
--
ALTER TABLE `driverdecline`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `driver_current_location`
--
ALTER TABLE `driver_current_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `driver_otp`
--
ALTER TABLE `driver_otp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `driver_request`
--
ALTER TABLE `driver_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `driver_vehicle`
--
ALTER TABLE `driver_vehicle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `driver_wallet`
--
ALTER TABLE `driver_wallet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `driveuser`
--
ALTER TABLE `driveuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `mobile` (`mobile`);

--
-- Indexes for table `driveusernotification`
--
ALTER TABLE `driveusernotification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `driveuserrating`
--
ALTER TABLE `driveuserrating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `driveuserreview`
--
ALTER TABLE `driveuserreview`
  ADD PRIMARY KEY (`reviewid`);

--
-- Indexes for table `durapickupshedule`
--
ALTER TABLE `durapickupshedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `durapickup_services`
--
ALTER TABLE `durapickup_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dura_services_type`
--
ALTER TABLE `dura_services_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emailconfiguration`
--
ALTER TABLE `emailconfiguration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ewallet_recharge`
--
ALTER TABLE `ewallet_recharge`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_setting`
--
ALTER TABLE `general_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `issafe`
--
ALTER TABLE `issafe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leadappointment`
--
ALTER TABLE `leadappointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marketplace`
--
ALTER TABLE `marketplace`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_setting`
--
ALTER TABLE `notification_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offer`
--
ALTER TABLE `offer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offeraction`
--
ALTER TABLE `offeraction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordermaster`
--
ALTER TABLE `ordermaster`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_manage`
--
ALTER TABLE `order_manage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pickup_stoplocation`
--
ALTER TABLE `pickup_stoplocation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pricecard`
--
ALTER TABLE `pricecard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pricecards`
--
ALTER TABLE `pricecards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_gallery`
--
ALTER TABLE `product_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promocode`
--
ALTER TABLE `promocode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reference_codemaster`
--
ALTER TABLE `reference_codemaster`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refer_code`
--
ALTER TABLE `refer_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search_driver`
--
ALTER TABLE `search_driver`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_area`
--
ALTER TABLE `service_area`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shedulecancel`
--
ALTER TABLE `shedulecancel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `styles`
--
ALTER TABLE `styles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipprice`
--
ALTER TABLE `tipprice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units_measurement`
--
ALTER TABLE `units_measurement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `useraddress`
--
ALTER TABLE `useraddress`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userdocument`
--
ALTER TABLE `userdocument`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_otp`
--
ALTER TABLE `users_otp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_card`
--
ALTER TABLE `user_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_rating_review`
--
ALTER TABLE `user_rating_review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_make`
--
ALTER TABLE `vehicle_make`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_model`
--
ALTER TABLE `vehicle_model`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_type`
--
ALTER TABLE `vehicle_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallerpackage`
--
ALTER TABLE `wallerpackage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_recharge`
--
ALTER TABLE `wallet_recharge`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_transaction`
--
ALTER TABLE `wallet_transaction`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_type`
--
ALTER TABLE `account_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `areservice`
--
ALTER TABLE `areservice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `chasout_request`
--
ALTER TABLE `chasout_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1637;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `drivepersonaldoc`
--
ALTER TABLE `drivepersonaldoc`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `driverconfiguration`
--
ALTER TABLE `driverconfiguration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `driverdecline`
--
ALTER TABLE `driverdecline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `driver_current_location`
--
ALTER TABLE `driver_current_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `driver_otp`
--
ALTER TABLE `driver_otp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `driver_request`
--
ALTER TABLE `driver_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `driver_vehicle`
--
ALTER TABLE `driver_vehicle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `driver_wallet`
--
ALTER TABLE `driver_wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `driveuser`
--
ALTER TABLE `driveuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `driveuserrating`
--
ALTER TABLE `driveuserrating`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `durapickupshedule`
--
ALTER TABLE `durapickupshedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;

--
-- AUTO_INCREMENT for table `durapickup_services`
--
ALTER TABLE `durapickup_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=306;

--
-- AUTO_INCREMENT for table `dura_services_type`
--
ALTER TABLE `dura_services_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `emailconfiguration`
--
ALTER TABLE `emailconfiguration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ewallet_recharge`
--
ALTER TABLE `ewallet_recharge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `general_setting`
--
ALTER TABLE `general_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issafe`
--
ALTER TABLE `issafe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `leadappointment`
--
ALTER TABLE `leadappointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `manager`
--
ALTER TABLE `manager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `marketplace`
--
ALTER TABLE `marketplace`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT for table `notification_setting`
--
ALTER TABLE `notification_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `offer`
--
ALTER TABLE `offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `offeraction`
--
ALTER TABLE `offeraction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ordermaster`
--
ALTER TABLE `ordermaster`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_manage`
--
ALTER TABLE `order_manage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pickup_stoplocation`
--
ALTER TABLE `pickup_stoplocation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `pricecard`
--
ALTER TABLE `pricecard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pricecards`
--
ALTER TABLE `pricecards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=823;

--
-- AUTO_INCREMENT for table `product_gallery`
--
ALTER TABLE `product_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=844;

--
-- AUTO_INCREMENT for table `promocode`
--
ALTER TABLE `promocode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `reference_codemaster`
--
ALTER TABLE `reference_codemaster`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `search_driver`
--
ALTER TABLE `search_driver`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2550;

--
-- AUTO_INCREMENT for table `service_area`
--
ALTER TABLE `service_area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `shedulecancel`
--
ALTER TABLE `shedulecancel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `styles`
--
ALTER TABLE `styles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tipprice`
--
ALTER TABLE `tipprice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `units_measurement`
--
ALTER TABLE `units_measurement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `useraddress`
--
ALTER TABLE `useraddress`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `userdocument`
--
ALTER TABLE `userdocument`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=333;

--
-- AUTO_INCREMENT for table `users_otp`
--
ALTER TABLE `users_otp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=913;

--
-- AUTO_INCREMENT for table `user_card`
--
ALTER TABLE `user_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `user_rating_review`
--
ALTER TABLE `user_rating_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `vehicle_make`
--
ALTER TABLE `vehicle_make`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `vehicle_model`
--
ALTER TABLE `vehicle_model`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vehicle_type`
--
ALTER TABLE `vehicle_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wallerpackage`
--
ALTER TABLE `wallerpackage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wallet_recharge`
--
ALTER TABLE `wallet_recharge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=317;

--
-- AUTO_INCREMENT for table `wallet_transaction`
--
ALTER TABLE `wallet_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
