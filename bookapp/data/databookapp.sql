-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bookapp4
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `chitietdonhang`
--

DROP TABLE IF EXISTS `chitietdonhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietdonhang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sach_id` int DEFAULT NULL,
  `donhang_id` int DEFAULT NULL,
  `soluong` int DEFAULT NULL,
  `dongia` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sach_id` (`sach_id`),
  KEY `donhang_id` (`donhang_id`),
  CONSTRAINT `chitietdonhang_ibfk_1` FOREIGN KEY (`sach_id`) REFERENCES `sach` (`id`),
  CONSTRAINT `chitietdonhang_ibfk_2` FOREIGN KEY (`donhang_id`) REFERENCES `donhang` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietdonhang`
--

LOCK TABLES `chitietdonhang` WRITE;
/*!40000 ALTER TABLE `chitietdonhang` DISABLE KEYS */;
INSERT INTO `chitietdonhang` VALUES (1,2,1,2,73000),(2,1,2,1,70000),(3,2,2,1,73000),(4,3,3,2,87000),(5,4,3,1,51000),(6,1,4,1,70000),(7,4,5,1,51000),(8,9,6,1,50000);
/*!40000 ALTER TABLE `chitietdonhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitietphieunhap`
--

DROP TABLE IF EXISTS `chitietphieunhap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietphieunhap` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sach_id` int DEFAULT NULL,
  `phieunhap_id` int DEFAULT NULL,
  `soluong` int DEFAULT NULL,
  `dongia` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sach_id` (`sach_id`),
  KEY `phieunhap_id` (`phieunhap_id`),
  CONSTRAINT `chitietphieunhap_ibfk_1` FOREIGN KEY (`sach_id`) REFERENCES `sach` (`id`),
  CONSTRAINT `chitietphieunhap_ibfk_2` FOREIGN KEY (`phieunhap_id`) REFERENCES `phieunhap` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietphieunhap`
--

LOCK TABLES `chitietphieunhap` WRITE;
/*!40000 ALTER TABLE `chitietphieunhap` DISABLE KEYS */;
INSERT INTO `chitietphieunhap` VALUES (1,1,1,400,20000),(2,2,1,400,2000),(3,3,1,5000,2000),(4,4,1,200,20000),(5,4,1,160,20000),(6,5,1,151,2000),(7,5,1,151,20000),(8,7,2,151,20000),(9,8,1,151,20000),(10,9,1,200,20000),(11,10,3,160,20000),(12,11,3,200,2000),(13,12,3,200,20000),(14,13,1,190,20000),(15,14,3,170,20000),(16,15,1,160,20000),(17,16,1,154,20000),(18,17,4,170,20000),(19,18,3,170,20000),(20,19,4,180,20000),(21,20,3,170,2000),(22,21,1,180,20000),(23,22,1,160,20000),(24,23,4,170,20000),(25,24,1,300,2000),(26,25,3,300,2000),(27,26,3,300,30000),(28,27,4,400,20000),(29,28,3,266,30000),(30,29,2,200,30000),(31,30,2,298,30000),(32,31,3,200,40000),(33,32,4,2000,30000),(34,33,2,289,28765),(35,34,3,267,23456),(36,35,2,256,56789),(37,36,4,298,30000),(38,37,1,245,17865);
/*!40000 ALTER TABLE `chitietphieunhap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diachi`
--

DROP TABLE IF EXISTS `diachi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diachi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sonha` varchar(100) DEFAULT NULL,
  `phuongxa` varchar(100) DEFAULT NULL,
  `quanhuyen` varchar(100) DEFAULT NULL,
  `tinhtp` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diachi`
--

LOCK TABLES `diachi` WRITE;
/*!40000 ALTER TABLE `diachi` DISABLE KEYS */;
INSERT INTO `diachi` VALUES (1,'371','p7','Gò Vấp','HCM'),(2,'371','phường 7','quận Gò Vấp','Hồ Chí Minh'),(3,'44','pường 7','gò vấp','Đắk Nông'),(4,'371','phường 7','quận Gò Vấp','Hồ Chí Minh'),(5,'371','phường 7','quận Gò Vấp','Hồ Chí Minh'),(6,'371','phường 7','quận Gò Vấp','Hồ Chí Minh');
/*!40000 ALTER TABLE `diachi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diachidathang`
--

DROP TABLE IF EXISTS `diachidathang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diachidathang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `diachi` varchar(100) DEFAULT NULL,
  `sdt` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diachidathang`
--

LOCK TABLES `diachidathang` WRITE;
/*!40000 ALTER TABLE `diachidathang` DISABLE KEYS */;
INSERT INTO `diachidathang` VALUES (1,'Nguyễn Thị Thu Uyên','371phường 7quận Gò VấpHồ Chí Minh','0947653170'),(2,'Tại nhà sách','317 phường 3, Nguyễn Kiệm,Gò Vấp,HCM','0945320117'),(3,'Tại nhà sách','317 phường 3, Nguyễn Kiệm,Gò Vấp,HCM','0945320117'),(4,'Tại nhà sách','317 phường 3, Nguyễn Kiệm,Gò Vấp,HCM','0945320117'),(5,'Tại nhà sách','317 phường 3, Nguyễn Kiệm,Gò Vấp,HCM','0945320117'),(6,'Tại nhà sách','317 phường 3, Nguyễn Kiệm,Gò Vấp,HCM','0945320117');
/*!40000 ALTER TABLE `diachidathang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donhang`
--

DROP TABLE IF EXISTS `donhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donhang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ngaythd` datetime DEFAULT NULL,
  `isduyetdh` tinyint(1) DEFAULT NULL,
  `isthanhtoan` tinyint(1) DEFAULT NULL,
  `nv_id` int NOT NULL,
  `kh_id` int NOT NULL,
  `dcdh_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nv_id` (`nv_id`),
  KEY `kh_id` (`kh_id`),
  KEY `dcdh_id` (`dcdh_id`),
  CONSTRAINT `donhang_ibfk_1` FOREIGN KEY (`nv_id`) REFERENCES `nhanvien` (`id`),
  CONSTRAINT `donhang_ibfk_2` FOREIGN KEY (`kh_id`) REFERENCES `khachhang` (`id`),
  CONSTRAINT `donhang_ibfk_3` FOREIGN KEY (`dcdh_id`) REFERENCES `diachidathang` (`id`),
  CONSTRAINT `donhang_chk_1` CHECK ((`isduyetdh` in (0,1))),
  CONSTRAINT `donhang_chk_2` CHECK ((`isthanhtoan` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donhang`
--

LOCK TABLES `donhang` WRITE;
/*!40000 ALTER TABLE `donhang` DISABLE KEYS */;
INSERT INTO `donhang` VALUES (1,'2020-01-16 18:28:08',0,0,1,1,1),(2,'2020-12-16 18:28:08',1,1,1,1,2),(3,'2020-12-16 18:28:08',1,1,1,1,3),(4,'2020-12-16 18:28:08',1,1,1,1,4),(5,'2020-11-16 23:23:48',1,1,1,1,5),(6,'2020-12-16 23:23:48',1,1,1,1,6);
/*!40000 ALTER TABLE `donhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghino`
--

DROP TABLE IF EXISTS `ghino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ghino` (
  `stt` int NOT NULL AUTO_INCREMENT,
  `nv_id` int NOT NULL,
  `kh_id` int NOT NULL,
  `dh_id` int NOT NULL,
  `ngayno` datetime DEFAULT NULL,
  `tienno` float DEFAULT NULL,
  `istrano` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`stt`),
  KEY `nv_id` (`nv_id`),
  KEY `kh_id` (`kh_id`),
  KEY `dh_id` (`dh_id`),
  CONSTRAINT `ghino_ibfk_1` FOREIGN KEY (`nv_id`) REFERENCES `nhanvien` (`id`),
  CONSTRAINT `ghino_ibfk_2` FOREIGN KEY (`kh_id`) REFERENCES `khachhang` (`id`),
  CONSTRAINT `ghino_ibfk_3` FOREIGN KEY (`dh_id`) REFERENCES `donhang` (`id`),
  CONSTRAINT `ghino_chk_1` CHECK ((`istrano` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghino`
--

LOCK TABLES `ghino` WRITE;
/*!40000 ALTER TABLE `ghino` DISABLE KEYS */;
INSERT INTO `ghino` VALUES (1,1,2,4,'2020-12-16 18:28:08',70000,1),(3,1,1,4,'2020-12-16 23:23:49',70000,0),(5,1,4,4,'2020-12-16 23:23:49',70000,0);
/*!40000 ALTER TABLE `ghino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khachhang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `khachhang_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
INSERT INTO `khachhang` VALUES (1,2),(2,4),(3,5),(4,6);
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanvien` (
  `cmnd` varchar(100) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `nhanvien_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES ('2517152',1,1),('24533',2,3);
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieunhap`
--

DROP TABLE IF EXISTS `phieunhap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieunhap` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ngaynhap` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieunhap`
--

LOCK TABLES `phieunhap` WRITE;
/*!40000 ALTER TABLE `phieunhap` DISABLE KEYS */;
INSERT INTO `phieunhap` VALUES (1,'2020-05-06 18:28:08'),(2,'2020-12-16 18:28:08'),(3,'2020-10-12 18:28:08'),(4,'2020-06-10 18:28:08');
/*!40000 ALTER TABLE `phieunhap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sach`
--

DROP TABLE IF EXISTS `sach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sach` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `tacgia` varchar(100) DEFAULT NULL,
  `mota` text,
  `gia` float DEFAULT NULL,
  `nhaxb` varchar(100) DEFAULT NULL,
  `namxb` datetime DEFAULT NULL,
  `anh` varchar(100) DEFAULT NULL,
  `soluong` int DEFAULT NULL,
  `theloai_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `theloai_id` (`theloai_id`),
  CONSTRAINT `sach_ibfk_1` FOREIGN KEY (`theloai_id`) REFERENCES `theloai` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sach`
--

LOCK TABLES `sach` WRITE;
/*!40000 ALTER TABLE `sach` DISABLE KEYS */;
INSERT INTO `sach` VALUES (1,'Không Còn Đường Lùi Mới Có Thành Công','Lý Thượng Long,','Có bao nhiêu người còn chưa hiểu rõ chuyện của tuổi 20 đã vội vàng bước vào 30? \r\n\r\n“Có những lúc sở dĩ chúng ta thất bại chính là vì có quá nhiều lựa chọn, không thể nào quyết đoán, không thể nào dũng cảm tiến về phía trước. Giống như một người băn khoăn nên mua sách học ngoại ngữ nào, cuối cùng chẳng học thuộc được một từ nào; một người băn khoăn nên đến phòng tập nào, cuối cùng chẳng chạy bộ một ngày nào. Rất nhiều khi, chỉ có chặn đường lùi, chúng ta mới có thể nhìn thấy con đường dẫn tới thành công.” \r\n\r\nKhông còn đường lùi mới có thành công, một cái tên có thể nói lên được giá trị quan mà mỗi người chúng ta nên có trong thời đại ngày nay.  \r\n\r\nCuốn sách này giúp cho bạn biết cách từ giao tiếp, trao đổi với người khác đến nâng cao kĩ năng của bản thân và phương thức tư duy chính xác khi đối mặt với thế giới này, tập trung rất nhiều thông tin hữu ích.  \r\n\r\nCùng nhau trải nghiệm với “Không còn đường lùi mới có thành công! ',70000,'Kim Đồng','2018-06-02 00:00:00','images/upload/khong-con-duong-lui-moi-co-thanh-cong.jpg',398,1),(2,'Không Sợ Đêm Đen Bởi Trong Lòng Có Ánh Sáng','Mễ Tô','“Trong bất cứ hoàn cảnh nào, chúng ta đều có một quyền tự do sau cuối, đó là quyết định thái độ của bản thân.”  \r\n\r\n Đứng trước nỗi thất vọng: Có người khóc òa đau đớn, có người học được cách thôi đặt kỳ vọng vào người khác.\r\n\r\n Đứng trước những mất mát: Có người mãi than vãn về những bất hạnh đó, có người lại thấy mình vẫn còn may mắn vì nhận ra giá trị của những gì mình đang có.\r\n\r\n Đứng trước gian nan: Có người chùn bước hoặc loay hoay tìm lối thoát, có người dấn bước với tất cả ý chí, sức mạnh và dũng cảm đương đầu mọi thử thách.\r\n\r\n Đứng trước thất bại: Có người suy sụp muốn buông xuôi, có người vượt lên, vững vàng bước tiếp con đường của mình với một bài học quý giá thêm vào hành trang trải nghiệm cuộc sống.\r\n\r\n“Không sợ đêm đen bởi trong lòng có ánh sáng” - một cuốn sách, một tâm niệm dành tặng cho tất cả những ai đang đặt những bước chân đầu tiên trên con đường tự lập, để mỗi chúng ta hiểu rằng:\r\n\r\n Có ánh sáng của lòng từ bi sẽ không sợ những đoạn đường đời đầy cám dỗ.\r\n\r\nCó ánh sáng của trí tuệ sẽ không sợ lạc vào ngõ cụt bế tắc phương hướng\r\n\r\nCó ánh sáng của sự kiên trì sẽ không sợ đi mãi mà không đợi được bình minh.\r\n\r\nChúng ta giống như những bức tường, có va vấp với bão giông cuộc đời, có những khe nứt, nhưng đó cũng là nơi ánh sáng chiếu vào. \r\n\r\nĐến sau cùng, chúng ta vẫn là người quyết định và làm chủ cuộc đời mình.\r\n\r\nHoặc hờ hững khuất phục, làm khán giả và cảm nhận cuộc đời mình qua định nghĩa, qua cách nhìn của người khác.\r\n\r\nHoặc hăng hái nhập cuộc và hiểu rõ hơn cuộc sống qua những trải nghiệm của bản thân.',73000,'Kim Đồng','2020-02-22 00:00:00','images/upload/khong-so-dem-den-boi-trong-long-co-anh-sang.jpg',397,1),(3,'Người Cân Bằng Cuộc Sống','Kim Jinwoo','Người Cân Bằng Cuộc Sống\r\n\r\nCuốn sách dành cho những ai muốn có được tất cả, từ công việc đến cuộc sống, từ sức khỏe đến một cuộc đời có giá trị.\r\n\r\nKim Jinwoo – Huấn luyện viên cá nhân, người phụ trách việc luyện tập thể hình của nhiều ngôi sao thần tượng, người mẫu, diễn viên và quản lý cấp cao như: BTS, Park Boyoung, Yoon Park, 2AM, 2PM, GOT7, Apink Son Naeun, WJSN Cheng Xiao,… Ông viết về phương pháp để bạn có thể “cân bằng cuộc sống” cả về thể chất và tinh thần, đồng thời tìm kiếm một lối sống lành mạnh hơn. Sử dụng kinh nghiệm cá nhân của chính tác giả trong quá khứ với những người nổi tiếng, độc giả có thể sống một cuộc đời hạnh phúc hơn. Cuốn sách cũng gợi ý những cách thức cụ thể tốt hơn để tìm kiếm sự cân bằng giữa công việc và sức khỏe.\r\n\r\nThời đại mà chỉ những thân hình cuồn cuộn cơ bắp hay “mình hạc sương mai” mới được tán dương đã qua rồi. Làm thế nào để có một cơ thể khỏe mạnh và cân đối, để có thể tận hưởng cuộc sống với thể trạng tốt nhất, đó mới là thứ thật sự cần thiết, đáng để chúng ta trăn trở. Đã đến lúc phải xóa bỏ những thực đơn ăn kiêng hay lộ trình tập luyện 100 ngày với mục tiêu có được thân hình hoàn hảo bằng việc luyện tập quá sức. Và đây là lúc chúng ta cần suy ngẫm về sự cân bằng.\r\n\r\nTập luyện không phải là công cụ để tạo ra thân hình đẹp, chúng ta không được biến việc tập luyện trở thành một sự kiện mang tính nhất thời với mục đích là đạt được một cơ thể như mong muốn. Tập luyện phải là một phần của cuộc sống, và thông qua nó, chúng ta phải tìm được “sự cân bằng” để tích lũy thật nhiều năng lượng và duy trì cuộc sống.',87000,'Kim Đồng','2020-12-04 00:00:00','images/upload/nguoi-can-bang-cuoc-song.jpg',4998,1),(4,'Hạt Giống Tâm Hồn ',' First News Tổng Hợp','Trong cuộc sống chúng ta ai cũng có một uớc mơ cho một ngày mai thật đẹp, dù bình dị hay phi thường. Những ước mơ đáng quý, đáng trân trọng đó luôn là niềm hy vọng, là nguồn động lực và niềm tin lớn nhất cho mỗi người để sống, để cảm nhận và hướng đến ngày mai.\r\n\r\nNhưng cuộc sống luôn tìm ẩn những trở ngại, khó khăn, và thử thách bất ngờ - con đường đi đến những ước mơ ấy không hề bằng phẳng. Bao khó khăn, trở ngại và cả bất hạnh có thể xảy ra vào những lúc không mong chờ nhất như để thử thách lòng dũng cảm của con người. Đó có thể là những trở ngại nhỏ ta vấp phải vào một thời điểm nào đó trước khi tự đứng thẳng trên đôi chân của mình. Có thể nó như những đám mây đen kịt báo hiệu cơn dông, khiến ngay cả những tâm hồn dũng cảm nhất cũng phải tìm kiếm chở che. Cũng có thể do khách quan hay là những ngục tù mà chính ta tự đưa mình vào... khiến ta tổn thương, mất niềm tin, và có lúc tưởng như không còn điểm tựa hay nghị lực để vượt qua. Trước những khó khăn thử thách ấy, mỗi người sẽ tự chọn cho mình cách đón nhận, đối đầu để có một hướng đi riêng. Có những phó thác cho số phận, có người trốn chạy để tìm nơi trú ẩn, có người tự thay đổi để thích nghi với hoàn cảnh mới, cũng có người ngã gục trong cơn giông tố cuộc đời...\r\n\r\nThế nhưng, bất kể là ai, tự đáy lòng của mỗi con người đều tồn tại một khát vọng mãnh liệt - đó chính là khát vọng sống - và được luôn là chính mình. Chính khát vọng ấy đã khiến bao trái tim trăn trở, thao thức tìm cho mình một cách nghĩ, một sức mạnh tinh thần, một hướng đi để theo đuổi những hoài bão, ước mơ của mình. Cuốn sách Những Câu Chuyện Cuộc Sống sẽ là người bạn đồng hành cùng độc giả vượt qua những khó khăn thử thách trong cuộc sống thường ngày, những nỗi mất mát, tổn thương tinh thần, tình cảm, những thăng trầm trên bước đường theo đuổi ước mơ của cuộc đời và vươn lên vì cuộc sống tốt đẹp hơn.  \r\n',51000,'Kim Đồng','2020-06-16 00:00:00','images/upload/hat-giong-tam-hon-tap-7-nhung-cau-chuyen-cuoc-song-tai-ban-2016-1.jpg',358,1),(5,'Nếu Biết Ngày Mai Rời Quán Trọ','Thích Nữ Nhuận Bình','NẾU BIẾT NGÀY MAI RỜI QUÁN TRỌ: MÙA SỢ HÃI, MÙA YÊU THƯƠNG!\r\n\r\nNếu biết ngày mai rời quán trọ là quyển sách thứ tư của tác giả - sư cô Thích Nữ Nhuận Bình, sau các tác phẩm Mở lối yêu thương, Gieo mầm hạnh phúc, Bước qua thăng trầm. Quyển sách này được viết vào thời điểm chúng ta đang phải đối mặt với những mối nguy hại mà dịch bệnh và thiên tai mang lại. Một năm 2020 sắp sửa trôi qua với quá nhiều sự kiện tiêu cực, nhưng đó cũng là lúc ta nhận ra được nhiều chân giá trị mà cuộc đời ban tặng - những điều vốn bị lãng quên trong cuộc sống thường ngày: tình yêu Tổ quốc, yêu đồng bào; tình yêu cho gia đình, yêu bạn bè; yêu cả những người bạn không cùng quốc tịch nhưng luôn biết cách đùm bọc lẫn nhau. Như tác giả Thích Nữ Nhuận Bình đã viết trong Nếu biết ngày mai rời quán trọ rằng: Đây là mùa sợ hãi, nhưng cũng là mùa để yêu thương!\r\n\r\nAi cũng nói, trên đời này chuyện không như ý nhiều vô số kể. Nhưng thật ra, cuộc đời luôn công bằng, tốt xấu có đủ cho mỗi chúng ta, chỉ là nhãn quan, tầm nhận thức và dung lượng trái tim chẳng tương đồng nên mỗi người có cách nhìn đời với nhiều dị biệt. Đủ nắng hoa mới nở, đủ ấm sương mới tan, đủ thời gian xác thân này mới hòa vào cát bụi. Không có đau khổ con người chẳng nhìn ra hạnh phúc. Không có tổn thương chẳng ai biết trân quý tình người. Thiên hạ thù ghét khổ đau và hân hoan đón chào hạnh phúc, chẳng ai biết rằng nhờ khổ đau hạnh phúc mới được thăng hoa, nhờ bão tố loài người mới trưởng thành khôn lớn.\r\n\r\nSuy cho cùng, hạnh phúc hay đau khổ, bão tố hay bình yên đều do tâm mà ra cả.',88000,'Kim Đồng','2020-12-13 00:00:00','images/upload/neu-biet-ngay-mai-roi-quan-tro.jpg',302,1),(7,'Cứ Viết Đi! Nuôi Dưỡng Sáng Tạo - Chữa Lành Bản Thân','Greta Solomon','Ngày nay, trong các mối quan hệ, thậm chí ngay trong những suy nghĩ riêng tư nhất, dường như trí não đã được lập trình và buộc bạn phải tự “kiểm duyệt” chính mình. Để bảo vệ bản thân khỏi tổn thương, nó ngăn cản bạn thể hiện mình với những người xung quanh một cách nguyên bản nhất.\r\n\r\nNếu tìm một nơi lẩn trốn hoặc môi trường đáng tin cậy là điều bất khả thi, thì viết lách sẽ cho bạn không gian an toàn để được là chính mình. CỨ VIẾT ĐI! gói gọn tất cả: những câu chuyện, ý tưởng, điều đáng suy ngẫm, kỹ thuật viết, những thách thức và bài tập. Nó cho bạn công cụ để lắng nghe tiếng nói sâu bên trong tâm hồn mình, nuôi dưỡng sự sáng tạo và hướng bạn tới bản ngã tối thượng. Nó sẽ vỗ về để bạn thể hiện những gì mình thực sự nghĩ và thực sự cảm thấy.\r\n\r\nCầm bút lên và CỨ-VIẾT-ĐI! Khoảnh khắc không còn sợ hãi hay e ngại việc viết, là lúc bạn bắt đầu tìm thấy chính con người mình.',79000,'Kim Đồng','2019-06-13 00:00:00','images/upload/cu-viet-di-nuoi-dung-sang-tao-chua-lanh-ban-than.jpg',151,1),(8,'Gấu Mèo Chester Và Quả Sồi Đong Đầy Kỷ Niệm','Audrey Penn, Barbara L. Gibson','GẤU MÈO CHESTER VÀ QUẢ SỒI ĐONG ĐẦY KỶ NIỆM \r\n\r\nChú Gấu Mèo Chester bé nhỏ trong câu chuyện lần này đã gặp phải một chuyện buồn mà có lẽ bạn nhỏ nào cũng từng gặp phải, đó là việc phải chia tay với một người bạn, Sóc Skiddil.  \r\n\r\nBạn Chester rất buồn vì sẽ không còn được gặp lại bạn sóc Skiddil nữa, không còn được chơi chung với bạn ấy nữa. Mẹ Gấu Mèo đã thấu hiểu và đề nghị Chester đi tìm những thứ có thể gợi nhớ về bạn Sóc, những chú bươm bướm, bờ hồ, và cả quả sồi xinh đẹp. Tất cả những điều đó đều gợi nhớ cho Chester về bạn Sóc Skiddil, cũng như những kỉ niệm mà cả hai đã cùng chơi với nhau. Cuối cùng Chester đã hiểu được, dù không còn gặp lại bạn ấy nữa nhưng bạn Sóc Skiddil sẽ luôn được nhớ tới thông qua quả sồi bé nhỏ. Câu chuyện ngọt ngào mang đến cho độc giả thông điệp về tình yêu thương và giá trị của những kỉ niệm trong trái tim mỗi người. ',50000,'Kim Đồng','2018-07-16 00:00:00','images/upload/gau-meo-chester-va-qua-soi-dong-day-ky-niem.jpg',151,2),(9,'Cá Voi Dài Bao Nhiêu?',' Alison Limentani','Đã bao giờ bạn thắc mắc, cá voi dài chừng nào? Còn cá heo và sư tử biển thì sao nhỉ? Hãy cùng khám phá những điều đó trong cuốn sách siêu thú vị và đầy ắp những thông tin bổ ích này nhé!',50000,'Kim Đồng','2019-06-16 00:00:00','images/upload/ca-voi-dai-bao-nhieu.jpg',199,2),(10,'Gi Gỉ Gì Gi, Cái Gì Cũng Biết - 130 Bí Mật Vui Nhất Cho Tuổi Tiểu Học','Hanazono Makoto','Vui thú biết bao khi được khám phá mọi thứ xung quanh!\r\n\r\nCó vô số câu hỏi “vì sao” quanh ta mỗi phút giây. Mỗi ngày giải đáp được một câu trong số ấy thì thú vị biết mấy, kiến thức cùng lòng ham học hỏi trong ta sẽ lớn lên dần. Cuốn sách này là người bạn đắc lực đem đến những điều ngộ nghĩnh ta thường bắt gặp buổi sáng, buổi trưa, buổi tối và các ngày nghỉ.\r\nCùng tìm hiểu hơn 100 bí mật về Cơ thể con người, Thế giới tự nhiên, Cuộc sống quanh ta, Đồ ăn thức uống, Những thứ phục vụ cuộc sống của con người!\r\n\r\nTác giả: Hanazono Makoto (Giảng viên Khoa Giáo dục trẻ em Đại học Teikyo)\r\nTốt nghiệp tiến sĩ khoa Nông nghiệp Đại học Nagoya, học thêm khoa y Đại học Teikyo, hiện đang giảng dạy tại Đại học Teikyo. Tham gia thành lập khoa Khoa học về động vật, hiện là trưởng khoa Giáo dục nhi đồng, đảm nhiệm vị trí quản lý kết nối với các địa phương, viết ra nhiều cuốn sách về trẻ em và động vật. Tác giả sáng tạo ra phương pháp dạy dùng “Phòng chơi với động vật” ứng dụng tốt cho trẻ em mẫu giáo và tiểu học.',20000,'Kim Đồng','2019-02-07 00:00:00','images/upload/gi-gi-gi-gi-cai-gi-cung-biet-130-bi-mat-vui-nhat-cho-tuoi-tieu-hoc.jpg',160,2),(11,'Con Về Không Phải Bởi Phép Màu','Đào Hải Ninh','Bộ sách 2 cuốn Con về và Con về không phải phép màu là những cuốn sách được ghi lại  từ trải nghiệm của chính người trong cuộc là cha mẹ có con tự kỷ – Đào Hải Ninh và những người bạn đồng hành.\r\n\r\n15 năm trước, chị Đào Hải Ninh là một người phụ nữ của công việc đầy năng động, chị làm trong lĩnh vực tài chính ngân hàng và có vị trí nhiều người mơ ước. Chị luôn là người người tự tin, chủ động lập kế hoạch cho nhưng bước tiến của cuộc đời mình. Ngay cả việc sinh con chị cũng lên kế hoạch kĩ càng và cầu toàn với kết quả như mong đợi, một gia đình thành đạt vợ chồng đều có địa vị trong xã hội với hai đứa con đủ nếp đủ tẻ. Cuộc sống của chị cứ thuận lợi như vậy cho đến khi cô con gái thứ 2 của chị sau những tiếng bi bô đầu đời rồi rơi vào “câm” hẳn - con không thể phát ra âm thanh và thường xuyên có những biểu hiện của trẻ tăng động. Chị vẫn cho đó là bình thường, con chị có thể chỉ chậm nói mà thôi, cho đến khi một người bạn là bác sĩ đến nhà chơi dè dặt nói với chị vì sự bất bình thường của con mình, chị không tin con mình không bình thường. Đến tận lúc cầm kết quả kiểm tra của con gái với chẩn đoán của bác sĩ, con chị là trẻ tự kỷ với điểm 41/50 (theo thang điểm CARS) và được xác định là “không thể phục hồi”, chị mới cay đắng nhận ra rằng con mình mắc “bệnh” không giống ai, “bệnh” không thuốc chữa “bệnh” không bao giờ khỏi.',20000,'Kim Đồng','2020-12-26 00:00:00','images/upload/con-ve-khong-phai-boi-phep-mau-1.jpg',200,3),(12,'Thiên Cầu Ma Thuật - Người Thầy Bí Ẩn','Nguyễn Dương Quỳnh,','“Chính vì chúng ta có thể nhìn thấy ánh sáng của ma thuật, nên mới bị lôi cuốn như thế… Cả đời chúng ta đều không thể thoát được thôi thúc ấy… Muốn biết nhiều hơn về thế giới.”\r\nSự tò mò và khát khao cái tận cùng của chân lý – thế giới và nguyên cớ mở ra Thiên cầu ma thuật cũng vì lẽ trên mà ra. Một bối cảnh không mấy xa lạ với vùng thôn quê nhỏ miền nam Việt Nam những năm 90, nơi mà internet vừa chạm cửa mỗi nhà, lũ nhóc vẫn chạy hoài dọc những con đường nhỏ, lấm bẩn từ mấy trò chơi nơi đường làng, ngõ nhỏ. Ở vùng hẻo lảnh bình yên ấy, ma thuật dần nhen nhóm, những ẩn giấu về thế giới pháp sư được hé lộ, câu hỏi xa dần theo chân người ra đi biền biệt và hành trình tìm câu trả lời của đứa nhỏ bị bỏ lại bắt đầu…\r\nMọi chuyện mở ra từ chiếc phong thư có gắn dấu xi đỏ của một nơi có tên Viện nghiên cứu. Ba Chính, một pháp sư ẩn mình dưới nghề thợ mộc vui mừng ra mặt, vội vã khăn gói hành lý và bay sang Nhật Bản để thỏa lòng nghiên cứu ma thuật của mình. Ở lại vùng làng quê bé nhỏ với những hoang mang về công việc của ba, hai chị em Chính nương tựa lẫn nhau để sống, quả Thiên cầu là kỷ vật duy nhất ba Chính để lại cho Chính, cũng là thứ không ngừng khơi lên nơi Chính những tò mò phải tìm hiểu bằng được về ba, về ma thuật và tin tức của ông chốn Nhật Bản. ',30000,'Kim Đồng','2018-02-16 00:00:00','images/upload/thien-cau-ma-thuat-nguoi-thay-bi-an.jpg',200,3),(13,'Chuyện Chúng Ta Không Cần Người Thứ Ba','Hạt Dẻ Dưa Hấu','Chuyện Chúng Ta Không Cần Người Thứ Ba\r\n\r\nHai người thì nồng nhiệt, ba người thì mất vui.\r\n\r\nVà \"Chuyện chúng ta không cần người thứ ba\" là cuốn sách để chúng ta cùng nhau thấu hiểu điều giản đơn ấy.\r\n\r\n\"Chuyện chúng ta không cần người thứ ba\" - giống như cái tên của nó, cuốn sách này không phải là những câu chuyện tình yêu êm đềm chỉ mang màu hạnh phúc, đó còn là những câu chuyện không mấy bình yên nhưng cũng đầy hiện thực:\r\n\r\n“Nhà đã dột lại còn gặp mưa giông, crush chưa đổ thì lại có đứa cán ngang đường, yêu nhau chưa về chung nhà thì sừng non đã rục rịch nhú lên\".\r\n\r\nQua 11 truyện ngắn với những nhân vật có độ tuổi, thân phận, hoàn cảnh khác nhau cùng đủ loại tình huống trái ngang, dở khóc dở cười được kể bằng một giọng văn linh hoạt khéo léo và cũng rất hài hước hóm hỉnh, tác giả Hạt Dẻ Dưa Hấu đã phác thảo 11 câu chuyện đầy thú vị chất chứa hơi thở của cuộc sống. 11 câu chuyện hấp dẫn thậm chí đôi khi có chút éo le nhưng không hề nặng nề hay ảm đạm ấy sẽ dẫn dắt bạn bước vào thế giới tương tư đầy phức tạp của xã hội hiện đại, nơi mà chúng ta gặp quá nhiều chuyện lừa gạt nhưng vẫn nhen nhóm đâu đó những mong mỏi về thứ tình yêu lâu dài không tạm bợ.',50000,'Kim Đồng','2018-07-16 00:00:00','images/upload/chuyen-chung-ta-khong-can-nguoi-thu-ba.jpg',190,3),(14,'Khóc Giữa Sài Gòn','Nguyễn Ngọc Thạch','Khóc Giữa Sài Gòn\r\n\r\n“Khóc giữa Sài Gòn” cho những ngày yêu đương khờ dại…\r\n\r\nSài Gòn, thành phố của những kẻ cô đơn. Sài Gòn cứ hối hả, còn người ta cứ mãi dại khờ.\r\n\r\n“Khóc giữa Sài Gòn” là một bức tranh rất thực với rượu, với thuốc, nước mắt và rất nhiều nước mắt.\r\n\r\nỞ đó, người ta bên nhau trong những ánh đèn lấp lánh  không bao giờ tắt. Rồi lại vội vã, giấu đi những giọt lệ biệt ly ở một bến xe khách lúc hai, ba giờ sáng. \r\n\r\nSài Gòn, nơi có những con người dám chết vì nhau, dám sống vì nhau, và dám khóc vì nhau.\r\n\r\nPhan, Nam, Tú, Mễ, Thụy, Ân, 6 con người, 6 màu sắc khác nhau. Họ lạc lối trong niềm đau, sống trong những ảo ảnh và ước vọng do mình tạo nên. \r\n\r\nHọ va vào đời nhau, dẫu chỉ trong một khoảnh khắc mong manh, ngắn ngủi. Nhưng cũng khiến trái tim mỗi người mang nhiều những dư âm. ',90000,'Kim Đồng','2018-06-10 00:00:00','images/upload/khoc-giua-sai-gon.jpg',170,3),(15,'Rồi Hoa Sẽ Nở, Rồi Đời Sẽ Tươi','Đinh Hạo','Rồi Hoa Sẽ Nở, Rồi Đời Sẽ Tươi\r\n\r\nTrong cuộc sống bận rộn với bao con người tấp nập lướt qua nhau luôn có những nỗi buồn được ẩn giấu bên dưới nụ cười cùng vỏ bọc hoàn hảo, những trái tim từng bị tổn thương mãi mãi không thể chữa lành nhưng vẫn điên cuồng tìm lại tình yêu đã mất, những tâm hồn vĩnh viễn sống trong sự huy hoàng đẹp đẽ của quá khứ chứ không chấp nhận sự thật đắng cay… Càng trưởng thành, chúng ta càng hiểu rõ: Mọi hơi ấm đều phải trải qua quá trình chưng cất bằng nước mắt. Biết càng nhiều, tổn thương càng sâu. Dẫu có giả vờ cũng vô ích.\r\n\r\nThế nhưng bạn ơi, đừng sợ hãi. Bởi cơn mưa kia rồi cũng sẽ tạnh, nắng rồi cũng sẽ lên, ốm lâu ngày sẽ thành thầy thuốc, chỉ cần gặp sỡ, chỉ cần vượt qua, sau cùng đều sẽ trở thành ngày mai tươi sáng. Hoa rồi sẽ nở, đời - ắt sẽ “tươi”.\r\n\r\n“Rồi hoa sẽ nở, rồi đời sẽ tươi” của Đinh Hạo mang màu sắc như một nốt nhạc trầm giữa một bức tranh tươi vui mà chúng ta tự vẽ. Có những câu chuyện sẽ chạm đến tâm can của bạn, những mối tình đứt đoạn, những số phận bị cuộc đời đối xử khắc nghiệt nhưng vẫn lạc quan kiếm tìm hạnh phúc… Họ tồn tại ở một nơi nào đó trong đời, có thể là ai đó, cũng có thể là chính bạn – nhưng tất thảy đều sẽ như những bông hoa nhỏ kiên cường, hy vọng ánh cầu vồng sau mưa.\r\n',40000,'Kim Đồng','2018-07-06 00:00:00','images/upload/roi-hoa-se-no-roi-doi-se-tuoi.jpg',160,3),(16,'Tuổi Trẻ Của Chúng Ta Sẽ Xanh Mãi Mãi','Jinie Lynk,','“TUỔI TRẺ CỦA CHÚNG TA SẼ XANH MÃI MÃI” – CUỐN SÁCH VỀ THANH XUÂN ĐÁNG ĐỌC NHẤT\r\n\r\nCác cậu còn nhớ cuốn sách xinh đẹp này không? Cuốn sách làm thổn thức biết bao nhiêu trái tim khi nhớ vè quãng thời gian thanh xuân tươi đẹp đã qua. Cuốn sách khiến bất cứ ai đọc cũng rơi nước mắt khi nhớ về mối tình đầu, về trường lớp thầy cô, về những người bạn thân chung bàn năm nào đã lâu không gặp.\r\n\r\n1000 bản hết ngay sau 3 ngày mở link.\r\n\r\nTái bản ngay sau 2 tuần phát hành.\r\n\r\n“TUỔI TRẺ CỦA CHÚNG TA SẼ XANH MÃI MÃI” được các bạn độc giả nhận xét là Cuốn sách về thanh xuân đáng đọc nhất đã trở lại với “diện mạo” xinh đẹp và “thanh xuân vườn trường” hơn bao giờ hết cùng bộ postcard “Đừng lãng phí những ngày đẹp trời” phiên bản đặc biệt.',60000,'Kim Đồng','2018-05-31 00:00:00','images/upload/tuoi-tre-cua-chung-ta-se-xanh-mai-mai.jpg',154,3),(17,'Tiếc Rằng Mình Chẳng Đợi Được Nhau',' Khải Vệ','Trên đời này, tuyệt nhiên cái gì cũng đều có giới hạn.\r\n\r\nKhông ai yêu mãi được một người trong vô vọng. Càng chẳng ai chờ mãi được một bóng lưng vô tình.\r\n\r\nThất vọng đủ nhiều, ai rồi cũng sẽ đều phải buông tay.\r\n\r\nThế giới vẫn quay, chỉ mình bạn ngồi lại. Ai cũng đang chiến đấu với đủ điều ngoài kia, bạn không thể ôm mãi nỗi đau mà trì hoãn những chuyện khác trong cuộc đời mình được.\r\n\r\nVậy nên, bạn à.\r\n\r\nĐứng dậy, bước đi và sống tiếp.\r\n\r\nVì dù bạn có ngồi đó bao lâu nữa, cũng không ai quay trở lại, càng không ai bên cạnh bạn mãi để vực bạn dậy đâu. Tất cả đều chỉ có thể là bạn, chỉ có thể là bạn mới giúp mình đứng lên được\r\n\r\nChuyện tình yêu, suy cho cùng cũng chỉ là một gia vị trong cuộc sống. Có thì đậm đà, nhưng không có thì cũng chẳng sao. Học cách sống nhạt đi một chút không chết ai cả.',60000,'Kim Đồng','2017-06-03 00:00:00','images/upload/tiec-rang-minh-chang-doi-duoc-nhau.jpg',170,3),(18,'Người Từng Là Tất Cả Giờ Chỉ Còn Cái Tên','Jathy','Người Từng Là Tất Cả Giờ Chỉ Còn Cái Tên\r\n\r\nTrên đời này luôn có một vài người mà bản thân không cách nào yêu, nhất định phải phụ lòng họ. Cũng như có một vài người mình không cách nào từ bỏ được để mà nhất định phải làm tổn thương mình. Bầu trời hôm ấy từng rất xanh. Bầu trời hôm nay cũng vậy, ngày mai cũng thế, năm tới sẽ vẫn xanh; chỉ có điều, chúng ta đã không còn như hôm ấy, sau này cũng sẽ không...\r\n\r\nNGƯỜI TỪNG LÀ TẤT CẢ GIỜ CHỈ CÒN CÁI TÊN là tập hợp các câu chuyện tình mang theo nỗi buồn man mác của tuổi trẻ. Đọc những trang sách của Jathy bạn sẽ nhận ra đâu đó trong những câu chuyện có hình bóng của chính mình.\r\n\r\nBạn sẽ nhận ra. À, thì ra có những chuyện khi đã xảy ra rồi mới nhận thấy hoá ra bản thân vốn đã biết trước, nhưng vẫn giả vờ muốn tin những điều giả dối là chân thật, vì sợ tổn thương nên cứ vờ như mình chẳng hề tổn thương. Từng thề hẹn mang đến cho nhau cả thế giới, cuối cùng một mảnh thế giới cũng không còn. Ai tin vào lời hứa, người đó sẽ đau lòng.\r\n\r\nTại sao lại đau lòng khi đối với nhau chỉ là người dưng... Tại sao có thể cùng nhau vượt qua giông bão, nhưng chẳng thể hạnh phúc ngày mưa tan.. Tại sao trái đất này ba phần tư là nước mắt? Ba phần tư những người yêu nhau mà không lấy được nhau? Có những chuyện tình mà khi khép lại, không có nhiều sự níu kéo vật vã hay đau khổ dài lâu, mà chỉ là những cơn mất ngủ thi thoảng kéo tới, hoặc những lần giật mình khi thấy dáng quen trên phố, chỉ thế thôi.',50000,'Kim Đồng','2019-02-08 00:00:00','images/upload/chuyen-chung-ta-khong-can-nguoi-thu-ba.jpg',170,3),(19,'Tôi Và Mèo Đều Rất Nhớ Em','Yên Ba Nhân Trường An','Tôi Và Mèo Đều Rất Nhớ Em\r\n\r\nCuốn sách là những phút giây đời thường hài hước, những khoảnh khắc dịu dàng cảm động qua 11 câu chuyện tình yêu có bóng dáng của các bé thú cưng, khiến bạn khi khóc khi cười.\r\n\r\nSách còn có thể tên là:\r\n\r\n“Cuộc chiến không hồi kết của con sen và quàng thượng”\r\n\r\n”Chia tay không đáng sợ, tôi còn cún cơ mà!”\r\n\r\n…\r\n\r\nLưu ý: Không nên đọc sách ở các địa điểm công cộng như trên xe buýt hay trung tâm thương mại, rất có thể bạn sẽ không ngừng cười được, gây mất trật tự công cộng. Hoặc thậm chí, vừa đọc vừa rơi nước mắt.',30000,'Kim Đồng','2018-06-14 00:00:00','images/upload/toi-va-meo-deu-rat-nho-em.jpg',180,4),(20,'Tôi Đã Yêu Người Âm Thầm Như Thế','Anna Turner','Tôi Đã Yêu Người Âm Thầm Như Thế\r\n\r\nKhi yêu đơn phương có nên tỏ tình hay không?\r\n\r\nNên làm gì để đối phương đón nhận tình cảm của mình?\r\n\r\nTỏ tình thất bại có nên tiếp tục kiên trì cố gắng hay không?\r\n\r\nĐây không phải là một cuốn sách có thể giải đáp cho bạn những vấn đề đó.\r\n\r\nTôi rất tiếc phải nói rằng, không có một đáp án cụ thể nào cho tất cả mọi trường hợp. Bạn chỉ có thể tùy theo hoàn cảnh bạn đang đối mặt để linh hoạt đưa ra quyết định của riêng mình. Dù vậy, tôi tin rằng mỗi một câu chuyện tôi kể trong cuốn sách, kể cả chuyện của bạn bè tôi, hay là chuyện của chính tôi, đều sẽ gợi lên cho bạn điều gì đó, một chút cảm xúc, một chút thanh thản, một chút quyết tâm,… để tiếp thêm sức mạnh cho bạn trên suốt hành trình yêu và theo đuổi tình yêu của bản thân mình.',20000,'Kim Đồng','2018-02-09 00:00:00','images/upload/toi-da-yeu-nguoi-am-tham-nhu-the.jpg',170,4),(21,'Tình Yêu Của Anh, Thế Giới Của Em',' Bản Lật Tử,','Tình Yêu Của Anh, Thế Giới Của Em - Tặng Kèm Bookmark + Postcard + Poster\r\n\r\nTrong thế giới ảo…\r\n\r\nCô là tác giả truyện tranh nổi tiếng “Đường Chỉ”, dung tác phẩm để mở ra trào lưu thời trang trong thế giới thực.\r\n\r\nAnh là đại thần “Nam Tư” tiếng tăm lẫy lừng của giới nhạc online với chất giọng quyến rũ đầy từ tính.\r\n\r\nMột lần tình cờ hợp tác, tiếp xúc với nhau bằng thân phận ảo, cô đã trúng tiếng sét ái tình với tiếng hát của anh.\r\n\r\nTrong thế giới thực…\r\n\r\nCô là Giản Ngôn – một người con gái có gu thời trang tuyệt vời, nhưng lại mắc chứng chán ghét đàn ông, coi kiếm tiền là mục đích sống tối cao của mình.\r\n\r\nAnh là nam thần Hạ Tu – người đàn ông hoàn hảo từ ngoại hình tới giọng nói, là đối tượng luôn bị gán ghép, đồn thổi trên mặt báo.\r\n\r\nMột lần đi tìm tư liệu vẽ truyện, cô trở thành ánh sáng vô tình lọt vào thế giới của anh. Một lần nữa, cô lại bị thanh âm của người đàn ông này mê hoặc, chìm sâu vào tình yêu đầy ngọt ngào đó.',45000,'Kim Đồng','2018-07-14 00:00:00','images/upload/tinh-yeu-cua-anh-the-gioi-cua-em.jpg',180,4),(22,'Tình Yêu Hai Tốt Ba Xấu','Cửu Bả Đao','Tình Yêu Hai Tốt Ba Xấu\r\n\r\n“Này… Hình như cuối cùng em cũng biết ‘may mắn’ là gì rồi…”\r\n\r\nA Khắc hơi ngẩn người, nhìn Tiểu Tuyết tựa như chờ đợi.\r\n\r\n“Đó chính là khi cả thế giới này đang nhìn anh, nhưng anh chỉ nhìn duy nhất một mình em.”\r\n\r\nTiểu Tuyết luôn tự cho rằng mình là một cô gái xui xẻo.\r\n\r\nCô đã bỏ lỡ hai điều tốt đẹp mang tính trọng đại trong cuộc đời, gặp phải ba chuyện xấu đầy buồn đau, nếu nói theo ngôn ngữ bóng chày, thì chính là tình huống bắt được hai quả bóng tốt và ba quả bóng xấu.\r\n\r\nMãi cho đến một ngày gặp được A Khắc, Tiểu Tuyết mới có cơ hội nắm lấy được trái bóng tốt cuối cùng của cuộc đời mình.\r\n\r\n“Tình yêu hai tốt ba xấu” của Cửu Bả Đao không phải là một câu chuyện tình yêu trong sáng nhạt nhòa trong thế giới hiện thực, mà tựa như một chuyến tàu đưa ta về những năm tháng rực rỡ nhất của tuổi trẻ…\r\n\r\nMột chàng trai tỏ tình 100 lần với những người xa lạ để lấy dũng khí nói lời yêu với cô gái trong lòng.\r\n\r\nMột cô gái bỏ đi mọi tự tôn để chạy theo một hình bóng chỉ vì vài giây gặp mặt thoáng qua.\r\n\r\nMột người kiên nhẫn chờ đợi một người, dù cho chẳng hề biết bản thân phải tiếp tục đợi đến bao giờ…\r\n\r\nThanh xuân của bạn… đã từng một lần vì ai mà quên đi chính mình như thế?\r\n\r\nKhông hy vọng vào kết quả, không cầu sẽ dắt tay nhau đến cuối cuộc đời, thậm chí còn không mong người ấy sẽ yêu bạn.\r\n\r\nTất cả chỉ tựa như những nét bút của Cửu Bả Đao trong câu chuyện tình yêu nhẹ nhàng đến nao lòng ấy…\r\n\r\nTình yêu vốn dĩ là hai người thì tốt, ba người thì xấu.',50000,'Kim Đồng','2018-02-11 00:00:00','images/upload/tinh-yeu-hai-tot-ba-xau.jpg',160,4),(23,'Tuổi Trẻ Là Chuyến Tàu Một Chiều Mang Thương Nhớ','Bát Nguyệt Trường An,','Tuổi Trẻ Là Chuyến Tàu Một Chiều Mang Thương Nhớ\r\n\r\nKhi còn nhỏ, chúng ta hy vọng bản thân sẽ mãi không trưởng thành. Trưởng thành rồi lại cảm thấy hóa ra cũng vẫn ổn.\r\n\r\nVậy trong tương lai thì sao? Ngày tuổi già tìm đến chúng ta sẽ thế nào?\r\n\r\nCó lẽ, đều sẽ tốt cả.\r\n\r\nCho dù là năm tuổi, mười lăm tuổi, hai mươi lăm tuổi hay ba mươi lăm tuổi… Mỗi chúng ta đều phải ngụp lặn trong dòng chảy của thời gian, bước lên chuyến tàu một chiều, ngắm nhìn phong cảnh cuộc đời mình.\r\n\r\nTrên chuyến tàu ấy sẽ có những người đi và ở, những người lưu lại thương nhớ trong tim, dạy chúng ta biết thế nào là nuối tiếc và trưởng thành.',50000,'Kim Đồng','2018-06-16 00:00:00','images/upload/tuoi-tre-la-chuyen-tau-mot-chieu-mang-thuong-nho.jpg',170,4),(24,'Đợi Đi Vết Thương Nào Rồi Cũng Lành','Lư Tư Hạo','Đợi Đi Vết Thương Nào Rồi Cũng Lành\r\n\r\nĐợi đi… vết thương nào rồi cũng lành - Cuốn sách chữa lành những tổn thương để bạn hiểu: Ngày mai sẽ là một ngày mới và đã đến lúc bạn hạnh phúc rồi.\r\n\r\nYêu một người vào năm 17 tuổi....\r\n\r\nNhớ một người hằng đêm...\r\n\r\nVà rơi nước mắt cũng vì người ấy...\r\n\r\nCó những người ta gặp không phải để bắt đầu một điều gì đó, mà là để vĩnh viễn bỏ lỡ.\r\n\r\nCó những mảnh tình cảm không phải để nói ra, mà là để mãi mãi chôn giấu.\r\n\r\nCó những việc khi còn trẻ, dù có cố gắng thế nào cũng chẳng thể hiểu được. Nhưng khi hiểu ra rồi, thì tuổi trẻ cũng đã mãi ở lại phía sau…\r\n\r\nNếu bạn đã và đang trải qua một thanh xuân như thế, thì đừng bỏ qua cuốn tản văn đến từ một trong những tác giả trẻ tài năng nhất Trung Quốc - Lư Tư Hạo.\r\n\r\nCuốn sách là những điều giản dị về thanh xuân, là những tình cảm ta đã trải qua, những người mà ta đã gặp, những cảm xúc khó thể diễn tả thành lời...',50000,'Kim Đồng','2018-11-08 00:00:00','images/upload/doi-di-vet-thuong-nao-roi-cung-lanh.jpg',300,4),(25,'Vì Sao Bạn Có Mặt Trên Đời?',' Chani Nicholas,','Vì Sao Bạn Có Mặt Trên Đời?\r\n\r\nTử vi hằng tuần trên báo chỉ là một phần rất nhỏ trong chiêm tinh học. Với tác phẩm đầu tay của mình, nhà chiêm tinh học Chani sẽ chỉ cho bạn biết cách đọc bản đồ sao cá nhân như thế nào, là ảnh chụp bầu trời ngay khi bạn vừa chào đời. Bản đồ sao tiết lộ tài năng, thách thức và cơ hội của riêng bạn. Tìm hiểu và củng cố kiến thức về chiêm tinh giúp bạn có thể sống một cuộc sống đã được ấn định từ khi bạn được sinh ra.\r\n\r\nVì sao bạn có mặt trên đời? giải thích các phần cấu thành nên bản đồ sao và ý nghĩa của chúng; hướng dẫn cách bạn đọc bản đồ sao của riêng mình.',59000,'Kim Đồng','2019-07-13 00:00:00','images/upload/vi-sao-ban-co-mat-tren-doi.jpg',300,5),(26,'Share:  Einstein – Cuộc Đời Và Vũ Trụ (Tái Bản 2020)',' Walter Isaacson,','Einstein – Cuộc Đời Và Vũ Trụ (Tái Bản 2020)\r\n\r\nCuốn sách khai thác và công bố những tư liệu mới nhất về Einstein, làm rõ những giai đoạn, sự kiện và vấn đề trong cuộc sống cá nhân của Einstein. Cuốn sách cũng chỉ ra và làm rõ những chặng trên con đường khoa học của Einstein, cho thấy những suy tư và trăn trở của ông để đưa ra những lý thuyết vật lý làm thay đổi toàn bộ nền vật lý thế kỷ XX, cũng như cuộc tranh luận của ông với các nhà cơ học lượng tử. Tác giả đã lột tả được cá tính, tư tưởng chính trị và những đặc điểm trong   trí tuệ, nhân cách của Einstein một cách sinh động.',90000,'Kim Đồng','2019-06-07 00:00:00','images/upload/1.jpg',300,5),(27,'Ai, Cái Gì, Khi Nào? - Những Tri Kỉ Bí Mật Nhất Lịch Sử','NetaBooks','Hãy cùng khám phá nhiều câu chuyện bí mật về những cá nhân lặng lẽ đồng hành cùng những nhân vật huyền thoại trong các lĩnh vực: nghệ thuật, chính trị, khoa học, công nghệ... Cuốn sách này là một bản tóm lược đầy lôi cuốn về những sự kiện lịch sử, những thông tin tiểu sử hiếm có khó tìm. Bạn sẽ biết về Michael và Joy Brown, cặp vợ chồng đã tặng cho nhà văn Harper Lee một khoản tiền lớn bằng cả năm lương, giúp bà tập trung vào viết cuốn tiểu thuyết Giết con chim nhại trứ danh.',130000,'Kim Đồng','2019-06-06 00:00:00','images/upload/ai-cai-gi-khi-nao-nhung-tri-ki-bi-mat-nhat-lich-su.jpg',400,5),(28,'Hà Nội Thanh Lịch - Nhã Nam',' Hoàng Đạo Thúy','“Các dãy làng quanh thành có tên là Kẻ Bưởi, Kẻ Mọc, Kẻ Lủ, Kẻ Mơ, thì bà con nông thôn cũng hay gọi Hà Nội là “Kẻ Chợ”. Vì là kẻ chợ, nên lịch lãm có khi hóa ra kênh kiệu, buôn bán cũng có lúc lá phải, lá trái.\r\n\r\nNhưng ‘người Tràng An’ rõ ràng là người cần cù, cứng rắn, vẻ thanh lịch, đôi lúc hào hoa, yêu văn, yêu hoa, sành mỹ thuật, ăn mặc đơn sơ và trang nhã, nói lời văn vẻ dễ nghe, dễ hòa hợp với bà con phường, xóm, hay động lòng vì việc nghĩa, tình người, ghét cay ghét đắng những chuyện tục tằn kệch cỡm, hoạnh họe, lố lăng, đê tiện. Người Tràng An ở với nhau, ‘biết nhịn’, ‘biết nể’, ‘biết ngượng’, ‘suy bụng ta ra bụng người’. Trong thôn phố, có việc là chạy sang thăm hỏi ngay, ở với nhau chu tất, ăn ý, không ‘bỏ được lòng nhau’ […] \r\n\r\nKhách nhà quê ra, đi mãi, nóng, nhọc thì thấy ngay bên đường một vại nước vối ngon với mấy cái bát sạch. Người ta tóm cả cái thanh, cái cao, cái lịch sự, ẩn ý vào hai chữ ‘thanh lịch’.\r\n\r\nVà khi đón bà con các tỉnh về, tiếp các khách phương xa đến, người ta nhắc nhau giữ lấy ‘vẻ thanh lịch của người Tràng An’.”',60000,'Kim Đồng','2018-06-28 00:00:00','images/upload/ha-noi-thanh-lich-nha-nam.jpg',266,6),(29,'Vùng Đất Thần Tiên','Trong Lee','Hãy cùng đắm chìm vào thế giới thần tiên đầy mộng ảo!\r\n\r\nVÙNG ĐẤT THẦN TIÊN là artbook mới nhất, với những nét vẽ tinh tế, tỉ mỉ, mang đậm nét kỳ ảo của Kiến trúc sư trẻ Trong Lee, tác giả của Sài Gòn Xưa - Màu hoài niệm được bạn đọc yêu mến.\r\n\r\nCuốn sách được tác giả thai nghén và thực hiện với mục đích sáng tạo ra một thế giới để bản thân thoả sức thể hiện, là nơi nuôi dưỡng đam mê, bồi đắp tâm hồn của người nghệ sĩ.\r\n\r\nVÙNG ĐẤT THẦN TIÊN là tập tranh đầy màu sắc mà trong đó mỗi bức tranh là một mảng màu thần tiên mộng ảo. Một thế giới mà nếu ai đã một lần đặt chân đến sẽ “ngàn năm lạc lối”. Ở đó, những bóng dáng tưởng chừng rất đỗi quen thuộc bỗng thoát xác, hóa thân thành muôn vàn những hình hài khác biệt, đầy sống động.\r\n\r\nĐến với VÙNG ĐẤT THẦN TIÊN để ngao du trong tiếng hát ngọt ngào mê đắm của những nàng Tiên Cá xinh đẹp nơi đại dương sâu thẳm, để phiêu lưu theo bước chân của những nàng Tiên Hươu, tự do lướt theo làn gió trên những đôi cánh của Tiên Chim, để bắt gặp phút làm duyên của các nàng Tiên Hoa hay những lúc suy tư của Tiên Ếch, trầm mặc của Nữ Thần Rừng… Tất cả là vùng đất của muôn vàn câu chuyện kỳ thú.',60000,'Kim Đồng','2018-07-16 00:00:00','images/upload/vung-dat-than-tien.jpg',200,6),(30,'Phía Sau Ánh Đèn Sân Khấu ',' Park Hee A,','Phía sau ánh đèn sân khấu - Chia sẻ của những main dancer đỉnh nhất Kpop thế hệ mới!\r\n\r\nNhững nghệ sĩ tài năng, những vũ đạo tuyệt vời cùng những màn biểu diễn ngoạn mục: Sân khấu của K-pop chưa bao giờ khiến chúng ta hết kinh ngạc!\r\n\r\nPhía sau ánh đèn sân khấu chính là cuốn sách giúp bạn đến gần hơn với những người đứng sau các màn trình diễn đỉnh cao ấy, IZ*ONE Lee Chaeyeon, SEVENTEEN Hoshi, Chungha, VIXX Leo, BTS J-Hope. Cuốn sách này sẽ là cầu nối giúp bạn đọc thấy được mặt nào đó của ngành công nghiệp K-pop và idol. Mong rằng sau khi đọc xong cuốn sách, mọi người sẽ cảm nhận được sự nỗ lực mỗi ngày và câu chuyện của tất cả những idol đã tham gia vào cuốn sách này. Hãy cùng lắng nghe chia sẻ của những main dancer nổi bật nhất K-pop thế hệ mới và khám phá thế giới phía sau ánh đèn sân khấu nhé!',100000,'Kim Đồng','2017-06-16 00:00:00','images/upload/phia-sau-anh-den-san-khau-tang-kem-bookmark--5-postcard.jpg',298,6),(31,'Những Con Đường Đưa Về Núi Thứu',' Thích Nhất Hạnh,','Những Con Đường Đưa Về Núi Thứu\r\n\r\nCó một khu vườn, ở đó luôn có mặt rất nhiều những loài cây, có loài lớn, có loài bé, có loài cao, có toài thấp... Phong phú và đa dạng, chưa bao giờ ngừng khoe sắc. Đó là khu vườn sinh động của Phật giáo. Những Con Đường Đưa Về Núi Thứu là một tác phẩm viết về khu vườn trăm sắc trăm hương ấy.\r\n\r\nBiết thêm về những dòng chảy lịch sử trong tiến trình hình thành và phát triển ấy cũng đồng nghĩa với việc mở rộng tầm nhìn để tiếp thu và học hỏi thêm từ những truyền thống khác. Với tinh thần cởi mở nhưng không bị đồng hóa bằng việc gìn giữ chăm chút những gốc rễ vốn có của mình, khu vườn Phật giáo đã trở nên giàu có và đẹp hơn mỗi ngày.\r\n\r\nCho những ai muốn tìm hiểu về tiến trình diễn biến của lịch sử tư tưởng Phật giáo, xin hãy một lần đặt chân vào khu vườn sinh động ấy. Cửa vườn vẫn luôn mở và chưa từng khép.',100000,'Kim Đồng','2018-06-16 00:00:00','images/upload/nhung-con-duong-dua-ve-nui-thuu-2.jpg',200,7),(32,'Vô Ngã Vô Ưu (Tái Bản)',' Ni sư Ayya Khema','Vô Ngã Vô Ưu\r\n\r\nVô Ngã Vô Ưu (Being Nobody, Going Nowhere) là một cuốn sách về Thiền quán hay nhất của Ni sư người Đức Ayya Khema. Là một tuyệt tác viết về Thiền quán, cuốn sách đã được giải thưởng của Chrismas Humphreys và là cuốn sách bán chạy nhất tại Mỹ năm 1988.\r\n\r\nTrong cuốn sách này, Ni sư Ayya Kherma đã giới thiệu với người đọc những gì tinh tuý nhất trên con đường Phật pháp. Bà nhấn mạnh đến cách thức và tại sao lại cần hành thiền cũng như cung cấp cho ta một nền tảng hiểu biết cơ bản về bản chất của Nghiệp, Tái sinh và Bát chính đạo - những giáo lý căn bản của Đạo Phật. Với những lời khuyên hữu ích và thiết thực, Ni sư Ayya Khema đã dẫn dắt cho chúng ta những cách thức thực hành tứ vô lượng tâm: từ, bi, hỷ, xả và cách vượt qua những chướng ngại trên con đường tu tập. Rất ít cuốn sách cơ bản về Phật giáo có thể bao chứa cả hai tiêu chí giản dị và sâu sắc. Nhưng vô ngã vô ưu đã làm được cả hai điều này. Đây không những là một cuốn sách mọi thiền sinh không thể bỏ qua, mà còn là cuốn sách tuyệt vời cho tất cả mọi người.',49000,'Kim Đồng','2018-05-16 00:00:00','images/upload/vo-nga-vo-uu-tai-ban-1.jpg',2000,7),(33,'Thương Yêu Theo Phương Pháp Bụt Dạy','Thích Nhất Hạnh','Khi nói đến thương yêu, ta hay nghĩ rằng đối tượng thương yêu là một người khác. Từ nhỏ chúng ta cũng được dạy rằng phải yêu thương người khác, thậm chí đến quên mình, đó được ca ngợi là đức hy sinh. Nhưng Bụt dạy rằng đối tượng thương yêu đầu tiên phải là chính bản thân mình. Nếu không thương yêu được bản thân thì ta không thể thương yêu được bất cứ ai khác.\r\n\r\nThương yêu ở trong đạo Phật là một sự thực tập chứ không phải là sự hưởng thụ mà thôi. Tu tập như vậy thì càng ngày mình càng hạnh phúc và người yêu của mình càng ngày càng hạnh phúc.Sách được chia thành năm phần. Phần đầu tiên chỉ ra cho chúng ta thấy yêu thương là cội nguồn của hạnh phúc. Các chương sau là cái bài thực tập, từ trong tâm, gieo trồng và nuôi dưỡng thương yêu để mang lại hạnh phúc cho chính mình và người khác.\r\nThông tin tác giả\r\nTác giả Thích Nhất Hạnh\r\nThích Nhất Hạnh\r\nThiền sư Thích Nhất Hạnh là lãnh đạo Phật giáo có ảnh hưởng lớn ở phương Tây và tích cực thúc đẩy hòa bình.\r\n\r\nThiền sư sinh năm 1926 tại Thừa Thiên - Huế với tên khai sinh là Nguyễn Xuân Bảo. Ông xuất gia theo Thiền tông vào năm 16 tuổi tại chùa Từ Hiếu. Thiền sư tốt nghiệp viện Phật học Bảo Quốc, tu học thiền theo trường phái Đại thừa của Phật giáo và chính thức trở thành nhà sư vào năm 23 tuổi. Ông vừa là thiền sư vừa là giảng viên, nhà văn, nhà thơ, nhà khảo cứu, nhà hoạt động xã hội, và người vận động cho hòa bình.\r\n\r\nThiền sư Thích Nhất Hạnh đã phối hợp kiến thức của ông về nhiều trường phái thiền khác nhau cùng với các phương pháp từ truyền thống Phật giáo Thượng tọa bộ, những nhận thức sâu sắc từ truyền thống Phật Giáo Đại thừa, và một số phát kiến của ngành tâm lý học đương đại phương Tây để tạo thành cách tiếp cận mới đối với thiền.\r\n\r\nÔng là người đưa ra khái niệm \"Phật giáo dấn thân\" trong cuốn \"Việt Nam: Hoa sen trong biển lửa\". Trong cuộc phỏng vấn với nhà báo John Malkin hơn một thập niên trước, thiền sư Thích Nhất Hạnh giải thích về Phật giáo dấn thân: \"Khi bom dội lên đầu chúng sinh, bạn không thể ngồi trong thiền viện. Thiền là nhận thức về những gì đang xảy ra, không chỉ bên trong mà còn xung quanh cơ thể và cảm xúc của bạn\".\r\n\r\n\"Phật giáo phải gắn liền với cuộc sống thường nhật, với nỗi đau của bạn và những người xung quanh. Bạn phải học cách giúp đỡ một đứa trẻ bị thương trong lúc duy trì hơi thở chánh niệm. Bạn phải giữ cho bản thân khỏi lạc lối trong hành động. Hành động phải đi cùng thiền\", ông nhấn mạnh.\r\n\r\nNăm 1956, ông làm Tổng biên tập của Phật giáo Việt Nam, tờ báo của Giáo hội Phật giáo Việt Nam Thống nhất. Thập niên 1960, ông lập nên trường Thanh niên Phụng sự Xã hội (SYSS), một tổ chức từ thiện giúp dựng lại các làng bị đánh bom, xây trường học, trạm xá, và hỗ trợ những gia đình vô gia cư sau chiến tranh ở Việt Nam.\r\n\r\nÔng cũng là một trong những người thành lập Đại học Vạn Hạnh, trường tư thục danh tiếng, tập trung nhiều nhà nghiên cứu về Phật giáo, văn hóa và ngôn ngữ Việt Nam. Trong một buổi gặp mặt vào tháng 4/1965, đoàn sinh viên trường Vạn Hạnh đưa ra \"lời kêu gọi vì hoà bình\", với nội dung chính là thúc giục hai miền Nam - Bắc tìm \"giải pháp chấm dứt chiến tranh và đem lại cho người dân Việt Nam cuộc sống hòa bình với lòng tôn trọng lẫn nhau\". \r\n\r\nThiền sư Thích Nhất hạnh đã nhiều lần đến Mỹ để nghiên cứu và diễn thuyết tại Đại học Princeton và Đại học Cornell. Sau này, ông tham gia giảng dạy tại Đại học Columbia. Tuy nhiên, mục đích chính của những chuyến đi ra nước ngoài của ông vẫn là vận động cho hòa bình.\r\n\r\nNăm 1966, ông lập ra dòng tu Tiếp Hiện đồng thời thành lập nhiều trung tâm thực hành và thiền viện trên khắp thế giới. Ông ở nước ngoài từ sau khi Hiệp định Paris được ký kết năm 1973, cư ngụ chủ yếu tại Tu viện Làng Mai, vùng Dordogne, miền nam nước Pháp.\r\n\r\nLà một trong những người thầy về Phật giáo ở phương Tây, những lời dạy và phương pháp của thiền sư Thích Nhất Hạnh thu hút sự quan tâm của nhiều thành phần đến từ các quan điểm tôn giáo, tâm linh và chính trị khác nhau. Ông đưa ra cách thực hành chánh niệm thường được điều chỉnh cho phù hợp với tri giác phương Tây.\r\n\r\nChánh niệm là sự biết rõ những gì đang có mặt, đang xảy ra. \"Khi nắm tay một em bé, ta hãy để tâm một trăm phần trăm vào bàn tay em. Khi ôm người thương trong vòng tay cũng thế. Hãy thực sự có mặt, thực sự tỉnh thức. Điều này trái ngược hẳn với cách sống và làm việc của ta trước đây. Chúng ta từng có thói quen làm nhiều việc cùng một lúc. Vừa trả lời e-mail vừa nói điện thoại. Trong khi đang họp về một dự án này, ta viết xuống những ghi chú cho một dự án khác. Thay vì luôn làm nhiều việc cùng một lúc, ta phải tập thói quen chỉ làm mỗi lần một việc\", Thiền sư viết trong cuốn sách \"Quyền lực đích thực\". Ông cho rằng thực hành Chánh niệm giúp nhận diện niềm đau nỗi khổ và chuyển hóa chúng.\r\n\r\nÔng đã viết hơn 100 cuốn sách, trong đó hơn 40 cuốn bằng tiếng Anh, với một số tác phẩm nổi bật như Đường xưa mây trắng, Phép lạ của sự tỉnh thức, Hạnh phúc cầm tay, Phật trong ta, Chúa trong ta...\r\n\r\nCuộc đời ông gắn liền với các hoạt động vì hòa bình. Tháng 6/1965, Thiền sư viết thư cho nhà hoạt động nổi tiếng Mỹ Martin Luther King Jr. để kêu gọi ông công khai chống lại Chiến tranh Việt Nam. Một năm sau, hai người lần đầu tiên gặp nhau tại Chicago, thảo luận về hòa bình, tự do và cộng đồng. Trong cuộc họp báo sau đó, King đã phản đối mạnh mẽ Chiến tranh Việt Nam. Năm 1967, King đề cử Thiền sư cho Giải Nobel Hòa bình nhưng năm đó không ai được trao giải.\r\n\r\nThiền sư Thích Nhất Hạnh cho biết khi ông \"đã không thể tin nổi\" khi nghe tin King bị ám sát vào năm 1968. \"Tôi nghĩ người Mỹ đã tạo ra King nhưng lại không bảo vệ được ông ấy. Tôi có chút tức giận vào thời điểm đó. Tôi không ăn, không ngủ. Nhưng quyết tâm làm việc, xây dựng cộng đồng vẫn tiếp tục\".\r\n\r\nÔng tổ chức các khóa tu thiền cho người Israel và người Palestine, khuyến khích họ lắng nghe và học hỏi lẫn nhau; thuyết giảng kêu gọi các nước đang tham chiến hãy đình chiến và tìm kiếm giải pháp ôn hòa cho các mâu thuẫn. Năm 2005, ông tổ chức buổi diễu hành vì hòa bình ở Los Angeles với sự tham gia của hàng nghìn người, theo Christian Science Monitor.\r\n\r\nTháng 5/2013, trong một buổi diễn thuyết kéo dài 3 giờ tại sân vận động ở Hàn Quốc, Thiền sư đã bàn về mối quan hệ giữa Triều Tiên và Hàn Quốc. \"Vũ khí hạt nhân là một trở ngại đối với mối quan hệ tốt đẹp giữa hai miền bán đảo Triều Tiên. Nó phản ánh nỗi sợ hãi, tức giận và nghi ngờ của Triều Tiên bởi nếu không, họ đã không xây dựng vũ khí hạt nhân. Vì hòa bình, điều cơ bản cần làm không phải việc loại bỏ vũ khí hạt nhân mà là loại bỏ sự sợ hãi, tức giận và nghi ngờ trong mỗi người. Qua đó, việc hòa giải sẽ trở nên dễ dàng\".\r\n\r\nTheo thiền sư Thích Nhất Hạnh, chìa khóa để hòa giải chính là việc \"biết lắng nghe\". Ông cũng khuyên các chính trị gia nên học theo con đường của Phật giáo để giúp ích cho đàm phán và hòa giải.\r\n\r\nSau hơn 4 thập niên rời xa quê hương, ông về Việt Nam lần đầu vào năm 2005 và năm 2007, ông đi khắp đất nước, tổ chức những khóa tu, buổi pháp thoại và gặp gỡ các tăng ni phật tử. Đầu năm 2007, với sự đồng ý của Trung ương Giáo hội Phật giáo Việt Nam, ông tổ chức ba trai đàn chẩn tế lớn tại ba miền Việt Nam với tên gọi \"Đại trai đàn Chẩn tế Giải oan\", cầu nguyện và giải trừ oan khổ cho những người từng chịu hậu quả của chiến tranh.\r\n\r\n\r\n',130000,'Kim Đồng','2017-06-10 00:00:00','images/upload/thuong-yeu-theo-phuong-phap-but-day-1.jpg',289,7),(34,'Raw Vegan - Sức Mạnh Chữa Lành Của Thực Vật','Norman W Walker','Raw Vegan - Sức Mạnh Chữa Lành Của Thực Vật\r\n\r\nThứ đắng nhất không phải là thuốc, mà là sự hối hận khi nhận ra đã quá muộn để thay đổi lối sống.\r\n\r\nThứ đắt nhất không phải là tiền bạc, mà là thời gian tự do bạn phải đánh đổi để chống đỡ bệnh tật.\r\n\r\nNhìn vào tỷ lệ người mắc ung thư mỗi năm, nhất là độ tuổi ngày càng trẻ hóa, nhất là khi đó là một người quen, người thân của bạn, bạn có giật mình không?\r\n\r\nNhìn chính mình mỗi ngày đều thiếu sức sống, chỉ đủ sức chống chọi bệnh tật và những cảm xúc thất thường, không thể tập trung để làm việc, sáng tạo, cống hiến, bạn có thấy mình đang “sống mòn”?\r\n\r\nThứ bạn nên thay đổi không phải là loại thuốc đắt hơn, bệnh viện tốt hơn, mà chính là LỐI SỐNG của bạn, bắt đầu từ việc ăn uống và sinh hoạt. Bởi “bạn là những gì bạn ăn, mỗi thực phẩm có một tần số riêng, và chỉ những thực phẩm mang tần số cao, giàu “năng lượng sống“ mới có thể nuôi dưỡng và nâng cấp cơ thể cũng như tâm trí bạn.',80000,'Kim Đồng','2018-06-16 00:00:00','images/upload/raw-vegan-suc-manh-chua-lanh-cua-thuc-vat.jpg',267,8),(35,'Detox, Low-Carb, Thực Phẩm Hữu Cơ…','Robert J Davis','Detox, low-carb, thực phẩm hữu cơ… tin đồn và sự thật không đơn thuần là một cuốn sách dinh dưỡng; nó là thứ vũ khí để bạn tiêu diệt thông tin nước đôi và quảng cáo bịa đặt, bảo vệ sự thật và tất nhiên là cả sức khỏe của bản thân.\r\n\r\nĐã bao giờ bạn cảm thấy đau đầu trước những thông tin dinh dưỡng trái chiều? “Cà phê không tốt cho sức khỏe của bạn. Không, đợi đã, nó tốt chứ. Chất xơ ngăn ngừa ung thư đại tràng. Không, không hề đâu nhé. Chất béo làm tăng cân. Sai rồi, tinh bột mới làm tăng cân.” Một rừng chữ nghĩa đủ để làm lú lẫn bất cứ ai chỉ đơn giản muốn có một bữa ăn ngon lành tốt cho sức khỏe.',100000,'Kim Đồng','2020-11-05 00:00:00','images/upload/detox-low-carb-thuc-pham-huu-cotin-don-va-su-that.jpg',256,8),(36,'Thiền Mặc Chiếu','Hòa thượng Thích Thánh Nghiêm','Mặc Chiếu do thiền sư Chính Giác ( tông Tào Đồng ) khởi sáng, là thiền pháp trực chỉ, chủ yếu dùng tâm thái thư giãn, rõ ràng, đem toàn bộ vọng niệm buôn xuống, khiến cho tâm được bình tĩnh, trầm lắng, sáng tỏ; trong khi Thoại đầu của thiền sư Tôn Cảo ( tông Lâm Tế ) đề xướng lại dạy người học dùng Công án, Thoại đầu để phát khởi nghi tình, đem tất cả tạp niệm vọng tưởng dồn vào ngõ cụt, lúc nhân duyên chín muồi, khối nghi bùng nổ thì liền quét sạch. Cho nên có người đã hình dung Mặc Chiếu kín kẽ, nhẹ nhàng như người mẹ hiền, còn Thoại đầu kỹ càng, khẩn bách như vị tướng quân nghiêm nghị',100000,'Kim Đồng','2018-08-08 00:00:00','images/upload/thien-mac-chieu-01.jpg',298,8),(37,'Kinh Tế Đêm Và Phi Chính Thức',' Nguyễn Đức Dũng','Sách Kinh Tế Đêm Và Phi Chính Thức của tác giả Nguyễn Đức Dũng, có bán tại Nhà sách online YUBOOK với ưu đãi Bao sách miễn phí và tặng Bookmark',900000,'Kim Đồng','2018-02-10 00:00:00','images/upload/kinh-te-dem-va-phi-chinh-thuc.jpg',245,1);
/*!40000 ALTER TABLE `sach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thanhtoanmomo`
--

DROP TABLE IF EXISTS `thanhtoanmomo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thanhtoanmomo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dh_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dh_id` (`dh_id`),
  CONSTRAINT `thanhtoanmomo_ibfk_1` FOREIGN KEY (`dh_id`) REFERENCES `donhang` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thanhtoanmomo`
--

LOCK TABLES `thanhtoanmomo` WRITE;
/*!40000 ALTER TABLE `thanhtoanmomo` DISABLE KEYS */;
/*!40000 ALTER TABLE `thanhtoanmomo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theloai`
--

DROP TABLE IF EXISTS `theloai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theloai` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theloai`
--

LOCK TABLES `theloai` WRITE;
/*!40000 ALTER TABLE `theloai` DISABLE KEYS */;
INSERT INTO `theloai` VALUES (1,'Kinh tế-kỷ năng'),(2,'Sách thiếu nhi'),(3,'Văn học Việt Nam'),(4,'Văn học nước ngoài'),(5,'Khoa học-triết học'),(6,'Văn hóa nghệ thuật'),(7,'Tâm linh tôn giáo'),(8,'Y học');
/*!40000 ALTER TABLE `theloai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thuno`
--

DROP TABLE IF EXISTS `thuno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thuno` (
  `stt` int NOT NULL AUTO_INCREMENT,
  `ghino_id` int NOT NULL,
  `ngaytrano` datetime DEFAULT NULL,
  `sotienthu` float DEFAULT NULL,
  PRIMARY KEY (`stt`),
  KEY `ghino_id` (`ghino_id`),
  CONSTRAINT `thuno_ibfk_1` FOREIGN KEY (`ghino_id`) REFERENCES `ghino` (`stt`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thuno`
--

LOCK TABLES `thuno` WRITE;
/*!40000 ALTER TABLE `thuno` DISABLE KEYS */;
INSERT INTO `thuno` VALUES (1,1,'2020-12-16 18:28:08',70000);
/*!40000 ALTER TABLE `thuno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `gioitinh` varchar(100) DEFAULT NULL,
  `ngaysinh` datetime DEFAULT NULL,
  `ngaytg` datetime DEFAULT NULL,
  `sdt` varchar(100) DEFAULT NULL,
  `user_role` enum('ADMIN','NHANVIEN','KHACHHANG') DEFAULT NULL,
  `diaChi_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `diaChi_id` (`diaChi_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`diaChi_id`) REFERENCES `diachi` (`id`),
  CONSTRAINT `user_chk_1` CHECK ((`active` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','chuheocon25@gmail.co','admin','81dc9bdb52d04dc20036dbd8313ed055','images/anh/abc.jpg',1,'nam','2000-01-01 00:00:00','2020-01-01 00:00:00','0945320117','ADMIN',1),(2,'Nguyễn Thị Thu Uyên','uyennguyen0721@gmail.com','uyen21','81dc9bdb52d04dc20036dbd8313ed055','images/upload/vung-dat-than-tien.jpg',1,'nữ','2000-01-17 00:00:00','2020-12-16 18:28:08','0947653170','KHACHHANG',2),(3,'Võ Thị kim Yến','chuheocon25@gmail.com','yen20','81dc9bdb52d04dc20036dbd8313ed055','images/upload/abc.jpg',1,'nam','2014-07-17 00:00:00','2020-12-16 18:28:08','0945320117','NHANVIEN',3),(4,'Võ Thị kim Yến','chuheocon25@gmail.com','yen22','81dc9bdb52d04dc20036dbd8313ed055','images/upload/abc.jpg',1,'nữ','2000-10-11 00:00:00','2020-12-16 18:28:08','0945321122','KHACHHANG',4),(5,'Võ Thị kim thúy','chuheocon25@gmail.com','yen220','81dc9bdb52d04dc20036dbd8313ed055','images/upload/abc.jpg',1,'nam','2020-12-10 00:00:00','2020-12-16 18:28:08','0945320117','KHACHHANG',5),(6,'Lâm Dương Toàn','lamtoan123@gmail.com','lamtoan2','81dc9bdb52d04dc20036dbd8313ed055','images/upload/abc.jpg',1,'nam','2020-12-11 00:00:00','2020-12-16 18:28:08','0945320117','KHACHHANG',6);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-16 23:32:13
