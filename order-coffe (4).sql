-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 01, 2024 at 06:38 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `order-coffe`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int NOT NULL,
  `user_id` int NOT NULL,
  `id_product` int NOT NULL,
  `quantity_product` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `multilevel`
--

CREATE TABLE `multilevel` (
  `id` int NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `upwd` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `multilevel`
--

INSERT INTO `multilevel` (`id`, `name`, `email`, `uname`, `upwd`, `role`, `added_date`) VALUES
(1, 'amle', 'admin@gmail.com', 'admin', 'admin', 'admin', '2024-02-14 13:22:54'),
(2, 'lia', 'owner@gmail.com', 'owner', 'owner', 'owner', '2024-02-14 13:23:10'),
(3, 'Rizky', 'user@gmail.com', 'user', 'user', 'user', '2024-02-14 13:23:26'),
(10, 'Goku', 'goku@gmail.com', 'goku', '123', 'admin', '2024-03-01 04:04:22');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orders_id` int NOT NULL,
  `id_user` int NOT NULL,
  `id_table` int NOT NULL,
  `total_price` int NOT NULL,
  `payment` enum('CASH','DANA','SHOPEEPAY') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `payment_link` varchar(255) DEFAULT NULL,
  `date` datetime NOT NULL,
  `status_bayar` enum('paid','unpaid') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'unpaid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orders_id`, `id_user`, `id_table`, `total_price`, `payment`, `payment_link`, `date`, `status_bayar`) VALUES
(5, 3, 2, 18000, 'DANA', 'link_dana', '2024-02-20 14:35:30', 'paid'),
(6, 3, 3, 18000, 'DANA', 'https://link.dana.id/qr/45096gg2', '2024-02-20 14:51:36', 'paid'),
(9, 3, 14, 54000, 'DANA', 'https://link.dana.id/qr/45096gg2', '2024-02-21 11:04:00', 'paid'),
(10, 2, 4, 36000, 'CASH', NULL, '2024-02-22 02:37:26', 'paid'),
(11, 3, 14, 15000, 'DANA', 'https://link.dana.id/qr/45096gg2', '2024-02-22 02:58:30', 'paid'),
(12, 3, 8, 15000, 'SHOPEEPAY', 'spy.php', '2024-02-22 09:11:40', 'paid'),
(13, 3, 6, 15000, 'DANA', 'dana.php', '2024-02-22 09:13:17', 'paid'),
(27, 3, 12, 45000, 'DANA', 'dana.php', '2024-02-22 13:00:18', 'paid'),
(28, 6, 12, 15000, 'DANA', 'dana.php', '2024-02-22 14:34:57', 'paid'),
(30, 3, 13, 15000, 'SHOPEEPAY', 'spy.php', '2024-02-23 03:43:39', 'paid'),
(31, 3, 7, 0, 'DANA', 'dana.php', '2024-02-23 03:44:18', 'paid'),
(32, 3, 8, 38000, 'DANA', 'dana.php', '2024-03-01 00:38:51', 'paid'),
(33, 3, 7, 15000, 'DANA', 'dana.php', '2024-03-01 00:53:25', 'paid'),
(34, 3, 15, 22000, 'DANA', 'dana.php', '2024-03-01 00:56:33', 'paid'),
(35, 3, 10, 234000, 'CASH', '', '2024-03-01 03:56:34', 'paid'),
(36, 3, 14, 28000, 'SHOPEEPAY', 'spy.php', '2024-03-01 05:24:55', 'paid');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id_order_product` int NOT NULL,
  `id_order` int NOT NULL,
  `id_product` int NOT NULL,
  `qty` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`id_order_product`, `id_order`, `id_product`, `qty`) VALUES
(4, 1, 17, 1),
(5, 1, 24, 3),
(6, 3, 18, 2),
(7, 3, 17, 1),
(8, 4, 24, 4),
(9, 5, 18, 1),
(10, 6, 18, 1),
(11, 7, 20, 1),
(12, 7, 18, 1),
(13, 8, 24, 1),
(14, 9, 18, 2),
(15, 9, 20, 1),
(16, 11, 24, 1),
(17, 12, 24, 1),
(18, 13, 24, 1),
(19, 14, 24, 1),
(20, 27, 24, 3),
(21, 28, 24, 1),
(22, 30, 24, 1),
(23, 32, 24, 1),
(24, 32, 30, 1),
(25, 33, 35, 1),
(26, 34, 33, 1),
(27, 35, 38, 6),
(28, 35, 32, 2),
(29, 35, 29, 2),
(30, 35, 34, 2),
(31, 35, 43, 4),
(32, 36, 41, 2);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id_product` int NOT NULL,
  `name_product` varchar(50) NOT NULL,
  `price_product` int NOT NULL,
  `image_product` varchar(30) NOT NULL,
  `stok_product` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id_product`, `name_product`, `price_product`, `image_product`, `stok_product`) VALUES
(24, 'Americano', 15000, 'SAaV6cRV66WyaPaMMbBo.jpg', '70'),
(29, 'Cappucino', 18000, 'Zz3bnaKOFeVpREFvPZ40.jpg', '78'),
(30, 'Caramel Latte', 23000, 'J53zfSHegliUoO9Qolv9.jpg', '74'),
(31, 'Hot Espresso', 15000, 'Kopi-espreso.jpg', '100'),
(32, 'Korean Hot Noodles', 27000, '8S8aPYPAlFbNIBe6Iby2.jpg', '73'),
(33, 'Croissant', 22000, 'AMHKYCYZZsu1LxTANrH1.jpg', '79'),
(34, 'Nasi Goreng', 21000, 'rMJQ5DXRG4DndfRRlwhx.jpg', '98'),
(35, 'Latte', 105, 'aerial-view-latte-art.jpg', '100'),
(36, 'Roti Bakar', 15000, 'qauAsW2w9L0zSnJmjzN9.jpg', '100'),
(37, 'Kentang Goreng', 17000, 'au85WmeKXvU8QXvntwi8.jpg', '100'),
(38, 'Kamir Keju', 5000, 'yihxfNSZeWQK6eczBbk6.jpg', '94'),
(39, 'Brownies', 6000, 'UVKZOGPTrjo6JQsLQoyM.jpg', '100'),
(40, 'Ice Cream Chocolate', 13000, '47Qic7WDyIviQNlGtN6a.jpg', '100'),
(41, 'Sandwich', 14000, '57UrO962kvAC118FM1zS.jpg', '98'),
(42, 'Hot Dog', 20000, 'DberCCESW5KXiXdcZ6pJ.jpg', '100'),
(43, 'Krabby Patty', 18000, 'mzlNPal2NZlBU8WMO8qN.jpg', '96');

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `id_table` int NOT NULL,
  `table` varchar(225) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`id_table`, `table`, `status`) VALUES
(1, '1', '0'),
(2, '2', '0'),
(3, '3', '0'),
(4, '4', '0'),
(5, '5', '0'),
(6, '6', '0'),
(7, '7', '0'),
(8, '8', '0'),
(9, '9', '0'),
(10, '10', '0'),
(11, '11', '0'),
(12, '12', '0'),
(13, '13', '0'),
(14, '14', '0'),
(15, '15', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user` (`user_id`),
  ADD KEY `product` (`id_product`);

--
-- Indexes for table `multilevel`
--
ALTER TABLE `multilevel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orders_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id_order_product`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id_table`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `multilevel`
--
ALTER TABLE `multilevel`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orders_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id_order_product` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `id_table` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `multilevel` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
