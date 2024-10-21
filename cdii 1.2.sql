CREATE DATABASE  IF NOT EXISTS `cdii` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cdii`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: cdii
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno` (
  `matricula` int NOT NULL,
  `rut` varchar(12) COLLATE utf8mb4_general_ci NOT NULL,
  `nombres` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `apeMaterno` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `apePaterno` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nombreSocial` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `edad` date NOT NULL,
  `sexo` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `direccion` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_curso` int NOT NULL,
  PRIMARY KEY (`rut`),
  KEY `FK_curso` (`id_curso`),
  CONSTRAINT `fk_curso_alumno` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (180,'19405196-4','Rodrigo Ignacio','Farias','Alarcon','HelicopteroApache','1996-08-23','','mi casa','98568748',1),(123,'19757944-7','José Eduardo','Farías','Hinojosa','Choripan','2024-02-07','Masculino','mi casa',NULL,4);
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `antecedente`
--

DROP TABLE IF EXISTS `antecedente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `antecedente` (
  `id_antecidentes` int NOT NULL AUTO_INCREMENT,
  `consultorio` varchar(650) COLLATE utf8mb4_general_ci NOT NULL,
  `cantidadHermanos` int NOT NULL,
  `prevencionSalud` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `trabaja` varchar(650) COLLATE utf8mb4_general_ci NOT NULL,
  `perteneceEtnia` varchar(650) COLLATE utf8mb4_general_ci NOT NULL,
  `viveCon` varchar(650) COLLATE utf8mb4_general_ci NOT NULL,
  `id_alumno` varchar(12) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_antecidentes`),
  UNIQUE KEY `id_alumno` (`id_alumno`),
  CONSTRAINT `fk_alumno_antecedente` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antecedente`
--

LOCK TABLES `antecedente` WRITE;
/*!40000 ALTER TABLE `antecedente` DISABLE KEYS */;
INSERT INTO `antecedente` VALUES (1,'Consultorio de tejas',3,'Fonasa','se supone','nao','Padres','19757944-7');
/*!40000 ALTER TABLE `antecedente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apoderado`
--

DROP TABLE IF EXISTS `apoderado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apoderado` (
  `rut` varchar(12) COLLATE utf8mb4_general_ci NOT NULL,
  `nombres` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `paterno` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `materno` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `ocupacion` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `escolaridad` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `rol` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `id_alumno` varchar(12) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`rut`),
  KEY `fk_alumno` (`id_alumno`),
  CONSTRAINT `fk_alumno_apoderado` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`rut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apoderado`
--

LOCK TABLES `apoderado` WRITE;
/*!40000 ALTER TABLE `apoderado` DISABLE KEYS */;
INSERT INTO `apoderado` VALUES ('123456789-1','padre test','Hinojosa','Abarca','+56912626925','test@gmail.com','existir','enseñanza media completa','testing','19757944-7');
/*!40000 ALTER TABLE `apoderado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beneficio`
--

DROP TABLE IF EXISTS `beneficio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beneficio` (
  `id_beneficio` int NOT NULL AUTO_INCREMENT,
  `beca_presidenteRe` tinyint(1) NOT NULL,
  `suf_unicoFamiliar` tinyint(1) NOT NULL,
  `beca_indigena` tinyint(1) NOT NULL,
  `porcentajeRegistroSocial` int NOT NULL,
  `utilesEscolares` tinyint(1) NOT NULL,
  `PAE` tinyint(1) NOT NULL,
  `id_alumno` varchar(12) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_beneficio`),
  UNIQUE KEY `id_alumno` (`id_alumno`),
  CONSTRAINT `fk_alumno_beneficio` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beneficio`
--

LOCK TABLES `beneficio` WRITE;
/*!40000 ALTER TABLE `beneficio` DISABLE KEYS */;
INSERT INTO `beneficio` VALUES (1,1,0,0,45,0,0,'19757944-7');
/*!40000 ALTER TABLE `beneficio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrera` (
  `id_carrera` int NOT NULL AUTO_INCREMENT,
  `nombre_carrera` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_carrera`),
  UNIQUE KEY `nombre_carrera` (`nombre_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (2,'Construcciones metalicas'),(3,'Elaboracion industrial de elementos\r\n'),(1,'Mecanica automotriz'),(5,'Refrigeracion y climatizacion'),(4,'vestuario y confeccion textil\r\n');
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conexion_alumnos`
--

DROP TABLE IF EXISTS `conexion_alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conexion_alumnos` (
  `id_conexion` int NOT NULL AUTO_INCREMENT,
  `id_alumno` varchar(12) COLLATE utf8mb4_general_ci NOT NULL,
  `id_apoderado` varchar(12) COLLATE utf8mb4_general_ci NOT NULL,
  `id_medico` int NOT NULL,
  `id_carrera` int NOT NULL,
  `id_beneficio` int NOT NULL,
  `id_antecedentes` int NOT NULL,
  `id_pago` int NOT NULL,
  `id_talleres` int NOT NULL,
  PRIMARY KEY (`id_conexion`),
  KEY `fk_alum_antecedente` (`id_antecedentes`),
  KEY `fk_alum_rut` (`id_alumno`),
  KEY `fk_alum_apoderado` (`id_apoderado`),
  KEY `fk_alum_beneficio` (`id_beneficio`),
  KEY `fk_alum_carrera` (`id_carrera`),
  KEY `fk_alum_medico` (`id_medico`),
  KEY `fk_alum_talleres` (`id_talleres`),
  CONSTRAINT `fk_conexion_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_conexion_antecedentes` FOREIGN KEY (`id_antecedentes`) REFERENCES `antecedente` (`id_antecidentes`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_conexion_apoderado` FOREIGN KEY (`id_apoderado`) REFERENCES `apoderado` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_conexion_beneficio` FOREIGN KEY (`id_beneficio`) REFERENCES `beneficio` (`id_beneficio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_conexion_carrera` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id_carrera`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_conexion_medico` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_conexion_taller` FOREIGN KEY (`id_talleres`) REFERENCES `talleres` (`id_taller`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conexion_alumnos`
--

LOCK TABLES `conexion_alumnos` WRITE;
/*!40000 ALTER TABLE `conexion_alumnos` DISABLE KEYS */;
/*!40000 ALTER TABLE `conexion_alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `id_curso` int NOT NULL AUTO_INCREMENT,
  `nombre_curso` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `id_plan` int NOT NULL,
  PRIMARY KEY (`id_curso`),
  UNIQUE KEY `nombre_curso` (`nombre_curso`),
  KEY `fk_plan` (`id_plan`),
  CONSTRAINT `fk_plan_curso` FOREIGN KEY (`id_plan`) REFERENCES `planes` (`id_plan`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'1A',310),(2,'1B',310),(3,'3C',610),(4,'4C',610);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario_ejemplo9`
--

DROP TABLE IF EXISTS `inventario_ejemplo9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario_ejemplo9` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `numero` varchar(200) DEFAULT NULL,
  `dos` varchar(200) DEFAULT NULL,
  `tres` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario_ejemplo9`
--

LOCK TABLES `inventario_ejemplo9` WRITE;
/*!40000 ALTER TABLE `inventario_ejemplo9` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario_ejemplo9` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico` (
  `id_medico` int NOT NULL AUTO_INCREMENT,
  `peso` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  `talla` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  `calzado` int NOT NULL,
  `grupo_sangre` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dif_aprendisaje` varchar(650) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `prog_integracion_es` varchar(650) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `discapacidades_enfermedades` varchar(650) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `medicamentos` varchar(650) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rut_alumno` varchar(12) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_medico`),
  UNIQUE KEY `rut_alumno` (`rut_alumno`),
  CONSTRAINT `fk_alumno_medico` FOREIGN KEY (`rut_alumno`) REFERENCES `alumno` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES (1,'111','XL',41,NULL,'probando','probando',NULL,'Probando','19757944-7');
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulo` (
  `id_mod` int NOT NULL AUTO_INCREMENT,
  `operacion_pagina` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `id_rol` int NOT NULL,
  `id_operacion` int NOT NULL,
  PRIMARY KEY (`id_mod`),
  KEY `fk2_modulo` (`id_operacion`),
  KEY `fk_modulo` (`id_rol`),
  CONSTRAINT `fk2_modulo` FOREIGN KEY (`id_operacion`) REFERENCES `operacion` (`id_operacion`),
  CONSTRAINT `fk_modulo` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
INSERT INTO `modulo` VALUES (1,'crear_inventario.jsp',5,1),(2,'crear_inventario.jsp',5,4),(3,'crear_inventario.jsp',5,2),(4,'crear_inventario.jsp',5,3);
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operacion`
--

DROP TABLE IF EXISTS `operacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operacion` (
  `id_operacion` int NOT NULL,
  `opracion` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_operacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operacion`
--

LOCK TABLES `operacion` WRITE;
/*!40000 ALTER TABLE `operacion` DISABLE KEYS */;
INSERT INTO `operacion` VALUES (1,'Create'),(2,'Read'),(3,'Update'),(4,'Delete');
/*!40000 ALTER TABLE `operacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `centroPadres` double NOT NULL,
  `dechoTaller` double NOT NULL,
  `fechaPago_Padres` date DEFAULT NULL,
  `fechaPago_Taller` date DEFAULT NULL,
  `id_alumno` varchar(12) COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE KEY `id_alumno` (`id_alumno`),
  CONSTRAINT `fk_alumno_pagos` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1000,1000,'2024-08-30','2024-08-30','19757944-7');
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participacion`
--

DROP TABLE IF EXISTS `participacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participacion` (
  `participacionTalleres` tinyint(1) NOT NULL,
  `participacionReligion` tinyint(1) NOT NULL,
  `id_alumno` varchar(12) COLLATE utf8mb4_general_ci NOT NULL,
  KEY `kf_participacion` (`id_alumno`),
  CONSTRAINT `fk_alumno_participacion` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participacion`
--

LOCK TABLES `participacion` WRITE;
/*!40000 ALTER TABLE `participacion` DISABLE KEYS */;
INSERT INTO `participacion` VALUES (1,0,'19757944-7');
/*!40000 ALTER TABLE `participacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planes`
--

DROP TABLE IF EXISTS `planes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planes` (
  `id_plan` int NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_plan`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planes`
--

LOCK TABLES `planes` WRITE;
/*!40000 ALTER TABLE `planes` DISABLE KEYS */;
INSERT INTO `planes` VALUES (510,'Educación Media T/P Industrial Niños y Jovenes'),(610,'Educación Media T/P Técnica niños y jovenes'),(310,'Enseñanza Media Humanístico Científico');
/*!40000 ALTER TABLE `planes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prioridad_carrera`
--

DROP TABLE IF EXISTS `prioridad_carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prioridad_carrera` (
  `id_prioridad` int NOT NULL,
  `prioridad_A` int NOT NULL,
  `prioridad_b` int NOT NULL,
  `id_alumno` varchar(12) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_prioridad`),
  UNIQUE KEY `id_alumno` (`id_alumno`),
  CONSTRAINT `fk_alumno_prio` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prioridad_carrera`
--

LOCK TABLES `prioridad_carrera` WRITE;
/*!40000 ALTER TABLE `prioridad_carrera` DISABLE KEYS */;
/*!40000 ALTER TABLE `prioridad_carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (5,'Administrador'),(6,'Digitalizador'),(7,'Usuario_Estandar'),(8,'Lector');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talleres`
--

DROP TABLE IF EXISTS `talleres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `talleres` (
  `id_taller` int NOT NULL,
  `nombreTaller` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_taller`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talleres`
--

LOCK TABLES `talleres` WRITE;
/*!40000 ALTER TABLE `talleres` DISABLE KEYS */;
INSERT INTO `talleres` VALUES (666,'taller_test'),(777,'prueba_taller');
/*!40000 ALTER TABLE `talleres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `rut_usuario` varchar(12) COLLATE utf8mb4_general_ci NOT NULL,
  `primerNombre` varchar(80) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `segundoNombre` varchar(80) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `paterno` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `materno` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `fechaCreacion` date NOT NULL,
  `password` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `cambioPassword` tinyint(1) DEFAULT NULL,
  `id_rol` int NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `rut_usuario` (`rut_usuario`),
  KEY `fk_usuario` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (3,'19405196-4','Rodrigo','Ignacio','Farias','Alarcon','informaticajdpa@educasanantonio.cl','2024-08-13','rere',0,5),(5,'19405196-0','','','Luciano','Facundo','fff@gmail.com','2024-08-13','44',0,7),(6,'15168158-9','daniel','fdffdfdfdfdf','fdfdfsdfsf','ffdfsfsfs','rodrigfdsafsdffadfasdfsado@gmail.cl','2024-10-15','rodrigo22',0,6),(7,'19405196-8','pedro','eferfe','fdfdfsdfsf','sdfsdfsdf','rodrigfdsafsdffadfeeeasdfsado@gmail.cl','2024-10-15','rodrigo88',0,8),(8,'19408175-8','pepito','pepoto','putttoooo','totigetrgrto','ronaldiniopoto@hotmail.cl','2024-10-15','rodrigo88',0,7),(10,'89158156-7','brono','brono','nwofnweofnwofe','onfiowfnmwo','rodsdsdsdsdsdrigo@gmail.cl','2024-10-15','brunoqlpenca',0,6),(11,'15252898-9','TTTT','GJRGJIOTGT','RBKNTRIN','vfndfvdfo','rodrffadfeeeasdfsado@gmail.cl','2024-10-15','roropiroro',0,9);
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

-- Dump completed on 2024-10-17 12:49:48
