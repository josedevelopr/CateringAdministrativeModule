-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_catering
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_abastecimiento`
--

DROP TABLE IF EXISTS `tb_abastecimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_abastecimiento` (
  `ab_int_idabas` int(11) NOT NULL AUTO_INCREMENT,
  `ab_int_idprove` int(11) DEFAULT NULL,
  `ab_date_fechasolic` datetime DEFAULT NULL,
  `ab_date_fechaejec` datetime DEFAULT NULL,
  `ab_char_estado` char(3) DEFAULT NULL,
  `ab_dec_costtotalabas` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`ab_int_idabas`),
  KEY `ab_int_idprove` (`ab_int_idprove`),
  CONSTRAINT `tb_abastecimiento_ibfk_1` FOREIGN KEY (`ab_int_idprove`) REFERENCES `tb_proveedores` (`pr_int_idprove`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_abastecimiento`
--
-- ORDER BY:  `ab_int_idabas`

LOCK TABLES `tb_abastecimiento` WRITE;
/*!40000 ALTER TABLE `tb_abastecimiento` DISABLE KEYS */;
INSERT INTO `tb_abastecimiento` VALUES (1,1,'2019-04-26 00:00:00','2019-04-26 00:00:00','PEA',0.00),(2,2,'2019-04-30 00:00:00','2019-04-30 00:00:00','PEA',0.00);
/*!40000 ALTER TABLE `tb_abastecimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_acceso`
--

DROP TABLE IF EXISTS `tb_acceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_acceso` (
  `acc_int_idacc` int(11) NOT NULL AUTO_INCREMENT,
  `acc_int_idtipousu` int(11) DEFAULT NULL,
  `acc_int_idarchivo` int(11) DEFAULT NULL,
  PRIMARY KEY (`acc_int_idacc`),
  KEY `acc_int_idarchivo` (`acc_int_idarchivo`),
  KEY `acc_int_idtipousu` (`acc_int_idtipousu`),
  CONSTRAINT `tb_acceso_ibfk_1` FOREIGN KEY (`acc_int_idarchivo`) REFERENCES `tb_archivomenu` (`am_int_idarchivo`),
  CONSTRAINT `tb_acceso_ibfk_2` FOREIGN KEY (`acc_int_idtipousu`) REFERENCES `tb_tipousuario` (`tu_int_idtipousu`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_acceso`
--
-- ORDER BY:  `acc_int_idacc`

LOCK TABLES `tb_acceso` WRITE;
/*!40000 ALTER TABLE `tb_acceso` DISABLE KEYS */;
INSERT INTO `tb_acceso` VALUES (57,1,29),(58,1,28),(59,1,27),(60,1,26),(61,1,25),(62,1,24),(63,1,23),(64,1,22),(65,1,21),(66,1,20),(67,1,19),(68,1,18),(69,1,17),(70,1,16),(71,1,15),(72,1,14),(73,1,13),(74,1,12),(75,1,11),(76,1,10),(77,1,9),(78,1,8),(79,1,7),(80,1,6),(81,1,5),(82,1,4),(83,1,3),(84,1,2),(85,1,1),(86,2,3),(87,2,4),(88,2,5),(89,2,6),(90,2,7),(91,3,8),(92,3,9),(93,3,10),(94,3,11),(95,3,12),(96,3,13),(97,3,14),(98,6,15),(99,3,16),(100,3,17),(101,3,18),(102,3,19),(103,6,25),(104,6,26),(105,6,27),(106,6,28),(107,6,29),(108,4,8),(109,4,10),(110,4,13),(111,4,14),(112,4,21),(113,5,21);
/*!40000 ALTER TABLE `tb_acceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_alimento`
--

DROP TABLE IF EXISTS `tb_alimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_alimento` (
  `al_int_idalim` int(11) NOT NULL AUTO_INCREMENT,
  `al_vchar_descr` varchar(30) DEFAULT NULL,
  `al_int_idtipoalim` int(11) DEFAULT NULL,
  `al_dec_precalim` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`al_int_idalim`),
  KEY `al_int_idtipoalim` (`al_int_idtipoalim`),
  CONSTRAINT `tb_alimento_ibfk_1` FOREIGN KEY (`al_int_idtipoalim`) REFERENCES `tb_tipoalimento` (`ta_int_idtipoalim`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_alimento`
--
-- ORDER BY:  `al_int_idalim`

LOCK TABLES `tb_alimento` WRITE;
/*!40000 ALTER TABLE `tb_alimento` DISABLE KEYS */;
INSERT INTO `tb_alimento` VALUES (1,'Ceviche',1,30.00),(2,'Juanes',3,30.00);
/*!40000 ALTER TABLE `tb_alimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_archivomenu`
--

DROP TABLE IF EXISTS `tb_archivomenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_archivomenu` (
  `am_int_idarchivo` int(11) NOT NULL AUTO_INCREMENT,
  `am_vchar_descr` varchar(1000) DEFAULT NULL,
  `am_vchar_cntrl` varchar(1000) DEFAULT NULL,
  `am_vchar_nombr` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`am_int_idarchivo`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_archivomenu`
--
-- ORDER BY:  `am_int_idarchivo`

LOCK TABLES `tb_archivomenu` WRITE;
/*!40000 ALTER TABLE `tb_archivomenu` DISABLE KEYS */;
INSERT INTO `tb_archivomenu` VALUES (1,'Iniciar sesion','Login','IniciarSesion'),(2,'Inicio','Home','Index'),(3,'Catering','Catering','Index'),(4,'Catering en proceso','Catering','lista_catering_en_proceso'),(5,'Catering finalizados','Catering','lista_catering_finalizado'),(6,'Agregar Catering','Catering','agregar_catering'),(7,'Asignar grupo de trabajo','GrupoTrabajo','agregar_grupo_trabajo'),(8,'Menu','MenuComida','lista_menu'),(9,'Nuevo menu','MenuComida','lista_menu'),(10,'Pedidos de menu','MenuComida','lista_menu_pedidos'),(11,'Comida','Comida','lista_comida'),(12,'Agregar Comida','Comida','agregar_comida'),(13,'Comida','Comida','lista_comida'),(14,'Lista de recetas','Receta','lista_pagos'),(15,'Pagos','Pagos','lista_de_pagos'),(16,'Insumo','Insumo','lista_insumos'),(17,'Agregar insusmo','Insumo','agregar_insumos'),(18,'Solicitar Insumo','Insumo','provicionar_insumos'),(19,'Lista de proveedores','Proveedor','lista_proveedor'),(20,'Lista de cliente','Cliente','lista_cliente'),(21,'Ver grupo de trabajo','GrupoTrabajo','ver_grupo_trabajo'),(22,'Lista Usuario','Usuario','lista_usuario'),(23,'Nuevo Usuario','Usuario','agregar_usuario'),(24,'Dar de baja','Insumo','dar_baja_usuario'),(25,'Reportes','Reporte','listado_reporte'),(26,'Reportes de comida','Reporte','reporte_comida'),(27,'Reportes de pagos','Reporte','reporte_pago'),(28,'Reportes de insumos','Reporte','reporte_insumo'),(29,'Reportes de clientes','Reporte','reporte_clientes'),(30,'Inicio','Home','Index'),(31,'Catering','Catering','Index'),(32,'Catering en proceso','Catering','lista_catering_en_proceso'),(33,'Catering finalizados','Catering','lista_catering_finalizado'),(34,'Agregar Catering','Catering','agregar_catering'),(35,'Asignar grupo de trabajo','Catering','Index'),(36,'Menu','MenuComida','lista_menu'),(37,'Nuevo menu','MenuComida','lista_menu'),(38,'Pedidos de menu','MenuComida','lista_menu_pedidos'),(39,'Comida','Comida','lista_comida'),(40,'Agregar Comida','Comida','agregar_comida'),(41,'Comida','Comida','lista_comida'),(42,'Lista de recetas','Receta','lista_pagos'),(43,'Pagos','Pagos','lista_de_pagos'),(44,'Insumo','Insumo','lista_insumos'),(45,'Agregar insusmo','Insumo','agregar_insumos'),(46,'Solicitar Insumo','Insumo','provicionar_insumos'),(47,'Lista de proveedores','Proveedor','lista_proveedor'),(48,'Lista de cliente','Cliente','lista_cliente'),(49,'Insumo','Insumo','lista_insumos'),(50,'Lista Usuario','Usuario','lista_usuario'),(51,'Nuevo Usuario','Usuario','agregar_usuario'),(52,'Dar de baja','Insumo','dar_baja_usuario'),(53,'Reportes','Reporte','listado_reporte'),(54,'Reportes de comida','Reporte','reporte_comida'),(55,'Reportes de pagos','Reporte','reporte_pago'),(56,'Reportes de insumos','Reporte','reporte_insumo'),(57,'Reportes de clientes','Reporte','reporte_clientes');
/*!40000 ALTER TABLE `tb_archivomenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_auditoriausuario`
--

DROP TABLE IF EXISTS `tb_auditoriausuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_auditoriausuario` (
  `aus_int_idauditusu` int(11) NOT NULL AUTO_INCREMENT,
  `aus_int_idusu` int(11) DEFAULT NULL,
  `aus_vchar_nomtabla` varchar(50) DEFAULT NULL,
  `aus_vchar_accion` varchar(50) DEFAULT NULL,
  `aus_date_fecha_hora` datetime DEFAULT NULL,
  PRIMARY KEY (`aus_int_idauditusu`),
  KEY `aus_int_idusu` (`aus_int_idusu`),
  CONSTRAINT `tb_auditoriausuario_ibfk_1` FOREIGN KEY (`aus_int_idusu`) REFERENCES `tb_usuario` (`us_int_idusu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_auditoriausuario`
--
-- ORDER BY:  `aus_int_idauditusu`

LOCK TABLES `tb_auditoriausuario` WRITE;
/*!40000 ALTER TABLE `tb_auditoriausuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_auditoriausuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_catering`
--

DROP TABLE IF EXISTS `tb_catering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_catering` (
  `ca_int_idcater` int(11) NOT NULL AUTO_INCREMENT,
  `ca_date_fecha` datetime DEFAULT NULL,
  `ca_char_estado` char(3) DEFAULT NULL,
  `ca_vchar_lugarcater` varchar(300) DEFAULT NULL,
  `ca_char_dniclie` char(8) DEFAULT NULL,
  `ca_int_idtrab` int(11) DEFAULT NULL,
  PRIMARY KEY (`ca_int_idcater`),
  KEY `ca_int_idtrab` (`ca_int_idtrab`),
  KEY `ca_char_dniclie` (`ca_char_dniclie`),
  CONSTRAINT `tb_catering_ibfk_1` FOREIGN KEY (`ca_int_idtrab`) REFERENCES `tb_trabajador` (`tr_int_idtrab`),
  CONSTRAINT `tb_catering_ibfk_2` FOREIGN KEY (`ca_char_dniclie`) REFERENCES `tb_cliente` (`cl_char_dniclie`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_catering`
--
-- ORDER BY:  `ca_int_idcater`

LOCK TABLES `tb_catering` WRITE;
/*!40000 ALTER TABLE `tb_catering` DISABLE KEYS */;
INSERT INTO `tb_catering` VALUES (1,'2019-04-25 00:00:00','DIS','Av. Alaba 123','12345678',1),(2,'2019-04-25 00:00:00','DIS','Av. Rimac 132','87654321',7);
/*!40000 ALTER TABLE `tb_catering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cliente`
--

DROP TABLE IF EXISTS `tb_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_cliente` (
  `cl_char_dniclie` char(8) NOT NULL,
  `cl_int_idusu` int(11) DEFAULT NULL,
  `cl_vchar_nombre` varchar(50) DEFAULT NULL,
  `cl_vchar_apellido` varchar(50) DEFAULT NULL,
  `cl_char_sexo` char(1) DEFAULT NULL,
  `cl_char_ruc` char(11) DEFAULT NULL,
  `cl_char_fono` char(9) DEFAULT NULL,
  `cl_vchar_direc` varchar(300) DEFAULT NULL,
  `cl_vchar_foto` varchar(100) DEFAULT NULL,
  `cl_vchar_correo` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`cl_char_dniclie`),
  KEY `cl_int_idusu` (`cl_int_idusu`),
  CONSTRAINT `tb_cliente_ibfk_1` FOREIGN KEY (`cl_int_idusu`) REFERENCES `tb_usuario` (`us_int_idusu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente`
--
-- ORDER BY:  `cl_char_dniclie`

LOCK TABLES `tb_cliente` WRITE;
/*!40000 ALTER TABLE `tb_cliente` DISABLE KEYS */;
INSERT INTO `tb_cliente` VALUES ('12345678',5,'Cristoforo Rich','Armas Oscuras','M','12345678901','123456789','Av. Chimu 123','foto5.jpg','cliente@hotmail.com'),('87654321',6,'Pepe Toño','Alvinoalv Velasque','M','10987654321','987654321','Av. Punta Hermosa 123','foto6.jpg','otrocliente@hotmail.com');
/*!40000 ALTER TABLE `tb_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_contratocatering`
--

DROP TABLE IF EXISTS `tb_contratocatering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_contratocatering` (
  `cc_int_idcontrato` int(11) NOT NULL AUTO_INCREMENT,
  `cc_vchar_archivo` varchar(100) DEFAULT NULL,
  `cc_date_fechaini` datetime DEFAULT NULL,
  `cc_date_fechafin` datetime DEFAULT NULL,
  `cc_char_estado` char(3) DEFAULT NULL,
  `cc_char_dniclie` char(8) DEFAULT NULL,
  PRIMARY KEY (`cc_int_idcontrato`),
  KEY `cc_char_dniclie` (`cc_char_dniclie`),
  CONSTRAINT `tb_contratocatering_ibfk_1` FOREIGN KEY (`cc_char_dniclie`) REFERENCES `tb_cliente` (`cl_char_dniclie`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_contratocatering`
--
-- ORDER BY:  `cc_int_idcontrato`

LOCK TABLES `tb_contratocatering` WRITE;
/*!40000 ALTER TABLE `tb_contratocatering` DISABLE KEYS */;
INSERT INTO `tb_contratocatering` VALUES (1,'No se que va aqui xd xd xd','2019-04-26 00:00:00','2019-04-27 00:00:00','APR','12345678'),(2,'No se que va aqui xd xd xd','2019-04-26 00:00:00','2019-04-27 00:00:00','APR','87654321'),(3,'No se que va aqui xd xd xd','2019-04-30 00:00:00','2019-05-01 00:00:00','APR','12345678'),(4,'No se que va aqui xd xd xd','2019-04-30 00:00:00','2019-05-01 00:00:00','APR','87654321');
/*!40000 ALTER TABLE `tb_contratocatering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_detalleabastecimiento`
--

DROP TABLE IF EXISTS `tb_detalleabastecimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_detalleabastecimiento` (
  `dab_int_iddetabas` int(11) NOT NULL AUTO_INCREMENT,
  `dab_int_idabas` int(11) DEFAULT NULL,
  `dab_int_idinsum` int(11) DEFAULT NULL,
  `dab_int_cantidad` int(11) DEFAULT NULL,
  `dab_dec_subtotal` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`dab_int_iddetabas`),
  KEY `dab_int_idabas` (`dab_int_idabas`),
  KEY `dab_int_idinsum` (`dab_int_idinsum`),
  CONSTRAINT `tb_detalleabastecimiento_ibfk_1` FOREIGN KEY (`dab_int_idabas`) REFERENCES `tb_abastecimiento` (`ab_int_idabas`),
  CONSTRAINT `tb_detalleabastecimiento_ibfk_2` FOREIGN KEY (`dab_int_idinsum`) REFERENCES `tb_insumos` (`in_int_idinsum`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_detalleabastecimiento`
--
-- ORDER BY:  `dab_int_iddetabas`

LOCK TABLES `tb_detalleabastecimiento` WRITE;
/*!40000 ALTER TABLE `tb_detalleabastecimiento` DISABLE KEYS */;
INSERT INTO `tb_detalleabastecimiento` VALUES (1,1,1,10,0.00),(2,2,1,10,0.00),(3,1,2,10,0.00),(4,2,2,10,0.00);
/*!40000 ALTER TABLE `tb_detalleabastecimiento` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_QUITAR_STOCK` AFTER INSERT ON `tb_detalleabastecimiento` FOR EACH ROW BEGIN
		UPDATE TB_INSUMOS SET in_int_stock = in_int_stock-NEW.dab_int_cantidad WHERE in_int_idinsum = NEW.dab_int_idinsum;
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_detalleingredientealimento`
--

DROP TABLE IF EXISTS `tb_detalleingredientealimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_detalleingredientealimento` (
  `dta_int_iddetingrealim` int(11) NOT NULL AUTO_INCREMENT,
  `dta_int_idinsum` int(11) NOT NULL,
  `dta_int_cantidad` int(11) NOT NULL,
  `dta_int_idingralim` int(11) NOT NULL,
  PRIMARY KEY (`dta_int_iddetingrealim`),
  KEY `dta_int_idinsum` (`dta_int_idinsum`),
  KEY `fk_tb_ingrediente_id_ingrediente_idx` (`dta_int_idingralim`),
  CONSTRAINT `fk_id_ingrediente` FOREIGN KEY (`dta_int_iddetingrealim`) REFERENCES `tb_ingredientesalimento` (`is_int_idingralim`),
  CONSTRAINT `fk_id_insumo` FOREIGN KEY (`dta_int_idinsum`) REFERENCES `tb_insumos` (`in_int_idinsum`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_detalleingredientealimento`
--
-- ORDER BY:  `dta_int_iddetingrealim`

LOCK TABLES `tb_detalleingredientealimento` WRITE;
/*!40000 ALTER TABLE `tb_detalleingredientealimento` DISABLE KEYS */;
INSERT INTO `tb_detalleingredientealimento` VALUES (1,1,2,0),(2,2,2,0),(3,3,2,0),(4,1,2,0),(5,2,2,0),(6,3,2,0);
/*!40000 ALTER TABLE `tb_detalleingredientealimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_detallemenucatering`
--

DROP TABLE IF EXISTS `tb_detallemenucatering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_detallemenucatering` (
  `dm_int_iddetmenucater` int(11) NOT NULL AUTO_INCREMENT,
  `dm_int_idmenu` int(11) DEFAULT NULL,
  `dm_int_idalim` int(11) DEFAULT NULL,
  `dm_int_cantmenu` int(11) DEFAULT NULL,
  `dm_dec_subto` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`dm_int_iddetmenucater`),
  KEY `dm_int_idmenu` (`dm_int_idmenu`),
  KEY `dm_int_idalim` (`dm_int_idalim`),
  CONSTRAINT `tb_detallemenucatering_ibfk_1` FOREIGN KEY (`dm_int_idmenu`) REFERENCES `tb_menucatering` (`mc_int_idmenu`),
  CONSTRAINT `tb_detallemenucatering_ibfk_2` FOREIGN KEY (`dm_int_idalim`) REFERENCES `tb_alimento` (`al_int_idalim`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_detallemenucatering`
--
-- ORDER BY:  `dm_int_iddetmenucater`

LOCK TABLES `tb_detallemenucatering` WRITE;
/*!40000 ALTER TABLE `tb_detallemenucatering` DISABLE KEYS */;
INSERT INTO `tb_detallemenucatering` VALUES (1,1,1,20,0.00),(2,1,1,20,0.00),(3,1,1,20,0.00),(4,2,1,20,0.00),(5,2,1,20,0.00),(6,2,1,20,0.00),(7,1,2,20,0.00),(8,1,2,20,0.00),(9,1,2,20,0.00),(10,2,2,20,0.00),(11,2,2,20,0.00),(12,2,2,20,0.00);
/*!40000 ALTER TABLE `tb_detallemenucatering` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_ACTUALIZAR_SUBTOTAL` AFTER INSERT ON `tb_detallemenucatering` FOR EACH ROW BEGIN
		CALL SP_OBTENER_SUBTOTAL(NEW.dm_int_idalim);
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_detalletrabajadorcatering`
--

DROP TABLE IF EXISTS `tb_detalletrabajadorcatering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_detalletrabajadorcatering` (
  `dt_int_iddettrabcater` int(11) NOT NULL AUTO_INCREMENT,
  `dt_int_idtrab` int(11) DEFAULT NULL,
  `dt_int_idperson` int(11) DEFAULT NULL,
  PRIMARY KEY (`dt_int_iddettrabcater`),
  KEY `dt_int_idtrab` (`dt_int_idtrab`),
  KEY `dt_int_idperson` (`dt_int_idperson`),
  CONSTRAINT `tb_detalletrabajadorcatering_ibfk_1` FOREIGN KEY (`dt_int_idtrab`) REFERENCES `tb_trabajador` (`tr_int_idtrab`),
  CONSTRAINT `tb_detalletrabajadorcatering_ibfk_2` FOREIGN KEY (`dt_int_idperson`) REFERENCES `tb_personalcatering` (`pc_int_idperson`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_detalletrabajadorcatering`
--
-- ORDER BY:  `dt_int_iddettrabcater`

LOCK TABLES `tb_detalletrabajadorcatering` WRITE;
/*!40000 ALTER TABLE `tb_detalletrabajadorcatering` DISABLE KEYS */;
INSERT INTO `tb_detalletrabajadorcatering` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,2),(6,6,2),(7,7,2),(8,8,2);
/*!40000 ALTER TABLE `tb_detalletrabajadorcatering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ingredientesalimento`
--

DROP TABLE IF EXISTS `tb_ingredientesalimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_ingredientesalimento` (
  `is_int_idingralim` int(11) NOT NULL AUTO_INCREMENT,
  `is_int_idalim` int(11) NOT NULL,
  `is_date_feccrea` datetime NOT NULL,
  PRIMARY KEY (`is_int_idingralim`),
  KEY `fk_is_int_idalim_tb_alimento_int_idalim_idx` (`is_int_idalim`),
  CONSTRAINT `fk_is_int_idalim_tb_alimento_int_idalim` FOREIGN KEY (`is_int_idalim`) REFERENCES `tb_alimento` (`al_int_idalim`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ingredientesalimento`
--
-- ORDER BY:  `is_int_idingralim`

LOCK TABLES `tb_ingredientesalimento` WRITE;
/*!40000 ALTER TABLE `tb_ingredientesalimento` DISABLE KEYS */;
INSERT INTO `tb_ingredientesalimento` VALUES (1,1,'0000-00-00 00:00:00'),(2,1,'0000-00-00 00:00:00'),(3,1,'0000-00-00 00:00:00'),(4,2,'0000-00-00 00:00:00'),(5,2,'0000-00-00 00:00:00'),(6,2,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tb_ingredientesalimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_insumos`
--

DROP TABLE IF EXISTS `tb_insumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_insumos` (
  `in_int_idinsum` int(11) NOT NULL AUTO_INCREMENT,
  `in_vchar_descr` varchar(100) DEFAULT NULL,
  `in_int_stock` int(11) DEFAULT NULL,
  `in_int_minstock` int(11) DEFAULT NULL,
  `in_dec_precio` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`in_int_idinsum`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_insumos`
--
-- ORDER BY:  `in_int_idinsum`

LOCK TABLES `tb_insumos` WRITE;
/*!40000 ALTER TABLE `tb_insumos` DISABLE KEYS */;
INSERT INTO `tb_insumos` VALUES (1,'papas',1000,200,0.00),(2,'arroz',1000,200,0.00),(3,'filetes',1000,200,0.00),(4,'nuevo insumo',20,85,2.20),(5,'Caramelos',234,23,23.00),(6,'Papa Blanca',100,10,2.00);
/*!40000 ALTER TABLE `tb_insumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_menucatering`
--

DROP TABLE IF EXISTS `tb_menucatering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_menucatering` (
  `mc_int_idmenu` int(11) NOT NULL AUTO_INCREMENT,
  `mc_int_idcater` int(11) DEFAULT NULL,
  `mc_char_estado` char(3) DEFAULT NULL,
  `mc_dec_prectotalmenu` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`mc_int_idmenu`),
  KEY `mc_int_idcater` (`mc_int_idcater`),
  CONSTRAINT `tb_menucatering_ibfk_1` FOREIGN KEY (`mc_int_idcater`) REFERENCES `tb_catering` (`ca_int_idcater`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_menucatering`
--
-- ORDER BY:  `mc_int_idmenu`

LOCK TABLES `tb_menucatering` WRITE;
/*!40000 ALTER TABLE `tb_menucatering` DISABLE KEYS */;
INSERT INTO `tb_menucatering` VALUES (1,1,'ECN',0.00),(2,2,'ECN',0.00);
/*!40000 ALTER TABLE `tb_menucatering` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_ACTUALIZAR_PRECIOMENU` AFTER INSERT ON `tb_menucatering` FOR EACH ROW BEGIN
		CALL SP_OBTENER_PRECIOMENU(NEW.mc_int_idmenu);
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_pago`
--

DROP TABLE IF EXISTS `tb_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_pago` (
  `pa_int_idpago` int(11) NOT NULL AUTO_INCREMENT,
  `pa_dec_montopago` decimal(9,2) DEFAULT NULL,
  `pa_char_dniclie` char(8) DEFAULT NULL,
  `pa_int_idtipopago` int(11) DEFAULT NULL,
  `pa_int_idcater` int(11) DEFAULT NULL,
  `pa_char_estado` char(3) DEFAULT NULL,
  `pa_date_fechapago` datetime DEFAULT NULL,
  `pa_dec_descu` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`pa_int_idpago`),
  KEY `pa_char_dniclie` (`pa_char_dniclie`),
  KEY `pa_int_idtipopago` (`pa_int_idtipopago`),
  KEY `pa_int_idcater` (`pa_int_idcater`),
  CONSTRAINT `tb_pago_ibfk_1` FOREIGN KEY (`pa_char_dniclie`) REFERENCES `tb_cliente` (`cl_char_dniclie`),
  CONSTRAINT `tb_pago_ibfk_2` FOREIGN KEY (`pa_int_idtipopago`) REFERENCES `tb_tipopago` (`tp_int_idtipopago`),
  CONSTRAINT `tb_pago_ibfk_3` FOREIGN KEY (`pa_int_idcater`) REFERENCES `tb_catering` (`ca_int_idcater`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pago`
--
-- ORDER BY:  `pa_int_idpago`

LOCK TABLES `tb_pago` WRITE;
/*!40000 ALTER TABLE `tb_pago` DISABLE KEYS */;
INSERT INTO `tb_pago` VALUES (1,0.00,'12345678',1,1,'PPE','2019-04-30 00:00:00',100.00),(2,0.00,'87654321',2,2,'PPE','2019-04-30 00:00:00',100.00);
/*!40000 ALTER TABLE `tb_pago` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_ACTUALIZAR_MONTOPAGAR` AFTER INSERT ON `tb_pago` FOR EACH ROW BEGIN
		CALL SP_OBTENER_MONTOPAGAR(NEW.pa_int_idcater);
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_personalcatering`
--

DROP TABLE IF EXISTS `tb_personalcatering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_personalcatering` (
  `pc_int_idperson` int(11) NOT NULL AUTO_INCREMENT,
  `pc_int_idcater` int(11) DEFAULT NULL,
  PRIMARY KEY (`pc_int_idperson`),
  KEY `pc_int_idcater` (`pc_int_idcater`),
  CONSTRAINT `tb_personalcatering_ibfk_1` FOREIGN KEY (`pc_int_idcater`) REFERENCES `tb_catering` (`ca_int_idcater`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_personalcatering`
--
-- ORDER BY:  `pc_int_idperson`

LOCK TABLES `tb_personalcatering` WRITE;
/*!40000 ALTER TABLE `tb_personalcatering` DISABLE KEYS */;
INSERT INTO `tb_personalcatering` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `tb_personalcatering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_proveedores`
--

DROP TABLE IF EXISTS `tb_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_proveedores` (
  `pr_int_idprove` int(11) NOT NULL AUTO_INCREMENT,
  `pr_vchar_nomprove` varchar(50) DEFAULT NULL,
  `pr_char_ruc` char(11) DEFAULT NULL,
  `pr_int_estado` int(11) NOT NULL,
  PRIMARY KEY (`pr_int_idprove`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_proveedores`
--
-- ORDER BY:  `pr_int_idprove`

LOCK TABLES `tb_proveedores` WRITE;
/*!40000 ALTER TABLE `tb_proveedores` DISABLE KEYS */;
INSERT INTO `tb_proveedores` VALUES (1,'Bimbo Nuevo proveedor','12345678987',0),(2,'Sofia proveedores','12345678987',1),(3,'actualizar','12345678987',0),(4,'actualizar','12345678987',0),(9,'actualizar','12345678987',0),(10,'actualizar','12345678987',0),(11,'actualizar','12345678987',0);
/*!40000 ALTER TABLE `tb_proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipoalimento`
--

DROP TABLE IF EXISTS `tb_tipoalimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_tipoalimento` (
  `ta_int_idtipoalim` int(11) NOT NULL AUTO_INCREMENT,
  `ta_vchar_descr` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ta_int_idtipoalim`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipoalimento`
--
-- ORDER BY:  `ta_int_idtipoalim`

LOCK TABLES `tb_tipoalimento` WRITE;
/*!40000 ALTER TABLE `tb_tipoalimento` DISABLE KEYS */;
INSERT INTO `tb_tipoalimento` VALUES (1,'Marino'),(2,'Criollo'),(3,'Selvatico');
/*!40000 ALTER TABLE `tb_tipoalimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipopago`
--

DROP TABLE IF EXISTS `tb_tipopago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_tipopago` (
  `tp_int_idtipopago` int(11) NOT NULL AUTO_INCREMENT,
  `tp_vchar_descr` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`tp_int_idtipopago`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipopago`
--
-- ORDER BY:  `tp_int_idtipopago`

LOCK TABLES `tb_tipopago` WRITE;
/*!40000 ALTER TABLE `tb_tipopago` DISABLE KEYS */;
INSERT INTO `tb_tipopago` VALUES (1,'Pago con Tarjeta de Credito'),(2,'Pago con Tarjeta de Debito'),(3,'Pago en Efectivo');
/*!40000 ALTER TABLE `tb_tipopago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipotrabajador`
--

DROP TABLE IF EXISTS `tb_tipotrabajador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_tipotrabajador` (
  `tt_int_idtipotrab` int(11) NOT NULL AUTO_INCREMENT,
  `tt_vchar_descr` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tt_int_idtipotrab`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipotrabajador`
--
-- ORDER BY:  `tt_int_idtipotrab`

LOCK TABLES `tb_tipotrabajador` WRITE;
/*!40000 ALTER TABLE `tb_tipotrabajador` DISABLE KEYS */;
INSERT INTO `tb_tipotrabajador` VALUES (1,'Administrador'),(2,'Organizador'),(3,'Encargado de Menu'),(4,'Preparador de Catering');
/*!40000 ALTER TABLE `tb_tipotrabajador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipousuario`
--

DROP TABLE IF EXISTS `tb_tipousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_tipousuario` (
  `tu_int_idtipousu` int(11) NOT NULL AUTO_INCREMENT,
  `tu_vchar_descr` varchar(100) DEFAULT NULL,
  `tu_char_estado` char(3) DEFAULT NULL,
  PRIMARY KEY (`tu_int_idtipousu`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipousuario`
--
-- ORDER BY:  `tu_int_idtipousu`

LOCK TABLES `tb_tipousuario` WRITE;
/*!40000 ALTER TABLE `tb_tipousuario` DISABLE KEYS */;
INSERT INTO `tb_tipousuario` VALUES (1,'Administrador','ACT'),(2,'Organizador','ACT'),(3,'Cocinero Avanzado','ACT'),(4,'Cocinero Basico','ACT'),(5,'Trabajador Apoyo','ACT'),(6,'Contador','ACT');
/*!40000 ALTER TABLE `tb_tipousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_trabajador`
--

DROP TABLE IF EXISTS `tb_trabajador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_trabajador` (
  `tr_int_idtrab` int(11) NOT NULL AUTO_INCREMENT,
  `tr_int_idusu` int(11) DEFAULT NULL,
  `tr_int_idtipotrab` int(11) DEFAULT NULL,
  `tr_vchar_nombre` varchar(50) DEFAULT NULL,
  `tr_vchar_apellido` varchar(50) DEFAULT NULL,
  `tr_char_dni` char(8) DEFAULT NULL,
  `tr_vchar_direc` varchar(100) DEFAULT NULL,
  `tr_vchar_foto` varchar(100) DEFAULT NULL,
  `tr_vchar_correo` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`tr_int_idtrab`),
  KEY `tr_int_idusu` (`tr_int_idusu`),
  KEY `tr_int_idtipotrab` (`tr_int_idtipotrab`),
  CONSTRAINT `tb_trabajador_ibfk_1` FOREIGN KEY (`tr_int_idusu`) REFERENCES `tb_usuario` (`us_int_idusu`),
  CONSTRAINT `tb_trabajador_ibfk_2` FOREIGN KEY (`tr_int_idtipotrab`) REFERENCES `tb_tipotrabajador` (`tt_int_idtipotrab`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_trabajador`
--
-- ORDER BY:  `tr_int_idtrab`

LOCK TABLES `tb_trabajador` WRITE;
/*!40000 ALTER TABLE `tb_trabajador` DISABLE KEYS */;
INSERT INTO `tb_trabajador` VALUES (1,1,1,'Cristof Richard','Armas Claros','15937468','Av. Brasil 123','foto1.jpg','admin123@hotmail.com'),(2,2,2,'Antonio Pedro','Alvin Vela','35746829','Av. Larco 123','foto2.jpg','organizador@hotmail.com'),(3,3,3,'Joseph Raul','Joestar Kujo','48691237','Av. Arequipa 123','foto3.jpg','encargado@hotmail.com'),(4,4,4,'Cesar Alex','Ochoa Ramos','13579642','Av. La Republica 123','foto4.jpg','preparador@hotmail.com'),(5,7,1,'Sofia Heidi','Valladares','98475220','Av. Brasil 456','foto7.jpg','admin456@hotmail.com'),(6,8,2,'Carme Rita','Cordoba Leon','15937468','Av. Brasil 123','foto8.jpg','organizador2@hotmail.com'),(7,9,3,'Miguel Luis','Romero Quispe','15937468','Av. Brasil 123','foto9.jpg','encargado2@hotmail.com'),(8,10,4,'Cristof Richard','Armas Claros','15937468','Av. Brasil 123','foto10.jpg','preparador2@hotmail.com');
/*!40000 ALTER TABLE `tb_trabajador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_usuario` (
  `us_int_idusu` int(11) NOT NULL AUTO_INCREMENT,
  `us_int_idtipousu` int(11) DEFAULT NULL,
  `us_vchar_correo` varchar(30) DEFAULT NULL,
  `us_vchar_password` varchar(16) DEFAULT NULL,
  `us_vchar_foto` varchar(100) DEFAULT NULL,
  `us_vchar_nomusu` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`us_int_idusu`),
  KEY `us_int_idtipousu` (`us_int_idtipousu`),
  CONSTRAINT `tb_usuario_ibfk_1` FOREIGN KEY (`us_int_idtipousu`) REFERENCES `tb_tipousuario` (`tu_int_idtipousu`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario`
--
-- ORDER BY:  `us_int_idusu`

LOCK TABLES `tb_usuario` WRITE;
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
INSERT INTO `tb_usuario` VALUES (1,1,'admin123@hotmail.com','123','foto1.jpg','usuario1'),(2,2,'organizador@hotmail.com','456','foto2.jpg','usuario2'),(3,3,'encargado@hotmail.com','789','foto3.jpg','usuario3'),(4,4,'preparador@hotmail.com','321','foto4.jpg','usuario4'),(5,5,'cliente@hotmail.com','654','foto5.jpg','usuario5'),(6,5,'otrocliente@hotmail.com','987','foto6.jpg','usuario6'),(7,1,'admin456@hotmail.com','465','foto7.jpg','usuario7'),(8,2,'organizador2@hotmail.com','364','foto8.jpg','usuario8'),(9,3,'encargado2@hotmail.com','743','foto9.jpg','usuario9'),(10,4,'preparador2@hotmail.com','159','foto10.jpg','usuario10');
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_USU_AUDIUSU` AFTER INSERT ON `tb_usuario` FOR EACH ROW BEGIN
		INSERT INTO TB_AUDITORIAUSUARIO (aus_int_idusu, aus_vchar_nomtabla, aus_vchar_accion, aus_date_fecha_hora)
        VALUES (NEW.us_int_idusu, 'TB_USUARIO', 'CREAR NUEVO USUARIO', now());
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_USU_AUDIUSU2` AFTER UPDATE ON `tb_usuario` FOR EACH ROW BEGIN
		INSERT INTO TB_AUDITORIAUSUARIO (aus_int_idusu, aus_vchar_nomtabla, aus_vchar_accion, aus_date_fecha_hora)
		VALUES (OLD.us_int_idusu, 'TB_USUARIO', 'USUARIO ACTUALIZADO', now());
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'bd_catering'
--

--
-- Dumping routines for database 'bd_catering'
--
/*!50003 DROP PROCEDURE IF EXISTS `SP_ABASTE_INSERT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ABASTE_INSERT`(
var_int_idabas int ,
var_int_idprove int ,
var_date_fechasolic datetime ,
var_date_fechaejec datetime ,
var_char_estado char(3) ,
var_dec_costtotalabas decimal(9,2) )
BEGIN
INSERT INTO TB_ABASTECIMIENTO  (ab_int_idabas, ab_int_idprove, ab_date_fechasolic,ab_date_fechaejec,ab_char_estado,ab_dec_costtotalabas)VALUES(var_int_idabas, var_int_idprove, var_date_fechasolic,var_date_fechaejec,var_char_estado,ab_dec_costtotalabas);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ABAS_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ABAS_DELETE`(ab_int_idabas int)
BEGIN
DELETE FROM TB_ABASTECIMIENTO WHERE ab_int_idabas=ab_int_idabas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ABAS_LISTID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ABAS_LISTID`(id int)
BEGIN
SELECT*FROM TB_ABASTECIMIENTO WHERE ab_int_idabas = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ABAS_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ABAS_UPDATE`(
ab_int_idabas int ,
ab_int_idprove int ,
ab_date_fechasolic datetime ,
ab_date_fechaejec datetime ,
ab_char_estado char(3) ,
ab_dec_costtotalabas decimal(9,2) 

)
BEGIN
UPDATE  TB_ABASTECIMIENTO SET
ab_int_idabas=ab_int_idabas,
ab_int_idprove=ab_int_idprove,
ab_date_fechasolic=ab_date_fechasolic,
ab_date_fechaejec=ab_date_fechaejec,
ab_char_estado=ab_char_estado,
ab_dec_costtotalabas=ab_dec_costtotalabas
WHERE ab_int_idabas=ab_int_idabas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ACCES_LISTID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACCES_LISTID`(id int)
BEGIN
SELECT*FROM TB_ACCESO WHERE acc_int_idacc = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ACC_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACC_DELETE`(acc_int_idacc int)
BEGIN
DELETE FROM TB_ACCESO WHERE acc_int_idacc = acc_int_idacc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ACC_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACC_UPDATE`(
acc_int_idacc int ,
acc_int_idtipousu int ,
acc_int_idarchivo int 
)
BEGIN


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ALIM_LISTID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ALIM_LISTID`(id int)
BEGIN
SELECT*FROM TB_ALIMENTO WHERE al_int_idalim = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ARCHIMEN_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ARCHIMEN_DELETE`(am_int_idarchivo int)
BEGIN
DELETE FROM TB_ARCHIVOMENU WHERE am_int_idarchivo=am_int_idarchivo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ARCHIMEN_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ARCHIMEN_UPDATE`(
am_int_idarchivo int ,
am_vchar_descr varchar(1000),
am_vchar_local varchar(1000)
)
BEGIN
UPDATE TB_ARCHIVOMENU SET
am_int_idarchivo=am_int_idarchivo,
am_vchar_descr=am_vchar_descr,
am_vchar_local=am_vchar_local
WHERE am_int_idarchivo=am_int_idarchivo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ARCHMEN_LISTID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ARCHMEN_LISTID`(id int)
BEGIN
SELECT*FROM TB_ARCHIVOMENU WHERE am_int_idarchivo = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_AUDITO_LISTID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AUDITO_LISTID`(id int)
BEGIN
SELECT*FROM TB_AUDITORIA WHERE aud_int_idauditorio = id; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CATE_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CATE_DELETE`(ca_int_idcater int)
BEGIN
DELETE FROM TB_CATERING WHERE ca_int_idtrab=ca_int_idtrab;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CATE_LISTID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CATE_LISTID`(id int)
BEGIN
SELECT * FROM TB_CATERING WHERE ca_int_idcater = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CATE_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CATE_UPDATE`(ca_int_idcater int,
ca_date_fecha datetime ,
ca_char_estado char(3) ,
ca_vchar_lugarcater varchar(300) ,
ca_char_dniclie char(8) ,
ca_int_idtrab int 
)
begin
update TB_CATERING set
ca_int_idcater=ca_int_idcater,
ca_date_fecha=ca_date_fecha,
ca_char_estado=ca_char_estado,
ca_vchar_lugarcater=ca_vchar_lugarcater,
ca_char_dniclie=ca_char_dniclie,
ca_int_idtrab=ca_int_idtrab
where ca_int_idtrab=ca_int_idtrab;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CLI_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CLI_DELETE`(cl_char_dniclie char(8))
BEGIN
DELETE FROM TB_CLIENTE WHERE cl_char_dniclie=cl_char_dniclie;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CLI_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CLI_UPDATE`(
cl_char_dniclie char(8) ,
cl_int_idusu int  ,
cl_vchar_nombre varchar(50) ,
cl_vchar_apellido varchar(50) ,
cl_char_sexo char(1) ,
cl_char_ruc char(11),
cl_char_fono char(9) ,
cl_vchar_direc varchar(300) ,
cl_vchar_foto varchar(100) ,
cl_vchar_correo varchar(40)
 
)
BEGIN
UPDATE TB_CLIENTE SET
cl_char_dniclie=cl_char_dniclie,
cl_int_idusu=cl_int_idusu,
cl_vchar_nombre=cl_vchar_nombre,
cl_vchar_apellido=cl_vchar_apellido,
cl_char_sexo=cl_char_sexo,
cl_char_ruc=cl_char_ruc,
cl_char_fono=cl_char_fono,
cl_vchar_direc=cl_vchar_direc,
cl_vchar_foto=cl_vchar_foto,
cl_vchar_correo=cl_vchar_correo
where cl_char_dniclie=cl_char_dniclie;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CONTRACATER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONTRACATER`(
cc_int_idcontrato int ,
cc_vchar_archivo varchar(100) ,
cc_date_fechaini datetime ,
cc_date_fechafin datetime ,
cc_char_estado char(3) ,
cc_char_dniclie char(8) 

)
BEGIN
UPDATE TB_CONTRATOCATERING SET
cc_int_idcontrato=cc_int_idcontrato,
cc_vchar_archivo=cc_vchar_archivo,
cc_date_fechaini=cc_date_fechaini,
cc_date_fechafin=cc_date_fechafin,
cc_char_estado=cc_char_estado,
cc_char_estado=cc_char_estado,
cc_char_dniclie=cc_char_dniclie
WHERE cc_int_idcontrato=cc_int_idcontrato;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CONTRACATER_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONTRACATER_DELETE`(cc_int_idcontrato int)
BEGIN
DELETE FROM TB_CONTRATOCATERING WHERE cc_int_idcontrato=cc_int_idcontrato;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CONTRACAT_LISTID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONTRACAT_LISTID`(id int)
BEGIN
SELECT*FROM TB_CONTRATOCATERING WHERE cc_int_idcontrato = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DETABASTE_INSERT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DETABASTE_INSERT`(
dab_int_iddetabas int ,
dab_int_idabas int ,
dab_int_idinsum int ,
dab_int_cantidad int ,
dab_dec_subtotal decimal(9,2)
)
BEGIN
INSERT INTO TB_DETALLEABASTECIMIENTO  (dab_int_iddetabas, dab_int_idabas, dab_int_idinsum,dab_int_cantidad,dab_dec_subtotal)VALUES(dab_int_iddetabas, dab_int_idabas, dab_int_idinsum,dab_int_cantidad,dab_dec_subtotal);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DETABASTE_LISTID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DETABASTE_LISTID`(id int)
BEGIN
SELECT*FROM TB_DETALLEABASTECIMIENTO WHERE dab_int_iddetabas = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DETABAS_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DETABAS_DELETE`(dab_int_iddetabas int)
BEGIN
DELETE FROM TB_DETALLEABASTECIMIENTO WHERE dab_int_iddetabas=dab_int_iddetabas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DETABAS_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DETABAS_UPDATE`(
dab_int_iddetabas int,
dab_int_idabas int ,
dab_int_idinsum int ,
dab_int_cantidad int ,
dab_dec_subtotal decimal(9,2)
)
BEGIN
UPDATE TB_DETALLEABASTECIMIENTO SET
dab_int_iddetabas=dab_int_iddetabas,
dab_int_idabas=dab_int_idabas,
dab_int_idinsum=dab_int_idinsum,
dab_int_cantidad=dab_int_cantidad,
dab_dec_subtotal=dab_dec_subtotal

WHERE dab_int_iddetabas=dab_int_iddetabas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DETAINGREALIME_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DETAINGREALIME_DELETE`(dta_int_iddetingrealim int)
BEGIN
DELETE FROM TB_DETALLEINGREDIENTEALIMENTO WHERE dta_int_iddetingrealim=dta_int_iddetingrealim;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DETAINGREALIME_INSERT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DETAINGREALIME_INSERT`(
dta_int_iddetingrealim int ,
dta_int_idinsum int ,
dta_int_cantidad int ,
dta_int_idalim int
)
BEGIN
INSERT INTO TB_DETALLEINGREDIENTEALIMENTO  (dta_int_iddetingrealim, dta_int_idinsum, dta_int_cantidad,dta_int_idalim)VALUES(dta_int_iddetingrealim, dta_int_idinsum, dta_int_cantidad,dta_int_idalim);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DETAINGREALIME_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DETAINGREALIME_UPDATE`(
dta_int_iddetingrealim int ,
dta_int_idinsum int ,
dta_int_cantidad int ,
dta_int_idalim int 
)
BEGIN

UPDATE  TB_DETALLEINGREDIENTEALIMENTO SET
dta_int_iddetingrealim=dta_int_iddetingrealim,
dta_int_idinsum=dta_int_idinsum,
dta_int_cantidad=dta_int_cantidad,
dta_int_idalim=dta_int_idalim
WHERE dta_int_iddetingrealim=dta_int_iddetingrealim;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DETAINGREDALIMEN_LISTID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DETAINGREDALIMEN_LISTID`(id int)
BEGIN
SELECT*FROM TB_DETALLEINGREDIENTEALIMENTO WHERE dta_int_iddetingrealim = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DETAMENUCATE_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DETAMENUCATE_DELETE`(dm_int_iddetmenucater int)
BEGIN
DELETE FROM TB_DETALLEMENUCATERING WHERE dm_int_iddetmenucater=dm_int_iddetmenucater;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DETAMENUCATE_INSERT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DETAMENUCATE_INSERT`(
dm_int_iddetmenucater int ,
dm_int_idmenu int ,
dm_int_idalim int ,
dm_int_cantmenu int ,
dm_dec_subto decimal(9,2)
)
BEGIN
INSERT INTO TB_DETALLEMENUCATERING  (dm_int_iddetmenucater, dm_int_idmenu, dm_int_idalim,dm_int_cantmenu,dm_dec_subto)VALUES(dm_int_iddetmenucater, dm_int_idmenu, dm_int_idalim,dm_int_cantmenu,dm_dec_subto);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DETAMENUCATE_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DETAMENUCATE_UPDATE`(
dm_int_iddetmenucater int ,
dm_int_idmenu int ,
dm_int_idalim int ,
dm_int_cantmenu int ,
dm_dec_subto decimal(9,2)

)
BEGIN
UPDATE TB_DETALLEMENUCATERING SET
dm_int_iddetmenucater=dm_int_iddetmenucater,
dm_int_idmenu=dm_int_idmenu,
dm_int_idalim=dm_int_idalim,
dm_int_cantmenu=dm_int_cantmenu,
dm_dec_subto=dm_dec_subto

WHERE dm_int_iddetmenucater=dm_int_iddetmenucater;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DETATRABACATE_INSERT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DETATRABACATE_INSERT`(
dt_int_iddettrabcater int,
dt_int_idtrab int ,
dt_int_idperson int 
)
BEGIN
INSERT INTO TB_DETALLETRABAJADORCATERING  (dt_int_iddettrabcater, dt_int_idtrab, dt_int_idperson)VALUES(dt_int_iddettrabcater, dt_int_idtrab, dt_int_idperson);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DETATRABACATE_LISTID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DETATRABACATE_LISTID`(id int)
BEGIN
SELECT*FROM TB_DETALLETRABAJADORCATERING WHERE dt_int_iddettrabcater = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DETATRACATE_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DETATRACATE_DELETE`(dt_int_iddettrabcater int)
BEGIN
DELETE FROM TB_DETALLETRABAJADORCATERING WHERE dt_int_iddettrabcater=dt_int_iddettrabcater;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DETATRACATE_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DETATRACATE_UPDATE`(
dt_int_iddettrabcater int ,
dt_int_idtrab int ,
dt_int_idperson int 
)
BEGIN
UPDATE TB_DETALLETRABAJADORCATERING SET
dt_int_iddettrabcater=dt_int_iddettrabcater,
dt_int_idtrab=dt_int_idtrab,
dt_int_idperson=dt_int_idperson
WHERE dt_int_iddettrabcater=dt_int_iddettrabcater;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DETMENUCAT_LISTID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DETMENUCAT_LISTID`(id int)
BEGIN
SELECT*FROM TB_DETALLEMENUCATERING  WHERE  dm_int_iddetmenucater = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INGREALIMEN_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INGREALIMEN_DELETE`(is_int_idingralim int)
BEGIN
DELETE FROM TB_INGREDIENTESALIMENTO WHERE is_int_idingralim=is_int_idingralim;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INGREALIMEN_LISTID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INGREALIMEN_LISTID`(id int)
BEGIN
SELECT*FROM TB_INGREDIENTESALIMENTO WHERE is_int_idingralim = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INGREALIMEN_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INGREALIMEN_UPDATE`(
is_int_idingralim int ,
is_int_idalim int ,
is_int_iddetingrealim int 
)
BEGIN
UPDATE  TB_INGREDIENTESALIMENTO SET
is_int_idingralim=is_int_idingralim,
is_int_idalim=is_int_idalim,
is_int_iddetingrealim=is_int_iddetingrealim

WHERE is_int_idingralim=is_int_idingralim;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INGREDALIMENT_INSERT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INGREDALIMENT_INSERT`(
is_int_idingralim int ,
is_int_idalim int ,
is_int_iddetingrealim int 
)
BEGIN
INSERT INTO TB_INGREDIENTESALIMENTO  (is_int_idingralim, is_int_idalim, is_int_iddetingrealim)VALUES(is_int_idingralim, is_int_idalim, is_int_iddetingrealim);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSUM_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSUM_DELETE`(in_int_idinsum int)
BEGIN
DELETE FROM TB_INSUMOS WHERE in_int_idinsum=in_int_idinsum;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSUM_INSERT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSUM_INSERT`(
var_int_idinsum int ,
var_vchar_descr varchar(100) ,
var_int_stock int ,
var_int_minstock int ,
var_dec_precio decimal(8,2)
)
BEGIN
INSERT INTO TB_INSUMOS (in_int_idinsum, in_vchar_descr, in_int_stock, in_int_minstock, in_dec_precio) 
values 
(var_int_idinsum,var_vchar_descr,var_int_stock,var_int_minstock,var_dec_precio);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSUM_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSUM_UPDATE`(
var_int_idinsum int ,
var_vchar_descr varchar(100) ,
var_int_stock int ,
var_int_minstock int ,
var_dec_precio decimal(8,2)
)
BEGIN
UPDATE TB_INSUMOS SET
in_int_idinsum=var_int_idinsum,
in_vchar_descr=var_vchar_descr,
in_int_stock=var_int_stock,
in_int_minstock=var_int_minstock,
in_dec_precio=var_dec_precio
WHERE in_int_idinsum=var_int_idinsum;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INS_LIS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INS_LIS`()
BEGIN
	SELECT 
	in_int_idinsum,
	in_vchar_descr,
	in_int_stock,
	in_int_minstock,
	in_dec_precio
	FROM TB_INSUMOS;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INS_LISTID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INS_LISTID`(id int)
BEGIN
SELECT * FROM TB_INSUMOS WHERE in_int_idinsum = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MENCATE_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MENCATE_DELETE`(mc_int_idmenu int)
BEGIN
DELETE FROM TB_MENUCATERING WHERE mc_int_idmenu=mc_int_idmenu;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MENCATE_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MENCATE_UPDATE`(
mc_int_idmenu int ,
mc_int_idcater int ,
mc_char_estado char(3) ,
mc_dec_prectotalmenu decimal(9,2))
BEGIN
UPDATE TB_MENUCATERING SET 
mc_int_idmenu=mc_int_idmenu,
mc_int_idcater=mc_int_idcater,
mc_char_estado=mc_char_estado,
mc_dec_prectotalmenu=mc_dec_prectotalmenu
WHERE mc_int_idmenu=mc_int_idmenu;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MENCAT_LISTID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MENCAT_LISTID`(id int)
BEGIN
SELECT*FROM TB_MENUCATERING WHERE mc_int_idmenu = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_OBTENER_MONTOPAGAR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_OBTENER_MONTOPAGAR`(id int)
BEGIN
	SET @montopago = (SELECT m.mc_dec_prectotalmenu - p.pa_dec_descu FROM TB_MENUCATERING AS m INNER JOIN TB_PAGO AS p ON m.mc_int_idcater = p.pa_int_idcater where pa_int_idcater = id);
    UPDATE TB_PAGO SET pa_dec_montopago = @montopago where pa_int_idcater = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_OBTENER_PRECIOMENU` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_OBTENER_PRECIOMENU`(id int)
BEGIN
	SET @precmenu = (SELECT SUM(dm_int_cantmenu*dm_dec_subto) FROM TB_DETALLEMENUCATERING WHERE dm_int_idmenu = id);
    UPDATE TB_MENUCATERING SET mc_dec_prectotalmenu = @precmenu WHERE mc_int_idmenu = id;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_OBTENER_SUBTOTAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_OBTENER_SUBTOTAL`(id int)
BEGIN
	SET @subtotal = (SELECT SUM(al.al_dec_precalim*dta.dta_int_cantidad) FROM TB_ALIMENTO AS al INNER JOIN TB_DETALLEINGREDIENTEALIMENTO AS dta ON al.al_int_idalim = dta.dta_int_idalim WHERE al.al_int_idalim = id);
	UPDATE TB_DETALLEMENUCATERING SET dm_dec_subto = @subtotal WHERE dm_int_idalim = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_PAG_LISTID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PAG_LISTID`(id int)
BEGIN
SELECT*FROM TB_PAGO WHERE pa_int_idpago = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_PERSOCARTE_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PERSOCARTE_DELETE`(pc_int_idperson int)
BEGIN
DELETE FROM TB_PERSONALCATERING WHERE pc_int_idperson=pc_int_idperson;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_PERSOCARTE_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PERSOCARTE_UPDATE`(
pc_int_idperson int ,
pc_int_idcater int 
)
BEGIN
UPDATE TB_PERSONALCATERING SET
pc_int_idperson=pc_int_idperson,
pc_int_idcater=pc_int_idcater
WHERE pc_int_idperson=pc_int_idperson;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_PERSOCATE_LISTID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PERSOCATE_LISTID`(id int)
BEGIN
SELECT*FROM TB_PERSONALCATERING WHERE pc_int_idperson = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_PROVE_INSERT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PROVE_INSERT`(
pr_vchar_nomprove varchar(50) ,
pr_char_ruc char(11) 
)
BEGIN
INSERT INTO TB_PROVEEDORES  (pr_vchar_nomprove, pr_char_ruc, pr_int_estado)VALUES(pr_vchar_nomprove, pr_char_ruc,1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_PROVE_LIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PROVE_LIST`()
BEGIN
SELECT
pr_int_idprove,
pr_vchar_nomprove,
pr_char_ruc,
pr_int_estado
FROM TB_PROVEEDORES; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_PROVE_LISTID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PROVE_LISTID`(id int)
BEGIN
SELECT
pr_int_idprove,
pr_vchar_nomprove,
pr_char_ruc,
pr_int_estado
FROM TB_PROVEEDORES WHERE  pr_int_idprove = id; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_PROV_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PROV_DELETE`(pr_int_idprove int)
BEGIN
DELETE FROM TB_PROVEEDORES WHERE pr_int_idprove=pr_int_idprove;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_PROV_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PROV_UPDATE`(
var_int_idprove int ,
var_vchar_nomprove varchar(50) ,
var_char_ruc char(11), 
var_int_estado int
)
BEGIN
UPDATE TB_PROVEEDORES SET
pr_vchar_nomprove=var_vchar_nomprove,
pr_char_ruc=var_char_ruc,
pr_int_estado = var_int_estado
WHERE pr_int_idprove=var_int_idprove;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TIPALIM_LISTID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TIPALIM_LISTID`(id int)
BEGIN
SELECT * FROM TB_TIPOALIMENTO WHERE ta_int_idtipoalim = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TIPOALIMENTO_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TIPOALIMENTO_DELETE`(ta_int_idtipoalim int)
BEGIN 
DELETE FROM TB_TIPOALIMENTO WHERE ta_int_idtipoalim=ta_int_idtipoalim;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TIPOALIMENTO_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TIPOALIMENTO_UPDATE`(
ta_int_idtipoalim int ,
ta_vchar_descr varchar(100) 
)
BEGIN 
UPDATE TB_TIPOALIMENTO SET
ta_int_idtipoalim=ta_int_idtipoalim,
ta_vchar_descr=ta_vchar_descr
WHERE ta_int_idtipoalim=ta_int_idtipoalim;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TIPOALIM_INSERT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TIPOALIM_INSERT`(
ta_int_idtipoalim int ,
ta_vchar_descr varchar(100) 
)
BEGIN
INSERT INTO TB_TIPOALIMENTO (ta_int_idtipoalim,ta_vchar_descr)values 
(ta_int_idtipoalim,ta_vchar_descr);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TIPOPA_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TIPOPA_DELETE`(tp_int_idtipopago int)
BEGIN
DELETE FROM TB_TIPOPAGO WHERE tp_int_idtipopago=tp_int_idtipopago;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TIPOPA_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TIPOPA_UPDATE`(
tp_int_idtipopago int ,
tp_vchar_descr varchar(300)
)
BEGIN
UPDATE TB_TIPOPAGO SET
tp_int_idtipopago=tp_int_idtipopago,
tp_vchar_descr=tp_vchar_descr
WHERE tp_int_idtipopago=tp_int_idtipopago;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TIPPAGO_LISTID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TIPPAGO_LISTID`(id int)
BEGIN
SELECT*FROM TB_TIPOPAGO WHERE tp_int_idtipopago = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TIPTRAB_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TIPTRAB_DELETE`(tt_int_idtipotrab int)
BEGIN
DELETE FROM TB_TIPOTRABAJADOR WHERE tt_int_idtipotrab=tt_int_idtipotrab;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TIPTRAB_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TIPTRAB_UPDATE`(
tt_int_idtipotrab int ,
tt_vchar_descr varchar(100) 
)
BEGIN
UPDATE TB_TIPOTRABAJADOR SET
tt_int_idtipotrab=tt_int_idtipotrab,
tt_vchar_descr=tt_vchar_descr
WHERE tt_int_idtipotrab=tt_int_idtipotrab;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TIPTRA_LISTID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TIPTRA_LISTID`(id int)
BEGIN
SELECT*FROM TB_TIPOTRABAJADOR WHERE tt_int_idtipotrab = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TIPUSU_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TIPUSU_DELETE`(tu_int_idtipousu int)
BEGIN
DELETE FROM TB_TIPOUSUARIO WHERE tu_int_idtipousu=tu_int_idtipousu;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TIPUSU_LISTID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TIPUSU_LISTID`(id int)
BEGIN
SELECT * FROM TB_TIPOUSUARIO WHERE tu_int_idtipousu  = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TIPUSU_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TIPUSU_UPDATE`(tu_int_idtipousu int ,
tu_vchar_descr varchar(100) ,
tu_char_estado char(3) 
)
BEGIN
UPDATE TB_TIPOUSUARIO SET
tu_int_idtipousu=tu_int_idtipousu,
tu_vchar_descr=tu_vchar_descr,
tu_char_estado=tu_char_estado
WHERE tu_int_idtipousu=tu_int_idtipousu;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TRABA_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TRABA_DELETE`(tr_int_idtrab int)
BEGIN
DELETE FROM TB_TRABAJADOR WHERE  tr_int_idtrab=tr_int_idtrab;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TRABA_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TRABA_UPDATE`(
tr_int_idtrab int ,
tr_int_idusu int ,
tr_int_idtipotrab int ,
tr_vchar_nombre varchar(50) ,
tr_vchar_apellido varchar(50) ,
tr_char_dni char(8) ,
tr_vchar_direc varchar(100) ,
tr_vchar_foto varchar(100) ,
tr_vchar_correo varchar(40) 
)
BEGIN
UPDATE  TB_TRABAJADOR SET
tr_int_idtrab=tr_int_idtrab,
tr_int_idusu=tr_int_idusu,
tr_int_idtipotrab=tr_int_idtipotrab,
tr_vchar_nombre=tr_vchar_nombre,
tr_vchar_apellido=tr_vchar_apellido,
tr_char_dni=tr_char_dni,
tr_vchar_direc=tr_vchar_direc,
tr_vchar_foto=tr_vchar_foto,
tr_vchar_correo=tr_vchar_correo
WHERE  tr_int_idtrab=tr_int_idtrab;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TRA_LISTID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TRA_LISTID`(id int)
BEGIN
SELECT*FROM TB_TRABAJADOR WHERE tr_int_idtrab  = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_USU_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_USU_DELETE`(us_int_idusu int)
BEGIN
DELETE FROM TB_USUARIO WHERE us_int_idusu=us_int_idusu;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_USU_LISTID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_USU_LISTID`(id int)
BEGIN
SELECT * FROM TB_USUARIO WHERE us_int_idusu = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_USU_LOGIN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_USU_LOGIN`(us_correo varchar(30))
BEGIN
	SELECT * FROM TB_USUARIO WHERE us_vchar_correo = us_correo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_USU_MENACCCAB` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_USU_MENACCCAB`(us_correo varchar(30))
BEGIN	
	SET @tipoUsuario = 0;     
    SELECT us_int_idtipousu into @tipoUsuario FROM TB_USUARIO WHERE us_vchar_correo = us_correo;    
    
    select 
    distinct
    t2.am_vchar_cntrl
    from 
    tb_acceso as t1
    inner join 
    tb_archivomenu as t2
    on t2.am_int_idarchivo = t1.acc_int_idarchivo
    inner join 
    tb_tipousuario as t3
    on t1.acc_int_idtipousu = t3.tu_int_idtipousu
    WHERE     
    acc_int_idtipousu = @tipoUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_USU_MENUACCES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_USU_MENUACCES`(us_correo varchar(30))
BEGIN	
	SET @tipoUsuario = 0;     
    SELECT us_int_idtipousu into @tipoUsuario FROM TB_USUARIO WHERE us_vchar_correo = us_correo;    
    
    select 
    t2.*,
    t3.tu_vchar_descr
    from 
    tb_acceso as t1
    inner join 
    tb_archivomenu as t2
    on t2.am_int_idarchivo = t1.acc_int_idarchivo
    inner join 
    tb_tipousuario as t3
    on t1.acc_int_idtipousu = t3.tu_int_idtipousu
    WHERE     
    acc_int_idtipousu = @tipoUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_USU_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_USU_UPDATE`(us_int_idusu int ,us_int_idtipousu int,us_vchar_correo varchar(30),
us_vchar_password varchar(16),us_vchar_foto  varchar(100),us_vchar_nomusu varchar(50) 
)
BEGIN
UPDATE TB_USUARIO SET
us_int_idusu=us_int_idusu,
us_int_idtipousu=us_int_idtipousu,
us_vchar_correo=us_vchar_correo,
us_vchar_password=us_vchar_password,
us_vchar_nomusu=us_vchar_nomusu
where us_int_idusu=us_int_idusu;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-11  0:56:42
