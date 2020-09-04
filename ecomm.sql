-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 03, 2020 at 01:39 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.3.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecomm`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `cat_slug` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `cat_slug`) VALUES
(1, 'Laptops', 'laptops'),
(2, 'Desktop PC', 'desktop-pc'),
(3, 'Tablets', 'tablets'),
(4, 'Smart Phones', ''),
(5, 'Furniture', 'furniture');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `comment` text NOT NULL,
  `rate` int(11) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `product`, `user`, `comment`, `rate`, `date`) VALUES
(1, 1, 13, 'this is it man', 5, '2020-08-29'),
(2, 1, 13, 'Cost doesn\'t meet the quality', 4, '2020-08-29'),
(3, 1, 13, 'see this', 5, '2020-08-29'),
(4, 1, 13, 'this je', 5, '2020-08-29'),
(5, 1, 14, 'good service', 5, '2020-09-03'),
(6, 1, 14, 'bad service', 0, '2020-09-03');

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`id`, `sales_id`, `product_id`, `quantity`) VALUES
(14, 9, 11, 2),
(15, 9, 13, 5),
(16, 9, 3, 2),
(17, 9, 1, 3),
(18, 10, 13, 3),
(19, 10, 2, 4),
(20, 10, 19, 5),
(21, 96, 11, 2),
(22, 96, 13, 5),
(23, 96, 3, 2),
(24, 96, 1, 3),
(25, 91, 11, 2),
(26, 91, 13, 5),
(27, 91, 3, 2),
(28, 91, 1, 3),
(29, 95, 11, 2),
(30, 95, 13, 5),
(31, 95, 3, 2),
(32, 95, 1, 3),
(33, 93, 11, 2),
(34, 93, 13, 5),
(35, 93, 3, 2),
(36, 93, 1, 3),
(37, 90, 11, 2),
(38, 90, 13, 5),
(39, 90, 3, 2),
(40, 90, 1, 3),
(41, 43, 11, 2),
(42, 43, 13, 5),
(43, 43, 3, 2),
(44, 43, 1, 3),
(45, 88, 11, 2),
(46, 88, 13, 5),
(47, 88, 3, 2),
(48, 88, 1, 3),
(49, 75, 11, 2),
(50, 75, 13, 5),
(51, 75, 3, 2),
(52, 75, 1, 3),
(53, 76, 11, 2),
(54, 76, 13, 5),
(55, 76, 3, 2),
(56, 76, 1, 3),
(57, 32, 11, 2),
(58, 32, 13, 5),
(59, 32, 3, 2),
(60, 32, 1, 3),
(61, 34, 11, 2),
(62, 34, 13, 5),
(63, 34, 3, 2),
(64, 34, 1, 3),
(65, 99, 11, 2),
(66, 99, 13, 5),
(67, 99, 3, 2),
(68, 99, 1, 3),
(69, 89, 11, 2),
(70, 89, 13, 5),
(71, 89, 3, 2),
(72, 89, 1, 3),
(73, 79, 11, 2),
(74, 79, 13, 5),
(75, 79, 3, 2),
(76, 79, 1, 3),
(77, 69, 11, 2),
(78, 69, 13, 5),
(79, 69, 3, 2),
(80, 69, 1, 3),
(81, 59, 11, 2),
(82, 59, 13, 5),
(83, 59, 3, 2),
(84, 59, 1, 3),
(85, 49, 11, 2),
(86, 49, 13, 5),
(87, 49, 3, 2),
(88, 49, 1, 3),
(89, 39, 11, 2),
(90, 39, 13, 5),
(91, 39, 3, 2),
(92, 39, 1, 3),
(93, 29, 11, 2),
(94, 29, 13, 5),
(95, 29, 3, 2),
(96, 29, 1, 3),
(97, 19, 11, 2),
(98, 19, 13, 5),
(99, 19, 3, 2),
(100, 19, 1, 3),
(101, 18, 11, 2),
(102, 18, 13, 5),
(103, 18, 3, 2),
(104, 18, 1, 3),
(105, 17, 11, 2),
(106, 17, 13, 5),
(107, 17, 3, 2),
(108, 17, 1, 3),
(109, 16, 11, 2),
(110, 16, 13, 5),
(111, 16, 3, 2),
(112, 16, 1, 3),
(113, 15, 11, 2),
(114, 15, 13, 5),
(115, 15, 3, 2),
(116, 15, 1, 3),
(117, 14, 11, 2),
(118, 14, 13, 5),
(119, 14, 3, 2),
(120, 14, 1, 3),
(121, 11, 11, 2),
(122, 11, 13, 5),
(123, 11, 3, 2),
(124, 11, 1, 3),
(125, 12, 11, 2),
(126, 12, 13, 5),
(127, 12, 3, 2),
(128, 12, 1, 3),
(129, 13, 11, 2),
(130, 13, 13, 5),
(131, 13, 3, 2),
(132, 13, 1, 3),
(133, 100, 13, 1),
(134, 100, 11, 1),
(135, 100, 12, 1),
(136, 100, 10, 1),
(137, 101, 7, 1),
(138, 101, 10, 7),
(139, 101, 6, 1),
(140, 101, 28, 2);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `date_view` date DEFAULT NULL,
  `counter` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `slug`, `price`, `photo`, `date_view`, `counter`) VALUES
(1, 1, 'DELL Inspiron 15 7000 15.6', '<p>15-inch laptop ideal for gamers. Featuring the latest Intel&reg; processors for superior gaming performance, and life-like NVIDIA&reg; GeForce&reg; graphics and an advanced thermal cooling design.</p>\r\n', 'dell-inspiron-15-7000-15-6', 89900, 'dell-inspiron-15-7000-15-6.jpg', '2020-09-03', 5),
(2, 1, 'MICROSOFT Surface Pro 4 & Typecover - 128 GB', '<p>Surface Pro 4 powers through everything you need to do, while being lighter than ever before</p>\r\n\r\n<p>The 12.3 PixelSense screen has extremely high contrast and low glare so you can work through the day without straining your eyes</p>\r\n\r\n<p>keyboard is not included and needed to be purchased separately</p>\r\n\r\n<p>Features an Intel Core i5 6th Gen (Skylake) Core,Wireless: 802.11ac Wi-Fi wireless networking; IEEE 802.11a/b/g/n compatible Bluetooth 4.0 wireless technology</p>\r\n\r\n<p>Ships in Consumer packaging.</p>\r\n', 'microsoft-surface-pro-4-typecover-128-gb', 79900, 'microsoft-surface-pro-4-typecover-128-gb.jpg', '2020-08-24', 1),
(3, 1, 'DELL Inspiron 15 5000 15.6', '<p>Dell&#39;s 15.6-inch, midrange notebook is a bland, chunky block. It has long been the case that the Inspiron lineup lacks any sort of aesthetic muse, and the Inspiron 15 5000 follows this trend. It&#39;s a plastic, silver slab bearing Dell&#39;s logo in a mirror sheen.</p>\r\n\r\n<p>Lifting the lid reveals the 15.6-inch, 1080p screen surrounded by an almost offensively thick bezel and a plastic deck with a faux brushed-metal look. There&#39;s a fingerprint reader on the power button, and the keyboard is a black collection of island-style keys.</p>\r\n', 'dell-inspiron-15-5000-15-6', 59900, 'dell-inspiron-15-5000-15-6.jpg', '2020-08-24', 1),
(4, 1, 'LENOVO Ideapad 320s-14IKB 14\" Laptop - Grey', '<p>- Made for portability with a slim, lightweight chassis design&nbsp;<br />\r\n<br />\r\n- Powerful processing helps you create and produce on the go&nbsp;<br />\r\n<br />\r\n- Full HD screen ensures crisp visuals for movies, web pages, photos and more&nbsp;<br />\r\n<br />\r\n- Enjoy warm, sparkling sound courtesy of two Harman speakers and Dolby Audio&nbsp;<br />\r\n<br />\r\n- Fast data transfer and high-quality video connection with USB-C and HDMI ports&nbsp;<br />\r\n<br />\r\nThe Lenovo&nbsp;<strong>IdeaPad 320s-14IKB 14&quot; Laptop</strong>&nbsp;is part of our Achieve range, which has the latest tech to help you develop your ideas and work at your best. It&#39;s great for editing complex documents, business use, editing photos, and anything else you do throughout the day.</p>\r\n', 'lenovo-ideapad-320s-14ikb-14-laptop-grey', 39900, 'lenovo-ideapad-320s-14ikb-14-laptop-grey.jpg', '2020-08-24', 3),
(5, 3, 'APPLE 9.7\" iPad - 32 GB, Gold', '<p>9.7 inch Retina Display, 2048 x 1536 Resolution, Wide Color and True Tone Display</p>\r\n\r\n<p>Apple iOS 9, A9X chip with 64bit architecture, M9 coprocessor</p>\r\n\r\n<p>12 MP iSight Camera, True Tone Flash, Panorama (up to 63MP), Four-Speaker Audio</p>\r\n\r\n<p>Up to 10 Hours of Battery Life</p>\r\n\r\n<p>iPad Pro Supports Apple Smart Keyboard and Apple Pencil</p>\r\n', 'apple-9-7-ipad-32-gb-gold', 339, 'apple-9-7-ipad-32-gb-gold.jpg', '2018-07-08', 3),
(6, 1, 'DELL Inspiron 15 5000 15', '<p>15-inch laptop delivering an exceptional viewing experience, a head-turning finish and an array of options designed to elevate your entertainment, wherever you go.</p>\r\n', 'dell-inspiron-15-5000-15', 449.99, 'dell-inspiron-15-5000-15.jpg', '2020-09-03', 1),
(7, 3, 'APPLE 10.5\" iPad Pro - 64 GB, Space Grey (2017)', '<p>4K video recording at 30 fps</p>\r\n\r\n<p>12-megapixel camera</p>\r\n\r\n<p>Fingerprint resistant coating</p>\r\n\r\n<p>Antireflective coating</p>\r\n\r\n<p>Face Time video calling</p>\r\n', 'apple-10-5-ipad-pro-64-gb-space-grey-2017', 619, 'apple-10-5-ipad-pro-64-gb-space-grey-2017.jpg', '2020-09-03', 1),
(8, 1, 'ASUS Transformer Mini T102HA 10.1\" 2 in 1 - Silver', '<p>Versatile Windows 10 device with keyboard and pen included, 2-in-1 functionality: use as both laptop and tablet.Update Windows periodically to ensure that your applications have the latest security settings.</p>\r\n\r\n<p>All day battery life, rated up to 11 hours of video playback; 128GB Solid State storage. Polymer Battery.With up to 11 hours between charges, you can be sure that Transformer Mini T102HA will be right there whenever you need it. You can charge T102HA via its micro USB port, so you can use a mobile charger or any power bank with a micro USB connector.</p>\r\n', 'asus-transformer-mini-t102ha-10-1-2-1-silver', 54900.99, 'asus-transformer-mini-t102ha-10-1-2-1-silver.jpg', '0000-00-00', 0),
(9, 2, 'PC SPECIALIST Vortex Core Lite Gaming PC', '<p>- Top performance for playing eSports and more&nbsp;<br />\r\n<br />\r\n- NVIDIA GeForce GTX graphics deliver smooth visuals&nbsp;<br />\r\n<br />\r\n- GeForce Experience delivers updates straight to your PC&nbsp;<br />\r\n<br />\r\nThe PC Specialist&nbsp;<strong>Vortex Core Lite&nbsp;</strong>is part of our Gaming range, bringing you the most impressive PCs available today. It has spectacular graphics and fast processing performance to suit the most exacting players.</p>\r\n', 'pc-specialist-vortex-core-lite-gaming-pc', 59900.99, 'pc-specialist-vortex-core-lite-gaming-pc.jpg', '0000-00-00', 0),
(10, 2, 'DELL Inspiron 5675 Gaming PC - Recon Blue', '<p>All-new gaming desktop featuring powerful AMD Ryzen&trade; processors, graphics ready for VR, LED lighting and a meticulous design for optimal cooling.</p>\r\n', 'dell-inspiron-5675-gaming-pc-recon-blue', 59900.99, 'dell-inspiron-5675-gaming-pc-recon-blue.jpg', '2020-09-03', 1),
(11, 2, 'HP Barebones OMEN X 900-099nn Gaming PC', '<p>What&#39;s inside matters.</p>\r\n\r\n<p>Without proper cooling, top tierperformance never reaches its fullpotential.</p>\r\n\r\n<p>Nine lighting zones accentuate theaggressive lines and smooth blackfinish of this unique galvanized steelcase.</p>\r\n', 'hp-barebones-omen-x-900-099nn-gaming-pc', 48900.98, 'hp-barebones-omen-x-900-099nn-gaming-pc.jpg', '2020-08-28', 2),
(12, 2, 'ACER Aspire GX-781 Gaming PC', '<p>- GTX 1050 graphics card lets you play huge games in great resolutions&nbsp;<br />\r\n<br />\r\n- Latest generation Core&trade; i5 processor can handle demanding media software&nbsp;<br />\r\n<br />\r\n- Superfast SSD storage lets you load programs in no time&nbsp;<br />\r\n<br />\r\nThe Acer&nbsp;<strong>Aspire&nbsp;GX-781 Gaming PC&nbsp;</strong>is part of our Gaming range, which offers the most powerful PCs available today. It has outstanding graphics and processing performance to suit the most demanding gamer.</p>\r\n', 'acer-aspire-gx-781-gaming-pc', 74900.99, 'acer-aspire-gx-781-gaming-pc.jpg', '2020-08-28', 1),
(13, 2, 'HP Pavilion Power 580-015na Gaming PC', '<p>Features the latest quad core Intel i5 processor and discrete graphics. With this power, you&rsquo;re ready to take on any activity from making digital art to conquering new worlds in VR.</p>\r\n\r\n<p>Choose the performance and storage you need. Boot up in seconds with to 128 GB SSD.</p>\r\n\r\n<p>Ditch the dull grey box, this desktop comes infused with style. A new angular bezel and bold green and black design give your workspace just the right amount of attitude.</p>\r\n\r\n<p>Up to 3 times faster performance - GeForce GTX 10-series graphics cards are powered by Pascal to deliver twice the performance of previous-generation graphics cards.</p>\r\n', 'hp-pavilion-power-580-015na-gaming-pc', 79900.99, 'hp-pavilion-power-580-015na-gaming-pc.jpg', '2020-08-29', 30),
(14, 2, 'LENOVO Legion Y520 Gaming PC', '<p>- Multi-task with ease thanks to Intel&reg; i5 processor&nbsp;<br />\r\n<br />\r\n- Prepare for battle with NVIDIA GeForce GTX graphics card&nbsp;<br />\r\n<br />\r\n- VR ready for the next-generation of immersive gaming and entertainment<br />\r\n<br />\r\n- Tool-less upgrade helps you personalise your system to your own demands&nbsp;<br />\r\n<br />\r\nPart of our Gaming range, which features the most powerful PCs available today, the Lenovo&nbsp;<strong>Legion Y520 Gaming PC</strong>&nbsp;has superior graphics and processing performance to suit the most demanding gamer.</p>\r\n', 'lenovo-legion-y520-gaming-pc', 89900.99, 'lenovo-legion-y520-gaming-pc.jpg', '2018-05-09', 13),
(15, 2, 'PC SPECIALIST Vortex Minerva XT-R Gaming PC', '<p>- NVIDIA GeForce GTX graphics for stunning gaming visuals<br />\r\n<br />\r\n- Made for eSports with a speedy 7th generation Intel&reg; Core&trade; i5 processor<br />\r\n<br />\r\n- GeForce technology lets you directly update drivers, record your gaming and more<br />\r\n<br />\r\nThe PC Specialist&nbsp;<strong>Vortex Minerva XT-R Gaming PC</strong>&nbsp;is part of our Gaming range, which offers the most powerful PCs available. Its high-performance graphics and processing are made to meet the needs of serious gamers.</p>\r\n', 'pc-specialist-vortex-minerva-xt-r-gaming-pc', 99900.99, 'pc-specialist-vortex-minerva-xt-r-gaming-pc.jpg', '2018-07-08', 1),
(16, 2, 'PC SPECIALIST Vortex Core II Gaming PC', '<p>Processor: Intel&reg; CoreTM i3-6100 Processor- Dual-core- 3.7 GHz- 3 MB cache</p>\r\n\r\n<p>Memory (RAM): 8 GB DDR4 HyperX, Storage: 1 TB HDD, 7200 rpm</p>\r\n\r\n<p>Graphics card: NVIDIA GeForce GTX 950 (2 GB GDDR5), Motherboard: ASUS H110M-R</p>\r\n\r\n<p>USB: USB 3.0 x 3- USB 2.0 x 5, Video interface: HDMI x 1- DisplayPort x 1- DVI x 2, Audio interface: 3.5 mm jack, Optical disc drive: DVD/RW, Expansion card slot PCIe: (x1) x 2</p>\r\n\r\n<p>Sound: 5.1 Surround Sound support PSU Corsair: VS350, 350W, Colour: Black- Green highlights, Box contents: PC Specialist Vortex Core- AC power cable</p>\r\n', 'pc-specialist-vortex-core-ii-gaming-pc', 64900.99, 'pc-specialist-vortex-core-ii-gaming-pc.jpg', '2018-05-09', 2),
(17, 3, 'AMAZON Fire 7 Tablet with Alexa (2017) - 8 GB, Black', '<p>The next generation of our best-selling Fire tablet ever - now thinner, lighter, and with longer battery life and an improved display. More durable than the latest iPad</p>\r\n\r\n<p>Beautiful 7&quot; IPS display with higher contrast and sharper text, a 1.3 GHz quad-core processor, and up to 8 hours of battery life. 8 or 16 GB of internal storage and a microSD slot for up to 256 GB of expandable storage.</p>\r\n', 'amazon-fire-7-tablet-alexa-2017-8-gb-black', 4900.99, 'amazon-fire-7-tablet-alexa-2017-8-gb-black.jpg', '2018-05-11', 1),
(18, 3, 'AMAZON Fire HD 8 Tablet with Alexa (2017) - 16 GB, Black', '<p>Take your personal assistant with you wherever you go with this Amazon Fire HD 8 tablet featuring Alexa voice-activated cloud service. The slim design of the tablet is easy to handle, and the ample 8-inch screen is ideal for work or play. This Amazon Fire HD 8 features super-sharp high-definition graphics for immersive streaming.</p>\r\n', 'amazon-fire-hd-8-tablet-alexa-2017-16-gb-black', 7900.99, 'amazon-fire-hd-8-tablet-alexa-2017-16-gb-black.jpg', '2018-05-11', 2),
(19, 3, 'AMAZON Fire HD 8 Tablet with Alexa (2017) - 32 GB, Black', '<p>The next generation of our best-reviewed Fire tablet, with up to 12 hours of battery life, a vibrant 8&quot; HD display, a 1.3 GHz quad-core processor, 1.5 GB of RAM, and Dolby Audio. More durable than the latest iPad.</p>\r\n\r\n<p>16 or 32 GB of internal storage and a microSD slot for up to 256 GB of expandable storage.</p>\r\n', 'amazon-fire-hd-8-tablet-alexa-2017-32-gb-black', 9900.99, 'amazon-fire-hd-8-tablet-alexa-2017-32-gb-black.jpg', '2018-05-09', 1),
(20, 3, 'APPLE 9.7\" iPad - 32 GB, Space Grey', '<p>9.7-inch Retina display, wide color and true tone</p>\r\n\r\n<p>A9 third-generation chip with 64-bit architecture</p>\r\n\r\n<p>M9 motion coprocessor</p>\r\n\r\n<p>1.2MP FaceTime HD camera</p>\r\n\r\n<p>8MP iSight camera</p>\r\n\r\n<p>Touch ID</p>\r\n\r\n<p>Apple Pay</p>\r\n', 'apple-9-7-ipad-32-gb-space-grey', 339, 'apple-9-7-ipad-32-gb-space-grey.jpg', '2018-05-11', 1),
(27, 1, 'Dell XPS 15 9560', '<p>The world&rsquo;s smallest 15.6-inch performance laptop packs powerhouse performance and a stunning InfinityEdge display &mdash; all in our most powerful XPS laptop. Featuring the latest Intel&reg; processors.</p>\r\n\r\n<h2>Operating system</h2>\r\n\r\n<p><strong>Available with Windows 10 Home&nbsp;</strong>- Get the best combination of Windows features you know and new improvements you&#39;ll love.</p>\r\n\r\n<h2>Innovation that inspires.</h2>\r\n\r\n<p>When you&rsquo;re at the forefront of ingenuity, you get noticed. That&rsquo;s why it&rsquo;s no surprise the XPS 15 was honored. The winning streak continues.</p>\r\n\r\n<h2>Meet the smallest 15.6-inch laptop on the planet.</h2>\r\n\r\n<p><strong>The world&rsquo;s only 15.6-inch InfinityEdge display*:</strong>&nbsp;The virtually borderless display maximizes screen space by accommodating a 15.6-inch display inside a laptop closer to the size of a 14-inch, thanks to a bezel measuring just 5.7mm.<br />\r\n&nbsp;<br />\r\n<strong>Operating System: Windows 10 Pro.</strong><br />\r\n<br />\r\n<strong>One-of-a-kind design:</strong>&nbsp;Measuring in at a slim 11-17mm and starting at just 4 pounds (1.8 kg) with a solid state drive, the XPS 15 is one of the world&rsquo;s lightest 15-inch performance-class laptop.</p>\r\n\r\n<h2>A stunning view, wherever you go.</h2>\r\n\r\n<p><strong>Dazzling detail:</strong>&nbsp;With the UltraSharp 4K Ultra HD display (3840 x 2160), you can see each detail of every pixel without needing to zoom in. And with 6 million more pixels than Full HD and 3 million more than the MacBook Pro, you can edit images with pinpoint accuracy without worrying about blurriness or jagged lines.<br />\r\n<br />\r\n<strong>Industry-leading color:</strong>&nbsp;The XPS 15 is the only laptop with 100% Adobe RGB color, covering a wider color gamut and producing shades of color outside conventional panels so you can see more of what you see in real life. And with over 1 billion colors, images appear smoother and color gradients are amazingly lifelike with more depth and dimension. Included is Dell PremierColor software, which automatically remaps content not already in Adobe RGB format for onscreen colors that appear amazingly accurate and true to life.<br />\r\n<br />\r\n<strong>Easy collaboration:</strong>&nbsp;See your screen from nearly every angle with an IGZO IPS panel, providing a wide viewing angle of up to 170&deg;.&nbsp;<br />\r\n<br />\r\n<strong>Brighten your day:</strong>&nbsp;With 350 nit brightness, it&rsquo;s brighter than a typical laptop.<br />\r\n<br />\r\n<strong>Touch-friendly:</strong>&nbsp;Tap, swipe and pinch your way around the screen. The optional touch display lets you interact naturally with your technology.</p>\r\n', 'dell-xps-15-9560', 159900, 'dell-xps-15-9560.jpg', '2018-07-08', 9),
(28, 4, 'Samsung Note 8', '<p>See the bigger picture and communicate in a whole new way. With the Galaxy Note8 in your hand, bigger things are just waiting to happen.&nbsp;</p>\r\n\r\n<h3>The Infinity Display that&#39;s larger than life.&nbsp;</h3>\r\n\r\n<p>More screen means more space to do great things. Go big with the Galaxy Note8&#39;s 6.3&quot; screen. It&#39;s the largest ever screen on a Note device and it still fits easily in your hand.</p>\r\n\r\n<p>*Infinity Display: a near bezel-less, full-frontal glass, edge-to-edge screen.</p>\r\n\r\n<p>*Screen measured diagonally as a full rectangle without accounting for the rounded corners.</p>\r\n\r\n<p>Use the S Pen to express yourself in ways that make a difference. Draw your own emojis to show how you feel or write a message on a photo and send it as a handwritten note. Do things that matter with the S Pen.</p>\r\n\r\n<p>*Image simulated for illustration purpose only.</p>\r\n', 'samsung-note-8', 829, 'samsung-note-8.jpg', '2020-09-03', 1),
(29, 4, 'Samsung Galaxy S9+ [128 GB]', '<h2>The revolutionary camera that adapts like the human eye.&nbsp;</h2>\r\n\r\n<h3>Capture stunning pictures in bright daylight and super low light.</h3>\r\n\r\n<p>Our category-defining Dual Aperture lens adapts like the human eye. It&#39;s able to automatically switch between various lighting conditions with ease&mdash;making your photos look great whether it&#39;s bright or dark, day or night.</p>\r\n\r\n<p>*Dual Aperture supports F1.5 and F2.4 modes. Installed on the rear camera (Galaxy S9)/rear wide camera (Galaxy S9+).</p>\r\n\r\n<p><img alt=\"\" src=\"https://www.samsung.com/global/galaxy/galaxy-s9/images/galaxy-s9_slow_gif_visual_l.jpg\" style=\"height:464px; width:942px\" />Add music. Make GIFs. Get likes</p>\r\n\r\n<p>Super Slow-mo lets you see the things you could have missed in the blink of an eye. Set the video to music or turn it into a looping GIF, and share it with a tap. Then sit back and watch the reactions roll in.</p>\r\n', 'samsung-galaxy-s9-128-gb', 889.99, 'samsung-galaxy-s9-128-gb.jpg', '2020-08-12', 3),
(30, 5, 'Kibanda Money Agent', '<p>Made ready for transport</p>\r\n', 'kibanda-money-agent', 12500, 'kibanda-money-agent.png', '2020-08-26', 1),
(31, 5, 'table', '<p>hjd3,dkl jkdlkjd jklddjkd4 jkkfl4jf jld4</p>\r\n', 'table', 12500, 'table.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pay_id` varchar(50) NOT NULL,
  `sales_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `user_id`, `pay_id`, `sales_date`) VALUES
(9, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2018-05-10'),
(10, 9, 'PAY-21700797GV667562HLLZ7ZVY', '2018-05-10'),
(11, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2020-05-10'),
(12, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2020-05-10'),
(13, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2020-06-10'),
(14, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2020-08-28'),
(15, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2020-05-10'),
(16, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2020-05-10'),
(17, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2020-05-10'),
(18, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2020-05-10'),
(19, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2020-05-10'),
(29, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2020-05-10'),
(32, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2020-05-10'),
(34, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2020-05-10'),
(39, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2020-05-10'),
(43, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2020-05-10'),
(49, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2020-08-10'),
(59, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2020-08-10'),
(69, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2020-05-10'),
(75, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2020-05-10'),
(76, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2020-05-10'),
(79, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2020-05-10'),
(88, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2020-01-10'),
(89, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2020-05-10'),
(90, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2020-05-10'),
(91, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2020-05-10'),
(93, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2020-05-10'),
(95, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2020-07-10'),
(96, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2020-05-10'),
(99, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2020-04-10'),
(100, 13, 'BGRX546789H65', '2020-08-29'),
(101, 14, 'GSWJGSJUWGWH4356', '2020-09-03');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(60) NOT NULL,
  `type` int(1) NOT NULL DEFAULT 0,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` text DEFAULT NULL,
  `contact_info` varchar(100) DEFAULT NULL,
  `photo` varchar(200) NOT NULL DEFAULT 'profile.jpg',
  `status` int(1) NOT NULL DEFAULT 1,
  `activate_code` varchar(15) NOT NULL,
  `reset_code` varchar(15) DEFAULT NULL,
  `created_on` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `type`, `firstname`, `lastname`, `address`, `contact_info`, `photo`, `status`, `activate_code`, `reset_code`, `created_on`) VALUES
