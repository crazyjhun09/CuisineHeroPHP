-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 20, 2021 at 07:17 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food3`
--

-- --------------------------------------------------------

--
-- Table structure for table `acc`
--

DROP TABLE IF EXISTS `acc`;
CREATE TABLE IF NOT EXISTS `acc` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `pass` varchar(30) NOT NULL,
  `banner` varchar(100) DEFAULT NULL,
  `dispic` varchar(100) NOT NULL,
  `bio` text NOT NULL,
  `followno` int(10) NOT NULL,
  `recpno` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `acc`
--

INSERT INTO `acc` (`id`, `firstname`, `lastname`, `email`, `pass`, `banner`, `dispic`, `bio`, `followno`, `recpno`) VALUES
(6, 'Joshua', 'Marzan', 'jomarzan1111@gmail.com', '1', 'defaultban.png', 'defaultdp.png', ' ', 0, 0),
(8, 'Reynaldo', 'Factor', 'factorjun0309@gmail.com', 'yeah', '1623617642.png', '1623617661.png', '', 1, 0),
(14, 'CuisineHero', ' ', 'cuisinehero@gg.com', 'admin', '1623084420.png', '1623084421.png', '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `id` int(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
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

DROP TABLE IF EXISTS `bake`;
CREATE TABLE IF NOT EXISTS `bake` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `bake_name` varchar(100) DEFAULT NULL,
  `bake_amt` varchar(100) DEFAULT NULL,
  `food_id` int(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `food_id` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bake`
--

INSERT INTO `bake` (`id`, `bake_name`, `bake_amt`, `food_id`) VALUES
(110, 'Noodles', '1 pack', 1),
(111, 'Glutinous rice', '2 cups', 5),
(112, 'Glutinous rice balls', '20 pieces', 6),
(113, 'Coconut cream', '2 cups', 6),
(114, 'cream of tartar', '1/2 teaspoon', 7);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `food_id` int(30) NOT NULL,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `food_id` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `condi`
--

