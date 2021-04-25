-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2021 at 08:04 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.0.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perdis`
--

-- --------------------------------------------------------

--
-- Table structure for table `jenis_perjalanan`
--

CREATE TABLE `jenis_perjalanan` (
  `idjenis` int(10) NOT NULL,
  `uraian` text,
  `ket` enum('dalamkota','biasa','meetingdalamkota','meetingluarkota') DEFAULT NULL,
  `info` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_perjalanan`
--

INSERT INTO `jenis_perjalanan` (`idjenis`, `uraian`, `ket`, `info`) VALUES
(1, 'Perjalanan dinas dalam kota', 'dalamkota', ''),
(2, 'Perjalanan dinas paket meeting dalam kota', 'meetingdalamkota', ''),
(3, 'Perjalanan dinas biasa', 'biasa', ''),
(4, 'Perjalanan dinas paket meeting luar kota', 'meetingluarkota', '');

-- --------------------------------------------------------

--
-- Table structure for table `repres`
--

CREATE TABLE `repres` (
  `idrepres` int(10) NOT NULL,
  `lokasi` enum('dalamprovinsi','luar provinsi') DEFAULT NULL,
  `jumlah` char(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tingkatan`
--

CREATE TABLE `tingkatan` (
  `idtingkatan` int(10) NOT NULL,
  `tingkatan` char(2) DEFAULT NULL,
  `uraian` text NOT NULL,
  `ket` enum('kdh_wkdh','pejabat_daerah','eselon2','eselon3','eselon4','noneselon','nonpns') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tingkatan`
--

INSERT INTO `tingkatan` (`idtingkatan`, `tingkatan`, `uraian`, `ket`) VALUES
(1, 'A', 'Kepala Daerah Atau Wakil Kepala Daerah', 'kdh_wkdh'),
(2, 'B', 'Pejabat Daerah', 'pejabat_daerah'),
(3, 'C', 'Eselon II', 'eselon2'),
(4, 'D', 'Eselon III', 'eselon3'),
(5, 'E', 'Eselon IV', 'eselon4'),
(6, 'F', 'Non Eselon', 'noneselon'),
(7, 'G', 'Non PNS', 'nonpns');

-- --------------------------------------------------------

--
-- Table structure for table `tranposrt_dalam_provinsi`
--

CREATE TABLE `tranposrt_dalam_provinsi` (
  `idtransport` int(10) NOT NULL,
  `idjenis` int(10) DEFAULT NULL,
  `ke` char(50) DEFAULT NULL,
  `jumlah` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uang_harian_dalam_provinsi`
--

CREATE TABLE `uang_harian_dalam_provinsi` (
  `iduangharian` int(10) NOT NULL,
  `idjenis` int(10) DEFAULT NULL,
  `fullboard` enum('Y','N') DEFAULT NULL,
  `jumlah` char(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jenis_perjalanan`
--
ALTER TABLE `jenis_perjalanan`
  ADD PRIMARY KEY (`idjenis`);

--
-- Indexes for table `repres`
--
ALTER TABLE `repres`
  ADD PRIMARY KEY (`idrepres`);

--
-- Indexes for table `tingkatan`
--
ALTER TABLE `tingkatan`
  ADD PRIMARY KEY (`idtingkatan`);

--
-- Indexes for table `tranposrt_dalam_provinsi`
--
ALTER TABLE `tranposrt_dalam_provinsi`
  ADD PRIMARY KEY (`idtransport`);

--
-- Indexes for table `uang_harian_dalam_provinsi`
--
ALTER TABLE `uang_harian_dalam_provinsi`
  ADD PRIMARY KEY (`iduangharian`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jenis_perjalanan`
--
ALTER TABLE `jenis_perjalanan`
  MODIFY `idjenis` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `repres`
--
ALTER TABLE `repres`
  MODIFY `idrepres` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tingkatan`
--
ALTER TABLE `tingkatan`
  MODIFY `idtingkatan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tranposrt_dalam_provinsi`
--
ALTER TABLE `tranposrt_dalam_provinsi`
  MODIFY `idtransport` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uang_harian_dalam_provinsi`
--
ALTER TABLE `uang_harian_dalam_provinsi`
  MODIFY `iduangharian` int(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
