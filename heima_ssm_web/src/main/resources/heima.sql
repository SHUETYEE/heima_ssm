/*
SQLyog Professional v12.09 (64 bit)
MySQL - 8.0.15 : Database - heima
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`heima` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

USE `heima`;

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(33) DEFAULT NULL,
  `nickname` varchar(33) DEFAULT NULL,
  `phonenum` varchar(33) DEFAULT NULL,
  `email` varchar(33) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `member` */

insert  into `member`(`id`,`name`,`nickname`,`phonenum`,`email`) values (1,'张三','小三','18237233963','1184683152@qq.com');

/*Table structure for table `order_traveller` */

DROP TABLE IF EXISTS `order_traveller`;

CREATE TABLE `order_traveller` (
  `orderId` int(11) NOT NULL,
  `travellerId` int(11) NOT NULL,
  PRIMARY KEY (`orderId`,`travellerId`),
  KEY `travellerId` (`travellerId`),
  CONSTRAINT `order_traveller_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_traveller_ibfk_2` FOREIGN KEY (`travellerId`) REFERENCES `traveller` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `order_traveller` */

insert  into `order_traveller`(`orderId`,`travellerId`) values (1,1),(1,2);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNum` varchar(20) NOT NULL,
  `orderTime` date DEFAULT NULL,
  `peopleCount` int(11) DEFAULT NULL,
  `orderDesc` varchar(500) DEFAULT NULL,
  `payType` int(11) DEFAULT NULL,
  `orderStatus` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `memberId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderNum` (`orderNum`),
  KEY `productId` (`productId`),
  KEY `memberId` (`memberId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `orders` */

insert  into `orders`(`id`,`orderNum`,`orderTime`,`peopleCount`,`orderDesc`,`payType`,`orderStatus`,`productId`,`memberId`) values (1,'123','2019-10-24',3,'haha',1,1,1,1),(2,'234','2019-10-25',4,'hehe',0,1,1,1),(3,'345','2019-10-24',2,'hh',1,1,2,1),(4,'235','2019-10-18',4,'kk',0,1,2,1),(5,'678','2019-10-03',5,'dd',1,1,3,1),(6,'567','2019-10-02',3,'ff',0,1,3,1);

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `permission` */

insert  into `permission`(`id`,`permissionName`,`url`) values (1,'userfindAll','/user/findAll.do'),(2,'userfindById','/user/findById.do');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productNum` varchar(50) NOT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `cityName` varchar(50) DEFAULT NULL,
  `DepartureTime` timestamp NULL DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productDesc` varchar(500) DEFAULT NULL,
  `productStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `productNum` (`productNum`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `product` */

insert  into `product`(`id`,`productNum`,`productName`,`cityName`,`DepartureTime`,`productPrice`,`productDesc`,`productStatus`) values (1,'itcast-002','北京三日游','北京','2019-10-08 02:56:44',1000,'good',1),(2,'itcast-003','上海五日游','上海','2017-09-11 02:57:40',2000,'perfet',0),(3,'itcast-001','深圳两日游','深圳','2018-09-11 03:58:41',3000,'不错',1),(4,'itcast-004','江南一日游','北京','2019-10-24 10:30:00',111,'不错',1);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) DEFAULT NULL,
  `roleDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `role` */

insert  into `role`(`id`,`roleName`,`roleDesc`) values (1,'ADMIN','vip'),(2,'aaa','aaa');

/*Table structure for table `role_permission` */

DROP TABLE IF EXISTS `role_permission`;

CREATE TABLE `role_permission` (
  `permissionId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`permissionId`,`roleId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`),
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `role_permission` */

insert  into `role_permission`(`permissionId`,`roleId`) values (1,2),(2,2);

/*Table structure for table `syslog` */

DROP TABLE IF EXISTS `syslog`;

CREATE TABLE `syslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitTime` timestamp NULL DEFAULT NULL,
  `username` varchar(22) DEFAULT NULL,
  `ip` varchar(33) DEFAULT NULL,
  `url` varchar(33) DEFAULT NULL,
  `executionTime` int(11) DEFAULT NULL,
  `method` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `syslog` */

insert  into `syslog`(`id`,`visitTime`,`username`,`ip`,`url`,`executionTime`,`method`) values (1,'2019-10-09 12:55:02','tom','0:0:0:0:0:0:0:1','/product/findAll.do',41,'[类名]com.itheima.ssm.controller.ProductController[方法名]findASll'),(2,'2019-10-09 12:55:07','tom','0:0:0:0:0:0:0:1','/orders/findAll.do',0,'[类名]com.itheima.ssm.controller.OrdersController[方法名]findASll'),(3,'2019-10-09 13:02:11','tom','0:0:0:0:0:0:0:1','/product/findAll.do',126,'[类名]com.itheima.ssm.controller.ProductController[方法名]findASll'),(4,'2019-10-09 13:02:27','tom','0:0:0:0:0:0:0:1','/product/findAll.do',30,'[类名]com.itheima.ssm.controller.ProductController[方法名]findASll'),(5,'2019-10-09 13:02:41','tom','0:0:0:0:0:0:0:1','/product/findAll.do',16,'[类名]com.itheima.ssm.controller.ProductController[方法名]findASll'),(6,'2019-10-09 13:02:54','tom','0:0:0:0:0:0:0:1','/orders/findAll.do',47,'[类名]com.itheima.ssm.controller.OrdersController[方法名]findASll'),(7,'2019-10-09 13:02:56','tom','0:0:0:0:0:0:0:1','/orders/findAll.do',1,'[类名]com.itheima.ssm.controller.OrdersController[方法名]findASll'),(8,'2019-10-09 13:03:02','tom','0:0:0:0:0:0:0:1','/orders/findAll.do',93,'[类名]com.itheima.ssm.controller.OrdersController[方法名]findASll'),(9,'2019-10-09 13:03:12','tom','0:0:0:0:0:0:0:1','/role/findAll.do',46,'[类名]com.itheima.ssm.controller.RoleController[方法名]findAll'),(10,'2019-10-09 13:03:21','tom','0:0:0:0:0:0:0:1','/role/findAll.do',0,'[类名]com.itheima.ssm.controller.RoleController[方法名]findAll'),(11,'2019-10-09 13:03:25','tom','0:0:0:0:0:0:0:1','/role/findAll.do',0,'[类名]com.itheima.ssm.controller.RoleController[方法名]findAll'),(12,'2019-10-09 13:05:16','tom','0:0:0:0:0:0:0:1','/product/findAll.do',24,'[类名]com.itheima.ssm.controller.ProductController[方法名]findASll'),(13,'2019-10-09 13:12:43','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',54,'[类名]com.itheima.ssm.controller.logController[方法名]findAll'),(14,'2019-10-09 13:15:25','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',48,'[类名]com.itheima.ssm.controller.logController[方法名]findAll'),(15,'2019-10-09 13:17:15','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',46,'[类名]com.itheima.ssm.controller.logController[方法名]findAll'),(16,'2019-10-09 13:17:18','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',33,'[类名]com.itheima.ssm.controller.logController[方法名]findAll'),(17,'2019-10-09 13:17:33','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',25,'[类名]com.itheima.ssm.controller.logController[方法名]findAll'),(18,'2019-10-09 13:18:13','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',36,'[类名]com.itheima.ssm.controller.logController[方法名]findAll'),(19,'2019-10-09 13:18:20','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',26,'[类名]com.itheima.ssm.controller.logController[方法名]findAll'),(20,'2019-10-09 13:19:23','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',63,'[类名]com.itheima.ssm.controller.logController[方法名]findAll'),(21,'2019-10-09 13:19:27','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',34,'[类名]com.itheima.ssm.controller.logController[方法名]findAll'),(22,'2019-10-09 13:19:30','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',19,'[类名]com.itheima.ssm.controller.logController[方法名]findAll'),(23,'2019-10-09 13:19:50','tom','0:0:0:0:0:0:0:1','/role/findAll.do',19,'[类名]com.itheima.ssm.controller.RoleController[方法名]findAll'),(24,'2019-10-09 13:19:55','tom','0:0:0:0:0:0:0:1','/product/findAll.do',80,'[类名]com.itheima.ssm.controller.ProductController[方法名]findASll'),(25,'2019-10-09 13:19:58','tom','0:0:0:0:0:0:0:1','/orders/findAll.do',136,'[类名]com.itheima.ssm.controller.OrdersController[方法名]findASll'),(26,'2019-10-09 13:20:05','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',24,'[类名]com.itheima.ssm.controller.logController[方法名]findAll'),(27,'2019-10-09 13:20:25','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',49,'[类名]com.itheima.ssm.controller.logController[方法名]findAll'),(28,'2019-10-09 13:21:36','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',77,'[类名]com.itheima.ssm.controller.logController[方法名]findAll'),(29,'2019-10-09 13:21:46','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',43,'[类名]com.itheima.ssm.controller.logController[方法名]findAll'),(30,'2019-10-09 13:22:00','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',17,'[类名]com.itheima.ssm.controller.logController[方法名]findAll'),(31,'2019-10-09 13:22:04','tom','0:0:0:0:0:0:0:1','/product/findAll.do',19,'[类名]com.itheima.ssm.controller.ProductController[方法名]findASll'),(32,'2019-10-09 13:22:06','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',42,'[类名]com.itheima.ssm.controller.logController[方法名]findAll'),(33,'2019-10-09 13:29:40','tom','0:0:0:0:0:0:0:1','/role/findAll.do',21,'[类名]com.itheima.ssm.controller.RoleController[方法名]findAll'),(34,'2019-10-09 13:29:43','tom','0:0:0:0:0:0:0:1','/role/findAll.do',1,'[类名]com.itheima.ssm.controller.RoleController[方法名]findAll'),(35,'2019-10-10 04:22:07','tom','0:0:0:0:0:0:0:1','/product/findAll.do',51,'[类名]com.itheima.ssm.controller.ProductController[方法名]findASll'),(36,'2019-10-10 04:22:11','tom','0:0:0:0:0:0:0:1','/orders/findAll.do',201,'[类名]com.itheima.ssm.controller.OrdersController[方法名]findASll'),(37,'2019-10-10 04:22:15','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',48,'[类名]com.itheima.ssm.controller.logController[方法名]findASll'),(38,'2019-10-10 04:22:19','tom','0:0:0:0:0:0:0:1','/role/findAll.do',19,'[类名]com.itheima.ssm.controller.RoleController[方法名]findAll'),(39,'2019-10-10 04:22:24','tom','0:0:0:0:0:0:0:1','/role/findAll.do',20,'[类名]com.itheima.ssm.controller.RoleController[方法名]findAll'),(40,'2019-10-10 04:22:34','tom','0:0:0:0:0:0:0:1','/role/findAll.do',19,'[类名]com.itheima.ssm.controller.RoleController[方法名]findAll'),(41,'2019-10-10 04:22:35','tom','0:0:0:0:0:0:0:1','/role/findAll.do',0,'[类名]com.itheima.ssm.controller.RoleController[方法名]findAll'),(42,'2019-10-10 04:22:53','tom','0:0:0:0:0:0:0:1','/role/findAll.do',5,'[类名]com.itheima.ssm.controller.RoleController[方法名]findAll'),(43,'2019-10-10 04:22:57','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',48,'[类名]com.itheima.ssm.controller.logController[方法名]findAll'),(44,'2019-10-10 05:18:01','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',22,'[类名]com.itheima.ssm.controller.logController[方法名]findAll'),(45,'2019-10-10 05:18:58','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',78,'[类名]com.itheima.ssm.controller.logController[方法名]findAll'),(46,'2019-10-10 05:24:08','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',89,'[类名]com.itheima.ssm.controller.logController[方法名]findAll'),(47,'2019-10-10 05:24:13','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',34,'[类名]com.itheima.ssm.controller.logController[方法名]findAll'),(48,'2019-10-10 05:24:17','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',32,'[类名]com.itheima.ssm.controller.logController[方法名]findAll'),(49,'2019-10-10 05:40:27','tom','0:0:0:0:0:0:0:1','/role/findAll.do',27,'[类名]com.itheima.ssm.controller.RoleController[方法名]findAll'),(50,'2019-10-10 05:40:32','tom','0:0:0:0:0:0:0:1','/orders/findAll.do',177,'[类名]com.itheima.ssm.controller.OrdersController[方法名]findAll'),(51,'2019-10-10 05:40:35','tom','0:0:0:0:0:0:0:1','/product/findAll.do',46,'[类名]com.itheima.ssm.controller.ProductController[方法名]findASll'),(52,'2019-10-10 06:22:15','tom','0:0:0:0:0:0:0:1','/user/findAll.do',56,'[类名] com.itheima.ssm.controller.UserController[方法名] findAll'),(53,'2019-10-10 06:22:19','tom','0:0:0:0:0:0:0:1','/role/findAll.do',42,'[类名] com.itheima.ssm.controller.RoleController[方法名] findAll'),(54,'2019-10-10 06:22:22','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',54,'[类名] com.itheima.ssm.controller.SysLogController[方法名] findAll'),(55,'2019-10-10 06:22:25','tom','0:0:0:0:0:0:0:1','/permission/findAll.do',74,'[类名] com.itheima.ssm.controller.PermissionController[方法名] findAll'),(56,'2019-10-10 06:22:28','tom','0:0:0:0:0:0:0:1','/product/findAll.do',52,'[类名] com.itheima.ssm.controller.ProductController[方法名] findAll'),(57,'2019-10-10 06:22:31','tom','0:0:0:0:0:0:0:1','/orders/findAll.do',278,'[类名] com.itheima.ssm.controller.OrdersController[方法名] findAll'),(58,'2019-10-10 06:22:35','tom','0:0:0:0:0:0:0:1','/orders/findAll.do',86,'[类名] com.itheima.ssm.controller.OrdersController[方法名] findAll'),(59,'2019-10-10 06:22:39','tom','0:0:0:0:0:0:0:1','/orders/findAll.do',23,'[类名] com.itheima.ssm.controller.OrdersController[方法名] findAll'),(60,'2019-10-10 06:22:45','tom','0:0:0:0:0:0:0:1','/product/findAll.do',37,'[类名] com.itheima.ssm.controller.ProductController[方法名] findAll'),(61,'2019-10-10 06:22:51','tom','0:0:0:0:0:0:0:1','/role/findAll.do',6,'[类名] com.itheima.ssm.controller.RoleController[方法名] findAll'),(62,'2019-10-10 06:22:52','tom','0:0:0:0:0:0:0:1','/user/findAll.do',13,'[类名] com.itheima.ssm.controller.UserController[方法名] findAll'),(63,'2019-10-10 06:22:54','tom','0:0:0:0:0:0:0:1','/user/findAll.do',14,'[类名] com.itheima.ssm.controller.UserController[方法名] findAll'),(64,'2019-10-10 06:23:04','tom','0:0:0:0:0:0:0:1','/role/findAll.do',21,'[类名] com.itheima.ssm.controller.RoleController[方法名] findAll'),(65,'2019-10-10 06:23:09','tom','0:0:0:0:0:0:0:1','/role/findAll.do',105,'[类名] com.itheima.ssm.controller.RoleController[方法名] findAll'),(66,'2019-10-10 06:23:14','tom','0:0:0:0:0:0:0:1','/role/findAll.do',372,'[类名] com.itheima.ssm.controller.RoleController[方法名] findAll'),(67,'2019-10-10 06:23:14','tom','0:0:0:0:0:0:0:1','/role/findAll.do',8,'[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');

/*Table structure for table `traveller` */

DROP TABLE IF EXISTS `traveller`;

CREATE TABLE `traveller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `credentialsType` int(11) DEFAULT NULL,
  `credentialsNum` varchar(50) DEFAULT NULL,
  `travellerType` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `traveller` */

insert  into `traveller`(`id`,`NAME`,`sex`,`phoneNum`,`credentialsType`,`credentialsNum`,`travellerType`) values (1,'张龙','男','13333333333 ',0,'123456789009876543',0),(2,'张小龙','男','13333333333 ',0,'987654321123456789 ',1);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`email`,`username`,`PASSWORD`,`phoneNum`,`STATUS`) values (1,'118@qq.com','tom','$2a$10$tJHudmJh6MRPdiL7mv0yfe0nZJbDHuhl7sSTnqNC4DauMik9ppi4K','133333333333',1);

/*Table structure for table `users_role` */

DROP TABLE IF EXISTS `users_role`;

CREATE TABLE `users_role` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `users_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `users_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `users_role` */

insert  into `users_role`(`userId`,`roleId`) values (1,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