(1, 'admin@admin.com', '$2y$10$0SHFfoWzz8WZpdu9Qw//E.tWamILbiNCX7bqhy3od0gvK5.kSJ8N2', 1, 'Shabani', 'Buheri', '', '', 'thanos1.jpg', 1, '', '', '2018-05-01'),
(9, 'harry@den.com', '$2y$10$Oongyx.Rv0Y/vbHGOxywl.qf18bXFiZOcEaI4ZpRRLzFNGKAhObSC', 0, 'Harry', 'Den', 'Silay City, Negros Occidental', '09092735719', 'male2.png', 1, 'k8FBpynQfqsv', 'wzPGkX5IODlTYHg', '2018-05-09'),
(12, 'christine@gmail.com', '$2y$10$ozW4c8r313YiBsf7HD7m6egZwpvoE983IHfZsPRxrO1hWXfPRpxHO', 0, 'Christine', 'becker', 'demo', '7542214500', 'female3.jpg', 1, '', '', '2018-07-09'),
(13, 'chifupa@gmail.com', '$2y$10$Jr2LB.eK.N7a7K06X5n7Q.Afr3Cdgdcbii2fm7MKASxq4xxHlOFnm', 0, 'Ally ', 'Mohamed', NULL, NULL, 'profile.jpg', 1, 'salTtYdmqGZQ', NULL, '2020-08-28'),
(14, 'nicolausmwakatyebule@gmail.com', '$2y$10$Zy7Nz1yTdi499B9sLK00u.HkBvZsmt6gHizwigsCMjNlL5ss1yTAy', 0, 'nicolaus', 'mwakatyebule', NULL, NULL, 'profile.jpg', 1, 'hjHzYadkI83O', NULL, '2020-09-03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
