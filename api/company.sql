-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 09, 2019 lúc 04:22 AM
-- Phiên bản máy phục vụ: 10.1.32-MariaDB
-- Phiên bản PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `company`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `companyName` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idParent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `company`
--

INSERT INTO `company` (`id`, `companyName`, `address`, `phone`, `idParent`) VALUES
(0, 'Pink Ways', '123 Nguyễn Lương Bằng', '0379558185', 0),
(1, 'Vinass', '123 Nguyễn Lương Bằng', '0379558185', 0),
(2, 'Hoàng Phúc', '123 Nguyễn Trãi', '0935682288', 1),
(3, 'Sun kun', '123 Nguyễn Trãi', '0935682288', 1),
(4, 'Đại lý 1 sunkun', '123 Nguyễn Trãi', '0935682288', 3),
(5, 'Đại lý 2 sunkun', '123 Nguyễn Trãi', '0935682288', 3),
(6, 'Hoàng Phong', 'Đà Nẵng', '379558185', 1),
(7, 'adsf', 'sdf', '2312', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customercare`
--

CREATE TABLE `customercare` (
  `id` int(11) NOT NULL,
  `idCompany` int(11) NOT NULL,
  `idSell` int(11) NOT NULL,
  `idEmployees` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `note` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customercare`
--

INSERT INTO `customercare` (`id`, `idCompany`, `idSell`, `idEmployees`, `type`, `startDate`, `note`) VALUES
(1, 1, 58, 1, 1, '2019-05-08 00:00:00', 'abc'),
(2, 1, 58, 1, 1, '2019-05-08 00:00:00', 'abc'),
(3, 1, 58, 1, 1, '2019-05-08 08:18:37', 'dsf'),
(4, 1, 49, 1, 1, '2019-05-08 08:42:06', 'khách mua cho mẹ ăn rất tốt'),
(5, 1, 46, 1, 1, '2019-05-08 08:48:12', 'abc'),
(6, 1, 63, 1, 1, '2019-05-08 08:54:09', 'khách dùng lần đầu'),
(7, 1, 63, 1, 1, '2019-05-08 09:19:18', 'Đã gọi xong'),
(8, 1, 56, 1, 1, '2019-05-08 09:19:22', 'Đã gọi xong'),
(9, 1, 63, 1, 1, '2019-05-08 09:19:27', 'Đã gọi xong'),
(10, 1, 63, 1, 1, '2019-05-08 09:23:35', 'khach mua nhiều tỏi lắm đi bán');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `idCompany` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL DEFAULT '0',
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `employees`
--

INSERT INTO `employees` (`id`, `idCompany`, `permissionId`, `username`, `password`, `position`, `email`, `address`, `phone`, `status`, `startDate`, `endDate`) VALUES
(1, 1, 1, 'phuonglh5', '1', 'Giám đốc kỹ thuật', 'helloitpdu@gmail.com', '123 Lê Lợi', '0379558185', 1, '2019-03-23', '0000-00-00'),
(2, 1, 1, 'trungnt', '1', 'Giám đốc điều hành', 'trungnt@gmail.com', '123 Lê Lợi', '', 0, '2019-03-31', '0000-00-00'),
(3, 1, 0, 'phonglh', '1', 'Full stack developer', 'phong@gmail.com', '123 Lê Lợi', '', 1, '2019-03-31', '0000-00-00'),
(4, 1, 0, 'tainm', '1', 'Full stack developer', 'tainm@gmail.com', '123 Lê Lợi', '', 1, '2019-03-31', '0000-00-00'),
(5, 1, 0, 'ab', '1', '1', 'phuonglh5', '123 Lê Lợi', '0379558185', 1, '2019-04-11', '0000-00-00'),
(6, 1, 0, 'b', 'b', 'b', 'b', 'b', '11', 0, '2019-04-11', '0000-00-00'),
(7, 1, 0, 'asdfadsf', '1', '1', '', '', '', 1, '0000-00-00', '0000-00-00'),
(8, 1, 0, 'asdasd', '1', '1', 'phuonglh5', '1', '1', 1, '2019-04-15', '0000-00-00'),
(9, 1, 0, 'asdfasdfasdf', '1', '1', '1', '1', '1', 1, '2019-04-15', '0000-00-00'),
(10, 1, 0, 'asdfasdfasdf', '1', '1', '1', '1', '1', 1, '2019-04-15', '0000-00-00'),
(11, 1, 0, 'phuonglh51', '1', '1', '1', '1', '1', 1, '2019-05-05', NULL),
(12, 1, 1, 'phuonglh521', '1', '1', '1', '1', '1', 1, '2019-05-05', NULL),
(13, 2, 1, 'admin', '1', 'Giám đốc', NULL, NULL, NULL, 1, '2019-05-08', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `idCompany` int(11) DEFAULT NULL,
  `modDate` date DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `sqlQuery` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `idCompany` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `readed` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `notification`
--

INSERT INTO `notification` (`id`, `idCompany`, `type`, `title`, `content`, `url`, `readed`) VALUES
(1, 1, 1, 'Liên lạc khách', 'Liên lạc với khách hủy đơn hàng', '/company/content/quan-ly-thanh-vien', 0),
(2, 1, 2, 'Liên hệ khách hàng', 'Khách lâu chưa đặt hàng', '/company/content/quan-ly-thanh-vien', 0),
(3, 1, 3, 'Hạn sử dụng sản phẩm', 'Sản phẩm gần hết hạn cần xử lý', '/company/content/quan-ly-kho-hang/danh-sach-kho-ha', 0),
(4, 1, 4, 'Đơn hàng mới', 'Có đơn hàng mới hãy xử lý ngay', '/company/content/quan-ly-don-hang/dat-hang', 0),
(5, 1, 5, 'Đơn hàng quá hạn', 'Đơn hàng quá hạn mà chưa xử lý', '/company/content/quan-ly-don-hang/dat-hang', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `idCompany` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `readed` tinyint(1) DEFAULT NULL,
  `idProduct` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `idEmpl` int(11) DEFAULT NULL,
  `idUser` int(11) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `address` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `shippingFees` double DEFAULT NULL,
  `note` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `idCompany`, `status`, `readed`, `idProduct`, `amount`, `price`, `idEmpl`, `idUser`, `startDate`, `address`, `phone`, `endDate`, `shippingFees`, `note`) VALUES
(2, 0, 0, 0, 4, 1, 350000, 0, 1, '2019-03-24', '123 Lưu Quang Vũ', '0379557175', '0000-00-00', 0, 'Hạn sử dụng dài tý'),
(3, 0, 6, 0, 5, 5, 70000, 1, 1, '2019-03-24', '123 Lưu Quang Vũ', '0379557175', '0000-00-00', 0, 'Mua mới'),
(4, 1, 6, 0, 1, 1, 350000, 0, 1, '2019-03-24', '123 Lưu Quang Vũ', '0379557175', '0000-00-00', 0, 'Hạn sử dụng dài tý'),
(5, 1, 6, 0, 2, 5, 70000, 1, 1, '2019-03-24', '123 Lưu Quang Vũ', '0379557175', '0000-00-00', 0, 'Mua mới'),
(6, 1, 6, 0, 1, 1, 350000, 0, 1, '2019-03-24', '123 Lưu Quang Vũ', '0379557175', '0000-00-00', 0, 'Hạn sử dụng dài tý'),
(7, 1, 5, 0, 2, 5, 70000, 1, 1, '2019-03-24', '123 Lưu Quang Vũ', '0379557175', '0000-00-00', 0, 'Mua mới'),
(8, 1, 8, 0, 1, 1, 350000, 0, 1, '2019-03-24', '123 Lưu Quang Vũ', '0379557175', '0000-00-00', 0, 'Hạn sử dụng dài tý'),
(9, 1, 6, 0, 2, 5, 70000, 1, 1, '2019-03-24', '123 Lưu Quang Vũ', '0379557175', '0000-00-00', 0, 'Mua mới'),
(10, 1, 6, 0, 1, 1, 350000, 0, 1, '2019-03-24', '123 Lưu Quang Vũ', '0379557175', '0000-00-00', 0, 'Hạn sử dụng dài tý'),
(11, 1, 7, 0, 2, 5, 70000, 1, 1, '2019-03-24', '123 Lưu Quang Vũ', '0379557175', '0000-00-00', 0, 'Mua mới'),
(12, 1, 0, 0, 5, 1, 14000, 1, 1, '2019-05-03', '123 Lê Lợi', '', '0000-00-00', 0, '12312'),
(13, 0, 6, 0, 5, 3, 42000, 1, 1, '2019-03-31', '123 Lê Lợi', '', '0000-00-00', 0, 'a'),
(14, 0, 1, 0, 4, 1, 350000, 1, 1, '2019-03-31', '123 Lê Lợi', '', '0000-00-00', 0, 'mua tỏi mới'),
(15, 1, 1, 0, 5, 5, 70000, 1, 1, '2019-05-03', '123 Lê Lợi', '0379558185', '0000-00-00', 0, 'Mua gạo'),
(16, 1, 6, 0, 5, 5, 70000, 1, 1, '2019-05-03', '123 Lê Lợi', '0379558185', '0000-00-00', 0, 'Đặt từ đại lý mẹ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `idCompany` int(11) DEFAULT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `priceOrigin` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `idCompany`, `image`, `name`, `price`, `priceOrigin`) VALUES
(1, 1, 'https://dichvunhanh24h.net/Uploads/images/toi-den-tai-da-nang.jpg', 'Tỏi đen', 350000, 0),
(3, 1, 'https://dichvunhanh24h.net/Uploads/images/toi-den-tai-da-nang.jpg', 'Rượu tỏi', 700000, 0),
(4, 0, 'https://dichvunhanh24h.net/Uploads/images/toi-den-tai-da-nang.jpg', 'Tỏi đen', 350000, 0),
(5, 0, 'https://dichvunhanh24h.net/Uploads/images/toi-den-tai-da-nang.jpg', 'Gạo lứt', 14000, 0),
(6, 0, 'https://dichvunhanh24h.net/Uploads/images/toi-den-tai-da-nang.jpg', 'Rượu tỏi', 700000, 0),
(7, 1, 'https://dichvunhanh24h.net/Uploads/images/toi-den-tai-da-nang.jpg', 'Hành lá', 10000, 0),
(8, 1, 'https://dichvunhanh24h.net/Uploads/images/toi-den-tai-da-nang.jpg', 'Gạo trắng', 10000, 0),
(9, 1, 'https://dichvunhanh24h.net/Uploads/images/toi-den-tai-da-nang.jpg', 'Thuốc bổ', 300000, 0),
(10, 1, 'https://dichvunhanh24h.net/Uploads/images/toi-den-tai-da-nang.jpg', 'Gạo lứt', 70000, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reward`
--

CREATE TABLE `reward` (
  `id` int(11) NOT NULL,
  `idCompany` int(11) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `target` double DEFAULT NULL,
  `prize` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `reward`
--

INSERT INTO `reward` (`id`, `idCompany`, `startDate`, `endDate`, `target`, `prize`) VALUES
(1, 0, '2019-01-01', '2019-12-30', 20000000, 5000000),
(2, 0, '2019-05-01', '2019-05-23', 5000000, 400000),
(3, 1, '2019-05-01', '2019-05-30', 2000000, 200000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sellandimport`
--

CREATE TABLE `sellandimport` (
  `id` int(11) NOT NULL,
  `idCompany` int(11) DEFAULT NULL,
  `isCall` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `addDate` date DEFAULT NULL,
  `idEmpl` int(11) DEFAULT NULL,
  `idUser` int(11) DEFAULT NULL,
  `idProduct` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `note` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sellandimport`
--

INSERT INTO `sellandimport` (`id`, `idCompany`, `isCall`, `type`, `addDate`, `idEmpl`, `idUser`, `idProduct`, `amount`, `price`, `note`) VALUES
(1, 1, 7, 1, '2019-05-01', 1, 1, 1, 11, 400000, 'Bán tỏi'),
(2, 1, 7, 2, '2019-05-01', 1, 1, 1, 5, 500000, 'Tiền điện'),
(3, 1, 7, 3, '2019-03-23', 1, 1, 1, 10, 500000, 'Bán Tỏi'),
(4, 1, 7, 4, '2019-03-23', 1, 1, 1, 100, 2000000, 'Nhập tỏi từ đại lý Mẹ'),
(5, 1, 7, 1, '2019-02-23', 1, 1, 1, 1, 300000, 'Bán gạo'),
(6, 1, 7, 2, '2019-02-23', 1, 1, 1, 1, 250000, 'Tiền điện'),
(7, 1, 7, 3, '2019-02-23', 1, 1, 1, 5, 700000, 'Rượi tỏi'),
(8, 1, 7, 4, '2019-02-23', 1, 1, 1, 15, 350000, 'Nhập rượi nho'),
(9, 1, 7, 1, '2019-03-22', 1, 1, 1, 11, 200000, 'Bán tỏi'),
(10, 1, 7, 2, '2019-03-22', 1, 1, 1, 5, 300000, 'Tiền điện'),
(11, 1, 7, 3, '2019-03-22', 1, 1, 1, 30, 400000, 'Bán Tỏi'),
(12, 1, 7, 4, '2019-03-22', 1, 1, 1, 50, 2000000, 'Nhập tỏi từ đại lý Mẹ'),
(13, 1, 1, 0, '2019-03-23', 1, 0, 0, 0, 125000, 'Mua nước'),
(14, 1, 1, 1, '2019-03-23', 1, 0, 0, 0, 125000, 'Mua đồ trang trí'),
(15, 1, 1, 2, '2019-03-20', 1, 0, 0, 0, 50000, 'Ăn trưa cho nhân viên'),
(16, 1, 7, 3, '2019-03-23', 1, 1, 1, 1, 350, 'Bán lần 2'),
(17, 1, 7, 3, '2019-03-23', 1, 2, 2, 1, 700, 'Bán rượu'),
(18, 1, 7, 3, '2019-03-23', 1, 1, 1, 1, 350000, 'Bán lần 3'),
(19, 1, 1, 4, '2019-03-24', 1, 0, 3, 111, 77700000, 'Nhập lô hàng mới'),
(20, 1, 1, 4, '2019-03-24', 1, 0, 1, 3, 1050000, 'Nhập hàng từ đại lý mẹ'),
(21, 1, 7, 3, '2019-03-24', 1, 1, 1, 100, 31850000, 'asdfa'),
(22, 1, 7, 3, '2019-03-24', 1, 1, 1, 1, 350000, 'Mua 1 tỏi đen'),
(23, 1, 7, 3, '2019-03-24', 1, 1, 1, 1, 350000, 'aaa'),
(24, 1, 7, 3, '2019-03-24', 1, 1, 1, 5, 1750000, 'xxx'),
(26, 1, 1, 4, '2019-03-24', 1, 0, 2, 5, 350000, 'Mua mới'),
(27, 1, 1, 4, '2019-03-24', 1, 0, 2, 5, 350000, 'Mua mới'),
(28, 1, 1, 4, '2019-03-24', 1, 0, 2, 5, 350000, 'Mua mới'),
(29, 1, 1, 3, '2019-03-24', 1, 0, 3, 1, 700000, 'test'),
(30, 1, 1, 3, '2019-03-24', 1, 0, 2, 1, 14000, '12112'),
(31, 1, 7, 3, '2019-03-24', 1, 1, 2, 5, 350000, 'Mua mới'),
(32, 1, 1, 1, '2019-03-25', 1, 0, 0, 0, 10000, 'Mua đồ ăn cho nhân viên'),
(33, 1, 1, 2, '2019-03-25', 1, 0, 0, 0, 150000, 'Nạp tiền điện'),
(34, 1, 7, 3, '2019-03-25', 1, 3, 3, 1, 700000, 'Bán lần 1'),
(35, 1, 1, 4, '2019-03-25', 1, 0, 2, 5, 350000, 'Mua mới'),
(36, 1, 1, 1, '2019-03-25', 0, 0, 0, 0, 11111, '1111'),
(37, 1, 7, 3, '2019-03-30', 1, 1, 2, 5, 350000, 'Mua mới'),
(38, 1, 7, 3, '2019-03-31', 1, 1, 2, 5, 350000, 'Mua mới'),
(39, 1, 7, 3, '2019-03-31', 1, 1, 1, 1, 350000, 'Hạn sử dụng dài tý'),
(40, 1, 1, 4, '2019-03-31', 1, 0, 2, 5, 350000, 'Mua mới'),
(41, 1, 1, 4, '2019-03-31', 1, 0, 2, 5, 350000, 'Mua mới'),
(42, 1, 1, 4, '2019-03-31', 1, 0, 2, 5, 350000, 'Mua mới'),
(43, 1, 1, 4, '2019-03-31', 1, 0, 2, 5, 350000, 'Mua mới'),
(44, 1, 1, 4, '2019-03-31', 1, 0, 2, 3, 126000, 'a'),
(45, 1, 1, 1, '2019-04-01', 1, 0, 0, 0, 100000, 'Mua sách'),
(46, 1, 7, 3, '2019-04-01', 1, 3, 3, 1, 700000, 'abc'),
(47, 1, 1, 1, '2019-04-01', 1, 0, 0, 0, 500000, 'Tiền web'),
(48, 1, 1, 2, '2019-04-01', 1, 0, 0, 0, 300000, 'Tiền nước'),
(49, 1, 7, 3, '2019-04-01', 1, 2, 1, 1, 350000, 'Bán cho khách mới'),
(50, 1, 7, 3, '2019-04-01', 1, 1, 1, 1, 350000, 'Hạn sử dụng dài tý'),
(51, 1, 1, 4, '2019-04-01', 1, 0, 10, 5, 350000, 'Đặt từ đại lý mẹ'),
(52, 1, 7, 3, '2019-04-05', 1, 1, 10, 2, 140000, 'dfsa'),
(53, 1, 1, 3, '2019-04-06', 1, 7, 1, 1, 70000, 'Bị bệnh đẹp trai'),
(54, 1, 7, 3, '2019-04-06', 1, 4, 1, 1, 70000, 'a'),
(55, 1, 7, 3, '2019-04-08', 1, 1, 10, 2, 0, 'Khách quen'),
(56, 1, 7, 3, '2019-04-08', 1, 4, 1, 2, 3.6, 'abc'),
(57, 1, 7, 1, '2019-05-01', 1, 1, 1, 1, 350000, 'Hạn sử dụng dài tý'),
(58, 1, 7, 1, '2019-05-01', 1, 1, 1, 1, 350000, 'Hạn sử dụng dài tý'),
(59, 2, 1, 4, '2019-03-24', 1, 0, 2, 5, 350000, 'Mua mới'),
(60, 3, 1, 4, '2019-03-24', 1, 0, 2, 5, 350000, 'Mua mới'),
(61, 4, 1, 3, '2019-03-24', 1, 0, 3, 1, 700000, 'test'),
(62, 2, 1, 3, '2019-03-24', 1, 0, 2, 1, 14000, '12112'),
(63, 1, 7, 3, '2019-05-01', 1, 1, 1, 31, 189000, 'abc'),
(64, 2, NULL, 1, '2019-05-08', 13, NULL, NULL, NULL, 100000, 'Vé số');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `idCompany` int(11) DEFAULT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nickname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `idCompany`, `username`, `password`, `nickname`, `email`, `address`, `phone`) VALUES
(1, 1, 'a', '1', 'Le hogn phuong', '1', '123 Lê Lợi', '0379558185'),
(2, 0, 'b', '1', '1', '1', '1', '1'),
(3, 1, 'c', 'c', 'c', 'c', 'c', '3'),
(4, 2, 'a', '1', 'Le hogn phuong', '1', '123 Lê Lợi', '0379558185'),
(5, 3, 'b', '1', '1', '1', '1', '1'),
(6, 4, 'c', 'c', 'c', 'c', 'c', '3'),
(7, 2, 'bnv', '1', 'Nguyễn văn B', 'b@gmail.com', 'abc', '1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehouse`
--

CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL,
  `idCompany` int(11) DEFAULT NULL,
  `idProduct` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `source` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `warehouse`
--

INSERT INTO `warehouse` (`id`, `idCompany`, `idProduct`, `amount`, `source`, `startDate`, `endDate`) VALUES
(1, 1, 1, 120, '1', '2019-03-24', '2020-03-24'),
(2, 1, 3, 1, 'Đại lý mẹ', '2019-03-24', '2020-03-23'),
(4, 1, 1, 2, 'Đại lý mẹ', '2019-03-24', '2019-05-23'),
(6, 0, 4, 120, 'Tự sản xuất', '2019-03-24', '2020-03-24'),
(7, 0, 4, 4, 'Tự sản xuất', '2019-03-24', '2020-03-23'),
(8, 0, 5, 10, 'Tự sản xuất', '2019-03-24', '2019-05-23'),
(9, 0, 6, 2, 'Tự sản xuất', '2019-03-24', '2019-04-23'),
(14, 1, 2, 1, 'Đại lý mẹ', '2019-03-25', '2019-03-25'),
(15, 1, 2, 5, 'Đại lý mẹ', '2019-03-31', '2019-03-31'),
(16, 1, 2, 5, 'Đại lý mẹ', '2019-03-31', '2019-03-31'),
(17, 1, 2, 5, 'Đại lý mẹ', '2019-03-31', '2019-03-31'),
(18, 1, 2, 5, 'Đại lý mẹ', '2019-03-31', '2019-03-31'),
(19, 1, 2, 3, 'Đại lý mẹ', '2019-03-31', '2019-03-31'),
(20, 1, 10, 1, 'Đại lý mẹ', '2019-04-01', '2019-04-01');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customercare`
--
ALTER TABLE `customercare`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `reward`
--
ALTER TABLE `reward`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sellandimport`
--
ALTER TABLE `sellandimport`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `customercare`
--
ALTER TABLE `customercare`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `reward`
--
ALTER TABLE `reward`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `sellandimport`
--
ALTER TABLE `sellandimport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
