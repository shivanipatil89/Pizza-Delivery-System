-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 22, 2023 at 05:43 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pizza`
--

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
CREATE TABLE IF NOT EXISTS `card` (
  `item` varchar(100) NOT NULL,
  `qty` int NOT NULL,
  `unit` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `pid` int NOT NULL,
  `pname` varchar(100) NOT NULL,
  `pimg` varchar(100) NOT NULL,
  `pingre` varchar(100) NOT NULL,
  `pprice` int NOT NULL,
  `co_qty` int NOT NULL,
  `total_price` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `id` int NOT NULL,
  `uname` varchar(10) NOT NULL,
  `pass` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `uname`, `pass`) VALUES
(1, 'admin', 'admin'),
(2, 'yogita', 'password');

-- --------------------------------------------------------

--
-- Table structure for table `manu`
--

DROP TABLE IF EXISTS `manu`;
CREATE TABLE IF NOT EXISTS `manu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `t_date` date NOT NULL,
  `a_name` varchar(100) NOT NULL,
  `item` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manu`
--

INSERT INTO `manu` (`id`, `t_date`, `a_name`, `item`) VALUES
(1, '2021-05-22', 'yogita', 'Ground Cinnamon(20), Ground ginger(10)'),
(2, '2021-05-22', 'yogita patil', 'Unsalted Butter(20)'),
(3, '2021-05-21', 'yogita patil', 'Unsweetened natural cocoa powder(20)(gram), Granulated Sugar(10)(kg)'),
(4, '2021-05-22', 'yogita patil', 'White Sugar(20liter), Vanilla Extract(10gram)'),
(5, '2021-05-23', 'yogita patil', 'White Sugar(20gram), Granulated Sugar(20gram), Ground Cinnamon(15gram)'),
(6, '2021-06-29', 'yogita patil', 'Baking Soda(10gram), White Sugar(20gram)'),
(7, '2021-06-29', 'yogita patil', 'Baking Soda(10gram), Unsweetened natural cocoa powder(20gram)'),
(8, '2021-06-30', 'yogita patil', 'All-purpose flour(50gram), Unsweetened natural cocoa powder(60gram), Baking Soda(69gram)'),
(9, '2023-02-14', 'abc', 'All-purpose flour(50gram), Baking Soda(69gram)'),
(10, '2023-03-09', 'yogita', 'Baking Soda(2km)'),
(11, '2023-03-23', 'admin', 'White Sugar(1kg), Oil (2kl)');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `custo_id` int NOT NULL AUTO_INCREMENT,
  `custo_name` varchar(200) NOT NULL,
  `custo_mail` varchar(200) NOT NULL,
  `custo_phone` int NOT NULL,
  `del_add` varchar(200) NOT NULL,
  `t_order` varchar(200) NOT NULL,
  `d_date` varchar(200) NOT NULL,
  `d_time` varchar(200) NOT NULL,
  `products` varchar(200) NOT NULL,
  `amount_paid` int NOT NULL,
  PRIMARY KEY (`custo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`custo_id`, `custo_name`, `custo_mail`, `custo_phone`, `del_add`, `t_order`, `d_date`, `d_time`, `products`, `amount_paid`) VALUES
(2, 'Neha Patil', 'Neha@gmail.com', 2147483647, 'xyz colony deopur dhule.', 'Pickup', '2023-03-26', '10:24', 'American Pizza(3), Tomatoe Pie(1)', 945),
(3, 'Chetan Patil', 'chetan@gmail.com', 564789214, 'abc colony Deopur Dhule.', 'Home Delivery', '2023-03-26', '10:29', 'Tomatoe Pie(1), Margherita(1)', 332),
(4, 'yogita patil', 'yogita@gmail.com', 962587412, 'vinayak colony dhule.', 'Home Delivery', '2023-03-18', '10:32', 'Tomatoe Pie(1)', 120),
(5, 'Yogita Patil', 'yogitapatil123@gmail.com', 123456789, 'abc colony Xyz apartment deopur Dhule.', 'Pickup', '2023-03-23', '10:54', 'American Pizza(2), Italian Pizza(1)', 862),
(6, 'Yogita Patil', 'Yogita@gmail.com', 2147483647, 'abc colony deopur Dhule.', 'Home Delivery', '2023-03-24', '10:58', 'American Pizza(2), Margherita(1)', 762);

-- --------------------------------------------------------

