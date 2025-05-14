-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: cinema
-- ------------------------------------------------------
-- Server version	8.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chi_tiet_giao_dich`
--
drop database rap_phim_online;
create database rap_phim_online;
use rap_phim_online;

DROP TABLE IF EXISTS `chi_tiet_giao_dich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chi_tiet_giao_dich` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ghi_chu` text,
  `gia_tien` decimal(10,2) DEFAULT NULL,
  `giam_gia` decimal(10,2) DEFAULT NULL,
  `giao_dich_id` int NOT NULL,
  `ve_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKc2pvbhvsynd9411cl2mjxfffm` (`giao_dich_id`,`ve_id`),
  KEY `FKst8eym9mf0l61fvxoogfbsnoo` (`ve_id`),
  CONSTRAINT `FKd88pmeh3sh8rpnmkeqctb59l1` FOREIGN KEY (`giao_dich_id`) REFERENCES `giao_dich` (`id`),
  CONSTRAINT `FKst8eym9mf0l61fvxoogfbsnoo` FOREIGN KEY (`ve_id`) REFERENCES `ve` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_giao_dich`
--

LOCK TABLES `chi_tiet_giao_dich` WRITE;
/*!40000 ALTER TABLE `chi_tiet_giao_dich` DISABLE KEYS */;
/*!40000 ALTER TABLE `chi_tiet_giao_dich` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghe`
--

DROP TABLE IF EXISTS `ghe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ghe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cot` varchar(5) NOT NULL,
  `hang` varchar(5) NOT NULL,
  `loai_ghe` varchar(10) DEFAULT NULL,
  `ten` varchar(20) NOT NULL,
  `trang_thai` varchar(20) DEFAULT NULL,
  `phong_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKc4kqjj079yf8ddd8qfnwt3rig` (`phong_id`,`hang`,`cot`),
  CONSTRAINT `FKaxclpao41fhb6xe0o5fby3nnh` FOREIGN KEY (`phong_id`) REFERENCES `phong` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghe`
--

LOCK TABLES `ghe` WRITE;
/*!40000 ALTER TABLE `ghe` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giao_dich`
--

DROP TABLE IF EXISTS `giao_dich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giao_dich` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ghi_chu` text,
  `giam_gia` decimal(10,2) DEFAULT NULL,
  `ma_giao_dich` varchar(255) NOT NULL,
  `ma_qr` varchar(255) DEFAULT NULL,
  `phuong_thuc` varchar(20) NOT NULL,
  `thanh_tien` decimal(10,2) DEFAULT NULL,
  `thoi_gian` datetime(6) NOT NULL,
  `tong_tien` decimal(12,2) NOT NULL,
  `trang_thai` varchar(20) DEFAULT NULL,
  `khach_hang_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_otwl4pnaikoq46h6gvfleugil` (`ma_giao_dich`),
  KEY `FK631mkm55inrie321lxa06sdxk` (`khach_hang_id`),
  CONSTRAINT `FK631mkm55inrie321lxa06sdxk` FOREIGN KEY (`khach_hang_id`) REFERENCES `khach_hang` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giao_dich`
--

