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
