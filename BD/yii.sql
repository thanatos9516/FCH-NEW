-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2018 at 06:34 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yii`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addinventory` (IN `userid` INT(11), IN `action` VARCHAR(50), IN `productid` INT(11), IN `quantity` DOUBLE, IN `inventory_date` DATETIME)  BEGIN 
INSERT INTO inventory(userid, action, productid, quantity, inventory_date) VALUES (userid, action, productid, quantity, inventory_date);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addproduct` (IN `product_name` VARCHAR(150), IN `categoryid` INT(11), IN `product_price` DOUBLE, IN `product_qty` DOUBLE, IN `supplierid` INT(11), IN `description` VARCHAR(1000), IN `photo` VARCHAR(400), IN `tech` VARCHAR(3000), IN `video` VARCHAR(1000))  BEGIN
INSERT INTO product (product_name, categoryid, product_price, product_qty, supplierid, description, photo, tech, video) VALUES (product_name, categoryid , product_price , product_qty , supplierid , description , photo , tech, video);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteimg` (IN `id` INT(11))  BEGIN
DELETE FROM carousel WHERE idphoto = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GuardarImagen` (IN `Productid` INT, IN `Photo` VARCHAR(100))  BEGIN
   INSERT INTO carousel (idphoto,productid, photo) VALUES (default,Productid, Photo);
   END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listaproduct` ()  BEGIN
select * from product left join category on category.categoryid=product.categoryid left join supplier on supplier.userid=product.supplierid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_product` (`_productid` INT, `_product_name` VARCHAR(150), `_supplierid` INT, `_categoryid` INT, `_product_price` DOUBLE, `_photo` VARCHAR(200), `_product_qty` DOUBLE, `_description` VARCHAR(1000), `_tech` VARCHAR(3000), `_video` VARCHAR(1000))  BEGIN
update product set 
product_name = _product_name,
supplierid = _supplierid,
categoryid = _categoryid,
product_price = _product_price,
photo = _photo,
product_qty = _product_qty,
description = _description,
tech = _tech,
video = _video
where productid = _productid;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `carousel`
--

CREATE TABLE `carousel` (
  `idphoto` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `productid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `carousel`
--

