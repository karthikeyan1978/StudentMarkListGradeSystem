-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 01, 2017 at 09:41 AM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `studentmark`
--
CREATE DATABASE `studentmark` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `studentmark`;

-- --------------------------------------------------------

--
-- Table structure for table `admindetails`
--

CREATE TABLE IF NOT EXISTS `admindetails` (
  `Admin_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Admin_Name` varchar(356) NOT NULL,
  `Admin_Email` varchar(256) NOT NULL,
  `Admin_Phone` bigint(12) NOT NULL,
  `Admin_Username` varchar(256) NOT NULL,
  `Admin_Password` varchar(256) NOT NULL,
  PRIMARY KEY (`Admin_Id`),
  KEY `Admin_Name` (`Admin_Name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1001 ;

--
-- Dumping data for table `admindetails`
--

INSERT INTO `admindetails` (`Admin_Id`, `Admin_Name`, `Admin_Email`, `Admin_Phone`, `Admin_Username`, `Admin_Password`) VALUES
(1000, 'kiruba', 'kirubakarans2009@gmail.com', 9043963074, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `Student_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(11) NOT NULL,
  `English` int(11) NOT NULL,
  `Maths` int(11) NOT NULL,
  `Tamil` int(11) NOT NULL,
  `Science` int(11) NOT NULL,
  `Moral` int(11) NOT NULL,
  `RecordedDate` date NOT NULL,
  PRIMARY KEY (`Student_ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Student_ID`, `Name`, `English`, `Maths`, `Tamil`, `Science`, `Moral`, `RecordedDate`) VALUES
(1, 'kiruba', 50, 60, 70, 80, 90, '2017-08-01'),
(2, 'kathi', 50, 34, 70, 80, 56, '2017-08-01');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
