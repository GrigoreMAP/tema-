-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2023 at 09:35 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proiect`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `email` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `id_adress` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `email`, `name`, `id_adress`) VALUES
(12, 'ion@mail.com', 'ion ', 12);

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

CREATE TABLE `customer_address` (
  `id` int(11) NOT NULL,
  `country` varchar(40) NOT NULL,
  `city` varchar(40) NOT NULL,
  `street` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_address`
--

INSERT INTO `customer_address` (`id`, `country`, `city`, `street`) VALUES
(12, 'romania', 'braila', 'garii');

-- --------------------------------------------------------

--
-- Table structure for table `producator`
--

CREATE TABLE `producator` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `producator`
--

INSERT INTO `producator` (`id`, `name`, `email`) VALUES
(11, 'bosch', 'bosch@ro.ro');

-- --------------------------------------------------------

--
-- Table structure for table `producators_produs`
--

CREATE TABLE `producators_produs` (
  `id_producators` int(11) NOT NULL,
  `isbn_produs` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `producators_produs`
--

INSERT INTO `producators_produs` (`id_producators`, `isbn_produs`) VALUES
(11, '222');

-- --------------------------------------------------------

--
-- Table structure for table `produs`
--

CREATE TABLE `produs` (
  `isbn` varchar(40) NOT NULL,
  `stock` int(11) NOT NULL,
  `price` float NOT NULL,
  `name` varchar(40) NOT NULL,
  `year_fabrication` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produs`
--

INSERT INTO `produs` (`isbn`, `stock`, `price`, `name`, `year_fabrication`) VALUES
('222', 20, 220, 'bormasina', '2023-02-01');

-- --------------------------------------------------------

--
-- Table structure for table `shopping_carts`
--

CREATE TABLE `shopping_carts` (
  `id` bigint(20) NOT NULL,
  `client_id` int(11) NOT NULL,
  `last_edited` datetime NOT NULL,
  `status` enum('OPEN','CANCELLED','COMPLETED') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shopping_carts`
--

INSERT INTO `shopping_carts` (`id`, `client_id`, `last_edited`, `status`) VALUES
(43, 12, '2023-04-24 21:33:32', 'OPEN');

-- --------------------------------------------------------

--
-- Table structure for table `shopping_cart_items`
--

CREATE TABLE `shopping_cart_items` (
  `id_shopping_cart` bigint(20) NOT NULL,
  `qunatity` int(11) NOT NULL,
  `isbn_produs` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shopping_cart_items`
--

INSERT INTO `shopping_cart_items` (`id_shopping_cart`, `qunatity`, `isbn_produs`) VALUES
(43, 2, '222');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_costumer_costumer_adress` (`id_adress`);

--
-- Indexes for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `producator`
--
ALTER TABLE `producator`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `producators_produs`
--
ALTER TABLE `producators_produs`
  ADD PRIMARY KEY (`id_producators`),
  ADD KEY `fk_auth_produs_produs` (`isbn_produs`);

--
-- Indexes for table `produs`
--
ALTER TABLE `produs`
  ADD PRIMARY KEY (`isbn`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `shopping_carts`
--
ALTER TABLE `shopping_carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_clientid_costumer_id` (`client_id`);

--
-- Indexes for table `shopping_cart_items`
--
ALTER TABLE `shopping_cart_items`
  ADD PRIMARY KEY (`id_shopping_cart`),
  ADD KEY `id_shopping_cart` (`id_shopping_cart`),
  ADD KEY `fK_sci_produs` (`isbn_produs`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customer_address`
--
ALTER TABLE `customer_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `producator`
--
ALTER TABLE `producator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `fk_costumer_costumer_adress` FOREIGN KEY (`id_adress`) REFERENCES `customer_address` (`id`);

--
-- Constraints for table `producators_produs`
--
ALTER TABLE `producators_produs`
  ADD CONSTRAINT `fk_auth_produs_produs` FOREIGN KEY (`isbn_produs`) REFERENCES `produs` (`isbn`),
  ADD CONSTRAINT `fk_prod_prod_producator` FOREIGN KEY (`id_producators`) REFERENCES `producator` (`id`);

--
-- Constraints for table `shopping_carts`
--
ALTER TABLE `shopping_carts`
  ADD CONSTRAINT `fk_clientid_costumer_id` FOREIGN KEY (`client_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `shopping_cart_items`
--
ALTER TABLE `shopping_cart_items`
  ADD CONSTRAINT `fK_sci_produs` FOREIGN KEY (`isbn_produs`) REFERENCES `produs` (`isbn`),
  ADD CONSTRAINT `fk_sci_sc` FOREIGN KEY (`id_shopping_cart`) REFERENCES `shopping_carts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