LOCK TABLES `giao_dich` WRITE;
/*!40000 ALTER TABLE `giao_dich` DISABLE KEYS */;
/*!40000 ALTER TABLE `giao_dich` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khach_hang`
--

DROP TABLE IF EXISTS `khach_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khach_hang` (
  `diem_tich_luy` int DEFAULT NULL,
  `hang_thanh_vien` varchar(255) DEFAULT NULL,
  `ma_thanh_vien` varchar(255) DEFAULT NULL,
  `ngay_dang_ky` datetime(6) DEFAULT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FKcp8ph0atqfwjo9itwicv1jxvv` FOREIGN KEY (`id`) REFERENCES `nguoi_dung` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khach_hang`
--

LOCK TABLES `khach_hang` WRITE;
/*!40000 ALTER TABLE `khach_hang` DISABLE KEYS */;
/*!40000 ALTER TABLE `khach_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lich_chieu`
--

DROP TABLE IF EXISTS `lich_chieu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lich_chieu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bat_dau` datetime(6) NOT NULL,
  `gia_ve` decimal(10,2) NOT NULL,
  `ket_thuc` datetime(6) NOT NULL,
  `ngay_lap` datetime(6) NOT NULL,
  `trang_thai` varchar(20) DEFAULT NULL,
  `phim_id` int NOT NULL,
  `phong_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgeu60whua7xe09bv3dh68gjg2` (`phim_id`),
  KEY `FK4bnexj2mlgrtqugrsq2l4byiv` (`phong_id`),
  CONSTRAINT `FK4bnexj2mlgrtqugrsq2l4byiv` FOREIGN KEY (`phong_id`) REFERENCES `phong` (`id`),
  CONSTRAINT `FKgeu60whua7xe09bv3dh68gjg2` FOREIGN KEY (`phim_id`) REFERENCES `phim` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lich_chieu`
--

LOCK TABLES `lich_chieu` WRITE;
/*!40000 ALTER TABLE `lich_chieu` DISABLE KEYS */;
/*!40000 ALTER TABLE `lich_chieu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoi_dung`
--

DROP TABLE IF EXISTS `nguoi_dung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoi_dung` (
  `id` int NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) DEFAULT NULL,
  `dia_chi` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `gioi_tinh` varchar(255) DEFAULT NULL,
  `mat_khau` varchar(255) NOT NULL,
  `ngay_sinh` date DEFAULT NULL,
  `so_dien_thoai` varchar(255) DEFAULT NULL,
  `ten` varchar(255) NOT NULL,
  `thoi_gian_tao` datetime(6) DEFAULT NULL,
  `trang_thai` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_majqh5g4djy2tp3p9dvr64brp` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoi_dung`
--

LOCK TABLES `nguoi_dung` WRITE;
/*!40000 ALTER TABLE `nguoi_dung` DISABLE KEYS */;
/*!40000 ALTER TABLE `nguoi_dung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phim`
--

DROP TABLE IF EXISTS `phim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phim` (
  `id` int NOT NULL AUTO_INCREMENT,
  `danh_gia` float DEFAULT NULL,
  `dao_dien` varchar(100) DEFAULT NULL,
  `dien_vien` varchar(1000) DEFAULT NULL,
  `do_dai` int NOT NULL,
  `do_tuoi` int DEFAULT NULL,
  `hang_sx` varchar(100) DEFAULT NULL,
  `mo_ta` varchar(255) DEFAULT NULL,
  `nam_sx` int DEFAULT NULL,
  `ngon_ngu` varchar(50) NOT NULL,
  `poster` varchar(255) DEFAULT NULL,
  `ten` varchar(255) NOT NULL,
  `the_loai` varchar(100) NOT NULL,
  `trailer` varchar(255) DEFAULT NULL,
  `trang_thai` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phim`
--

LOCK TABLES `phim` WRITE;
/*!40000 ALTER TABLE `phim` DISABLE KEYS */;
/*!40000 ALTER TABLE `phim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phong`
--

DROP TABLE IF EXISTS `phong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phong` (
  `id` int NOT NULL AUTO_INCREMENT,
  `loai_phong` varchar(10) NOT NULL,
  `mo_ta` text,
  `suc_chua` int NOT NULL,
  `ten` varchar(50) NOT NULL,
  `trang_thai` varchar(20) DEFAULT NULL,
  `vi_tri` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phong`
--

LOCK TABLES `phong` WRITE;
/*!40000 ALTER TABLE `phong` DISABLE KEYS */;
/*!40000 ALTER TABLE `phong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ve`
--

DROP TABLE IF EXISTS `ve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ve` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ghi_chu` text,
  `gia` decimal(10,2) NOT NULL,
  `ma_ve` varchar(20) NOT NULL,
  `ngay_tao` datetime(6) DEFAULT NULL,
  `trang_thai` varchar(20) DEFAULT NULL,
  `ghe_id` int NOT NULL,
  `khach_hang_id` int NOT NULL,
  `lich_chieu_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_dv9ebd1x4k3sfor35xj3jhdnu` (`ma_ve`),
  KEY `FKn7ccscrmof64kjs2uih85us4u` (`ghe_id`),
  KEY `FKqrr4cild2ltvo1tby7t95lmft` (`khach_hang_id`),
  KEY `FKffda8py1oktkgduf7jgcwnpom` (`lich_chieu_id`),
  CONSTRAINT `FKffda8py1oktkgduf7jgcwnpom` FOREIGN KEY (`lich_chieu_id`) REFERENCES `lich_chieu` (`id`),
  CONSTRAINT `FKn7ccscrmof64kjs2uih85us4u` FOREIGN KEY (`ghe_id`) REFERENCES `ghe` (`id`),
  CONSTRAINT `FKqrr4cild2ltvo1tby7t95lmft` FOREIGN KEY (`khach_hang_id`) REFERENCES `khach_hang` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ve`
--

LOCK TABLES `ve` WRITE;
/*!40000 ALTER TABLE `ve` DISABLE KEYS */;
/*!40000 ALTER TABLE `ve` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-01 22:57:09

CREATE TABLE lich_chieu_ghe (
                                id INT PRIMARY KEY AUTO_INCREMENT,
                                lich_chieu_id INT NOT NULL,
                                ghe_id INT NOT NULL,
                                trang_thai VARCHAR(20) NOT NULL DEFAULT 'Trống',
                                FOREIGN KEY (lich_chieu_id) REFERENCES lich_chieu(id),
                                FOREIGN KEY (ghe_id) REFERENCES ghe(id),
                                CONSTRAINT unique_lich_chieu_ghe UNIQUE (lich_chieu_id, ghe_id)
);

ALTER TABLE ve DROP FOREIGN KEY FKffda8py1oktkgduf7jgcwnpom;
ALTER TABLE ve DROP FOREIGN KEY FKn7ccscrmof64kjs2uih85us4u;
ALTER TABLE ve DROP COLUMN lich_chieu_id;
ALTER TABLE ve DROP COLUMN ghe_id;
ALTER TABLE ve ADD COLUMN lich_chieu_ghe_id INT NOT NULL;
ALTER TABLE ve ADD CONSTRAINT fk_ve_lich_chieu_ghe FOREIGN KEY (lich_chieu_ghe_id) REFERENCES lich_chieu_ghe(id);

-- Thêm dữ liệu mẫu cho bảng nguoi_dung
INSERT INTO nguoi_dung (id, avatar, dia_chi, email, gioi_tinh, mat_khau, ngay_sinh, so_dien_thoai, ten, thoi_gian_tao, trang_thai) VALUES
                                                                                                                                       (1, 'avatar1.jpg', 'Hà Nội', 'admin@cinema.com', 'Nam', '$2a$10$4QZDzO1M0LCXvZy.DK7wvesFxG/7ib/qY4OjZ.Qn45uI0JlrIQ4HS', '1990-01-15', '0987654321', 'Admin', '2025-01-01 00:00:00', 'Hoạt động'),
                                                                                                                                       (2, 'avatar2.jpg', 'Hồ Chí Minh', 'staff1@cinema.com', 'Nữ', '$2a$10$4QZDzO1M0LCXvZy.DK7wvesFxG/7ib/qY4OjZ.Qn45uI0JlrIQ4HS', '1992-05-20', '0987654322', 'Nhân viên 1', '2025-01-01 00:00:00', 'Hoạt động'),
                                                                                                                                       (3, 'avatar3.jpg', 'Đà Nẵng', 'customer1@gmail.com', 'Nam', '$2a$10$4QZDzO1M0LCXvZy.DK7wvesFxG/7ib/qY4OjZ.Qn45uI0JlrIQ4HS', '1995-06-25', '0987654323', 'Nguyễn Văn A', '2025-01-02 00:00:00', 'Hoạt động'),
                                                                                                                                       (4, 'avatar4.jpg', 'Hải Phòng', 'customer2@gmail.com', 'Nữ', '$2a$10$4QZDzO1M0LCXvZy.DK7wvesFxG/7ib/qY4OjZ.Qn45uI0JlrIQ4HS', '1993-09-10', '0987654324', 'Nguyễn Thị B', '2025-01-03 00:00:00', 'Hoạt động'),
                                                                                                                                       (5, 'avatar5.jpg', 'Huế', 'customer3@gmail.com', 'Nam', '$2a$10$4QZDzO1M0LCXvZy.DK7wvesFxG/7ib/qY4OjZ.Qn45uI0JlrIQ4HS', '1998-12-20', '0987654325', 'Trần Văn C', '2025-01-04 00:00:00', 'Hoạt động');

-- Thêm dữ liệu mẫu cho bảng khach_hang
INSERT INTO khach_hang (id, diem_tich_luy, hang_thanh_vien, ma_thanh_vien, ngay_dang_ky) VALUES
                                                                                             (3, 100, 'Thường', 'KH00001', '2025-01-02 00:00:00'),
                                                                                             (4, 250, 'Bạc', 'KH00002', '2025-01-03 00:00:00'),
                                                                                             (5, 500, 'Vàng', 'KH00003', '2025-01-04 00:00:00');

-- Thêm dữ liệu mẫu cho bảng phong
INSERT INTO phong (id, loai_phong, mo_ta, suc_chua, ten, trang_thai, vi_tri) VALUES
                                                                                 (1, '2D', 'Phòng chiếu phim 2D tiêu chuẩn với 48 ghế ngồi thoải mái', 48, 'Phòng 1', 'Hoạt động', 'Tầng 1'),
                                                                                 (2, '3D', 'Phòng chiếu phim 3D với 48 ghế ngồi và hệ thống âm thanh Dolby', 48, 'Phòng 2', 'Hoạt động', 'Tầng 1');


-- Thêm dữ liệu mẫu cho bảng ghe theo sơ đồ trong hình
-- Phòng 1 - Tạo ghế dựa theo sơ đồ A1-F8
INSERT INTO ghe (id, cot, hang, loai_ghe, ten, trang_thai, phong_id) VALUES
-- Hàng A (1-6)
(1, '1', 'A', 'Thường', 'A1', 'Hoạt động', 1),
(2, '2', 'A', 'Thường', 'A2', 'Hoạt động', 1),
(3, '3', 'A', 'Thường', 'A3', 'Hoạt động', 1),
(4, '4', 'A', 'Thường', 'A4', 'Hoạt động', 1),
(5, '5', 'A', 'Thường', 'A5', 'Hoạt động', 1),
(6, '6', 'A', 'Thường', 'A6', 'Hoạt động', 1),

-- Hàng B (1-8)
(7, '1', 'B', 'Thường', 'B1', 'Hoạt động', 1),
(8, '2', 'B', 'Thường', 'B2', 'Hoạt động', 1),
(9, '3', 'B', 'VIP', 'B3', 'Hoạt động', 1),
(10, '4', 'B', 'VIP', 'B4', 'Hoạt động', 1),
(11, '5', 'B', 'Thường', 'B5', 'Hoạt động', 1),
(12, '6', 'B', 'Thường', 'B6', 'Hoạt động', 1),
(13, '7', 'B', 'Thường', 'B7', 'Hoạt động', 1),
(14, '8', 'B', 'Thường', 'B8', 'Hoạt động', 1),

-- Hàng C (1-8)
(15, '1', 'C', 'Thường', 'C1', 'Hoạt động', 1),
(16, '2', 'C', 'Thường', 'C2', 'Hoạt động', 1),
(17, '3', 'C', 'Thường', 'C3', 'Hoạt động', 1),
(18, '4', 'C', 'Thường', 'C4', 'Hoạt động', 1),
(19, '5', 'C', 'Thường', 'C5', 'Hoạt động', 1),
(20, '6', 'C', 'VIP', 'C6', 'Hoạt động', 1),
(21, '7', 'C', 'VIP', 'C7', 'Hoạt động', 1),
(22, '8', 'C', 'VIP', 'C8', 'Hoạt động', 1),

-- Hàng D (1-8)
(23, '1', 'D', 'Thường', 'D1', 'Hoạt động', 1),
(24, '2', 'D', 'VIP', 'D2', 'Hoạt động', 1),
(25, '3', 'D', 'Thường', 'D3', 'Hoạt động', 1),
(26, '4', 'D', 'Thường', 'D4', 'Hoạt động', 1),
(27, '5', 'D', 'Thường', 'D5', 'Hoạt động', 1),
(28, '6', 'D', 'Thường', 'D6', 'Hoạt động', 1),
(29, '7', 'D', 'Thường', 'D7', 'Hoạt động', 1),
(30, '8', 'D', 'Thường', 'D8', 'Hoạt động', 1),

-- Hàng E (1-8)
(31, '1', 'E', 'VIP', 'E1', 'Hoạt động', 1),
(32, '2', 'E', 'VIP', 'E2', 'Hoạt động', 1),
(33, '3', 'E', 'VIP', 'E3', 'Hoạt động', 1),
(34, '4', 'E', 'Thường', 'E4', 'Hoạt động', 1),
(35, '5', 'E', 'VIP', 'E5', 'Hoạt động', 1),
(36, '6', 'E', 'Thường', 'E6', 'Hoạt động', 1),
(37, '7', 'E', 'Thường', 'E7', 'Hoạt động', 1),
(38, '8', 'E', 'Thường', 'E8', 'Hoạt động', 1),

-- Hàng F (1-6)
(39, '1', 'F', 'Thường', 'F1', 'Hoạt động', 1),
(40, '2', 'F', 'Thường', 'F2', 'Hoạt động', 1),
(41, '3', 'F', 'Thường', 'F3', 'Hoạt động', 1),
(42, '4', 'F', 'Thường', 'F4', 'Hoạt động', 1),
(43, '5', 'F', 'VIP', 'F5', 'Hoạt động', 1),
(44, '6', 'F', 'VIP', 'F6', 'Hoạt động', 1);

-- Tương tự, thêm ghế cho phòng 2 với cùng cấu trúc
INSERT INTO ghe (id, cot, hang, loai_ghe, ten, trang_thai, phong_id) VALUES
-- Hàng A (1-6)
(45, '1', 'A', 'Thường', 'A1', 'Hoạt động', 2),
(46, '2', 'A', 'Thường', 'A2', 'Hoạt động', 2),
(47, '3', 'A', 'Thường', 'A3', 'Hoạt động', 2),
(48, '4', 'A', 'Thường', 'A4', 'Hoạt động', 2),
(49, '5', 'A', 'Thường', 'A5', 'Hoạt động', 2),
(50, '6', 'A', 'Thường', 'A6', 'Hoạt động', 2),

-- Hàng B (1-8)
(51, '1', 'B', 'Thường', 'B1', 'Hoạt động', 2),
(52, '2', 'B', 'Thường', 'B2', 'Hoạt động', 2),
(53, '3', 'B', 'VIP', 'B3', 'Hoạt động', 2),
(54, '4', 'B', 'VIP', 'B4', 'Hoạt động', 2),
(55, '5', 'B', 'Thường', 'B5', 'Hoạt động', 2),
(56, '6', 'B', 'Thường', 'B6', 'Hoạt động', 2),
(57, '7', 'B', 'Thường', 'B7', 'Hoạt động', 2),
(58, '8', 'B', 'Thường', 'B8', 'Hoạt động', 2),

-- Hàng C-F tương tự như phòng 1
-- Hàng C (1-8)
(59, '1', 'C', 'Thường', 'C1', 'Hoạt động', 2),
(60, '2', 'C', 'Thường', 'C2', 'Hoạt động', 2),
(61, '3', 'C', 'Thường', 'C3', 'Hoạt động', 2),
(62, '4', 'C', 'Thường', 'C4', 'Hoạt động', 2),
(63, '5', 'C', 'Thường', 'C5', 'Hoạt động', 2),
(64, '6', 'C', 'VIP', 'C6', 'Hoạt động', 2),
(65, '7', 'C', 'VIP', 'C7', 'Hoạt động', 2),
(66, '8', 'C', 'VIP', 'C8', 'Hoạt động', 2);

-- Thêm dữ liệu mẫu cho bảng phim
INSERT INTO phim (id, danh_gia, dao_dien, dien_vien, do_dai, do_tuoi, hang_sx, mo_ta, nam_sx, ngon_ngu, poster, ten, the_loai, trailer, trang_thai) VALUES
                                                                                                                                                        (1, 8.5, 'Đạo diễn A', 'Diễn viên X, Diễn viên Y', 120, 13, 'Studio A', 'Một bộ phim hành động gay cấn', 2024, 'Tiếng Việt', 'poster1.jpg', 'Cuộc Phiêu Lưu Kỳ Thú', 'Hành động, Phiêu lưu', 'trailer1.mp4', 'Đang chiếu'),
                                                                                                                                                        (2, 7.8, 'Đạo diễn B', 'Diễn viên Z, Diễn viên W', 105, 16, 'Studio B', 'Bộ phim kinh dị hấp dẫn', 2024, 'Tiếng Anh', 'poster2.jpg', 'Đêm Kinh Hoàng', 'Kinh dị, Giật gân', 'trailer2.mp4', 'Đang chiếu'),
                                                                                                                                                        (3, 9.0, 'Đạo diễn C', 'Diễn viên M, Diễn viên N', 150, 0, 'Studio C', 'Phim hoạt hình dành cho mọi lứa tuổi', 2024, 'Tiếng Việt', 'poster3.jpg', 'Cuộc Phiêu Lưu Của Mèo Tom', 'Hoạt hình, Gia đình', 'trailer3.mp4', 'Sắp chiếu'),
                                                                                                                                                        (4, 8.2, 'Đạo diễn D', 'Diễn viên P, Diễn viên Q', 135, 18, 'Studio D', 'Phim tình cảm lãng mạn', 2024, 'Tiếng Anh', 'poster4.jpg', 'Tình Yêu Bất Diệt', 'Tình cảm, Lãng mạn', 'trailer4.mp4', 'Đang chiếu');

-- Thêm dữ liệu mẫu cho bảng lich_chieu
INSERT INTO lich_chieu (id, bat_dau, gia_ve, ket_thuc, ngay_lap, trang_thai, phim_id, phong_id) VALUES
                                                                                                    (1, '2025-05-15 10:00:00', 80000.00, '2025-05-15 12:00:00', '2025-05-01 08:00:00', 'Đang mở', 1, 1),
                                                                                                    (2, '2025-05-15 13:00:00', 80000.00, '2025-05-15 15:00:00', '2025-05-01 08:00:00', 'Đang mở', 1, 1),
                                                                                                    (3, '2025-05-15 10:30:00', 90000.00, '2025-05-15 12:15:00', '2025-05-01 08:00:00', 'Đang mở', 2, 2),
                                                                                                    (4, '2025-05-15 13:30:00', 90000.00, '2025-05-15 15:15:00', '2025-05-01 08:00:00', 'Đang mở', 2, 2);


-- Thêm dữ liệu mẫu cho bảng lich_chieu_ghe


INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A (ghế 1-6): một vài ghế đã đặt
(1, 1, 'Trống'),   -- A1 (Thường)
(1, 2, 'Trống'),   -- A2 (Thường)
(1, 3, 'Đã đặt'),  -- A3 (Thường)
(1, 4, 'Đã đặt'),  -- A4 (Thường)
(1, 5, 'Trống'),   -- A5 (Thường)
(1, 6, 'Trống'),   -- A6 (Thường)

-- Hàng B (ghế 7-14): ghế VIP ở giữa đã đặt
(1, 7, 'Trống'),   -- B1 (Thường)
(1, 8, 'Trống'),   -- B2 (Thường)
(1, 9, 'Đã đặt'),  -- B3 (VIP)
(1, 10, 'Đã đặt'), -- B4 (VIP)
(1, 11, 'Trống'),  -- B5 (Thường)
(1, 12, 'Trống'),  -- B6 (Thường)
(1, 13, 'Trống'),  -- B7 (Thường)
(1, 14, 'Trống'),  -- B8 (Thường)

-- Hàng C (ghế 15-22): một số ghế VIP đã đặt
(1, 15, 'Trống'),  -- C1 (Thường)
(1, 16, 'Trống'),  -- C2 (Thường)
(1, 17, 'Trống'),  -- C3 (Thường)
(1, 18, 'Trống'),  -- C4 (Thường)
(1, 19, 'Trống'),  -- C5 (Thường)
(1, 20, 'Đã đặt'), -- C6 (VIP)
(1, 21, 'Đã đặt'), -- C7 (VIP)
(1, 22, 'Trống'),  -- C8 (VIP)

-- Hàng D (ghế 23-30): một ghế VIP đã đặt
(1, 23, 'Trống'),  -- D1 (Thường)
(1, 24, 'Đã đặt'), -- D2 (VIP)
(1, 25, 'Trống'),  -- D3 (Thường)
(1, 26, 'Trống'),  -- D4 (Thường)
(1, 27, 'Trống'),  -- D5 (Thường)
(1, 28, 'Trống'),  -- D6 (Thường)
(1, 29, 'Trống'),  -- D7 (Thường)
(1, 30, 'Trống'),  -- D8 (Thường)

-- Hàng E (ghế 31-38): ghế VIP đầu hàng đã đặt
(1, 31, 'Đã đặt'), -- E1 (VIP)
(1, 32, 'Đã đặt'), -- E2 (VIP)
(1, 33, 'Đã đặt'), -- E3 (VIP)
(1, 34, 'Trống'),  -- E4 (Thường)
(1, 35, 'Trống'),  -- E5 (VIP)
(1, 36, 'Trống'),  -- E6 (Thường)
(1, 37, 'Trống'),  -- E7 (Thường)
(1, 38, 'Trống'),  -- E8 (Thường)

-- Hàng F (ghế 39-44): 2 ghế VIP cuối đã đặt
(1, 39, 'Trống'),  -- F1 (Thường)
(1, 40, 'Trống'),  -- F2 (Thường)
(1, 41, 'Trống'),  -- F3 (Thường)
(1, 42, 'Trống'),  -- F4 (Thường)
(1, 43, 'Đã đặt'), -- F5 (VIP)
(1, 44, 'Đã đặt'); -- F6 (VIP)

-- Thêm dữ liệu cho lịch chiếu 2 (khung giờ khác, phòng 1)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Tất cả ghế trống
(2, 1, 'Trống'),   -- A1
(2, 2, 'Trống'),   -- A2
(2, 3, 'Trống'),   -- A3
(2, 4, 'Trống'),   -- A4
(2, 5, 'Trống'),   -- A5
(2, 6, 'Trống'),   -- A6
(2, 7, 'Trống'),   -- B1
(2, 8, 'Trống'),   -- B2
(2, 9, 'Trống'),   -- B3 (VIP)
(2, 10, 'Trống'),  -- B4 (VIP)
(2, 11, 'Trống'),  -- B5
(2, 12, 'Trống'),  -- B6
(2, 13, 'Trống'),  -- B7
(2, 14, 'Trống'),  -- B8
(2, 15, 'Trống'),  -- C1
(2, 16, 'Trống'),  -- C2
(2, 17, 'Trống'),  -- C3
(2, 18, 'Trống'),  -- C4
(2, 19, 'Trống'),  -- C5
(2, 20, 'Trống'),  -- C6 (VIP)
(2, 21, 'Trống'),  -- C7 (VIP)
(2, 22, 'Trống'),  -- C8 (VIP)
(2, 23, 'Trống'),  -- D1
(2, 24, 'Trống'),  -- D2 (VIP)
(2, 25, 'Trống'),  -- D3
(2, 26, 'Trống'),  -- D4
(2, 27, 'Trống'),  -- D5
(2, 28, 'Trống'),  -- D6
(2, 29, 'Trống'),  -- D7
(2, 30, 'Trống'),  -- D8
(2, 31, 'Trống'),  -- E1 (VIP)
(2, 32, 'Trống'),  -- E2 (VIP)
(2, 33, 'Trống'),  -- E3 (VIP)
(2, 34, 'Trống'),  -- E4
(2, 35, 'Trống'),  -- E5 (VIP)
(2, 36, 'Trống'),  -- E6
(2, 37, 'Trống'),  -- E7
(2, 38, 'Trống'),  -- E8
(2, 39, 'Trống'),  -- F1
(2, 40, 'Trống'),  -- F2
(2, 41, 'Trống'),  -- F3
(2, 42, 'Trống'),  -- F4
(2, 43, 'Trống'),  -- F5 (VIP)
(2, 44, 'Trống'); -- F6 (VIP)

-- Thêm dữ liệu cho lịch chiếu 3 (phòng 1, khung giờ khác)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Một vài ghế đã đặt khác với lịch chiếu 1
(3, 1, 'Trống'),   -- A1
(3, 2, 'Đã đặt'),  -- A2
(3, 3, 'Trống'),   -- A3
(3, 4, 'Trống'),   -- A4
(3, 5, 'Đã đặt'),  -- A5
(3, 6, 'Trống'),   -- A6
(3, 7, 'Trống'),   -- B1
(3, 8, 'Trống'),   -- B2
(3, 9, 'Trống'),   -- B3 (VIP)
(3, 10, 'Trống'),  -- B4 (VIP)
(3, 11, 'Trống'),  -- B5
(3, 12, 'Trống'),  -- B6
(3, 13, 'Trống'),  -- B7
(3, 14, 'Trống'),  -- B8
(3, 15, 'Trống'),  -- C1
(3, 16, 'Đã đặt'), -- C2
(3, 17, 'Trống'),  -- C3
(3, 18, 'Trống'),  -- C4
(3, 19, 'Trống'),  -- C5
(3, 20, 'Trống'),  -- C6 (VIP)
(3, 21, 'Trống'),  -- C7 (VIP)
(3, 22, 'Đã đặt'), -- C8 (VIP)
(3, 23, 'Trống'),  -- D1
(3, 24, 'Trống'),  -- D2 (VIP)
(3, 25, 'Trống'),  -- D3
(3, 26, 'Trống'),  -- D4
(3, 27, 'Trống'),  -- D5
(3, 28, 'Trống'),  -- D6
(3, 29, 'Trống'),  -- D7
(3, 30, 'Trống'),  -- D8
(3, 31, 'Trống'),  -- E1 (VIP)
(3, 32, 'Trống'),  -- E2 (VIP)
(3, 33, 'Trống'),  -- E3 (VIP)
(3, 34, 'Trống'),  -- E4
(3, 35, 'Đã đặt'), -- E5 (VIP)
(3, 36, 'Trống'),  -- E6
(3, 37, 'Trống'),  -- E7
(3, 38, 'Trống'),  -- E8
(3, 39, 'Trống'),  -- F1
(3, 40, 'Trống'),  -- F2
(3, 41, 'Trống'),  -- F3
(3, 42, 'Trống'),  -- F4
(3, 43, 'Trống'),  -- F5 (VIP)
(3, 44, 'Trống'); -- F6 (VIP)

-- Thêm dữ liệu cho lịch chiếu 4 (phòng 2, một vài phim khác)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Lưu ý: Phòng 2 có thể có layout ghế khác, cần kiểm tra dữ liệu thực tế
-- Đây chỉ là ví dụ với giả sử phòng 2 có cùng layout với phòng 1
(4, 1, 'Trống'),   -- A1
(4, 2, 'Trống'),   -- A2
(4, 3, 'Trống'),   -- A3
(4, 4, 'Trống'),   -- A4
(4, 5, 'Trống'),   -- A5
(4, 6, 'Trống'),   -- A6
(4, 7, 'Trống'),   -- B1
(4, 8, 'Trống'),   -- B2
(4, 9, 'Đã đặt'),  -- B3 (VIP)
(4, 10, 'Đã đặt'), -- B4 (VIP)
(4, 11, 'Trống'),  -- B5
(4, 12, 'Trống'),  -- B6
(4, 13, 'Trống'),  -- B7
(4, 14, 'Trống'),  -- B8
(4, 15, 'Trống'),  -- C1
(4, 16, 'Trống'),  -- C2
(4, 17, 'Trống'),  -- C3
(4, 18, 'Trống'),  -- C4
(4, 19, 'Trống'),  -- C5
(4, 20, 'Trống'),  -- C6 (VIP)
(4, 21, 'Trống'),  -- C7 (VIP)
(4, 22, 'Trống'),  -- C8 (VIP)
(4, 23, 'Trống'),  -- D1
(4, 24, 'Trống'),  -- D2 (VIP)
(4, 25, 'Trống'),  -- D3
(4, 26, 'Trống'),  -- D4
(4, 27, 'Trống'),  -- D5
(4, 28, 'Trống'),  -- D6
(4, 29, 'Trống'),  -- D7
(4, 30, 'Trống'),  -- D8
(4, 31, 'Trống'),  -- E1 (VIP)
(4, 32, 'Trống'),  -- E2 (VIP)
(4, 33, 'Trống'),  -- E3 (VIP)
(4, 34, 'Trống'),  -- E4
(4, 35, 'Trống'),  -- E5 (VIP)
(4, 36, 'Trống'),  -- E6
(4, 37, 'Trống'),  -- E7
(4, 38, 'Trống'),  -- E8
(4, 39, 'Trống'),  -- F1
(4, 40, 'Trống'),  -- F2
(4, 41, 'Trống'),  -- F3
(4, 42, 'Trống'),  -- F4
(4, 43, 'Trống'),  -- F5 (VIP)
(4, 44, 'Trống'); -- F6 (VIP

-- Thêm dữ liệu mẫu cho bảng giao_dich
INSERT INTO giao_dich (id, ghi_chu, giam_gia, ma_giao_dich, ma_qr, phuong_thuc, thanh_tien, thoi_gian, tong_tien, trang_thai, khach_hang_id) VALUES
                                                                                                                                                 (1, 'Đặt vé xem phim Cuộc Phiêu Lưu Kỳ Thú', 10000.00, 'GD00001', 'QR00001', 'Thẻ tín dụng', 70000.00, '2025-05-02 09:15:00', 80000.00, 'Thành công', 3),
                                                                                                                                                 (2, 'Đặt vé xem phim Cuộc Phiêu Lưu Kỳ Thú', 0.00, 'GD00002', 'QR00002', 'Momo', 80000.00, '2025-05-02 09:30:00', 80000.00, 'Thành công', 4),
                                                                                                                                                 (3, 'Đặt vé xem phim Đêm Kinh Hoàng', 20000.00, 'GD00003', 'QR00003', 'Tiền mặt', 160000.00, '2025-05-02 10:00:00', 180000.00, 'Thành công', 5);

-- Thêm dữ liệu mẫu cho bảng ve
INSERT INTO ve (id, ghi_chu, gia, ma_ve, ngay_tao, trang_thai, khach_hang_id, lich_chieu_ghe_id) VALUES
                                                                                                     (1, NULL, 80000.00, 'VE00001', '2025-05-02 09:15:00', 'Đã thanh toán', 3, 4),  -- A4
                                                                                                     (2, NULL, 80000.00, 'VE00002', '2025-05-02 09:15:00', 'Đã thanh toán', 3, 5),  -- A5
                                                                                                     (3, NULL, 90000.00, 'VE00003', '2025-05-02 09:30:00', 'Đã thanh toán', 4, 9),  -- B3 (VIP)
                                                                                                     (4, NULL, 90000.00, 'VE00004', '2025-05-02 09:30:00', 'Đã thanh toán', 4, 10), -- B4 (VIP)
                                                                                                     (5, NULL, 90000.00, 'VE00005', '2025-05-02 10:00:00', 'Đã thanh toán', 5, 31), -- E1 (VIP)
                                                                                                     (6, NULL, 90000.00, 'VE00006', '2025-05-02 10:00:00', 'Đã thanh toán', 5, 32); -- E2 (VIP)

-- Thêm dữ liệu mẫu cho bảng chi_tiet_giao_dich
INSERT INTO chi_tiet_giao_dich (id, ghi_chu, gia_tien, giam_gia, giao_dich_id, ve_id) VALUES
                                                                                          (1, NULL, 80000.00, 5000.00, 1, 1),
                                                                                          (2, NULL, 80000.00, 5000.00, 1, 2),
                                                                                          (3, NULL, 90000.00, 0.00, 2, 3),
                                                                                          (4, NULL, 90000.00, 0.00, 2, 4),
                                                                                          (5, NULL, 90000.00, 10000.00, 3, 5),
                                                                                          (6, NULL, 90000.00, 10000.00, 3, 6);

ALTER TABLE phim MODIFY COLUMN mo_ta VARCHAR(5000);

UPDATE phim SET
                danh_gia = 8.8,
                dao_dien = 'Christopher Nolan',
                dien_vien = 'Leonardo DiCaprio, Joseph Gordon-Levitt, Ellen Page, Tom Hardy, Ken Watanabe, Cillian Murphy, Marion Cotillard, Michael Caine, Dileep Rao, Tom Berenger',
                do_dai = 148,
                do_tuoi = 13,
                hang_sx = 'Warner Bros. Pictures',
                mo_ta = 'Một tên trộm chuyên đánh cắp bí mật doanh nghiệp bằng công nghệ chia sẻ giấc mơ được giao nhiệm vụ ngược lại: gieo ý tưởng vào tâm trí một giám đốc điều hành, nhưng quá khứ bi thảm của anh có thể khiến nhiệm vụ và cả đội rơi vào thảm họa.',
                nam_sx = 2010,
                ngon_ngu = 'Tiếng Anh',
                poster = 'https://th.bing.com/th/id/OIP.DF6kVZd8CeIEccxAdvv4fAHaKz?rs=1&pid=ImgDetMain',
                ten = 'Inception',
                the_loai = 'Khoa học viễn tưởng, Hành động',
                trailer = 'https://www.youtube.com/watch?v=8hP9D6kZseM',
                trang_thai = 'Đang chiếu'
WHERE id = 1;

UPDATE phim SET
                danh_gia = 7.6,
                dao_dien = 'Quentin Tarantino',
                dien_vien = 'Leonardo DiCaprio, Brad Pitt, Margot Robbie, Margaret Qualley, Austin Butler, Dakota Fanning, Bruce Dern, Al Pacino, Emile Hirsch, Kurt Russell',
                do_dai = 165,
                do_tuoi = 16,
                hang_sx = 'Sony Pictures',
                mo_ta = 'Khi Thời kỳ Vàng của Hollywood đang dần khép lại vào mùa hè năm 1969, diễn viên truyền hình Rick Dalton và người đóng thế của anh, Cliff Booth, nỗ lực đạt được thành công bền vững ở Hollywood, đồng thời gặp gỡ nhiều nhân vật đầy màu sắc trên hành trình của họ.',
                nam_sx = 2019,
                ngon_ngu = 'Tiếng Anh',
                poster = 'https://th.bing.com/th/id/OIP.tdNKGp8DTDgSpmyMovSilQHaK-?rs=1&pid=ImgDetMain',
                ten = 'Once Upon a Time in Hollywood',
                the_loai = 'Drama',
                trailer = 'https://www.youtube.com/watch?v=ELeMaP8EPAA',
                trang_thai = 'Sắp chiếu'
WHERE id = 2;

UPDATE phim SET
                danh_gia = 7.9,
                dao_dien = 'Steven Spielberg',
                dien_vien = 'Tom Hanks, Matt Damon, Edward Burns, Tom Sizemore, Barry Pepper, Vin Diesel, Giovanni Ribisi, Adam Goldberg, Jeremy Davies, Ted Danson.',
                do_dai = 140,
                do_tuoi = 13,
                hang_sx = 'Universal',
                mo_ta = 'Sau cuộc đổ bộ Normandy, một nhóm lính Mỹ đi sau chiến tuyến của kẻ thù để lấy một lính dù có anh em đã thiệt mạng trong chiến đấu.',
                nam_sx = 1998,
                ngon_ngu = 'Tiếng Anh',
                poster = 'https://th.bing.com/th/id/R.24f6a65f3371b06c7ae158bfad7f8151?rik=87qYKCQY3eiDCQ&pid=ImgRaw&r=0',
                ten = 'Saving Private Ryan',
                the_loai = 'Chiến tranh',
                trailer = 'https://www.youtube.com/watch?v=S1Qj_AVu2pA',
                trang_thai = 'Đang chiếu'
WHERE id = 3;

UPDATE phim SET
                danh_gia = 8.0,
                dao_dien = 'James Cameron',
                dien_vien = 'Leonardo DiCaprio, Kate Winslet, Billy Zane, Kathy Bates, Frances Fisher, Danny Nucci, Bill Paxton, David Warner, Jonathan Hyde, Bernard Hill.',
                do_dai = 195,
                do_tuoi = 13,
                hang_sx = '20th Century Fox',
                mo_ta = 'Titanic kể về mối tình giữa Jack và Rose, hai con người từ hai thế giới khác nhau, trên con tàu Titanic. Dù hoàn cảnh không thuận lợi, họ yêu nhau say đắm. Khi tàu gặp nạn và chìm, tình yêu của họ phải đối mặt với sự sống còn, mang đến những khoảnh khắc đầy bi thương và hy sinh.',
                nam_sx = 1997,
                ngon_ngu = 'Tiếng Anh',
                poster = 'https://www.themoviedb.org/t/p/original/tr5y5H4qOlqCGbZKaT9Q97cscVj.jpg',
                ten = 'Titanic',
                the_loai = 'Lãng mạn',
                trailer = 'https://www.youtube.com/watch?v=kVrqfYjkTdQ',
                trang_thai = 'Đang chiếu'
WHERE id = 4;

INSERT INTO phim (id, danh_gia, dao_dien, dien_vien, do_dai, do_tuoi, hang_sx, mo_ta, nam_sx, ngon_ngu, poster, ten, the_loai, trailer, trang_thai) VALUES
                                                                                                                                                        (5, 8.3, 'David Fincher', 'Brad Pitt, Edward Norton, Helena Bonham Carter, Meat Loaf, Jared Leto, Zach Grenier, Richmond Arquette, David Andrews, Christy Scott Cashman, Elliot Gould.', 139, 16, '20th Century Fox', 'Fight Club kể về một người đàn ông (Edward Norton) mệt mỏi với cuộc sống, gặp gỡ Tyler Durden (Brad Pitt), người lập ra một câu lạc bộ chiến đấu ngầm. Câu lạc bộ trở thành một phong trào hỗn loạn, nhưng khi người kể chuyện phát hiện sự thật kinh hoàng về Tyler, mọi thứ dần mất kiểm soát. Bộ phim khám phá chủ nghĩa vật chất, bản sắc và sự tan vỡ của xã hội.', 1995, 'Tiếng Anh', 'https://www.themoviedb.org/t/p/original/iqR0M1ln7Kobjp9liUj2Q7mtQZG.jpg', 'Fight Club', 'Hành động', 'https://www.youtube.com/watch?v=qtRKdVHc-cE', 'Đang chiếu'),
                                                                                                                                                        (6, 7.7, 'Ridley Scott', 'Russell Crowe, Joaquin Phoenix, Connie Nielsen, Oliver Reed, Richard Harris, Derek Jacobi, Djimon Hounsou, Tomas Arana, Ralf Moeller, David Schofield.', 155, 13, 'Universal', 'Gladiator kể về Maximus (Russell Crowe), một tướng quân La Mã bị phản bội và gia đình bị giết hại. Anh trở thành một đấu sĩ và tìm cách trả thù. Maximus chiến đấu trong đấu trường để giành lại danh dự và công lý, đối đầu với Commodus (Joaquin Phoenix), hoàng đế tàn bạo. Bộ phim thể hiện sự hy sinh, lòng trung thành và khát khao tự do.', 2000, 'Tiếng Anh', 'https://image.tmdb.org/t/p/original/ofDw0himYNpehWA69OkPWOzXOYK.jpg', 'Gladiator', 'Lịch sử', 'https://www.youtube.com/watch?v=P5ieIbInFpg', 'Đang chiếu'),
                                                                                                                                                        (7, 8.1, 'Christopher Nolan', 'Matthew McConaughey, Anne Hathaway, Jessica Chastain, Michael Caine, Mackenzie Foy, Ellen Burstyn, John Lithgow, Topher Grace, Casey Affleck, Wes Bentley.', 164, 13, 'Warner Bros', 'Interstellar kể về câu chuyện của Cooper (Matthew McConaughey), một phi hành gia được giao nhiệm vụ dẫn dắt một nhóm khám phá không gian để tìm một hành tinh mới cho loài người, khi Trái Đất đang bị tàn phá. Trong hành trình xuyên qua lỗ đen và thời gian, Cooper phải đối mặt với những quyết định khó khăn để cứu cả gia đình và nhân loại. Bộ phim khám phá tình yêu, sự hy sinh và những bí ẩn của vũ trụ.', 2014, 'Tiếng Anh', 'https://www.movieposters.com/cdn/shop/files/interstellar-139399_1024x1024.jpg?v=1708527823', 'Interstellar', 'Khoa học viễn tưởng', 'https://www.youtube.com/watch?v=zSWdZVtXT7E', 'Sắp chiếu'),
                                                                                                                                                        (8, 7.6, 'Martin Scorsese', 'Robert De Niro, Al Pacino, Joe Pesci, Harvey Keitel, Ray Romano, Bobby Cannavale, Anna Paquin, Stephen Graham, Jesse Plemons, Paul Herman.', 180, 16, 'Paramount', 'The Irishman kể về Frank Sheeran (Robert De Niro), một người lính cũ trong Mafia, kể lại cuộc đời mình. Anh làm việc cho ông trùm Russell Bufalino (Joe Pesci) và dần dần trở thành người thân cận của Jimmy Hoffa (Al Pacino), một lãnh đạo công đoàn nổi tiếng. Bộ phim khắc họa sự phản bội, tội lỗi và những hậu quả của cuộc sống trong thế giới tội phạm.', 2019, 'Tiếng Anh', 'https://posterspy.com/wp-content/uploads/2021/03/theirishman72dpi-scaled.jpg', 'The Irishman', 'Hình sự', 'https://www.youtube.com/watch?v=WHXxVmeGQUc', 'Sắp chiếu'),
                                                                                                                                                        (9, 8.4, 'Denis Villeneuve', 'Timothée Chalamet, Zendaya, Oscar Isaac, Rebecca Ferguson, Josh Brolin, Stellan Skarsgård, Dave Bautista, Jason Momoa, Javier Bardem, Charlotte Rampling.', 155, 13, 'Legendary Pictures', 'Dune theo chân Paul Atreides (Timothée Chalamet), người thừa kế nhà Atreides, khi gia đình anh được giao cai trị hành tinh sa mạc Arrakis, nguồn cung cấp "spice" quý giá. Sau khi gia đình bị phản bội, Paul phải trốn vào hoang mạc và gia nhập các bộ lạc người Fremen. Bộ phim khám phá quyền lực, sự sinh tồn và định mệnh trong một vũ trụ đầy xung đột.', 2021, 'Tiếng Anh', 'https://th.bing.com/th/id/OIP.ORgJjrgXNIbDtLIyU_RoHAHaLG?rs=1&pid=ImgDetMain', 'Dune', 'Khoa học viễn tưởng', 'https://www.youtube.com/watch?v=n9xhJrPXop4', 'Sắp chiếu');

INSERT INTO lich_chieu (id, bat_dau, gia_ve, ket_thuc, ngay_lap, trang_thai, phim_id, phong_id) VALUES
-- Ngày 14/05/2025
(6, '2025-05-14 10:00:00', 85000.00, '2025-05-14 12:00:00', '2025-05-09 08:00:00', 'Đang mở', 3, 1),
(7, '2025-05-14 13:30:00', 85000.00, '2025-05-14 15:30:00', '2025-05-09 08:00:00', 'Đang mở', 3, 2),
(8, '2025-05-14 16:00:00', 95000.00, '2025-05-14 18:00:00', '2025-05-09 08:00:00', 'Đang mở', 4, 2),
(9, '2025-05-14 19:00:00', 100000.00, '2025-05-14 21:00:00', '2025-05-09 08:00:00', 'Đang mở', 5, 1),
(10, '2025-05-14 20:30:00', 100000.00, '2025-05-14 22:30:00', '2025-05-09 08:00:00', 'Đang mở', 6, 2),

-- Ngày 15/05/2025
(11, '2025-05-15 10:00:00', 85000.00, '2025-05-15 12:00:00', '2025-05-09 08:00:00', 'Đang mở', 3, 2),
(12, '2025-05-15 13:00:00', 90000.00, '2025-05-15 15:00:00', '2025-05-09 08:00:00', 'Đang mở', 4, 1),
(13, '2025-05-15 16:30:00', 95000.00, '2025-05-15 18:30:00', '2025-05-09 08:00:00', 'Đang mở', 5, 2),
(14, '2025-05-15 19:00:00', 110000.00, '2025-05-15 21:00:00', '2025-05-09 08:00:00', 'Đang mở', 6, 2),
(15, '2025-05-15 21:30:00', 120000.00, '2025-05-15 23:30:00', '2025-05-09 08:00:00', 'Đang mở', 3, 1),

-- Ngày 16/05/2025
(16, '2025-05-16 10:30:00', 80000.00, '2025-05-16 12:30:00', '2025-05-09 08:00:00', 'Đang mở', 4, 2),
(17, '2025-05-16 13:00:00', 85000.00, '2025-05-16 15:00:00', '2025-05-09 08:00:00', 'Đang mở', 5, 1),
(18, '2025-05-16 15:30:00', 90000.00, '2025-05-16 17:30:00', '2025-05-09 08:00:00', 'Đang mở', 6, 2),
(19, '2025-05-16 18:00:00', 100000.00, '2025-05-16 20:00:00', '2025-05-09 08:00:00', 'Đang mở', 3, 2),
(20, '2025-05-16 20:30:00', 120000.00, '2025-05-16 22:30:00', '2025-05-09 08:00:00', 'Đang mở', 4, 1);

-- Thêm dữ liệu lịch chiếu ghế cho lịch chiếu ID 6 (Phim ID 3, Phòng 1, ngày 14/05/2025)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A
(6, 1, 'Trống'),   -- A1 (Thường)
(6, 2, 'Trống'),   -- A2 (Thường)
(6, 3, 'Đã đặt'),  -- A3 (Thường)
(6, 4, 'Đã đặt'),  -- A4 (Thường)
(6, 5, 'Đã đặt'),  -- A5 (Thường)
(6, 6, 'Trống'),   -- A6 (Thường)

-- Hàng B
(6, 7, 'Trống'),   -- B1 (Thường)
(6, 8, 'Trống'),   -- B2 (Thường)
(6, 9, 'Đã đặt'),  -- B3 (VIP)
(6, 10, 'Đã đặt'), -- B4 (VIP)
(6, 11, 'Trống'),  -- B5 (Thường)
(6, 12, 'Trống'),  -- B6 (Thường)
(6, 13, 'Trống'),  -- B7 (Thường)
(6, 14, 'Trống'),  -- B8 (Thường)

-- Hàng C
(6, 15, 'Trống'),  -- C1 (Thường)
(6, 16, 'Trống'),  -- C2 (Thường)
(6, 17, 'Trống'),  -- C3 (Thường)
(6, 18, 'Đã đặt'), -- C4 (Thường)
(6, 19, 'Đã đặt'), -- C5 (Thường)
(6, 20, 'Đã đặt'), -- C6 (VIP)
(6, 21, 'Đã đặt'), -- C7 (VIP)
(6, 22, 'Đã đặt'), -- C8 (VIP)

-- Hàng D
(6, 23, 'Trống'),  -- D1 (Thường)
(6, 24, 'Đã đặt'), -- D2 (VIP)
(6, 25, 'Trống'),  -- D3 (Thường)
(6, 26, 'Trống'),  -- D4 (Thường)
(6, 27, 'Trống'),  -- D5 (Thường)
(6, 28, 'Trống'),  -- D6 (Thường)
(6, 29, 'Trống'),  -- D7 (Thường)
(6, 30, 'Trống'),  -- D8 (Thường)

-- Hàng E
(6, 31, 'Đã đặt'), -- E1 (VIP)
(6, 32, 'Đã đặt'), -- E2 (VIP)
(6, 33, 'Trống'),  -- E3 (VIP)
(6, 34, 'Trống'),  -- E4 (Thường)
(6, 35, 'Trống'),  -- E5 (VIP)
(6, 36, 'Trống'),  -- E6 (Thường)
(6, 37, 'Trống'),  -- E7 (Thường)
(6, 38, 'Trống'),  -- E8 (Thường)

-- Hàng F
(6, 39, 'Trống'),  -- F1 (Thường)
(6, 40, 'Trống'),  -- F2 (Thường)
(6, 41, 'Trống'),  -- F3 (Thường)
(6, 42, 'Trống'),  -- F4 (Thường)
(6, 43, 'Đã đặt'), -- F5 (VIP)
(6, 44, 'Đã đặt'); -- F6 (VIP)

-- Thêm dữ liệu lịch chiếu ghế cho lịch chiếu ID 7 (Phim ID 3, Phòng 2, ngày 14/05/2025)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A
(7, 1, 'Trống'),   -- A1 (Thường)
(7, 2, 'Trống'),   -- A2 (Thường)
(7, 3, 'Trống'),   -- A3 (Thường)
(7, 4, 'Trống'),   -- A4 (Thường)
(7, 5, 'Trống'),   -- A5 (Thường)
(7, 6, 'Trống'),   -- A6 (Thường)

-- Hàng B
(7, 7, 'Trống'),   -- B1 (Thường)
(7, 8, 'Trống'),   -- B2 (Thường)
(7, 9, 'Đã đặt'),  -- B3 (VIP)
(7, 10, 'Đã đặt'), -- B4 (VIP)
(7, 11, 'Đã đặt'), -- B5 (Thường)
(7, 12, 'Trống'),  -- B6 (Thường)
(7, 13, 'Trống'),  -- B7 (Thường)
(7, 14, 'Trống'),  -- B8 (Thường)

-- Hàng C
(7, 15, 'Trống'),  -- C1 (Thường)
(7, 16, 'Trống'),  -- C2 (Thường)
(7, 17, 'Trống'),  -- C3 (Thường)
(7, 18, 'Trống'),  -- C4 (Thường)
(7, 19, 'Trống'),  -- C5 (Thường)
(7, 20, 'Đã đặt'), -- C6 (VIP)
(7, 21, 'Đã đặt'), -- C7 (VIP)
(7, 22, 'Trống'),  -- C8 (VIP)

-- Hàng D
(7, 23, 'Trống'),  -- D1 (Thường)
(7, 24, 'Trống'),  -- D2 (VIP)
(7, 25, 'Trống'),  -- D3 (Thường)
(7, 26, 'Trống'),  -- D4 (Thường)
(7, 27, 'Trống'),  -- D5 (Thường)
(7, 28, 'Trống'),  -- D6 (Thường)
(7, 29, 'Trống'),  -- D7 (Thường)
(7, 30, 'Trống'),  -- D8 (Thường)

-- Hàng E
(7, 31, 'Trống'),  -- E1 (VIP)
(7, 32, 'Trống'),  -- E2 (VIP)
(7, 33, 'Trống'),  -- E3 (VIP)
(7, 34, 'Trống'),  -- E4 (Thường)
(7, 35, 'Trống'),  -- E5 (VIP)
(7, 36, 'Trống'),  -- E6 (Thường)
(7, 37, 'Trống'),  -- E7 (Thường)
(7, 38, 'Trống'),  -- E8 (Thường)

-- Hàng F
(7, 39, 'Trống'),  -- F1 (Thường)
(7, 40, 'Trống'),  -- F2 (Thường)
(7, 41, 'Trống'),  -- F3 (Thường)
(7, 42, 'Trống'),  -- F4 (Thường)
(7, 43, 'Trống'),  -- F5 (VIP)
(7, 44, 'Trống');  -- F6 (VIP)

-- Thêm dữ liệu lịch chiếu ghế cho lịch chiếu ID 8 (Phim ID 4, Phòng 3, ngày 14/05/2025)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A
(8, 1, 'Đã đặt'),  -- A1 (Thường)
(8, 2, 'Đã đặt'),  -- A2 (Thường)
(8, 3, 'Đã đặt'),  -- A3 (Thường)
(8, 4, 'Đã đặt'),  -- A4 (Thường)
(8, 5, 'Đã đặt'),  -- A5 (Thường)
(8, 6, 'Đã đặt'),  -- A6 (Thường)

-- Hàng B
(8, 7, 'Trống'),   -- B1 (Thường)
(8, 8, 'Trống'),   -- B2 (Thường)
(8, 9, 'Đã đặt'),  -- B3 (VIP)
(8, 10, 'Đã đặt'), -- B4 (VIP)
(8, 11, 'Đã đặt'), -- B5 (Thường)
(8, 12, 'Đã đặt'), -- B6 (Thường)
(8, 13, 'Trống'),  -- B7 (Thường)
(8, 14, 'Trống'),  -- B8 (Thường)

-- Hàng C
(8, 15, 'Trống'),  -- C1 (Thường)
(8, 16, 'Trống'),  -- C2 (Thường)
(8, 17, 'Trống'),  -- C3 (Thường)
(8, 18, 'Đã đặt'), -- C4 (Thường)
(8, 19, 'Đã đặt'), -- C5 (Thường)
(8, 20, 'Đã đặt'), -- C6 (VIP)
(8, 21, 'Đã đặt'), -- C7 (VIP)
(8, 22, 'Đã đặt'), -- C8 (VIP)

-- Hàng D
(8, 23, 'Trống'),  -- D1 (Thường)
(8, 24, 'Đã đặt'), -- D2 (VIP)
(8, 25, 'Đã đặt'), -- D3 (Thường)
(8, 26, 'Đã đặt'), -- D4 (Thường)
(8, 27, 'Trống'),  -- D5 (Thường)
(8, 28, 'Trống'),  -- D6 (Thường)
(8, 29, 'Trống'),  -- D7 (Thường)
(8, 30, 'Trống'),  -- D8 (Thường)

-- Hàng E
(8, 31, 'Đã đặt'), -- E1 (VIP)
(8, 32, 'Đã đặt'), -- E2 (VIP)
(8, 33, 'Đã đặt'), -- E3 (VIP)
(8, 34, 'Trống'),  -- E4 (Thường)
(8, 35, 'Trống'),  -- E5 (VIP)
(8, 36, 'Trống'),  -- E6 (Thường)
(8, 37, 'Trống'),  -- E7 (Thường)
(8, 38, 'Trống'),  -- E8 (Thường)

-- Hàng F
(8, 39, 'Trống'),  -- F1 (Thường)
(8, 40, 'Trống'),  -- F2 (Thường)
(8, 41, 'Trống'),  -- F3 (Thường)
(8, 42, 'Trống'),  -- F4 (Thường)
(8, 43, 'Đã đặt'), -- F5 (VIP)
(8, 44, 'Đã đặt'); -- F6 (VIP)

-- Thêm dữ liệu lịch chiếu ghế cho lịch chiếu ID 9 (Phim ID 5, Phòng 1, ngày 14/05/2025)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A
(9, 1, 'Trống'),   -- A1 (Thường)
(9, 2, 'Trống'),   -- A2 (Thường)
(9, 3, 'Trống'),   -- A3 (Thường)
(9, 4, 'Trống'),   -- A4 (Thường)
(9, 5, 'Trống'),   -- A5 (Thường)
(9, 6, 'Trống'),   -- A6 (Thường)

-- Hàng B
(9, 7, 'Trống'),   -- B1 (Thường)
(9, 8, 'Trống'),   -- B2 (Thường)
(9, 9, 'Trống'),   -- B3 (VIP)
(9, 10, 'Trống'),  -- B4 (VIP)
(9, 11, 'Trống'),  -- B5 (Thường)
(9, 12, 'Trống'),  -- B6 (Thường)
(9, 13, 'Trống'),  -- B7 (Thường)
(9, 14, 'Trống'),  -- B8 (Thường)

-- Hàng C
(9, 15, 'Trống'),  -- C1 (Thường)
(9, 16, 'Trống'),  -- C2 (Thường)
(9, 17, 'Trống'),  -- C3 (Thường)
(9, 18, 'Trống'),  -- C4 (Thường)
(9, 19, 'Trống'),  -- C5 (Thường)
(9, 20, 'Trống'),  -- C6 (VIP)
(9, 21, 'Trống'),  -- C7 (VIP)
(9, 22, 'Trống'),  -- C8 (VIP)

-- Hàng D
(9, 23, 'Trống'),  -- D1 (Thường)
(9, 24, 'Trống'),  -- D2 (VIP)
(9, 25, 'Trống'),  -- D3 (Thường)
(9, 26, 'Trống'),  -- D4 (Thường)
(9, 27, 'Trống'),  -- D5 (Thường)
(9, 28, 'Trống'),  -- D6 (Thường)
(9, 29, 'Trống'),  -- D7 (Thường)
(9, 30, 'Trống'),  -- D8 (Thường)

-- Hàng E
(9, 31, 'Trống'),  -- E1 (VIP)
(9, 32, 'Trống'),  -- E2 (VIP)
(9, 33, 'Trống'),  -- E3 (VIP)
(9, 34, 'Trống'),  -- E4 (Thường)
(9, 35, 'Trống'),  -- E5 (VIP)
(9, 36, 'Trống'),  -- E6 (Thường)
(9, 37, 'Trống'),  -- E7 (Thường)
(9, 38, 'Trống'),  -- E8 (Thường)

-- Hàng F
(9, 39, 'Trống'),  -- F1 (Thường)
(9, 40, 'Trống'),  -- F2 (Thường)
(9, 41, 'Trống'),  -- F3 (Thường)
(9, 42, 'Trống'),  -- F4 (Thường)
(9, 43, 'Trống'),  -- F5 (VIP)
(9, 44, 'Trống');  -- F6 (VIP)

-- Thêm dữ liệu lịch chiếu ghế cho lịch chiếu ID 10 (Phim ID 6, Phòng 2, ngày 14/05/2025)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A
(10, 1, 'Đã đặt'),  -- A1 (Thường)
(10, 2, 'Đã đặt'),  -- A2 (Thường)
(10, 3, 'Trống'),   -- A3 (Thường)
(10, 4, 'Trống'),   -- A4 (Thường)
(10, 5, 'Trống'),   -- A5 (Thường)
(10, 6, 'Trống'),   -- A6 (Thường)

-- Hàng B
(10, 7, 'Đã đặt'),  -- B1 (Thường)
(10, 8, 'Đã đặt'),  -- B2 (Thường)
(10, 9, 'Đã đặt'),  -- B3 (VIP)
(10, 10, 'Đã đặt'), -- B4 (VIP)
(10, 11, 'Trống'),  -- B5 (Thường)
(10, 12, 'Trống'),  -- B6 (Thường)
(10, 13, 'Trống'),  -- B7 (Thường)
(10, 14, 'Trống'),  -- B8 (Thường)

-- Hàng C
(10, 15, 'Trống'),  -- C1 (Thường)
(10, 16, 'Trống'),  -- C2 (Thường)
(10, 17, 'Đã đặt'), -- C3 (Thường)
(10, 18, 'Đã đặt'), -- C4 (Thường)
(10, 19, 'Đã đặt'), -- C5 (Thường)
(10, 20, 'Đã đặt'), -- C6 (VIP)
(10, 21, 'Đã đặt'), -- C7 (VIP)
(10, 22, 'Đã đặt'), -- C8 (VIP)

-- Hàng D
(10, 23, 'Trống'),  -- D1 (Thường)
(10, 24, 'Đã đặt'), -- D2 (VIP)
(10, 25, 'Đã đặt'), -- D3 (Thường)
(10, 26, 'Đã đặt'), -- D4 (Thường)
(10, 27, 'Đã đặt'), -- D5 (Thường)
(10, 28, 'Đã đặt'), -- D6 (Thường)
(10, 29, 'Trống'),  -- D7 (Thường)
(10, 30, 'Trống'),  -- D8 (Thường)

-- Hàng E
(10, 31, 'Trống'),  -- E1 (VIP)
(10, 32, 'Trống'),  -- E2 (VIP)
(10, 33, 'Trống'),  -- E3 (VIP)
(10, 34, 'Trống'),  -- E4 (Thường)
(10, 35, 'Trống'),  -- E5 (VIP)
(10, 36, 'Trống'),  -- E6 (Thường)
(10, 37, 'Trống'),  -- E7 (Thường)
(10, 38, 'Trống'),  -- E8 (Thường)

-- Hàng F
(10, 39, 'Trống'),  -- F1 (Thường)
(10, 40, 'Trống'),  -- F2 (Thường)
(10, 41, 'Trống'),  -- F3 (Thường)
(10, 42, 'Trống'),  -- F4 (Thường)
(10, 43, 'Trống'),  -- F5 (VIP)
(10, 44, 'Trống');  -- F6 (VIP)

-- Thêm dữ liệu lịch chiếu ghế cho lịch chiếu ID 11 (Phim ID 3, Phòng 3, ngày 15/05/2025)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A
(11, 1, 'Trống'),   -- A1 (Thường)
(11, 2, 'Trống'),   -- A2 (Thường)
(11, 3, 'Trống'),   -- A3 (Thường)
(11, 4, 'Trống'),   -- A4 (Thường)
(11, 5, 'Trống'),   -- A5 (Thường)
(11, 6, 'Trống'),   -- A6 (Thường)

-- Hàng B
(11, 7, 'Trống'),   -- B1 (Thường)
(11, 8, 'Trống'),   -- B2 (Thường)
(11, 9, 'Trống'),   -- B3 (VIP)
(11, 10, 'Trống'),  -- B4 (VIP)
(11, 11, 'Trống'),  -- B5 (Thường)
(11, 12, 'Trống'),  -- B6 (Thường)
(11, 13, 'Trống'),  -- B7 (Thường)
(11, 14, 'Trống'),  -- B8 (Thường)

-- Hàng C
(11, 15, 'Đã đặt'), -- C1 (Thường)
(11, 16, 'Đã đặt'), -- C2 (Thường)
(11, 17, 'Đã đặt'), -- C3 (Thường)
(11, 18, 'Đã đặt'), -- C4 (Thường)
(11, 19, 'Đã đặt'), -- C5 (Thường)
(11, 20, 'Đã đặt'), -- C6 (VIP)
(11, 21, 'Đã đặt'), -- C7 (VIP)
(11, 22, 'Đã đặt'), -- C8 (VIP)

-- Hàng D
(11, 23, 'Đã đặt'), -- D1 (Thường)
(11, 24, 'Đã đặt'), -- D2 (VIP)
(11, 25, 'Đã đặt'), -- D3 (Thường)
(11, 26, 'Đã đặt'), -- D4 (Thường)
(11, 27, 'Đã đặt'), -- D5 (Thường)
(11, 28, 'Đã đặt'), -- D6 (Thường)
(11, 29, 'Đã đặt'), -- D7 (Thường)
(11, 30, 'Đã đặt'), -- D8 (Thường)

-- Hàng E
(11, 31, 'Trống'),  -- E1 (VIP)
(11, 32, 'Trống'),  -- E2 (VIP)
(11, 33, 'Trống'),  -- E3 (VIP)
(11, 34, 'Trống'),  -- E4 (Thường)
(11, 35, 'Trống'),  -- E5 (VIP)
(11, 36, 'Trống'),  -- E6 (Thường)
(11, 37, 'Trống'),  -- E7 (Thường)
(11, 38, 'Trống'),  -- E8 (Thường)

-- Hàng F
(11, 39, 'Trống'),  -- F1 (Thường)
(11, 40, 'Trống'),  -- F2 (Thường)
(11, 41, 'Trống'),  -- F3 (Thường)
(11, 42, 'Trống'),  -- F4 (Thường)
(11, 43, 'Trống'),  -- F5 (VIP)
(11, 44, 'Trống');  -- F6 (VIP)

-- Thêm dữ liệu lịch chiếu ghế cho lịch chiếu ID 12 (Phim ID 4, Phòng 1, ngày 15/05/2025)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A
(12, 1, 'Đã đặt'),  -- A1 (Thường)
(12, 2, 'Đã đặt'),  -- A2 (Thường)
(12, 3, 'Đã đặt'),  -- A3 (Thường)
(12, 4, 'Đã đặt'),  -- A4 (Thường)
(12, 5, 'Đã đặt'),  -- A5 (Thường)
(12, 6, 'Đã đặt'),  -- A6 (Thường)

-- Hàng B
(12, 7, 'Đã đặt'),  -- B1 (Thường)
(12, 8, 'Đã đặt'),  -- B2 (Thường)
(12, 9, 'Đã đặt'),  -- B3 (VIP)
(12, 10, 'Đã đặt'), -- B4 (VIP)
(12, 11, 'Đã đặt'), -- B5 (Thường)
(12, 12, 'Đã đặt'), -- B6 (Thường)
(12, 13, 'Đã đặt'), -- B7 (Thường)
(12, 14, 'Đã đặt'), -- B8 (Thường)

-- Hàng C
(12, 15, 'Đã đặt'), -- C1 (Thường)
(12, 16, 'Đã đặt'), -- C2 (Thường)
(12, 17, 'Đã đặt'), -- C3 (Thường)
(12, 18, 'Đã đặt'), -- C4 (Thường)
(12, 19, 'Đã đặt'), -- C5 (Thường)
(12, 20, 'Đã đặt'), -- C6 (VIP)
(12, 21, 'Đã đặt'), -- C7 (VIP)
(12, 22, 'Đã đặt'), -- C8 (VIP)

-- Hàng D
(12, 23, 'Trống'),  -- D1 (Thường)
(12, 24, 'Trống'),  -- D2 (VIP)
(12, 25, 'Trống'),  -- D3 (Thường)
(12, 26, 'Trống'),  -- D4 (Thường)
(12, 27, 'Trống'),  -- D5 (Thường)
(12, 28, 'Trống'),  -- D6 (Thường)
(12, 29, 'Trống'),  -- D7 (Thường)
(12, 30, 'Trống'),  -- D8 (Thường)

-- Hàng E
(12, 31, 'Trống'),  -- E1 (VIP)
(12, 32, 'Trống'),  -- E2 (VIP)
(12, 33, 'Trống'),  -- E3 (VIP)
(12, 34, 'Trống'),  -- E4 (Thường)
(12, 35, 'Trống'),  -- E5 (VIP)
(12, 36, 'Trống'),  -- E6 (Thường)
(12, 37, 'Trống'),  -- E7 (Thường)
(12, 38, 'Trống'),  -- E8 (Thường)

-- Hàng F
(12, 39, 'Trống'),  -- F1 (Thường)
(12, 40, 'Trống'),  -- F2 (Thường)
(12, 41, 'Trống'),  -- F3 (Thường)
(12, 42, 'Trống'),  -- F4 (Thường)
(12, 43, 'Trống'),  -- F5 (VIP)
(12, 44, 'Trống');  -- F6 (VIP)

-- Thêm dữ liệu lịch chiếu ghế cho lịch chiếu ID 13 (Phim ID 5, Phòng 2, ngày 15/05/2025)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A
(13, 1, 'Trống'),   -- A1 (Thường)
(13, 2, 'Trống'),   -- A2 (Thường)
(13, 3, 'Trống'),   -- A3 (Thường)
(13, 4, 'Trống'),   -- A4 (Thường)
(13, 5, 'Trống'),   -- A5 (Thường)
(13, 6, 'Trống'),   -- A6 (Thường)

-- Hàng B
(13, 7, 'Trống'),   -- B1 (Thường)
(13, 8, 'Trống'),   -- B2 (Thường)
(13, 9, 'Đã đặt'),  -- B3 (VIP)
(13, 10, 'Đã đặt'), -- B4 (VIP)
(13, 11, 'Trống'),  -- B5 (Thường)
(13, 12, 'Trống'),  -- B6 (Thường)
(13, 13, 'Trống'),  -- B7 (Thường)
(13, 14, 'Trống'),  -- B8 (Thường)

-- Hàng C
(13, 15, 'Trống'),  -- C1 (Thường)
(13, 16, 'Trống'),  -- C2 (Thường)
(13, 17, 'Trống'),  -- C3 (Thường)
(13, 18, 'Trống'),  -- C4 (Thường)
(13, 19, 'Trống'),  -- C5 (Thường)
(13, 20, 'Đã đặt'), -- C6 (VIP)
(13, 21, 'Đã đặt'), -- C7 (VIP)
(13, 22, 'Đã đặt'), -- C8 (VIP)

-- Hàng D
(13, 23, 'Trống'),  -- D1 (Thường)
(13, 24, 'Đã đặt'), -- D2 (VIP)
(13, 25, 'Trống'),  -- D3 (Thường)
(13, 26, 'Trống'),  -- D4 (Thường)
(13, 27, 'Trống'),  -- D5 (Thường)
(13, 28, 'Trống'),  -- D6 (Thường)
(13, 29, 'Trống'),  -- D7 (Thường)
(13, 30, 'Trống'),  -- D8 (Thường)

-- Hàng E
(13, 31, 'Đã đặt'), -- E1 (VIP)
(13, 32, 'Đã đặt'), -- E2 (VIP)
(13, 33, 'Đã đặt'), -- E3 (VIP)
(13, 34, 'Trống'),  -- E4 (Thường)
(13, 35, 'Trống'),  -- E5 (VIP)
(13, 36, 'Trống'),  -- E6 (Thường)
(13, 37, 'Trống'),  -- E7 (Thường)
(13, 38, 'Trống'),  -- E8 (Thường)

-- Hàng F
(13, 39, 'Trống'),  -- F1 (Thường)
(13, 40, 'Trống'),  -- F2 (Thường)
(13, 41, 'Trống'),  -- F3 (Thường)
(13, 42, 'Trống'),  -- F4 (Thường)
(13, 43, 'Trống'),  -- F5 (VIP)
(13, 44, 'Trống');  -- F6 (VIP)

-- Thêm dữ liệu lịch chiếu ghế cho lịch chiếu ID 14 (Phim ID 6, Phòng 3, ngày 15/05/2025)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A
(14, 1, 'Trống'),   -- A1 (Thường)
(14, 2, 'Trống'),   -- A2 (Thường)
(14, 3, 'Trống'),   -- A3 (Thường)
(14, 4, 'Trống'),   -- A4 (Thường)
(14, 5, 'Trống'),   -- A5 (Thường)
(14, 6, 'Trống'),   -- A6 (Thường)

-- Hàng B
(14, 7, 'Trống'),   -- B1 (Thường)
(14, 8, 'Trống'),   -- B2 (Thường)
(14, 9, 'Đã đặt'),  -- B3 (VIP)
(14, 10, 'Đã đặt'), -- B4 (VIP)
(14, 11, 'Trống'),  -- B5 (Thường)
(14, 12, 'Trống'),  -- B6 (Thường)
(14, 13, 'Trống'),  -- B7 (Thường)
(14, 14, 'Trống'),  -- B8 (Thường)

-- Hàng C
(14, 15, 'Trống'),  -- C1 (Thường)
(14, 16, 'Trống'),  -- C2 (Thường)
(14, 17, 'Trống'),  -- C3 (Thường)
(14, 18, 'Trống'),  -- C4 (Thường)
(14, 19, 'Trống'),  -- C5 (Thường)
(14, 20, 'Đã đặt'), -- C6 (VIP)
(14, 21, 'Đã đặt'), -- C7 (VIP)
(14, 22, 'Đã đặt'), -- C8 (VIP)

-- Hàng D
(14, 23, 'Trống'),  -- D1 (Thường)
(14, 24, 'Đã đặt'), -- D2 (VIP)
(14, 25, 'Trống'),  -- D3 (Thường)
(14, 26, 'Trống'),  -- D4 (Thường)
(14, 27, 'Trống'),  -- D5 (Thường)
(14, 28, 'Trống'),  -- D6 (Thường)
(14, 29, 'Trống'),  -- D7 (Thường)
(14, 30, 'Trống'),  -- D8 (Thường)

-- Hàng E
(14, 31, 'Đã đặt'), -- E1 (VIP)
(14, 32, 'Đã đặt'), -- E2 (VIP)
(14, 33, 'Đã đặt'), -- E3 (VIP)
(14, 34, 'Trống'),  -- E4 (Thường)
(14, 35, 'Trống'),  -- E5 (VIP)
(14, 36, 'Trống'),  -- E6 (Thường)
(14, 37, 'Trống'),  -- E7 (Thường)
(14, 38, 'Trống'),  -- E8 (Thường)

-- Hàng F
(14, 39, 'Trống'),  -- F1 (Thường)
(14, 40, 'Trống'),  -- F2 (Thường)
(14, 41, 'Trống'),  -- F3 (Thường)
(14, 42, 'Trống'),  -- F4 (Thường)
(14, 43, 'Đã đặt'), -- F5 (VIP)
(14, 44, 'Đã đặt'); -- F6 (VIP)

-- Thêm dữ liệu lịch chiếu ghế cho lịch chiếu ID 15 (Phim ID 3, Phòng 1, ngày 15/05/2025)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A
(15, 1, 'Đã đặt'),  -- A1 (Thường)
(15, 2, 'Đã đặt'),  -- A2 (Thường)
(15, 3, 'Đã đặt'),  -- A3 (Thường)
(15, 4, 'Đã đặt'),  -- A4 (Thường)
(15, 5, 'Đã đặt'),  -- A5 (Thường)
(15, 6, 'Đã đặt'),  -- A6 (Thường)

-- Hàng B
(15, 7, 'Đã đặt'),  -- B1 (Thường)
(15, 8, 'Đã đặt'),  -- B2 (Thường)
(15, 9, 'Đã đặt'),  -- B3 (VIP)
(15, 10, 'Đã đặt'), -- B4 (VIP)
(15, 11, 'Đã đặt'), -- B5 (Thường)
(15, 12, 'Đã đặt'), -- B6 (Thường)
(15, 13, 'Đã đặt'), -- B7 (Thường)
(15, 14, 'Đã đặt'), -- B8 (Thường)

-- Hàng C
(15, 15, 'Đã đặt'), -- C1 (Thường)
(15, 16, 'Đã đặt'), -- C2 (Thường)
(15, 17, 'Đã đặt'), -- C3 (Thường)
(15, 18, 'Đã đặt'), -- C4 (Thường)
(15, 19, 'Đã đặt'), -- C5 (Thường)
(15, 20, 'Đã đặt'), -- C6 (VIP)
(15, 21, 'Đã đặt'), -- C7 (VIP)
(15, 22, 'Đã đặt'), -- C8 (VIP)

-- Hàng D
(15, 23, 'Đã đặt'), -- D1 (Thường)
(15, 24, 'Đã đặt'), -- D2 (VIP)
(15, 25, 'Đã đặt'), -- D3 (Thường)
(15, 26, 'Đã đặt'), -- D4 (Thường)
(15, 27, 'Đã đặt'), -- D5 (Thường)
(15, 28, 'Đã đặt'), -- D6 (Thường)
(15, 29, 'Đã đặt'), -- D7 (Thường)
(15, 30, 'Đã đặt'), -- D8 (Thường)

-- Hàng E
(15, 31, 'Đã đặt'), -- E1 (VIP)
(15, 32, 'Đã đặt'), -- E2 (VIP)
(15, 33, 'Đã đặt'), -- E3 (VIP)
(15, 34, 'Đã đặt'), -- E4 (Thường)
(15, 35, 'Đã đặt'), -- E5 (VIP)
(15, 36, 'Đã đặt'), -- E6 (Thường)
(15, 37, 'Đã đặt'), -- E7 (Thường)
(15, 38, 'Đã đặt'), -- E8 (Thường)

-- Hàng F
(15, 39, 'Đã đặt'), -- F1 (Thường)
(15, 40, 'Đã đặt'), -- F2 (Thường)
(15, 41, 'Đã đặt'), -- F3 (Thường)
(15, 42, 'Đã đặt'), -- F4 (Thường)
(15, 43, 'Đã đặt'), -- F5 (VIP)
(15, 44, 'Đã đặt'); -- F6 (VIP)

-- Thêm dữ liệu lịch chiếu ghế cho lịch chiếu ID 16 (Phim ID 4, Phòng 2, ngày 16/05/2025)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A
(16, 1, 'Trống'),   -- A1 (Thường)
(16, 2, 'Trống'),   -- A2 (Thường)
(16, 3, 'Trống'),   -- A3 (Thường)
(16, 4, 'Trống'),   -- A4 (Thường)
(16, 5, 'Trống'),   -- A5 (Thường)
(16, 6, 'Trống'),   -- A6 (Thường)

-- Hàng B
(16, 7, 'Trống'),   -- B1 (Thường)
(16, 8, 'Trống'),   -- B2 (Thường)
(16, 9, 'Trống'),   -- B3 (VIP)
(16, 10, 'Trống'),  -- B4 (VIP)
(16, 11, 'Trống'),  -- B5 (Thường)
(16, 12, 'Trống'),  -- B6 (Thường)
(16, 13, 'Trống'),  -- B7 (Thường)
(16, 14, 'Trống'),  -- B8 (Thường)

-- Hàng C
(16, 15, 'Trống'),  -- C1 (Thường)
(16, 16, 'Trống'),  -- C2 (Thường)
(16, 17, 'Trống'),  -- C3 (Thường)
(16, 18, 'Trống'),  -- C4 (Thường)
(16, 19, 'Trống'),  -- C5 (Thường)
(16, 20, 'Trống'),  -- C6 (VIP)
(16, 21, 'Trống'),  -- C7 (VIP)
(16, 22, 'Trống'),  -- C8 (VIP)

-- Hàng D
(16, 23, 'Trống'),  -- D1 (Thường)
(16, 24, 'Trống'),  -- D2 (VIP)
(16, 25, 'Trống'),  -- D3 (Thường)
(16, 26, 'Trống'),  -- D4 (Thường)
(16, 27, 'Trống'),  -- D5 (Thường)
(16, 28, 'Trống'),  -- D6 (Thường)
(16, 29, 'Trống'),  -- D7 (Thường)
(16, 30, 'Trống'),  -- D8 (Thường)

-- Hàng E
(16, 31, 'Trống'),  -- E1 (VIP)
(16, 32, 'Trống'),  -- E2 (VIP)
(16, 33, 'Trống'),  -- E3 (VIP)
(16, 34, 'Trống'),  -- E4 (Thường)
(16, 35, 'Trống'),  -- E5 (VIP)
(16, 36, 'Trống'),  -- E6 (Thường)
(16, 37, 'Trống'),  -- E7 (Thường)
(16, 38, 'Trống'),  -- E8 (Thường)

-- Hàng F
(16, 39, 'Trống'),  -- F1 (Thường)
(16, 40, 'Trống'),  -- F2 (Thường)
(16, 41, 'Trống'),  -- F3 (Thường)
(16, 42, 'Trống'),  -- F4 (Thường)
(16, 43, 'Trống'),  -- F5 (VIP)
(16, 44, 'Trống');  -- F6 (VIP)

-- Thêm dữ liệu lịch chiếu ghế cho lịch chiếu ID 17 (Phim ID 5, Phòng 1, ngày 16/05/2025)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A
(17, 1, 'Trống'),   -- A1 (Thường)
(17, 2, 'Trống'),   -- A2 (Thường)
(17, 3, 'Trống'),   -- A3 (Thường)
(17, 4, 'Trống'),   -- A4 (Thường)
(17, 5, 'Trống'),   -- A5 (Thường)
(17, 6, 'Trống'),   -- A6 (Thường)

-- Hàng B
(17, 7, 'Trống'),   -- B1 (Thường)
(17, 8, 'Trống'),   -- B2 (Thường)
(17, 9, 'Đã đặt'),  -- B3 (VIP)
(17, 10, 'Đã đặt'), -- B4 (VIP)
(17, 11, 'Trống'),  -- B5 (Thường)
(17, 12, 'Trống'),  -- B6 (Thường)
(17, 13, 'Trống'),  -- B7 (Thường)
(17, 14, 'Trống'),  -- B8 (Thường)

-- Hàng C
(17, 15, 'Trống'),  -- C1 (Thường)
(17, 16, 'Trống'),  -- C2 (Thường)
(17, 17, 'Trống'),  -- C3 (Thường)
(17, 18, 'Trống'),  -- C4 (Thường)
(17, 19, 'Trống'),  -- C5 (Thường)
(17, 20, 'Đã đặt'), -- C6 (VIP)
(17, 21, 'Đã đặt'), -- C7 (VIP)
(17, 22, 'Đã đặt'), -- C8 (VIP)

-- Hàng D
(17, 23, 'Trống'),  -- D1 (Thường)
(17, 24, 'Đã đặt'), -- D2 (VIP)
(17, 25, 'Trống'),  -- D3 (Thường)
(17, 26, 'Trống'),  -- D4 (Thường)
(17, 27, 'Trống'),  -- D5 (Thường)
(17, 28, 'Trống'),  -- D6 (Thường)
(17, 29, 'Trống'),  -- D7 (Thường)
(17, 30, 'Trống'),  -- D8 (Thường)

-- Hàng E
(17, 31, 'Đã đặt'), -- E1 (VIP)
(17, 32, 'Đã đặt'), -- E2 (VIP)
(17, 33, 'Đã đặt'), -- E3 (VIP)
(17, 34, 'Trống'),  -- E4 (Thường)
(17, 35, 'Trống'),  -- E5 (VIP)
(17, 36, 'Trống'),  -- E6 (Thường)
(17, 37, 'Trống'),  -- E7 (Thường)
(17, 38, 'Trống'),  -- E8 (Thường)

-- Hàng F
(17, 39, 'Trống'),  -- F1 (Thường)
(17, 40, 'Trống'),  -- F2 (Thường)
(17, 41, 'Trống'),  -- F3 (Thường)
(17, 42, 'Trống'),  -- F4 (Thường)
(17, 43, 'Đã đặt'), -- F5 (VIP)
(17, 44, 'Đã đặt'); -- F6 (VIP)

-- Thêm dữ liệu lịch chiếu ghế cho lịch chiếu ID 18 (Phim ID 6, Phòng 3, ngày 16/05/2025)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A
(18, 1, 'Đã đặt'),  -- A1 (Thường)
(18, 2, 'Đã đặt'),  -- A2 (Thường)
(18, 3, 'Đã đặt'),  -- A3 (Thường)
(18, 4, 'Đã đặt'),  -- A4 (Thường)
(18, 5, 'Đã đặt'),  -- A5 (Thường)
(18, 6, 'Đã đặt'),  -- A6 (Thường)

-- Hàng B
(18, 7, 'Đã đặt'),  -- B1 (Thường)
(18, 8, 'Đã đặt'),  -- B2 (Thường)
(18, 9, 'Đã đặt'),  -- B3 (VIP)
(18, 10, 'Đã đặt'), -- B4 (VIP)
(18, 11, 'Đã đặt'), -- B5 (Thường)
(18, 12, 'Đã đặt'), -- B6 (Thường)
(18, 13, 'Đã đặt'), -- B7 (Thường)
(18, 14, 'Đã đặt'), -- B8 (Thường)

-- Hàng C
(18, 15, 'Đã đặt'), -- C1 (Thường)
(18, 16, 'Đã đặt'), -- C2 (Thường)
(18, 17, 'Đã đặt'), -- C3 (Thường)
(18, 18, 'Đã đặt'), -- C4 (Thường)
(18, 19, 'Đã đặt'), -- C5 (Thường)
(18, 20, 'Đã đặt'), -- C6 (VIP)
(18, 21, 'Đã đặt'), -- C7 (VIP)
(18, 22, 'Đã đặt'), -- C8 (VIP)

-- Hàng D
(18, 23, 'Trống'),  -- D1 (Thường)
(18, 24, 'Trống'),  -- D2 (VIP)
(18, 25, 'Trống'),  -- D3 (Thường)
(18, 26, 'Trống'),  -- D4 (Thường)
(18, 27, 'Trống'),  -- D5 (Thường)
(18, 28, 'Trống'),  -- D6 (Thường)
(18, 29, 'Trống'),  -- D7 (Thường)
(18, 30, 'Trống'),  -- D8 (Thường)

-- Hàng E
(18, 31, 'Trống'),  -- E1 (VIP)
(18, 32, 'Trống'),  -- E2 (VIP)
(18, 33, 'Trống'),  -- E3 (VIP)
(18, 34, 'Trống'),  -- E4 (Thường)
(18, 35, 'Trống'),  -- E5 (VIP)
(18, 36, 'Trống'),  -- E6 (Thường)
(18, 37, 'Trống'),  -- E7 (Thường)
(18, 38, 'Trống'),  -- E8 (Thường)

-- Hàng F
(18, 39, 'Trống'),  -- F1 (Thường)
(18, 40, 'Trống'),  -- F2 (Thường)
(18, 41, 'Trống'),  -- F3 (Thường)
(18, 42, 'Trống'),  -- F4 (Thường)
(18, 43, 'Trống'),  -- F5 (VIP)
(18, 44, 'Trống');  -- F6 (VIP)

-- Thêm dữ liệu lịch chiếu ghế cho lịch chiếu ID 19 (Phim ID 3, Phòng 2, ngày 16/05/2025)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A
(19, 1, 'Trống'),   -- A1 (Thường)
(19, 2, 'Trống'),   -- A2 (Thường)
(19, 3, 'Trống'),   -- A3 (Thường)
(19, 4, 'Trống'),   -- A4 (Thường)
(19, 5, 'Trống'),   -- A5 (Thường)
(19, 6, 'Trống'),   -- A6 (Thường)

-- Hàng B
(19, 7, 'Trống'),   -- B1 (Thường)
(19, 8, 'Trống'),   -- B2 (Thường)
(19, 9, 'Trống'),   -- B3 (VIP)
(19, 10, 'Trống'),  -- B4 (VIP)
(19, 11, 'Trống'),  -- B5 (Thường)
(19, 12, 'Trống'),  -- B6 (Thường)
(19, 13, 'Trống'),  -- B7 (Thường)
(19, 14, 'Trống'),  -- B8 (Thường)

-- Hàng C
(19, 15, 'Trống'),  -- C1 (Thường)
(19, 16, 'Trống'),  -- C2 (Thường)
(19, 17, 'Trống'),  -- C3 (Thường)
(19, 18, 'Trống'),  -- C4 (Thường)
(19, 19, 'Trống'),  -- C5 (Thường)
(19, 20, 'Trống'),  -- C6 (VIP)
(19, 21, 'Trống'),  -- C7 (VIP)
(19, 22, 'Trống'),  -- C8 (VIP)

-- Hàng D
(19, 23, 'Trống'),  -- D1 (Thường)
(19, 24, 'Trống'),  -- D2 (VIP)
(19, 25, 'Trống'),  -- D3 (Thường)
(19, 26, 'Trống'),  -- D4 (Thường)
(19, 27, 'Trống'),  -- D5 (Thường)
(19, 28, 'Trống'),  -- D6 (Thường)
(19, 29, 'Trống'),  -- D7 (Thường)
(19, 30, 'Trống'),  -- D8 (Thường)

-- Hàng E
(19, 31, 'Trống'),  -- E1 (VIP)
(19, 32, 'Trống'),  -- E2 (VIP)
(19, 33, 'Trống'),  -- E3 (VIP)
(19, 34, 'Trống'),  -- E4 (Thường)
(19, 35, 'Trống'),  -- E5 (VIP)
(19, 36, 'Trống'),  -- E6 (Thường)
(19, 37, 'Trống'),  -- E7 (Thường)
(19, 38, 'Trống'),  -- E8 (Thường)

-- Hàng F
(19, 39, 'Trống'),  -- F1 (Thường)
(19, 40, 'Trống'),  -- F2 (Thường)
(19, 41, 'Trống'),  -- F3 (Thường)
(19, 42, 'Trống'),  -- F4 (Thường)
(19, 43, 'Trống'),  -- F5 (VIP)
(19, 44, 'Trống');  -- F6 (VIP)

-- Thêm dữ liệu lịch chiếu ghế cho lịch chiếu ID 20 (Phim ID 4, Phòng 1, ngày 16/05/2025)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A
(20, 1, 'Trống'),   -- A1 (Thường)
(20, 2, 'Trống'),   -- A2 (Thường)
(20, 3, 'Trống'),   -- A3 (Thường)
(20, 4, 'Trống'),   -- A4 (Thường)
(20, 5, 'Trống'),   -- A5 (Thường)
(20, 6, 'Trống'),   -- A6 (Thường)

-- Hàng B
(20, 7, 'Trống'),   -- B1 (Thường)
(20, 8, 'Trống'),   -- B2 (Thường)
(20, 9, 'Đã đặt'),  -- B3 (VIP)
(20, 10, 'Đã đặt'), -- B4 (VIP)
(20, 11, 'Trống'),  -- B5 (Thường)
(20, 12, 'Trống'),  -- B6 (Thường)
(20, 13, 'Trống'),  -- B7 (Thường)
(20, 14, 'Trống'),  -- B8 (Thường)

-- Hàng C
(20, 15, 'Trống'),  -- C1 (Thường)
(20, 16, 'Trống'),  -- C2 (Thường)
(20, 17, 'Trống'),  -- C3 (Thường)
(20, 18, 'Trống'),  -- C4 (Thường)
(20, 19, 'Trống'),  -- C5 (Thường)
(20, 20, 'Đã đặt'), -- C6 (VIP)
(20, 21, 'Đã đặt'), -- C7 (VIP)
(20, 22, 'Đã đặt'), -- C8 (VIP)

-- Hàng D
(20, 23, 'Trống'),  -- D1 (Thường)
(20, 24, 'Đã đặt'), -- D2 (VIP)
(20, 25, 'Trống'),  -- D3 (Thường)
(20, 26, 'Trống'),  -- D4 (Thường)
(20, 27, 'Trống'),  -- D5 (Thường)
(20, 28, 'Trống'),  -- D6 (Thường)
(20, 29, 'Trống'),  -- D7 (Thường)
(20, 30, 'Trống'),  -- D8 (Thường)

-- Hàng E
(20, 31, 'Đã đặt'), -- E1 (VIP)
(20, 32, 'Đã đặt'), -- E2 (VIP)
(20, 33, 'Đã đặt'), -- E3 (VIP)
(20, 34, 'Trống'),  -- E4 (Thường)
(20, 35, 'Trống'),  -- E5 (VIP)
(20, 36, 'Trống'),  -- E6 (Thường)
(20, 37, 'Trống'),  -- E7 (Thường)
(20, 38, 'Trống'),  -- E8 (Thường)

-- Hàng F
(20, 39, 'Trống'),  -- F1 (Thường)
(20, 40, 'Trống'),  -- F2 (Thường)
(20, 41, 'Trống'),  -- F3 (Thường)
(20, 42, 'Trống'),  -- F4 (Thường)
(20, 43, 'Đã đặt'), -- F5 (VIP)
(20, 44, 'Đã đặt'); -- F6 (VIP)

CREATE TABLE thanh_toan (
                            id INT PRIMARY KEY AUTO_INCREMENT,
                            ten varchar(50),
                            so_tai_khoan varchar(50),
                            status int
);

ALTER TABLE giao_dich DROP COLUMN phuong_thuc;

ALTER TABLE giao_dich
    ADD COLUMN phuong_thuc INT;

ALTER TABLE giao_dich
    ADD CONSTRAINT fk_phuong_thuc
        FOREIGN KEY (phuong_thuc) REFERENCES thanh_toan(id);

INSERT INTO thanh_toan(ten, so_tai_khoan, status) VALUES
                                                      ('Momo', '0123456789', 1),
                                                      ('MBBank', '0912345678', 1),
                                                      ('ZaloPay', '0912345678', 1),
                                                      ('Techcombank', '0912345678', 1),
                                                      ('BIDV', '0912345678', 1),
                                                      ('Vietcombank', '0912345678', 1),
                                                      ('VietinBank', '0912345678', 1),
                                                      ('Agribank', '0912345678', 1);
CREATE TABLE chi_tiet_phuong_thuc (
                                      id INT PRIMARY KEY AUTO_INCREMENT,
                                      id_khach_hang INT,
                                      id_thanh_toan INT,
                                      so_tai_khoan varchar(50),
                                      status varchar(50),
                                      FOREIGN KEY (id_khach_hang) REFERENCES khach_hang(id),
                                      FOREIGN KEY (id_thanh_toan) REFERENCES thanh_toan(id)
);

alter table thanh_toan
drop column so_tai_khoan;

ALTER TABLE lich_chieu_ghe
    ADD COLUMN thoi_gian_giu TIMESTAMP NULL,
ADD COLUMN thoi_gian_het_han TIMESTAMP NULL;

UPDATE phim
SET trailer = 'https://www.youtube.com/embed/8hP9D6kZseM'
WHERE id = 1;

UPDATE phim
SET trailer = 'https://www.youtube.com/embed/ELeMaP8EPAA'
WHERE id = 2;

UPDATE phim
SET trailer = 'https://www.youtube.com/embed/S1Qj_AVu2pA'
WHERE id = 3;

UPDATE phim
SET trailer = 'https://www.youtube.com/embed/kVrqfYjkTdQ'
WHERE id = 4;

-- UPDATE phim
-- SET trailer = 'https://www.youtube.com/embed/gCUg6Td5fgQ'
-- WHERE id = 5;

UPDATE phim
SET trailer = 'https://www.youtube.com/embed/qtRKdVHc-cE'
WHERE id = 5;

UPDATE phim
SET trailer = 'https://www.youtube.com/embed/P5ieIbInFpg'
WHERE id = 6;

UPDATE phim
SET trailer = 'https://www.youtube.com/embed/zSWdZVtXT7E'
WHERE id = 7;

UPDATE phim
SET trailer = 'https://www.youtube.com/embed/WHXxVmeGQUc'
WHERE id = 8;

UPDATE phim
SET trailer = 'https://www.youtube.com/embed/n9xhJrPXop4'
WHERE id = 9;

