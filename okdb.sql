-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2024 at 02:19 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `okdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `dishes`
--

CREATE TABLE `dishes` (
  `dish_name` varchar(50) NOT NULL,
  `image_url` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` enum('available','sold out') NOT NULL,
  `seller` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dishes`
--

INSERT INTO `dishes` (`dish_name`, `image_url`, `price`, `status`, `seller`) VALUES
('Laing', '../static/img/dishes/laing.jpg', 20.00, 'available', '5J\'s Eatery'),
('Pork Adobo', '../static/img/dishes/pork adobo.jpg', 50.00, 'available', '5J\'s Eatery'),
('Lumpiang Shanghai', '../static/img/dishes/lumpiang shanghai.jpg', 5.00, 'available', '5J\'s Eatery'),
('Pinakbet', '../static/img/dishes/pakbet.jpg', 30.00, 'available', '5J\'s Eatery'),
('Log-log with Egg', '../static/img/dishes/log-log with egg 2.jpg', 20.00, 'available', 'BGC D\'fort'),
('Bopis', '../static/img/dishes/bopis.jpg', 40.00, 'available', 'BGC D\'fort'),
('Pork with Cucumbers', '../static/img/dishes/pork with cucumber.jpg', 40.00, 'available', 'BGC D\'fort'),
('Pork Steak', '../static/img/dishes/pork steak.jpg', 40.00, 'available', 'BGC D\'fort'),
('Pinakbet', '../static/img/dishes/pakbet 2.jpg', 40.00, 'available', 'Eutopia Food Gallery'),
('Pork Adobo', '../static/img/dishes/pork adobo 2.jpg', 50.00, 'available', 'Eutopia Food Gallery'),
('Bicol Express', '../static/img/dishes/bicol express.jpg', 60.00, 'available', 'Eutopia Food Gallery'),
('Menudo', '../static/img/dishes/menudo.jpg', 50.00, 'available', 'Eutopia Food Gallery'),
('Log-log with Egg', '../static/img/dishes/log-log with egg.jpg', 20.00, 'available', 'Ate Ning\'s Eatery'),
('Lumpiang Toge', '../static/img/dishes/lumpiang toge.jpg', 5.00, 'available', 'Ate Ning\'s Eatery'),
('Pork Adobo', '../static/img/dishes/pork adobo 3.jpg', 40.00, 'available', 'Ate Ning\'s Eatery'),
('Pritong Isda', '../static/img/dishes/pritong isda.jpg', 15.00, 'available', 'Ate Ning\'s Eatery'),
('Ginisang Sitaw', '../static/img/dishes/ginisang sitaw 2.jpg', 30.00, 'available', 'Nanay\'s Eatery'),
('Lumpiang Shanghai', '../static/img/dishes/lumpiang shanghai 2.jpg', 5.00, 'available', 'Nanay\'s Eatery'),
('Ginataang Kalabasa', '../static/img/dishes/kalabasa with sitaw.jpg', 30.00, 'available', 'Nanay\'s Eatery'),
('Tortang Talong', '../static/img/dishes/tortang talong.jpg', 25.00, 'available', 'Nanay\'s Eatery'),
('Pork with Cucumber', '../static/img/dishes/pork with cucumber.jpg', 60.00, 'available', 'Food Hub'),
('Beef Tapa with Egg', '../static/img/dishes/beef tapa with egg.jpg', 60.00, 'available', 'Food Hub'),
('Pansit Gisado', '../static/img/dishes/pansit gisado.jpg', 40.00, 'available', 'Food Hub'),
('Special Fried Rice', '../static/img/dishes/fried rice.jpg', 40.00, 'available', 'Food Hub');

-- --------------------------------------------------------

--
-- Table structure for table `eateries`
--

CREATE TABLE `eateries` (
  `name` varchar(50) NOT NULL,
  `latitude` decimal(20,15) NOT NULL,
  `longitude` decimal(20,15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `eateries`
--

INSERT INTO `eateries` (`name`, `latitude`, `longitude`) VALUES
('5J\'s Eatery', 13.406912811410475, 123.376586869763590),
('Ate Ning\'s Eatery', 13.407012811410475, 123.376284948213470),
('BGC D\'fort', 13.405137165026387, 123.373414131644710),
('Eutopia Food Gallery', 13.405245577764724, 123.373395426886350),
('Food Hub', 13.407535344336280, 123.376147756607920),
('Nanay\'s Eatery', 13.407236485718819, 123.376163214817620);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(11) NOT NULL,
  `role` enum('customer','seller') NOT NULL,
  `subscription_type` enum('free','premium') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`first_name`, `middle_name`, `last_name`, `email`, `password`, `phone_number`, `role`, `subscription_type`) VALUES
('Jayp', 'Surara', 'Bazar', 'jabazar@my.cspc.edu.ph', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', '09454523496', 'customer', 'premium'),
('Jayp', 'Surara', 'Bazar', 'jaypbazar@gmail.com', 'b03ddf3ca2e714a6548e7495e2a03f5e824eaac9837cd7f159c67b90fb4b7342', '09636743730', 'customer', 'free');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dishes`
--
ALTER TABLE `dishes`
  ADD KEY `dishes_ibfk_1` (`seller`);

--
-- Indexes for table `eateries`
--
ALTER TABLE `eateries`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dishes`
--
ALTER TABLE `dishes`
  ADD CONSTRAINT `dishes_ibfk_1` FOREIGN KEY (`seller`) REFERENCES `eateries` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
