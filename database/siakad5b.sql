-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Nov 10, 2026 at 02:46 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siakad5b`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('siakad-3202416066-cache-tanayadzakiyyaisnania1@gmail.com|127.0.0.1', 'i:1;', 1793258035),
('siakad-3202416066-cache-tanayadzakiyyaisnania1@gmail.com|127.0.0.1:timer', 'i:1793258035;', 1793258035);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `id` bigint UNSIGNED NOT NULL,
  `nidn` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `jabatan_fungsional` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`id`, `nidn`, `nama`, `email`, `telepon`, `alamat`, `created_at`, `updated_at`, `jabatan_fungsional`) VALUES
(1, '0047851048', 'Banawi Adriansyah, S.Kom., M.Eng.', 'pangestu.luwar@example.net', '082323885338', 'Ki. Sutarjo No. 245, Pekanbaru 82421, Kepri', '2026-10-25 06:02:28', '2026-11-05 09:27:10', NULL),
(2, '0085942309', 'Janet Lestari, S.Si., M.Cs', 'hani10@example.org', '085775938749', 'Dk. Raden Saleh No. 538, Padangsidempuan 27104, Aceh', '2026-10-25 06:02:28', '2026-10-25 06:02:28', NULL),
(3, '0063689673', 'Usman Nasyidah, S.T., M.T.', 'wacana.malik@example.com', '085016059460', 'Jr. Baiduri No. 275, Tangerang 54171, Gorontalo', '2026-10-25 06:02:28', '2026-10-25 06:02:28', NULL),
(4, '0064122331', 'Hadi Dabukke, S.Si., M.Cs', 'nashiruddin.najwa@example.com', '084770399598', 'Jln. Basoka Raya No. 839, Blitar 78087, Papua', '2026-10-25 06:02:28', '2026-10-25 06:02:28', NULL),
(5, '0021198290', 'Laras Yolanda, S.Kom., M.Eng.', 'wahyu.firgantoro@example.net', '087239520661', 'Dk. Muwardi No. 647, Subulussalam 74504, DIY', '2026-10-25 06:02:28', '2026-10-25 06:02:28', NULL),
(6, '0098870279', 'Zahra Namaga, S.Kom., M.Kom.', 'carla57@example.net', '080268798415', 'Kpg. Bak Air No. 633, Sibolga 96192, Pabar', '2026-10-25 06:02:28', '2026-10-25 06:02:28', NULL),
(7, '0006402859', 'Sabar Situmorang, S.Kom., M.Kom.', 'kprakasa@example.com', '089161522490', 'Ki. Bakit  No. 245, Prabumulih 80089, Bengkulu', '2026-10-25 06:02:28', '2026-10-25 06:02:28', NULL),
(8, '0040511741', 'Belinda Suartini, S.T., M.T.', 'cagak.siregar@example.org', '080031943934', 'Psr. Sunaryo No. 606, Bitung 83350, Sulbar', '2026-10-25 06:02:28', '2026-10-25 06:02:28', NULL),
(9, '0074957920', 'Garang Suartini, S.Si., M.Cs', 'cager73@example.org', '084821982206', 'Psr. Cemara No. 541, Prabumulih 86723, Bali', '2026-10-25 06:02:28', '2026-10-25 06:02:28', NULL),
(10, '0006262700', 'Chandra Budiyanto, S.Si., M.Cs', 'rsaragih@example.com', '088690451404', 'Kpg. Tentara Pelajar No. 200, Singkawang 82397, Gorontalo', '2026-10-25 06:02:28', '2026-10-25 06:02:28', NULL),
(1005, '0047851115', 'Dosen Uji Satu', 'tanayadzakiyyaisnania1@gmail.com', '082323885348', NULL, '2026-11-10 08:20:11', '2026-11-10 08:20:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `krs`
--

CREATE TABLE `krs` (
  `id` bigint UNSIGNED NOT NULL,
  `mahasiswa_id` bigint UNSIGNED NOT NULL,
  `tahun_akademik` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` enum('Ganjil','Genap') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('draft','diajukan','disetujui','ditolak') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `krs`
--

