-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 13, 2024 at 03:51 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko8`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role` enum('admin','owner') DEFAULT NULL,
  `cookie` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `role`, `cookie`) VALUES
(1, 'admin', '$2y$10$N7SIaNnC1vbmEgeRX5Vx1e3q1kPEdTnVEUwX3z0dKnmXL6QawdR4O', 'admin', 'jVVei3128F6bfusLMDAJrdm2gHFoNlkOP4Mr5OvYWsmBjq6Wh8tGcQyaZSUpEBQT'),
(2, 'owner', '$2y$10$N7SIaNnC1vbmEgeRX5Vx1e3q1kPEdTnVEUwX3z0dKnmXL6QawdR4O', 'owner', 'jVVei3128F6bfusLMDAJrdm2gHFoNlkOP4Mr5OvYWsmBjq6Wh8tGcQyaZSUpEBQT');

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `img` varchar(30) NOT NULL,
  `url` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `img`, `url`) VALUES
(22, '1718087827976.png', '#'),
(24, '1718089903731.png', '#');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `product_name` varchar(150) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `img` varchar(30) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `weight` int(11) NOT NULL,
  `ket` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `slug` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `icon`, `slug`) VALUES
(6, 'Pakaian Pria', '1586527494296.png', 'pakaian-pria'),
(7, 'Pakaian Wanita', '1586527510434.png', 'pakaian-wanita');

-- --------------------------------------------------------

--
-- Table structure for table `cod`
--

