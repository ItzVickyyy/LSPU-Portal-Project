-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2026 at 04:59 PM
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
(1, 2, 'Los Banos Campus', 'College', '1st Year', 'Senior HS Graduate', '2026-05-04 22:01:08', '2026-05-04 22:01:08'),
(2, 3, 'Los Banos Campus', 'College', '2nd Year', 'Senior HS Graduate', '2026-05-04 22:13:22', '2026-05-04 22:13:22');

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
(1, 'juan.delacruz@example.com', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 'Draft', 'Juan', NULL, 'Dela Cruz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-04 21:35:01', '2026-05-04 21:35:01'),
(2, 'johnsalen13@gmail.com', '$2y$10$aDsp3PIT9b85PNYougD5U.Fvn9UtvCWns9O9K2cE/rH761bHDFro2', 'Enrolled', 'Vic', 'John', 'Salen', 'Jr.', '2005-10-13', 'Bay Laguna', 'Filipino', 'Male', 'Single', NULL, NULL, 'No', '09918833309', NULL, '12782', 'J. Aquino', 'Mayondon', 'Los Baños', 'Laguna', '4030', '2026-05-04 22:00:06', '2026-05-04 22:50:47'),
(3, 'johnsalen132005@gmail.com', '$2y$10$m5.70njPe5YlxzMNNS69huY8e5k.Qd8Q2wMP4ed.zyPwTsWmIIQYG', 'Pending', 'Jen', NULL, 'Oboza', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-04 22:13:06', '2026-05-04 22:13:06');

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
  `track_strand` varchar(60) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `Program_Code` varchar(20) NOT NULL,
  `Program_Name` varchar(120) NOT NULL,
  `College` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`Program_Code`, `Program_Name`, `College`) VALUES
('BEED', 'Bachelor of Elementary Education', 'College of Teacher Education'),
('BSA', 'BS Accountancy', 'College of Business Administration and Accountancy'),
('BSAFBM', 'BS Agri-Fisheries Business Management', 'College of Fisheries'),
('BSBA', 'BS Business Administration', 'College of Business Administration and Accountancy'),
('BSC', 'BS Criminology', 'College of Criminal Justice Education'),
('BSCS', 'BS Computer Science', 'College of Computer Studies'),
('BSED', 'Bachelor of Secondary Education', 'College of Teacher Education'),
('BSF', 'BS Fisheries', 'College of Fisheries'),
('BSFE', 'BS Fishery Education', 'College of Fisheries'),
('BSFT', 'BS Food Technology', 'College of Food Nutrition and Dietetics'),
('BSHRM', 'BS Hotel and Restaurant Management', 'College of International Hospitality and Tourism Management'),
('BSIT', 'BS Information Technology', 'College of Computer Studies'),
('BSND', 'BS Nutrition and Dietetics', 'College of Food Nutrition and Dietetics'),
('BSP', 'BS Psychology', 'College of Arts and Science'),
('BST', 'BS Tourism', 'College of International Hospitality and Tourism Management');

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
-- Indexes for table `educational_background`
--
ALTER TABLE `educational_background`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_student` (`student_id`);

--
-- Indexes for table `family_info`
--
ALTER TABLE `family_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_student` (`student_id`);

--
-- Indexes for table `intended_course`
--
ALTER TABLE `intended_course`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_student` (`student_id`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`Program_Code`);

--
-- Indexes for table `specializations`
--
ALTER TABLE `specializations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_spec` (`Program_Code`,`spec_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admission_info`
--
ALTER TABLE `admission_info`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `applicants`
--
ALTER TABLE `applicants`
  MODIFY `student_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `educational_background`
--
ALTER TABLE `educational_background`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `family_info`
--
ALTER TABLE `family_info`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `intended_course`
--
ALTER TABLE `intended_course`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `specializations`
--
ALTER TABLE `specializations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
-- Constraints for table `intended_course`
--
ALTER TABLE `intended_course`
  ADD CONSTRAINT `fk_course_student` FOREIGN KEY (`student_id`) REFERENCES `applicants` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `specializations`
--
ALTER TABLE `specializations`
  ADD CONSTRAINT `fk_spec_program` FOREIGN KEY (`Program_Code`) REFERENCES `programs` (`Program_Code`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
