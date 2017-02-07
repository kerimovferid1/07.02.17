-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2017 at 09:44 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `turizm`
--

-- --------------------------------------------------------

--
-- Table structure for table `isci`
--

CREATE TABLE `isci` (
  `id` int(11) NOT NULL,
  `adi` varchar(20) DEFAULT NULL,
  `soyadi` varchar(20) DEFAULT NULL,
  `nomresi` int(30) DEFAULT NULL,
  `vezifesi` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `isci_musteri`
--

CREATE TABLE `isci_musteri` (
  `id` int(11) NOT NULL,
  `musteri_id` int(11) DEFAULT NULL,
  `isci_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `musteri`
--

CREATE TABLE `musteri` (
  `id` int(11) NOT NULL,
  `tur_id` int(11) DEFAULT NULL,
  `aldigi_turlar` varchar(20) DEFAULT NULL,
  `adi` varchar(20) DEFAULT NULL,
  `soyadi` varchar(20) DEFAULT NULL,
  `nomresi` int(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sifaris`
--

CREATE TABLE `sifaris` (
  `id` int(11) NOT NULL,
  `sifaris_geliri` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tur`
--

CREATE TABLE `tur` (
  `id` int(11) NOT NULL,
  `tur_novu` varchar(20) DEFAULT NULL,
  `tur_vaxti` date DEFAULT NULL,
  `sifaris_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `isci`
--
ALTER TABLE `isci`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `isci_musteri`
--
ALTER TABLE `isci_musteri`
  ADD PRIMARY KEY (`id`),
  ADD KEY `musteri_id` (`musteri_id`),
  ADD KEY `isci_id` (`isci_id`);

--
-- Indexes for table `musteri`
--
ALTER TABLE `musteri`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tur_id` (`tur_id`);

--
-- Indexes for table `sifaris`
--
ALTER TABLE `sifaris`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tur`
--
ALTER TABLE `tur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sifaris_id` (`sifaris_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `isci`
--
ALTER TABLE `isci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `isci_musteri`
--
ALTER TABLE `isci_musteri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `musteri`
--
ALTER TABLE `musteri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sifaris`
--
ALTER TABLE `sifaris`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tur`
--
ALTER TABLE `tur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `isci_musteri`
--
ALTER TABLE `isci_musteri`
  ADD CONSTRAINT `isci_musteri_ibfk_1` FOREIGN KEY (`musteri_id`) REFERENCES `musteri` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `isci_musteri_ibfk_2` FOREIGN KEY (`isci_id`) REFERENCES `isci` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `musteri`
--
ALTER TABLE `musteri`
  ADD CONSTRAINT `musteri_ibfk_1` FOREIGN KEY (`tur_id`) REFERENCES `tur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tur`
--
ALTER TABLE `tur`
  ADD CONSTRAINT `tur_ibfk_1` FOREIGN KEY (`sifaris_id`) REFERENCES `sifaris` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