CREATE TABLE `cod` (
  `id` int(11) NOT NULL,
  `regency_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complain`
--

CREATE TABLE `complain` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nohp` varchar(255) NOT NULL,
  `complain` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complain`
--

INSERT INTO `complain` (`id`, `user_id`, `nama`, `nohp`, `complain`, `created_at`) VALUES
(4, 13, 'Bintang Indrawan', '0895358920923', 'Barang rusak', '2024-09-01 09:30:28');

-- --------------------------------------------------------

--
-- Table structure for table `cost_delivery`
--

CREATE TABLE `cost_delivery` (
  `id` int(11) NOT NULL,
  `destination` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cost_delivery`
--

INSERT INTO `cost_delivery` (`id`, `destination`, `price`) VALUES
(2, 92, 20000);

-- --------------------------------------------------------

--
-- Table structure for table `email_send`
--

CREATE TABLE `email_send` (
  `id` int(11) NOT NULL,
  `mail_to` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `email_send`
--

INSERT INTO `email_send` (`id`, `mail_to`, `subject`, `message`) VALUES
(10, 22, 'Test', '<p>Halo</p>');

-- --------------------------------------------------------

--
-- Table structure for table `footer`
--

CREATE TABLE `footer` (
  `id` int(11) NOT NULL,
  `page` int(11) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `footer`
--

INSERT INTO `footer` (`id`, `page`, `type`) VALUES
(1, 1, 1),
(2, 3, 1),
(3, 2, 2),
(4, 1, 1),
(5, 4, 1),
(6, 5, 1),
(7, 6, 2),
(8, 7, 2),
(9, 8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `general`
--

CREATE TABLE `general` (
  `id` int(11) NOT NULL,
  `app_name` varchar(50) NOT NULL,
  `slogan` varchar(150) NOT NULL,
  `navbar_color` varchar(10) NOT NULL,
  `api_rajaongkir` varchar(70) NOT NULL,
  `host_mail` varchar(50) NOT NULL,
  `port_mail` varchar(10) NOT NULL,
  `crypto_smtp` varchar(20) NOT NULL,
  `account_gmail` varchar(50) NOT NULL,
  `pass_gmail` varchar(50) NOT NULL,
  `whatsapp` varchar(20) NOT NULL,
  `whatsappv2` varchar(20) NOT NULL,
  `email_contact` varchar(50) NOT NULL,
  `server_api_midtrans` varchar(150) NOT NULL,
  `client_api_midtrans` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `general`
--

INSERT INTO `general` (`id`, `app_name`, `slogan`, `navbar_color`, `api_rajaongkir`, `host_mail`, `port_mail`, `crypto_smtp`, `account_gmail`, `pass_gmail`, `whatsapp`, `whatsappv2`, `email_contact`, `server_api_midtrans`, `client_api_midtrans`) VALUES
(1, 'Diyah Collection', 'DiyahCollection - Fashion Kekinian', '#005CAA', 'dd3be2dc9ba9a0e5e4a397869e7c4a05', 'ssl://smtp.googlemail.com', '465', '', 'backsnap297@gmail.com', 'jzdvvnzkkmtsjmic', '082220690398', '0895358920923', 'iburodiah3@gmail.com', 'SB-Mid-server-5UgYgutSRIaaGpYIRaY5Vtxb', 'SB-Mid-client-yxuEtwM5wImFlGWH');

-- --------------------------------------------------------

--
-- Table structure for table `grosir`
--

CREATE TABLE `grosir` (
  `id` int(11) NOT NULL,
  `min` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `img_product`
--

CREATE TABLE `img_product` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `img` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `img_product`
--

INSERT INTO `img_product` (`id`, `id_product`, `img`) VALUES
(1, 22, '1589840767903.jpg'),
(2, 22, '1589840786550.jpg'),
(5, 22, '1589840836102.jpg'),
(7, 29, '1621436002940.jpg'),
(8, 8, '1621436022420.jpg'),
(9, 8, '1621436027602.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `invoice_code` varchar(10) NOT NULL,
  `label` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telp` varchar(20) NOT NULL,
  `province` int(11) NOT NULL,
  `regency` int(11) NOT NULL,
  `district` varchar(50) NOT NULL,
  `village` varchar(50) NOT NULL,
  `zipcode` int(11) NOT NULL,
  `address` text NOT NULL,
  `courier` varchar(5) NOT NULL,
  `courier_service` varchar(70) NOT NULL,
  `ongkir` varchar(10) NOT NULL,
  `total_price` int(11) NOT NULL,
  `total_all` int(11) NOT NULL,
  `date_input` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL,
  `alasan_cancel` text DEFAULT NULL,
  `rekening_pengembalian` varchar(256) DEFAULT NULL,
  `nama_rekening_pengembalian` text DEFAULT NULL,
  `resi` varchar(30) NOT NULL,
  `pay_status` varchar(30) NOT NULL,
  `link_pay` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `user`, `invoice_code`, `label`, `name`, `email`, `telp`, `province`, `regency`, `district`, `village`, `zipcode`, `address`, `courier`, `courier_service`, `ongkir`, `total_price`, `total_all`, `date_input`, `status`, `alasan_cancel`, `rekening_pengembalian`, `nama_rekening_pengembalian`, `resi`, `pay_status`, `link_pay`) VALUES
(92, 12, '1216888667', 'Dsn. Gunungpandak Rt', 'Rama kun', 'member@gmail.com', '082244812291', 11, 75, 'jhjh', 'jjh', 65174, 'jhjhj', 'jne', 'REG', '22000', 35000, 57000, '2024-06-21 13:51:07', 4, NULL, NULL, NULL, '0', 'settlement', ''),
(93, 12, '1211197771', 'Dsn. Gunungpandak Rt', 'Rama kun', 'member@gmail.com', '082244812291', 11, 74, 'nkj', 'jkj', 65174, 'kjkj', 'jne', 'REG', '22000', 35000, 57000, '2024-06-21 13:52:51', 4, NULL, NULL, NULL, '0', 'settlement', ''),
(94, 12, '1261688134', 'Dsn. Gunungpandak Rt', 'Rama kun', 'member@gmail.com', '082244812291', 11, 75, 'hjhj', 'jhjhj', 65174, 'jjh', 'pos', 'Pos Kargo', '60000', 50000, 110000, '2024-06-21 13:58:54', 4, NULL, NULL, NULL, '0', 'settlement', ''),
(95, 12, '1253774275', 'Dsn. Gunungpandak Rt', 'Rama kun', 'member@gmail.com', '082244812291', 11, 51, 'mk', 'kk', 65174, 'kjkj', 'jne', 'REG', '22000', 35000, 57000, '2024-06-21 14:01:15', 4, NULL, NULL, NULL, '0', 'settlement', ''),
(96, 12, '1211320263', 'Dsn. Gunungpandak Rt', 'Rama kun', 'member@gmail.com', '082244812291', 11, 255, 'HJHJ', 'HJHJH', 65174, 'Dsn. Gunungpandak Rt/Rw : 34/04', 'tiki', 'ECO', '19000', 35000, 54000, '2024-06-21 16:31:03', 0, NULL, NULL, NULL, '0', '', ''),
(97, 12, '1217212125', 'Dsn. Gunungpandak Rt', 'Rama kun', 'member@gmail.com', '082244812291', 11, 255, 'Pagelaran', 'Kademangan', 65174, 'Dsn. Gunungpandak Rt/Rw : 34/04', 'jne', 'REG', '22000', 85000, 107000, '2024-06-28 18:45:25', 4, NULL, NULL, NULL, '123456', 'settlement', 'https://app.sandbox.midtrans.com/snap/v1/transactions/f57f5d9a-37b0-4e24-9410-def2507e1e66/pdf'),
(98, 12, '1215087123', 'Desa Kluwut, RT 5 RW', 'Amar Maaruf', 'member@gmail.com', '0895358920923', 2, 29, 'ada', 'adad', 52253, 'Desa Kluwut, RT 5 RW 16', 'jne', 'REG', '52000', 50000, 102000, '2024-06-30 20:45:23', 4, NULL, NULL, NULL, '123', 'settlement', 'https://app.sandbox.midtrans.com/snap/v1/transactions/4ce32745-67fd-4da7-b146-a13e0086e5d1/pdf'),
(99, 12, '1214333245', 'Desa Kluwut, RT 4 RW', 'Bintang Indrawan', 'member@gmail.com', '0895358920923', 10, 41, 'adad', 'adad', 52253, 'Desa Kluwut, RT 4 RW 1', 'pos', 'Pos Reguler', '10000', 85000, 95000, '2024-07-01 16:47:25', 4, NULL, NULL, NULL, '1234', 'settlement', 'https://app.sandbox.midtrans.com/snap/v1/transactions/232f5a48-c4ee-4e54-83ce-a4bfb075d2fa/pdf'),
(100, 13, '1311845011', 'Desa Kluwut, RT 4 RW', 'Bintang Indrawan', 'indrawanbintang07@gmail.com', '0895358920923', 10, 37, 'tes', 'tes', 52253, 'Desa Kluwut, RT 4 RW 1', 'pos', 'Pos Reguler', '11000', 35000, 46000, '2024-07-03 09:00:11', 4, NULL, NULL, NULL, '1234', 'settlement', 'https://app.sandbox.midtrans.com/snap/v1/transactions/5c090e34-4eba-478d-bbea-774c8748cba6/pdf'),
(101, 12, '1214039494', 'Desa Kluwut, RT 4 RW', 'Bintang Indrawan', 'member@gmail.com', '0895358920923', 11, 75, 'aadsad', 'adada', 52253, 'Desa Kluwut, RT 4 RW 1', 'tiki', 'REG', '24500', 50000, 74500, '2024-07-05 18:38:14', 4, NULL, NULL, NULL, '1234', 'settlement', 'https://app.sandbox.midtrans.com/snap/v1/transactions/aaa7e714-871b-4065-93cb-212d6d557cb8/pdf'),
(102, 12, '1250591204', 'Desa Kluwut, RT 4 RW', 'Bintang Indrawan', 'member@gmail.com', '0895358920923', 10, 41, 'Bulakamba', 'Brebes', 52253, 'Desa Kluwut, RT 4 RW 1', 'jne', 'REG', '8000', 35000, 43000, '2024-07-18 18:30:04', 4, NULL, NULL, NULL, '1234', 'settlement', 'https://app.sandbox.midtrans.com/snap/v1/transactions/16e0b91c-6135-4bba-8516-d164baed4288/pdf'),
(103, 12, '1218986602', 'Desa Kluwut, RT 4 RW', 'Bintang Indrawan', 'member@gmail.com', '0895358920923', 10, 49, 'adad', 'adad', 52253, 'Desa Kluwut, RT 4 RW 1', 'jne', 'JTR', '100000', 35000, 135000, '2024-07-19 09:20:02', 0, NULL, NULL, NULL, '0', 'settlement', 'https://app.sandbox.midtrans.com/snap/v1/transactions/38777375-af0b-413c-ae64-15242cd1bf48/pdf'),
(104, 12, '1215002344', 'Desa Kluwut, RT 4 RW', 'Bintang Indrawan', 'member@gmail.com', '0895358920923', 10, 92, 'Bulakamba', 'Kluwuwt', 52253, 'Desa Kluwut, RT 4 RW 1', 'jne', 'JTR', '40000', 50000, 90000, '2024-08-08 13:42:24', 4, NULL, NULL, NULL, '1234', 'settlement', 'https://app.sandbox.midtrans.com/snap/v1/transactions/32c3af4c-5469-4c67-9a7a-7bce912eb955/pdf'),
(105, 13, '1368633358', 'Desa Kluwut, RT 4 RW', 'Bintang Indrawan', 'indrawanbintang07@gmail.com', '0895358920923', 10, 41, 'bulakamba', 'brebes', 52253, 'Desa Kluwut, RT 4 RW 1', 'jne', 'REG', '8000', 50000, 58000, '2024-08-28 10:55:59', 0, NULL, NULL, NULL, '0', 'pending', 'https://app.sandbox.midtrans.com/snap/v1/transactions/bd5d3cf5-4594-4f61-a8f2-7100a4c57325/pdf');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `link` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `title`, `link`) VALUES
(1, 'Home', ''),
(2, 'Produk', ''),
(3, 'Testimoni', 'testimoni'),
(4, 'Kontak', 'contact'),
(7, 'Pembayaran', 'payment/confirmation'),
(8, 'Complain', 'complain');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `slug` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `content`, `slug`) VALUES
(1, 'Tentang Kami', '<p>Toko Diyah Collection merupakan toko yang berada di Desa Kluwut, Kecamatan Bulakamba, Kabupaten Brebes sejak tahun 2007. Toko Diyah Collection memiliki fokus utama pada penjualan pakaian berbagai macam koleksi dan memenuhi kebutuhan konsumen dengan gaya yang beragam. Toko Diyah Collectiion bekerjasama dengan para Supplier yang menyediakan stock barang untuk dijual, sehingga bisa membuat konsumen tertarik pada barang yang tersedia dan mendukung penjualan pada toko Diyah Collection. Sistem yang akan di buat nanti pembelian dan pemesanan dapat di beli dan di pesan melalui sistem web.</p>', 'about'),
(2, 'Kontak Kami', '<p>Hubungi Tim Penjualan Kami</p><p><strong>Toko Diyah Collection</strong><br>Kluwut, Kec. Bulakamba, Kabupaten Brebes, Jawa Tengah 52253</p><p><strong>Layanan Pengembalian Barang &amp; Refund</strong><br>Jika produk yang diterima salah/cacat/rusak &amp; ingin mengurus pengembalian dana, untuk laporan dan bantuan dapat menghubungi kami email iburodiah3@gmail.com atau hubungi WhatsApp 082220690398</p>', 'contact'),
(3, 'Testimoni', '<p>redirect page</p>', 'testimoni'),
(4, 'Kebijakan Privasi', '', 'privacy-policy'),
(5, 'Syarat dan Ketentuan', '', 'terms'),
(6, 'Cara Berbelanja', '', 'shopping-help'),
(7, 'Pengiriman Barang', '', 'pengiriman-barang');

