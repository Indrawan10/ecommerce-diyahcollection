-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 28 Jun 2024 pada 22.19
-- Versi server: 8.3.0
-- Versi PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role` enum('admin','owner') DEFAULT NULL,
  `cookie` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `role`, `cookie`) VALUES
(1, 'admin', '$2y$10$N7SIaNnC1vbmEgeRX5Vx1e3q1kPEdTnVEUwX3z0dKnmXL6QawdR4O', 'admin', 'jVVei3128F6bfusLMDAJrdm2gHFoNlkOP4Mr5OvYWsmBjq6Wh8tGcQyaZSUpEBQT'),
(2, 'owner', '$2y$10$N7SIaNnC1vbmEgeRX5Vx1e3q1kPEdTnVEUwX3z0dKnmXL6QawdR4O', 'owner', 'jVVei3128F6bfusLMDAJrdm2gHFoNlkOP4Mr5OvYWsmBjq6Wh8tGcQyaZSUpEBQT');

-- --------------------------------------------------------

--
-- Struktur dari tabel `banner`
--

CREATE TABLE `banner` (
  `id` int NOT NULL,
  `img` varchar(30) NOT NULL,
  `url` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `banner`
--

INSERT INTO `banner` (`id`, `img`, `url`) VALUES
(22, '1718087827976.png', '#'),
(24, '1718089903731.png', '#');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id` int NOT NULL,
  `user` int NOT NULL,
  `id_product` int NOT NULL,
  `product_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `price` int NOT NULL,
  `qty` int NOT NULL,
  `img` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `weight` int NOT NULL,
  `ket` varchar(200) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `slug` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `icon`, `slug`) VALUES
(6, 'Pakaian Pria', '1586527494296.png', 'pakaian-pria'),
(7, 'Pakaian Wanita', '1586527510434.png', 'pakaian-wanita');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cod`
--