--
-- Table structure for table `pizzaitem`
--

DROP TABLE IF EXISTS `pizzaitem`;
CREATE TABLE IF NOT EXISTS `pizzaitem` (
  `pid` int NOT NULL,
  `pname` varchar(100) NOT NULL,
  `pimg` varchar(100) NOT NULL,
  `pprice` int NOT NULL,
  `pingre` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pizzaitem`
--

INSERT INTO `pizzaitem` (`pid`, `pname`, `pimg`, `pprice`, `pingre`) VALUES
(1, 'American Pizza', 'pizza-1.jpg', 275, 'Hot sauce, Monterey Jack cheese, Blue cheese, Chicken breast cutlets, Spring onions, Olive oil.'),
(2, 'Italian Pizza', 'pizza-4.jpg', 312, 'Tomato sauce, Parmigian Reggiano (Parmesan), Tuna, Olives, Capers, Garlic, Onion, Hot Calabrian chil'),
(3, 'Margherita', 'pizza-3.jpg', 212, 'Tomato sauce, Cheese, other ingredients vary and may contain Jalapeños, Hot chili peppers, Corn, Spi'),
(4, 'Tomatoe Pie', 'pizza-2.jpg', 120, 'Tomato sauce, Mascarpone cheese, Smoked salmon and rocket salad (arugula)');

-- --------------------------------------------------------

--
-- Table structure for table `purcake`
--

DROP TABLE IF EXISTS `purcake`;
CREATE TABLE IF NOT EXISTS `purcake` (
  `id` int NOT NULL AUTO_INCREMENT,
  `items` text NOT NULL,
  `name` text NOT NULL,
  `quntity` int NOT NULL,
  `unit` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purcake`
--

INSERT INTO `purcake` (`id`, `items`, `name`, `quntity`, `unit`) VALUES
(1, 'All-purpose flour', 'Ramesh Suresh Patil', 1010, 'gram'),
(2, 'Unsweetened natural cocoa powder', 'Raam Tejas Suryawanshi', 100, 'gram'),
(3, 'Baking Soda', 'Suresh Ajinkya Koli', 329, 'gram'),
(5, 'Salt', 'Shaam Lokesh Marathe', 199, 'gram'),
(6, 'Unsalted Butter', 'Ramesh Suresh Patil', 100, 'gram'),
(7, 'White Sugar', 'Raam Tejas Suryawanshi', 434, 'gram'),
(8, 'Eggs', 'Suresh Ajinkya Koli', 10, 'kg'),
(9, 'Vanilla Extract', 'Nishant Lalit Sawant', 202, 'gram'),
(10, 'Cream Cheese', 'Shaam Lokesh Marathe', 195, 'gram'),
(11, 'Granulated Sugar', 'Shaam Lokesh Marathe', 969, 'gram'),
(12, 'Baking Cocoa', 'Raam Tejas Suryawanshi', 78, 'gram'),
(13, 'Cake Flour', 'Nishant Lalit Sawant', 1000, 'gram'),
(14, 'Corn Starch', 'Nishant Lalit Sawant', 1000, 'gram'),
(15, 'Ground Cinnamon', 'Raam Tejas Suryawanshi', 165, 'gram'),
(16, 'Ube jam', 'Suresh Ajinkya Koli', 330, 'gram'),
(17, 'Kosher Salt', 'Raam Tejas Suryawanshi', 1000, 'gram'),
(18, 'Ground ginger', 'Raam Tejas Suryawanshi', 90, 'gram'),
(19, 'Molasses', 'Shaam Lokesh Marathe', 500, 'gram'),
(20, 'Garam Masala ', 'Suresh Ajinkya Koli', 126, 'gram'),
(21, ' Pepper', 'Suresh Ajinkya Koli', 100, 'gram'),
(22, ' Chaat masala', 'Shaam Lokesh Marathe', 500, 'gram'),
(23, 'Oil ', 'Nishant Lalit Sawant', 198, 'milliliter'),
(24, ' Sour Cream', 'Raam Tejas Suryawanshi', 230, 'gram'),
(25, 'Whole Wheat pastry flour ', 'Shaam Lokesh Marathe', 1000, 'gram'),
(26, ' Cacao Butter', 'Nishant Lalit Sawant', 150, 'gram'),
(27, ' Milk Powder', 'Raam Tejas Suryawanshi', 500, 'gram');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
