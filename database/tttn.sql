-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 21, 2024 lúc 06:59 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `tttn`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiethoadon`
--

CREATE TABLE `chitiethoadon` (
  `mahd` varchar(20) NOT NULL,
  `tensp` varchar(50) NOT NULL,
  `soluong` int(11) NOT NULL,
  `gia` int(11) NOT NULL,
  `phuongthucthanhtoan` int(11) NOT NULL,
  `id_hdct` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `madm` int(11) NOT NULL,
  `tendm` varchar(50) NOT NULL,
  `dequi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`madm`, `tendm`, `dequi`) VALUES
(1, 'Mỹ Phẩm', 0),
(2, 'Chăm Sóc', 0),
(3, 'Son', 1),
(4, 'Tẩy Trang', 2),
(5, 'Phấn', 1),
(6, 'Dưỡng Ẩm', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `mahd` int(11) NOT NULL,
  `idnd` int(11) NOT NULL,
  `hoten` varchar(50) NOT NULL,
  `diachi` varchar(255) NOT NULL,
  `dienthoai` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `ngaydathang` date NOT NULL,
  `trangthai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hotro`
--

CREATE TABLE `hotro` (
  `idht` int(11) NOT NULL,
  `chude` varchar(255) NOT NULL,
  `noidung` text NOT NULL,
  `hoten` varchar(50) NOT NULL,
  `dienthoai` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `ngaygui` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoidung`
--

CREATE TABLE `nguoidung` (
  `idnd` int(11) NOT NULL,
  `tennd` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `ngaysinh` date NOT NULL,
  `gioitinh` varchar(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `dienthoai` int(11) NOT NULL,
  `diachi` varchar(255) NOT NULL,
  `ngaydangky` date NOT NULL,
  `phanquyen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoidung`
--

INSERT INTO `nguoidung` (`idnd`, `tennd`, `username`, `password`, `ngaysinh`, `gioitinh`, `email`, `dienthoai`, `diachi`, `ngaydangky`, `phanquyen`) VALUES
(3, 'admin', 'admin', '3b712de48137572f3849aabd5666a4e3', '2024-01-08', 'nam', 'admin@gmail.com', 335071443, 'Hai Phong', '2024-01-02', 0),
(5, 'Ngoc Hien', 'hien', '3b712de48137572f3849aabd5666a4e3', '2001-04-20', 'nu', 'hien123@gmail.com', 321654987, 'Hai An', '2024-05-24', 1),
(6, 'hang', 'hang', 'f477363c5eb340a1d0dde733713c1b73', '2002-04-30', 'nam', 'hang89@gmail.com', 335071443, 'Tien Lang', '2024-01-16', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `idsp` int(11) NOT NULL,
  `tensp` varchar(50) NOT NULL,
  `hinhanh` varchar(255) NOT NULL,
  `chitiet` text NOT NULL,
  `soluong` int(11) NOT NULL,
  `daban` int(11) NOT NULL,
  `gia` int(11) NOT NULL,
  `khuyenmai1` int(11) NOT NULL,
  `khuyenmai2` varchar(255) NOT NULL,
  `madm` int(11) NOT NULL,
  `ngaycapnhat` date NOT NULL,
  `trangthai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`idsp`, `tensp`, `hinhanh`, `chitiet`, `soluong`, `daban`, `gia`, `khuyenmai1`, `khuyenmai2`, `madm`, `ngaycapnhat`, `trangthai`) VALUES
(137, 'Son YSL', '20240521185532son3.jpg', '<p>Son YSL Rouge Pur Couture Satin Radiance Lipstick 73 Rhythm Red- M&agrave;u Đỏ Tươi &Aacute;nh Cam&nbsp;lấy cảm hứng từ m&agrave;u đỏ tươi, vừa tươi s&aacute;ng, vừa nền n&atilde;. Ngay từ khi tr&igrave;nh l&agrave;ng, son YSL m&agrave;u 73 đ&atilde; lọt v&agrave;o mắt xanh những tiểu thư kh&oacute; t&iacute;nh nhất.</p>\r\n', 100, 0, 300000, 10, '', 3, '2023-12-17', 0),
(138, 'Ổ cứng SSD Synology 480GB 2.5 inch SATA 6 Gb/s (SA', '20240326053707o3.jpg', '<p><em><strong>Ổ cứng SSD SAT5210-480GB</strong>&nbsp;2.5 inch SATA 6 Gb/s l&agrave; một sản phẩm cao cấp, được thiết kế để gi&uacute;p tăng tốc độ truy xuất dữ liệu, đem lại hiệu quả cao hơn trong hoạt động của hệ thống lưu trữ. Với dung lượng l&ecirc;n đến 480GB, sản phẩm c&oacute; thể lưu trữ lượng lớn dữ liệu nhằm đ&aacute;p ứng nhu cầu của c&aacute;c doanh nghiệp v&agrave; người d&ugrave;ng c&aacute; nh&acirc;n</em></p>\r\n', 100, 0, 250000, 0, '', 9, '2023-12-17', 0),
(139, 'Ổ cứng HDD Synololy HAT5310 8TB 3.5 inch 7200rpm, ', '20240326053322o2.jpg', '<p><em><strong>Synology Enterprise HAT5310-8T</strong>&nbsp;l&agrave; mẫu ổ cứng chuy&ecirc;n dụng cho c&aacute;c hệ thống NAS, m&aacute;y chủ lưu trữ cấp doanh nghiệp. Mẫu ổ cứng n&agrave;y đ&atilde; được&nbsp;<a href=\"https://viettuans.vn/thuong-hieu/synology\" style=\"box-sizing: border-box; background-color: transparent; color: rgb(19, 134, 223); text-decoration-line: none; border: 0px none; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: none 0px; padding: 0px; vertical-align: baseline;\"><strong>Synology</strong></a>&nbsp;tối ưu firmware kh&aacute; tốt, cung cấp hiệu suất xử l&yacute; dữ liệu vượt trội so với d&ograve;ng ổ cứng c&ugrave;ng loại. HAT5310-8T hỗ trợ dung lượng lưu trữ tối đa 8 TB, thiết kế hiện đại c&ugrave;ng k&iacute;ch cỡ chuẩn 3.5&rdquo; cho ph&eacute;p lắp đặt dễ d&agrave;ng v&agrave;o mọi hệ thống lưu trữ hiện nay. Nếu bạn đọc đang c&oacute; nhu cầu t&igrave;m hiểu về mẫu ổ cứng hiệu năng cao d&agrave;nh cho doanh nghiệp n&agrave;y, b&agrave;i viết ngay sau đ&acirc;y l&agrave; d&agrave;nh cho bạn.</em></p>\r\n', 100, 0, 400000, 5, '', 9, '2023-12-17', 0),
(140, 'Ổ cứng HDD Synololy HAT5300 4TB 3.5 inch 7200rpm, ', '20240326053027o1.jpg', '<p><em><strong>Ổ cứng HDD Synology Enterprise HAT5300-4T</strong>&nbsp;l&agrave; mẫu ổ cứng chuy&ecirc;n dụng cấp doanh nghiệp, được tối ưu h&oacute;a cho c&aacute;c hệ thống lưu trữ Synology. Đ&acirc;y l&agrave; d&ograve;ng ổ cứng hiệu năng cao, hướng đến kh&aacute;ch h&agrave;ng doanh nghiệp, sử dụng c&aacute;c thiết bị NAS hay&nbsp;<a href=\"https://viettuans.vn/may-chu-la-gi\" style=\"box-sizing: border-box; background-color: transparent; color: rgb(19, 134, 223); text-decoration-line: none; border: 0px none; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: none 0px; padding: 0px; vertical-align: baseline;\"><strong>m&aacute;y chủ server</strong></a>.&nbsp;HAT5300-4T l&agrave; phi&ecirc;n bản dung lượng thấp nhất trong d&ograve;ng Synology Enterprise, chỉ 4T. Sản phẩm sở hữu thiết kế hiện đại, độ bền xuất sắc. Chuẩn ổ cứng SATA 3 cho tốc độ truyền dữ liệu vượt trội, khả năng hoạt động bền bỉ trong c&aacute;c hệ thống lưu trữ 24/7</em></p>\r\n', 100, 0, 200000, 0, '', 9, '2023-12-17', 0),
(141, 'Kem dưỡng môi Vaseline Lip Therapy Rosy Lips', '20231217165359images (4).jpg', '<p>Kem dưỡng m&ocirc;i Vaseline Lip Therapy Rosy Lips l&agrave; một sản phẩm kem dưỡng m&ocirc;i b&aacute;n chạy nhất tr&ecirc;n thị trường. Sản phẩm c&oacute; chứa s&aacute;p ong, dầu kho&aacute;ng v&agrave; vitamin E gi&uacute;p dưỡng ẩm, chống kh&ocirc; nứt m&ocirc;i v&agrave; mang lại cho m&ocirc;i m&agrave;u hồng tự nhi&ecirc;n</p>\r\n', 100, 0, 100000, 5, '', 12, '2023-12-17', 0),
(142, 'Kem dưỡng môi Lanolips 101 Ointment', '20231217165520images (5).jpg', '<p>Kem dưỡng m&ocirc;i Lanolips 101 Ointment l&agrave; một sản phẩm kem dưỡng m&ocirc;i c&oacute; khả năng dưỡng ẩm s&acirc;u, gi&uacute;p m&ocirc;i mềm mịn v&agrave; căng mọng. Sản phẩm c&oacute; chứa lanolin nguy&ecirc;n chất gi&uacute;p kh&oacute;a ẩm v&agrave; bảo vệ m&ocirc;i khỏi kh&ocirc; nứt.</p>\r\n', 100, 0, 300000, 0, '', 12, '2023-12-17', 0),
(143, 'Cọ nền Real Techniques Expert Face Brush', '20240326052633a3.jpg', '<p>LigoWave LigoDLB 5-15ac th&igrave; thiết bị thu ph&aacute;t wifi kết nối điểm - điểm - đa điểm của h&atilde;ng Ligowave đến từ Mỹ, với g&oacute;c ph&aacute;t 35&deg;, c&ocirc;ng suất mạng, đ&aacute;p ứng khoảng c&aacute;ch kết nối l&ecirc;n đến 5km trong điều kiện th&ocirc;ng tho&aacute;ng.</p>\r\n\r\n<p>LigoWave LigoDLB 5-15ac được ứng dụng lắp đặt để truyền dẫn hệ thống camera, Lan... cho c&aacute;c khu c&ocirc;ng nghiệp, đồi n&uacute;i, khu c&ocirc;ng nghiệp, hoặc lắp đặt truyền dẫn camera trong thang m&aacute;y của c&aacute;c t&ograve;a nh&agrave; cao tầng.</p>\r\n\r\n<p>Hiện nay, bộ thu ph&aacute;t wifi&nbsp;<strong>LigoWave LigoDLB 5-15ac</strong>&nbsp;đang được&nbsp;<a href=\"https://viettuans.vn/\" style=\"box-sizing: border-box; background-color: transparent; color: rgb(19, 134, 223); text-decoration-line: none; border: 0px none; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: none 0px; padding: 0px; vertical-align: baseline;\">Việt Tuấn</a>&nbsp;nh&agrave; ph&acirc;n phối ủy quyền ch&iacute;nh h&atilde;ng của&nbsp;<strong><a href=\"https://viettuans.vn/thuong-hieu/ligowave\" style=\"box-sizing: border-box; background-color: transparent; color: rgb(19, 134, 223); text-decoration-line: none; border: 0px none; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: none 0px; padding: 0px; vertical-align: baseline;\">LigoWave</a>&nbsp;Mỹ</strong>, bảo h&agrave;nh 12 th&aacute;ng, đầy đủ CO/ CQ cho đại l&yacute;, dự &aacute;n, hỗ trợ kỹ thuật chuy&ecirc;n nghiệp.</p>\r\n', 100, 0, 250000, 0, '', 7, '2023-12-17', 0),
(144, 'Bộ phát Wifi LigoWave LigoDLB 5-90ac 5GHz Station ', '20240326052652a2.jpg', '<p>M&uacute;t t&aacute;n kem nền Beauty Blender l&agrave; một m&uacute;t t&aacute;n kem nền được đ&aacute;nh gi&aacute; cao bởi khả năng t&aacute;n đều kem nền, gi&uacute;p lớp nền mịn m&agrave;ng v&agrave; tự nhi&ecirc;n. M&uacute;t c&oacute; thiết kế mềm mại, gi&uacute;p t&aacute;n kem nền dễ d&agrave;ng v&agrave; kh&ocirc;ng bị v&oacute;n cục.</p>\r\n', 100, 0, 500000, 10, '', 7, '2023-12-17', 0),
(145, 'Bộ phát Wifi LigoWave NFT2ac', '202403260513402ac.jpg', '<p>LigoWave NFT 2AC l&agrave; bộ ph&aacute;t wifi 2 băng tần trong nh&agrave; d&ugrave;ng cho văn ph&ograve;ng, doanh nghiệp, trường học đến từ h&atilde;ng Ligowave của Mỹ, với khả năng đ&aacute;p ứng l&ecirc;n đến 100 kết nối đồng thời.</p>\r\n\r\n<p>LigoWave NFT 2AC l&agrave; một trong những lựa chọn h&agrave;ng đầu của kh&aacute;ch h&agrave;ng khi lắp đặt thi c&ocirc;ng, n&acirc;ng cấp hệ thống mạng.</p>\r\n\r\n<p>Hiện nay, bộ thu ph&aacute;t wifi&nbsp;<strong>LigoWave NFT 2AC</strong>&nbsp;đang được nh&agrave; ph&acirc;n phối ủy quyền ch&iacute;nh h&atilde;ng của&nbsp;<strong><a href=\"https://viettuans.vn/thuong-hieu/ligowave\" style=\"box-sizing: border-box; background-color: transparent; color: rgb(19, 134, 223); text-decoration-line: none; border: 0px none; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: none 0px; padding: 0px; vertical-align: baseline;\">LigoWave</a>&nbsp;Mỹ</strong>, bảo h&agrave;nh 12 th&aacute;ng, đầy đủ CO/ CQ cho đại l&yacute;, dự &aacute;n, hỗ trợ kỹ thuật chuy&ecirc;n nghiệp.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 100, 0, 300000, 0, '', 7, '2023-12-17', 0),
(146, 'Kẹp bấm mi Shiseido Eyelash Curler ', '20231217165930images (9).jpg', '<p>Kẹp bấm mi Shiseido Eyelash Curler l&agrave; một kẹp bấm mi được đ&aacute;nh gi&aacute; cao bởi khả năng uốn cong mi hiệu quả, gi&uacute;p mi cong v&uacute;t v&agrave; quyến rũ. Kẹp c&oacute; thiết kế nhỏ gọn, gi&uacute;p dễ d&agrave;ng thao t&aacute;c.</p>\r\n', 100, 0, 500000, 0, '', 10, '2023-12-17', 0),
(147, 'Dán kích mí Innisfree Skinny Twin Eyelid Tape ', '20231217170129images (10).jpg', '<p>D&aacute;n k&iacute;ch m&iacute; Innisfree Skinny Twin Eyelid Tape l&agrave; một sản phẩm d&aacute;n k&iacute;ch m&iacute; được đ&aacute;nh gi&aacute; cao bởi khả năng b&aacute;m d&iacute;nh tốt, gi&uacute;p tạo hiệu ứng mắt hai m&iacute; r&otilde; n&eacute;t. D&aacute;n c&oacute; thiết kế mỏng nhẹ, kh&ocirc;ng g&acirc;y kh&oacute; chịu khi sử dụng.</p>\r\n', 100, 0, 150000, 0, '', 11, '2023-12-17', 0),
(148, 'Dao cạo mày Innisfree Precision Eyebrow Razor', '20231217170208images (11).jpg', '<p>Dao cạo m&agrave;y Innisfree Precision Eyebrow Razor l&agrave; một sản phẩm dao cạo m&agrave;y được đ&aacute;nh gi&aacute; cao bởi khả năng cạo l&ocirc;ng m&agrave;y hiệu quả, gi&uacute;p tạo d&aacute;ng l&ocirc;ng m&agrave;y chuẩn x&aacute;c. Dao c&oacute; thiết kế nhỏ gọn, gi&uacute;p dễ d&agrave;ng thao t&aacute;c</p>\r\n', 100, 0, 150000, 0, '', 15, '2023-12-17', 0),
(149, 'Son Kem Lì 3CE ', '20240521185559son2.jpg', '<p>?Color ?</p>\r\n\r\n<p>STICK AROUND</p>\r\n\r\n<p>PULL OFF</p>\r\n\r\n<p>STAY AWAY</p>\r\n\r\n<p>CLARET</p>\r\n\r\n<p>START NOW</p>\r\n\r\n<p>CHAPTER PINK</p>\r\n\r\n<p>SO OVER</p>\r\n\r\n<p>DELICATE SOUL</p>\r\n\r\n<p>NUDE SCENE</p>\r\n\r\n<p>BEARBERRY</p>\r\n', 100, 0, 3850000, 5, '', 3, '2024-03-26', 0),
(150, 'Son bóng Dearmay La Piste Fairy Garden Lip Gloss', '20240521185305son1.jfif', '<p>Son b&oacute;ng Dearmay Fairy Garden Lip Gloss La Piste Lip Tint 4.1g</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Son b&oacute;ng Dearmay Fairy Garden Lip Gloss La Piste Lip Tint đ&atilde; trở lại với phi&ecirc;n bản giới hạn, mang đến một khu vườn cổ t&iacute;ch tuyệt đẹp, nơi được trang tr&iacute; bằng hoa, &aacute;nh đ&egrave;n cổ t&iacute;ch v&agrave; những yếu tố thần ti&ecirc;n. M&agrave;u sắc của son b&oacute;ng lần n&agrave;y lấy cảm hứng từ vẻ đẹp vẻ đẹp của lo&agrave;i hoa khi nở v&agrave; sự thần b&iacute; của những d&ograve;ng d&acirc;y leo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Concept lần n&agrave;y l&agrave; sự giao thoa giữa m&ugrave;a Đ&ocirc;ng v&agrave; m&ugrave;a Xu&acirc;n, tạo n&ecirc;n một kh&ocirc;ng gian thần ti&ecirc;n đầy huyền ảo, ho&agrave;n hảo cho những ng&agrave;y đầu năm. H&atilde;y để Fairy Garden Lip Gloss đưa bạn v&agrave;o một h&agrave;nh tr&igrave;nh thần b&iacute; lấp l&aacute;nh như những c&acirc;u chuyện cổ t&iacute;ch.</p>\r\n', 100, 0, 3740000, 5, '', 3, '2024-03-26', 0),
(151, 'Thiết bị lưu trữ NAS QNAP TS-233', '20240326055113t1.jpg', '<p><em><strong>QNAP TS-233</strong>&nbsp;l&agrave; thiết bị lưu trữ NAS 2 bay ch&iacute;nh h&atilde;ng QNAP, được thiết kế d&agrave;nh cho c&aacute;c đối tượng người d&ugrave;ng c&aacute; nh&acirc;n, gia đ&igrave;nh v&agrave; c&aacute;c doanh nghiệp quy m&ocirc; nhỏ - vừa. Với thiết kế nhỏ gọn, cấu tr&uacute;c chắc chắn với độ ho&agrave;n thiện chi tiết tốt, TS-233 c&oacute; thể đặt ở bất cứ đ&acirc;u trong văn ph&ograve;ng của bạn. Thiết bị cung cấp cho người d&ugrave;ng khả năng quản l&yacute; dữ liệu tập trung, sao lưu v&agrave; chia sẻ cho nhiều người d&ugrave;ng trong mạng. Nếu bạn đọc đang t&igrave;m kiếm một thiết bị lưu trữ tập trung dữ liệu quan trọng d&agrave;nh cho doanh nghiệp hay một trung t&acirc;m giải tr&iacute; đa phương tiện cho gia đ&igrave;nh, chắc chắn rằng QNAP TS-233 sẽ l&agrave; lựa chọn đ&aacute;ng để đầu tư.</em></p>\r\n', 100, 0, 5000000, 10, '', 8, '2024-03-26', 0),
(152, 'Thiết bị lưu trữ NAS QNAP TS-431X3-4G', '20240326055322t2.jpg', '<p><strong>QNAP TS-431X3-4G</strong>&nbsp;cung cấp bốn khay ổ cứng để lưu trữ dung lượng cao với bộ nhớ mở rộng l&ecirc;n đến 8GB RAM để đ&aacute;p ứng nhu cầu sao lưu, kh&ocirc;i phục v&agrave; lưu trữ ảo h&oacute;a của doanh nghiệp SMB. Cổng 10GbE SFP+ t&iacute;ch hợp cung cấp băng th&ocirc;ng cao để truyền dữ liệu chuy&ecirc;n s&acirc;u. C&ugrave;ng với switch QNAP 10GbE, bạn c&oacute; thể x&acirc;y dựng m&ocirc;i trường mạng 10GbE tốc độ cao.</p>\r\n', 100, 0, 6000000, 25, '', 8, '2024-03-26', 0),
(153, 'Thiết bị lưu trữ NAS QNAP TBS-464-8G', '20240326055459t3.jpg', '<p><strong>QNAP TBS-464-8G</strong>&nbsp;l&agrave; thiết bị lưu trữ NAS dạng book với thiết kế mỏng, nhỏ gọn, c&oacute; thể đặt ở bất cứ đ&acirc;u như tr&ecirc;n b&agrave;n l&agrave;m việc, kệ tivi, ph&ograve;ng họp...</p>\r\n\r\n<p>Ngo&agrave;i t&iacute;nh năng ch&iacute;nh l&agrave; sao lưu/chia sẻ dữ liệu tốc độ cao với cổng mạng 2.5GbE,&nbsp;<a href=\"https://viettuans.vn/thiet-bi-luu-tru-nas-qnap-tbs-464-8g\" style=\"box-sizing: border-box; background-color: transparent; color: rgb(19, 134, 223); text-decoration-line: none; border: 0px none; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: none 0px; padding: 0px; vertical-align: baseline;\"><strong>TSB-464-8G</strong></a>&nbsp;c&ograve;n được trang bị 2 cổng HDMI để xuất h&igrave;nh ảnh họp trực tuyến, giải tr&iacute; đa phương tiện, gi&aacute;m s&aacute;t h&igrave;nh ảnh camera.</p>\r\n', 100, 0, 6000000, 30, '', 8, '2024-03-26', 0),
(154, 'Phấn Bắt Sáng - Wood', '20240521185144o3.jpg', '<p>Phấn Bắt S&aacute;ng Wood Wood✔ N&ecirc;́u tạo kh&ocirc;́i là m&ocirc;̣t bước trang đi&ecirc;̉m quan trọng, giúp cho gương mặt trở n&ecirc;n thon gọn, sắc nét thì bắt sáng cũng là 1 bước quan trọng kh&ocirc;ng kém vì nó giúp những đường nét thon gọn trở n&ecirc;n n&ocirc;̉i b&acirc;̣t.</p>\r\n', 100, 0, 2550000, 0, '', 5, '2024-03-26', 0),
(155, 'Phấn Nước YSL', '20240521184910phan2.jpg', '<h2>??Cushion YSL bản viền bạc mới ra (vỏ l&igrave; nh&aacute;m) ph&ugrave; hợp da dầu, hỗn hợp thi&ecirc;n dầu, da c&oacute; khuyết điểm. Lớp nền mang hiệu ứng b&aacute;n l&igrave;. Kiềm dầu tốt, che phủ cao hơn bản truyền thống. Bản mới &iacute;t glow hơn, l&igrave; matte hơn, rất bền m&agrave;u. Sau khi apply th&igrave; kh&ocirc; r&aacute;o, tệp mịn da cực đẹp.</h2>\r\n', 100, 0, 2250000, 0, '', 5, '2024-03-26', 0),
(156, 'Phấn Phủ Maybelline ', '20240521184721phan1.jpg', '<h2>Loại da ph&ugrave; hợp:</h2>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Sản phẩm ph&ugrave; hợp cho da thường, da hỗn hợp,&nbsp;<a href=\"https://hasaki.vn/danh-muc/dau-thua-lo-chan-long-to-c1879.html\" style=\"box-sizing: border-box; background-color: transparent; text-decoration-line: none; outline: 0px; font-weight: bold; color: rgb(0, 100, 0) !important;\" target=\"_blank\">da dầu</a>.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h2>Giải ph&aacute;p cho t&igrave;nh trạng da:</h2>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Da&nbsp;dầu nhờn&nbsp;nhiều, khi trang điểm thường gặp vấn đề lớp nền xỉn m&agrave;u v&agrave; nhanh tr&ocirc;i.</p>\r\n	</li>\r\n	<li>\r\n	<p>Da c&oacute; c&aacute;c khuyết điểm như&nbsp;da sạm, xỉn m&agrave;u, da kh&ocirc;ng đều m&agrave;u, vết th&acirc;m do&nbsp;<a href=\"https://hasaki.vn/danh-muc/mun-c1877.html\" style=\"box-sizing: border-box; background-color: transparent; text-decoration-line: none; outline: 0px; font-weight: bold; color: rgb(0, 100, 0) !important;\" target=\"_blank\">mụn</a>, lỗ ch&acirc;n l&ocirc;ng to,...</p>\r\n	</li>\r\n</ul>\r\n\r\n<h2>Ưu thế nổi bật:</h2>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Độ che phủ từ trung b&igrave;nh - cao</strong>, gi&uacute;p che phủ hiệu quả c&aacute;c khuyết điểm tr&ecirc;n da, đặc biệt l&agrave; lỗ ch&acirc;n l&ocirc;ng to.</p>\r\n	</li>\r\n	<li>\r\n	<p>C&ocirc;ng nghệ Micro Powder độc quyền, hạt phấn si&ecirc;u nhỏ, phủ đều tr&ecirc;n da gi&uacute;p che phủ mọi khuyết điểm v&agrave; tạo hiệu ứng 3D mịn m&agrave;ng ho&agrave;n hảo.</p>\r\n	</li>\r\n	<li>\r\n	<p>Giữ m&agrave;u v&agrave; kiềm dầu l&ecirc;n đến&nbsp;<strong>16H</strong>&nbsp;v&agrave; kh&ocirc;ng xuống t&ocirc;ng.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Chỉ số chống nắng&nbsp;SPF32 PA+++</strong>&nbsp;gi&uacute;p&nbsp;bảo vệ da trước t&aacute;c hại của tia UV.</p>\r\n	</li>\r\n	<li>\r\n	<p>Hộp phấn c&oacute; thiết kế h&igrave;nh tr&ograve;n nhỏ gọn, dễ d&agrave;ng mang theo b&ecirc;n người, tiện lợi cho bạn dặm lại nền mọi l&uacute;c mọi nơi.</p>\r\n	</li>\r\n	<li>\r\n	<p>C&oacute;&nbsp;5 t&ocirc;ng m&agrave;u ph&ugrave; hợp với l&agrave;n da ch&acirc;u &Aacute;.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h2>C&ocirc;ng dụng:</h2>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Tạo lớp nền mịn, nhẹ, kh&ocirc;ng b&oacute;ng dầu, tiệp mọi t&ocirc;ng da.</p>\r\n	</li>\r\n	<li>\r\n	<p>Lớp nền được kh&oacute;a lại tr&ecirc;n da với độ b&aacute;m m&agrave;u cao v&agrave; kh&ocirc;ng bị mốc.</p>\r\n	</li>\r\n	<li>\r\n	<p>Chống nắng bảo vệ da tối ưu v&agrave; kh&ocirc;ng lo xuống t&ocirc;ng.</p>\r\n	</li>\r\n</ul>\r\n', 100, 0, 2750000, 25, '', 5, '2024-03-26', 0),
(157, 'Kem Dưỡng Ẩm Wellage Real Hyaluronic', '20240521184532am3.jpg', '<p><strong>Th&agrave;nh phần ch&iacute;nh</strong></p>\r\n\r\n<p>- Centella Asiatica Extract v&agrave; Madecassoside:&nbsp;Gi&uacute;p l&agrave;m dịu da, giảm mẩn đỏ v&agrave; k&iacute;ch ứng.</p>\r\n\r\n<p>- Nano Ceramide + B5:&nbsp;Cung cấp độ ẩm v&agrave; giữ ẩm l&acirc;u d&agrave;i cho da, củng cố h&agrave;ng r&agrave;o bảo vệ da.</p>\r\n\r\n<p>- Chiết xuất quả lựu:&nbsp;Chứa vitamin C v&agrave; chất chống oxy h&oacute;a, hỗ trợ l&agrave;m s&aacute;ng da v&agrave; chống l&atilde;o h&oacute;a.</p>\r\n\r\n<p>- Chiết xuất c&acirc;y tầm ma:&nbsp;L&agrave;m dịu da, giảm k&iacute;ch ứng.</p>\r\n', 100, 0, 170000, 5, '', 6, '2024-03-26', 0),
(158, 'Kem dưỡng Neutrogena water gel', '20240521184402am2.jpg', '<p><strong>Loại da ph&ugrave; hợp</strong></p>\r\n\r\n<p>- Sản phẩm ph&ugrave; hợp cho da từ thường đến dầu.</p>\r\n\r\n<p>- Da kh&ocirc; thiếu ẩm hoặc da dầu thiếu nước.</p>\r\n\r\n<p>- Da&nbsp;dầu thừa - lỗ ch&acirc;n l&ocirc;ng to, kh&ocirc;ng th&iacute;ch cảm gi&aacute;c nhờn d&iacute;nh khi sử dụng kem dưỡng ẩm.</p>\r\n\r\n<p><strong>Th&agrave;nh phần ch&iacute;nh</strong></p>\r\n\r\n<p>- Hyaluronic Acid: Chứa c&aacute;c hạt ph&acirc;n tử nước si&ecirc;u nhỏ, thẩm thấu s&acirc;u v&agrave;o c&aacute;c lỗ ch&acirc;n l&ocirc;ng, đem lại cảm gi&aacute;c tươi m&aacute;t v&agrave; căng mượt cho l&agrave;n da suốt 48 giờ.&nbsp;</p>\r\n\r\n<p>- Chiết xuất Olive: Hạn chế sự mất nước, cung cấp acid b&eacute;o, vitamin E gi&uacute;p bảo vệ v&agrave; cải thiện l&agrave;n da từ s&acirc;u b&ecirc;n trong.&nbsp;</p>\r\n\r\n<p>- Glycerin: hydrat ho&aacute; lớp sừng ngo&agrave;i c&ugrave;ng gi&uacute;p cấp ẩm v&agrave; kho&aacute; ẩm tối ưu cho l&agrave;n da, từ đ&oacute;, mang tới một l&agrave;n da s&aacute;ng khỏe, ẩm mịn v&agrave; đều m&agrave;u.</p>\r\n\r\n<p><strong>C&ocirc;ng dụng</strong></p>\r\n\r\n<p>- L&agrave;m dịu da, se kh&iacute;t lỗ ch&acirc;n l&ocirc;ng hiệu quả.</p>\r\n\r\n<p>- Duy tr&igrave; l&agrave;n da ẩm mượt, đẩy l&ugrave;i t&igrave;nh trạng kh&ocirc; căng, nứt nẻ cho da v&agrave;o m&ugrave;a hanh kh&ocirc;.</p>\r\n\r\n<p>- Tăng độ đ&agrave;n hồi, ngăn ngừa c&aacute;c dấu hiệu l&atilde;o ho&aacute; da.</p>\r\n\r\n<p>- Bổ sung dưỡng chất để chăm s&oacute;c v&agrave; nu&ocirc;i dưỡng l&agrave;n da từ s&acirc;u b&ecirc;n trong.</p>\r\n\r\n<p>- Tăng cường h&agrave;ng r&agrave;o bảo vệ da khỏi c&aacute;c t&aacute;c nh&acirc;n g&acirc;y hại từ m&ocirc;i trường b&ecirc;n ngo&agrave;i.</p>\r\n\r\n<p>- Kho&aacute; ẩm, duy tr&igrave; độ ẩm tự nhi&ecirc;n để l&agrave;n da lu&ocirc;n tươi tắn, ẩm mịn.</p>\r\n', 110, 0, 50000, 0, '', 6, '2024-03-26', 0),
(159, 'Kem Dưỡng Ẩm Làm Dịu Da Torriden Dive In Hyaluroni', '20240521184237am1.jpg', '<p><strong>Th&agrave;nh phần ch&iacute;nh :</strong></p>\r\n\r\n<p>- Hyaluronic Acid : Phức hợp 5D c&oacute; trọng lượng ph&acirc;n tử thấp</p>\r\n\r\n<p>- Panthenol &amp; Allantoin : Giữ ẩm v&agrave; l&agrave;m dịu da</p>\r\n\r\n<p>- Kem dưỡng da dạng gel gi&uacute;p l&agrave;m m&aacute;t v&agrave; dịu da</p>\r\n\r\n<p><strong>Loại da ph&ugrave; hợp :</strong></p>\r\n\r\n<p>Da kh&ocirc;, da dầu, da hỗn hợp, da nhạy cảm</p>\r\n\r\n<p><strong>C&ocirc;ng dụng :</strong></p>\r\n\r\n<p>- Cấp ẩm v&agrave; dưỡng chất cho da.</p>\r\n\r\n<p>- Tăng cường độ đ&agrave;n hồi cho da.</p>\r\n\r\n<p>- L&agrave;m s&aacute;ng v&agrave; đều m&agrave;u da.</p>\r\n\r\n<p>- Giảm vi&ecirc;m v&agrave; k&iacute;ch ứng da.</p>\r\n\r\n<p>- &nbsp;T&aacute;i tạo v&agrave; phục hồi da.</p>\r\n\r\n<p>- Dịu nhẹ, an to&agrave;n cho cả những l&agrave;n da nhạy cảm.</p>\r\n', 100, 0, 500000, 0, '299.000', 6, '2024-03-26', 0),
(160, 'Nước Tẩy Trang La Roche-Posay', '20240521184037tay3.jpg', '<h2>Loại da ph&ugrave; hợp:</h2>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Sản phẩm ph&ugrave; hợp cho da thường v&agrave;&nbsp;<a href=\"https://hasaki.vn/danh-muc/da-nhay-cam-c20.html\" style=\"box-sizing: border-box; background-color: transparent; text-decoration-line: none; outline: 0px; font-weight: bold; color: rgb(0, 100, 0) !important;\" target=\"_blank\"><strong>da nhạy cảm</strong></a>.</p>\r\n	</li>\r\n	<li>\r\n	<p>Ph&ugrave; hợp để tẩy trang cho v&ugrave;ng mặt, mắt v&agrave; m&ocirc;i.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h2>Giải ph&aacute;p cho t&igrave;nh trạng da:</h2>\r\n\r\n<ul>\r\n	<li>\r\n	<p><a href=\"https://hasaki.vn/danh-muc/nhay-cam-kich-ung-c1885.html\" style=\"box-sizing: border-box; background-color: transparent; text-decoration-line: none; outline: 0px; font-weight: bold; color: rgb(0, 100, 0) !important;\" target=\"_blank\">Da nhạy cảm - k&iacute;ch ứng</a></p>\r\n	</li>\r\n	<li>\r\n	<p>Da thiếu nước - thiếu ẩm</p>\r\n	</li>\r\n</ul>\r\n\r\n<h2>C&ocirc;ng dụng:</h2>\r\n\r\n<ul>\r\n	<li>\r\n	<p>C&ocirc;ng nghệ đột ph&aacute;<strong>&nbsp;Glyco Micellar</strong>&nbsp;mang lại hiệu quả l&agrave;m sạch s&acirc;u vượt trội gi&uacute;p lấy đi bụi bẩn, b&atilde; nhờn v&agrave; lớp trang điểm nhưng vẫn an to&agrave;n cho l&agrave;n da nhạy cảm.</p>\r\n	</li>\r\n	<li>\r\n	<p>L&agrave;m sạch đến 99% lớp trang điểm, 70% mascara v&agrave; c&aacute;c hạt bụi si&ecirc;u nhỏ c&oacute; trong kh&oacute;i xe v&agrave; m&ocirc;i trường &ocirc; nhiễm chỉ sau một lượt b&ocirc;ng cotton*.</p>\r\n	</li>\r\n	<li>\r\n	<p>Chứa<strong>&nbsp;nước kho&aacute;ng La Roche-Posay</strong>&nbsp;c&oacute; nồng độ Selenium tự nhi&ecirc;n cao, với đặc t&iacute;nh l&agrave;m dịu da, giảm k&iacute;ch ứng v&agrave; chống oxi h&oacute;a,&nbsp;gi&uacute;p bảo vệ da trước m&ocirc;i trường &ocirc; nhiễm.</p>\r\n	</li>\r\n	<li>\r\n	<p>Cung cấp độ ẩm với&nbsp;<strong>Glycerin,&nbsp;</strong>giảm thiểu ma s&aacute;t g&acirc;y tổn thương da trong qu&aacute; tr&igrave;nh l&agrave;m sạch.</p>\r\n	</li>\r\n	<li>\r\n	<p>Mang lại l&agrave;n da sạch mịn m&agrave;ng, tho&aacute;ng nhẹ sau khi sử dụng.</p>\r\n	</li>\r\n</ul>\r\n', 100, 0, 570000, 20, '', 4, '2024-03-26', 0),
(161, 'Nước Tẩy Trang Bioderma Dành Cho Da Nhạy Cảm ', '20240521183902tay2.jpg', '<p><a href=\"https://hasaki.vn/danh-muc/da-nhay-cam-c20.html\" style=\"box-sizing: border-box; background-color: transparent; text-decoration-line: none; outline: 0px; font-weight: bold; color: rgb(0, 100, 0) !important;\" target=\"_blank\">Da nhạy cảm</a>&nbsp;đến da kh&ocirc;ng dung nạp kh&ocirc;ng thể thực hiện vai tr&ograve; của m&igrave;nh như một h&agrave;ng r&agrave;o bảo vệ chống lại c&aacute;c t&aacute;c nh&acirc;n g&acirc;y k&iacute;ch ứng. Lớp trang điểm, việc tẩy trang, sự &ocirc; nhiễm, c&aacute;c t&aacute;c động từ b&ecirc;n ngo&agrave;i khiến l&agrave;n da bị yếu đi v&agrave; trở n&ecirc;n kh&ocirc; căng ng&agrave;y n&agrave;y qua ng&agrave;y kh&aacute;c. Da nhạy cảm biểu hiện th&ocirc;ng qua cảm gi&aacute;c n&oacute;ng, kh&oacute; chịu v&agrave; mẩn đỏ lan rộng hoặc cục bộ. Da dễ bị mất nước v&agrave; t&igrave;nh trạng da kh&ocirc; k&eacute;o d&agrave;i sẽ tự động duy tr&igrave; độ mỏng manh của l&agrave;n da, dẫn đến cảm gi&aacute;c kh&ocirc; căng kh&oacute; chịu. T&igrave;nh trạng da nhạy cảm qu&aacute; mức c&oacute; thể chỉ xảy ra tạm thời hoặc vĩnh viễn.</p>\r\n\r\n<p>C&ocirc;ng nghệ micellar sử dụng c&aacute;c hạt micelles &quot;thần k&igrave;&quot; tương th&iacute;ch ho&agrave;n hảo với lớp lipid tự nhi&ecirc;n của da.&nbsp;Yếu tố cấu th&agrave;nh n&ecirc;n hạt micelle l&agrave; c&aacute;c ester acid b&eacute;o, tương tự như cấu tr&uacute;c lớp phospholipid của m&agrave;ng tế b&agrave;o da, gi&uacute;p t&aacute;i tạo lớp m&agrave;ng hydrolipid của da một c&aacute;ch tự nhi&ecirc;n. Nhờ v&agrave;o cấu tr&uacute;c n&agrave;y, c&aacute;c hạt micelle sẽ&nbsp;gi&uacute;p lấy đi c&aacute;c yếu tố c&oacute; hại cho l&agrave;n da như:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>98% bụi si&ecirc;u mịn khỏi bề mặt da v&agrave; s&acirc;u b&ecirc;n trong lỗ ch&acirc;n l&ocirc;ng.</p>\r\n	</li>\r\n	<li>\r\n	<p>78% kim loại nặng v&agrave; độc tố g&acirc;y hại.</p>\r\n	</li>\r\n	<li>\r\n	<p>99% lớp trang điểm s&acirc;u b&ecirc;n trong.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n', 100, 0, 500000, 0, '', 4, '2024-03-26', 0),
(162, 'Tẩy Trang Derladie Sạch Sâu', '20240521183731tay1.jpg', '<h2>Đối tượng sử dụng:&nbsp;</h2>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Th&iacute;ch hợp sử dụng với mọi l&agrave;n da, đặc biệt l&agrave; da dầu mụn.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h2>Ưu thế nổi bật:</h2>\r\n\r\n<p>CƠ CHẾ SẠCH S&Acirc;U:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>C&ocirc;ng nghệ Micellar l&agrave;m sạch s&acirc;u 89.9% bụi bẩn, b&atilde; nhờn, dầu thừa tr&ecirc;n bề mặt da, ngăn ngừa mụn ẩn, mụn t&aacute;i ph&aacute;t</p>\r\n	</li>\r\n	<li>\r\n	<p>C&ocirc;ng nghệ Ultra-Astringent ph&acirc;n t&aacute;ch hoạt chất th&agrave;nh ph&acirc;n tử nano, h&uacute;t sạch dầu thừa bụi mịn PM2.5, kiểm so&aacute;t dầu thừa, se da v&agrave; cải thiện lỗ ch&acirc;n l&ocirc;ng.&nbsp;</p>\r\n	</li>\r\n	<li>\r\n	<p>AHA + BHA loại bỏ tế b&agrave;o chết, kh&aacute;ng khuẩn, ti&ecirc;u vi&ecirc;m, hỗ trợ ngừa v&agrave; giảm mụn hiệu quả.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>CƠ CHẾ DỊU MỤN:&nbsp;</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>12.68% Propanediol v&agrave; 12 chiết xuất thảo dược tự nhi&ecirc;n H&agrave;n Quốc (c&acirc;y phỉ, tre v&agrave;ng, oải hương, rau m&aacute;, c&uacute;c la m&atilde;, tr&agrave;m tr&agrave;, sen hồng, l&ocirc; hội, rau sam, hương thảo, x&ocirc; thơm, nấm tuyết) gi&uacute;p l&agrave;m dịu da, giảm k&iacute;ch ứng, phục hồi v&agrave; duy tr&igrave; l&agrave;n da khỏe mạnh.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>CƠ CHẾ &Ecirc;M DA:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>5.21% Coco Betaine v&agrave; Disodium Cocoamphodiacetate (hoạt chất l&agrave;m sạch từ gốc dầu dừa) tạo bọt, hạn chế ma s&aacute;t, củng cố h&agrave;ng r&agrave;o ẩm của da.&nbsp;</p>\r\n	</li>\r\n</ul>\r\n', 100, 0, 400000, 10, '', 4, '2024-03-26', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD PRIMARY KEY (`id_hdct`);

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`madm`);

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`mahd`);

--
-- Chỉ mục cho bảng `hotro`
--
ALTER TABLE `hotro`
  ADD PRIMARY KEY (`idht`);

--
-- Chỉ mục cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`idnd`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`idsp`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  MODIFY `id_hdct` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `madm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `mahd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `hotro`
--
ALTER TABLE `hotro`
  MODIFY `idht` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `idnd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `idsp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
