/*
SQLyog Community Edition- MySQL GUI v8.04 
MySQL - 5.5.17 : Database - spring
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`spring` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `spring`;

/*Table structure for table `doc_rtxt` */

DROP TABLE IF EXISTS `doc_rtxt`;

CREATE TABLE `doc_rtxt` (
  `doc_rtxt_id` int(11) NOT NULL,
  `doc_rtxt` varchar(1000) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `rtext_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`doc_rtxt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `doc_rtxt` */

insert  into `doc_rtxt`(`doc_rtxt_id`,`doc_rtxt`,`seq`,`rtext_id`) values (91,'<br>',0,71);

/*Table structure for table `rtxt` */

DROP TABLE IF EXISTS `rtxt`;

CREATE TABLE `rtxt` (
  `rtext_id` int(11) NOT NULL,
  `doc_id` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `crt_by` varchar(15) DEFAULT NULL,
  `crt_on` date DEFAULT NULL,
  PRIMARY KEY (`rtext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `rtxt` */

insert  into `rtxt`(`rtext_id`,`doc_id`,`title`,`crt_by`,`crt_on`) values (71,211,'zxc','2','2012-05-20');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
