-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2019 at 05:15 AM
-- Server version: 5.6.26
-- PHP Version: 5.5.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `final_ptoject`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE IF NOT EXISTS `bills` (
  `B_ID` int(11) NOT NULL,
  `Cu_ID` int(11) DEFAULT NULL,
  `Order_ID` int(11) DEFAULT NULL,
  `Item_ID` int(11) DEFAULT NULL,
  `Cas_ID` int(11) DEFAULT NULL,
  `Date` date NOT NULL,
  `time` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cashier`
--

CREATE TABLE IF NOT EXISTS `cashier` (
  `Cas_ID` int(11) NOT NULL,
  `Cas_name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contains`
--

CREATE TABLE IF NOT EXISTS `contains` (
  `B_ID` int(11) DEFAULT NULL,
  `Order_ID` int(11) DEFAULT NULL,
  `Item_ID` int(11) DEFAULT NULL,
  `Time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `Cu_ID` int(11) NOT NULL,
  `Cu_Name` varchar(60) NOT NULL,
  `Cu_phoneno` double NOT NULL,
  `Cu_address` varchar(60) DEFAULT NULL,
  `M_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `Item_ID` int(11) NOT NULL,
  `Item_Name` varchar(60) DEFAULT NULL,
  `Item_Price` int(11) DEFAULT NULL,
  `M_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE IF NOT EXISTS `manager` (
  `M_ID` int(11) NOT NULL,
  `Name` varchar(60) DEFAULT NULL,
  `phoneno` double DEFAULT NULL,
  `Restaurant_N` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `Order_ID` int(11) NOT NULL,
  `Item_ID` int(11) DEFAULT NULL,
  `Cu_ID` int(11) DEFAULT NULL,
  `Quantity` int(11) NOT NULL,
  `Date` date NOT NULL,
  `time` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`B_ID`),
  ADD KEY `Cu_ID` (`Cu_ID`),
  ADD KEY `Order_ID` (`Order_ID`),
  ADD KEY `Item_ID` (`Item_ID`),
  ADD KEY `Cas_ID` (`Cas_ID`);

--
-- Indexes for table `cashier`
--
ALTER TABLE `cashier`
  ADD PRIMARY KEY (`Cas_ID`);

--
-- Indexes for table `contains`
--
ALTER TABLE `contains`
  ADD KEY `B_ID` (`B_ID`),
  ADD KEY `Order_ID` (`Order_ID`),
  ADD KEY `Item_ID` (`Item_ID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`Cu_ID`),
  ADD KEY `M_ID` (`M_ID`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`Item_ID`),
  ADD KEY `M_ID` (`M_ID`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`M_ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Order_ID`),
  ADD KEY `Item_ID` (`Item_ID`),
  ADD KEY `Cu_ID` (`Cu_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`Cu_ID`) REFERENCES `customers` (`Cu_ID`),
  ADD CONSTRAINT `bills_ibfk_2` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`),
  ADD CONSTRAINT `bills_ibfk_3` FOREIGN KEY (`Item_ID`) REFERENCES `items` (`Item_ID`),
  ADD CONSTRAINT `bills_ibfk_4` FOREIGN KEY (`Cas_ID`) REFERENCES `cashier` (`Cas_ID`);

--
-- Constraints for table `contains`
--
ALTER TABLE `contains`
  ADD CONSTRAINT `contains_ibfk_1` FOREIGN KEY (`B_ID`) REFERENCES `bills` (`B_ID`),
  ADD CONSTRAINT `contains_ibfk_2` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`),
  ADD CONSTRAINT `contains_ibfk_3` FOREIGN KEY (`Item_ID`) REFERENCES `items` (`Item_ID`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`M_ID`) REFERENCES `manager` (`M_ID`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`M_ID`) REFERENCES `manager` (`M_ID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Item_ID`) REFERENCES `items` (`Item_ID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`Cu_ID`) REFERENCES `customers` (`Cu_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