CREATE TABLE `cod` (
  `id` int NOT NULL,
  `regency_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `complain`
--

CREATE TABLE `complain` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `nohp` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `complain` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cost_delivery`
--

CREATE TABLE `cost_delivery` (
  `id` int NOT NULL,
  `destination` int NOT NULL,
  `price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `cost_delivery`
--

INSERT INTO `cost_delivery` (`id`, `destination`, `price`) VALUES
(2, 92, 20000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `email_send`
--

CREATE TABLE `email_send` (
  `id` int NOT NULL,
  `mail_to` int NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `footer`
--

CREATE TABLE `footer` (
  `id` int NOT NULL,
  `page` int NOT NULL,
  `type` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `footer`
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
-- Struktur dari tabel `general`
--

CREATE TABLE `general` (
  `id` int NOT NULL,
  `app_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `slogan` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `navbar_color` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `api_rajaongkir` varchar(70) COLLATE utf8mb4_general_ci NOT NULL,
  `host_mail` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `port_mail` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `crypto_smtp` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `account_gmail` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `pass_gmail` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `whatsapp` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `whatsappv2` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `email_contact` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `server_api_midtrans` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `client_api_midtrans` varchar(150) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `general`
--

INSERT INTO `general` (`id`, `app_name`, `slogan`, `navbar_color`, `api_rajaongkir`, `host_mail`, `port_mail`, `crypto_smtp`, `account_gmail`, `pass_gmail`, `whatsapp`, `whatsappv2`, `email_contact`, `server_api_midtrans`, `client_api_midtrans`) VALUES
(1, 'Diyah Collection', 'DiyahCollection - Fashion Kekinian', '#005CAA', 'dd3be2dc9ba9a0e5e4a397869e7c4a05', 'mail.401xd.com', '465', '', 'iburodiah3@gmail.com', 'asu', '082220690398', '0895358920923', 'iburodiah3@gmail.com', 'SB-Mid-server-5UgYgutSRIaaGpYIRaY5Vtxb', 'SB-Mid-client-yxuEtwM5wImFlGWH');

-- --------------------------------------------------------

--
-- Struktur dari tabel `grosir`
--

CREATE TABLE `grosir` (
  `id` int NOT NULL,
  `min` int NOT NULL,
  `price` int NOT NULL,
  `product` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `img_product`
--

CREATE TABLE `img_product` (
  `id` int NOT NULL,
  `id_product` int NOT NULL,
  `img` varchar(30) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `img_product`
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
-- Struktur dari tabel `invoice`
--

CREATE TABLE `invoice` (
  `id` int NOT NULL,
  `user` int NOT NULL,
  `invoice_code` varchar(10) NOT NULL,
  `label` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telp` varchar(20) NOT NULL,
  `province` int NOT NULL,
  `regency` int NOT NULL,
  `district` varchar(50) NOT NULL,
  `village` varchar(50) NOT NULL,
  `zipcode` int NOT NULL,
  `address` text NOT NULL,
  `courier` varchar(5) NOT NULL,
  `courier_service` varchar(70) NOT NULL,
  `ongkir` varchar(10) NOT NULL,
  `total_price` int NOT NULL,
  `total_all` int NOT NULL,
  `date_input` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL,
  `alasan_cancel` text,
  `rekening_pengembalian` varchar(256) DEFAULT NULL,
  `nama_rekening_pengembalian` text,
  `resi` varchar(30) NOT NULL,
  `pay_status` varchar(30) NOT NULL,
  `link_pay` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `invoice`
--

INSERT INTO `invoice` (`id`, `user`, `invoice_code`, `label`, `name`, `email`, `telp`, `province`, `regency`, `district`, `village`, `zipcode`, `address`, `courier`, `courier_service`, `ongkir`, `total_price`, `total_all`, `date_input`, `status`, `alasan_cancel`, `rekening_pengembalian`, `nama_rekening_pengembalian`, `resi`, `pay_status`, `link_pay`) VALUES
(92, 12, '1216888667', 'Dsn. Gunungpandak Rt', 'Rama kun', 'member@gmail.com', '082244812291', 11, 75, 'jhjh', 'jjh', 65174, 'jhjhj', 'jne', 'REG', '22000', 35000, 57000, '2024-06-21 13:51:07', 4, NULL, NULL, NULL, '0', 'settlement', ''),
(93, 12, '1211197771', 'Dsn. Gunungpandak Rt', 'Rama kun', 'member@gmail.com', '082244812291', 11, 74, 'nkj', 'jkj', 65174, 'kjkj', 'jne', 'REG', '22000', 35000, 57000, '2024-06-21 13:52:51', 4, NULL, NULL, NULL, '0', 'settlement', ''),
(94, 12, '1261688134', 'Dsn. Gunungpandak Rt', 'Rama kun', 'member@gmail.com', '082244812291', 11, 75, 'hjhj', 'jhjhj', 65174, 'jjh', 'pos', 'Pos Kargo', '60000', 50000, 110000, '2024-06-21 13:58:54', 4, NULL, NULL, NULL, '0', 'settlement', ''),
(95, 12, '1253774275', 'Dsn. Gunungpandak Rt', 'Rama kun', 'member@gmail.com', '082244812291', 11, 51, 'mk', 'kk', 65174, 'kjkj', 'jne', 'REG', '22000', 35000, 57000, '2024-06-21 14:01:15', 4, NULL, NULL, NULL, '0', 'settlement', ''),
(96, 12, '1211320263', 'Dsn. Gunungpandak Rt', 'Rama kun', 'member@gmail.com', '082244812291', 11, 255, 'HJHJ', 'HJHJH', 65174, 'Dsn. Gunungpandak Rt/Rw : 34/04', 'tiki', 'ECO', '19000', 35000, 54000, '2024-06-21 16:31:03', 0, NULL, NULL, NULL, '0', '', ''),
(97, 12, '1217212125', 'Dsn. Gunungpandak Rt', 'Rama kun', 'member@gmail.com', '082244812291', 11, 255, 'Pagelaran', 'Kademangan', 65174, 'Dsn. Gunungpandak Rt/Rw : 34/04', 'jne', 'REG', '22000', 85000, 107000, '2024-06-28 18:45:25', 4, NULL, NULL, NULL, '123456', 'settlement', 'https://app.sandbox.midtrans.com/snap/v1/transactions/f57f5d9a-37b0-4e24-9410-def2507e1e66/pdf');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id` int NOT NULL,
  `title` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `link` varchar(150) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `menu`
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
-- Struktur dari tabel `pages`
--

CREATE TABLE `pages` (
  `id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `slug` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pages`
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
-- Struktur dari tabel `payment_proof`
--

CREATE TABLE `payment_proof` (
  `id` int NOT NULL,
  `invoice` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `file` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id` int NOT NULL,
  `supplier_id` int NOT NULL,
  `product_id` int NOT NULL,
  `harga` int NOT NULL,
  `qty` int NOT NULL,
  `bayar` int DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Belum Bayar',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembelian`
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
(23, 4, 31, 10000, 2, 20000, 'Sudah Bayar', '2024-06-20 12:00:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `price` int NOT NULL,
  `stock` int NOT NULL,
  `category` int NOT NULL,
  `condit` int NOT NULL,
  `weight` int NOT NULL,
  `img` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `date_submit` datetime NOT NULL,
  `publish` int NOT NULL,
  `slug` varchar(100) NOT NULL,
  `transaction` int NOT NULL,
  `promo_price` int NOT NULL,
  `viewer` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `title`, `price`, `stock`, `category`, `condit`, `weight`, `img`, `description`, `date_submit`, `publish`, `slug`, `transaction`, `promo_price`, `viewer`) VALUES
(31, 'Winter Sweater', 35000, 1, 7, 1, 500, '1718072784835.jpg', '<p>Material katun kombinasi tidak transparan, ringan dan tidak stretch</p><p>NB: Warna pada gambar dapat sedikit berbeda dengan warna asli produk akibat pencahayaan saat proses photoshoot.</p>', '2024-06-11 09:26:24', 1, 'winter-sweater', 6, 0, 94),
(32, 'Kemeja Flanel Biru', 50000, 2, 6, 1, 400, '1718072861486.jpg', '<p>Kemeja berbahan twill katun kotak-kotak yang lembut dengan kerah turn-down, bagian depan klasik, dan kuk di bagian belakang. Pakaian santai dengan lengan panjang dengan manset berkancing dan saku rok lengan dengan kancing penghubung, saku dada terbuka, dan keliman membulat.</p>', '2024-06-11 09:27:41', 1, 'kemeja-flanel-biru', 2, 0, 29);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rating`
--

CREATE TABLE `rating` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `star` int NOT NULL DEFAULT '0',
  `ulasan` text,
  `invoice_code` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `rating`
--

INSERT INTO `rating` (`id`, `user_id`, `product_id`, `star`, `ulasan`, `invoice_code`) VALUES
(7, 12, 31, 3, 'Test', '1211197771'),
(9, 12, 31, 5, 'Bagus', '1217212125');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rekening`
--

CREATE TABLE `rekening` (
  `id` int NOT NULL,
  `rekening` varchar(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rekening`
--

INSERT INTO `rekening` (`id`, `rekening`, `name`, `number`) VALUES
(1, 'DANA', 'Toni Suwendi', '088215005600'),
(3, 'GOPAY', 'Toni Suwendi', '088215005600'),
(7, 'OVO', 'Toni Suwendi', '088215005600');

-- --------------------------------------------------------

--
-- Struktur dari tabel `retur_pembelian`
--

CREATE TABLE `retur_pembelian` (
  `id` int NOT NULL,
  `supplier_id` int NOT NULL,
  `pembelian_id` int NOT NULL,
  `product_id` int NOT NULL,
  `qty` int NOT NULL,
  `harga` int NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Pending',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `retur_pembelian`
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
(21, 4, 21, 31, 1, 10000, 'Selesai', '2024-06-20 10:44:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `retur_penjualan`
--

CREATE TABLE `retur_penjualan` (
  `id` int NOT NULL,
  `id_invoice` int NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `qty` int NOT NULL,
  `alasan` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `norek` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jenis_bank` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bukti` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `retur_penjualan`
--

INSERT INTO `retur_penjualan` (`id`, `id_invoice`, `product_name`, `qty`, `alasan`, `file`, `norek`, `jenis_bank`, `bukti`, `status`, `created_at`) VALUES
(7, 1261688134, 'Kemeja Flanel Biru', 1, 'klklk', 'LOGO_SIANWAR_V23.png', NULL, NULL, NULL, NULL, '2024-06-21 16:11:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` int NOT NULL,
  `promo` int NOT NULL,
  `promo_time` varchar(40) NOT NULL,
  `short_desc` text NOT NULL,
  `address` varchar(100) NOT NULL,
  `regency_id` int NOT NULL,
  `verify` int NOT NULL,
  `logo` varchar(30) NOT NULL,
  `favicon` varchar(30) NOT NULL,
  `default_ongkir` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `settings`
--

INSERT INTO `settings` (`id`, `promo`, `promo_time`, `short_desc`, `address`, `regency_id`, `verify`, `logo`, `favicon`, `default_ongkir`) VALUES
(1, 0, '2020-08-08T08:08', 'Toko online terlengkap dan terpercaya. Dapatkan penawaran dengan kualitas terbaik. Diyah Collection hadir untuk memenuhi kebutuhan Anda.', 'Jl. Raya Kluwut, Toko Diyah Collection Kluwut, Kec. Bulakamba, Kabupaten Brebes, Jawa Tengah 52253', 92, 1, '1718765966944.png', '1718766097335.png', 10000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sosmed`
--

CREATE TABLE `sosmed` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `icon` varchar(20) NOT NULL,
  `link` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sosmed`
--

INSERT INTO `sosmed` (`id`, `name`, `icon`, `link`) VALUES
(1, 'Facebook', 'facebook-f', '#'),
(3, 'Twitter', 'twitter', '#'),
(5, 'Instagram', 'instagram', '#');

-- --------------------------------------------------------

--
-- Struktur dari tabel `submenu`
--

CREATE TABLE `submenu` (
  `id` int NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `submenu` int NOT NULL,
  `link` varchar(150) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `submenu`
--

INSERT INTO `submenu` (`id`, `name`, `submenu`, `link`) VALUES
(9, 'Pakaian Pria', 2, 'http://localhost/toko2/c/pakaian-pria'),
(10, 'Pakaian Wanita', 2, 'http://localhost/toko2/c/pakaian-wanita');

-- --------------------------------------------------------

--
-- Struktur dari tabel `subscriber`
--

CREATE TABLE `subscriber` (
  `id` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `date_subs` datetime NOT NULL,
  `code` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `subscriber`
--

INSERT INTO `subscriber` (`id`, `email`, `date_subs`, `code`) VALUES
(0, 'Semua Email', '2020-04-21 13:59:23', ''),
(21, 'member@gmail.com', '2021-05-19 22:20:52', '1621437652141395667'),
(22, 'iburodiah3@gmail.com', '2024-06-16 23:20:15', '17185548151986526971');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id` int NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `nohp` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`id`, `nama`, `alamat`, `nohp`) VALUES
(4, 'Tegal Gubug', 'Cirebon', '08123456789'),
(5, 'Supplier', 'Desa Kluwut, RT 4 RW 1', '0895358920923');

-- --------------------------------------------------------

--
-- Struktur dari tabel `testimonial`
--

CREATE TABLE `testimonial` (
  `id` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `photo` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `rating` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `testimonial`
--

INSERT INTO `testimonial` (`id`, `name`, `photo`, `content`, `rating`) VALUES
(1, 'Aliyah Wati - Jakarta', '', 'Sist makasih barangnya udah sampe, bagus dan lucu2. Temenku aja pada ngiri. Semoga sukses selalu buat eveshopashopnya. Sory baru bisa kasih kabar.', 0),
(2, 'Een Enarsih - Banten', '', 'Sis barang ny dh sya trima,mkasih bnyak untuk layan’n ny sngat m’muaskan untuk sya,smu prtanya’n di jwab…\r\nRespon ny jga sngat baek,smoga usaha ny smakin brkembang', 0),
(3, 'Ayung Darma - Pekalongan', '', 'Oia mf sis,Nich brg nya brsan aja ampe, mksh ya\r\nBrg nya bgs banget, sesuai yg digambarnya, makasih ya', 0),
(4, 'Via Garolita - Cimahi', '', 'Sistaaaa……\r\nbaju nyaa udah smpee…\r\nbguss dechh…suka bgt…\r\nmaaksiih yaa', 0),
(5, 'Dewanti - Solo', '', 'Barang tidak mengecewakan.. cs nya fast respon, resi besoknya langsung di share tanpa kita tanya.. mantap tokohijabku', 0),
(6, 'Dina - Malang', '', 'Respon cs baik, tapi untuk pengirimannya agak lama, padahal pakai ekspedisi ”sicepat”\r\nharusnya bisa cepat sampainya.', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction`
--

CREATE TABLE `transaction` (
  `id` int NOT NULL,
  `id_invoice` int NOT NULL,
  `user` int NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `price` int NOT NULL,
  `qty` int NOT NULL,
  `slug` varchar(100) NOT NULL,
  `ket` varchar(100) NOT NULL,
  `img` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaction`
--

INSERT INTO `transaction` (`id`, `id_invoice`, `user`, `product_name`, `price`, `qty`, `slug`, `ket`, `img`) VALUES
(81, 1216888667, 12, 'Winter Sweater', 35000, 1, 'winter-sweater', ' ', '1718072784835.jpg'),
(82, 1211197771, 12, 'Winter Sweater', 35000, 1, 'winter-sweater', '', '1718072784835.jpg'),
(83, 1261688134, 12, 'Kemeja Flanel Biru', 50000, 1, 'kemeja-flanel-biru', ' ', '1718072861486.jpg'),
(84, 1253774275, 12, 'Winter Sweater', 35000, 1, 'winter-sweater', ' ', '1718072784835.jpg'),
(85, 1211320263, 12, 'Winter Sweater', 35000, 1, 'winter-sweater', ' ', '1718072784835.jpg'),
(86, 1217212125, 12, 'Winter Sweater', 35000, 1, 'winter-sweater', '', '1718072784835.jpg'),
(87, 1217212125, 12, 'Kemeja Flanel Biru', 50000, 1, 'kemeja-flanel-biru', '', '1718072861486.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `date_register` datetime NOT NULL,
  `is_activate` int NOT NULL,
  `token` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `token_reset` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `cookie` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `photo_profile` varchar(30) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `email`, `password`, `date_register`, `is_activate`, `token`, `token_reset`, `cookie`, `photo_profile`) VALUES
(12, '401XD Group', '401xd-group', 'member@gmail.com', '$2y$10$cIJ4gL/TvfCzvhlFIlS96uCB8.1erZ.4m0PCuqgthorGXqex37iNm', '2021-05-19 22:20:52', 1, 'ef68bc405b7e534fb2010ef57ca1f020cb29653f', '', 'YSeDSim0BAN3E2Ukuxd1j1gK3oE6dztXi4OIqcBfO4LwFzJbWFGHylbcMswUQ58V', 'default.png');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cod`
--
ALTER TABLE `cod`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `complain`
--
ALTER TABLE `complain`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cost_delivery`
--
ALTER TABLE `cost_delivery`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `email_send`
--
ALTER TABLE `email_send`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `footer`
--
ALTER TABLE `footer`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `general`
--
ALTER TABLE `general`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `grosir`
--
ALTER TABLE `grosir`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `img_product`
--
ALTER TABLE `img_product`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `payment_proof`
--
ALTER TABLE `payment_proof`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `rekening`
--
ALTER TABLE `rekening`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `retur_pembelian`
--
ALTER TABLE `retur_pembelian`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `retur_penjualan`
--
ALTER TABLE `retur_penjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sosmed`
--
ALTER TABLE `sosmed`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `submenu`
--
ALTER TABLE `submenu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `subscriber`
--
ALTER TABLE `subscriber`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `testimonial`
--
ALTER TABLE `testimonial`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `cod`
--
ALTER TABLE `cod`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `complain`
--
ALTER TABLE `complain`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `cost_delivery`
--
ALTER TABLE `cost_delivery`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `email_send`
--
ALTER TABLE `email_send`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `footer`
--
ALTER TABLE `footer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `general`
--
ALTER TABLE `general`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `grosir`
--
ALTER TABLE `grosir`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `img_product`
--
ALTER TABLE `img_product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `payment_proof`
--
ALTER TABLE `payment_proof`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `rekening`
--
ALTER TABLE `rekening`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `retur_pembelian`
--
ALTER TABLE `retur_pembelian`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `retur_penjualan`
--
ALTER TABLE `retur_penjualan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `sosmed`
--
ALTER TABLE `sosmed`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `submenu`
--
ALTER TABLE `submenu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `subscriber`
--
ALTER TABLE `subscriber`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `testimonial`
--
ALTER TABLE `testimonial`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