DROP TABLE IF EXISTS `condi`;
CREATE TABLE IF NOT EXISTS `condi` (
  `condi_id` int(6) NOT NULL AUTO_INCREMENT,
  `condi_name` varchar(30) DEFAULT NULL,
  `condi_amt` varchar(30) DEFAULT NULL,
  `food_id` int(6) NOT NULL,
  PRIMARY KEY (`condi_id`),
  KEY `food_id` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dairy`
--

DROP TABLE IF EXISTS `dairy`;
CREATE TABLE IF NOT EXISTS `dairy` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `dairy_name` varchar(100) DEFAULT NULL,
  `dairy_amt` varchar(100) DEFAULT NULL,
  `food_id` int(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `food_id` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dairy`
--

INSERT INTO `dairy` (`id`, `dairy_name`, `dairy_amt`, `food_id`) VALUES
(108, 'Eggs', '2', 2),
(109, 'Condensed milk', '14 ounces', 7);

-- --------------------------------------------------------

--
-- Table structure for table `dessert`
--

DROP TABLE IF EXISTS `dessert`;
CREATE TABLE IF NOT EXISTS `dessert` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `dessert_name` varchar(100) DEFAULT NULL,
  `dessert_amt` varchar(100) DEFAULT NULL,
  `food_id` int(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `food_id` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dessert`
--

INSERT INTO `dessert` (`id`, `dessert_name`, `dessert_amt`, `food_id`) VALUES
(107, 'Tapioca pearls (cooked)', '1 1/2 cups', 6);

-- --------------------------------------------------------

--
-- Table structure for table `fish`
--

DROP TABLE IF EXISTS `fish`;
CREATE TABLE IF NOT EXISTS `fish` (
  `fish_id` int(100) NOT NULL AUTO_INCREMENT,
  `fish_name` varchar(100) DEFAULT NULL,
  `fish_amt` varchar(100) DEFAULT NULL,
  `food_id` int(100) NOT NULL,
  PRIMARY KEY (`fish_id`),
  KEY `food_id` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fish`
--

INSERT INTO `fish` (`fish_id`, `fish_name`, `fish_amt`, `food_id`) VALUES
(144, 'Picked cooked crabmeat', '2 tbsp', 2);

-- --------------------------------------------------------

--
-- Table structure for table `follow_log`
--

DROP TABLE IF EXISTS `follow_log`;
CREATE TABLE IF NOT EXISTS `follow_log` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  `author` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

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

DROP TABLE IF EXISTS `food`;
CREATE TABLE IF NOT EXISTS `food` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `regdate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `food_id` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`id`, `food_id`, `author`, `food_name`, `cook_time`, `prep_time`, `servings`, `video_link`, `proced`, `nutri_info`, `likes`, `regdate`) VALUES
(77, 1, 'email@email.com', 'Lucky Me Beef Noodles', '3 mins', '3 mins', '1-2 People', '<iframe width=\"916\" height=\"515\" src=\"https://www.youtube.com/embed/ASlx70G2x-c\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', '1. Boil 3 cups of water<br><br>\r\n2. Put the seasoning and noodles in place<br><br>\r\n3. Crack the Egg on top of the boiling noodle soup<br><br>\r\n4. Stir until the egg is thoroughly cooked.<br><br>\r\n5 Serve hot.', 'Calories: 188.<br>\r\nCarbs: 27 grams.<br>\r\nTotal fat: 7 grams.<br>\r\nSaturated fat: 3 grams.<br>\r\nProtein: 4 grams.<br>\r\nFiber: 0.9 grams.<br>\r\nSodium: 861 mg.<br>\r\nThiamine: 43% of the RDI.', 0, '2021-06-14 20:53:53'),
(78, 2, 'cuisinehero@gg.com', 'Tortang Talong', '25 minutes', '10 minutes', '2 - 4 Servings', '<iframe width=\"950\" height=\"534\" src=\"https://www.youtube.com/embed/hM24u0gRjIM\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', '1.	Preheat the broiler.\r\n<br><br>\r\n2.	Lay the eggplants in a single layer on a baking sheet and broil them, flipping once or twice, until they are soft and blackened on all sides, about 15 minutes. (If you have a gas stove, you can do this by holding the eggplants with tongs over a burner on medium-high heat, turning them so they blacken on all sides.)\r\n<br><br>\r\n3.	Place the softened eggplants in a ziplock bag. Set aside for 10 minutes to steam (this makes the skin easier to peel). Peel the eggplants, discarding the skins, and use a fork to gently flatten the flesh.<br><br>\r\n4.	Put the eggs in a shallow bowl. Beat well and season with salt and pepper.\r\n<br><br>\r\n5.	In a large skillet, heat the vegetable oil over medium heat. Dip each eggplant in the beaten eggs, letting it soak for a second or two so that it is well covered with the egg. Season the egg-dipped eggplant with additional salt and pepper and place it in the skillet. Repeat with the other eggplant, making sure thereâ€™s room between them in the skillet. Place 1 tablespoon of the crab (if using) on top of each eggplant, pressing it down with a fork.\r\n<br><br>\r\n6.	When the eggplants are crispy and browned on one side, 4 to 5 minutes, flip them over and cook until browned and crispy on the second side, about 3 minutes more. Transfer the eggplants to a paper towelâ€“lined plate to drain.\r\n<br><br>\r\n7.	Serve hot or at room temperature, with fish sauce.\r\n\r\nCredits to Panlasang Pinoy YT for the video\r\n', 'â€¢	2 large Asian eggplants (about 1/3 pound/155 g each)	78 calories\r\n<br><br>\r\nâ€¢	2 extra-large eggs						114 calories\r\n<br><br>\r\nâ€¢	Kosher salt and freshly ground black pepper			0 calories\r\n<br><br>\r\nâ€¢	3 tablespoons vegetable oil 					358 Calories\r\n<br><br>\r\nâ€¢	2 tablespoons picked cooked crabmeat (optional)		13 calories \r\n<br><br>\r\nâ€¢	Fish sauce, for serving					6 calories/tbsp', 0, '2021-06-14 21:20:14'),
(79, 3, 'jomarzan1111@gmail.com', 'KILLER CHICKEN ADOBO', '30 minutes', '30 minutes', '4 people', '<iframe width=\"950\" height=\"534\" src=\"https://www.youtube.com/embed/aoc1_LwKaUg\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', '1.Combine chicken, soy sauce, and 1 cup lemon-lime soda. Mix. Marinate for at least 30 minutes.<br />\r\n2.Heat oil in a pan. Pan-fry marinated chicken for 1 minute per side. Remove from the pan. Set aside.<br />\r\n3.Using the remaining oil, sautÃ© garlic until it browns. Put the pan-fried chicken back into the pan. Add remaining marinade, lemon-lime soda, whole peppercorn, and dried bay leaves. Let boil.<br />\r\n4. Pour in vinegar. Let the mixture boil. Stir.<br />\r\n5. Add Knorr Chicken Cube. Cover and reduce heat between low to medium. Cook for 20 minutes.<br />\r\n6. Remove the cover of the pan. Adjust heat to medium. Continue cooking while stirring every few minutes until the sauce evaporates.<br />\r\n7. Transfer to a serving plate. Serve. Share and enjoy!', 'Calories: 178kcal | Carbohydrates: 18g | Protein: 3g | Fat: 11g | Saturated Fat: 1g | Cholesterol: 1mg | Sodium: 1063mg | Potassium: 88mg | Fiber: 1g | Sugar: 13g | Vitamin A: 77IU | Vitamin C: 3mg | Calcium: 36mg | Iron: 1mg', 0, '2021-06-15 02:26:59'),
(80, 4, 'jomarzan1111@gmail.com', 'Bistek Tagalog (beefsteak)', '40 minutes', '1 hour', '5 people', '<iframe width=\"480\" height=\"360\" src=\"https://www.youtube.com/embed/y9aA7K-aKOw\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', '1.Marinate beef in soy sauce, lemon (or calamansi), and ground black pepper for at least 1 hour. Note: marinate overnight for best result<br />\r\n2.Heat the cooking oil in a pan then pan-fry half of the onions until the texture becomes soft. Set aside<br />\r\n3.Drain the marinade from the beef. Set it aside. Pan-fry the beef on the same pan where the onions were fried for 1 minute per side. Remove from the pan. Set aside<br />\r\n4.Add more oil if needed. Saute garlic and remaining raw onions until onion softens.<br />\r\n5.Pour the remaining marinade and water. Bring to a boil.<br />\r\n6.Add beef. Cover the pan and simmer until meat is tender. Note: Add water as needed.<br />\r\n7.Season with ground black pepper and salt as needed. Top with pan-fried onions.<br />\r\n8.Transfer to a serving plate. Serve hot. Share and Enjoy!', 'Serving: 4g | Calories: 279kcal | Carbohydrates: 1g | Protein: 31g | Fat: 15g | Saturated Fat: 2g | Cholesterol: 74mg | Sodium: 1095mg | Potassium: 503mg | Vitamin C: 0.8mg | Calcium: 34mg | Iron: 2.8mg', 1, '2021-06-15 02:40:02'),
(81, 5, 'jomarzan1111@gmail.com', 'BIKO(rice cake)', '40 minutes', '10 minutes', '8 people', '<iframe width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/ThY66jHY-uI\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', '1.Combine the sticky rice and water in a rice cooker and cook until the rice is ready (we intentionally combined a lesser amount of water than the usual so that the rice will not be fully cooked)<br />\r\n2.While the rice is cooking, combine the coconut milk with brown sugar and salt in a separate pot and cook in low heat until the texture becomes thick. Stir constantly.<br />\r\n3.Once the rice is cooked and the coconut milk-sugar mixture is thick enough, add the cooked rice in the coconut milk and sugar mixture then mix well. Continue cooking until all the liquid evaporates (but do not overcook).<br />\r\n4.Scoop the cooked Biko and place it on a serving plate then flatten the surface.<br />\r\n5.Share and Enjoy!', '2 cups glutinous rice    -  338 calories<br />\r\n1 1/2 cups of water        -  0 calorie<br />\r\n2 cups of brown sugar  -973 calories <br />\r\n4 cups of coconut milk  -1,891 calories<br />\r\n1/2 tsp salt                        -0 calorie', 0, '2021-06-15 03:44:26'),
(82, 6, 'jomarzan1111@gmail.com', 'Ginataang Bilo bilo w/ Langka', '40 minutes', '5 minutes', '6 people', '<iframe width=\"640\" height=\"506\" src=\"https://www.youtube.com/embed/HYQx4el_xJk\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', '1.Pour the water into a cooking pot. Bring to a boil.<br />\r\n2.Add the coconut cream. Stir and cook until the mixture starts to boil again.<br />\r\n3.Gradually stir-in the sugar.<br />\r\n4.Add the ripe jackfruit. Cover and cook in low heat for 15 minutes.<br />\r\n5. Add in the bilo-bilo. Continue to cook for another 15 minutes while stirring every 3 minutes.<br />\r\n6. Put in the sago. Cook for 3 to 5 minutes.<br />\r\n7.Transfer to a serving bowl. Serve.<br />\r\n8.Share and enjoy!', 'Serving: 6g | Calories: 599kcal | Carbohydrates: 89g | Protein: 5g | Fat: 28g | Saturated Fat: 25g | Sodium: 10mg | Potassium: 683mg | Fiber: 4g | Sugar: 44g | Vitamin A: 104IU | Vitamin C: 15mg | Calcium: 42mg | Iron: 3mg', 0, '2021-06-15 04:04:13'),
(83, 7, 'jomarzan1111@gmail.com', 'Brazo de Mercedes', '30 minutes', '10 minutes', '6 people', '<iframe width=\"545\" height=\"409\" src=\"https://www.youtube.com/embed/zeWgdElgxtU\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', '1.Combine egg whites and cream of tartar then beat using an electric mixer until soft peaks form.<br />\r\n2.Make the meringue by gradually adding the granulated sugar while mixing the ingredients. Continue mixing until the texture is semi-firm.<br />\r\n3.Preheat the oven to 350 degrees Fahrenheit.<br />\r\n4.Place wax paper on top of a cookie sheet or large rectangular baking pan and grease the surface.<br />\r\n5.Place the meringue on top of the greased wax paper then spread evenly using a spatula.<br />\r\n6.Bake the meringue for 20 to 22 minutes or until the color of the top part turns light to medium brown.<br />\r\n7.While the meringue is in the oven, make the filling by combining the egg yolks and condensed milk in a small cooking pot. Apply heat and cook the mixture while continuously stirring until the texture becomes thick.<br />\r\n8.Add the vanilla extract to the condensed milk and egg yolk mixture, turn off the heat, and mix thoroughly. Set aside.<br />\r\n9.Remove the meringue from the oven and cool down for a few minutes.<br />\r\n10.Sprinkle the confectioners sugar on top of the meringue then place wax paper on the top part of the meringue followed by a similar sized baking pan or tray. The meringue should now be in the middle of two baking trays.<br />\r\n11.Flip the meringue: the new cookie sheet/baking tray placed on top should now be below. Remove the baking tray and the wax paper (you should now see the opposite side of the baked meringue) then spread the filling (cooked egg yolks, condensed milk, and vanilla extract mixture) over the meringue.<br />\r\n12.Roll the meringue. Complete rolling side to side starting at the longest side. Make sure that the layer with filling is rolled inward.<br />\r\n13.Transfer to a serving plate then serve.<br />\r\n14. Share and enjoy!', '10 large raw eggs yolks and whites separated -715 calories<br />\r\n1/2 teaspoon cream of tartar - 4 calories <br />\r\n1 teaspoon vanilla extract - 12 calories<br />\r\n3/4 cup granulated sugar - 581 calories<br />\r\n3 tablespoons confectioners sugar - 85 calories<br />\r\n14 ounces condensed milk - 1,717 calories', 0, '2021-06-15 07:41:52');

-- --------------------------------------------------------

--
-- Table structure for table `fruit`
--

DROP TABLE IF EXISTS `fruit`;
CREATE TABLE IF NOT EXISTS `fruit` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `fruit_name` varchar(100) DEFAULT NULL,
  `fruit_amt` varchar(100) DEFAULT NULL,
  `food_id` int(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `food_id` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fruit`
--

INSERT INTO `fruit` (`id`, `fruit_name`, `fruit_amt`, `food_id`) VALUES
(105, 'jackfruit ', '20 oz', 6);

-- --------------------------------------------------------

--
-- Table structure for table `ingredients_all`
--

DROP TABLE IF EXISTS `ingredients_all`;
CREATE TABLE IF NOT EXISTS `ingredients_all` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `ing_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ingredients_all`
--

INSERT INTO `ingredients_all` (`id`, `ing_name`) VALUES
(103, 'Large raw eggs'),
(104, 'vanilla extract'),
(105, 'Granulated white sugar'),
(106, 'Confectioners sugar'),
(107, 'Condensed milk'),
(108, 'cream of tartar'),
(109, 'Picked cooked crabmeat'),
(110, 'Eggplant'),
(112, 'Pepper'),
(113, 'Eggs'),
(114, 'Fish Sauce'),
(115, 'chicken'),
(116, 'garlic'),
(117, 'Knorr chicken cube'),
(118, 'dried bay leaves'),
(119, 'whole peppercorn'),
(120, 'soy sauce'),
(121, 'white vinegar'),
(122, 'beef sirloin (thinly sliced)'),
(123, 'yellow onion'),
(124, 'calamansi'),
(125, 'ground black pepper'),
(126, 'Salt'),
(127, 'Brown sugar'),
(128, 'Glutinous rice'),
(129, 'jackfruit'),
(131, 'Tapioca pearls (cooked)'),
(132, 'Glutinous rice balls'),
(133, 'Coconut cream');

-- --------------------------------------------------------

--
-- Table structure for table `like_log`
--

DROP TABLE IF EXISTS `like_log`;
CREATE TABLE IF NOT EXISTS `like_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  `likes` int(1) NOT NULL,
  `food_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `food_id` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `like_log`
--

INSERT INTO `like_log` (`id`, `email`, `likes`, `food_id`) VALUES
(163, 'jomarzan1111@gmail.com', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `meat`
--

DROP TABLE IF EXISTS `meat`;
CREATE TABLE IF NOT EXISTS `meat` (
  `meat_id` int(6) NOT NULL AUTO_INCREMENT,
  `meat_name` varchar(30) DEFAULT NULL,
  `meat_amt` varchar(30) DEFAULT NULL,
  `food_id` int(6) NOT NULL,
  PRIMARY KEY (`meat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meat`
--

INSERT INTO `meat` (`meat_id`, `meat_name`, `meat_amt`, `food_id`) VALUES
(141, 'Eggs', '2 pcs', 1),
(142, 'chicken', '2 1/2 lbs', 3),
(143, 'beef sirloin (thinly sliced)', '1 1/2 lbs', 4),
(144, 'Large raw eggs', '10 pc', 7);

-- --------------------------------------------------------

--
-- Table structure for table `nuts`
--

DROP TABLE IF EXISTS `nuts`;
CREATE TABLE IF NOT EXISTS `nuts` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `nuts_name` varchar(100) DEFAULT NULL,
  `nuts_amt` varchar(100) DEFAULT NULL,
  `food_id` int(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `food_id` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `recipe_images`
--

DROP TABLE IF EXISTS `recipe_images`;
CREATE TABLE IF NOT EXISTS `recipe_images` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `food_img` varchar(30) NOT NULL,
  `food_id` int(11) NOT NULL,
  `author` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `food_id` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recipe_images`
--

INSERT INTO `recipe_images` (`id`, `food_img`, `food_id`, `author`) VALUES
(91, '1623708591.png', 1, 'email@email.com'),
(92, '1623710163.png', 2, 'cuisinehero@gg.com'),
(93, '1623728571.png', 3, 'jomarzan1111@gmail.com'),
(94, '1623729358.png', 4, 'jomarzan1111@gmail.com'),
(95, '1623733214.png', 5, 'jomarzan1111@gmail.com'),
(96, '1623734404.png', 6, 'jomarzan1111@gmail.com'),
(97, '1623747470.png', 7, 'jomarzan1111@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `soup`
--

DROP TABLE IF EXISTS `soup`;
CREATE TABLE IF NOT EXISTS `soup` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `soup_name` varchar(100) DEFAULT NULL,
  `soup_amt` varchar(100) DEFAULT NULL,
  `food_id` int(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `food_id` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `soup`
--

INSERT INTO `soup` (`id`, `soup_name`, `soup_amt`, `food_id`) VALUES
(108, 'Beef Packet Seasoning', '1 pack', 1),
(109, 'Fish Sauce', 'preference to taste', 2),
(110, 'soy sauce', '1/4 cup', 3),
(111, 'white vinegar', '1/2 cup', 3);

-- --------------------------------------------------------

--
-- Table structure for table `spice`
--

DROP TABLE IF EXISTS `spice`;
CREATE TABLE IF NOT EXISTS `spice` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `spice_name` varchar(100) DEFAULT NULL,
  `spice_amt` varchar(100) DEFAULT NULL,
  `food_id` int(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `food_id` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `spice`
--

INSERT INTO `spice` (`id`, `spice_name`, `spice_amt`, `food_id`) VALUES
(107, 'Salt', 'preference to taste', 2),
(108, 'Pepper', 'preference to taste', 2),
(109, 'Knorr chicken cube', '1 piece', 3),
(110, 'dried bay leaves', '5 pieces', 3),
(111, 'whole peppercorn', '2 teaspoon', 3),
(112, ' calamansi', '4 pieces', 4),
(113, 'ground black pepper', '1/2 tsp', 4),
(114, 'Salt', '1 pinch', 4),
(115, 'Brown sugar', '2 cups', 5),
(116, 'Salt', '1/2 teaspoon', 5),
(117, 'Granulated white sugar', '3/4 cup', 6),
(118, 'vanilla extract', '1 teaspoon', 7),
(119, 'Granulated white sugar', '3/4 cup', 7),
(120, 'Confectioners sugar', '3 tablespoons', 7);

-- --------------------------------------------------------

--
-- Table structure for table `veggies`
--

DROP TABLE IF EXISTS `veggies`;
CREATE TABLE IF NOT EXISTS `veggies` (
  `veggies_id` int(6) NOT NULL AUTO_INCREMENT,
  `veggies_name` varchar(30) DEFAULT NULL,
  `veggies_amt` varchar(30) DEFAULT NULL,
  `food_id` int(6) NOT NULL,
  PRIMARY KEY (`veggies_id`),
  KEY `food_id` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `veggies`
--

INSERT INTO `veggies` (`veggies_id`, `veggies_name`, `veggies_amt`, `food_id`) VALUES
(114, 'Eggplant', '2 - 155 grams each', 2),
(115, 'garlic', '1 head', 3),
(116, ' garlic', '3 cloves', 4),
(117, 'yellow onion (sliced into ring', '3 pieces', 4);

--
-- Constraints for dumped tables
--

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
