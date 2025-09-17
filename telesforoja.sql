-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 17, 2025 at 02:35 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `telesforoja`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookstable`
--

DROP TABLE IF EXISTS `bookstable`;
CREATE TABLE IF NOT EXISTS `bookstable` (
  `bookID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) NOT NULL,
  `Author` varchar(50) NOT NULL,
  `Category` varchar(50) NOT NULL,
  `PublishYear` date NOT NULL,
  PRIMARY KEY (`bookID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bookstable`
--

INSERT INTO `bookstable` (`bookID`, `Title`, `Author`, `Category`, `PublishYear`) VALUES
(1, 'The Wildfire', 'Fullo', 'Romance', '0000-00-00'),
(2, 'Seducing Drake', 'Barrido', 'Romance', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `borrowtable`
--

DROP TABLE IF EXISTS `borrowtable`;
CREATE TABLE IF NOT EXISTS `borrowtable` (
  `borrowID` int NOT NULL,
  `bookID` int NOT NULL,
  `memberID` int NOT NULL,
  `StaffID` int NOT NULL,
  `borrowDate` date NOT NULL,
  PRIMARY KEY (`bookID`,`memberID`,`StaffID`),
  UNIQUE KEY `bookID` (`bookID`),
  UNIQUE KEY `memberID` (`memberID`,`StaffID`),
  KEY `StaffID` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `borrowtable`
--

INSERT INTO `borrowtable` (`borrowID`, `bookID`, `memberID`, `StaffID`, `borrowDate`) VALUES
(1112, 1, 3335, 2223, '2025-09-17'),
(1113, 2, 3336, 2224, '2026-09-18');

-- --------------------------------------------------------

--
-- Table structure for table `memberstable`
--

DROP TABLE IF EXISTS `memberstable`;
CREATE TABLE IF NOT EXISTS `memberstable` (
  `memberID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `Mobile` int NOT NULL,
  `Address` varchar(50) NOT NULL,
  PRIMARY KEY (`memberID`),
  UNIQUE KEY `memberID` (`memberID`)
) ENGINE=InnoDB AUTO_INCREMENT=3337 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `memberstable`
--

INSERT INTO `memberstable` (`memberID`, `Name`, `email`, `Mobile`, `Address`) VALUES
(3335, 'Icyll Cordero', 'cordero@gmail.com', 2147483647, 'Passi City'),
(3336, 'Riza Mae Sicang', 'Sicang@gmail.com', 2147483647, 'Dumarao City');

-- --------------------------------------------------------

--
-- Table structure for table `stafftable`
--

DROP TABLE IF EXISTS `stafftable`;
CREATE TABLE IF NOT EXISTS `stafftable` (
  `StaffID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Position` varchar(50) NOT NULL,
  `Email` int NOT NULL,
  `Password` int NOT NULL,
  PRIMARY KEY (`StaffID`),
  UNIQUE KEY `StaffID` (`StaffID`)
) ENGINE=InnoDB AUTO_INCREMENT=2225 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `stafftable`
--

INSERT INTO `stafftable` (`StaffID`, `Name`, `Position`, `Email`, `Password`) VALUES
(2223, 'Samgy Tan', 'Manager', 0, 0),
(2224, 'Nicole Amara', 'Sales', 0, 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrowtable`
--
ALTER TABLE `borrowtable`
  ADD CONSTRAINT `borrowtable_ibfk_1` FOREIGN KEY (`bookID`) REFERENCES `bookstable` (`bookID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `borrowtable_ibfk_2` FOREIGN KEY (`memberID`) REFERENCES `memberstable` (`memberID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `borrowtable_ibfk_3` FOREIGN KEY (`StaffID`) REFERENCES `stafftable` (`StaffID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `stafftable`
--
ALTER TABLE `stafftable`
  ADD CONSTRAINT `stafftable_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `stafftable` (`StaffID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
