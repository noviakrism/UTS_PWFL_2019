-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2019 at 08:44 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kuliah`
--

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` varchar(10) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `no_hp_lama` varchar(14) NOT NULL,
  `no_hp_baru` varchar(14) NOT NULL,
  `tgl_diubah` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `nim`, `no_hp_lama`, `no_hp_baru`, `tgl_diubah`) VALUES
('', '161240000510', '089560123456', '089560123450', '2019-10-29');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` varchar(20) NOT NULL,
  `nama_mahasiswa` varchar(100) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `jk` varchar(2) DEFAULT NULL,
  `no_hp` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama_mahasiswa`, `alamat`, `jk`, `no_hp`) VALUES
('161240000482', 'Ahmad Feri Setyawan', 'SukosoNO RT 28/RW 7, Kedung, Jepara', 'L', '0852256789008'),
('161240000509', 'Septiar Robert Islah', 'Mambak RT 003/RW 003, Pakis Aji, Jepara', 'L', '082225678908'),
('161240000510', 'M Yusril Rosadi', 'Tahunan, Jepara', 'L', '089560123450'),
('161240000511', 'Novia Kris Mulyani', 'Dermolo RT 004/RW 002, Kembang, Jepara', 'P', '0895603611731'),
('161240000523', 'Ananda Rizqi Winantasya', 'Srobyong RT 004/RW 002, Mlonggo, Jepara', 'P', '089560567456');

--
-- Triggers `mahasiswa`
--
DELIMITER $$
CREATE TRIGGER `update_no_hp` AFTER UPDATE ON `mahasiswa` FOR EACH ROW begin
insert into log
set nim = old.nim,
no_hp_lama = old.no_hp,
no_hp_baru = new.no_hp,
tgl_diubah = NOW(); 
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `tampil_data`
-- (See below for the actual view)
--
CREATE TABLE `tampil_data` (
`nim` varchar(20)
,`nama_mahasiswa` varchar(100)
,`alamat` varchar(100)
,`jk` varchar(2)
,`no_hp` varchar(13)
);

-- --------------------------------------------------------

--
-- Structure for view `tampil_data`
--
DROP TABLE IF EXISTS `tampil_data`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tampil_data`  AS  select `mahasiswa`.`nim` AS `nim`,`mahasiswa`.`nama_mahasiswa` AS `nama_mahasiswa`,`mahasiswa`.`alamat` AS `alamat`,`mahasiswa`.`jk` AS `jk`,`mahasiswa`.`no_hp` AS `no_hp` from `mahasiswa` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
