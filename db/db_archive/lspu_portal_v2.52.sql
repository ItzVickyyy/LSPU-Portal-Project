-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2026 at 04:36 AM
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
(253, 397, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(254, 398, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(255, 399, 'Los Banos Campus', 'College', '3rd Year', 'Senior HS Graduate', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(256, 169, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-07 07:40:16', '2026-05-07 07:40:16');

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
(253, 397, 'Bay Central Elementary School', NULL, 'Public', 2008, 2014, 'Los Baños National High School', NULL, 'Public', 2014, 2018, 'STI College', NULL, 'Public', 2018, 2020, 'STEM', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(254, 398, 'Parian Elementary School', NULL, 'Public', 2008, 2014, 'San Pablo City National High School', NULL, 'Public', 2014, 2018, 'STI College', NULL, 'Public', 2018, 2020, 'HUMSS', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(255, 399, 'Mayondon Elementary School', NULL, 'Public', 2008, 2014, 'San Pablo City National High School', NULL, 'Public', 2014, 2018, 'STI College', NULL, 'Public', 2018, 2020, 'Home Economics', '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(256, 169, 'Mayondon Elementary School', NULL, 'Public', NULL, NULL, 'Los Baños National High School', NULL, 'Public', NULL, NULL, 'Colegio de Los Baños', NULL, 'Public', NULL, NULL, 'ICT', '2026-05-07 07:42:27', '2026-05-09 13:37:50');

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
(253, 397, 'Ana', 'Ramiro', '09613301574', NULL, 'Mother', 'Bambang', 'Cabuyao', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(254, 398, 'Gloria', 'Antonio', '09864654399', NULL, 'Mother', 'Anos', 'Siniloan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(255, 399, 'Ana', 'Suiza', '09830352135', NULL, 'Mother', 'Parian', 'Nagcarlan', 'Laguna', NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Filipino', NULL, NULL, NULL, '2026-05-07 07:37:28', '2026-05-07 07:37:28'),
(256, 169, 'Jennifer', 'Oboza', NULL, NULL, 'Mother', NULL, NULL, NULL, 'Vic John', NULL, 'Salen', NULL, NULL, NULL, NULL, NULL, 'Jennifer', NULL, 'Oboza', NULL, NULL, NULL, NULL, NULL, '2026-05-07 07:42:08', '2026-05-09 13:37:50');

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
(10, 'Padallan', 'Jocelyn O.', NULL, NULL, 'MIT', 10, 8, 1),
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
(253, 397, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(254, 398, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(255, 399, 'BSIT', 'WMAD', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(256, 169, 'BSIT', 'WMAD', '2026-05-07 07:42:35', '2026-05-07 07:42:35');

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

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`schedule_id`, `subject_id`, `instructor_id`, `section_id`, `semester_id`, `year_id`, `day`, `time_start`, `time_end`, `room`) VALUES
(11, 21, 1, 1, 2, 2, 'MWF', '08:00:00', '09:00:00', 'Lab 1'),
(12, 22, 2, 1, 2, 2, 'MWF', '09:00:00', '10:00:00', 'Lab 2'),
(13, 24, 5, 1, 2, 2, 'TTH', '08:00:00', '09:30:00', 'Lab 3'),
(14, 25, 6, 1, 2, 2, 'TTH', '09:30:00', '11:00:00', 'Lab 4'),
(15, 23, 7, 1, 2, 2, 'MWF', '10:00:00', '11:00:00', 'Room 47'),
(16, 28, 3, 1, 2, 2, 'MWF', '11:00:00', '12:00:00', 'Room 47'),
(17, 18, 8, 1, 2, 2, 'SAT', '08:00:00', '11:00:00', 'TSL');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `section_id` int(11) NOT NULL,
  `section_name` varchar(50) NOT NULL,
  `program_code` varchar(20) NOT NULL,
  `year_level` int(11) NOT NULL,
  `campus_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`section_id`, `section_name`, `program_code`, `year_level`, `campus_id`) VALUES
(1, 'BSIT-2A', 'BSIT', 2, 1);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
