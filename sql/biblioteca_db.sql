CREATE DATABASE  IF NOT EXISTS `biblioteca_untec1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `biblioteca_untec1`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: biblioteca_untec1
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libros` (
  `idLibro` int NOT NULL AUTO_INCREMENT,
  `isbn` varchar(20) DEFAULT NULL,
  `titulo` varchar(200) NOT NULL,
  `autor` varchar(100) DEFAULT NULL,
  `anioPublicacion` int DEFAULT NULL,
  `editorial` varchar(100) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `disponible` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`idLibro`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES (1,'1000','Las 50 Leyes del Poder','Robert Greene',2018,'Anaya Multimedia','Sociologia',0),(2,'978-0132350884','Clean Code','Robert C. Martin',2008,'Prentice Hall','Ingeniería de Software',1),(3,'978-0134685991','Effective Java','Joshua Bloch',2017,'Addison-Wesley','Programación',1),(4,'978-0135957059','The Pragmatic Programmer','Andrew Hunt',1999,'Addison-Wesley','Ingeniería de Software',1),(5,'978-8420412146','Don Quijote de la Mancha','Miguel de Cervantes',1605,'Alfaguara','Literatura Clásica',1),(6,'978-0307474728','Cien años de soledad','Gabriel García Márquez',1967,'HarperCollins','Realismo Mágico',0),(7,'978-0133856460','Marketing Management','Philip Kotler',2015,'Pearson','Marketing',1),(8,'978-1451648539','Steve Jobs','Walter Isaacson',2011,'Simon & Schuster','Biografía',1),(9,'978-0201633610','Design Patterns','Erich Gamma',1994,'Addison-Wesley','Arquitectura de Software',1),(10,'978-8440698490','El Psicoanalista','John Katzenbach',2002,'Ediciones B','Thriller',1),(11,'978-0451524935','1984','George Orwell',1949,'Signet Classic','Distopía',1),(12,'978-8433920164','La conjura de los necios','John Kennedy Toole',1980,'Anagrama','Ficción',1),(13,'978-0743273565','The Great Gatsby','F. Scott Fitzgerald',1925,'Scribner','Clásico Americano',1),(14,'978-0131103627','The C Programming Language','Brian Kernighan',1988,'Prentice Hall','Programación',1),(15,'978-0132143011','Introduction to Algorithms','Thomas Cormen',2009,'MIT Press','Computación',1),(16,'978-0596007126','Head First Design Patterns','Eric Freeman',2004,'O Reilly','Ingeniería de Software',1),(17,'978-1118008188','Code Complete','Steve McConnell',2004,'Microsoft Press','Desarrollo',1),(18,'978-0321125217','Refactoring','Martin Fowler',1999,'Addison-Wesley','Ingeniería de Software',1),(19,'978-0262033848','Artificial Intelligence: A Modern Approach','Stuart Russell',2009,'Pearson','IA',1),(20,'978-1491950357','Designing Data-Intensive Applications','Martin Kleppmann',2017,'O Reilly','Sistemas',1),(21,'978-0134092660','Modern Operating Systems','Andrew Tanenbaum',2014,'Pearson','Sistemas',1),(22,'978-0132350884','The Clean Coder','Robert C. Martin',2011,'Prentice Hall','Profesionalismo',0),(23,'978-1449331818','Learning Python','Mark Lutz',2013,'O Reilly','Programación',1),(24,'978-0060523800','The 22 Immutable Laws of Marketing','Al Ries',1993,'HarperCollins','Marketing',1),(25,'978-0470226513','Purple Cow','Seth Godin',2003,'Portfolio','Marketing',1),(26,'978-1591843146','Start with Why','Simon Sinek',2009,'Portfolio','Liderazgo',1),(27,'978-0062407702','Shoe Dog','Phil Knight',2016,'Scribner','Negocios',1),(28,'978-0804139298','Zero to One','Peter Thiel',2014,'Currency','Emprendimiento',1),(29,'978-0307887894','The Lean Startup','Eric Ries',2011,'Crown Business','Negocios',1),(30,'978-0061241895','Influence: The Psychology of Persuasion','Robert Cialdini',1984,'Harper','Psicología',1),(31,'978-0525534013','Atomic Habits','James Clear',2018,'Avery','Productividad',1),(32,'978-0399592523','Deep Work','Cal Newport',2016,'Grand Central','Productividad',1),(33,'978-0670032372','Good to Great','Jim Collins',2001,'HarperBusiness','Negocios',1),(34,'978-8420674209','La metamorfosis','Franz Kafka',1915,'Alianza','Clásico',1),(35,'978-8491050742','El amor en los tiempos del cólera','Gabriel García Márquez',1985,'Debolsillo','Realismo Mágico',1),(36,'978-8423351602','La sombra del viento','Carlos Ruiz Zafón',2001,'Planeta','Misterio',1),(37,'978-8437604947','Pedro Páramo','Juan Rulfo',1955,'Cátedra','Realismo Mágico',1),(38,'978-8497592420','Rayuela','Julio Cortázar',1963,'Punto de Lectura','Clásico Latino',1),(39,'978-8466319058','Los pilares de la Tierra','Ken Follett',1989,'Debolsillo','Ficción Histórica',1),(40,'978-8420651323','Crimen y castigo','Fiódor Dostoyevski',1866,'Alianza','Clásico',1),(41,'978-8433920164','Ensayo sobre la ceguera','José Saramago',1995,'Alfaguara','Ficción',1),(42,'978-8423342716','La ciudad y los perros','Mario Vargas Llosa',1963,'Alfaguara','Clásico Latino',1),(43,'978-8432248221','El túnel','Ernesto Sabato',1948,'Seix Barral','Existencialismo',1),(44,'978-0451524935','Fahrenheit 451','Ray Bradbury',1953,'Ballantine','Ciencia Ficción',1),(45,'978-0060850524','Brave New World','Aldous Huxley',1932,'Harper','Distopía',1),(46,'978-0345391803','The Hitchhikers Guide to the Galaxy','Douglas Adams',1979,'Pan Books','Ciencia Ficción',1),(47,'978-8445073735','El señor de los anillos: La comunidad del anillo','J.R.R. Tolkien',1954,'Minotauro','Fantasía',1),(48,'978-0441172719','Dune','Frank Herbert',1965,'Chilton Books','Ciencia Ficción',1),(49,'978-0345339706','The Hobbit','J.R.R. Tolkien',1937,'George Allen & Unwin','Fantasía',1),(50,'978-0452284234','Animal Farm','George Orwell',1945,'Secker & Warburg','Sátira Política',1),(51,'978-0553103540','A Game of Thrones','George R.R. Martin',1996,'Bantam','Fantasía',1),(52,'978-8422615835','Fundación','Isaac Asimov',1951,'Gnome Press','Ciencia Ficción',1),(53,'978-0316769488','The Catcher in the Rye','J.D. Salinger',1951,'Little, Brown','Clásico',1),(54,'978-001-510','La Alquimia de los Secretos',' Stephanie Garber',2025,'Stefano Books.','Psicologia',1),(55,'978-001-512','Alicia en el Pais de las Maravillas','Cristy Roberston',1972,'Morris','Literatura',1),(56,'978-001-51253','La Alquimia de los Secretos',' Stephanie Garber',2025,'Intelli Books','Literatura',1);
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamos` (
  `idPrestamo` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int NOT NULL,
  `idLibro` int NOT NULL,
  `fechaPrestamo` date NOT NULL,
  `fechaLimite` date NOT NULL,
  `fechaDevolucion` date DEFAULT NULL,
  `estado` varchar(20) DEFAULT 'ACTIVO',
  `tituloLibro` varchar(200) DEFAULT NULL,
  `nombreUsuario` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idPrestamo`),
  KEY `fk_usuario` (`idUsuario`),
  KEY `fk_libro` (`idLibro`),
  CONSTRAINT `fk_libro` FOREIGN KEY (`idLibro`) REFERENCES `libros` (`idLibro`),
  CONSTRAINT `fk_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamos`
