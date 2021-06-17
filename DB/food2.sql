-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2021 at 01:19 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food2`
--

-- --------------------------------------------------------

--
-- Table structure for table `acc`
--

CREATE TABLE `acc` (
  `id` int(6) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `pass` varchar(30) NOT NULL,
  `banner` varchar(100) DEFAULT NULL,
  `dispic` varchar(100) NOT NULL,
  `bio` text NOT NULL,
  `followno` int(10) NOT NULL,
  `recpno` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `acc`
--

INSERT INTO `acc` (`id`, `firstname`, `lastname`, `email`, `pass`, `banner`, `dispic`, `bio`, `followno`, `recpno`) VALUES
(8, 'Reynaldo', 'Factor', 'factorjun0309@gmail.com', 'yeah', '1623617642.png', '1623617661.png', '', 1, 0),
(14, 'CuisineHero', ' ', 'cuisinehero@gg.com', 'admin', '1623084420.png', '1623084421.png', '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `username`, `email`, `password`) VALUES
(1, 'Zoa', 'ivanjared17@gmail.com', 'loonaverse2117');

-- --------------------------------------------------------

--
-- Table structure for table `bake`
--

CREATE TABLE `bake` (
  `id` int(100) NOT NULL,
  `bake_name` varchar(100) DEFAULT NULL,
  `bake_amt` varchar(100) DEFAULT NULL,
  `food_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bake`
--

INSERT INTO `bake` (`id`, `bake_name`, `bake_amt`, `food_id`) VALUES
(110, NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `food_id` int(30) NOT NULL,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `condi`
--

CREATE TABLE `condi` (
  `condi_id` int(6) NOT NULL,
  `condi_name` varchar(30) DEFAULT NULL,
  `condi_amt` varchar(30) DEFAULT NULL,
  `food_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `condi`
--

