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

/*Table structure for table `clnt` */

DROP TABLE IF EXISTS `clnt`;

CREATE TABLE `clnt` (
  `clnt_id` int(11) NOT NULL,
  `clnt_name` varchar(100) DEFAULT NULL,
  `clnt_desc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`clnt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `clnt` */

/*Table structure for table `clnt_tmpl` */

DROP TABLE IF EXISTS `clnt_tmpl`;

CREATE TABLE `clnt_tmpl` (
  `clnt_tmpl_id` int(11) DEFAULT NULL,
  `clnt_id` int(11) DEFAULT NULL,
  `tmpl_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `clnt_tmpl` */

/*Table structure for table `cond` */

DROP TABLE IF EXISTS `cond`;

CREATE TABLE `cond` (
  `cond_id` int(11) NOT NULL,
  `op_type` int(11) DEFAULT NULL,
  `val` varchar(200) DEFAULT NULL,
  `source_fld` int(11) DEFAULT NULL,
  `val_type` int(11) DEFAULT NULL,
  `cond_config_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cond_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cond` */

insert  into `cond`(`cond_id`,`op_type`,`val`,`source_fld`,`val_type`,`cond_config_id`) values (123,1,'B',333,1,1),(234,1,'A',333,1,2),(345,1,'irshad',111,1,1),(567,1,'C',333,1,3),(678,2,'C',333,1,4);

/*Table structure for table `cond_actn` */

DROP TABLE IF EXISTS `cond_actn`;

CREATE TABLE `cond_actn` (
  `act_id` int(11) NOT NULL,
  `cond_config_id` int(11) DEFAULT NULL,
  `new_value` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`act_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cond_actn` */

insert  into `cond_actn`(`act_id`,`cond_config_id`,`new_value`) values (1,1,'NONE'),(2,2,'BLOCK'),(3,3,'TRUE'),(4,4,'FALSE');

/*Table structure for table `cond_config` */

DROP TABLE IF EXISTS `cond_config`;

CREATE TABLE `cond_config` (
  `cond_config_id` int(11) NOT NULL,
  `cond_type` int(11) DEFAULT NULL,
  `exp` varchar(200) DEFAULT NULL,
  `target_fld` int(11) DEFAULT NULL,
  `override` tinyint(4) DEFAULT NULL,
  `enabled` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`cond_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cond_config` */

insert  into `cond_config`(`cond_config_id`,`cond_type`,`exp`,`target_fld`,`override`,`enabled`) values (1,1,'123 && 345',444,0,1),(2,1,'234',444,0,1),(3,2,'567',111,0,1),(4,2,'678',111,0,1);

/*Table structure for table `cond_oprtr` */

DROP TABLE IF EXISTS `cond_oprtr`;

CREATE TABLE `cond_oprtr` (
  `op_id` int(11) NOT NULL,
  `op_type` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`op_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cond_oprtr` */

insert  into `cond_oprtr`(`op_id`,`op_type`) values (1,'EQ'),(2,'NOTEQ');

/*Table structure for table `cond_type` */

DROP TABLE IF EXISTS `cond_type`;

CREATE TABLE `cond_type` (
  `cond_type_id` int(11) NOT NULL,
  `cond_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cond_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cond_type` */

insert  into `cond_type`(`cond_type_id`,`cond_type`) values (1,'DISPLAY'),(2,'REQUIRED');

/*Table structure for table `cond_val_type` */

DROP TABLE IF EXISTS `cond_val_type`;

CREATE TABLE `cond_val_type` (
  `val_type_id` int(11) NOT NULL,
  `val_type` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`val_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cond_val_type` */

insert  into `cond_val_type`(`val_type_id`,`val_type`) values (1,'STRING');

/*Table structure for table `cond_vals` */

DROP TABLE IF EXISTS `cond_vals`;

CREATE TABLE `cond_vals` (
  `cond_vals_id` int(11) NOT NULL,
  `act_id` int(11) DEFAULT NULL,
  `val` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cond_vals_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cond_vals` */

/*Table structure for table `fld` */

DROP TABLE IF EXISTS `fld`;

CREATE TABLE `fld` (
  `fld_id` bigint(10) NOT NULL,
  `fld_name` varchar(100) DEFAULT NULL,
  `fld_title` varchar(100) DEFAULT NULL,
  `fld_help_txt` varchar(200) DEFAULT NULL,
  `fld_length` bigint(10) DEFAULT NULL,
  `is_visible` tinyint(1) DEFAULT NULL,
  `is_required` tinyint(1) DEFAULT NULL,
  `list_id` bigint(20) DEFAULT NULL,
  `fld_type_id` varchar(10) DEFAULT NULL,
  `is_common` tinyint(1) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  `tmpl_id` bigint(10) DEFAULT NULL,
  `default_value` varchar(100) DEFAULT NULL,
  `is_multiselect` tinyint(1) DEFAULT NULL,
  `created_by` bigint(10) DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `vrsn` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`fld_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `fld` */

insert  into `fld`(`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (11,'TextField','TextField','Sample Field',12,1,0,NULL,'1',1,1,1,'Default value',NULL,1,'2001-11-11 00:00:00','0.01'),(22,'CheckBox','CheckBox','Sample Field',NULL,1,0,NULL,'4',1,1,1,'1',NULL,1,'2001-11-11 00:00:00','0.01'),(55,'FIRST_NAME','First Name','First Name',40,1,1,NULL,'1',1,1,2,NULL,NULL,1,'2001-11-11 00:00:00','0.0.0.1'),(66,'LAST_NAME','Last Name','Last Name',40,1,1,NULL,'1',1,1,2,NULL,NULL,1,'2001-11-11 00:00:00','0.0.0.1'),(77,'DOB','Date of Birth','Date of Birth',40,1,0,NULL,'9',1,1,2,NULL,NULL,1,'2001-11-11 00:00:00','0.0.0.1'),(111,'USERNAME','Username','Username',20,1,0,NULL,'1',1,1,2,NULL,NULL,1,'2001-11-11 00:00:00','0.0.0.1'),(222,'PASSWORD','Password','Password',20,1,0,NULL,'7',1,1,2,NULL,NULL,1,'2001-11-11 00:00:00','0.0.0.1'),(333,'MyList','My List','My List',NULL,1,0,1,'2',1,1,2,NULL,0,1,'2001-11-11 00:00:00','0.0.0.1'),(444,'MyRichText','Rich Text Field','Rich Text Field',0,1,0,NULL,'8',1,1,2,'',NULL,1,'2001-11-11 00:00:00','0.0.0.1');

/*Table structure for table `fld_type` */

DROP TABLE IF EXISTS `fld_type`;

CREATE TABLE `fld_type` (
  `fld_type_id` bigint(10) NOT NULL,
  `fld_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`fld_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `fld_type` */

insert  into `fld_type`(`fld_type_id`,`fld_type`) values (1,'TXT'),(2,'LIST'),(3,'RADIO'),(4,'CHKBOX'),(5,'FILE'),(6,'LBL'),(7,'PSWD'),(8,'RICHTXT'),(9,'DT');

/*Table structure for table `list` */

DROP TABLE IF EXISTS `list`;

CREATE TABLE `list` (
  `list_id` bigint(20) NOT NULL,
  `list_name` varchar(500) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `vrsn` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `list` */

insert  into `list`(`list_id`,`list_name`,`description`,`vrsn`) values (1,'my_list','my list','0.0.0.1');

/*Table structure for table `list_val` */

DROP TABLE IF EXISTS `list_val`;

CREATE TABLE `list_val` (
  `list_val_id` bigint(20) NOT NULL,
  `list_id` bigint(20) DEFAULT NULL,
  `list_val` varchar(500) DEFAULT NULL,
  `vrsn` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`list_val_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `list_val` */

insert  into `list_val`(`list_val_id`,`list_id`,`list_val`,`vrsn`) values (9,1,'A',NULL),(10,1,'B',NULL),(11,1,'C',NULL);

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `userid` bigint(9) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`userid`,`username`,`password`) values (1,'irshad','irshad'),(2,'himanshu','himanshu'),(3,'dan','dan'),(4,'nouser','nouser');

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(100) DEFAULT NULL,
  `group_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `menu` */

insert  into `menu`(`menu_id`,`menu_name`,`group_id`) values (1,'Home','home'),(2,'Template','template'),(3,'Create Update Template','cutemplate');

/*Table structure for table `menu_itm` */

DROP TABLE IF EXISTS `menu_itm`;

CREATE TABLE `menu_itm` (
  `menu_item_id` int(11) NOT NULL,
  `mn_name` varchar(100) DEFAULT NULL,
  `js_mthd` varchar(100) DEFAULT NULL,
  `js` varchar(1000) DEFAULT NULL,
  `is_js_menu` tinyint(1) DEFAULT NULL,
  `help_txt` varchar(250) DEFAULT NULL,
  `is_visible` tinyint(4) DEFAULT NULL,
  `is_enabled` tinyint(4) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `parent_menu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`menu_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `menu_itm` */

insert  into `menu_itm`(`menu_item_id`,`mn_name`,`js_mthd`,`js`,`is_js_menu`,`help_txt`,`is_visible`,`is_enabled`,`menu_id`,`link`,`parent_menu_id`) values (1,'Home',NULL,NULL,NULL,'Home',1,1,1,'#',NULL),(2,'Create Template',NULL,NULL,NULL,'Create Template',1,1,1,'createUpdateTemplate.html',NULL),(3,'Save','onClick','submitForm()',1,'Save',1,1,2,'#',NULL),(4,'Save','onClick','submitTemplate()',1,'Save/Update Template',1,1,3,'#',NULL);

/*Table structure for table `racf` */

DROP TABLE IF EXISTS `racf`;

CREATE TABLE `racf` (
  `racf_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `racf_node` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`racf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `racf` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `roleid` bigint(9) NOT NULL,
  `role` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `roles` */

insert  into `roles`(`roleid`,`role`) values (1,'ROLE_ADMIN'),(2,'ROLE_SUPERVISOR'),(3,'ROLE_USER'),(4,'ROLE_ANONYMOUS');

/*Table structure for table `system_id` */

DROP TABLE IF EXISTS `system_id`;

CREATE TABLE `system_id` (
  `id` int(11) NOT NULL,
  `table_name` varchar(30) DEFAULT NULL,
  `st_val` int(11) DEFAULT NULL,
  `max_val` int(11) DEFAULT NULL,
  `safe_val` int(11) DEFAULT NULL,
  `next_val` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `system_id` */

insert  into `system_id`(`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (1,'tran_doc',1,2147483647,10,141),(2,'tran_fld',1,2147483647,10,151),(3,'tran_fld_list',1,2147483647,10,191),(4,'tran_rich_txt',1,2147483647,10,191);

/*Table structure for table `tmpl` */

DROP TABLE IF EXISTS `tmpl`;

CREATE TABLE `tmpl` (
  `tmpl_id` bigint(10) NOT NULL,
  `tmpl_name` varchar(50) DEFAULT NULL,
  `render_xml` varchar(10000) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `parent_id` bigint(10) DEFAULT NULL,
  `is_common` tinyint(1) DEFAULT NULL,
  `is_enable` tinyint(1) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` bigint(10) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `is_abstract` tinyint(1) DEFAULT NULL,
  `crt_doc_enabled` tinyint(1) DEFAULT NULL,
  `upld_doc_enabled` tinyint(1) DEFAULT NULL,
  `vrsn` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`tmpl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tmpl` */

insert  into `tmpl`(`tmpl_id`,`tmpl_name`,`render_xml`,`title`,`parent_id`,`is_common`,`is_enable`,`created_on`,`created_by`,`description`,`is_abstract`,`crt_doc_enabled`,`upld_doc_enabled`,`vrsn`) values (1,'Sample Template','Sample XML','Sample Template',NULL,0,1,'2011-11-08 23:31:01',1,'Sample Template',0,0,0,'0.01'),(2,'Simple Form','<sections>\n<section NAME=\"common_1\" title=\"General section\">\n<tr>\n <td colspan=\"1\" rowspan=\"1\">\n <FIELD NAME=\"USERNAME\"/>\n </td>\n <td colspan=\"1\" rowspan=\"1\">\n <FIELD NAME=\"FIRST_NAME\"/>\n </td>\n <td colspan=\"1\" rowspan=\"1\">\n <FIELD NAME=\"LAST_NAME\"/>\n </td>\n \n</tr>\n<tr>\n <td colspan=\"1\" rowspan=\"1\">\n <FIELD NAME=\"PASSWORD\"/>\n </td>\n  <td colspan=\"1\" rowspan=\"1\">\n <FIELD NAME=\"DOB\"/>\n </td>\n</tr>\n<tr>\n <td colspan=\"1\" rowspan=\"1\">\n <FIELD NAME=\"MyList\"/>\n </td>\n \n</tr>\n<tr>\n <td colspan=\"3\" rowspan=\"1\">\n <FIELD NAME=\"MyRichText\"/>\n </td>\n \n</tr>\n</section>\n</sections>','Login Form',NULL,0,1,'2012-02-04 22:07:24',1,'Login Form',0,0,0,'0.0.0.1');

/*Table structure for table `tran_doc` */

DROP TABLE IF EXISTS `tran_doc`;

CREATE TABLE `tran_doc` (
  `id` bigint(20) NOT NULL,
  `display_id` varchar(20) DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `crtd_on` timestamp NULL DEFAULT NULL,
  `crtd_by` bigint(20) DEFAULT NULL,
  `tmpl_id` bigint(20) DEFAULT NULL,
  `LST_UPDTED_ON` timestamp NULL DEFAULT NULL,
  `LST_UPDTED_BY` bigint(20) DEFAULT NULL,
  `vrsn` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tran_doc` */

insert  into `tran_doc`(`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (121,'XX88730',NULL,'2012-01-15 19:00:35',2,2,'2012-01-15 19:00:36',2,NULL),(122,'XX96914',NULL,'2012-01-12 00:50:45',2,2,'2012-01-12 00:50:46',2,NULL),(131,'XX17897',NULL,'2012-01-25 00:51:29',2,2,'2012-01-25 00:51:29',2,NULL);

/*Table structure for table `tran_fld` */

DROP TABLE IF EXISTS `tran_fld`;

CREATE TABLE `tran_fld` (
  `fld_id` bigint(20) DEFAULT NULL,
  `fld_value` varchar(500) DEFAULT NULL,
  `fld_type` varchar(10) DEFAULT NULL,
  `tmpl_fld_id` bigint(20) DEFAULT NULL,
  `last_updtd_by` bigint(20) DEFAULT NULL,
  `last_updtd_on` timestamp NULL DEFAULT NULL,
  `doc_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tran_fld` */

insert  into `tran_fld`(`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (121,NULL,'RICHTXT',444,2,'2012-01-12 00:50:46',122),(122,'zxczx','TXT',55,2,'2012-01-12 00:50:46',122),(123,'','TXT',77,2,'2012-01-12 00:50:46',122),(124,NULL,'LIST',333,2,'2012-01-12 00:50:46',122),(125,'zc','TXT',111,2,'2012-01-12 00:50:46',122),(126,'','TXT',222,2,'2012-01-12 00:50:46',122),(127,'zxcz','TXT',66,2,'2012-01-12 00:50:46',122),(131,NULL,'RICHTXT',444,2,'2012-01-15 19:00:36',121),(132,'asdasd','TXT',55,2,'2012-01-15 19:00:36',121),(133,'ssadas','TXT',77,2,'2012-01-15 19:00:36',121),(134,NULL,'LIST',333,2,'2012-01-15 19:00:36',121),(135,'asdasd','TXT',111,2,'2012-01-15 19:00:36',121),(136,'asdas','TXT',222,2,'2012-01-15 19:00:36',121),(137,'sadas','TXT',66,2,'2012-01-15 19:00:36',121),(141,NULL,'RICHTXT',444,2,'2012-01-25 00:51:29',131),(142,'fffffffffff','TXT',55,2,'2012-01-25 00:51:29',131),(143,'errrrrrrr','TXT',77,2,'2012-01-25 00:51:29',131),(144,NULL,'LIST',333,2,'2012-01-25 00:51:29',131),(145,'fffffff','TXT',111,2,'2012-01-25 00:51:29',131),(146,'reeeeeeeeeeee','TXT',222,2,'2012-01-25 00:51:29',131),(147,'errr','TXT',66,2,'2012-01-25 00:51:29',131);

/*Table structure for table `tran_fld_list` */

DROP TABLE IF EXISTS `tran_fld_list`;

CREATE TABLE `tran_fld_list` (
  `fld_list_id` bigint(20) NOT NULL,
  `fld_id` bigint(20) DEFAULT NULL,
  `list_value` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`fld_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tran_fld_list` */

insert  into `tran_fld_list`(`fld_list_id`,`fld_id`,`list_value`) values (161,124,'A'),(171,134,'A'),(181,144,'A');

/*Table structure for table `tran_rich_txt` */

DROP TABLE IF EXISTS `tran_rich_txt`;

CREATE TABLE `tran_rich_txt` (
  `rich_txt_id` int(10) NOT NULL,
  `fld_id` int(11) DEFAULT NULL,
  `rich_txt` longblob,
  `seq` int(11) DEFAULT NULL,
  PRIMARY KEY (`rich_txt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tran_rich_txt` */

insert  into `tran_rich_txt`(`rich_txt_id`,`fld_id`,`rich_txt`,`seq`) values (161,121,'xczxc',0),(171,131,'asdasdas',0),(181,141,'ergerggfdgdf',0);

/*Table structure for table `user_roles` */

DROP TABLE IF EXISTS `user_roles`;

CREATE TABLE `user_roles` (
  `roleid` bigint(9) DEFAULT NULL,
  `userid` bigint(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_roles` */

insert  into `user_roles`(`roleid`,`userid`) values (1,1),(2,2),(3,3),(4,4),(1,2);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userid` bigint(10) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `email_id` varchar(30) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `users` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