INSERT INTO `carousel` (`idphoto`, `photo`, `productid`) VALUES
(1, 'upload/motomop1.jpg', 53),
(2, 'upload/motomop2.jpg', 53),
(5, 'upload/motomop5.jpg', 53),
(6, 'upload/motomop6.jpg', 53),
(8, 'upload/e85903-00_300x300_main.jpg', 52),
(11, 'upload/e88398-00_300x300_main.jpg', 36);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cartid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `qty` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cartid`, `userid`, `productid`, `qty`) VALUES
(1, 2, 28, 8);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryid` int(11) NOT NULL,
  `category_name` varchar(30) NOT NULL,
  `description` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryid`, `category_name`, `description`) VALUES
(1, 'Floor Scrubber Parts ', 'Floor Scrubber Parts'),
(2, 'Profane Buffers Parts', ''),
(3, 'Tires And Weels', ''),
(4, 'Vacuum Motors', ''),
(5, 'new equitment', ''),
(6, 'Batteries', ''),
(7, 'Betco', ''),
(8, 'Advance', ''),
(9, 'Clarke', ''),
(10, 'Sub Scrubber', ''),
(11, 'Betco Green Cleaning', ''),
(12, 'Pioneer Eclipse Green Cleaning', ''),
(13, 'Pioneer Eclipse', ''),
(14, 'Pads', '');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `userid` int(11) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `address` varchar(150) NOT NULL,
  `contact` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`userid`, `customer_name`, `address`, `contact`) VALUES
(2, 'Jose Molina Cascante', 'Nicoya Costa Rica', '+50661372755'),
(8, 'Anthony', 'Canada', '800-678-0502');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `inventoryid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `action` varchar(50) NOT NULL,
  `productid` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `inventory_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`inventoryid`, `userid`, `action`, `productid`, `quantity`, `inventory_date`) VALUES
(1, 2, 'Purchase', 4, 10, '2017-09-18 09:32:01'),
(2, 2, 'Purchase', 20, 10, '2017-09-18 09:32:01'),
(3, 2, 'Purchase', 1, 99, '2017-09-18 09:32:01'),
(4, 2, 'Purchase', 2, 20, '2017-09-18 09:32:01'),
(5, 2, 'Purchase', 2, 10, '2017-09-18 09:34:29'),
(6, 2, 'Purchase', 2, 10, '2017-09-18 11:09:21'),
(7, 2, 'Purchase', 3, 12, '2017-09-18 11:09:22'),
(8, 2, 'Purchase', 4, 8, '2017-09-18 11:09:22'),
(9, 1, 'Add Product', 27, 10, '2017-09-18 13:59:25'),
(10, 1, 'Update quantity', 27, 20, '2017-09-18 14:04:32'),
(11, 1, 'Add Product', 23, 10, '2017-11-19 17:44:44'),
(12, 2, 'Purchase', 23, 1, '2017-11-19 17:45:58'),
(13, 1, 'Add Product', 24, 20, '2017-11-22 19:34:56'),
(14, 1, 'Purchase', 24, 1, '2017-11-22 19:47:29'),
(15, 1, 'Add Product', 25, 0, '2017-12-01 22:12:09'),
(16, 1, 'Update Quantity', 25, 0, '2017-12-01 22:12:58'),
(17, 1, 'Add Product', 26, 0, '2017-12-01 22:13:30'),
(18, 1, 'Add Product', 27, 10, '2017-12-01 22:18:30'),
(19, 1, 'Purchase', 23, 1, '2017-12-04 21:16:56'),
(20, 1, 'Purchase', 27, 2, '2017-12-04 21:17:25'),
(21, 1, 'Add Product', 28, 0, '2017-12-05 17:46:36'),
(22, 1, 'Update Quantity', 28, 10, '2017-12-06 17:39:28'),
(23, 1, 'Add Product', 35, 20, '2018-01-19 11:53:07'),
(24, 1, 'Add Product', 36, 20, '2018-01-19 11:55:09'),
(25, 1, 'Add Product', 37, 10, '2018-01-19 12:01:02'),
(26, 1, 'Add Product', 38, 10, '2018-01-19 12:08:32'),
(27, 1, 'Add Product', 39, 20, '2018-01-19 15:00:27'),
(28, 1, 'Add Product', 40, 10, '2018-01-19 15:11:58'),
(29, 1, 'Add Product', 41, 2, '2018-01-28 11:00:12'),
(30, 1, 'Add Product', 42, 10, '2018-01-28 14:42:31'),
(31, 1, 'Add Product', 43, 10, '2018-01-28 14:48:40'),
(32, 1, 'Add Product', 44, 10, '2018-01-28 14:53:25'),
(33, 1, 'Add Product', 45, 10, '2018-01-28 14:55:16'),
(34, 1, 'Update Quantity', 34, 1, '2018-01-28 15:21:32'),
(35, 1, 'Update Quantity', 28, 1, '2018-01-28 15:22:08'),
(36, 1, 'Add Product', 46, 10, '2018-01-28 15:27:04'),
(37, 1, 'Add Product', 47, 10, '2018-01-28 15:29:46'),
(38, 1, 'Add Product', 48, 10, '2018-01-28 15:30:36'),
(39, 1, 'Add Product', 49, 10, '2018-01-28 15:31:21'),
(40, 1, 'Add Product', 50, 10, '2018-01-28 16:05:41'),
(41, 1, 'Add Product', 0, 2, '2018-02-13 22:48:01'),
(42, 1, 'Add Product', 0, 2, '2018-02-13 22:53:24'),
(43, 1, 'Add Product', 51, 2, '2018-02-13 23:03:26'),
(44, 1, 'Add Product', 0, 2, '2018-02-13 23:04:42'),
(45, 1, 'Add Product', 0, 2, '2018-02-13 23:06:00'),
(46, 1, 'Add Product', 52, 2, '2018-02-13 23:06:21'),
(47, 1, 'Add Product', 53, 2, '2018-02-18 14:52:51'),
(48, 1, 'Add Product', 0, 2, '2018-02-19 00:35:25'),
(49, 1, 'Add Product', 0, 2, '2018-02-19 00:36:37'),
(50, 1, 'Add Product', 0, 2, '2018-02-19 00:37:49'),
(51, 1, 'Add Product', 0, 2, '2018-02-19 00:38:37'),
(52, 1, 'Add Product', 0, 2, '2018-02-19 00:39:42'),
(53, 1, 'Add Product', 54, 2, '2018-02-19 00:40:57'),
(54, 1, 'Add Product', 55, 2, '2018-02-19 00:54:12'),
(55, 1, 'Add Product', 56, 2, '2018-02-19 00:56:45'),
(56, 1, 'Add Product', 57, 2, '2018-02-19 00:57:15'),
(57, 1, 'Add Product', 58, 2, '2018-02-19 01:00:18'),
(58, 1, 'Add Product', 59, 2, '2018-02-19 01:02:28'),
(59, 1, 'Add Product', 60, 2, '2018-02-19 01:04:37'),
(60, 1, 'Add Product', 61, 2, '2018-02-19 01:08:53'),
(61, 1, 'Add Product', 62, 2, '2018-02-19 01:11:17'),
(62, 1, 'Add Product', 63, 2, '2018-02-19 01:15:39'),
(63, 1, 'Add Product', 64, 2, '2018-02-19 18:01:38'),
(64, 1, 'Add Product', 65, 2, '2018-02-19 18:05:17'),
(65, 1, 'Add Product', 66, 2, '2018-02-19 18:07:49'),
(66, 1, 'Add Product', 0, 2, '2018-02-19 18:10:07'),
(67, 1, 'Add Product', 0, 2, '2018-02-19 18:11:30'),
(68, 1, 'Add Product', 67, 2, '2018-02-19 18:12:00'),
(69, 1, 'Add Product', 68, 2, '2018-02-19 18:36:10'),
(70, 1, 'Add Product', 69, 2, '2018-02-22 00:46:31'),
(71, 1, 'Add Product', 70, 2, '2018-02-22 00:48:29'),
(72, 1, 'Add Product', 71, 2, '2018-02-22 01:37:31'),
(73, 1, 'Add Product', 0, 2, '2018-02-22 01:40:32'),
(74, 1, 'Add Product', 0, 2, '2018-02-22 01:41:22'),
(75, 1, 'Add Product', 0, 2, '2018-02-22 01:42:19'),
(76, 1, 'Add Product', 0, 2, '2018-02-22 01:42:49'),
(77, 1, 'Add Product', 72, 2, '2018-02-22 01:43:03'),
(78, 1, 'Add Product', 73, 2, '2018-02-22 02:06:08'),
(79, 1, 'Add Product', 74, 2, '2018-02-22 02:16:35'),
(80, 1, 'Add Product', 75, 2, '2018-02-22 02:28:40'),
(81, 1, 'Add Product', 76, 2, '2018-02-26 00:56:30'),
(82, 1, 'Add Product', 77, 2, '2018-02-26 01:05:17'),
(83, 1, 'Add Product', 78, 1, '2018-02-26 01:08:41'),
(84, 1, 'Add Product', 79, 2, '2018-02-26 01:11:01'),
(85, 2, 'Purchase', 34, 3, '2018-05-13 02:12:51'),
(86, 2, 'Purchase', 28, 3, '2018-05-13 02:12:51'),
(87, 1, 'Update Quantity', 34, 20, '2018-05-16 01:26:03');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productid` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `product_name` varchar(150) NOT NULL,
  `product_price` double NOT NULL,
  `product_qty` double NOT NULL,
  `photo` varchar(200) NOT NULL,
  `supplierid` int(11) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `video` varchar(1000) NOT NULL,
  `tech` varchar(3000) NOT NULL,
  `barcode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productid`, `categoryid`, `product_name`, `product_price`, `product_qty`, `photo`, `supplierid`, `description`, `video`, `tech`, `barcode`) VALUES