-- --------------------------------------------------------

--
-- Table structure for table `payment_proof`
--

CREATE TABLE `payment_proof` (
  `id` int(11) NOT NULL,
  `invoice` varchar(30) NOT NULL,
  `file` varchar(30) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `bayar` int(11) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Belum Bayar',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id`, `supplier_id`, `product_id`, `harga`, `qty`, `bayar`, `status`, `created_at`) VALUES
(4, 3, 1, 35000, 1, 75000, 'Sudah Bayar', '2024-05-17 09:39:09'),
(5, 3, 1, 10000, 0, 10000, 'Sudah Bayar', '2024-06-03 15:40:38'),
(6, 3, 10, 1000, 0, 2000, 'Sudah Bayar', '2024-06-03 15:41:11'),
(7, 4, 31, 20000, 0, 20000, 'Sudah Bayar', '2024-06-11 09:29:21'),
(8, 4, 31, 10000, 0, 10000, 'Sudah Bayar', '2024-06-11 09:30:22'),
(9, 4, 32, 1000, 0, 1000, 'Sudah Bayar', '2024-06-11 09:40:29'),
(10, 4, 31, 10000, 0, 10000, 'Sudah Bayar', '2024-06-11 09:45:12'),
(11, 4, 31, 1000, 0, 1000, 'Sudah Bayar', '2024-06-11 10:25:54'),
(12, 4, 32, 1000, 1, 2000, 'Sudah Bayar', '2024-06-11 10:42:07'),
(13, 4, 31, 1000, 0, 1000, 'Sudah Bayar', '2024-06-11 10:44:11'),
(14, 4, 31, 1000, 0, 1000, 'Sudah Bayar', '2024-06-11 11:21:56'),
(15, 4, 31, 1000, 0, 1000, 'Sudah Bayar', '2024-06-11 11:30:38'),
(16, 4, 32, 1000, 1, 3000, 'Sudah Bayar', '2024-06-11 11:36:35'),
(17, 4, 31, 10000, 0, 100000, 'Sudah Bayar', '2024-06-11 11:39:55'),
(18, 4, 31, 10000, 1, 50000, 'Sudah Bayar', '2024-06-11 11:48:38'),
(19, 4, 31, 20000, 0, 80000, 'Sudah Bayar', '2024-06-16 23:10:50'),
(20, 4, 31, 10000, 1, 10000, 'Sudah Bayar', '2024-06-18 12:39:44'),
(21, 4, 31, 10000, 0, 10000, 'Sudah Bayar', '2024-06-20 10:43:08'),
(22, 4, 31, 12000, 2, 24000, 'Sudah Bayar', '2024-06-20 10:47:01'),
(23, 4, 31, 10000, 2, 20000, 'Sudah Bayar', '2024-06-20 12:00:47'),
(24, 4, 31, 10000, 1, NULL, 'Belum Bayar', '2024-07-06 17:54:00'),
(25, 4, 31, 10000, 1, NULL, 'Belum Bayar', '2024-07-07 08:55:44'),
(26, 4, 31, 10000, 2, 20000, 'Sudah Bayar', '2024-07-18 18:28:58'),
(27, 10, 31, 10000, 0, 20000, 'Sudah Bayar', '2024-07-19 11:27:58'),
(28, 10, 32, 10000, 3, 30000, 'Sudah Bayar', '2024-08-08 13:41:27');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `condit` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `img` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `date_submit` datetime NOT NULL,
  `publish` int(11) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `transaction` int(11) NOT NULL,
  `promo_price` int(11) NOT NULL,
  `viewer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `price`, `stock`, `category`, `condit`, `weight`, `img`, `description`, `date_submit`, `publish`, `slug`, `transaction`, `promo_price`, `viewer`) VALUES
(31, 'Winter Sweater', 35000, 1, 7, 1, 500, '1718072784835.jpg', '<p>Material katun kombinasi tidak transparan, ringan dan tidak stretch</p><p>NB: Warna pada gambar dapat sedikit berbeda dengan warna asli produk akibat pencahayaan saat proses photoshoot.</p>', '2024-06-11 09:26:24', 1, 'winter-sweater', 9, 0, 122),
(32, 'Kemeja Flanel Biru', 50000, 2, 6, 1, 400, '1718072861486.jpg', '<p>Kemeja berbahan twill katun kotak-kotak yang lembut dengan kerah turn-down, bagian depan klasik, dan kuk di bagian belakang. Pakaian santai dengan lengan panjang dengan manset berkancing dan saku rok lengan dengan kancing penghubung, saku dada terbuka, dan keliman membulat.</p>', '2024-06-11 09:27:41', 1, 'kemeja-flanel-biru', 6, 0, 49);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `star` int(11) NOT NULL DEFAULT 0,
  `ulasan` text DEFAULT NULL,
  `invoice_code` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`id`, `user_id`, `product_id`, `star`, `ulasan`, `invoice_code`) VALUES
(7, 12, 31, 3, 'Test', '1211197771'),
(9, 12, 31, 5, 'Bagus', '1217212125'),
(10, 12, 32, 3, 'iajaj', '1215087123'),
(11, 12, 31, 4, 'Bagus', '1214333245'),
(12, 12, 32, 4, 'p', '1214333245'),
(13, 13, 31, 5, 'Barangnya bagus', '1311845011');

-- --------------------------------------------------------

--
-- Table structure for table `rekening`
--

CREATE TABLE `rekening` (
  `id` int(11) NOT NULL,
  `rekening` varchar(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `rekening`
--

INSERT INTO `rekening` (`id`, `rekening`, `name`, `number`) VALUES
(1, 'DANA', 'Toni Suwendi', '088215005600'),
(3, 'GOPAY', 'Toni Suwendi', '088215005600'),
(7, 'OVO', 'Toni Suwendi', '088215005600');

-- --------------------------------------------------------

--
-- Table structure for table `retur_pembelian`
--

CREATE TABLE `retur_pembelian` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `pembelian_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Pending',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `retur_pembelian`
--

INSERT INTO `retur_pembelian` (`id`, `supplier_id`, `pembelian_id`, `product_id`, `qty`, `harga`, `status`, `created_at`) VALUES
(3, 3, 4, 1, 1, 35000, 'Selesai', '2024-05-24 14:14:38'),
(4, 0, 5, 0, 1, 10000, 'Pending', '2024-06-03 15:40:48'),
(5, 0, 6, 0, 2, 2000, 'Pending', '2024-06-03 15:41:33'),
(6, 0, 7, 0, 1, 20000, 'Pending', '2024-06-11 09:29:47'),
(7, 0, 8, 0, 1, 10000, 'Pending', '2024-06-11 09:30:36'),
(8, 0, 9, 0, 1, 1000, 'Pending', '2024-06-11 09:40:43'),
(9, 0, 10, 0, 1, 10000, 'Pending', '2024-06-11 09:45:29'),
(10, 0, 11, 0, 1, 1000, 'Pending', '2024-06-11 10:26:13'),
(11, 0, 12, 0, 1, 1000, 'Pending', '2024-06-11 10:43:10'),
(12, 0, 13, 0, 1, 1000, 'Pending', '2024-06-11 10:44:51'),
(13, 0, 14, 0, 1, 1000, 'Pending', '2024-06-11 11:22:15'),
(14, 0, 15, 31, 1, 1000, 'Pending', '2024-06-11 11:31:02'),
(15, 4, 16, 32, 2, 2000, 'Pending', '2024-06-11 11:37:00'),
(16, 4, 17, 31, 8, 80000, 'Selesai', '2024-06-11 11:40:27'),
(17, 4, 17, 31, 2, 20000, 'Pending', '2024-06-11 11:41:01'),
(18, 4, 18, 31, 4, 40000, 'Pending', '2024-06-11 11:49:16'),
(19, 4, 19, 31, 3, 60000, 'Pending', '2024-06-16 23:11:30'),
(20, 4, 19, 31, 1, 20000, 'Pending', '2024-06-17 12:40:29'),
(21, 4, 21, 31, 1, 10000, 'Selesai', '2024-06-20 10:44:13'),
(22, 10, 27, 31, 2, 20000, 'Selesai', '2024-07-19 11:28:28');

-- --------------------------------------------------------

--
-- Table structure for table `retur_penjualan`
--

CREATE TABLE `retur_penjualan` (
  `id` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `alasan` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `norek` varchar(255) DEFAULT NULL,
  `jenis_bank` varchar(255) DEFAULT NULL,
  `bukti` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `retur_penjualan`
--

INSERT INTO `retur_penjualan` (`id`, `id_invoice`, `product_name`, `qty`, `alasan`, `file`, `norek`, `jenis_bank`, `bukti`, `status`, `created_at`) VALUES
(7, 1261688134, 'Kemeja Flanel Biru', 1, 'klklk', 'LOGO_SIANWAR_V23.png', NULL, NULL, NULL, 'tolak', '2024-06-21 16:11:14'),
(8, 1214333245, 'Winter Sweater', 1, 'ga cocok', 'Group_1.png', '3394929', 'BCA', 'Frame_4.jpg', 'selesai', '2024-07-01 16:51:25');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `promo` int(11) NOT NULL,
  `promo_time` varchar(40) NOT NULL,
  `short_desc` text NOT NULL,
  `address` varchar(100) NOT NULL,
  `regency_id` int(11) NOT NULL,
  `verify` int(11) NOT NULL,
  `logo` varchar(30) NOT NULL,
  `favicon` varchar(30) NOT NULL,
  `default_ongkir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `promo`, `promo_time`, `short_desc`, `address`, `regency_id`, `verify`, `logo`, `favicon`, `default_ongkir`) VALUES
(1, 0, '2020-08-08T08:08', 'Toko online terlengkap dan terpercaya. Dapatkan penawaran dengan kualitas terbaik. Diyah Collection hadir untuk memenuhi kebutuhan Anda.', 'Jl. Raya Kluwut, Toko Diyah Collection Kluwut, Kec. Bulakamba, Kabupaten Brebes, Jawa Tengah 52253', 92, 1, '1718765966944.png', '1718766097335.png', 10000);

-- --------------------------------------------------------

--
-- Table structure for table `sosmed`
--

CREATE TABLE `sosmed` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `icon` varchar(20) NOT NULL,
  `link` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sosmed`
--

INSERT INTO `sosmed` (`id`, `name`, `icon`, `link`) VALUES
(1, 'Facebook', 'facebook-f', '#'),
(3, 'Twitter', 'twitter', '#'),
(5, 'Instagram', 'instagram', '#');

-- --------------------------------------------------------

--
-- Table structure for table `submenu`
--

CREATE TABLE `submenu` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `submenu` int(11) NOT NULL,
  `link` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `submenu`
--

INSERT INTO `submenu` (`id`, `name`, `submenu`, `link`) VALUES
(9, 'Pakaian Pria', 2, 'http://localhost/toko2/c/pakaian-pria'),
(10, 'Pakaian Wanita', 2, 'http://localhost/toko2/c/pakaian-wanita');

-- --------------------------------------------------------

--
-- Table structure for table `subscriber`
--

CREATE TABLE `subscriber` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date_subs` datetime NOT NULL,
  `code` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subscriber`
--

INSERT INTO `subscriber` (`id`, `email`, `date_subs`, `code`) VALUES
(0, 'Semua Email', '2020-04-21 13:59:23', ''),
(21, 'member@gmail.com', '2021-05-19 22:20:52', '1621437652141395667'),
(22, 'iburodiah3@gmail.com', '2024-06-16 23:20:15', '17185548151986526971'),
(23, 'indrawanbintang07@gmail.com', '2024-07-03 08:58:26', '1719971906462495844');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `nohp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `nama`, `alamat`, `nohp`) VALUES
(10, 'Test', 'Desa Kluwut, RT 4 RW 1', '0895358920923');

-- --------------------------------------------------------

--
-- Table structure for table `testimonial`
--

CREATE TABLE `testimonial` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `photo` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `rating` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `testimonial`
--

INSERT INTO `testimonial` (`id`, `name`, `photo`, `content`, `rating`) VALUES
(2, 'Een Enarsih - Banten', '', 'Sis barang ny dh sya trima,mkasih bnyak untuk layan’n ny sngat m’muaskan untuk sya,smu prtanya’n di jwab…\r\nRespon ny jga sngat baek,smoga usaha ny smakin brkembang', 0),
(3, 'Ayung Darma - Pekalongan', '', 'Oia mf sis,Nich brg nya brsan aja ampe, mksh ya\r\nBrg nya bgs banget, sesuai yg digambarnya, makasih ya', 0),
(4, 'Via Garolita - Cimahi', '', 'Sistaaaa……\r\nbaju nyaa udah smpee…\r\nbguss dechh…suka bgt…\r\nmaaksiih yaa', 0),
(5, 'Dewanti - Solo', '', 'Barang tidak mengecewakan.. cs nya fast respon, resi besoknya langsung di share tanpa kita tanya.. ', 5),
(6, 'Dina - Malang', '', 'Respon cs baik, tapi untuk pengirimannya agak lama, padahal pakai ekspedisi ”sicepat”\r\nharusnya bisa cepat sampainya.', 2);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `ket` varchar(100) NOT NULL,
  `img` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `id_invoice`, `user`, `product_name`, `price`, `qty`, `slug`, `ket`, `img`) VALUES
(81, 1216888667, 12, 'Winter Sweater', 35000, 1, 'winter-sweater', ' ', '1718072784835.jpg'),
(82, 1211197771, 12, 'Winter Sweater', 35000, 1, 'winter-sweater', '', '1718072784835.jpg'),
(83, 1261688134, 12, 'Kemeja Flanel Biru', 50000, 1, 'kemeja-flanel-biru', ' ', '1718072861486.jpg'),
(84, 1253774275, 12, 'Winter Sweater', 35000, 1, 'winter-sweater', ' ', '1718072784835.jpg'),
(85, 1211320263, 12, 'Winter Sweater', 35000, 1, 'winter-sweater', ' ', '1718072784835.jpg'),
(86, 1217212125, 12, 'Winter Sweater', 35000, 1, 'winter-sweater', '', '1718072784835.jpg'),
(87, 1217212125, 12, 'Kemeja Flanel Biru', 50000, 1, 'kemeja-flanel-biru', '', '1718072861486.jpg'),
(88, 1215087123, 12, 'Kemeja Flanel Biru', 50000, 1, 'kemeja-flanel-biru', ' ', '1718072861486.jpg'),
(89, 1214333245, 12, 'Kemeja Flanel Biru', 50000, 1, 'kemeja-flanel-biru', '', '1718072861486.jpg'),
(90, 1214333245, 12, 'Winter Sweater', 35000, 1, 'winter-sweater', '', '1718072784835.jpg'),
(91, 1311845011, 13, 'Winter Sweater', 35000, 1, 'winter-sweater', ' ', '1718072784835.jpg'),
(92, 1214039494, 12, 'Kemeja Flanel Biru', 50000, 1, 'kemeja-flanel-biru', ' ', '1718072861486.jpg'),
(93, 1250591204, 12, 'Winter Sweater', 35000, 1, 'winter-sweater', ' ', '1718072784835.jpg'),
(94, 1218986602, 12, 'Winter Sweater', 35000, 1, 'winter-sweater', ' ', '1718072784835.jpg'),
(95, 1215002344, 12, 'Kemeja Flanel Biru', 50000, 1, 'kemeja-flanel-biru', ' ', '1718072861486.jpg'),
(96, 1368633358, 13, 'Kemeja Flanel Biru', 50000, 1, 'kemeja-flanel-biru', ' ', '1718072861486.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `username` varchar(45) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `date_register` datetime NOT NULL,
  `is_activate` int(11) NOT NULL,
  `token` varchar(100) NOT NULL,
  `token_reset` varchar(100) NOT NULL,
  `cookie` varchar(100) NOT NULL,
  `photo_profile` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `email`, `password`, `date_register`, `is_activate`, `token`, `token_reset`, `cookie`, `photo_profile`) VALUES
(12, '401XD Group', '401xd-group', 'member@gmail.com', '$2y$10$cIJ4gL/TvfCzvhlFIlS96uCB8.1erZ.4m0PCuqgthorGXqex37iNm', '2021-05-19 22:20:52', 1, 'ef68bc405b7e534fb2010ef57ca1f020cb29653f', '', 'YSeDSim0BAN3E2Ukuxd1j1gK3oE6dztXi4OIqcBfO4LwFzJbWFGHylbcMswUQ58V', 'default.png'),
(13, 'Bintang Indrawan', 'bintang-indrawan', 'indrawanbintang07@gmail.com', '$2y$10$fyBMdFoQdotUnmZy1jnIdez3dsDQYadCHr5IoeZCXYo2ejDu7iYca', '2024-07-03 08:58:26', 1, '5b35e1ef100a3bd598c568b5dc5f3157f240f5e7', '5c6cebd12b0fd0b7a0e65b3d495c9c4910096530', '', 'default.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cod`
--
ALTER TABLE `cod`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complain`
--
ALTER TABLE `complain`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cost_delivery`
--
ALTER TABLE `cost_delivery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_send`
--
ALTER TABLE `email_send`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `footer`
--
ALTER TABLE `footer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general`
--
ALTER TABLE `general`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grosir`
--
ALTER TABLE `grosir`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `img_product`
--
ALTER TABLE `img_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_proof`
--
ALTER TABLE `payment_proof`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rekening`
--
ALTER TABLE `rekening`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `retur_pembelian`
--
ALTER TABLE `retur_pembelian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `retur_penjualan`
--
ALTER TABLE `retur_penjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sosmed`
--
ALTER TABLE `sosmed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `submenu`
--
ALTER TABLE `submenu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriber`
--
ALTER TABLE `subscriber`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonial`
--
ALTER TABLE `testimonial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cod`
--
ALTER TABLE `cod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `complain`
--
ALTER TABLE `complain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cost_delivery`
--
ALTER TABLE `cost_delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `email_send`
--
ALTER TABLE `email_send`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `footer`
--
ALTER TABLE `footer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `general`
--
ALTER TABLE `general`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `grosir`
--
ALTER TABLE `grosir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `img_product`
--
ALTER TABLE `img_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `payment_proof`
--
ALTER TABLE `payment_proof`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `rekening`
--
ALTER TABLE `rekening`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `retur_pembelian`
--
ALTER TABLE `retur_pembelian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `retur_penjualan`
--
ALTER TABLE `retur_penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sosmed`
--
ALTER TABLE `sosmed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `submenu`
--
ALTER TABLE `submenu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `subscriber`
--
ALTER TABLE `subscriber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `testimonial`
--
ALTER TABLE `testimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