INSERT INTO `krs` (`id`, `mahasiswa_id`, `tahun_akademik`, `semester`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '2026/2027', 'Ganjil', 'draft', '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(2, 2, '2026/2027', 'Ganjil', 'draft', '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(3, 3, '2026/2027', 'Ganjil', 'draft', '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(4, 4, '2026/2027', 'Ganjil', 'draft', '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(5, 5, '2026/2027', 'Ganjil', 'draft', '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(6, 6, '2026/2027', 'Ganjil', 'draft', '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(7, 7, '2026/2027', 'Ganjil', 'draft', '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(8, 8, '2026/2027', 'Ganjil', 'draft', '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(9, 9, '2026/2027', 'Ganjil', 'draft', '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(10, 10, '2026/2027', 'Ganjil', 'draft', '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(11, 55, '2026/2027', 'Genap', 'disetujui', '2026-11-10 08:25:44', '2026-11-10 08:25:44');

-- --------------------------------------------------------

--
-- Table structure for table `krs_detail`
--

CREATE TABLE `krs_detail` (
  `id` bigint UNSIGNED NOT NULL,
  `krs_id` bigint UNSIGNED NOT NULL,
  `mata_kuliah_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `krs_detail`
--

INSERT INTO `krs_detail` (`id`, `krs_id`, `mata_kuliah_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(2, 1, 2, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(3, 1, 4, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(4, 1, 5, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(5, 1, 6, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(6, 2, 9, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(7, 2, 10, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(8, 2, 2, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(9, 2, 1, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(10, 2, 4, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(11, 3, 2, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(12, 3, 4, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(13, 3, 10, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(14, 3, 9, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(15, 3, 7, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(16, 4, 1, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(17, 4, 4, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(18, 4, 9, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(19, 4, 7, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(20, 4, 10, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(21, 5, 9, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(22, 5, 6, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(23, 5, 8, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(24, 5, 2, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(25, 5, 4, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(26, 6, 2, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(27, 6, 9, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(28, 6, 3, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(29, 6, 7, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(30, 6, 8, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(31, 7, 10, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(32, 7, 7, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(33, 7, 2, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(34, 7, 5, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(35, 7, 4, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(36, 8, 1, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(37, 8, 3, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(38, 8, 6, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(39, 8, 10, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(40, 8, 5, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(41, 9, 5, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(42, 9, 4, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(43, 9, 1, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(44, 9, 8, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(45, 9, 9, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(46, 10, 4, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(47, 10, 8, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(48, 10, 1, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(49, 10, 10, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(50, 10, 7, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(51, 1, 1, '2026-11-10 08:24:17', '2026-11-10 08:24:17'),
(52, 1, 7, '2026-11-10 08:24:17', '2026-11-10 08:24:17'),
(53, 11, 1, '2026-11-10 08:25:44', '2026-11-10 08:25:44'),
(54, 11, 4, '2026-11-10 08:25:44', '2026-11-10 08:25:44'),
(55, 11, 5, '2026-11-10 08:25:44', '2026-11-10 08:25:44'),
(56, 11, 6, '2026-11-10 08:25:44', '2026-11-10 08:25:44'),
(57, 11, 7, '2026-11-10 08:25:44', '2026-11-10 08:25:44'),
(58, 11, 8, '2026-11-10 08:25:44', '2026-11-10 08:25:44'),
(59, 11, 9, '2026-11-10 08:25:44', '2026-11-10 08:25:44'),
(60, 11, 10, '2026-11-10 08:25:44', '2026-11-10 08:25:44');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` bigint UNSIGNED NOT NULL,
  `nim` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` enum('L','P') COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `angkatan` smallint UNSIGNED NOT NULL,
  `program_studi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'D3 Teknik Informatika',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `nim`, `nama`, `jenis_kelamin`, `email`, `angkatan`, `program_studi`, `created_at`, `updated_at`) VALUES
(1, '2203037646', 'Kenes Laksmiwati', 'L', '2203037646@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(2, '2403037502', 'Widya Yolanda', 'P', '2403037502@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(3, '2303034876', 'Novi Halim', 'P', '2303034876@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(4, '2303039340', 'Ayu Suwarno', 'P', '2303039340@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(5, '2303033239', 'Raisa Mardhiyah', 'P', '2303033239@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(6, '2403035688', 'Zizi Nasyidah', 'P', '2403035688@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(7, '2303037612', 'Ika Farida', 'P', '2303037612@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(8, '2503038177', 'Ciaobella Mulyani', 'P', '2503038177@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(9, '2403030509', 'Elma Mardhiyah', 'P', '2403030509@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(10, '2203031007', 'Raden Yuliarti', 'L', '2203031007@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(11, '2403035477', 'Damu Hasanah', 'L', '2403035477@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(12, '2303031122', 'Darman Yuniar', 'L', '2303031122@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(13, '2503030728', 'Jumadi Hastuti', 'L', '2503030728@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(14, '2503033768', 'Laksana Mulyani', 'L', '2503033768@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(15, '2503033057', 'Sakura Prasetyo', 'P', '2503033057@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(16, '2503036373', 'Kairav Winarsih', 'L', '2503036373@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(17, '2503031504', 'Ulya Tamba', 'P', '2503031504@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(18, '2303033080', 'Cakrawala Wastuti', 'L', '2303033080@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(19, '2503033152', 'Jaswadi Maryati', 'L', '2503033152@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(20, '2503037908', 'Daniswara Uyainah', 'L', '2503037908@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(21, '2503032606', 'Bajragin Rahimah', 'L', '2503032606@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(22, '2403038364', 'Yahya Rahimah', 'L', '2403038364@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(23, '2303032113', 'Darsirah Natsir', 'L', '2303032113@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(24, '2203030931', 'Garang Irawan', 'L', '2203030931@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(25, '2303035915', 'Umi Wahyuni', 'P', '2303035915@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(26, '2403030679', 'Cici Budiman', 'P', '2403030679@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(27, '2303031480', 'Tira Damanik', 'P', '2303031480@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(28, '2203036840', 'Cinta Usamah', 'P', '2203036840@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(29, '2503030389', 'Padma Hariyah', 'P', '2503030389@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(30, '2503035469', 'Waluyo Yuniar', 'L', '2503035469@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(31, '2303037321', 'Zizi Wijaya', 'P', '2303037321@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(32, '2403033182', 'Hani Wastuti', 'P', '2403033182@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-25 06:02:28', '2026-10-25 06:02:28'),
(33, '2203039198', 'Widya Simanjuntak', 'P', '2203039198@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(34, '2203036964', 'Cengkir Mulyani', 'L', '2203036964@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(35, '2503037821', 'Malika Hakim', 'P', '2503037821@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(36, '2303033794', 'Endra Hutasoit', 'L', '2303033794@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(37, '2303037159', 'Amelia Sudiati', 'P', '2303037159@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(38, '2203039787', 'Prima Iswahyudi', 'L', '2203039787@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(39, '2203031783', 'Jasmin Megantara', 'P', '2203031783@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(40, '2203038651', 'Paris Mahendra', 'P', '2203038651@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(41, '2203033658', 'Hasan Mandasari', 'L', '2203033658@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(42, '2303030738', 'Wardi Pertiwi', 'L', '2303030738@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(43, '2403033802', 'Victoria Pradipta', 'P', '2403033802@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(44, '2503036584', 'Digdaya Riyanti', 'L', '2503036584@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(45, '2503038410', 'Yoga Budiman', 'L', '2503038410@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(46, '2303038865', 'Paiman Nasyidah', 'L', '2303038865@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(47, '2303030461', 'Estiawan Prayoga', 'L', '2303030461@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(48, '2203038130', 'Cahyanto Rajasa', 'L', '2203038130@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(49, '2303038043', 'Tiara Lestari', 'P', '2303038043@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(50, '2203033206', 'Oskar Salahudin', 'L', '2203033206@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(55, '3202416066', 'Tanaya Dzakiyya Isnania', 'P', 'tanayadzakiyyaisnania1@gmail.com', 2024, 'D3 Teknik Informatika', '2026-11-10 08:17:54', '2026-11-10 08:17:54');

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `id` bigint UNSIGNED NOT NULL,
  `kode_mk` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_mk` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sks` tinyint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`id`, `kode_mk`, `nama_mk`, `sks`, `created_at`, `updated_at`) VALUES
(1, 'TI101', 'Pengantar Teknologi Informasi', 2, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(2, 'TI102', 'Algoritma Pemrograman', 3, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(3, 'TI103', 'Matematika Diskrit', 3, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(4, 'TI201', 'Basis Data', 3, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(5, 'TI202', 'Desain Web', 3, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(6, 'TI203', 'Pemrograman Web', 3, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(7, 'TI204', 'Jaringan Komputer', 3, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(8, 'TI301', 'Rekayasa Perangkat Lunak', 3, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(9, 'TI302', 'Pemrograman Berorientasi Objek', 3, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(10, 'TI303', 'Sistem Operasi', 2, '2026-10-25 06:02:29', '2026-10-25 06:02:29'),
(15, 'TI304', 'Bahasa Inggris', 2, '2026-11-10 08:23:11', '2026-11-10 08:23:11');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_10_20_110329_add_role_to_users_table', 1),
(5, '2026_10_20_112352_create_dosen_table', 1),
(6, '2026_10_20_112406_create_mahasiswa_table', 1),
(7, '2026_10_20_112418_create_mata_kuliah_table', 1),
(8, '2026_10_25_064054_create_krs_table', 1),
(9, '2026_10_25_064107_create_krs_detail_table', 1),
(10, '2026_10_25_100026_add_role_column_to_users_table', 1),
(11, '2026_10_25_124146_add_jabatan_fungsional_to_dosen_table', 1),
(12, '2026_10_29_172430_add_last_login_at_to_users_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('6z5DOI8dAfUwSLqkxjJrzIfBqpYFWshaBGn7xghK', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiMVZnMXVFdmxYNVNGVzlZWDBEeEROWnpaZUxIRTJYVWdaSHo0TGRZZiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvZGFzaGJvYXJkIjtzOjU6InJvdXRlIjtzOjk6ImRhc2hib2FyZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjQ6IjJkNzViNjc5YjZmNmZjM2U0YjBiMWU4ZTk1NzY1OGFmMGJkMjJlMWNhNDVkMDg2NThlMzMwZjBjZDBhZmM4MDYiO30=', 1794296545),
('ByVfFFZmdxssorY6LuCuiCCW0S4eBdMCrLxe1mcB', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRmMwQUtjVUdrWk80cVpGNmY0V1o1SUVpdU9DUlNBcGlMSXh6OFoyciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kb3Nlbi9jcmVhdGUiO3M6NToicm91dGUiO3M6MTI6ImRvc2VuLmNyZWF0ZSI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjQ6IjUwNmJkMjIwM2Q0MWVhMzMzMjRmNjFjYmYyOGYwYjcwMDk1MzI5MGUxOGVjODU4ODQ4OGNlNWQ2ZTIzZDUzZTciO30=', 1794299416),
('UUQOwmbMV7gTRFiwYDpGBz2SojakS3BniAmYZLEQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiaGxiZUhic2FXVENwWTdWT2FMYWxWYXBpWnFRZGtFMmxsVXhyMVo0USI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1794294285);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','dosen','mahasiswa') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'mahasiswa',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`, `last_login_at`) VALUES
(1, 'Administrator SIAKAD', 'admin@siakad.test', NULL, '$2y$12$HSh65zazFo9ID6lJy/zlsewBzmcthCJj.2OSQzOkmGHNh7bENMWfO', 'admin', 'OtYx5NhXpaivT1ycGkJOgbDFKqnbnxHjbhtcLErPzICWD02ym9hiZl7oMMND', '2026-10-25 06:02:28', '2026-11-10 08:14:23', '2026-11-10 08:14:23'),
(2, 'Dosen Uji', 'dosen@siakad.test', NULL, '$2y$12$Cr8xvqiHuhqNztKRuTmqvOoJ4YVybZheyHq8iYq8cmiPJ5BDTHIM2', 'dosen', NULL, '2026-10-25 06:02:29', '2026-11-10 08:27:53', '2026-11-10 08:27:53'),
(3, 'Mahasiswa Uji', 'mahasiswa@siakad.test', NULL, '$2y$12$LV/66c2.K/68qNLW00ekbeeu1zlHVF1IGqyp/LXmzlXqBfN0Hp9AS', 'mahasiswa', NULL, '2026-10-25 06:02:29', '2026-11-10 08:29:33', '2026-11-10 08:29:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dosen_nidn_unique` (`nidn`),
  ADD UNIQUE KEY `dosen_email_unique` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `krs`
--
ALTER TABLE `krs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `krs_mahasiswa_id_tahun_akademik_semester_unique` (`mahasiswa_id`,`tahun_akademik`,`semester`);

--
-- Indexes for table `krs_detail`
--
ALTER TABLE `krs_detail`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `krs_detail_krs_id_mata_kuliah_id_unique` (`krs_id`,`mata_kuliah_id`),
  ADD KEY `krs_detail_mata_kuliah_id_foreign` (`mata_kuliah_id`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mahasiswa_nim_unique` (`nim`),
  ADD UNIQUE KEY `mahasiswa_email_unique` (`email`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mata_kuliah_kode_mk_unique` (`kode_mk`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1006;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `krs`
--
ALTER TABLE `krs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `krs_detail`
--
ALTER TABLE `krs_detail`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `krs`
--
ALTER TABLE `krs`
  ADD CONSTRAINT `krs_mahasiswa_id_foreign` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswa` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `krs_detail`
--
ALTER TABLE `krs_detail`
  ADD CONSTRAINT `krs_detail_krs_id_foreign` FOREIGN KEY (`krs_id`) REFERENCES `krs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `krs_detail_mata_kuliah_id_foreign` FOREIGN KEY (`mata_kuliah_id`) REFERENCES `mata_kuliah` (`id`) ON DELETE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