--

LOCK TABLES `prestamos` WRITE;
/*!40000 ALTER TABLE `prestamos` DISABLE KEYS */;
INSERT INTO `prestamos` VALUES (1,2,1,'2026-03-30','2026-04-08','2026-03-30','DEVUELTO',NULL,NULL),(2,2,4,'2026-03-30','2026-04-08','2026-03-30','DEVUELTO',NULL,NULL),(3,2,1,'2026-03-30','2026-04-08',NULL,'ACTIVO',NULL,NULL),(4,2,54,'2026-03-30','2026-04-08','2026-03-30','DEVUELTO',NULL,NULL),(5,2,22,'2026-03-30','2026-04-08',NULL,'ACTIVO',NULL,NULL),(6,2,8,'2026-03-30','2026-04-08','2026-03-30','DEVUELTO',NULL,NULL),(7,2,6,'2026-03-31','2026-04-09',NULL,'ACTIVO',NULL,NULL),(8,2,2,'2026-03-31','2026-04-09','2026-03-31','DEVUELTO',NULL,NULL),(9,2,2,'2026-03-31','2026-04-09','2026-03-31','DEVUELTO',NULL,NULL);
/*!40000 ALTER TABLE `prestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `rut` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `carrera` varchar(100) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `rol` varchar(20) NOT NULL DEFAULT 'USER',
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `rut` (`rut`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (2,'Claudia','22.222.222-2','claudia@mail.com','1234','Ingeniería','2000-01-01','USER',1),(4,'Admin','11.111.111-1','admin@untec.cl','Admin1234!',NULL,NULL,'ADMIN',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_prestamos_detallados`
--

DROP TABLE IF EXISTS `vista_prestamos_detallados`;
/*!50001 DROP VIEW IF EXISTS `vista_prestamos_detallados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_prestamos_detallados` AS SELECT 
 1 AS `idPrestamo`,
 1 AS `idUsuario`,
 1 AS `idLibro`,
 1 AS `fechaPrestamo`,
 1 AS `fechaLimite`,
 1 AS `fechaDevolucion`,
 1 AS `estado`,
 1 AS `tituloLibro`,
 1 AS `nombreUsuario`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_prestamos_detallados`
--

/*!50001 DROP VIEW IF EXISTS `vista_prestamos_detallados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_prestamos_detallados` AS select `p`.`idPrestamo` AS `idPrestamo`,`p`.`idUsuario` AS `idUsuario`,`p`.`idLibro` AS `idLibro`,`p`.`fechaPrestamo` AS `fechaPrestamo`,`p`.`fechaLimite` AS `fechaLimite`,`p`.`fechaDevolucion` AS `fechaDevolucion`,`p`.`estado` AS `estado`,`l`.`titulo` AS `tituloLibro`,`u`.`nombre` AS `nombreUsuario` from ((`prestamos` `p` join `libros` `l` on((`p`.`idLibro` = `l`.`idLibro`))) join `usuarios` `u` on((`p`.`idUsuario` = `u`.`idUsuario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-31  3:50:28
