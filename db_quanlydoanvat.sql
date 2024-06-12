-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th6 10, 2024 lúc 12:15 PM
-- Phiên bản máy phục vụ: 5.7.31
-- Phiên bản PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_quanlydoanvat`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE IF NOT EXISTS `cart_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `fulfilled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `menu_id` (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=195 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discounts`
--

DROP TABLE IF EXISTS `discounts`;
CREATE TABLE IF NOT EXISTS `discounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `discountCode` varchar(255) NOT NULL,
  `percentage` int(11) NOT NULL,
  `minSpend` int(11) NOT NULL,
  `cap` int(11) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `discounts`
--

INSERT INTO `discounts` (`id`, `created_at`, `updated_at`, `discountCode`, `percentage`, `minSpend`, `cap`, `startDate`, `endDate`, `description`) VALUES
(5, '2022-04-03 06:02:13', '2024-05-28 03:28:02', 'MAY28', 10, 12000, 50000, '2024-05-28', '2024-06-28', 'Giảm giá 10% nhân dịp kỉ niệm 3 năm KFC Viet Nam'),
(28, '2024-05-28 16:06:40', '2024-05-28 16:06:40', 'MAY29', 15, 12890, 8920, '2024-05-29', '2024-05-30', 'Giảm 15% 29.5.2024'),
(29, '2024-05-28 16:07:16', '2024-05-28 16:07:16', 'MAY30', 18, 82368, 8275, '2024-05-30', '2024-05-31', 'Giảm 18% 30.05.2024'),
(27, '2024-05-28 03:33:00', '2024-05-28 03:33:00', 'JUNE1', 10, 120000, 5600, '2024-06-01', '2024-06-02', 'Giảm giá 10% nhân dịp Quốc Tế Thiếu Nhi 1/6');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'undefined',
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `menus`
--

INSERT INTO `menus` (`id`, `name`, `description`, `price`, `image`, `size`, `type`, `status`) VALUES
(48, 'Trà Đào', '1 Trà Đào', 24000, '1716911860-Trà Đào.jpg', '1-2', 'Nước Uống', 1),
(49, 'Pepsi Lon Không Calo', '1 Pepsi Lon Không Calo', 19000, '1716911892-Pepsi Lon Không Calo.jpg', '1-2', 'Nước Uống', 1),
(45, 'Mì Ý Gà Zinger', '1 Mì Ý Gà Zinger', 58000, '1716911737-Mì Ý Gà Zinger.jpg', '1-2', 'Mì Ý', 1),
(46, '10 Gà Rán Tenders Vị Nguyên Bản', '10 Gà Rán Tenders Vị Nguyên Bản', 129000, '1716911787-10 Gà Rán Tenders Vị Nguyên Bản.jpg', '>5', 'Gà Rán', 1),
(43, 'Cơm Gà Teriyaki', '1 Cơm Gà Teriyaki', 45000, '1716882162-Cơm Gà Teriyaki.jpg', '3-4', 'Cơm', 1),
(44, 'Mì Ý Gà Rán', '1 Mì Ý Gà Rán', 64000, '1716911690-Mì Ý Gà Rán.jpg', '3-4', 'Mì Ý', 1),
(42, 'Khoai Tây Múi Cau (Vừa)', '01 Khoai Tây Múi Cau (vừa)', 23000, '1716882112-Khoai Tây Múi Cau (Vừa).jpg', '3-4', 'Thức Ăn Nhẹ', 1),
(40, '5 Viên Khoai Môn Kim Sa', '5 Viên Khoai Môn Kim S', 54000, '1716882022-5 Viên Khoai Môn Kim Sa.jpg', '>5', 'Tráng Miệng', 1),
(41, 'Bắp Cải Trộn (Vừa)', 'Bắp Cải Trộn (Vừa)', 12000, '1716882067-Bắp Cải Trộn (Vừa).jpg', '1-2', 'Thức Ăn Nhẹ', 1),
(39, '1 Bánh Trứng', '1 Bánh Trứng', 18000, '1716881994-1 Bánh Trứng.jpg', '1-2', 'Tráng Miệng', 1),
(38, 'Burger Tôm', '1 Burger Tôm', 45000, '1716881956-Burger Tôm.jpg', '>5', 'Burger', 1),
(36, 'Combo nhóm 6', '6 Miếng Gà + 1 Mì Ý Popcorn + 1 Khoai Tây Múi Cau (vừa) + 4 Pepsi (lớn)', 275000, '1716803002-Combo nhóm 6.jpg', '>5', 'Gà Quay', 1),
(37, 'Burger Gà Quay Flava', '1 Burger Gà Quay Flava', 54000, '1716881881-Burger Gà Quay Flava.jpg', '1-2', 'Burger', 1),
(35, 'Box Meal Pasta Zinger', '1 Mì Ý Zinger + 1 Miếng Gà + 1 Pepsi (lớn)', 99000, '1716802946-Box Meal Pasta Zinger.jpg', '3-4', 'Cơm', 1),
(34, 'Pepsi Lon', '1 Pepsi Lon', 19000, '1716802363-Pepsi Lon.jpg', '1-2', 'Nước Uống', 1),
(33, '6 Miếng Gà Rán', '6 Miếng Gà Giòn Cay/Gà Truyền Thống/Gà Giòn Không Cay', 204000, '1716802274-6 Miếng Gà Rán.jpg', '3-4', 'Gà Rán', 1),
(32, '1 Miếng Phi-lê Gà Quay', '1 Miếng Phi-lê Gà Quay Flava/Phi-lê Gà Quay Tiêu', 39000, '1716802225-1 Miếng Phi-lê Gà Quay.jpg', '1-2', 'Gà Quay', 1),
(31, 'Mì Ý Phi-Lê Gà Quay', '1 Mì Ý Phi-Lê Gà Quay', 61000, '1716802171-Mì Ý Phi-Lê Gà Quay.jpg', '1-2', 'Mì Ý', 1),
(29, '6 Phô Mai Viên', '6 Phô Mai Viên', 49000, '1716801834-6 Phô Mai Viên.jpg', '1-2', 'Thức Ăn Nhẹ', 1),
(30, 'Cơm Gà Rán', '1 Cơm Gà Rán', 48000, '1716802127-Cơm Gà Rán.jpg', '1-2', 'Cơm', 1),
(28, 'Burger Zinger', '1 Burger Zinger', 54000, '1716801732-Burger Zinger.jpg', '1-2', 'Burger', 1),
(27, '1 Bánh Trứng', '1 Bánh Trứng', 18000, '1716801609-1 Bánh Trứng.jpg', '1-2', 'Tráng Miệng', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_02_19_093623_create_menus_table', 1),
(6, '2022_02_20_060338_create_cart_items_table', 1),
(7, '2022_02_20_061513_create_orders_table', 1),
(14, '2022_03_19_045828_create_transactions_table', 2),
(15, '2022_03_19_045848_create_discounts_table', 2),
(16, '2022_03_26_061417_add_columns_to_menus_table', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `dateTime` datetime NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('kskfkd02@gmail.com', '$2y$10$LtIW8T0TAbBiWb9u5uUEaujfr2jZxQ9jbjQVdXqmVIgJSDz3M1DMW', '2022-04-14 04:01:24'),
('namdotatks48@gmail.com', '$2y$10$bDit/Hm3qV8V3CyVvJLo9uk9jRdG7lT5elxi3xqg.4lZZWNgvbaCK', '2024-06-02 12:56:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `final_amount` decimal(10,2) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `discount_id` (`discount_id`)
) ENGINE=MyISAM AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'customer',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'jiayong', 'jiayong1008@gmail.com', NULL, '$2y$10$QGCVPok3h1njmpmFOB3tmu2/B4qGoaY8Di9MVmtZgRX88eM3iItK2', '7nRsSiivCgLFkTPNBqbFQQUFAv43PPJiRsRlF0oZ5DtxAs9oi2d8jsBWgIb0', '2022-02-25 13:14:22', '2022-04-17 08:52:23', 'customer'),
(2, 'kitchen', 'kitchen@gmail.com', NULL, '$2y$10$A1m.Es9ZvxKVM9Tst/v9cefetdaoH3dPuvSXOmAtz7umMnqyTYtiu', NULL, '2022-02-28 06:10:16', '2022-02-28 06:12:04', 'kitchenStaff'),
(3, 'weikang', 'tanweikang02@gmail.com', NULL, '$2y$10$jWtoQvnZY9p3k1OJOQiKy.q2x31EAyZias/NHJQyflxQjohYmvFOC', 'Lenpa4hxzDZsOuVpcTnKxxITjevgPCrQhN5fUB6VTobB4DoCbOW8vWygpZ5B', '2022-02-28 06:31:21', '2022-04-17 05:40:19', 'customer'),
(4, 'admin_wk', 'wk@admin.com', NULL, '$2y$10$kCstsgkLd3Bsd4qe0i4Hs.ACpAcDRMbBCCTfdNgvAvcJ7Ka8VgZkm', NULL, '2022-03-03 03:58:04', '2022-03-03 03:58:04', 'admin'),
(5, 'JY', 'jy@admin.com', NULL, '$2y$10$czo0I1LX2RcjXsdvuLxMqeOqNQO7y/uapc2KqsZgmpPbxwTPbqRYi', 'cea91mS803HcNM1QKdeyH09ERc23Btjg1PzfcqrluOEBMCa3M6qPJlljisKG', '2022-03-03 08:29:10', '2022-03-03 08:29:10', 'admin'),
(6, 'jy', 'jiayong2@gmail.com', NULL, '$2y$10$wNqY8w88LInk5szsZy3OoO03tCgcNNlh77TlHzWW2XAZNVihhQXl2', NULL, '2022-03-10 02:37:31', '2022-03-10 02:37:31', 'customer'),
(7, 'Lai Pin Cheng', 'pincheng@gmail.com', NULL, '$2y$10$KMWO5JdQzFE5edk.nQMIWOPLO42febvGlQRBYWWbdSkcnMbQJTxCa', NULL, '2022-04-03 03:58:37', '2022-04-03 03:58:37', 'customer'),
(8, 'Leanne Ooi', 'leanne@gmail.com', NULL, '$2y$10$ZPDxsUKFRJdx5zvBH2IEnO2FykP8hg6WQwlBkpQ.XNoxUbww8n5s6', NULL, '2022-04-03 03:59:02', '2022-04-03 03:59:02', 'customer'),
(9, 'weikangkitchen', 'wk@kitchen.com', NULL, '$2y$10$pbaDQFzqlB2wQVtkZJ8xK.EUyarrUAxkQvg1tyGkNrgDr4XfVRLd2', NULL, '2022-04-09 13:41:45', '2022-04-09 13:41:45', 'kitchenStaff'),
(10, 'Martin Barrett', 'barremarti@fishingoo.com', NULL, '$2y$10$5X5dKYztgu71XWLVZJ2YnurtGgt3wayu/piKX.4VbqjxyG3xie9fW', NULL, '2022-04-11 14:35:58', '2022-04-11 14:35:58', 'customer'),
(11, 'Joel Bush', 'joelb91@fishingoo.com', NULL, '$2y$10$V3RVQEQISLgpDQBNFjf7WOQi60/PQDSaiwqAaT86S.rKmA1CyfBMq', NULL, '2022-04-11 14:37:23', '2022-04-11 14:37:23', 'customer'),
(12, 'Lee Young', 'leyoung@binkmail.com', NULL, '$2y$10$R2Pv18dKLqXU4983UeZraO8162TT44csW9x0eTKT6qyxbnXjFbLdi', NULL, '2022-04-11 14:38:05', '2022-04-11 14:38:05', 'customer'),
(13, 'Julian Fisher', 'julfis@burgundy1.com', NULL, '$2y$10$Hg8VySslZYt8n.k.UiChwOL8E0ogLp2pnDZNy9N9w94tLB6/AP6/i', NULL, '2022-04-11 14:38:54', '2022-04-11 14:38:54', 'customer'),
(14, 'Loretta Frazier', 'lorettfr@labels11.com', NULL, '$2y$10$DGS4ChN9zeYcyXzR1xS2oOCKC5k94MO.j1g2776zV2B8rWbf36X/6', NULL, '2022-04-11 14:39:30', '2022-04-11 14:39:30', 'customer'),
(15, 'Dale Ramirez', 'daramire@fropp.com', NULL, '$2y$10$NpUknu0eQLdgikchIzlpzOeHEZVFQZLzfS4k1Mx.WHnOxm3KZJimC', NULL, '2022-04-11 14:40:00', '2022-04-11 14:40:00', 'customer'),
(16, 'Marguerite Hill', 'marguehill@burgundy1.com', NULL, '$2y$10$AN5Gao3lx6EqQEVLFCGaeuZ6r4.vbgBvjE0KjFiA0WCw/Gm2QxAIG', NULL, '2022-04-11 14:40:30', '2022-04-11 14:40:30', 'customer'),
(17, 'Ashley Greene', 'greenea@chammy.info', NULL, '$2y$10$.t5CcPzVd7aKueu//ony9.iOG.ePeEkansl8a3EOv9BTPD1GxtDzW', NULL, '2022-04-11 14:41:13', '2022-04-11 14:41:13', 'customer'),
(18, 'Aaron Lawson', 'laaro294@binkmail.com', NULL, '$2y$10$eQe0Ww5K7qKTWk6onsPYl.JsQucBIZ6pvhnouGDCfpny3fck1qruW', NULL, '2022-04-11 14:41:44', '2022-04-11 14:41:44', 'customer'),
(19, 'Laurie Palmer', 'palmerl@binkmail.com', NULL, '$2y$10$X7P.iyhki7eAUPNlpHL4POQm0NeyukrFEjleSpvktErmmM1R9i7yO', NULL, '2022-04-11 14:42:16', '2022-04-11 14:42:16', 'customer'),
(20, 'Lewis Chandler', 'chandle@fropp.com', NULL, '$2y$10$xEi.TZHPswPZguEZFpCmP.bDonrdVJJT6H8vwKHkLbxZ5eJi.q8dm', NULL, '2022-04-11 14:42:58', '2022-04-11 14:42:58', 'customer'),
(21, 'kskfkd02', 'kskfkd02@gmail.com', NULL, '$2y$10$/Eyq815sq5epp.b.J./kbuEqvQolFPb2JwC.DjE30msZDgOJZuIrq', NULL, '2022-04-13 15:22:38', '2022-04-13 15:22:38', 'customer'),
(22, 'Goh Jia Ying', 'jiaying22@gmail.com', NULL, '$2y$10$EhHzP/kcCfKG3AIn73VnMO4Ky6SLGUGY1Nu1TjFVY3KtdcYjWJvUy', 'Rm4b3bQFb0rgxOwFH5D8LKeVnRll7Bh43UR2PRveVfiB6TVZsZuOxGpQs4aQ', '2022-04-14 08:06:04', '2022-04-14 08:06:04', 'customer'),
(27, 'Hope Mikaelson', 'hope@originals.com', NULL, '$2y$10$BXKZOiVGAbpyVYdh04/kjOnxOAS9ZMLfPXWWUFAg1x1m6mMyOu.lK', NULL, '2022-04-19 14:02:08', '2022-04-19 14:02:08', 'customer'),
(28, 'Elijah Mikaelson', 'elijah@originals.com', NULL, '$2y$10$mr.duX.hll81wpLxSudd7OLKphnq5szaQDjnFqLNAgP.ochUGLcNy', NULL, '2022-04-19 14:10:13', '2022-04-19 14:10:13', 'admin'),
(29, 'Nguyễn Văn Lợi', 'nguyenvanloi22022003@gmail.com', NULL, '$2y$10$x9IkB8mUvxo1NpKGriTOquobHlz36OKQXBAZ8kX9UItMuZeO1fBDK', NULL, '2024-05-19 07:05:24', '2024-05-19 07:05:24', 'customer'),
(30, 'Nguyen Van Loi', 'nguyenvanloi22012003@gmail.com', NULL, '$2y$10$wbs53aO4dA2QRBR3TG/WGeFmybefSSbfVAGxrvvNnoGcFExJ8N0ni', NULL, '2024-05-19 07:17:58', '2024-05-19 07:17:58', 'customer'),
(31, 'Nguyễn Hoàng Anh', 'hoanganhnguyen@gmail.com', NULL, '$2y$10$htM/yYFiFgbQtezd01dhreefWGcf0CTnd7idL7ygYB1BclU9rOdaq', NULL, '2024-05-19 07:18:42', '2024-05-19 07:18:42', 'customer'),
(35, 'Le Nam', 'user@gmail.com', NULL, '$2y$10$oonSJAQ4HIpxHdR94bPUoO/VZ5XATc5ajaJkDMtGh4NvHyEN7isw6', NULL, '2024-05-25 08:28:50', '2024-05-25 08:28:50', 'customer'),
(36, 'Le Nam', 'admin@gmail.com', NULL, '$2y$10$pb6p3nF9f8pFlPeJWI41U.bliZkxvSY8bTwFevptT7kpDPjOy/TU6', NULL, '2024-05-25 08:59:50', '2024-05-25 08:59:50', 'admin'),
(37, 'Le Nam', 'namdotatks48@gmail.com', NULL, '$2y$10$QGi6lBboJCCKtcS0DMvbtun8F3GnMrm9WxTjwa8axKdXvXLXtD.K6', 'buf9FhASYhH2MTQob87wmx6xTJKkmKFJgJdbW9msUoMXReCdmrSbWwEeK0Ro', '2024-05-28 04:48:34', '2024-05-28 06:51:43', 'customer'),
(38, 'Le Nam', 'staff@gmail.com', NULL, '$2y$10$p0UUA86Qk9P36pBCYyazle1Xi0sH5H8iyKNaZHFJYuiCJN/Xo4Ok.', NULL, '2024-06-02 05:26:43', '2024-06-02 05:26:43', 'kitchenStaff');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
