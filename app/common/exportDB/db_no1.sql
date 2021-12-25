-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2021 at 04:28 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+07:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_no1`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) NOT NULL,
  `login_id` varchar(20) NOT NULL,
  `password` varchar(64) NOT NULL,
  `actived_flag` int(1) NOT NULL DEFAULT 1,
  `reset_password_token` varchar(100) NOT NULL,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `login_id`, `password`, `actived_flag`, `reset_password_token`, `updated`, `created`) VALUES
(1, 'admin', md5('admin'), 1, md5(CURRENT_TIMESTAMP()), CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());

-- --------------------------------------------------------

--
-- Table structure for table `classrooms`
--

CREATE TABLE `classrooms` (
  `id` int(10) NOT NULL,
  `name` varchar(250) NOT NULL,
  `avatar` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `building` char(10) NOT NULL,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `classrooms`
--

INSERT INTO `classrooms` (`id`, `name`, `avatar`, `description`, `building`, `updated`, `created`) VALUES
(1, 'Laboratory', 'non_available.jpg', 'Phong thi nghiem', 'T4', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` int(10) NOT NULL,
  `name` varchar(250) NOT NULL,
  `avatar` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `name`, `avatar`, `description`, `updated`, `created`) VALUES
(1, 'Projector', 'non_available.jpg', 'May chieu ky thuat so', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
(2, 'Air Conditioner', 'non_available.jpg', 'May dieu hoa khong khi', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
(3, 'Collider', 'non_available.jpg', 'May gia toc hat', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());

-- --------------------------------------------------------

--
-- Table structure for table `device_transactions`
--

CREATE TABLE `device_transactions` (
  `id` int(10) NOT NULL,
  `device_id` int(10) NOT NULL,
  `teacher_id` int(10) NOT NULL,
  `classroom_id` int(10) NOT NULL,
  `comment` text NOT NULL,
  `start_transaction_plan` datetime NOT NULL,
  `end_transaction_plan` datetime NOT NULL,
  `returned_date` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `device_transactions`
--

INSERT INTO `device_transactions` (`id`, `device_id`, `teacher_id`, `classroom_id`, `comment`, `start_transaction_plan`, `end_transaction_plan`, `returned_date`, `updated`, `created`) VALUES
(1, 1, 1, 1, '', '2021-12-15 23:21:04', '2021-12-31 23:21:04', '2021-12-30 23:21:04', '2021-12-15 23:21:04', '2021-12-15 23:21:04'),
(2, 3, 1, 1, '', '2021-12-15 23:24:30', '2021-12-31 23:24:30', '2021-12-30 23:24:30', '2021-12-15 23:24:30', '2021-12-15 23:24:30'),
(3, 3, 1, 1, '', '2021-12-16 23:26:38', '2022-01-04 23:26:38', '2022-01-01 23:26:38', '2021-12-15 23:26:38', '2021-12-15 23:26:38'),
(4, 2, 1, 1, '', '2021-12-15 23:31:37', '2021-12-18 23:31:37', '2021-12-17 23:31:37', '2021-12-15 23:31:37', '2021-12-15 23:31:37'),
(5, 1, 1, 1, '', '2021-12-16 23:32:16', '2021-12-19 23:32:16', '2021-12-18 23:32:16', '2021-12-15 23:32:16', '2021-12-15 23:32:16'),
(6, 2, 1, 1, '', '2021-12-16 23:34:24', '2021-12-23 23:34:24', '2021-12-22 23:34:24', '2021-12-15 23:34:24', '2021-12-15 23:34:24');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(10) NOT NULL,
  `name` varchar(250) NOT NULL,
  `avatar` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `specialized` char(10) NOT NULL,
  `degree` char(10) NOT NULL,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `avatar`, `description`, `specialized`, `degree`, `updated`, `created`) VALUES
(1, 'Luu Van Doanh', 'hotboycodon.jpg', 'dancer, singer, composer, star, the 8th member of BTS', 'Web-dev', 'Professor', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login_id` (`login_id`);

--
-- Indexes for table `classrooms`
--
ALTER TABLE `classrooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `device_transactions`
--
ALTER TABLE `device_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `device_id` (`device_id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `classroom_id` (`classroom_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `classrooms`
--
ALTER TABLE `classrooms`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `device_transactions`
--
ALTER TABLE `device_transactions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `device_transactions`
--
ALTER TABLE `device_transactions`
  ADD CONSTRAINT `device_transactions_ibfk_1` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`id`),
  ADD CONSTRAINT `device_transactions_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`),
  ADD CONSTRAINT `device_transactions_ibfk_3` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