INSERT INTO `condi` (`condi_id`, `condi_name`, `condi_amt`, `food_id`) VALUES
(111, NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `dairy`
--

CREATE TABLE `dairy` (
  `id` int(100) NOT NULL,
  `dairy_name` varchar(100) DEFAULT NULL,
  `dairy_amt` varchar(100) DEFAULT NULL,
  `food_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dairy`
--

INSERT INTO `dairy` (`id`, `dairy_name`, `dairy_amt`, `food_id`) VALUES
(108, NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `dessert`
--

CREATE TABLE `dessert` (
  `id` int(100) NOT NULL,
  `dessert_name` varchar(100) DEFAULT NULL,
  `dessert_amt` varchar(100) DEFAULT NULL,
  `food_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dessert`
--

INSERT INTO `dessert` (`id`, `dessert_name`, `dessert_amt`, `food_id`) VALUES
(107, NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `fish`
--

CREATE TABLE `fish` (
  `fish_id` int(100) NOT NULL,
  `fish_name` varchar(100) DEFAULT NULL,
  `fish_amt` varchar(100) DEFAULT NULL,
  `food_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fish`
--

INSERT INTO `fish` (`fish_id`, `fish_name`, `fish_amt`, `food_id`) VALUES
(144, NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `follow_log`
--

CREATE TABLE `follow_log` (
  `id` int(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `author` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `follow_log`
--

INSERT INTO `follow_log` (`id`, `email`, `author`) VALUES
(41, 'factorjun0309@gmail.com', 'cuisinehero@gg.com'),
(42, 'cuisinehero@gg.com', 'factorjun0309@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `author` varchar(50) NOT NULL,
  `food_name` varchar(30) NOT NULL,
  `cook_time` varchar(15) NOT NULL,
  `prep_time` varchar(15) NOT NULL,
  `servings` varchar(30) NOT NULL,
  `video_link` tinytext DEFAULT NULL,
  `proced` text NOT NULL,
  `nutri_info` text DEFAULT NULL,
  `likes` int(10) NOT NULL,
  `regdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`id`, `food_id`, `author`, `food_name`, `cook_time`, `prep_time`, `servings`, `video_link`, `proced`, `nutri_info`, `likes`, `regdate`) VALUES
(77, 1, 'cuisinehero@gg.com', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 0, '2021-06-15 12:30:18'),
(78, 2, 'cuisinehero@gg.com', 'TEST2', 'TEST2', 'TEST2', 'TEST2', 'TEST2', 'TEST2', 'TEST2', 0, '2021-06-15 12:31:03'),
(85, 3, 'factorjun0309@gmail.com', 'a', 'a', 'a', 'a', '', 'a', '', 0, '2021-06-15 13:45:26'),
(86, 4, 'factorjun0309@gmail.com', 'ITO', 'a', 'a', 'a', 'a', 'a', 'a', 0, '2021-06-15 13:47:05'),
(87, 5, 'cuisinehero@gg.com', 'TESTING', 'TESTING', 'TESTING', 'TESTING', 'TESTING', 'TESTING', 'TESTING', 0, '2021-06-15 13:55:34'),
(88, 6, 'cuisinehero@gg.com', 'TESTING', 'TESTING', 'TESTING', 'TESTING', 'TESTING', 'TESTING', 'TESTING', 0, '2021-06-15 13:55:55'),
(89, 7, 'cuisinehero@gg.com', 'TESTER', 'TESTER', 'TESTER', 'TESTER', 'TESTER', 'TESTER', 'TESTER', 0, '2021-06-15 13:58:58'),
(90, 8, 'cuisinehero@gg.com', 'TINEST', 'TINEST', 'TINEST', 'TINEST', 'TINEST', 'TINEST', 'TINEST', 0, '2021-06-15 14:00:03'),
(91, 9, 'cuisinehero@gg.com', 'PAGOD NA MAG TEST', 'PAGOD NA MAG TE', 'PAGOD NA MAG TE', 'PAGOD NA MAG TEST', 'PAGOD NA MAG TEST', 'PAGOD NA MAG TEST', 'PAGOD NA MAG TEST', 0, '2021-06-15 14:02:12'),
(92, 10, 'cuisinehero@gg.com', 'HELLO PLEASE', 'HELLO PLEASE', 'HELLO PLEASE', 'HELLO PLEASE', 'HELLO PLEASE', 'HELLO PLEASE', 'HELLO PLEASE', 0, '2021-06-15 14:16:40');

-- --------------------------------------------------------

--
-- Table structure for table `fruit`
--

CREATE TABLE `fruit` (
  `id` int(100) NOT NULL,
  `fruit_name` varchar(100) DEFAULT NULL,
  `fruit_amt` varchar(100) DEFAULT NULL,
  `food_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fruit`
--

INSERT INTO `fruit` (`id`, `fruit_name`, `fruit_amt`, `food_id`) VALUES
(105, NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `ingredients_all`
--

CREATE TABLE `ingredients_all` (
  `id` int(6) NOT NULL,
  `ing_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ingredients_all`
--

INSERT INTO `ingredients_all` (`id`, `ing_name`) VALUES
(100, 'Pork'),
(101, 'Spinach'),
(102, 'Beef'),
(103, 'Sopas'),
(104, 'Pepper'),
(105, 'Whale'),
(106, 'Olive Oil');

-- --------------------------------------------------------

--
-- Table structure for table `like_log`
--

CREATE TABLE `like_log` (
  `id` int(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `likes` int(1) NOT NULL,
  `food_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `meat`
--

CREATE TABLE `meat` (
  `meat_id` int(6) NOT NULL,
  `meat_name` varchar(30) DEFAULT NULL,
  `meat_amt` varchar(30) DEFAULT NULL,
  `food_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meat`
--

INSERT INTO `meat` (`meat_id`, `meat_name`, `meat_amt`, `food_id`) VALUES
(141, 'Pork', '1 kg', 1),
(142, 'Beef', '1 kg', 2),
(143, NULL, NULL, 4),
(144, 'Beef', '1 kg', 6),
(145, 'Turtle', '1 kg', 8),
(146, 'Pork', '1 kg', 10),
(147, 'Whale', '1 kg', 10);

-- --------------------------------------------------------

--
-- Table structure for table `nuts`
--

CREATE TABLE `nuts` (
  `id` int(100) NOT NULL,
  `nuts_name` varchar(100) DEFAULT NULL,
  `nuts_amt` varchar(100) DEFAULT NULL,
  `food_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nuts`
--

INSERT INTO `nuts` (`id`, `nuts_name`, `nuts_amt`, `food_id`) VALUES
(107, NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `oil`
--

CREATE TABLE `oil` (
  `id` int(100) NOT NULL,
  `oil_name` varchar(100) DEFAULT NULL,
  `oil_amt` varchar(100) DEFAULT NULL,
  `food_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `oil`
--

INSERT INTO `oil` (`id`, `oil_name`, `oil_amt`, `food_id`) VALUES
(108, NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `recipe_images`
--

CREATE TABLE `recipe_images` (
  `id` int(20) NOT NULL,
  `food_img` varchar(30) NOT NULL,
  `food_id` int(11) NOT NULL,
  `author` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recipe_images`
--

INSERT INTO `recipe_images` (`id`, `food_img`, `food_id`, `author`) VALUES
(91, '1623760218.png', 1, 'cuisinehero@gg.com'),
(92, '1623760263.png', 2, 'cuisinehero@gg.com'),
(93, '1623764833.png', 4, 'factorjun0309@gmail.com'),
(94, '1623765366.png', 6, 'cuisinehero@gg.com'),
(95, '1623765549.png', 7, 'cuisinehero@gg.com'),
(96, '1623765609.png', 8, 'cuisinehero@gg.com'),
(97, '1623765744.png', 9, 'cuisinehero@gg.com'),
(98, '1623766603.png', 10, 'cuisinehero@gg.com');

-- --------------------------------------------------------

--
-- Table structure for table `soup`
--

CREATE TABLE `soup` (
  `id` int(100) NOT NULL,
  `soup_name` varchar(100) DEFAULT NULL,
  `soup_amt` varchar(100) DEFAULT NULL,
  `food_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `soup`
--

INSERT INTO `soup` (`id`, `soup_name`, `soup_amt`, `food_id`) VALUES
(108, 'Sopas', '1 kg', 4);

-- --------------------------------------------------------

--
-- Table structure for table `spice`
--

CREATE TABLE `spice` (
  `id` int(100) NOT NULL,
  `spice_name` varchar(100) DEFAULT NULL,
  `spice_amt` varchar(100) DEFAULT NULL,
  `food_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `spice`
--

INSERT INTO `spice` (`id`, `spice_name`, `spice_amt`, `food_id`) VALUES
(107, NULL, NULL, 4),
(108, 'Pepper', '1 tbsp', 4);

-- --------------------------------------------------------

--
-- Table structure for table `veggies`
--

CREATE TABLE `veggies` (
  `veggies_id` int(6) NOT NULL,
  `veggies_name` varchar(30) DEFAULT NULL,
  `veggies_amt` varchar(30) DEFAULT NULL,
  `food_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `veggies`
--

INSERT INTO `veggies` (`veggies_id`, `veggies_name`, `veggies_amt`, `food_id`) VALUES
(114, 'Spinach', '1 kg', 1),
(115, NULL, NULL, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acc`
--
ALTER TABLE `acc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bake`
--
ALTER TABLE `bake`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_id` (`food_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_id` (`food_id`);

--
-- Indexes for table `condi`
--
ALTER TABLE `condi`
  ADD PRIMARY KEY (`condi_id`),
  ADD KEY `food_id` (`food_id`);

--
-- Indexes for table `dairy`
--
ALTER TABLE `dairy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_id` (`food_id`);

--
-- Indexes for table `dessert`
--
ALTER TABLE `dessert`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_id` (`food_id`);

--
-- Indexes for table `fish`
--
ALTER TABLE `fish`
  ADD PRIMARY KEY (`fish_id`),
  ADD KEY `food_id` (`food_id`);

--
-- Indexes for table `follow_log`
--
ALTER TABLE `follow_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_id` (`food_id`);

--
-- Indexes for table `fruit`
--
ALTER TABLE `fruit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_id` (`food_id`);

--
-- Indexes for table `ingredients_all`
--
ALTER TABLE `ingredients_all`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `like_log`
--
ALTER TABLE `like_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_id` (`food_id`);

--
-- Indexes for table `meat`
--
ALTER TABLE `meat`
  ADD PRIMARY KEY (`meat_id`),
  ADD KEY `meatfk` (`food_id`);

--
-- Indexes for table `nuts`
--
ALTER TABLE `nuts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_id` (`food_id`);

--
-- Indexes for table `oil`
--
ALTER TABLE `oil`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_id` (`food_id`);

--
-- Indexes for table `recipe_images`
--
ALTER TABLE `recipe_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_id` (`food_id`);

--
-- Indexes for table `soup`
--
ALTER TABLE `soup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_id` (`food_id`);

--
-- Indexes for table `spice`
--
ALTER TABLE `spice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_id` (`food_id`);

--
-- Indexes for table `veggies`
--
ALTER TABLE `veggies`
  ADD PRIMARY KEY (`veggies_id`),
  ADD KEY `food_id` (`food_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acc`
--
ALTER TABLE `acc`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `bake`
--
ALTER TABLE `bake`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `condi`
--
ALTER TABLE `condi`
  MODIFY `condi_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `dairy`
--
ALTER TABLE `dairy`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `dessert`
--
ALTER TABLE `dessert`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `fish`
--
ALTER TABLE `fish`
  MODIFY `fish_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `follow_log`
--
ALTER TABLE `follow_log`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `fruit`
--
ALTER TABLE `fruit`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `ingredients_all`
--
ALTER TABLE `ingredients_all`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `like_log`
--
ALTER TABLE `like_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT for table `meat`
--
ALTER TABLE `meat`
  MODIFY `meat_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `nuts`
--
ALTER TABLE `nuts`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `oil`
--
ALTER TABLE `oil`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `recipe_images`
--
ALTER TABLE `recipe_images`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `soup`
--
ALTER TABLE `soup`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `spice`
--
ALTER TABLE `spice`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `veggies`
--
ALTER TABLE `veggies`
  MODIFY `veggies_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bake`
--
ALTER TABLE `bake`
  ADD CONSTRAINT `bakefk` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `commfk` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `condi`
--
ALTER TABLE `condi`
  ADD CONSTRAINT `condifk` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dairy`
--
ALTER TABLE `dairy`
  ADD CONSTRAINT `dairyfk` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dessert`
--
ALTER TABLE `dessert`
  ADD CONSTRAINT `dessertfk` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`);

--
-- Constraints for table `fish`
--
ALTER TABLE `fish`
  ADD CONSTRAINT `fishfk` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fruit`
--
ALTER TABLE `fruit`
  ADD CONSTRAINT `fruitfk` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `like_log`
--
ALTER TABLE `like_log`
  ADD CONSTRAINT `likefk` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `meat`
--
ALTER TABLE `meat`
  ADD CONSTRAINT `meatfk` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nuts`
--
ALTER TABLE `nuts`
  ADD CONSTRAINT `nutsfk` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oil`
--
ALTER TABLE `oil`
  ADD CONSTRAINT `oilfk` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `recipe_images`
--
ALTER TABLE `recipe_images`
  ADD CONSTRAINT `imgfk` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `soup`
--
ALTER TABLE `soup`
  ADD CONSTRAINT `soupfk` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `spice`
--
ALTER TABLE `spice`
  ADD CONSTRAINT `spicefk` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `veggies`
--
ALTER TABLE `veggies`
  ADD CONSTRAINT `veggiefk` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