(27, 2, 'Vacuum Motors', 210, 8, 'upload/e85903-00_300x300_main.png', 4, 'Betco back pack vacuums provide a high productivity alternative to upright vacuum cleaning by reducing labor and fatigue. Perform total floor to ceiling cleaning in all types of dry vacuuming applications. Includes an ergonomically designed backrest to enhance operator comfort \r\n<br>\r\n<br>\r\n\r\n\r\nLightweight and versatile design reduces operator fatigue.\r\n\r\nMulti-task tool kit included.\r\n\r\nQuad filtration captures fine dust particles.\r\n\r\n\r\nfor Betco STEALTH DRS26BT', '', '', 0),
(28, 10, 'Tennant Tire', 210, 10, 'upload/1 (Copiar)_1512603568_1512603723.png', 4, 'No avaible', 'No avaible', 'No avaible', 0),
(34, 10, 'Scrubber Casters', 20, 20, 'upload/SCRUBBER_CASTERS_1511398657.jpg', 4, 'Work on Cars', '', '', 0),
(36, 7, 'LIL BERTHA®', 1000, 20, 'None', 0, 'Betco provides the most productive stripping machines available today. Built with a tough steel frame and a reliable 603cc Kawasaki V-Twin engine this propane powered machine provides the performance and durability required to quickly handle large areas and excessive finish build ups.A wide 24', 'No avaible', 'No avaible', 0),
(37, 10, 'Scrubber Electronics Parts', 15, 10, 'upload/SCRUBBER_ELECTRONIC_PARTS_1517176157.jpg', 4, '', '', '', 0),
(38, 6, 'Batterie', 15, 10, 'upload/New_Batteries_1516385312.jpg', 5, '', '', '', 0),
(39, 2, 'Buffer Wheels', 20, 20, 'upload/BUFFER_WHEELS_1516395627.jpg', 4, '', '', '', 0),
(40, 10, 'Vacuum Motors', 210, 10, 'upload/Vacuum_Motors_1517176063.jpg', 4, '', '', '', 0),
(42, 9, 'CA30 17E ', 3000, 10, 'upload/CA30_17E_1517172151.jpg', 7, '', '', '', 0),
(43, 9, 'Clarke Focus II Rider', 20000, 10, 'upload/Clarke_Focus_II_Rider_1517172520.jpg', 7, '', '', '', 0),
(44, 9, 'Focus II Compact', 7000, 10, 'upload/Focus_II_Compact_Autoscrubber_1517172804.jpg', 7, '', '', '', 0),
(45, 9, 'Focus II MicroRider', 15000, 10, 'upload/Focus_II_MicroRider_1517172916.jpg', 7, '', '', '', 0),
(46, 9, 'Focus II Mid Size ', 9000, 10, 'upload/Focus_II_Mid_Size_Autoscrubber_1517174823.jpg', 7, '', '', '', 0),
(47, 9, 'MA10 12E', 2000, 10, 'upload/MA10_12E_1517174985.jpg', 7, '', '', '', 0),
(48, 1, 'MA30 13b', 4000, 10, 'upload/MA30_13b_1517175035.jpg', 4, '', '', '', 0),
(49, 9, 'Vantage 14', 4000, 10, 'upload/Vantage_14_1517175081.jpg', 7, '', '', '', 0),
(50, 4, 'Betco Vacuum', 200, 10, 'upload/vacuum1_1517177141.png', 5, '', '', '', 0),
(52, 7, 'Backpack Vacuums', 1000, 2, 'upload/e85903-00_300x300_main_1527300794.jpg', 5, 'Betco back pack vacuums provide a high productivity alternative to upright vacuum cleaning by reducing labor and fatigue. Perform total floor to ceiling cleaning in all types of dry vacuuming applications. Includes an ergonomically designed backrest to enhance operator comfort \r\n\r\nLightweight and versatile design reduces operator fatigue.\r\n\r\nMulti-task tool kit included.\r\n\r\nQuad filtration captures fine dust particles.\r\n\r\n', '', 'Airflow: 120 CFM\r\nDust Bag Capacity: 1.25 Gallons\"\r\nFiltration: 	3-Stage\r\nTool Kit: Multi-Task Tool Kit Included\r\nVacuum Motor: 1000 Watt\r\nWater Lift: 100\"\r\nWeight: 11 Pounds\r\n', 0),
(53, 7, 'Motomop', 1000, 2, 'upload/motomop1_1533456011.jpg', 5, '', '', '', 0),
(54, 8, 'SC100â„¢', 1000, 2, 'upload/SC100_1519104219.jpg', 6, 'MOVING BEYOND THE MOP.\r\n\r\nFor generations the mop and bucket was the only option for cleaning small spaces, but simply spreading dirt around is neither effective nor sanitary. This is why Advance developed the SC100â„¢ Upright Scrubber. Not only does its compact, lightweight design allow you to clean very tight areas, but its superior productivity gets the job done fast, giving you more time for other tasks.\r\n\r\nThe faster way to cleaner floors.\r\n\r\nThe Advance SC100â€™s convenient, easy-to-use features make it perfect for cleaning small, high-traffic spaces quickly and effectively. The single-pass scrub and dry performance provides quick access to cleaned areas, and the comfortable, two-hand grip combined with its light weight make maneuverability and transport easy for any operator.\r\nA cleaner clean.\r\n\r\nWith a more effective cleaning system that removes dirt and water rather than spreading it around like a traditional mop, you not only decrease chances for slip-and-falls, but you creat', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/sBaVc6XXx7U\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>', 'PERFORMANCE & FEATURES\r\n\r\n    Two solution flow settings and a low solution indicator light ensure efficient cleaning\r\n    Ergonomic handle for comfortable one or two-handed operation\r\n    Easy-to-handle recovery tank makes emptying dirty water easier\r\n    Low deck profile gives the operator easy access to hardto- reach areas\r\n    Dosing cap makes adding the right amount of detergent much easier\r\n    Strong aluminum frame is built for reliability and long life', 0),
(55, 8, 'SC6000â„¢', 1000, 2, 'upload/SC6000_1519104402.jpg', 6, ' HIGHER PRODUCTIVITY WITH A LOWER COST TO CLEAN\r\n\r\nUnparalleled durability and ease of use.\r\nHigh Productivity in a compact package\r\n\r\nâ€¢ Up to 30% greater runtime/productivity versus nearest competitor\r\nRugged industrial design for maximum life\r\n\r\nâ€¢ Fully protected scrub deck, tubular frame, and extended life cylindrical deck components\r\nSmartKeyâ„¢ with impact detection\r\n\r\nâ€¢ Provides unique levels of user access to produce consistent results with greater operator accountability, and lower total cost of cleaning\r\nSmartFlowâ„¢ and intermittent solution off\r\n\r\nâ€¢ Reduces water and chemical usage by up to 50% while producing safer cleaning results\r\nOffset deck\r\n\r\nâ€¢ For edge cleaning with no added complexity or cost\r\n', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/I3lWyR9ozo0\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>', '', 0),
(56, 1, 'SC250', 1000, 2, 'upload/SC250_1519023405.jpg', 4, 'Compact and Maneuverable.\r\n\r\nWith its compact, highly maneuverable design, the SC250 is ideal for scrubbing in tight corners or under tables or chairs. Itâ€™s adjustable and foldable handle makes transport and storage easy.\r\n\r\nFast and Effective Cleaning\r\n\r\nEasily raise the front squeegee to sweep up small debris while scrubbing, thereby minimizing the need to pre-sweep. Designed to pick-up water in forward and reverse directions, the SC250 ensures a clean, dry, more hygienic environment while decreasing chances for slip-and-fall accidents.\r\nBattery Powered\r\n\r\nThe SC250 uses a powerful 36 V Lithium battery that provides up to 40 minutes of run time and operates at only 66 dB A, allowing for daytime cleaning and cleaning of noisesensitive areas. The cordless design ensures a safer cleaning environment and flexible cleaning options.\r\n\r\nSave time. Reduce costs.', 'No video available at this time', 'EFFECTIVE & COMPACT & SAFE & SANITARY\r\n\r\n    Sweep, scrub and dry in a single pass\r\n    Ideal design for scrubbing small spaces quickly\r\n    Cord-free and quiet operation\r\n    Creates a cleaner environment than mopping', 0),
(57, 8, 'SC250â„¢', 1000, 2, 'upload/sc250_1538017353.jpg', 6, 'Compact and Maneuverable.\r\n\r\nWith its compact, highly maneuverable design, the SC250 is ideal for scrubbing in tight corners or under tables or chairs. Itâ€™s adjustable and foldable handle makes transport and storage easy.\r\n\r\nFast and Effective Cleaning\r\n\r\nEasily raise the front squeegee to sweep up small debris while scrubbing, thereby minimizing the need to pre-sweep. Designed to pick-up water in forward and reverse directions, the SC250 ensures a clean, dry, more hygienic environment while decreasing chances for slip-and-fall accidents.\r\nBattery Powered\r\n\r\nThe SC250 uses a powerful 36 V Lithium battery that provides up to 40 minutes of run time and operates at only 66 dB A, allowing for daytime cleaning and cleaning of noisesensitive areas. The cordless design ensures a safer cleaning environment and flexible cleaning options.\r\n\r\nSave time. Reduce costs.', 'No videos available at this time.', 'EFFECTIVE & COMPACT & SAFE & SANITARY\r\n\r\n    Sweep, scrub and dry in a single pass\r\n    Ideal design for scrubbing small spaces quickly\r\n    Cord-free and quiet operation\r\n    Creates a cleaner environment than mopping', 0),
(58, 8, 'SC351â„¢ COMMERCIAL', 1000, 2, 'upload/SC351-comercial_1519104291.jpg', 6, 'Innovative Deck and Compact Design Marks a Breakthrough in Daily Scrubbing for Small Area Cleaning.\r\n\r\nJust another small scrubber? Think again. The Advance SC351â„¢ micro scrubber proves itâ€™s in a class of it its own, delivering faster, better and easier scrubbing. Combine these features with the unique, fully adjustable rotating deck and you are on your way to superior scrubbing performance. Featuring full battery-powered operation with a standard onboard battery charger, the 14 inch disc delivers more scrubbing with minimal downtime and less hassle. Plus, at only 64 dB A, the SC351 is the quietest machine in its class, making daytime cleaning and cleaning of noise-sensitive areas an easy option. With its compact, maneuverable design, the SC351 is ideal for scrubbing in tight corners or under tables or chairs.\r\nPatented Rotating Deck\r\n\r\nNever skip those hard-to-reach areas again. By using the SC351, with its integrated rotating deck, operators are ensured the flexibility to clean u', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/7y-WyMPcujU\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>', 'PERFORMANCE & FEATURES\r\n\r\n    Easy-to-use control panel has four operating mode options, allowing for diverse scrub settings\r\n    Foldable/adjustable handle makes transport and storage easy\r\n    Recovery and solution tank can be quickly and easily removed for refill, dumping or cleaning procedures\r\n    Standard onboard battery charger saves time and increases productivity\r\n    Integrated squeegee allows forward and backward water pick-up\r\n    Durable brush and heavy-duty polyurethane squeegee blades can be easily changed without the use of tools\r\n', 0),
(59, 8, 'SC351â„¢ INDUSTRIAL', 1000, 2, 'upload/SC351-industrial_1519104302.jpg', 6, 'Innovative Deck and Compact Design Marks a Breakthrough in Daily Scrubbing for Small Area Cleaning.\r\n\r\nJust another small scrubber? Think again. The Advance SC351â„¢ micro scrubber proves itâ€™s in a class of it its own, delivering faster, better and easier scrubbing. Combine these features with the unique, fully adjustable rotating deck and you are on your way to superior scrubbing performance. Featuring full battery-powered operation with a standard onboard battery charger, the 14 inch disc delivers more scrubbing with minimal downtime and less hassle. Plus, at only 64 dB A, the SC351 is the quietest machine in its class, making daytime cleaning and cleaning of noise-sensitive areas an easy option. With its compact, maneuverable design, the SC351 is ideal for scrubbing in tight corners or under tables or chairs.\r\nPatented Rotating Deck\r\n\r\nNever skip those hard-to-reach areas again. By using the SC351, with its integrated rotating deck, operators are ensured the flexibility to clean u', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/7y-WyMPcujU\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>', 'PERFORMANCE & FEATURES\r\n\r\n    Easy-to-use control panel has four operating mode options, allowing for diverse scrub settings\r\n    Foldable/adjustable handle makes transport and storage easy\r\n    Recovery and solution tank can be quickly and easily removed for refill, dumping or cleaning procedures\r\n    Standard onboard battery charger saves time and increases productivity\r\n    Integrated squeegee allows forward and backward water pick-up\r\n    Durable brush and heavy-duty polyurethane squeegee blades can be easily changed without the use of tools\r\n', 0),
(60, 8, 'SC400â„¢', 1000, 2, 'upload/SC400_1519104320.jpg', 6, 'A RELIABLE, COST-EFFICIENT CLEANING SOLUTION TO BRIDGE THE GAP BETWEEN MOPS AND LARGER SCRUBBERS.\r\n\r\nWith dependable cleaning performance and easy-to-use design, the Advance SC400â„¢ walk-behind automatic scrubber provides a cost-effective alternative to labor-intensive mop and bucket or high-priced, larger automatic scrubbers. Featuring a compact size and 6 gallon solution and recovery tanks, the SC400 enhances cleaning productivity in small spaces, such as gas stations, schools and healthcare facilities.', 'No videos available at this time.', 'PERFORMANCE & FEATURES\r\n\r\n    Simple, intuitive controls minimizes operator training\r\n    Wrap-around ergonomic handle system provides operator comfort\r\n    Large, easy-to-access recovery tank cover allows for complete cleaning of recovery tank and vacuum shut-off float\r\n    Variable solution flow with Smart Solutionâ„¢ enhances productivity and sustainability\r\n    Squeegee features no-tools rotation and replacement of squeegee blades\r\n    6 gallon solution and recovery tanks are rotationally molded out of heavy-duty polyethylene for superior durability\r\n', 0),
(61, 8, 'SC450', 1000, 2, 'upload/SC450_1519104355.jpg', 6, 'DEPENDABLE, EASY-TO-USE SCRUBBER SOLUTION SIMPLIFIES CLEANING OPERATION WHILE MAXIMIZING THE BOTTOM LINE\r\n\r\nThe Advance SC450â„¢ automatic scrubber provides simple, cost-effective performance for daily scrubbing needs. With reliable operation, high productivity and low maintenanceâ€”all at a budget-friendly valueâ€”this contractor-grade machine is designed to satisfy a wide range of applications. The 10.5 gallon SC450 features a 20 inch scrub path to accommodate both small and large jobs. From hospitals and schools to manufacturing facilities and warehouses, the SC450 provides the flexibility needed for todayâ€™s hardworking contractor.', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/HHSKRX38Wtw\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>', 'PERFORMANCE & FEATURES\r\n\r\n    Wrap-around ergonomic handle system provides operator comfort\r\n    Safety on/off switch is located on the handle for operator convenience\r\n    Easy-to-access, 11.9 gallon recovery tank allows for simple cleanup\r\n    Variable pad driven assistance\r\n    Front fill, 10.5 gallon solution tank\r\n    Non-marking rear wheels for maneuverability\r\n', 0),
(62, 8, 'ADFINITYâ„¢ X20C', 1000, 2, 'upload/Adfinity_1519104196.jpg', 6, 'TRACTION DRIVE FOR INCREASED PRODUCTIVITY\r\n\r\nAdfinityâ„¢ traction-drive scrubbers feature pushbutton forward and reverse, and our exclusive One-Touchâ„¢ ergonomic control paddle for easy, safe operation.\r\n\r\nAdfinity delivers effortless maintenance and operation. Our unique â€œclick onâ€ brushes enable fast and easy changeovers. The Adfinity scrubber allow easy access to the battery, the recovery tank, and, where applicable, the detergent dispensing system. Scrub path of 24 inches, and a standard onboard charger allows battery recharge at any available electrical outlet.\r\n\r\nAdfinity scrubbers fall well within safe sound level requirements for daytime cleaning in any facility, as set by LEED-EB and GS-42. The Adfinity also features Smart Solutionsâ„¢ flow rate. Engineered to provide effective cleaning and over 1.5 hours of run time between dump and refill, Smart Solutions saves water and costly chemicals, while increasing productivity.\r\n\r\nAdvanceâ€™s patented EcoFlexâ„¢ onboard detergen', 'No videos available at this time.', 'PERFORMANCE & FEATURES\r\n\r\n    Large diameter non-marking tires for better traction\r\n    Simple and intuitive operator controls minimize training\r\n    Rugged construction with durable components assures years of reliable performance\r\n    Easy to maintain with open access to all critical systems\r\n    Wrap-around ergonomic handle system for operator comfort\r\n    Center-pivot designed squeegees pick-up 100% water on turns\r\n', 0),
(64, 8, 'SC3000â„¢', 1000, 2, 'upload/SC3000_1519104271.jpg', 6, 'ERGONOMIC DESIGN AND SUPERIOR SCRUB SYSTEM DELIVER MAXIMUM EFFICIENCY AND CLEANING PERFORMANCE.\r\n\r\nThe Advance SC3000 Compact Rider Scrubber takes automatic rider scrubber technology to a new level of scrubbing performance. Easier operation, green-cleaning results and, above all, a new patented scrubbing deck that performs the hard work for you. Featuring a compact design, the SC3000 provides user-friendly, maneuverable operation in multiple cleaning applicationsâ€”including those with limited access. Quiet Modeâ„¢ makes daytime cleaning in educational facilities and cleaning of noise-sensitive healthcare facilities viable. Plus, with enhanced driver compartment features and a large 21 gallon tank, the SC3000 ensures maximum operator comfort and safety for over an hour of continuous scrubbing on a single tank of water.\r\nInnovative deck.\r\n\r\nThe SC3000 SafetyGlideâ„¢ Deck eliminates wasted time and money spent on making adjustments and replacing side skirts. Simply turn the steering whee', 'No videos available at this time.', 'PERFORMANCE & FEATURES\r\n\r\n    Unique steering wheel\r\n    SafetyGlideâ„¢ Deck\r\n    Built-in squeegee hanging system\r\n    High traction non-marking urethane tires\r\n    Easy access operator compartment\r\n', 0),
(65, 8, 'SC1500â„¢', 2000, 2, 'upload/SC1500_1538017215.jpg', 6, 'A COST-EFFICIENT CLEANING SOLUTION\r\n\r\nEnhance cleaning productivity with our brand new stand-up automatic scrubber, the Advance SC1500â„¢. Designed to deliver superior cleaning performance, the SC1500 stand-up scrubber provides a flexible, extremely maneuverable and compact solution for small to medium-sized areas. Plus, with a high-capacity tank and high scrub speed capabilities, the SC1500 covers more surface faster while maximizing your bottom line.\r\nMAXIMUM PRODUCTIVITY.\r\n\r\nTo satisfy both daily and deep scrubbing applications, the SC1500 is available in a 20 inch disc or 20 inch REVâ„¢ model. The patented REV Technology configuration employs our exclusive Random Orbital Scrubbing technology, which scrubs deeper and more uniformly to leave a perfectly scrubbed surface with no swirl marks while using far less water and chemicals. Spend more time on the floor with the SC1500â€™s large 12 gallon tank and low flow rate, which provides up to 109 minutes of scrub time without refilling. ', '', 'PERFORMANCE & FEATURES\r\n\r\n    Simple, intuitive controls minimize operator training\r\n    Safety dead-man switch and GO pedal provides easy-to-control operation\r\n    Quite mode for daytime cleaning and cleaning of noise-sensitive areas\r\n    EcoFlexâ„¢ onboard detergent system provides flexible cleaning performance\r\n    Large recovery tank opening, complete draining and smooth interior for easy cleaning', 0),
(66, 8, 'SC750â„¢ & SC800â„¢', 1000, 2, 'upload/SC800_1519104427.jpg', 6, 'Simple operation, flexible performance.\r\n\r\nAdvanceâ€™s rugged, low-maintenance SC750â„¢ and SC800â„¢ scrubbers deliver incredible value on a walk-behind platform. High productivity per tankful allows for 84 minutes of continuous scrubbing, which reduces dump/refill cycles and helps provide fast ROI. The optional EcoFlexâ„¢ System offers the flexibility to clean across the entire cleaning spectrum from green to clean. At the touch of a button one can switch from chemical free cleaning to using an ultra low dilution ratio, and of course detergent can be used at full strength for the toughest of soils. The burst of power feature lets you easily apply more pressure, more solution and more detergent at the touch of a single button. With the flexibility to easily apply the right scrubbing performance for the job, youâ€™ll use less detergent, minimize water use and save on cleaning costs.', 'No videos available at this time.', 'PERFORMANCE & FEATURES\r\n\r\n    Smart Solutions or EcoFlexâ„¢ on all machines\r\n    Green cleaning and high productivity technology\r\n    SC750 with 21 gallon (80 L) solution and recovery tanks\r\n    Self adjusting skirt on disc machines\r\n    SC800 with 25 gallon (95 L) solution and recovery tanks\r\n    Heavy duty scrubbing performance\r\n', 0),
(67, 8, 'SC750â„¢ REVâ„¢', 1000, 2, 'upload/SC750_1519104441.jpg', 6, 'REVâ„¢ TECHNOLOGY:\r\nA Revolution in Daily Cleaning.\r\nREV Technology is the Preferred Choice for Routine Daily Cleaning with Superior Results.\r\n\r\nFloors are Cleaner in a Single Pass - Dual random orbital action quickly and efficiently attacks dirt from multiple directions.\r\n\r\nSave Time with Fewer Dump and Refill Cycles - REVâ„¢ machines use far less water than conventional disc scrubbers.\r\n\r\nSave Money! - Less water means less detergent is used.\r\n\r\nNO SIDE SPLASH - The slow macro orbit of REV prevents water from splashing onto adjacent surfaces.\r\n\r\nNO SPLASH SKIRT - Cleans tight to walls, which reduces time spent on detail work.\r\n\r\nNO Swirl Marks - Dual random orbital action delivers an even clean without swirl marks!\r\n\r\nEcoFlexâ„¢ Onboard Detergent Metering System - Saving money, time, and the environment.\r\n\r\nIncreased Safety - All REV scrubbers are certified by the National Floor Safety Institute ( NFSI) to increase floor traction by more than 21%.', 'No videos available at this time.', 'PERFORMANCE & FEATURES\r\n\r\n\r\n    patented REV Technology random orbital scrubbing technology with high speed Â¼ inch micro scrubbing and 14 inch rotational macro scrubbing attacks dirt from multiple directions for superior cleaning effectiveness.\r\n    Low operating noise of 61 decibels allows for easy daytime cleaning. SC750â„¢ REVâ„¢ can be operated without disturbing facility occupants, so you can clean even during daytime hours.\r\n    SC750 with 21 gallon (80 L) solution and recovery tanks\r\n    Self adjusting skirt on disc machines\r\n    Intuitive control panel allows for simple one-touch operation with minimal operator training.\r\n    Dual 14 inch scrub pads provide wide 28 inch scrub path for increased productivity\r\n', 0),
(68, 8, 'SC500â„¢ INDUSTRIAL', 1000, 2, 'upload/SC500_1519104372.jpg', 6, 'INTRODUCING THE SC500â„¢\r\nINCREASE CLEANING EFFICIENCY AND PRODUCTIVITY\r\n\r\nFrom smaller areas in distribution centers and sports arenas to small manufacturing floors, the Advance SC500â„¢ walk-behind scrubber ushers in a new wave of productivity in the places where cleaning professionals need it most. With a modern design engineered to provide better control and improved sightlines, this compact 20 inch and 12 gallon disc scrubber cleans both effectively and quietly. Already one of the quietest compact scrubbers, the SC500 has a Quiet Mode for daytime cleaning environments.\r\nEfficiency revitalized.\r\n\r\nWith a revolutionary flow regulation system that adjusts the solution output based on the speed of the machine, SC500 ensures consistent cleaning results using less water and chemical while improving productivity per tank. Combine that with the exclusive EcoFlexâ„¢ systemâ€”which allows for variable detergent (including ultra-low) or water-only cleaningâ€”and the SC500 is in a category of', 'No videos available at this time.', 'PERFORMANCE & FEATURES\r\n\r\n    Two key system with separate controls for the Superuser (yellow key) and Operator (gray key)\r\n    Mechanical foot pedals allow for hassle-free raising and lowering of the squeegee\r\n    Easy click off/on brush/pad holder with control panel button (disc model only)\r\n    No-nonsense pinch-to-control tank drain hose simply works\r\n    Solution tank easily fills via front grate, sink-attachable hose, or side fill port\r\n    Recovery tank tilts back easily, allowing full access to the batteries and the EcoFlexâ„¢ System detergent bottle\r\n', 0),
(69, 11, 'DAILY FLOOR CLEANER', 1000, 2, 'upload/Green Earth Daily Floor Cleaner_1519289048.jpg', 5, 'Neutral pH Low Foaming Floor Cleaner:\r\n\r\nRecommended for maintaining high gloss on finished floors. When used as directed, it will thoroughly wet, emulsify and suspend soil from highly polished floor surfaces without attacking the gloss of the floor. Super concentrated, this product provides a low end-use cost per gallon. \r\n\r\n*Certified for performance, concentration, minimized/recycled packaging, and reduced toxicity. GreenSeal.org\r\n\r\nNeutral pH\r\n\r\nWets, emulsifies and suspends soils\r\n\r\nAll ingredients are readily biodegradable\r\n\r\nDeodorizes and leaves a pleasant scent\r\n', 'No avaible', 'Color 	Yellow\r\nDetergency 	Excellent\r\nEmulsification 	Excellent\r\nFoaming 	Moderate\r\nFragrance 	Fragrance Free\r\npH 	7.0 - 8.5\r\nRinsability 	Complete\r\nShelf life 	1 Year\r\nWetting 	Very good', 0),
(71, 11, 'FLOOR FINISH', 1000, 2, 'upload/Non_Zinc_Floor_Finish_&_Sealer_1519289070.jpg', 5, 'Non Zinc Floor Finish & Sealer\r\n\r\nThis product was developed using highly advanced polymer technology to provide a premium environmentally preferred floor finish. This high solids finish offers a clear, deep gloss and requires fewer coats to achieve the desired results.\r\n\r\nFeatures: \r\n\r\nNo heavy metals.\r\n\r\nNo offensive chemical odors.\r\n\r\nExtended wear high gloss formula\r\n\r\n0.0% Free Styrene\r\n', 'No avaible', 'Color (dried) 	Crystal clear\r\nColor (liquid) 	White\r\nCoverage 	2000 - 3000 square feet/gallon\r\nDrying time 	30 - 40 minutes per coat\r\nFragrance 	Mild\r\nFreeze/thaw stability 	3 cycles\r\nGloss (ASTM D 1455) 	1 coat 80 - 85\r\nGloss (ASTM D 1455) 	2 coats 90 - 95\r\nHeel mark resistance 	Very good\r\nLeveling 	Excellent\r\npH 	7.0 - 8.5\r\nPowdering resistance 	Excellent\r\nShelf life 	1 year\r\nSpecific gravity 	1.03', 0),
(72, 11, 'FLOOR STRIPPER', 1000, 2, 'upload/Green_earth_Floor_stripper_1519289095.jpg', 5, 'Betco Green Earth Floor Stripper is specially designed to effectively remove Green Earth and other conventional floor finishes without the use of butyl and ammonia.\r\n\r\nFeatures:\r\n\r\nCertified for performance, limited VOCs, and reduced toxicity. GreenSeal.org\r\n\r\nRinse free\r\n\r\nLow foaming\r\n\r\nNo added fragrance or dyes\r\n\r\n', 'No avaible ', 'Color 	Water white\r\nFragrance 	Mild\r\npH at dilution 	10.0\r\npH concentrate 	10.5\r\nResidue at evaporation 	None\r\nShelf life 	1 year', 0),
(73, 12, 'FLOOR COATING', 1000, 2, 'upload/128-FS-EnviroStar-Green_1519289977.png', 9, 'A premium floor coating designed specifically for ease of application and ease of maintenance while consistently providing a beautiful, durable, and safe wet-look shine.', '', '', 0),
(74, 12, 'FLOOR STRIPPER', 1000, 2, 'upload/515FS_web_1519289962.png', 9, 'Extra strength floor stripper formulated to remove both green and conventional zinc cross-linked floor coatings and sealers. Concentrated for economical use.', '', '', 0),
(75, 12, 'Purpose Cleaner', 1000, 2, 'upload/330MPE_web_1519289876.png', 9, 'This environmentally friendly cleaner is ideal for floors and other hard surface cleaning applications. This highly concentrated product (1:512) is available in 2 liter sizes with a dosing cup.', '', '', 0),
(76, 14, 'Pad Black 13', 1000, 2, 'upload/black_1519629109.jpg', 10, '3M High Productivity Floor Stripper Pads\r\n\r\nQuickly and thoroughly removes old floor finish, dirt and buildup. Unique, open web construction allows stripping solution to flow through pad to rinse out dirt and reduce loading for increased pad-to-floor contact and efficient stripping. Application: Stripping; Diameter: 13\".\r\n\r\n3M Corporation 7300 Series High Productivity Floor Stripping Pads, Black, 13\" Diameter, 5 Pads per Carton ', 'No avaible ', '    Global Product Type: Floor Pads-Scrub/Strip\r\n    Application: Stripping\r\n    Diameter: 13\"\r\n    Color(s): Black\r\n    For Use With: Rotary or Automatic Machine Speed of 175-600 RPM\r\n    Material(s): Nylon\r\n    Pre-Consumer Recycled Content Percent: 0%\r\n    Post-Consumer Recycled Content Percent: 0%\r\n    Total Recycled Content Percent: 0%\r\n', 0),
(77, 14, 'Pad Blue 13', 1000, 2, 'upload/blue_1519629131.jpg', 10, '3M Floor Cleaner Pads\r\n\r\nFor heavy-duty scrubbing prior to re-coating. Can also be used for heavy-duty spray cleaning or foam scrubbing. Removes dirt, spills and scuffs, leaving a clean surface ready for re-coating. Application: Scrubbing; Diameter: 13\".\r\n\r\n3M Corporation 5300 Series Floor Cleaner Pad, Blue, 13\" Diameter, 5 Pads per Carton ', 'No avaible', '   Global Product Type: Floor Pads-Scrub/Strip\r\n    Application: Scrubbing\r\n    Diameter: 13\"\r\n    Color(s): Blue\r\n    For Use With: Rotary or Automatic Machine Speed of 175-600 RPM\r\n    Material(s): Non-Woven Nylon/Polyester Fiber\r\n    Pre-Consumer Recycled Content Percent: 0%\r\n    Post-Consumer Recycled Content Percent: 0%\r\n    Total Recycled Content Percent: 0%\r\n', 0),
(78, 14, 'Pad red 13\"', 1000, 1, 'upload/red_1519628921.jpg', 10, 'STD FLR BUFF PAD 13 IN RED 5 ', 'No avaible', '\r\n    Global Product Type: Floor Pads-Burnish/Buff\r\n    Application: Scrub/Strip\r\n    Diameter: 13\"\r\n    Height: 1\"\r\n    Color(s): Red\r\n    For Use With: Rotary Floor Machines (175 to 350 rpm)\r\n    Applicable Material: Vinyl Composition Tile (VCT); Solid Vinyl Tile (SVT); Linoleum; Sheet Vinyl; Laminates\r\n    Material(s): Synthetic Fiber\r\n    Pre-Consumer Recycled Content Percent: 0%\r\n    Post-Consumer Recycled Content Percent: 0%\r\n    Total Recycled Content Percent: 0%\r\n', 0),
(79, 14, 'Pad Green 13\"', 1000, 2, 'upload/green_1519629061.jpg', 10, 'Standard Green Floor Pads\r\n\r\nThese green scrubbing floor pads are ideal for use on wood floors. For heavy-duty scrubbing or light stripping jobs. Each pad measures 20 inches in diameter. Includes 5 pads per Carton.\r\n\r\nPremiere Pads 20\" Green Scrubbing Floor Pads, 5 Pads per Carton\r\n\r\n', 'No avaible \r\n', '\r\n    Global Product Type: Floor Pads-Scrub/Strip\r\n    Application: Scrub/Strip\r\n    Diameter: 20\"\r\n    Height: 1\"\r\n    Color(s): Green\r\n    For Use With: Rotary Floor Machines (175 to 350 rpm)\r\n    Applicable Material: Vinyl Composition Tile (VCT); Solid Vinyl Tile (SVT); Linoleum; Sheet Vinyl; Laminates\r\n    Material(s): Synthetic Fiber\r\n    Pre-Consumer Recycled Content Percent: 0%\r\n    Post-Consumer Recycled Content Percent: 0%\r\n    Total Recycled Content Percent: 0%\r\n', 0),
(107, 4, 'sss', 1000, 1000, '', 8, 'asdf', 'asdf', 'asdf', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `salesid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `sales_total` double NOT NULL,
  `sales_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`salesid`, `userid`, `sales_total`, `sales_date`) VALUES
(1, 2, 34, '2017-09-16 16:23:38'),
(2, 2, 18, '2017-09-16 16:25:28'),
(3, 2, 6, '2017-09-16 16:27:31'),
(4, 2, 1014244, '2017-09-16 16:44:01'),
(5, 2, 9588, '2017-09-18 09:06:29'),
(6, 2, 88779, '2017-09-18 09:08:42'),
(7, 2, 15579, '2017-09-18 09:09:34'),
(8, 2, 112361, '2017-09-18 09:32:00'),
(9, 2, 7990, '2017-09-18 09:34:29'),
(10, 2, 18370, '2017-09-18 11:09:21'),
(11, 2, 20, '2017-11-19 17:45:58'),
(12, 1, 15, '2017-11-22 19:47:29'),
(13, 1, 20, '2017-12-04 21:16:56'),
(14, 1, 420, '2017-12-04 21:17:25'),
(15, 2, 690, '2018-05-13 02:12:51');

-- --------------------------------------------------------

--
-- Table structure for table `sales_detail`
--

CREATE TABLE `sales_detail` (
  `sales_detailid` int(11) NOT NULL,
  `salesid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `sales_qty` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales_detail`
--

INSERT INTO `sales_detail` (`sales_detailid`, `salesid`, `productid`, `sales_qty`) VALUES
(1, 2, 1, 12),
(2, 2, 2, 10),
(3, 3, 3, 11),
(4, 4, 2, 50),
(5, 4, 1, 106),
(6, 4, 5, 1000),
(7, 5, 2, 12),
(8, 6, 5, 101),
(9, 7, 1, 10),
(10, 7, 3, 11),
(11, 8, 4, 10),
(12, 8, 20, 10),
(13, 8, 1, 99),
(14, 8, 2, 20),
(15, 9, 2, 10),
(16, 10, 2, 10),
(17, 10, 3, 12),
(18, 10, 4, 8),
(19, 11, 23, 1),
(20, 12, 24, 1),
(21, 13, 23, 1),
(22, 14, 27, 2),
(23, 15, 34, 3),
(24, 15, 28, 3);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `userid` int(11) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `company_address` varchar(150) NOT NULL,
  `contact` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`userid`, `company_name`, `company_address`, `contact`) VALUES
(4, 'FCHMAINTENANCE', 'CANADA', '888-888-888-888'),
(5, 'Betco', 'Canada', '88558855'),
(6, 'Advance', 'Canada', '888655645'),
(7, 'Clarke', 'Canada', '888655645'),
(9, 'Pioner Eclipse', 'Canada', '800-777-777'),
(10, 'Clean It Supply', 'Canada', ' 1-800-998-3295');

-- --------------------------------------------------------

--
-- Table structure for table `unid`
--

CREATE TABLE `unid` (
  `id_unid` int(11) NOT NULL,
  `unid_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `unid`
--

INSERT INTO `unid` (`id_unid`, `unid_name`) VALUES
(1, 'Unid'),
(2, 'Box'),
(3, 'Kilograms'),
(4, 'Pounds'),
(5, 'Liters'),
(6, 'Gallons'),
(7, 'Meters');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `access` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `username`, `password`, `access`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1),
(2, 'pepe', '81dc9bdb52d04dc20036dbd8313ed055', 2),
(4, 'supplier', 'fa3ddb86f38fb6a8284636249f6551aa', 3),
(5, 'Betco', 'supplier', 3),
(6, 'Advance', '99b0e8da24e29e4ccb5d7d76e677c2ac', 3),
(7, 'Clarke', 'supplier', 3),
(8, 'Anthony', '069ac3d51a9c4841f5240ce794d85871', 2),
(9, 'Pioner', '81dc9bdb52d04dc20036dbd8313ed055', 3),
(10, 'cleanitsupply', 'ec6a6536ca304edf844d1d248a4f08dc', 3);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `ware_id` int(11) NOT NULL,
  `warehouse_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`ware_id`, `warehouse_name`, `Description`, `location`) VALUES
(1, 'Ontario', 'Main', 'Main Ontario'),
(2, 'FCH Warehouse', 'Shop', 'NorthBay'),
(3, 'FCH Shop', 'Repairs and Parts', 'NorthBay');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carousel`
--
ALTER TABLE `carousel`
  ADD PRIMARY KEY (`idphoto`),
  ADD KEY `productid` (`productid`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryid`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`inventoryid`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productid`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`salesid`);

--
-- Indexes for table `sales_detail`
--
ALTER TABLE `sales_detail`
  ADD PRIMARY KEY (`sales_detailid`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`ware_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carousel`
--
ALTER TABLE `carousel`
  MODIFY `idphoto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cartid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `inventoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;
--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `salesid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `sales_detail`
--
ALTER TABLE `sales_detail`
  MODIFY `sales_detailid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `ware_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `carousel`
--
ALTER TABLE `carousel`
  ADD CONSTRAINT `productid` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
