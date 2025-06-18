-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: banking_system
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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `account_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `account_type` enum('Savings','Current','Fixed Deposit') DEFAULT 'Savings',
  `balance` decimal(38,2) DEFAULT NULL,
  `status` enum('Active','Closed','Frozen') DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `account_number` (`account_number`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,11,'123456','Savings',94000.00,'Active','2025-06-14 20:20:35','2025-06-14 20:20:35');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_trail`
--

DROP TABLE IF EXISTS `audit_trail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_trail` (
  `audit_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `action` varchar(255) NOT NULL,
  `action_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(45) DEFAULT NULL,
  `additional_info` text,
  PRIMARY KEY (`audit_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `audit_trail_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_trail`
--

LOCK TABLES `audit_trail` WRITE;
/*!40000 ALTER TABLE `audit_trail` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_trail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branches` (
  `branch_id` int NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(255) DEFAULT NULL,
  `branch_address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (1,'Main Branch','123 Main Street, City','9876543210','2025-06-13 12:10:55','2025-06-13 12:10:55'),(2,'North Branch','456 North Avenue, City','9123456780','2025-06-13 12:11:42','2025-06-13 12:11:42');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kyc_documents`
--

DROP TABLE IF EXISTS `kyc_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kyc_documents` (
  `document_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `document_type` varchar(255) DEFAULT NULL,
  `id_number` varchar(255) DEFAULT NULL,
  `document_path` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `uploaded_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `reviewed_by` int DEFAULT NULL,
  `reviewed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`document_id`),
  KEY `user_id` (`user_id`),
  KEY `reviewed_by` (`reviewed_by`),
  CONSTRAINT `kyc_documents_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `kyc_documents_ibfk_2` FOREIGN KEY (`reviewed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kyc_documents`
--

LOCK TABLES `kyc_documents` WRITE;
/*!40000 ALTER TABLE `kyc_documents` DISABLE KEYS */;
INSERT INTO `kyc_documents` VALUES (1,9,'Photo',NULL,'uploads/kyc/9/photo_bmi women.jpg','Pending','2025-06-13 12:14:45',NULL,NULL),(2,9,'Aadhaar','10112003','uploads/kyc/9/Aadhaar_transport qr.pdf','Pending','2025-06-13 12:14:45',NULL,NULL),(3,11,'Photo',NULL,'uploads/kyc/11/photo_5. test.png','Pending','2025-06-14 20:16:03',NULL,NULL),(4,11,'PAN','ABC123456','uploads/kyc/11/PAN_spring 6 hrs.pdf','Pending','2025-06-14 20:16:03',NULL,NULL);
/*!40000 ALTER TABLE `kyc_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loans` (
  `loan_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `loan_amount` decimal(15,2) NOT NULL,
  `interest_rate` decimal(5,2) NOT NULL,
  `tenure_months` int NOT NULL,
  `loan_status` enum('ACTIVE','APPROVED','CLOSED','OVERDUE','PENDING','REJECTED') NOT NULL,
  `emi_amount` decimal(15,2) DEFAULT NULL,
  `emi_schedule` json DEFAULT NULL,
  `documents` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `amount_paid` decimal(15,2) NOT NULL,
  `application_date` date DEFAULT NULL,
  `asset_document_path` varchar(255) DEFAULT NULL,
  `current_due` decimal(15,2) NOT NULL,
  `next_due_date` date DEFAULT NULL,
  PRIMARY KEY (`loan_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans`
--

LOCK TABLES `loans` WRITE;
/*!40000 ALTER TABLE `loans` DISABLE KEYS */;
INSERT INTO `loans` VALUES (1,11,200000.00,10.00,24,'PENDING',9228.98,NULL,NULL,NULL,NULL,0.00,'2025-06-15',NULL,200000.00,NULL);
/*!40000 ALTER TABLE `loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_attempts` (
  `attempt_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `attempt_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `success` tinyint(1) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`attempt_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `login_attempts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_attempts`
--

LOCK TABLES `login_attempts` WRITE;
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `notification_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`notification_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piggy_bank_goals`
--

DROP TABLE IF EXISTS `piggy_bank_goals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `piggy_bank_goals` (
  `goal_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `goal_name` varchar(100) NOT NULL,
  `target_amount` decimal(15,2) NOT NULL,
  `current_amount` decimal(15,2) DEFAULT '0.00',
  `target_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`goal_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `piggy_bank_goals_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piggy_bank_goals`
--

LOCK TABLES `piggy_bank_goals` WRITE;
/*!40000 ALTER TABLE `piggy_bank_goals` DISABLE KEYS */;
/*!40000 ALTER TABLE `piggy_bank_goals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (4,'Admin'),(3,'Branch Manager'),(1,'Customer'),(2,'Teller');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suspicious_transactions`
--

DROP TABLE IF EXISTS `suspicious_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suspicious_transactions` (
  `suspicious_id` bigint NOT NULL AUTO_INCREMENT,
  `transaction_id` bigint NOT NULL,
  `flagged_reason` varchar(255) DEFAULT NULL,
  `flagged_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `reviewed_by` int DEFAULT NULL,
  `review_status` enum('Pending','Cleared','Frozen') DEFAULT 'Pending',
  PRIMARY KEY (`suspicious_id`),
  KEY `transaction_id` (`transaction_id`),
  KEY `reviewed_by` (`reviewed_by`),
  CONSTRAINT `suspicious_transactions_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`),
  CONSTRAINT `suspicious_transactions_ibfk_2` FOREIGN KEY (`reviewed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suspicious_transactions`
--

LOCK TABLES `suspicious_transactions` WRITE;
/*!40000 ALTER TABLE `suspicious_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `suspicious_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transaction_id` bigint NOT NULL AUTO_INCREMENT,
  `account_id` bigint NOT NULL,
  `transaction_type` enum('Credit','Debit','Transfer') NOT NULL,
  `amount` decimal(38,2) NOT NULL,
  `transaction_mode` enum('NEFT','IMPS','Cash','Cheque') DEFAULT 'NEFT',
  `transaction_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_account_number` varchar(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1,'Debit',5500.00,'IMPS','2025-06-14 20:24:21','123456789011','Transfer to abi (Acc: 123456789011, IFSC: ABCD0234567)'),(2,1,'Debit',5500.00,'IMPS','2025-06-14 20:24:47','123456789011','Transfer to abi (Acc: 123456789011, IFSC: ABCD0234567)'),(3,1,'Credit',5000.00,'Cheque','2025-06-14 20:26:37',NULL,'Cheque Deposit');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `role_id` int NOT NULL,
  `branch_id` int DEFAULT NULL,
  `kyc_verified` tinyint(1) DEFAULT '0',
  `is_account_locked` tinyint(1) DEFAULT '0',
  `login_attempts` int DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `account_locked_until` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `role_id` (`role_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'customer1','$2a$10$CDnpK7SqmP5obIa6dCoskuGxSl7v.nA2JSkykBj8Pa6BaMZZ3GJJe','abishekgopi20@gmail.com',NULL,'Customer One',NULL,NULL,NULL,NULL,1,NULL,0,0,0,NULL,NULL,'2025-06-10 11:00:18','2025-06-12 04:23:38'),(2,'teller1','$2a$10$7QJ9g5J9z5J9g5J9z5J9g5J9z5J9g5J9z5J9g5J9z5J9g5J9z5J9g5J9z5J9g5J9g5','teller1@gmail.com',NULL,'Teller One',NULL,NULL,NULL,NULL,2,NULL,0,0,0,NULL,NULL,'2025-06-10 11:00:18','2025-06-11 05:12:53'),(3,'manager1','$2a$10$7QJ9g5J9z5J9g5J9z5J9g5J9z5J9g5J9z5J9g5J9z5J9g5J9z5J9g5J9z5J9g5J9g5','manager1@example.com',NULL,'Manager One',NULL,NULL,NULL,NULL,3,NULL,0,0,0,NULL,NULL,'2025-06-10 11:00:18','2025-06-10 11:00:18'),(4,'admin1','$2a$10$7QJ9g5J9z5J9g5J9z5J9g5J9z5J9g5J9z5J9g5J9z5J9g5J9z5J9g5J9z5J9g5J9g5','admin1@example.com',NULL,'Admin One',NULL,NULL,NULL,NULL,4,NULL,0,0,0,NULL,NULL,'2025-06-10 11:00:18','2025-06-10 11:00:18'),(5,'customer2','$2a$10$CDnpK7SqmP5obIa6dCoskuGxSl7v.nA2JSkykBj8Pa6BaMZZ3GJJe','bbinu698@gmail.com',NULL,'Customer One',NULL,NULL,NULL,NULL,1,NULL,1,0,0,'2025-06-12 09:32:46',NULL,'2025-06-11 05:14:43','2025-06-14 21:33:31'),(6,'teller2','$2a$10$CDnpK7SqmP5obIa6dCoskuGxSl7v.nA2JSkykBj8Pa6BaMZZ3GJJe','vigneshr0@gmail.com',NULL,'Teller One',NULL,NULL,NULL,NULL,2,NULL,0,0,0,NULL,NULL,'2025-06-11 05:14:43','2025-06-14 20:12:45'),(7,'manager2','$2a$10$7QJ9g5J9z5J9g5J9z5J9g5J9z5J9g5J9z5J9g5J9z5J9g5J9z5J9g5J9z5J9g5J9g5','manager2@example.com',NULL,'Manager One',NULL,NULL,NULL,NULL,3,NULL,0,0,0,NULL,NULL,'2025-06-11 05:14:43','2025-06-11 05:14:43'),(8,'admin2','$2a$10$7QJ9g5J9z5J9g5J9z5J9g5J9z5J9g5J9z5J9g5J9z5J9g5J9z5J9g5J9z5J9g5J9g5','admin2@example.com',NULL,'Admin One',NULL,NULL,NULL,NULL,4,NULL,0,0,0,NULL,NULL,'2025-06-11 05:14:43','2025-06-11 05:14:43'),(9,'uday','$2a$10$EBcjE45xaEpFx4Xr2gOA6.SZgXIQNJSs909Xvk2qLyfjrjGjCTq/W','vedavaradaraju@gmail.com','1234567890','udhayaShree','no 5 ,this city','2003-11-10','Female','cts emplohyee',1,2,1,0,0,NULL,NULL,'2025-06-13 12:14:45','2025-06-13 12:18:00'),(11,'vigneshR','$2a$10$Bx7m8ccXA4VMoYe1qo9DPO0qHg9M7ZxoPF9XVRKn75Y3xnAm4ZCsW','bbinu6938@gmail.com','1234567890','Vignesh R','12. ABC Street, Chennai','2003-08-27','Male','Intern',1,1,1,0,0,'2025-06-15 04:30:29',NULL,'2025-06-14 20:16:02','2025-06-14 22:15:18');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-15 15:40:27
