-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2026 at 05:06 AM
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
(1, 2, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-04 22:01:08', '2026-05-04 23:14:31'),
(2, 3, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-04 22:13:22', '2026-05-04 22:13:22'),
(3, 4, 'San Pablo Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-05 12:00:41', '2026-05-05 12:00:41');

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
(2, 'johnsalen13@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Vic John', 'Oboza', 'Salen', 'Jr.', '2005-10-13', 'Bay Laguna', 'Filipino', 'Male', 'Single', NULL, NULL, 'No', '09918833309', NULL, '12782', 'J. Aquino', 'Mayondon', 'Los Baños', 'Laguna', '4030', '2026-05-04 22:00:06', '2026-05-05 00:51:40'),
(3, 'johnsalen132005@gmail.com', '$2y$10$m5.70njPe5YlxzMNNS69huY8e5k.Qd8Q2wMP4ed.zyPwTsWmIIQYG', 'Draft', 'Jen', NULL, 'Oboza', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-04 22:13:06', '2026-05-05 09:10:30'),
(4, 'justin@gmail.com', '$2y$10$MN2kMdt/.eIM0Dm2pj0jKeNN9TgXURV1GK2Z4Dz2YfkZcstxAGJ8i', 'Pending', 'Justin', NULL, 'Reboton', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-05 12:00:06', '2026-05-05 12:00:06');

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
(1, 2, 'Mayondon Elementary School', NULL, 'Public', NULL, NULL, 'Los Baños National High School', NULL, 'Public', NULL, NULL, 'CDLB', NULL, 'Public', NULL, NULL, 'ICT', '2026-05-05 00:01:33', '2026-05-05 08:46:17');

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

--
-- Dumping data for table `enrolled_subjects`
--

INSERT INTO `enrolled_subjects` (`enrolled_subject_id`, `enrollment_id`, `subject_id`, `instructor_id`, `status`) VALUES
(1, 1, 6, 1, 'Enrolled'),
(2, 1, 7, 2, 'Enrolled'),
(3, 1, 10, 1, 'Enrolled'),
(4, 2, 6, 1, 'Enrolled'),
(5, 2, 7, 2, 'Enrolled'),
(6, 2, 10, 1, 'Enrolled'),
(7, 3, 6, 1, 'Enrolled'),
(8, 3, 7, 2, 'Enrolled'),
(9, 3, 10, 1, 'Enrolled'),
(10, 4, 6, 1, 'Enrolled'),
(11, 4, 7, 2, 'Enrolled'),
(12, 4, 10, 1, 'Enrolled'),
(13, 5, 6, 1, 'Enrolled'),
(14, 5, 7, 2, 'Enrolled'),
(15, 5, 10, 1, 'Enrolled'),
(16, 6, 6, 1, 'Enrolled'),
(17, 6, 7, 2, 'Enrolled'),
(18, 6, 10, 1, 'Enrolled'),
(19, 7, 6, 1, 'Enrolled'),
(20, 7, 7, 2, 'Enrolled'),
(21, 7, 10, 1, 'Enrolled'),
(22, 8, 6, 1, 'Enrolled'),
(23, 8, 7, 2, 'Enrolled'),
(24, 8, 10, 1, 'Enrolled'),
(25, 9, 6, 1, 'Enrolled'),
(26, 9, 7, 2, 'Enrolled'),
(27, 9, 10, 1, 'Enrolled'),
(28, 10, 6, 1, 'Enrolled'),
(29, 10, 7, 2, 'Enrolled'),
(30, 10, 10, 1, 'Enrolled'),
(31, 11, 6, 1, 'Enrolled'),
(32, 11, 7, 2, 'Enrolled'),
(33, 11, 10, 1, 'Enrolled'),
(34, 12, 6, 1, 'Enrolled'),
(35, 12, 7, 2, 'Enrolled'),
(36, 12, 10, 1, 'Enrolled'),
(37, 13, 6, 1, 'Enrolled'),
(38, 13, 7, 2, 'Enrolled'),
(39, 13, 10, 1, 'Enrolled'),
(40, 14, 6, 1, 'Enrolled'),
(41, 14, 7, 2, 'Enrolled'),
(42, 14, 10, 1, 'Enrolled'),
(43, 15, 6, 1, 'Enrolled'),
(44, 15, 7, 2, 'Enrolled'),
(45, 15, 10, 1, 'Enrolled'),
(46, 16, 6, 1, 'Enrolled'),
(47, 16, 7, 2, 'Enrolled'),
(48, 16, 10, 1, 'Enrolled'),
(49, 17, 6, 1, 'Enrolled'),
(50, 17, 7, 2, 'Enrolled'),
(51, 17, 10, 1, 'Enrolled'),
(52, 18, 6, 1, 'Enrolled'),
(53, 18, 7, 2, 'Enrolled'),
(54, 18, 10, 1, 'Enrolled'),
(55, 19, 6, 1, 'Enrolled'),
(56, 19, 7, 2, 'Enrolled'),
(57, 19, 10, 1, 'Enrolled'),
(58, 20, 6, 1, 'Enrolled'),
(59, 20, 7, 2, 'Enrolled'),
(60, 20, 10, 1, 'Enrolled'),
(61, 21, 6, 1, 'Enrolled'),
(62, 21, 7, 2, 'Enrolled'),
(63, 21, 10, 1, 'Enrolled'),
(64, 22, 6, 1, 'Enrolled'),
(65, 22, 7, 2, 'Enrolled'),
(66, 22, 10, 1, 'Enrolled'),
(67, 23, 6, 1, 'Enrolled'),
(68, 23, 7, 2, 'Enrolled'),
(69, 23, 10, 1, 'Enrolled'),
(70, 24, 6, 1, 'Enrolled'),
(71, 24, 7, 2, 'Enrolled'),
(72, 24, 10, 1, 'Enrolled'),
(73, 25, 6, 1, 'Enrolled'),
(74, 25, 7, 2, 'Enrolled'),
(75, 25, 10, 1, 'Enrolled'),
(76, 26, 6, 1, 'Enrolled'),
(77, 26, 7, 2, 'Enrolled'),
(78, 26, 10, 1, 'Enrolled'),
(79, 27, 6, 1, 'Enrolled'),
(80, 27, 7, 2, 'Enrolled'),
(81, 27, 10, 1, 'Enrolled');

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
  `status` varchar(20) NOT NULL DEFAULT 'Enrolled',
  `student_type` varchar(50) DEFAULT NULL,
  `year_level` varchar(20) DEFAULT NULL,
  `admission_type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`enrollment_id`, `student_id`, `section_id`, `semester_id`, `year_id`, `enrollment_date`, `status`, `student_type`, `year_level`, `admission_type`) VALUES
(1, 1, 1, 2, 2, '2026-03-19', 'Enrolled', NULL, NULL, NULL),
(2, 2, 1, 2, 2, '2026-03-19', 'Enrolled', NULL, NULL, NULL),
(3, 3, 1, 2, 2, '2026-03-19', 'Enrolled', NULL, NULL, NULL),
(4, 4, 1, 2, 2, '2026-03-19', 'Enrolled', NULL, NULL, NULL),
(5, 5, 1, 2, 2, '2026-03-19', 'Enrolled', NULL, NULL, NULL),
(6, 6, 1, 2, 2, '2026-03-19', 'Enrolled', NULL, NULL, NULL),
(7, 7, 1, 2, 2, '2026-03-19', 'Enrolled', NULL, NULL, NULL),
(8, 8, 1, 2, 2, '2026-03-19', 'Enrolled', NULL, NULL, NULL),
(9, 9, 1, 2, 2, '2026-03-19', 'Enrolled', NULL, NULL, NULL),
(10, 10, 1, 2, 2, '2026-03-19', 'Enrolled', NULL, NULL, NULL),
(11, 11, 1, 2, 2, '2026-03-19', 'Enrolled', NULL, NULL, NULL),
(12, 12, 1, 2, 2, '2026-03-19', 'Enrolled', NULL, NULL, NULL),
(13, 13, 1, 2, 2, '2026-03-19', 'Enrolled', NULL, NULL, NULL),
(14, 14, 1, 2, 2, '2026-03-19', 'Enrolled', NULL, NULL, NULL),
(15, 15, 1, 2, 2, '2026-03-19', 'Enrolled', NULL, NULL, NULL),
(16, 16, 1, 2, 2, '2026-03-19', 'Enrolled', NULL, NULL, NULL),
(17, 17, 1, 2, 2, '2026-03-19', 'Enrolled', NULL, NULL, NULL),
(18, 18, 1, 2, 2, '2026-03-19', 'Enrolled', NULL, NULL, NULL),
(19, 19, 1, 2, 2, '2026-03-19', 'Enrolled', NULL, NULL, NULL),
(20, 20, 1, 2, 2, '2026-03-19', 'Enrolled', NULL, NULL, NULL),
(21, 21, 1, 2, 2, '2026-03-19', 'Enrolled', NULL, NULL, NULL),
(22, 22, 1, 2, 2, '2026-03-19', 'Enrolled', NULL, NULL, NULL),
(23, 23, 1, 2, 2, '2026-03-19', 'Enrolled', NULL, NULL, NULL),
(24, 24, 1, 2, 2, '2026-03-19', 'Enrolled', NULL, NULL, NULL),
(25, 25, 1, 2, 2, '2026-03-19', 'Enrolled', NULL, NULL, NULL),
(26, 26, 1, 2, 2, '2026-03-19', 'Enrolled', NULL, NULL, NULL),
(27, 27, 1, 2, 2, '2026-03-19', 'Enrolled', NULL, NULL, NULL);

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
(1, 2, 'Jennifer', 'Oboza', NULL, NULL, 'Mother', 'Mayondon', 'Los Banos', 'Laguna', 'Vic John', 'France', 'Salen', NULL, 'Filipino', NULL, NULL, NULL, 'Jennifer', 'Sabado', 'Oboza', NULL, 'Filipino', 'College Graduate', 'Self-Employed', NULL, '2026-05-05 00:00:16', '2026-05-05 01:19:23');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `grade_id` int(11) NOT NULL,
  `enrolled_subject_id` int(11) NOT NULL,
  `prelim` decimal(5,2) DEFAULT NULL,
  `midterm` decimal(5,2) DEFAULT NULL,
  `final` decimal(5,2) DEFAULT NULL,
  `average` decimal(5,2) GENERATED ALWAYS AS ((`prelim` + `midterm` + `final`) / 3) STORED,
  `remarks` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`grade_id`, `enrolled_subject_id`, `prelim`, `midterm`, `final`, `remarks`) VALUES
(1, 1, 88.00, 90.00, 86.00, 'Passed'),
(2, 2, 91.00, 92.00, 90.00, 'Passed'),
(3, 3, 85.00, 87.00, 83.00, 'Passed'),
(4, 4, 78.00, 80.00, 77.00, 'Passed'),
(5, 5, 82.00, 83.00, 81.00, 'Passed'),
(6, 6, 79.00, 80.00, 78.00, 'Passed'),
(7, 7, 90.00, 91.00, 89.00, 'Passed'),
(8, 8, 87.00, 88.00, 86.00, 'Passed'),
(9, 9, 92.00, 93.00, 91.00, 'Passed'),
(10, 10, 70.00, 72.00, 68.00, 'Passed'),
(11, 11, 75.00, 74.00, 76.00, 'Passed'),
(12, 12, 73.00, 71.00, 72.00, 'Passed'),
(13, 13, 85.00, 86.00, 84.00, 'Passed'),
(14, 14, 88.00, 87.00, 89.00, 'Passed'),
(15, 15, 90.00, 92.00, 91.00, 'Passed'),
(16, 16, 95.00, 94.00, 96.00, 'Passed'),
(17, 17, 92.00, 91.00, 93.00, 'Passed'),
(18, 18, 90.00, 89.00, 91.00, 'Passed'),
(19, 19, 78.00, 77.00, 79.00, 'Passed'),
(20, 20, 80.00, 81.00, 79.00, 'Passed'),
(21, 21, 82.00, 83.00, 81.00, 'Passed'),
(22, 22, 88.00, 87.00, 89.00, 'Passed'),
(23, 23, 86.00, 85.00, 87.00, 'Passed'),
(24, 24, 90.00, 91.00, 89.00, 'Passed'),
(25, 25, 70.00, 72.00, 71.00, 'Passed'),
(26, 26, 68.00, 69.00, 70.00, 'Passed'),
(27, 27, 72.00, 73.00, 71.00, 'Passed'),
(28, 28, 85.00, 86.00, 87.00, 'Passed'),
(29, 29, 88.00, 87.00, 86.00, 'Passed'),
(30, 30, 90.00, 91.00, 89.00, 'Passed'),
(31, 31, 78.00, 79.00, 77.00, 'Passed'),
(32, 32, 80.00, 81.00, 79.00, 'Passed'),
(33, 33, 82.00, 83.00, 81.00, 'Passed'),
(34, 34, 92.00, 93.00, 91.00, 'Passed'),
(35, 35, 95.00, 94.00, 96.00, 'Passed'),
(36, 36, 90.00, 91.00, 89.00, 'Passed'),
(37, 37, 85.00, 86.00, 87.00, 'Passed'),
(38, 38, 88.00, 87.00, 86.00, 'Passed'),
(39, 39, 90.00, 91.00, 89.00, 'Passed'),
(40, 40, 70.00, 72.00, 71.00, 'Passed'),
(41, 41, 68.00, 69.00, 70.00, 'Passed'),
(42, 42, 72.00, 73.00, 71.00, 'Passed'),
(43, 43, 88.00, 87.00, 89.00, 'Passed'),
(44, 44, 86.00, 85.00, 87.00, 'Passed'),
(45, 45, 90.00, 91.00, 89.00, 'Passed'),
(46, 46, 78.00, 79.00, 77.00, 'Passed'),
(47, 47, 80.00, 81.00, 79.00, 'Passed'),
(48, 48, 82.00, 83.00, 81.00, 'Passed'),
(49, 49, 95.00, 94.00, 96.00, 'Passed'),
(50, 50, 92.00, 91.00, 93.00, 'Passed'),
(51, 51, 90.00, 89.00, 91.00, 'Passed'),
(52, 52, 85.00, 86.00, 84.00, 'Passed'),
(53, 53, 88.00, 87.00, 89.00, 'Passed'),
(54, 54, 90.00, 92.00, 91.00, 'Passed'),
(55, 55, 78.00, 77.00, 79.00, 'Passed'),
(56, 56, 80.00, 81.00, 79.00, 'Passed'),
(57, 57, 82.00, 83.00, 81.00, 'Passed'),
(58, 58, 88.00, 87.00, 89.00, 'Passed'),
(59, 59, 86.00, 85.00, 87.00, 'Passed'),
(60, 60, 90.00, 91.00, 89.00, 'Passed'),
(61, 61, 70.00, 72.00, 68.00, 'Passed'),
(62, 62, 75.00, 74.00, 76.00, 'Passed'),
(63, 63, 73.00, 71.00, 72.00, 'Passed'),
(64, 64, 85.00, 86.00, 84.00, 'Passed'),
(65, 65, 88.00, 87.00, 89.00, 'Passed'),
(66, 66, 90.00, 92.00, 91.00, 'Passed'),
(67, 67, 95.00, 94.00, 96.00, 'Passed'),
(68, 68, 92.00, 91.00, 93.00, 'Passed'),
(69, 69, 90.00, 89.00, 91.00, 'Passed'),
(70, 70, 78.00, 79.00, 77.00, 'Passed'),
(71, 71, 80.00, 81.00, 79.00, 'Passed'),
(72, 72, 82.00, 83.00, 81.00, 'Passed'),
(73, 73, 88.00, 87.00, 89.00, 'Passed'),
(74, 74, 86.00, 85.00, 87.00, 'Passed'),
(75, 75, 90.00, 91.00, 89.00, 'Passed'),
(76, 76, 70.00, 72.00, 71.00, 'Passed'),
(77, 77, 68.00, 69.00, 70.00, 'Passed'),
(78, 78, 72.00, 73.00, 71.00, 'Passed'),
(79, 79, 85.00, 86.00, 87.00, 'Passed'),
(80, 80, 88.00, 87.00, 86.00, 'Passed'),
(81, 81, 90.00, 91.00, 89.00, 'Passed');

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
(1, 2, 'BSIT', 'WMAD', '2026-05-05 00:01:42', '2026-05-05 00:01:42');

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

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `student_id`, `semester_id`, `year_id`, `amount`, `payment_date`, `payment_method`, `status`) VALUES
(1, 1, 1, 1, 10000.00, '2026-03-01', 'Cash', 'Paid'),
(2, 2, 1, 1, 10000.00, '2026-03-02', 'Cash', 'Paid'),
(3, 3, 1, 1, 10000.00, '2026-03-03', 'Cash', 'Paid'),
(4, 4, 1, 1, 10000.00, '2026-03-04', 'Cash', 'Pending'),
(5, 5, 1, 1, 10000.00, '2026-03-05', 'Online', 'Paid'),
(6, 6, 1, 1, 10000.00, '2026-03-06', 'Online', 'Paid'),
(7, 7, 1, 1, 10000.00, '2026-03-07', 'Cash', 'Pending'),
(8, 8, 1, 1, 10000.00, '2026-03-08', 'Cash', 'Paid'),
(9, 9, 1, 1, 10000.00, '2026-03-09', 'Online', 'Paid'),
(10, 10, 1, 1, 10000.00, '2026-03-10', 'Cash', 'Paid'),
(11, 11, 1, 1, 10000.00, '2026-03-11', 'Online', 'Pending'),
(12, 12, 1, 1, 10000.00, '2026-03-12', 'Cash', 'Paid'),
(13, 13, 1, 1, 10000.00, '2026-03-13', 'Online', 'Paid'),
(14, 14, 1, 1, 10000.00, '2026-03-14', 'Cash', 'Paid'),
(15, 15, 1, 1, 10000.00, '2026-03-15', 'Cash', 'Paid'),
(16, 16, 1, 1, 10000.00, '2026-03-16', 'Online', 'Paid'),
(17, 17, 1, 1, 10000.00, '2026-03-17', 'Cash', 'Pending'),
(18, 18, 1, 1, 10000.00, '2026-03-18', 'Cash', 'Paid'),
(19, 19, 1, 1, 10000.00, '2026-03-19', 'Online', 'Paid'),
(20, 20, 1, 1, 10000.00, '2026-03-20', 'Cash', 'Paid'),
(21, 21, 1, 1, 10000.00, '2026-03-21', 'Online', 'Paid'),
(22, 22, 1, 1, 10000.00, '2026-03-22', 'Cash', 'Paid'),
(23, 23, 1, 1, 10000.00, '2026-03-23', 'Cash', 'Paid'),
(24, 24, 1, 1, 10000.00, '2026-03-24', 'Online', 'Pending'),
(25, 25, 1, 1, 10000.00, '2026-03-25', 'Cash', 'Paid'),
(26, 26, 1, 1, 10000.00, '2026-03-26', 'Online', 'Paid'),
(27, 27, 1, 1, 10000.00, '2026-03-27', 'Cash', 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `Program_Code` varchar(20) NOT NULL,
  `Program_Name` varchar(120) NOT NULL,
  `College` varchar(100) NOT NULL,
  `college_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`Program_Code`, `Program_Name`, `College`, `college_id`) VALUES
('BEED', 'Bachelor of Elementary Education', 'College of Teacher Education', NULL),
('BSA', 'BS Accountancy', 'College of Business Administration and Accountancy', NULL),
('BSAFBM', 'BS Agri-Fisheries Business Management', 'College of Fisheries', NULL),
('BSBA', 'BS Business Administration', 'College of Business Administration and Accountancy', NULL),
('BSC', 'BS Criminology', 'College of Criminal Justice Education', NULL),
('BSCS', 'BS Computer Science', 'College of Computer Studies', NULL),
('BSED', 'Bachelor of Secondary Education', 'College of Teacher Education', NULL),
('BSF', 'BS Fisheries', 'College of Fisheries', NULL),
('BSFE', 'BS Fishery Education', 'College of Fisheries', NULL),
('BSFT', 'BS Food Technology', 'College of Food Nutrition and Dietetics', NULL),
('BSHRM', 'BS Hotel and Restaurant Management', 'College of International Hospitality and Tourism Management', NULL),
('BSIT', 'BS Information Technology', 'College of Computer Studies', NULL),
('BSND', 'BS Nutrition and Dietetics', 'College of Food Nutrition and Dietetics', NULL),
('BSP', 'BS Psychology', 'College of Arts and Science', NULL),
('BST', 'BS Tourism', 'College of International Hospitality and Tourism Management', NULL);

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

--
-- Dumping data for table `receipt`
--

INSERT INTO `receipt` (`receipt_id`, `payment_id`, `receipt_number`, `issued_date`) VALUES
(1, 1, 'RCPT-2026-0001', '2026-03-01'),
(2, 2, 'RCPT-2026-0002', '2026-03-02'),
(3, 3, 'RCPT-2026-0003', '2026-03-03'),
(4, 4, 'RCPT-2026-0004', '2026-03-04'),
(5, 5, 'RCPT-2026-0005', '2026-03-05'),
(6, 6, 'RCPT-2026-0006', '2026-03-06'),
(7, 7, 'RCPT-2026-0007', '2026-03-07'),
(8, 8, 'RCPT-2026-0008', '2026-03-08'),
(9, 9, 'RCPT-2026-0009', '2026-03-09'),
(10, 10, 'RCPT-2026-0010', '2026-03-10'),
(11, 11, 'RCPT-2026-0011', '2026-03-11'),
(12, 12, 'RCPT-2026-0012', '2026-03-12'),
(13, 13, 'RCPT-2026-0013', '2026-03-13'),
(14, 14, 'RCPT-2026-0014', '2026-03-14'),
(15, 15, 'RCPT-2026-0015', '2026-03-15'),
(16, 16, 'RCPT-2026-0016', '2026-03-16'),
(17, 17, 'RCPT-2026-0017', '2026-03-17'),
(18, 18, 'RCPT-2026-0018', '2026-03-18'),
(19, 19, 'RCPT-2026-0019', '2026-03-19'),
(20, 20, 'RCPT-2026-0020', '2026-03-20'),
(21, 21, 'RCPT-2026-0021', '2026-03-21'),
(22, 22, 'RCPT-2026-0022', '2026-03-22'),
(23, 23, 'RCPT-2026-0023', '2026-03-23'),
(24, 24, 'RCPT-2026-0024', '2026-03-24'),
(25, 25, 'RCPT-2026-0025', '2026-03-25'),
(26, 26, 'RCPT-2026-0026', '2026-03-26'),
(27, 27, 'RCPT-2026-0027', '2026-03-27');

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
(3, 'Anna', 'Reyes', 'anna.reyes@school.edu', 'areyes', 'password123', 'Staff', 'Active'),
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
  `Last_Name` varchar(100) NOT NULL,
  `First_Name` varchar(100) NOT NULL,
  `Middle_Name` varchar(100) DEFAULT NULL,
  `Suffix` varchar(16) DEFAULT NULL,
  `Birthday` date DEFAULT NULL,
  `Citizenship` varchar(100) DEFAULT NULL,
  `Birth_Place` varchar(250) DEFAULT NULL,
  `Contact_Number` varchar(20) DEFAULT NULL,
  `Landline_Number` varchar(20) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `House_Number` varchar(50) DEFAULT NULL,
  `Street` varchar(100) DEFAULT NULL,
  `Barangay` varchar(100) DEFAULT NULL,
  `Municipality` varchar(100) DEFAULT NULL,
  `Province` varchar(100) DEFAULT NULL,
  `Zip_Code` varchar(20) DEFAULT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `Civil_Status` varchar(20) DEFAULT NULL,
  `Religion` varchar(100) DEFAULT NULL,
  `Disability` varchar(100) DEFAULT NULL,
  `First_Generation_Student` enum('Yes','No') DEFAULT NULL,
  `Enrollment_Date` date DEFAULT NULL,
  `Status` varchar(50) DEFAULT 'Active',
  `Program_Code` varchar(20) NOT NULL,
  `Specialization` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`Student_ID`, `Student_Number`, `Last_Name`, `First_Name`, `Middle_Name`, `Suffix`, `Birthday`, `Citizenship`, `Birth_Place`, `Contact_Number`, `Landline_Number`, `Email`, `House_Number`, `Street`, `Barangay`, `Municipality`, `Province`, `Zip_Code`, `Sex`, `Civil_Status`, `Religion`, `Disability`, `First_Generation_Student`, `Enrollment_Date`, `Status`, `Program_Code`, `Specialization`) VALUES
(1, '0424-0000', 'Abdurahman', 'Muhaimin', NULL, '', '2004-01-15', NULL, NULL, '09171234567', NULL, 'muhaimin.abdurahman@lspu.edu.ph', '123', 'Malinta St.', 'Malinta', 'Los Banos', 'Laguna', NULL, 'Male', NULL, NULL, NULL, NULL, '2022-06-01', 'Active', 'BSIT', 'AMG'),
(2, '0424-0001', 'Acaso', 'Kim Charle', 'Gamboa', '', '2004-02-20', NULL, NULL, '09171234568', NULL, 'kimcharle.acaso@lspu.edu.ph', '124', 'Del Remedio St.', 'Del Remedio', 'San Pablo', 'Laguna', NULL, 'Male', NULL, NULL, NULL, NULL, '2022-06-01', 'Active', 'BSIT', 'AMG'),
(3, '0424-0002', 'Banasihan', 'Athren', 'Maisog', '', '2004-03-05', NULL, NULL, '09171234569', NULL, 'athren.banasihan@lspu.edu.ph', '125', 'Bubukal St.', 'Bubukal', 'Sta Cruz', 'Laguna', NULL, 'Male', NULL, NULL, NULL, NULL, '2022-06-01', 'Active', 'BSIT', 'AMG'),
(4, '0424-0003', 'Banasihan', 'Matthew', 'Madera', '', '2004-04-12', NULL, NULL, '09171234570', NULL, 'matthew.banasihan@lspu.edu.ph', '126', 'Leviste St.', 'Malinta', 'Los Banos', 'Laguna', NULL, 'Male', NULL, NULL, NULL, NULL, '2022-06-01', 'Active', 'BSIT', 'AMG'),
(5, '0424-0004', 'Banca', 'James Vincent', 'Ingua', '', '2004-05-23', NULL, NULL, '09171234571', NULL, 'james.banca@lspu.edu.ph', '127', 'Main St.', 'Del Remedio', 'San Pablo', 'Laguna', NULL, 'Male', NULL, NULL, NULL, NULL, '2022-06-01', 'Active', 'BSIT', 'AMG'),
(6, '0424-0005', 'Bariuan', 'Kurt Lindon', 'Macasadia', '', '2004-06-10', NULL, NULL, '09171234572', NULL, 'kurt.bariuan@lspu.edu.ph', '128', 'Rizal St.', 'Bubukal', 'Sta Cruz', 'Laguna', NULL, 'Male', NULL, NULL, NULL, NULL, '2022-06-01', 'Active', 'BSIT', 'SMP'),
(7, '0424-0006', 'Carpena', 'Nicole', 'Pamplona', '', '2004-07-18', NULL, NULL, '09171234573', NULL, 'nicole.carpena@lspu.edu.ph', '129', 'Malinta St.', 'Malinta', 'Los Banos', 'Laguna', NULL, 'Female', NULL, NULL, NULL, NULL, '2022-06-01', 'Active', 'BSIT', 'SMP'),
(8, '0424-0007', 'Dizon', 'Jahrem', 'Magsino', '', '2004-08-25', NULL, NULL, '09171234574', NULL, 'jahrem.dizon@lspu.edu.ph', '130', 'Del Remedio St.', 'Del Remedio', 'San Pablo', 'Laguna', NULL, 'Male', NULL, NULL, NULL, NULL, '2022-06-01', 'Active', 'BSIT', 'SMP'),
(9, '0424-0008', 'Eclarinal', 'Kim Chester', 'Ubal', '', '2004-09-05', NULL, NULL, '09171234575', NULL, 'kim.eclarinal@lspu.edu.ph', '131', 'Bubukal St.', 'Bubukal', 'Sta Cruz', 'Laguna', NULL, 'Male', NULL, NULL, NULL, NULL, '2022-06-01', 'Active', 'BSIT', 'SMP'),
(10, '0424-0009', 'Fajardo', 'Jean Mervin', 'Gopolla', '', '2004-10-01', NULL, NULL, '09171234576', NULL, 'jean.fajardo@lspu.edu.ph', '132', 'Rizal St.', 'Malinta', 'Los Banos', 'Laguna', NULL, 'Male', NULL, NULL, NULL, NULL, '2022-06-01', 'Active', 'BSIT', 'SMP'),
(11, '0424-0010', 'Genayas', 'Kind Mighty', 'Paredes', '', '2004-10-12', NULL, NULL, '09171234577', NULL, 'kind.genayas@lspu.edu.ph', '133', 'Malinta St.', 'Malinta', 'Los Banos', 'Laguna', NULL, 'Male', NULL, NULL, NULL, NULL, '2022-06-01', 'Active', 'BSIT', 'WMAD'),
(12, '0424-0011', 'Gulay', 'Julius Andrei', 'Perez', '', '2004-11-05', NULL, NULL, '09171234578', NULL, 'julius.gulay@lspu.edu.ph', '134', 'Del Remedio St.', 'Del Remedio', 'San Pablo', 'Laguna', NULL, 'Male', NULL, NULL, NULL, NULL, '2022-06-01', 'Active', 'BSIT', 'WMAD'),
(13, '0424-0012', 'Gundayao', 'Paul Jonathan', 'Gumandoy', '', '2004-11-20', NULL, NULL, '09171234579', NULL, 'paul.gundayao@lspu.edu.ph', '135', 'Bubukal St.', 'Bubukal', 'Sta Cruz', 'Laguna', NULL, 'Male', NULL, NULL, NULL, NULL, '2022-06-01', 'Active', 'BSIT', 'WMAD'),
(14, '0424-0013', 'Hernandez', 'Jose Rafael', 'Anda', '', '2004-12-02', NULL, NULL, '09171234580', NULL, 'jose.hernandez@lspu.edu.ph', '136', 'Malinta St.', 'Malinta', 'Los Banos', 'Laguna', NULL, 'Male', NULL, NULL, NULL, NULL, '2022-06-01', 'Active', 'BSIT', 'WMAD'),
(15, '0424-0014', 'Jaraplasan', 'Michael', 'Senarosa', '', '2004-12-15', NULL, NULL, '09171234581', NULL, 'michael.jaraplasan@lspu.edu.ph', '137', 'Del Remedio St.', 'Del Remedio', 'San Pablo', 'Laguna', NULL, 'Male', NULL, NULL, NULL, NULL, '2022-06-01', 'Active', 'BSIT', 'WMAD'),
(16, '0424-0015', 'Laforteza', 'Gife Diether Paul', 'Galan', '', '2005-01-05', NULL, NULL, '09171234582', NULL, 'gife.laforteza@lspu.edu.ph', '138', 'Bubukal St.', 'Bubukal', 'Sta Cruz', 'Laguna', NULL, 'Male', NULL, NULL, NULL, NULL, '2022-06-01', 'Active', 'BSIT', 'AMG'),
(17, '0424-0016', 'Lapie', 'Joshua', 'Ayala', '', '2005-01-18', NULL, NULL, '09171234583', NULL, 'joshua.lapie@lspu.edu.ph', '139', 'Malinta St.', 'Malinta', 'Los Banos', 'Laguna', NULL, 'Male', NULL, NULL, NULL, NULL, '2022-06-01', 'Active', 'BSIT', 'AMG'),
(18, '0424-0017', 'Lasala', 'Mark Zyron', 'Tandang', '', '2005-02-02', NULL, NULL, '09171234584', NULL, 'mark.lasala@lspu.edu.ph', '140', 'Del Remedio St.', 'Del Remedio', 'San Pablo', 'Laguna', NULL, 'Male', NULL, NULL, NULL, NULL, '2022-06-01', 'Active', 'BSIT', 'AMG'),
(19, '0424-0018', 'Lat', 'Vaungh Louie', 'Andrey Perez', '', '2005-02-15', NULL, NULL, '09171234585', NULL, 'vaungh.lat@lspu.edu.ph', '141', 'Bubukal St.', 'Bubukal', 'Sta Cruz', 'Laguna', NULL, 'Male', NULL, NULL, NULL, NULL, '2022-06-01', 'Active', 'BSIT', 'AMG'),
(20, '0424-0019', 'Magbanua', 'Alejandro', 'Boro', '', '2005-03-05', NULL, NULL, '09171234586', NULL, 'alejandro.magbanua@lspu.edu.ph', '142', 'Malinta St.', 'Malinta', 'Los Banos', 'Laguna', NULL, 'Male', NULL, NULL, NULL, NULL, '2022-06-01', 'Active', 'BSIT', 'AMG'),
(21, '0424-0020', 'Melchor', 'Justinmark', 'Adonis', '', '2005-03-18', NULL, NULL, '09171234587', NULL, 'justinmelchor@lspu.edu.ph', '143', 'Del Remedio St.', 'Del Remedio', 'San Pablo', 'Laguna', NULL, 'Male', NULL, NULL, NULL, NULL, '2022-06-01', 'Active', 'BSIT', 'SMP'),
(22, '0424-0021', 'Nunez', 'Charles', 'Banasihan', '', '2005-04-01', NULL, NULL, '09171234588', NULL, 'charles.nunez@lspu.edu.ph', '144', 'Bubukal St.', 'Bubukal', 'Sta Cruz', 'Laguna', NULL, 'Male', NULL, NULL, NULL, NULL, '2022-06-01', 'Active', 'BSIT', 'SMP'),
(23, '0424-0022', 'Padilla', 'Adrian', 'Flores', '', '2005-04-12', NULL, NULL, '09171234589', NULL, 'adrian.padilla@lspu.edu.ph', '145', 'Malinta St.', 'Malinta', 'Los Banos', 'Laguna', NULL, 'Male', NULL, NULL, NULL, NULL, '2022-06-01', 'Active', 'BSIT', 'SMP'),
(24, '0424-0023', 'Pamulaklakin', 'Zorine', 'Diaz', '', '2005-05-05', NULL, NULL, '09171234590', NULL, 'zorine.pamulaklakin@lspu.edu.ph', '146', 'Del Remedio St.', 'Del Remedio', 'San Pablo', 'Laguna', NULL, 'Female', NULL, NULL, NULL, NULL, '2022-06-01', 'Active', 'BSIT', 'SMP'),
(25, '0424-0024', 'Reboton', 'Justin Adrian', 'Policarpio', '', '2005-05-18', NULL, NULL, '09171234591', NULL, 'justin.reboton@lspu.edu.ph', '147', 'Bubukal St.', 'Bubukal', 'Sta Cruz', 'Laguna', NULL, 'Male', NULL, NULL, NULL, NULL, '2022-06-01', 'Active', 'BSIT', 'SMP'),
(26, '0424-0025', 'Salen', 'Vic John', 'Oboza', '', '2005-06-01', NULL, NULL, '09171234592', NULL, 'vic.salen@lspu.edu.ph', '148', 'Malinta St.', 'Malinta', 'Los Banos', 'Laguna', NULL, 'Male', NULL, NULL, NULL, NULL, '2022-06-01', 'Active', 'BSIT', 'WMAD'),
(27, '0424-0026', 'Seguera', 'Rosalie', 'Barbosa', '', '2005-06-15', NULL, NULL, '09171234593', NULL, 'rosalie.seguera@lspu.edu.ph', '149', 'Del Remedio St.', 'Del Remedio', 'San Pablo', 'Laguna', NULL, 'Female', NULL, NULL, NULL, NULL, '2022-06-01', 'Active', 'BSIT', 'WMAD');

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_applicant_summary`  AS SELECT `a`.`student_id` AS `student_id`, concat(`a`.`First_Name`,' ',ifnull(concat(`a`.`Middle_Name`,' '),''),`a`.`Last_Name`,ifnull(concat(' ',`a`.`Suffix`),'')) AS `full_name`, `a`.`Email` AS `Email`, `a`.`application_status` AS `application_status`, `a`.`Sex` AS `Sex`, `a`.`Birthday` AS `Birthday`, `a`.`Contact_Number` AS `Contact_Number`, concat_ws(', ',`a`.`Barangay`,`a`.`Municipality`,`a`.`Province`) AS `full_address`, `ai`.`campus` AS `campus`, `ai`.`student_type` AS `student_type`, `ai`.`year_level` AS `year_level`, `ai`.`admission_type` AS `admission_type`, `ic`.`Program_Code` AS `Program_Code`, `p`.`Program_Name` AS `Program_Name`, `ic`.`Specialization` AS `Specialization`, `a`.`created_at` AS `created_at` FROM (((`applicants` `a` left join `admission_info` `ai` on(`ai`.`student_id` = `a`.`student_id`)) left join `intended_course` `ic` on(`ic`.`student_id` = `a`.`student_id`)) left join `programs` `p` on(`p`.`Program_Code` = `ic`.`Program_Code`)) ;

--
-- Indexes for dumped tables
--

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
  ADD PRIMARY KEY (`Program_Code`);

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
  ADD KEY `students_program_fk` (`Program_Code`),
  ADD KEY `students_special_fk` (`Specialization`);

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
-- AUTO_INCREMENT for table `admission_info`
--
ALTER TABLE `admission_info`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `applicants`
--
ALTER TABLE `applicants`
  MODIFY `student_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `enrolled_subjects`
--
ALTER TABLE `enrolled_subjects`
  MODIFY `enrolled_subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `enrollment`
--
ALTER TABLE `enrollment`
  MODIFY `enrollment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `family_info`
--
ALTER TABLE `family_info`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `instructors`
--
ALTER TABLE `instructors`
  MODIFY `Instructor_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `intended_course`
--
ALTER TABLE `intended_course`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `receipt`
--
ALTER TABLE `receipt`
  MODIFY `receipt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

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
  MODIFY `Student_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

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
-- Constraints for table `specializations`
--
ALTER TABLE `specializations`
  ADD CONSTRAINT `fk_spec_program` FOREIGN KEY (`Program_Code`) REFERENCES `programs` (`Program_Code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`College_Id`) REFERENCES `colleges` (`college_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
