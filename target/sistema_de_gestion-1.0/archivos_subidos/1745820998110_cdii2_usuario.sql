-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 192.168.50.253    Database: cdii2
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `rut_usuario` varchar(13) NOT NULL,
  `primerNombre` varchar(100) NOT NULL,
  `segundoNombre` varchar(100) DEFAULT NULL,
  `paterno` varchar(100) NOT NULL,
  `materno` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fechaCreacion` date NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `cambioPassword` tinyint(1) NOT NULL,
  `id_rol` int DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `rut_usuario` (`rut_usuario`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `Usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'19405196-4','Rodrigo','Ignacio','Farias','Alarcon','rodrigoignacio.fa@gmail.com','2025-03-01','roro',0,2),(2,'19405196-0','Elizabeth','Paulina','Pardo','Montes','eli.1998@gmail.com','2025-03-01','686',0,1),(3,'19405197-5','Katherine','Alejandra','Farias','Pardo','katy200@gmail.com','2025-03-01','22',0,3),(4,'18405197-4','Gonzalo','Robert','Llanos','Alberto','gonzalo@gmail.com','2025-03-01','2106',0,1),(5,'12345678-9','Juan','Carlos','Pérez','Gómez','juan@email.com','2024-03-01','6565',0,2),(6,'19405196-8','Juanito','Pulgar','Pulgar','Pulgar','pulgares@gmail.com','2025-04-16','uix86.dll',0,3),(10,'19405196-k','Juanito','Rodrigo','Pulgar','Alarcon','pulgar22222es@gmail.com','2025-04-16','orioerhwhepiger',0,2),(11,'00000258-8','gdsfgsfdgsdfg','gdsgsdgsfd','gsfdggdsfgsdfgsfdgfsdg','gdfgsfdgsfdgsfdgsfd','rodrigosdfsfsdfnacio.fa@gmail.com','2025-04-21','wreigjaer9pgaerhe9g98er98pggewrgrew',1,2),(12,'00000258-9','Juan','Rodrigo','Farias','Alarcon','dfdfdfdf64nacio.fa@gmail.com','2025-04-21','wajhawfkbeasfa',1,2);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-24 12:00:47
