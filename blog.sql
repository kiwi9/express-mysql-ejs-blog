/*
Navicat MySQL Data Transfer

Source Server         : dev
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2020-10-11 22:00:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `catename` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', '随笔');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `publish_time` int(11) NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '评论是否禁用',
  `post_id` int(8) NOT NULL,
  `user_id` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_post_id` (`post_id`),
  KEY `fk_user_id` (`user_id`),
  CONSTRAINT `fk_post_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('1', '评论测试', '1602383248', '0', '4', '1');

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `summary` varchar(255) NOT NULL,
  `publish_time` int(11) unsigned NOT NULL,
  `is_publish` tinyint(1) NOT NULL DEFAULT '0',
  `views` int(8) unsigned NOT NULL DEFAULT '0',
  `user_id` int(8) NOT NULL,
  `cate_id` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  KEY `cate_id_idx` (`cate_id`),
  CONSTRAINT `cate_id` FOREIGN KEY (`cate_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES ('4', '尴尬的诺贝尔化学奖！2020年的又颁发给了生物学家', '　腾讯科技讯，诺贝尔化学奖，经常被吐槽为诺贝尔理综奖，这是由于化学奖经常颁发给生物，甚至物理方面的研究工作。2020 年，也是这种情况，颁发给了两位生物学家。\n\n　　詹妮弗·杜德纳（Jennifer A . Doudna），1964 年出生于美国华盛顿特区，1989 年毕业于美国波士顿哈佛医学院。现任美国加州大学伯克利分校教授，霍华德·休斯医学研究所研究员。\n\n\n\n　　埃马纽埃尔·卡彭蒂耶(Emmanuelle Charpentier)，1968 年出生在法国朱维西。1995 年被授予法国巴黎巴斯德研究所博士。现任位于德国柏林的马克斯·普朗克病原体科学部门主任。\n\n　　埃马纽埃尔·卡彭蒂耶(Emmanuelle Charpentier)和詹妮弗·杜德纳（Jennifer a . Doudna）证明可以控制 CRISPR / Cas9 基因剪刀在 DNA 的任何预定位点进行切割\n\n　　当诺贝尔化学奖得主埃马纽埃尔·卡彭蒂耶(Emmanuelle Charpentier)和詹妮弗·杜德纳（Jennifer a . Doudna）研究链球菌的免疫系统时发现了一种分子工具，可以用来在遗传物质上进行精确切割，使改变生命密码成为可能。\n\n　　CRISPR/Cas9 基因剪刀已经彻底改变分子生命科学，为植物育种带来了新的机遇，为新的癌症疗法做出贡献，还有可能使人类治愈遗传疾病的梦想成为现实。\n\n　　2020 年诺贝尔化学奖得主埃马纽埃尔·卡彭蒂耶(Emmanuelle Charpentier)和詹妮弗·杜德纳（Jennifer a . Doudna）发现了基因技术中最强大的工具之一：CRISPR/Cas9 基因剪刀。利用这些技术和工具，研究人员可以极其精确地修改动物、植物和微生物的 DNA。\n\n　　埃马纽埃尔·卡彭蒂耶(Emmanuelle Charpentier)和詹妮弗·杜德纳（Jennifer a . Doudna）被授予 2020 年诺贝尔化学奖，表彰她们“开发出一种基因组编辑方法”。\n\n　　约翰·古迪纳夫（John B. Goodenough）于 2019 年获得诺贝尔化学奖时已经 97 岁高龄，这使得其成为迄今为止最年长的诺贝尔化学奖得主，也是最年长的诺贝尔奖得主。\n\n　　弗雷德里克·桑格（Frederick Sanger）曾在 1958 年和 1980 年两次获得诺贝尔化学奖。\n\n　　迄今为止有 5 名女性获得诺贝尔化学奖。其中 63 个诺贝尔化学奖当年的获奖者只有一位。\n\n　　1901 年至 2019 年间共颁发了 111 个诺贝尔化学奖。\n\n　　最年轻的诺贝尔化学奖得主是弗雷德里克·约里奥(Frederic Joliot)，他和妻子艾琳·约里奥-居里(Irene Joliot- curie)共同获奖时只有 35 岁。\n\n　　2020 年诺贝尔化学奖结果最早将于瑞典当地时间 10 月 7 日 11：45（北京时间 10 月 7 日下午5:45）公布，敬请期待！\n\n　　当玛丽·居里（Marie Curie）在 1911 年被授予诺贝尔化学奖时，她也成为第一个获得两次诺贝尔奖的人。居里夫人曾因在放射性方面的工作而获得 1903 年诺贝尔物理学奖。（皎晗）', '腾讯科技讯，诺贝尔化学奖，经常被吐槽为诺贝尔理综奖，这是由于化学奖经常颁发给生物，甚至物理方面的研究工作。2020 年，也是这种情况，颁发给了两位生物学家。', '1602383248', '0', '0', '1', '1');

-- ----------------------------
-- Table structure for posts_tags
-- ----------------------------
DROP TABLE IF EXISTS `posts_tags`;
CREATE TABLE `posts_tags` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `post_id` int(8) NOT NULL,
  `tag_id` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id_idx` (`post_id`),
  KEY `tag_id_idx` (`tag_id`),
  CONSTRAINT `post_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of posts_tags
-- ----------------------------
INSERT INTO `posts_tags` VALUES ('1', '4', '1');

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `tagname` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES ('1', '前端');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'tony', '2b8d44633a2b04a0eed4e64c3bb4265d', '1');
INSERT INTO `users` VALUES ('2', 'jay', '2b8d44633a2b04a0eed4e64c3bb4265d', '0');
