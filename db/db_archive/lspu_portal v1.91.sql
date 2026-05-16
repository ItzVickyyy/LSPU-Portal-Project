-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2026 at 07:47 AM
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
  `student_id` int(10) UNSIGNED NOT NULL,
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

INSERT INTO `admission_info` (`id`, `student_id`, `campus`, `student_type`, `year_level`, `admission_type`, `created_at`, `updated_at`) VALUES
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
  `student_id` int(10) UNSIGNED NOT NULL,
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

INSERT INTO `applicants` (`student_id`, `Email`, `password_hash`, `application_status`, `First_Name`, `Middle_Name`, `Last_Name`, `Suffix`, `Birthday`, `Birth_Place`, `Citizenship`, `Sex`, `Civil_Status`, `Religion`, `Disability`, `First_Generation_Student`, `Contact_Number`, `Landline_Number`, `House_Number`, `Street`, `Barangay`, `Municipality`, `Province`, `Zip_Code`, `created_at`, `updated_at`) VALUES
(1, 'janiellanodo7@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Janiella', 'N.', 'Nodo', NULL, '2006-08-17', 'Los Baños, Laguna', 'Filipino', 'Female', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09362950628', NULL, '105', NULL, 'Burol', 'Biñan', 'Laguna', '4028', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(2, 'vtressenanne@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Tressen', 'Anne M.', 'Valdez', NULL, '2006-06-28', 'Liliw, Laguna', 'Filipino', 'Female', 'Single', 'Roman Catholic', NULL, 'No', '09131994523', NULL, '518', NULL, 'Halang', 'Los Baños', 'Laguna', '4028', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(3, 'isntthiszoe@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jan', 'Salvador', 'Terania', NULL, '2006-02-24', 'Nagcarlan, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09797808098', NULL, '226', NULL, 'Bambang', 'Victoria', 'Laguna', '4026', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(4, 'jasmine.roque0707@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jasmine', 'Quintina L.', 'Roque', NULL, '2008-07-08', 'Liliw, Laguna', 'Filipino', 'Female', 'Single', 'Seventh Day Adventist', NULL, 'No', '09106977991', NULL, '715', NULL, 'Bayog', 'Pila', 'Laguna', '4019', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(5, 'eli.calinga@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Mary', 'Elisse Cyminette', 'Calinga', NULL, '2008-05-15', 'Cabuyao, Laguna', 'Filipino', 'Female', 'Single', 'Seventh Day Adventist', NULL, 'No', '09331191390', NULL, '95', NULL, 'Bayog', 'Santa Cruz', 'Laguna', '4027', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(6, 'annamariequilloy36@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Anna', 'Marie R.', 'Quilloy', NULL, '2008-02-18', 'Calamba, Laguna', 'Filipino', 'Female', 'Single', 'Born Again Christian', NULL, 'No', '09748245888', NULL, '748', NULL, 'Canlubang', 'Cabuyao', 'Laguna', '4019', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(7, 'lampasaraiza@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Raiza', 'Mae Q.', 'Lampasa', NULL, '2008-07-29', 'Nagcarlan, Laguna', 'Filipino', 'Female', 'Single', 'Islam', NULL, 'No', '09184611066', NULL, '634', NULL, 'Batong Malake', 'Siniloan', 'Laguna', '4027', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(8, 'Cedrickeusebio4@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Cedrick', 'A.', 'Eusebio', NULL, '2008-01-11', 'Liliw, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09174684276', NULL, '792', NULL, 'Bambang', 'Victoria', 'Laguna', '4008', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(9, 'johnromeldaculong@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'John', 'Romel L.', 'Daculong', NULL, '2007-08-16', 'Calamba, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09208449460', NULL, '651', NULL, 'Marinig', 'San Pablo', 'Laguna', '4027', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(10, 'darumvincentlance@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Lance', 'Vincent U.', 'Darum', NULL, '2008-01-18', 'Santa Cruz, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09324956459', NULL, '960', NULL, 'Canlubang', 'Cabuyao', 'Laguna', '4027', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(11, 'jahredlapiz20@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'John', 'Jahred L.', 'Lapiz', NULL, '2006-05-27', 'Liliw, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09673528321', NULL, '474', NULL, 'Masapang', 'Santa Cruz', 'Laguna', '4028', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(12, 'alecxiscyrusgarcia@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Alecxis', 'Cyrus M.', 'Garcia', NULL, '2008-02-17', 'Biñan, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09838908273', NULL, '333', NULL, 'Banca-banca', 'Bay', 'Laguna', '4028', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(13, 'yakitmarkangelo0@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Mark', 'Angelo C.', 'Yakit', NULL, '2006-04-25', 'San Pablo, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09964411347', NULL, '68', NULL, 'Marinig', 'Los Baños', 'Laguna', '4002', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(14, 'luigisebastianbautista@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Luigi', 'Sebastian I.', 'Bautista', NULL, '2007-03-09', 'Liliw, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09437882805', NULL, '406', NULL, 'Banca-banca', 'Victoria', 'Laguna', '4008', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(15, 'ginovargas2007@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Gino', NULL, 'Vargas', NULL, '2008-07-28', 'Santa Cruz, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09364814270', NULL, '270', NULL, 'Bayog', 'Santa Cruz', 'Laguna', '4026', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(16, 'tagleenricoh@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Joseph', 'Enricoh', 'Tagle', NULL, '2008-05-27', 'Liliw, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09335493870', NULL, '94', NULL, 'Halang', 'Cabuyao', 'Laguna', '4026', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(17, 'jedeleon0719@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'John', 'Ezequiel DL.', 'Vasquez', NULL, '2006-04-07', 'Calamba, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09271779360', NULL, '611', NULL, 'Anos', 'Bay', 'Laguna', '4008', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(18, 'joshuaescobido777@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Elvis', 'Joshua V.', 'Escobido', NULL, '2006-05-11', 'Siniloan, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09602564736', NULL, '882', NULL, 'Halang', 'Liliw', 'Laguna', '4027', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(19, 'alejandroalexamarie@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Alexa', 'Marie D.', 'Alejandro', NULL, '2006-01-24', 'Bay, Laguna', 'Filipino', 'Female', 'Single', 'Islam', NULL, 'No', '09831980933', NULL, '788', NULL, 'Burol', 'Calamba', 'Laguna', '4019', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(20, 'arniearabis@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Arnie', 'Angelie F.', 'Arabis', NULL, '2007-11-28', 'Calamba, Laguna', 'Filipino', 'Female', 'Single', 'Aglipayan', NULL, 'No', '09269820594', NULL, '897', NULL, 'Bayog', 'Siniloan', 'Laguna', '4030', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(21, 'jhecileedeluna12@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jhecilee', 'I. De', 'Luna', NULL, '2007-06-24', 'Nagcarlan, Laguna', 'Filipino', 'Female', 'Single', 'Roman Catholic', NULL, 'No', '09645119047', NULL, '306', NULL, 'Pittland', 'Santa Cruz', 'Laguna', '4019', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(22, 'brandon.lance.b.ruiz@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Brandon', 'Lance B.', 'Ruiz', NULL, '2008-11-05', 'Liliw, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09501486939', NULL, '977', NULL, 'Bambang', 'Santa Cruz', 'Laguna', '4028', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(23, 'aldrich.danieles15@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Aldrich', 'B.', 'Danieles', NULL, '2008-12-22', 'Los Baños, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09624636385', NULL, '900', NULL, 'San Antonio', 'Cabuyao', 'Laguna', '4030', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(24, 'vicreneiannegalang@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Vic', 'Renei-Anne B.', 'Galang', NULL, '2007-09-22', 'San Pablo, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09709194872', NULL, '498', NULL, 'Mayondon', 'San Pablo', 'Laguna', '4030', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(25, 'owenjedoruga@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jed', 'Owen D.', 'Oruga', NULL, '2006-05-22', 'Pila, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09235034324', NULL, '970', NULL, 'Poblacion', 'Pila', 'Laguna', '4008', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(26, 'nathaniel.aguilar26@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Nathaniel', NULL, 'Aguilar', NULL, '2006-12-05', 'Biñan, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09554340903', NULL, '707', NULL, 'Poblacion', 'Liliw', 'Laguna', '4026', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(27, 'anezanthony2521@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Anthony', NULL, 'Anez', NULL, '2007-02-16', 'Victoria, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09821218382', NULL, '922', NULL, 'Bayog', 'Siniloan', 'Laguna', '4027', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(28, 'JohnAsherPR3TZEL@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'John', 'Asher Anthony L', 'Angeles', NULL, '2008-11-25', 'Pagsanjan, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09341266931', NULL, '603', NULL, 'Batong Malake', 'San Pablo', 'Laguna', '4027', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(29, 'angagaomerham745@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Merham', NULL, 'Angagao', NULL, '2007-04-17', 'Liliw, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09176228245', NULL, '235', NULL, 'Bambang', 'Los Baños', 'Laguna', '4008', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(30, 'seiferaquino@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Seifer', NULL, 'Aquino', NULL, '2006-05-19', 'Los Baños, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09176082500', NULL, '686', NULL, 'Marinig', 'Cabuyao', 'Laguna', '4028', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(31, 'carlozemmanuel01@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Carlos', 'Emmanuel', 'Bailon', NULL, '2008-09-21', 'San Pablo, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09876693898', NULL, '249', NULL, 'Poblacion', 'Santa Cruz', 'Laguna', '4026', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(32, 'chardjonbago2026@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Chard', 'Jon T.', 'Bag-o', NULL, '2008-08-26', 'Pila, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09201281557', NULL, '363', NULL, 'Halang', 'San Pablo', 'Laguna', '4008', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(33, 'jashleianngonzales@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jashlei', 'Ann', 'Bautista', NULL, '2008-05-17', 'Siniloan, Laguna', 'Filipino', 'Female', 'Single', 'Baptist', NULL, 'No', '09158165865', NULL, '101', NULL, 'Parian', 'Victoria', 'Laguna', '4008', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(34, 'zivkayampalisoc@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Ziv', 'Kayam P.', 'Bautista', NULL, '2006-05-05', 'Siniloan, Laguna', 'Filipino', 'Female', 'Single', 'Seventh Day Adventist', NULL, 'No', '09959629660', NULL, '197', NULL, 'Burol', 'Cabuyao', 'Laguna', '4030', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(35, 'cwbonador@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Carl', 'Wilson O.', 'Bonador', NULL, '2007-01-25', 'Nagcarlan, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09552991960', NULL, '256', NULL, 'Parian', 'Santa Cruz', 'Laguna', '4027', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(36, 'borregajonamae@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jona', 'Mei', 'Borrega', NULL, '2006-06-04', 'Pagsanjan, Laguna', 'Filipino', 'Female', 'Single', 'Roman Catholic', NULL, 'No', '09205128697', NULL, '857', NULL, 'Pittland', 'Nagcarlan', 'Laguna', '4008', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(37, 'kenethanrimandoceballo@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Ken', 'Ethan R.', 'Ceballo', NULL, '2006-01-31', 'Calamba, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09353810544', NULL, '493', NULL, 'Banca-banca', 'Pila', 'Laguna', '4002', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(38, 'gishlain.carpio38@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Gishlain', 'R.', 'Carpio', NULL, '2007-03-14', 'Siniloan, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09276777762', NULL, '272', NULL, 'Banca-banca', 'Los Baños', 'Laguna', '4030', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(39, 'ntndelprado@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Antonio', 'Luis V.', 'Del Prado', NULL, '2008-07-20', 'Biñan, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09884374109', NULL, '736', NULL, 'Halang', 'Victoria', 'Laguna', '4026', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(40, 'philixnashleyebron@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Philix', 'Nashley P.', 'Ebron', NULL, '2008-09-23', 'Santa Cruz, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09333754555', NULL, '556', NULL, 'Bambang', 'Biñan', 'Laguna', '4026', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(41, 'johnstevenerasga@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'John', 'Steven C.', 'Erasga', NULL, '2006-05-05', 'Victoria, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09153839920', NULL, '942', NULL, 'Canlubang', 'Los Baños', 'Laguna', '4002', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(42, 'markgatil06@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Mark', NULL, 'Gatil', NULL, '2008-12-23', 'Santa Cruz, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09186019028', NULL, '610', NULL, 'Mayondon', 'Nagcarlan', 'Laguna', '4028', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(43, 'olsen.hipolito43@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Olsen', NULL, 'Hipolito', NULL, '2006-05-20', 'Bay, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09533550699', NULL, '593', NULL, 'Marinig', 'San Pablo', 'Laguna', '4026', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(44, 'labajoreginald69@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Reginald', 'B.', 'Labajo', NULL, '2006-03-23', 'Liliw, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09805849060', NULL, '324', NULL, 'Batong Malake', 'Siniloan', 'Laguna', '4026', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(45, 'johnarviemadriaga13@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'John', 'Arvie D.', 'Madriaga', NULL, '2007-06-19', 'San Pablo, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09437352358', NULL, '135', NULL, 'Masapang', 'Victoria', 'Laguna', '4027', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(46, 'katherine.magpantay46@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Katherine', NULL, 'Magpantay', NULL, '2007-09-07', 'Pagsanjan, Laguna', 'Filipino', 'Female', 'Single', 'Roman Catholic', NULL, 'No', '09177892576', NULL, '577', NULL, 'Canlubang', 'Pila', 'Laguna', '4002', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(47, 'manaigsamuelboris@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Samuel', 'Boris A.', 'Manaig', NULL, '2006-07-24', 'Calamba, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09643189555', NULL, '903', NULL, 'Poblacion', 'San Pablo', 'Laguna', '4028', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(48, 'johannes.naredo48@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Johannes', NULL, 'Naredo', NULL, '2006-05-21', 'San Pablo, Laguna', 'Filipino', 'Female', 'Single', 'Aglipayan', NULL, 'No', '09269379374', NULL, '721', NULL, 'Canlubang', 'Biñan', 'Laguna', '4019', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(49, 'jhuniel.pascual49@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jhuniel', NULL, 'Pascual', NULL, '2007-09-12', 'Liliw, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09667945747', NULL, '307', NULL, 'Pittland', 'Bay', 'Laguna', '4008', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(50, 'christian.pillante50@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Christian', 'Arvy', 'Pillante', NULL, '2006-08-01', 'Santa Cruz, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09214929002', NULL, '279', NULL, 'Bayog', 'Calamba', 'Laguna', '4026', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(51, 'marabbypenarubia041107@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Abby', 'Marjery P.', 'Peñarubia', NULL, '2007-08-01', 'Liliw, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09468164906', NULL, '874', NULL, 'Bambang', 'Victoria', 'Laguna', '4008', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(52, 'yjamimmanuel03@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Yjam', 'Immanuel P.', 'Plantilla', NULL, '2007-06-25', 'Nagcarlan, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09154544899', NULL, '850', NULL, 'Parian', 'Biñan', 'Laguna', '4008', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(53, 'paeng11.quilloy11@icloud.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Marc', 'Rafael S.', 'Quilloy', NULL, '2007-07-21', 'Los Baños, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09927982963', NULL, '166', NULL, 'Mayondon', 'Cabuyao', 'Laguna', '4008', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(54, 'salameroroannefaye340@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Roanne', 'Faye M.', 'Salamero', NULL, '2008-06-23', 'Nagcarlan, Laguna', 'Filipino', 'Female', 'Single', 'Roman Catholic', NULL, 'No', '09702269164', NULL, '968', NULL, 'Burol', 'Siniloan', 'Laguna', '4030', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(55, 'simonsanvalentin6@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Simon', 'T.', 'San Valentin', NULL, '2006-11-02', 'Nagcarlan, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09725464884', NULL, '131', NULL, 'Mayondon', 'Cabuyao', 'Laguna', '4028', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(56, 'risamgelotakahashi@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Risam', 'Angelo E.', 'Takahashi', NULL, '2006-03-27', 'Biñan, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09142836793', NULL, '256', NULL, 'Canlubang', 'Pila', 'Laguna', '4028', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(57, 'shaytandang@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Cyrelle', 'B.', 'Tandang', NULL, '2006-07-30', 'Cabuyao, Laguna', 'Filipino', 'Female', 'Single', 'Islam', NULL, 'No', '09536344399', NULL, '948', NULL, 'Pittland', 'Nagcarlan', 'Laguna', '4008', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(58, 'urciajohncarlo477@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Urcia', 'John Carlo', 'D.', NULL, '2007-04-30', 'Santa Cruz, Laguna', 'Filipino', 'Female', 'Single', 'Aglipayan', NULL, 'No', '09290108532', NULL, '755', NULL, 'Pittland', 'Pila', 'Laguna', '4030', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(59, 'vergarakristopher25@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Kristopher', 'P.', 'Vergara', NULL, '2007-11-12', 'Pila, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09961393416', NULL, '831', NULL, 'Banca-banca', 'Siniloan', 'Laguna', '4019', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(60, 'zayascj13@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Cyrus', 'James A.', 'Zayas', NULL, '2007-05-24', 'Biñan, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09852991721', NULL, '880', NULL, 'Anos', 'Pila', 'Laguna', '4002', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(61, 'ken17gecale@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Kenneth', 'T.', 'Gecale', NULL, '2008-08-21', 'San Pablo, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09475442872', NULL, '229', NULL, 'Bambang', 'Pagsanjan', 'Laguna', '4019', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(62, 'villanuevakheeno@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Kheeno', 'C.', 'Villanueva', NULL, '2006-02-18', 'Bay, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09452468587', NULL, '991', NULL, 'Bambang', 'Siniloan', 'Laguna', '4019', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(63, 'decastroangelo32@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Angelo', 'Kyle V. De', 'Castro', NULL, '2007-07-26', 'Cabuyao, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09529151399', NULL, '340', NULL, 'Masapang', 'Nagcarlan', 'Laguna', '4019', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(64, 'inamilazuli@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Kate', 'Marie H.', 'Contado', NULL, '2006-02-26', 'Calamba, Laguna', 'Filipino', 'Female', 'Single', 'Islam', NULL, 'No', '09291735734', NULL, '112', NULL, 'Banca-banca', 'Biñan', 'Laguna', '4027', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(65, 'jmcenteno0311@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'John', 'Mhedrick C.', 'Escobin', NULL, '2008-06-08', 'Cabuyao, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09436808455', NULL, '119', NULL, 'Burol', 'Pila', 'Laguna', '4026', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(66, 'gayahanalberttejynelle@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Albertte', 'Jynelle M.', 'Gayahan', NULL, '2008-02-28', 'Liliw, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09147659674', NULL, '533', NULL, 'Bambang', 'Biñan', 'Laguna', '4002', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(67, 'godosuguitan@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Godofredo', 'III T.', 'Suguitan', NULL, '2007-02-08', 'Cabuyao, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09813219781', NULL, '680', NULL, 'Halang', 'Calamba', 'Laguna', '4026', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(68, 'johncyrusmariano65@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'John', 'Cyrus C.', 'Mariano', NULL, '2006-09-13', 'Victoria, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09644518647', NULL, '335', NULL, 'Banca-banca', 'Biñan', 'Laguna', '4008', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(69, 'christopertien465@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Christoper', 'V.', 'Tien', NULL, '2008-04-04', 'Victoria, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09236674237', NULL, '963', NULL, 'Bayog', 'Nagcarlan', 'Laguna', '4002', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(70, 'gragastessa3@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Tessa', NULL, 'Gragas', NULL, '2008-02-16', 'Bay, Laguna', 'Filipino', 'Female', 'Single', 'Islam', NULL, 'No', '09760904107', NULL, '562', NULL, 'Burol', 'Santa Cruz', 'Laguna', '4027', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(71, 'johnrosstagum10@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'John', 'Ross R.', 'Tagum', NULL, '2006-01-01', 'Biñan, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09561588882', NULL, '671', NULL, 'Bayog', 'San Pablo', 'Laguna', '4026', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(72, 'etiennemari.orilla@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Etienne', 'Mari', 'Orilla', NULL, '2007-10-22', 'Pagsanjan, Laguna', 'Filipino', 'Female', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09825449223', NULL, '813', NULL, 'Parian', 'Pagsanjan', 'Laguna', '4026', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(73, 'vivienjoycepermejo@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Vivien', 'Joyce', 'Permejo', NULL, '2006-12-14', 'Bay, Laguna', 'Filipino', 'Female', 'Single', 'Baptist', NULL, 'No', '09653462378', NULL, '344', NULL, 'Batong Malake', 'Biñan', 'Laguna', '4008', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(74, 'sophiayvoneborromeo@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Sophia', 'Yvone', 'Pillas', NULL, '2006-07-11', 'Pila, Laguna', 'Filipino', 'Female', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09433310361', NULL, '151', NULL, 'Bambang', 'Bay', 'Laguna', '4019', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(75, 'mainesdrick@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Drick', 'Zymon M.', 'Maines', NULL, '2006-02-20', 'Los Baños, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09756350429', NULL, '467', NULL, 'Bambang', 'Pagsanjan', 'Laguna', '4019', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(76, 'johncarlomangampo11@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'John', 'Carlo C.', 'Mangampo', NULL, '2008-04-28', 'Bay, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09871318048', NULL, '410', NULL, 'San Antonio', 'San Pablo', 'Laguna', '4002', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(77, 'cdtan98@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Christian', 'Daniel D.', 'Tan', NULL, '2007-05-15', 'Santa Cruz, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09105953697', NULL, '798', NULL, 'Masapang', 'Victoria', 'Laguna', '4019', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(78, 'pagnejeff0213@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jeffrey', 'F.', 'Pagne', NULL, '2008-05-20', 'San Pablo, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09847229579', NULL, '571', NULL, 'Anos', 'Pila', 'Laguna', '4002', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(79, 'kimberlyespitiu85@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Kimberly', NULL, 'Espiritu', NULL, '2007-05-26', 'Calamba, Laguna', 'Filipino', 'Female', 'Single', 'Aglipayan', NULL, 'No', '09960514523', NULL, '573', NULL, 'Parian', 'Santa Cruz', 'Laguna', '4008', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(80, 'noreenanez82@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Noreen', 'D.', 'Añez', NULL, '2007-10-12', 'Pila, Laguna', 'Filipino', 'Female', 'Single', 'Seventh Day Adventist', NULL, 'No', '09757830420', NULL, '437', NULL, 'Banca-banca', 'Pagsanjan', 'Laguna', '4008', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(81, 'edwardnatal9@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Edward', NULL, 'Natal', NULL, '2008-07-02', 'Santa Cruz, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09583258726', NULL, '861', NULL, 'Burol', 'Pagsanjan', 'Laguna', '4019', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(82, 'islavincent83@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Vincent', 'Nicolas G.', 'Isla', NULL, '2007-07-22', 'Pila, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09620332086', NULL, '451', NULL, 'Pittland', 'Nagcarlan', 'Laguna', '4028', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(83, 'jirehb.quiamno@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jireh', NULL, 'Quiamno', NULL, '2006-06-08', 'Victoria, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09391751878', NULL, '83', NULL, 'Bayog', 'San Pablo', 'Laguna', '4027', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(84, 'ppaezpauline07@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Pauline', 'O.', 'Paez', NULL, '2006-10-11', 'Santa Cruz, Laguna', 'Filipino', 'Female', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09845122940', NULL, '66', NULL, 'Bambang', 'Siniloan', 'Laguna', '4008', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(85, 'kelvinnabia@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Kelvin', 'N.', 'Agar', NULL, '2008-04-29', 'Siniloan, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09600282414', NULL, '853', NULL, 'Canlubang', 'Nagcarlan', 'Laguna', '4030', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(86, 'patricktandang696@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Patrick', 'E.', 'Tandang', NULL, '2008-05-10', 'Siniloan, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09727150493', NULL, '390', NULL, 'Banca-banca', 'Pila', 'Laguna', '4030', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(87, 'thirdyagustin123@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Solano', 'G. Agustin', 'Agustin', 'III', '2008-09-03', 'Los Baños, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09909037759', NULL, '552', NULL, 'Canlubang', 'Biñan', 'Laguna', '4019', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(88, 'aledadrionalcachupas@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Aled', 'Adrion S.', 'Alcachupas', NULL, '2007-03-28', 'Pagsanjan, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09567975319', NULL, '345', NULL, 'Bambang', 'Biñan', 'Laguna', '4030', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(89, 'khervieamasan@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Khervie', 'B.', 'Amasan', NULL, '2008-04-08', 'Victoria, Laguna', 'Filipino', 'Female', 'Single', 'Islam', NULL, 'No', '09237039296', NULL, '929', NULL, 'Anos', 'Pagsanjan', 'Laguna', '4026', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(90, 'caiiiii.aquino@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Cailyn', 'G.', 'Aquino', NULL, '2008-03-17', 'Liliw, Laguna', 'Filipino', 'Female', 'Single', 'Roman Catholic', NULL, 'No', '09129100607', NULL, '139', NULL, 'San Antonio', 'Bay', 'Laguna', '4008', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(91, 'bacorrodarren07@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Darren', 'P.', 'Bacorro', NULL, '2008-08-03', 'Santa Cruz, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09507059676', NULL, '335', NULL, 'Mayondon', 'Biñan', 'Laguna', '4028', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(92, 'cjaybanasihan4@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Cjay', 'R.', 'Banasihan', NULL, '2007-11-23', 'Pila, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09398775766', NULL, '259', NULL, 'Banca-banca', 'Siniloan', 'Laguna', '4019', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(93, 'biancakim.bondoc@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Bianca', 'Kim H.', 'Bondoc', NULL, '2006-06-17', 'Pagsanjan, Laguna', 'Filipino', 'Female', 'Single', 'Roman Catholic', NULL, 'No', '09679196799', NULL, '666', NULL, 'Mayondon', 'Victoria', 'Laguna', '4027', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(94, 'euneel75@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'John', 'Euneel B.', 'Dacir', NULL, '2006-05-21', 'Pila, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09909851739', NULL, '860', NULL, 'Masapang', 'Los Baños', 'Laguna', '4028', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(95, 'shaneashleydaet@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Shane', 'Ashley B.', 'Daet', NULL, '2006-02-11', 'Liliw, Laguna', 'Filipino', 'Female', 'Single', 'Aglipayan', NULL, 'No', '09235528741', NULL, '578', NULL, 'Anos', 'San Pablo', 'Laguna', '4008', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(96, 'ashlheagayland@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Sittie', 'Ashlhea G.', 'Datuimam', NULL, '2007-03-23', 'Pagsanjan, Laguna', 'Filipino', 'Female', 'Single', 'Born Again Christian', NULL, 'No', '09923450567', NULL, '622', NULL, 'Burol', 'Biñan', 'Laguna', '4028', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(97, 'deverakurt0207@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Charlie', 'Kurt I De', 'Vera', NULL, '2006-08-23', 'Pila, Laguna', 'Filipino', 'Female', 'Single', 'Roman Catholic', NULL, 'No', '09433975497', NULL, '952', NULL, 'Marinig', 'Santa Cruz', 'Laguna', '4026', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(98, 'mjamesescobin@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Marc', 'James P.', 'Escobin', NULL, '2007-10-01', 'Liliw, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09525904456', NULL, '607', NULL, 'Masapang', 'Siniloan', 'Laguna', '4028', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(99, 'bradd396@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Bradd', 'Geizler M.', 'Eusebio', NULL, '2007-05-13', 'Calamba, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09423821937', NULL, '825', NULL, 'Burol', 'Pila', 'Laguna', '4008', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(100, 'shawnjobli17@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Shawn', 'Kennth B.', 'Jobli', NULL, '2006-09-05', 'Pila, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09144097647', NULL, '678', NULL, 'San Antonio', 'Pila', 'Laguna', '4026', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(101, 'tmlantican06@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Trisha', 'Mae D.', 'Lantican', NULL, '2008-01-29', 'Calamba, Laguna', 'Filipino', 'Female', 'Single', 'Roman Catholic', NULL, 'No', '09466394187', NULL, '843', NULL, 'Poblacion', 'Bay', 'Laguna', '4019', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(102, 'darzellapitan@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Darzel', 'Marie H.', 'Lapitan', NULL, '2008-09-30', 'Calamba, Laguna', 'Filipino', 'Female', 'Single', 'Seventh Day Adventist', NULL, 'No', '09782454310', NULL, '157', NULL, 'Halang', 'Cabuyao', 'Laguna', '4002', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(103, 'rayvermacapagal17@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Rayver', 'V.', 'Macapagal', NULL, '2008-06-10', 'Santa Cruz, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09798423334', NULL, '794', NULL, 'Burol', 'Nagcarlan', 'Laguna', '4026', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(104, 'gianmac2007@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Gian', 'Brixz A.', 'Macatangay', NULL, '2008-09-17', 'Pagsanjan, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09736164778', NULL, '851', NULL, 'Halang', 'Victoria', 'Laguna', '4027', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(105, 'madeloj822@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Justine', 'L.', 'Madelo', NULL, '2006-06-27', 'Biñan, Laguna', 'Filipino', 'Female', 'Single', 'Seventh Day Adventist', NULL, 'No', '09361846370', NULL, '625', NULL, 'Banca-banca', 'Pagsanjan', 'Laguna', '4002', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(106, 'rainemagundayao@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Raine', 'G.', 'Magundayao', NULL, '2008-02-16', 'Cabuyao, Laguna', 'Filipino', 'Female', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09448981305', NULL, '364', NULL, 'Mayondon', 'Pagsanjan', 'Laguna', '4002', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(107, 'patrickangelomanese@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Patrick', 'Angelo C', 'Manese', NULL, '2007-06-14', 'Cabuyao, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09852890318', NULL, '530', NULL, 'Bayog', 'Liliw', 'Laguna', '4026', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(108, 'ravennabia3@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Raven', 'M.', 'Nabia', NULL, '2007-01-27', 'Calamba, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09536398872', NULL, '708', NULL, 'Bambang', 'Victoria', 'Laguna', '4026', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(109, 'julianoracion08@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Julian', 'D.', 'Oracion', NULL, '2008-09-02', 'Bay, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09581223755', NULL, '302', NULL, 'Burol', 'Pagsanjan', 'Laguna', '4030', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(110, 'santillanchristinedenise@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Christine', 'Denise A.', 'Santillan', NULL, '2007-03-30', 'Siniloan, Laguna', 'Filipino', 'Female', 'Single', 'Baptist', NULL, 'No', '09428786222', NULL, '485', NULL, 'Burol', 'San Pablo', 'Laguna', '4026', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(111, 'Ianjay.servallos05@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Ian', 'Jay L.', 'Servallos', NULL, '2008-12-23', 'Cabuyao, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09690975123', NULL, '465', NULL, 'Halang', 'Victoria', 'Laguna', '4027', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(112, 'suamenjustine2005@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Justine', 'T.', 'Suamen', NULL, '2007-07-09', 'Biñan, Laguna', 'Filipino', 'Female', 'Single', 'Baptist', NULL, 'No', '09229553265', NULL, '123', NULL, 'Bayog', 'San Pablo', 'Laguna', '4028', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(113, 'johniansubiaga@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'John', 'Ian P.', 'Subiaga', NULL, '2007-01-15', 'San Pablo, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09619904272', NULL, '779', NULL, 'Bambang', 'Victoria', 'Laguna', '4008', '2026-05-07 02:11:59', '2026-05-07 02:11:59'),
(114, 'blancojohnrussel@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'John', 'Russel A.', 'Blanco', NULL, '2006-04-07', 'Siniloan, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09291987535', NULL, '137', NULL, 'Bambang', 'Liliw', 'Laguna', '4028', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(115, 'marrianecampaner@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Marriane', 'Angel B.', 'Campaner', NULL, '2006-05-13', 'Victoria, Laguna', 'Filipino', 'Female', 'Single', 'Seventh Day Adventist', NULL, 'No', '09332671596', NULL, '383', NULL, 'San Antonio', 'Liliw', 'Laguna', '4019', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(116, 'johnromeldaculong1@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'John', 'Romel L.', 'Daculong', NULL, '2006-12-18', 'Bay, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09603626844', NULL, '44', NULL, 'Pittland', 'Calamba', 'Laguna', '4002', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(117, 'delasoledadenrique08@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Enrique', 'Jr D. Dela', 'Soledad', NULL, '2006-11-28', 'San Pablo, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09155102070', NULL, '222', NULL, 'San Antonio', 'Pagsanjan', 'Laguna', '4028', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(118, 'andrewartiflores@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Andrew', 'A.', 'Flores', NULL, '2004-08-12', 'Los Baños, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09834294137', NULL, '84', NULL, 'Anos', 'Pagsanjan', 'Laguna', '4002', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(119, 'paulllanes23@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Paul', 'M.', 'Llanes', NULL, '2004-10-05', 'Nagcarlan, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09945266599', NULL, '217', NULL, 'Halang', 'San Pablo', 'Laguna', '4008', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(120, 'jerumundia18@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jerusalyn', 'D.', 'Mundia', NULL, '2004-09-25', 'Victoria, Laguna', 'Filipino', 'Female', 'Single', 'Seventh Day Adventist', NULL, 'No', '09743888646', NULL, '155', NULL, 'Marinig', 'Victoria', 'Laguna', '4008', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(121, 'ocampoprincess0219@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Princess', 'C.', 'Ocampo', NULL, '2004-10-25', 'San Pablo, Laguna', 'Filipino', 'Female', 'Single', 'Seventh Day Adventist', NULL, 'No', '09442637958', NULL, '818', NULL, 'Banca-banca', 'Nagcarlan', 'Laguna', '4002', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(122, 'rosalescarl20@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Carl', 'Joseph E.', 'Rosales', NULL, '2004-04-07', 'Cabuyao, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09528531261', NULL, '832', NULL, 'Bambang', 'Siniloan', 'Laguna', '4019', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(123, 'sanvalentinjhonpaul42@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jhon', 'Paul B.', 'Sanvalentin', NULL, '2006-02-02', 'Victoria, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09927663415', NULL, '319', NULL, 'Marinig', 'Siniloan', 'Laguna', '4028', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(124, 'sanchezluigie@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Luigie', 'G.', 'Sanchez', NULL, '2005-05-26', 'Siniloan, Laguna', 'Filipino', 'Female', 'Single', 'Roman Catholic', NULL, 'No', '09906923689', NULL, '432', NULL, 'Bayog', 'Pagsanjan', 'Laguna', '4002', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(125, 'johncarlosojor2@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'John', 'Carlo M.', 'Sojor', NULL, '2006-06-01', 'Biñan, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09987253879', NULL, '290', NULL, 'Halang', 'Bay', 'Laguna', '4028', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(126, 'danieltejadaoctober@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Daniel', 'F.', 'Tejada', NULL, '2005-12-08', 'Los Baños, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09845539206', NULL, '198', NULL, 'Masapang', 'Cabuyao', 'Laguna', '4019', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(127, 'undadilauren13@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Lauren', 'M.', 'Undadi', NULL, '2004-01-08', 'Calamba, Laguna', 'Filipino', 'Female', 'Single', 'Roman Catholic', NULL, 'No', '09317430468', NULL, '318', NULL, 'Poblacion', 'Nagcarlan', 'Laguna', '4026', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(128, 'lanceedwinmarquezmaligaya@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Lance', 'Edwin M.', 'Maligaya', NULL, '2005-08-11', 'San Pablo, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09212905579', NULL, '78', NULL, 'Burol', 'Los Baños', 'Laguna', '4027', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(129, 'sampereketsu1@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Karl', 'Michael E.', 'Bautista', NULL, '2005-08-27', 'San Pablo, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09952142273', NULL, '809', NULL, 'Pittland', 'Calamba', 'Laguna', '4002', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(130, 'hermiekadacallos@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Hermie', NULL, 'Dacallos', NULL, '2006-03-07', 'Siniloan, Laguna', 'Filipino', 'Female', 'Single', 'Born Again Christian', NULL, 'No', '09292021613', NULL, '213', NULL, 'Poblacion', 'Victoria', 'Laguna', '4027', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(131, 'palisron339@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Ron', NULL, 'Palis', NULL, '2006-09-02', 'Bay, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09670869406', NULL, '536', NULL, 'Anos', 'Calamba', 'Laguna', '4002', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(132, 'shanebcld@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Irah', 'Shane P.', 'Bacolod', NULL, '2006-12-27', 'Biñan, Laguna', 'Filipino', 'Female', 'Single', 'Born Again Christian', NULL, 'No', '09725931728', NULL, '268', NULL, 'Masapang', 'Los Baños', 'Laguna', '4002', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(133, 'justinnatal01@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Justine', 'M.', 'Natal', NULL, '2005-04-15', 'Nagcarlan, Laguna', 'Filipino', 'Female', 'Single', 'Seventh Day Adventist', NULL, 'No', '09270206043', NULL, '59', NULL, 'Pittland', 'Biñan', 'Laguna', '4002', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(134, 'eyrianbarayang@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Crislien', 'Ariane S.', 'Barayang', NULL, '2006-01-17', 'Calamba, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09932782413', NULL, '719', NULL, 'Poblacion', 'San Pablo', 'Laguna', '4028', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(135, 'jiancaraitm23@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jian', 'Carl C.', 'Malihan', NULL, '2004-06-26', 'Los Baños, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09794294565', NULL, '363', NULL, 'Pittland', 'Nagcarlan', 'Laguna', '4028', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(136, 'vkhimharvy@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Khim', 'Harvy C.', 'Villamayor', NULL, '2006-06-12', 'San Pablo, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09893333958', NULL, '509', NULL, 'Bayog', 'Santa Cruz', 'Laguna', '4028', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(137, 'gianbotones05@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Giancarlo', 'G.', 'Botones', NULL, '2004-06-13', 'Santa Cruz, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09931124589', NULL, '260', NULL, 'Banca-banca', 'Santa Cruz', 'Laguna', '4027', '2026-05-07 07:32:44', '2026-05-07 07:32:44');
INSERT INTO `applicants` (`student_id`, `Email`, `password_hash`, `application_status`, `First_Name`, `Middle_Name`, `Last_Name`, `Suffix`, `Birthday`, `Birth_Place`, `Citizenship`, `Sex`, `Civil_Status`, `Religion`, `Disability`, `First_Generation_Student`, `Contact_Number`, `Landline_Number`, `House_Number`, `Street`, `Barangay`, `Municipality`, `Province`, `Zip_Code`, `created_at`, `updated_at`) VALUES
(138, 'vashty.bacorro@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Vashty', 'J.', 'Bacorro', NULL, '2004-01-24', 'Biñan, Laguna', 'Filipino', 'Female', 'Single', 'Born Again Christian', NULL, 'No', '09417539716', NULL, '505', NULL, 'Pittland', 'Nagcarlan', 'Laguna', '4030', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(139, 'miccahella04@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Maria', 'Princessa Miccahella M.', 'Mamaril', NULL, '2005-10-31', 'Pila, Laguna', 'Filipino', 'Female', 'Single', 'Seventh Day Adventist', NULL, 'No', '09504430839', NULL, '625', NULL, 'Marinig', 'Los Baños', 'Laguna', '4027', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(140, 'juuzuodesu@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jasper', 'M.', 'Gonzales', NULL, '2005-04-11', 'Santa Cruz, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09158596827', NULL, '664', NULL, 'Poblacion', 'Siniloan', 'Laguna', '4028', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(141, 'azegonzales015@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jeza', 'M.', 'Gonzales', NULL, '2004-09-26', 'Santa Cruz, Laguna', 'Filipino', 'Female', 'Single', 'Born Again Christian', NULL, 'No', '09165789904', NULL, '594', NULL, 'Masapang', 'Biñan', 'Laguna', '4028', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(142, 'ronnelasinas75@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Ronnel', 'E.', 'Asinas', NULL, '2005-04-22', 'Cabuyao, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09613433052', NULL, '379', NULL, 'Halang', 'Santa Cruz', 'Laguna', '4030', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(143, 'prafaellouise@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Rafael', 'Louise R.', 'Perez', NULL, '2004-12-21', 'Santa Cruz, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09366738897', NULL, '703', NULL, 'Parian', 'Victoria', 'Laguna', '4019', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(144, 'macalengjm@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jose', 'Mari Elliflor J.', 'Macaleng', NULL, '2005-04-09', 'Bay, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09524589972', NULL, '75', NULL, 'Burol', 'Siniloan', 'Laguna', '4026', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(145, 'kennethpunla62@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Kenneth', 'Z', 'Punla', NULL, '2004-03-01', 'Los Baños, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09438433842', NULL, '679', NULL, 'Halang', 'Los Baños', 'Laguna', '4030', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(146, 'esplanam60@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Mark', 'Philip L.', 'Esplana', NULL, '2006-01-16', 'Calamba, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09517941359', NULL, '313', NULL, 'Anos', 'Cabuyao', 'Laguna', '4008', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(147, 'justinmarkmelchor@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Justin', 'Mark A.', 'Melchor', NULL, '2004-06-09', 'Siniloan, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09441423824', NULL, '552', NULL, 'Mayondon', 'Cabuyao', 'Laguna', '4028', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(148, 'jaraplasanmichael170@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Michael', 'S.', 'Jaraplasan', NULL, '2005-06-08', 'Pila, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09100797513', NULL, '674', NULL, 'Batong Malake', 'Bay', 'Laguna', '4030', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(149, 'acasokim11@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Kim', 'Charles G.', 'Acaso', NULL, '2005-06-22', 'Cabuyao, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09968012421', NULL, '544', NULL, 'Burol', 'Cabuyao', 'Laguna', '4027', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(150, 'kimchestere@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Kim', 'Chester', 'Eclarinal', NULL, '2005-09-20', 'Liliw, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09328325712', NULL, '456', NULL, 'San Antonio', 'San Pablo', 'Laguna', '4008', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(151, 'jeanmervinfajardo@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jean', 'Mervin G.', 'Fajardo', NULL, '2005-08-01', 'Pagsanjan, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09855858262', NULL, '814', NULL, 'Pittland', 'Pila', 'Laguna', '4002', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(152, 'joshualapie22@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Joshua', 'A.', 'Lapie', NULL, '2005-03-02', 'Calamba, Laguna', 'Filipino', 'Female', 'Single', 'Baptist', NULL, 'No', '09587232801', NULL, '347', NULL, 'San Antonio', 'Biñan', 'Laguna', '4002', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(153, 'matthewbanasihan421@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Matthew', 'M.', 'Banasihan', NULL, '2005-01-28', 'Siniloan, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09806176558', NULL, '19', NULL, 'Banca-banca', 'Bay', 'Laguna', '4026', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(154, 'vaunghclassifiedemail@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Vaungh', 'Louie Andrey P.', 'Lat', NULL, '2005-01-10', 'Santa Cruz, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09841652710', NULL, '723', NULL, 'Marinig', 'Pila', 'Laguna', '4028', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(155, 'leanmagbanua1@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Alejandro', 'IV B.', 'Magbanua', NULL, '2005-07-04', 'Nagcarlan, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09880841488', NULL, '281', NULL, 'Bayog', 'Biñan', 'Laguna', '4019', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(156, 'justinreboton98@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Justin', 'Adrian P.', 'Reboton', NULL, '2005-08-18', 'Liliw, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09926370261', NULL, '849', NULL, 'Parian', 'San Pablo', 'Laguna', '4027', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(157, 'jahremdizon191@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jahrem', 'M.', 'Dizon', NULL, '2005-11-05', 'Nagcarlan, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09639546307', NULL, '364', NULL, 'Anos', 'Pila', 'Laguna', '4026', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(158, 'nicolecarpena917@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Nicole', 'P.', 'Carpena', NULL, '2004-01-01', 'Cabuyao, Laguna', 'Filipino', 'Female', 'Single', 'Aglipayan', NULL, 'No', '09887724230', NULL, '813', NULL, 'Burol', 'Pila', 'Laguna', '4026', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(159, 'accacharles425@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Charles', 'Allen B.', 'Nuñez', NULL, '2005-02-03', 'Calamba, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09420747002', NULL, '151', NULL, 'Pittland', 'San Pablo', 'Laguna', '4030', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(160, 'kurtlindon.bariuan996@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Kurt', 'Lindon M.', 'Bariuan', NULL, '2005-10-24', 'Los Baños, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09419729451', NULL, '517', NULL, 'Marinig', 'San Pablo', 'Laguna', '4027', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(161, 'eismamuhaimin@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Muhaimin', 'E.', 'Abdurahman', NULL, '2004-09-24', 'Los Baños, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09847066383', NULL, '936', NULL, 'Burol', 'Cabuyao', 'Laguna', '4008', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(162, 'pamulaklakinzoren2@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Zorine', 'Ivan D.', 'Pamulaklakin', NULL, '2004-12-27', 'Victoria, Laguna', 'Filipino', 'Female', 'Single', 'Born Again Christian', NULL, 'No', '09673271287', NULL, '17', NULL, 'Poblacion', 'Pila', 'Laguna', '4030', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(163, 'athren.banasihan@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Athren', 'M.', 'Banasihan', NULL, '2005-10-16', 'Bay, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09995508369', NULL, '567', NULL, 'Poblacion', 'Biñan', 'Laguna', '4028', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(164, 'andreivegetables@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Julius', 'Andrei P.', 'Gulay', NULL, '2006-05-17', 'San Pablo, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09143228936', NULL, '95', NULL, 'Masapang', 'Santa Cruz', 'Laguna', '4008', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(165, 'hrnndzjsrfl24@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jose', 'Rafael A.', 'Hernandez', NULL, '2006-02-11', 'Biñan, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09935710677', NULL, '65', NULL, 'Batong Malake', 'San Pablo', 'Laguna', '4028', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(166, 'pjgundayao17@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Paul', 'Jonathan G.', 'Gundayao', NULL, '2004-09-11', 'Liliw, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09396497589', NULL, '139', NULL, 'Masapang', 'Biñan', 'Laguna', '4028', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(167, 'nkdxvn@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Kind', 'Mighty P.', 'Genayas', NULL, '2005-05-20', 'Siniloan, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09237801521', NULL, '445', NULL, 'Poblacion', 'Nagcarlan', 'Laguna', '4027', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(168, 'adrianpadilla8296@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Adrian', 'F.', 'Padilla', NULL, '2004-05-15', 'Pagsanjan, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09359491718', NULL, '39', NULL, 'Banca-banca', 'Biñan', 'Laguna', '4026', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(169, 'johnsalen13@gmail.com', '$2y$10$I4HB0pYj.quJKBmREx/1f.ayh2wQoDCyoY.OSoBNO2wr5hAZ8jJny', 'Enrolled', 'Vic John', 'Oboza', 'Salen', 'Jr.', '2005-10-13', 'Bay, Laguna', 'Filipino', 'Male', 'Single', NULL, NULL, 'No', '09918833309', NULL, '12782', 'J. Aquino', 'Mayondon', 'Los Baños', 'Laguna', '4030', '2026-05-07 07:32:44', '2026-05-09 13:38:23'),
(170, 'seguerarosalie1@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Rosalie', 'B.', 'Seguera', NULL, '2005-03-26', 'Santa Cruz, Laguna', 'Filipino', 'Female', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09298057273', NULL, '939', NULL, 'Masapang', 'Siniloan', 'Laguna', '4019', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(171, 'dietherlaforteza@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Gife', 'Diether Paul G.', 'Laforteza', NULL, '2004-03-07', 'Bay, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09522467379', NULL, '961', NULL, 'Bambang', 'Liliw', 'Laguna', '4027', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(172, 'bancajames30@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'JAMES', 'VINCENT I.', 'BANCA', NULL, '2005-11-06', 'Liliw, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09675816443', NULL, '683', NULL, 'Marinig', 'Cabuyao', 'Laguna', '4028', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(173, 'lukeishel09@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Luke', 'Ishel', 'Antonio', NULL, '2006-03-07', 'Victoria, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09379450804', NULL, '491', NULL, 'Halang', 'Victoria', 'Laguna', '4027', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(174, 'charlsmacapalan255@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Charls', 'G.', 'Macapalan', NULL, '2004-02-06', 'Santa Cruz, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09421856650', NULL, '403', NULL, 'Poblacion', 'San Pablo', 'Laguna', '4027', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(175, 'tk.caracuel023@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Tristan', 'Kim C.', 'Caracuel', NULL, '2006-08-07', 'Pagsanjan, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09616834948', NULL, '750', NULL, 'Bayog', 'Victoria', 'Laguna', '4027', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(176, 'shnshlyctpng@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Shaine', 'Ashley', 'Catapang', NULL, '2004-11-10', 'Pila, Laguna', 'Filipino', 'Female', 'Single', 'Roman Catholic', NULL, 'No', '09637018407', NULL, '705', NULL, 'Parian', 'San Pablo', 'Laguna', '4019', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(177, 'cyrusvhon1233@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Cyrus', 'Vhon S.', 'Obog', NULL, '2004-07-02', 'San Pablo, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09365607952', NULL, '161', NULL, 'Masapang', 'Pila', 'Laguna', '4002', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(178, 'munozrayhen@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Rayvhen', 'P.', 'Muñoz', NULL, '2004-04-25', 'Calamba, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09507761146', NULL, '269', NULL, 'Masapang', 'Pagsanjan', 'Laguna', '4008', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(179, 'isaiahhadap16@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Isaiah', 'Ranel G.', 'Hadap', NULL, '2006-06-08', 'Cabuyao, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09281069185', NULL, '493', NULL, 'Bayog', 'Victoria', 'Laguna', '4028', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(180, 'ezekielranelhadap@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Ezekiel', 'Ranel G.', 'Hadap', NULL, '2006-11-28', 'Pagsanjan, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09422064542', NULL, '630', NULL, 'San Antonio', 'Liliw', 'Laguna', '4002', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(181, 'belga.ramoskristineo@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Kristine', 'R.', 'Belga', NULL, '2004-01-24', 'Siniloan, Laguna', 'Filipino', 'Female', 'Single', 'Roman Catholic', NULL, 'No', '09989437203', NULL, '201', NULL, 'Halang', 'Cabuyao', 'Laguna', '4008', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(182, 'johnvincentallovida04@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'John', 'Vincent F.', 'Allovida', NULL, '2005-01-21', 'Santa Cruz, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09925732729', NULL, '355', NULL, 'Bambang', 'Pila', 'Laguna', '4030', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(183, 'rahnelbagongon@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Rahnel', 'V.', 'Bagongon', NULL, '2005-03-12', 'Nagcarlan, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09297464752', NULL, '488', NULL, 'Pittland', 'Los Baños', 'Laguna', '4027', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(184, 'nelmanalastas04@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Leonel', 'J.', 'Manalastas', NULL, '2004-08-02', 'Santa Cruz, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09982639288', NULL, '818', NULL, 'San Antonio', 'Los Baños', 'Laguna', '4028', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(185, 'garciajayson2004@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jayson', 'R.', 'Garcia', NULL, '2006-09-10', 'Bay, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09604150725', NULL, '549', NULL, 'Parian', 'Los Baños', 'Laguna', '4027', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(186, 'aguilarcasely@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Casely', 'L.', 'Aguilar', NULL, '2004-01-08', 'Santa Cruz, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09492327618', NULL, '691', NULL, 'Canlubang', 'Cabuyao', 'Laguna', '4027', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(187, 'kylestephentandang69@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Kyle', 'Stephen L.', 'Tandang', NULL, '2005-09-24', 'Nagcarlan, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09817531006', NULL, '808', NULL, 'Batong Malake', 'Calamba', 'Laguna', '4030', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(188, 'marielorainneaquino091503@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Marie', 'Lorainne H.', 'Aquino', NULL, '2004-04-20', 'Santa Cruz, Laguna', 'Filipino', 'Female', 'Single', 'Islam', NULL, 'No', '09962215636', NULL, '172', NULL, 'Poblacion', 'Biñan', 'Laguna', '4002', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(189, 'jesraelcaranza2@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jesrael', 'S.', 'Caranza', NULL, '2005-01-01', 'Santa Cruz, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09721952966', NULL, '24', NULL, 'Banca-banca', 'Victoria', 'Laguna', '4008', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(190, 'marcojayreyes98@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Marco', 'Jay V.', 'Reyes', NULL, '2004-10-07', 'Biñan, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09720956906', NULL, '323', NULL, 'Masapang', 'Cabuyao', 'Laguna', '4028', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(191, 'angelodlvg2005@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Angelo', 'Dela', 'Vega', NULL, '2004-12-26', 'Los Baños, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09836403311', NULL, '502', NULL, 'Masapang', 'Liliw', 'Laguna', '4027', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(192, 'riddikdeleon62@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Riddik', 'De', 'Leon', NULL, '2006-07-18', 'Biñan, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09579228132', NULL, '289', NULL, 'Halang', 'San Pablo', 'Laguna', '4019', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(193, 'marcojayreyes981@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Nile', 'B', 'Torres', NULL, '2004-03-19', 'Santa Cruz, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09392113008', NULL, '448', NULL, 'Mayondon', 'San Pablo', 'Laguna', '4019', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(194, 'arcebuchejohnashley@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'John', 'Ashley Sorio', 'Archebuche', NULL, '2004-05-21', 'Calamba, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09388998585', NULL, '838', NULL, 'Mayondon', 'Victoria', 'Laguna', '4019', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(195, 'nicolejazminelspu@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Nicole', 'jazmine B.', 'Layosa', NULL, '2006-08-18', 'San Pablo, Laguna', 'Filipino', 'Female', 'Single', 'Roman Catholic', NULL, 'No', '09444289719', NULL, '179', NULL, 'Poblacion', 'Pagsanjan', 'Laguna', '4027', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(196, 'marcojayreyes982@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Cyril', 'Lopena', 'Sumipo', NULL, '2006-11-21', 'Nagcarlan, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09799908198', NULL, '479', NULL, 'Canlubang', 'Victoria', 'Laguna', '4026', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(197, 'raffygepilgon29@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Raffy', NULL, 'Gepilgon', NULL, '2004-09-01', 'Pila, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09316631543', NULL, '642', NULL, 'Pittland', 'Santa Cruz', 'Laguna', '4028', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(198, 'jesicapaulinedeclaro12@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jesica', 'Pauline A. De', 'Claro', NULL, '2004-02-06', 'Bay, Laguna', 'Filipino', 'Female', 'Single', 'Islam', NULL, 'No', '09828354661', NULL, '635', NULL, 'San Antonio', 'Pagsanjan', 'Laguna', '4002', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(199, 'perollykaanne23@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Lyka', 'Anne S.', 'Perol', NULL, '2006-08-09', 'Nagcarlan, Laguna', 'Filipino', 'Female', 'Single', 'Seventh Day Adventist', NULL, 'No', '09613491971', NULL, '812', NULL, 'Canlubang', 'Pila', 'Laguna', '4028', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(200, 'dexterdrio18@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Dexter', 'M.', 'Drio', NULL, '2006-12-17', 'Santa Cruz, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09550103044', NULL, '299', NULL, 'Poblacion', 'Liliw', 'Laguna', '4008', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(201, 'almartinlacambra68@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Almartin', 'T.', 'Lacambra', NULL, '2005-02-09', 'Pila, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09370650821', NULL, '973', NULL, 'Poblacion', 'Victoria', 'Laguna', '4028', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(202, 'gerlynsalamero@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Gerlyn', 'Mae M.', 'Salamero', NULL, '2005-05-11', 'San Pablo, Laguna', 'Filipino', 'Female', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09398553889', NULL, '520', NULL, 'Masapang', 'Biñan', 'Laguna', '4026', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(203, 'johnjeryasis@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'John', 'Jery E.', 'Asis', NULL, '2006-07-29', 'Santa Cruz, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09426648140', NULL, '535', NULL, 'Bambang', 'Liliw', 'Laguna', '4030', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(204, 'jilliansoriano071@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jillian', 'P.', 'Soriano', NULL, '2005-07-11', 'Nagcarlan, Laguna', 'Filipino', 'Female', 'Single', 'Seventh Day Adventist', NULL, 'No', '09517822484', NULL, '867', NULL, 'Batong Malake', 'Santa Cruz', 'Laguna', '4026', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(205, 'duranjames574@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'James', 'Carlo C.', 'Duran', NULL, '2006-11-14', 'Calamba, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09750735221', NULL, '681', NULL, 'Parian', 'Calamba', 'Laguna', '4027', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(206, 'kinoulala607@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Justin', 'Rain C.', 'Aquino', NULL, '2006-01-25', 'San Pablo, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09210388750', NULL, '26', NULL, 'Canlubang', 'Cabuyao', 'Laguna', '4008', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(207, 'kurtian267@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Kurt', 'Ian L.', 'Enriquez', NULL, '2006-09-04', 'Pila, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09334544934', NULL, '686', NULL, 'Mayondon', 'Biñan', 'Laguna', '4019', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(208, 'kenbello35@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jeff', 'Chent', 'Bello', NULL, '2005-01-12', 'Nagcarlan, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09769529820', NULL, '583', NULL, 'Halang', 'Victoria', 'Laguna', '4028', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(209, 'rencemagpantay005@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Mike', 'Laurence P.', 'Magpantay', NULL, '2005-04-20', 'Nagcarlan, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09174135625', NULL, '525', NULL, 'Banca-banca', 'Calamba', 'Laguna', '4028', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(210, 'jmdeguzman185@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'John', 'Michael P. De', 'Guzman', NULL, '2005-10-29', 'Victoria, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09245846268', NULL, '146', NULL, 'Anos', 'Pagsanjan', 'Laguna', '4028', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(211, 'aquinoalexandrei36@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Alexandrei', 'Joshua A.', 'Gayahan', NULL, '2006-11-20', 'Los Baños, Laguna', 'Filipino', 'Female', 'Single', 'Baptist', NULL, 'No', '09658168450', NULL, '22', NULL, 'Bambang', 'Pagsanjan', 'Laguna', '4026', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(212, 'uno.ventura212@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Uno', 'Zander A.', 'Ventura', NULL, '2006-04-20', 'Pagsanjan, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09341588930', NULL, '546', NULL, 'Mayondon', 'San Pablo', 'Laguna', '4028', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(213, 'neiljohnsonestabillo6@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Neil', 'Johnson J.', 'Estabillo', NULL, '2006-01-01', 'Victoria, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09924363093', NULL, '491', NULL, 'Batong Malake', 'Liliw', 'Laguna', '4008', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(214, 'gabzeuspadilla@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Gabriel', 'Zeus S.', 'Padilla', NULL, '2005-10-19', 'San Pablo, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09231109673', NULL, '303', NULL, 'Bayog', 'Cabuyao', 'Laguna', '4002', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(215, 'aronjustineenilo05@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Aron', 'Justine', 'Enilo', NULL, '2006-11-16', 'Los Baños, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09440871355', NULL, '297', NULL, 'Poblacion', 'Victoria', 'Laguna', '4019', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(216, 'dmicaella19@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Mica', 'Ella C. Dela', 'Cruz', NULL, '2006-02-10', 'Cabuyao, Laguna', 'Filipino', 'Female', 'Single', 'Born Again Christian', NULL, 'No', '09821134160', NULL, '491', NULL, 'Mayondon', 'San Pablo', 'Laguna', '4026', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(217, 'sha.erasga008@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Shamille', 'C.', 'Erasga', NULL, '2006-10-18', 'Nagcarlan, Laguna', 'Filipino', 'Female', 'Single', 'Baptist', NULL, 'No', '09275654598', NULL, '487', NULL, 'Anos', 'San Pablo', 'Laguna', '4019', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(218, 'johnmichaelperalta177@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'John', 'Michael', 'Peralta', NULL, '2004-10-24', 'Los Baños, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09265727743', NULL, '835', NULL, 'Pittland', 'Nagcarlan', 'Laguna', '4028', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(219, 'louiseclarkacojedo500@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Louise', 'Clark L.', 'Acojedo', NULL, '2005-02-10', 'Siniloan, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09433418367', NULL, '512', NULL, 'Parian', 'Liliw', 'Laguna', '4026', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(220, 'joshuaarenda@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Joshua', 'V.', 'Arenda', NULL, '2004-09-28', 'Siniloan, Laguna', 'Filipino', 'Female', 'Single', 'Islam', NULL, 'No', '09467077518', NULL, '802', NULL, 'Poblacion', 'Los Baños', 'Laguna', '4002', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(221, 'solomon.rens1@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Rens', 'A.', 'Solomon', NULL, '2004-10-16', 'Pila, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09141252566', NULL, '411', NULL, 'Batong Malake', 'Pila', 'Laguna', '4027', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(222, 'paralajane@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jane', 'Katherine B.', 'Parala', NULL, '2005-08-09', 'Calamba, Laguna', 'Filipino', 'Female', 'Single', 'Seventh Day Adventist', NULL, 'No', '09759886149', NULL, '535', NULL, 'Poblacion', 'Calamba', 'Laguna', '4002', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(223, 'vanessramento143@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Vaness', 'R.', 'Ramento', NULL, '2006-01-09', 'Bay, Laguna', 'Filipino', 'Female', 'Single', 'Born Again Christian', NULL, 'No', '09646908678', NULL, '441', NULL, 'Batong Malake', 'Cabuyao', 'Laguna', '4019', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(224, 'jazlieboragay@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jazlie', 'C.', 'Boragay', NULL, '2005-07-05', 'Pila, Laguna', 'Filipino', 'Female', 'Single', 'Islam', NULL, 'No', '09230049434', NULL, '166', NULL, 'Parian', 'Bay', 'Laguna', '4030', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(225, 'kurtmichaelfusana@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Kurt', 'Michael S.', 'Fusana', NULL, '2006-02-24', 'Victoria, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09312267945', NULL, '345', NULL, 'Parian', 'Santa Cruz', 'Laguna', '4026', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(226, 'archieisalos123@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Archie', 'R.', 'Isalos', NULL, '2005-05-06', 'Biñan, Laguna', 'Filipino', 'Female', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09197300155', NULL, '53', NULL, 'Bayog', 'Victoria', 'Laguna', '4026', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(227, 'paulromualdofernandez@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Paul', 'Aldrey R.', 'Fernandez', NULL, '2006-05-30', 'Santa Cruz, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09727367061', NULL, '824', NULL, 'Bambang', 'Los Baños', 'Laguna', '4008', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(228, 'albertxiperez@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Xian', 'Albert L.', 'Perez', NULL, '2005-04-03', 'Pila, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09896658640', NULL, '281', NULL, 'Halang', 'San Pablo', 'Laguna', '4026', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(229, 'michaelangelo.calades@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Michaelangelo', 'A. Calades', 'Calades', 'Jr.', '2004-04-08', 'Bay, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09340191391', NULL, '991', NULL, 'Halang', 'Santa Cruz', 'Laguna', '4026', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(230, 'markallendelosreyes444@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Mark', 'Allen E. Delos', 'Reyes', NULL, '2006-04-04', 'San Pablo, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09511193575', NULL, '828', NULL, 'Parian', 'Biñan', 'Laguna', '4019', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(231, 'augustinmariano288@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Augustin', 'L.', 'Mariano', NULL, '2004-10-11', 'Cabuyao, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09883987442', NULL, '889', NULL, 'Bambang', 'Liliw', 'Laguna', '4002', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(232, 'manongsongjonesadrian@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Manongsong', 'Jones', 'Adrian', NULL, '2005-06-16', 'Santa Cruz, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09419447690', NULL, '979', NULL, 'Bayog', 'Calamba', 'Laguna', '4027', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(233, 'ritchecereno15@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Retchi', 'L.', 'Cereno', NULL, '2004-07-16', 'Pagsanjan, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09348614513', NULL, '576', NULL, 'San Antonio', 'Pagsanjan', 'Laguna', '4030', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(234, 'marcsegseg@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Marc', 'Rodson M.', 'Segundo', NULL, '2006-10-04', 'Nagcarlan, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09430012572', NULL, '266', NULL, 'Bambang', 'Liliw', 'Laguna', '4008', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(235, 'jteyas9@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jomar', 'T.', 'Eyas', NULL, '2005-02-21', 'Nagcarlan, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09775069103', NULL, '568', NULL, 'Bambang', 'Bay', 'Laguna', '4028', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(236, 'mjfabros16@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Herlene', 'F.', 'Penaso', NULL, '2004-02-22', 'Cabuyao, Laguna', 'Filipino', 'Female', 'Single', 'Roman Catholic', NULL, 'No', '09223346914', NULL, '544', NULL, 'Canlubang', 'Biñan', 'Laguna', '4028', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(237, 'arabellalirio3@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Arabella', 'M.', 'Lirio', NULL, '2006-12-25', 'Calamba, Laguna', 'Filipino', 'Female', 'Single', 'Roman Catholic', NULL, 'No', '09791690794', NULL, '632', NULL, 'San Antonio', 'Siniloan', 'Laguna', '4027', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(238, 'katelucero24@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Kate', 'Raven B.', 'Lucero', NULL, '2006-08-12', 'Cabuyao, Laguna', 'Filipino', 'Female', 'Single', 'Aglipayan', NULL, 'No', '09298892203', NULL, '393', NULL, 'Batong Malake', 'Siniloan', 'Laguna', '4002', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(239, 'trixiechavez072@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Trixie', 'B.', 'Chavez', NULL, '2004-09-03', 'Liliw, Laguna', 'Filipino', 'Female', 'Single', 'Seventh Day Adventist', NULL, 'No', '09629459336', NULL, '174', NULL, 'Masapang', 'Santa Cruz', 'Laguna', '4027', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(240, 'josephineerose5@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Josephine', 'M.', 'Rodriguez', NULL, '2004-05-17', 'Liliw, Laguna', 'Filipino', 'Female', 'Single', 'Aglipayan', NULL, 'No', '09556718064', NULL, '317', NULL, 'Mayondon', 'Los Baños', 'Laguna', '4019', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(241, 'jarenadriel.ignacio@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jaren', 'Adriel A.', 'Ignacio', NULL, '2006-05-28', 'Pagsanjan, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09819578953', NULL, '496', NULL, 'Bambang', 'Santa Cruz', 'Laguna', '4019', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(242, 'lapitanjonnel11@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jonnel', 'Victor L.', 'Lapitan', NULL, '2004-05-14', 'Cabuyao, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09342805375', NULL, '678', NULL, 'Bambang', 'Victoria', 'Laguna', '4027', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(243, 'audinesarah@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Sarah', 'Mae A.', 'Audine', NULL, '2004-05-04', 'Cabuyao, Laguna', 'Filipino', 'Female', 'Single', 'Baptist', NULL, 'No', '09484812354', NULL, '707', NULL, 'Masapang', 'Santa Cruz', 'Laguna', '4026', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(244, 'teemomercado@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Espiritu', 'IV C.', 'Mercado', NULL, '2004-04-20', 'Siniloan, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09280688574', NULL, '899', NULL, 'Bayog', 'Pila', 'Laguna', '4030', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(245, 'franzlita12285@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jose', 'Franz N.', 'Lita', NULL, '2006-03-07', 'Pila, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09950729040', NULL, '566', NULL, 'Mayondon', 'Los Baños', 'Laguna', '4019', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(246, 'thejohncarlo@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'John', 'Carlo H. Del', 'Rosario', NULL, '2004-11-09', 'Cabuyao, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09286182553', NULL, '73', NULL, 'Bayog', 'Biñan', 'Laguna', '4027', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(247, 'monmon121205@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Ralph', 'Richmond G.', 'Mercado', NULL, '2006-09-19', 'Victoria, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09115046040', NULL, '159', NULL, 'Burol', 'Nagcarlan', 'Laguna', '4026', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(248, 'andreialforte6226@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Andrei', 'E.', 'Alforte', NULL, '2006-02-10', 'Siniloan, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09223199551', NULL, '445', NULL, 'Halang', 'San Pablo', 'Laguna', '4027', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(249, 'conciomaverick182003@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Maverick', 'U.', 'Concio', NULL, '2004-08-11', 'Biñan, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09826138315', NULL, '404', NULL, 'Bambang', 'Victoria', 'Laguna', '4026', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(250, 'eurygibasreyes04@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jan', 'Den Eury G.', 'Reyes', NULL, '2005-09-21', 'San Pablo, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09222495611', NULL, '36', NULL, 'Burol', 'Los Baños', 'Laguna', '4028', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(251, 'carenbelda08@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Caren', 'S.', 'Belda', NULL, '2005-03-18', 'Los Baños, Laguna', 'Filipino', 'Female', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09896435785', NULL, '97', NULL, 'Pittland', 'Bay', 'Laguna', '4002', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(252, 'mendozatrisha844@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Trisha', 'Mae B.', 'Mendoza', NULL, '2005-05-02', 'Victoria, Laguna', 'Filipino', 'Female', 'Single', 'Roman Catholic', NULL, 'No', '09949356429', NULL, '292', NULL, 'Anos', 'Santa Cruz', 'Laguna', '4008', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(253, 'nacionaleszj@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Zar', 'John A.', 'Nacionales', NULL, '2004-02-14', 'Nagcarlan, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09954949989', NULL, '253', NULL, 'Marinig', 'Victoria', 'Laguna', '4002', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(254, 'ayenmanator888@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Alyanna', 'Marie M.', 'Torres', NULL, '2006-06-20', 'Calamba, Laguna', 'Filipino', 'Female', 'Single', 'Islam', NULL, 'No', '09321110125', NULL, '365', NULL, 'Marinig', 'Siniloan', 'Laguna', '4027', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(255, 'lindzaygarciapaner02@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Lindzay', 'G.', 'Paner', NULL, '2006-07-04', 'Cabuyao, Laguna', 'Filipino', 'Female', 'Single', 'Aglipayan', NULL, 'No', '09835919573', NULL, '256', NULL, 'Bambang', 'Victoria', 'Laguna', '4019', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(256, 'ktllanes01@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Kyle', 'Tracy Q.', 'Llanes', NULL, '2004-05-14', 'Victoria, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09251272309', NULL, '327', NULL, 'Masapang', 'Liliw', 'Laguna', '4008', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(257, 'rioivalescobin28@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Rio', 'Ival B.', 'Escobin', NULL, '2005-05-06', 'Los Baños, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09615880498', NULL, '422', NULL, 'Mayondon', 'Biñan', 'Laguna', '4008', '2026-05-07 07:32:44', '2026-05-07 07:32:44'),
(258, 'neilmatthewcarandang@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Neil', 'Matthew B.', 'Carandang', NULL, '2003-06-02', 'Cabuyao, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09307371948', NULL, '300', NULL, 'Bambang', 'San Pablo', 'Laguna', '4030', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(259, 'arwilmartinsparaisoo@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Arwil', 'Martin S.', 'Paraiso', NULL, '2004-10-22', 'Los Baños, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09130441912', NULL, '177', NULL, 'Marinig', 'Biñan', 'Laguna', '4002', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(260, 'bigtasqueenlee05@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Queen', 'Lee L.', 'Bigtas', NULL, '2003-06-18', 'Nagcarlan, Laguna', 'Filipino', 'Female', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09342234380', NULL, '83', NULL, 'Parian', 'San Pablo', 'Laguna', '4030', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(261, 'emiel.salangsang261@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Emiel', 'John G.', 'Salangsang', NULL, '2003-03-11', 'Victoria, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09201924006', NULL, '848', NULL, 'Canlubang', 'Calamba', 'Laguna', '4002', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(262, 'troy300otfgbg@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'French', 'P.', 'Cuadoro', NULL, '2002-09-06', 'Cabuyao, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09160552306', NULL, '791', NULL, 'Banca-banca', 'Nagcarlan', 'Laguna', '4019', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(263, 'malabanancharlesamiel@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Charles', 'Amiel A.', 'Malabanan', NULL, '2004-04-04', 'Victoria, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09963134169', NULL, '970', NULL, 'Anos', 'Pila', 'Laguna', '4030', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(264, 'rjay25.dollesin@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Raymond', 'Jay C.', 'Dollesin', NULL, '2003-06-09', 'Nagcarlan, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09839028088', NULL, '667', NULL, 'Banca-banca', 'Liliw', 'Laguna', '4030', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(265, 'lspulyxdilla@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Lyx', 'Lamuel B.', 'Dilla', NULL, '2003-12-24', 'Pila, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09100763330', NULL, '493', NULL, 'Halang', 'Liliw', 'Laguna', '4019', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(266, 'carlteezy03@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Carl', 'Aaron H.', 'Garcia', NULL, '2002-08-21', 'Siniloan, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09245625992', NULL, '215', NULL, 'Parian', 'Calamba', 'Laguna', '4027', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(267, 'ejdelosreyes36@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jose', 'Enrique Delos', 'Reyes', NULL, '2004-10-24', 'Pila, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09864559545', NULL, '428', NULL, 'Halang', 'Liliw', 'Laguna', '4026', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(268, 'arabellazyja.sevilla@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Arabella', 'Zyja B.', 'SevillA', NULL, '2003-08-28', 'Nagcarlan, Laguna', 'Filipino', 'Female', 'Single', 'Seventh Day Adventist', NULL, 'No', '09587197111', NULL, '19', NULL, 'Bayog', 'Biñan', 'Laguna', '4028', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(269, 'ksaurelspulb@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Kate', 'C.', 'Saure', NULL, '2002-07-04', 'Bay, Laguna', 'Filipino', 'Female', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09648032309', NULL, '86', NULL, 'Banca-banca', 'Calamba', 'Laguna', '4008', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(270, 'zparcon.lspulb@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Zyke', 'Ghabriel', 'Parcon', NULL, '2004-12-26', 'Victoria, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09531913106', NULL, '666', NULL, 'Marinig', 'Pila', 'Laguna', '4019', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(271, 'christianortiz.school@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Christian', 'P.', 'Ortiz', NULL, '2003-07-30', 'Cabuyao, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09831380976', NULL, '787', NULL, 'Pittland', 'Victoria', 'Laguna', '4008', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(272, 'magatmichael52@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Michael', 'Reiner A.', 'Magat', NULL, '2004-02-15', 'Victoria, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09859046488', NULL, '948', NULL, 'Banca-banca', 'Nagcarlan', 'Laguna', '4027', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(273, 'rheiearl@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Rhei', 'Earlson T.', 'Malatag', NULL, '2002-04-11', 'San Pablo, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09769115496', NULL, '694', NULL, 'Banca-banca', 'Liliw', 'Laguna', '4026', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(274, 'cjsanchez1402@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Czarina', 'Joy L.', 'Sanchez', NULL, '2002-09-19', 'Biñan, Laguna', 'Filipino', 'Female', 'Single', 'Born Again Christian', NULL, 'No', '09800823088', NULL, '695', NULL, 'Pittland', 'Santa Cruz', 'Laguna', '4030', '2026-05-07 07:37:27', '2026-05-07 07:37:27');
INSERT INTO `applicants` (`student_id`, `Email`, `password_hash`, `application_status`, `First_Name`, `Middle_Name`, `Last_Name`, `Suffix`, `Birthday`, `Birth_Place`, `Citizenship`, `Sex`, `Civil_Status`, `Religion`, `Disability`, `First_Generation_Student`, `Contact_Number`, `Landline_Number`, `House_Number`, `Street`, `Barangay`, `Municipality`, `Province`, `Zip_Code`, `created_at`, `updated_at`) VALUES
(275, 'mchlllabajo@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Michelle', 'B.', 'Labajo', NULL, '2004-01-07', 'Pagsanjan, Laguna', 'Filipino', 'Female', 'Single', 'Seventh Day Adventist', NULL, 'No', '09891186442', NULL, '49', NULL, 'Masapang', 'Liliw', 'Laguna', '4030', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(276, 'gwyneth.erasga@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Miguelit', 'Gwyneth S.', 'Erasga', NULL, '2002-01-10', 'Calamba, Laguna', 'Filipino', 'Female', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09938447461', NULL, '943', NULL, 'Mayondon', 'Siniloan', 'Laguna', '4030', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(277, 'jearlygavilan@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jearly', 'Mae C.', 'Gavilan', NULL, '2002-06-29', 'Calamba, Laguna', 'Filipino', 'Female', 'Single', 'Aglipayan', NULL, 'No', '09883476796', NULL, '732', NULL, 'Mayondon', 'Nagcarlan', 'Laguna', '4026', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(278, 'ricahmaeee@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Ricah', 'Mae P.', 'Boctot', NULL, '2003-10-23', 'Cabuyao, Laguna', 'Filipino', 'Female', 'Single', 'Aglipayan', NULL, 'No', '09303892423', NULL, '447', NULL, 'Parian', 'San Pablo', 'Laguna', '4026', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(279, 'jeivmicron20@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jeiv', 'Micron A.', 'Roaquin', NULL, '2003-09-21', 'Bay, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09464618398', NULL, '196', NULL, 'Masapang', 'Cabuyao', 'Laguna', '4002', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(280, 'palisoccleid@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Cleid', 'Eduard I.', 'Palisoc', NULL, '2002-11-20', 'Cabuyao, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09992605540', NULL, '978', NULL, 'Masapang', 'Santa Cruz', 'Laguna', '4026', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(281, 'captainconehead10@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Emiel', 'John G.', 'Salangsang', NULL, '2002-05-20', 'Biñan, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09109899524', NULL, '430', NULL, 'Bayog', 'Santa Cruz', 'Laguna', '4026', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(282, 'bilanj159@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'John', 'Rodgerson D.', 'Bilan', NULL, '2002-07-29', 'Bay, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09681785373', NULL, '502', NULL, 'Parian', 'Pila', 'Laguna', '4002', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(283, 'kylietejada1211@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Kylie', 'P.', 'Tejada', NULL, '2003-06-19', 'Los Baños, Laguna', 'Filipino', 'Female', 'Single', 'Aglipayan', NULL, 'No', '09405143292', NULL, '892', NULL, 'San Antonio', 'Biñan', 'Laguna', '4026', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(284, 'jieshiel.alvarado284@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jieshiel', 'Kei L.', 'Alvarado', NULL, '2003-06-29', 'Liliw, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09476030981', NULL, '127', NULL, 'Marinig', 'Calamba', 'Laguna', '4028', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(285, 'iangonzalez1710@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Christian', 'D.', 'Gonzalez', NULL, '2004-01-02', 'Calamba, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09374805382', NULL, '141', NULL, 'Banca-banca', 'Bay', 'Laguna', '4019', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(286, 'codeangelica1.0@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Angelica', 'Joyce', 'Fernandez', NULL, '2004-06-03', 'San Pablo, Laguna', 'Filipino', 'Female', 'Single', 'Islam', NULL, 'No', '09785310967', NULL, '962', NULL, 'Bambang', 'Victoria', 'Laguna', '4030', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(287, 'cazter016@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Cazter', 'Troy R.', 'Murad', NULL, '2004-01-05', 'Pagsanjan, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09535689032', NULL, '892', NULL, 'Parian', 'Biñan', 'Laguna', '4030', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(288, 'banasihansarahmae@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Sarah', 'Mae C.', 'Banasihan', NULL, '2002-03-06', 'Bay, Laguna', 'Filipino', 'Female', 'Single', 'Baptist', NULL, 'No', '09718856197', NULL, '169', NULL, 'Masapang', 'Pila', 'Laguna', '4008', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(289, 'camachozarah01@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Zarah', 'Mae B.', 'Camacho', NULL, '2002-06-27', 'Nagcarlan, Laguna', 'Filipino', 'Female', 'Single', 'Aglipayan', NULL, 'No', '09785478830', NULL, '675', NULL, 'Bambang', 'Cabuyao', 'Laguna', '4008', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(290, 'caspillomateuz36@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Mateuz', 'Andrei T.', 'Caspillo', NULL, '2004-04-20', 'Liliw, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09497023703', NULL, '655', NULL, 'Parian', 'Calamba', 'Laguna', '4030', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(291, 'moradamargiedale34@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Margiedale', 'Ann M.', 'Morada', NULL, '2004-09-03', 'Cabuyao, Laguna', 'Filipino', 'Female', 'Single', 'Seventh Day Adventist', NULL, 'No', '09345948773', NULL, '46', NULL, 'Burol', 'Cabuyao', 'Laguna', '4030', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(292, 'amparo.popoy@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Randy', 'T.', 'Amparo', NULL, '2003-02-26', 'Victoria, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09557489273', NULL, '499', NULL, 'Burol', 'Bay', 'Laguna', '4026', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(293, 'german.banasihan@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'German', 'Gian V.', 'Banasihan', NULL, '2003-11-15', 'Pagsanjan, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09633419584', NULL, '496', NULL, 'San Antonio', 'Liliw', 'Laguna', '4002', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(294, 'amiel.solmerano294@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Amiel', 'Isaac V.', 'Solmerano', NULL, '2004-01-19', 'Pila, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09701393802', NULL, '94', NULL, 'Parian', 'Biñan', 'Laguna', '4026', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(295, 'amarelalorence@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'John', 'Lorence B.', 'Amarela', NULL, '2004-01-23', 'Pagsanjan, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09212671996', NULL, '959', NULL, 'Marinig', 'Santa Cruz', 'Laguna', '4028', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(296, 'z4km4estro@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Christian', 'B.', 'Añez', NULL, '2002-02-01', 'Santa Cruz, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09574588810', NULL, '260', NULL, 'Bayog', 'Biñan', 'Laguna', '4002', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(297, 'angelesjoshua78@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Christian', 'Joshua', 'Angeles', NULL, '2004-09-17', 'Bay, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09966039784', NULL, '814', NULL, 'Anos', 'Victoria', 'Laguna', '4030', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(298, 'caguyairene83@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Irene', 'A.', 'Caguya', NULL, '2002-09-10', 'Biñan, Laguna', 'Filipino', 'Female', 'Single', 'Born Again Christian', NULL, 'No', '09995733399', NULL, '224', NULL, 'Pittland', 'Calamba', 'Laguna', '4027', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(299, 'andreicaldeo777@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Andrei', 'H.', 'Caldeo', NULL, '2002-08-03', 'Santa Cruz, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09127723130', NULL, '599', NULL, 'Masapang', 'Pila', 'Laguna', '4026', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(300, 'zekielcasipong0112@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Eizekiel', 'L.', 'Casipong', NULL, '2002-09-22', 'San Pablo, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09262153225', NULL, '831', NULL, 'Masapang', 'Nagcarlan', 'Laguna', '4002', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(301, 'cortejojireh@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jireh', 'V.', 'Cortejo', NULL, '2004-03-27', 'Siniloan, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09126758127', NULL, '39', NULL, 'Burol', 'Siniloan', 'Laguna', '4028', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(302, 'aby.deleon814@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Aubrey', 'M. De', 'Leon', NULL, '2004-12-08', 'Liliw, Laguna', 'Filipino', 'Female', 'Single', 'Islam', NULL, 'No', '09748815250', NULL, '531', NULL, 'Pittland', 'Cabuyao', 'Laguna', '4026', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(303, 'aldwinkiesterediza@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Aldwin', 'Kiester P.', 'Ediza', NULL, '2004-12-26', 'Calamba, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09546200383', NULL, '814', NULL, 'Batong Malake', 'Los Baños', 'Laguna', '4019', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(304, 'mauiendiape05@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Maui', 'A.', 'Endiape', NULL, '2002-02-03', 'Siniloan, Laguna', 'Filipino', 'Female', 'Single', 'Aglipayan', NULL, 'No', '09536404259', NULL, '369', NULL, 'Marinig', 'Pagsanjan', 'Laguna', '4027', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(305, 'louiswilliam.escobar@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'William', 'N.', 'Escobar', NULL, '2002-07-18', 'Biñan, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09201252861', NULL, '446', NULL, 'Marinig', 'Biñan', 'Laguna', '4019', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(306, 'ajescobin333@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'John', 'Augustus S.', 'Escobin', NULL, '2003-08-18', 'Biñan, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09841361162', NULL, '367', NULL, 'Mayondon', 'Biñan', 'Laguna', '4027', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(307, 'vinrich29@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Vincent', NULL, 'Espinosa', NULL, '2003-12-04', 'Siniloan, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09815907418', NULL, '584', NULL, 'Banca-banca', 'Pila', 'Laguna', '4008', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(308, 'maryjoyeusebio38@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Mary', 'Joy Q.', 'Eusebio', NULL, '2004-03-12', 'Pagsanjan, Laguna', 'Filipino', 'Female', 'Single', 'Aglipayan', NULL, 'No', '09809412733', NULL, '640', NULL, 'Mayondon', 'Siniloan', 'Laguna', '4027', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(309, 'jenolapore050@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jeno', 'A.', 'Lapore', NULL, '2004-02-23', 'Nagcarlan, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09110440695', NULL, '379', NULL, 'Marinig', 'Biñan', 'Laguna', '4002', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(310, 'gabbie.manalo18@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Gabbie', 'C.', 'Manalo', NULL, '2004-05-16', 'Siniloan, Laguna', 'Filipino', 'Female', 'Single', 'Seventh Day Adventist', NULL, 'No', '09743421894', NULL, '56', NULL, 'Bambang', 'Los Baños', 'Laguna', '4019', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(311, 'paulettejane.mena@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Paulette', 'Jane M.', 'Meña', NULL, '2003-03-26', 'Pagsanjan, Laguna', 'Filipino', 'Female', 'Single', 'Born Again Christian', NULL, 'No', '09290996445', NULL, '796', NULL, 'Poblacion', 'Pila', 'Laguna', '4028', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(312, 'arrenleimendoza12@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Arren', 'Lei', 'Mendoza', NULL, '2004-05-16', 'Siniloan, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09301229699', NULL, '599', NULL, 'Pittland', 'Siniloan', 'Laguna', '4019', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(313, 'john.milanes141@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'John', 'Micheal R.', 'Milanes', NULL, '2003-03-11', 'Liliw, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09238968144', NULL, '672', NULL, 'Poblacion', 'Santa Cruz', 'Laguna', '4030', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(314, 'exrt3d@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Ethan', 'Daniel', 'Monterola', NULL, '2004-03-07', 'Los Baños, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09805889344', NULL, '707', NULL, 'Masapang', 'Los Baños', 'Laguna', '4019', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(315, 'khyleotano838@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Khyle', NULL, 'Otano', NULL, '2003-10-02', 'Santa Cruz, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09117798074', NULL, '757', NULL, 'Parian', 'Biñan', 'Laguna', '4030', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(316, 'renlypatricio817@gamil.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Renly', 'M.', 'Patricio', NULL, '2004-02-23', 'Los Baños, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09344578463', NULL, '114', NULL, 'Poblacion', 'Liliw', 'Laguna', '4030', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(317, 'abelpingol45@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Abel', 'B.', 'Pingol', NULL, '2003-10-14', 'Biñan, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09805402480', NULL, '895', NULL, 'Burol', 'Calamba', 'Laguna', '4008', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(318, 'rodejo770@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Froilan', 'A.', 'Rodejo', NULL, '2002-02-23', 'Cabuyao, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09197905929', NULL, '244', NULL, 'Parian', 'Siniloan', 'Laguna', '4002', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(319, 'larainerodriguez10@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Laraine', 'M.', 'Rodriguez', NULL, '2004-12-12', 'Los Baños, Laguna', 'Filipino', 'Female', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09262588735', NULL, '971', NULL, 'Burol', 'Nagcarlan', 'Laguna', '4028', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(320, 'lorrainesanmiguel14@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Lorraine', 'S. San', 'Miguel', NULL, '2003-12-17', 'San Pablo, Laguna', 'Filipino', 'Female', 'Single', 'Born Again Christian', NULL, 'No', '09747198159', NULL, '435', NULL, 'Anos', 'Cabuyao', 'Laguna', '4030', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(321, 'shainamae4290@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Shaina', 'Mae G.', 'Vidal', NULL, '2003-04-20', 'Pila, Laguna', 'Filipino', 'Female', 'Single', 'Baptist', NULL, 'No', '09136955711', NULL, '448', NULL, 'Pittland', 'Bay', 'Laguna', '4027', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(322, 'joshuazechariah24@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Joshua', 'Zachariah L.', 'Herrera', NULL, '2002-01-03', 'Los Baños, Laguna', 'Filipino', 'Female', 'Single', 'Roman Catholic', NULL, 'No', '09480416080', NULL, '890', NULL, 'Anos', 'Nagcarlan', 'Laguna', '4030', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(323, 'noemelyn.abasola323@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Noemelyn', NULL, 'Abasola', NULL, '2004-09-29', 'Calamba, Laguna', 'Filipino', 'Female', 'Single', 'Baptist', NULL, 'No', '09614168471', NULL, '826', NULL, 'Banca-banca', 'Biñan', 'Laguna', '4026', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(324, 'christka.collado324@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Christka', 'May', 'Collado', NULL, '2003-02-26', 'Pagsanjan, Laguna', 'Filipino', 'Female', 'Single', 'Aglipayan', NULL, 'No', '09286585299', NULL, '554', NULL, 'Batong Malake', 'Pagsanjan', 'Laguna', '4027', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(325, 'joseph.ferrer325@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Joseph', 'Christian', 'Ferrer', NULL, '2004-06-22', 'Bay, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09663413331', NULL, '448', NULL, 'Masapang', 'Nagcarlan', 'Laguna', '4028', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(326, 'gife.laforteza326@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Gife', 'Charles Marty', 'Laforteza', NULL, '2003-07-25', 'Pagsanjan, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09716850793', NULL, '942', NULL, 'Anos', 'Pagsanjan', 'Laguna', '4027', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(327, 'jhane.manalo327@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jhane', 'Maureen', 'Manalo', NULL, '2003-05-21', 'Siniloan, Laguna', 'Filipino', 'Female', 'Single', 'Islam', NULL, 'No', '09662619507', NULL, '489', NULL, 'San Antonio', 'Bay', 'Laguna', '4030', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(328, 'lheilah.tandang328@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Lheilah', NULL, 'Tandang', NULL, '2003-04-17', 'Pila, Laguna', 'Filipino', 'Female', 'Single', 'Aglipayan', NULL, 'No', '09556114436', NULL, '169', NULL, 'Marinig', 'Pagsanjan', 'Laguna', '4027', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(329, 'josefa.eusebio329@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Josefa', 'Paula', 'Eusebio', NULL, '2002-01-12', 'Bay, Laguna', 'Filipino', 'Female', 'Single', 'Islam', NULL, 'No', '09114225181', NULL, '949', NULL, 'San Antonio', 'Cabuyao', 'Laguna', '4008', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(330, 'rhixie.carpio330@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Rhixie', NULL, 'Carpio', NULL, '2004-10-14', 'Bay, Laguna', 'Filipino', 'Female', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09159531080', NULL, '982', NULL, 'Halang', 'Calamba', 'Laguna', '4019', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(331, 'algirho.maosca331@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Algirho', NULL, 'Mañosca', NULL, '2002-10-21', 'Los Baños, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09272931025', NULL, '558', NULL, 'Bayog', 'Pagsanjan', 'Laguna', '4002', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(332, 'zack.refrea332@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Zack', 'Xavier G.', 'Refrea', NULL, '2002-09-08', 'Cabuyao, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09661314162', NULL, '965', NULL, 'Canlubang', 'Siniloan', 'Laguna', '4026', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(333, 'benedict.reyes333@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Benedict', 'Vincent', 'Reyes', NULL, '2002-05-27', 'Biñan, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09189667444', NULL, '816', NULL, 'Banca-banca', 'Siniloan', 'Laguna', '4008', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(334, 'nomer.aguas334@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Nomer', 'Ray', 'Aguas', NULL, '2003-10-28', 'Calamba, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09115637540', NULL, '213', NULL, 'Banca-banca', 'San Pablo', 'Laguna', '4030', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(335, 'gretchen.andaya335@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Gretchen', NULL, 'Andaya', NULL, '2004-03-06', 'Calamba, Laguna', 'Filipino', 'Female', 'Single', 'Islam', NULL, 'No', '09461499872', NULL, '232', NULL, 'Bayog', 'Pagsanjan', 'Laguna', '4019', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(336, 'angel.hubilla336@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Angel', 'Kim', 'Hubilla', NULL, '2004-05-19', 'Calamba, Laguna', 'Filipino', 'Female', 'Single', 'Baptist', NULL, 'No', '09524743290', NULL, '230', NULL, 'Pittland', 'Cabuyao', 'Laguna', '4002', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(337, 'samantha.alcantara337@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Samantha', 'Jasmine', 'Alcantara', NULL, '2003-11-12', 'Liliw, Laguna', 'Filipino', 'Female', 'Single', 'Roman Catholic', NULL, 'No', '09422387314', NULL, '190', NULL, 'Mayondon', 'Bay', 'Laguna', '4030', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(338, 'racil.picardal338@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Racil', NULL, 'Picardal', NULL, '2002-07-03', 'Bay, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09801816281', NULL, '876', NULL, 'Mayondon', 'Victoria', 'Laguna', '4027', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(339, 'samuel.villamayor339@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Samuel', NULL, 'Villamayor', NULL, '2002-07-23', 'Siniloan, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09787305105', NULL, '174', NULL, 'Canlubang', 'San Pablo', 'Laguna', '4008', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(340, 'jaymart.cabuhat340@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jaymart', NULL, 'Cabuhat', NULL, '2002-04-26', 'Biñan, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09526497637', NULL, '934', NULL, 'Anos', 'Bay', 'Laguna', '4008', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(341, 'andreine.tendencia341@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Andreine', NULL, 'Tendencia', NULL, '2004-08-07', 'Biñan, Laguna', 'Filipino', 'Female', 'Single', 'Seventh Day Adventist', NULL, 'No', '09176234332', NULL, '98', NULL, 'Pittland', 'Liliw', 'Laguna', '4019', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(342, 'daniella.dael342@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Daniella', NULL, 'Dael', NULL, '2003-07-23', 'Siniloan, Laguna', 'Filipino', 'Female', 'Single', 'Roman Catholic', NULL, 'No', '09536655979', NULL, '521', NULL, 'Masapang', 'Bay', 'Laguna', '4008', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(343, 'aldrin.terbio343@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Aldrin', NULL, 'Terbio', NULL, '2002-03-04', 'Los Baños, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09245755734', NULL, '649', NULL, 'Pittland', 'Calamba', 'Laguna', '4026', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(344, 'edzel.masagca344@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Edzel', 'Angelo', 'Masagca', NULL, '2003-02-14', 'Biñan, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09570928469', NULL, '34', NULL, 'Halang', 'Pagsanjan', 'Laguna', '4008', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(345, 'joshua.mataverde345@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Joshua', 'Paul', 'Mataverde', NULL, '2002-06-12', 'Nagcarlan, Laguna', 'Filipino', 'Female', 'Single', 'Baptist', NULL, 'No', '09737685670', NULL, '23', NULL, 'San Antonio', 'Santa Cruz', 'Laguna', '4008', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(346, 'mark.decena346@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Mark', 'Raniel', 'Decena', NULL, '2004-06-25', 'Cabuyao, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09990715918', NULL, '828', NULL, 'Marinig', 'Los Baños', 'Laguna', '4026', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(347, 'john.empalmado347@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'John', 'Paul C.', 'Empalmado', NULL, '2004-10-27', 'Victoria, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09904093987', NULL, '278', NULL, 'Bambang', 'Siniloan', 'Laguna', '4008', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(348, 'jynn.casili348@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jynn', 'Diane M.', 'Casili', NULL, '2004-04-06', 'Victoria, Laguna', 'Filipino', 'Female', 'Single', 'Roman Catholic', NULL, 'No', '09589498526', NULL, '600', NULL, 'Mayondon', 'Biñan', 'Laguna', '4030', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(349, 'alexandra.blasco349@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Alexandra', 'Nicole', 'Blasco', NULL, '2003-10-14', 'Liliw, Laguna', 'Filipino', 'Female', 'Single', 'Born Again Christian', NULL, 'No', '09932182910', NULL, '171', NULL, 'Burol', 'Biñan', 'Laguna', '4002', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(350, 'daryl.lapitan350@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Daryl', 'Anne F.', 'Lapitan', NULL, '2004-06-11', 'Cabuyao, Laguna', 'Filipino', 'Female', 'Single', 'Aglipayan', NULL, 'No', '09103219318', NULL, '259', NULL, 'Pittland', 'Liliw', 'Laguna', '4026', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(351, 'laurence.austria351@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Laurence', 'Bren F.', 'Austria', NULL, '2002-05-03', 'Los Baños, Laguna', 'Filipino', 'Female', 'Single', 'Born Again Christian', NULL, 'No', '09229268740', NULL, '382', NULL, 'Bayog', 'Victoria', 'Laguna', '4027', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(352, 'rondale.magda352@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Rondale', 'Angelo', 'Magda', NULL, '2002-09-03', 'Calamba, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09485074978', NULL, '380', NULL, 'Marinig', 'Victoria', 'Laguna', '4030', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(353, 'fiona.sanchez353@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Fiona', NULL, 'Sanchez', NULL, '2003-09-18', 'Cabuyao, Laguna', 'Filipino', 'Female', 'Single', 'Islam', NULL, 'No', '09745812921', NULL, '897', NULL, 'Halang', 'Bay', 'Laguna', '4027', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(354, 'lawrence.salvador354@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Lawrence', 'S.', 'Salvador', NULL, '2002-05-14', 'Liliw, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09486644538', NULL, '934', NULL, 'Masapang', 'Biñan', 'Laguna', '4008', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(355, 'john.esporlas355@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'John', 'Royce L.', 'Esporlas', NULL, '2004-07-04', 'Victoria, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09591061114', NULL, '466', NULL, 'Anos', 'Bay', 'Laguna', '4019', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(356, 'jared.odian356@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jared', 'Nate T.', 'Odian', NULL, '2004-10-18', 'Los Baños, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09862426966', NULL, '624', NULL, 'Poblacion', 'Victoria', 'Laguna', '4030', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(357, 'raiza.gacer357@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Raiza', 'Jonelle A.', 'Gacer', NULL, '2003-09-10', 'Biñan, Laguna', 'Filipino', 'Female', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09543068452', NULL, '72', NULL, 'Anos', 'San Pablo', 'Laguna', '4008', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(358, 'jay.castillo358@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jay', 'Michael M.', 'Castillo', NULL, '2004-02-23', 'Bay, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09855504601', NULL, '517', NULL, 'Pittland', 'Cabuyao', 'Laguna', '4027', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(359, 'chester.mendoza359@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Chester', 'M.', 'Mendoza', NULL, '2004-02-24', 'Liliw, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09820944523', NULL, '554', NULL, 'Halang', 'San Pablo', 'Laguna', '4028', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(360, 'jeric.manibog360@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jeric', 'T.', 'Manibog', NULL, '2002-01-30', 'Los Baños, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09443951088', NULL, '209', NULL, 'Anos', 'Santa Cruz', 'Laguna', '4027', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(361, 'john.malabanan361@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'John', 'Paul E.', 'Malabanan', NULL, '2004-02-11', 'Biñan, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09101233037', NULL, '246', NULL, 'Poblacion', 'San Pablo', 'Laguna', '4002', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(362, 'danielle.linga362@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Danielle', 'S.', 'Linga', NULL, '2002-06-23', 'Nagcarlan, Laguna', 'Filipino', 'Female', 'Single', 'Islam', NULL, 'No', '09291992773', NULL, '851', NULL, 'Bayog', 'Liliw', 'Laguna', '4008', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(363, 'renz.gallego363@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Renz', 'L.', 'Gallego', NULL, '2002-09-05', 'Siniloan, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09509682081', NULL, '845', NULL, 'Banca-banca', 'Liliw', 'Laguna', '4008', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(364, 'cjay.melante364@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'C-jay', 'S.', 'Melante', NULL, '2003-10-14', 'Los Baños, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09225381279', NULL, '230', NULL, 'San Antonio', 'Calamba', 'Laguna', '4008', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(365, 'dave.soriano365@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Dave', 'Ian Louis P.', 'Soriano', NULL, '2002-04-04', 'Calamba, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09483628891', NULL, '898', NULL, 'Batong Malake', 'Biñan', 'Laguna', '4027', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(366, 'clark.desepida366@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Clark', 'Louie A.', 'Desepida', NULL, '2002-11-19', 'Victoria, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09434464588', NULL, '253', NULL, 'Marinig', 'Pila', 'Laguna', '4027', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(367, 'kenneth.naez367@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Kenneth', 'Brylle F.', 'Nañez', NULL, '2002-09-05', 'Calamba, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09136046150', NULL, '818', NULL, 'Bambang', 'San Pablo', 'Laguna', '4028', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(368, 'bryan.manera368@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Bryan', 'P.', 'Manera', NULL, '2003-10-08', 'Liliw, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09243492891', NULL, '64', NULL, 'Poblacion', 'Biñan', 'Laguna', '4028', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(369, 'mirah.lim369@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Mirah', 'Stepanie C.', 'Lim', NULL, '2003-01-20', 'Pagsanjan, Laguna', 'Filipino', 'Female', 'Single', 'Born Again Christian', NULL, 'No', '09998218221', NULL, '168', NULL, 'Bayog', 'Siniloan', 'Laguna', '4019', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(370, 'sean.garcia370@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Sean', 'Deaniel A.', 'Garcia', NULL, '2004-09-17', 'Pila, Laguna', 'Filipino', 'Male', 'Single', 'Seventh Day Adventist', NULL, 'No', '09742820340', NULL, '304', NULL, 'Bayog', 'Victoria', 'Laguna', '4027', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(371, 'paulo.romero371@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Paulo', 'David V.', 'Romero', NULL, '2002-08-13', 'Cabuyao, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09139601535', NULL, '686', NULL, 'Canlubang', 'San Pablo', 'Laguna', '4030', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(372, 'adriel.fernandez372@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Adriel', 'Timothy B.', 'Fernandez', NULL, '2004-09-22', 'Siniloan, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09416426164', NULL, '106', NULL, 'Burol', 'Pagsanjan', 'Laguna', '4026', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(373, 'rick.aragon373@lspu.edu.ph', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Rick', 'Von B.', 'Aragon', NULL, '2002-03-13', 'Calamba, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09408805899', NULL, '110', NULL, 'Halang', 'Victoria', 'Laguna', '4026', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(374, 'ronalcantara0126@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Ron', 'Joseph R.', 'Alcantara', NULL, '2002-11-18', 'Siniloan, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09392610681', NULL, '698', NULL, 'Batong Malake', 'San Pablo', 'Laguna', '4028', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(375, 'jalfojra@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Ronel', 'Joshua D.', 'Alforja', NULL, '2003-12-05', 'Cabuyao, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09417517474', NULL, '661', NULL, 'Anos', 'Pagsanjan', 'Laguna', '4002', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(376, 'real.jamesalvarez19@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'James', 'Isaac A.', 'Alvarez', NULL, '2002-05-14', 'Pagsanjan, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09324373770', NULL, '311', NULL, 'Marinig', 'Biñan', 'Laguna', '4027', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(377, 'bjamparo30@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Brenderick', 'Jr I.', 'Amparo', NULL, '2002-01-12', 'Biñan, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09391220215', NULL, '413', NULL, 'Parian', 'Siniloan', 'Laguna', '4002', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(378, 'ronaldjohn.bautista7@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Ronald', 'John S.', 'Bautista', NULL, '2003-06-22', 'Cabuyao, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09685668883', NULL, '491', NULL, 'Marinig', 'Siniloan', 'Laguna', '4026', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(379, 'christianged31@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Brylle', 'Allen D.', 'Bregonia', NULL, '2003-04-27', 'Siniloan, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09822643136', NULL, '942', NULL, 'Batong Malake', 'Santa Cruz', 'Laguna', '4002', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(380, 'vbrinas8@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Vincent', 'V.', 'Briñas', NULL, '2002-03-24', 'Nagcarlan, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09446836466', NULL, '861', NULL, 'Halang', 'Pila', 'Laguna', '4019', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(381, 'ciscoklyde@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Klyde', 'Cisco T.', 'Canapi', NULL, '2002-11-20', 'Biñan, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09805748813', NULL, '146', NULL, 'Bambang', 'Liliw', 'Laguna', '4027', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(382, 'ritsapn@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Richard', 'S.', 'Catindig', NULL, '2003-11-10', 'Victoria, Laguna', 'Filipino', 'Male', 'Single', 'Islam', NULL, 'No', '09818175062', NULL, '837', NULL, 'Pittland', 'Los Baños', 'Laguna', '4008', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(383, 'jhestercayetano.lspu@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jhester', 'Carlo C.', 'Cayetano', NULL, '2004-08-27', 'Liliw, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09270820797', NULL, '278', NULL, 'Marinig', 'Liliw', 'Laguna', '4002', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(384, 'rafdeleon82@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Marck', 'Rafael B. De', 'Leon', NULL, '2003-05-31', 'Los Baños, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09924759637', NULL, '957', NULL, 'Canlubang', 'Biñan', 'Laguna', '4019', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(385, 'delarosalujen23@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Lujen', 'M. Dela', 'Rosa', NULL, '2002-03-19', 'Victoria, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09929208289', NULL, '498', NULL, 'Mayondon', 'Liliw', 'Laguna', '4008', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(386, 'emeflo2969@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Ray', 'Emylson M.', 'Flores', NULL, '2004-01-29', 'Biñan, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09118748689', NULL, '133', NULL, 'Poblacion', 'Los Baños', 'Laguna', '4008', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(387, 'ivanjheromegonzales0318@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Ivan', 'Jherome S.', 'Gonzales', NULL, '2004-09-27', 'Santa Cruz, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09796451796', NULL, '555', NULL, 'Canlubang', 'Biñan', 'Laguna', '4027', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(388, 'aceattacker028@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'John', 'Andrei C.', 'Guzman', NULL, '2004-04-10', 'Siniloan, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09791889860', NULL, '988', NULL, 'San Antonio', 'Nagcarlan', 'Laguna', '4027', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(389, 'seanjohnreyeslooc@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Sean', 'John R.', 'Looc', NULL, '2004-08-15', 'Siniloan, Laguna', 'Filipino', 'Male', 'Single', 'Iglesia ni Cristo', NULL, 'No', '09632051584', NULL, '435', NULL, 'San Antonio', 'Pagsanjan', 'Laguna', '4002', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(390, 'ivandwight3@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Ivandwight', 'S.', 'Macabulos', NULL, '2002-03-17', 'Cabuyao, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09346295331', NULL, '276', NULL, 'Masapang', 'Bay', 'Laguna', '4026', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(391, 'gianmaranan81@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Gian', 'Carlo I.', 'Maranan', NULL, '2003-03-15', 'Calamba, Laguna', 'Filipino', 'Male', 'Single', 'Baptist', NULL, 'No', '09410770537', NULL, '470', NULL, 'Burol', 'Santa Cruz', 'Laguna', '4030', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(392, 'montecillokent019@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Reymond', 'Kent A.', 'Montecilo', NULL, '2002-07-21', 'Los Baños, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09239137437', NULL, '960', NULL, 'Parian', 'Liliw', 'Laguna', '4030', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(393, 'johnedwardopulencia062@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'John', 'Edward P.', 'Opulencia', NULL, '2004-07-14', 'Bay, Laguna', 'Filipino', 'Male', 'Single', 'Aglipayan', NULL, 'No', '09380127645', NULL, '304', NULL, 'Halang', 'Nagcarlan', 'Laguna', '4028', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(394, 'pelenojewel@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Jewel', 'Anne Keith E.', 'Peleño', NULL, '2003-02-22', 'Victoria, Laguna', 'Filipino', 'Female', 'Single', 'Aglipayan', NULL, 'No', '09880774990', NULL, '559', NULL, 'Bayog', 'Cabuyao', 'Laguna', '4026', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(395, 'danpolistico91@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Dan', 'Christian G.', 'Polistico', NULL, '2002-09-03', 'Pila, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09896550074', NULL, '41', NULL, 'Canlubang', 'Cabuyao', 'Laguna', '4026', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(396, 'gabriellepogi25prudente@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Gabrielle', 'C.', 'Prudente', NULL, '2002-12-02', 'Liliw, Laguna', 'Filipino', 'Female', 'Single', 'Baptist', NULL, 'No', '09573755057', NULL, '221', NULL, 'Masapang', 'Liliw', 'Laguna', '4026', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(397, 'bayabasmaromaro92@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Christian', 'Jake A.', 'Ramiro', NULL, '2002-10-11', 'Victoria, Laguna', 'Filipino', 'Male', 'Single', 'Born Again Christian', NULL, 'No', '09512313895', NULL, '770', NULL, 'Parian', 'Siniloan', 'Laguna', '4028', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(398, 'edward.sanantonio14@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Edward', 'O. San', 'Antonio', NULL, '2004-06-10', 'Calamba, Laguna', 'Filipino', 'Male', 'Single', 'Roman Catholic', NULL, 'No', '09128633402', NULL, '264', NULL, 'Masapang', 'Siniloan', 'Laguna', '4002', '2026-05-07 07:37:27', '2026-05-07 07:37:27'),
(399, 'justinesuiza1@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Justine', 'G.', 'Suiza', NULL, '2003-09-23', 'Biñan, Laguna', 'Filipino', 'Female', 'Single', 'Born Again Christian', NULL, 'No', '09790585140', NULL, '193', NULL, 'Canlubang', 'Siniloan', 'Laguna', '4019', '2026-05-07 07:37:27', '2026-05-07 07:37:27');

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
  `student_id` int(10) UNSIGNED NOT NULL,
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

INSERT INTO `educational_background` (`id`, `student_id`, `elementary_school_name`, `elementary_school_address`, `elementary_type`, `elementary_year_from`, `elementary_year_to`, `high_school_name`, `high_school_address`, `high_school_type`, `high_school_year_from`, `high_school_year_to`, `senior_high_school_name`, `senior_high_school_address`, `senior_high_school_type`, `senior_high_school_year_from`, `senior_high_school_year_to`, `track_strand`, `created_at`, `updated_at`) VALUES
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
INSERT INTO `educational_background` (`id`, `student_id`, `elementary_school_name`, `elementary_school_address`, `elementary_type`, `elementary_year_from`, `elementary_year_to`, `high_school_name`, `high_school_address`, `high_school_type`, `high_school_year_from`, `high_school_year_to`, `senior_high_school_name`, `senior_high_school_address`, `senior_high_school_type`, `senior_high_school_year_from`, `senior_high_school_year_to`, `track_strand`, `created_at`, `updated_at`) VALUES
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
  `student_id` int(10) UNSIGNED NOT NULL,
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

INSERT INTO `family_info` (`id`, `student_id`, `guardian_first_name`, `guardian_last_name`, `guardian_contact_number`, `guardian_email`, `guardian_relationship`, `guardian_barangay`, `guardian_municipality`, `guardian_province`, `father_first_name`, `father_middle_name`, `father_last_name`, `father_age`, `father_citizenship`, `father_educational_attainment`, `father_employment_status`, `father_occupation`, `mother_first_name`, `mother_middle_name`, `mother_last_name`, `mother_age`, `mother_citizenship`, `mother_educational_attainment`, `mother_employment_status`, `mother_occupation`, `created_at`, `updated_at`) VALUES
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
INSERT INTO `family_info` (`id`, `student_id`, `guardian_first_name`, `guardian_last_name`, `guardian_contact_number`, `guardian_email`, `guardian_relationship`, `guardian_barangay`, `guardian_municipality`, `guardian_province`, `father_first_name`, `father_middle_name`, `father_last_name`, `father_age`, `father_citizenship`, `father_educational_attainment`, `father_employment_status`, `father_occupation`, `mother_first_name`, `mother_middle_name`, `mother_last_name`, `mother_age`, `mother_citizenship`, `mother_educational_attainment`, `mother_employment_status`, `mother_occupation`, `created_at`, `updated_at`) VALUES
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
  `student_id` int(10) UNSIGNED NOT NULL,
  `Program_Code` varchar(20) NOT NULL,
  `Specialization` varchar(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `intended_course`
--

INSERT INTO `intended_course` (`id`, `student_id`, `Program_Code`, `Specialization`, `created_at`, `updated_at`) VALUES
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
  `Student_ID` int(11) NOT NULL,
  `Student_Number` varchar(20) NOT NULL,
  `applicant_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'FK to applicants.student_id; NULL for pre-portal students',
  `Enrollment_Date` date DEFAULT NULL,
  `Status` varchar(50) DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`Student_ID`, `Student_Number`, `applicant_id`, `Enrollment_Date`, `Status`) VALUES
(1, '0425-0377', 1, '2025-08-12', 'Active'),
(2, '0425-0384', 2, '2025-08-12', 'Active'),
(3, '0424-0353', 3, '2025-08-12', 'Active'),
(4, '0425-0327', 4, '2025-08-12', 'Active'),
(5, '0425-0364', 5, '2025-08-12', 'Active'),
(6, '0425-0409', 6, '2025-08-12', 'Active'),
(7, '0425-0435', 7, '2025-08-12', 'Active'),
(8, '0425-0375', 8, '2025-08-12', 'Active'),
(9, '0425-0886', 9, '2025-08-12', 'Active'),
(10, '0425-0411', 10, '2025-08-12', 'Active'),
(11, '0425-0467', 11, '2025-08-12', 'Active'),
(12, '0425-0365', 12, '2025-08-12', 'Active'),
(13, '0425-0358', 13, '2025-08-12', 'Active'),
(14, '0425-0430', 14, '2025-08-12', 'Active'),
(15, '0425-0317', 15, '2025-08-12', 'Active'),
(16, '0425-0319', 16, '2025-08-12', 'Active'),
(17, '0425-0581', 17, '2025-08-12', 'Active'),
(18, '0425-0422', 18, '2025-08-12', 'Active'),
(19, '0425-0890', 19, '2025-08-12', 'Active'),
(20, '0425-0432', 20, '2025-08-12', 'Active'),
(21, '0425-0996', 21, '2025-08-12', 'Active'),
(22, '0425-0394', 22, '2025-08-12', 'Active'),
(23, '0425-0417', 23, '2025-08-12', 'Active'),
(24, '0425-0024', 24, '2025-08-12', 'Active'),
(25, '0425-0315', 25, '2025-08-12', 'Active'),
(26, '0425-0363', 26, '2025-08-12', 'Active'),
(27, '0425-0349', 27, '2025-08-12', 'Active'),
(28, '0425-0359', 28, '2025-08-12', 'Active'),
(29, '0425-0362', 29, '2025-08-12', 'Active'),
(30, '0425-0340', 30, '2025-08-12', 'Active'),
(31, '0425-0334', 31, '2025-08-12', 'Active'),
(32, '0420-0733', 32, '2025-08-12', 'Active'),
(33, '0425-0380', 33, '2025-08-12', 'Active'),
(34, '0425-0333', 34, '2025-08-12', 'Active'),
(35, '0425-0991', 35, '2025-08-12', 'Active'),
(36, '0425-0329', 36, '2025-08-12', 'Active'),
(37, '0425-0986', 37, '2025-08-12', 'Active'),
(38, '0425-0367', 38, '2025-08-12', 'Active'),
(39, '0425-0035', 39, '2025-08-12', 'Active'),
(40, '0425-0337', 40, '2025-08-12', 'Active'),
(41, '0425-0437', 41, '2025-08-12', 'Active'),
(42, '0425-0347', 42, '2025-08-12', 'Active'),
(43, '0424-0493', 43, '2025-08-12', 'Active'),
(44, '0425-0342', 44, '2025-08-12', 'Active'),
(45, '0425-0989', 45, '2025-08-12', 'Active'),
(46, '0425-0046', 46, '2025-08-12', 'Active'),
(47, '0425-0336', 47, '2025-08-12', 'Active'),
(48, '0425-0316', 48, '2025-08-12', 'Active'),
(49, '0425-0372', 49, '2025-08-12', 'Active'),
(50, '0425-0366', 50, '2025-08-12', 'Active'),
(51, '0425-0314', 51, '2025-08-12', 'Active'),
(52, '0425-0361', 52, '2025-08-12', 'Active'),
(53, '0425-0341', 53, '2025-08-12', 'Active'),
(54, '0425-0381', 54, '2025-08-12', 'Active'),
(55, '0425-0330', 55, '2025-08-12', 'Active'),
(56, '0425-0338', 56, '2025-08-12', 'Active'),
(57, '0425-0029', 57, '2025-08-12', 'Active'),
(58, '0422-0959', 58, '2025-08-12', 'Active'),
(59, '0425-0439', 59, '2025-08-12', 'Active'),
(60, '0423-4045', 60, '2025-08-12', 'Active'),
(61, '0425-0428', 61, '2025-08-12', 'Active'),
(62, '0425-0558', 62, '2025-08-12', 'Active'),
(63, '0425-0545', 63, '2025-08-12', 'Active'),
(64, '0425-0612', 64, '2025-08-12', 'Active'),
(65, '0424-0176', 65, '2025-08-12', 'Active'),
(66, '0425-0434', 66, '2025-08-12', 'Active'),
(67, '0425-0427', 67, '2025-08-12', 'Active'),
(68, '0425-0402', 68, '2025-08-12', 'Active'),
(69, '0425-0546', 69, '2025-08-12', 'Active'),
(70, '2014-0904', 70, '2025-08-12', 'Active'),
(71, '0425-0463', 71, '2025-08-12', 'Active'),
(72, '0419-1177', 72, '2025-08-12', 'Active'),
(73, '0425-0438', 73, '2025-08-12', 'Active'),
(74, '0424-1049', 74, '2025-08-12', 'Active'),
(75, '0425-0440', 75, '2025-08-12', 'Active'),
(76, '0425-0954', 76, '2025-08-12', 'Active'),
(77, '0425-0436', 77, '2025-08-12', 'Active'),
(78, '0425-0829', 78, '2025-08-12', 'Active'),
(79, '0425-0431', 79, '2025-08-12', 'Active'),
(80, '0425-0835', 80, '2025-08-12', 'Active'),
(81, '0425-0691', 81, '2025-08-12', 'Active'),
(82, '0425-0544', 82, '2025-08-12', 'Active'),
(83, '0425-0689', 83, '2025-08-12', 'Active'),
(84, '0425-0837', 84, '2025-08-12', 'Active'),
(85, '0425-0755', 85, '2025-08-12', 'Active'),
(86, '0425-0753', 86, '2025-08-12', 'Active'),
(87, '0422-0622', 87, '2025-08-12', 'Active'),
(88, '0425-0433', 88, '2025-08-12', 'Active'),
(89, '0425-0321', 89, '2025-08-12', 'Active'),
(90, '0425-0543', 90, '2025-08-12', 'Active'),
(91, '0425-0354', 91, '2025-08-12', 'Active'),
(92, '0425-0332', 92, '2025-08-12', 'Active'),
(93, '0425-0423', 93, '2025-08-12', 'Active'),
(94, '0425-0391', 94, '2025-08-12', 'Active'),
(95, '0425-0356', 95, '2025-08-12', 'Active'),
(96, '0425-0832', 96, '2025-08-12', 'Active'),
(97, '0425-0357', 97, '2025-08-12', 'Active'),
(98, '0425-0002', 98, '2025-08-12', 'Active'),
(99, '0425-0389', 99, '2025-08-12', 'Active'),
(100, '0425-0399', 100, '2025-08-12', 'Active'),
(101, '0425-0369', 101, '2025-08-12', 'Active'),
(102, '0425-0567', 102, '2025-08-12', 'Active'),
(103, '0425-0833', 103, '2025-08-12', 'Active'),
(104, '0425-0325', 104, '2025-08-12', 'Active'),
(105, '0425-0331', 105, '2025-08-12', 'Active'),
(106, '0425-0003', 106, '2025-08-12', 'Active'),
(107, '0425-0994', 107, '2025-08-12', 'Active'),
(108, '0425-0232', 108, '2025-08-12', 'Active'),
(109, '0425-0322', 109, '2025-08-12', 'Active'),
(110, '0424-0496', 110, '2025-08-12', 'Active'),
(111, '0422-0933', 111, '2025-08-12', 'Active'),
(112, '0425-0955', 112, '2025-08-12', 'Active'),
(113, '0425-0884', 113, '2025-08-12', 'Active'),
(258, '0423-3647', 258, '2023-08-14', 'Active'),
(259, '0423-3628', 259, '2023-08-14', 'Active'),
(260, '0423-3649', 260, '2023-08-14', 'Active'),
(261, '0423-0261', 261, '2023-08-14', 'Active'),
(262, '0423-3704', 262, '2023-08-14', 'Active'),
(263, '0423-3657', 263, '2023-08-14', 'Active'),
(264, '0423-4441', 264, '2023-08-14', 'Active'),
(265, '0423-4153', 265, '2023-08-14', 'Active'),
(266, '0425-0891', 266, '2023-08-14', 'Active'),
(267, '0423-4386', 267, '2023-08-14', 'Active'),
(268, '0423-3666', 268, '2023-08-14', 'Active'),
(269, '0424-0920', 269, '2023-08-14', 'Active'),
(270, '0424-0921', 270, '2023-08-14', 'Active'),
(271, '0423-3630', 271, '2023-08-14', 'Active'),
(272, '0422-0722', 272, '2023-08-14', 'Active'),
(273, '0422-2039', 273, '2023-08-14', 'Active'),
(274, '0423-3386', 274, '2023-08-14', 'Active'),
(275, '0423-4262', 275, '2023-08-14', 'Active'),
(276, '0423-3681', 276, '2023-08-14', 'Active'),
(277, '0423-3655', 277, '2023-08-14', 'Active'),
(278, '0423-3654', 278, '2023-08-14', 'Active'),
(279, '0423-3659', 279, '2023-08-14', 'Active'),
(280, '0422-0763', 280, '2023-08-14', 'Active'),
(281, '0423-4649', 281, '2023-08-14', 'Active'),
(282, '0423-4675', 282, '2023-08-14', 'Active'),
(283, '0423-4198', 283, '2023-08-14', 'Active'),
(284, '0423-3359', 284, '2023-08-14', 'Active'),
(285, '0422-0656', 285, '2023-08-14', 'Active'),
(286, '0423-3670', 286, '2023-08-14', 'Active'),
(287, '0423-4102', 287, '2023-08-14', 'Active'),
(288, '0423-3668', 288, '2023-08-14', 'Active'),
(289, '0423-3455', 289, '2023-08-14', 'Active'),
(290, '0423-3644', 290, '2023-08-14', 'Active'),
(291, '0423-4420', 291, '2023-08-14', 'Active'),
(292, '0424-0973', 292, '2023-08-14', 'Active'),
(293, '96624', 293, '2023-08-14', 'Active'),
(294, '0423-3707', 294, '2023-08-14', 'Active'),
(295, '0423-4341', 295, '2023-08-14', 'Active'),
(296, '0423-3605', 296, '2023-08-14', 'Active'),
(297, '0422-0996', 297, '2023-08-14', 'Active'),
(298, '0423-3372', 298, '2023-08-14', 'Active'),
(299, '0423-4150', 299, '2023-08-14', 'Active'),
(300, '0420-1077', 300, '2023-08-14', 'Active'),
(301, '0421-2193', 301, '2023-08-14', 'Active'),
(302, '0423-3906', 302, '2023-08-14', 'Active'),
(303, '0420-0769', 303, '2023-08-14', 'Active'),
(304, '0423-3480', 304, '2023-08-14', 'Active'),
(305, '0422-0760', 305, '2023-08-14', 'Active'),
(306, '0423-3572', 306, '2023-08-14', 'Active'),
(307, '0423-3611', 307, '2023-08-14', 'Active'),
(308, '0423-4696', 308, '2023-08-14', 'Active'),
(309, '0423-3573', 309, '2023-08-14', 'Active'),
(310, '0424-0898', 310, '2023-08-14', 'Active'),
(311, '0423-3393', 311, '2023-08-14', 'Active'),
(312, '0423-3694', 312, '2023-08-14', 'Active'),
(313, '0423-4698', 313, '2023-08-14', 'Active'),
(314, '0423-3645', 314, '2023-08-14', 'Active'),
(315, '0423-3560', 315, '2023-08-14', 'Active'),
(316, '0423-4194', 316, '2023-08-14', 'Active'),
(317, '0423-4422', 317, '2023-08-14', 'Active'),
(318, '0423-3625', 318, '2023-08-14', 'Active'),
(319, '0423-4142', 319, '2023-08-14', 'Active'),
(320, '0423-3487', 320, '2023-08-14', 'Active'),
(321, '0423-3592', 321, '2023-08-14', 'Active'),
(322, '0422-1383', 322, '2023-08-14', 'Active'),
(323, '0423-3485', 323, '2023-08-14', 'Active'),
(324, '0423-3590', 324, '2023-08-14', 'Active'),
(325, '0423-4245', 325, '2023-08-14', 'Active'),
(326, '0423-3496', 326, '2023-08-14', 'Active'),
(327, '0423-3599', 327, '2023-08-14', 'Active'),
(328, '0423-3568', 328, '2023-08-14', 'Active'),
(329, '0423-4496', 329, '2023-08-14', 'Active'),
(330, '0423-4292', 330, '2023-08-14', 'Active'),
(331, '0423-3622', 331, '2023-08-14', 'Active'),
(332, '0423-3885', 332, '2023-08-14', 'Active'),
(333, '0423-3718', 333, '2023-08-14', 'Active'),
(334, '0423-3466', 334, '2023-08-14', 'Active'),
(335, '0423-4110', 335, '2023-08-14', 'Active'),
(336, '0423-4096', 336, '2023-08-14', 'Active'),
(337, '0423-3490', 337, '2023-08-14', 'Active'),
(338, '0423-3570', 338, '2023-08-14', 'Active'),
(339, '0420-0623', 339, '2023-08-14', 'Active'),
(340, '0423-4690', 340, '2023-08-14', 'Active'),
(341, '0423-4054', 341, '2023-08-14', 'Active'),
(342, '0423-4882', 342, '2023-08-14', 'Active'),
(343, '0423-4612', 343, '2023-08-14', 'Active'),
(344, '0423-3534', 344, '2023-08-14', 'Active'),
(345, '0423-3491', 345, '2023-08-14', 'Active'),
(346, '0422-1599', 346, '2023-08-14', 'Active'),
(347, '0423-4197', 347, '2023-08-14', 'Active'),
(348, '0422-0912', 348, '2023-08-14', 'Active'),
(349, '0423-3522', 349, '2023-08-14', 'Active'),
(350, '0423-4039', 350, '2023-08-14', 'Active'),
(351, '0423-3541', 351, '2023-08-14', 'Active'),
(352, '0423-3545', 352, '2023-08-14', 'Active'),
(353, '0423-3550', 353, '2023-08-14', 'Active'),
(354, '0423-3575', 354, '2023-08-14', 'Active'),
(355, '0423-3532', 355, '2023-08-14', 'Active'),
(356, '0423-4667', 356, '2023-08-14', 'Active'),
(357, '0421-2153', 357, '2023-08-14', 'Active'),
(358, '0423-4400', 358, '2023-08-14', 'Active'),
(359, '0423-4357', 359, '2023-08-14', 'Active'),
(360, '0423-4575', 360, '2023-08-14', 'Active'),
(361, '0423-3495', 361, '2023-08-14', 'Active'),
(362, '0423-3498', 362, '2023-08-14', 'Active'),
(363, '0421-2174', 363, '2023-08-14', 'Active'),
(364, '0423-3543', 364, '2023-08-14', 'Active'),
(365, '0423-3517', 365, '2023-08-14', 'Active'),
(366, '0423-3537', 366, '2023-08-14', 'Active'),
(367, '0423-3530', 367, '2023-08-14', 'Active'),
(368, '0423-3549', 368, '2023-08-14', 'Active'),
(369, '0423-3566', 369, '2023-08-14', 'Active'),
(370, '0423-3505', 370, '2023-08-14', 'Active'),
(371, '0423-3493', 371, '2023-08-14', 'Active'),
(372, '0423-4148', 372, '2023-08-14', 'Active'),
(373, '0418-0554', 373, '2023-08-14', 'Active'),
(374, '0423-3380', 374, '2023-08-14', 'Active'),
(375, '0423-3597', 375, '2023-08-14', 'Active'),
(376, '0423-3587', 376, '2023-08-14', 'Active'),
(377, '0423-3479', 377, '2023-08-14', 'Active'),
(378, '0423-3700', 378, '2023-08-14', 'Active'),
(379, '0423-3616', 379, '2023-08-14', 'Active'),
(380, '0423-4501', 380, '2023-08-14', 'Active'),
(381, '0423-4073', 381, '2023-08-14', 'Active'),
(382, '0423-4084', 382, '2023-08-14', 'Active'),
(383, '0423-3791', 383, '2023-08-14', 'Active'),
(384, '0423-3584', 384, '2023-08-14', 'Active'),
(385, '0423-3607', 385, '2023-08-14', 'Active'),
(386, '0423-3709', 386, '2023-08-14', 'Active'),
(387, '0423-3450', 387, '2023-08-14', 'Active'),
(388, '0423-4060', 388, '2023-08-14', 'Active'),
(389, '0423-3468', 389, '2023-08-14', 'Active'),
(390, '0423-3600', 390, '2023-08-14', 'Active'),
(391, '0423-3476', 391, '2023-08-14', 'Active'),
(392, '0423-3469', 392, '2023-08-14', 'Active'),
(393, '0423-3617', 393, '2023-08-14', 'Active'),
(394, '0423-3609', 394, '2023-08-14', 'Active'),
(395, '0423-4868', 395, '2023-08-14', 'Active'),
(396, '0423-3483', 396, '2023-08-14', 'Active'),
(397, '0422-1748', 397, '2023-08-14', 'Active'),
(398, '0423-3579', 398, '2023-08-14', 'Active'),
(399, '0423-3428', 399, '2023-08-14', 'Active');

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
-- Stand-in structure for view `v_applicant_summary`
-- (See below for the actual view)
--
CREATE TABLE `v_applicant_summary` (
`student_id` int(10) unsigned
,`full_name` varchar(263)
,`Email` varchar(180)
,`application_status` enum('Pending','Draft','Submitted','Enrolled','Rejected')
,`Sex` enum('Male','Female')
,`Birthday` date
,`Contact_Number` varchar(15)
,`full_address` varchar(244)
,`campus` enum('Sta Cruz Campus','Siniloan Campus','San Pablo Campus','Los Banos Campus')
,`student_type` enum('College','GSaR','Post Graduate')
,`year_level` enum('1st Year','2nd Year','3rd Year','4th Year','5th Year')
,`admission_type` varchar(80)
,`Program_Code` varchar(20)
,`Program_Name` varchar(120)
,`College` varchar(150)
,`Specialization` varchar(20)
,`created_at` datetime
);

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
-- Dumping data for table `year`
--

INSERT INTO `year` (`year_id`, `academic_year`, `is_current`) VALUES
(1, '2024-2025', 0),
(2, '2025-2026', 1),
(3, '2026-2027', 0);

-- --------------------------------------------------------

--
-- Structure for view `v_applicant_summary`
--
DROP TABLE IF EXISTS `v_applicant_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_applicant_summary`  AS SELECT `a`.`student_id` AS `student_id`, concat(`a`.`First_Name`,' ',ifnull(concat(`a`.`Middle_Name`,' '),''),`a`.`Last_Name`,ifnull(concat(' ',`a`.`Suffix`),'')) AS `full_name`, `a`.`Email` AS `Email`, `a`.`application_status` AS `application_status`, `a`.`Sex` AS `Sex`, `a`.`Birthday` AS `Birthday`, `a`.`Contact_Number` AS `Contact_Number`, concat_ws(', ',`a`.`Barangay`,`a`.`Municipality`,`a`.`Province`) AS `full_address`, `ai`.`campus` AS `campus`, `ai`.`student_type` AS `student_type`, `ai`.`year_level` AS `year_level`, `ai`.`admission_type` AS `admission_type`, `ic`.`Program_Code` AS `Program_Code`, `p`.`Program_Name` AS `Program_Name`, `c`.`college_name` AS `College`, `ic`.`Specialization` AS `Specialization`, `a`.`created_at` AS `created_at` FROM ((((`applicants` `a` left join `admission_info` `ai` on(`ai`.`student_id` = `a`.`student_id`)) left join `intended_course` `ic` on(`ic`.`student_id` = `a`.`student_id`)) left join `programs` `p` on(`p`.`Program_Code` = `ic`.`Program_Code`)) left join `colleges` `c` on(`c`.`college_id` = `p`.`college_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `uq_admin_email` (`email`);

--
-- Indexes for table `admission_info`
--
ALTER TABLE `admission_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_student` (`student_id`);

--
-- Indexes for table `applicants`
--
ALTER TABLE `applicants`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `idx_email` (`Email`);

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
  ADD UNIQUE KEY `uq_student` (`student_id`);

--
-- Indexes for table `enrolled_subjects`
--
ALTER TABLE `enrolled_subjects`
  ADD PRIMARY KEY (`enrolled_subject_id`),
  ADD KEY `enrollment_id` (`enrollment_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `instructor_id` (`instructor_id`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `semester_id` (`semester_id`),
  ADD KEY `year_id` (`year_id`);

--
-- Indexes for table `family_info`
--
ALTER TABLE `family_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_student` (`student_id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`grade_id`),
  ADD KEY `enrolled_subject_id` (`enrolled_subject_id`);

--
-- Indexes for table `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`Instructor_ID`),
  ADD KEY `Subject_ID` (`Subject_ID`),
  ADD KEY `College_ID` (`College_ID`),
  ADD KEY `Campus_ID` (`Campus_ID`);

--
-- Indexes for table `intended_course`
--
ALTER TABLE `intended_course`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_student` (`student_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `semester_id` (`semester_id`),
  ADD KEY `year_id` (`year_id`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`Program_Code`),
  ADD KEY `fk_prog_college` (`college_id`);

--
-- Indexes for table `receipt`
--
ALTER TABLE `receipt`
  ADD PRIMARY KEY (`receipt_id`),
  ADD UNIQUE KEY `receipt_number` (`receipt_number`),
  ADD KEY `payment_id` (`payment_id`);

--
-- Indexes for table `registrar`
--
ALTER TABLE `registrar`
  ADD PRIMARY KEY (`registrar_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `schedule_subject_fk` (`subject_id`),
  ADD KEY `schedule_instructor_fk` (`instructor_id`),
  ADD KEY `schedule_section_fk` (`section_id`),
  ADD KEY `schedule_semester_fk` (`semester_id`),
  ADD KEY `schedule_year_fk` (`year_id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`section_id`),
  ADD KEY `section_program_fk` (`program_code`),
  ADD KEY `section_campus_fk` (`campus_id`);

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
  ADD UNIQUE KEY `uq_spec` (`Program_Code`,`spec_code`),
  ADD UNIQUE KEY `uq_spec_code` (`spec_code`);

--
-- Indexes for table `special_programs`
--
ALTER TABLE `special_programs`
  ADD PRIMARY KEY (`special_id`),
  ADD KEY `college_id` (`college_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`Student_ID`),
  ADD UNIQUE KEY `unique_student_number` (`Student_Number`),
  ADD KEY `fk_student_applicant` (`applicant_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`Subject_Id`),
  ADD KEY `College_Id` (`College_Id`);

--
-- Indexes for table `year`
--
ALTER TABLE `year`
  ADD PRIMARY KEY (`year_id`),
  ADD UNIQUE KEY `academic_year` (`academic_year`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=262;

--
-- AUTO_INCREMENT for table `applicants`
--
ALTER TABLE `applicants`
  MODIFY `student_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=403;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=260;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=260;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=260;

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
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `special_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `Student_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=400;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `Subject_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `year`
--
ALTER TABLE `year`
  MODIFY `year_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admission_info`
--
ALTER TABLE `admission_info`
  ADD CONSTRAINT `fk_adm_student` FOREIGN KEY (`student_id`) REFERENCES `applicants` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `educational_background`
--
ALTER TABLE `educational_background`
  ADD CONSTRAINT `fk_edu_student` FOREIGN KEY (`student_id`) REFERENCES `applicants` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `family_info`
--
ALTER TABLE `family_info`
  ADD CONSTRAINT `fk_fam_student` FOREIGN KEY (`student_id`) REFERENCES `applicants` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `instructors`
--
ALTER TABLE `instructors`
  ADD CONSTRAINT `instructors_campus_fk` FOREIGN KEY (`Campus_ID`) REFERENCES `campus` (`Campus_Id`),
  ADD CONSTRAINT `instructors_college_fk` FOREIGN KEY (`College_ID`) REFERENCES `colleges` (`college_id`),
  ADD CONSTRAINT `instructors_subject_fk` FOREIGN KEY (`Subject_ID`) REFERENCES `subjects` (`Subject_Id`);

--
-- Constraints for table `intended_course`
--
ALTER TABLE `intended_course`
  ADD CONSTRAINT `fk_course_student` FOREIGN KEY (`student_id`) REFERENCES `applicants` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `programs`
--
ALTER TABLE `programs`
  ADD CONSTRAINT `fk_prog_college` FOREIGN KEY (`college_id`) REFERENCES `colleges` (`college_id`) ON UPDATE CASCADE;

--
-- Constraints for table `specializations`
--
ALTER TABLE `specializations`
  ADD CONSTRAINT `fk_spec_program` FOREIGN KEY (`Program_Code`) REFERENCES `programs` (`Program_Code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `fk_student_applicant` FOREIGN KEY (`applicant_id`) REFERENCES `applicants` (`student_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`College_Id`) REFERENCES `colleges` (`college_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
