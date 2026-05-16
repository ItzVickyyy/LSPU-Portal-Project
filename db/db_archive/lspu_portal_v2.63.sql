-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2026 at 05:27 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lspu_portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `first_name` varchar(80) NOT NULL,
  `last_name` varchar(80) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `email`, `password_hash`, `first_name`, `last_name`, `status`, `created_at`) VALUES
(1, 'admin@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Civ', 'John Nhoj', 'Active', '2026-05-07 09:20:16');

-- --------------------------------------------------------

--
-- Table structure for table `admission_info`
--

CREATE TABLE `admission_info` (
  `id` int(10) UNSIGNED NOT NULL,
  `applicant_id` int(10) UNSIGNED NOT NULL,
  `campus` enum('Sta Cruz Campus','Siniloan Campus','San Pablo Campus','Los Banos Campus') NOT NULL,
  `student_type` enum('College','GSaR','Post Graduate') NOT NULL,
  `year_level` enum('1st Year','2nd Year','3rd Year','4th Year','5th Year') NOT NULL,
  `admission_type` varchar(80) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admission_info`
--

INSERT INTO `admission_info` (`id`, `applicant_id`, `campus`, `student_type`, `year_level`, `admission_type`, `created_at`, `updated_at`) VALUES
(1, 1, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(2, 2, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(3, 3, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(4, 4, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(5, 5, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(6, 6, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(7, 7, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(8, 8, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(9, 9, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(10, 10, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(11, 11, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(12, 12, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(13, 13, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(14, 14, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(15, 15, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(16, 16, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(17, 17, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(18, 18, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(19, 19, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(20, 20, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(21, 21, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(22, 22, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(23, 23, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(24, 24, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(25, 25, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(26, 26, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(27, 27, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(28, 28, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(29, 29, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(30, 30, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(31, 31, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(32, 32, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(33, 33, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(34, 34, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(35, 35, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(36, 36, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(37, 37, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(38, 38, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(39, 39, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(40, 40, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(41, 41, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(42, 42, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(43, 43, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(44, 44, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(45, 45, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(46, 46, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(47, 47, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(48, 48, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(49, 49, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(50, 50, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(51, 51, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(52, 52, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(53, 53, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(54, 54, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(55, 55, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(56, 56, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(57, 57, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(58, 58, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(59, 59, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(60, 60, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(61, 61, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(62, 62, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(63, 63, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(64, 64, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(65, 65, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(66, 66, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(67, 67, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(68, 68, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(69, 69, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(70, 70, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(71, 71, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(72, 72, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(73, 73, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(74, 74, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(75, 75, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(76, 76, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(77, 77, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(78, 78, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(79, 79, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(80, 80, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(81, 81, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(82, 82, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(83, 83, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(84, 84, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(85, 85, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(86, 86, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(87, 87, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(88, 88, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(89, 89, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(90, 90, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(91, 91, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(92, 92, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(93, 93, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(94, 94, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(95, 95, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(96, 96, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(97, 97, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(98, 98, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(99, 99, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(100, 100, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(101, 101, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(102, 102, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(103, 103, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(104, 104, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(105, 105, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(106, 106, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(107, 107, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(108, 108, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(109, 109, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(110, 110, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(111, 111, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(112, 112, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(113, 113, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(114, 258, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(115, 259, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(116, 260, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(117, 261, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(118, 262, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(119, 263, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(120, 264, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(121, 265, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(122, 266, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(123, 267, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(124, 268, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(125, 269, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(126, 270, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(127, 271, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(128, 272, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(129, 273, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(130, 274, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(131, 275, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(132, 276, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(133, 277, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(134, 278, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(135, 279, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(136, 280, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(137, 281, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(138, 282, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(139, 283, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(140, 284, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(141, 285, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(142, 286, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(143, 287, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(144, 288, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(145, 289, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(146, 290, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(147, 291, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(148, 292, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(149, 293, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(150, 294, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(151, 295, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(152, 296, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(153, 297, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(154, 298, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(155, 299, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(156, 300, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(157, 301, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(158, 302, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(159, 303, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(160, 304, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(161, 305, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(162, 306, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(163, 307, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(164, 308, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(165, 309, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(166, 310, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(167, 311, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(168, 312, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(169, 313, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(170, 314, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(171, 315, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(172, 316, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(173, 317, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(174, 318, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(175, 319, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(176, 320, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(177, 321, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(178, 322, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(179, 323, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(180, 324, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(181, 325, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(182, 326, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(183, 327, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(184, 328, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(185, 329, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(186, 330, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(187, 331, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(188, 332, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(189, 333, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(190, 334, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(191, 335, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(192, 336, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(193, 337, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(194, 338, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(195, 339, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(196, 340, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(197, 341, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(198, 342, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(199, 343, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(200, 344, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(201, 345, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(202, 346, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(203, 347, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(204, 348, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(205, 349, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(206, 350, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(207, 351, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(208, 352, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(209, 353, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(210, 354, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(211, 355, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(212, 356, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(213, 357, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(214, 358, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(215, 359, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(216, 360, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(217, 361, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(218, 362, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(219, 363, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(220, 364, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(221, 365, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(222, 366, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(223, 367, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(224, 368, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(225, 369, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(226, 370, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(227, 371, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(228, 372, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(229, 373, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(230, 374, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(231, 375, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(232, 376, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(233, 377, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(234, 378, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(235, 379, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(236, 380, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(237, 381, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(238, 382, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(239, 383, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(240, 384, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(241, 385, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(242, 386, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(243, 387, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(244, 388, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(245, 389, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(246, 390, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(247, 391, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(248, 392, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(249, 393, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(250, 394, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(251, 395, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(252, 396, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(254, 398, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(255, 399, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(256, 169, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-07 07:40:16', '2026-05-07 07:40:16'),
(257, 114, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(258, 118, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(259, 119, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(260, 120, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(261, 121, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(262, 122, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(263, 123, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(264, 124, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(265, 125, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(266, 126, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(267, 127, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(268, 128, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(269, 129, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(270, 130, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(271, 131, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(272, 132, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(273, 133, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(274, 134, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(275, 135, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(276, 136, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(277, 137, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(278, 138, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(279, 139, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(280, 140, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(281, 141, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(282, 142, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(283, 143, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(284, 144, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(285, 145, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(286, 146, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(287, 147, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(288, 148, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(289, 149, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(290, 150, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(291, 151, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(292, 152, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(293, 153, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(294, 154, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(295, 155, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(296, 156, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(297, 157, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(298, 158, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(299, 159, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(300, 160, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(301, 161, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(302, 162, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(303, 163, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(304, 164, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(305, 165, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(306, 166, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(307, 167, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(308, 168, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(309, 170, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(310, 171, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(311, 172, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(312, 115, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(313, 116, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(314, 117, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(315, 173, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(316, 174, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(317, 175, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(318, 176, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(319, 177, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(320, 178, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(321, 179, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(322, 180, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(323, 181, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(324, 182, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(325, 183, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(326, 184, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(327, 185, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(328, 186, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(329, 187, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(330, 188, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(331, 189, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(332, 190, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(333, 191, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(334, 192, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(335, 193, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(336, 194, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(337, 195, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(338, 196, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(339, 197, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(340, 198, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(341, 199, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(342, 200, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(343, 201, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(344, 202, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(345, 203, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(346, 204, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(347, 205, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(348, 206, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(349, 207, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(350, 208, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(351, 209, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(352, 210, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(353, 211, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(354, 212, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(355, 213, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(356, 214, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:29', '2026-05-10 12:07:29'),
(357, 215, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(358, 216, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(359, 217, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(360, 218, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(361, 219, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(362, 220, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(363, 221, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(364, 222, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(365, 223, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(366, 224, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(367, 225, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(368, 226, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(369, 227, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(370, 228, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(371, 229, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(372, 230, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(373, 231, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(374, 232, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(375, 233, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(376, 234, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(377, 235, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(378, 236, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(379, 237, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(380, 238, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(381, 239, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(382, 240, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(383, 241, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(384, 242, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(385, 243, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(386, 244, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(387, 245, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(388, 246, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(389, 247, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(390, 248, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(391, 249, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(392, 250, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(393, 251, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(394, 252, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(395, 253, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(396, 254, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(397, 255, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(398, 256, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(399, 257, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-10 12:07:30', '2026-05-10 12:07:30');

-- --------------------------------------------------------

--
-- Table structure for table `applicants`
--

CREATE TABLE `applicants` (
  `id` int(10) UNSIGNED NOT NULL,
  `Email` varchar(180) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `application_status` enum('Pending','Draft','Submitted','Enrolled','Rejected') NOT NULL DEFAULT 'Pending',
  `First_Name` varchar(80) NOT NULL,
  `Middle_Name` varchar(80) DEFAULT NULL,
  `Last_Name` varchar(80) NOT NULL,
  `Suffix` varchar(20) DEFAULT NULL,
  `Birthday` date DEFAULT NULL,
  `Birth_Place` varchar(120) DEFAULT NULL,
  `Citizenship` varchar(80) DEFAULT NULL,
  `Sex` enum('Male','Female') DEFAULT NULL,
  `Civil_Status` enum('Single','Married','Widowed') DEFAULT NULL,
  `Religion` varchar(80) DEFAULT NULL,
  `Disability` varchar(120) DEFAULT NULL,
  `First_Generation_Student` enum('Yes','No') DEFAULT NULL,
  `Contact_Number` varchar(15) DEFAULT NULL,
  `Landline_Number` varchar(20) DEFAULT NULL,
  `House_Number` varchar(20) DEFAULT NULL,
  `Street` varchar(100) DEFAULT NULL,
  `Barangay` varchar(80) DEFAULT NULL,
  `Municipality` varchar(80) DEFAULT NULL,
  `Province` varchar(80) DEFAULT NULL,
  `Zip_Code` varchar(10) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `applicants`
--

INSERT INTO `applicants` (`id`, `Email`, `password_hash`, `application_status`, `First_Name`, `Middle_Name`, `Last_Name`, `Suffix`, `Birthday`, `Birth_Place`, `Citizenship`, `Sex`, `Civil_Status`, `Religion`, `Disability`, `First_Generation_Student`, `Contact_Number`, `Landline_Number`, `House_Number`, `Street`, `Barangay`, `Municipality`, `Province`, `Zip_Code`, `created_at`, `updated_at`) VALUES
(1, 'janiellanodo7@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Janiella', 'N.', 'Nodo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(2, 'vtressenanne@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Tressen Anne', 'M.', 'Valdez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(3, 'isntthiszoe@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jan', 'Salvador', 'Terania', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(4, 'jasmine.roque0707@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jasmine Quintina', 'L.', 'Roque', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(5, 'eli.calinga@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Mary Elisse Cyminette', NULL, 'Calinga', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(6, 'annamariequilloy36@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Anna Marie', 'R.', 'Quilloy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(7, 'lampasaraiza@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Raiza Mae', 'Q.', 'Lampasa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(8, 'cedrickeusebio4@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Cedrick', 'A.', 'Eusebio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(9, 'johnromeldaculong@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'John Romel', 'L.', 'Daculong', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(10, 'darumvincentlance@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Lance Vincent', 'U.', 'Darum', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(11, 'jahredlapiz20@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'John Jahred', 'L.', 'Lapiz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(12, 'alecxiscyrusgarcia@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Alecxis Cyrus', 'M.', 'Garcia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(13, 'yakitmarkangelo0@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Mark Angelo', 'C.', 'Yakit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(14, 'luigisebastianbautista@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Luigi Sebastian', 'I.', 'Bautista', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(15, 'ginovargas2007@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Gino', NULL, 'Vargas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(16, 'tagleenricoh@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Joseph', 'Enricoh', 'Tagle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(17, 'jedeleon0719@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'John Ezequiel DL.', NULL, 'Vasquez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(18, 'joshuaescobido777@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Elvis Joshua', 'V.', 'Escobido', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(19, 'alejandroalexamarie@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Alexa Marie', 'D.', 'Alejandro', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(20, 'arniearabis@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Arnie Angelie', 'F.', 'Arabis', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(21, 'jhecileedeluna12@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jhecilee I. De', NULL, 'Luna', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(22, 'brandon.lance.b.ruiz@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Brandon Lance', 'B.', 'Ruiz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(23, 'aldrich.danieles15@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Aldrich', 'B.', 'Danieles', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(24, 'owenjedoruga@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jed Owen', 'D.', 'Oruga', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(25, 'blancojohnrussel@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'John Russel', 'A.', 'Blanco', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(26, 'marrianecampaner@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Marriane Angel', 'B.', 'Campaner', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(27, 'delasoledadenrique08@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Enrique D. Dela', NULL, 'Soledad', 'Jr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(28, 'andrewartiflores@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Andrew', 'A.', 'Flores', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(29, 'paulllanes23@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Paul', 'M.', 'Llanes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(30, 'jerumundia18@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jerusalyn', 'D.', 'Mundia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(31, 'ocampoprincess0219@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Princess', 'C.', 'Ocampo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(32, 'rosalescarl20@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Carl Joseph', 'E.', 'Rosales', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(33, 'sanvalentinjhonpaul42@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jhon Paul', 'B.', 'Sanvalentin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(34, 'sanchezluigie@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Luigie', 'G.', 'Sanchez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(35, 'johncarlosojor2@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'John Carlo', 'M.', 'Sojor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(36, 'danieltejadaoctober@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Daniel', 'F.', 'Tejada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(37, 'undadilauren13@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Lauren', 'M.', 'Undadi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(38, 'lanceedwinmarquezmaligaya@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Lance Edwin', 'M.', 'Maligaya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(39, 'sampereketsu1@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Karl Michael', 'E.', 'Bautista', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(40, 'hermiekadacallos@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Hermie', NULL, 'Dacallos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(41, 'palisron339@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Ron', NULL, 'Palis', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(42, 'shanebcld@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Irah Shane', 'P.', 'Bacolod', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(43, 'justinnatal01@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Justine', 'M.', 'Natal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(44, 'eyrianbarayang@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Crislien Ariane', 'S.', 'Barayang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(45, 'jiancaraitm23@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jian Carl', 'C.', 'Malihan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(46, 'vkhimharvy@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Khim Harvy', 'C.', 'Villamayor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(47, 'gianbotones05@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Giancarlo', 'G.', 'Botones', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(48, 'vashty.bacorro@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Vashty', 'J.', 'Bacorro', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(49, 'miccahella04@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Maria Princessa Miccahella', 'M.', 'Mamaril', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(50, 'juuzuodesu@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jasper', 'M.', 'Gonzales', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(51, 'azegonzales015@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jeza', 'M.', 'Gonzales', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(52, 'ronnelasinas75@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Ronnel', 'E.', 'Asinas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(53, 'prafaellouise@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Rafael Louise', 'R.', 'Perez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(54, 'macalengjm@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jose Mari Elliflor', 'J.', 'Macaleng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(55, 'kennethpunla62@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Kenneth', 'Z.', 'Punla', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 19:15:18'),
(56, 'esplanam60@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Mark Philip', 'L.', 'Esplana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(57, 'neilmatthewcarandang@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Neil Matthew', 'B.', 'Carandang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(58, 'arwilmartinsparaisoo@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Arwil Martin', 'S.', 'Paraiso', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(59, 'bigtasqueenlee05@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Queen Lee', 'L.', 'Bigtas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(60, 'troy300otfgbg@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'French', 'P.', 'Cuadoro', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(61, 'malabanancharlesamiel@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Charles Amiel', 'A.', 'Malabanan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(62, 'rjay25.dollesin@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Raymond Jay', 'C.', 'Dollesin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(63, 'lspulyxdilla@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Lyx Lamuel', 'B.', 'Dilla', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(64, 'carlteezy03@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Carl Aaron', 'H.', 'Garcia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(65, 'ejdelosreyes36@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jose Enrique Delos', NULL, 'Reyes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(66, 'arabellazyja.sevilla@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Arabella Zyja', 'B.', 'SevillA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(67, 'ksaurelspulb@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Kate', 'C.', 'Saure', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(68, 'zparcon.lspulb@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Zyke', 'Ghabriel', 'Parcon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(69, 'christianortiz.school@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Christian', 'P.', 'Ortiz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(70, 'magatmichael52@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Michael Reiner', 'A.', 'Magat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(71, 'rheiearl@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Rhei Earlson', 'T.', 'Malatag', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(72, 'cjsanchez1402@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Czarina Joy', 'L.', 'Sanchez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(73, 'mchlllabajo@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Michelle', 'B.', 'Labajo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(74, 'gwyneth.erasga@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Miguelit Gwyneth', 'S.', 'Erasga', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(75, 'jearlygavilan@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jearly Mae', 'C.', 'Gavilan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(76, 'ricahmaeee@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Ricah Mae', 'P.', 'Boctot', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(77, 'jeivmicron20@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jeiv Micron', 'A.', 'Roaquin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(78, 'palisoccleid@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Cleid Eduard', 'I.', 'Palisoc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(79, 'captainconehead10@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Emiel John', 'G.', 'Salangsang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(80, 'bilanj159@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'John Rodgerson', 'D.', 'Bilan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(81, 'kylietejada1211@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Kylie', 'P.', 'Tejada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(82, 'student.04233359@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jieshiel Kei', 'L.', 'Alvarado', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(83, 'iangonzalez1710@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Christian', 'D.', 'Gonzalez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(84, 'codeangelica1.0@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Angelica', 'Joyce', 'Fernandez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(85, 'cazter016@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Cazter Troy', 'R.', 'Murad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(86, 'banasihansarahmae@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Sarah Mae', 'C.', 'Banasihan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(87, 'camachozarah01@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Zarah Mae', 'B.', 'Camacho', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(88, 'caspillomateuz36@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Mateuz Andrei', 'T.', 'Caspillo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(89, 'moradamargiedale34@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Margiedale Ann', 'M.', 'Morada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(90, 'amparo.popoy@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Randy', 'T.', 'Amparo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(91, 'german.banasihan@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'German Gian', 'V.', 'Banasihan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(92, 'student.04233707@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Amiel Isaac', 'V.', 'Solmerano', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(93, 'student.04250363@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Nathaniel', NULL, 'Aguilar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(94, 'anezanthony2521@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Anthony', NULL, 'Anez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(95, 'johnasherpr3tzel@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'John', 'Asher Anthony L', 'Angeles', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(96, 'angagaomerham745@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Merham', NULL, 'Angagao', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(97, 'seiferaquino@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Seifer', NULL, 'Aquino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(98, 'carlozemmanuel01@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Carlos', 'Emmanuel', 'Bailon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(99, 'chardjonbago2026@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Chard', 'Jon T.', 'Bag-o', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(100, 'jashleianngonzales@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jashlei', 'Ann', 'Bautista', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(101, 'zivkayampalisoc@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Ziv', 'Kayam P.', 'Bautista', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(102, 'cwbonador@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Carl', 'Wilson O.', 'Bonador', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(103, 'borregajonamae@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jona', 'Mei', 'Borrega', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(104, 'kenethanrimandoceballo@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Ken Ethan', 'R.', 'Ceballo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(105, 'student.04250367@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Gishlain', 'R.', 'Carpio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(106, 'ntndelprado@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Antonio', 'Luis V.', 'Del Prado', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(107, 'philixnashleyebron@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Philix', 'Nashley P.', 'Ebron', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(108, 'johnstevenerasga@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'John', 'Steven C.', 'Erasga', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(109, 'markgatil06@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Mark', NULL, 'Gatil', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(110, 'student.04240493@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Olsen', NULL, 'Hipolito', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(111, 'labajoreginald69@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Reginald', 'B.', 'Labajo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(112, 'johnarviemadriaga13@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'John', 'Arvie D.', 'Madriaga', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(113, 'student.04250393@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Katherine', NULL, 'Magpantay', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(114, 'manaigsamuelboris@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Samuel', 'Boris A.', 'Manaig', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(115, 'student.04250316@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Johannes', NULL, 'Naredo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(116, 'student.04250372@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jhuniel', NULL, 'Pascual', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(117, 'student.04250366@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Christian', 'Arvy', 'Pillante', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(118, 'marabbypenarubia041107@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Abby', 'Marjery P.', 'Peñarubia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(119, 'yjamimmanuel03@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Yjam', 'Immanuel P.', 'Plantilla', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(120, 'paeng11.quilloy11@icloud.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Marc', 'Rafael S.', 'Quilloy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(121, 'salameroroannefaye340@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Roanne', 'Faye M.', 'Salamero', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(122, 'simonsanvalentin6@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Simon', 'T.', 'San Valentin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(123, 'risamgelotakahashi@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Risam', 'Angelo E.', 'Takahashi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(124, 'shaytandang@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Cyrelle', 'B.', 'Tandang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(125, 'urciajohncarlo477@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Urcia John Carlo', NULL, 'D.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(126, 'vergarakristopher25@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Kristopher', 'P.', 'Vergara', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(127, 'zayascj13@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Cyrus', 'James A.', 'Zayas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(128, 'ken17gecale@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Kenneth', 'T.', 'Gecale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(129, 'villanuevakheeno@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Kheeno', 'C.', 'Villanueva', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(130, 'decastroangelo32@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Angelo Kyle V. De', NULL, 'Castro', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(131, 'inamilazuli@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Kate Marie', 'H.', 'Contado', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(132, 'jmcenteno0311@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'John Mhedrick', 'C.', 'Escobin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(133, 'gayahanalberttejynelle@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Albertte Jynelle', 'M.', 'Gayahan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(134, 'godosuguitan@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Godofredo III', 'T.', 'Suguitan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(135, 'johncyrusmariano65@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'John Cyrus', 'C.', 'Mariano', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(136, 'christopertien465@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Christoper', 'V.', 'Tien', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(137, 'gragastessa3@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Tessa', NULL, 'Gragas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(138, 'johnrosstagum10@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'John Ross', 'R.', 'Tagum', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(139, 'etiennemari.orilla@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Etienne', 'Mari', 'Orilla', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(140, 'vivienjoycepermejo@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Vivien', 'Joyce', 'Permejo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(141, 'sophiayvoneborromeo@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Sophia', 'Yvone', 'Pillas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(142, 'mainesdrick@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Drick Zymon', 'M.', 'Maines', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(143, 'johncarlomangampo11@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'John Carlo', 'C.', 'Mangampo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(144, 'cdtan98@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Christian Daniel', 'D.', 'Tan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(145, 'pagnejeff0213@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jeffrey', 'F.', 'Pagne', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(146, 'kimberlyespitiu85@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Kimberly', NULL, 'Espiritu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(147, 'noreenanez82@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Noreen', 'D.', 'Añez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(148, 'edwardnatal9@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Edward', NULL, 'Natal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(149, 'islavincent83@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Vincent Nicolas', 'G.', 'Isla', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(150, 'jirehb.quiamno@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jireh', NULL, 'Quiamno', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(151, 'ppaezpauline07@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Pauline', 'O.', 'Paez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(152, 'kelvinnabia@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Kelvin', 'N.', 'Agar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(153, 'patricktandang696@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Patrick', 'E.', 'Tandang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(154, 'thirdyagustin123@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Solano', 'G.', 'Agustin', 'III', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(155, 'aledadrionalcachupas@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Aled Adrion', 'S.', 'Alcachupas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(156, 'khervieamasan@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Khervie', 'B.', 'Amasan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(157, 'caiiiii.aquino@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Cailyn', 'G.', 'Aquino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(158, 'bacorrodarren07@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Darren', 'P.', 'Bacorro', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(159, 'cjaybanasihan4@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Cjay', 'R.', 'Banasihan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(160, 'biancakim.bondoc@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Bianca Kim', 'H.', 'Bondoc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(161, 'euneel75@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'John Euneel', 'B.', 'Dacir', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(162, 'shaneashleydaet@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Shane Ashley', 'B.', 'Daet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(163, 'ashlheagayland@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Sittie Ashlhea', 'G.', 'Datuimam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(164, 'deverakurt0207@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Charlie Kurt I De', NULL, 'Vera', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(165, 'mjamesescobin@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Marc James', 'P.', 'Escobin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(166, 'bradd396@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Bradd Geizler', 'M.', 'Eusebio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(167, 'shawnjobli17@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Shawn Kennth', 'B.', 'Jobli', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(168, 'tmlantican06@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Trisha Mae', 'D.', 'Lantican', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(169, 'darzellapitan@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Darzel Marie', 'H.', 'Lapitan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(170, 'rayvermacapagal17@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Rayver', 'V.', 'Macapagal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(171, 'gianmac2007@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Gian Brixz', 'A.', 'Macatangay', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(172, 'madeloj822@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Justine', 'L.', 'Madelo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08');
INSERT INTO `applicants` (`id`, `Email`, `password_hash`, `application_status`, `First_Name`, `Middle_Name`, `Last_Name`, `Suffix`, `Birthday`, `Birth_Place`, `Citizenship`, `Sex`, `Civil_Status`, `Religion`, `Disability`, `First_Generation_Student`, `Contact_Number`, `Landline_Number`, `House_Number`, `Street`, `Barangay`, `Municipality`, `Province`, `Zip_Code`, `created_at`, `updated_at`) VALUES
(173, 'rainemagundayao@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Raine', 'G.', 'Magundayao', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(174, 'patrickangelomanese@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Patrick Angelo', 'C', 'Manese', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(175, 'ravennabia3@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Raven', 'M.', 'Nabia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(176, 'julianoracion08@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Julian', 'D.', 'Oracion', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(177, 'santillanchristinedenise@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Christine Denise', 'A.', 'Santillan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(178, 'ianjay.servallos05@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Ian Jay', 'L.', 'Servallos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(179, 'suamenjustine2005@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Justine', 'T.', 'Suamen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(180, 'johniansubiaga@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'John Ian', 'P.', 'Subiaga', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(181, 'justinmarkmelchor@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Justin Mark', 'A.', 'Melchor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(182, 'jaraplasanmichael170@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Michael', 'S.', 'Jaraplasan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(183, 'acasokim11@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Kim Charles', 'G.', 'Acaso', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(184, 'kimchestere@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Kim', 'Chester', 'Eclarinal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(185, 'jeanmervinfajardo@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jean Mervin', 'G.', 'Fajardo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(186, 'joshualapie22@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Joshua', 'A.', 'Lapie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(187, 'matthewbanasihan421@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Matthew', 'M.', 'Banasihan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(188, 'vaunghclassifiedemail@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Vaungh Louie Andrey', 'P.', 'Lat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(189, 'leanmagbanua1@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Alejandro IV', 'B.', 'Magbanua', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(190, 'justinreboton98@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Justin Adrian', 'P.', 'Reboton', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(191, 'jahremdizon191@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jahrem', 'M.', 'Dizon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(192, 'nicolecarpena917@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Nicole', 'P.', 'Carpena', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(193, 'accacharles425@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Charles Allen', 'B.', 'Nuñez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(194, 'kurtlindon.bariuan996@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Kurt Lindon', 'M.', 'Bariuan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(195, 'eismamuhaimin@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Muhaimin', 'E.', 'Abdurahman', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(196, 'pamulaklakinzoren2@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Zorine Ivan', 'D.', 'Pamulaklakin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(197, 'athren.banasihan@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Athren', 'M.', 'Banasihan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(198, 'andreivegetables@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Julius Andrei', 'P.', 'Gulay', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(199, 'hrnndzjsrfl24@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jose Rafael', 'A.', 'Hernandez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(200, 'pjgundayao17@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Paul Jonathan', 'G.', 'Gundayao', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(201, 'nkdxvn@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Kind Mighty', 'P.', 'Genayas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(202, 'adrianpadilla8296@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Adrian', 'F.', 'Padilla', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(203, 'johnsalen13@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Vic John', 'O.', 'Salen', 'Jr.', '2005-10-13', 'Bay, Laguna', 'Filipino', 'Male', 'Single', NULL, NULL, 'No', '0991833309', NULL, '12782', 'J. Aquino', 'Mayondon', 'Los Baños', 'Laguna', '4030', '2026-05-10 10:43:23', '2026-05-10 19:29:15'),
(204, 'seguerarosalie1@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Rosalie', 'B.', 'Seguera', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(205, 'dietherlaforteza@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Gife Diether Paul', 'G.', 'Laforteza', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(206, 'bancajames30@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'JAMES', 'VINCENT I.', 'BANCA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(207, 'lukeishel09@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Luke', 'Ishel', 'Antonio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(208, 'charlsmacapalan255@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Charls', 'G.', 'Macapalan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(209, 'tk.caracuel023@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Tristan Kim', 'C.', 'Caracuel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(210, 'shnshlyctpng@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Shaine', 'Ashley', 'Catapang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(211, 'cyrusvhon1233@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Cyrus Vhon', 'S.', 'Obog', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(212, 'munozrayhen@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Rayvhen', 'P.', 'Muñoz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(213, 'isaiahhadap16@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Isaiah Ranel', 'G.', 'Hadap', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(214, 'ezekielranelhadap@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Ezekiel Ranel', 'G.', 'Hadap', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(215, 'belga.ramoskristineo@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Kristine', 'R.', 'Belga', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(216, 'johnvincentallovida04@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'John Vincent', 'F.', 'Allovida', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(217, 'rahnelbagongon@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Rahnel', 'V.', 'Bagongon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(218, 'nelmanalastas04@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Leonel', 'J.', 'Manalastas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(219, 'garciajayson2004@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jayson', 'R.', 'Garcia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(220, 'aguilarcasely@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Casely', 'L.', 'Aguilar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(221, 'kylestephentandang69@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Kyle Stephen', 'L.', 'Tandang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(222, 'marielorainneaquino091503@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Marie Lorainne', 'H.', 'Aquino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(223, 'jesraelcaranza2@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jesrael', 'S.', 'Caranza', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(224, 'marcojayreyes98@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Marco Jay', 'V.', 'Reyes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(225, 'angelodlvg2005@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Angelo', 'Dela', 'Vega', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(226, 'riddikdeleon62@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Riddik', 'De', 'Leon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(227, 'student.04240179@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Nile', 'B', 'Torres', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(228, 'arcebuchejohnashley@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'John Ashley Sorio', NULL, 'Archebuche', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(229, 'nicolejazminelspu@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Nicole jazmine', 'B.', 'Layosa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(230, 'student.04240388@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Cyril', 'Lopena', 'Sumipo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(231, 'raffygepilgon29@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Raffy', NULL, 'Gepilgon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(232, 'jesicapaulinedeclaro12@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jesica Pauline A. De', NULL, 'Claro', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(233, 'perollykaanne23@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Lyka Anne', 'S.', 'Perol', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(234, 'dexterdrio18@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Dexter', 'M.', 'Drio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(235, 'almartinlacambra68@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Almartin', 'T.', 'Lacambra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(236, 'gerlynsalamero@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Gerlyn Mae', 'M.', 'Salamero', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(237, 'johnjeryasis@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'John Jery', 'E.', 'Asis', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(238, 'jilliansoriano071@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jillian', 'P.', 'Soriano', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(239, 'duranjames574@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'James Carlo', 'C.', 'Duran', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(240, 'kinoulala607@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Justin Rain', 'C.', 'Aquino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(241, 'kurtian267@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Kurt Ian', 'L.', 'Enriquez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(242, 'kenbello35@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jeff', 'Chent', 'Bello', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(243, 'rencemagpantay005@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Mike Laurence', 'P.', 'Magpantay', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(244, 'jmdeguzman185@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'John Michael P. De', NULL, 'Guzman', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(245, 'aquinoalexandrei36@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Alexandrei Joshua', 'A.', 'Gayahan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(246, 'student.04240467@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Uno Zander', 'A.', 'Ventura', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(247, 'neiljohnsonestabillo6@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Neil Johnson', 'J.', 'Estabillo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(248, 'gabzeuspadilla@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Gabriel Zeus', 'S.', 'Padilla', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(249, 'aronjustineenilo05@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Aron', 'Justine', 'Enilo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(250, 'dmicaella19@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Mica Ella C. Dela', NULL, 'Cruz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(251, 'sha.erasga008@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Shamille', 'C.', 'Erasga', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(252, 'johnmichaelperalta177@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'John', 'Michael', 'Peralta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(253, 'louiseclarkacojedo500@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Louise Clark', 'L.', 'Acojedo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(254, 'joshuaarenda@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Joshua', 'V.', 'Arenda', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(255, 'solomon.rens1@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Rens', 'A.', 'Solomon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(256, 'paralajane@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jane Katherine', 'B.', 'Parala', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(257, 'vanessramento143@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Vaness', 'R.', 'Ramento', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(258, 'jazlieboragay@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jazlie', 'C.', 'Boragay', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(259, 'kurtmichaelfusana@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Kurt Michael', 'S.', 'Fusana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(260, 'archieisalos123@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Archie', 'R.', 'Isalos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(261, 'paulromualdofernandez@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Paul Aldrey', 'R.', 'Fernandez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(262, 'albertxiperez@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Xian Albert', 'L.', 'Perez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(263, 'michaelangelo.calades@lspu.edu.ph', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Michaelangelo', 'A.', 'Calades', 'Jr.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(264, 'markallendelosreyes444@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Mark Allen E. Delos', NULL, 'Reyes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(265, 'augustinmariano288@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Augustin', 'L.', 'Mariano', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(266, 'manongsongjonesadrian@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Manongsong', 'Jones', 'Adrian', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(267, 'ritchecereno15@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Retchi', 'L.', 'Cereno', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(268, 'marcsegseg@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Marc Rodson', 'M.', 'Segundo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(269, 'jteyas9@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jomar', 'T.', 'Eyas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(270, 'mjfabros16@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Herlene', 'F.', 'Penaso', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(271, 'arabellalirio3@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Arabella', 'M.', 'Lirio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(272, 'katelucero24@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Kate Raven', 'B.', 'Lucero', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(273, 'trixiechavez072@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Trixie', 'B.', 'Chavez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(274, 'josephineerose5@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Josephine', 'M.', 'Rodriguez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(275, 'jarenadriel.ignacio@lspu.edu.ph', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jaren Adriel', 'A.', 'Ignacio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(276, 'lapitanjonnel11@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jonnel Victor', 'L.', 'Lapitan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(277, 'audinesarah@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Sarah Mae', 'A.', 'Audine', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(278, 'teemomercado@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Espiritu', 'C.', 'Mercado', 'IV', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 22:18:48'),
(279, 'franzlita12285@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jose Franz', 'N.', 'Lita', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(280, 'thejohncarlo@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'John Carlo H. Del', NULL, 'Rosario', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(281, 'monmon121205@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Ralph Richmond', 'G.', 'Mercado', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(282, 'andreialforte6226@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Andrei', 'E.', 'Alforte', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(283, 'conciomaverick182003@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Maverick', 'U.', 'Concio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(284, 'eurygibasreyes04@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jan Den Eury', 'G.', 'Reyes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(285, 'carenbelda08@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Caren', 'S.', 'Belda', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(286, 'mendozatrisha844@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Trisha Mae', 'B.', 'Mendoza', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(287, 'nacionaleszj@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Zar John', 'A.', 'Nacionales', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(288, 'ayenmanator888@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Alyanna Marie', 'M.', 'Torres', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(289, 'lindzaygarciapaner02@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Lindzay', 'G.', 'Paner', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(290, 'ktllanes01@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Kyle Tracy', 'Q.', 'Llanes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(291, 'rioivalescobin28@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Rio Ival', 'B.', 'Escobin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(292, 'amarelalorence@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'John Lorence', 'B.', 'Amarela', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(293, 'z4km4estro@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Christian', 'B.', 'Añez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(294, 'angelesjoshua78@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Christian', 'Joshua', 'Angeles', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(295, 'caguyairene83@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Irene', 'A.', 'Caguya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(296, 'andreicaldeo777@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Andrei', 'H.', 'Caldeo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(297, 'zekielcasipong0112@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Eizekiel', 'L.', 'Casipong', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(298, 'cortejojireh@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jireh', 'V.', 'Cortejo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(299, 'aby.deleon814@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Aubrey M. De', NULL, 'Leon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(300, 'aldwinkiesterediza@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Aldwin Kiester', 'P.', 'Ediza', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(301, 'mauiendiape05@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Maui', 'A.', 'Endiape', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(302, 'louiswilliam.escobar@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'William', 'N.', 'Escobar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(303, 'ajescobin333@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'John Augustus', 'S.', 'Escobin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(304, 'vinrich29@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Vincent', NULL, 'Espinosa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(305, 'maryjoyeusebio38@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Mary Joy', 'Q.', 'Eusebio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(306, 'jenolapore050@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jeno', 'A.', 'Lapore', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(307, 'gabbie.manalo18@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Gabbie', 'C.', 'Manalo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(308, 'paulettejane.mena@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Paulette Jane', 'M.', 'Meña', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(309, 'arrenleimendoza12@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Arren', 'Lei', 'Mendoza', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(310, 'john.milanes141@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'John Micheal', 'R.', 'Milanes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(311, 'exrt3d@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Ethan', 'Daniel', 'Monterola', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(312, 'khyleotano838@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Khyle', NULL, 'Otano', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(313, 'renlypatricio817@gamil.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Renly', 'M.', 'Patricio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(314, 'abelpingol45@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Abel', 'B.', 'Pingol', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(315, 'rodejo770@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Froilan', 'A.', 'Rodejo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(316, 'larainerodriguez10@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Laraine', 'M.', 'Rodriguez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(317, 'lorrainesanmiguel14@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Lorraine S. San', NULL, 'Miguel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(318, 'shainamae4290@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Shaina Mae', 'G.', 'Vidal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(319, 'joshuazechariah24@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Joshua Zachariah', 'L.', 'Herrera', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(320, 'student.04233485@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Noemelyn', NULL, 'Abasola', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(321, 'student.04233590@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Christka', 'May', 'Collado', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(322, 'student.04234245@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Joseph', 'Christian', 'Ferrer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(323, 'student.04233496@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Gife Charles Marty', NULL, 'Laforteza', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(324, 'student.04233599@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jhane', 'Maureen', 'Manalo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(325, 'student.04233568@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Lheilah', NULL, 'Tandang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(326, 'student.04234496@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Josefa', 'Paula', 'Eusebio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(327, 'student.04234292@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Rhixie', NULL, 'Carpio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(328, 'student.04233622@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Algirho', NULL, 'Mañosca', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(329, 'student.04233885@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Zack Xavier', 'G.', 'Refrea', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(330, 'student.04233718@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Benedict', 'Vincent', 'Reyes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(331, 'student.04233466@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Nomer', 'Ray', 'Aguas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(332, 'student.04234110@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Gretchen', NULL, 'Andaya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(333, 'student.04234096@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Angel', 'Kim', 'Hubilla', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(334, 'student.04233490@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Samantha', 'Jasmine', 'Alcantara', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(335, 'student.04233570@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Racil', NULL, 'Picardal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(336, 'student.04200623@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Samuel', NULL, 'Villamayor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(337, 'student.04234690@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jaymart', NULL, 'Cabuhat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(338, 'student.04234054@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Andreine', NULL, 'Tendencia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(339, 'student.04234882@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Daniella', NULL, 'Dael', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(340, 'student.04234612@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Aldrin', NULL, 'Terbio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(341, 'student.04233534@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Edzel', 'Angelo', 'Masagca', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(342, 'student.04233491@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Joshua', 'Paul', 'Mataverde', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(343, 'student.04221599@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Mark', 'Raniel', 'Decena', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08');
INSERT INTO `applicants` (`id`, `Email`, `password_hash`, `application_status`, `First_Name`, `Middle_Name`, `Last_Name`, `Suffix`, `Birthday`, `Birth_Place`, `Citizenship`, `Sex`, `Civil_Status`, `Religion`, `Disability`, `First_Generation_Student`, `Contact_Number`, `Landline_Number`, `House_Number`, `Street`, `Barangay`, `Municipality`, `Province`, `Zip_Code`, `created_at`, `updated_at`) VALUES
(344, 'student.04234197@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'John Paul', 'C.', 'Empalmado', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(345, 'student.04220912@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jynn Diane', 'M.', 'Casili', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(346, 'student.04233522@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Alexandra', 'Nicole', 'Blasco', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(347, 'student.04234039@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Daryl Anne', 'F.', 'Lapitan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(348, 'student.04233541@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Laurence Bren', 'F.', 'Austria', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(349, 'student.04233545@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Rondale', 'Angelo', 'Magda', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(350, 'student.04233550@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Fiona', NULL, 'Sanchez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(351, 'student.04233575@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Lawrence', 'S.', 'Salvador', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(352, 'student.04233532@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'John Royce', 'L.', 'Esporlas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(353, 'student.04234667@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jared Nate', 'T.', 'Odian', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(354, 'student.04212153@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Raiza Jonelle', 'A.', 'Gacer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(355, 'student.04234400@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jay Michael', 'M.', 'Castillo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(356, 'student.04234357@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Chester', 'M.', 'Mendoza', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(357, 'student.04234575@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jeric', 'T.', 'Manibog', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(358, 'student.04233495@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'John Paul', 'E.', 'Malabanan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(359, 'student.04233498@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Danielle', 'S.', 'Linga', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(360, 'student.04212174@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Renz', 'L.', 'Gallego', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(361, 'student.04233543@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'C-jay', 'S.', 'Melante', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(362, 'student.04233517@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Dave Ian Louis', 'P.', 'Soriano', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(363, 'student.04233537@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Clark Louie', 'A.', 'Desepida', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(364, 'student.04233530@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Kenneth Brylle', 'F.', 'Nañez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(365, 'student.04233549@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Bryan', 'P.', 'Manera', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(366, 'student.04233566@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Mirah Stepanie', 'C.', 'Lim', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(367, 'student.04233505@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Sean Deaniel', 'A.', 'Garcia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(368, 'student.04233493@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Paulo David', 'V.', 'Romero', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(369, 'student.04234148@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Adriel Timothy', 'B.', 'Fernandez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(370, 'student.04180554@placeholder.lspu', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Rick Von', 'B.', 'Aragon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(371, 'ronalcantara0126@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Ron Joseph', 'R.', 'Alcantara', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(372, 'jalfojra@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Ronel Joshua', 'D.', 'Alforja', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(373, 'real.jamesalvarez19@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'James Isaac', 'A.', 'Alvarez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(374, 'bjamparo30@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Brenderick', 'I.', 'Amparo', 'Jr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(375, 'ronaldjohn.bautista7@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Ronald John', 'S.', 'Bautista', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(376, 'christianged31@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Brylle Allen', 'D.', 'Bregonia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(377, 'vbrinas8@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Vincent', 'V.', 'Briñas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(378, 'ciscoklyde@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Klyde Cisco', 'T.', 'Canapi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(379, 'ritsapn@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Richard', 'S.', 'Catindig', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(380, 'jhestercayetano.lspu@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jhester Carlo', 'C.', 'Cayetano', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(381, 'rafdeleon82@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Marck Rafael B. De', NULL, 'Leon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(382, 'delarosalujen23@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Lujen M. Dela', NULL, 'Rosa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(383, 'emeflo2969@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Ray Emylson', 'M.', 'Flores', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(384, 'ivanjheromegonzales0318@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Ivan Jherome', 'S.', 'Gonzales', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(385, 'aceattacker028@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'John Andrei', 'C.', 'Guzman', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(386, 'seanjohnreyeslooc@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Sean John', 'R.', 'Looc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(387, 'ivandwight3@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Ivandwight', 'S.', 'Macabulos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(388, 'gianmaranan81@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Gian Carlo', 'I.', 'Maranan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(389, 'montecillokent019@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Reymond Kent', 'A.', 'Montecilo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(390, 'johnedwardopulencia062@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'John Edward', 'P.', 'Opulencia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(391, 'pelenojewel@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Jewel Anne Keith', 'E.', 'Peleño', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(392, 'danpolistico91@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Dan Christian', 'G.', 'Polistico', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(393, 'gabriellepogi25prudente@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Gabrielle', 'C.', 'Prudente', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(394, 'bayabasmaromaro92@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Christian Jake', 'A.', 'Ramiro', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(395, 'edward.sanantonio14@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Edward O. San', NULL, 'Antonio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(396, 'justinesuiza1@gmail.com', '$2y$10$unWXIDaKRGfvyi4LUd4e5eonNugf/CeDVAVRI3dLBG4S5XssEIOTa', 'Enrolled', 'Justine', 'G.', 'Suiza', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 10:43:23', '2026-05-10 10:51:08'),
(398, 'Testing1@gmail.com', '$2y$10$tzHE7VY5JT6r2VKh3Ua8cOCVcDyv..2fXrxem7.gv.JKbipLXBtT2', 'Pending', 'Testing 1', NULL, 'Testing 1', NULL, NULL, NULL, NULL, NULL, 'Single', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 14:25:13', '2026-05-10 14:25:13'),
(399, 'Testing2@gmail.com', '$2y$10$GbH1Nw2/xPfydZPNUN4eOu/iqVlY9hXvPZA0tQSpp1/AuKl3T5q1a', 'Pending', 'Testing 2', NULL, 'Testing 2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10 16:51:09', '2026-05-10 16:51:09');

-- --------------------------------------------------------

--
-- Table structure for table `applicant_status_log`
--

CREATE TABLE `applicant_status_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `applicant_id` int(10) UNSIGNED NOT NULL,
  `status` enum('Pending','Draft','Submitted','Enrolled','Rejected') NOT NULL,
  `changed_by` varchar(80) NOT NULL DEFAULT 'admin' COMMENT 'admin | system — extend with registrar username when auth is wired up',
  `changed_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `applicant_status_log`
--

INSERT INTO `applicant_status_log` (`id`, `applicant_id`, `status`, `changed_by`, `changed_at`) VALUES
(1, 398, 'Pending', 'admin', '2026-05-10 14:25:13'),
(2, 399, 'Pending', 'admin', '2026-05-10 16:51:09');

-- --------------------------------------------------------

--
-- Table structure for table `campus`
--

CREATE TABLE `campus` (
  `Campus_Id` int(11) NOT NULL,
  `Campus_Name` varchar(150) NOT NULL,
  `Barangay` varchar(100) DEFAULT NULL,
  `Municipality` varchar(100) DEFAULT NULL,
  `Province` varchar(100) DEFAULT NULL,
  `campus_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `campus`
--

INSERT INTO `campus` (`Campus_Id`, `Campus_Name`, `Barangay`, `Municipality`, `Province`, `campus_email`) VALUES
(1, 'Los Banos Campus', 'Brgy. Malinta', 'Los Banos', 'Laguna', 'LSPU-LBC@university.edu'),
(2, 'San Pablo Campus', 'Brgy. Del Remedio', 'San Pablo', 'Laguna', 'LSPU-SPC@university.edu'),
(3, 'Sta Cruz Campus', 'Brgy. Bubukal', 'Sta Cruz', 'Laguna', 'LSPU-SCC@university.edu'),
(4, 'Siniloan Campus', 'L. De Leon St.', 'Siniloan', 'Laguna', 'LSPU-SC@university.edu');

-- --------------------------------------------------------

--
-- Table structure for table `colleges`
--

CREATE TABLE `colleges` (
  `college_id` int(11) NOT NULL,
  `college_name` varchar(150) NOT NULL,
  `college_code` varchar(20) DEFAULT NULL,
  `college_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `colleges`
--

INSERT INTO `colleges` (`college_id`, `college_name`, `college_code`, `college_email`) VALUES
(1, 'College of Arts and Science', 'CAS', 'CAS@university.edu'),
(2, 'College of Business Administration and Accountancy', 'CBAA', 'CBAA@university.edu'),
(3, 'College of Computer Studies', 'CCS', 'CCS@university.edu'),
(4, 'College of Criminal Justice Education', 'CCJE', 'CCJE@university.edu'),
(5, 'College of Fisheries', 'COF', 'COF@university.edu'),
(6, 'College of Food Nutrition and Dietetics', 'CFND', 'CFND@university.edu'),
(7, 'College of International Hospitality and Tourism Management', 'CIHTM', 'CIHTM@university.edu'),
(8, 'College of Teacher Education', 'CTE', 'CTE@university.edu');

-- --------------------------------------------------------

--
-- Table structure for table `educational_background`
--

CREATE TABLE `educational_background` (
  `id` int(10) UNSIGNED NOT NULL,
  `applicant_id` int(10) UNSIGNED NOT NULL,
  `elementary_school_name` varchar(150) DEFAULT NULL,
  `elementary_school_address` varchar(200) DEFAULT NULL,
  `elementary_type` enum('Public','Private') DEFAULT NULL,
  `elementary_year_from` smallint(5) UNSIGNED DEFAULT NULL,
  `elementary_year_to` smallint(5) UNSIGNED DEFAULT NULL,
  `high_school_name` varchar(150) DEFAULT NULL,
  `high_school_address` varchar(200) DEFAULT NULL,
  `high_school_type` enum('Public','Private') DEFAULT NULL,
  `high_school_year_from` smallint(5) UNSIGNED DEFAULT NULL,
  `high_school_year_to` smallint(5) UNSIGNED DEFAULT NULL,
  `senior_high_school_name` varchar(150) DEFAULT NULL,
  `senior_high_school_address` varchar(200) DEFAULT NULL,
  `senior_high_school_type` enum('Public','Private') DEFAULT NULL,
  `senior_high_school_year_from` smallint(5) UNSIGNED DEFAULT NULL,
  `senior_high_school_year_to` smallint(5) UNSIGNED DEFAULT NULL,
  `track_strand` enum('STEM','ABM','HUMSS','GAS','Home Economics','ICT','Agri-fishery Arts','Industrial Arts','Arts and Design Track','Sports Track') DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `educational_background`
--

INSERT INTO `educational_background` (`id`, `applicant_id`, `elementary_school_name`, `elementary_school_address`, `elementary_type`, `elementary_year_from`, `elementary_year_to`, `high_school_name`, `high_school_address`, `high_school_type`, `high_school_year_from`, `high_school_year_to`, `senior_high_school_name`, `senior_high_school_address`, `senior_high_school_type`, `senior_high_school_year_from`, `senior_high_school_year_to`, `track_strand`, `created_at`, `updated_at`) VALUES
(1, 1, 'Mayondon Elementary School', NULL, 'Public', 2012, 2018, 'San Pablo City National High School', NULL, 'Public', 2018, 2022, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2022, 2024, 'GAS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(2, 2, 'Bay Central Elementary School', NULL, 'Public', 2012, 2018, 'Calamba National High School', NULL, 'Public', 2018, 2022, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2022, 2024, 'Home Economics', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(3, 3, 'Bay Central Elementary School', NULL, 'Public', 2012, 2018, 'San Pablo City National High School', NULL, 'Public', 2018, 2022, 'Colegio de Los Baños', NULL, 'Public', 2022, 2024, 'ICT', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(4, 4, 'Mayondon Elementary School', NULL, 'Public', 2012, 2018, 'San Pablo City National High School', NULL, 'Public', 2018, 2022, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2022, 2024, 'ICT', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(5, 5, 'Batong Malake Elementary School', NULL, 'Public', 2012, 2018, 'Los Baños National High School', NULL, 'Public', 2018, 2022, 'Colegio de Los Baños', NULL, 'Public', 2022, 2024, 'ICT', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(6, 6, 'Parian Elementary School', NULL, 'Public', 2012, 2018, 'Siniloan National High School', NULL, 'Public', 2018, 2022, 'Colegio de Los Baños', NULL, 'Public', 2022, 2024, 'ABM', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(7, 7, 'Batong Malake Elementary School', NULL, 'Public', 2012, 2018, 'Siniloan National High School', NULL, 'Public', 2018, 2022, 'Colegio de Los Baños', NULL, 'Public', 2022, 2024, 'Home Economics', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(8, 8, 'Bay Central Elementary School', NULL, 'Public', 2012, 2018, 'Siniloan National High School', NULL, 'Public', 2018, 2022, 'STI College', NULL, 'Public', 2022, 2024, 'ABM', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(9, 9, 'Anos Elementary School', NULL, 'Public', 2012, 2018, 'Siniloan National High School', NULL, 'Public', 2018, 2022, 'STI College', NULL, 'Public', 2022, 2024, 'HUMSS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(10, 10, 'Bay Central Elementary School', NULL, 'Public', 2012, 2018, 'Los Baños National High School', NULL, 'Public', 2018, 2022, 'STI College', NULL, 'Public', 2022, 2024, 'Home Economics', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(11, 11, 'Bay Central Elementary School', NULL, 'Public', 2012, 2018, 'Calamba National High School', NULL, 'Public', 2018, 2022, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2022, 2024, 'HUMSS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(12, 12, 'Mayondon Elementary School', NULL, 'Public', 2012, 2018, 'Bay National High School', NULL, 'Public', 2018, 2022, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2022, 2024, 'Home Economics', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(13, 13, 'Bay Central Elementary School', NULL, 'Public', 2012, 2018, 'Calamba National High School', NULL, 'Public', 2018, 2022, 'STI College', NULL, 'Public', 2022, 2024, 'GAS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(14, 14, 'Mayondon Elementary School', NULL, 'Public', 2012, 2018, 'San Pablo City National High School', NULL, 'Public', 2018, 2022, 'Colegio de Los Baños', NULL, 'Public', 2022, 2024, 'ICT', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(15, 15, 'Batong Malake Elementary School', NULL, 'Public', 2012, 2018, 'Calamba National High School', NULL, 'Public', 2018, 2022, 'Colegio de Los Baños', NULL, 'Public', 2022, 2024, 'HUMSS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(16, 16, 'Parian Elementary School', NULL, 'Public', 2012, 2018, 'Los Baños National High School', NULL, 'Public', 2018, 2022, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2022, 2024, 'GAS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(17, 17, 'Bay Central Elementary School', NULL, 'Public', 2012, 2018, 'Los Baños National High School', NULL, 'Public', 2018, 2022, 'University of the Philippines Rural High School', NULL, 'Public', 2022, 2024, 'GAS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(18, 18, 'Batong Malake Elementary School', NULL, 'Public', 2012, 2018, 'Siniloan National High School', NULL, 'Public', 2018, 2022, 'STI College', NULL, 'Public', 2022, 2024, 'ICT', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(19, 19, 'Bay Central Elementary School', NULL, 'Public', 2012, 2018, 'Los Baños National High School', NULL, 'Public', 2018, 2022, 'University of the Philippines Rural High School', NULL, 'Public', 2022, 2024, 'Home Economics', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(20, 20, 'Parian Elementary School', NULL, 'Public', 2012, 2018, 'Bay National High School', NULL, 'Public', 2018, 2022, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2022, 2024, 'HUMSS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(21, 21, 'Bay Central Elementary School', NULL, 'Public', 2012, 2018, 'Los Baños National High School', NULL, 'Public', 2018, 2022, 'Colegio de Los Baños', NULL, 'Public', 2022, 2024, 'GAS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(22, 22, 'Parian Elementary School', NULL, 'Public', 2012, 2018, 'Bay National High School', NULL, 'Public', 2018, 2022, 'University of the Philippines Rural High School', NULL, 'Public', 2022, 2024, 'Home Economics', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(23, 23, 'Parian Elementary School', NULL, 'Public', 2012, 2018, 'Los Baños National High School', NULL, 'Public', 2018, 2022, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2022, 2024, 'HUMSS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(24, 24, 'Mayondon Elementary School', NULL, 'Public', 2012, 2018, 'Bay National High School', NULL, 'Public', 2018, 2022, 'Colegio de Los Baños', NULL, 'Public', 2022, 2024, 'GAS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(25, 25, 'Mayondon Elementary School', NULL, 'Public', 2012, 2018, 'Bay National High School', NULL, 'Public', 2018, 2022, 'STI College', NULL, 'Public', 2022, 2024, 'GAS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(26, 26, 'Batong Malake Elementary School', NULL, 'Public', 2012, 2018, 'Siniloan National High School', NULL, 'Public', 2018, 2022, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2022, 2024, 'Home Economics', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(27, 27, 'Bay Central Elementary School', NULL, 'Public', 2012, 2018, 'San Pablo City National High School', NULL, 'Public', 2018, 2022, 'University of the Philippines Rural High School', NULL, 'Public', 2022, 2024, 'GAS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(28, 28, 'Parian Elementary School', NULL, 'Public', 2012, 2018, 'Bay National High School', NULL, 'Public', 2018, 2022, 'STI College', NULL, 'Public', 2022, 2024, 'GAS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(29, 29, 'Parian Elementary School', NULL, 'Public', 2012, 2018, 'Siniloan National High School', NULL, 'Public', 2018, 2022, 'University of the Philippines Rural High School', NULL, 'Public', 2022, 2024, 'ABM', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(30, 30, 'Batong Malake Elementary School', NULL, 'Public', 2012, 2018, 'San Pablo City National High School', NULL, 'Public', 2018, 2022, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2022, 2024, 'STEM', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(31, 31, 'Batong Malake Elementary School', NULL, 'Public', 2012, 2018, 'Los Baños National High School', NULL, 'Public', 2018, 2022, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2022, 2024, 'ICT', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(32, 32, 'Batong Malake Elementary School', NULL, 'Public', 2012, 2018, 'Siniloan National High School', NULL, 'Public', 2018, 2022, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2022, 2024, 'Home Economics', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(33, 33, 'Bay Central Elementary School', NULL, 'Public', 2012, 2018, 'Bay National High School', NULL, 'Public', 2018, 2022, 'STI College', NULL, 'Public', 2022, 2024, 'Home Economics', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(34, 34, 'Bay Central Elementary School', NULL, 'Public', 2012, 2018, 'Calamba National High School', NULL, 'Public', 2018, 2022, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2022, 2024, 'ICT', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(35, 35, 'Parian Elementary School', NULL, 'Public', 2012, 2018, 'San Pablo City National High School', NULL, 'Public', 2018, 2022, 'STI College', NULL, 'Public', 2022, 2024, 'ICT', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(36, 36, 'Anos Elementary School', NULL, 'Public', 2012, 2018, 'Bay National High School', NULL, 'Public', 2018, 2022, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2022, 2024, 'HUMSS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(37, 37, 'Anos Elementary School', NULL, 'Public', 2012, 2018, 'San Pablo City National High School', NULL, 'Public', 2018, 2022, 'Colegio de Los Baños', NULL, 'Public', 2022, 2024, 'GAS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(38, 38, 'Bay Central Elementary School', NULL, 'Public', 2012, 2018, 'San Pablo City National High School', NULL, 'Public', 2018, 2022, 'STI College', NULL, 'Public', 2022, 2024, 'HUMSS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(39, 39, 'Anos Elementary School', NULL, 'Public', 2012, 2018, 'San Pablo City National High School', NULL, 'Public', 2018, 2022, 'Colegio de Los Baños', NULL, 'Public', 2022, 2024, 'Home Economics', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(40, 40, 'Parian Elementary School', NULL, 'Public', 2012, 2018, 'Siniloan National High School', NULL, 'Public', 2018, 2022, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2022, 2024, 'ABM', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(41, 41, 'Bay Central Elementary School', NULL, 'Public', 2012, 2018, 'Los Baños National High School', NULL, 'Public', 2018, 2022, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2022, 2024, 'STEM', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(42, 42, 'Mayondon Elementary School', NULL, 'Public', 2012, 2018, 'Bay National High School', NULL, 'Public', 2018, 2022, 'STI College', NULL, 'Public', 2022, 2024, 'GAS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(43, 43, 'Anos Elementary School', NULL, 'Public', 2012, 2018, 'Los Baños National High School', NULL, 'Public', 2018, 2022, 'STI College', NULL, 'Public', 2022, 2024, 'Home Economics', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(44, 44, 'Batong Malake Elementary School', NULL, 'Public', 2012, 2018, 'Siniloan National High School', NULL, 'Public', 2018, 2022, 'STI College', NULL, 'Public', 2022, 2024, 'HUMSS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(45, 45, 'Mayondon Elementary School', NULL, 'Public', 2012, 2018, 'Calamba National High School', NULL, 'Public', 2018, 2022, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2022, 2024, 'Home Economics', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(46, 46, 'Batong Malake Elementary School', NULL, 'Public', 2012, 2018, 'San Pablo City National High School', NULL, 'Public', 2018, 2022, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2022, 2024, 'GAS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(47, 47, 'Parian Elementary School', NULL, 'Public', 2012, 2018, 'Los Baños National High School', NULL, 'Public', 2018, 2022, 'University of the Philippines Rural High School', NULL, 'Public', 2022, 2024, 'STEM', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(48, 48, 'Batong Malake Elementary School', NULL, 'Public', 2012, 2018, 'Bay National High School', NULL, 'Public', 2018, 2022, 'Colegio de Los Baños', NULL, 'Public', 2022, 2024, 'Home Economics', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(49, 49, 'Mayondon Elementary School', NULL, 'Public', 2012, 2018, 'Los Baños National High School', NULL, 'Public', 2018, 2022, 'STI College', NULL, 'Public', 2022, 2024, 'GAS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(50, 50, 'Batong Malake Elementary School', NULL, 'Public', 2012, 2018, 'Los Baños National High School', NULL, 'Public', 2018, 2022, 'Colegio de Los Baños', NULL, 'Public', 2022, 2024, 'ABM', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(51, 51, 'Mayondon Elementary School', NULL, 'Public', 2012, 2018, 'Calamba National High School', NULL, 'Public', 2018, 2022, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2022, 2024, 'HUMSS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(52, 52, 'Bay Central Elementary School', NULL, 'Public', 2012, 2018, 'Bay National High School', NULL, 'Public', 2018, 2022, 'University of the Philippines Rural High School', NULL, 'Public', 2022, 2024, 'HUMSS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(53, 53, 'Bay Central Elementary School', NULL, 'Public', 2012, 2018, 'Siniloan National High School', NULL, 'Public', 2018, 2022, 'University of the Philippines Rural High School', NULL, 'Public', 2022, 2024, 'ICT', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(54, 54, 'Anos Elementary School', NULL, 'Public', 2012, 2018, 'Los Baños National High School', NULL, 'Public', 2018, 2022, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2022, 2024, 'ABM', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(55, 55, 'Parian Elementary School', NULL, 'Public', 2012, 2018, 'Bay National High School', NULL, 'Public', 2018, 2022, 'STI College', NULL, 'Public', 2022, 2024, 'GAS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(56, 56, 'Anos Elementary School', NULL, 'Public', 2012, 2018, 'Bay National High School', NULL, 'Public', 2018, 2022, 'STI College', NULL, 'Public', 2022, 2024, 'ICT', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(57, 57, 'Batong Malake Elementary School', NULL, 'Public', 2012, 2018, 'San Pablo City National High School', NULL, 'Public', 2018, 2022, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2022, 2024, 'Home Economics', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(58, 58, 'Mayondon Elementary School', NULL, 'Public', 2012, 2018, 'San Pablo City National High School', NULL, 'Public', 2018, 2022, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2022, 2024, 'Home Economics', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(59, 59, 'Parian Elementary School', NULL, 'Public', 2012, 2018, 'Bay National High School', NULL, 'Public', 2018, 2022, 'Colegio de Los Baños', NULL, 'Public', 2022, 2024, 'Home Economics', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(60, 60, 'Batong Malake Elementary School', NULL, 'Public', 2012, 2018, 'Siniloan National High School', NULL, 'Public', 2018, 2022, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2022, 2024, 'GAS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(61, 61, 'Bay Central Elementary School', NULL, 'Public', 2012, 2018, 'Calamba National High School', NULL, 'Public', 2018, 2022, 'STI College', NULL, 'Public', 2022, 2024, 'Home Economics', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(62, 62, 'Anos Elementary School', NULL, 'Public', 2012, 2018, 'San Pablo City National High School', NULL, 'Public', 2018, 2022, 'STI College', NULL, 'Public', 2022, 2024, 'HUMSS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(63, 63, 'Anos Elementary School', NULL, 'Public', 2012, 2018, 'San Pablo City National High School', NULL, 'Public', 2018, 2022, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2022, 2024, 'STEM', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(64, 64, 'Parian Elementary School', NULL, 'Public', 2012, 2018, 'Calamba National High School', NULL, 'Public', 2018, 2022, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2022, 2024, 'HUMSS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(65, 65, 'Bay Central Elementary School', NULL, 'Public', 2012, 2018, 'Calamba National High School', NULL, 'Public', 2018, 2022, 'Colegio de Los Baños', NULL, 'Public', 2022, 2024, 'STEM', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(66, 66, 'Mayondon Elementary School', NULL, 'Public', 2012, 2018, 'Siniloan National High School', NULL, 'Public', 2018, 2022, 'STI College', NULL, 'Public', 2022, 2024, 'ICT', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(67, 67, 'Anos Elementary School', NULL, 'Public', 2012, 2018, 'Siniloan National High School', NULL, 'Public', 2018, 2022, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2022, 2024, 'HUMSS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(68, 68, 'Anos Elementary School', NULL, 'Public', 2012, 2018, 'Siniloan National High School', NULL, 'Public', 2018, 2022, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2022, 2024, 'ABM', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(69, 69, 'Anos Elementary School', NULL, 'Public', 2012, 2018, 'Los Baños National High School', NULL, 'Public', 2018, 2022, 'Colegio de Los Baños', NULL, 'Public', 2022, 2024, 'Home Economics', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(70, 70, 'Bay Central Elementary School', NULL, 'Public', 2012, 2018, 'Los Baños National High School', NULL, 'Public', 2018, 2022, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2022, 2024, 'HUMSS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(71, 71, 'Anos Elementary School', NULL, 'Public', 2012, 2018, 'Los Baños National High School', NULL, 'Public', 2018, 2022, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2022, 2024, 'HUMSS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(72, 72, 'Bay Central Elementary School', NULL, 'Public', 2012, 2018, 'Bay National High School', NULL, 'Public', 2018, 2022, 'University of the Philippines Rural High School', NULL, 'Public', 2022, 2024, 'HUMSS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(73, 73, 'Parian Elementary School', NULL, 'Public', 2012, 2018, 'Calamba National High School', NULL, 'Public', 2018, 2022, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2022, 2024, 'ABM', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(74, 74, 'Batong Malake Elementary School', NULL, 'Public', 2012, 2018, 'Bay National High School', NULL, 'Public', 2018, 2022, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2022, 2024, 'ICT', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(75, 75, 'Batong Malake Elementary School', NULL, 'Public', 2012, 2018, 'Calamba National High School', NULL, 'Public', 2018, 2022, 'Colegio de Los Baños', NULL, 'Public', 2022, 2024, 'GAS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(76, 76, 'Mayondon Elementary School', NULL, 'Public', 2012, 2018, 'Bay National High School', NULL, 'Public', 2018, 2022, 'University of the Philippines Rural High School', NULL, 'Public', 2022, 2024, 'GAS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(77, 77, 'Bay Central Elementary School', NULL, 'Public', 2012, 2018, 'Siniloan National High School', NULL, 'Public', 2018, 2022, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2022, 2024, 'Home Economics', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(78, 78, 'Bay Central Elementary School', NULL, 'Public', 2012, 2018, 'Los Baños National High School', NULL, 'Public', 2018, 2022, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2022, 2024, 'STEM', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(79, 79, 'Mayondon Elementary School', NULL, 'Public', 2012, 2018, 'San Pablo City National High School', NULL, 'Public', 2018, 2022, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2022, 2024, 'ICT', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(80, 80, 'Batong Malake Elementary School', NULL, 'Public', 2012, 2018, 'Siniloan National High School', NULL, 'Public', 2018, 2022, 'STI College', NULL, 'Public', 2022, 2024, 'Home Economics', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(81, 81, 'Batong Malake Elementary School', NULL, 'Public', 2012, 2018, 'Los Baños National High School', NULL, 'Public', 2018, 2022, 'University of the Philippines Rural High School', NULL, 'Public', 2022, 2024, 'Home Economics', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(82, 82, 'Mayondon Elementary School', NULL, 'Public', 2012, 2018, 'Siniloan National High School', NULL, 'Public', 2018, 2022, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2022, 2024, 'GAS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(83, 83, 'Parian Elementary School', NULL, 'Public', 2012, 2018, 'Bay National High School', NULL, 'Public', 2018, 2022, 'Colegio de Los Baños', NULL, 'Public', 2022, 2024, 'HUMSS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(84, 84, 'Bay Central Elementary School', NULL, 'Public', 2012, 2018, 'Calamba National High School', NULL, 'Public', 2018, 2022, 'STI College', NULL, 'Public', 2022, 2024, 'Home Economics', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(85, 85, 'Anos Elementary School', NULL, 'Public', 2012, 2018, 'Los Baños National High School', NULL, 'Public', 2018, 2022, 'Colegio de Los Baños', NULL, 'Public', 2022, 2024, 'STEM', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(86, 86, 'Bay Central Elementary School', NULL, 'Public', 2012, 2018, 'Los Baños National High School', NULL, 'Public', 2018, 2022, 'Colegio de Los Baños', NULL, 'Public', 2022, 2024, 'HUMSS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(87, 87, 'Parian Elementary School', NULL, 'Public', 2012, 2018, 'Bay National High School', NULL, 'Public', 2018, 2022, 'STI College', NULL, 'Public', 2022, 2024, 'ABM', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(88, 88, 'Batong Malake Elementary School', NULL, 'Public', 2012, 2018, 'Siniloan National High School', NULL, 'Public', 2018, 2022, 'STI College', NULL, 'Public', 2022, 2024, 'GAS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(89, 89, 'Anos Elementary School', NULL, 'Public', 2012, 2018, 'San Pablo City National High School', NULL, 'Public', 2018, 2022, 'Colegio de Los Baños', NULL, 'Public', 2022, 2024, 'ICT', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(90, 90, 'Parian Elementary School', NULL, 'Public', 2012, 2018, 'San Pablo City National High School', NULL, 'Public', 2018, 2022, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2022, 2024, 'GAS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(91, 91, 'Batong Malake Elementary School', NULL, 'Public', 2012, 2018, 'Bay National High School', NULL, 'Public', 2018, 2022, 'STI College', NULL, 'Public', 2022, 2024, 'STEM', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(92, 92, 'Anos Elementary School', NULL, 'Public', 2012, 2018, 'Calamba National High School', NULL, 'Public', 2018, 2022, 'Colegio de Los Baños', NULL, 'Public', 2022, 2024, 'GAS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(93, 93, 'Batong Malake Elementary School', NULL, 'Public', 2012, 2018, 'Siniloan National High School', NULL, 'Public', 2018, 2022, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2022, 2024, 'Home Economics', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(94, 94, 'Bay Central Elementary School', NULL, 'Public', 2012, 2018, 'Calamba National High School', NULL, 'Public', 2018, 2022, 'University of the Philippines Rural High School', NULL, 'Public', 2022, 2024, 'STEM', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(95, 95, 'Bay Central Elementary School', NULL, 'Public', 2012, 2018, 'Los Baños National High School', NULL, 'Public', 2018, 2022, 'University of the Philippines Rural High School', NULL, 'Public', 2022, 2024, 'STEM', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(96, 96, 'Parian Elementary School', NULL, 'Public', 2012, 2018, 'Los Baños National High School', NULL, 'Public', 2018, 2022, 'Colegio de Los Baños', NULL, 'Public', 2022, 2024, 'Home Economics', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(97, 97, 'Anos Elementary School', NULL, 'Public', 2012, 2018, 'Bay National High School', NULL, 'Public', 2018, 2022, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2022, 2024, 'HUMSS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(98, 98, 'Mayondon Elementary School', NULL, 'Public', 2012, 2018, 'Siniloan National High School', NULL, 'Public', 2018, 2022, 'University of the Philippines Rural High School', NULL, 'Public', 2022, 2024, 'ABM', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(99, 99, 'Anos Elementary School', NULL, 'Public', 2012, 2018, 'Bay National High School', NULL, 'Public', 2018, 2022, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2022, 2024, 'ICT', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(100, 100, 'Parian Elementary School', NULL, 'Public', 2012, 2018, 'Los Baños National High School', NULL, 'Public', 2018, 2022, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2022, 2024, 'ABM', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(101, 101, 'Anos Elementary School', NULL, 'Public', 2012, 2018, 'Siniloan National High School', NULL, 'Public', 2018, 2022, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2022, 2024, 'ABM', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(102, 102, 'Mayondon Elementary School', NULL, 'Public', 2012, 2018, 'Los Baños National High School', NULL, 'Public', 2018, 2022, 'University of the Philippines Rural High School', NULL, 'Public', 2022, 2024, 'ABM', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(103, 103, 'Batong Malake Elementary School', NULL, 'Public', 2012, 2018, 'Bay National High School', NULL, 'Public', 2018, 2022, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2022, 2024, 'STEM', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(104, 104, 'Mayondon Elementary School', NULL, 'Public', 2012, 2018, 'Bay National High School', NULL, 'Public', 2018, 2022, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2022, 2024, 'HUMSS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(105, 105, 'Anos Elementary School', NULL, 'Public', 2012, 2018, 'San Pablo City National High School', NULL, 'Public', 2018, 2022, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2022, 2024, 'STEM', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(106, 106, 'Mayondon Elementary School', NULL, 'Public', 2012, 2018, 'San Pablo City National High School', NULL, 'Public', 2018, 2022, 'STI College', NULL, 'Public', 2022, 2024, 'STEM', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(107, 107, 'Parian Elementary School', NULL, 'Public', 2012, 2018, 'Siniloan National High School', NULL, 'Public', 2018, 2022, 'Colegio de Los Baños', NULL, 'Public', 2022, 2024, 'HUMSS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(108, 108, 'Parian Elementary School', NULL, 'Public', 2012, 2018, 'Bay National High School', NULL, 'Public', 2018, 2022, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2022, 2024, 'GAS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(109, 109, 'Parian Elementary School', NULL, 'Public', 2012, 2018, 'Calamba National High School', NULL, 'Public', 2018, 2022, 'STI College', NULL, 'Public', 2022, 2024, 'STEM', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(110, 110, 'Mayondon Elementary School', NULL, 'Public', 2012, 2018, 'Los Baños National High School', NULL, 'Public', 2018, 2022, 'STI College', NULL, 'Public', 2022, 2024, 'Home Economics', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(111, 111, 'Bay Central Elementary School', NULL, 'Public', 2012, 2018, 'Los Baños National High School', NULL, 'Public', 2018, 2022, 'STI College', NULL, 'Public', 2022, 2024, 'GAS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(112, 112, 'Bay Central Elementary School', NULL, 'Public', 2012, 2018, 'Los Baños National High School', NULL, 'Public', 2018, 2022, 'Colegio de Los Baños', NULL, 'Public', 2022, 2024, 'Home Economics', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(113, 113, 'Parian Elementary School', NULL, 'Public', 2012, 2018, 'Bay National High School', NULL, 'Public', 2018, 2022, 'Colegio de Los Baños', NULL, 'Public', 2022, 2024, 'HUMSS', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(114, 258, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'Siniloan National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(115, 259, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'San Pablo City National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'ABM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(116, 260, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'San Pablo City National High School', NULL, 'Public', 2014, 2018, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2018, 2020, 'ABM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(117, 261, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'Los Baños National High School', NULL, 'Public', 2014, 2018, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2018, 2020, 'STEM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(118, 262, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'Siniloan National High School', NULL, 'Public', 2014, 2018, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(119, 263, 'Mayondon Elementary School', NULL, 'Public', 2008, 2014, 'San Pablo City National High School', NULL, 'Public', 2014, 2018, 'Colegio de Los Baños', NULL, 'Public', 2018, 2020, 'STEM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(120, 264, 'Mayondon Elementary School', NULL, 'Public', 2008, 2014, 'Bay National High School', NULL, 'Public', 2014, 2018, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(121, 265, 'Mayondon Elementary School', NULL, 'Public', 2008, 2014, 'Los Baños National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'ABM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(122, 266, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'Bay National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'STEM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(123, 267, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(124, 268, 'Bay Central Elementary School', NULL, 'Public', 2008, 2014, 'Los Baños National High School', NULL, 'Public', 2014, 2018, 'Colegio de Los Baños', NULL, 'Public', 2018, 2020, 'ICT', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(125, 269, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'Los Baños National High School', NULL, 'Public', 2014, 2018, 'STI College', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(126, 270, 'Batong Malake Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'Colegio de Los Baños', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(127, 271, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'San Pablo City National High School', NULL, 'Public', 2014, 2018, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2018, 2020, 'Home Economics', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(128, 272, 'Batong Malake Elementary School', NULL, 'Public', 2008, 2014, 'Los Baños National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'STEM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(129, 273, 'Mayondon Elementary School', NULL, 'Public', 2008, 2014, 'Siniloan National High School', NULL, 'Public', 2014, 2018, 'Colegio de Los Baños', NULL, 'Public', 2018, 2020, 'ICT', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(130, 274, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'Siniloan National High School', NULL, 'Public', 2014, 2018, 'STI College', NULL, 'Public', 2018, 2020, 'ICT', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(131, 275, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'San Pablo City National High School', NULL, 'Public', 2014, 2018, 'STI College', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(132, 276, 'Batong Malake Elementary School', NULL, 'Public', 2008, 2014, 'Siniloan National High School', NULL, 'Public', 2014, 2018, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2018, 2020, 'Home Economics', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(133, 277, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'San Pablo City National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'STEM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(134, 278, 'Bay Central Elementary School', NULL, 'Public', 2008, 2014, 'Siniloan National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'ICT', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(135, 279, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'ICT', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(136, 280, 'Batong Malake Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'STI College', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(137, 281, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'Siniloan National High School', NULL, 'Public', 2014, 2018, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(138, 282, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'San Pablo City National High School', NULL, 'Public', 2014, 2018, 'STI College', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(139, 283, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'Los Baños National High School', NULL, 'Public', 2014, 2018, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(140, 284, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'Bay National High School', NULL, 'Public', 2014, 2018, 'Colegio de Los Baños', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(141, 285, 'Batong Malake Elementary School', NULL, 'Public', 2008, 2014, 'San Pablo City National High School', NULL, 'Public', 2014, 2018, 'Colegio de Los Baños', NULL, 'Public', 2018, 2020, 'ABM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(142, 286, 'Mayondon Elementary School', NULL, 'Public', 2008, 2014, 'Siniloan National High School', NULL, 'Public', 2014, 2018, 'STI College', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(143, 287, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2018, 2020, 'ABM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(144, 288, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'Bay National High School', NULL, 'Public', 2014, 2018, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2018, 2020, 'ABM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(145, 289, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'Los Baños National High School', NULL, 'Public', 2014, 2018, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(146, 290, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(147, 291, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'Bay National High School', NULL, 'Public', 2014, 2018, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2018, 2020, 'STEM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(148, 292, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2018, 2020, 'Home Economics', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(149, 293, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'Bay National High School', NULL, 'Public', 2014, 2018, 'Colegio de Los Baños', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(150, 294, 'Bay Central Elementary School', NULL, 'Public', 2008, 2014, 'Siniloan National High School', NULL, 'Public', 2014, 2018, 'Colegio de Los Baños', NULL, 'Public', 2018, 2020, 'HUMSS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(151, 295, 'Batong Malake Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'Colegio de Los Baños', NULL, 'Public', 2018, 2020, 'ICT', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(152, 296, 'Batong Malake Elementary School', NULL, 'Public', 2008, 2014, 'Bay National High School', NULL, 'Public', 2014, 2018, 'Colegio de Los Baños', NULL, 'Public', 2018, 2020, 'Home Economics', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(153, 297, 'Mayondon Elementary School', NULL, 'Public', 2008, 2014, 'San Pablo City National High School', NULL, 'Public', 2014, 2018, 'STI College', NULL, 'Public', 2018, 2020, 'Home Economics', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(154, 298, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'San Pablo City National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'Home Economics', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(155, 299, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'STI College', NULL, 'Public', 2018, 2020, 'STEM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(156, 300, 'Batong Malake Elementary School', NULL, 'Public', 2008, 2014, 'Siniloan National High School', NULL, 'Public', 2014, 2018, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2018, 2020, 'STEM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(157, 301, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'San Pablo City National High School', NULL, 'Public', 2014, 2018, 'STI College', NULL, 'Public', 2018, 2020, 'ICT', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(158, 302, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'Bay National High School', NULL, 'Public', 2014, 2018, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2018, 2020, 'Home Economics', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(159, 303, 'Bay Central Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'HUMSS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(160, 304, 'Mayondon Elementary School', NULL, 'Public', 2008, 2014, 'Los Baños National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'Home Economics', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(161, 305, 'Bay Central Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'Colegio de Los Baños', NULL, 'Public', 2018, 2020, 'ABM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(162, 306, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'Los Baños National High School', NULL, 'Public', 2014, 2018, 'STI College', NULL, 'Public', 2018, 2020, 'STEM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(163, 307, 'Batong Malake Elementary School', NULL, 'Public', 2008, 2014, 'Bay National High School', NULL, 'Public', 2014, 2018, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(164, 308, 'Mayondon Elementary School', NULL, 'Public', 2008, 2014, 'Los Baños National High School', NULL, 'Public', 2014, 2018, 'Colegio de Los Baños', NULL, 'Public', 2018, 2020, 'HUMSS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(165, 309, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'STI College', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(166, 310, 'Mayondon Elementary School', NULL, 'Public', 2008, 2014, 'San Pablo City National High School', NULL, 'Public', 2014, 2018, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2018, 2020, 'STEM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(167, 311, 'Batong Malake Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2018, 2020, 'ICT', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(168, 312, 'Mayondon Elementary School', NULL, 'Public', 2008, 2014, 'Siniloan National High School', NULL, 'Public', 2014, 2018, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2018, 2020, 'ICT', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(169, 313, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'Los Baños National High School', NULL, 'Public', 2014, 2018, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2018, 2020, 'ABM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(170, 314, 'Bay Central Elementary School', NULL, 'Public', 2008, 2014, 'Siniloan National High School', NULL, 'Public', 2014, 2018, 'STI College', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(171, 315, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'San Pablo City National High School', NULL, 'Public', 2014, 2018, 'Colegio de Los Baños', NULL, 'Public', 2018, 2020, 'ICT', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(172, 316, 'Batong Malake Elementary School', NULL, 'Public', 2008, 2014, 'Siniloan National High School', NULL, 'Public', 2014, 2018, 'Colegio de Los Baños', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(173, 317, 'Bay Central Elementary School', NULL, 'Public', 2008, 2014, 'Los Baños National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(174, 318, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'STI College', NULL, 'Public', 2018, 2020, 'ICT', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(175, 319, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'San Pablo City National High School', NULL, 'Public', 2014, 2018, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2018, 2020, 'ABM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(176, 320, 'Bay Central Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2018, 2020, 'STEM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(177, 321, 'Batong Malake Elementary School', NULL, 'Public', 2008, 2014, 'Los Baños National High School', NULL, 'Public', 2014, 2018, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2018, 2020, 'ABM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(178, 322, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'San Pablo City National High School', NULL, 'Public', 2014, 2018, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(179, 323, 'Mayondon Elementary School', NULL, 'Public', 2008, 2014, 'San Pablo City National High School', NULL, 'Public', 2014, 2018, 'STI College', NULL, 'Public', 2018, 2020, 'ABM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(180, 324, 'Batong Malake Elementary School', NULL, 'Public', 2008, 2014, 'Bay National High School', NULL, 'Public', 2014, 2018, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2018, 2020, 'HUMSS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(181, 325, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(182, 326, 'Mayondon Elementary School', NULL, 'Public', 2008, 2014, 'Los Baños National High School', NULL, 'Public', 2014, 2018, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2018, 2020, 'ICT', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(183, 327, 'Mayondon Elementary School', NULL, 'Public', 2008, 2014, 'Bay National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'ABM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(184, 328, 'Batong Malake Elementary School', NULL, 'Public', 2008, 2014, 'Siniloan National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'ICT', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(185, 329, 'Bay Central Elementary School', NULL, 'Public', 2008, 2014, 'Siniloan National High School', NULL, 'Public', 2014, 2018, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2018, 2020, 'Home Economics', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(186, 330, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'Los Baños National High School', NULL, 'Public', 2014, 2018, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(187, 331, 'Bay Central Elementary School', NULL, 'Public', 2008, 2014, 'Los Baños National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'STEM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(188, 332, 'Batong Malake Elementary School', NULL, 'Public', 2008, 2014, 'Los Baños National High School', NULL, 'Public', 2014, 2018, 'STI College', NULL, 'Public', 2018, 2020, 'HUMSS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(189, 333, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2018, 2020, 'HUMSS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(190, 334, 'Bay Central Elementary School', NULL, 'Public', 2008, 2014, 'San Pablo City National High School', NULL, 'Public', 2014, 2018, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2018, 2020, 'STEM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(191, 335, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'HUMSS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(192, 336, 'Bay Central Elementary School', NULL, 'Public', 2008, 2014, 'Bay National High School', NULL, 'Public', 2014, 2018, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2018, 2020, 'ICT', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(193, 337, 'Bay Central Elementary School', NULL, 'Public', 2008, 2014, 'Bay National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'ICT', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(194, 338, 'Batong Malake Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(195, 339, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'Los Baños National High School', NULL, 'Public', 2014, 2018, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2018, 2020, 'Home Economics', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(196, 340, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'Siniloan National High School', NULL, 'Public', 2014, 2018, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2018, 2020, 'Home Economics', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(197, 341, 'Bay Central Elementary School', NULL, 'Public', 2008, 2014, 'Los Baños National High School', NULL, 'Public', 2014, 2018, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2018, 2020, 'HUMSS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(198, 342, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'Siniloan National High School', NULL, 'Public', 2014, 2018, 'Colegio de Los Baños', NULL, 'Public', 2018, 2020, 'STEM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(199, 343, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'Bay National High School', NULL, 'Public', 2014, 2018, 'STI College', NULL, 'Public', 2018, 2020, 'STEM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(200, 344, 'Mayondon Elementary School', NULL, 'Public', 2008, 2014, 'Siniloan National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'STEM', '2026-05-07 07:37:28', '2026-05-07 07:37:28');
INSERT INTO `educational_background` (`id`, `applicant_id`, `elementary_school_name`, `elementary_school_address`, `elementary_type`, `elementary_year_from`, `elementary_year_to`, `high_school_name`, `high_school_address`, `high_school_type`, `high_school_year_from`, `high_school_year_to`, `senior_high_school_name`, `senior_high_school_address`, `senior_high_school_type`, `senior_high_school_year_from`, `senior_high_school_year_to`, `track_strand`, `created_at`, `updated_at`) VALUES
(201, 345, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'Los Baños National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'STEM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(202, 346, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'Los Baños National High School', NULL, 'Public', 2014, 2018, 'Colegio de Los Baños', NULL, 'Public', 2018, 2020, 'Home Economics', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(203, 347, 'Batong Malake Elementary School', NULL, 'Public', 2008, 2014, 'Siniloan National High School', NULL, 'Public', 2014, 2018, 'STI College', NULL, 'Public', 2018, 2020, 'HUMSS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(204, 348, 'Bay Central Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2018, 2020, 'ABM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(205, 349, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'Los Baños National High School', NULL, 'Public', 2014, 2018, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(206, 350, 'Mayondon Elementary School', NULL, 'Public', 2008, 2014, 'Siniloan National High School', NULL, 'Public', 2014, 2018, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2018, 2020, 'STEM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(207, 351, 'Batong Malake Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'HUMSS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(208, 352, 'Batong Malake Elementary School', NULL, 'Public', 2008, 2014, 'Bay National High School', NULL, 'Public', 2014, 2018, 'STI College', NULL, 'Public', 2018, 2020, 'HUMSS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(209, 353, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'San Pablo City National High School', NULL, 'Public', 2014, 2018, 'Colegio de Los Baños', NULL, 'Public', 2018, 2020, 'Home Economics', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(210, 354, 'Mayondon Elementary School', NULL, 'Public', 2008, 2014, 'San Pablo City National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'HUMSS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(211, 355, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'Siniloan National High School', NULL, 'Public', 2014, 2018, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2018, 2020, 'STEM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(212, 356, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'Siniloan National High School', NULL, 'Public', 2014, 2018, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2018, 2020, 'HUMSS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(213, 357, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'San Pablo City National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'ABM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(214, 358, 'Bay Central Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2018, 2020, 'Home Economics', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(215, 359, 'Mayondon Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2018, 2020, 'ICT', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(216, 360, 'Mayondon Elementary School', NULL, 'Public', 2008, 2014, 'San Pablo City National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'STEM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(217, 361, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'Los Baños National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'Home Economics', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(218, 362, 'Bay Central Elementary School', NULL, 'Public', 2008, 2014, 'San Pablo City National High School', NULL, 'Public', 2014, 2018, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2018, 2020, 'HUMSS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(219, 363, 'Mayondon Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'STI College', NULL, 'Public', 2018, 2020, 'HUMSS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(220, 364, 'Bay Central Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(221, 365, 'Mayondon Elementary School', NULL, 'Public', 2008, 2014, 'Bay National High School', NULL, 'Public', 2014, 2018, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(222, 366, 'Bay Central Elementary School', NULL, 'Public', 2008, 2014, 'Bay National High School', NULL, 'Public', 2014, 2018, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2018, 2020, 'ABM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(223, 367, 'Batong Malake Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(224, 368, 'Mayondon Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'Colegio de Los Baños', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(225, 369, 'Bay Central Elementary School', NULL, 'Public', 2008, 2014, 'Siniloan National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'ICT', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(226, 370, 'Bay Central Elementary School', NULL, 'Public', 2008, 2014, 'Siniloan National High School', NULL, 'Public', 2014, 2018, 'STI College', NULL, 'Public', 2018, 2020, 'ICT', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(227, 371, 'Mayondon Elementary School', NULL, 'Public', 2008, 2014, 'Los Baños National High School', NULL, 'Public', 2014, 2018, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2018, 2020, 'HUMSS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(228, 372, 'Mayondon Elementary School', NULL, 'Public', 2008, 2014, 'Siniloan National High School', NULL, 'Public', 2014, 2018, 'STI College', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(229, 373, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'Bay National High School', NULL, 'Public', 2014, 2018, 'Colegio de Los Baños', NULL, 'Public', 2018, 2020, 'STEM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(230, 374, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'Bay National High School', NULL, 'Public', 2014, 2018, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2018, 2020, 'Home Economics', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(231, 375, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'Los Baños National High School', NULL, 'Public', 2014, 2018, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2018, 2020, 'STEM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(232, 376, 'Mayondon Elementary School', NULL, 'Public', 2008, 2014, 'Siniloan National High School', NULL, 'Public', 2014, 2018, 'Colegio de Los Baños', NULL, 'Public', 2018, 2020, 'ICT', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(233, 377, 'Mayondon Elementary School', NULL, 'Public', 2008, 2014, 'Bay National High School', NULL, 'Public', 2014, 2018, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2018, 2020, 'STEM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(234, 378, 'Batong Malake Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'STEM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(235, 379, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'San Pablo City National High School', NULL, 'Public', 2014, 2018, 'Colegio de Los Baños', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(236, 380, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'Bay National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'HUMSS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(237, 381, 'Batong Malake Elementary School', NULL, 'Public', 2008, 2014, 'Bay National High School', NULL, 'Public', 2014, 2018, 'Colegio de Los Baños', NULL, 'Public', 2018, 2020, 'ABM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(238, 382, 'Batong Malake Elementary School', NULL, 'Public', 2008, 2014, 'Bay National High School', NULL, 'Public', 2014, 2018, 'Colegio de Los Baños', NULL, 'Public', 2018, 2020, 'Home Economics', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(239, 383, 'Bay Central Elementary School', NULL, 'Public', 2008, 2014, 'Siniloan National High School', NULL, 'Public', 2014, 2018, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2018, 2020, 'ABM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(240, 384, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(241, 385, 'Batong Malake Elementary School', NULL, 'Public', 2008, 2014, 'Bay National High School', NULL, 'Public', 2014, 2018, 'STI College', NULL, 'Public', 2018, 2020, 'Home Economics', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(242, 386, 'Mayondon Elementary School', NULL, 'Public', 2008, 2014, 'Bay National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'ABM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(243, 387, 'Bay Central Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(244, 388, 'Batong Malake Elementary School', NULL, 'Public', 2008, 2014, 'Siniloan National High School', NULL, 'Public', 2014, 2018, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2018, 2020, 'GAS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(245, 389, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2018, 2020, 'ABM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(246, 390, 'Anos Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'Philippine Science High School - CALABARZON', NULL, 'Public', 2018, 2020, 'STEM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(247, 391, 'Mayondon Elementary School', NULL, 'Public', 2008, 2014, 'Los Baños National High School', NULL, 'Public', 2014, 2018, 'STI College', NULL, 'Public', 2018, 2020, 'HUMSS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(248, 392, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'Siniloan National High School', NULL, 'Public', 2014, 2018, 'Colegio de Los Baños', NULL, 'Public', 2018, 2020, 'STEM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(249, 393, 'Mayondon Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'STI College', NULL, 'Public', 2018, 2020, 'ICT', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(250, 394, 'Batong Malake Elementary School', NULL, 'Public', 2008, 2014, 'Calamba National High School', NULL, 'Public', 2014, 2018, 'Pamantasan ng Lungsod ng Los Baños SHS', NULL, 'Public', 2018, 2020, 'HUMSS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(251, 395, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'San Pablo City National High School', NULL, 'Public', 2014, 2018, 'University of the Philippines Rural High School', NULL, 'Public', 2018, 2020, 'ICT', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(252, 396, 'Batong Malake Elementary School', NULL, 'Public', 2008, 2014, 'Bay National High School', NULL, 'Public', 2014, 2018, 'Colegio de Los Baños', NULL, 'Public', 2018, 2020, 'Home Economics', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(254, 398, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'San Pablo City National High School', NULL, 'Public', 2014, 2018, 'STI College', NULL, 'Public', 2018, 2020, 'HUMSS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(255, 399, 'Mayondon Elementary School', NULL, 'Public', 2008, 2014, 'San Pablo City National High School', NULL, 'Public', 2014, 2018, 'STI College', NULL, 'Public', 2018, 2020, 'Home Economics', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(256, 169, 'Mayondon Elementary School', NULL, 'Public', NULL, NULL, 'Los Baños National High School', NULL, 'Public', NULL, NULL, 'Colegio de Los Baños', NULL, 'Public', NULL, NULL, 'ICT', '2026-05-07 07:42:27', '2026-05-09 13:37:50'),
(257, 203, 'Mayondon Elementary School', NULL, 'Public', NULL, NULL, 'Los Baños National High School', NULL, 'Public', NULL, NULL, 'Colegio de Los Baños', NULL, 'Public', NULL, NULL, 'ICT', '2026-05-10 12:40:33', '2026-05-10 12:42:05');

-- --------------------------------------------------------

--
-- Table structure for table `enrolled_subjects`
--

CREATE TABLE `enrolled_subjects` (
  `enrolled_subject_id` int(11) NOT NULL,
  `enrollment_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `instructor_id` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Enrolled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `enrollment_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `year_id` int(11) NOT NULL,
  `enrollment_date` date NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Enrolled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `family_info`
--

CREATE TABLE `family_info` (
  `id` int(10) UNSIGNED NOT NULL,
  `applicant_id` int(10) UNSIGNED NOT NULL,
  `guardian_first_name` varchar(80) DEFAULT NULL,
  `guardian_last_name` varchar(80) DEFAULT NULL,
  `guardian_contact_number` varchar(15) DEFAULT NULL,
  `guardian_email` varchar(180) DEFAULT NULL,
  `guardian_relationship` enum('Guardian','Father','Mother') DEFAULT NULL,
  `guardian_barangay` varchar(80) DEFAULT NULL,
  `guardian_municipality` varchar(80) DEFAULT NULL,
  `guardian_province` varchar(80) DEFAULT NULL,
  `father_first_name` varchar(80) DEFAULT NULL,
  `father_middle_name` varchar(80) DEFAULT NULL,
  `father_last_name` varchar(80) DEFAULT NULL,
  `father_age` tinyint(3) UNSIGNED DEFAULT NULL,
  `father_citizenship` varchar(80) DEFAULT NULL,
  `father_educational_attainment` varchar(60) DEFAULT NULL,
  `father_employment_status` varchar(80) DEFAULT NULL,
  `father_occupation` varchar(120) DEFAULT NULL,
  `mother_first_name` varchar(80) DEFAULT NULL,
  `mother_middle_name` varchar(80) DEFAULT NULL,
  `mother_last_name` varchar(80) DEFAULT NULL,
  `mother_age` tinyint(3) UNSIGNED DEFAULT NULL,
  `mother_citizenship` varchar(80) DEFAULT NULL,
  `mother_educational_attainment` varchar(60) DEFAULT NULL,
  `mother_employment_status` varchar(80) DEFAULT NULL,
  `mother_occupation` varchar(120) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `family_info`
--

INSERT INTO `family_info` (`id`, `applicant_id`, `guardian_first_name`, `guardian_last_name`, `guardian_contact_number`, `guardian_email`, `guardian_relationship`, `guardian_barangay`, `guardian_municipality`, `guardian_province`, `father_first_name`, `father_middle_name`, `father_last_name`, `father_age`, `father_citizenship`, `father_educational_attainment`, `father_employment_status`, `father_occupation`, `mother_first_name`, `mother_middle_name`, `mother_last_name`, `mother_age`, `mother_citizenship`, `mother_educational_attainment`, `mother_employment_status`, `mother_occupation`, `created_at`, `updated_at`) VALUES
(1, 1, 'Rosa', 'Nodo', '09395296179', NULL, 'Mother', 'San Antonio', 'Bay', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(2, 2, 'Marites', 'Valdez', '09688793237', NULL, 'Mother', 'Burol', 'Cabuyao', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(3, 3, 'Gloria', 'Terania', '09741444618', NULL, 'Mother', 'Poblacion', 'Biñan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(4, 4, 'Cristina', 'Roque', '09642831335', NULL, 'Mother', 'San Antonio', 'Siniloan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(5, 5, 'Ana', 'Calinga', '09951580447', NULL, 'Mother', 'Burol', 'Calamba', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(6, 6, 'Teresa', 'Quilloy', '09873995963', NULL, 'Mother', 'Marinig', 'San Pablo', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(7, 7, 'Gloria', 'Lampasa', '09584853393', NULL, 'Mother', 'Banca-banca', 'San Pablo', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(8, 8, 'Gloria', 'Eusebio', '09463925049', NULL, 'Mother', 'Marinig', 'Pagsanjan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(9, 9, 'Gloria', 'Daculong', '09546665485', NULL, 'Mother', 'Burol', 'Calamba', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(10, 10, 'Luz', 'Darum', '09558234365', NULL, 'Mother', 'Canlubang', 'Bay', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(11, 11, 'Elena', 'Lapiz', '09501902658', NULL, 'Mother', 'Anos', 'Bay', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(12, 12, 'Cristina', 'Garcia', '09172083844', NULL, 'Mother', 'Batong Malake', 'Calamba', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(13, 13, 'Ana', 'Yakit', '09563723880', NULL, 'Mother', 'Batong Malake', 'Victoria', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(14, 14, 'Luz', 'Bautista', '09971630639', NULL, 'Mother', 'Anos', 'Nagcarlan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(15, 15, 'Maria', 'Vargas', '09729712082', NULL, 'Mother', 'Poblacion', 'Nagcarlan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(16, 16, 'Luz', 'Tagle', '09819421270', NULL, 'Mother', 'Batong Malake', 'Siniloan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(17, 17, 'Luz', 'Vasquez', '09814403943', NULL, 'Mother', 'Pittland', 'Siniloan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(18, 18, 'Maria', 'Escobido', '09408839723', NULL, 'Mother', 'San Antonio', 'Biñan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(19, 19, 'Luz', 'Alejandro', '09211240259', NULL, 'Mother', 'San Antonio', 'Nagcarlan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(20, 20, 'Carmen', 'Arabis', '09266140258', NULL, 'Mother', 'Masapang', 'Pagsanjan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(21, 21, 'Carmen', 'Luna', '09216198604', NULL, 'Mother', 'Canlubang', 'Nagcarlan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(22, 22, 'Luz', 'Ruiz', '09223357166', NULL, 'Mother', 'Pittland', 'Biñan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(23, 23, 'Marites', 'Danieles', '09342836476', NULL, 'Mother', 'Pittland', 'Siniloan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(24, 24, 'Teresa', 'Galang', '09924024405', NULL, 'Mother', 'Marinig', 'Liliw', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(25, 25, 'Marites', 'Oruga', '09824750726', NULL, 'Mother', 'Masapang', 'Nagcarlan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(26, 26, 'Maria', 'Aguilar', '09753903309', NULL, 'Mother', 'Banca-banca', 'Bay', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(27, 27, 'Elena', 'Anez', '09131088245', NULL, 'Mother', 'Anos', 'Biñan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(28, 28, 'Elena', 'Angeles', '09464883950', NULL, 'Mother', 'Canlubang', 'Los Baños', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(29, 29, 'Rosa', 'Angagao', '09253815116', NULL, 'Mother', 'San Antonio', 'Bay', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(30, 30, 'Gloria', 'Aquino', '09174716780', NULL, 'Mother', 'Anos', 'Victoria', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(31, 31, 'Maria', 'Bailon', '09198524063', NULL, 'Mother', 'Burol', 'Nagcarlan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(32, 32, 'Carmen', 'Bag-o', '09503935666', NULL, 'Mother', 'Halang', 'Pagsanjan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(33, 33, 'Luz', 'Bautista', '09269016920', NULL, 'Mother', 'Canlubang', 'Biñan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(34, 34, 'Luz', 'Bautista', '09934120892', NULL, 'Mother', 'San Antonio', 'Liliw', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(35, 35, 'Ana', 'Bonador', '09156488296', NULL, 'Mother', 'Anos', 'Santa Cruz', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(36, 36, 'Marites', 'Borrega', '09153432064', NULL, 'Mother', 'Masapang', 'Calamba', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(37, 37, 'Elena', 'Ceballo', '09575788930', NULL, 'Mother', 'Masapang', 'Siniloan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(38, 38, 'Cristina', 'Carpio', '09751842899', NULL, 'Mother', 'Parian', 'Siniloan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(39, 39, 'Elena', 'Del Prado', '09331465414', NULL, 'Mother', 'Pittland', 'Nagcarlan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(40, 40, 'Ana', 'Ebron', '09470626529', NULL, 'Mother', 'Halang', 'Calamba', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(41, 41, 'Elena', 'Erasga', '09828230915', NULL, 'Mother', 'Masapang', 'Liliw', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(42, 42, 'Cristina', 'Gatil', '09665791188', NULL, 'Mother', 'Masapang', 'Biñan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(43, 43, 'Maria', 'Hipolito', '09336779871', NULL, 'Mother', 'Halang', 'Liliw', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(44, 44, 'Maria', 'Labajo', '09108253947', NULL, 'Mother', 'Bambang', 'Biñan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(45, 45, 'Carmen', 'Madriaga', '09923935280', NULL, 'Mother', 'Anos', 'Pila', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(46, 46, 'Elena', 'Magpantay', '09410791488', NULL, 'Mother', 'Canlubang', 'Calamba', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(47, 47, 'Maria', 'Manaig', '09634063428', NULL, 'Mother', 'Burol', 'Siniloan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(48, 48, 'Rosa', 'Naredo', '09238712095', NULL, 'Mother', 'Halang', 'Nagcarlan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(49, 49, 'Carmen', 'Pascual', '09637152602', NULL, 'Mother', 'Poblacion', 'Bay', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(50, 50, 'Luz', 'Pillante', '09177390472', NULL, 'Mother', 'Halang', 'Victoria', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(51, 51, 'Maria', 'Peñarubia', '09568387228', NULL, 'Mother', 'Mayondon', 'Pagsanjan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(52, 52, 'Ana', 'Plantilla', '09436146289', NULL, 'Mother', 'San Antonio', 'Siniloan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(53, 53, 'Marites', 'Quilloy', '09534245762', NULL, 'Mother', 'Burol', 'Bay', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(54, 54, 'Gloria', 'Salamero', '09410864588', NULL, 'Mother', 'Batong Malake', 'Siniloan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(55, 55, 'Maria', 'San Valentin', '09448717183', NULL, 'Mother', 'Anos', 'Pila', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(56, 56, 'Marites', 'Takahashi', '09594025283', NULL, 'Mother', 'Marinig', 'Victoria', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(57, 57, 'Luz', 'Tandang', '09194628740', NULL, 'Mother', 'Halang', 'Calamba', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(58, 58, 'Carmen', 'D.', '09567804106', NULL, 'Mother', 'San Antonio', 'Siniloan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(59, 59, 'Teresa', 'Vergara', '09184446671', NULL, 'Mother', 'Halang', 'Biñan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(60, 60, 'Luz', 'Zayas', '09337911187', NULL, 'Mother', 'Canlubang', 'Pila', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(61, 61, 'Rosa', 'Gecale', '09182011731', NULL, 'Mother', 'Poblacion', 'Bay', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(62, 62, 'Ana', 'Villanueva', '09669732591', NULL, 'Mother', 'Poblacion', 'San Pablo', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(63, 63, 'Luz', 'Castro', '09476990466', NULL, 'Mother', 'Burol', 'Bay', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(64, 64, 'Rosa', 'Contado', '09353691745', NULL, 'Mother', 'Batong Malake', 'Santa Cruz', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(65, 65, 'Elena', 'Escobin', '09311818984', NULL, 'Mother', 'Anos', 'Liliw', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(66, 66, 'Rosa', 'Gayahan', '09916274954', NULL, 'Mother', 'Pittland', 'Bay', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(67, 67, 'Ana', 'Suguitan', '09290209201', NULL, 'Mother', 'Pittland', 'Bay', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(68, 68, 'Cristina', 'Mariano', '09598165815', NULL, 'Mother', 'Pittland', 'Liliw', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(69, 69, 'Marites', 'Tien', '09582008349', NULL, 'Mother', 'Masapang', 'Liliw', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(70, 70, 'Marites', 'Gragas', '09447042200', NULL, 'Mother', 'Marinig', 'Bay', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(71, 71, 'Luz', 'Tagum', '09262089272', NULL, 'Mother', 'Parian', 'Calamba', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(72, 72, 'Cristina', 'Orilla', '09574817290', NULL, 'Mother', 'Masapang', 'Biñan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(73, 73, 'Elena', 'Permejo', '09735032128', NULL, 'Mother', 'Mayondon', 'Cabuyao', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(74, 74, 'Teresa', 'Pillas', '09179661615', NULL, 'Mother', 'Bayog', 'Pagsanjan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(75, 75, 'Cristina', 'Maines', '09140380477', NULL, 'Mother', 'Mayondon', 'Cabuyao', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(76, 76, 'Elena', 'Mangampo', '09182389284', NULL, 'Mother', 'Masapang', 'Calamba', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(77, 77, 'Marites', 'Tan', '09737888347', NULL, 'Mother', 'Poblacion', 'Siniloan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(78, 78, 'Cristina', 'Pagne', '09723123952', NULL, 'Mother', 'Poblacion', 'Pila', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(79, 79, 'Maria', 'Espiritu', '09582897882', NULL, 'Mother', 'Banca-banca', 'Pila', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(80, 80, 'Marites', 'Añez', '09799905142', NULL, 'Mother', 'Bambang', 'Cabuyao', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(81, 81, 'Marites', 'Natal', '09610702777', NULL, 'Mother', 'Poblacion', 'Santa Cruz', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(82, 82, 'Maria', 'Isla', '09583745511', NULL, 'Mother', 'Batong Malake', 'Pila', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(83, 83, 'Luz', 'Quiamno', '09866990485', NULL, 'Mother', 'Batong Malake', 'Nagcarlan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(84, 84, 'Rosa', 'Paez', '09142028540', NULL, 'Mother', 'Bambang', 'Victoria', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(85, 85, 'Cristina', 'Agar', '09571825556', NULL, 'Mother', 'Poblacion', 'Nagcarlan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(86, 86, 'Marites', 'Tandang', '09270452446', NULL, 'Mother', 'Canlubang', 'Cabuyao', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(87, 87, 'Elena', 'Agustin', '09515985367', NULL, 'Mother', 'Halang', 'Pila', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(88, 88, 'Luz', 'Alcachupas', '09828960875', NULL, 'Mother', 'San Antonio', 'Los Baños', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(89, 89, 'Luz', 'Amasan', '09170772317', NULL, 'Mother', 'Canlubang', 'Calamba', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(90, 90, 'Teresa', 'Aquino', '09828404274', NULL, 'Mother', 'Halang', 'Biñan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(91, 91, 'Elena', 'Bacorro', '09877103091', NULL, 'Mother', 'Marinig', 'Bay', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(92, 92, 'Marites', 'Banasihan', '09261462131', NULL, 'Mother', 'Canlubang', 'Calamba', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(93, 93, 'Marites', 'Bondoc', '09812548074', NULL, 'Mother', 'Anos', 'Cabuyao', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(94, 94, 'Elena', 'Dacir', '09804433388', NULL, 'Mother', 'Burol', 'Bay', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(95, 95, 'Gloria', 'Daet', '09238460786', NULL, 'Mother', 'San Antonio', 'Victoria', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(96, 96, 'Ana', 'Datuimam', '09432411019', NULL, 'Mother', 'Poblacion', 'Siniloan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(97, 97, 'Luz', 'Vera', '09973150512', NULL, 'Mother', 'Anos', 'Bay', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(98, 98, 'Teresa', 'Escobin', '09200344359', NULL, 'Mother', 'Masapang', 'Bay', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(99, 99, 'Gloria', 'Eusebio', '09645985356', NULL, 'Mother', 'Canlubang', 'Los Baños', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(100, 100, 'Luz', 'Jobli', '09431642423', NULL, 'Mother', 'Anos', 'San Pablo', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(101, 101, 'Luz', 'Lantican', '09922653967', NULL, 'Mother', 'Parian', 'San Pablo', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(102, 102, 'Carmen', 'Lapitan', '09247709679', NULL, 'Mother', 'Anos', 'Calamba', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(103, 103, 'Elena', 'Macapagal', '09946237594', NULL, 'Mother', 'Batong Malake', 'Nagcarlan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(104, 104, 'Teresa', 'Macatangay', '09996703082', NULL, 'Mother', 'Burol', 'Nagcarlan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(105, 105, 'Maria', 'Madelo', '09810741110', NULL, 'Mother', 'Canlubang', 'Pila', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(106, 106, 'Marites', 'Magundayao', '09240712839', NULL, 'Mother', 'San Antonio', 'Siniloan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(107, 107, 'Rosa', 'Manese', '09274211616', NULL, 'Mother', 'Anos', 'Victoria', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(108, 108, 'Marites', 'Nabia', '09968704078', NULL, 'Mother', 'Banca-banca', 'Santa Cruz', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(109, 109, 'Cristina', 'Oracion', '09146914391', NULL, 'Mother', 'Halang', 'Cabuyao', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(110, 110, 'Carmen', 'Santillan', '09576954730', NULL, 'Mother', 'San Antonio', 'Biñan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(111, 111, 'Cristina', 'Servallos', '09351258749', NULL, 'Mother', 'Poblacion', 'San Pablo', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(112, 112, 'Elena', 'Suamen', '09968253265', NULL, 'Mother', 'Pittland', 'Pagsanjan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(113, 113, 'Carmen', 'Subiaga', '09494966219', NULL, 'Mother', 'Masapang', 'Liliw', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(114, 258, 'Rosa', 'Carandang', '09696883236', NULL, 'Mother', 'Masapang', 'Bay', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(115, 259, 'Luz', 'Paraiso', '09445188963', NULL, 'Mother', 'Batong Malake', 'Calamba', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(116, 260, 'Teresa', 'Bigtas', '09181925228', NULL, 'Mother', 'Batong Malake', 'Pila', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(117, 261, 'Cristina', 'Salangsang', '09773310341', NULL, 'Mother', 'Pittland', 'Nagcarlan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(118, 262, 'Carmen', 'Cuadoro', '09335320392', NULL, 'Mother', 'San Antonio', 'Pagsanjan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(119, 263, 'Luz', 'Malabanan', '09916212771', NULL, 'Mother', 'Halang', 'Calamba', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(120, 264, 'Teresa', 'Dollesin', '09198596307', NULL, 'Mother', 'Mayondon', 'Pagsanjan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(121, 265, 'Ana', 'Dilla', '09815710318', NULL, 'Mother', 'Banca-banca', 'Pagsanjan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(122, 266, 'Maria', 'Garcia', '09154246354', NULL, 'Mother', 'Marinig', 'San Pablo', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(123, 267, 'Ana', 'Reyes', '09606224705', NULL, 'Mother', 'San Antonio', 'Siniloan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(124, 268, 'Maria', 'SevillA', '09889329330', NULL, 'Mother', 'Anos', 'Los Baños', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(125, 269, 'Elena', 'Saure', '09594189472', NULL, 'Mother', 'Banca-banca', 'Pagsanjan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(126, 270, 'Teresa', 'Parcon', '09447327186', NULL, 'Mother', 'Canlubang', 'San Pablo', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(127, 271, 'Teresa', 'Ortiz', '09529938875', NULL, 'Mother', 'Marinig', 'Biñan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(128, 272, 'Rosa', 'Magat', '09486075279', NULL, 'Mother', 'Banca-banca', 'Pila', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(129, 273, 'Marites', 'Malatag', '09228736650', NULL, 'Mother', 'Masapang', 'Victoria', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(130, 274, 'Ana', 'Sanchez', '09854160408', NULL, 'Mother', 'Bayog', 'Calamba', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(131, 275, 'Teresa', 'Labajo', '09980600412', NULL, 'Mother', 'Batong Malake', 'Siniloan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(132, 276, 'Rosa', 'Erasga', '09682888095', NULL, 'Mother', 'Banca-banca', 'Bay', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(133, 277, 'Teresa', 'Gavilan', '09709676516', NULL, 'Mother', 'Pittland', 'Victoria', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(134, 278, 'Gloria', 'Boctot', '09847722106', NULL, 'Mother', 'Batong Malake', 'San Pablo', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(135, 279, 'Elena', 'Roaquin', '09480786010', NULL, 'Mother', 'Pittland', 'San Pablo', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(136, 280, 'Carmen', 'Palisoc', '09847318245', NULL, 'Mother', 'Batong Malake', 'Pagsanjan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(137, 281, 'Gloria', 'Salangsang', '09842230475', NULL, 'Mother', 'Halang', 'Pila', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(138, 282, 'Teresa', 'Bilan', '09561272855', NULL, 'Mother', 'San Antonio', 'Pila', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(139, 283, 'Ana', 'Tejada', '09516918607', NULL, 'Mother', 'Canlubang', 'Cabuyao', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(140, 284, 'Cristina', 'Alvarado', '09719688189', NULL, 'Mother', 'Bayog', 'Cabuyao', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(141, 285, 'Cristina', 'Gonzalez', '09731842846', NULL, 'Mother', 'Batong Malake', 'Nagcarlan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(142, 286, 'Maria', 'Fernandez', '09197504955', NULL, 'Mother', 'Mayondon', 'Los Baños', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(143, 287, 'Carmen', 'Murad', '09727344474', NULL, 'Mother', 'Banca-banca', 'Victoria', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(144, 288, 'Luz', 'Banasihan', '09426784844', NULL, 'Mother', 'Mayondon', 'Victoria', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(145, 289, 'Cristina', 'Camacho', '09581525643', NULL, 'Mother', 'Burol', 'Siniloan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(146, 290, 'Luz', 'Caspillo', '09900300136', NULL, 'Mother', 'Bayog', 'Cabuyao', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(147, 291, 'Maria', 'Morada', '09554318223', NULL, 'Mother', 'Marinig', 'Calamba', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(148, 292, 'Carmen', 'Amparo', '09920550259', NULL, 'Mother', 'Batong Malake', 'Bay', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(149, 293, 'Maria', 'Banasihan', '09153561491', NULL, 'Mother', 'Anos', 'Los Baños', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(150, 294, 'Marites', 'Solmerano', '09603080416', NULL, 'Mother', 'Mayondon', 'Santa Cruz', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(151, 295, 'Luz', 'Amarela', '09999697609', NULL, 'Mother', 'Poblacion', 'Biñan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(152, 296, 'Teresa', 'Añez', '09806674518', NULL, 'Mother', 'Banca-banca', 'Pila', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(153, 297, 'Carmen', 'Angeles', '09962165138', NULL, 'Mother', 'Halang', 'Santa Cruz', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(154, 298, 'Teresa', 'Caguya', '09392153162', NULL, 'Mother', 'Masapang', 'Siniloan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(155, 299, 'Ana', 'Caldeo', '09582513955', NULL, 'Mother', 'Bayog', 'Liliw', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(156, 300, 'Carmen', 'Casipong', '09927248793', NULL, 'Mother', 'Burol', 'Siniloan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(157, 301, 'Ana', 'Cortejo', '09202625114', NULL, 'Mother', 'Poblacion', 'Santa Cruz', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(158, 302, 'Cristina', 'Leon', '09849041065', NULL, 'Mother', 'Anos', 'Calamba', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(159, 303, 'Teresa', 'Ediza', '09349422183', NULL, 'Mother', 'Burol', 'Pagsanjan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(160, 304, 'Elena', 'Endiape', '09161316017', NULL, 'Mother', 'Poblacion', 'Liliw', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(161, 305, 'Maria', 'Escobar', '09404766508', NULL, 'Mother', 'Halang', 'Cabuyao', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(162, 306, 'Teresa', 'Escobin', '09611032739', NULL, 'Mother', 'Batong Malake', 'Victoria', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(163, 307, 'Rosa', 'Espinosa', '09723551736', NULL, 'Mother', 'Bambang', 'Los Baños', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(164, 308, 'Teresa', 'Eusebio', '09884458937', NULL, 'Mother', 'Marinig', 'San Pablo', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(165, 309, 'Teresa', 'Lapore', '09731585057', NULL, 'Mother', 'Mayondon', 'Siniloan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(166, 310, 'Carmen', 'Manalo', '09463030298', NULL, 'Mother', 'Canlubang', 'Biñan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(167, 311, 'Maria', 'Meña', '09270346876', NULL, 'Mother', 'Halang', 'Santa Cruz', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(168, 312, 'Gloria', 'Mendoza', '09245014435', NULL, 'Mother', 'Pittland', 'Pila', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(169, 313, 'Carmen', 'Milanes', '09785436420', NULL, 'Mother', 'Pittland', 'San Pablo', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(170, 314, 'Cristina', 'Monterola', '09218579379', NULL, 'Mother', 'Mayondon', 'Liliw', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(171, 315, 'Luz', 'Otano', '09429077116', NULL, 'Mother', 'Batong Malake', 'Victoria', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(172, 316, 'Elena', 'Patricio', '09370353195', NULL, 'Mother', 'Halang', 'Pagsanjan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(173, 317, 'Maria', 'Pingol', '09421647843', NULL, 'Mother', 'Batong Malake', 'Los Baños', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(174, 318, 'Teresa', 'Rodejo', '09564974624', NULL, 'Mother', 'Canlubang', 'Calamba', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(175, 319, 'Carmen', 'Rodriguez', '09709101638', NULL, 'Mother', 'Batong Malake', 'Santa Cruz', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(176, 320, 'Rosa', 'Miguel', '09210062075', NULL, 'Mother', 'Masapang', 'Liliw', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(177, 321, 'Luz', 'Vidal', '09808801853', NULL, 'Mother', 'Mayondon', 'Los Baños', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(178, 322, 'Rosa', 'Herrera', '09211246932', NULL, 'Mother', 'Bayog', 'Victoria', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(179, 323, 'Teresa', 'Abasola', '09884095473', NULL, 'Mother', 'Masapang', 'Calamba', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(180, 324, 'Cristina', 'Collado', '09528468052', NULL, 'Mother', 'Parian', 'Nagcarlan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(181, 325, 'Marites', 'Ferrer', '09608240867', NULL, 'Mother', 'Canlubang', 'San Pablo', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(182, 326, 'Teresa', 'Laforteza', '09525733016', NULL, 'Mother', 'Bambang', 'Liliw', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(183, 327, 'Maria', 'Manalo', '09972960631', NULL, 'Mother', 'Pittland', 'Cabuyao', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(184, 328, 'Cristina', 'Tandang', '09788188891', NULL, 'Mother', 'Parian', 'Siniloan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(185, 329, 'Elena', 'Eusebio', '09646694797', NULL, 'Mother', 'Canlubang', 'San Pablo', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(186, 330, 'Gloria', 'Carpio', '09140582950', NULL, 'Mother', 'Banca-banca', 'San Pablo', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(187, 331, 'Marites', 'Mañosca', '09396876989', NULL, 'Mother', 'Burol', 'Cabuyao', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(188, 332, 'Marites', 'Refrea', '09837288599', NULL, 'Mother', 'Pittland', 'Pagsanjan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(189, 333, 'Teresa', 'Reyes', '09824998348', NULL, 'Mother', 'Batong Malake', 'Victoria', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(190, 334, 'Teresa', 'Aguas', '09414668146', NULL, 'Mother', 'Parian', 'Pagsanjan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(191, 335, 'Ana', 'Andaya', '09244402173', NULL, 'Mother', 'Anos', 'Liliw', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(192, 336, 'Elena', 'Hubilla', '09746362682', NULL, 'Mother', 'Canlubang', 'Calamba', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(193, 337, 'Rosa', 'Alcantara', '09181212868', NULL, 'Mother', 'Burol', 'Santa Cruz', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(194, 338, 'Marites', 'Picardal', '09129189164', NULL, 'Mother', 'Anos', 'San Pablo', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(195, 339, 'Rosa', 'Villamayor', '09358930002', NULL, 'Mother', 'Anos', 'Nagcarlan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(196, 340, 'Luz', 'Cabuhat', '09795675896', NULL, 'Mother', 'Masapang', 'Calamba', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(197, 341, 'Carmen', 'Tendencia', '09980624489', NULL, 'Mother', 'Canlubang', 'Siniloan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(198, 342, 'Cristina', 'Dael', '09125462337', NULL, 'Mother', 'Parian', 'Pila', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(199, 343, 'Maria', 'Terbio', '09281522251', NULL, 'Mother', 'Mayondon', 'Biñan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28');
INSERT INTO `family_info` (`id`, `applicant_id`, `guardian_first_name`, `guardian_last_name`, `guardian_contact_number`, `guardian_email`, `guardian_relationship`, `guardian_barangay`, `guardian_municipality`, `guardian_province`, `father_first_name`, `father_middle_name`, `father_last_name`, `father_age`, `father_citizenship`, `father_educational_attainment`, `father_employment_status`, `father_occupation`, `mother_first_name`, `mother_middle_name`, `mother_last_name`, `mother_age`, `mother_citizenship`, `mother_educational_attainment`, `mother_employment_status`, `mother_occupation`, `created_at`, `updated_at`) VALUES
(200, 344, 'Ana', 'Masagca', '09462398310', NULL, 'Mother', 'Masapang', 'Cabuyao', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(201, 345, 'Cristina', 'Mataverde', '09667940879', NULL, 'Mother', 'Bayog', 'Biñan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(202, 346, 'Ana', 'Decena', '09236364346', NULL, 'Mother', 'Batong Malake', 'Pila', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(203, 347, 'Gloria', 'Empalmado', '09530829771', NULL, 'Mother', 'Bayog', 'Liliw', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(204, 348, 'Marites', 'Casili', '09708124854', NULL, 'Mother', 'Batong Malake', 'Cabuyao', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(205, 349, 'Marites', 'Blasco', '09250122760', NULL, 'Mother', 'Parian', 'Liliw', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(206, 350, 'Gloria', 'Lapitan', '09992678982', NULL, 'Mother', 'Halang', 'Pila', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(207, 351, 'Maria', 'Austria', '09229622804', NULL, 'Mother', 'Poblacion', 'Nagcarlan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(208, 352, 'Teresa', 'Magda', '09229284725', NULL, 'Mother', 'Anos', 'Victoria', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(209, 353, 'Maria', 'Sanchez', '09914842518', NULL, 'Mother', 'Anos', 'Liliw', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(210, 354, 'Rosa', 'Salvador', '09986464082', NULL, 'Mother', 'Batong Malake', 'Liliw', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(211, 355, 'Ana', 'Esporlas', '09389887707', NULL, 'Mother', 'Anos', 'Bay', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(212, 356, 'Cristina', 'Odian', '09550413208', NULL, 'Mother', 'Mayondon', 'Santa Cruz', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(213, 357, 'Carmen', 'Gacer', '09292868964', NULL, 'Mother', 'Batong Malake', 'Cabuyao', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(214, 358, 'Teresa', 'Castillo', '09549548828', NULL, 'Mother', 'Bayog', 'Biñan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(215, 359, 'Elena', 'Mendoza', '09652472422', NULL, 'Mother', 'Parian', 'Santa Cruz', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(216, 360, 'Gloria', 'Manibog', '09165864745', NULL, 'Mother', 'Halang', 'Liliw', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(217, 361, 'Gloria', 'Malabanan', '09824328531', NULL, 'Mother', 'Masapang', 'Cabuyao', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(218, 362, 'Rosa', 'Linga', '09731684776', NULL, 'Mother', 'Pittland', 'Santa Cruz', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(219, 363, 'Ana', 'Gallego', '09826012461', NULL, 'Mother', 'San Antonio', 'Calamba', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(220, 364, 'Teresa', 'Melante', '09903870731', NULL, 'Mother', 'Poblacion', 'Los Baños', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(221, 365, 'Elena', 'Soriano', '09956919750', NULL, 'Mother', 'Anos', 'Siniloan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(222, 366, 'Ana', 'Desepida', '09790086349', NULL, 'Mother', 'Parian', 'Los Baños', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(223, 367, 'Marites', 'Nañez', '09187872100', NULL, 'Mother', 'Banca-banca', 'Calamba', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(224, 368, 'Teresa', 'Manera', '09857078072', NULL, 'Mother', 'Masapang', 'Santa Cruz', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(225, 369, 'Elena', 'Lim', '09227719664', NULL, 'Mother', 'Canlubang', 'Santa Cruz', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(226, 370, 'Ana', 'Garcia', '09499107563', NULL, 'Mother', 'Bayog', 'Santa Cruz', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(227, 371, 'Maria', 'Romero', '09226725736', NULL, 'Mother', 'Poblacion', 'Nagcarlan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(228, 372, 'Marites', 'Fernandez', '09210948038', NULL, 'Mother', 'Marinig', 'Pagsanjan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(229, 373, 'Teresa', 'Aragon', '09269367637', NULL, 'Mother', 'Banca-banca', 'Siniloan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(230, 374, 'Maria', 'Alcantara', '09215504971', NULL, 'Mother', 'Parian', 'Los Baños', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(231, 375, 'Carmen', 'Alforja', '09803932601', NULL, 'Mother', 'Anos', 'Nagcarlan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(232, 376, 'Luz', 'Alvarez', '09835470589', NULL, 'Mother', 'San Antonio', 'Nagcarlan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(233, 377, 'Rosa', 'Amparo', '09703919697', NULL, 'Mother', 'Batong Malake', 'Los Baños', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(234, 378, 'Marites', 'Bautista', '09155720661', NULL, 'Mother', 'Bayog', 'Liliw', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(235, 379, 'Carmen', 'Bregonia', '09135655738', NULL, 'Mother', 'Canlubang', 'San Pablo', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(236, 380, 'Gloria', 'Briñas', '09891366513', NULL, 'Mother', 'Bambang', 'Los Baños', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(237, 381, 'Gloria', 'Canapi', '09603976946', NULL, 'Mother', 'Burol', 'Calamba', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(238, 382, 'Ana', 'Catindig', '09868676513', NULL, 'Mother', 'Bambang', 'Nagcarlan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(239, 383, 'Teresa', 'Cayetano', '09311400569', NULL, 'Mother', 'Pittland', 'Pila', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(240, 384, 'Carmen', 'Leon', '09276841432', NULL, 'Mother', 'Burol', 'Nagcarlan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(241, 385, 'Teresa', 'Rosa', '09829988666', NULL, 'Mother', 'Burol', 'Nagcarlan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(242, 386, 'Elena', 'Flores', '09815411677', NULL, 'Mother', 'Parian', 'Nagcarlan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(243, 387, 'Ana', 'Gonzales', '09316550028', NULL, 'Mother', 'Mayondon', 'Liliw', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(244, 388, 'Cristina', 'Guzman', '09358214035', NULL, 'Mother', 'Bayog', 'Biñan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(245, 389, 'Teresa', 'Looc', '09495662575', NULL, 'Mother', 'Bambang', 'Santa Cruz', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(246, 390, 'Marites', 'Macabulos', '09738593008', NULL, 'Mother', 'Halang', 'Los Baños', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(247, 391, 'Marites', 'Maranan', '09611529101', NULL, 'Mother', 'Bambang', 'Pagsanjan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(248, 392, 'Maria', 'Montecilo', '09653750031', NULL, 'Mother', 'Burol', 'Pila', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(249, 393, 'Cristina', 'Opulencia', '09363492748', NULL, 'Mother', 'Burol', 'Siniloan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(250, 394, 'Elena', 'Peleño', '09698057676', NULL, 'Mother', 'Batong Malake', 'Los Baños', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(251, 395, 'Carmen', 'Polistico', '09923329455', NULL, 'Mother', 'Burol', 'Pila', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(252, 396, 'Maria', 'Prudente', '09241988902', NULL, 'Mother', 'Poblacion', 'Liliw', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(254, 398, 'Gloria', 'Antonio', '09864654399', NULL, 'Mother', 'Anos', 'Siniloan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(255, 399, 'Ana', 'Suiza', '09830352135', NULL, 'Mother', 'Parian', 'Nagcarlan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(256, 169, 'Jennifer', 'Oboza', NULL, NULL, 'Mother', NULL, NULL, NULL, 'Vic John', NULL, 'Salen', NULL, NULL, NULL, NULL, NULL, 'Jennifer', NULL, 'Oboza', NULL, NULL, NULL, NULL, NULL, '2026-05-07 07:42:08', '2026-05-09 13:37:50'),
(257, 203, 'Jennifer', 'Oboza', NULL, NULL, 'Mother', 'Mayondon', 'Los Baños', 'Laguna', 'Vic John', 'France', 'Salen', NULL, 'Filipino', NULL, NULL, NULL, 'Jennifer', 'Sabado', 'Oboza', NULL, 'Filipino', NULL, NULL, NULL, '2026-05-10 12:40:33', '2026-05-10 12:42:05');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `grade_id` int(11) NOT NULL,
  `enrolled_subject_id` int(11) NOT NULL,
  `class_engagement` decimal(5,2) DEFAULT NULL COMMENT 'Attendance, Behavior, Interaction, Participation, Recitation – 20%',
  `learning_outputs` decimal(5,2) DEFAULT NULL COMMENT 'Assigned Activities, Exercises, Seatworks, Projects – 20%',
  `quizzes` decimal(5,2) DEFAULT NULL COMMENT '20%',
  `midterm` decimal(5,2) DEFAULT NULL COMMENT 'Midterm Exam – 20%',
  `final` decimal(5,2) DEFAULT NULL COMMENT 'Finals Exam – 20%',
  `total` decimal(5,2) GENERATED ALWAYS AS (coalesce(`class_engagement`,0) * 0.20 + coalesce(`learning_outputs`,0) * 0.20 + coalesce(`quizzes`,0) * 0.20 + coalesce(`midterm`,0) * 0.20 + coalesce(`final`,0) * 0.20) STORED,
  `final_grade` varchar(10) GENERATED ALWAYS AS (case when `class_engagement` is null or `learning_outputs` is null or `quizzes` is null or `midterm` is null or `final` is null then NULL when (coalesce(`class_engagement`,0) + coalesce(`learning_outputs`,0) + coalesce(`quizzes`,0) + coalesce(`midterm`,0) + coalesce(`final`,0)) / 5 >= 99 then '1.00' when (coalesce(`class_engagement`,0) + coalesce(`learning_outputs`,0) + coalesce(`quizzes`,0) + coalesce(`midterm`,0) + coalesce(`final`,0)) / 5 >= 96 then '1.25' when (coalesce(`class_engagement`,0) + coalesce(`learning_outputs`,0) + coalesce(`quizzes`,0) + coalesce(`midterm`,0) + coalesce(`final`,0)) / 5 >= 93 then '1.50' when (coalesce(`class_engagement`,0) + coalesce(`learning_outputs`,0) + coalesce(`quizzes`,0) + coalesce(`midterm`,0) + coalesce(`final`,0)) / 5 >= 90 then '1.75' when (coalesce(`class_engagement`,0) + coalesce(`learning_outputs`,0) + coalesce(`quizzes`,0) + coalesce(`midterm`,0) + coalesce(`final`,0)) / 5 >= 87 then '2.00' when (coalesce(`class_engagement`,0) + coalesce(`learning_outputs`,0) + coalesce(`quizzes`,0) + coalesce(`midterm`,0) + coalesce(`final`,0)) / 5 >= 84 then '2.25' when (coalesce(`class_engagement`,0) + coalesce(`learning_outputs`,0) + coalesce(`quizzes`,0) + coalesce(`midterm`,0) + coalesce(`final`,0)) / 5 >= 81 then '2.50' when (coalesce(`class_engagement`,0) + coalesce(`learning_outputs`,0) + coalesce(`quizzes`,0) + coalesce(`midterm`,0) + coalesce(`final`,0)) / 5 >= 78 then '2.75' when (coalesce(`class_engagement`,0) + coalesce(`learning_outputs`,0) + coalesce(`quizzes`,0) + coalesce(`midterm`,0) + coalesce(`final`,0)) / 5 >= 75 then '3.00' when (coalesce(`class_engagement`,0) + coalesce(`learning_outputs`,0) + coalesce(`quizzes`,0) + coalesce(`midterm`,0) + coalesce(`final`,0)) / 5 >= 70 then '4.0' else '5.0' end) STORED,
  `remarks` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

CREATE TABLE `instructors` (
  `Instructor_ID` int(11) NOT NULL,
  `Last_Name` varchar(100) NOT NULL,
  `First_Name` varchar(100) NOT NULL,
  `Middle_Name` varchar(50) DEFAULT NULL,
  `Suffix_Title` varchar(50) DEFAULT NULL,
  `Degree` varchar(50) DEFAULT NULL,
  `Subject_ID` int(11) DEFAULT NULL,
  `College_ID` int(11) DEFAULT NULL,
  `Campus_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`Instructor_ID`, `Last_Name`, `First_Name`, `Middle_Name`, `Suffix_Title`, `Degree`, `Subject_ID`, `College_ID`, `Campus_ID`) VALUES
(1, 'Matute', 'Alejandro', 'V.', 'Jr.', 'MIT', 1, 3, 1),
(2, 'Vicedo', 'Andres', 'R.', NULL, 'MIT', 2, 3, 1),
(3, 'Joval', 'Carolina', 'R.', NULL, NULL, 3, 1, 1),
(4, 'Gulay', 'Crisanto', 'F.', NULL, NULL, 4, 1, 1),
(5, 'Elomina', 'Rowan', 'N.', 'Dr.', 'PhD', 5, 3, 1),
(6, 'Sapin', 'Sherwin', 'B.', 'Dr.', 'PhD', 6, 3, 1),
(7, 'Catedrilla', 'Gene Marck', 'B.', NULL, 'MIT', 7, 3, 1),
(8, 'Lerios', 'Jefferson', 'L.', NULL, 'DIT', 8, 3, 1),
(9, 'Millanes', 'Jhoco', 'S.', NULL, NULL, 9, 3, 1),
(10, 'Padallan', 'Jocelyn ', 'O.', NULL, 'MIT', 10, 8, 1),
(11, 'Labayne', 'Jonalyn Joy', 'B.', NULL, 'MIT', 11, 8, 1),
(12, 'Asor', 'Jonardo', 'R.', NULL, 'MIT', 12, 8, 1),
(13, 'Echalar', 'Loyd', 'S.', NULL, 'DIT', 13, 8, 1),
(14, 'Cardona', 'Maribel', 'B.', NULL, NULL, 14, 1, 1),
(15, 'Ramos', 'Mike Philip', 'T.', NULL, 'MIT', 15, 3, 1),
(16, 'Moldez', 'Maverick', NULL, NULL, NULL, 16, 3, 1),
(17, 'Jebone', 'Moris', 'V.', NULL, 'MIT', 17, 3, 1),
(18, 'Anquilo', 'Mylene', 'V.', NULL, NULL, 18, 8, 1),
(19, 'Suyat', 'Wilson', 'B.', NULL, 'MIT', 19, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `intended_course`
--

CREATE TABLE `intended_course` (
  `id` int(10) UNSIGNED NOT NULL,
  `applicant_id` int(10) UNSIGNED NOT NULL,
  `Program_Code` varchar(20) NOT NULL,
  `Specialization` varchar(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `intended_course`
--

INSERT INTO `intended_course` (`id`, `applicant_id`, `Program_Code`, `Specialization`, `created_at`, `updated_at`) VALUES
(1, 1, 'BSCS', NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(2, 2, 'BSCS', NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(3, 3, 'BSCS', NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(4, 4, 'BSCS', NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(5, 5, 'BSCS', NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(6, 6, 'BSCS', NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(7, 7, 'BSCS', NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(8, 8, 'BSCS', NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(9, 9, 'BSCS', NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(10, 10, 'BSCS', NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(11, 11, 'BSCS', NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(12, 12, 'BSCS', NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(13, 13, 'BSCS', NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(14, 14, 'BSCS', NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(15, 15, 'BSCS', NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(16, 16, 'BSCS', NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(17, 17, 'BSCS', NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(18, 18, 'BSCS', NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(19, 19, 'BSCS', NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(20, 20, 'BSCS', NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(21, 21, 'BSCS', NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(22, 22, 'BSCS', NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(23, 23, 'BSCS', NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(24, 24, 'BSCS', NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(25, 25, 'BSCS', NULL, '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(26, 26, 'BSIT', 'SMP', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(27, 27, 'BSIT', 'SMP', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(28, 28, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(29, 29, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(30, 30, 'BSIT', 'SMP', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(31, 31, 'BSIT', 'SMP', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(32, 32, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(33, 33, 'BSIT', 'AMG', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(34, 34, 'BSIT', 'AMG', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(35, 35, 'BSIT', 'AMG', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(36, 36, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(37, 37, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(38, 38, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(39, 39, 'BSIT', 'AMG', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(40, 40, 'BSIT', 'SMP', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(41, 41, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(42, 42, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(43, 43, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(44, 44, 'BSIT', 'AMG', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(45, 45, 'BSIT', 'SMP', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(46, 46, 'BSIT', 'AMG', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(47, 47, 'BSIT', 'AMG', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(48, 48, 'BSIT', 'AMG', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(49, 49, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(50, 50, 'BSIT', 'AMG', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(51, 51, 'BSIT', 'SMP', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(52, 52, 'BSIT', 'SMP', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(53, 53, 'BSIT', 'SMP', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(54, 54, 'BSIT', 'SMP', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(55, 55, 'BSIT', 'AMG', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(56, 56, 'BSIT', 'SMP', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(57, 57, 'BSIT', 'SMP', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(58, 58, 'BSIT', 'AMG', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(59, 59, 'BSIT', 'AMG', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(60, 60, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(61, 61, 'BSIT', 'AMG', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(62, 62, 'BSIT', 'AMG', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(63, 63, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(64, 64, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(65, 65, 'BSIT', 'AMG', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(66, 66, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(67, 67, 'BSIT', 'SMP', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(68, 68, 'BSIT', 'AMG', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(69, 69, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(70, 70, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(71, 71, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(72, 72, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(73, 73, 'BSIT', 'AMG', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(74, 74, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(75, 75, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(76, 76, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(77, 77, 'BSIT', 'SMP', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(78, 78, 'BSIT', 'SMP', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(79, 79, 'BSIT', 'AMG', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(80, 80, 'BSIT', 'AMG', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(81, 81, 'BSIT', 'SMP', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(82, 82, 'BSIT', 'SMP', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(83, 83, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(84, 84, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(85, 85, 'BSIT', 'SMP', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(86, 86, 'BSIT', 'AMG', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(87, 87, 'BSIT', 'SMP', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(88, 88, 'BSIT', 'AMG', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(89, 89, 'BSIT', 'SMP', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(90, 90, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(91, 91, 'BSIT', 'AMG', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(92, 92, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(93, 93, 'BSIT', 'SMP', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(94, 94, 'BSIT', 'AMG', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(95, 95, 'BSIT', 'AMG', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(96, 96, 'BSIT', 'AMG', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(97, 97, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(98, 98, 'BSIT', 'SMP', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(99, 99, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(100, 100, 'BSIT', 'AMG', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(101, 101, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(102, 102, 'BSIT', 'AMG', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(103, 103, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(104, 104, 'BSIT', 'SMP', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(105, 105, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(106, 106, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(107, 107, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(108, 108, 'BSIT', 'WMAD', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(109, 109, 'BSIT', 'SMP', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(110, 110, 'BSIT', 'AMG', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(111, 111, 'BSIT', 'AMG', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(112, 112, 'BSIT', 'AMG', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(113, 113, 'BSIT', 'SMP', '2026-05-07 02:12:00', '2026-05-07 02:12:00'),
(114, 258, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(115, 259, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(116, 260, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(117, 261, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(118, 262, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(119, 263, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(120, 264, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(121, 265, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(122, 266, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(123, 267, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(124, 268, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(125, 269, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(126, 270, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(127, 271, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(128, 272, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(129, 273, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(130, 274, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(131, 275, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(132, 276, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(133, 277, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(134, 278, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(135, 279, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(136, 280, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(137, 281, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(138, 282, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(139, 283, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(140, 284, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(141, 285, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(142, 286, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(143, 287, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(144, 288, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(145, 289, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(146, 290, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(147, 291, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(148, 292, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(149, 293, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(150, 294, 'BSCS', NULL, '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(151, 295, 'BSIT', 'AMG', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(152, 296, 'BSIT', 'AMG', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(153, 297, 'BSIT', 'AMG', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(154, 298, 'BSIT', 'AMG', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(155, 299, 'BSIT', 'AMG', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(156, 300, 'BSIT', 'AMG', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(157, 301, 'BSIT', 'AMG', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(158, 302, 'BSIT', 'AMG', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(159, 303, 'BSIT', 'AMG', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(160, 304, 'BSIT', 'AMG', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(161, 305, 'BSIT', 'AMG', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(162, 306, 'BSIT', 'AMG', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(163, 307, 'BSIT', 'AMG', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(164, 308, 'BSIT', 'AMG', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(165, 309, 'BSIT', 'AMG', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(166, 310, 'BSIT', 'AMG', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(167, 311, 'BSIT', 'AMG', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(168, 312, 'BSIT', 'AMG', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(169, 313, 'BSIT', 'AMG', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(170, 314, 'BSIT', 'AMG', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(171, 315, 'BSIT', 'AMG', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(172, 316, 'BSIT', 'AMG', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(173, 317, 'BSIT', 'AMG', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(174, 318, 'BSIT', 'AMG', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(175, 319, 'BSIT', 'AMG', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(176, 320, 'BSIT', 'AMG', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(177, 321, 'BSIT', 'AMG', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(178, 322, 'BSIT', 'AMG', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(179, 323, 'BSIT', 'SMP', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(180, 324, 'BSIT', 'SMP', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(181, 325, 'BSIT', 'SMP', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(182, 326, 'BSIT', 'SMP', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(183, 327, 'BSIT', 'SMP', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(184, 328, 'BSIT', 'SMP', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(185, 329, 'BSIT', 'SMP', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(186, 330, 'BSIT', 'SMP', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(187, 331, 'BSIT', 'SMP', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(188, 332, 'BSIT', 'SMP', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(189, 333, 'BSIT', 'SMP', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(190, 334, 'BSIT', 'SMP', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(191, 335, 'BSIT', 'SMP', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(192, 336, 'BSIT', 'SMP', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(193, 337, 'BSIT', 'SMP', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(194, 338, 'BSIT', 'SMP', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(195, 339, 'BSIT', 'SMP', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(196, 340, 'BSIT', 'SMP', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(197, 341, 'BSIT', 'SMP', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(198, 342, 'BSIT', 'SMP', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(199, 343, 'BSIT', 'SMP', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(200, 344, 'BSIT', 'SMP', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(201, 345, 'BSIT', 'SMP', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(202, 346, 'BSIT', 'SMP', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(203, 347, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(204, 348, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(205, 349, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(206, 350, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(207, 351, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(208, 352, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(209, 353, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(210, 354, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(211, 355, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(212, 356, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(213, 357, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(214, 358, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(215, 359, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(216, 360, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(217, 361, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(218, 362, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(219, 363, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(220, 364, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(221, 365, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(222, 366, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(223, 367, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(224, 368, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(225, 369, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(226, 370, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(227, 371, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(228, 372, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(229, 373, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(230, 374, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(231, 375, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(232, 376, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(233, 377, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(234, 378, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(235, 379, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(236, 380, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(237, 381, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(238, 382, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(239, 383, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(240, 384, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(241, 385, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(242, 386, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(243, 387, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(244, 388, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(245, 389, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(246, 390, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(247, 391, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(248, 392, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(249, 393, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(250, 394, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(251, 395, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(252, 396, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(254, 398, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(255, 399, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(256, 169, 'BSIT', 'WMAD', '2026-05-07 07:42:35', '2026-05-07 07:42:35'),
(257, 114, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(258, 118, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(259, 119, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(260, 120, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(261, 121, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(262, 122, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(263, 123, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(264, 124, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(265, 125, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(266, 126, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(267, 127, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(268, 128, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(269, 129, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(270, 130, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(271, 131, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(272, 132, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(273, 133, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(274, 134, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(275, 135, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(276, 136, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(277, 137, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(278, 138, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(279, 139, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(280, 140, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(281, 141, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(282, 142, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(283, 143, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(284, 144, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(285, 145, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(286, 146, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(287, 147, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(288, 148, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(289, 149, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(290, 150, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(291, 151, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(292, 152, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(293, 153, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(294, 154, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(295, 155, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(296, 156, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(297, 157, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(298, 158, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(299, 159, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(300, 160, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(301, 161, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(302, 162, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(303, 163, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(304, 164, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(305, 165, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(306, 166, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(307, 167, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(308, 168, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(309, 170, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(310, 171, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(311, 172, 'BSIT', NULL, '2026-05-10 11:52:05', '2026-05-10 11:52:05'),
(312, 115, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(313, 116, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(314, 117, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(315, 173, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(316, 174, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(317, 175, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(318, 176, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(319, 177, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(320, 178, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(321, 179, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(322, 180, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(323, 181, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(324, 182, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(325, 183, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(326, 184, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(327, 185, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(328, 186, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(329, 187, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(330, 188, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(331, 189, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(332, 190, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(333, 191, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(334, 192, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(335, 193, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(336, 194, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(337, 195, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(338, 196, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(339, 197, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(340, 198, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(341, 199, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(342, 200, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(343, 201, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(344, 202, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(345, 203, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(346, 204, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(347, 205, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(348, 206, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(349, 207, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(350, 208, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(351, 209, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(352, 210, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(353, 211, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(354, 212, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(355, 213, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(356, 214, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(357, 215, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(358, 216, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(359, 217, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(360, 218, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(361, 219, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(362, 220, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(363, 221, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(364, 222, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(365, 223, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(366, 224, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(367, 225, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(368, 226, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(369, 227, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(370, 228, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(371, 229, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(372, 230, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(373, 231, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(374, 232, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(375, 233, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(376, 234, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(377, 235, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(378, 236, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(379, 237, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(380, 238, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(381, 239, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(382, 240, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(383, 241, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(384, 242, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(385, 243, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(386, 244, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(387, 245, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(388, 246, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(389, 247, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(390, 248, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(391, 249, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(392, 250, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(393, 251, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(394, 252, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(395, 253, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(396, 254, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(397, 255, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(398, 256, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30'),
(399, 257, 'BSIT', NULL, '2026-05-10 12:07:30', '2026-05-10 12:07:30');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `year_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `Program_Code` varchar(20) NOT NULL,
  `Program_Name` varchar(120) NOT NULL,
  `college_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`Program_Code`, `Program_Name`, `college_id`) VALUES
('BEED', 'Bachelor of Elementary Education', 8),
('BSA', 'BS Accountancy', 2),
('BSAFBM', 'BS Agri-Fisheries Business Management', 5),
('BSBA', 'BS Business Administration', 2),
('BSC', 'BS Criminology', 4),
('BSCS', 'BS Computer Science', 3),
('BSED', 'Bachelor of Secondary Education', 8),
('BSF', 'BS Fisheries', 5),
('BSFE', 'BS Fishery Education', 5),
('BSFT', 'BS Food Technology', 6),
('BSHRM', 'BS Hotel and Restaurant Management', 7),
('BSIT', 'BS Information Technology', 3),
('BSND', 'BS Nutrition and Dietetics', 6),
('BSP', 'BS Psychology', 1),
('BST', 'BS Tourism', 7);

-- --------------------------------------------------------

--
-- Table structure for table `receipt`
--

CREATE TABLE `receipt` (
  `receipt_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `receipt_number` varchar(50) NOT NULL,
  `issued_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registrar`
--

CREATE TABLE `registrar` (
  `registrar_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL DEFAULT 'Staff',
  `status` varchar(20) NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registrar`
--

INSERT INTO `registrar` (`registrar_id`, `first_name`, `last_name`, `email`, `username`, `password`, `role`, `status`) VALUES
(1, 'Maria', 'Santos', 'maria.santos@school.edu', 'msantos', 'password123', 'Head', 'Active'),
(2, 'Juan', 'Dela Cruz', 'juan.delacruz@school.edu', 'jdelacruz', 'password123', 'Staff', 'Active'),
(3, 'Anna', 'Reyes', 'anna.reyes@school.edu', 'areyes', 'password123', 'Staff', 'Inactive'),
(4, 'Carlos', 'Garcia', 'carlos.garcia@school.edu', 'cgarcia', 'password123', 'Assistant', 'Active'),
(5, 'Lucia', 'Torres', 'lucia.torres@school.edu', 'ltorres', 'password123', 'Staff', 'Inactive');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `year_id` int(11) NOT NULL,
  `day` varchar(20) NOT NULL,
  `time_start` time NOT NULL,
  `time_end` time NOT NULL,
  `room` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `section_id` int(11) NOT NULL,
  `section_name` varchar(50) NOT NULL,
  `program_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year_level` int(11) NOT NULL,
  `campus_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`section_id`, `section_name`, `program_code`, `year_level`, `campus_id`) VALUES
(1, 'BSIT-2A', 'BSIT', 2, 1),
(2, 'BSCS-1A', 'BSCS', 1, 1),
(3, 'BSCS-2A', 'BSCS', 2, 1),
(4, 'BSCS-2B', 'BSCS', 2, 1),
(5, 'BSCS-3A', 'BSCS', 3, 1),
(6, 'BSIT-1A', 'BSIT', 1, 1),
(7, 'BSIT-1B', 'BSIT', 1, 1),
(8, 'BSIT-1C', 'BSIT', 1, 1),
(9, 'BSIT-2B', 'BSIT', 2, 1),
(10, 'BSIT-2C', 'BSIT', 2, 1),
(11, 'BSIT-2D', 'BSIT', 2, 1),
(12, 'BSIT-3AMG', 'BSIT', 3, 1),
(13, 'BSIT-3SMP', 'BSIT', 3, 1),
(14, 'BSIT-3WMAD-A', 'BSIT', 3, 1),
(15, 'BSIT-3WMAD-B', 'BSIT', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `semester_id` int(11) NOT NULL,
  `semester_name` enum('1st Semester','2nd Semester','Inter Semester') NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('Open','Closed') DEFAULT 'Open'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`semester_id`, `semester_name`, `start_date`, `end_date`, `status`) VALUES
(1, '1st Semester', '2025-08-12', '2025-12-20', 'Closed'),
(2, '2nd Semester', '2026-01-13', '2026-05-30', 'Open'),
(3, 'Inter Semester', '2026-06-10', '2026-07-25', 'Closed');

-- --------------------------------------------------------

--
-- Table structure for table `specializations`
--

CREATE TABLE `specializations` (
  `id` int(10) UNSIGNED NOT NULL,
  `Program_Code` varchar(20) NOT NULL,
  `spec_code` varchar(20) NOT NULL,
  `spec_name` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `specializations`
--

INSERT INTO `specializations` (`id`, `Program_Code`, `spec_code`, `spec_name`) VALUES
(1, 'BSIT', 'WMAD', 'Web and Mobile Application Development'),
(2, 'BSIT', 'SMP', 'Service Management Program'),
(3, 'BSIT', 'AMG', 'Animation Motion Graphics'),
(4, 'BSED', 'MATH', 'Mathematics'),
(5, 'BSED', 'MAPEH', 'MAPEH'),
(6, 'BSED', 'TLE', 'Technology & Livelihood Education'),
(7, 'BSED', 'ENG', 'English'),
(8, 'BSED', 'FIL', 'Filipino'),
(9, 'BSED', 'GS', 'General Science');

-- --------------------------------------------------------

--
-- Table structure for table `special_programs`
--

CREATE TABLE `special_programs` (
  `special_id` int(11) NOT NULL,
  `college_id` int(11) DEFAULT NULL,
  `special_name` varchar(200) NOT NULL,
  `category` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `special_programs`
--

INSERT INTO `special_programs` (`special_id`, `college_id`, `special_name`, `category`) VALUES
(1, 8, 'Intensive Course in English Proficiency', 'Special Program'),
(2, 8, 'General Elementary Education', 'Area of Specialization'),
(3, 8, 'Pre-Elementary Education', 'Area of Specialization'),
(4, 8, 'Certificate in Teaching Proficiency (CTP)', 'Area of Specialization');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `student_id` varchar(20) NOT NULL COMMENT 'Human-facing ID — YYYY-NNNN',
  `applicant_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'FK to applicants.student_id; NULL for pre-portal students',
  `first_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `suffix` varchar(20) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `contact_number` varchar(30) DEFAULT NULL,
  `program_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `campus` varchar(80) DEFAULT NULL,
  `year_level` varchar(20) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `semester_id` int(11) DEFAULT NULL,
  `Enrollment_Date` date DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `Status` varchar(50) DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_id`, `applicant_id`, `first_name`, `middle_name`, `last_name`, `suffix`, `email`, `contact_number`, `program_code`, `campus`, `year_level`, `section_id`, `semester_id`, `Enrollment_Date`, `created_at`, `Status`) VALUES
(1, '0425-0377', 1, 'Janiella', 'N.', 'Nodo', NULL, 'janiellanodo7@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '1st Year', 2, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(2, '0425-0384', 2, 'Tressen Anne', 'M.', 'Valdez', NULL, 'vtressenanne@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '1st Year', 2, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(3, '0424-0353', 3, 'Jan', 'Salvador', 'Terania', NULL, 'isntthiszoe@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '1st Year', 2, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(4, '0425-0327', 4, 'Jasmine Quintina', 'L.', 'Roque', NULL, 'jasmine.roque0707@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '1st Year', 2, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(5, '0425-0364', 5, 'Mary Elisse Cyminette', NULL, 'Calinga', NULL, 'eli.calinga@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '1st Year', 2, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(6, '0425-0409', 6, 'Anna Marie', 'R.', 'Quilloy', NULL, 'annamariequilloy36@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '1st Year', 2, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(7, '0425-0435', 7, 'Raiza Mae', 'Q.', 'Lampasa', NULL, 'lampasaraiza@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '1st Year', 2, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(8, '0425-0375', 8, 'Cedrick', 'A.', 'Eusebio', NULL, 'cedrickeusebio4@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '1st Year', 2, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(9, '0425-0886', 9, 'John Romel', 'L.', 'Daculong', NULL, 'johnromeldaculong@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '1st Year', 2, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(10, '0425-0411', 10, 'Lance Vincent', 'U.', 'Darum', NULL, 'darumvincentlance@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '1st Year', 2, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(11, '0425-0467', 11, 'John Jahred', 'L.', 'Lapiz', NULL, 'jahredlapiz20@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '1st Year', 2, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(12, '0425-0365', 12, 'Alecxis Cyrus', 'M.', 'Garcia', NULL, 'alecxiscyrusgarcia@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '1st Year', 2, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(13, '0425-0358', 13, 'Mark Angelo', 'C.', 'Yakit', NULL, 'yakitmarkangelo0@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '1st Year', 2, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(14, '0425-0430', 14, 'Luigi Sebastian', 'I.', 'Bautista', NULL, 'luigisebastianbautista@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '1st Year', 2, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(15, '0425-0317', 15, 'Gino', NULL, 'Vargas', NULL, 'ginovargas2007@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '1st Year', 2, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(16, '0425-0319', 16, 'Joseph', 'Enricoh', 'Tagle', NULL, 'tagleenricoh@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '1st Year', 2, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(17, '0425-0581', 17, 'John Ezequiel DL.', NULL, 'Vasquez', NULL, 'jedeleon0719@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '1st Year', 2, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(18, '0425-0422', 18, 'Elvis Joshua', 'V.', 'Escobido', NULL, 'joshuaescobido777@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '1st Year', 2, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(19, '0425-0890', 19, 'Alexa Marie', 'D.', 'Alejandro', NULL, 'alejandroalexamarie@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '1st Year', 2, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(20, '0425-0432', 20, 'Arnie Angelie', 'F.', 'Arabis', NULL, 'arniearabis@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '1st Year', 2, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(21, '0425-0996', 21, 'Jhecilee I. De', NULL, 'Luna', NULL, 'jhecileedeluna12@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '1st Year', 2, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(22, '0425-0394', 22, 'Brandon Lance', 'B.', 'Ruiz', NULL, 'brandon.lance.b.ruiz@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '1st Year', 2, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(23, '0425-0417', 23, 'Aldrich', 'B.', 'Danieles', NULL, 'aldrich.danieles15@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '1st Year', 2, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(24, '0425-0315', 24, 'Jed Owen', 'D.', 'Oruga', NULL, 'owenjedoruga@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '1st Year', 2, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(25, '0424-0074', 25, 'John Russel', 'A.', 'Blanco', NULL, 'blancojohnrussel@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 4, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(26, '0424-0654', 26, 'Marriane Angel', 'B.', 'Campaner', NULL, 'marrianecampaner@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 4, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(27, '0424-0057', 27, 'Enrique D. Dela', NULL, 'Soledad', 'Jr', 'delasoledadenrique08@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 4, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(28, '0424-0672', 28, 'Andrew', 'A.', 'Flores', NULL, 'andrewartiflores@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 4, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(29, '0424-0670', 29, 'Paul', 'M.', 'Llanes', NULL, 'paulllanes23@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 4, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(30, '0424-0879', 30, 'Jerusalyn', 'D.', 'Mundia', NULL, 'jerumundia18@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 4, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(31, '0424-0804', 31, 'Princess', 'C.', 'Ocampo', NULL, 'ocampoprincess0219@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 4, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(32, '0424-0886', 32, 'Carl Joseph', 'E.', 'Rosales', NULL, 'rosalescarl20@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 4, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(33, '0421-3228', 33, 'Jhon Paul', 'B.', 'Sanvalentin', NULL, 'sanvalentinjhonpaul42@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 4, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(34, '0424-0901', 34, 'Luigie', 'G.', 'Sanchez', NULL, 'sanchezluigie@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 4, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(35, '0424-0187', 35, 'John Carlo', 'M.', 'Sojor', NULL, 'johncarlosojor2@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 4, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(36, '0424-0527', 36, 'Daniel', 'F.', 'Tejada', NULL, 'danieltejadaoctober@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 4, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(37, '0424-0525', 37, 'Lauren', 'M.', 'Undadi', NULL, 'undadilauren13@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 4, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(38, '0424-0250', 38, 'Lance Edwin', 'M.', 'Maligaya', NULL, 'lanceedwinmarquezmaligaya@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 3, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(39, '0424-0503', 39, 'Karl Michael', 'E.', 'Bautista', NULL, 'sampereketsu1@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 3, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(40, '0424-1104', 40, 'Hermie', NULL, 'Dacallos', NULL, 'hermiekadacallos@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 3, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(41, '0424-0065', 41, 'Ron', NULL, 'Palis', NULL, 'palisron339@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 3, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(42, '0424-0135', 42, 'Irah Shane', 'P.', 'Bacolod', NULL, 'shanebcld@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 3, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(43, '0424-0633', 43, 'Justine', 'M.', 'Natal', NULL, 'justinnatal01@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 3, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(44, '0424-0066', 44, 'Crislien Ariane', 'S.', 'Barayang', NULL, 'eyrianbarayang@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 3, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(45, '0424-0547', 45, 'Jian Carl', 'C.', 'Malihan', NULL, 'jiancaraitm23@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 3, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(46, '0424-0601', 46, 'Khim Harvy', 'C.', 'Villamayor', NULL, 'vkhimharvy@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 3, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(47, '0424-0151', 47, 'Giancarlo', 'G.', 'Botones', NULL, 'gianbotones05@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 3, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(48, '0424-0393', 48, 'Vashty', 'J.', 'Bacorro', NULL, 'vashty.bacorro@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 3, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(49, '0424-0005', 49, 'Maria Princessa Miccahella', 'M.', 'Mamaril', NULL, 'miccahella04@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 3, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(50, '0424-0576', 50, 'Jasper', 'M.', 'Gonzales', NULL, 'juuzuodesu@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 3, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(51, '0424-0473', 51, 'Jeza', 'M.', 'Gonzales', NULL, 'azegonzales015@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 3, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(52, '0424-0830', 52, 'Ronnel', 'E.', 'Asinas', NULL, 'ronnelasinas75@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 3, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(53, '0424-0528', 53, 'Rafael Louise', 'R.', 'Perez', NULL, 'prafaellouise@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 3, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(54, '0424-0629', 54, 'Jose Mari Elliflor', 'J.', 'Macaleng', NULL, 'macalengjm@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 3, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(55, '0024-0041', 55, 'Kenneth', 'Z', 'Punla', NULL, 'kennethpunla62@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 3, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(56, '0424-0431', 56, 'Mark Philip', 'L.', 'Esplana', NULL, 'esplanam60@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '2nd Year', 3, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(57, '0423-3647', 57, 'Neil Matthew', 'B.', 'Carandang', NULL, 'neilmatthewcarandang@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(58, '0423-3628', 58, 'Arwil Martin', 'S.', 'Paraiso', NULL, 'arwilmartinsparaisoo@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(59, '0423-3649', 59, 'Queen Lee', 'L.', 'Bigtas', NULL, 'bigtasqueenlee05@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(60, '0423-3704', 60, 'French', 'P.', 'Cuadoro', NULL, 'troy300otfgbg@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(61, '0423-3657', 61, 'Charles Amiel', 'A.', 'Malabanan', NULL, 'malabanancharlesamiel@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(62, '0423-4441', 62, 'Raymond Jay', 'C.', 'Dollesin', NULL, 'rjay25.dollesin@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(63, '0423-4153', 63, 'Lyx Lamuel', 'B.', 'Dilla', NULL, 'lspulyxdilla@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(64, '0425-0891', 64, 'Carl Aaron', 'H.', 'Garcia', NULL, 'carlteezy03@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(65, '0423-4386', 65, 'Jose Enrique Delos', NULL, 'Reyes', NULL, 'ejdelosreyes36@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(66, '0423-3666', 66, 'Arabella Zyja', 'B.', 'SevillA', NULL, 'arabellazyja.sevilla@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(67, '0424-0920', 67, 'Kate', 'C.', 'Saure', NULL, 'ksaurelspulb@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(68, '0424-0921', 68, 'Zyke', 'Ghabriel', 'Parcon', NULL, 'zparcon.lspulb@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(69, '0423-3630', 69, 'Christian', 'P.', 'Ortiz', NULL, 'christianortiz.school@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(70, '0422-0722', 70, 'Michael Reiner', 'A.', 'Magat', NULL, 'magatmichael52@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(71, '0422-2039', 71, 'Rhei Earlson', 'T.', 'Malatag', NULL, 'rheiearl@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(72, '0423-3386', 72, 'Czarina Joy', 'L.', 'Sanchez', NULL, 'cjsanchez1402@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(73, '0423-4262', 73, 'Michelle', 'B.', 'Labajo', NULL, 'mchlllabajo@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(74, '0423-3681', 74, 'Miguelit Gwyneth', 'S.', 'Erasga', NULL, 'gwyneth.erasga@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(75, '0423-3655', 75, 'Jearly Mae', 'C.', 'Gavilan', NULL, 'jearlygavilan@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(76, '0423-3654', 76, 'Ricah Mae', 'P.', 'Boctot', NULL, 'ricahmaeee@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(77, '0423-3659', 77, 'Jeiv Micron', 'A.', 'Roaquin', NULL, 'jeivmicron20@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(78, '0422-0763', 78, 'Cleid Eduard', 'I.', 'Palisoc', NULL, 'palisoccleid@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(79, '0423-4649', 79, 'Emiel John', 'G.', 'Salangsang', NULL, 'captainconehead10@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(80, '0423-4675', 80, 'John Rodgerson', 'D.', 'Bilan', NULL, 'bilanj159@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(81, '0423-4198', 81, 'Kylie', 'P.', 'Tejada', NULL, 'kylietejada1211@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(82, '0423-3359', 82, 'Jieshiel Kei', 'L.', 'Alvarado', NULL, 'student.04233359@placeholder.lspu', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(83, '0422-0656', 83, 'Christian', 'D.', 'Gonzalez', NULL, 'iangonzalez1710@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(84, '0423-3670', 84, 'Angelica', 'Joyce', 'Fernandez', NULL, 'codeangelica1.0@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(85, '0423-4102', 85, 'Cazter Troy', 'R.', 'Murad', NULL, 'cazter016@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(86, '0423-3668', 86, 'Sarah Mae', 'C.', 'Banasihan', NULL, 'banasihansarahmae@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(87, '0423-3455', 87, 'Zarah Mae', 'B.', 'Camacho', NULL, 'camachozarah01@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(88, '0423-3644', 88, 'Mateuz Andrei', 'T.', 'Caspillo', NULL, 'caspillomateuz36@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(89, '0423-4420', 89, 'Margiedale Ann', 'M.', 'Morada', NULL, 'moradamargiedale34@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(90, '0424-0973', 90, 'Randy', 'T.', 'Amparo', NULL, 'amparo.popoy@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(91, '96624', 91, 'German Gian', 'V.', 'Banasihan', NULL, 'german.banasihan@gmail.com', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(92, '0423-3707', 92, 'Amiel Isaac', 'V.', 'Solmerano', NULL, 'student.04233707@placeholder.lspu', NULL, 'BSCS', 'Los Banos Campus', '3rd Year', 5, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(93, '0425-0363', 93, 'Nathaniel', NULL, 'Aguilar', NULL, 'student.04250363@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(94, '0425-0349', 94, 'Anthony', NULL, 'Anez', NULL, 'anezanthony2521@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(95, '0425-0359', 95, 'John', 'Asher Anthony L', 'Angeles', NULL, 'johnasherpr3tzel@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(96, '0425-0362', 96, 'Merham', NULL, 'Angagao', NULL, 'angagaomerham745@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(97, '0425-0340', 97, 'Seifer', NULL, 'Aquino', NULL, 'seiferaquino@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(98, '0425-0334', 98, 'Carlos', 'Emmanuel', 'Bailon', NULL, 'carlozemmanuel01@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(99, '0420-0733', 99, 'Chard', 'Jon T.', 'Bag-o', NULL, 'chardjonbago2026@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(100, '0425-0380', 100, 'Jashlei', 'Ann', 'Bautista', NULL, 'jashleianngonzales@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(101, '0425-0333', 101, 'Ziv', 'Kayam P.', 'Bautista', NULL, 'zivkayampalisoc@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(102, '0425-0991', 102, 'Carl', 'Wilson O.', 'Bonador', NULL, 'cwbonador@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(103, '0425-0329', 103, 'Jona', 'Mei', 'Borrega', NULL, 'borregajonamae@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(104, '0425-0986', 104, 'Ken Ethan', 'R.', 'Ceballo', NULL, 'kenethanrimandoceballo@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(105, '0425-0367', 105, 'Gishlain', 'R.', 'Carpio', NULL, 'student.04250367@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(106, '0425-0035', 106, 'Antonio', 'Luis V.', 'Del Prado', NULL, 'ntndelprado@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(107, '0425-0337', 107, 'Philix', 'Nashley P.', 'Ebron', NULL, 'philixnashleyebron@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(108, '0425-0437', 108, 'John', 'Steven C.', 'Erasga', NULL, 'johnstevenerasga@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(109, '0425-0347', 109, 'Mark', NULL, 'Gatil', NULL, 'markgatil06@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(110, '0424-0493', 110, 'Olsen', NULL, 'Hipolito', NULL, 'student.04240493@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(111, '0425-0342', 111, 'Reginald', 'B.', 'Labajo', NULL, 'labajoreginald69@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(112, '0425-0989', 112, 'John', 'Arvie D.', 'Madriaga', NULL, 'johnarviemadriaga13@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(113, '0425-0393', 113, 'Katherine', NULL, 'Magpantay', NULL, 'student.04250393@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(114, '0425-0336', 114, 'Samuel', 'Boris A.', 'Manaig', NULL, 'manaigsamuelboris@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(115, '0425-0316', 115, 'Johannes', NULL, 'Naredo', NULL, 'student.04250316@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(116, '0425-0372', 116, 'Jhuniel', NULL, 'Pascual', NULL, 'student.04250372@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(117, '0425-0366', 117, 'Christian', 'Arvy', 'Pillante', NULL, 'student.04250366@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(118, '0425-0314', 118, 'Abby', 'Marjery P.', 'Peñarubia', NULL, 'marabbypenarubia041107@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(119, '0425-0361', 119, 'Yjam', 'Immanuel P.', 'Plantilla', NULL, 'yjamimmanuel03@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(120, '0425-0341', 120, 'Marc', 'Rafael S.', 'Quilloy', NULL, 'paeng11.quilloy11@icloud.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(121, '0425-0381', 121, 'Roanne', 'Faye M.', 'Salamero', NULL, 'salameroroannefaye340@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(122, '0425-0330', 122, 'Simon', 'T.', 'San Valentin', NULL, 'simonsanvalentin6@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(123, '0425-0338', 123, 'Risam', 'Angelo E.', 'Takahashi', NULL, 'risamgelotakahashi@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(124, '0425-0029', 124, 'Cyrelle', 'B.', 'Tandang', NULL, 'shaytandang@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(125, '0422-0959', 125, 'Urcia John Carlo', NULL, 'D.', NULL, 'urciajohncarlo477@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(126, '0425-0439', 126, 'Kristopher', 'P.', 'Vergara', NULL, 'vergarakristopher25@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(127, '0423-4045', 127, 'Cyrus', 'James A.', 'Zayas', NULL, 'zayascj13@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 6, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(128, '0425-0428', 128, 'Kenneth', 'T.', 'Gecale', NULL, 'ken17gecale@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 7, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(129, '0425-0558', 129, 'Kheeno', 'C.', 'Villanueva', NULL, 'villanuevakheeno@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 7, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(130, '0425-0545', 130, 'Angelo Kyle V. De', NULL, 'Castro', NULL, 'decastroangelo32@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 7, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(131, '0425-0612', 131, 'Kate Marie', 'H.', 'Contado', NULL, 'inamilazuli@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 7, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(132, '0424-0176', 132, 'John Mhedrick', 'C.', 'Escobin', NULL, 'jmcenteno0311@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 7, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(133, '0425-0434', 133, 'Albertte Jynelle', 'M.', 'Gayahan', NULL, 'gayahanalberttejynelle@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 7, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(134, '0425-0427', 134, 'Godofredo III', 'T.', 'Suguitan', NULL, 'godosuguitan@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 7, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(135, '0425-0402', 135, 'John Cyrus', 'C.', 'Mariano', NULL, 'johncyrusmariano65@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 7, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(136, '0425-0546', 136, 'Christoper', 'V.', 'Tien', NULL, 'christopertien465@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 7, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(137, '2014-0904', 137, 'Tessa', NULL, 'Gragas', NULL, 'gragastessa3@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 7, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(138, '0425-0463', 138, 'John Ross', 'R.', 'Tagum', NULL, 'johnrosstagum10@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 7, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(139, '0419-1177', 139, 'Etienne', 'Mari', 'Orilla', NULL, 'etiennemari.orilla@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 7, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(140, '0425-0438', 140, 'Vivien', 'Joyce', 'Permejo', NULL, 'vivienjoycepermejo@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 7, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(141, '0424-1049', 141, 'Sophia', 'Yvone', 'Pillas', NULL, 'sophiayvoneborromeo@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 7, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(142, '0425-0440', 142, 'Drick Zymon', 'M.', 'Maines', NULL, 'mainesdrick@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 7, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(143, '0425-0954', 143, 'John Carlo', 'C.', 'Mangampo', NULL, 'johncarlomangampo11@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 7, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(144, '0425-0436', 144, 'Christian Daniel', 'D.', 'Tan', NULL, 'cdtan98@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 7, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(145, '0425-0829', 145, 'Jeffrey', 'F.', 'Pagne', NULL, 'pagnejeff0213@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 7, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(146, '0425-0431', 146, 'Kimberly', NULL, 'Espiritu', NULL, 'kimberlyespitiu85@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 7, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(147, '0425-0835', 147, 'Noreen', 'D.', 'Añez', NULL, 'noreenanez82@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 7, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(148, '0425-0691', 148, 'Edward', NULL, 'Natal', NULL, 'edwardnatal9@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 7, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(149, '0425-0544', 149, 'Vincent Nicolas', 'G.', 'Isla', NULL, 'islavincent83@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 7, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(150, '0425-0689', 150, 'Jireh', NULL, 'Quiamno', NULL, 'jirehb.quiamno@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 7, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(151, '0425-0837', 151, 'Pauline', 'O.', 'Paez', NULL, 'ppaezpauline07@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 7, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(152, '0425-0755', 152, 'Kelvin', 'N.', 'Agar', NULL, 'kelvinnabia@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 7, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(153, '0425-0753', 153, 'Patrick', 'E.', 'Tandang', NULL, 'patricktandang696@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 7, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(154, '0422-0622', 154, 'Solano', 'G.', 'Agustin', 'III', 'thirdyagustin123@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 8, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(155, '0425-0433', 155, 'Aled Adrion', 'S.', 'Alcachupas', NULL, 'aledadrionalcachupas@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 8, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(156, '0425-0321', 156, 'Khervie', 'B.', 'Amasan', NULL, 'khervieamasan@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 8, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(157, '0425-0543', 157, 'Cailyn', 'G.', 'Aquino', NULL, 'caiiiii.aquino@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 8, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(158, '0425-0354', 158, 'Darren', 'P.', 'Bacorro', NULL, 'bacorrodarren07@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 8, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(159, '0425-0332', 159, 'Cjay', 'R.', 'Banasihan', NULL, 'cjaybanasihan4@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 8, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(160, '0425-0423', 160, 'Bianca Kim', 'H.', 'Bondoc', NULL, 'biancakim.bondoc@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 8, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(161, '0425-0391', 161, 'John Euneel', 'B.', 'Dacir', NULL, 'euneel75@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 8, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(162, '0425-0356', 162, 'Shane Ashley', 'B.', 'Daet', NULL, 'shaneashleydaet@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 8, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(163, '0425-0832', 163, 'Sittie Ashlhea', 'G.', 'Datuimam', NULL, 'ashlheagayland@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 8, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(164, '0425-0357', 164, 'Charlie Kurt I De', NULL, 'Vera', NULL, 'deverakurt0207@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 8, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(165, '0425-0002', 165, 'Marc James', 'P.', 'Escobin', NULL, 'mjamesescobin@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 8, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(166, '0425-0389', 166, 'Bradd Geizler', 'M.', 'Eusebio', NULL, 'bradd396@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 8, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(167, '0425-0399', 167, 'Shawn Kennth', 'B.', 'Jobli', NULL, 'shawnjobli17@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 8, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(168, '0425-0369', 168, 'Trisha Mae', 'D.', 'Lantican', NULL, 'tmlantican06@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 8, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(169, '0425-0567', 169, 'Darzel Marie', 'H.', 'Lapitan', NULL, 'darzellapitan@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 8, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(170, '0425-0833', 170, 'Rayver', 'V.', 'Macapagal', NULL, 'rayvermacapagal17@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 8, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(171, '0425-0325', 171, 'Gian Brixz', 'A.', 'Macatangay', NULL, 'gianmac2007@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 8, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(172, '0425-0331', 172, 'Justine', 'L.', 'Madelo', NULL, 'madeloj822@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 8, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(173, '0425-0003', 173, 'Raine', 'G.', 'Magundayao', NULL, 'rainemagundayao@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 8, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(174, '0425-0994', 174, 'Patrick Angelo', 'C', 'Manese', NULL, 'patrickangelomanese@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 8, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(175, '0425-0232', 175, 'Raven', 'M.', 'Nabia', NULL, 'ravennabia3@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 8, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(176, '0425-0322', 176, 'Julian', 'D.', 'Oracion', NULL, 'julianoracion08@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 8, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(177, '0424-0496', 177, 'Christine Denise', 'A.', 'Santillan', NULL, 'santillanchristinedenise@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 8, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(178, '0422-0933', 178, 'Ian Jay', 'L.', 'Servallos', NULL, 'ianjay.servallos05@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 8, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(179, '0425-0955', 179, 'Justine', 'T.', 'Suamen', NULL, 'suamenjustine2005@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 8, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(180, '0425-0884', 180, 'John Ian', 'P.', 'Subiaga', NULL, 'johniansubiaga@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '1st Year', 8, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(181, '0424-0063', 181, 'Justin Mark', 'A.', 'Melchor', NULL, 'justinmarkmelchor@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 1, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(182, '0424-0071', 182, 'Michael', 'S.', 'Jaraplasan', NULL, 'jaraplasanmichael170@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 1, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(183, '0424-0083', 183, 'Kim Charles', 'G.', 'Acaso', NULL, 'acasokim11@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 1, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(184, '0424-0070', 184, 'Kim', 'Chester', 'Eclarinal', NULL, 'kimchestere@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 1, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(185, '0424-0060', 185, 'Jean Mervin', 'G.', 'Fajardo', NULL, 'jeanmervinfajardo@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 1, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(186, '0424-0093', 186, 'Joshua', 'A.', 'Lapie', NULL, 'joshualapie22@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 1, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(187, '0424-0053', 187, 'Matthew', 'M.', 'Banasihan', NULL, 'matthewbanasihan421@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 1, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(188, '0424-0144', 188, 'Vaungh Louie Andrey', 'P.', 'Lat', NULL, 'vaunghclassifiedemail@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 1, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(189, '0424-0079', 189, 'Alejandro IV', 'B.', 'Magbanua', NULL, 'leanmagbanua1@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 1, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(190, '0424-0069', 190, 'Justin Adrian', 'P.', 'Reboton', NULL, 'justinreboton98@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 1, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(191, '0424-0067', 191, 'Jahrem', 'M.', 'Dizon', NULL, 'jahremdizon191@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 1, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(192, '0424-0143', 192, 'Nicole', 'P.', 'Carpena', NULL, 'nicolecarpena917@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 1, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(193, '0424-0048', 193, 'Charles Allen', 'B.', 'Nuñez', NULL, 'accacharles425@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 1, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(194, '0424-0090', 194, 'Kurt Lindon', 'M.', 'Bariuan', NULL, 'kurtlindon.bariuan996@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 1, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(195, '0424-0084', 195, 'Muhaimin', 'E.', 'Abdurahman', NULL, 'eismamuhaimin@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 1, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(196, '0424-0263', 196, 'Zorine Ivan', 'D.', 'Pamulaklakin', NULL, 'pamulaklakinzoren2@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 1, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(197, '0424-0055', 197, 'Athren', 'M.', 'Banasihan', NULL, 'athren.banasihan@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 1, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(198, '0424-0061', 198, 'Julius Andrei', 'P.', 'Gulay', NULL, 'andreivegetables@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 1, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(199, '0424-0068', 199, 'Jose Rafael', 'A.', 'Hernandez', NULL, 'hrnndzjsrfl24@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 1, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(200, '0424-0082', 200, 'Paul Jonathan', 'G.', 'Gundayao', NULL, 'pjgundayao17@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 1, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(201, '0424-0052', 201, 'Kind Mighty', 'P.', 'Genayas', NULL, 'nkdxvn@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 1, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(202, '0424-0056', 202, 'Adrian', 'F.', 'Padilla', NULL, 'adrianpadilla8296@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 1, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(203, '0424-0058', 203, 'Vic John', 'O.', 'Salen', NULL, 'johnsalen13@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 1, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(204, '0424-0244', 204, 'Rosalie', 'B.', 'Seguera', NULL, 'seguerarosalie1@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 1, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(205, '0424-0064', 205, 'Gife Diether Paul', 'G.', 'Laforteza', NULL, 'dietherlaforteza@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 1, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(206, '0424-0138', 206, 'JAMES', 'VINCENT I.', 'BANCA', NULL, 'bancajames30@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 1, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(207, '2023-11977', 207, 'Luke', 'Ishel', 'Antonio', NULL, 'lukeishel09@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 1, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(208, '0424-0174', 208, 'Charls', 'G.', 'Macapalan', NULL, 'charlsmacapalan255@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 9, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(209, '0424-0178', 209, 'Tristan Kim', 'C.', 'Caracuel', NULL, 'tk.caracuel023@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 9, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(210, '0424-0418', 210, 'Shaine', 'Ashley', 'Catapang', NULL, 'shnshlyctpng@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 9, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(211, '0424-0420', 211, 'Cyrus Vhon', 'S.', 'Obog', NULL, 'cyrusvhon1233@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 9, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(212, '0424-0184', 212, 'Rayvhen', 'P.', 'Muñoz', NULL, 'munozrayhen@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 9, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(213, '0424-0183', 213, 'Isaiah Ranel', 'G.', 'Hadap', NULL, 'isaiahhadap16@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 9, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(214, '0424-0182', 214, 'Ezekiel Ranel', 'G.', 'Hadap', NULL, 'ezekielranelhadap@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 9, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(215, '0424-0389', 215, 'Kristine', 'R.', 'Belga', NULL, 'belga.ramoskristineo@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 9, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(216, '0424-0375', 216, 'John Vincent', 'F.', 'Allovida', NULL, 'johnvincentallovida04@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 9, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(217, '0424-0175', 217, 'Rahnel', 'V.', 'Bagongon', NULL, 'rahnelbagongon@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 9, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(218, '0425-0981', 218, 'Leonel', 'J.', 'Manalastas', NULL, 'nelmanalastas04@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 9, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(219, '0424-0299', 219, 'Jayson', 'R.', 'Garcia', NULL, 'garciajayson2004@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 9, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(220, '0424-0156', 220, 'Casely', 'L.', 'Aguilar', NULL, 'aguilarcasely@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 9, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(221, '0424-0160', 221, 'Kyle Stephen', 'L.', 'Tandang', NULL, 'kylestephentandang69@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 9, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(222, '0422-0952', 222, 'Marie Lorainne', 'H.', 'Aquino', NULL, 'marielorainneaquino091503@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 9, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(223, '0424-0181', 223, 'Jesrael', 'S.', 'Caranza', NULL, 'jesraelcaranza2@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 9, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(224, '0424-0435', 224, 'Marco Jay', 'V.', 'Reyes', NULL, 'marcojayreyes98@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 9, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(225, '0424-0443', 225, 'Angelo', 'Dela', 'Vega', NULL, 'angelodlvg2005@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 9, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(226, '0424-0177', 226, 'Riddik', 'De', 'Leon', NULL, 'riddikdeleon62@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 9, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(227, '0424-0179', 227, 'Nile', 'B', 'Torres', NULL, 'student.04240179@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 9, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(228, '0425-0952', 228, 'John Ashley Sorio', NULL, 'Archebuche', NULL, 'arcebuchejohnashley@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 9, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(229, '0424-0981', 229, 'Nicole jazmine', 'B.', 'Layosa', NULL, 'nicolejazminelspu@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 9, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(230, '0424-0388', 230, 'Cyril', 'Lopena', 'Sumipo', NULL, 'student.04240388@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 9, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(231, '0424-0430', 231, 'Raffy', NULL, 'Gepilgon', NULL, 'raffygepilgon29@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 9, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(232, '0425-0982', 232, 'Jesica Pauline A. De', NULL, 'Claro', NULL, 'jesicapaulinedeclaro12@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 9, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(233, '0424-0188', 233, 'Lyka Anne', 'S.', 'Perol', NULL, 'perollykaanne23@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 9, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(234, '0424-0342', 234, 'Dexter', 'M.', 'Drio', NULL, 'dexterdrio18@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 9, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(235, '0425-0896', 235, 'Almartin', 'T.', 'Lacambra', NULL, 'almartinlacambra68@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 9, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(236, '0424-0471', 236, 'Gerlyn Mae', 'M.', 'Salamero', NULL, 'gerlynsalamero@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(237, '0424-0281', 237, 'John Jery', 'E.', 'Asis', NULL, 'johnjeryasis@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(238, '0424-0532', 238, 'Jillian', 'P.', 'Soriano', NULL, 'jilliansoriano071@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(239, '0424-0475', 239, 'James Carlo', 'C.', 'Duran', NULL, 'duranjames574@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(240, '0424-0526', 240, 'Justin Rain', 'C.', 'Aquino', NULL, 'kinoulala607@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(241, '0424-0280', 241, 'Kurt Ian', 'L.', 'Enriquez', NULL, 'kurtian267@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(242, '0424-0534', 242, 'Jeff', 'Chent', 'Bello', NULL, 'kenbello35@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(243, '0424-0221', 243, 'Mike Laurence', 'P.', 'Magpantay', NULL, 'rencemagpantay005@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(244, '0424-0480', 244, 'John Michael P. De', NULL, 'Guzman', NULL, 'jmdeguzman185@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(245, '0423-4867', 245, 'Alexandrei Joshua', 'A.', 'Gayahan', NULL, 'aquinoalexandrei36@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(246, '0424-0467', 246, 'Uno Zander', 'A.', 'Ventura', NULL, 'student.04240467@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(247, '0424-0482', 247, 'Neil Johnson', 'J.', 'Estabillo', NULL, 'neiljohnsonestabillo6@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(248, '0424-0276', 248, 'Gabriel Zeus', 'S.', 'Padilla', NULL, 'gabzeuspadilla@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(249, '0424-0042', 249, 'Aron', 'Justine', 'Enilo', NULL, 'aronjustineenilo05@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(250, '0423-3913', 250, 'Mica Ella C. Dela', NULL, 'Cruz', NULL, 'dmicaella19@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(251, '0424-0523', 251, 'Shamille', 'C.', 'Erasga', NULL, 'sha.erasga008@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(252, '0424-0254', 252, 'John', 'Michael', 'Peralta', NULL, 'johnmichaelperalta177@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(253, '0423-3626', 253, 'Louise Clark', 'L.', 'Acojedo', NULL, 'louiseclarkacojedo500@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(254, '0424-0498', 254, 'Joshua', 'V.', 'Arenda', NULL, 'joshuaarenda@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(255, '0424-0269', 255, 'Rens', 'A.', 'Solomon', NULL, 'solomon.rens1@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(256, '0424-0470', 256, 'Jane Katherine', 'B.', 'Parala', NULL, 'paralajane@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(257, '0425-0258', 257, 'Vaness', 'R.', 'Ramento', NULL, 'vanessramento143@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(258, '0424-0253', 258, 'Jazlie', 'C.', 'Boragay', NULL, 'jazlieboragay@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(259, '0424-1109', 259, 'Kurt Michael', 'S.', 'Fusana', NULL, 'kurtmichaelfusana@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(260, '0424-0260', 260, 'Archie', 'R.', 'Isalos', NULL, 'archieisalos123@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(261, '0424-0488', 261, 'Paul Aldrey', 'R.', 'Fernandez', NULL, 'paulromualdofernandez@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(262, '0424-0479', 262, 'Xian Albert', 'L.', 'Perez', NULL, 'albertxiperez@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(263, '0424-0521', 263, 'Michaelangelo', 'A.', 'Calades', 'Jr.', 'michaelangelo.calades@lspu.edu.ph', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(264, '0424-0896', 264, 'Mark Allen E. Delos', NULL, 'Reyes', NULL, 'markallendelosreyes444@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(265, '0424-0897', 265, 'Augustin', 'L.', 'Mariano', NULL, 'augustinmariano288@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active');
INSERT INTO `students` (`id`, `student_id`, `applicant_id`, `first_name`, `middle_name`, `last_name`, `suffix`, `email`, `contact_number`, `program_code`, `campus`, `year_level`, `section_id`, `semester_id`, `Enrollment_Date`, `created_at`, `Status`) VALUES
(266, '0424-0499', 266, 'Manongsong', 'Jones', 'Adrian', NULL, 'manongsongjonesadrian@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 10, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(267, '0424-0594', 267, 'Retchi', 'L.', 'Cereno', NULL, 'ritchecereno15@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 11, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(268, '0424-0904', 268, 'Marc Rodson', 'M.', 'Segundo', NULL, 'marcsegseg@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 11, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(269, '0425-0895', 269, 'Jomar', 'T.', 'Eyas', NULL, 'jteyas9@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 11, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(270, '2014-1949', 270, 'Herlene', 'F.', 'Penaso', NULL, 'mjfabros16@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 11, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(271, '0424-0545', 271, 'Arabella', 'M.', 'Lirio', NULL, 'arabellalirio3@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 11, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(272, '0424-0668', 272, 'Kate Raven', 'B.', 'Lucero', NULL, 'katelucero24@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 11, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(273, '0424-0861', 273, 'Trixie', 'B.', 'Chavez', NULL, 'trixiechavez072@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 11, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(274, '0424-0606', 274, 'Josephine', 'M.', 'Rodriguez', NULL, 'josephineerose5@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 11, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(275, '0424-0934', 275, 'Jaren Adriel', 'A.', 'Ignacio', NULL, 'jarenadriel.ignacio@lspu.edu.ph', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 11, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(276, '0423-3576', 276, 'Jonnel Victor', 'L.', 'Lapitan', NULL, 'lapitanjonnel11@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 11, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(277, '0424-0664', 277, 'Sarah Mae', 'A.', 'Audine', NULL, 'audinesarah@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 11, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(278, '0423-3558', 278, 'Espiritu IV', 'C.', 'Mercado', NULL, 'teemomercado@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 11, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(279, '0424-0579', 279, 'Jose Franz', 'N.', 'Lita', NULL, 'franzlita12285@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 11, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(280, '0423-4591', 280, 'John Carlo H. Del', NULL, 'Rosario', NULL, 'thejohncarlo@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 11, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(281, '0424-0860', 281, 'Ralph Richmond', 'G.', 'Mercado', NULL, 'monmon121205@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 11, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(282, '0422-0868', 282, 'Andrei', 'E.', 'Alforte', NULL, 'andreialforte6226@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 11, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(283, '0422-1685', 283, 'Maverick', 'U.', 'Concio', NULL, 'conciomaverick182003@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 11, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(284, '0424-0628', 284, 'Jan Den Eury', 'G.', 'Reyes', NULL, 'eurygibasreyes04@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 11, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(285, '0424-0609', 285, 'Caren', 'S.', 'Belda', NULL, 'carenbelda08@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 11, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(286, '0424-0639', 286, 'Trisha Mae', 'B.', 'Mendoza', NULL, 'mendozatrisha844@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 11, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(287, '0424-0889', 287, 'Zar John', 'A.', 'Nacionales', NULL, 'nacionaleszj@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 11, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(288, '0424-0660', 288, 'Alyanna Marie', 'M.', 'Torres', NULL, 'ayenmanator888@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 11, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(289, '0424-0608', 289, 'Lindzay', 'G.', 'Paner', NULL, 'lindzaygarciapaner02@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 11, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(290, '0424-0926', 290, 'Kyle Tracy', 'Q.', 'Llanes', NULL, 'ktllanes01@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 11, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(291, '0424-0582', 291, 'Rio Ival', 'B.', 'Escobin', NULL, 'rioivalescobin28@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '2nd Year', 11, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(292, '0423-4341', 292, 'John Lorence', 'B.', 'Amarela', NULL, 'amarelalorence@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 12, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(293, '0423-3605', 293, 'Christian', 'B.', 'Añez', NULL, 'z4km4estro@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 12, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(294, '0422-0996', 294, 'Christian', 'Joshua', 'Angeles', NULL, 'angelesjoshua78@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 12, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(295, '0423-3372', 295, 'Irene', 'A.', 'Caguya', NULL, 'caguyairene83@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 12, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(296, '0423-4150', 296, 'Andrei', 'H.', 'Caldeo', NULL, 'andreicaldeo777@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 12, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(297, '0420-1077', 297, 'Eizekiel', 'L.', 'Casipong', NULL, 'zekielcasipong0112@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 12, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(298, '0421-2193', 298, 'Jireh', 'V.', 'Cortejo', NULL, 'cortejojireh@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 12, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(299, '0423-3906', 299, 'Aubrey M. De', NULL, 'Leon', NULL, 'aby.deleon814@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 12, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(300, '0420-0769', 300, 'Aldwin Kiester', 'P.', 'Ediza', NULL, 'aldwinkiesterediza@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 12, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(301, '0423-3480', 301, 'Maui', 'A.', 'Endiape', NULL, 'mauiendiape05@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 12, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(302, '0422-0760', 302, 'William', 'N.', 'Escobar', NULL, 'louiswilliam.escobar@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 12, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(303, '0423-3572', 303, 'John Augustus', 'S.', 'Escobin', NULL, 'ajescobin333@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 12, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(304, '0423-3611', 304, 'Vincent', NULL, 'Espinosa', NULL, 'vinrich29@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 12, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(305, '0423-4696', 305, 'Mary Joy', 'Q.', 'Eusebio', NULL, 'maryjoyeusebio38@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 12, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(306, '0423-3573', 306, 'Jeno', 'A.', 'Lapore', NULL, 'jenolapore050@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 12, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(307, '0424-0898', 307, 'Gabbie', 'C.', 'Manalo', NULL, 'gabbie.manalo18@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 12, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(308, '0423-3393', 308, 'Paulette Jane', 'M.', 'Meña', NULL, 'paulettejane.mena@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 12, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(309, '0423-3694', 309, 'Arren', 'Lei', 'Mendoza', NULL, 'arrenleimendoza12@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 12, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(310, '0423-4698', 310, 'John Micheal', 'R.', 'Milanes', NULL, 'john.milanes141@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 12, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(311, '0423-3645', 311, 'Ethan', 'Daniel', 'Monterola', NULL, 'exrt3d@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 12, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(312, '0423-3560', 312, 'Khyle', NULL, 'Otano', NULL, 'khyleotano838@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 12, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(313, '0423-4194', 313, 'Renly', 'M.', 'Patricio', NULL, 'renlypatricio817@gamil.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 12, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(314, '0423-4422', 314, 'Abel', 'B.', 'Pingol', NULL, 'abelpingol45@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 12, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(315, '0423-3625', 315, 'Froilan', 'A.', 'Rodejo', NULL, 'rodejo770@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 12, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(316, '0423-4142', 316, 'Laraine', 'M.', 'Rodriguez', NULL, 'larainerodriguez10@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 12, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(317, '0423-3487', 317, 'Lorraine S. San', NULL, 'Miguel', NULL, 'lorrainesanmiguel14@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 12, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(318, '0423-3592', 318, 'Shaina Mae', 'G.', 'Vidal', NULL, 'shainamae4290@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 12, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(319, '0422-1383', 319, 'Joshua Zachariah', 'L.', 'Herrera', NULL, 'joshuazechariah24@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 12, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(320, '0423-3485', 320, 'Noemelyn', NULL, 'Abasola', NULL, 'student.04233485@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 13, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(321, '0423-3590', 321, 'Christka', 'May', 'Collado', NULL, 'student.04233590@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 13, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(322, '0423-4245', 322, 'Joseph', 'Christian', 'Ferrer', NULL, 'student.04234245@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 13, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(323, '0423-3496', 323, 'Gife Charles Marty', NULL, 'Laforteza', NULL, 'student.04233496@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 13, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(324, '0423-3599', 324, 'Jhane', 'Maureen', 'Manalo', NULL, 'student.04233599@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 13, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(325, '0423-3568', 325, 'Lheilah', NULL, 'Tandang', NULL, 'student.04233568@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 13, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(326, '0423-4496', 326, 'Josefa', 'Paula', 'Eusebio', NULL, 'student.04234496@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 13, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(327, '0423-4292', 327, 'Rhixie', NULL, 'Carpio', NULL, 'student.04234292@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 13, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(328, '0423-3622', 328, 'Algirho', NULL, 'Mañosca', NULL, 'student.04233622@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 13, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(329, '0423-3885', 329, 'Zack Xavier', 'G.', 'Refrea', NULL, 'student.04233885@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 13, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(330, '0423-3718', 330, 'Benedict', 'Vincent', 'Reyes', NULL, 'student.04233718@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 13, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(331, '0423-3466', 331, 'Nomer', 'Ray', 'Aguas', NULL, 'student.04233466@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 13, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(332, '0423-4110', 332, 'Gretchen', NULL, 'Andaya', NULL, 'student.04234110@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 13, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(333, '0423-4096', 333, 'Angel', 'Kim', 'Hubilla', NULL, 'student.04234096@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 13, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(334, '0423-3490', 334, 'Samantha', 'Jasmine', 'Alcantara', NULL, 'student.04233490@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 13, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(335, '0423-3570', 335, 'Racil', NULL, 'Picardal', NULL, 'student.04233570@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 13, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(336, '0420-0623', 336, 'Samuel', NULL, 'Villamayor', NULL, 'student.04200623@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 13, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(337, '0423-4690', 337, 'Jaymart', NULL, 'Cabuhat', NULL, 'student.04234690@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 13, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(338, '0423-4054', 338, 'Andreine', NULL, 'Tendencia', NULL, 'student.04234054@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 13, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(339, '0423-4882', 339, 'Daniella', NULL, 'Dael', NULL, 'student.04234882@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 13, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(340, '0423-4612', 340, 'Aldrin', NULL, 'Terbio', NULL, 'student.04234612@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 13, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(341, '0423-3534', 341, 'Edzel', 'Angelo', 'Masagca', NULL, 'student.04233534@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 13, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(342, '0423-3491', 342, 'Joshua', 'Paul', 'Mataverde', NULL, 'student.04233491@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 13, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(343, '0422-1599', 343, 'Mark', 'Raniel', 'Decena', NULL, 'student.04221599@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 13, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(344, '0423-4197', 344, 'John Paul', 'C.', 'Empalmado', NULL, 'student.04234197@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 14, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(345, '0422-0912', 345, 'Jynn Diane', 'M.', 'Casili', NULL, 'student.04220912@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 14, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(346, '0423-3522', 346, 'Alexandra', 'Nicole', 'Blasco', NULL, 'student.04233522@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 14, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(347, '0423-4039', 347, 'Daryl Anne', 'F.', 'Lapitan', NULL, 'student.04234039@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 14, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(348, '0423-3541', 348, 'Laurence Bren', 'F.', 'Austria', NULL, 'student.04233541@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 14, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(349, '0423-3545', 349, 'Rondale', 'Angelo', 'Magda', NULL, 'student.04233545@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 14, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(350, '0423-3550', 350, 'Fiona', NULL, 'Sanchez', NULL, 'student.04233550@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 14, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(351, '0423-3575', 351, 'Lawrence', 'S.', 'Salvador', NULL, 'student.04233575@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 14, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(352, '0423-3532', 352, 'John Royce', 'L.', 'Esporlas', NULL, 'student.04233532@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 14, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(353, '0423-4667', 353, 'Jared Nate', 'T.', 'Odian', NULL, 'student.04234667@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 14, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(354, '0421-2153', 354, 'Raiza Jonelle', 'A.', 'Gacer', NULL, 'student.04212153@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 14, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(355, '0423-4400', 355, 'Jay Michael', 'M.', 'Castillo', NULL, 'student.04234400@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 14, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(356, '0423-4357', 356, 'Chester', 'M.', 'Mendoza', NULL, 'student.04234357@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 14, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(357, '0423-4575', 357, 'Jeric', 'T.', 'Manibog', NULL, 'student.04234575@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 14, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(358, '0423-3495', 358, 'John Paul', 'E.', 'Malabanan', NULL, 'student.04233495@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 14, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(359, '0423-3498', 359, 'Danielle', 'S.', 'Linga', NULL, 'student.04233498@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 14, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(360, '0421-2174', 360, 'Renz', 'L.', 'Gallego', NULL, 'student.04212174@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 14, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(361, '0423-3543', 361, 'C-jay', 'S.', 'Melante', NULL, 'student.04233543@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 14, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(362, '0423-3517', 362, 'Dave Ian Louis', 'P.', 'Soriano', NULL, 'student.04233517@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 14, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(363, '0423-3537', 363, 'Clark Louie', 'A.', 'Desepida', NULL, 'student.04233537@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 14, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(364, '0423-3530', 364, 'Kenneth Brylle', 'F.', 'Nañez', NULL, 'student.04233530@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 14, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(365, '0423-3549', 365, 'Bryan', 'P.', 'Manera', NULL, 'student.04233549@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 14, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(366, '0423-3566', 366, 'Mirah Stepanie', 'C.', 'Lim', NULL, 'student.04233566@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 14, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(367, '0423-3505', 367, 'Sean Deaniel', 'A.', 'Garcia', NULL, 'student.04233505@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 14, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(368, '0423-3493', 368, 'Paulo David', 'V.', 'Romero', NULL, 'student.04233493@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 14, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(369, '0423-4148', 369, 'Adriel Timothy', 'B.', 'Fernandez', NULL, 'student.04234148@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 14, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(370, '0418-0554', 370, 'Rick Von', 'B.', 'Aragon', NULL, 'student.04180554@placeholder.lspu', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 14, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(371, '0423-3380', 371, 'Ron Joseph', 'R.', 'Alcantara', NULL, 'ronalcantara0126@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 15, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(372, '0423-3597', 372, 'Ronel Joshua', 'D.', 'Alforja', NULL, 'jalfojra@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 15, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(373, '0423-3587', 373, 'James Isaac', 'A.', 'Alvarez', NULL, 'real.jamesalvarez19@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 15, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(374, '0423-3479', 374, 'Brenderick', 'I.', 'Amparo', 'Jr', 'bjamparo30@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 15, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(375, '0423-3700', 375, 'Ronald John', 'S.', 'Bautista', NULL, 'ronaldjohn.bautista7@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 15, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(376, '0423-3616', 376, 'Brylle Allen', 'D.', 'Bregonia', NULL, 'christianged31@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 15, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(377, '0423-4501', 377, 'Vincent', 'V.', 'Briñas', NULL, 'vbrinas8@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 15, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(378, '0423-4073', 378, 'Klyde Cisco', 'T.', 'Canapi', NULL, 'ciscoklyde@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 15, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(379, '0423-4084', 379, 'Richard', 'S.', 'Catindig', NULL, 'ritsapn@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 15, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(380, '0423-3791', 380, 'Jhester Carlo', 'C.', 'Cayetano', NULL, 'jhestercayetano.lspu@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 15, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(381, '0423-3584', 381, 'Marck Rafael B. De', NULL, 'Leon', NULL, 'rafdeleon82@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 15, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(382, '0423-3607', 382, 'Lujen M. Dela', NULL, 'Rosa', NULL, 'delarosalujen23@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 15, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(383, '0423-3709', 383, 'Ray Emylson', 'M.', 'Flores', NULL, 'emeflo2969@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 15, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(384, '0423-3450', 384, 'Ivan Jherome', 'S.', 'Gonzales', NULL, 'ivanjheromegonzales0318@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 15, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(385, '0423-4060', 385, 'John Andrei', 'C.', 'Guzman', NULL, 'aceattacker028@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 15, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(386, '0423-3468', 386, 'Sean John', 'R.', 'Looc', NULL, 'seanjohnreyeslooc@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 15, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(387, '0423-3600', 387, 'Ivandwight', 'S.', 'Macabulos', NULL, 'ivandwight3@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 15, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(388, '0423-3476', 388, 'Gian Carlo', 'I.', 'Maranan', NULL, 'gianmaranan81@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 15, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(389, '0423-3469', 389, 'Reymond Kent', 'A.', 'Montecilo', NULL, 'montecillokent019@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 15, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(390, '0423-3617', 390, 'John Edward', 'P.', 'Opulencia', NULL, 'johnedwardopulencia062@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 15, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(391, '0423-3609', 391, 'Jewel Anne Keith', 'E.', 'Peleño', NULL, 'pelenojewel@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 15, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(392, '0423-4868', 392, 'Dan Christian', 'G.', 'Polistico', NULL, 'danpolistico91@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 15, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(393, '0423-3483', 393, 'Gabrielle', 'C.', 'Prudente', NULL, 'gabriellepogi25prudente@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 15, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(394, '0422-1748', 394, 'Christian Jake', 'A.', 'Ramiro', NULL, 'bayabasmaromaro92@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 15, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(395, '0423-3579', 395, 'Edward O. San', NULL, 'Antonio', NULL, 'edward.sanantonio14@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 15, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active'),
(396, '0423-3428', 396, 'Justine', 'G.', 'Suiza', NULL, 'justinesuiza1@gmail.com', NULL, 'BSIT', 'Los Banos Campus', '3rd Year', 15, 2, '2026-05-10', '2026-05-10 10:46:33', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `Subject_Id` int(11) NOT NULL,
  `College_Id` int(11) DEFAULT NULL,
  `Subject_Code` varchar(255) DEFAULT NULL,
  `Subject_Name` varchar(255) DEFAULT NULL,
  `Credits` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`Subject_Id`, `College_Id`, `Subject_Code`, `Subject_Name`, `Credits`) VALUES
(1, 1, 'GEC 101', 'Understanding the Self', 3),
(2, 1, 'GEC 102', 'Readings in Philippine History', 3),
(3, 3, 'GEC 104', 'Mathematics in the Modern World', 3),
(4, 1, 'KOMFIL', 'Kontekstwalisadong Komunikasyon sa Filipino', 3),
(5, 3, 'NSTP 1', 'CWTS 1 / ROTC 1', 3),
(6, 3, 'ITEC 102', 'Fundamentals of Programming', 3),
(7, 3, 'ITEC 101', 'Introduction to Information Technology Computing', 3),
(8, 1, 'GEC 103', 'The Contemporary World', 3),
(9, 1, 'PATHFIT 1', 'Movement Competency Training', 2),
(10, 3, 'ITEC 103', 'Intermediate Programming', 3),
(11, 3, 'ITEP 101', 'Human Computer Interaction 1', 3),
(12, 3, 'ITEP 102', 'Discrete Mathematics', 3),
(13, 1, 'GEC 105', 'Purposive Communication', 3),
(14, 1, 'GEC 106', 'Art Appreciation', 3),
(15, 1, 'FILDIS', 'Filipino sa Ibat Ibang Disiplina', 3),
(16, 1, 'PI 100', 'Life, Works and Writings of Rizal', 3),
(17, 1, 'PATHFIT 2', 'Exercise-based Fitness Activities', 2),
(18, 3, 'NSTP 2', 'CWTS 2 / ROTC 2 / LTS 2', 3),
(19, 3, 'GEC 107', 'Science, Technology and Society', 3),
(20, 1, 'PATHFIT 3', 'Individual / Dual Sports Games', 2),
(21, 3, 'ITEC 204', 'Data Structure and Algorithm', 3),
(22, 3, 'ITEC 205', 'Information Management', 3),
(23, 3, 'ITEP 203', 'Quantitative Methods including Modeling and Simulation', 3),
(24, 3, 'ITEL 201', 'Object-Oriented Programming', 3),
(25, 3, 'ITEL 202', 'Platform Technologies', 3),
(26, 3, 'SOSLIT', 'Sosyedad at Literatura / Panitikang Panlipunan', 3),
(27, 3, 'PATHFIT 3', 'Choice of Dance, Sports, Martial Arts, Outdoor Activities', 2),
(28, 3, 'GEC 108', 'Ethics', 3),
(29, 3, 'ITEP 204', 'Advance Database Systems', 3),
(30, 3, 'ITEP 205', 'Multimedia Systems', 3),
(31, 3, 'ITEP 206', 'Integrative Programming Technologies 1', 3),
(32, 3, 'ITEP 207', 'Networking', 3),
(33, 3, 'ITEL 203', 'Web Systems and Technologies', 3),
(34, 3, 'PATHFIT 4', 'Choice of Dance, Sports, Martial Arts, Outdoor Activities', 2);

-- --------------------------------------------------------

--
-- Table structure for table `year`
--

CREATE TABLE `year` (
  `year_id` int(11) NOT NULL,
  `academic_year` varchar(20) NOT NULL,
  `is_current` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `admission_info`
--
ALTER TABLE `admission_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_admission_applicant` (`applicant_id`),
  ADD KEY `idx_ai_applicant` (`applicant_id`);

--
-- Indexes for table `applicants`
--
ALTER TABLE `applicants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_applicant_email` (`Email`);

--
-- Indexes for table `applicant_status_log`
--
ALTER TABLE `applicant_status_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_applicant` (`applicant_id`);

--
-- Indexes for table `campus`
--
ALTER TABLE `campus`
  ADD PRIMARY KEY (`Campus_Id`);

--
-- Indexes for table `colleges`
--
ALTER TABLE `colleges`
  ADD PRIMARY KEY (`college_id`);

--
-- Indexes for table `educational_background`
--
ALTER TABLE `educational_background`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_edubg_applicant` (`applicant_id`),
  ADD KEY `idx_eb_applicant` (`applicant_id`);

--
-- Indexes for table `enrolled_subjects`
--
ALTER TABLE `enrolled_subjects`
  ADD PRIMARY KEY (`enrolled_subject_id`),
  ADD KEY `idx_es_enrollment` (`enrollment_id`),
  ADD KEY `idx_es_subject` (`subject_id`),
  ADD KEY `idx_es_instructor` (`instructor_id`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD KEY `idx_enr_student` (`student_id`),
  ADD KEY `idx_enr_section` (`section_id`),
  ADD KEY `idx_enr_semester` (`semester_id`),
  ADD KEY `idx_enr_year` (`year_id`);

--
-- Indexes for table `family_info`
--
ALTER TABLE `family_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_family_applicant` (`applicant_id`),
  ADD KEY `idx_fi_applicant` (`applicant_id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`grade_id`),
  ADD KEY `idx_gr_enrolled_subject` (`enrolled_subject_id`);

--
-- Indexes for table `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`Instructor_ID`),
  ADD KEY `idx_inst_subject` (`Subject_ID`),
  ADD KEY `idx_inst_college` (`College_ID`),
  ADD KEY `idx_inst_campus` (`Campus_ID`);

--
-- Indexes for table `intended_course`
--
ALTER TABLE `intended_course`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_intended_applicant` (`applicant_id`),
  ADD KEY `idx_ic_applicant` (`applicant_id`),
  ADD KEY `idx_ic_program` (`Program_Code`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `idx_pay_student` (`student_id`),
  ADD KEY `idx_pay_semester` (`semester_id`),
  ADD KEY `idx_pay_year` (`year_id`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`Program_Code`),
  ADD KEY `idx_prog_college` (`college_id`);

--
-- Indexes for table `receipt`
--
ALTER TABLE `receipt`
  ADD PRIMARY KEY (`receipt_id`),
  ADD UNIQUE KEY `uq_receipt_payment` (`payment_id`),
  ADD KEY `idx_rec_payment` (`payment_id`);

--
-- Indexes for table `registrar`
--
ALTER TABLE `registrar`
  ADD PRIMARY KEY (`registrar_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `idx_sch_subject` (`subject_id`),
  ADD KEY `idx_sch_instructor` (`instructor_id`),
  ADD KEY `idx_sch_section` (`section_id`),
  ADD KEY `idx_sch_semester` (`semester_id`),
  ADD KEY `idx_sch_year` (`year_id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`section_id`),
  ADD KEY `idx_sec_program` (`program_code`),
  ADD KEY `idx_sec_campus` (`campus_id`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`semester_id`);

--
-- Indexes for table `specializations`
--
ALTER TABLE `specializations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_spec_program` (`Program_Code`);

--
-- Indexes for table `special_programs`
--
ALTER TABLE `special_programs`
  ADD PRIMARY KEY (`special_id`),
  ADD KEY `idx_sp_college` (`college_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_student_id` (`student_id`),
  ADD KEY `idx_stu_applicant` (`applicant_id`),
  ADD KEY `idx_stu_section` (`section_id`),
  ADD KEY `idx_stu_semester` (`semester_id`),
  ADD KEY `idx_stu_program` (`program_code`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`Subject_Id`),
  ADD KEY `idx_sub_college` (`College_Id`);

--
-- Indexes for table `year`
--
ALTER TABLE `year`
  ADD PRIMARY KEY (`year_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admission_info`
--
ALTER TABLE `admission_info`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=410;

--
-- AUTO_INCREMENT for table `applicants`
--
ALTER TABLE `applicants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=400;

--
-- AUTO_INCREMENT for table `applicant_status_log`
--
ALTER TABLE `applicant_status_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `campus`
--
ALTER TABLE `campus`
  MODIFY `Campus_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `colleges`
--
ALTER TABLE `colleges`
  MODIFY `college_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `educational_background`
--
ALTER TABLE `educational_background`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=264;

--
-- AUTO_INCREMENT for table `enrolled_subjects`
--
ALTER TABLE `enrolled_subjects`
  MODIFY `enrolled_subject_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enrollment`
--
ALTER TABLE `enrollment`
  MODIFY `enrollment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `family_info`
--
ALTER TABLE `family_info`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=264;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instructors`
--
ALTER TABLE `instructors`
  MODIFY `Instructor_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `intended_course`
--
ALTER TABLE `intended_course`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=407;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `receipt`
--
ALTER TABLE `receipt`
  MODIFY `receipt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registrar`
--
ALTER TABLE `registrar`
  MODIFY `registrar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `semester`
--
ALTER TABLE `semester`
  MODIFY `semester_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `specializations`
--
ALTER TABLE `specializations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `special_programs`
--
ALTER TABLE `special_programs`
  MODIFY `special_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=397;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `Subject_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `year`
--
ALTER TABLE `year`
  MODIFY `year_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admission_info`
--
ALTER TABLE `admission_info`
  ADD CONSTRAINT `fk_admission_info_applicants` FOREIGN KEY (`applicant_id`) REFERENCES `applicants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `applicant_status_log`
--
ALTER TABLE `applicant_status_log`
  ADD CONSTRAINT `fk_asl_applicant` FOREIGN KEY (`applicant_id`) REFERENCES `applicants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `educational_background`
--
ALTER TABLE `educational_background`
  ADD CONSTRAINT `fk_educational_background_applicants` FOREIGN KEY (`applicant_id`) REFERENCES `applicants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `enrolled_subjects`
--
ALTER TABLE `enrolled_subjects`
  ADD CONSTRAINT `fk_enrolled_subjects_enrollment` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollment` (`enrollment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_enrolled_subjects_instructors` FOREIGN KEY (`instructor_id`) REFERENCES `instructors` (`Instructor_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_enrolled_subjects_subjects` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`Subject_Id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `fk_enrollment_section` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_enrollment_semester` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`semester_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_enrollment_students` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_enrollment_year` FOREIGN KEY (`year_id`) REFERENCES `year` (`year_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `family_info`
--
ALTER TABLE `family_info`
  ADD CONSTRAINT `fk_family_info_applicants` FOREIGN KEY (`applicant_id`) REFERENCES `applicants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `fk_grades_enrolled_subjects` FOREIGN KEY (`enrolled_subject_id`) REFERENCES `enrolled_subjects` (`enrolled_subject_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `instructors`
--
ALTER TABLE `instructors`
  ADD CONSTRAINT `fk_instructors_campus` FOREIGN KEY (`Campus_ID`) REFERENCES `campus` (`Campus_Id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_instructors_colleges` FOREIGN KEY (`College_ID`) REFERENCES `colleges` (`college_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_instructors_subjects` FOREIGN KEY (`Subject_ID`) REFERENCES `subjects` (`Subject_Id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `intended_course`
--
ALTER TABLE `intended_course`
  ADD CONSTRAINT `fk_intended_course_applicants` FOREIGN KEY (`applicant_id`) REFERENCES `applicants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_intended_course_programs` FOREIGN KEY (`Program_Code`) REFERENCES `programs` (`Program_Code`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_payment_semester` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`semester_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_payment_students` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_payment_year` FOREIGN KEY (`year_id`) REFERENCES `year` (`year_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `programs`
--
ALTER TABLE `programs`
  ADD CONSTRAINT `fk_programs_colleges` FOREIGN KEY (`college_id`) REFERENCES `colleges` (`college_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `receipt`
--
ALTER TABLE `receipt`
  ADD CONSTRAINT `fk_receipt_payment` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `fk_schedule_instructors` FOREIGN KEY (`instructor_id`) REFERENCES `instructors` (`Instructor_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_schedule_section` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_schedule_semester` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`semester_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_schedule_subjects` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`Subject_Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_schedule_year` FOREIGN KEY (`year_id`) REFERENCES `year` (`year_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `fk_section_campus` FOREIGN KEY (`campus_id`) REFERENCES `campus` (`Campus_Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_section_programs` FOREIGN KEY (`program_code`) REFERENCES `programs` (`Program_Code`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `specializations`
--
ALTER TABLE `specializations`
  ADD CONSTRAINT `fk_specializations_programs` FOREIGN KEY (`Program_Code`) REFERENCES `programs` (`Program_Code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `special_programs`
--
ALTER TABLE `special_programs`
  ADD CONSTRAINT `fk_special_programs_colleges` FOREIGN KEY (`college_id`) REFERENCES `colleges` (`college_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `fk_students_applicants` FOREIGN KEY (`applicant_id`) REFERENCES `applicants` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_students_programs` FOREIGN KEY (`program_code`) REFERENCES `programs` (`Program_Code`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_students_section` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_students_semester` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`semester_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `fk_subjects_colleges` FOREIGN KEY (`College_Id`) REFERENCES `colleges` (`college_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
