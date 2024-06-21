-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 8.0.30 - MySQL Community Server - GPL
-- OS Server:                    Win64
-- HeidiSQL Versi:               12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Membuang struktur basisdata untuk inventaris-gubsu-mt
CREATE DATABASE IF NOT EXISTS `inventaris-gubsu-mt` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `inventaris-gubsu-mt`;

-- membuang struktur untuk table inventaris-gubsu-mt.barangs
DROP TABLE IF EXISTS `barangs`;
CREATE TABLE IF NOT EXISTS `barangs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_kategori` bigint unsigned NOT NULL,
  `deskripsi_barang` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lokasi_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tahun_pengadaan` year DEFAULT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kondisi_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barangs_kode_barang_unique` (`kode_barang`),
  UNIQUE KEY `barangs_serial_number_unique` (`serial_number`),
  KEY `barangs_id_kategori_foreign` (`id_kategori`),
  CONSTRAINT `barangs_id_kategori_foreign` FOREIGN KEY (`id_kategori`) REFERENCES `kategoris` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel inventaris-gubsu-mt.barangs: ~163 rows (lebih kurang)
REPLACE INTO `barangs` (`id`, `kode_barang`, `id_kategori`, `deskripsi_barang`, `serial_number`, `lokasi_user`, `tahun_pengadaan`, `keterangan`, `kondisi_barang`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'RTR 001 DKISU', 8, 'Router Mikrotik RB1100 AHX2', '47B8042E83DB/433', 'TEKNIS TIK DINAS', NULL, NULL, 'Bagus', 1, '2023-05-31 03:40:10', '2023-07-12 03:40:30'),
	(2, 'RTR 002 DKISU', 8, 'Router Mikrotik RB1100 AHX2', '7196062C8B53', 'RUANG RAPAT KADIS', NULL, NULL, 'Bagus', 0, '2023-05-31 03:41:01', '2023-05-31 03:41:01'),
	(3, 'RTR 003 DKISU', 8, 'Router Mikrotik RB1100 AHX2', '716D06E58622', 'BIDANG STATISTIK', NULL, NULL, 'Bagus', 0, '2023-05-31 03:41:46', '2023-05-31 03:41:46'),
	(4, 'RTR 004 DKISU', 8, 'Cloud Switch Series Mikrotik 24 Port', 'D761D4D52AB', 'GUDANG LANTAI 6', '2022', NULL, 'Bagus', 0, '2023-05-31 03:42:41', '2023-05-31 03:42:41'),
	(5, 'RTR 005 DKISU', 8, 'Cloud Switch Series Mikrotik 24 Port', 'D7610D74B4D7', 'GUDANG LANTAI 6', '2022', NULL, 'Bagus', 0, '2023-05-31 03:43:27', '2023-05-31 03:43:27'),
	(6, 'RTR 006 DKISU', 8, 'Cloud Core Series Mikrotik CCR1036-12G-4S', 'D840ECCF093', 'GUDANG LANTAI 6', '2022', NULL, 'BAGUS', 0, '2023-05-31 03:49:18', '2023-05-31 03:49:18'),
	(7, 'RTR 007 DKISU', 8, 'Cloud Core Series Mikrotik CCR1036-12G-4S', 'D8340E8A4CEA', 'GUDANG LANTAI 6', '2022', NULL, 'BAGUS', 0, '2023-05-31 03:50:15', '2023-05-31 03:50:15'),
	(8, 'RTR 008 DKISU', 8, 'MIKROTIK RB 1100 AHX2', '47B804C39F5C/433', 'GUDANG LANTAI 6', '2018', NULL, 'BAGUS', 0, '2023-05-31 03:51:19', '2023-05-31 03:51:19'),
	(9, 'RTR 009 DKISU', 8, 'MIKROTIK RB 1100 AHX2', '47B8040F7679/432', 'GUDANG LANTAI 6', '2018', NULL, 'BAGUS', 0, '2023-05-31 03:52:22', '2023-05-31 03:52:22'),
	(10, 'RTR 010 DKISU', 8, 'MIKROTIK RB 1100 AHX2', '716D06DDAE2B/638', 'Kantor Eks Balitbang', '2018', NULL, 'BAGUS', 0, '2023-05-31 03:53:08', '2023-05-31 03:53:08'),
	(11, 'RTR 011 DKISU', 8, 'MIKROTIK RB 1100 AHX2', '47B80438DB06/433', 'GUDANG LANTAI 6', '2018', NULL, 'BAGUS', 0, '2023-05-31 03:53:49', '2023-05-31 03:53:49'),
	(12, 'RTR 012 DKISU', 8, 'MIKROTIK RB 1100 AHX2', '716D0677BF68/638', 'GUDANG LANTAI 6', '2018', NULL, 'BAGUS', 0, '2023-05-31 03:54:30', '2023-07-12 03:21:09'),
	(13, 'RTR 013 DKISU', 8, 'MIKROTIK RB 1100 AHX2', '47B804E4B949/433', 'GUDANG LANTAI 6', '2018', NULL, 'BAGUS', 0, '2023-05-31 03:55:22', '2023-05-31 03:55:22'),
	(14, 'RTR 014 DKISU', 8, 'MIKROTIK RB 1100 AHX2', '47B80400ADF7/433', 'GUDANG LANTAI 6', '2018', NULL, 'BAGUS', 0, '2023-05-31 03:56:04', '2023-05-31 03:56:04'),
	(15, 'RTR 015 DKISU', 8, 'MIKROTIK RB 1100 AHX2', '47B804A31A09/433', 'GUDANG LANTAI 6', '2018', NULL, 'BAGUS', 0, '2023-05-31 03:56:44', '2023-05-31 03:56:44'),
	(16, 'RTR 016 DKISU', 8, 'MIKROTIK RB 1100 AHX2', '47B80480A34D/433', 'TEKNIS TIK LANTAI 6', '2018', NULL, 'BAGUS', 0, '2023-05-31 03:57:30', '2023-05-31 03:57:30'),
	(17, 'RTR 017 DKISU', 8, 'MIKROTIK RB 1100 AHX2', '47B80464AB1E/433', 'GUDANG LANTAI 6', '2018', NULL, 'BAGUS', 0, '2023-05-31 03:58:15', '2023-05-31 03:58:15'),
	(18, 'RTR 018 DKISU', 8, 'MIKROTIK RB 1100 AHX2', '47B804BCF80E/433', 'GUDANG LANTAI 6', '2018', NULL, 'BAGUS', 0, '2023-05-31 03:58:52', '2023-05-31 03:58:52'),
	(19, 'RTR 019 DKISU', 8, 'Router cloud core series CCR 1036-12G-4S-EM', 'D8340E455A12P/127/r3', 'Ruang server', '2022', NULL, 'BAGUS', 0, '2023-05-31 03:59:43', '2023-05-31 03:59:43'),
	(20, 'RTR 020 DKISU', 8, 'Router cloud core series CCR 1036-12G-4S-EM', 'D8340E5C56EB/131/r3', 'Ruang server', '2022', NULL, 'BAGUS', 0, '2023-05-31 04:00:21', '2023-05-31 04:00:21'),
	(21, 'RTR 021 DKISU', 8, 'Router Ainos 8 port mikrobits', 'FC5B261127698DTI828G', 'Ruang server', NULL, NULL, 'BAGUS', 0, '2023-05-31 04:01:06', '2023-05-31 04:01:06'),
	(22, 'RTR 022 DKISU', 8, 'Router Ainos microbits 8 port', 'FC5B261124E7', 'Ruang server', NULL, NULL, 'BAGUS', 0, '2023-05-31 04:01:40', '2023-05-31 04:01:40'),
	(23, 'RTR 023 DKISU', 8, 'Router Ainos microbits 8 port', 'FC5B26112781', 'Ruang server', NULL, NULL, 'BAGUS', 0, '2023-05-31 04:02:10', '2023-05-31 04:02:10'),
	(24, 'SW 001 DKISU', 7, 'Switch Tenda TEG1016M 16 port', 'EC311010220001552', 'TIK', '2022', NULL, 'BAGUS', 0, '2023-06-22 01:47:09', '2023-06-22 01:47:09'),
	(25, 'SW 002 DKISU', 7, 'Switch Tenda TEG1016M 16 port', 'EC311010216000732', 'TIK', '2022', NULL, 'BAGUS', 0, '2023-06-22 01:48:18', '2023-06-22 01:48:18'),
	(26, 'SW 003 DKISU', 7, 'Switch Tenda TEG1016M 16 port', 'EC311010216000736', 'TIK', '2022', NULL, 'BAGUS', 0, '2023-06-22 01:49:35', '2023-06-22 01:49:35'),
	(27, 'SW 004 DKISU', 7, 'Switch Tenda TEG1016M 16 port', 'EC311010220001551', 'TIK', '2022', NULL, 'BAGUS', 0, '2023-06-22 01:50:17', '2023-06-22 01:50:17'),
	(28, 'SW 005 DKISU', 7, 'Switch Tenda TEG1016M 16 port', 'EC311010220001554', 'TIK', '2022', NULL, 'BAGUS', 0, '2023-06-22 01:50:54', '2023-06-22 01:50:54'),
	(29, 'SW 006 DKISU', 7, 'Switch Tenda TEG1016M 16 port', 'EC311010216000731', 'TIK', '2022', NULL, 'BAGUS', 0, '2023-06-22 01:51:51', '2023-06-22 01:51:51'),
	(30, 'SW 007 DIKSU', 7, 'Switch D-LINK DES-1016D 16 PORT', 'TR031JC003200', 'TIK', '2021', NULL, 'BAGUS', 0, '2023-06-22 01:52:27', '2023-06-22 01:52:27'),
	(31, 'SW 008 DKISU', 7, 'Switch Jorgietech TXE099-M 8 port', 'TXE099201000048', 'TIK', '2021', NULL, 'BAGUS', 0, '2023-06-22 01:53:07', '2023-06-22 01:53:07'),
	(32, 'SW 009 DIKSU', 7, 'Switch Jorgietech TXE099-M 8 port', 'TXE099201000033', 'TIK', '2021', NULL, 'BAGUS', 0, '2023-06-22 01:53:54', '2023-06-22 01:53:54'),
	(33, 'SW 010 DKISU', 7, 'Switch Jorgietech TXE099-M 8 port', 'TXE099201000046', 'TIK', '2021', NULL, 'BAGUS', 0, '2023-06-22 01:55:00', '2023-06-22 01:55:00'),
	(34, 'SW 011 DKISU', 7, 'Switch jorgietech txe099-m 8 port', 'TXE099201000053', 'TIK', '2022', NULL, 'BAGUS', 0, '2023-06-22 01:55:52', '2023-06-22 01:55:52'),
	(35, 'SW 012 DKISU', 7, 'Switch jorgietech txe099-m 8 port', 'TXE099201000039', 'TIK', '2022', NULL, 'BAGUS', 0, '2023-06-22 01:56:28', '2023-06-22 01:56:28'),
	(36, 'SW 014 DKISU', 7, 'Switch jorgietech txe099-m 8 port', 'TXE099201000001', 'TIK', '2022', NULL, 'BAGUS', 0, '2023-06-22 02:00:39', '2023-06-22 02:00:39'),
	(37, 'SW 015 DKISU', 7, 'Switch jorgietech txe099-m 8 port', 'TXE099201000042', 'TIK', '2022', NULL, 'BAGUS', 0, '2023-06-22 02:01:14', '2023-06-22 02:01:14'),
	(38, 'SW 016 DKISU', 7, 'Switch jorgietech txe099-m 8 port', 'TXE099201000054', 'TIK', '2022', NULL, 'BAGUS', 0, '2023-06-22 02:02:09', '2023-06-22 02:02:09'),
	(39, 'SW 017 DKISU', 7, 'Switch jorgietech txe099-m 8 port', 'TXE099291000032', 'TIK', '2022', NULL, 'BAGUS', 0, '2023-06-22 02:02:38', '2023-06-22 02:02:38'),
	(40, 'SW 018 DKISU', 7, 'Switch jorgietech txe099-m 8 port', 'TXE099201000021', 'TIK', '2022', NULL, 'BAGUS', 0, '2023-06-22 02:03:07', '2023-06-22 02:03:07'),
	(41, 'SW 019 DKISU', 7, 'Switch jorgietech txe099-m 8 port', 'TXE099201000002', 'TIK', '2022', NULL, 'BAGUS', 0, '2023-06-22 02:03:59', '2023-06-22 02:03:59'),
	(42, 'SW 020 DKISU', 7, 'Switch jorgietech txe099-m 8 port', 'TXE099201000026', 'TIK', '2022', NULL, 'BAGUS', 0, '2023-06-22 02:04:40', '2023-06-22 02:04:40'),
	(43, 'SW 021 DKISU', 7, 'Switch jorgietech txe099-m 8 port', 'TXE099201000024', 'TIK', '2022', NULL, 'BAGUS', 0, '2023-06-22 02:05:12', '2023-06-22 02:05:12'),
	(44, 'SW 022 DKISU', 7, 'Switch Jorgietech TXE099-M 8 port', 'TXE099201000023', 'TEKNIS TIK DINAS', '2021', NULL, 'BAGUS', 0, '2023-06-22 02:05:57', '2023-06-22 02:05:57'),
	(45, 'SW 023 DKISU', 7, 'Switch TP Link 16 Port TL-SG1016D', '2173245003339', 'TEKNIS TIK DINAS', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:06:52', '2023-06-22 02:06:52'),
	(46, 'SW 024 DKISU', 7, 'Switch TP Link 16 Port TL-SG1016D', '2173245005297', 'TEKNIS TIK DINAS', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:07:19', '2023-06-22 02:07:19'),
	(47, 'SW 025 DKISU', 7, 'Switch TP-LINK  8 Port TL-SG1008D', '219C101008718 UN/8 20', 'TEKNIS TIK DINAS', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:07:50', '2023-06-22 02:07:50'),
	(48, 'SW 026 DKISU', 7, 'Switch TP-LINK  8 Port TL-SG1008D', '2178120004699 UN/8 0', 'TEKNIS TIK DINAS', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:08:24', '2023-06-22 02:08:24'),
	(49, 'SW 027 DKISU', 7, 'Switch Jorgietech TXE099-M 8 port', 'TXE0999201000035', 'RUANG KASUBAG UMUM', '2022', NULL, 'BAGUS', 0, '2023-06-22 02:09:15', '2023-06-22 02:09:15'),
	(50, 'SW 028 DKISU', 7, 'Switch TP-LINK  8 Port TL-SG1008D', '2178120005091', 'RUANG KASUBAG PROGRAM', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:10:25', '2023-06-22 02:10:25'),
	(51, 'SW 029 DKISU', 1, 'Switch TP-LINK  8 Port TL-SG1008D', '2178120005116', 'RUANG KEPEGAWAIAN', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:11:26', '2023-06-22 02:11:26'),
	(52, 'SW 032 DKISU', 7, 'Switch TP-LINK  8 Port TL-SG1008D', '2178120005107', 'RUANG PPID (DARTO)', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:13:48', '2023-06-22 02:13:48'),
	(53, 'SW 033 DKISU', 7, 'Switch TP-LINK  8 Port TL-SG1008D', '219C101008730', 'BIDANG STATISTIK', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:15:15', '2023-06-22 02:15:15'),
	(54, 'SW 034 DKISU', 7, 'Switch TP-LINK  8 Port TL-SG1008D', '219C101008707', 'BIDANG STATISTIK', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:16:54', '2023-06-22 02:16:54'),
	(55, 'SW 035 DKISU', 1, 'Switch TP-LINK  16 Port TL-SG1016D', '217324500338', 'BIDANG STATISTIK', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:26:39', '2023-06-22 02:26:39'),
	(56, 'SW 036 DKISU', 7, 'Switch TP-LINK  8 Port TL-SG1008D', '2178120004694', 'INFO SUMUT', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:27:50', '2023-06-22 02:27:50'),
	(57, 'SW 037 DKISU', 7, 'Switch TP-LINK  16 Port TL-SG1016D', '2173245002738', 'INFO SUMUT', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:29:28', '2023-06-22 02:29:28'),
	(58, 'SW 038 DKISU', 7, 'Switch TP-LINK  16 Port TL-SG1016D', '2173245003340', 'INFO SUMUT', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:30:55', '2023-06-22 02:30:55'),
	(59, 'SW 039 DKISU', 7, 'Switch Jorgietech TXE099-M 8 port', 'TXE099201000028', 'INFO SUMUT', NULL, NULL, 'RUSAK', 0, '2023-06-22 02:32:03', '2023-06-22 02:32:03'),
	(60, 'SW 040 DKISU', 7, 'Switch TP-LINK  16 Port TL-SG1016D', '2173245005298', 'PIP', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:34:17', '2023-06-22 02:34:17'),
	(61, 'SW 041 DKISU', 7, 'Switch TP-LINK  8 Port TL-SG1008D', '219C101008739', 'PIP', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:35:43', '2023-06-22 02:35:43'),
	(62, 'SW 042 DKISU', 7, 'Switch Jorgietech TXE099-M 8 port', 'TXE09920100023', 'RUANGAN PAK ADE', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:38:00', '2023-06-22 02:38:00'),
	(63, 'SW 043 DKISU', 7, 'SWITCH 24 PORT HP 1810-24G', 'CN46FRT41Z', 'GUDANG LANTAI 6', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:40:46', '2023-06-22 02:40:46'),
	(64, 'SW 044 DKISU', 7, 'SWITCH 24 PORT HP 1810-24G', 'CN46FRT3C7', 'GUDANG LANTAI 6', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:44:52', '2023-06-22 02:44:52'),
	(65, 'SW 045 DKISU', 7, 'SWITCH 24 PORT HP 1810-24G', 'CN46FRT3VM', 'GUDANG LANTAI 6', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:45:51', '2023-06-22 02:45:51'),
	(66, 'SW 046 DKISU', 7, 'SWITCH 24 PORT HP 1810-24G', 'CN46FRT3X7', 'GUDANG LANTAI 6', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:47:04', '2023-06-22 02:47:04'),
	(67, 'SW 047 DKISU', 7, 'SWITCH 24 PORT HP 1810-24G', 'CN46FRT0KR', 'GUDANG LANTAI 6', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:47:32', '2023-06-22 02:47:32'),
	(68, 'SW 048 DKISU', 7, 'SWITCH 24 PORT HP 1810-24G', 'CN46FRT401', 'GUDANG LANTAI 6', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:48:34', '2023-06-22 02:48:34'),
	(69, 'SW 049 DKISU', 7, 'SWITCH 24 PORT HP 1810-24G', 'CN46FRT4MY', 'GUDANG LANTAI 6', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:49:09', '2023-06-22 02:49:09'),
	(70, 'SW 050 DKISU', 7, 'SWITCH 24 PORT HP 1810-24G', 'CN46FRT406', 'GUDANG LANTAI 6', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:50:12', '2023-06-22 02:50:12'),
	(71, 'SW 051 DKISU', 7, 'SWITCH 24 PORT HP 1810-24G', 'CN46FRT3T0', 'GUDANG LANTAI 6', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:50:35', '2023-06-22 02:50:35'),
	(72, 'SW 052 DKISU', 7, 'SWITCH 24 PORT HP 1810-24G', 'CN46FRT38G', 'GUDANG LANTAI 6', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:51:11', '2023-06-22 02:51:11'),
	(73, 'SW 053 DKISU', 7, 'SWITCH 24 PORT HP 1810-24G', 'CN46FRT3W7', 'GUDANG LANTAI 6', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:51:34', '2023-06-22 02:51:34'),
	(74, 'SW 054 DKISU', 7, 'SWITCH 24 PORT HP 1810-24G', 'CN46FRT2RY', 'GUDANG LANTAI 6', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:52:04', '2023-06-22 02:52:04'),
	(75, 'SW 055 DKISU', 7, 'SWITCH 16 PORT TP-LINK TL-SG1016D', '2173245003337', 'GUDANG LANTAI 6', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:53:02', '2023-06-22 02:53:02'),
	(76, 'SW 056 DKISU', 7, 'SWITCH 24 PORT TP-LINK TL-SG1024D', '218B031001327', 'GUDANG LANTAI 6', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:53:27', '2023-06-22 02:53:27'),
	(77, 'SW 057 DKISU', 7, 'SWITCH 16 PORT TP-LINK TL-SG1016D', '2173245002741', 'GUDANG LANTAI 6', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:54:06', '2023-06-22 02:54:06'),
	(78, 'SW 058 DKISU', 7, 'SWITCH 16 PORT TP-LINK TL-SG1016D', '2173245003558', 'GUDANG LANTAI 6', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:54:31', '2023-06-22 02:54:31'),
	(79, 'SW 059 DKISU', 7, 'SWITCH 16 PORT TP-LINK TL-SG1016D', '2173245003556', 'GUDANG LANTAI 6', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:54:56', '2023-06-22 02:54:56'),
	(80, 'SW 060 DKISU', 7, 'SWITCH 16 PORT TP-LINK TL-SG1016D', '2173245002742', 'GUDANG LANTAI 6', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:55:24', '2023-06-22 02:55:24'),
	(81, 'SW 061 DKISU', 7, 'SWITCH 16 PORT TP-LINK TL-SG1016D', '2173245002737', 'GUDANG LANTAI 6', NULL, NULL, 'BAGUS', 0, '2023-06-22 02:55:48', '2023-06-22 02:55:48'),
	(82, 'SW 062 DKISU', 7, '16-Port 10/100mbps Desktop Switch D-LINK', 'TR031JC003199', 'GUDANG LANTAI 6', '2021', NULL, 'BAGUS', 0, '2023-06-22 02:56:26', '2023-06-22 03:09:33'),
	(83, 'SW 063 DKISU', 7, '16-Port 10/100mbps Desktop Switch D-LINK', 'TR031JC003196', 'GUDANG LANTAI 6', '2021', NULL, 'BAGUS', 0, '2023-06-22 02:57:09', '2023-06-22 03:09:42'),
	(84, 'SW 064 DKISU', 7, '16-Port 10/100mbps Desktop Switch D-LINK', 'TR031JC003198', 'GUDANG LANTAI 6', '2021', NULL, 'BAGUS', 0, '2023-06-22 02:58:23', '2023-06-22 03:09:50'),
	(85, 'SW 065 DKISU', 7, '16-Port 10/100mbps Desktop Switch D-LINK', 'TR031JC003197', 'GUDANG LANTAI 6', '2021', NULL, 'BAGUS', 0, '2023-06-22 03:09:01', '2023-06-22 03:09:58'),
	(86, 'SW 066 DKISU', 7, 'SWITCH 16 PORT TP-LINK TL-SG1016D', '2173245002740', 'MEJA TV BESAR', NULL, NULL, 'BAGUS', 0, '2023-06-22 03:10:52', '2023-06-22 03:10:52'),
	(87, 'SW 067 DKISU', 7, 'SWITCH 26-PORT SMART GIGABIT SWITCH LGS326-AP', '14B10C91700801', 'RAK RUANG TEKNIS LANTAI 6', NULL, NULL, 'BAGUS', 0, '2023-06-22 03:11:22', '2023-06-22 03:11:22'),
	(88, 'SW 068 DKISU', 7, 'SWITCH 26-PORT SMART GIGABIT SWITCH LGS326-AP', '14B10C91700812', 'GUDANG LANTAI 6', NULL, NULL, 'BAGUS', 0, '2023-06-22 03:11:44', '2023-06-22 03:11:44'),
	(89, 'SW 069 DKISU', 7, 'SWITCH 26-PORT SMART GIGABIT SWITCH LGS326-AP', '14B10C91700903', 'GUDANG LANTAI 6', NULL, NULL, 'BAGUS', 0, '2023-06-22 03:12:09', '2023-06-22 03:12:09'),
	(90, 'SW 070 DKISU', 7, 'SWITCH 26-PORT SMART GIGABIT SWITCH LGS326-AP', '14B10C91700905', 'GUDANG LANTAI 6', NULL, NULL, 'BAGUS', 0, '2023-06-22 03:12:35', '2023-06-22 03:12:35'),
	(91, 'SW 071 DKISU', 7, 'SWITCH 26-PORT SMART GIGABIT SWITCH LGS326-AP', '14B10C91700778', 'MEJA DEKAT BG IQBAL', NULL, NULL, 'BAGUS', 0, '2023-06-22 03:13:44', '2023-06-22 03:13:44'),
	(92, 'SW 072 DKISU', 7, 'Switch 26 port linksys LGS326', '14B10C91700727', 'Ruang server', NULL, NULL, 'BAGUS', 0, '2023-06-22 03:14:07', '2023-06-22 03:14:07'),
	(93, 'SW 073 DKISU', 7, 'Switch 26 port linksys LGS326', '14B10C91700808', 'Ruang server', NULL, NULL, 'BAGUS', 0, '2023-06-22 03:14:35', '2023-06-22 03:14:35'),
	(94, 'SW 074 DKISU', 7, 'Switch 26 port linksys LGS326', '14B10C91700877', 'Ruang server', NULL, NULL, 'BAGUS', 0, '2023-06-22 03:15:03', '2023-06-22 03:15:03'),
	(95, 'SW 075 DKISU', 7, 'Switch 26 port linksys LGS326', '14B10C91700714', 'Ruang server', NULL, NULL, 'BAGUS', 0, '2023-06-22 03:15:26', '2023-06-22 03:15:26'),
	(96, 'SW 076 DKISU', 7, 'Switch 26 port linksys LGS326', '14B10C91700807', 'Ruang server', NULL, NULL, 'BAGUS', 0, '2023-06-22 03:15:47', '2023-06-22 03:15:47'),
	(97, 'SW 077 DKISU', 7, 'Switch 26 port linksys LGS326', '14B10C91700817', 'Ruang server', NULL, NULL, 'BAGUS', 0, '2023-06-22 03:16:12', '2023-06-22 03:16:12'),
	(98, 'SW 078 DKISU', 7, 'Switch 24 port HP 1810-24G', 'CN46FRT54C', 'Ruang server', NULL, NULL, 'BAGUS', 0, '2023-06-22 03:16:38', '2023-06-22 03:16:38'),
	(99, 'SW 080 DKISU', 7, 'Switch 24 port Cisco WS-C3750X-24T-S F06', 'FD01836P0G3', 'Ruang server', NULL, NULL, 'BAGUS', 0, '2023-06-22 03:17:02', '2023-06-22 03:17:02'),
	(100, 'SW 081 DKISU', 7, 'Switch 24 port Cisco WS-C3750X-24T-S F06', 'FDO1836H0CW', 'Ruang server', NULL, NULL, 'BAGUS', 0, '2023-06-22 03:17:27', '2023-06-22 03:17:27'),
	(101, 'SW 083 DKISU', 1, 'Switch 26 port linksys LGS326', '14B10C91700729', 'Ruang server', NULL, NULL, 'BAGUS', 0, '2023-06-22 03:17:52', '2023-06-22 03:17:52'),
	(102, 'AP 001 DKISU', 6, 'Access Point UNIFI UAP AC HD', '70A7416A7F8E', 'TIK', '2022', NULL, 'Bagus', 0, '2023-06-22 03:21:46', '2023-06-22 03:21:46'),
	(103, 'AP 002 DKISU', 6, 'Access Point UNIFI UAP AC HD', '70A7416A7DFE', 'TIK', '2022', NULL, 'Bagus', 0, '2023-06-22 03:22:44', '2023-06-22 03:22:44'),
	(104, 'AP 003 DKISU', 6, 'Access Point UNIFI UAP AC HD', '70A7416A807A', 'TIK', '2022', NULL, 'Bagus', 0, '2023-06-22 03:23:21', '2023-06-22 03:23:21'),
	(105, 'AP 004 DKISU', 6, 'Access Point UNIFI UAP AC HD', '70A77416A70CE', 'TIK', '2022', NULL, 'Bagus', 0, '2023-06-22 03:24:02', '2023-06-22 03:24:02'),
	(106, 'AP 005 DKISU', 6, 'Access Point UNIFI UAP AC HD', 'E063DA2CBACD', 'TIK', '2021', 'NON POE', 'Bagus', 0, '2023-06-22 03:24:55', '2023-06-22 03:36:22'),
	(107, 'AP 006 DKISU', 6, 'Access Point UNIFI UAP AC HD', 'E063DA5F7C17', 'Bidang PIP', NULL, NULL, 'Bagus', 0, '2023-06-22 03:25:23', '2023-06-22 03:36:06'),
	(108, 'AP 007 DKISU', 6, 'Access Point UNIFI UAP AC HD', 'E063DA5F8D9F', 'TIK', NULL, NULL, 'Bagus', 0, '2023-06-22 03:25:43', '2023-06-22 03:35:55'),
	(109, 'AP 008 DKISU', 6, 'Access Point UNIFI UAP AC HD', 'E063DA52DE49', 'Teknis TIK', NULL, NULL, 'Bagus', 0, '2023-06-22 03:26:33', '2023-06-22 03:35:46'),
	(110, 'AP 009 DKISU', 6, 'Access Point UNIFI UAP AC HD', 'E063DA598146', 'TIK', NULL, 'NON POE', 'Bagus', 0, '2023-06-22 03:27:04', '2023-06-22 03:35:31'),
	(111, 'AP 010 DKISU', 6, 'Access Point UNIFI UAP AC HD', 'E063DA52B825', 'TIK', NULL, 'NON POE', 'Bagus', 0, '2023-06-22 03:27:29', '2023-06-22 03:35:18'),
	(112, 'AP 011 DKISU', 6, 'Access Point UNIFI UAP AC HD', 'E063DA2C9BE1', 'TIK', NULL, NULL, 'Bagus', 0, '2023-06-22 03:27:55', '2023-06-22 03:35:09'),
	(113, 'AP 012 DKISU', 6, 'Access Point UNIFI UAP AC HD', 'E063DA5F81AF', 'TIK', NULL, NULL, 'Bagus', 0, '2023-06-22 03:28:24', '2023-06-22 03:34:54'),
	(114, 'AP 013 DKISU', 6, 'Access Point UNIFI UAP AC HD', 'E063DA2260BA', 'RUANG RAPAT KADIS', NULL, NULL, 'BAGUS', 0, '2023-06-22 03:31:01', '2023-06-22 03:34:45'),
	(115, 'AP 014 DKISU', 6, 'Access Point UNIFI UAP AC HD', 'E063DA2C9039', 'KEUANGAN', NULL, NULL, 'BAGUS', 0, '2023-06-22 03:32:03', '2023-06-22 03:34:30'),
	(116, 'AP 015 DKISU', 6, 'Access Point UNIFI UAP AC HD', '245A4C90A963', 'SEKRETARIAT', '2021', NULL, 'BAGUS', 0, '2023-06-22 03:33:32', '2023-06-22 03:33:32'),
	(117, 'AP 016 DKISU', 6, 'Access Point UNIFI UAP AC HD', 'E063DA5F7347', 'AULA TRANSPARANSI', NULL, NULL, 'BAGUS', 0, '2023-06-22 03:38:59', '2023-06-22 03:38:59'),
	(118, 'AP 017 DKISU', 6, 'Access Point UNIFI UAP AC HD', 'E063DA2C97A9', 'AULA TRANSPARANSI', NULL, NULL, 'BAGUS', 0, '2023-06-22 03:39:32', '2023-06-22 03:39:32'),
	(119, 'AP 018 DKISU', 6, 'Access Point UNIFI UAP AC HD', 'E063DA5F8E2F', 'AULA TRANSPARANSI', NULL, NULL, 'BAGUS', 0, '2023-06-22 03:40:12', '2023-06-22 03:40:12'),
	(120, 'AP 019 DKISU', 6, 'Access Point UNIFI UAP AC HD', 'E063DA5F926F', 'BIDANG STATISTIK', NULL, NULL, 'BAGUS', 0, '2023-06-22 03:41:46', '2023-06-22 03:41:46'),
	(121, 'AP 020 DKISU', 6, 'Access Point UNIFI UAP AC HD', 'E063DA5F862B', 'INFO SUMUT', NULL, NULL, 'BAGUS', 0, '2023-06-22 03:42:34', '2023-06-22 03:42:34'),
	(122, 'AP 021 DKISU', 6, 'Access Point UNIFI UAP AC HD', 'E063DA5F7CA7', 'GUDANG LANTAI 6', NULL, 'Stand , Baut Mur , UNIFI , POE , KABEL POE', 'BAGUS', 0, '2023-06-22 03:43:12', '2023-07-12 03:50:46'),
	(123, 'AP 022 DKISU', 6, 'Access Point UNIFI UAP AC HD', 'E063 DA2C 96E9', 'GUDANG LANTAI 6', NULL, 'mur baut , poe , kabel poe , ( tdk ada stand )', 'BAGUS', 0, '2023-06-22 03:44:00', '2023-06-22 03:44:00'),
	(124, 'AP 023 DKISU', 6, 'Access Point UNIFI UAP AC HD', 'E063DA52E1C1', 'GUDANG LANTAI 6', NULL, 'Stand , baut mur , poe , kabel , unifi', 'Bagus', 0, '2023-06-22 03:56:04', '2023-06-22 03:56:04'),
	(125, 'AP 024 DKISU', 6, 'Access Point UNIFI UAP AC HD', 'E063DA2C9261', 'GUDANG LANTAI 6', NULL, 'Lengkap ( Serial number sama )', 'Bagus', 0, '2023-06-22 03:56:48', '2023-06-22 03:56:48'),
	(126, 'AP 025 DKISU', 6, 'Access Point UNIFI UAP AC HD', 'E063DA2C90C1', 'GUDANG LANTAI 6', NULL, 'Lengkap ( Serial number sama )', 'BAGUS', 0, '2023-06-22 04:00:03', '2023-06-22 04:00:03'),
	(127, 'AP 027 DKISU', 6, 'Access Point UNIFI UAP AC HD', 'E063DA5F7C2F', 'GUDANG LANTAI 6', NULL, 'Poe,kabel,tdk ada mur', 'BAGUS', 0, '2023-06-22 04:14:01', '2023-06-22 04:14:01'),
	(128, 'AP 028 DKISU', 6, 'Access Point UNIFI UAP AC HD', 'E063DA2C9FED', 'GUDANG LANTAI 6', NULL, 'Lengkap', 'BAGUS', 0, '2023-06-22 04:14:58', '2023-06-22 04:14:58'),
	(129, 'AP 029 DKISU', 6, 'Access Point UNIFI UAP AC HD', 'E063DA5F8793', 'GUDANG LANTAI 6', NULL, 'Lengkap', 'BAGUS', 0, '2023-06-22 04:15:26', '2023-06-22 04:15:26'),
	(130, 'AP 030 DKISU', 6, 'Access Point UNIFI UAP AC HD', 'E063DA52CF41', 'GUDANG LANTAI 6', NULL, 'Mur,baut', 'Bagus', 0, '2023-06-22 04:17:34', '2023-06-22 04:17:34'),
	(131, 'AP 031 DKISU', 6, 'Access Point UNIFI UAP AC HD', 'E063DA5F7D53', 'GUDANG LANTAI 6', NULL, 'Lengkap', 'Bagus', 1, '2023-06-22 04:18:43', '2023-07-12 03:48:54'),
	(132, 'AP 032 DKISU', 6, 'Access Point UNIFI UAP AC HD', '245A4C955E8C', 'GUDANG LANTAI 6', NULL, 'Lengkap', 'Bagus', 0, '2023-06-22 04:19:13', '2023-06-22 04:19:13'),
	(133, 'AP 033 DKISU', 6, 'Access Point UNIFI UAP AC HD', '245A4C7B7D41', 'GUDANG LANTAI 6', NULL, 'Unifi ada, stand, mur, poe, kabel poe tidak ada', 'Bagus', 0, '2023-06-22 04:19:41', '2023-06-22 04:19:41'),
	(134, 'AP 034 DKISU', 6, 'Access Point UNIFI UAP AC HD', 'E063DA5F77D3', 'GUDANG LANTAI 6', NULL, 'Unifi, stand, mur baut ada poe dan kabel poe', 'Bagus', 0, '2023-06-22 04:20:12', '2023-06-22 04:20:12'),
	(135, 'AP 035 DKISU', 6, 'Access Point UNIFI UAP AC HD', 'E063DA5F77FB', 'GUDANG LANTAI 6', NULL, 'Stand, mur baut, unifi ada, poe dan kabel poe tidak ada', 'Bagus', 0, '2023-06-22 04:21:01', '2023-06-22 04:21:01'),
	(136, 'AP 037 DKISU', 6, 'Access Point UNIFI UAP AC HD', 'E063DA5F77BF', 'GUDANG LANTAI 6', NULL, 'unifi ( tidak ada standa , mur baut , poe dan kabel )', 'Bagus', 0, '2023-06-22 04:23:28', '2023-06-22 04:23:28'),
	(137, 'AP 038 DKISU', 6, 'Access Point UNIFI UAP AC HD', 'E063DA52ED45', 'GUDANG LANTAI 6', NULL, 'unifi , standa , mur baut ( tidak ada poe dan kabel poe )', 'Bagus', 0, '2023-06-22 04:24:03', '2023-06-22 04:24:03'),
	(138, 'AP 039 DKISU', 1, 'Access Point UNIFI UAP AC HD', 'E063DA2C8C91', 'GUDANG LANTAI 6', NULL, 'unifi, mur baut ( tidak ada stand , poe dan kabel poe )', 'Bagus', 0, '2023-06-22 04:24:33', '2023-06-22 04:24:33'),
	(139, 'AP 040 DKISU', 6, 'Access Point UNIFI UAP AC HD', 'E063DA2CBA7D', 'GUDANG LANTAI 6', NULL, 'lengkap ( sn sama )', 'Bagus', 0, '2023-06-22 04:26:22', '2023-06-22 04:26:22'),
	(140, 'AP 042 DKISU', 6, 'Access Point UNIFI UAP AC HD', '(k) E063 DA59 B842', 'GUDANG LANTAI 6', NULL, 'UNIFI tanpa kotak', 'Bagus', 0, '2023-06-22 04:28:36', '2023-06-22 04:28:36'),
	(141, 'AP 043 DKISU', 6, 'Access Point UNIFI UAP AC HD', '(K) E063 DA52 E695', 'GUDANG LANTAI 6', NULL, 'UNIFI,tanpa kotak', 'Bagus', 0, '2023-06-22 04:29:12', '2023-06-22 04:29:12'),
	(142, 'AP 044 DKISU', 6, 'Access Point UNIFI UAP AC HD', '(K) E063 DA5F 798B', 'GUDANG LANTAI 6', NULL, 'UNIFI,tanpa kotak', 'Bagus', 0, '2023-06-22 04:29:56', '2023-06-22 04:29:56'),
	(143, 'AP 045 DKISU', 6, 'Access Point UNIFI UAP AC HD', '(K) E063 DA59 8146', 'GUDANG LANTAI 6', NULL, 'UNIFI,tanpa kotak', 'Bagus', 0, '2023-06-22 04:30:44', '2023-06-22 04:30:44'),
	(144, 'AP 046 DKISU', 6, 'Access Point UNIFI UAP AC HD', '(K) 245A 4C95 5E0C', 'GUDANG LANTAI 6', NULL, 'UNIFI, tanpa kotak', 'Bagus', 0, '2023-06-22 04:31:50', '2023-06-22 04:31:50'),
	(145, 'AP 047 DKISU', 6, 'Access Point UNIFI UAP AC HD', '(K) E063 DA52 B825', 'GUDANG LANTAI 6', NULL, 'UNIFI,tanpa kotak', 'Bagus', 0, '2023-06-22 04:32:14', '2023-06-22 04:32:14'),
	(146, 'AP 048 DKISU', 6, 'Access Point UNIFI UAP AC HD', '(K) 245A 4C95 4418', 'GUDANG LANTAI 6', NULL, 'UNIFI,tanpa kotak', 'Bagus', 0, '2023-06-22 04:32:42', '2023-06-22 04:32:42'),
	(147, 'AUD 001 DKISU', 3, 'MIC WIRELESS EMMEET OfficeCore M2 Max (Data Cable, BT Adapter)', '6971337720289', 'TIK', '2021', NULL, 'BAGUS', 0, '2023-07-12 02:43:06', '2023-07-12 02:43:06'),
	(148, 'AUD 002 DKISU', 3, 'SPEAKER BEHRINGER EUROPORT MPA40BT-PRO+MIC CABLE', 'S201200098APR', 'GUDANG LANTAI 6', NULL, NULL, 'BAGUS', 0, '2023-07-12 02:43:58', '2023-07-12 02:43:58'),
	(149, 'AUD 006 DKISU', 3, 'WIRELESS MICROPHONE SET SHURE SVX288A/PG28-J8+MIC 2 PCS+ADAPTOR', '3AC24919992', 'GUDANG LANTAI 6', '2021', NULL, 'BAGUS', 0, '2023-07-12 02:46:00', '2023-07-12 02:46:00'),
	(150, 'AUD 008 DKISU', 3, 'SOUND SYSTEM MIXER BEHRINGER XENIX X1204USB', 'S210601082A0H', 'GUDANG LANTAI 6', '2021', NULL, 'BAGUS', 0, '2023-07-12 02:48:51', '2023-07-12 02:48:51'),
	(151, 'AV 001 DKISU', 3, 'SPLITTER HDMI NIPPONTECH NT-HS148T 8 PORT', 'NTH5148T2209037', 'TIK', '2022', NULL, 'BAGUS', 0, '2023-07-12 02:49:42', '2023-07-12 02:49:42'),
	(152, 'AV 002 DKISU', 3, 'SPLITTER HDMI NIPPONTECH NT-HS148T 8 PORT', 'NTH5148T2209038', 'TIK', '2022', NULL, 'BAGUS', 0, '2023-07-12 02:51:52', '2023-07-12 02:51:52'),
	(153, 'AV 019 DKISU', 3, 'TV POLYTRON', '19L00055', 'RUANG STAFF APTIKA', NULL, NULL, 'BAGUS', 0, '2023-07-12 02:55:37', '2023-07-12 02:55:37'),
	(154, 'AV 020 DKISU', 3, 'TV SAMSUNG', '05V83NCM500758Y', 'RUANG STAFF APTIKA', NULL, NULL, 'BAGUS', 0, '2023-07-12 02:56:47', '2023-07-12 02:56:47'),
	(155, 'CAM 001 DKISU', 3, 'KAMERA LOGITECH PTZ RALLY (ADAPTOR, REMOTE)', '2140LZ51LUS8', 'TIK', '2021', NULL, 'BAGUS', 0, '2023-07-12 02:57:46', '2023-07-12 02:57:46'),
	(156, 'CAM 002 DKISU', 3, 'KAMERA LOGITECT PTX PRO 2+ADAPTOR', '1938LZ50WP88', 'GUDANG LANTAI 6', NULL, NULL, 'BAGUS', 0, '2023-07-12 02:58:33', '2023-07-12 02:58:33'),
	(157, 'CAM 003 DKISU', 3, 'KAMERA PANASONIC HD-PV100 (EX COMCEN)+ADAPTOR', 'CK/BA001272', 'GUDANG LANTAI 6', NULL, NULL, 'BAGUS', 0, '2023-07-12 02:59:12', '2023-07-12 02:59:12'),
	(158, 'CAM 004 DKISU', 3, 'KAMERA CANON XA30 (EX HUMAS)+ADAPTOR+KABEL MINI HDMI', '22302200024', 'GUDANG LANTAI 6', NULL, NULL, 'BAGUS', 0, '2023-07-12 02:59:59', '2023-07-12 02:59:59'),
	(159, 'TIK 002 DKISU', 3, 'Converter SDI to HDMI 5h036 black magic', '9867111', 'TIK', '2022', NULL, 'BAGUS', 0, '2023-07-12 03:02:08', '2023-07-12 03:02:08'),
	(160, 'VID 001 DKISU', 3, 'VIDEO SWITCHER ATEM MINI PRO', '7265310', 'GUDANG LANTAI 6', '2021', NULL, 'KURANG BAGUS', 0, '2023-07-12 03:03:38', '2023-07-12 03:03:38'),
	(161, 'VID 002 DKISU', 3, 'MONITOR AEVISION AE-LED22A-2K  + ADAPTOR', 'W222136-PP010064', 'RUANGAN STAFF APTIKA', '2021', NULL, 'BAGUS', 0, '2023-07-12 03:04:33', '2023-07-12 03:04:33'),
	(162, 'VID 003 DKISU', 3, 'MONITOR ACER AL1516W b', 'ETLBB04007747035A24300', 'RUANGAN STAFF APTIKA', '2007', NULL, 'BAGUS', 0, '2023-07-12 03:05:28', '2023-07-12 03:05:28'),
	(163, 'HDD 001 DKISU', 2, 'Eksternal Hardisk WD My Book 8TB', 'URJNW58K', 'TIK', '2022', NULL, 'BAGUS', 0, '2023-07-12 03:07:48', '2023-07-12 03:07:48'),
	(164, 'HDD 002 DIKSU', 2, 'Eksternal Hardisk WD My Book 8TB', 'WX52DC1A42PU', 'TIK', '2022', NULL, 'BAGUS', 0, '2023-07-12 03:08:33', '2023-07-12 03:08:33'),
	(165, 'HDD 003 DKISU', 2, 'Eksternal Hardisk WD My Book 8TB', 'WX32D518VKDA', 'TIK', '2022', NULL, 'BAGUS', 0, '2023-07-12 03:09:25', '2023-07-12 03:09:25'),
	(166, 'HDD 004 DKISU', 2, 'Eksternal Hardisk WD My Book 8TB', 'WX12DA1HSJAS', 'TIK', '2022', NULL, 'BAGUS', 0, '2023-07-12 03:09:58', '2023-07-12 03:09:58'),
	(167, 'HDD 005 DKISU', 2, 'Eksternal Hardisk WD My Book 8TB', 'VRJN3XXN', 'TIK', '2022', NULL, 'BAGUS', 0, '2023-07-12 03:10:39', '2023-07-12 03:10:39'),
	(168, 'CCL 001 DKISU', 4, 'Contact Cleaner Rexco 18', '0', 'GUDANG LANTAI 6', '2023', NULL, 'Baru', 0, '2023-07-12 03:36:21', '2023-07-12 03:36:21');

-- membuang struktur untuk table inventaris-gubsu-mt.detailpeminjamans
DROP TABLE IF EXISTS `detailpeminjamans`;
CREATE TABLE IF NOT EXISTS `detailpeminjamans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_peminjaman` bigint unsigned NOT NULL,
  `id_barang` bigint unsigned NOT NULL,
  `status_detail` tinyint(1) NOT NULL,
  `hbs_pakai` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `detailpeminjamans_id_peminjaman_foreign` (`id_peminjaman`),
  KEY `detailpeminjamans_id_barang_foreign` (`id_barang`),
  CONSTRAINT `detailpeminjamans_id_barang_foreign` FOREIGN KEY (`id_barang`) REFERENCES `barangs` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detailpeminjamans_id_peminjaman_foreign` FOREIGN KEY (`id_peminjaman`) REFERENCES `peminjamans` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel inventaris-gubsu-mt.detailpeminjamans: ~4 rows (lebih kurang)
REPLACE INTO `detailpeminjamans` (`id`, `id_peminjaman`, `id_barang`, `status_detail`, `hbs_pakai`, `created_at`, `updated_at`) VALUES
	(1, 1, 12, 0, 0, '2023-07-12 03:20:55', '2023-07-12 03:21:09'),
	(2, 2, 1, 1, 0, '2023-07-12 03:40:30', '2023-07-12 03:40:30'),
	(3, 3, 131, 1, 0, '2023-07-12 03:48:54', '2023-07-12 03:48:54'),
	(4, 4, 122, 0, 0, '2023-07-12 03:49:35', '2023-07-12 03:50:46');

-- membuang struktur untuk table inventaris-gubsu-mt.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel inventaris-gubsu-mt.failed_jobs: ~0 rows (lebih kurang)

-- membuang struktur untuk table inventaris-gubsu-mt.kategoris
DROP TABLE IF EXISTS `kategoris`;
CREATE TABLE IF NOT EXISTS `kategoris` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel inventaris-gubsu-mt.kategoris: ~8 rows (lebih kurang)
REPLACE INTO `kategoris` (`id`, `kategori`, `created_at`, `updated_at`) VALUES
	(1, 'Tool Network', '2023-05-31 03:09:32', '2023-05-31 03:09:32'),
	(2, 'Storage', '2023-05-31 03:09:32', '2023-05-31 03:09:32'),
	(3, 'Multimedia', '2023-05-31 03:09:32', '2023-05-31 03:09:32'),
	(4, 'Habis Pakai', '2023-05-31 03:09:32', '2023-05-31 03:09:32'),
	(5, 'PC', '2023-05-31 03:09:32', '2023-05-31 03:09:32'),
	(6, 'Access Point', '2023-05-31 03:09:32', '2023-05-31 03:09:32'),
	(7, 'Switch', '2023-05-31 03:09:32', '2023-05-31 03:09:32'),
	(8, 'Router', '2023-05-31 03:09:32', '2023-05-31 03:09:32');

-- membuang struktur untuk table inventaris-gubsu-mt.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel inventaris-gubsu-mt.migrations: ~0 rows (lebih kurang)
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2023_04_06_031113_create_kategoris_table', 1),
	(6, '2023_04_06_031121_create_barangs_table', 1),
	(7, '2023_04_06_031129_create_peminjamans_table', 1),
	(8, '2023_05_14_150524_create_detailpeminjamans_table', 1);

-- membuang struktur untuk table inventaris-gubsu-mt.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel inventaris-gubsu-mt.password_resets: ~0 rows (lebih kurang)

-- membuang struktur untuk table inventaris-gubsu-mt.peminjamans
DROP TABLE IF EXISTS `peminjamans`;
CREATE TABLE IF NOT EXISTS `peminjamans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tgl_pinjam` datetime NOT NULL,
  `tgl_kembali` datetime DEFAULT NULL,
  `nama_peminjam` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bidang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel inventaris-gubsu-mt.peminjamans: ~4 rows (lebih kurang)
REPLACE INTO `peminjamans` (`id`, `tgl_pinjam`, `tgl_kembali`, `nama_peminjam`, `bidang`, `keterangan`, `created_at`, `updated_at`) VALUES
	(1, '2023-07-12 10:20:55', '2023-07-12 10:21:09', 'SADN', 'ASDA', 'ANSDO', '2023-07-12 03:20:55', '2023-07-12 03:21:09'),
	(2, '2023-07-12 10:40:30', NULL, 'puput', 'tik', 'acara', '2023-07-12 03:40:30', '2023-07-12 03:40:30'),
	(3, '2023-07-12 10:48:54', NULL, 'PRSU', 'APTIKA', 'di stand kominfo dan media center PRSU', '2023-07-12 03:48:54', '2023-07-12 03:48:54'),
	(4, '2023-07-12 10:49:35', '2023-07-12 10:50:46', 'PRSU', 'APTIKA', 'di stand kominfo dan media center PRSU', '2023-07-12 03:49:35', '2023-07-12 03:50:46');

-- membuang struktur untuk table inventaris-gubsu-mt.personal_access_tokens
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel inventaris-gubsu-mt.personal_access_tokens: ~0 rows (lebih kurang)

-- membuang struktur untuk table inventaris-gubsu-mt.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel inventaris-gubsu-mt.users: ~0 rows (lebih kurang)
REPLACE INTO `users` (`id`, `nama`, `username`, `email_verified_at`, `password`, `is_admin`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Rahmad', 'admin', '2023-05-31 03:09:32', '$2y$10$lrWElYnZpYK0lrNx427Jju/WAXH2Ba.ThCe6mS7x8suU3iULnjdh.', 1, 'vX4mCEBCpp2yB8KExMy8SCi4jMQrEyPtXVtkZMWD6LN4NCKC9zVyOT0ZXeQx', '2023-05-31 03:09:32', '2023-05-31 03:11:37');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
