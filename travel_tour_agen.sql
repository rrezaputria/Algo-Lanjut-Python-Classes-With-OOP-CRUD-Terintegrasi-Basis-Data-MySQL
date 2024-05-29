-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Mar 2023 pada 10.52
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travel_tour_agen`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `package_class_agen`
--

CREATE TABLE `package_class_agen` (
  `id_package` int(255) NOT NULL,
  `name_package` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `duration_package` int(10) NOT NULL,
  `destination_package` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `package_class_agen`
--

INSERT INTO `package_class_agen` (`id_package`, `name_package`, `duration_package`, `destination_package`) VALUES
(1, 'Independent Tour', 1, 'Pantai Trikora, Pulau Penyengat, Danau Biru'),
(2, 'Group Tour', 3, 'Dinding Friwen, Kabui Passage, Dermaga Pulau'),
(3, 'Afrika Tour', 6, 'Freedom, Amboseli, Masai Mara');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tour_guide_agen`
--

CREATE TABLE `tour_guide_agen` (
  `id_guide` int(255) NOT NULL,
  `name_guide` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `phone_number_guide` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `years_service_guide` int(10) NOT NULL,
  `id_package` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tour_guide_agen`
--

INSERT INTO `tour_guide_agen` (`id_guide`, `name_guide`, `phone_number_guide`, `years_service_guide`, `id_package`) VALUES
(1, 'Ayranka Olanza', '+62888987672', 1, 1),
(2, 'Rizkiya Sugita', '+62887651231', 6, 2),
(3, 'Apriole Cendekia', '+6288371645678', 2, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `travel_customers_agen`
--

CREATE TABLE `travel_customers_agen` (
  `id_customers` int(255) NOT NULL,
  `name_customers` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `phone_number_customers` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `payment_customers` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_package` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `travel_customers_agen`
--

INSERT INTO `travel_customers_agen` (`id_customers`, `name_customers`, `phone_number_customers`, `payment_customers`, `id_package`) VALUES
(1, 'Hanna Laila', '+6288902928172', 'Cashless', 2),
(2, 'Andini Cantika', '+628890291829', 'Cashless', 2),
(3, 'Garindra Reksa', '+6287892018282', 'Cashless', 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `package_class_agen`
--
ALTER TABLE `package_class_agen`
  ADD PRIMARY KEY (`id_package`);

--
-- Indeks untuk tabel `tour_guide_agen`
--
ALTER TABLE `tour_guide_agen`
  ADD PRIMARY KEY (`id_guide`),
  ADD KEY `id_package` (`id_package`);

--
-- Indeks untuk tabel `travel_customers_agen`
--
ALTER TABLE `travel_customers_agen`
  ADD PRIMARY KEY (`id_customers`),
  ADD KEY `id_package` (`id_package`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `package_class_agen`
--
ALTER TABLE `package_class_agen`
  MODIFY `id_package` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tour_guide_agen`
--
ALTER TABLE `tour_guide_agen`
  MODIFY `id_guide` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `travel_customers_agen`
--
ALTER TABLE `travel_customers_agen`
  MODIFY `id_customers` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tour_guide_agen`
--
ALTER TABLE `tour_guide_agen`
  ADD CONSTRAINT `tour_guide_agen_ibfk_1` FOREIGN KEY (`id_package`) REFERENCES `package_class_agen` (`id_package`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `travel_customers_agen`
--
ALTER TABLE `travel_customers_agen`
  ADD CONSTRAINT `travel_customers_agen_ibfk_1` FOREIGN KEY (`id_package`) REFERENCES `package_class_agen` (`id_package`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
