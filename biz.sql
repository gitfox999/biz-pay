/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306_x5
Source Server Version : 50067
Source Host           : localhost:3306
Source Database       : biz

Target Server Type    : MYSQL
Target Server Version : 50067
File Encoding         : 65001

Date: 2016-08-29 00:22:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `authorities`
-- ----------------------------
DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (
  `id` bigint(20) NOT NULL auto_increment,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `authority` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`),
  KEY `authorities_ibfk_1` (`role_id`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `users` (`id`),
  CONSTRAINT `authorities_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authorities
-- ----------------------------
INSERT INTO `authorities` VALUES ('30', '1', '1', 'admin', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for `config`
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `value` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', '单球赔率', '9.8');
INSERT INTO `config` VALUES ('2', '大小单双、大小单双（总和）、龙虎', '1.98');
INSERT INTO `config` VALUES ('3', '和', '8.88');
INSERT INTO `config` VALUES ('4', '豹子', '66');
INSERT INTO `config` VALUES ('5', '顺子', '12');
INSERT INTO `config` VALUES ('6', '对子', '2.8');
INSERT INTO `config` VALUES ('7', '半顺', '2.21');
INSERT INTO `config` VALUES ('8', '杂六', '2.21');
INSERT INTO `config` VALUES ('9', '收款银行', '建设银行');
INSERT INTO `config` VALUES ('10', '收款卡号', '62221022012037584');
INSERT INTO `config` VALUES ('11', '开户行', '北京路支行');
INSERT INTO `config` VALUES ('12', '开户名', '李卫华');
INSERT INTO `config` VALUES ('13', '收款支付宝', '1234567989');
INSERT INTO `config` VALUES ('14', '收款微信号', '1234223');
INSERT INTO `config` VALUES ('15', '通知', '4');
INSERT INTO `config` VALUES ('16', '客服QQ', '20129204');

-- ----------------------------
-- Table structure for `earn_rate`
-- ----------------------------
DROP TABLE IF EXISTS `earn_rate`;
CREATE TABLE `earn_rate` (
  `id` int(11) NOT NULL auto_increment,
  `efrom` double NOT NULL,
  `eend` double NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of earn_rate
-- ----------------------------
INSERT INTO `earn_rate` VALUES ('1', '10', '20', '1');
INSERT INTO `earn_rate` VALUES ('2', '5', '10', '2');
INSERT INTO `earn_rate` VALUES ('3', '0', '5', '3');
INSERT INTO `earn_rate` VALUES ('8', '20', '50', '4');
INSERT INTO `earn_rate` VALUES ('9', '50', '100', '5');
INSERT INTO `earn_rate` VALUES ('10', '-10', '0', '6');

-- ----------------------------
-- Table structure for `flow`
-- ----------------------------
DROP TABLE IF EXISTS `flow`;
CREATE TABLE `flow` (
  `id` int(11) NOT NULL auto_increment,
  `memid` int(11) NOT NULL,
  `type` int(11) default NULL COMMENT '0：充值，1：提现，2：下注，3：赢返',
  `money` int(11) default NULL,
  `tocard` varchar(30) default NULL,
  `fromcard` varchar(30) default NULL,
  `tobank` varchar(30) default NULL,
  `frombank` varchar(30) default NULL,
  `dirction` int(11) NOT NULL COMMENT '0：收，1：支',
  `ts` datetime NOT NULL,
  `remark` varchar(2000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=912 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow
-- ----------------------------
INSERT INTO `flow` VALUES ('1', '3', '3', null, null, null, null, null, '1', '2016-08-21 09:55:21', '期数：20160821094,开奖号码：17382');
INSERT INTO `flow` VALUES ('2', '3', '3', '31360', null, null, null, null, '1', '2016-08-21 10:00:05', '期数：20160821094,开奖号码：86245');
INSERT INTO `flow` VALUES ('3', '3', '3', '11760', null, null, null, null, '1', '2016-08-21 10:00:05', '期数：20160821094,开奖号码：86245');
INSERT INTO `flow` VALUES ('4', '3', '3', '4862', null, null, null, null, '1', '2016-08-21 10:52:04', '期数：20160821105,开奖号码：02738');
INSERT INTO `flow` VALUES ('5', '3', '3', '11760', null, null, null, null, '1', '2016-08-21 10:52:04', '期数：20160821105,开奖号码：02738');
INSERT INTO `flow` VALUES ('6', '3', '3', '980', null, null, null, null, '1', '2016-08-21 10:52:04', '期数：20160821105,开奖号码：02738');
INSERT INTO `flow` VALUES ('7', '3', '2', '1200', null, null, null, null, '0', '2016-08-21 13:00:39', '期数：20160821111,投注详情：第1位：第0球,投注额：1200');
INSERT INTO `flow` VALUES ('8', '3', '2', '300', null, null, null, null, '0', '2016-08-21 13:00:39', '期数：20160821111,投注详情：第1位：第1球,投注额：300');
INSERT INTO `flow` VALUES ('9', '3', '2', '4300', null, null, null, null, '0', '2016-08-21 13:00:39', '期数：20160821111,投注详情：第1位：第2球,投注额：4300');
INSERT INTO `flow` VALUES ('10', '3', '2', '200', null, null, null, null, '0', '2016-08-21 13:00:39', '期数：20160821111,投注详情：第1位：第3球,投注额：200');
INSERT INTO `flow` VALUES ('11', '3', '2', '600', null, null, null, null, '0', '2016-08-21 13:06:38', '期数：20160821114,投注详情：第1位：第5球,投注额：600');
INSERT INTO `flow` VALUES ('12', '3', '2', '700', null, null, null, null, '0', '2016-08-21 13:06:38', '期数：20160821114,投注详情：第1位：第6球,投注额：700');
INSERT INTO `flow` VALUES ('13', '3', '2', '800', null, null, null, null, '0', '2016-08-21 13:06:38', '期数：20160821114,投注详情：第1位：第7球,投注额：800');
INSERT INTO `flow` VALUES ('14', '3', '2', '900', null, null, null, null, '0', '2016-08-21 13:06:38', '期数：20160821114,投注详情：第1位：第8球,投注额：900');
INSERT INTO `flow` VALUES ('15', '3', '2', '100', null, null, null, null, '0', '2016-08-21 13:06:38', '期数：20160821114,投注详情：第1位：第0球,投注额：100');
INSERT INTO `flow` VALUES ('16', '3', '2', '200', null, null, null, null, '0', '2016-08-21 13:06:38', '期数：20160821114,投注详情：第1位：第1球,投注额：200');
INSERT INTO `flow` VALUES ('17', '3', '2', '300', null, null, null, null, '0', '2016-08-21 13:06:38', '期数：20160821114,投注详情：第1位：第2球,投注额：300');
INSERT INTO `flow` VALUES ('18', '3', '2', '400', null, null, null, null, '0', '2016-08-21 13:06:38', '期数：20160821114,投注详情：第1位：第3球,投注额：400');
INSERT INTO `flow` VALUES ('19', '3', '2', '500', null, null, null, null, '0', '2016-08-21 13:06:38', '期数：20160821114,投注详情：第1位：第4球,投注额：500');
INSERT INTO `flow` VALUES ('20', '3', '2', '1100', null, null, null, null, '0', '2016-08-21 13:06:38', '期数：20160821114,投注详情：第1位：第9球,投注额：1100');
INSERT INTO `flow` VALUES ('21', '3', '2', '600', null, null, null, null, '0', '2016-08-21 17:21:48', '期数：20160821120,投注详情：第1位：第5球,投注额：600');
INSERT INTO `flow` VALUES ('22', '3', '2', '700', null, null, null, null, '0', '2016-08-21 17:21:48', '期数：20160821120,投注详情：第1位：第6球,投注额：700');
INSERT INTO `flow` VALUES ('23', '3', '2', '800', null, null, null, null, '0', '2016-08-21 17:21:48', '期数：20160821120,投注详情：第1位：第7球,投注额：800');
INSERT INTO `flow` VALUES ('24', '3', '2', '900', null, null, null, null, '0', '2016-08-21 17:21:48', '期数：20160821120,投注详情：第1位：第8球,投注额：900');
INSERT INTO `flow` VALUES ('25', '3', '2', '100', null, null, null, null, '0', '2016-08-21 17:21:48', '期数：20160821120,投注详情：第1位：第0球,投注额：100');
INSERT INTO `flow` VALUES ('26', '3', '2', '200', null, null, null, null, '0', '2016-08-21 17:21:48', '期数：20160821120,投注详情：第1位：第1球,投注额：200');
INSERT INTO `flow` VALUES ('27', '3', '2', '300', null, null, null, null, '0', '2016-08-21 17:21:48', '期数：20160821120,投注详情：第1位：第2球,投注额：300');
INSERT INTO `flow` VALUES ('28', '3', '2', '400', null, null, null, null, '0', '2016-08-21 17:21:48', '期数：20160821120,投注详情：第1位：第3球,投注额：400');
INSERT INTO `flow` VALUES ('29', '3', '2', '500', null, null, null, null, '0', '2016-08-21 17:21:48', '期数：20160821120,投注详情：第1位：第4球,投注额：500');
INSERT INTO `flow` VALUES ('30', '3', '2', '1100', null, null, null, null, '0', '2016-08-21 17:21:48', '期数：20160821120,投注详情：第1位：第9球,投注额：1100');
INSERT INTO `flow` VALUES ('31', '3', '3', '4900', null, null, null, null, '1', '2016-08-21 17:25:03', '期数：20160821120,开奖号码：45299,投注详情：第1位：第4球,投注额：49');
INSERT INTO `flow` VALUES ('32', '3', '2', '700', null, null, null, null, '0', '2016-08-21 17:27:39', '期数：20160821121,投注详情：和,投注额：700');
INSERT INTO `flow` VALUES ('33', '3', '2', '600', null, null, null, null, '0', '2016-08-21 17:27:39', '期数：20160821121,投注详情：虎,投注额：600');
INSERT INTO `flow` VALUES ('34', '3', '2', '500', null, null, null, null, '0', '2016-08-21 17:27:39', '期数：20160821121,投注详情：龙,投注额：500');
INSERT INTO `flow` VALUES ('35', '3', '2', '400', null, null, null, null, '0', '2016-08-21 17:27:39', '期数：20160821121,投注详情：总和双,投注额：400');
INSERT INTO `flow` VALUES ('36', '3', '2', '300', null, null, null, null, '0', '2016-08-21 17:27:39', '期数：20160821121,投注详情：总和单,投注额：300');
INSERT INTO `flow` VALUES ('37', '3', '2', '200', null, null, null, null, '0', '2016-08-21 17:27:39', '期数：20160821121,投注详情：总和小,投注额：200');
INSERT INTO `flow` VALUES ('38', '3', '2', '100', null, null, null, null, '0', '2016-08-21 17:27:39', '期数：20160821121,投注详情：总和大,投注额：100');
INSERT INTO `flow` VALUES ('39', '3', '2', '1400', null, null, null, null, '0', '2016-08-21 17:30:39', '期数：20160821121,投注详情：前三位：半顺,投注额：1400');
INSERT INTO `flow` VALUES ('40', '3', '2', '1500', null, null, null, null, '0', '2016-08-21 17:30:39', '期数：20160821121,投注详情：前三位：杂六,投注额：1500');
INSERT INTO `flow` VALUES ('41', '3', '2', '1100', null, null, null, null, '0', '2016-08-21 17:30:39', '期数：20160821121,投注详情：前三位：豹子,投注额：1100');
INSERT INTO `flow` VALUES ('42', '3', '2', '1200', null, null, null, null, '0', '2016-08-21 17:30:39', '期数：20160821121,投注详情：前三位：顺子,投注额：1200');
INSERT INTO `flow` VALUES ('43', '3', '2', '1300', null, null, null, null, '0', '2016-08-21 17:30:39', '期数：20160821121,投注详情：前三位：对子,投注额：1300');
INSERT INTO `flow` VALUES ('44', '3', '3', '0', null, null, null, null, '1', '2016-08-21 17:35:03', '期数：20160821121,开奖号码：91699,投注详情：和,投注额：0');
INSERT INTO `flow` VALUES ('45', '3', '3', '788', null, null, null, null, '1', '2016-08-21 17:35:03', '期数：20160821121,开奖号码：91699,投注详情：总和双,投注额：7');
INSERT INTO `flow` VALUES ('46', '3', '3', '198', null, null, null, null, '1', '2016-08-21 17:35:03', '期数：20160821121,开奖号码：91699,投注详情：总和大,投注额：1');
INSERT INTO `flow` VALUES ('47', '3', '3', '3315', null, null, null, null, '1', '2016-08-21 17:35:03', '期数：20160821121,开奖号码：91699,投注详情：前三位：杂六,投注额：33');
INSERT INTO `flow` VALUES ('48', '3', '2', '1100', null, null, null, null, '0', '2016-08-25 23:14:02', '期数：20160825015,投注详情：第1位：第5球,投注额：11');
INSERT INTO `flow` VALUES ('49', '3', '2', '900', null, null, null, null, '0', '2016-08-25 23:14:02', '期数：20160825015,投注详情：第1位：第6球,投注额：9');
INSERT INTO `flow` VALUES ('50', '3', '2', '800', null, null, null, null, '0', '2016-08-25 23:14:02', '期数：20160825015,投注详情：第1位：第7球,投注额：8');
INSERT INTO `flow` VALUES ('51', '3', '2', '700', null, null, null, null, '0', '2016-08-25 23:14:02', '期数：20160825015,投注详情：第1位：第8球,投注额：7');
INSERT INTO `flow` VALUES ('52', '3', '2', '100', null, null, null, null, '0', '2016-08-25 23:14:02', '期数：20160825015,投注详情：第1位：第0球,投注额：1');
INSERT INTO `flow` VALUES ('53', '3', '2', '200', null, null, null, null, '0', '2016-08-25 23:14:02', '期数：20160825015,投注详情：第1位：第1球,投注额：2');
INSERT INTO `flow` VALUES ('54', '3', '2', '300', null, null, null, null, '0', '2016-08-25 23:14:02', '期数：20160825015,投注详情：第1位：第2球,投注额：3');
INSERT INTO `flow` VALUES ('55', '3', '2', '400', null, null, null, null, '0', '2016-08-25 23:14:02', '期数：20160825015,投注详情：第1位：第3球,投注额：4');
INSERT INTO `flow` VALUES ('56', '3', '2', '500', null, null, null, null, '0', '2016-08-25 23:14:02', '期数：20160825015,投注详情：第1位：第4球,投注额：5');
INSERT INTO `flow` VALUES ('57', '3', '2', '600', null, null, null, null, '0', '2016-08-25 23:14:02', '期数：20160825015,投注详情：第1位：第9球,投注额：6');
INSERT INTO `flow` VALUES ('58', '3', '3', '4900', null, null, null, null, '1', '2016-08-25 23:15:04', '期数：20160825015,开奖号码：46825,投注详情：第1位：第4球,投注额：49.0');
INSERT INTO `flow` VALUES ('59', '3', '2', '1200', null, null, null, null, '0', '2016-08-26 01:56:03', '期数：20160826013,投注详情：第1位：第5球,投注额：12');
INSERT INTO `flow` VALUES ('60', '3', '2', '2200', null, null, null, null, '0', '2016-08-26 01:56:03', '期数：20160826013,投注详情：前三位：半顺,投注额：22');
INSERT INTO `flow` VALUES ('61', '3', '2', '2300', null, null, null, null, '0', '2016-08-26 01:56:03', '期数：20160826013,投注详情：前三位：杂六,投注额：23');
INSERT INTO `flow` VALUES ('62', '3', '2', '1200', null, null, null, null, '0', '2016-08-26 01:56:03', '期数：20160826013,投注详情：第1位：第6球,投注额：12');
INSERT INTO `flow` VALUES ('63', '3', '2', '2100', null, null, null, null, '0', '2016-08-26 01:56:03', '期数：20160826013,投注详情：第1位：第7球,投注额：21');
INSERT INTO `flow` VALUES ('64', '3', '2', '2300', null, null, null, null, '0', '2016-08-26 01:56:03', '期数：20160826013,投注详情：第1位：第8球,投注额：23');
INSERT INTO `flow` VALUES ('65', '3', '2', '1200', null, null, null, null, '0', '2016-08-26 01:56:03', '期数：20160826013,投注详情：前三位：豹子,投注额：12');
INSERT INTO `flow` VALUES ('66', '3', '2', '1200', null, null, null, null, '0', '2016-08-26 01:56:03', '期数：20160826013,投注详情：前三位：顺子,投注额：12');
INSERT INTO `flow` VALUES ('67', '3', '2', '1200', null, null, null, null, '0', '2016-08-26 01:56:03', '期数：20160826013,投注详情：前三位：对子,投注额：12');
INSERT INTO `flow` VALUES ('68', '3', '2', '12300', null, null, null, null, '0', '2016-08-26 01:56:03', '期数：20160826013,投注详情：第1位：第0球,投注额：123');
INSERT INTO `flow` VALUES ('69', '3', '2', '1200', null, null, null, null, '0', '2016-08-26 01:56:03', '期数：20160826013,投注详情：第1位：第1球,投注额：12');
INSERT INTO `flow` VALUES ('70', '3', '2', '1200', null, null, null, null, '0', '2016-08-26 01:56:03', '期数：20160826013,投注详情：第1位：第2球,投注额：12');
INSERT INTO `flow` VALUES ('71', '3', '2', '2300', null, null, null, null, '0', '2016-08-26 01:56:03', '期数：20160826013,投注详情：第1位：第3球,投注额：23');
INSERT INTO `flow` VALUES ('72', '3', '2', '3200', null, null, null, null, '0', '2016-08-26 01:56:03', '期数：20160826013,投注详情：第1位：第4球,投注额：32');
INSERT INTO `flow` VALUES ('73', '3', '2', '3400', null, null, null, null, '0', '2016-08-26 01:56:03', '期数：20160826013,投注详情：第1位：小,投注额：34');
INSERT INTO `flow` VALUES ('74', '3', '2', '3200', null, null, null, null, '0', '2016-08-26 01:56:03', '期数：20160826013,投注详情：第1位：大,投注额：32');
INSERT INTO `flow` VALUES ('75', '3', '2', '1200', null, null, null, null, '0', '2016-08-26 01:56:03', '期数：20160826013,投注详情：和,投注额：12');
INSERT INTO `flow` VALUES ('76', '3', '2', '100', null, null, null, null, '0', '2016-08-26 01:56:03', '期数：20160826013,投注详情：第1位：第9球,投注额：1');
INSERT INTO `flow` VALUES ('77', '3', '2', '200', null, null, null, null, '0', '2016-08-26 01:56:03', '期数：20160826013,投注详情：虎,投注额：2');
INSERT INTO `flow` VALUES ('78', '3', '2', '400', null, null, null, null, '0', '2016-08-26 01:56:03', '期数：20160826013,投注详情：龙,投注额：4');
INSERT INTO `flow` VALUES ('79', '3', '2', '400', null, null, null, null, '0', '2016-08-26 01:56:03', '期数：20160826013,投注详情：总和双,投注额：4');
INSERT INTO `flow` VALUES ('80', '3', '2', '1200', null, null, null, null, '0', '2016-08-26 01:56:03', '期数：20160826013,投注详情：总和单,投注额：12');
INSERT INTO `flow` VALUES ('81', '3', '2', '300', null, null, null, null, '0', '2016-08-26 01:56:03', '期数：20160826013,投注详情：总和小,投注额：3');
INSERT INTO `flow` VALUES ('82', '3', '2', '200', null, null, null, null, '0', '2016-08-26 01:56:03', '期数：20160826013,投注详情：总和大,投注额：2');
INSERT INTO `flow` VALUES ('83', '3', '2', '3200', null, null, null, null, '0', '2016-08-26 01:56:03', '期数：20160826013,投注详情：第1位：单,投注额：32');
INSERT INTO `flow` VALUES ('84', '3', '2', '2300', null, null, null, null, '0', '2016-08-26 01:56:03', '期数：20160826013,投注详情：第1位：双,投注额：23');
INSERT INTO `flow` VALUES ('85', '3', '2', '400', null, null, null, null, '0', '2016-08-26 01:56:34', '期数：20160826013,投注详情：第1位：第5球,投注额：4');
INSERT INTO `flow` VALUES ('86', '3', '2', '200', null, null, null, null, '0', '2016-08-26 01:56:34', '期数：20160826013,投注详情：前三位：半顺,投注额：2');
INSERT INTO `flow` VALUES ('87', '3', '2', '2300', null, null, null, null, '0', '2016-08-26 01:56:34', '期数：20160826013,投注详情：前三位：杂六,投注额：23');
INSERT INTO `flow` VALUES ('88', '3', '2', '400', null, null, null, null, '0', '2016-08-26 01:56:34', '期数：20160826013,投注详情：第1位：第6球,投注额：4');
INSERT INTO `flow` VALUES ('89', '3', '2', '300', null, null, null, null, '0', '2016-08-26 01:56:34', '期数：20160826013,投注详情：第1位：第7球,投注额：3');
INSERT INTO `flow` VALUES ('90', '3', '2', '200', null, null, null, null, '0', '2016-08-26 01:56:34', '期数：20160826013,投注详情：第1位：第8球,投注额：2');
INSERT INTO `flow` VALUES ('91', '3', '2', '4300', null, null, null, null, '0', '2016-08-26 01:56:34', '期数：20160826013,投注详情：前三位：豹子,投注额：43');
INSERT INTO `flow` VALUES ('92', '3', '2', '400', null, null, null, null, '0', '2016-08-26 01:56:34', '期数：20160826013,投注详情：前三位：顺子,投注额：4');
INSERT INTO `flow` VALUES ('93', '3', '2', '2100', null, null, null, null, '0', '2016-08-26 01:56:34', '期数：20160826013,投注详情：前三位：对子,投注额：21');
INSERT INTO `flow` VALUES ('94', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:56:34', '期数：20160826013,投注详情：第1位：第0球,投注额：5');
INSERT INTO `flow` VALUES ('95', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:56:34', '期数：20160826013,投注详情：第1位：第1球,投注额：5');
INSERT INTO `flow` VALUES ('96', '3', '2', '200', null, null, null, null, '0', '2016-08-26 01:56:34', '期数：20160826013,投注详情：第1位：第2球,投注额：2');
INSERT INTO `flow` VALUES ('97', '3', '2', '300', null, null, null, null, '0', '2016-08-26 01:56:34', '期数：20160826013,投注详情：第1位：第3球,投注额：3');
INSERT INTO `flow` VALUES ('98', '3', '2', '300', null, null, null, null, '0', '2016-08-26 01:56:34', '期数：20160826013,投注详情：第1位：第4球,投注额：3');
INSERT INTO `flow` VALUES ('99', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:56:34', '期数：20160826013,投注详情：第1位：小,投注额：6');
INSERT INTO `flow` VALUES ('100', '3', '2', '4300', null, null, null, null, '0', '2016-08-26 01:56:34', '期数：20160826013,投注详情：第1位：大,投注额：43');
INSERT INTO `flow` VALUES ('101', '3', '2', '1200', null, null, null, null, '0', '2016-08-26 01:56:34', '期数：20160826013,投注详情：和,投注额：12');
INSERT INTO `flow` VALUES ('102', '3', '2', '200', null, null, null, null, '0', '2016-08-26 01:56:34', '期数：20160826013,投注详情：第1位：第9球,投注额：2');
INSERT INTO `flow` VALUES ('103', '3', '2', '200', null, null, null, null, '0', '2016-08-26 01:56:34', '期数：20160826013,投注详情：虎,投注额：2');
INSERT INTO `flow` VALUES ('104', '3', '2', '2300', null, null, null, null, '0', '2016-08-26 01:56:34', '期数：20160826013,投注详情：龙,投注额：23');
INSERT INTO `flow` VALUES ('105', '3', '2', '2300', null, null, null, null, '0', '2016-08-26 01:56:34', '期数：20160826013,投注详情：总和双,投注额：23');
INSERT INTO `flow` VALUES ('106', '3', '2', '200', null, null, null, null, '0', '2016-08-26 01:56:34', '期数：20160826013,投注详情：总和单,投注额：2');
INSERT INTO `flow` VALUES ('107', '3', '2', '1200', null, null, null, null, '0', '2016-08-26 01:56:34', '期数：20160826013,投注详情：总和小,投注额：12');
INSERT INTO `flow` VALUES ('108', '3', '2', '3200', null, null, null, null, '0', '2016-08-26 01:56:34', '期数：20160826013,投注详情：总和大,投注额：32');
INSERT INTO `flow` VALUES ('109', '3', '2', '400', null, null, null, null, '0', '2016-08-26 01:56:34', '期数：20160826013,投注详情：第1位：单,投注额：4');
INSERT INTO `flow` VALUES ('110', '3', '2', '200', null, null, null, null, '0', '2016-08-26 01:56:34', '期数：20160826013,投注详情：第1位：双,投注额：2');
INSERT INTO `flow` VALUES ('111', '3', '2', '300', null, null, null, null, '0', '2016-08-26 01:56:52', '期数：20160826013,投注详情：第2位：第0球,投注额：3');
INSERT INTO `flow` VALUES ('112', '3', '2', '200', null, null, null, null, '0', '2016-08-26 01:56:52', '期数：20160826013,投注详情：第2位：第1球,投注额：2');
INSERT INTO `flow` VALUES ('113', '3', '2', '100', null, null, null, null, '0', '2016-08-26 01:56:52', '期数：20160826013,投注详情：第2位：第2球,投注额：1');
INSERT INTO `flow` VALUES ('114', '3', '2', '200', null, null, null, null, '0', '2016-08-26 01:56:52', '期数：20160826013,投注详情：第2位：第3球,投注额：2');
INSERT INTO `flow` VALUES ('115', '3', '2', '400', null, null, null, null, '0', '2016-08-26 01:56:52', '期数：20160826013,投注详情：第2位：第8球,投注额：4');
INSERT INTO `flow` VALUES ('116', '3', '2', '300', null, null, null, null, '0', '2016-08-26 01:56:52', '期数：20160826013,投注详情：第2位：第4球,投注额：3');
INSERT INTO `flow` VALUES ('117', '3', '2', '200', null, null, null, null, '0', '2016-08-26 01:56:52', '期数：20160826013,投注详情：第2位：第5球,投注额：2');
INSERT INTO `flow` VALUES ('118', '3', '2', '400', null, null, null, null, '0', '2016-08-26 01:56:52', '期数：20160826013,投注详情：第2位：第6球,投注额：4');
INSERT INTO `flow` VALUES ('119', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:56:52', '期数：20160826013,投注详情：第2位：第7球,投注额：7');
INSERT INTO `flow` VALUES ('120', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:56:52', '期数：20160826013,投注详情：第2位：单,投注额：6');
INSERT INTO `flow` VALUES ('121', '3', '2', '400', null, null, null, null, '0', '2016-08-26 01:56:52', '期数：20160826013,投注详情：第2位：小,投注额：4');
INSERT INTO `flow` VALUES ('122', '3', '2', '300', null, null, null, null, '0', '2016-08-26 01:56:52', '期数：20160826013,投注详情：第2位：大,投注额：3');
INSERT INTO `flow` VALUES ('123', '3', '2', '400', null, null, null, null, '0', '2016-08-26 01:56:52', '期数：20160826013,投注详情：第2位：第9球,投注额：4');
INSERT INTO `flow` VALUES ('124', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:56:52', '期数：20160826013,投注详情：第2位：双,投注额：5');
INSERT INTO `flow` VALUES ('125', '3', '2', '3400', null, null, null, null, '0', '2016-08-26 01:57:11', '期数：20160826013,投注详情：第2位：第0球,投注额：34');
INSERT INTO `flow` VALUES ('126', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:57:11', '期数：20160826013,投注详情：第2位：第1球,投注额：5');
INSERT INTO `flow` VALUES ('127', '3', '2', '400', null, null, null, null, '0', '2016-08-26 01:57:11', '期数：20160826013,投注详情：第2位：第2球,投注额：4');
INSERT INTO `flow` VALUES ('128', '3', '2', '300', null, null, null, null, '0', '2016-08-26 01:57:11', '期数：20160826013,投注详情：第2位：第3球,投注额：3');
INSERT INTO `flow` VALUES ('129', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:57:11', '期数：20160826013,投注详情：第2位：第8球,投注额：5');
INSERT INTO `flow` VALUES ('130', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:57:11', '期数：20160826013,投注详情：第2位：第4球,投注额：5');
INSERT INTO `flow` VALUES ('131', '3', '2', '400', null, null, null, null, '0', '2016-08-26 01:57:11', '期数：20160826013,投注详情：第2位：第5球,投注额：4');
INSERT INTO `flow` VALUES ('132', '3', '2', '100', null, null, null, null, '0', '2016-08-26 01:57:11', '期数：20160826013,投注详情：第2位：第6球,投注额：1');
INSERT INTO `flow` VALUES ('133', '3', '2', '200', null, null, null, null, '0', '2016-08-26 01:57:11', '期数：20160826013,投注详情：第2位：第7球,投注额：2');
INSERT INTO `flow` VALUES ('134', '3', '2', '300', null, null, null, null, '0', '2016-08-26 01:57:11', '期数：20160826013,投注详情：第2位：单,投注额：3');
INSERT INTO `flow` VALUES ('135', '3', '2', '200', null, null, null, null, '0', '2016-08-26 01:57:11', '期数：20160826013,投注详情：第2位：小,投注额：2');
INSERT INTO `flow` VALUES ('136', '3', '2', '300', null, null, null, null, '0', '2016-08-26 01:57:11', '期数：20160826013,投注详情：第2位：大,投注额：3');
INSERT INTO `flow` VALUES ('137', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:57:11', '期数：20160826013,投注详情：第2位：第9球,投注额：6');
INSERT INTO `flow` VALUES ('138', '3', '2', '400', null, null, null, null, '0', '2016-08-26 01:57:11', '期数：20160826013,投注详情：第2位：双,投注额：4');
INSERT INTO `flow` VALUES ('139', '3', '2', '300', null, null, null, null, '0', '2016-08-26 01:57:32', '期数：20160826013,投注详情：前三位：半顺,投注额：3');
INSERT INTO `flow` VALUES ('140', '3', '2', '100', null, null, null, null, '0', '2016-08-26 01:57:32', '期数：20160826013,投注详情：第2位：第1球,投注额：1');
INSERT INTO `flow` VALUES ('141', '3', '2', '200', null, null, null, null, '0', '2016-08-26 01:57:32', '期数：20160826013,投注详情：第2位：第2球,投注额：2');
INSERT INTO `flow` VALUES ('142', '3', '2', '400', null, null, null, null, '0', '2016-08-26 01:57:32', '期数：20160826013,投注详情：第2位：第3球,投注额：4');
INSERT INTO `flow` VALUES ('143', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:57:32', '期数：20160826013,投注详情：前三位：豹子,投注额：7');
INSERT INTO `flow` VALUES ('144', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:57:32', '期数：20160826013,投注详情：前三位：顺子,投注额：5');
INSERT INTO `flow` VALUES ('145', '3', '2', '400', null, null, null, null, '0', '2016-08-26 01:57:32', '期数：20160826013,投注详情：前三位：对子,投注额：4');
INSERT INTO `flow` VALUES ('146', '3', '2', '300', null, null, null, null, '0', '2016-08-26 01:57:32', '期数：20160826013,投注详情：第2位：第8球,投注额：3');
INSERT INTO `flow` VALUES ('147', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:57:32', '期数：20160826013,投注详情：第2位：第4球,投注额：5');
INSERT INTO `flow` VALUES ('148', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:57:32', '期数：20160826013,投注详情：第2位：第5球,投注额：6');
INSERT INTO `flow` VALUES ('149', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:57:32', '期数：20160826013,投注详情：第2位：第6球,投注额：7');
INSERT INTO `flow` VALUES ('150', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:57:32', '期数：20160826013,投注详情：第2位：第7球,投注额：5');
INSERT INTO `flow` VALUES ('151', '3', '2', '300', null, null, null, null, '0', '2016-08-26 01:57:32', '期数：20160826013,投注详情：第2位：单,投注额：3');
INSERT INTO `flow` VALUES ('152', '3', '2', '400', null, null, null, null, '0', '2016-08-26 01:57:32', '期数：20160826013,投注详情：第2位：小,投注额：4');
INSERT INTO `flow` VALUES ('153', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:57:32', '期数：20160826013,投注详情：第2位：大,投注额：6');
INSERT INTO `flow` VALUES ('154', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:57:32', '期数：20160826013,投注详情：第2位：第9球,投注额：5');
INSERT INTO `flow` VALUES ('155', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:57:32', '期数：20160826013,投注详情：虎,投注额：5');
INSERT INTO `flow` VALUES ('156', '3', '2', '300', null, null, null, null, '0', '2016-08-26 01:57:32', '期数：20160826013,投注详情：龙,投注额：3');
INSERT INTO `flow` VALUES ('157', '3', '2', '400', null, null, null, null, '0', '2016-08-26 01:57:32', '期数：20160826013,投注详情：总和双,投注额：4');
INSERT INTO `flow` VALUES ('158', '3', '2', '6500', null, null, null, null, '0', '2016-08-26 01:57:32', '期数：20160826013,投注详情：总和单,投注额：65');
INSERT INTO `flow` VALUES ('159', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:57:32', '期数：20160826013,投注详情：总和小,投注额：7');
INSERT INTO `flow` VALUES ('160', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:57:32', '期数：20160826013,投注详情：总和大,投注额：6');
INSERT INTO `flow` VALUES ('161', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:57:32', '期数：20160826013,投注详情：第2位：双,投注额：5');
INSERT INTO `flow` VALUES ('162', '3', '2', '300', null, null, null, null, '0', '2016-08-26 01:57:52', '期数：20160826013,投注详情：前三位：半顺,投注额：3');
INSERT INTO `flow` VALUES ('163', '3', '2', '100', null, null, null, null, '0', '2016-08-26 01:57:52', '期数：20160826013,投注详情：前三位：杂六,投注额：1');
INSERT INTO `flow` VALUES ('164', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:57:52', '期数：20160826013,投注详情：第2位：第1球,投注额：6');
INSERT INTO `flow` VALUES ('165', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:57:52', '期数：20160826013,投注详情：第2位：第2球,投注额：7');
INSERT INTO `flow` VALUES ('166', '3', '2', '800', null, null, null, null, '0', '2016-08-26 01:57:52', '期数：20160826013,投注详情：第2位：第3球,投注额：8');
INSERT INTO `flow` VALUES ('167', '3', '2', '7800', null, null, null, null, '0', '2016-08-26 01:57:52', '期数：20160826013,投注详情：前三位：豹子,投注额：78');
INSERT INTO `flow` VALUES ('168', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:57:52', '期数：20160826013,投注详情：前三位：顺子,投注额：6');
INSERT INTO `flow` VALUES ('169', '3', '2', '4500', null, null, null, null, '0', '2016-08-26 01:57:52', '期数：20160826013,投注详情：前三位：对子,投注额：45');
INSERT INTO `flow` VALUES ('170', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:57:52', '期数：20160826013,投注详情：第2位：第8球,投注额：7');
INSERT INTO `flow` VALUES ('171', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:57:52', '期数：20160826013,投注详情：第2位：第4球,投注额：6');
INSERT INTO `flow` VALUES ('172', '3', '2', '400', null, null, null, null, '0', '2016-08-26 01:57:52', '期数：20160826013,投注详情：第2位：第5球,投注额：4');
INSERT INTO `flow` VALUES ('173', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:57:52', '期数：20160826013,投注详情：第2位：第6球,投注额：5');
INSERT INTO `flow` VALUES ('174', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:57:52', '期数：20160826013,投注详情：第2位：第7球,投注额：7');
INSERT INTO `flow` VALUES ('175', '3', '2', '300', null, null, null, null, '0', '2016-08-26 01:57:52', '期数：20160826013,投注详情：第2位：单,投注额：3');
INSERT INTO `flow` VALUES ('176', '3', '2', '5400', null, null, null, null, '0', '2016-08-26 01:57:52', '期数：20160826013,投注详情：第2位：小,投注额：54');
INSERT INTO `flow` VALUES ('177', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:57:52', '期数：20160826013,投注详情：第2位：大,投注额：6');
INSERT INTO `flow` VALUES ('178', '3', '2', '800', null, null, null, null, '0', '2016-08-26 01:57:52', '期数：20160826013,投注详情：第2位：第9球,投注额：8');
INSERT INTO `flow` VALUES ('179', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:57:52', '期数：20160826013,投注详情：和,投注额：7');
INSERT INTO `flow` VALUES ('180', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:57:52', '期数：20160826013,投注详情：虎,投注额：6');
INSERT INTO `flow` VALUES ('181', '3', '2', '400', null, null, null, null, '0', '2016-08-26 01:57:52', '期数：20160826013,投注详情：龙,投注额：4');
INSERT INTO `flow` VALUES ('182', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:57:52', '期数：20160826013,投注详情：总和双,投注额：5');
INSERT INTO `flow` VALUES ('183', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:57:52', '期数：20160826013,投注详情：总和单,投注额：7');
INSERT INTO `flow` VALUES ('184', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:57:52', '期数：20160826013,投注详情：总和小,投注额：6');
INSERT INTO `flow` VALUES ('185', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:57:52', '期数：20160826013,投注详情：总和大,投注额：5');
INSERT INTO `flow` VALUES ('186', '3', '2', '400', null, null, null, null, '0', '2016-08-26 01:57:52', '期数：20160826013,投注详情：第2位：双,投注额：4');
INSERT INTO `flow` VALUES ('187', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:58:12', '期数：20160826013,投注详情：前三位：半顺,投注额：7');
INSERT INTO `flow` VALUES ('188', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:58:12', '期数：20160826013,投注详情：前三位：杂六,投注额：5');
INSERT INTO `flow` VALUES ('189', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:58:12', '期数：20160826013,投注详情：第3位：第2球,投注额：7');
INSERT INTO `flow` VALUES ('190', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:58:12', '期数：20160826013,投注详情：前三位：豹子,投注额：7');
INSERT INTO `flow` VALUES ('191', '3', '2', '7800', null, null, null, null, '0', '2016-08-26 01:58:12', '期数：20160826013,投注详情：第3位：第1球,投注额：78');
INSERT INTO `flow` VALUES ('192', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:58:12', '期数：20160826013,投注详情：前三位：顺子,投注额：5');
INSERT INTO `flow` VALUES ('193', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:58:12', '期数：20160826013,投注详情：第3位：第0球,投注额：6');
INSERT INTO `flow` VALUES ('194', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:58:12', '期数：20160826013,投注详情：前三位：对子,投注额：6');
INSERT INTO `flow` VALUES ('195', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:58:12', '期数：20160826013,投注详情：第3位：第6球,投注额：6');
INSERT INTO `flow` VALUES ('196', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:58:12', '期数：20160826013,投注详情：第3位：第5球,投注额：5');
INSERT INTO `flow` VALUES ('197', '3', '2', '5400', null, null, null, null, '0', '2016-08-26 01:58:12', '期数：20160826013,投注详情：第3位：第4球,投注额：54');
INSERT INTO `flow` VALUES ('198', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:58:12', '期数：20160826013,投注详情：第3位：第3球,投注额：6');
INSERT INTO `flow` VALUES ('199', '3', '2', '400', null, null, null, null, '0', '2016-08-26 01:58:12', '期数：20160826013,投注详情：第3位：第8球,投注额：4');
INSERT INTO `flow` VALUES ('200', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:58:12', '期数：20160826013,投注详情：第3位：第7球,投注额：5');
INSERT INTO `flow` VALUES ('201', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:58:12', '期数：20160826013,投注详情：第3位：第9球,投注额：5');
INSERT INTO `flow` VALUES ('202', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:58:12', '期数：20160826013,投注详情：第3位：单,投注额：6');
INSERT INTO `flow` VALUES ('203', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:58:12', '期数：20160826013,投注详情：第3位：双,投注额：5');
INSERT INTO `flow` VALUES ('204', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:58:12', '期数：20160826013,投注详情：第3位：大,投注额：6');
INSERT INTO `flow` VALUES ('205', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:58:12', '期数：20160826013,投注详情：第3位：小,投注额：7');
INSERT INTO `flow` VALUES ('206', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:58:12', '期数：20160826013,投注详情：和,投注额：6');
INSERT INTO `flow` VALUES ('207', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:58:12', '期数：20160826013,投注详情：虎,投注额：5');
INSERT INTO `flow` VALUES ('208', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:58:12', '期数：20160826013,投注详情：龙,投注额：6');
INSERT INTO `flow` VALUES ('209', '3', '2', '400', null, null, null, null, '0', '2016-08-26 01:58:12', '期数：20160826013,投注详情：总和双,投注额：4');
INSERT INTO `flow` VALUES ('210', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:58:12', '期数：20160826013,投注详情：总和单,投注额：5');
INSERT INTO `flow` VALUES ('211', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:58:12', '期数：20160826013,投注详情：总和小,投注额：7');
INSERT INTO `flow` VALUES ('212', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:58:12', '期数：20160826013,投注详情：总和大,投注额：6');
INSERT INTO `flow` VALUES ('213', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:58:30', '期数：20160826013,投注详情：前三位：半顺,投注额：6');
INSERT INTO `flow` VALUES ('214', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:58:30', '期数：20160826013,投注详情：前三位：杂六,投注额：5');
INSERT INTO `flow` VALUES ('215', '3', '2', '900', null, null, null, null, '0', '2016-08-26 01:58:30', '期数：20160826013,投注详情：第3位：第2球,投注额：9');
INSERT INTO `flow` VALUES ('216', '3', '2', '800', null, null, null, null, '0', '2016-08-26 01:58:30', '期数：20160826013,投注详情：前三位：豹子,投注额：8');
INSERT INTO `flow` VALUES ('217', '3', '2', '800', null, null, null, null, '0', '2016-08-26 01:58:30', '期数：20160826013,投注详情：第3位：第1球,投注额：8');
INSERT INTO `flow` VALUES ('218', '3', '2', '900', null, null, null, null, '0', '2016-08-26 01:58:30', '期数：20160826013,投注详情：前三位：顺子,投注额：9');
INSERT INTO `flow` VALUES ('219', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:58:30', '期数：20160826013,投注详情：第3位：第0球,投注额：7');
INSERT INTO `flow` VALUES ('220', '3', '2', '800', null, null, null, null, '0', '2016-08-26 01:58:30', '期数：20160826013,投注详情：前三位：对子,投注额：8');
INSERT INTO `flow` VALUES ('221', '3', '2', '800', null, null, null, null, '0', '2016-08-26 01:58:30', '期数：20160826013,投注详情：第3位：第6球,投注额：8');
INSERT INTO `flow` VALUES ('222', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:58:30', '期数：20160826013,投注详情：第3位：第5球,投注额：7');
INSERT INTO `flow` VALUES ('223', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:58:30', '期数：20160826013,投注详情：第3位：第4球,投注额：5');
INSERT INTO `flow` VALUES ('224', '3', '2', '7600', null, null, null, null, '0', '2016-08-26 01:58:30', '期数：20160826013,投注详情：第3位：第3球,投注额：76');
INSERT INTO `flow` VALUES ('225', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:58:30', '期数：20160826013,投注详情：第3位：第8球,投注额：7');
INSERT INTO `flow` VALUES ('226', '3', '2', '900', null, null, null, null, '0', '2016-08-26 01:58:30', '期数：20160826013,投注详情：第3位：第7球,投注额：9');
INSERT INTO `flow` VALUES ('227', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:58:30', '期数：20160826013,投注详情：第3位：第9球,投注额：5');
INSERT INTO `flow` VALUES ('228', '3', '2', '900', null, null, null, null, '0', '2016-08-26 01:58:30', '期数：20160826013,投注详情：第3位：单,投注额：9');
INSERT INTO `flow` VALUES ('229', '3', '2', '900', null, null, null, null, '0', '2016-08-26 01:58:30', '期数：20160826013,投注详情：第3位：双,投注额：9');
INSERT INTO `flow` VALUES ('230', '3', '2', '7600', null, null, null, null, '0', '2016-08-26 01:58:30', '期数：20160826013,投注详情：第3位：大,投注额：76');
INSERT INTO `flow` VALUES ('231', '3', '2', '800', null, null, null, null, '0', '2016-08-26 01:58:30', '期数：20160826013,投注详情：第3位：小,投注额：8');
INSERT INTO `flow` VALUES ('232', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:58:30', '期数：20160826013,投注详情：和,投注额：7');
INSERT INTO `flow` VALUES ('233', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:58:30', '期数：20160826013,投注详情：虎,投注额：7');
INSERT INTO `flow` VALUES ('234', '3', '2', '800', null, null, null, null, '0', '2016-08-26 01:58:30', '期数：20160826013,投注详情：龙,投注额：8');
INSERT INTO `flow` VALUES ('235', '3', '2', '7800', null, null, null, null, '0', '2016-08-26 01:58:30', '期数：20160826013,投注详情：总和双,投注额：78');
INSERT INTO `flow` VALUES ('236', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:58:30', '期数：20160826013,投注详情：总和单,投注额：6');
INSERT INTO `flow` VALUES ('237', '3', '2', '5600', null, null, null, null, '0', '2016-08-26 01:58:30', '期数：20160826013,投注详情：总和小,投注额：56');
INSERT INTO `flow` VALUES ('238', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:58:30', '期数：20160826013,投注详情：总和大,投注额：7');
INSERT INTO `flow` VALUES ('239', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:58:49', '期数：20160826013,投注详情：前三位：半顺,投注额：7');
INSERT INTO `flow` VALUES ('240', '3', '2', '200', null, null, null, null, '0', '2016-08-26 01:58:49', '期数：20160826013,投注详情：前三位：杂六,投注额：2');
INSERT INTO `flow` VALUES ('241', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:58:49', '期数：20160826013,投注详情：第3位：第2球,投注额：7');
INSERT INTO `flow` VALUES ('242', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:58:49', '期数：20160826013,投注详情：前三位：豹子,投注额：5');
INSERT INTO `flow` VALUES ('243', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:58:49', '期数：20160826013,投注详情：第3位：第1球,投注额：6');
INSERT INTO `flow` VALUES ('244', '3', '2', '400', null, null, null, null, '0', '2016-08-26 01:58:49', '期数：20160826013,投注详情：前三位：顺子,投注额：4');
INSERT INTO `flow` VALUES ('245', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:58:49', '期数：20160826013,投注详情：第3位：第0球,投注额：5');
INSERT INTO `flow` VALUES ('246', '3', '2', '5600', null, null, null, null, '0', '2016-08-26 01:58:49', '期数：20160826013,投注详情：前三位：对子,投注额：56');
INSERT INTO `flow` VALUES ('247', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:58:49', '期数：20160826013,投注详情：第3位：第6球,投注额：6');
INSERT INTO `flow` VALUES ('248', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:58:49', '期数：20160826013,投注详情：第3位：第5球,投注额：5');
INSERT INTO `flow` VALUES ('249', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:58:49', '期数：20160826013,投注详情：第3位：第4球,投注额：6');
INSERT INTO `flow` VALUES ('250', '3', '2', '800', null, null, null, null, '0', '2016-08-26 01:58:49', '期数：20160826013,投注详情：第3位：第3球,投注额：8');
INSERT INTO `flow` VALUES ('251', '3', '2', '800', null, null, null, null, '0', '2016-08-26 01:58:49', '期数：20160826013,投注详情：第3位：第8球,投注额：8');
INSERT INTO `flow` VALUES ('252', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:58:49', '期数：20160826013,投注详情：第3位：第7球,投注额：7');
INSERT INTO `flow` VALUES ('253', '3', '2', '800', null, null, null, null, '0', '2016-08-26 01:58:49', '期数：20160826013,投注详情：第3位：第9球,投注额：8');
INSERT INTO `flow` VALUES ('254', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:58:49', '期数：20160826013,投注详情：第3位：单,投注额：7');
INSERT INTO `flow` VALUES ('255', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:58:49', '期数：20160826013,投注详情：第3位：双,投注额：7');
INSERT INTO `flow` VALUES ('256', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:58:49', '期数：20160826013,投注详情：第3位：大,投注额：6');
INSERT INTO `flow` VALUES ('257', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:58:49', '期数：20160826013,投注详情：第3位：小,投注额：5');
INSERT INTO `flow` VALUES ('258', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:58:49', '期数：20160826013,投注详情：和,投注额：7');
INSERT INTO `flow` VALUES ('259', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:58:49', '期数：20160826013,投注详情：虎,投注额：6');
INSERT INTO `flow` VALUES ('260', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:58:49', '期数：20160826013,投注详情：龙,投注额：5');
INSERT INTO `flow` VALUES ('261', '3', '2', '400', null, null, null, null, '0', '2016-08-26 01:58:49', '期数：20160826013,投注详情：总和双,投注额：4');
INSERT INTO `flow` VALUES ('262', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:58:49', '期数：20160826013,投注详情：总和单,投注额：5');
INSERT INTO `flow` VALUES ('263', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:58:49', '期数：20160826013,投注详情：总和小,投注额：6');
INSERT INTO `flow` VALUES ('264', '3', '2', '800', null, null, null, null, '0', '2016-08-26 01:58:49', '期数：20160826013,投注详情：总和大,投注额：8');
INSERT INTO `flow` VALUES ('265', '3', '2', '6700', null, null, null, null, '0', '2016-08-26 01:59:07', '期数：20160826013,投注详情：前三位：半顺,投注额：67');
INSERT INTO `flow` VALUES ('266', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:59:07', '期数：20160826013,投注详情：前三位：杂六,投注额：7');
INSERT INTO `flow` VALUES ('267', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:59:07', '期数：20160826013,投注详情：第3位：第2球,投注额：7');
INSERT INTO `flow` VALUES ('268', '3', '2', '8700', null, null, null, null, '0', '2016-08-26 01:59:07', '期数：20160826013,投注详情：前三位：豹子,投注额：87');
INSERT INTO `flow` VALUES ('269', '3', '2', '6500', null, null, null, null, '0', '2016-08-26 01:59:07', '期数：20160826013,投注详情：第3位：第1球,投注额：65');
INSERT INTO `flow` VALUES ('270', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:59:07', '期数：20160826013,投注详情：前三位：顺子,投注额：6');
INSERT INTO `flow` VALUES ('271', '3', '2', '5400', null, null, null, null, '0', '2016-08-26 01:59:07', '期数：20160826013,投注详情：第3位：第0球,投注额：54');
INSERT INTO `flow` VALUES ('272', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:59:07', '期数：20160826013,投注详情：前三位：对子,投注额：5');
INSERT INTO `flow` VALUES ('273', '3', '2', '800', null, null, null, null, '0', '2016-08-26 01:59:07', '期数：20160826013,投注详情：第3位：第6球,投注额：8');
INSERT INTO `flow` VALUES ('274', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:59:07', '期数：20160826013,投注详情：第3位：第5球,投注额：7');
INSERT INTO `flow` VALUES ('275', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:59:07', '期数：20160826013,投注详情：第3位：第4球,投注额：5');
INSERT INTO `flow` VALUES ('276', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:59:07', '期数：20160826013,投注详情：第3位：第3球,投注额：7');
INSERT INTO `flow` VALUES ('277', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:59:07', '期数：20160826013,投注详情：第3位：第8球,投注额：5');
INSERT INTO `flow` VALUES ('278', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:59:07', '期数：20160826013,投注详情：第3位：第7球,投注额：6');
INSERT INTO `flow` VALUES ('279', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:59:07', '期数：20160826013,投注详情：第3位：第9球,投注额：7');
INSERT INTO `flow` VALUES ('280', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:59:07', '期数：20160826013,投注详情：第3位：单,投注额：7');
INSERT INTO `flow` VALUES ('281', '3', '2', '800', null, null, null, null, '0', '2016-08-26 01:59:07', '期数：20160826013,投注详情：第3位：双,投注额：8');
INSERT INTO `flow` VALUES ('282', '3', '2', '8700', null, null, null, null, '0', '2016-08-26 01:59:07', '期数：20160826013,投注详情：第3位：大,投注额：87');
INSERT INTO `flow` VALUES ('283', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:59:07', '期数：20160826013,投注详情：第3位：小,投注额：6');
INSERT INTO `flow` VALUES ('284', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:59:07', '期数：20160826013,投注详情：和,投注额：7');
INSERT INTO `flow` VALUES ('285', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:59:07', '期数：20160826013,投注详情：虎,投注额：6');
INSERT INTO `flow` VALUES ('286', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:59:07', '期数：20160826013,投注详情：龙,投注额：5');
INSERT INTO `flow` VALUES ('287', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:59:07', '期数：20160826013,投注详情：总和双,投注额：6');
INSERT INTO `flow` VALUES ('288', '3', '2', '800', null, null, null, null, '0', '2016-08-26 01:59:07', '期数：20160826013,投注详情：总和单,投注额：8');
INSERT INTO `flow` VALUES ('289', '3', '2', '8700', null, null, null, null, '0', '2016-08-26 01:59:07', '期数：20160826013,投注详情：总和小,投注额：87');
INSERT INTO `flow` VALUES ('290', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:59:07', '期数：20160826013,投注详情：总和大,投注额：6');
INSERT INTO `flow` VALUES ('291', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:59:26', '期数：20160826013,投注详情：前三位：半顺,投注额：6');
INSERT INTO `flow` VALUES ('292', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:59:26', '期数：20160826013,投注详情：前三位：杂六,投注额：7');
INSERT INTO `flow` VALUES ('293', '3', '2', '800', null, null, null, null, '0', '2016-08-26 01:59:26', '期数：20160826013,投注详情：第3位：第2球,投注额：8');
INSERT INTO `flow` VALUES ('294', '3', '2', '400', null, null, null, null, '0', '2016-08-26 01:59:26', '期数：20160826013,投注详情：前三位：豹子,投注额：4');
INSERT INTO `flow` VALUES ('295', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:59:26', '期数：20160826013,投注详情：第3位：第1球,投注额：7');
INSERT INTO `flow` VALUES ('296', '3', '2', '300', null, null, null, null, '0', '2016-08-26 01:59:26', '期数：20160826013,投注详情：前三位：顺子,投注额：3');
INSERT INTO `flow` VALUES ('297', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:59:26', '期数：20160826013,投注详情：第3位：第0球,投注额：6');
INSERT INTO `flow` VALUES ('298', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:59:26', '期数：20160826013,投注详情：前三位：对子,投注额：5');
INSERT INTO `flow` VALUES ('299', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:59:26', '期数：20160826013,投注详情：第3位：第6球,投注额：7');
INSERT INTO `flow` VALUES ('300', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:59:26', '期数：20160826013,投注详情：第3位：第5球,投注额：6');
INSERT INTO `flow` VALUES ('301', '3', '2', '400', null, null, null, null, '0', '2016-08-26 01:59:26', '期数：20160826013,投注详情：第3位：第4球,投注额：4');
INSERT INTO `flow` VALUES ('302', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:59:26', '期数：20160826013,投注详情：第3位：第3球,投注额：6');
INSERT INTO `flow` VALUES ('303', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:59:26', '期数：20160826013,投注详情：第3位：第8球,投注额：6');
INSERT INTO `flow` VALUES ('304', '3', '2', '800', null, null, null, null, '0', '2016-08-26 01:59:26', '期数：20160826013,投注详情：第3位：第7球,投注额：8');
INSERT INTO `flow` VALUES ('305', '3', '2', '4500', null, null, null, null, '0', '2016-08-26 01:59:26', '期数：20160826013,投注详情：第3位：第9球,投注额：45');
INSERT INTO `flow` VALUES ('306', '3', '2', '800', null, null, null, null, '0', '2016-08-26 01:59:26', '期数：20160826013,投注详情：第3位：单,投注额：8');
INSERT INTO `flow` VALUES ('307', '3', '2', '800', null, null, null, null, '0', '2016-08-26 01:59:26', '期数：20160826013,投注详情：第3位：双,投注额：8');
INSERT INTO `flow` VALUES ('308', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:59:26', '期数：20160826013,投注详情：第3位：大,投注额：6');
INSERT INTO `flow` VALUES ('309', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:59:26', '期数：20160826013,投注详情：第3位：小,投注额：7');
INSERT INTO `flow` VALUES ('310', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:59:26', '期数：20160826013,投注详情：和,投注额：5');
INSERT INTO `flow` VALUES ('311', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:59:26', '期数：20160826013,投注详情：虎,投注额：6');
INSERT INTO `flow` VALUES ('312', '3', '2', '900', null, null, null, null, '0', '2016-08-26 01:59:26', '期数：20160826013,投注详情：龙,投注额：9');
INSERT INTO `flow` VALUES ('313', '3', '2', '800', null, null, null, null, '0', '2016-08-26 01:59:26', '期数：20160826013,投注详情：总和双,投注额：8');
INSERT INTO `flow` VALUES ('314', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:59:26', '期数：20160826013,投注详情：总和单,投注额：7');
INSERT INTO `flow` VALUES ('315', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:59:26', '期数：20160826013,投注详情：总和小,投注额：5');
INSERT INTO `flow` VALUES ('316', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:59:26', '期数：20160826013,投注详情：总和大,投注额：6');
INSERT INTO `flow` VALUES ('317', '3', '2', '800', null, null, null, null, '0', '2016-08-26 01:59:43', '期数：20160826013,投注详情：前三位：半顺,投注额：8');
INSERT INTO `flow` VALUES ('318', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:59:43', '期数：20160826013,投注详情：前三位：杂六,投注额：6');
INSERT INTO `flow` VALUES ('319', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:59:43', '期数：20160826013,投注详情：第3位：第2球,投注额：7');
INSERT INTO `flow` VALUES ('320', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:59:43', '期数：20160826013,投注详情：前三位：豹子,投注额：6');
INSERT INTO `flow` VALUES ('321', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:59:43', '期数：20160826013,投注详情：第3位：第1球,投注额：6');
INSERT INTO `flow` VALUES ('322', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:59:43', '期数：20160826013,投注详情：前三位：顺子,投注额：7');
INSERT INTO `flow` VALUES ('323', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:59:43', '期数：20160826013,投注详情：第3位：第0球,投注额：5');
INSERT INTO `flow` VALUES ('324', '3', '2', '800', null, null, null, null, '0', '2016-08-26 01:59:43', '期数：20160826013,投注详情：前三位：对子,投注额：8');
INSERT INTO `flow` VALUES ('325', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:59:43', '期数：20160826013,投注详情：第3位：第6球,投注额：6');
INSERT INTO `flow` VALUES ('326', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:59:43', '期数：20160826013,投注详情：第3位：第5球,投注额：5');
INSERT INTO `flow` VALUES ('327', '3', '2', '400', null, null, null, null, '0', '2016-08-26 01:59:43', '期数：20160826013,投注详情：第3位：第4球,投注额：4');
INSERT INTO `flow` VALUES ('328', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:59:43', '期数：20160826013,投注详情：第3位：第3球,投注额：5');
INSERT INTO `flow` VALUES ('329', '3', '2', '6500', null, null, null, null, '0', '2016-08-26 01:59:43', '期数：20160826013,投注详情：第3位：第8球,投注额：65');
INSERT INTO `flow` VALUES ('330', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:59:43', '期数：20160826013,投注详情：第3位：第7球,投注额：7');
INSERT INTO `flow` VALUES ('331', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:59:43', '期数：20160826013,投注详情：第3位：第9球,投注额：6');
INSERT INTO `flow` VALUES ('332', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:59:43', '期数：20160826013,投注详情：第3位：单,投注额：6');
INSERT INTO `flow` VALUES ('333', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:59:43', '期数：20160826013,投注详情：第3位：双,投注额：7');
INSERT INTO `flow` VALUES ('334', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:59:43', '期数：20160826013,投注详情：第3位：大,投注额：7');
INSERT INTO `flow` VALUES ('335', '3', '2', '6500', null, null, null, null, '0', '2016-08-26 01:59:43', '期数：20160826013,投注详情：第3位：小,投注额：65');
INSERT INTO `flow` VALUES ('336', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:59:43', '期数：20160826013,投注详情：和,投注额：5');
INSERT INTO `flow` VALUES ('337', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:59:43', '期数：20160826013,投注详情：虎,投注额：6');
INSERT INTO `flow` VALUES ('338', '3', '2', '6500', null, null, null, null, '0', '2016-08-26 01:59:43', '期数：20160826013,投注详情：龙,投注额：65');
INSERT INTO `flow` VALUES ('339', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:59:43', '期数：20160826013,投注详情：总和双,投注额：7');
INSERT INTO `flow` VALUES ('340', '3', '2', '600', null, null, null, null, '0', '2016-08-26 01:59:43', '期数：20160826013,投注详情：总和单,投注额：6');
INSERT INTO `flow` VALUES ('341', '3', '2', '500', null, null, null, null, '0', '2016-08-26 01:59:43', '期数：20160826013,投注详情：总和小,投注额：5');
INSERT INTO `flow` VALUES ('342', '3', '2', '700', null, null, null, null, '0', '2016-08-26 01:59:43', '期数：20160826013,投注详情：总和大,投注额：7');
INSERT INTO `flow` VALUES ('343', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:00:15', '期数：20160826013,投注详情：前三位：半顺,投注额：7');
INSERT INTO `flow` VALUES ('344', '3', '2', '7800', null, null, null, null, '0', '2016-08-26 02:00:15', '期数：20160826013,投注详情：前三位：杂六,投注额：78');
INSERT INTO `flow` VALUES ('345', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:00:15', '期数：20160826013,投注详情：第3位：第2球,投注额：5');
INSERT INTO `flow` VALUES ('346', '3', '2', '5500', null, null, null, null, '0', '2016-08-26 02:00:15', '期数：20160826013,投注详情：前三位：豹子,投注额：55');
INSERT INTO `flow` VALUES ('347', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:00:15', '期数：20160826013,投注详情：第3位：第1球,投注额：6');
INSERT INTO `flow` VALUES ('348', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:00:15', '期数：20160826013,投注详情：前三位：顺子,投注额：5');
INSERT INTO `flow` VALUES ('349', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:00:15', '期数：20160826013,投注详情：第3位：第0球,投注额：5');
INSERT INTO `flow` VALUES ('350', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:00:15', '期数：20160826013,投注详情：前三位：对子,投注额：6');
INSERT INTO `flow` VALUES ('351', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:00:15', '期数：20160826013,投注详情：第3位：第6球,投注额：7');
INSERT INTO `flow` VALUES ('352', '3', '2', '56500', null, null, null, null, '0', '2016-08-26 02:00:15', '期数：20160826013,投注详情：第3位：第5球,投注额：565');
INSERT INTO `flow` VALUES ('353', '3', '2', '5400', null, null, null, null, '0', '2016-08-26 02:00:15', '期数：20160826013,投注详情：第3位：第3球,投注额：54');
INSERT INTO `flow` VALUES ('354', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:00:15', '期数：20160826013,投注详情：第3位：第8球,投注额：8');
INSERT INTO `flow` VALUES ('355', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:00:15', '期数：20160826013,投注详情：第3位：第7球,投注额：8');
INSERT INTO `flow` VALUES ('356', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:00:15', '期数：20160826013,投注详情：第3位：第9球,投注额：6');
INSERT INTO `flow` VALUES ('357', '3', '2', '400', null, null, null, null, '0', '2016-08-26 02:00:15', '期数：20160826013,投注详情：第3位：单,投注额：4');
INSERT INTO `flow` VALUES ('358', '3', '2', '400', null, null, null, null, '0', '2016-08-26 02:00:15', '期数：20160826013,投注详情：第3位：双,投注额：4');
INSERT INTO `flow` VALUES ('359', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:00:15', '期数：20160826013,投注详情：第3位：大,投注额：6');
INSERT INTO `flow` VALUES ('360', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:00:15', '期数：20160826013,投注详情：第3位：小,投注额：5');
INSERT INTO `flow` VALUES ('361', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:00:15', '期数：20160826013,投注详情：和,投注额：7');
INSERT INTO `flow` VALUES ('362', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:00:15', '期数：20160826013,投注详情：虎,投注额：7');
INSERT INTO `flow` VALUES ('363', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:00:15', '期数：20160826013,投注详情：龙,投注额：7');
INSERT INTO `flow` VALUES ('364', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:00:15', '期数：20160826013,投注详情：总和双,投注额：6');
INSERT INTO `flow` VALUES ('365', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:00:15', '期数：20160826013,投注详情：总和单,投注额：7');
INSERT INTO `flow` VALUES ('366', '3', '2', '6700', null, null, null, null, '0', '2016-08-26 02:00:15', '期数：20160826013,投注详情：总和小,投注额：67');
INSERT INTO `flow` VALUES ('367', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:00:15', '期数：20160826013,投注详情：总和大,投注额：6');
INSERT INTO `flow` VALUES ('368', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:00:39', '期数：20160826013,投注详情：第4位：双,投注额：7');
INSERT INTO `flow` VALUES ('369', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:00:39', '期数：20160826013,投注详情：第4位：小,投注额：8');
INSERT INTO `flow` VALUES ('370', '3', '2', '9900', null, null, null, null, '0', '2016-08-26 02:00:39', '期数：20160826013,投注详情：第4位：单,投注额：99');
INSERT INTO `flow` VALUES ('371', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:00:39', '期数：20160826013,投注详情：第4位：第9球,投注额：7');
INSERT INTO `flow` VALUES ('372', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:00:39', '期数：20160826013,投注详情：第4位：大,投注额：8');
INSERT INTO `flow` VALUES ('373', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:00:39', '期数：20160826013,投注详情：前三位：半顺,投注额：8');
INSERT INTO `flow` VALUES ('374', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:00:39', '期数：20160826013,投注详情：前三位：杂六,投注额：6');
INSERT INTO `flow` VALUES ('375', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:00:39', '期数：20160826013,投注详情：第4位：第8球,投注额：6');
INSERT INTO `flow` VALUES ('376', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:00:39', '期数：20160826013,投注详情：第4位：第7球,投注额：6');
INSERT INTO `flow` VALUES ('377', '3', '2', '400', null, null, null, null, '0', '2016-08-26 02:00:39', '期数：20160826013,投注详情：第4位：第6球,投注额：4');
INSERT INTO `flow` VALUES ('378', '3', '2', '300', null, null, null, null, '0', '2016-08-26 02:00:39', '期数：20160826013,投注详情：第4位：第5球,投注额：3');
INSERT INTO `flow` VALUES ('379', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:00:39', '期数：20160826013,投注详情：前三位：豹子,投注额：8');
INSERT INTO `flow` VALUES ('380', '3', '2', '400', null, null, null, null, '0', '2016-08-26 02:00:39', '期数：20160826013,投注详情：第4位：第4球,投注额：4');
INSERT INTO `flow` VALUES ('381', '3', '2', '7700', null, null, null, null, '0', '2016-08-26 02:00:39', '期数：20160826013,投注详情：前三位：顺子,投注额：77');
INSERT INTO `flow` VALUES ('382', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:00:39', '期数：20160826013,投注详情：第4位：第3球,投注额：6');
INSERT INTO `flow` VALUES ('383', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:00:39', '期数：20160826013,投注详情：前三位：对子,投注额：8');
INSERT INTO `flow` VALUES ('384', '3', '2', '7800', null, null, null, null, '0', '2016-08-26 02:00:39', '期数：20160826013,投注详情：第4位：第2球,投注额：78');
INSERT INTO `flow` VALUES ('385', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:00:39', '期数：20160826013,投注详情：第4位：第1球,投注额：7');
INSERT INTO `flow` VALUES ('386', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:00:39', '期数：20160826013,投注详情：第4位：第0球,投注额：6');
INSERT INTO `flow` VALUES ('387', '3', '2', '8700', null, null, null, null, '0', '2016-08-26 02:00:39', '期数：20160826013,投注详情：和,投注额：87');
INSERT INTO `flow` VALUES ('388', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:00:39', '期数：20160826013,投注详情：虎,投注额：7');
INSERT INTO `flow` VALUES ('389', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:00:39', '期数：20160826013,投注详情：龙,投注额：7');
INSERT INTO `flow` VALUES ('390', '3', '2', '6700', null, null, null, null, '0', '2016-08-26 02:00:39', '期数：20160826013,投注详情：总和双,投注额：67');
INSERT INTO `flow` VALUES ('391', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:00:39', '期数：20160826013,投注详情：总和单,投注额：6');
INSERT INTO `flow` VALUES ('392', '3', '2', '67600', null, null, null, null, '0', '2016-08-26 02:00:39', '期数：20160826013,投注详情：总和小,投注额：676');
INSERT INTO `flow` VALUES ('393', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:01:10', '期数：20160826013,投注详情：前三位：半顺,投注额：5');
INSERT INTO `flow` VALUES ('394', '3', '2', '6500', null, null, null, null, '0', '2016-08-26 02:01:10', '期数：20160826013,投注详情：前三位：杂六,投注额：65');
INSERT INTO `flow` VALUES ('395', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:01:10', '期数：20160826013,投注详情：前三位：豹子,投注额：6');
INSERT INTO `flow` VALUES ('396', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:01:10', '期数：20160826013,投注详情：前三位：顺子,投注额：7');
INSERT INTO `flow` VALUES ('397', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:01:10', '期数：20160826013,投注详情：前三位：对子,投注额：6');
INSERT INTO `flow` VALUES ('398', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:01:10', '期数：20160826013,投注详情：第5位：小,投注额：6');
INSERT INTO `flow` VALUES ('399', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:01:10', '期数：20160826013,投注详情：第5位：大,投注额：6');
INSERT INTO `flow` VALUES ('400', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:01:10', '期数：20160826013,投注详情：第5位：第9球,投注额：5');
INSERT INTO `flow` VALUES ('401', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:01:10', '期数：20160826013,投注详情：第5位：双,投注额：7');
INSERT INTO `flow` VALUES ('402', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:01:10', '期数：20160826013,投注详情：第5位：单,投注额：6');
INSERT INTO `flow` VALUES ('403', '3', '2', '98600', null, null, null, null, '0', '2016-08-26 02:01:10', '期数：20160826013,投注详情：第5位：第4球,投注额：986');
INSERT INTO `flow` VALUES ('404', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:01:10', '期数：20160826013,投注详情：第5位：第3球,投注额：8');
INSERT INTO `flow` VALUES ('405', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:01:10', '期数：20160826013,投注详情：第5位：第2球,投注额：7');
INSERT INTO `flow` VALUES ('406', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:01:10', '期数：20160826013,投注详情：第5位：第1球,投注额：6');
INSERT INTO `flow` VALUES ('407', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:01:10', '期数：20160826013,投注详情：第5位：第8球,投注额：5');
INSERT INTO `flow` VALUES ('408', '3', '2', '400', null, null, null, null, '0', '2016-08-26 02:01:10', '期数：20160826013,投注详情：第5位：第7球,投注额：4');
INSERT INTO `flow` VALUES ('409', '3', '2', '400', null, null, null, null, '0', '2016-08-26 02:01:10', '期数：20160826013,投注详情：第5位：第6球,投注额：4');
INSERT INTO `flow` VALUES ('410', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:01:10', '期数：20160826013,投注详情：第5位：第5球,投注额：5');
INSERT INTO `flow` VALUES ('411', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:01:10', '期数：20160826013,投注详情：和,投注额：5');
INSERT INTO `flow` VALUES ('412', '3', '2', '400', null, null, null, null, '0', '2016-08-26 02:01:10', '期数：20160826013,投注详情：虎,投注额：4');
INSERT INTO `flow` VALUES ('413', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:01:10', '期数：20160826013,投注详情：龙,投注额：5');
INSERT INTO `flow` VALUES ('414', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:01:10', '期数：20160826013,投注详情：第5位：第0球,投注额：5');
INSERT INTO `flow` VALUES ('415', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:01:10', '期数：20160826013,投注详情：总和双,投注额：6');
INSERT INTO `flow` VALUES ('416', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:01:10', '期数：20160826013,投注详情：总和单,投注额：6');
INSERT INTO `flow` VALUES ('417', '3', '2', '6500', null, null, null, null, '0', '2016-08-26 02:01:10', '期数：20160826013,投注详情：总和小,投注额：65');
INSERT INTO `flow` VALUES ('418', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:01:10', '期数：20160826013,投注详情：总和大,投注额：7');
INSERT INTO `flow` VALUES ('419', '3', '2', '6500', null, null, null, null, '0', '2016-08-26 02:01:37', '期数：20160826013,投注详情：中三位：豹子,投注额：65');
INSERT INTO `flow` VALUES ('420', '3', '2', '400', null, null, null, null, '0', '2016-08-26 02:01:37', '期数：20160826013,投注详情：中三位：顺子,投注额：4');
INSERT INTO `flow` VALUES ('421', '3', '2', '5600', null, null, null, null, '0', '2016-08-26 02:01:37', '期数：20160826013,投注详情：中三位：半顺,投注额：56');
INSERT INTO `flow` VALUES ('422', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:01:37', '期数：20160826013,投注详情：中三位：杂六,投注额：6');
INSERT INTO `flow` VALUES ('423', '3', '2', '400', null, null, null, null, '0', '2016-08-26 02:01:37', '期数：20160826013,投注详情：第5位：小,投注额：4');
INSERT INTO `flow` VALUES ('424', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:01:37', '期数：20160826013,投注详情：第5位：大,投注额：5');
INSERT INTO `flow` VALUES ('425', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:01:37', '期数：20160826013,投注详情：第5位：第9球,投注额：7');
INSERT INTO `flow` VALUES ('426', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:01:37', '期数：20160826013,投注详情：第5位：双,投注额：5');
INSERT INTO `flow` VALUES ('427', '3', '2', '400', null, null, null, null, '0', '2016-08-26 02:01:37', '期数：20160826013,投注详情：第5位：单,投注额：4');
INSERT INTO `flow` VALUES ('428', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:01:37', '期数：20160826013,投注详情：第5位：第4球,投注额：7');
INSERT INTO `flow` VALUES ('429', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:01:37', '期数：20160826013,投注详情：第5位：第3球,投注额：6');
INSERT INTO `flow` VALUES ('430', '3', '2', '6600', null, null, null, null, '0', '2016-08-26 02:01:37', '期数：20160826013,投注详情：第5位：第2球,投注额：66');
INSERT INTO `flow` VALUES ('431', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:01:37', '期数：20160826013,投注详情：第5位：第1球,投注额：5');
INSERT INTO `flow` VALUES ('432', '3', '2', '9900', null, null, null, null, '0', '2016-08-26 02:01:37', '期数：20160826013,投注详情：第5位：第8球,投注额：99');
INSERT INTO `flow` VALUES ('433', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:01:37', '期数：20160826013,投注详情：第5位：第7球,投注额：8');
INSERT INTO `flow` VALUES ('434', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:01:37', '期数：20160826013,投注详情：第5位：第6球,投注额：8');
INSERT INTO `flow` VALUES ('435', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:01:37', '期数：20160826013,投注详情：第5位：第5球,投注额：7');
INSERT INTO `flow` VALUES ('436', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:01:37', '期数：20160826013,投注详情：和,投注额：7');
INSERT INTO `flow` VALUES ('437', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:01:37', '期数：20160826013,投注详情：虎,投注额：7');
INSERT INTO `flow` VALUES ('438', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:01:37', '期数：20160826013,投注详情：龙,投注额：8');
INSERT INTO `flow` VALUES ('439', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:01:37', '期数：20160826013,投注详情：总和双,投注额：8');
INSERT INTO `flow` VALUES ('440', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:01:37', '期数：20160826013,投注详情：第5位：第0球,投注额：5');
INSERT INTO `flow` VALUES ('441', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:01:37', '期数：20160826013,投注详情：总和单,投注额：7');
INSERT INTO `flow` VALUES ('442', '3', '2', '6700', null, null, null, null, '0', '2016-08-26 02:01:37', '期数：20160826013,投注详情：总和小,投注额：67');
INSERT INTO `flow` VALUES ('443', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:01:37', '期数：20160826013,投注详情：总和大,投注额：6');
INSERT INTO `flow` VALUES ('444', '3', '2', '300', null, null, null, null, '0', '2016-08-26 02:01:53', '期数：20160826013,投注详情：中三位：豹子,投注额：3');
INSERT INTO `flow` VALUES ('445', '3', '2', '400', null, null, null, null, '0', '2016-08-26 02:01:53', '期数：20160826013,投注详情：中三位：顺子,投注额：4');
INSERT INTO `flow` VALUES ('446', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:01:53', '期数：20160826013,投注详情：中三位：对子,投注额：5');
INSERT INTO `flow` VALUES ('447', '3', '2', '56500', null, null, null, null, '0', '2016-08-26 02:01:53', '期数：20160826013,投注详情：中三位：半顺,投注额：565');
INSERT INTO `flow` VALUES ('448', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:01:53', '期数：20160826013,投注详情：中三位：杂六,投注额：6');
INSERT INTO `flow` VALUES ('449', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:01:53', '期数：20160826013,投注详情：第5位：小,投注额：7');
INSERT INTO `flow` VALUES ('450', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:01:53', '期数：20160826013,投注详情：第5位：大,投注额：7');
INSERT INTO `flow` VALUES ('451', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:01:53', '期数：20160826013,投注详情：第5位：第9球,投注额：6');
INSERT INTO `flow` VALUES ('452', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:01:53', '期数：20160826013,投注详情：第5位：双,投注额：8');
INSERT INTO `flow` VALUES ('453', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:01:53', '期数：20160826013,投注详情：第5位：单,投注额：7');
INSERT INTO `flow` VALUES ('454', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:01:53', '期数：20160826013,投注详情：第5位：第4球,投注额：8');
INSERT INTO `flow` VALUES ('455', '3', '2', '8700', null, null, null, null, '0', '2016-08-26 02:01:53', '期数：20160826013,投注详情：第5位：第3球,投注额：87');
INSERT INTO `flow` VALUES ('456', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:01:53', '期数：20160826013,投注详情：第5位：第2球,投注额：7');
INSERT INTO `flow` VALUES ('457', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:01:53', '期数：20160826013,投注详情：第5位：第1球,投注额：6');
INSERT INTO `flow` VALUES ('458', '3', '2', '4600', null, null, null, null, '0', '2016-08-26 02:01:53', '期数：20160826013,投注详情：第5位：第8球,投注额：46');
INSERT INTO `flow` VALUES ('459', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:01:53', '期数：20160826013,投注详情：第5位：第7球,投注额：5');
INSERT INTO `flow` VALUES ('460', '3', '2', '6500', null, null, null, null, '0', '2016-08-26 02:01:53', '期数：20160826013,投注详情：第5位：第6球,投注额：65');
INSERT INTO `flow` VALUES ('461', '3', '2', '8600', null, null, null, null, '0', '2016-08-26 02:01:53', '期数：20160826013,投注详情：第5位：第5球,投注额：86');
INSERT INTO `flow` VALUES ('462', '3', '2', '300', null, null, null, null, '0', '2016-08-26 02:01:53', '期数：20160826013,投注详情：和,投注额：3');
INSERT INTO `flow` VALUES ('463', '3', '2', '5400', null, null, null, null, '0', '2016-08-26 02:01:53', '期数：20160826013,投注详情：虎,投注额：54');
INSERT INTO `flow` VALUES ('464', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:01:53', '期数：20160826013,投注详情：龙,投注额：6');
INSERT INTO `flow` VALUES ('465', '3', '2', '98700', null, null, null, null, '0', '2016-08-26 02:01:53', '期数：20160826013,投注详情：总和双,投注额：987');
INSERT INTO `flow` VALUES ('466', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:01:53', '期数：20160826013,投注详情：第5位：第0球,投注额：5');
INSERT INTO `flow` VALUES ('467', '3', '2', '900', null, null, null, null, '0', '2016-08-26 02:01:53', '期数：20160826013,投注详情：总和单,投注额：9');
INSERT INTO `flow` VALUES ('468', '3', '2', '900', null, null, null, null, '0', '2016-08-26 02:01:53', '期数：20160826013,投注详情：总和小,投注额：9');
INSERT INTO `flow` VALUES ('469', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:01:53', '期数：20160826013,投注详情：总和大,投注额：8');
INSERT INTO `flow` VALUES ('470', '3', '2', '6700', null, null, null, null, '0', '2016-08-26 02:02:09', '期数：20160826013,投注详情：中三位：豹子,投注额：67');
INSERT INTO `flow` VALUES ('471', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:02:09', '期数：20160826013,投注详情：中三位：顺子,投注额：7');
INSERT INTO `flow` VALUES ('472', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:02:09', '期数：20160826013,投注详情：中三位：对子,投注额：7');
INSERT INTO `flow` VALUES ('473', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:02:09', '期数：20160826013,投注详情：中三位：半顺,投注额：7');
INSERT INTO `flow` VALUES ('474', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:02:09', '期数：20160826013,投注详情：中三位：杂六,投注额：7');
INSERT INTO `flow` VALUES ('475', '3', '2', '400', null, null, null, null, '0', '2016-08-26 02:02:09', '期数：20160826013,投注详情：第5位：小,投注额：4');
INSERT INTO `flow` VALUES ('476', '3', '2', '4300', null, null, null, null, '0', '2016-08-26 02:02:09', '期数：20160826013,投注详情：第5位：大,投注额：43');
INSERT INTO `flow` VALUES ('477', '3', '2', '5400', null, null, null, null, '0', '2016-08-26 02:02:09', '期数：20160826013,投注详情：第5位：第9球,投注额：54');
INSERT INTO `flow` VALUES ('478', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:02:09', '期数：20160826013,投注详情：第5位：双,投注额：6');
INSERT INTO `flow` VALUES ('479', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:02:09', '期数：20160826013,投注详情：第5位：单,投注额：5');
INSERT INTO `flow` VALUES ('480', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:02:09', '期数：20160826013,投注详情：第5位：第4球,投注额：6');
INSERT INTO `flow` VALUES ('481', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:02:09', '期数：20160826013,投注详情：第5位：第3球,投注额：5');
INSERT INTO `flow` VALUES ('482', '3', '2', '5400', null, null, null, null, '0', '2016-08-26 02:02:09', '期数：20160826013,投注详情：第5位：第2球,投注额：54');
INSERT INTO `flow` VALUES ('483', '3', '2', '300', null, null, null, null, '0', '2016-08-26 02:02:09', '期数：20160826013,投注详情：第5位：第1球,投注额：3');
INSERT INTO `flow` VALUES ('484', '3', '2', '6500', null, null, null, null, '0', '2016-08-26 02:02:09', '期数：20160826013,投注详情：第5位：第8球,投注额：65');
INSERT INTO `flow` VALUES ('485', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:02:09', '期数：20160826013,投注详情：第5位：第7球,投注额：6');
INSERT INTO `flow` VALUES ('486', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:02:09', '期数：20160826013,投注详情：第5位：第6球,投注额：7');
INSERT INTO `flow` VALUES ('487', '3', '2', '6700', null, null, null, null, '0', '2016-08-26 02:02:09', '期数：20160826013,投注详情：第5位：第5球,投注额：67');
INSERT INTO `flow` VALUES ('488', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:02:09', '期数：20160826013,投注详情：和,投注额：6');
INSERT INTO `flow` VALUES ('489', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:02:09', '期数：20160826013,投注详情：虎,投注额：6');
INSERT INTO `flow` VALUES ('490', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:02:09', '期数：20160826013,投注详情：龙,投注额：7');
INSERT INTO `flow` VALUES ('491', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:02:09', '期数：20160826013,投注详情：总和双,投注额：7');
INSERT INTO `flow` VALUES ('492', '3', '2', '6700', null, null, null, null, '0', '2016-08-26 02:02:09', '期数：20160826013,投注详情：总和单,投注额：67');
INSERT INTO `flow` VALUES ('493', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:02:09', '期数：20160826013,投注详情：总和小,投注额：6');
INSERT INTO `flow` VALUES ('494', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:02:09', '期数：20160826013,投注详情：总和大,投注额：6');
INSERT INTO `flow` VALUES ('495', '3', '2', '7600', null, null, null, null, '0', '2016-08-26 02:02:26', '期数：20160826013,投注详情：后三位：对子,投注额：76');
INSERT INTO `flow` VALUES ('496', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:02:26', '期数：20160826013,投注详情：后三位：顺子,投注额：8');
INSERT INTO `flow` VALUES ('497', '3', '2', '400', null, null, null, null, '0', '2016-08-26 02:02:26', '期数：20160826013,投注详情：后三位：杂六,投注额：4');
INSERT INTO `flow` VALUES ('498', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:02:26', '期数：20160826013,投注详情：后三位：半顺,投注额：5');
INSERT INTO `flow` VALUES ('499', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:02:26', '期数：20160826013,投注详情：后三位：豹子,投注额：8');
INSERT INTO `flow` VALUES ('500', '3', '2', '300', null, null, null, null, '0', '2016-08-26 02:02:26', '期数：20160826013,投注详情：第5位：小,投注额：3');
INSERT INTO `flow` VALUES ('501', '3', '2', '300', null, null, null, null, '0', '2016-08-26 02:02:26', '期数：20160826013,投注详情：第5位：大,投注额：3');
INSERT INTO `flow` VALUES ('502', '3', '2', '400', null, null, null, null, '0', '2016-08-26 02:02:26', '期数：20160826013,投注详情：第5位：第9球,投注额：4');
INSERT INTO `flow` VALUES ('503', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:02:26', '期数：20160826013,投注详情：第5位：双,投注额：5');
INSERT INTO `flow` VALUES ('504', '3', '2', '5400', null, null, null, null, '0', '2016-08-26 02:02:26', '期数：20160826013,投注详情：第5位：单,投注额：54');
INSERT INTO `flow` VALUES ('505', '3', '2', '5600', null, null, null, null, '0', '2016-08-26 02:02:26', '期数：20160826013,投注详情：第5位：第4球,投注额：56');
INSERT INTO `flow` VALUES ('506', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:02:26', '期数：20160826013,投注详情：第5位：第3球,投注额：5');
INSERT INTO `flow` VALUES ('507', '3', '2', '400', null, null, null, null, '0', '2016-08-26 02:02:26', '期数：20160826013,投注详情：第5位：第2球,投注额：4');
INSERT INTO `flow` VALUES ('508', '3', '2', '300', null, null, null, null, '0', '2016-08-26 02:02:26', '期数：20160826013,投注详情：第5位：第1球,投注额：3');
INSERT INTO `flow` VALUES ('509', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:02:26', '期数：20160826013,投注详情：第5位：第8球,投注额：5');
INSERT INTO `flow` VALUES ('510', '3', '2', '7600', null, null, null, null, '0', '2016-08-26 02:02:26', '期数：20160826013,投注详情：第5位：第7球,投注额：76');
INSERT INTO `flow` VALUES ('511', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:02:26', '期数：20160826013,投注详情：第5位：第6球,投注额：7');
INSERT INTO `flow` VALUES ('512', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:02:26', '期数：20160826013,投注详情：第5位：第5球,投注额：7');
INSERT INTO `flow` VALUES ('513', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:02:26', '期数：20160826013,投注详情：和,投注额：8');
INSERT INTO `flow` VALUES ('514', '3', '2', '87800', null, null, null, null, '0', '2016-08-26 02:02:26', '期数：20160826013,投注详情：虎,投注额：878');
INSERT INTO `flow` VALUES ('515', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:02:26', '期数：20160826013,投注详情：龙,投注额：7');
INSERT INTO `flow` VALUES ('516', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:02:26', '期数：20160826013,投注详情：总和双,投注额：7');
INSERT INTO `flow` VALUES ('517', '3', '2', '200', null, null, null, null, '0', '2016-08-26 02:02:26', '期数：20160826013,投注详情：第5位：第0球,投注额：2');
INSERT INTO `flow` VALUES ('518', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:02:26', '期数：20160826013,投注详情：总和单,投注额：7');
INSERT INTO `flow` VALUES ('519', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:02:26', '期数：20160826013,投注详情：总和小,投注额：6');
INSERT INTO `flow` VALUES ('520', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:02:26', '期数：20160826013,投注详情：总和大,投注额：6');
INSERT INTO `flow` VALUES ('521', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:02:55', '期数：20160826013,投注详情：中三位：顺子,投注额：6');
INSERT INTO `flow` VALUES ('522', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:02:55', '期数：20160826013,投注详情：中三位：对子,投注额：6');
INSERT INTO `flow` VALUES ('523', '3', '2', '67700', null, null, null, null, '0', '2016-08-26 02:02:55', '期数：20160826013,投注详情：中三位：半顺,投注额：677');
INSERT INTO `flow` VALUES ('524', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:02:55', '期数：20160826013,投注详情：中三位：杂六,投注额：7');
INSERT INTO `flow` VALUES ('525', '3', '2', '5400', null, null, null, null, '0', '2016-08-26 02:02:55', '期数：20160826013,投注详情：第5位：小,投注额：54');
INSERT INTO `flow` VALUES ('526', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:02:55', '期数：20160826013,投注详情：第5位：大,投注额：5');
INSERT INTO `flow` VALUES ('527', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:02:55', '期数：20160826013,投注详情：第5位：第9球,投注额：5');
INSERT INTO `flow` VALUES ('528', '3', '2', '6700', null, null, null, null, '0', '2016-08-26 02:02:55', '期数：20160826013,投注详情：第5位：双,投注额：67');
INSERT INTO `flow` VALUES ('529', '3', '2', '5600', null, null, null, null, '0', '2016-08-26 02:02:55', '期数：20160826013,投注详情：第5位：单,投注额：56');
INSERT INTO `flow` VALUES ('530', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:02:55', '期数：20160826013,投注详情：第5位：第4球,投注额：8');
INSERT INTO `flow` VALUES ('531', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:02:55', '期数：20160826013,投注详情：第5位：第3球,投注额：8');
INSERT INTO `flow` VALUES ('532', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:02:55', '期数：20160826013,投注详情：第5位：第2球,投注额：7');
INSERT INTO `flow` VALUES ('533', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:02:55', '期数：20160826013,投注详情：第5位：第1球,投注额：7');
INSERT INTO `flow` VALUES ('534', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:02:55', '期数：20160826013,投注详情：第5位：第8球,投注额：6');
INSERT INTO `flow` VALUES ('535', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:02:55', '期数：20160826013,投注详情：第5位：第7球,投注额：7');
INSERT INTO `flow` VALUES ('536', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:02:55', '期数：20160826013,投注详情：第5位：第6球,投注额：7');
INSERT INTO `flow` VALUES ('537', '3', '2', '9900', null, null, null, null, '0', '2016-08-26 02:02:55', '期数：20160826013,投注详情：第5位：第5球,投注额：99');
INSERT INTO `flow` VALUES ('538', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:02:55', '期数：20160826013,投注详情：和,投注额：5');
INSERT INTO `flow` VALUES ('539', '3', '2', '400', null, null, null, null, '0', '2016-08-26 02:02:55', '期数：20160826013,投注详情：虎,投注额：4');
INSERT INTO `flow` VALUES ('540', '3', '2', '6500', null, null, null, null, '0', '2016-08-26 02:02:55', '期数：20160826013,投注详情：龙,投注额：65');
INSERT INTO `flow` VALUES ('541', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:02:55', '期数：20160826013,投注详情：总和双,投注额：7');
INSERT INTO `flow` VALUES ('542', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:02:55', '期数：20160826013,投注详情：第5位：第0球,投注额：6');
INSERT INTO `flow` VALUES ('543', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:02:55', '期数：20160826013,投注详情：总和单,投注额：7');
INSERT INTO `flow` VALUES ('544', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:02:55', '期数：20160826013,投注详情：总和小,投注额：7');
INSERT INTO `flow` VALUES ('545', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:02:55', '期数：20160826013,投注详情：总和大,投注额：7');
INSERT INTO `flow` VALUES ('546', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:03:18', '期数：20160826013,投注详情：中三位：豹子,投注额：7');
INSERT INTO `flow` VALUES ('547', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:03:18', '期数：20160826013,投注详情：中三位：顺子,投注额：8');
INSERT INTO `flow` VALUES ('548', '3', '2', '8900', null, null, null, null, '0', '2016-08-26 02:03:18', '期数：20160826013,投注详情：中三位：对子,投注额：89');
INSERT INTO `flow` VALUES ('549', '3', '2', '900', null, null, null, null, '0', '2016-08-26 02:03:18', '期数：20160826013,投注详情：中三位：半顺,投注额：9');
INSERT INTO `flow` VALUES ('550', '3', '2', '9700', null, null, null, null, '0', '2016-08-26 02:03:18', '期数：20160826013,投注详情：中三位：杂六,投注额：97');
INSERT INTO `flow` VALUES ('551', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:03:18', '期数：20160826013,投注详情：第5位：小,投注额：5');
INSERT INTO `flow` VALUES ('552', '3', '2', '400', null, null, null, null, '0', '2016-08-26 02:03:18', '期数：20160826013,投注详情：第5位：大,投注额：4');
INSERT INTO `flow` VALUES ('553', '3', '2', '300', null, null, null, null, '0', '2016-08-26 02:03:18', '期数：20160826013,投注详情：第5位：第9球,投注额：3');
INSERT INTO `flow` VALUES ('554', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:03:18', '期数：20160826013,投注详情：第5位：双,投注额：8');
INSERT INTO `flow` VALUES ('555', '3', '2', '6700', null, null, null, null, '0', '2016-08-26 02:03:18', '期数：20160826013,投注详情：第5位：单,投注额：67');
INSERT INTO `flow` VALUES ('556', '3', '2', '8800', null, null, null, null, '0', '2016-08-26 02:03:18', '期数：20160826013,投注详情：第5位：第4球,投注额：88');
INSERT INTO `flow` VALUES ('557', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:03:18', '期数：20160826013,投注详情：第5位：第3球,投注额：7');
INSERT INTO `flow` VALUES ('558', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:03:18', '期数：20160826013,投注详情：第5位：第2球,投注额：7');
INSERT INTO `flow` VALUES ('559', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:03:18', '期数：20160826013,投注详情：第5位：第1球,投注额：6');
INSERT INTO `flow` VALUES ('560', '3', '2', '5400', null, null, null, null, '0', '2016-08-26 02:03:18', '期数：20160826013,投注详情：第5位：第8球,投注额：54');
INSERT INTO `flow` VALUES ('561', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:03:18', '期数：20160826013,投注详情：第5位：第7球,投注额：6');
INSERT INTO `flow` VALUES ('562', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:03:18', '期数：20160826013,投注详情：第5位：第6球,投注额：7');
INSERT INTO `flow` VALUES ('563', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:03:18', '期数：20160826013,投注详情：第5位：第5球,投注额：8');
INSERT INTO `flow` VALUES ('564', '3', '2', '66700', null, null, null, null, '0', '2016-08-26 02:03:18', '期数：20160826013,投注详情：和,投注额：667');
INSERT INTO `flow` VALUES ('565', '3', '2', '400', null, null, null, null, '0', '2016-08-26 02:03:18', '期数：20160826013,投注详情：虎,投注额：4');
INSERT INTO `flow` VALUES ('566', '3', '2', '4300', null, null, null, null, '0', '2016-08-26 02:03:18', '期数：20160826013,投注详情：龙,投注额：43');
INSERT INTO `flow` VALUES ('567', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:03:18', '期数：20160826013,投注详情：总和双,投注额：6');
INSERT INTO `flow` VALUES ('568', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:03:18', '期数：20160826013,投注详情：第5位：第0球,投注额：6');
INSERT INTO `flow` VALUES ('569', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:03:18', '期数：20160826013,投注详情：总和单,投注额：7');
INSERT INTO `flow` VALUES ('570', '3', '2', '900', null, null, null, null, '0', '2016-08-26 02:03:18', '期数：20160826013,投注详情：总和小,投注额：9');
INSERT INTO `flow` VALUES ('571', '3', '2', '89900', null, null, null, null, '0', '2016-08-26 02:03:18', '期数：20160826013,投注详情：总和大,投注额：899');
INSERT INTO `flow` VALUES ('572', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:03:35', '期数：20160826013,投注详情：中三位：豹子,投注额：8');
INSERT INTO `flow` VALUES ('573', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:03:35', '期数：20160826013,投注详情：中三位：顺子,投注额：8');
INSERT INTO `flow` VALUES ('574', '3', '2', '7500', null, null, null, null, '0', '2016-08-26 02:03:35', '期数：20160826013,投注详情：中三位：对子,投注额：75');
INSERT INTO `flow` VALUES ('575', '3', '2', '400', null, null, null, null, '0', '2016-08-26 02:03:35', '期数：20160826013,投注详情：中三位：半顺,投注额：4');
INSERT INTO `flow` VALUES ('576', '3', '2', '300', null, null, null, null, '0', '2016-08-26 02:03:35', '期数：20160826013,投注详情：中三位：杂六,投注额：3');
INSERT INTO `flow` VALUES ('577', '3', '2', '87800', null, null, null, null, '0', '2016-08-26 02:03:35', '期数：20160826013,投注详情：第5位：小,投注额：878');
INSERT INTO `flow` VALUES ('578', '3', '2', '7700', null, null, null, null, '0', '2016-08-26 02:03:35', '期数：20160826013,投注详情：第5位：大,投注额：77');
INSERT INTO `flow` VALUES ('579', '3', '2', '5600', null, null, null, null, '0', '2016-08-26 02:03:35', '期数：20160826013,投注详情：第5位：第9球,投注额：56');
INSERT INTO `flow` VALUES ('580', '3', '2', '900', null, null, null, null, '0', '2016-08-26 02:03:35', '期数：20160826013,投注详情：第5位：双,投注额：9');
INSERT INTO `flow` VALUES ('581', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:03:35', '期数：20160826013,投注详情：第5位：单,投注额：8');
INSERT INTO `flow` VALUES ('582', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:03:35', '期数：20160826013,投注详情：第5位：第4球,投注额：8');
INSERT INTO `flow` VALUES ('583', '3', '2', '7800', null, null, null, null, '0', '2016-08-26 02:03:35', '期数：20160826013,投注详情：第5位：第3球,投注额：78');
INSERT INTO `flow` VALUES ('584', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:03:35', '期数：20160826013,投注详情：第5位：第2球,投注额：6');
INSERT INTO `flow` VALUES ('585', '3', '2', '4500', null, null, null, null, '0', '2016-08-26 02:03:35', '期数：20160826013,投注详情：第5位：第1球,投注额：45');
INSERT INTO `flow` VALUES ('586', '3', '2', '400', null, null, null, null, '0', '2016-08-26 02:03:35', '期数：20160826013,投注详情：第5位：第8球,投注额：4');
INSERT INTO `flow` VALUES ('587', '3', '2', '3300', null, null, null, null, '0', '2016-08-26 02:03:35', '期数：20160826013,投注详情：第5位：第7球,投注额：33');
INSERT INTO `flow` VALUES ('588', '3', '2', '5400', null, null, null, null, '0', '2016-08-26 02:03:35', '期数：20160826013,投注详情：第5位：第6球,投注额：54');
INSERT INTO `flow` VALUES ('589', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:03:35', '期数：20160826013,投注详情：第5位：第5球,投注额：7');
INSERT INTO `flow` VALUES ('590', '3', '2', '7700', null, null, null, null, '0', '2016-08-26 02:03:35', '期数：20160826013,投注详情：和,投注额：77');
INSERT INTO `flow` VALUES ('591', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:03:35', '期数：20160826013,投注详情：虎,投注额：6');
INSERT INTO `flow` VALUES ('592', '3', '2', '400', null, null, null, null, '0', '2016-08-26 02:03:35', '期数：20160826013,投注详情：龙,投注额：4');
INSERT INTO `flow` VALUES ('593', '3', '2', '3300', null, null, null, null, '0', '2016-08-26 02:03:35', '期数：20160826013,投注详情：总和双,投注额：33');
INSERT INTO `flow` VALUES ('594', '3', '2', '3200', null, null, null, null, '0', '2016-08-26 02:03:35', '期数：20160826013,投注详情：第5位：第0球,投注额：32');
INSERT INTO `flow` VALUES ('595', '3', '2', '400', null, null, null, null, '0', '2016-08-26 02:03:35', '期数：20160826013,投注详情：总和单,投注额：4');
INSERT INTO `flow` VALUES ('596', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:03:35', '期数：20160826013,投注详情：总和小,投注额：6');
INSERT INTO `flow` VALUES ('597', '3', '2', '8700', null, null, null, null, '0', '2016-08-26 02:03:35', '期数：20160826013,投注详情：总和大,投注额：87');
INSERT INTO `flow` VALUES ('598', '3', '2', '7700', null, null, null, null, '0', '2016-08-26 02:03:51', '期数：20160826013,投注详情：中三位：豹子,投注额：77');
INSERT INTO `flow` VALUES ('599', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:03:51', '期数：20160826013,投注详情：中三位：顺子,投注额：6');
INSERT INTO `flow` VALUES ('600', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:03:51', '期数：20160826013,投注详情：中三位：对子,投注额：6');
INSERT INTO `flow` VALUES ('601', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:03:51', '期数：20160826013,投注详情：中三位：半顺,投注额：6');
INSERT INTO `flow` VALUES ('602', '3', '2', '7800', null, null, null, null, '0', '2016-08-26 02:03:51', '期数：20160826013,投注详情：中三位：杂六,投注额：78');
INSERT INTO `flow` VALUES ('603', '3', '2', '6500', null, null, null, null, '0', '2016-08-26 02:03:51', '期数：20160826013,投注详情：第2位：第1球,投注额：65');
INSERT INTO `flow` VALUES ('604', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:03:51', '期数：20160826013,投注详情：第2位：第2球,投注额：6');
INSERT INTO `flow` VALUES ('605', '3', '2', '7700', null, null, null, null, '0', '2016-08-26 02:03:51', '期数：20160826013,投注详情：第2位：第3球,投注额：77');
INSERT INTO `flow` VALUES ('606', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:03:51', '期数：20160826013,投注详情：第2位：第8球,投注额：7');
INSERT INTO `flow` VALUES ('607', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:03:51', '期数：20160826013,投注详情：第2位：第4球,投注额：7');
INSERT INTO `flow` VALUES ('608', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:03:51', '期数：20160826013,投注详情：第2位：第5球,投注额：6');
INSERT INTO `flow` VALUES ('609', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:03:51', '期数：20160826013,投注详情：第2位：第6球,投注额：5');
INSERT INTO `flow` VALUES ('610', '3', '2', '45600', null, null, null, null, '0', '2016-08-26 02:03:51', '期数：20160826013,投注详情：第2位：第7球,投注额：456');
INSERT INTO `flow` VALUES ('611', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:03:51', '期数：20160826013,投注详情：第2位：单,投注额：5');
INSERT INTO `flow` VALUES ('612', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:03:51', '期数：20160826013,投注详情：第2位：小,投注额：5');
INSERT INTO `flow` VALUES ('613', '3', '2', '7700', null, null, null, null, '0', '2016-08-26 02:03:51', '期数：20160826013,投注详情：第2位：大,投注额：77');
INSERT INTO `flow` VALUES ('614', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:03:51', '期数：20160826013,投注详情：第2位：第9球,投注额：7');
INSERT INTO `flow` VALUES ('615', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:03:51', '期数：20160826013,投注详情：和,投注额：6');
INSERT INTO `flow` VALUES ('616', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:03:51', '期数：20160826013,投注详情：虎,投注额：5');
INSERT INTO `flow` VALUES ('617', '3', '2', '87600', null, null, null, null, '0', '2016-08-26 02:03:51', '期数：20160826013,投注详情：龙,投注额：876');
INSERT INTO `flow` VALUES ('618', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:03:51', '期数：20160826013,投注详情：总和双,投注额：8');
INSERT INTO `flow` VALUES ('619', '3', '2', '7800', null, null, null, null, '0', '2016-08-26 02:03:51', '期数：20160826013,投注详情：总和单,投注额：78');
INSERT INTO `flow` VALUES ('620', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:03:51', '期数：20160826013,投注详情：总和小,投注额：7');
INSERT INTO `flow` VALUES ('621', '3', '2', '5600', null, null, null, null, '0', '2016-08-26 02:03:51', '期数：20160826013,投注详情：总和大,投注额：56');
INSERT INTO `flow` VALUES ('622', '3', '2', '400', null, null, null, null, '0', '2016-08-26 02:03:51', '期数：20160826013,投注详情：第2位：双,投注额：4');
INSERT INTO `flow` VALUES ('623', '3', '2', '6700', null, null, null, null, '0', '2016-08-26 02:04:08', '期数：20160826013,投注详情：中三位：豹子,投注额：67');
INSERT INTO `flow` VALUES ('624', '3', '2', '7800', null, null, null, null, '0', '2016-08-26 02:04:08', '期数：20160826013,投注详情：中三位：顺子,投注额：78');
INSERT INTO `flow` VALUES ('625', '3', '2', '8800', null, null, null, null, '0', '2016-08-26 02:04:08', '期数：20160826013,投注详情：中三位：对子,投注额：88');
INSERT INTO `flow` VALUES ('626', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:04:08', '期数：20160826013,投注详情：中三位：半顺,投注额：6');
INSERT INTO `flow` VALUES ('627', '3', '2', '7800', null, null, null, null, '0', '2016-08-26 02:04:08', '期数：20160826013,投注详情：中三位：杂六,投注额：78');
INSERT INTO `flow` VALUES ('628', '3', '2', '200', null, null, null, null, '0', '2016-08-26 02:04:08', '期数：20160826013,投注详情：第2位：第0球,投注额：2');
INSERT INTO `flow` VALUES ('629', '3', '2', '300', null, null, null, null, '0', '2016-08-26 02:04:08', '期数：20160826013,投注详情：第2位：第1球,投注额：3');
INSERT INTO `flow` VALUES ('630', '3', '2', '5500', null, null, null, null, '0', '2016-08-26 02:04:08', '期数：20160826013,投注详情：第2位：第2球,投注额：55');
INSERT INTO `flow` VALUES ('631', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:04:08', '期数：20160826013,投注详情：第2位：第3球,投注额：5');
INSERT INTO `flow` VALUES ('632', '3', '2', '8900', null, null, null, null, '0', '2016-08-26 02:04:08', '期数：20160826013,投注详情：第2位：第8球,投注额：89');
INSERT INTO `flow` VALUES ('633', '3', '2', '400', null, null, null, null, '0', '2016-08-26 02:04:08', '期数：20160826013,投注详情：第2位：第4球,投注额：4');
INSERT INTO `flow` VALUES ('634', '3', '2', '3500', null, null, null, null, '0', '2016-08-26 02:04:08', '期数：20160826013,投注详情：第2位：第5球,投注额：35');
INSERT INTO `flow` VALUES ('635', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:04:08', '期数：20160826013,投注详情：第2位：第7球,投注额：7');
INSERT INTO `flow` VALUES ('636', '3', '2', '4400', null, null, null, null, '0', '2016-08-26 02:04:08', '期数：20160826013,投注详情：第2位：单,投注额：44');
INSERT INTO `flow` VALUES ('637', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:04:08', '期数：20160826013,投注详情：第2位：小,投注额：5');
INSERT INTO `flow` VALUES ('638', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:04:08', '期数：20160826013,投注详情：第2位：大,投注额：7');
INSERT INTO `flow` VALUES ('639', '3', '2', '9800', null, null, null, null, '0', '2016-08-26 02:04:08', '期数：20160826013,投注详情：第2位：第9球,投注额：98');
INSERT INTO `flow` VALUES ('640', '3', '2', '400', null, null, null, null, '0', '2016-08-26 02:04:08', '期数：20160826013,投注详情：和,投注额：4');
INSERT INTO `flow` VALUES ('641', '3', '2', '300', null, null, null, null, '0', '2016-08-26 02:04:08', '期数：20160826013,投注详情：虎,投注额：3');
INSERT INTO `flow` VALUES ('642', '3', '2', '5300', null, null, null, null, '0', '2016-08-26 02:04:08', '期数：20160826013,投注详情：龙,投注额：53');
INSERT INTO `flow` VALUES ('643', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:04:08', '期数：20160826013,投注详情：总和双,投注额：7');
INSERT INTO `flow` VALUES ('644', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:04:08', '期数：20160826013,投注详情：总和单,投注额：8');
INSERT INTO `flow` VALUES ('645', '3', '2', '8800', null, null, null, null, '0', '2016-08-26 02:04:08', '期数：20160826013,投注详情：总和小,投注额：88');
INSERT INTO `flow` VALUES ('646', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:04:08', '期数：20160826013,投注详情：总和大,投注额：6');
INSERT INTO `flow` VALUES ('647', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:04:08', '期数：20160826013,投注详情：第2位：双,投注额：5');
INSERT INTO `flow` VALUES ('648', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:04:24', '期数：20160826013,投注详情：中三位：豹子,投注额：5');
INSERT INTO `flow` VALUES ('649', '3', '2', '4400', null, null, null, null, '0', '2016-08-26 02:04:24', '期数：20160826013,投注详情：中三位：顺子,投注额：44');
INSERT INTO `flow` VALUES ('650', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:04:24', '期数：20160826013,投注详情：中三位：对子,投注额：5');
INSERT INTO `flow` VALUES ('651', '3', '2', '6700', null, null, null, null, '0', '2016-08-26 02:04:24', '期数：20160826013,投注详情：中三位：半顺,投注额：67');
INSERT INTO `flow` VALUES ('652', '3', '2', '9800', null, null, null, null, '0', '2016-08-26 02:04:24', '期数：20160826013,投注详情：中三位：杂六,投注额：98');
INSERT INTO `flow` VALUES ('653', '3', '2', '400', null, null, null, null, '0', '2016-08-26 02:04:24', '期数：20160826013,投注详情：第2位：第0球,投注额：4');
INSERT INTO `flow` VALUES ('654', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:04:24', '期数：20160826013,投注详情：第2位：第1球,投注额：5');
INSERT INTO `flow` VALUES ('655', '3', '2', '6700', null, null, null, null, '0', '2016-08-26 02:04:24', '期数：20160826013,投注详情：第2位：第2球,投注额：67');
INSERT INTO `flow` VALUES ('656', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:04:24', '期数：20160826013,投注详情：第2位：第3球,投注额：7');
INSERT INTO `flow` VALUES ('657', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:04:24', '期数：20160826013,投注详情：第2位：第8球,投注额：7');
INSERT INTO `flow` VALUES ('658', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:04:24', '期数：20160826013,投注详情：第2位：第4球,投注额：7');
INSERT INTO `flow` VALUES ('659', '3', '2', '6500', null, null, null, null, '0', '2016-08-26 02:04:24', '期数：20160826013,投注详情：第2位：第5球,投注额：65');
INSERT INTO `flow` VALUES ('660', '3', '2', '300', null, null, null, null, '0', '2016-08-26 02:04:24', '期数：20160826013,投注详情：第2位：第6球,投注额：3');
INSERT INTO `flow` VALUES ('661', '3', '2', '3500', null, null, null, null, '0', '2016-08-26 02:04:24', '期数：20160826013,投注详情：第2位：第7球,投注额：35');
INSERT INTO `flow` VALUES ('662', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:04:24', '期数：20160826013,投注详情：第2位：单,投注额：7');
INSERT INTO `flow` VALUES ('663', '3', '2', '9800', null, null, null, null, '0', '2016-08-26 02:04:24', '期数：20160826013,投注详情：第2位：小,投注额：98');
INSERT INTO `flow` VALUES ('664', '3', '2', '8900', null, null, null, null, '0', '2016-08-26 02:04:24', '期数：20160826013,投注详情：第2位：大,投注额：89');
INSERT INTO `flow` VALUES ('665', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:04:24', '期数：20160826013,投注详情：第2位：第9球,投注额：8');
INSERT INTO `flow` VALUES ('666', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:04:24', '期数：20160826013,投注详情：和,投注额：6');
INSERT INTO `flow` VALUES ('667', '3', '2', '8700', null, null, null, null, '0', '2016-08-26 02:04:24', '期数：20160826013,投注详情：虎,投注额：87');
INSERT INTO `flow` VALUES ('668', '3', '2', '9900', null, null, null, null, '0', '2016-08-26 02:04:24', '期数：20160826013,投注详情：龙,投注额：99');
INSERT INTO `flow` VALUES ('669', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:04:24', '期数：20160826013,投注详情：总和双,投注额：8');
INSERT INTO `flow` VALUES ('670', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:04:24', '期数：20160826013,投注详情：总和单,投注额：7');
INSERT INTO `flow` VALUES ('671', '3', '2', '4600', null, null, null, null, '0', '2016-08-26 02:04:24', '期数：20160826013,投注详情：总和小,投注额：46');
INSERT INTO `flow` VALUES ('672', '3', '2', '400', null, null, null, null, '0', '2016-08-26 02:04:24', '期数：20160826013,投注详情：总和大,投注额：4');
INSERT INTO `flow` VALUES ('673', '3', '2', '6500', null, null, null, null, '0', '2016-08-26 02:04:24', '期数：20160826013,投注详情：第2位：双,投注额：65');
INSERT INTO `flow` VALUES ('674', '3', '2', '6700', null, null, null, null, '0', '2016-08-26 02:04:43', '期数：20160826013,投注详情：中三位：豹子,投注额：67');
INSERT INTO `flow` VALUES ('675', '3', '2', '7600', null, null, null, null, '0', '2016-08-26 02:04:43', '期数：20160826013,投注详情：中三位：顺子,投注额：76');
INSERT INTO `flow` VALUES ('676', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:04:43', '期数：20160826013,投注详情：中三位：对子,投注额：5');
INSERT INTO `flow` VALUES ('677', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:04:43', '期数：20160826013,投注详情：中三位：半顺,投注额：8');
INSERT INTO `flow` VALUES ('678', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:04:43', '期数：20160826013,投注详情：中三位：杂六,投注额：8');
INSERT INTO `flow` VALUES ('679', '3', '2', '800', null, null, null, null, '0', '2016-08-26 02:04:43', '期数：20160826013,投注详情：第3位：第2球,投注额：8');
INSERT INTO `flow` VALUES ('680', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:04:43', '期数：20160826013,投注详情：第3位：第1球,投注额：7');
INSERT INTO `flow` VALUES ('681', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:04:43', '期数：20160826013,投注详情：第3位：第0球,投注额：5');
INSERT INTO `flow` VALUES ('682', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:04:43', '期数：20160826013,投注详情：第3位：第6球,投注额：5');
INSERT INTO `flow` VALUES ('683', '3', '2', '55400', null, null, null, null, '0', '2016-08-26 02:04:43', '期数：20160826013,投注详情：第3位：第5球,投注额：554');
INSERT INTO `flow` VALUES ('684', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:04:43', '期数：20160826013,投注详情：第3位：第4球,投注额：6');
INSERT INTO `flow` VALUES ('685', '3', '2', '8700', null, null, null, null, '0', '2016-08-26 02:04:43', '期数：20160826013,投注详情：第3位：第3球,投注额：87');
INSERT INTO `flow` VALUES ('686', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:04:43', '期数：20160826013,投注详情：第3位：第8球,投注额：7');
INSERT INTO `flow` VALUES ('687', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:04:43', '期数：20160826013,投注详情：第3位：第7球,投注额：6');
INSERT INTO `flow` VALUES ('688', '3', '2', '7700', null, null, null, null, '0', '2016-08-26 02:04:43', '期数：20160826013,投注详情：第3位：第9球,投注额：77');
INSERT INTO `flow` VALUES ('689', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:04:43', '期数：20160826013,投注详情：第3位：单,投注额：5');
INSERT INTO `flow` VALUES ('690', '3', '2', '66700', null, null, null, null, '0', '2016-08-26 02:04:43', '期数：20160826013,投注详情：第3位：双,投注额：667');
INSERT INTO `flow` VALUES ('691', '3', '2', '6500', null, null, null, null, '0', '2016-08-26 02:04:43', '期数：20160826013,投注详情：第3位：大,投注额：65');
INSERT INTO `flow` VALUES ('692', '3', '2', '500', null, null, null, null, '0', '2016-08-26 02:04:43', '期数：20160826013,投注详情：第3位：小,投注额：5');
INSERT INTO `flow` VALUES ('693', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:04:43', '期数：20160826013,投注详情：和,投注额：6');
INSERT INTO `flow` VALUES ('694', '3', '2', '5600', null, null, null, null, '0', '2016-08-26 02:04:43', '期数：20160826013,投注详情：虎,投注额：56');
INSERT INTO `flow` VALUES ('695', '3', '2', '5400', null, null, null, null, '0', '2016-08-26 02:04:43', '期数：20160826013,投注详情：龙,投注额：54');
INSERT INTO `flow` VALUES ('696', '3', '2', '600', null, null, null, null, '0', '2016-08-26 02:04:43', '期数：20160826013,投注详情：总和双,投注额：6');
INSERT INTO `flow` VALUES ('697', '3', '2', '700', null, null, null, null, '0', '2016-08-26 02:04:43', '期数：20160826013,投注详情：总和单,投注额：7');
INSERT INTO `flow` VALUES ('698', '3', '2', '7700', null, null, null, null, '0', '2016-08-26 02:04:43', '期数：20160826013,投注详情：总和小,投注额：77');
INSERT INTO `flow` VALUES ('699', '3', '2', '6700', null, null, null, null, '0', '2016-08-26 02:04:43', '期数：20160826013,投注详情：总和大,投注额：67');
INSERT INTO `flow` VALUES ('700', '3', '2', '900', null, null, null, null, '0', '2016-08-26 02:04:52', '期数：20160826013,投注详情：第3位：第2球,投注额：9');
INSERT INTO `flow` VALUES ('701', '3', '2', '9800', null, null, null, null, '0', '2016-08-26 02:04:52', '期数：20160826013,投注详情：第3位：第1球,投注额：98');
INSERT INTO `flow` VALUES ('702', '3', '2', '9900', null, null, null, null, '0', '2016-08-26 02:04:52', '期数：20160826013,投注详情：第3位：第3球,投注额：99');
INSERT INTO `flow` VALUES ('703', '3', '3', '5083', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：前三位：杂六,投注额：50.83');
INSERT INTO `flow` VALUES ('704', '3', '3', '31360', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第1位：第4球,投注额：313.6');
INSERT INTO `flow` VALUES ('705', '3', '3', '6732', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第1位：小,投注额：67.32');
INSERT INTO `flow` VALUES ('706', '3', '3', '0', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：和,投注额：0.0');
INSERT INTO `flow` VALUES ('707', '3', '3', '2376', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：总和单,投注额：23.76');
INSERT INTO `flow` VALUES ('708', '3', '3', '591', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：总和小,投注额：5.91');
INSERT INTO `flow` VALUES ('709', '3', '3', '4554', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第1位：双,投注额：45.54');
INSERT INTO `flow` VALUES ('710', '3', '3', '5083', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：前三位：杂六,投注额：50.83');
INSERT INTO `flow` VALUES ('711', '3', '3', '2940', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第1位：第4球,投注额：29.4');
INSERT INTO `flow` VALUES ('712', '3', '3', '1188', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第1位：小,投注额：11.88');
INSERT INTO `flow` VALUES ('713', '3', '3', '0', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：和,投注额：0.0');
INSERT INTO `flow` VALUES ('714', '3', '3', '396', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：总和单,投注额：3.96');
INSERT INTO `flow` VALUES ('715', '3', '3', '2364', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：总和小,投注额：23.64');
INSERT INTO `flow` VALUES ('716', '3', '3', '396', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第1位：双,投注额：3.96');
INSERT INTO `flow` VALUES ('717', '3', '3', '980', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第2位：第2球,投注额：9.8');
INSERT INTO `flow` VALUES ('718', '3', '3', '792', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第2位：小,投注额：7.92');
INSERT INTO `flow` VALUES ('719', '3', '3', '990', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第2位：双,投注额：9.9');
INSERT INTO `flow` VALUES ('720', '3', '3', '3920', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第2位：第2球,投注额：39.2');
INSERT INTO `flow` VALUES ('721', '3', '3', '396', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第2位：小,投注额：3.96');
INSERT INTO `flow` VALUES ('722', '3', '3', '792', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第2位：双,投注额：7.92');
INSERT INTO `flow` VALUES ('723', '3', '3', '1960', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第2位：第2球,投注额：19.6');
INSERT INTO `flow` VALUES ('724', '3', '3', '792', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第2位：小,投注额：7.92');
INSERT INTO `flow` VALUES ('725', '3', '3', '12870', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：总和单,投注额：128.7');
INSERT INTO `flow` VALUES ('726', '3', '3', '1379', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：总和小,投注额：13.79');
INSERT INTO `flow` VALUES ('727', '3', '3', '990', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第2位：双,投注额：9.9');
INSERT INTO `flow` VALUES ('728', '3', '3', '221', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：前三位：杂六,投注额：2.21');
INSERT INTO `flow` VALUES ('729', '3', '3', '6860', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第2位：第2球,投注额：68.6');
INSERT INTO `flow` VALUES ('730', '3', '3', '10692', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第2位：小,投注额：106.92');
INSERT INTO `flow` VALUES ('731', '3', '3', '0', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：和,投注额：0.0');
INSERT INTO `flow` VALUES ('732', '3', '3', '1386', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：总和单,投注额：13.86');
INSERT INTO `flow` VALUES ('733', '3', '3', '1182', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：总和小,投注额：11.82');
INSERT INTO `flow` VALUES ('734', '3', '3', '792', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第2位：双,投注额：7.92');
INSERT INTO `flow` VALUES ('735', '3', '3', '1105', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：前三位：杂六,投注额：11.05');
INSERT INTO `flow` VALUES ('736', '3', '3', '4900', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第3位：第7球,投注额：49.0');
INSERT INTO `flow` VALUES ('737', '3', '3', '1188', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第3位：单,投注额：11.88');
INSERT INTO `flow` VALUES ('738', '3', '3', '1188', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第3位：大,投注额：11.88');
INSERT INTO `flow` VALUES ('739', '3', '3', '0', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：和,投注额：0.0');
INSERT INTO `flow` VALUES ('740', '3', '3', '990', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：总和单,投注额：9.9');
INSERT INTO `flow` VALUES ('741', '3', '3', '1379', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：总和小,投注额：13.79');
INSERT INTO `flow` VALUES ('742', '3', '3', '1105', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：前三位：杂六,投注额：11.05');
INSERT INTO `flow` VALUES ('743', '3', '3', '8820', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第3位：第7球,投注额：88.2');
INSERT INTO `flow` VALUES ('744', '3', '3', '1782', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第3位：单,投注额：17.82');
INSERT INTO `flow` VALUES ('745', '3', '3', '15048', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第3位：大,投注额：150.48');
INSERT INTO `flow` VALUES ('746', '3', '3', '0', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：和,投注额：0.0');
INSERT INTO `flow` VALUES ('747', '3', '3', '1188', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：总和单,投注额：11.88');
INSERT INTO `flow` VALUES ('748', '3', '3', '11032', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：总和小,投注额：110.32');
INSERT INTO `flow` VALUES ('749', '3', '3', '442', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：前三位：杂六,投注额：4.42');
INSERT INTO `flow` VALUES ('750', '3', '3', '6860', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第3位：第7球,投注额：68.6');
INSERT INTO `flow` VALUES ('751', '3', '3', '1386', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第3位：单,投注额：13.86');
INSERT INTO `flow` VALUES ('752', '3', '3', '1188', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第3位：大,投注额：11.88');
INSERT INTO `flow` VALUES ('753', '3', '3', '0', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：和,投注额：0.0');
INSERT INTO `flow` VALUES ('754', '3', '3', '990', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：总和单,投注额：9.9');
INSERT INTO `flow` VALUES ('755', '3', '3', '1182', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：总和小,投注额：11.82');
INSERT INTO `flow` VALUES ('756', '3', '3', '1547', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：前三位：杂六,投注额：15.47');
INSERT INTO `flow` VALUES ('757', '3', '3', '5880', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第3位：第7球,投注额：58.8');
INSERT INTO `flow` VALUES ('758', '3', '3', '1386', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第3位：单,投注额：13.86');
INSERT INTO `flow` VALUES ('759', '3', '3', '17226', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第3位：大,投注额：172.26');
INSERT INTO `flow` VALUES ('760', '3', '3', '0', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：和,投注额：0.0');
INSERT INTO `flow` VALUES ('761', '3', '3', '1584', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：总和单,投注额：15.84');
INSERT INTO `flow` VALUES ('762', '3', '3', '17139', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：总和小,投注额：171.39');
INSERT INTO `flow` VALUES ('763', '3', '3', '1547', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：前三位：杂六,投注额：15.47');
INSERT INTO `flow` VALUES ('764', '3', '3', '7840', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第3位：第7球,投注额：78.4');
INSERT INTO `flow` VALUES ('765', '3', '3', '1584', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第3位：单,投注额：15.84');
INSERT INTO `flow` VALUES ('766', '3', '3', '1188', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第3位：大,投注额：11.88');
INSERT INTO `flow` VALUES ('767', '3', '3', '0', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：和,投注额：0.0');
INSERT INTO `flow` VALUES ('768', '3', '3', '1386', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：总和单,投注额：13.86');
INSERT INTO `flow` VALUES ('769', '3', '3', '985', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：总和小,投注额：9.85');
INSERT INTO `flow` VALUES ('770', '3', '3', '1326', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：前三位：杂六,投注额：13.26');
INSERT INTO `flow` VALUES ('771', '3', '3', '6860', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第3位：第7球,投注额：68.6');
INSERT INTO `flow` VALUES ('772', '3', '3', '1188', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第3位：单,投注额：11.88');
INSERT INTO `flow` VALUES ('773', '3', '3', '1386', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：第3位：大,投注额：13.86');
INSERT INTO `flow` VALUES ('774', '3', '3', '0', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：和,投注额：0.0');
INSERT INTO `flow` VALUES ('775', '3', '3', '1188', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：总和单,投注额：11.88');
INSERT INTO `flow` VALUES ('776', '3', '3', '985', null, null, null, null, '1', '2016-08-26 02:08:26', '期数：20160826013,开奖号码：42704,投注详情：总和小,投注额：9.85');
INSERT INTO `flow` VALUES ('777', '3', '3', '17238', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：前三位：杂六,投注额：172.38');
INSERT INTO `flow` VALUES ('778', '3', '3', '7840', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第3位：第7球,投注额：78.4');
INSERT INTO `flow` VALUES ('779', '3', '3', '792', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第3位：单,投注额：7.92');
INSERT INTO `flow` VALUES ('780', '3', '3', '1188', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第3位：大,投注额：11.88');
INSERT INTO `flow` VALUES ('781', '3', '3', '0', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：和,投注额：0.0');
INSERT INTO `flow` VALUES ('782', '3', '3', '1386', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：总和单,投注额：13.86');
INSERT INTO `flow` VALUES ('783', '3', '3', '13199', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：总和小,投注额：131.99');
INSERT INTO `flow` VALUES ('784', '3', '3', '1386', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第4位：双,投注额：13.86');
INSERT INTO `flow` VALUES ('785', '3', '3', '1584', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第4位：小,投注额：15.84');
INSERT INTO `flow` VALUES ('786', '3', '3', '1326', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：前三位：杂六,投注额：13.26');
INSERT INTO `flow` VALUES ('787', '3', '3', '5880', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第4位：第0球,投注额：58.8');
INSERT INTO `flow` VALUES ('788', '3', '3', '0', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：和,投注额：0.0');
INSERT INTO `flow` VALUES ('789', '3', '3', '1188', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：总和单,投注额：11.88');
INSERT INTO `flow` VALUES ('790', '3', '3', '133172', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：总和小,投注额：1331.72');
INSERT INTO `flow` VALUES ('791', '3', '3', '14365', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：前三位：杂六,投注额：143.65');
INSERT INTO `flow` VALUES ('792', '3', '3', '1188', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第5位：小,投注额：11.88');
INSERT INTO `flow` VALUES ('793', '3', '3', '1386', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第5位：双,投注额：13.86');
INSERT INTO `flow` VALUES ('794', '3', '3', '966280', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第5位：第4球,投注额：9662.8');
INSERT INTO `flow` VALUES ('795', '3', '3', '0', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：和,投注额：0.0');
INSERT INTO `flow` VALUES ('796', '3', '3', '1188', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：总和单,投注额：11.88');
INSERT INTO `flow` VALUES ('797', '3', '3', '12805', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：总和小,投注额：128.05');
INSERT INTO `flow` VALUES ('798', '3', '3', '1326', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：中三位：杂六,投注额：13.26');
INSERT INTO `flow` VALUES ('799', '3', '3', '792', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第5位：小,投注额：7.92');
INSERT INTO `flow` VALUES ('800', '3', '3', '990', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第5位：双,投注额：9.9');
INSERT INTO `flow` VALUES ('801', '3', '3', '6860', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第5位：第4球,投注额：68.6');
INSERT INTO `flow` VALUES ('802', '3', '3', '0', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：和,投注额：0.0');
INSERT INTO `flow` VALUES ('803', '3', '3', '1386', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：总和单,投注额：13.86');
INSERT INTO `flow` VALUES ('804', '3', '3', '13199', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：总和小,投注额：131.99');
INSERT INTO `flow` VALUES ('805', '3', '3', '1326', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：中三位：杂六,投注额：13.26');
INSERT INTO `flow` VALUES ('806', '3', '3', '1386', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第5位：小,投注额：13.86');
INSERT INTO `flow` VALUES ('807', '3', '3', '1584', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第5位：双,投注额：15.84');
INSERT INTO `flow` VALUES ('808', '3', '3', '7840', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第5位：第4球,投注额：78.4');
INSERT INTO `flow` VALUES ('809', '3', '3', '0', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：和,投注额：0.0');
INSERT INTO `flow` VALUES ('810', '3', '3', '1782', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：总和单,投注额：17.82');
INSERT INTO `flow` VALUES ('811', '3', '3', '1773', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：总和小,投注额：17.73');
INSERT INTO `flow` VALUES ('812', '3', '3', '1547', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：中三位：杂六,投注额：15.47');
INSERT INTO `flow` VALUES ('813', '3', '3', '792', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第5位：小,投注额：7.92');
INSERT INTO `flow` VALUES ('814', '3', '3', '1188', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第5位：双,投注额：11.88');
INSERT INTO `flow` VALUES ('815', '3', '3', '5880', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第5位：第4球,投注额：58.8');
INSERT INTO `flow` VALUES ('816', '3', '3', '0', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：和,投注额：0.0');
INSERT INTO `flow` VALUES ('817', '3', '3', '13266', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：总和单,投注额：132.66');
INSERT INTO `flow` VALUES ('818', '3', '3', '1182', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：总和小,投注额：11.82');
INSERT INTO `flow` VALUES ('819', '3', '3', '884', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：后三位：杂六,投注额：8.84');
INSERT INTO `flow` VALUES ('820', '3', '3', '594', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第5位：小,投注额：5.94');
INSERT INTO `flow` VALUES ('821', '3', '3', '990', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第5位：双,投注额：9.9');
INSERT INTO `flow` VALUES ('822', '3', '3', '54880', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第5位：第4球,投注额：548.8');
INSERT INTO `flow` VALUES ('823', '3', '3', '0', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：和,投注额：0.0');
INSERT INTO `flow` VALUES ('824', '3', '3', '1386', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：总和单,投注额：13.86');
INSERT INTO `flow` VALUES ('825', '3', '3', '1182', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：总和小,投注额：11.82');
INSERT INTO `flow` VALUES ('826', '3', '3', '1547', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：中三位：杂六,投注额：15.47');
INSERT INTO `flow` VALUES ('827', '3', '3', '10692', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第5位：小,投注额：106.92');
INSERT INTO `flow` VALUES ('828', '3', '3', '13266', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第5位：双,投注额：132.66');
INSERT INTO `flow` VALUES ('829', '3', '3', '7840', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第5位：第4球,投注额：78.4');
INSERT INTO `flow` VALUES ('830', '3', '3', '0', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：和,投注额：0.0');
INSERT INTO `flow` VALUES ('831', '3', '3', '1386', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：总和单,投注额：13.86');
INSERT INTO `flow` VALUES ('832', '3', '3', '1379', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：总和小,投注额：13.79');
INSERT INTO `flow` VALUES ('833', '3', '3', '21437', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：中三位：杂六,投注额：214.37');
INSERT INTO `flow` VALUES ('834', '3', '3', '990', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第5位：小,投注额：9.9');
INSERT INTO `flow` VALUES ('835', '3', '3', '1584', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第5位：双,投注额：15.84');
INSERT INTO `flow` VALUES ('836', '3', '3', '86240', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第5位：第4球,投注额：862.4');
INSERT INTO `flow` VALUES ('837', '3', '3', '0', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：和,投注额：0.0');
INSERT INTO `flow` VALUES ('838', '3', '3', '1386', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：总和单,投注额：13.86');
INSERT INTO `flow` VALUES ('839', '3', '3', '1773', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：总和小,投注额：17.73');
INSERT INTO `flow` VALUES ('840', '3', '3', '663', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：中三位：杂六,投注额：6.63');
INSERT INTO `flow` VALUES ('841', '3', '3', '173844', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第5位：小,投注额：1738.44');
INSERT INTO `flow` VALUES ('842', '3', '3', '1782', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第5位：双,投注额：17.82');
INSERT INTO `flow` VALUES ('843', '3', '3', '7840', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第5位：第4球,投注额：78.4');
INSERT INTO `flow` VALUES ('844', '3', '3', '0', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：和,投注额：0.0');
INSERT INTO `flow` VALUES ('845', '3', '3', '792', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：总和单,投注额：7.92');
INSERT INTO `flow` VALUES ('846', '3', '3', '1182', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：总和小,投注额：11.82');
INSERT INTO `flow` VALUES ('847', '3', '3', '17238', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：中三位：杂六,投注额：172.38');
INSERT INTO `flow` VALUES ('848', '3', '3', '5880', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第2位：第2球,投注额：58.8');
INSERT INTO `flow` VALUES ('849', '3', '3', '990', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第2位：小,投注额：9.9');
INSERT INTO `flow` VALUES ('850', '3', '3', '0', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：和,投注额：0.0');
INSERT INTO `flow` VALUES ('851', '3', '3', '15444', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：总和单,投注额：154.44');
INSERT INTO `flow` VALUES ('852', '3', '3', '1379', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：总和小,投注额：13.79');
INSERT INTO `flow` VALUES ('853', '3', '3', '792', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第2位：双,投注额：7.92');
INSERT INTO `flow` VALUES ('854', '3', '3', '17238', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：中三位：杂六,投注额：172.38');
INSERT INTO `flow` VALUES ('855', '3', '3', '53900', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第2位：第2球,投注额：539.0');
INSERT INTO `flow` VALUES ('856', '3', '3', '990', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第2位：小,投注额：9.9');
INSERT INTO `flow` VALUES ('857', '3', '3', '0', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：和,投注额：0.0');
INSERT INTO `flow` VALUES ('858', '3', '3', '1584', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：总和单,投注额：15.84');
INSERT INTO `flow` VALUES ('859', '3', '3', '17336', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：总和小,投注额：173.36');
INSERT INTO `flow` VALUES ('860', '3', '3', '990', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第2位：双,投注额：9.9');
INSERT INTO `flow` VALUES ('861', '3', '3', '21658', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：中三位：杂六,投注额：216.58');
INSERT INTO `flow` VALUES ('862', '3', '3', '65660', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第2位：第2球,投注额：656.6');
INSERT INTO `flow` VALUES ('863', '3', '3', '19404', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第2位：小,投注额：194.04');
INSERT INTO `flow` VALUES ('864', '3', '3', '0', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：和,投注额：0.0');
INSERT INTO `flow` VALUES ('865', '3', '3', '1386', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：总和单,投注额：13.86');
INSERT INTO `flow` VALUES ('866', '3', '3', '9062', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：总和小,投注额：90.62');
INSERT INTO `flow` VALUES ('867', '3', '3', '12870', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第2位：双,投注额：128.7');
INSERT INTO `flow` VALUES ('868', '3', '3', '1768', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：中三位：杂六,投注额：17.68');
INSERT INTO `flow` VALUES ('869', '3', '3', '5880', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第3位：第7球,投注额：58.8');
INSERT INTO `flow` VALUES ('870', '3', '3', '990', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第3位：单,投注额：9.9');
INSERT INTO `flow` VALUES ('871', '3', '3', '12870', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：第3位：大,投注额：128.7');
INSERT INTO `flow` VALUES ('872', '3', '3', '0', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：和,投注额：0.0');
INSERT INTO `flow` VALUES ('873', '3', '3', '1386', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：总和单,投注额：13.86');
INSERT INTO `flow` VALUES ('874', '3', '3', '15169', null, null, null, null, '1', '2016-08-26 02:08:27', '期数：20160826013,开奖号码：42704,投注详情：总和小,投注额：151.69');
INSERT INTO `flow` VALUES ('875', '3', '2', '100', null, null, null, null, '0', '2016-08-28 09:27:36', '期数：20160828011,投注详情：第1位：第7球,投注额：1');
INSERT INTO `flow` VALUES ('876', '3', '2', '2300', null, null, null, null, '0', '2016-08-28 09:27:36', '期数：20160828011,投注详情：第1位：第8球,投注额：23');
INSERT INTO `flow` VALUES ('877', '3', '2', '400', null, null, null, null, '0', '2016-08-28 09:27:36', '期数：20160828011,投注详情：第1位：第0球,投注额：4');
INSERT INTO `flow` VALUES ('878', '3', '2', '2300', null, null, null, null, '0', '2016-08-28 09:27:36', '期数：20160828011,投注详情：第1位：第1球,投注额：23');
INSERT INTO `flow` VALUES ('879', '3', '2', '32300', null, null, null, null, '0', '2016-08-28 09:27:36', '期数：20160828011,投注详情：第1位：第2球,投注额：323');
INSERT INTO `flow` VALUES ('880', '3', '2', '2100', null, null, null, null, '0', '2016-08-28 09:27:36', '期数：20160828011,投注详情：第1位：小,投注额：21');
INSERT INTO `flow` VALUES ('881', '3', '2', '1200', null, null, null, null, '0', '2016-08-28 09:27:36', '期数：20160828011,投注详情：第1位：第9球,投注额：12');
INSERT INTO `flow` VALUES ('882', '3', '2', '200', null, null, null, null, '0', '2016-08-28 09:27:36', '期数：20160828011,投注详情：虎,投注额：2');
INSERT INTO `flow` VALUES ('883', '3', '2', '200', null, null, null, null, '0', '2016-08-28 09:27:36', '期数：20160828011,投注详情：总和小,投注额：2');
INSERT INTO `flow` VALUES ('884', '3', '2', '1200', null, null, null, null, '0', '2016-08-28 09:27:36', '期数：20160828011,投注详情：第1位：单,投注额：12');
INSERT INTO `flow` VALUES ('885', '3', '2', '200', null, null, null, null, '0', '2016-08-28 09:27:36', '期数：20160828011,投注详情：第1位：双,投注额：2');
INSERT INTO `flow` VALUES ('886', '3', '2', '2200', null, null, null, null, '0', '2016-08-28 09:27:57', '期数：20160828011,投注详情：第1位：第5球,投注额：22');
INSERT INTO `flow` VALUES ('887', '3', '2', '1200', null, null, null, null, '0', '2016-08-28 09:27:57', '期数：20160828011,投注详情：第1位：第7球,投注额：12');
INSERT INTO `flow` VALUES ('888', '3', '2', '3300', null, null, null, null, '0', '2016-08-28 09:27:57', '期数：20160828011,投注详情：第1位：第8球,投注额：33');
INSERT INTO `flow` VALUES ('889', '3', '2', '200', null, null, null, null, '0', '2016-08-28 09:27:57', '期数：20160828011,投注详情：第1位：第1球,投注额：2');
INSERT INTO `flow` VALUES ('890', '3', '2', '1200', null, null, null, null, '0', '2016-08-28 09:27:57', '期数：20160828011,投注详情：第1位：第3球,投注额：12');
INSERT INTO `flow` VALUES ('891', '3', '2', '1200', null, null, null, null, '0', '2016-08-28 09:27:57', '期数：20160828011,投注详情：第1位：第4球,投注额：12');
INSERT INTO `flow` VALUES ('892', '3', '2', '1200', null, null, null, null, '0', '2016-08-28 09:27:57', '期数：20160828011,投注详情：第1位：小,投注额：12');
INSERT INTO `flow` VALUES ('893', '3', '2', '200', null, null, null, null, '0', '2016-08-28 09:27:57', '期数：20160828011,投注详情：第1位：大,投注额：2');
INSERT INTO `flow` VALUES ('894', '3', '2', '200', null, null, null, null, '0', '2016-08-28 09:27:57', '期数：20160828011,投注详情：第1位：第9球,投注额：2');
INSERT INTO `flow` VALUES ('895', '3', '2', '1200', null, null, null, null, '0', '2016-08-28 09:27:57', '期数：20160828011,投注详情：第1位：单,投注额：12');
INSERT INTO `flow` VALUES ('896', '3', '2', '300', null, null, null, null, '0', '2016-08-28 09:27:57', '期数：20160828011,投注详情：第1位：双,投注额：3');
INSERT INTO `flow` VALUES ('897', '3', '3', '22540', null, null, null, null, '1', '2016-08-28 09:35:03', '期数：20160828011,开奖号码：10882,投注详情：第1位：第1球,投注额：225.4');
INSERT INTO `flow` VALUES ('898', '3', '3', '4158', null, null, null, null, '1', '2016-08-28 09:35:03', '期数：20160828011,开奖号码：10882,投注详情：第1位：小,投注额：41.58');
INSERT INTO `flow` VALUES ('899', '3', '3', '396', null, null, null, null, '1', '2016-08-28 09:35:03', '期数：20160828011,开奖号码：10882,投注详情：虎,投注额：3.96');
INSERT INTO `flow` VALUES ('900', '3', '3', '396', null, null, null, null, '1', '2016-08-28 09:35:03', '期数：20160828011,开奖号码：10882,投注详情：总和小,投注额：3.96');
INSERT INTO `flow` VALUES ('901', '3', '3', '2376', null, null, null, null, '1', '2016-08-28 09:35:03', '期数：20160828011,开奖号码：10882,投注详情：第1位：单,投注额：23.76');
INSERT INTO `flow` VALUES ('902', '3', '3', '1960', null, null, null, null, '1', '2016-08-28 09:35:03', '期数：20160828011,开奖号码：10882,投注详情：第1位：第1球,投注额：19.6');
INSERT INTO `flow` VALUES ('903', '3', '3', '2376', null, null, null, null, '1', '2016-08-28 09:35:03', '期数：20160828011,开奖号码：10882,投注详情：第1位：小,投注额：23.76');
INSERT INTO `flow` VALUES ('904', '3', '3', '2376', null, null, null, null, '1', '2016-08-28 09:35:03', '期数：20160828011,开奖号码：10882,投注详情：第1位：单,投注额：23.76');
INSERT INTO `flow` VALUES ('905', '4', '0', '10000', '666', '123', '建行', '广发', '0', '2016-08-28 19:50:40', '');
INSERT INTO `flow` VALUES ('906', '4', '2', '1500', null, null, null, null, '0', '2016-08-28 19:54:01', '期数：20160828051,投注详情：第1位：第8球,投注额：15');
INSERT INTO `flow` VALUES ('907', '4', '2', '1000', null, null, null, null, '0', '2016-08-28 19:54:01', '期数：20160828051,投注详情：第1位：第2球,投注额：10');
INSERT INTO `flow` VALUES ('908', '4', '2', '2200', null, null, null, null, '0', '2016-08-28 19:54:01', '期数：20160828051,投注详情：第1位：第3球,投注额：22');
INSERT INTO `flow` VALUES ('909', '4', '2', '100', null, null, null, null, '0', '2016-08-28 19:57:15', '期数：20160828052,投注详情：第1位：第1球,投注额：1');
INSERT INTO `flow` VALUES ('910', '4', '2', '1000', null, null, null, null, '0', '2016-08-28 19:57:15', '期数：20160828052,投注详情：第1位：第2球,投注额：10');
INSERT INTO `flow` VALUES ('911', '4', '3', '980', null, null, null, null, '1', '2016-08-28 20:05:00', '期数：20160828052,开奖号码：19275,投注详情：第1位：第1球,投注额：9.8');

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  `tel` varchar(20) default NULL,
  `card` varchar(20) default NULL,
  `trueName` varchar(20) default NULL,
  `bankpos` varchar(200) default NULL,
  `bank` varchar(20) default NULL,
  `money` int(9) default NULL,
  `pwd` varchar(100) NOT NULL,
  `add_ts` datetime NOT NULL,
  `update_ts` datetime default NULL,
  `ocount` int(11) default NULL,
  `enable` int(11) default '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', 'asdfasdf', null, null, null, null, null, '100000', '6A204BD89F3C8348AFD5C77C717A097A', '2016-08-13 19:34:57', null, null, null);
INSERT INTO `member` VALUES ('2', 'asdfasdfa', null, null, null, null, null, '100000', '6A204BD89F3C8348AFD5C77C717A097A', '2016-08-15 14:33:52', null, null, null);
INSERT INTO `member` VALUES ('3', 'qwerqwer', null, '123123123123123', 'asdf', '北京市北京辖县延庆县XX街XX支行', 'werwe', '89936500', '6A204BD89F3C8348AFD5C77C717A097A', '2016-08-15 12:15:05', '2016-08-28 09:27:57', null, null);
INSERT INTO `member` VALUES ('4', 'asdfqwer', null, null, null, null, null, '5215', '6A204BD89F3C8348AFD5C77C717A097A', '2016-08-28 19:07:05', '2016-08-28 19:57:15', null, '1');

-- ----------------------------
-- Table structure for `notices`
-- ----------------------------
DROP TABLE IF EXISTS `notices`;
CREATE TABLE `notices` (
  `id` bigint(20) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `author` varchar(255) default NULL,
  `content` varchar(2000) default NULL,
  `files` text,
  `time_begin` datetime default NULL,
  `time_end` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notices
-- ----------------------------

-- ----------------------------
-- Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL auto_increment,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) default NULL,
  `remark` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'ROLE_ADMIN', '管理员', '所有权限');
INSERT INTO `roles` VALUES ('3', 'ROLE_ZYRY', '在押人员信息管理', '可添加、删除、修改在押人员信息');

-- ----------------------------
-- Table structure for `ssc`
-- ----------------------------
DROP TABLE IF EXISTS `ssc`;
CREATE TABLE `ssc` (
  `id` int(11) NOT NULL auto_increment,
  `no` varchar(5) default NULL,
  `sum` int(2) default NULL,
  `cross` int(1) default NULL,
  `time` datetime default NULL,
  `times` int(3) default NULL,
  `qihao` varchar(20) default NULL,
  `daxiao` varchar(10) default NULL COMMENT '0:da,1:xiao',
  `danshuang` varchar(10) default NULL,
  `longhuhe` varchar(10) default NULL,
  `qiansan` varchar(10) default NULL,
  `zhongsan` varchar(10) default NULL,
  `housan` varchar(10) default NULL,
  `stime` datetime default NULL,
  `etime` datetime default NULL,
  `allwin` int(11) default NULL,
  `income` int(11) default NULL,
  `rate` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=310 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssc
-- ----------------------------
INSERT INTO `ssc` VALUES ('1', '81799', '34', '8', '2016-08-21 01:27:07', '1', '20160821001', '大', '双', '虎', '半顺', '杂六', '对子', '2016-08-21 01:15:00', '2016-08-21 01:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('2', '71022', '12', '7', '2016-08-21 01:35:03', '2', '20160821002', '小', '双', '龙', '半顺', '顺子', '对子', '2016-08-21 01:25:00', '2016-08-21 01:35:00', '21', '21', '100');
INSERT INTO `ssc` VALUES ('3', '55172', '20', '6', '2016-08-21 01:45:01', '3', '20160821003', '小', '双', '龙', '对子', '杂六', '半顺', '2016-08-21 01:35:00', '2016-08-21 01:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('4', '00970', '16', '9', '2016-08-21 01:55:31', '4', '20160821004', '小', '双', '和', '对子', '半顺', '半顺', '2016-08-21 01:45:00', '2016-08-21 01:55:00', '1121', '1121', '100');
INSERT INTO `ssc` VALUES ('5', '44327', '20', '5', '2016-08-21 02:00:04', '5', '20160821004', '小', '双', '虎', '对子', '顺子', '半顺', '2016-08-21 01:45:00', '2016-08-21 01:55:00', '1121', '1121', '100');
INSERT INTO `ssc` VALUES ('6', '07778', '29', '8', '2016-08-21 02:03:03', '6', '20160821004', '大', '单', '虎', '对子', '豹子', '对子', '2016-08-21 01:45:00', '2016-08-21 01:55:00', '1121', '1121', '100');
INSERT INTO `ssc` VALUES ('7', '03870', '18', '8', '2016-08-21 02:05:00', '7', '20160821007', '小', '双', '和', '杂六', '半顺', '半顺', '2016-08-21 01:55:00', '2016-08-21 02:00:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('8', '30483', '18', '8', '2016-08-21 02:12:00', '8', '20160821009', '小', '双', '和', '半顺', '杂六', '半顺', '2016-08-21 02:10:00', '2016-08-21 02:12:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('9', '53445', '21', '2', '2016-08-21 02:15:02', '9', '20160821009', '小', '单', '和', '顺子', '对子', '对子', '2016-08-21 02:12:00', '2016-08-21 02:15:00', '1900', '1900', '100');
INSERT INTO `ssc` VALUES ('10', '90185', '23', '9', '2016-08-21 02:18:01', '10', '20160821010', '大', '单', '龙', '顺子', '半顺', '杂六', '2016-08-21 02:15:00', '2016-08-21 02:18:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('11', '20023', '7', '3', '2016-08-21 02:25:00', '11', '20160821011', '小', '单', '虎', '对子', '对子', '半顺', '2016-08-21 02:18:00', '2016-08-21 02:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('12', '26890', '25', '9', '2016-08-21 02:35:00', '12', '20160821013', '大', '单', '龙', '杂六', '半顺', '顺子', '2016-08-21 02:35:00', '2016-08-21 02:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('13', '55787', '32', '3', '2016-08-21 02:45:01', '13', '20160821013', '大', '双', '虎', '对子', '半顺', '对子', '2016-08-21 02:35:00', '2016-08-21 02:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('14', '78916', '31', '8', '2016-08-21 02:55:00', '14', '20160821014', '大', '单', '龙', '顺子', '半顺', '杂六', '2016-08-21 02:45:00', '2016-08-21 02:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('15', '59492', '29', '7', '2016-08-21 03:00:00', '15', '20160821015', '大', '单', '龙', '半顺', '对子', '杂六', '2016-08-21 02:55:00', '2016-08-21 03:00:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('16', '16835', '23', '7', '2016-08-21 03:03:01', '16', '20160821016', '大', '单', '虎', '杂六', '杂六', '杂六', '2016-08-21 03:00:00', '2016-08-21 03:03:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('17', '64900', '19', '9', '2016-08-21 03:05:00', '17', '20160821017', '小', '单', '龙', '杂六', '半顺', '对子', '2016-08-21 03:03:00', '2016-08-21 03:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('18', '08768', '29', '8', '2016-08-21 03:10:00', '18', '20160821018', '大', '单', '虎', '半顺', '顺子', '顺子', '2016-08-21 03:05:00', '2016-08-21 03:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('19', '73665', '27', '4', '2016-08-21 03:12:01', '19', '20160821019', '大', '单', '龙', '半顺', '对子', '对子', '2016-08-21 03:10:00', '2016-08-21 03:12:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('20', '23080', '13', '8', '2016-08-21 03:15:00', '20', '20160821020', '小', '单', '龙', '半顺', '杂六', '对子', '2016-08-21 03:12:00', '2016-08-21 03:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('21', '86084', '26', '8', '2016-08-21 03:18:00', '21', '20160821022', '大', '双', '龙', '杂六', '杂六', '杂六', '2016-08-21 03:15:00', '2016-08-21 03:18:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('22', '44268', '24', '6', '2016-08-21 03:25:00', '22', '20160821023', '大', '双', '虎', '对子', '杂六', '杂六', '2016-08-21 03:18:00', '2016-08-21 03:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('23', '27174', '21', '6', '2016-08-21 03:35:00', '23', '20160821023', '小', '单', '虎', '半顺', '对子', '杂六', '2016-08-21 03:25:00', '2016-08-21 03:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('24', '06977', '29', '9', '2016-08-21 03:45:00', '24', '20160821024', '大', '单', '虎', '半顺', '半顺', '对子', '2016-08-21 03:35:00', '2016-08-21 03:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('25', '97414', '25', '8', '2016-08-21 03:55:01', '25', '20160821026', '大', '单', '龙', '杂六', '杂六', '对子', '2016-08-21 03:45:00', '2016-08-21 03:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('26', '51889', '31', '8', '2016-08-21 04:00:00', '26', '20160821026', '大', '单', '虎', '杂六', '对子', '对子', '2016-08-21 03:55:00', '2016-08-21 04:00:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('27', '36979', '34', '6', '2016-08-21 04:03:00', '27', '20160821027', '大', '双', '虎', '杂六', '半顺', '对子', '2016-08-21 04:00:00', '2016-08-21 04:03:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('28', '67612', '22', '6', '2016-08-21 04:05:00', '28', '20160821029', '小', '双', '龙', '对子', '半顺', '半顺', '2016-08-21 04:03:00', '2016-08-21 04:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('29', '26986', '31', '7', '2016-08-21 04:10:00', '29', '20160821029', '大', '单', '虎', '杂六', '半顺', '半顺', '2016-08-21 04:05:00', '2016-08-21 04:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('30', '00509', '14', '9', '2016-08-21 04:12:00', '30', '20160821031', '小', '双', '虎', '对子', '对子', '半顺', '2016-08-21 04:12:00', '2016-08-21 04:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('31', '78307', '25', '8', '2016-08-21 04:15:00', '31', '20160821032', '大', '单', '和', '半顺', '杂六', '杂六', '2016-08-21 04:12:00', '2016-08-21 04:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('32', '50899', '31', '9', '2016-08-21 04:18:00', '32', '20160821033', '大', '单', '虎', '杂六', '顺子', '对子', '2016-08-21 04:15:00', '2016-08-21 04:18:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('33', '01673', '17', '7', '2016-08-21 04:25:00', '33', '20160821034', '小', '单', '虎', '半顺', '半顺', '半顺', '2016-08-21 04:18:00', '2016-08-21 04:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('34', '55154', '20', '4', '2016-08-21 04:35:01', '34', '20160821034', '小', '双', '龙', '对子', '对子', '半顺', '2016-08-21 04:25:00', '2016-08-21 04:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('35', '33016', '13', '6', '2016-08-21 04:45:00', '35', '20160821035', '小', '单', '虎', '对子', '半顺', '半顺', '2016-08-21 04:35:00', '2016-08-21 04:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('36', '57977', '35', '4', '2016-08-21 04:55:00', '36', '20160821036', '大', '单', '虎', '杂六', '对子', '对子', '2016-08-21 04:45:00', '2016-08-21 04:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('37', '05469', '24', '9', '2016-08-21 05:00:01', '37', '20160821038', '大', '双', '虎', '半顺', '顺子', '杂六', '2016-08-21 04:55:00', '2016-08-21 05:00:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('38', '54944', '26', '5', '2016-08-21 05:03:00', '38', '20160821038', '大', '双', '龙', '半顺', '对子', '对子', '2016-08-21 05:00:00', '2016-08-21 05:03:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('39', '22542', '15', '3', '2016-08-21 05:05:00', '39', '20160821039', '小', '单', '和', '对子', '半顺', '半顺', '2016-08-21 05:03:00', '2016-08-21 05:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('40', '12182', '14', '7', '2016-08-21 05:10:00', '40', '20160821041', '小', '双', '虎', '对子', '半顺', '半顺', '2016-08-21 05:05:00', '2016-08-21 05:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('41', '80943', '24', '9', '2016-08-21 05:12:00', '41', '20160821041', '大', '双', '龙', '顺子', '半顺', '半顺', '2016-08-21 05:10:00', '2016-08-21 05:12:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('42', '50058', '18', '8', '2016-08-21 05:15:00', '42', '20160821042', '小', '双', '虎', '对子', '对子', '杂六', '2016-08-21 05:12:00', '2016-08-21 05:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('43', '67158', '27', '7', '2016-08-21 05:18:00', '43', '20160821043', '大', '单', '虎', '半顺', '杂六', '杂六', '2016-08-21 05:15:00', '2016-08-21 05:18:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('44', '32155', '16', '4', '2016-08-21 05:25:00', '44', '20160821044', '小', '双', '虎', '顺子', '半顺', '对子', '2016-08-21 05:18:00', '2016-08-21 05:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('45', '73088', '26', '8', '2016-08-21 05:35:00', '45', '20160821046', '大', '双', '虎', '杂六', '杂六', '对子', '2016-08-21 05:25:00', '2016-08-21 05:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('46', '20059', '16', '9', '2016-08-21 05:45:00', '46', '20160821046', '小', '双', '虎', '对子', '对子', '半顺', '2016-08-21 05:35:00', '2016-08-21 05:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('47', '02168', '17', '8', '2016-08-21 05:55:00', '47', '20160821047', '小', '单', '虎', '顺子', '半顺', '杂六', '2016-08-21 05:45:00', '2016-08-21 05:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('48', '30336', '15', '6', '2016-08-21 06:00:00', '48', '20160821049', '小', '单', '虎', '对子', '对子', '对子', '2016-08-21 06:00:00', '2016-08-21 06:03:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('49', '87269', '32', '7', '2016-08-21 06:03:00', '49', '20160821050', '大', '双', '虎', '半顺', '半顺', '杂六', '2016-08-21 06:00:00', '2016-08-21 06:03:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('50', '82566', '27', '6', '2016-08-21 06:05:00', '50', '20160821050', '大', '单', '龙', '杂六', '半顺', '对子', '2016-08-21 06:03:00', '2016-08-21 06:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('51', '34834', '22', '5', '2016-08-21 06:10:00', '51', '20160821052', '小', '双', '虎', '半顺', '半顺', '半顺', '2016-08-21 06:05:00', '2016-08-21 06:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('52', '03918', '21', '9', '2016-08-21 06:12:01', '52', '20160821053', '小', '单', '虎', '半顺', '杂六', '半顺', '2016-08-21 06:12:00', '2016-08-21 06:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('53', '62267', '23', '5', '2016-08-21 06:15:00', '53', '20160821053', '大', '单', '虎', '对子', '对子', '半顺', '2016-08-21 06:12:00', '2016-08-21 06:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('54', '95307', '24', '9', '2016-08-21 06:18:00', '54', '20160821055', '大', '双', '龙', '杂六', '杂六', '杂六', '2016-08-21 06:15:00', '2016-08-21 06:18:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('55', '49176', '27', '8', '2016-08-21 06:25:00', '55', '20160821055', '大', '单', '虎', '杂六', '杂六', '半顺', '2016-08-21 06:18:00', '2016-08-21 06:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('56', '61592', '23', '8', '2016-08-21 06:35:00', '56', '20160821056', '大', '单', '龙', '半顺', '杂六', '杂六', '2016-08-21 06:25:00', '2016-08-21 06:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('57', '76376', '29', '4', '2016-08-21 06:45:00', '57', '20160821058', '大', '单', '龙', '半顺', '半顺', '半顺', '2016-08-21 06:35:00', '2016-08-21 06:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('58', '84524', '23', '6', '2016-08-21 06:55:01', '58', '20160821058', '大', '单', '龙', '半顺', '半顺', '半顺', '2016-08-21 06:45:00', '2016-08-21 06:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('59', '37474', '25', '4', '2016-08-21 07:00:00', '59', '20160821059', '大', '单', '虎', '半顺', '对子', '对子', '2016-08-21 06:55:00', '2016-08-21 07:00:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('60', '90704', '20', '9', '2016-08-21 07:03:00', '60', '20160821061', '小', '双', '龙', '半顺', '对子', '杂六', '2016-08-21 07:00:00', '2016-08-21 07:03:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('61', '22043', '11', '4', '2016-08-21 07:05:00', '61', '20160821061', '小', '单', '虎', '对子', '杂六', '半顺', '2016-08-21 07:03:00', '2016-08-21 07:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('62', '95125', '22', '8', '2016-08-21 07:10:00', '62', '20160821063', '小', '双', '龙', '杂六', '半顺', '半顺', '2016-08-21 07:05:00', '2016-08-21 07:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('63', '67315', '22', '6', '2016-08-21 07:12:00', '63', '20160821063', '小', '双', '龙', '半顺', '杂六', '杂六', '2016-08-21 07:10:00', '2016-08-21 07:12:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('64', '27608', '23', '8', '2016-08-21 07:15:00', '64', '20160821065', '大', '单', '虎', '半顺', '半顺', '杂六', '2016-08-21 07:12:00', '2016-08-21 07:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('65', '90579', '30', '9', '2016-08-21 07:18:00', '65', '20160821065', '大', '双', '和', '半顺', '杂六', '杂六', '2016-08-21 07:15:00', '2016-08-21 07:18:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('66', '53495', '26', '6', '2016-08-21 07:25:00', '66', '20160821067', '大', '双', '和', '顺子', '半顺', '半顺', '2016-08-21 07:18:00', '2016-08-21 07:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('67', '74187', '27', '7', '2016-08-21 07:35:00', '67', '20160821068', '大', '单', '和', '杂六', '杂六', '半顺', '2016-08-21 07:35:00', '2016-08-21 07:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('68', '05952', '21', '9', '2016-08-21 07:45:00', '68', '20160821069', '小', '单', '虎', '半顺', '对子', '杂六', '2016-08-21 07:35:00', '2016-08-21 07:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('69', '47228', '23', '6', '2016-08-21 07:55:00', '69', '20160821069', '大', '单', '虎', '杂六', '对子', '对子', '2016-08-21 07:45:00', '2016-08-21 07:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('70', '91055', '20', '9', '2016-08-21 08:00:01', '70', '20160821071', '小', '双', '龙', '顺子', '半顺', '对子', '2016-08-21 07:55:00', '2016-08-21 08:00:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('71', '59275', '28', '7', '2016-08-21 08:03:00', '71', '20160821071', '大', '双', '和', '杂六', '杂六', '杂六', '2016-08-21 08:00:00', '2016-08-21 08:03:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('72', '63084', '21', '8', '2016-08-21 08:05:00', '72', '20160821072', '小', '单', '龙', '杂六', '杂六', '杂六', '2016-08-21 08:03:00', '2016-08-21 08:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('73', '17060', '14', '7', '2016-08-21 08:10:01', '73', '20160821074', '小', '双', '龙', '半顺', '半顺', '对子', '2016-08-21 08:05:00', '2016-08-21 08:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('74', '43663', '22', '3', '2016-08-21 08:12:00', '74', '20160821074', '小', '双', '龙', '半顺', '对子', '对子', '2016-08-21 08:10:00', '2016-08-21 08:12:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('75', '10752', '15', '7', '2016-08-21 08:15:00', '75', '20160821075', '小', '单', '虎', '半顺', '杂六', '杂六', '2016-08-21 08:12:00', '2016-08-21 08:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('76', '51292', '19', '8', '2016-08-21 08:18:00', '76', '20160821076', '小', '单', '龙', '半顺', '半顺', '对子', '2016-08-21 08:15:00', '2016-08-21 08:18:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('77', '99277', '34', '7', '2016-08-21 08:25:00', '77', '20160821077', '大', '双', '龙', '对子', '杂六', '对子', '2016-08-21 08:18:00', '2016-08-21 08:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('78', '10892', '20', '9', '2016-08-21 08:35:00', '78', '20160821078', '小', '双', '虎', '半顺', '顺子', '半顺', '2016-08-21 08:25:00', '2016-08-21 08:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('79', '62933', '23', '7', '2016-08-21 08:45:00', '79', '20160821080', '大', '单', '龙', '杂六', '半顺', '对子', '2016-08-21 08:35:00', '2016-08-21 08:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('80', '94147', '25', '8', '2016-08-21 08:55:00', '80', '20160821080', '大', '单', '龙', '杂六', '对子', '杂六', '2016-08-21 08:45:00', '2016-08-21 08:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('81', '60724', '19', '7', '2016-08-21 09:00:00', '81', '20160821081', '小', '单', '龙', '半顺', '杂六', '杂六', '2016-08-21 08:55:00', '2016-08-21 09:00:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('82', '33852', '21', '6', '2016-08-21 09:03:01', '82', '20160821082', '小', '单', '龙', '对子', '杂六', '杂六', '2016-08-21 09:00:00', '2016-08-21 09:03:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('83', '64667', '29', '3', '2016-08-21 09:05:00', '83', '20160821083', '大', '单', '虎', '对子', '对子', '对子', '2016-08-21 09:03:00', '2016-08-21 09:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('84', '32291', '17', '8', '2016-08-21 09:10:00', '84', '20160821084', '小', '单', '龙', '对子', '对子', '半顺', '2016-08-21 09:05:00', '2016-08-21 09:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('85', '53382', '21', '6', '2016-08-21 09:12:00', '85', '20160821085', '小', '单', '龙', '对子', '对子', '半顺', '2016-08-21 09:10:00', '2016-08-21 09:12:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('86', '13749', '24', '8', '2016-08-21 09:15:00', '86', '20160821086', '大', '双', '虎', '杂六', '半顺', '杂六', '2016-08-21 09:12:00', '2016-08-21 09:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('87', '77167', '28', '6', '2016-08-21 09:18:00', '87', '20160821087', '大', '双', '和', '对子', '半顺', '半顺', '2016-08-21 09:18:00', '2016-08-21 09:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('88', '15895', '28', '8', '2016-08-21 09:33:01', '88', '20160821088', '大', '双', '虎', '杂六', '半顺', '半顺', '2016-08-21 09:23:00', '2016-08-21 09:33:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('89', '34536', '21', '3', '2016-08-21 09:35:03', '89', '20160821089', '小', '单', '虎', '顺子', '顺子', '半顺', '2016-08-21 09:33:00', '2016-08-21 09:35:00', '280', '4200', '6');
INSERT INTO `ssc` VALUES ('90', '32627', '20', '5', '2016-08-21 09:42:06', '90', '20160821090', '小', '双', '虎', '半顺', '对子', '半顺', '2016-08-21 09:32:00', '2016-08-21 09:42:00', '2420', '18100', '13');
INSERT INTO `ssc` VALUES ('91', '01281', '12', '8', '2016-08-21 09:45:00', '91', '20160821091', '小', '双', '虎', '顺子', '半顺', '半顺', '2016-08-21 09:42:00', '2016-08-21 09:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('92', '29419', '25', '8', '2016-08-21 09:52:04', '92', '20160821092', '大', '单', '虎', '杂六', '杂六', '杂六', '2016-08-21 09:42:00', '2016-08-21 09:52:00', '14140', '25900', '54');
INSERT INTO `ssc` VALUES ('93', '17382', '21', '7', '2016-08-21 09:55:05', '93', '20160821093', '小', '单', '虎', '杂六', '半顺', '半顺', '2016-08-21 09:45:00', '2016-08-21 09:55:00', '14140', '25900', '54');
INSERT INTO `ssc` VALUES ('94', '86245', '25', '6', '2016-08-21 10:00:05', '94', '20160821094', '大', '单', '龙', '杂六', '杂六', '半顺', '2016-08-21 09:50:00', '2016-08-21 10:00:00', '280', '43400', '0');
INSERT INTO `ssc` VALUES ('95', '45161', '17', '5', '2016-08-21 10:03:01', '95', '20160821095', '小', '单', '龙', '半顺', '半顺', '对子', '2016-08-21 10:00:00', '2016-08-21 10:03:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('96', '44274', '21', '5', '2016-08-21 10:05:01', '96', '20160821096', '小', '单', '和', '对子', '杂六', '杂六', '2016-08-21 10:03:00', '2016-08-21 10:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('97', '80499', '30', '9', '2016-08-21 10:10:00', '97', '20160821097', '大', '双', '虎', '杂六', '半顺', '对子', '2016-08-21 10:05:00', '2016-08-21 10:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('98', '66907', '28', '9', '2016-08-21 10:12:01', '98', '20160821099', '大', '双', '虎', '对子', '半顺', '半顺', '2016-08-21 10:12:00', '2016-08-21 10:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('99', '34057', '19', '7', '2016-08-21 10:15:01', '99', '20160821099', '小', '单', '虎', '半顺', '半顺', '杂六', '2016-08-21 10:12:00', '2016-08-21 10:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('100', '66882', '30', '6', '2016-08-21 10:18:00', '100', '20160821100', '大', '双', '龙', '对子', '对子', '对子', '2016-08-21 10:15:00', '2016-08-21 10:18:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('101', '84031', '16', '8', '2016-08-21 10:33:00', '101', '20160821102', '小', '双', '龙', '杂六', '半顺', '半顺', '2016-08-21 10:30:00', '2016-08-21 10:33:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('102', '98822', '29', '7', '2016-08-21 10:35:01', '102', '20160821103', '大', '单', '龙', '对子', '对子', '对子', '2016-08-21 10:33:00', '2016-08-21 10:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('103', '49343', '23', '6', '2016-08-21 10:42:00', '103', '20160821103', '大', '单', '龙', '半顺', '半顺', '对子', '2016-08-21 10:32:00', '2016-08-21 10:42:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('104', '31193', '17', '8', '2016-08-21 10:45:02', '104', '20160821105', '小', '单', '和', '对子', '对子', '杂六', '2016-08-21 10:42:00', '2016-08-21 10:45:00', '13500', '13500', '100');
INSERT INTO `ssc` VALUES ('105', '02738', '20', '8', '2016-08-21 10:52:04', '105', '20160821105', '小', '双', '虎', '杂六', '半顺', '半顺', '2016-08-21 10:45:00', '2016-08-21 10:52:00', '4598', '22200', '20');
INSERT INTO `ssc` VALUES ('106', '44054', '17', '5', '2016-08-21 10:55:01', '106', '20160821106', '小', '单', '和', '对子', '半顺', '半顺', '2016-08-21 10:52:00', '2016-08-21 10:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('107', '18471', '21', '7', '2016-08-21 11:35:01', '107', '20160821108', '小', '单', '和', '杂六', '半顺', '杂六', '2016-08-21 11:33:00', '2016-08-21 11:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('108', '72651', '21', '6', '2016-08-21 11:42:01', '108', '20160821108', '小', '单', '龙', '半顺', '半顺', '半顺', '2016-08-21 11:35:00', '2016-08-21 11:42:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('109', '33810', '15', '8', '2016-08-21 11:45:00', '109', '20160821109', '小', '单', '龙', '对子', '杂六', '半顺', '2016-08-21 11:42:00', '2016-08-21 11:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('110', '90813', '21', '9', '2016-08-21 13:00:01', '110', '20160821111', '小', '单', '龙', '顺子', '半顺', '杂六', '2016-08-21 13:00:00', '2016-08-21 13:03:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('111', '51808', '22', '8', '2016-08-21 13:03:03', '111', '20160821111', '小', '双', '虎', '杂六', '半顺', '对子', '2016-08-21 13:00:00', '2016-08-21 13:03:00', '6000', '6000', '100');
INSERT INTO `ssc` VALUES ('112', '02959', '25', '9', '2016-08-21 13:05:00', '112', '20160821112', '大', '单', '虎', '半顺', '杂六', '对子', '2016-08-21 13:03:00', '2016-08-21 13:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('113', '33344', '17', '1', '2016-08-21 13:10:03', '113', '20160821114', '小', '单', '虎', '豹子', '对子', '对子', '2016-08-21 13:10:00', '2016-08-21 13:12:00', '1680', '5600', '30');
INSERT INTO `ssc` VALUES ('114', '18086', '23', '8', '2016-08-21 13:12:00', '114', '20160821114', '大', '单', '虎', '半顺', '对子', '杂六', '2016-08-21 13:10:00', '2016-08-21 13:12:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('115', '82527', '24', '6', '2016-08-21 13:15:00', '115', '20160821116', '大', '双', '龙', '杂六', '对子', '杂六', '2016-08-21 13:15:00', '2016-08-21 13:18:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('116', '10294', '16', '9', '2016-08-21 13:18:00', '116', '20160821117', '小', '双', '虎', '顺子', '半顺', '杂六', '2016-08-21 13:15:00', '2016-08-21 13:18:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('117', '93046', '22', '9', '2016-08-21 13:25:00', '117', '20160821117', '小', '双', '龙', '半顺', '半顺', '杂六', '2016-08-21 13:18:00', '2016-08-21 13:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('118', '64903', '22', '9', '2016-08-21 17:10:01', '118', '20160821119', '小', '双', '龙', '杂六', '半顺', '半顺', '2016-08-21 17:05:00', '2016-08-21 17:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('119', '74684', '29', '4', '2016-08-21 17:15:01', '119', '20160821119', '大', '单', '龙', '半顺', '杂六', '杂六', '2016-08-21 17:10:00', '2016-08-21 17:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('120', '45299', '29', '7', '2016-08-21 17:25:03', '120', '20160821120', '大', '单', '虎', '半顺', '杂六', '对子', '2016-08-21 17:15:00', '2016-08-21 17:25:00', '700', '5600', '12');
INSERT INTO `ssc` VALUES ('121', '91699', '34', '8', '2016-08-21 17:35:03', '121', '20160821121', '大', '双', '和', '杂六', '杂六', '对子', '2016-08-21 17:25:00', '2016-08-21 17:35:00', '4999', '9300', '53');
INSERT INTO `ssc` VALUES ('122', '10843', '16', '8', '2016-08-21 17:45:00', '122', '20160821122', '小', '双', '虎', '半顺', '杂六', '半顺', '2016-08-21 17:35:00', '2016-08-21 17:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('123', '99700', '25', '9', '2016-08-21 17:55:00', '123', '20160821124', '大', '单', '龙', '对子', '半顺', '对子', '2016-08-21 17:45:00', '2016-08-21 17:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('124', '55690', '25', '9', '2016-08-22 19:55:01', '1', '20160822002', '大', '单', '龙', '对子', '半顺', '半顺', '2016-08-22 19:45:00', '2016-08-22 19:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('125', '75351', '21', '6', '2016-08-22 20:05:01', '2', '20160822002', '小', '单', '龙', '杂六', '对子', '杂六', '2016-08-22 19:55:00', '2016-08-22 20:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('126', '14274', '18', '6', '2016-08-22 20:10:01', '3', '20160822003', '小', '双', '虎', '半顺', '杂六', '杂六', '2016-08-22 20:05:00', '2016-08-22 20:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('127', '07191', '18', '9', '2016-08-22 20:15:01', '4', '20160822004', '小', '双', '虎', '半顺', '杂六', '对子', '2016-08-22 20:10:00', '2016-08-22 20:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('128', '59393', '29', '6', '2016-08-22 20:25:00', '5', '20160822005', '大', '单', '龙', '杂六', '对子', '对子', '2016-08-22 20:15:00', '2016-08-22 20:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('129', '57495', '30', '5', '2016-08-22 20:35:01', '6', '20160822005', '大', '双', '和', '半顺', '杂六', '半顺', '2016-08-22 20:25:00', '2016-08-22 20:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('130', '09633', '21', '9', '2016-08-22 20:45:00', '7', '20160822008', '小', '单', '虎', '半顺', '杂六', '对子', '2016-08-22 20:35:00', '2016-08-22 20:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('131', '77884', '34', '4', '2016-08-22 20:55:00', '8', '20160822008', '大', '双', '龙', '对子', '对子', '对子', '2016-08-22 20:45:00', '2016-08-22 20:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('132', '94799', '38', '5', '2016-08-22 21:05:00', '9', '20160822009', '大', '双', '和', '杂六', '杂六', '对子', '2016-08-22 20:55:00', '2016-08-22 21:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('133', '95484', '30', '5', '2016-08-22 21:10:00', '10', '20160822010', '大', '双', '龙', '半顺', '半顺', '对子', '2016-08-22 21:05:00', '2016-08-22 21:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('134', '57878', '35', '3', '2016-08-22 21:15:01', '11', '20160822011', '大', '单', '虎', '半顺', '对子', '对子', '2016-08-22 21:10:00', '2016-08-22 21:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('135', '92398', '31', '7', '2016-08-22 21:25:00', '12', '20160822012', '大', '单', '龙', '半顺', '半顺', '半顺', '2016-08-22 21:15:00', '2016-08-22 21:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('136', '52750', '19', '7', '2016-08-22 21:35:01', '13', '20160822013', '小', '单', '龙', '杂六', '杂六', '杂六', '2016-08-22 21:25:00', '2016-08-22 21:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('137', '27724', '22', '5', '2016-08-22 21:45:19', '14', '20160822014', '小', '双', '虎', '对子', '对子', '杂六', '2016-08-22 21:35:00', '2016-08-22 21:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('138', '61445', '20', '5', '2016-08-22 21:55:01', '15', '20160822015', '小', '双', '龙', '杂六', '对子', '对子', '2016-08-22 21:45:00', '2016-08-22 21:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('139', '45473', '23', '4', '2016-08-22 22:05:00', '16', '20160822016', '大', '单', '龙', '对子', '半顺', '半顺', '2016-08-22 21:55:00', '2016-08-22 22:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('140', '00736', '16', '7', '2016-08-22 22:10:01', '17', '20160822017', '小', '双', '虎', '对子', '杂六', '半顺', '2016-08-22 22:05:00', '2016-08-22 22:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('141', '74507', '23', '7', '2016-08-22 22:15:00', '18', '20160822018', '大', '单', '和', '半顺', '半顺', '杂六', '2016-08-22 22:10:00', '2016-08-22 22:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('142', '45213', '15', '4', '2016-08-22 22:25:00', '19', '20160822019', '小', '单', '龙', '半顺', '半顺', '顺子', '2016-08-22 22:15:00', '2016-08-22 22:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('143', '01195', '16', '9', '2016-08-22 22:35:01', '20', '20160822020', '小', '双', '虎', '对子', '对子', '杂六', '2016-08-22 22:25:00', '2016-08-22 22:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('144', '09050', '14', '9', '2016-08-22 22:45:00', '21', '20160822021', '小', '双', '和', '对子', '半顺', '对子', '2016-08-22 22:35:00', '2016-08-22 22:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('145', '07810', '16', '8', '2016-08-22 22:55:00', '22', '20160822022', '小', '双', '和', '半顺', '半顺', '半顺', '2016-08-22 22:45:00', '2016-08-22 22:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('146', '19061', '17', '9', '2016-08-22 23:05:01', '23', '20160822023', '小', '单', '和', '顺子', '半顺', '半顺', '2016-08-22 22:55:00', '2016-08-22 23:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('147', '97981', '34', '8', '2016-08-22 23:10:00', '24', '20160822024', '大', '双', '龙', '对子', '顺子', '半顺', '2016-08-22 23:05:00', '2016-08-22 23:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('148', '33495', '24', '6', '2016-08-22 23:15:00', '25', '20160822025', '大', '双', '虎', '对子', '半顺', '半顺', '2016-08-22 23:10:00', '2016-08-22 23:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('149', '91841', '23', '8', '2016-08-22 23:25:01', '26', '20160822026', '大', '单', '龙', '半顺', '杂六', '杂六', '2016-08-22 23:15:00', '2016-08-22 23:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('150', '55931', '23', '8', '2016-08-22 23:35:01', '27', '20160822027', '大', '单', '龙', '对子', '杂六', '杂六', '2016-08-22 23:25:00', '2016-08-22 23:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('151', '10726', '16', '7', '2016-08-22 23:45:00', '28', '20160822028', '小', '双', '虎', '半顺', '杂六', '半顺', '2016-08-22 23:35:00', '2016-08-22 23:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('152', '20990', '20', '9', '2016-08-23 19:55:01', '1', 'null', '小', '双', '龙', '半顺', '对子', '对子', '2016-08-23 19:45:00', '2016-08-23 19:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('153', '41398', '25', '8', '2016-08-23 21:10:01', '2', '20160823002', '大', '单', '虎', '半顺', '杂六', '半顺', '2016-08-23 21:05:00', '2016-08-23 21:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('154', '58232', '20', '6', '2016-08-23 21:15:00', '3', '20160823003', '小', '双', '龙', '杂六', '半顺', '对子', '2016-08-23 21:10:00', '2016-08-23 21:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('155', '78287', '32', '6', '2016-08-23 21:25:01', '4', '20160823004', '大', '双', '和', '半顺', '对子', '半顺', '2016-08-23 21:15:00', '2016-08-23 21:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('156', '92304', '18', '9', '2016-08-23 21:35:01', '5', '20160823005', '小', '双', '龙', '半顺', '半顺', '半顺', '2016-08-23 21:25:00', '2016-08-23 21:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('157', '88412', '23', '7', '2016-08-23 21:45:01', '6', '20160823006', '大', '单', '龙', '对子', '杂六', '半顺', '2016-08-23 21:35:00', '2016-08-23 21:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('158', '27552', '21', '5', '2016-08-23 21:55:01', '7', '20160823007', '小', '单', '和', '杂六', '对子', '对子', '2016-08-23 21:45:00', '2016-08-23 21:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('159', '14009', '14', '9', '2016-08-23 22:05:02', '8', '20160823008', '小', '双', '虎', '半顺', '对子', '对子', '2016-08-23 21:55:00', '2016-08-23 22:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('160', '73915', '25', '8', '2016-08-23 22:10:06', '9', '20160823009', '大', '单', '龙', '杂六', '杂六', '杂六', '2016-08-23 22:05:00', '2016-08-23 22:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('161', '20281', '13', '8', '2016-08-23 22:15:00', '10', '20160823010', '小', '单', '龙', '对子', '杂六', '半顺', '2016-08-23 22:10:00', '2016-08-23 22:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('162', '73504', '19', '7', '2016-08-23 22:25:01', '11', '20160823011', '小', '单', '龙', '杂六', '杂六', '半顺', '2016-08-23 22:15:00', '2016-08-23 22:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('163', '14518', '19', '7', '2016-08-23 22:35:04', '12', '20160823012', '小', '单', '虎', '半顺', '半顺', '杂六', '2016-08-23 22:25:00', '2016-08-23 22:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('164', '49306', '22', '9', '2016-08-23 22:45:00', '13', '20160823013', '小', '双', '虎', '半顺', '半顺', '杂六', '2016-08-23 22:35:00', '2016-08-23 22:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('165', '76883', '32', '5', '2016-08-23 22:55:04', '14', '20160823014', '大', '双', '龙', '顺子', '对子', '对子', '2016-08-23 22:45:00', '2016-08-23 22:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('166', '64963', '28', '6', '2016-08-23 23:05:03', '15', '20160823015', '大', '双', '龙', '杂六', '杂六', '杂六', '2016-08-23 22:55:00', '2016-08-23 23:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('167', '02881', '19', '8', '2016-08-23 23:10:01', '16', '20160823016', '小', '单', '虎', '杂六', '对子', '对子', '2016-08-23 23:05:00', '2016-08-23 23:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('168', '62411', '14', '5', '2016-08-23 23:15:00', '17', '20160823017', '小', '双', '龙', '杂六', '半顺', '对子', '2016-08-23 23:10:00', '2016-08-23 23:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('169', '28445', '23', '6', '2016-08-23 23:25:07', '18', '20160823018', '大', '单', '虎', '杂六', '对子', '对子', '2016-08-23 23:15:00', '2016-08-23 23:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('170', '00055', '10', '5', '2016-08-23 23:35:01', '19', '20160823019', '小', '双', '虎', '豹子', '对子', '对子', '2016-08-23 23:25:00', '2016-08-23 23:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('171', '18538', '25', '7', '2016-08-23 23:45:01', '20', '20160823020', '大', '单', '虎', '杂六', '杂六', '杂六', '2016-08-23 23:35:00', '2016-08-23 23:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('172', '34981', '25', '8', '2016-08-23 23:55:00', '21', '20160823021', '大', '单', '龙', '半顺', '半顺', '半顺', '2016-08-23 23:45:00', '2016-08-23 23:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('173', '68244', '24', '6', '2016-08-24 00:05:01', '1', '20160824001', '大', '双', '龙', '杂六', '杂六', '对子', '2016-08-23 23:55:00', '2016-08-24 00:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('174', '76189', '31', '8', '2016-08-24 00:10:00', '2', '20160824002', '大', '单', '虎', '半顺', '杂六', '半顺', '2016-08-24 00:05:00', '2016-08-24 00:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('175', '51894', '27', '8', '2016-08-24 00:15:01', '3', '20160824003', '大', '单', '龙', '杂六', '半顺', '半顺', '2016-08-24 00:10:00', '2016-08-24 00:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('176', '36003', '12', '6', '2016-08-24 00:25:01', '4', '20160824004', '小', '双', '和', '杂六', '对子', '对子', '2016-08-24 00:15:00', '2016-08-24 00:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('177', '22485', '21', '6', '2016-08-24 00:35:36', '5', '20160824005', '小', '单', '虎', '对子', '杂六', '半顺', '2016-08-24 00:25:00', '2016-08-24 00:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('178', '04645', '19', '6', '2016-08-24 20:45:01', '6', '20160824006', '小', '单', '虎', '杂六', '对子', '顺子', '2016-08-24 20:35:00', '2016-08-24 20:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('179', '00973', '19', '9', '2016-08-24 20:55:01', '7', '20160824007', '小', '单', '虎', '对子', '半顺', '杂六', '2016-08-24 20:45:00', '2016-08-24 20:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('180', '04182', '15', '8', '2016-08-24 21:05:01', '8', '20160824008', '小', '单', '虎', '半顺', '杂六', '半顺', '2016-08-24 20:55:00', '2016-08-24 21:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('181', '24996', '30', '7', '2016-08-24 21:10:01', '9', '20160824009', '大', '双', '虎', '杂六', '对子', '对子', '2016-08-24 21:05:00', '2016-08-24 21:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('182', '49360', '22', '9', '2016-08-24 21:15:01', '10', '20160824010', '小', '双', '龙', '半顺', '杂六', '杂六', '2016-08-24 21:10:00', '2016-08-24 21:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('183', '16714', '19', '6', '2016-08-24 21:25:01', '11', '20160824011', '小', '单', '虎', '半顺', '半顺', '杂六', '2016-08-24 21:15:00', '2016-08-24 21:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('184', '66518', '26', '7', '2016-08-24 21:35:02', '12', '20160824012', '大', '双', '虎', '对子', '半顺', '杂六', '2016-08-24 21:25:00', '2016-08-24 21:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('185', '96666', '33', '3', '2016-08-24 21:45:00', '13', '20160824013', '大', '单', '龙', '对子', '豹子', '豹子', '2016-08-24 21:35:00', '2016-08-24 21:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('186', '65202', '15', '6', '2016-08-24 21:55:00', '14', '20160824014', '小', '单', '龙', '半顺', '杂六', '对子', '2016-08-24 21:45:00', '2016-08-24 21:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('187', '79438', '31', '6', '2016-08-24 22:05:01', '15', '20160824015', '大', '单', '虎', '杂六', '半顺', '半顺', '2016-08-24 21:55:00', '2016-08-24 22:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('188', '24950', '20', '9', '2016-08-24 22:10:00', '16', '20160824016', '小', '双', '龙', '杂六', '半顺', '半顺', '2016-08-24 22:05:00', '2016-08-24 22:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('189', '97027', '25', '9', '2016-08-24 22:15:02', '17', '20160824017', '大', '单', '龙', '半顺', '杂六', '杂六', '2016-08-24 22:10:00', '2016-08-24 22:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('190', '47204', '17', '7', '2016-08-24 22:25:01', '18', '20160824018', '小', '单', '和', '杂六', '杂六', '杂六', '2016-08-24 22:15:00', '2016-08-24 22:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('191', '49935', '30', '6', '2016-08-24 22:35:01', '19', '20160824019', '大', '双', '虎', '对子', '对子', '杂六', '2016-08-24 22:25:00', '2016-08-24 22:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('192', '59759', '35', '4', '2016-08-24 22:45:00', '20', '20160824020', '大', '单', '虎', '杂六', '杂六', '杂六', '2016-08-24 22:35:00', '2016-08-24 22:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('193', '37394', '26', '6', '2016-08-24 22:55:01', '21', '20160824021', '大', '双', '虎', '对子', '杂六', '半顺', '2016-08-24 22:45:00', '2016-08-24 22:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('194', '32831', '17', '7', '2016-08-24 23:05:01', '22', '20160824022', '小', '单', '龙', '半顺', '半顺', '杂六', '2016-08-24 22:55:00', '2016-08-24 23:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('195', '21887', '26', '7', '2016-08-24 23:10:01', '23', '20160824023', '大', '双', '虎', '半顺', '对子', '对子', '2016-08-24 23:05:00', '2016-08-24 23:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('196', '55776', '30', '2', '2016-08-24 23:15:00', '24', '20160824024', '大', '双', '虎', '对子', '对子', '对子', '2016-08-24 23:10:00', '2016-08-24 23:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('197', '36949', '31', '6', '2016-08-24 23:35:02', '25', '20160824026', '大', '单', '虎', '杂六', '杂六', '对子', '2016-08-24 23:25:00', '2016-08-24 23:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('198', '16189', '25', '8', '2016-08-24 23:45:00', '26', '20160824026', '大', '单', '虎', '对子', '杂六', '半顺', '2016-08-24 23:35:00', '2016-08-24 23:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('199', '32772', '21', '5', '2016-08-24 23:55:00', '27', '20160824027', '小', '单', '龙', '半顺', '对子', '对子', '2016-08-24 23:45:00', '2016-08-24 23:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('200', '84395', '29', '6', '2016-08-25 00:05:02', '1', '20160825001', '大', '单', '龙', '半顺', '半顺', '杂六', '2016-08-24 23:55:00', '2016-08-25 00:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('201', '53386', '25', '5', '2016-08-25 00:10:01', '2', '20160825002', '大', '单', '虎', '对子', '对子', '杂六', '2016-08-25 00:05:00', '2016-08-25 00:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('202', '59436', '27', '6', '2016-08-25 00:15:00', '3', '20160825003', '大', '单', '虎', '半顺', '半顺', '半顺', '2016-08-25 00:10:00', '2016-08-25 00:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('203', '33571', '19', '6', '2016-08-25 00:25:01', '4', '20160825004', '小', '单', '龙', '对子', '杂六', '杂六', '2016-08-25 00:15:00', '2016-08-25 00:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('204', '65300', '14', '6', '2016-08-25 00:35:01', '5', '20160825005', '小', '双', '龙', '半顺', '杂六', '对子', '2016-08-25 00:25:00', '2016-08-25 00:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('205', '65679', '33', '4', '2016-08-25 00:45:02', '6', '20160825006', '大', '单', '虎', '对子', '顺子', '半顺', '2016-08-25 00:35:00', '2016-08-25 00:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('206', '30833', '17', '8', '2016-08-25 00:55:00', '7', '20160825007', '小', '单', '和', '杂六', '杂六', '对子', '2016-08-25 00:45:00', '2016-08-25 00:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('207', '87112', '19', '7', '2016-08-25 19:55:02', '8', '20160825008', '小', '单', '龙', '半顺', '对子', '对子', '2016-08-25 19:45:00', '2016-08-25 19:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('208', '03878', '26', '8', '2016-08-25 20:05:01', '9', '20160825009', '大', '双', '虎', '杂六', '半顺', '对子', '2016-08-25 19:55:00', '2016-08-25 20:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('209', '78868', '37', '2', '2016-08-25 20:10:00', '10', '20160825010', '大', '单', '虎', '对子', '对子', '对子', '2016-08-25 20:05:00', '2016-08-25 20:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('210', '08480', '20', '8', '2016-08-25 20:15:00', '11', '20160825011', '小', '双', '和', '杂六', '对子', '杂六', '2016-08-25 20:10:00', '2016-08-25 20:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('211', '27218', '20', '7', '2016-08-25 20:25:00', '12', '20160825012', '小', '双', '虎', '对子', '半顺', '半顺', '2016-08-25 20:15:00', '2016-08-25 20:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('212', '67798', '37', '3', '2016-08-25 20:35:00', '13', '20160825013', '大', '单', '虎', '对子', '对子', '顺子', '2016-08-25 20:25:00', '2016-08-25 20:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('213', '97715', '29', '8', '2016-08-25 20:45:00', '14', '20160825014', '大', '单', '龙', '对子', '对子', '杂六', '2016-08-25 20:35:00', '2016-08-25 20:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('214', '46825', '25', '6', '2016-08-25 23:15:04', '15', '20160825015', '大', '单', '虎', '杂六', '杂六', '杂六', '2016-08-25 00:00:00', '2016-08-25 23:15:00', '700', '5600', '12');
INSERT INTO `ssc` VALUES ('215', '64474', '25', '3', '2016-08-25 23:25:00', '16', '20160825016', '大', '单', '龙', '对子', '对子', '对子', '2016-08-25 23:15:00', '2016-08-25 23:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('216', '09285', '24', '9', '2016-08-25 23:35:01', '17', '20160825017', '大', '双', '虎', '半顺', '半顺', '杂六', '2016-08-25 23:25:00', '2016-08-25 23:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('217', '56914', '25', '8', '2016-08-25 23:45:00', '18', '20160825018', '大', '单', '龙', '半顺', '杂六', '杂六', '2016-08-25 23:35:00', '2016-08-25 23:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('218', '87302', '20', '8', '2016-08-25 23:55:00', '19', '20160825019', '小', '双', '龙', '半顺', '杂六', '半顺', '2016-08-25 23:45:00', '2016-08-25 23:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('219', '73484', '26', '5', '2016-08-26 00:05:01', '20', '20160825020', '大', '双', '龙', '半顺', '半顺', '对子', '2016-08-25 23:55:00', '2016-08-26 00:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('220', '04106', '11', '6', '2016-08-26 00:10:00', '1', '20160826001', '小', '单', '虎', '半顺', '半顺', '半顺', '2016-08-26 00:05:00', '2016-08-26 00:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('221', '57315', '21', '6', '2016-08-26 00:15:00', '2', '20160826002', '小', '单', '和', '杂六', '杂六', '杂六', '2016-08-26 00:10:00', '2016-08-26 00:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('222', '50258', '20', '8', '2016-08-26 00:25:01', '3', '20160826003', '小', '双', '虎', '杂六', '杂六', '杂六', '2016-08-26 00:15:00', '2016-08-26 00:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('223', '50375', '20', '7', '2016-08-26 00:35:00', '4', '20160826004', '小', '双', '和', '杂六', '杂六', '杂六', '2016-08-26 00:25:00', '2016-08-26 00:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('224', '24682', '22', '6', '2016-08-26 00:45:01', '5', '20160826005', '小', '双', '和', '杂六', '杂六', '杂六', '2016-08-26 00:35:00', '2016-08-26 00:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('225', '52208', '17', '8', '2016-08-26 00:55:01', '6', '20160826006', '小', '单', '虎', '对子', '对子', '杂六', '2016-08-26 00:45:00', '2016-08-26 00:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('226', '30061', '10', '6', '2016-08-26 01:05:01', '7', '20160826007', '小', '双', '龙', '对子', '对子', '半顺', '2016-08-26 00:55:00', '2016-08-26 01:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('227', '81445', '22', '7', '2016-08-26 01:10:01', '8', '20160826008', '小', '双', '龙', '杂六', '对子', '对子', '2016-08-26 01:05:00', '2016-08-26 01:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('228', '63778', '31', '5', '2016-08-26 01:15:01', '9', '20160826009', '大', '单', '虎', '半顺', '对子', '对子', '2016-08-26 01:10:00', '2016-08-26 01:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('229', '06631', '16', '6', '2016-08-26 01:25:01', '10', '20160826010', '小', '双', '虎', '对子', '对子', '杂六', '2016-08-26 01:15:00', '2016-08-26 01:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('230', '29760', '24', '9', '2016-08-26 01:35:01', '11', '20160826011', '大', '双', '龙', '杂六', '半顺', '半顺', '2016-08-26 01:25:00', '2016-08-26 01:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('231', '67009', '22', '9', '2016-08-26 01:55:00', '12', '20160826012', '小', '双', '虎', '半顺', '对子', '对子', '2016-08-26 00:00:00', '2016-08-26 01:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('232', '42704', '17', '7', '2016-08-26 02:08:26', '13', '20160826013', '小', '单', '和', '杂六', '杂六', '杂六', '2016-08-26 01:55:00', '2016-08-26 02:05:00', '-5648', '2183300', '0');
INSERT INTO `ssc` VALUES ('233', '51035', '14', '5', '2016-08-26 02:10:01', '14', '20160826014', '小', '双', '和', '半顺', '半顺', '杂六', '2016-08-26 02:05:00', '2016-08-26 02:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('234', '70171', '16', '7', '2016-08-27 21:05:01', '1', '20160826001', '小', '双', '龙', '半顺', '半顺', '对子', '2016-08-26 02:10:00', '2016-08-27 21:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('235', '59768', '35', '4', '2016-08-27 21:10:00', '2', '20160827002', '大', '单', '虎', '杂六', '半顺', '顺子', '2016-08-27 21:05:00', '2016-08-27 21:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('236', '56311', '16', '5', '2016-08-27 21:15:00', '3', '20160827003', '小', '双', '龙', '半顺', '杂六', '对子', '2016-08-27 21:10:00', '2016-08-27 21:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('237', '68206', '22', '8', '2016-08-27 21:25:00', '4', '20160827004', '小', '双', '和', '杂六', '杂六', '杂六', '2016-08-27 21:15:00', '2016-08-27 21:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('238', '84231', '18', '7', '2016-08-27 21:35:25', '5', '20160827005', '小', '双', '龙', '杂六', '顺子', '顺子', '2016-08-27 21:25:00', '2016-08-27 21:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('239', '33864', '24', '5', '2016-08-27 21:45:00', '6', '20160827006', '大', '双', '虎', '对子', '杂六', '杂六', '2016-08-27 21:35:00', '2016-08-27 21:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('240', '12579', '24', '8', '2016-08-27 21:55:00', '7', '20160827007', '大', '双', '虎', '半顺', '杂六', '杂六', '2016-08-27 21:45:00', '2016-08-27 21:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('241', '63853', '25', '5', '2016-08-27 22:05:01', '8', '20160827008', '大', '单', '龙', '杂六', '杂六', '杂六', '2016-08-27 21:55:00', '2016-08-27 22:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('242', '62452', '19', '4', '2016-08-27 22:10:00', '9', '20160827009', '小', '单', '龙', '杂六', '半顺', '半顺', '2016-08-27 22:05:00', '2016-08-27 22:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('243', '77694', '33', '5', '2016-08-27 22:15:00', '10', '20160827010', '大', '单', '龙', '对子', '半顺', '杂六', '2016-08-27 22:10:00', '2016-08-27 22:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('244', '14733', '18', '6', '2016-08-27 22:55:01', '11', '20160827011', '小', '双', '虎', '杂六', '半顺', '对子', '2016-08-27 22:15:00', '2016-08-27 22:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('245', '30124', '10', '4', '2016-08-27 23:05:01', '12', '20160827012', '小', '双', '虎', '半顺', '顺子', '半顺', '2016-08-27 22:55:00', '2016-08-27 23:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('246', '95285', '29', '7', '2016-08-27 23:10:04', '13', '20160827013', '大', '单', '龙', '杂六', '杂六', '杂六', '2016-08-27 23:05:00', '2016-08-27 23:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('247', '26326', '19', '4', '2016-08-27 23:15:00', '14', '20160827014', '小', '单', '虎', '半顺', '半顺', '半顺', '2016-08-27 23:10:00', '2016-08-27 23:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('248', '81917', '26', '8', '2016-08-27 23:25:00', '15', '20160827015', '大', '双', '龙', '半顺', '对子', '杂六', '2016-08-27 23:15:00', '2016-08-27 23:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('249', '36870', '24', '8', '2016-08-27 23:35:01', '16', '20160827016', '大', '双', '龙', '杂六', '顺子', '半顺', '2016-08-27 23:25:00', '2016-08-27 23:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('250', '70609', '22', '9', '2016-08-27 23:45:07', '17', '20160827017', '小', '双', '虎', '半顺', '对子', '半顺', '2016-08-27 23:35:00', '2016-08-27 23:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('251', '98229', '30', '7', '2016-08-27 23:55:00', '18', '20160827018', '大', '双', '和', '半顺', '对子', '对子', '2016-08-27 23:45:00', '2016-08-27 23:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('252', '71951', '23', '8', '2016-08-28 00:05:01', '19', '20160827019', '大', '单', '龙', '杂六', '杂六', '杂六', '2016-08-27 23:55:00', '2016-08-28 00:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('253', '77741', '26', '6', '2016-08-28 00:10:00', '1', '20160828001', '大', '双', '龙', '豹子', '对子', '杂六', '2016-08-28 00:05:00', '2016-08-28 00:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('254', '54467', '26', '3', '2016-08-28 00:15:01', '2', '20160828002', '大', '双', '虎', '对子', '对子', '半顺', '2016-08-28 00:10:00', '2016-08-28 00:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('255', '33030', '9', '3', '2016-08-28 00:25:01', '3', '20160828003', '小', '单', '龙', '对子', '对子', '对子', '2016-08-28 00:15:00', '2016-08-28 00:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('256', '95104', '19', '9', '2016-08-28 08:25:02', '4', '20160828004', '小', '单', '龙', '杂六', '半顺', '半顺', '2016-08-28 00:25:00', '2016-08-28 08:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('257', '00441', '9', '4', '2016-08-28 08:35:03', '5', '20160828005', '小', '单', '虎', '对子', '对子', '对子', '2016-08-28 08:25:00', '2016-08-28 08:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('258', '86872', '31', '6', '2016-08-28 08:45:06', '6', '20160828006', '大', '单', '龙', '对子', '顺子', '半顺', '2016-08-28 08:35:00', '2016-08-28 08:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('259', '70251', '15', '7', '2016-08-28 08:55:05', '7', '20160828007', '小', '单', '龙', '杂六', '杂六', '半顺', '2016-08-28 08:45:00', '2016-08-28 08:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('260', '35881', '25', '7', '2016-08-28 09:10:01', '8', '20160828008', '大', '单', '龙', '杂六', '对子', '对子', '2016-08-28 08:55:00', '2016-08-28 09:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('261', '09976', '31', '9', '2016-08-28 09:15:00', '9', '20160828009', '大', '单', '虎', '对子', '对子', '半顺', '2016-08-28 09:10:00', '2016-08-28 09:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('262', '29193', '24', '8', '2016-08-28 09:25:01', '10', '20160828010', '大', '双', '虎', '半顺', '对子', '杂六', '2016-08-28 09:15:00', '2016-08-28 09:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('263', '10882', '19', '8', '2016-08-28 09:35:02', '11', '20160828011', '小', '单', '虎', '半顺', '对子', '对子', '2016-08-28 09:25:00', '2016-08-28 09:35:00', '18322', '54900', '3337');
INSERT INTO `ssc` VALUES ('264', '30954', '21', '9', '2016-08-28 09:45:00', '12', '20160828012', '小', '单', '虎', '半顺', '半顺', '半顺', '2016-08-28 09:35:00', '2016-08-28 09:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('265', '51100', '7', '5', '2016-08-28 09:55:01', '13', '20160828013', '小', '单', '龙', '对子', '对子', '对子', '2016-08-28 09:45:00', '2016-08-28 09:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('266', '38591', '26', '8', '2016-08-28 10:05:00', '14', '20160828014', '大', '双', '龙', '杂六', '半顺', '杂六', '2016-08-28 09:55:00', '2016-08-28 10:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('267', '04506', '15', '6', '2016-08-28 10:10:00', '15', '20160828015', '小', '单', '虎', '半顺', '半顺', '半顺', '2016-08-28 10:05:00', '2016-08-28 10:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('268', '97065', '27', '9', '2016-08-28 10:15:01', '16', '20160828016', '大', '单', '龙', '半顺', '半顺', '半顺', '2016-08-28 10:10:00', '2016-08-28 10:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('269', '50250', '12', '5', '2016-08-28 10:25:00', '17', '20160828017', '小', '双', '龙', '杂六', '杂六', '杂六', '2016-08-28 10:15:00', '2016-08-28 10:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('270', '97730', '26', '9', '2016-08-28 10:35:00', '18', '20160828018', '大', '双', '龙', '对子', '对子', '杂六', '2016-08-28 10:25:00', '2016-08-28 10:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('271', '34594', '25', '6', '2016-08-28 10:45:00', '19', '20160828019', '大', '单', '虎', '顺子', '半顺', '半顺', '2016-08-28 10:35:00', '2016-08-28 10:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('272', '46539', '27', '6', '2016-08-28 15:25:01', '20', '20160828020', '大', '单', '虎', '顺子', '半顺', '杂六', '2016-08-28 10:45:00', '2016-08-28 15:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('273', '09229', '22', '9', '2016-08-28 15:35:00', '21', '20160828021', '小', '双', '虎', '半顺', '对子', '对子', '2016-08-28 15:25:00', '2016-08-28 15:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('274', '60947', '26', '9', '2016-08-28 15:45:01', '22', '20160828022', '大', '双', '虎', '半顺', '半顺', '杂六', '2016-08-28 15:35:00', '2016-08-28 15:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('275', '12934', '19', '8', '2016-08-28 15:55:00', '23', '20160828023', '小', '单', '虎', '半顺', '半顺', '半顺', '2016-08-28 15:45:00', '2016-08-28 15:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('276', '89907', '33', '9', '2016-08-28 16:05:01', '24', '20160828024', '大', '单', '龙', '对子', '对子', '半顺', '2016-08-28 15:55:00', '2016-08-28 16:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('277', '83568', '30', '5', '2016-08-28 16:10:00', '25', '20160828025', '大', '双', '和', '杂六', '半顺', '半顺', '2016-08-28 16:05:00', '2016-08-28 16:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('278', '37409', '23', '9', '2016-08-28 16:15:00', '26', '20160828026', '大', '单', '虎', '半顺', '杂六', '半顺', '2016-08-28 16:10:00', '2016-08-28 16:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('279', '39610', '19', '9', '2016-08-28 16:25:01', '27', '20160828027', '小', '单', '龙', '杂六', '杂六', '半顺', '2016-08-28 16:15:00', '2016-08-28 16:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('280', '68009', '23', '9', '2016-08-28 16:35:05', '28', '20160828028', '大', '单', '虎', '杂六', '对子', '对子', '2016-08-28 16:25:00', '2016-08-28 16:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('281', '37454', '23', '4', '2016-08-28 16:45:00', '29', '20160828029', '大', '单', '虎', '半顺', '半顺', '对子', '2016-08-28 16:35:00', '2016-08-28 16:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('282', '19721', '20', '8', '2016-08-28 16:55:08', '30', '20160828030', '小', '双', '和', '杂六', '杂六', '半顺', '2016-08-28 16:45:00', '2016-08-28 16:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('283', '37084', '22', '8', '2016-08-28 17:05:02', '31', '20160828031', '小', '双', '虎', '杂六', '半顺', '杂六', '2016-08-28 16:55:00', '2016-08-28 17:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('284', '95453', '26', '6', '2016-08-28 17:10:06', '32', '20160828032', '大', '双', '龙', '半顺', '对子', '顺子', '2016-08-28 17:05:00', '2016-08-28 17:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('285', '53694', '27', '6', '2016-08-28 17:15:00', '33', '20160828033', '大', '单', '龙', '半顺', '杂六', '杂六', '2016-08-28 17:10:00', '2016-08-28 17:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('286', '81023', '14', '8', '2016-08-28 17:25:01', '34', '20160828034', '小', '双', '龙', '半顺', '顺子', '半顺', '2016-08-28 17:15:00', '2016-08-28 17:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('287', '09163', '19', '9', '2016-08-28 17:35:00', '35', '20160828035', '小', '单', '虎', '顺子', '杂六', '杂六', '2016-08-28 17:25:00', '2016-08-28 17:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('288', '54037', '19', '7', '2016-08-28 17:45:01', '36', '20160828036', '小', '单', '虎', '半顺', '半顺', '杂六', '2016-08-28 17:35:00', '2016-08-28 17:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('289', '62719', '25', '8', '2016-08-28 17:55:00', '37', '20160828037', '大', '单', '虎', '半顺', '半顺', '杂六', '2016-08-28 17:45:00', '2016-08-28 17:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('290', '84852', '27', '6', '2016-08-28 18:05:00', '38', '20160828038', '大', '单', '龙', '对子', '半顺', '杂六', '2016-08-28 17:55:00', '2016-08-28 18:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('291', '82278', '27', '6', '2016-08-28 18:10:00', '39', '20160828039', '大', '单', '和', '对子', '对子', '半顺', '2016-08-28 18:05:00', '2016-08-28 18:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('292', '58500', '18', '8', '2016-08-28 18:15:01', '40', '20160828040', '小', '双', '龙', '对子', '杂六', '对子', '2016-08-28 18:10:00', '2016-08-28 18:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('293', '17083', '19', '8', '2016-08-28 18:25:00', '41', '20160828041', '小', '单', '虎', '半顺', '半顺', '杂六', '2016-08-28 18:15:00', '2016-08-28 18:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('294', '71494', '25', '8', '2016-08-28 18:35:00', '42', '20160828042', '大', '单', '龙', '杂六', '杂六', '对子', '2016-08-28 18:25:00', '2016-08-28 18:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('295', '64939', '31', '6', '2016-08-28 18:45:00', '43', '20160828043', '大', '单', '虎', '杂六', '半顺', '对子', '2016-08-28 18:35:00', '2016-08-28 18:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('296', '05748', '24', '8', '2016-08-28 18:55:01', '44', '20160828044', '大', '双', '虎', '杂六', '半顺', '半顺', '2016-08-28 18:45:00', '2016-08-28 18:55:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('297', '74636', '26', '4', '2016-08-28 19:05:00', '45', '20160828045', '大', '双', '龙', '半顺', '半顺', '对子', '2016-08-28 18:55:00', '2016-08-28 19:05:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('298', '79539', '33', '6', '2016-08-28 19:10:00', '46', '20160828046', '大', '单', '虎', '杂六', '杂六', '杂六', '2016-08-28 19:05:00', '2016-08-28 19:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('299', '86109', '24', '9', '2016-08-28 19:15:01', '47', '20160828047', '大', '双', '虎', '杂六', '半顺', '顺子', '2016-08-28 19:10:00', '2016-08-28 19:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('300', '21681', '18', '7', '2016-08-28 19:25:00', '48', '20160828048', '小', '双', '龙', '半顺', '杂六', '杂六', '2016-08-28 19:15:00', '2016-08-28 19:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('301', '35699', '32', '6', '2016-08-28 19:35:00', '49', '20160828049', '大', '双', '虎', '半顺', '半顺', '对子', '2016-08-28 19:25:00', '2016-08-28 19:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('302', '99511', '25', '8', '2016-08-28 19:45:01', '50', '20160828050', '大', '单', '龙', '对子', '杂六', '对子', '2016-08-28 19:35:00', '2016-08-28 19:45:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('303', '65868', '33', '3', '2016-08-28 19:55:01', '51', '20160828051', '大', '单', '虎', '半顺', '半顺', '对子', '2016-08-28 19:45:00', '2016-08-28 19:55:00', '4700', '4700', '10000');
INSERT INTO `ssc` VALUES ('304', '19275', '24', '8', '2016-08-28 20:05:00', '52', '20160828052', '大', '双', '虎', '半顺', '杂六', '杂六', '2016-08-28 19:55:00', '2016-08-28 20:05:00', '120', '1100', '1090');
INSERT INTO `ssc` VALUES ('305', '12733', '16', '6', '2016-08-28 20:10:02', '53', '20160828053', '小', '双', '虎', '半顺', '半顺', '对子', '2016-08-28 20:05:00', '2016-08-28 20:10:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('306', '42378', '24', '6', '2016-08-28 20:15:00', '54', '20160828054', '大', '双', '虎', '顺子', '半顺', '半顺', '2016-08-28 20:10:00', '2016-08-28 20:15:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('307', '55720', '19', '7', '2016-08-28 20:25:00', '55', '20160828055', '小', '单', '龙', '对子', '杂六', '杂六', '2016-08-28 20:15:00', '2016-08-28 20:25:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('308', '16962', '24', '8', '2016-08-28 20:35:00', '56', '20160828056', '大', '双', '虎', '杂六', '对子', '杂六', '2016-08-28 20:25:00', '2016-08-28 20:35:00', '0', '0', '0');
INSERT INTO `ssc` VALUES ('309', '91848', '30', '8', '2016-08-28 20:45:01', '57', '20160828057', '大', '双', '龙', '半顺', '杂六', '对子', '2016-08-28 20:35:00', '2016-08-28 20:45:00', '0', '0', '0');

-- ----------------------------
-- Table structure for `sscorder`
-- ----------------------------
DROP TABLE IF EXISTS `sscorder`;
CREATE TABLE `sscorder` (
  `id` int(11) NOT NULL auto_increment,
  `pos` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `memid` int(11) NOT NULL,
  `otime` datetime NOT NULL,
  `money` int(11) NOT NULL,
  `emoney` int(11) NOT NULL,
  `iswin` int(1) NOT NULL default '-1' COMMENT '0：赔，1：赢，2：作废',
  `sscid` int(11) default NULL,
  `qihao` varchar(22) NOT NULL,
  `detail` varchar(30) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=823 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sscorder
-- ----------------------------
INSERT INTO `sscorder` VALUES ('33', '1', '6', '3', '2016-08-21 01:31:14', '6', '5880', '-1', null, '20160821002', null);
INSERT INTO `sscorder` VALUES ('34', '1', '1', '3', '2016-08-21 01:31:14', '1', '980', '-1', null, '20160821002', null);
INSERT INTO `sscorder` VALUES ('35', '1', '2', '3', '2016-08-21 01:31:14', '2', '1960', '-1', null, '20160821002', null);
INSERT INTO `sscorder` VALUES ('36', '1', '3', '3', '2016-08-21 01:31:14', '3', '2940', '-1', null, '20160821002', null);
INSERT INTO `sscorder` VALUES ('37', '1', '4', '3', '2016-08-21 01:31:14', '4', '3920', '-1', null, '20160821002', null);
INSERT INTO `sscorder` VALUES ('38', '1', '5', '3', '2016-08-21 01:31:14', '5', '4900', '-1', null, '20160821002', null);
INSERT INTO `sscorder` VALUES ('39', '1', '2', '3', '2016-08-21 01:45:06', '21', '20580', '-1', null, '20160821004', null);
INSERT INTO `sscorder` VALUES ('40', '1', '8', '3', '2016-08-21 01:52:46', '100', '980', '-1', null, '20160821004', null);
INSERT INTO `sscorder` VALUES ('41', '1', '9', '3', '2016-08-21 01:52:46', '200', '1960', '-1', null, '20160821004', null);
INSERT INTO `sscorder` VALUES ('42', '1', '3', '3', '2016-08-21 01:52:46', '300', '2940', '-1', null, '20160821004', null);
INSERT INTO `sscorder` VALUES ('43', '1', '4', '3', '2016-08-21 01:52:46', '100', '980', '-1', null, '20160821004', null);
INSERT INTO `sscorder` VALUES ('44', '1', '2', '3', '2016-08-21 01:54:08', '300', '2940', '-1', null, '20160821004', null);
INSERT INTO `sscorder` VALUES ('45', '1', '3', '3', '2016-08-21 01:54:08', '100', '980', '-1', null, '20160821004', null);
INSERT INTO `sscorder` VALUES ('46', '1', '1', '3', '2016-08-21 02:13:11', '1200', '11760', '-1', null, '20160821009', null);
INSERT INTO `sscorder` VALUES ('47', '1', '2', '3', '2016-08-21 02:13:11', '200', '1960', '-1', null, '20160821009', null);
INSERT INTO `sscorder` VALUES ('48', '1', '3', '3', '2016-08-21 02:13:11', '200', '1960', '-1', null, '20160821009', null);
INSERT INTO `sscorder` VALUES ('49', '1', '4', '3', '2016-08-21 02:13:11', '300', '2940', '-1', null, '20160821009', null);
INSERT INTO `sscorder` VALUES ('50', '1', '6', '3', '2016-08-21 09:33:52', '300', '2940', '-1', null, '20160821089', null);
INSERT INTO `sscorder` VALUES ('51', '1', '7', '3', '2016-08-21 09:33:52', '500', '4900', '-1', null, '20160821089', null);
INSERT INTO `sscorder` VALUES ('52', '1', '8', '3', '2016-08-21 09:33:52', '600', '5880', '-1', null, '20160821089', null);
INSERT INTO `sscorder` VALUES ('53', '1', '9', '3', '2016-08-21 09:33:52', '700', '6860', '-1', null, '20160821089', null);
INSERT INTO `sscorder` VALUES ('54', '1', '1', '3', '2016-08-21 09:33:52', '100', '980', '-1', null, '20160821089', null);
INSERT INTO `sscorder` VALUES ('55', '1', '2', '3', '2016-08-21 09:33:52', '200', '1960', '-1', null, '20160821089', null);
INSERT INTO `sscorder` VALUES ('56', '1', '3', '3', '2016-08-21 09:33:52', '300', '2940', '-1', null, '20160821089', null);
INSERT INTO `sscorder` VALUES ('57', '1', '4', '3', '2016-08-21 09:33:52', '400', '3920', '-1', null, '20160821089', null);
INSERT INTO `sscorder` VALUES ('58', '1', '5', '3', '2016-08-21 09:33:52', '500', '4900', '-1', null, '20160821089', null);
INSERT INTO `sscorder` VALUES ('59', '1', '10', '3', '2016-08-21 09:33:52', '600', '5880', '-1', null, '20160821089', null);
INSERT INTO `sscorder` VALUES ('60', '1', '6', '3', '2016-08-21 09:40:25', '3300', '32340', '-1', null, '20160821090', null);
INSERT INTO `sscorder` VALUES ('61', '1', '7', '3', '2016-08-21 09:40:25', '1200', '11760', '-1', null, '20160821090', null);
INSERT INTO `sscorder` VALUES ('62', '1', '8', '3', '2016-08-21 09:40:25', '2100', '20580', '-1', null, '20160821090', null);
INSERT INTO `sscorder` VALUES ('63', '1', '9', '3', '2016-08-21 09:40:25', '100', '980', '-1', null, '20160821090', null);
INSERT INTO `sscorder` VALUES ('64', '1', '1', '3', '2016-08-21 09:40:25', '1100', '10780', '-1', null, '20160821090', null);
INSERT INTO `sscorder` VALUES ('65', '1', '2', '3', '2016-08-21 09:40:25', '1200', '11760', '-1', null, '20160821090', null);
INSERT INTO `sscorder` VALUES ('66', '1', '3', '3', '2016-08-21 09:40:25', '1200', '11760', '-1', null, '20160821090', null);
INSERT INTO `sscorder` VALUES ('67', '1', '4', '3', '2016-08-21 09:40:25', '1200', '11760', '-1', null, '20160821090', null);
INSERT INTO `sscorder` VALUES ('68', '1', '5', '3', '2016-08-21 09:40:25', '1300', '12740', '-1', null, '20160821090', null);
INSERT INTO `sscorder` VALUES ('69', '1', '10', '3', '2016-08-21 09:40:25', '1200', '11760', '-1', null, '20160821090', null);
INSERT INTO `sscorder` VALUES ('70', '1', '6', '3', '2016-08-21 09:50:44', '5600', '54880', '0', '95', '20160821092', null);
INSERT INTO `sscorder` VALUES ('71', '1', '7', '3', '2016-08-21 09:50:44', '4500', '44100', '0', '95', '20160821092', null);
INSERT INTO `sscorder` VALUES ('72', '1', '8', '3', '2016-08-21 09:50:44', '3400', '33320', '0', '95', '20160821092', null);
INSERT INTO `sscorder` VALUES ('73', '1', '9', '3', '2016-08-21 09:50:44', '3200', '31360', '1', '95', '20160821092', null);
INSERT INTO `sscorder` VALUES ('74', '1', '1', '3', '2016-08-21 09:50:44', '1200', '11760', '0', '95', '20160821092', null);
INSERT INTO `sscorder` VALUES ('75', '1', '2', '3', '2016-08-21 09:50:44', '1200', '11760', '0', '95', '20160821092', null);
INSERT INTO `sscorder` VALUES ('76', '1', '3', '3', '2016-08-21 09:50:44', '1200', '11760', '0', '95', '20160821092', null);
INSERT INTO `sscorder` VALUES ('77', '1', '4', '3', '2016-08-21 09:50:44', '1200', '11760', '0', '95', '20160821092', null);
INSERT INTO `sscorder` VALUES ('78', '1', '5', '3', '2016-08-21 09:50:44', '1200', '11760', '0', '95', '20160821092', null);
INSERT INTO `sscorder` VALUES ('79', '1', '10', '3', '2016-08-21 09:50:44', '3200', '31360', '0', '95', '20160821092', null);
INSERT INTO `sscorder` VALUES ('80', '1', '6', '3', '2016-08-21 09:58:53', '3200', '31360', '0', '95', '20160821094', null);
INSERT INTO `sscorder` VALUES ('81', '1', '7', '3', '2016-08-21 09:58:53', '400', '3920', '0', '95', '20160821094', null);
INSERT INTO `sscorder` VALUES ('82', '1', '8', '3', '2016-08-21 09:58:53', '100', '980', '0', '95', '20160821094', null);
INSERT INTO `sscorder` VALUES ('83', '1', '9', '3', '2016-08-21 09:58:53', '1200', '11760', '1', '95', '20160821094', null);
INSERT INTO `sscorder` VALUES ('84', '1', '1', '3', '2016-08-21 09:58:53', '1200', '11760', '0', '95', '20160821094', null);
INSERT INTO `sscorder` VALUES ('85', '1', '2', '3', '2016-08-21 09:58:53', '2300', '22540', '0', '95', '20160821094', null);
INSERT INTO `sscorder` VALUES ('86', '1', '3', '3', '2016-08-21 09:58:53', '2300', '22540', '0', '95', '20160821094', null);
INSERT INTO `sscorder` VALUES ('87', '1', '4', '3', '2016-08-21 09:58:53', '200', '1960', '0', '95', '20160821094', null);
INSERT INTO `sscorder` VALUES ('88', '1', '5', '3', '2016-08-21 09:58:53', '4300', '42140', '0', '95', '20160821094', null);
INSERT INTO `sscorder` VALUES ('89', '1', '10', '3', '2016-08-21 09:58:53', '2300', '22540', '0', '95', '20160821094', null);
INSERT INTO `sscorder` VALUES ('90', '1', '1', '3', '2016-08-21 10:42:21', '12300', '120540', '0', '105', '20160821105', '绗?1浣嶏細绗?0鐞?');
INSERT INTO `sscorder` VALUES ('91', '1', '2', '3', '2016-08-21 10:42:21', '1200', '11760', '0', '105', '20160821105', '绗?1浣嶏細绗?1鐞?');
INSERT INTO `sscorder` VALUES ('92', '7', '5', '3', '2016-08-21 10:45:32', '2200', '4862', '1', '106', '20160821105', '前三位：杂六');
INSERT INTO `sscorder` VALUES ('93', '7', '3', '3', '2016-08-21 10:45:32', '12100', '34001', '0', '106', '20160821105', '前三位：对子');
INSERT INTO `sscorder` VALUES ('94', '1', '1', '3', '2016-08-21 10:45:32', '1200', '11760', '1', '106', '20160821105', '第1位：第0球');
INSERT INTO `sscorder` VALUES ('95', '1', '2', '3', '2016-08-21 10:45:32', '1200', '11760', '0', '106', '20160821105', '第1位：第1球');
INSERT INTO `sscorder` VALUES ('96', '1', '6', '3', '2016-08-21 10:49:03', '600', '5880', '0', '106', '20160821105', '第1位：第5球');
INSERT INTO `sscorder` VALUES ('97', '1', '7', '3', '2016-08-21 10:49:03', '700', '6860', '0', '106', '20160821105', '第1位：第6球');
INSERT INTO `sscorder` VALUES ('98', '1', '8', '3', '2016-08-21 10:49:03', '800', '7840', '0', '106', '20160821105', '第1位：第7球');
INSERT INTO `sscorder` VALUES ('99', '1', '9', '3', '2016-08-21 10:49:03', '900', '8820', '0', '106', '20160821105', '第1位：第8球');
INSERT INTO `sscorder` VALUES ('100', '1', '1', '3', '2016-08-21 10:49:03', '100', '980', '1', '106', '20160821105', '第1位：第0球');
INSERT INTO `sscorder` VALUES ('101', '1', '2', '3', '2016-08-21 10:49:03', '200', '1960', '0', '106', '20160821105', '第1位：第1球');
INSERT INTO `sscorder` VALUES ('102', '1', '3', '3', '2016-08-21 10:49:03', '300', '2940', '0', '106', '20160821105', '第1位：第2球');
INSERT INTO `sscorder` VALUES ('103', '1', '4', '3', '2016-08-21 10:49:03', '400', '3920', '0', '106', '20160821105', '第1位：第3球');
INSERT INTO `sscorder` VALUES ('104', '1', '5', '3', '2016-08-21 10:49:03', '500', '4900', '0', '106', '20160821105', '第1位：第4球');
INSERT INTO `sscorder` VALUES ('105', '1', '10', '3', '2016-08-21 10:49:03', '1000', '9800', '0', '106', '20160821105', '第1位：第9球');
INSERT INTO `sscorder` VALUES ('106', '1', '1', '3', '2016-08-21 13:00:39', '1200', '11760', '0', '112', '20160821111', '第1位：第0球');
INSERT INTO `sscorder` VALUES ('107', '1', '2', '3', '2016-08-21 13:00:39', '300', '2940', '0', '112', '20160821111', '第1位：第1球');
INSERT INTO `sscorder` VALUES ('108', '1', '3', '3', '2016-08-21 13:00:39', '4300', '42140', '0', '112', '20160821111', '第1位：第2球');
INSERT INTO `sscorder` VALUES ('109', '1', '4', '3', '2016-08-21 13:00:39', '200', '1960', '0', '112', '20160821111', '第1位：第3球');
INSERT INTO `sscorder` VALUES ('110', '1', '6', '3', '2016-08-21 13:06:38', '600', '5880', '-1', null, '20160821114', '第1位：第5球');
INSERT INTO `sscorder` VALUES ('111', '1', '7', '3', '2016-08-21 13:06:38', '700', '6860', '-1', null, '20160821114', '第1位：第6球');
INSERT INTO `sscorder` VALUES ('112', '1', '8', '3', '2016-08-21 13:06:38', '800', '7840', '-1', null, '20160821114', '第1位：第7球');
INSERT INTO `sscorder` VALUES ('113', '1', '9', '3', '2016-08-21 13:06:38', '900', '8820', '-1', null, '20160821114', '第1位：第8球');
INSERT INTO `sscorder` VALUES ('114', '1', '1', '3', '2016-08-21 13:06:38', '100', '980', '-1', null, '20160821114', '第1位：第0球');
INSERT INTO `sscorder` VALUES ('115', '1', '2', '3', '2016-08-21 13:06:38', '200', '1960', '-1', null, '20160821114', '第1位：第1球');
INSERT INTO `sscorder` VALUES ('116', '1', '3', '3', '2016-08-21 13:06:38', '300', '2940', '-1', null, '20160821114', '第1位：第2球');
INSERT INTO `sscorder` VALUES ('117', '1', '4', '3', '2016-08-21 13:06:38', '400', '3920', '-1', null, '20160821114', '第1位：第3球');
INSERT INTO `sscorder` VALUES ('118', '1', '5', '3', '2016-08-21 13:06:38', '500', '4900', '-1', null, '20160821114', '第1位：第4球');
INSERT INTO `sscorder` VALUES ('119', '1', '10', '3', '2016-08-21 13:06:38', '1100', '10780', '-1', null, '20160821114', '第1位：第9球');
INSERT INTO `sscorder` VALUES ('120', '1', '6', '3', '2016-08-21 17:21:48', '600', '5880', '0', '121', '20160821120', '第1位：第5球');
INSERT INTO `sscorder` VALUES ('121', '1', '7', '3', '2016-08-21 17:21:48', '700', '6860', '0', '121', '20160821120', '第1位：第6球');
INSERT INTO `sscorder` VALUES ('122', '1', '8', '3', '2016-08-21 17:21:48', '800', '7840', '0', '121', '20160821120', '第1位：第7球');
INSERT INTO `sscorder` VALUES ('123', '1', '9', '3', '2016-08-21 17:21:48', '900', '8820', '0', '121', '20160821120', '第1位：第8球');
INSERT INTO `sscorder` VALUES ('124', '1', '1', '3', '2016-08-21 17:21:48', '100', '980', '0', '121', '20160821120', '第1位：第0球');
INSERT INTO `sscorder` VALUES ('125', '1', '2', '3', '2016-08-21 17:21:48', '200', '1960', '0', '121', '20160821120', '第1位：第1球');
INSERT INTO `sscorder` VALUES ('126', '1', '3', '3', '2016-08-21 17:21:48', '300', '2940', '0', '121', '20160821120', '第1位：第2球');
INSERT INTO `sscorder` VALUES ('127', '1', '4', '3', '2016-08-21 17:21:48', '400', '3920', '0', '121', '20160821120', '第1位：第3球');
INSERT INTO `sscorder` VALUES ('128', '1', '5', '3', '2016-08-21 17:21:48', '500', '4900', '1', '121', '20160821120', '第1位：第4球');
INSERT INTO `sscorder` VALUES ('129', '1', '10', '3', '2016-08-21 17:21:48', '1100', '10780', '0', '121', '20160821120', '第1位：第9球');
INSERT INTO `sscorder` VALUES ('130', '6', '7', '3', '2016-08-21 17:27:39', '700', '0', '1', '122', '20160821121', '和');
INSERT INTO `sscorder` VALUES ('131', '6', '6', '3', '2016-08-21 17:27:39', '600', '1182', '0', '122', '20160821121', '虎');
INSERT INTO `sscorder` VALUES ('132', '6', '5', '3', '2016-08-21 17:27:39', '500', '990', '0', '122', '20160821121', '龙');
INSERT INTO `sscorder` VALUES ('133', '6', '4', '3', '2016-08-21 17:27:39', '400', '788', '1', '122', '20160821121', '总和双');
INSERT INTO `sscorder` VALUES ('134', '6', '3', '3', '2016-08-21 17:27:39', '300', '594', '0', '122', '20160821121', '总和单');
INSERT INTO `sscorder` VALUES ('135', '6', '2', '3', '2016-08-21 17:27:39', '200', '394', '0', '122', '20160821121', '总和小');
INSERT INTO `sscorder` VALUES ('136', '6', '1', '3', '2016-08-21 17:27:39', '100', '198', '1', '122', '20160821121', '总和大');
INSERT INTO `sscorder` VALUES ('137', '7', '4', '3', '2016-08-21 17:30:39', '1400', '3094', '0', '122', '20160821121', '前三位：半顺');
INSERT INTO `sscorder` VALUES ('138', '7', '5', '3', '2016-08-21 17:30:39', '1500', '3315', '1', '122', '20160821121', '前三位：杂六');
INSERT INTO `sscorder` VALUES ('139', '7', '1', '3', '2016-08-21 17:30:39', '1100', '72611', '0', '122', '20160821121', '前三位：豹子');
INSERT INTO `sscorder` VALUES ('140', '7', '2', '3', '2016-08-21 17:30:39', '1200', '14412', '0', '122', '20160821121', '前三位：顺子');
INSERT INTO `sscorder` VALUES ('141', '7', '3', '3', '2016-08-21 17:30:39', '1300', '3653', '0', '122', '20160821121', '前三位：对子');
INSERT INTO `sscorder` VALUES ('142', '1', '6', '3', '2016-08-25 23:14:02', '1100', '10780', '0', '215', '20160825015', '第1位：第5球');
INSERT INTO `sscorder` VALUES ('143', '1', '7', '3', '2016-08-25 23:14:02', '900', '8820', '0', '215', '20160825015', '第1位：第6球');
INSERT INTO `sscorder` VALUES ('144', '1', '8', '3', '2016-08-25 23:14:02', '800', '7840', '0', '215', '20160825015', '第1位：第7球');
INSERT INTO `sscorder` VALUES ('145', '1', '9', '3', '2016-08-25 23:14:02', '700', '6860', '0', '215', '20160825015', '第1位：第8球');
INSERT INTO `sscorder` VALUES ('146', '1', '1', '3', '2016-08-25 23:14:02', '100', '980', '0', '215', '20160825015', '第1位：第0球');
INSERT INTO `sscorder` VALUES ('147', '1', '2', '3', '2016-08-25 23:14:02', '200', '1960', '0', '215', '20160825015', '第1位：第1球');
INSERT INTO `sscorder` VALUES ('148', '1', '3', '3', '2016-08-25 23:14:02', '300', '2940', '0', '215', '20160825015', '第1位：第2球');
INSERT INTO `sscorder` VALUES ('149', '1', '4', '3', '2016-08-25 23:14:02', '400', '3920', '0', '215', '20160825015', '第1位：第3球');
INSERT INTO `sscorder` VALUES ('150', '1', '5', '3', '2016-08-25 23:14:02', '500', '4900', '1', '215', '20160825015', '第1位：第4球');
INSERT INTO `sscorder` VALUES ('151', '1', '10', '3', '2016-08-25 23:14:02', '600', '5880', '0', '215', '20160825015', '第1位：第9球');
INSERT INTO `sscorder` VALUES ('152', '1', '6', '3', '2016-08-26 01:56:03', '1200', '11760', '0', '233', '20160826013', '第1位：第5球');
INSERT INTO `sscorder` VALUES ('153', '7', '4', '3', '2016-08-26 01:56:03', '2200', '4862', '0', '233', '20160826013', '前三位：半顺');
INSERT INTO `sscorder` VALUES ('154', '7', '5', '3', '2016-08-26 01:56:03', '2300', '5083', '1', '233', '20160826013', '前三位：杂六');
INSERT INTO `sscorder` VALUES ('155', '1', '7', '3', '2016-08-26 01:56:03', '1200', '11760', '0', '233', '20160826013', '第1位：第6球');
INSERT INTO `sscorder` VALUES ('156', '1', '8', '3', '2016-08-26 01:56:03', '2100', '20580', '0', '233', '20160826013', '第1位：第7球');
INSERT INTO `sscorder` VALUES ('157', '1', '9', '3', '2016-08-26 01:56:03', '2300', '22540', '0', '233', '20160826013', '第1位：第8球');
INSERT INTO `sscorder` VALUES ('158', '7', '1', '3', '2016-08-26 01:56:03', '1200', '79212', '0', '233', '20160826013', '前三位：豹子');
INSERT INTO `sscorder` VALUES ('159', '7', '2', '3', '2016-08-26 01:56:03', '1200', '14412', '0', '233', '20160826013', '前三位：顺子');
INSERT INTO `sscorder` VALUES ('160', '7', '3', '3', '2016-08-26 01:56:03', '1200', '3372', '0', '233', '20160826013', '前三位：对子');
INSERT INTO `sscorder` VALUES ('161', '1', '1', '3', '2016-08-26 01:56:03', '12300', '120540', '0', '233', '20160826013', '第1位：第0球');
INSERT INTO `sscorder` VALUES ('162', '1', '2', '3', '2016-08-26 01:56:03', '1200', '11760', '0', '233', '20160826013', '第1位：第1球');
INSERT INTO `sscorder` VALUES ('163', '1', '3', '3', '2016-08-26 01:56:03', '1200', '11760', '0', '233', '20160826013', '第1位：第2球');
INSERT INTO `sscorder` VALUES ('164', '1', '4', '3', '2016-08-26 01:56:03', '2300', '22540', '0', '233', '20160826013', '第1位：第3球');
INSERT INTO `sscorder` VALUES ('165', '1', '5', '3', '2016-08-26 01:56:03', '3200', '31360', '1', '233', '20160826013', '第1位：第4球');
INSERT INTO `sscorder` VALUES ('166', '1', '12', '3', '2016-08-26 01:56:03', '3400', '6732', '1', '233', '20160826013', '第1位：小');
INSERT INTO `sscorder` VALUES ('167', '1', '11', '3', '2016-08-26 01:56:03', '3200', '6336', '0', '233', '20160826013', '第1位：大');
INSERT INTO `sscorder` VALUES ('168', '6', '7', '3', '2016-08-26 01:56:03', '1200', '0', '1', '233', '20160826013', '和');
INSERT INTO `sscorder` VALUES ('169', '1', '10', '3', '2016-08-26 01:56:03', '100', '980', '0', '233', '20160826013', '第1位：第9球');
INSERT INTO `sscorder` VALUES ('170', '6', '6', '3', '2016-08-26 01:56:03', '200', '394', '0', '233', '20160826013', '虎');
INSERT INTO `sscorder` VALUES ('171', '6', '5', '3', '2016-08-26 01:56:03', '400', '792', '0', '233', '20160826013', '龙');
INSERT INTO `sscorder` VALUES ('172', '6', '4', '3', '2016-08-26 01:56:03', '400', '788', '0', '233', '20160826013', '总和双');
INSERT INTO `sscorder` VALUES ('173', '6', '3', '3', '2016-08-26 01:56:03', '1200', '2376', '1', '233', '20160826013', '总和单');
INSERT INTO `sscorder` VALUES ('174', '6', '2', '3', '2016-08-26 01:56:03', '300', '591', '1', '233', '20160826013', '总和小');
INSERT INTO `sscorder` VALUES ('175', '6', '1', '3', '2016-08-26 01:56:03', '200', '396', '0', '233', '20160826013', '总和大');
INSERT INTO `sscorder` VALUES ('176', '1', '13', '3', '2016-08-26 01:56:03', '3200', '6336', '0', '233', '20160826013', '第1位：单');
INSERT INTO `sscorder` VALUES ('177', '1', '14', '3', '2016-08-26 01:56:03', '2300', '4554', '1', '233', '20160826013', '第1位：双');
INSERT INTO `sscorder` VALUES ('178', '1', '6', '3', '2016-08-26 01:56:34', '400', '3920', '0', '233', '20160826013', '第1位：第5球');
INSERT INTO `sscorder` VALUES ('179', '7', '4', '3', '2016-08-26 01:56:34', '200', '442', '0', '233', '20160826013', '前三位：半顺');
INSERT INTO `sscorder` VALUES ('180', '7', '5', '3', '2016-08-26 01:56:34', '2300', '5083', '1', '233', '20160826013', '前三位：杂六');
INSERT INTO `sscorder` VALUES ('181', '1', '7', '3', '2016-08-26 01:56:34', '400', '3920', '0', '233', '20160826013', '第1位：第6球');
INSERT INTO `sscorder` VALUES ('182', '1', '8', '3', '2016-08-26 01:56:34', '300', '2940', '0', '233', '20160826013', '第1位：第7球');
INSERT INTO `sscorder` VALUES ('183', '1', '9', '3', '2016-08-26 01:56:34', '200', '1960', '0', '233', '20160826013', '第1位：第8球');
INSERT INTO `sscorder` VALUES ('184', '7', '1', '3', '2016-08-26 01:56:34', '4300', '283843', '0', '233', '20160826013', '前三位：豹子');
INSERT INTO `sscorder` VALUES ('185', '7', '2', '3', '2016-08-26 01:56:34', '400', '4804', '0', '233', '20160826013', '前三位：顺子');
INSERT INTO `sscorder` VALUES ('186', '7', '3', '3', '2016-08-26 01:56:34', '2100', '5901', '0', '233', '20160826013', '前三位：对子');
INSERT INTO `sscorder` VALUES ('187', '1', '1', '3', '2016-08-26 01:56:34', '500', '4900', '0', '233', '20160826013', '第1位：第0球');
INSERT INTO `sscorder` VALUES ('188', '1', '2', '3', '2016-08-26 01:56:34', '500', '4900', '0', '233', '20160826013', '第1位：第1球');
INSERT INTO `sscorder` VALUES ('189', '1', '3', '3', '2016-08-26 01:56:34', '200', '1960', '0', '233', '20160826013', '第1位：第2球');
INSERT INTO `sscorder` VALUES ('190', '1', '4', '3', '2016-08-26 01:56:34', '300', '2940', '0', '233', '20160826013', '第1位：第3球');
INSERT INTO `sscorder` VALUES ('191', '1', '5', '3', '2016-08-26 01:56:34', '300', '2940', '1', '233', '20160826013', '第1位：第4球');
INSERT INTO `sscorder` VALUES ('192', '1', '12', '3', '2016-08-26 01:56:34', '600', '1188', '1', '233', '20160826013', '第1位：小');
INSERT INTO `sscorder` VALUES ('193', '1', '11', '3', '2016-08-26 01:56:34', '4300', '8514', '0', '233', '20160826013', '第1位：大');
INSERT INTO `sscorder` VALUES ('194', '6', '7', '3', '2016-08-26 01:56:34', '1200', '0', '1', '233', '20160826013', '和');
INSERT INTO `sscorder` VALUES ('195', '1', '10', '3', '2016-08-26 01:56:34', '200', '1960', '0', '233', '20160826013', '第1位：第9球');
INSERT INTO `sscorder` VALUES ('196', '6', '6', '3', '2016-08-26 01:56:34', '200', '394', '0', '233', '20160826013', '虎');
INSERT INTO `sscorder` VALUES ('197', '6', '5', '3', '2016-08-26 01:56:34', '2300', '4554', '0', '233', '20160826013', '龙');
INSERT INTO `sscorder` VALUES ('198', '6', '4', '3', '2016-08-26 01:56:34', '2300', '4531', '0', '233', '20160826013', '总和双');
INSERT INTO `sscorder` VALUES ('199', '6', '3', '3', '2016-08-26 01:56:34', '200', '396', '1', '233', '20160826013', '总和单');
INSERT INTO `sscorder` VALUES ('200', '6', '2', '3', '2016-08-26 01:56:34', '1200', '2364', '1', '233', '20160826013', '总和小');
INSERT INTO `sscorder` VALUES ('201', '6', '1', '3', '2016-08-26 01:56:34', '3200', '6336', '0', '233', '20160826013', '总和大');
INSERT INTO `sscorder` VALUES ('202', '1', '13', '3', '2016-08-26 01:56:34', '400', '792', '0', '233', '20160826013', '第1位：单');
INSERT INTO `sscorder` VALUES ('203', '1', '14', '3', '2016-08-26 01:56:34', '200', '396', '1', '233', '20160826013', '第1位：双');
INSERT INTO `sscorder` VALUES ('204', '2', '1', '3', '2016-08-26 01:56:52', '300', '2940', '0', '233', '20160826013', '第2位：第0球');
INSERT INTO `sscorder` VALUES ('205', '2', '2', '3', '2016-08-26 01:56:52', '200', '1960', '0', '233', '20160826013', '第2位：第1球');
INSERT INTO `sscorder` VALUES ('206', '2', '3', '3', '2016-08-26 01:56:52', '100', '980', '1', '233', '20160826013', '第2位：第2球');
INSERT INTO `sscorder` VALUES ('207', '2', '4', '3', '2016-08-26 01:56:52', '200', '1960', '0', '233', '20160826013', '第2位：第3球');
INSERT INTO `sscorder` VALUES ('208', '2', '9', '3', '2016-08-26 01:56:52', '400', '3920', '0', '233', '20160826013', '第2位：第8球');
INSERT INTO `sscorder` VALUES ('209', '2', '5', '3', '2016-08-26 01:56:52', '300', '2940', '0', '233', '20160826013', '第2位：第4球');
INSERT INTO `sscorder` VALUES ('210', '2', '6', '3', '2016-08-26 01:56:52', '200', '1960', '0', '233', '20160826013', '第2位：第5球');
INSERT INTO `sscorder` VALUES ('211', '2', '7', '3', '2016-08-26 01:56:52', '400', '3920', '0', '233', '20160826013', '第2位：第6球');
INSERT INTO `sscorder` VALUES ('212', '2', '8', '3', '2016-08-26 01:56:52', '700', '6860', '0', '233', '20160826013', '第2位：第7球');
INSERT INTO `sscorder` VALUES ('213', '2', '13', '3', '2016-08-26 01:56:52', '600', '1188', '0', '233', '20160826013', '第2位：单');
INSERT INTO `sscorder` VALUES ('214', '2', '12', '3', '2016-08-26 01:56:52', '400', '792', '1', '233', '20160826013', '第2位：小');
INSERT INTO `sscorder` VALUES ('215', '2', '11', '3', '2016-08-26 01:56:52', '300', '594', '0', '233', '20160826013', '第2位：大');
INSERT INTO `sscorder` VALUES ('216', '2', '10', '3', '2016-08-26 01:56:52', '400', '3920', '0', '233', '20160826013', '第2位：第9球');
INSERT INTO `sscorder` VALUES ('217', '2', '14', '3', '2016-08-26 01:56:52', '500', '990', '1', '233', '20160826013', '第2位：双');
INSERT INTO `sscorder` VALUES ('218', '2', '1', '3', '2016-08-26 01:57:11', '3400', '33320', '0', '233', '20160826013', '第2位：第0球');
INSERT INTO `sscorder` VALUES ('219', '2', '2', '3', '2016-08-26 01:57:11', '500', '4900', '0', '233', '20160826013', '第2位：第1球');
INSERT INTO `sscorder` VALUES ('220', '2', '3', '3', '2016-08-26 01:57:11', '400', '3920', '1', '233', '20160826013', '第2位：第2球');
INSERT INTO `sscorder` VALUES ('221', '2', '4', '3', '2016-08-26 01:57:11', '300', '2940', '0', '233', '20160826013', '第2位：第3球');
INSERT INTO `sscorder` VALUES ('222', '2', '9', '3', '2016-08-26 01:57:11', '500', '4900', '0', '233', '20160826013', '第2位：第8球');
INSERT INTO `sscorder` VALUES ('223', '2', '5', '3', '2016-08-26 01:57:11', '500', '4900', '0', '233', '20160826013', '第2位：第4球');
INSERT INTO `sscorder` VALUES ('224', '2', '6', '3', '2016-08-26 01:57:11', '400', '3920', '0', '233', '20160826013', '第2位：第5球');
INSERT INTO `sscorder` VALUES ('225', '2', '7', '3', '2016-08-26 01:57:11', '100', '980', '0', '233', '20160826013', '第2位：第6球');
INSERT INTO `sscorder` VALUES ('226', '2', '8', '3', '2016-08-26 01:57:11', '200', '1960', '0', '233', '20160826013', '第2位：第7球');
INSERT INTO `sscorder` VALUES ('227', '2', '13', '3', '2016-08-26 01:57:11', '300', '594', '0', '233', '20160826013', '第2位：单');
INSERT INTO `sscorder` VALUES ('228', '2', '12', '3', '2016-08-26 01:57:11', '200', '396', '1', '233', '20160826013', '第2位：小');
INSERT INTO `sscorder` VALUES ('229', '2', '11', '3', '2016-08-26 01:57:11', '300', '594', '0', '233', '20160826013', '第2位：大');
INSERT INTO `sscorder` VALUES ('230', '2', '10', '3', '2016-08-26 01:57:11', '600', '5880', '0', '233', '20160826013', '第2位：第9球');
INSERT INTO `sscorder` VALUES ('231', '2', '14', '3', '2016-08-26 01:57:11', '400', '792', '1', '233', '20160826013', '第2位：双');
INSERT INTO `sscorder` VALUES ('232', '7', '4', '3', '2016-08-26 01:57:32', '300', '663', '0', '233', '20160826013', '前三位：半顺');
INSERT INTO `sscorder` VALUES ('233', '2', '2', '3', '2016-08-26 01:57:32', '100', '980', '0', '233', '20160826013', '第2位：第1球');
INSERT INTO `sscorder` VALUES ('234', '2', '3', '3', '2016-08-26 01:57:32', '200', '1960', '1', '233', '20160826013', '第2位：第2球');
INSERT INTO `sscorder` VALUES ('235', '2', '4', '3', '2016-08-26 01:57:32', '400', '3920', '0', '233', '20160826013', '第2位：第3球');
INSERT INTO `sscorder` VALUES ('236', '7', '1', '3', '2016-08-26 01:57:32', '700', '46207', '0', '233', '20160826013', '前三位：豹子');
INSERT INTO `sscorder` VALUES ('237', '7', '2', '3', '2016-08-26 01:57:32', '500', '6005', '0', '233', '20160826013', '前三位：顺子');
INSERT INTO `sscorder` VALUES ('238', '7', '3', '3', '2016-08-26 01:57:32', '400', '1124', '0', '233', '20160826013', '前三位：对子');
INSERT INTO `sscorder` VALUES ('239', '2', '9', '3', '2016-08-26 01:57:32', '300', '2940', '0', '233', '20160826013', '第2位：第8球');
INSERT INTO `sscorder` VALUES ('240', '2', '5', '3', '2016-08-26 01:57:32', '500', '4900', '0', '233', '20160826013', '第2位：第4球');
INSERT INTO `sscorder` VALUES ('241', '2', '6', '3', '2016-08-26 01:57:32', '600', '5880', '0', '233', '20160826013', '第2位：第5球');
INSERT INTO `sscorder` VALUES ('242', '2', '7', '3', '2016-08-26 01:57:32', '700', '6860', '0', '233', '20160826013', '第2位：第6球');
INSERT INTO `sscorder` VALUES ('243', '2', '8', '3', '2016-08-26 01:57:32', '500', '4900', '0', '233', '20160826013', '第2位：第7球');
INSERT INTO `sscorder` VALUES ('244', '2', '13', '3', '2016-08-26 01:57:32', '300', '594', '0', '233', '20160826013', '第2位：单');
INSERT INTO `sscorder` VALUES ('245', '2', '12', '3', '2016-08-26 01:57:32', '400', '792', '1', '233', '20160826013', '第2位：小');
INSERT INTO `sscorder` VALUES ('246', '2', '11', '3', '2016-08-26 01:57:32', '600', '1188', '0', '233', '20160826013', '第2位：大');
INSERT INTO `sscorder` VALUES ('247', '2', '10', '3', '2016-08-26 01:57:32', '500', '4900', '0', '233', '20160826013', '第2位：第9球');
INSERT INTO `sscorder` VALUES ('248', '6', '6', '3', '2016-08-26 01:57:32', '500', '985', '0', '233', '20160826013', '虎');
INSERT INTO `sscorder` VALUES ('249', '6', '5', '3', '2016-08-26 01:57:32', '300', '594', '0', '233', '20160826013', '龙');
INSERT INTO `sscorder` VALUES ('250', '6', '4', '3', '2016-08-26 01:57:32', '400', '788', '0', '233', '20160826013', '总和双');
INSERT INTO `sscorder` VALUES ('251', '6', '3', '3', '2016-08-26 01:57:32', '6500', '12870', '1', '233', '20160826013', '总和单');
INSERT INTO `sscorder` VALUES ('252', '6', '2', '3', '2016-08-26 01:57:32', '700', '1379', '1', '233', '20160826013', '总和小');
INSERT INTO `sscorder` VALUES ('253', '6', '1', '3', '2016-08-26 01:57:32', '600', '1188', '0', '233', '20160826013', '总和大');
INSERT INTO `sscorder` VALUES ('254', '2', '14', '3', '2016-08-26 01:57:32', '500', '990', '1', '233', '20160826013', '第2位：双');
INSERT INTO `sscorder` VALUES ('255', '7', '4', '3', '2016-08-26 01:57:52', '300', '663', '0', '233', '20160826013', '前三位：半顺');
INSERT INTO `sscorder` VALUES ('256', '7', '5', '3', '2016-08-26 01:57:52', '100', '221', '1', '233', '20160826013', '前三位：杂六');
INSERT INTO `sscorder` VALUES ('257', '2', '2', '3', '2016-08-26 01:57:52', '600', '5880', '0', '233', '20160826013', '第2位：第1球');
INSERT INTO `sscorder` VALUES ('258', '2', '3', '3', '2016-08-26 01:57:52', '700', '6860', '1', '233', '20160826013', '第2位：第2球');
INSERT INTO `sscorder` VALUES ('259', '2', '4', '3', '2016-08-26 01:57:52', '800', '7840', '0', '233', '20160826013', '第2位：第3球');
INSERT INTO `sscorder` VALUES ('260', '7', '1', '3', '2016-08-26 01:57:52', '7800', '514878', '0', '233', '20160826013', '前三位：豹子');
INSERT INTO `sscorder` VALUES ('261', '7', '2', '3', '2016-08-26 01:57:52', '600', '7206', '0', '233', '20160826013', '前三位：顺子');
INSERT INTO `sscorder` VALUES ('262', '7', '3', '3', '2016-08-26 01:57:52', '4500', '12645', '0', '233', '20160826013', '前三位：对子');
INSERT INTO `sscorder` VALUES ('263', '2', '9', '3', '2016-08-26 01:57:52', '700', '6860', '0', '233', '20160826013', '第2位：第8球');
INSERT INTO `sscorder` VALUES ('264', '2', '5', '3', '2016-08-26 01:57:52', '600', '5880', '0', '233', '20160826013', '第2位：第4球');
INSERT INTO `sscorder` VALUES ('265', '2', '6', '3', '2016-08-26 01:57:52', '400', '3920', '0', '233', '20160826013', '第2位：第5球');
INSERT INTO `sscorder` VALUES ('266', '2', '7', '3', '2016-08-26 01:57:52', '500', '4900', '0', '233', '20160826013', '第2位：第6球');
INSERT INTO `sscorder` VALUES ('267', '2', '8', '3', '2016-08-26 01:57:52', '700', '6860', '0', '233', '20160826013', '第2位：第7球');
INSERT INTO `sscorder` VALUES ('268', '2', '13', '3', '2016-08-26 01:57:52', '300', '594', '0', '233', '20160826013', '第2位：单');
INSERT INTO `sscorder` VALUES ('269', '2', '12', '3', '2016-08-26 01:57:52', '5400', '10692', '1', '233', '20160826013', '第2位：小');
INSERT INTO `sscorder` VALUES ('270', '2', '11', '3', '2016-08-26 01:57:52', '600', '1188', '0', '233', '20160826013', '第2位：大');
INSERT INTO `sscorder` VALUES ('271', '2', '10', '3', '2016-08-26 01:57:52', '800', '7840', '0', '233', '20160826013', '第2位：第9球');
INSERT INTO `sscorder` VALUES ('272', '6', '7', '3', '2016-08-26 01:57:52', '700', '0', '1', '233', '20160826013', '和');
INSERT INTO `sscorder` VALUES ('273', '6', '6', '3', '2016-08-26 01:57:52', '600', '1182', '0', '233', '20160826013', '虎');
INSERT INTO `sscorder` VALUES ('274', '6', '5', '3', '2016-08-26 01:57:52', '400', '792', '0', '233', '20160826013', '龙');
INSERT INTO `sscorder` VALUES ('275', '6', '4', '3', '2016-08-26 01:57:52', '500', '985', '0', '233', '20160826013', '总和双');
INSERT INTO `sscorder` VALUES ('276', '6', '3', '3', '2016-08-26 01:57:52', '700', '1386', '1', '233', '20160826013', '总和单');
INSERT INTO `sscorder` VALUES ('277', '6', '2', '3', '2016-08-26 01:57:52', '600', '1182', '1', '233', '20160826013', '总和小');
INSERT INTO `sscorder` VALUES ('278', '6', '1', '3', '2016-08-26 01:57:52', '500', '990', '0', '233', '20160826013', '总和大');
INSERT INTO `sscorder` VALUES ('279', '2', '14', '3', '2016-08-26 01:57:52', '400', '792', '1', '233', '20160826013', '第2位：双');
INSERT INTO `sscorder` VALUES ('280', '7', '4', '3', '2016-08-26 01:58:12', '700', '1547', '0', '233', '20160826013', '前三位：半顺');
INSERT INTO `sscorder` VALUES ('281', '7', '5', '3', '2016-08-26 01:58:12', '500', '1105', '1', '233', '20160826013', '前三位：杂六');
INSERT INTO `sscorder` VALUES ('282', '3', '3', '3', '2016-08-26 01:58:12', '700', '6860', '0', '233', '20160826013', '第3位：第2球');
INSERT INTO `sscorder` VALUES ('283', '7', '1', '3', '2016-08-26 01:58:12', '700', '46207', '0', '233', '20160826013', '前三位：豹子');
INSERT INTO `sscorder` VALUES ('284', '3', '2', '3', '2016-08-26 01:58:12', '7800', '76440', '0', '233', '20160826013', '第3位：第1球');
INSERT INTO `sscorder` VALUES ('285', '7', '2', '3', '2016-08-26 01:58:12', '500', '6005', '0', '233', '20160826013', '前三位：顺子');
INSERT INTO `sscorder` VALUES ('286', '3', '1', '3', '2016-08-26 01:58:12', '600', '5880', '0', '233', '20160826013', '第3位：第0球');
INSERT INTO `sscorder` VALUES ('287', '7', '3', '3', '2016-08-26 01:58:12', '600', '1686', '0', '233', '20160826013', '前三位：对子');
INSERT INTO `sscorder` VALUES ('288', '3', '7', '3', '2016-08-26 01:58:12', '600', '5880', '0', '233', '20160826013', '第3位：第6球');
INSERT INTO `sscorder` VALUES ('289', '3', '6', '3', '2016-08-26 01:58:12', '500', '4900', '0', '233', '20160826013', '第3位：第5球');
INSERT INTO `sscorder` VALUES ('290', '3', '5', '3', '2016-08-26 01:58:12', '5400', '52920', '0', '233', '20160826013', '第3位：第4球');
INSERT INTO `sscorder` VALUES ('291', '3', '4', '3', '2016-08-26 01:58:12', '600', '5880', '0', '233', '20160826013', '第3位：第3球');
INSERT INTO `sscorder` VALUES ('292', '3', '9', '3', '2016-08-26 01:58:12', '400', '3920', '0', '233', '20160826013', '第3位：第8球');
INSERT INTO `sscorder` VALUES ('293', '3', '8', '3', '2016-08-26 01:58:12', '500', '4900', '1', '233', '20160826013', '第3位：第7球');
INSERT INTO `sscorder` VALUES ('294', '3', '10', '3', '2016-08-26 01:58:12', '500', '4900', '0', '233', '20160826013', '第3位：第9球');
INSERT INTO `sscorder` VALUES ('295', '3', '13', '3', '2016-08-26 01:58:12', '600', '1188', '1', '233', '20160826013', '第3位：单');
INSERT INTO `sscorder` VALUES ('296', '3', '14', '3', '2016-08-26 01:58:12', '500', '990', '0', '233', '20160826013', '第3位：双');
INSERT INTO `sscorder` VALUES ('297', '3', '11', '3', '2016-08-26 01:58:12', '600', '1188', '1', '233', '20160826013', '第3位：大');
INSERT INTO `sscorder` VALUES ('298', '3', '12', '3', '2016-08-26 01:58:12', '700', '1386', '0', '233', '20160826013', '第3位：小');
INSERT INTO `sscorder` VALUES ('299', '6', '7', '3', '2016-08-26 01:58:12', '600', '0', '1', '233', '20160826013', '和');
INSERT INTO `sscorder` VALUES ('300', '6', '6', '3', '2016-08-26 01:58:12', '500', '985', '0', '233', '20160826013', '虎');
INSERT INTO `sscorder` VALUES ('301', '6', '5', '3', '2016-08-26 01:58:12', '600', '1188', '0', '233', '20160826013', '龙');
INSERT INTO `sscorder` VALUES ('302', '6', '4', '3', '2016-08-26 01:58:12', '400', '788', '0', '233', '20160826013', '总和双');
INSERT INTO `sscorder` VALUES ('303', '6', '3', '3', '2016-08-26 01:58:12', '500', '990', '1', '233', '20160826013', '总和单');
INSERT INTO `sscorder` VALUES ('304', '6', '2', '3', '2016-08-26 01:58:12', '700', '1379', '1', '233', '20160826013', '总和小');
INSERT INTO `sscorder` VALUES ('305', '6', '1', '3', '2016-08-26 01:58:12', '600', '1188', '0', '233', '20160826013', '总和大');
INSERT INTO `sscorder` VALUES ('306', '7', '4', '3', '2016-08-26 01:58:30', '600', '1326', '0', '233', '20160826013', '前三位：半顺');
INSERT INTO `sscorder` VALUES ('307', '7', '5', '3', '2016-08-26 01:58:30', '500', '1105', '1', '233', '20160826013', '前三位：杂六');
INSERT INTO `sscorder` VALUES ('308', '3', '3', '3', '2016-08-26 01:58:30', '900', '8820', '0', '233', '20160826013', '第3位：第2球');
INSERT INTO `sscorder` VALUES ('309', '7', '1', '3', '2016-08-26 01:58:30', '800', '52808', '0', '233', '20160826013', '前三位：豹子');
INSERT INTO `sscorder` VALUES ('310', '3', '2', '3', '2016-08-26 01:58:30', '800', '7840', '0', '233', '20160826013', '第3位：第1球');
INSERT INTO `sscorder` VALUES ('311', '7', '2', '3', '2016-08-26 01:58:30', '900', '10809', '0', '233', '20160826013', '前三位：顺子');
INSERT INTO `sscorder` VALUES ('312', '3', '1', '3', '2016-08-26 01:58:30', '700', '6860', '0', '233', '20160826013', '第3位：第0球');
INSERT INTO `sscorder` VALUES ('313', '7', '3', '3', '2016-08-26 01:58:30', '800', '2248', '0', '233', '20160826013', '前三位：对子');
INSERT INTO `sscorder` VALUES ('314', '3', '7', '3', '2016-08-26 01:58:30', '800', '7840', '0', '233', '20160826013', '第3位：第6球');
INSERT INTO `sscorder` VALUES ('315', '3', '6', '3', '2016-08-26 01:58:30', '700', '6860', '0', '233', '20160826013', '第3位：第5球');
INSERT INTO `sscorder` VALUES ('316', '3', '5', '3', '2016-08-26 01:58:30', '500', '4900', '0', '233', '20160826013', '第3位：第4球');
INSERT INTO `sscorder` VALUES ('317', '3', '4', '3', '2016-08-26 01:58:30', '7600', '74480', '0', '233', '20160826013', '第3位：第3球');
INSERT INTO `sscorder` VALUES ('318', '3', '9', '3', '2016-08-26 01:58:30', '700', '6860', '0', '233', '20160826013', '第3位：第8球');
INSERT INTO `sscorder` VALUES ('319', '3', '8', '3', '2016-08-26 01:58:30', '900', '8820', '1', '233', '20160826013', '第3位：第7球');
INSERT INTO `sscorder` VALUES ('320', '3', '10', '3', '2016-08-26 01:58:30', '500', '4900', '0', '233', '20160826013', '第3位：第9球');
INSERT INTO `sscorder` VALUES ('321', '3', '13', '3', '2016-08-26 01:58:30', '900', '1782', '1', '233', '20160826013', '第3位：单');
INSERT INTO `sscorder` VALUES ('322', '3', '14', '3', '2016-08-26 01:58:30', '900', '1782', '0', '233', '20160826013', '第3位：双');
INSERT INTO `sscorder` VALUES ('323', '3', '11', '3', '2016-08-26 01:58:30', '7600', '15048', '1', '233', '20160826013', '第3位：大');
INSERT INTO `sscorder` VALUES ('324', '3', '12', '3', '2016-08-26 01:58:30', '800', '1584', '0', '233', '20160826013', '第3位：小');
INSERT INTO `sscorder` VALUES ('325', '6', '7', '3', '2016-08-26 01:58:30', '700', '0', '1', '233', '20160826013', '和');
INSERT INTO `sscorder` VALUES ('326', '6', '6', '3', '2016-08-26 01:58:30', '700', '1379', '0', '233', '20160826013', '虎');
INSERT INTO `sscorder` VALUES ('327', '6', '5', '3', '2016-08-26 01:58:30', '800', '1584', '0', '233', '20160826013', '龙');
INSERT INTO `sscorder` VALUES ('328', '6', '4', '3', '2016-08-26 01:58:30', '7800', '15366', '0', '233', '20160826013', '总和双');
INSERT INTO `sscorder` VALUES ('329', '6', '3', '3', '2016-08-26 01:58:30', '600', '1188', '1', '233', '20160826013', '总和单');
INSERT INTO `sscorder` VALUES ('330', '6', '2', '3', '2016-08-26 01:58:30', '5600', '11032', '1', '233', '20160826013', '总和小');
INSERT INTO `sscorder` VALUES ('331', '6', '1', '3', '2016-08-26 01:58:30', '700', '1386', '0', '233', '20160826013', '总和大');
INSERT INTO `sscorder` VALUES ('332', '7', '4', '3', '2016-08-26 01:58:49', '700', '1547', '0', '233', '20160826013', '前三位：半顺');
INSERT INTO `sscorder` VALUES ('333', '7', '5', '3', '2016-08-26 01:58:49', '200', '442', '1', '233', '20160826013', '前三位：杂六');
INSERT INTO `sscorder` VALUES ('334', '3', '3', '3', '2016-08-26 01:58:49', '700', '6860', '0', '233', '20160826013', '第3位：第2球');
INSERT INTO `sscorder` VALUES ('335', '7', '1', '3', '2016-08-26 01:58:49', '500', '33005', '0', '233', '20160826013', '前三位：豹子');
INSERT INTO `sscorder` VALUES ('336', '3', '2', '3', '2016-08-26 01:58:49', '600', '5880', '0', '233', '20160826013', '第3位：第1球');
INSERT INTO `sscorder` VALUES ('337', '7', '2', '3', '2016-08-26 01:58:49', '400', '4804', '0', '233', '20160826013', '前三位：顺子');
INSERT INTO `sscorder` VALUES ('338', '3', '1', '3', '2016-08-26 01:58:49', '500', '4900', '0', '233', '20160826013', '第3位：第0球');
INSERT INTO `sscorder` VALUES ('339', '7', '3', '3', '2016-08-26 01:58:49', '5600', '15736', '0', '233', '20160826013', '前三位：对子');
INSERT INTO `sscorder` VALUES ('340', '3', '7', '3', '2016-08-26 01:58:49', '600', '5880', '0', '233', '20160826013', '第3位：第6球');
INSERT INTO `sscorder` VALUES ('341', '3', '6', '3', '2016-08-26 01:58:49', '500', '4900', '0', '233', '20160826013', '第3位：第5球');
INSERT INTO `sscorder` VALUES ('342', '3', '5', '3', '2016-08-26 01:58:49', '600', '5880', '0', '233', '20160826013', '第3位：第4球');
INSERT INTO `sscorder` VALUES ('343', '3', '4', '3', '2016-08-26 01:58:49', '800', '7840', '0', '233', '20160826013', '第3位：第3球');
INSERT INTO `sscorder` VALUES ('344', '3', '9', '3', '2016-08-26 01:58:49', '800', '7840', '0', '233', '20160826013', '第3位：第8球');
INSERT INTO `sscorder` VALUES ('345', '3', '8', '3', '2016-08-26 01:58:49', '700', '6860', '1', '233', '20160826013', '第3位：第7球');
INSERT INTO `sscorder` VALUES ('346', '3', '10', '3', '2016-08-26 01:58:49', '800', '7840', '0', '233', '20160826013', '第3位：第9球');
INSERT INTO `sscorder` VALUES ('347', '3', '13', '3', '2016-08-26 01:58:49', '700', '1386', '1', '233', '20160826013', '第3位：单');
INSERT INTO `sscorder` VALUES ('348', '3', '14', '3', '2016-08-26 01:58:49', '700', '1386', '0', '233', '20160826013', '第3位：双');
INSERT INTO `sscorder` VALUES ('349', '3', '11', '3', '2016-08-26 01:58:49', '600', '1188', '1', '233', '20160826013', '第3位：大');
INSERT INTO `sscorder` VALUES ('350', '3', '12', '3', '2016-08-26 01:58:49', '500', '990', '0', '233', '20160826013', '第3位：小');
INSERT INTO `sscorder` VALUES ('351', '6', '7', '3', '2016-08-26 01:58:49', '700', '0', '1', '233', '20160826013', '和');
INSERT INTO `sscorder` VALUES ('352', '6', '6', '3', '2016-08-26 01:58:49', '600', '1182', '0', '233', '20160826013', '虎');
INSERT INTO `sscorder` VALUES ('353', '6', '5', '3', '2016-08-26 01:58:49', '500', '990', '0', '233', '20160826013', '龙');
INSERT INTO `sscorder` VALUES ('354', '6', '4', '3', '2016-08-26 01:58:49', '400', '788', '0', '233', '20160826013', '总和双');
INSERT INTO `sscorder` VALUES ('355', '6', '3', '3', '2016-08-26 01:58:49', '500', '990', '1', '233', '20160826013', '总和单');
INSERT INTO `sscorder` VALUES ('356', '6', '2', '3', '2016-08-26 01:58:49', '600', '1182', '1', '233', '20160826013', '总和小');
INSERT INTO `sscorder` VALUES ('357', '6', '1', '3', '2016-08-26 01:58:49', '800', '1584', '0', '233', '20160826013', '总和大');
INSERT INTO `sscorder` VALUES ('358', '7', '4', '3', '2016-08-26 01:59:07', '6700', '14807', '0', '233', '20160826013', '前三位：半顺');
INSERT INTO `sscorder` VALUES ('359', '7', '5', '3', '2016-08-26 01:59:07', '700', '1547', '1', '233', '20160826013', '前三位：杂六');
INSERT INTO `sscorder` VALUES ('360', '3', '3', '3', '2016-08-26 01:59:07', '700', '6860', '0', '233', '20160826013', '第3位：第2球');
INSERT INTO `sscorder` VALUES ('361', '7', '1', '3', '2016-08-26 01:59:07', '8700', '574287', '0', '233', '20160826013', '前三位：豹子');
INSERT INTO `sscorder` VALUES ('362', '3', '2', '3', '2016-08-26 01:59:07', '6500', '63700', '0', '233', '20160826013', '第3位：第1球');
INSERT INTO `sscorder` VALUES ('363', '7', '2', '3', '2016-08-26 01:59:07', '600', '7206', '0', '233', '20160826013', '前三位：顺子');
INSERT INTO `sscorder` VALUES ('364', '3', '1', '3', '2016-08-26 01:59:07', '5400', '52920', '0', '233', '20160826013', '第3位：第0球');
INSERT INTO `sscorder` VALUES ('365', '7', '3', '3', '2016-08-26 01:59:07', '500', '1405', '0', '233', '20160826013', '前三位：对子');
INSERT INTO `sscorder` VALUES ('366', '3', '7', '3', '2016-08-26 01:59:07', '800', '7840', '0', '233', '20160826013', '第3位：第6球');
INSERT INTO `sscorder` VALUES ('367', '3', '6', '3', '2016-08-26 01:59:07', '700', '6860', '0', '233', '20160826013', '第3位：第5球');
INSERT INTO `sscorder` VALUES ('368', '3', '5', '3', '2016-08-26 01:59:07', '500', '4900', '0', '233', '20160826013', '第3位：第4球');
INSERT INTO `sscorder` VALUES ('369', '3', '4', '3', '2016-08-26 01:59:07', '700', '6860', '0', '233', '20160826013', '第3位：第3球');
INSERT INTO `sscorder` VALUES ('370', '3', '9', '3', '2016-08-26 01:59:07', '500', '4900', '0', '233', '20160826013', '第3位：第8球');
INSERT INTO `sscorder` VALUES ('371', '3', '8', '3', '2016-08-26 01:59:07', '600', '5880', '1', '233', '20160826013', '第3位：第7球');
INSERT INTO `sscorder` VALUES ('372', '3', '10', '3', '2016-08-26 01:59:07', '700', '6860', '0', '233', '20160826013', '第3位：第9球');
INSERT INTO `sscorder` VALUES ('373', '3', '13', '3', '2016-08-26 01:59:07', '700', '1386', '1', '233', '20160826013', '第3位：单');
INSERT INTO `sscorder` VALUES ('374', '3', '14', '3', '2016-08-26 01:59:07', '800', '1584', '0', '233', '20160826013', '第3位：双');
INSERT INTO `sscorder` VALUES ('375', '3', '11', '3', '2016-08-26 01:59:07', '8700', '17226', '1', '233', '20160826013', '第3位：大');
INSERT INTO `sscorder` VALUES ('376', '3', '12', '3', '2016-08-26 01:59:07', '600', '1188', '0', '233', '20160826013', '第3位：小');
INSERT INTO `sscorder` VALUES ('377', '6', '7', '3', '2016-08-26 01:59:07', '700', '0', '1', '233', '20160826013', '和');
INSERT INTO `sscorder` VALUES ('378', '6', '6', '3', '2016-08-26 01:59:07', '600', '1182', '0', '233', '20160826013', '虎');
INSERT INTO `sscorder` VALUES ('379', '6', '5', '3', '2016-08-26 01:59:07', '500', '990', '0', '233', '20160826013', '龙');
INSERT INTO `sscorder` VALUES ('380', '6', '4', '3', '2016-08-26 01:59:07', '600', '1182', '0', '233', '20160826013', '总和双');
INSERT INTO `sscorder` VALUES ('381', '6', '3', '3', '2016-08-26 01:59:07', '800', '1584', '1', '233', '20160826013', '总和单');
INSERT INTO `sscorder` VALUES ('382', '6', '2', '3', '2016-08-26 01:59:07', '8700', '17139', '1', '233', '20160826013', '总和小');
INSERT INTO `sscorder` VALUES ('383', '6', '1', '3', '2016-08-26 01:59:07', '600', '1188', '0', '233', '20160826013', '总和大');
INSERT INTO `sscorder` VALUES ('384', '7', '4', '3', '2016-08-26 01:59:26', '600', '1326', '0', '233', '20160826013', '前三位：半顺');
INSERT INTO `sscorder` VALUES ('385', '7', '5', '3', '2016-08-26 01:59:26', '700', '1547', '1', '233', '20160826013', '前三位：杂六');
INSERT INTO `sscorder` VALUES ('386', '3', '3', '3', '2016-08-26 01:59:26', '800', '7840', '0', '233', '20160826013', '第3位：第2球');
INSERT INTO `sscorder` VALUES ('387', '7', '1', '3', '2016-08-26 01:59:26', '400', '26404', '0', '233', '20160826013', '前三位：豹子');
INSERT INTO `sscorder` VALUES ('388', '3', '2', '3', '2016-08-26 01:59:26', '700', '6860', '0', '233', '20160826013', '第3位：第1球');
INSERT INTO `sscorder` VALUES ('389', '7', '2', '3', '2016-08-26 01:59:26', '300', '3603', '0', '233', '20160826013', '前三位：顺子');
INSERT INTO `sscorder` VALUES ('390', '3', '1', '3', '2016-08-26 01:59:26', '600', '5880', '0', '233', '20160826013', '第3位：第0球');
INSERT INTO `sscorder` VALUES ('391', '7', '3', '3', '2016-08-26 01:59:26', '500', '1405', '0', '233', '20160826013', '前三位：对子');
INSERT INTO `sscorder` VALUES ('392', '3', '7', '3', '2016-08-26 01:59:26', '700', '6860', '0', '233', '20160826013', '第3位：第6球');
INSERT INTO `sscorder` VALUES ('393', '3', '6', '3', '2016-08-26 01:59:26', '600', '5880', '0', '233', '20160826013', '第3位：第5球');
INSERT INTO `sscorder` VALUES ('394', '3', '5', '3', '2016-08-26 01:59:26', '400', '3920', '0', '233', '20160826013', '第3位：第4球');
INSERT INTO `sscorder` VALUES ('395', '3', '4', '3', '2016-08-26 01:59:26', '600', '5880', '0', '233', '20160826013', '第3位：第3球');
INSERT INTO `sscorder` VALUES ('396', '3', '9', '3', '2016-08-26 01:59:26', '600', '5880', '0', '233', '20160826013', '第3位：第8球');
INSERT INTO `sscorder` VALUES ('397', '3', '8', '3', '2016-08-26 01:59:26', '800', '7840', '1', '233', '20160826013', '第3位：第7球');
INSERT INTO `sscorder` VALUES ('398', '3', '10', '3', '2016-08-26 01:59:26', '4500', '44100', '0', '233', '20160826013', '第3位：第9球');
INSERT INTO `sscorder` VALUES ('399', '3', '13', '3', '2016-08-26 01:59:26', '800', '1584', '1', '233', '20160826013', '第3位：单');
INSERT INTO `sscorder` VALUES ('400', '3', '14', '3', '2016-08-26 01:59:26', '800', '1584', '0', '233', '20160826013', '第3位：双');
INSERT INTO `sscorder` VALUES ('401', '3', '11', '3', '2016-08-26 01:59:26', '600', '1188', '1', '233', '20160826013', '第3位：大');
INSERT INTO `sscorder` VALUES ('402', '3', '12', '3', '2016-08-26 01:59:26', '700', '1386', '0', '233', '20160826013', '第3位：小');
INSERT INTO `sscorder` VALUES ('403', '6', '7', '3', '2016-08-26 01:59:26', '500', '0', '1', '233', '20160826013', '和');
INSERT INTO `sscorder` VALUES ('404', '6', '6', '3', '2016-08-26 01:59:26', '600', '1182', '0', '233', '20160826013', '虎');
INSERT INTO `sscorder` VALUES ('405', '6', '5', '3', '2016-08-26 01:59:26', '900', '1782', '0', '233', '20160826013', '龙');
INSERT INTO `sscorder` VALUES ('406', '6', '4', '3', '2016-08-26 01:59:26', '800', '1576', '0', '233', '20160826013', '总和双');
INSERT INTO `sscorder` VALUES ('407', '6', '3', '3', '2016-08-26 01:59:26', '700', '1386', '1', '233', '20160826013', '总和单');
INSERT INTO `sscorder` VALUES ('408', '6', '2', '3', '2016-08-26 01:59:26', '500', '985', '1', '233', '20160826013', '总和小');
INSERT INTO `sscorder` VALUES ('409', '6', '1', '3', '2016-08-26 01:59:26', '600', '1188', '0', '233', '20160826013', '总和大');
INSERT INTO `sscorder` VALUES ('410', '7', '4', '3', '2016-08-26 01:59:43', '800', '1768', '0', '233', '20160826013', '前三位：半顺');
INSERT INTO `sscorder` VALUES ('411', '7', '5', '3', '2016-08-26 01:59:43', '600', '1326', '1', '233', '20160826013', '前三位：杂六');
INSERT INTO `sscorder` VALUES ('412', '3', '3', '3', '2016-08-26 01:59:43', '700', '6860', '0', '233', '20160826013', '第3位：第2球');
INSERT INTO `sscorder` VALUES ('413', '7', '1', '3', '2016-08-26 01:59:43', '600', '39606', '0', '233', '20160826013', '前三位：豹子');
INSERT INTO `sscorder` VALUES ('414', '3', '2', '3', '2016-08-26 01:59:43', '600', '5880', '0', '233', '20160826013', '第3位：第1球');
INSERT INTO `sscorder` VALUES ('415', '7', '2', '3', '2016-08-26 01:59:43', '700', '8407', '0', '233', '20160826013', '前三位：顺子');
INSERT INTO `sscorder` VALUES ('416', '3', '1', '3', '2016-08-26 01:59:43', '500', '4900', '0', '233', '20160826013', '第3位：第0球');
INSERT INTO `sscorder` VALUES ('417', '7', '3', '3', '2016-08-26 01:59:43', '800', '2248', '0', '233', '20160826013', '前三位：对子');
INSERT INTO `sscorder` VALUES ('418', '3', '7', '3', '2016-08-26 01:59:43', '600', '5880', '0', '233', '20160826013', '第3位：第6球');
INSERT INTO `sscorder` VALUES ('419', '3', '6', '3', '2016-08-26 01:59:43', '500', '4900', '0', '233', '20160826013', '第3位：第5球');
INSERT INTO `sscorder` VALUES ('420', '3', '5', '3', '2016-08-26 01:59:43', '400', '3920', '0', '233', '20160826013', '第3位：第4球');
INSERT INTO `sscorder` VALUES ('421', '3', '4', '3', '2016-08-26 01:59:43', '500', '4900', '0', '233', '20160826013', '第3位：第3球');
INSERT INTO `sscorder` VALUES ('422', '3', '9', '3', '2016-08-26 01:59:43', '6500', '63700', '0', '233', '20160826013', '第3位：第8球');
INSERT INTO `sscorder` VALUES ('423', '3', '8', '3', '2016-08-26 01:59:43', '700', '6860', '1', '233', '20160826013', '第3位：第7球');
INSERT INTO `sscorder` VALUES ('424', '3', '10', '3', '2016-08-26 01:59:43', '600', '5880', '0', '233', '20160826013', '第3位：第9球');
INSERT INTO `sscorder` VALUES ('425', '3', '13', '3', '2016-08-26 01:59:43', '600', '1188', '1', '233', '20160826013', '第3位：单');
INSERT INTO `sscorder` VALUES ('426', '3', '14', '3', '2016-08-26 01:59:43', '700', '1386', '0', '233', '20160826013', '第3位：双');
INSERT INTO `sscorder` VALUES ('427', '3', '11', '3', '2016-08-26 01:59:43', '700', '1386', '1', '233', '20160826013', '第3位：大');
INSERT INTO `sscorder` VALUES ('428', '3', '12', '3', '2016-08-26 01:59:43', '6500', '12870', '0', '233', '20160826013', '第3位：小');
INSERT INTO `sscorder` VALUES ('429', '6', '7', '3', '2016-08-26 01:59:43', '500', '0', '1', '233', '20160826013', '和');
INSERT INTO `sscorder` VALUES ('430', '6', '6', '3', '2016-08-26 01:59:43', '600', '1182', '0', '233', '20160826013', '虎');
INSERT INTO `sscorder` VALUES ('431', '6', '5', '3', '2016-08-26 01:59:43', '6500', '12870', '0', '233', '20160826013', '龙');
INSERT INTO `sscorder` VALUES ('432', '6', '4', '3', '2016-08-26 01:59:43', '700', '1379', '0', '233', '20160826013', '总和双');
INSERT INTO `sscorder` VALUES ('433', '6', '3', '3', '2016-08-26 01:59:43', '600', '1188', '1', '233', '20160826013', '总和单');
INSERT INTO `sscorder` VALUES ('434', '6', '2', '3', '2016-08-26 01:59:43', '500', '985', '1', '233', '20160826013', '总和小');
INSERT INTO `sscorder` VALUES ('435', '6', '1', '3', '2016-08-26 01:59:43', '700', '1386', '0', '233', '20160826013', '总和大');
INSERT INTO `sscorder` VALUES ('436', '7', '4', '3', '2016-08-26 02:00:15', '700', '1547', '0', '233', '20160826013', '前三位：半顺');
INSERT INTO `sscorder` VALUES ('437', '7', '5', '3', '2016-08-26 02:00:15', '7800', '17238', '1', '233', '20160826013', '前三位：杂六');
INSERT INTO `sscorder` VALUES ('438', '3', '3', '3', '2016-08-26 02:00:15', '500', '4900', '0', '233', '20160826013', '第3位：第2球');
INSERT INTO `sscorder` VALUES ('439', '7', '1', '3', '2016-08-26 02:00:15', '5500', '363055', '0', '233', '20160826013', '前三位：豹子');
INSERT INTO `sscorder` VALUES ('440', '3', '2', '3', '2016-08-26 02:00:15', '600', '5880', '0', '233', '20160826013', '第3位：第1球');
INSERT INTO `sscorder` VALUES ('441', '7', '2', '3', '2016-08-26 02:00:15', '500', '6005', '0', '233', '20160826013', '前三位：顺子');
INSERT INTO `sscorder` VALUES ('442', '3', '1', '3', '2016-08-26 02:00:15', '500', '4900', '0', '233', '20160826013', '第3位：第0球');
INSERT INTO `sscorder` VALUES ('443', '7', '3', '3', '2016-08-26 02:00:15', '600', '1686', '0', '233', '20160826013', '前三位：对子');
INSERT INTO `sscorder` VALUES ('444', '3', '7', '3', '2016-08-26 02:00:15', '700', '6860', '0', '233', '20160826013', '第3位：第6球');
INSERT INTO `sscorder` VALUES ('445', '3', '6', '3', '2016-08-26 02:00:15', '56500', '553700', '0', '233', '20160826013', '第3位：第5球');
INSERT INTO `sscorder` VALUES ('446', '3', '4', '3', '2016-08-26 02:00:15', '5400', '52920', '0', '233', '20160826013', '第3位：第3球');
INSERT INTO `sscorder` VALUES ('447', '3', '9', '3', '2016-08-26 02:00:15', '800', '7840', '0', '233', '20160826013', '第3位：第8球');
INSERT INTO `sscorder` VALUES ('448', '3', '8', '3', '2016-08-26 02:00:15', '800', '7840', '1', '233', '20160826013', '第3位：第7球');
INSERT INTO `sscorder` VALUES ('449', '3', '10', '3', '2016-08-26 02:00:15', '600', '5880', '0', '233', '20160826013', '第3位：第9球');
INSERT INTO `sscorder` VALUES ('450', '3', '13', '3', '2016-08-26 02:00:15', '400', '792', '1', '233', '20160826013', '第3位：单');
INSERT INTO `sscorder` VALUES ('451', '3', '14', '3', '2016-08-26 02:00:15', '400', '792', '0', '233', '20160826013', '第3位：双');
INSERT INTO `sscorder` VALUES ('452', '3', '11', '3', '2016-08-26 02:00:15', '600', '1188', '1', '233', '20160826013', '第3位：大');
INSERT INTO `sscorder` VALUES ('453', '3', '12', '3', '2016-08-26 02:00:15', '500', '990', '0', '233', '20160826013', '第3位：小');
INSERT INTO `sscorder` VALUES ('454', '6', '7', '3', '2016-08-26 02:00:15', '700', '0', '1', '233', '20160826013', '和');
INSERT INTO `sscorder` VALUES ('455', '6', '6', '3', '2016-08-26 02:00:15', '700', '1379', '0', '233', '20160826013', '虎');
INSERT INTO `sscorder` VALUES ('456', '6', '5', '3', '2016-08-26 02:00:15', '700', '1386', '0', '233', '20160826013', '龙');
INSERT INTO `sscorder` VALUES ('457', '6', '4', '3', '2016-08-26 02:00:15', '600', '1182', '0', '233', '20160826013', '总和双');
INSERT INTO `sscorder` VALUES ('458', '6', '3', '3', '2016-08-26 02:00:15', '700', '1386', '1', '233', '20160826013', '总和单');
INSERT INTO `sscorder` VALUES ('459', '6', '2', '3', '2016-08-26 02:00:15', '6700', '13199', '1', '233', '20160826013', '总和小');
INSERT INTO `sscorder` VALUES ('460', '6', '1', '3', '2016-08-26 02:00:15', '600', '1188', '0', '233', '20160826013', '总和大');
INSERT INTO `sscorder` VALUES ('461', '4', '14', '3', '2016-08-26 02:00:39', '700', '1386', '1', '233', '20160826013', '第4位：双');
INSERT INTO `sscorder` VALUES ('462', '4', '12', '3', '2016-08-26 02:00:39', '800', '1584', '1', '233', '20160826013', '第4位：小');
INSERT INTO `sscorder` VALUES ('463', '4', '13', '3', '2016-08-26 02:00:39', '9900', '19602', '0', '233', '20160826013', '第4位：单');
INSERT INTO `sscorder` VALUES ('464', '4', '10', '3', '2016-08-26 02:00:39', '700', '6860', '0', '233', '20160826013', '第4位：第9球');
INSERT INTO `sscorder` VALUES ('465', '4', '11', '3', '2016-08-26 02:00:39', '800', '1584', '0', '233', '20160826013', '第4位：大');
INSERT INTO `sscorder` VALUES ('466', '7', '4', '3', '2016-08-26 02:00:39', '800', '1768', '0', '233', '20160826013', '前三位：半顺');
INSERT INTO `sscorder` VALUES ('467', '7', '5', '3', '2016-08-26 02:00:39', '600', '1326', '1', '233', '20160826013', '前三位：杂六');
INSERT INTO `sscorder` VALUES ('468', '4', '9', '3', '2016-08-26 02:00:39', '600', '5880', '0', '233', '20160826013', '第4位：第8球');
INSERT INTO `sscorder` VALUES ('469', '4', '8', '3', '2016-08-26 02:00:39', '600', '5880', '0', '233', '20160826013', '第4位：第7球');
INSERT INTO `sscorder` VALUES ('470', '4', '7', '3', '2016-08-26 02:00:39', '400', '3920', '0', '233', '20160826013', '第4位：第6球');
INSERT INTO `sscorder` VALUES ('471', '4', '6', '3', '2016-08-26 02:00:39', '300', '2940', '0', '233', '20160826013', '第4位：第5球');
INSERT INTO `sscorder` VALUES ('472', '7', '1', '3', '2016-08-26 02:00:39', '800', '52808', '0', '233', '20160826013', '前三位：豹子');
INSERT INTO `sscorder` VALUES ('473', '4', '5', '3', '2016-08-26 02:00:39', '400', '3920', '0', '233', '20160826013', '第4位：第4球');
INSERT INTO `sscorder` VALUES ('474', '7', '2', '3', '2016-08-26 02:00:39', '7700', '92477', '0', '233', '20160826013', '前三位：顺子');
INSERT INTO `sscorder` VALUES ('475', '4', '4', '3', '2016-08-26 02:00:39', '600', '5880', '0', '233', '20160826013', '第4位：第3球');
INSERT INTO `sscorder` VALUES ('476', '7', '3', '3', '2016-08-26 02:00:39', '800', '2248', '0', '233', '20160826013', '前三位：对子');
INSERT INTO `sscorder` VALUES ('477', '4', '3', '3', '2016-08-26 02:00:39', '7800', '76440', '0', '233', '20160826013', '第4位：第2球');
INSERT INTO `sscorder` VALUES ('478', '4', '2', '3', '2016-08-26 02:00:39', '700', '6860', '0', '233', '20160826013', '第4位：第1球');
INSERT INTO `sscorder` VALUES ('479', '4', '1', '3', '2016-08-26 02:00:39', '600', '5880', '1', '233', '20160826013', '第4位：第0球');
INSERT INTO `sscorder` VALUES ('480', '6', '7', '3', '2016-08-26 02:00:39', '8700', '0', '1', '233', '20160826013', '和');
INSERT INTO `sscorder` VALUES ('481', '6', '6', '3', '2016-08-26 02:00:39', '700', '1379', '0', '233', '20160826013', '虎');
INSERT INTO `sscorder` VALUES ('482', '6', '5', '3', '2016-08-26 02:00:39', '700', '1386', '0', '233', '20160826013', '龙');
INSERT INTO `sscorder` VALUES ('483', '6', '4', '3', '2016-08-26 02:00:39', '6700', '13199', '0', '233', '20160826013', '总和双');
INSERT INTO `sscorder` VALUES ('484', '6', '3', '3', '2016-08-26 02:00:39', '600', '1188', '1', '233', '20160826013', '总和单');
INSERT INTO `sscorder` VALUES ('485', '6', '2', '3', '2016-08-26 02:00:39', '67600', '133172', '1', '233', '20160826013', '总和小');
INSERT INTO `sscorder` VALUES ('486', '7', '4', '3', '2016-08-26 02:01:10', '500', '1105', '0', '233', '20160826013', '前三位：半顺');
INSERT INTO `sscorder` VALUES ('487', '7', '5', '3', '2016-08-26 02:01:10', '6500', '14365', '1', '233', '20160826013', '前三位：杂六');
INSERT INTO `sscorder` VALUES ('488', '7', '1', '3', '2016-08-26 02:01:10', '600', '39606', '0', '233', '20160826013', '前三位：豹子');
INSERT INTO `sscorder` VALUES ('489', '7', '2', '3', '2016-08-26 02:01:10', '700', '8407', '0', '233', '20160826013', '前三位：顺子');
INSERT INTO `sscorder` VALUES ('490', '7', '3', '3', '2016-08-26 02:01:10', '600', '1686', '0', '233', '20160826013', '前三位：对子');
INSERT INTO `sscorder` VALUES ('491', '5', '12', '3', '2016-08-26 02:01:10', '600', '1188', '1', '233', '20160826013', '第5位：小');
INSERT INTO `sscorder` VALUES ('492', '5', '11', '3', '2016-08-26 02:01:10', '600', '1188', '0', '233', '20160826013', '第5位：大');
INSERT INTO `sscorder` VALUES ('493', '5', '10', '3', '2016-08-26 02:01:10', '500', '4900', '0', '233', '20160826013', '第5位：第9球');
INSERT INTO `sscorder` VALUES ('494', '5', '14', '3', '2016-08-26 02:01:10', '700', '1386', '1', '233', '20160826013', '第5位：双');
INSERT INTO `sscorder` VALUES ('495', '5', '13', '3', '2016-08-26 02:01:10', '600', '1188', '0', '233', '20160826013', '第5位：单');
INSERT INTO `sscorder` VALUES ('496', '5', '5', '3', '2016-08-26 02:01:10', '98600', '966280', '1', '233', '20160826013', '第5位：第4球');
INSERT INTO `sscorder` VALUES ('497', '5', '4', '3', '2016-08-26 02:01:10', '800', '7840', '0', '233', '20160826013', '第5位：第3球');
INSERT INTO `sscorder` VALUES ('498', '5', '3', '3', '2016-08-26 02:01:10', '700', '6860', '0', '233', '20160826013', '第5位：第2球');
INSERT INTO `sscorder` VALUES ('499', '5', '2', '3', '2016-08-26 02:01:10', '600', '5880', '0', '233', '20160826013', '第5位：第1球');
INSERT INTO `sscorder` VALUES ('500', '5', '9', '3', '2016-08-26 02:01:10', '500', '4900', '0', '233', '20160826013', '第5位：第8球');
INSERT INTO `sscorder` VALUES ('501', '5', '8', '3', '2016-08-26 02:01:10', '400', '3920', '0', '233', '20160826013', '第5位：第7球');
INSERT INTO `sscorder` VALUES ('502', '5', '7', '3', '2016-08-26 02:01:10', '400', '3920', '0', '233', '20160826013', '第5位：第6球');
INSERT INTO `sscorder` VALUES ('503', '5', '6', '3', '2016-08-26 02:01:10', '500', '4900', '0', '233', '20160826013', '第5位：第5球');
INSERT INTO `sscorder` VALUES ('504', '6', '7', '3', '2016-08-26 02:01:10', '500', '0', '1', '233', '20160826013', '和');
INSERT INTO `sscorder` VALUES ('505', '6', '6', '3', '2016-08-26 02:01:10', '400', '788', '0', '233', '20160826013', '虎');
INSERT INTO `sscorder` VALUES ('506', '6', '5', '3', '2016-08-26 02:01:10', '500', '990', '0', '233', '20160826013', '龙');
INSERT INTO `sscorder` VALUES ('507', '5', '1', '3', '2016-08-26 02:01:10', '500', '4900', '0', '233', '20160826013', '第5位：第0球');
INSERT INTO `sscorder` VALUES ('508', '6', '4', '3', '2016-08-26 02:01:10', '600', '1182', '0', '233', '20160826013', '总和双');
INSERT INTO `sscorder` VALUES ('509', '6', '3', '3', '2016-08-26 02:01:10', '600', '1188', '1', '233', '20160826013', '总和单');
INSERT INTO `sscorder` VALUES ('510', '6', '2', '3', '2016-08-26 02:01:10', '6500', '12805', '1', '233', '20160826013', '总和小');
INSERT INTO `sscorder` VALUES ('511', '6', '1', '3', '2016-08-26 02:01:10', '700', '1386', '0', '233', '20160826013', '总和大');
INSERT INTO `sscorder` VALUES ('512', '8', '1', '3', '2016-08-26 02:01:37', '6500', '429065', '0', '233', '20160826013', '中三位：豹子');
INSERT INTO `sscorder` VALUES ('513', '8', '2', '3', '2016-08-26 02:01:37', '400', '4804', '0', '233', '20160826013', '中三位：顺子');
INSERT INTO `sscorder` VALUES ('514', '8', '4', '3', '2016-08-26 02:01:37', '5600', '12376', '0', '233', '20160826013', '中三位：半顺');
INSERT INTO `sscorder` VALUES ('515', '8', '5', '3', '2016-08-26 02:01:37', '600', '1326', '1', '233', '20160826013', '中三位：杂六');
INSERT INTO `sscorder` VALUES ('516', '5', '12', '3', '2016-08-26 02:01:37', '400', '792', '1', '233', '20160826013', '第5位：小');
INSERT INTO `sscorder` VALUES ('517', '5', '11', '3', '2016-08-26 02:01:37', '500', '990', '0', '233', '20160826013', '第5位：大');
INSERT INTO `sscorder` VALUES ('518', '5', '10', '3', '2016-08-26 02:01:37', '700', '6860', '0', '233', '20160826013', '第5位：第9球');
INSERT INTO `sscorder` VALUES ('519', '5', '14', '3', '2016-08-26 02:01:37', '500', '990', '1', '233', '20160826013', '第5位：双');
INSERT INTO `sscorder` VALUES ('520', '5', '13', '3', '2016-08-26 02:01:37', '400', '792', '0', '233', '20160826013', '第5位：单');
INSERT INTO `sscorder` VALUES ('521', '5', '5', '3', '2016-08-26 02:01:37', '700', '6860', '1', '233', '20160826013', '第5位：第4球');
INSERT INTO `sscorder` VALUES ('522', '5', '4', '3', '2016-08-26 02:01:37', '600', '5880', '0', '233', '20160826013', '第5位：第3球');
INSERT INTO `sscorder` VALUES ('523', '5', '3', '3', '2016-08-26 02:01:37', '6600', '64680', '0', '233', '20160826013', '第5位：第2球');
INSERT INTO `sscorder` VALUES ('524', '5', '2', '3', '2016-08-26 02:01:37', '500', '4900', '0', '233', '20160826013', '第5位：第1球');
INSERT INTO `sscorder` VALUES ('525', '5', '9', '3', '2016-08-26 02:01:37', '9900', '97020', '0', '233', '20160826013', '第5位：第8球');
INSERT INTO `sscorder` VALUES ('526', '5', '8', '3', '2016-08-26 02:01:37', '800', '7840', '0', '233', '20160826013', '第5位：第7球');
INSERT INTO `sscorder` VALUES ('527', '5', '7', '3', '2016-08-26 02:01:37', '800', '7840', '0', '233', '20160826013', '第5位：第6球');
INSERT INTO `sscorder` VALUES ('528', '5', '6', '3', '2016-08-26 02:01:37', '700', '6860', '0', '233', '20160826013', '第5位：第5球');
INSERT INTO `sscorder` VALUES ('529', '6', '7', '3', '2016-08-26 02:01:37', '700', '0', '1', '233', '20160826013', '和');
INSERT INTO `sscorder` VALUES ('530', '6', '6', '3', '2016-08-26 02:01:37', '700', '1379', '0', '233', '20160826013', '虎');
INSERT INTO `sscorder` VALUES ('531', '6', '5', '3', '2016-08-26 02:01:37', '800', '1584', '0', '233', '20160826013', '龙');
INSERT INTO `sscorder` VALUES ('532', '6', '4', '3', '2016-08-26 02:01:37', '800', '1576', '0', '233', '20160826013', '总和双');
INSERT INTO `sscorder` VALUES ('533', '5', '1', '3', '2016-08-26 02:01:37', '500', '4900', '0', '233', '20160826013', '第5位：第0球');
INSERT INTO `sscorder` VALUES ('534', '6', '3', '3', '2016-08-26 02:01:37', '700', '1386', '1', '233', '20160826013', '总和单');
INSERT INTO `sscorder` VALUES ('535', '6', '2', '3', '2016-08-26 02:01:37', '6700', '13199', '1', '233', '20160826013', '总和小');
INSERT INTO `sscorder` VALUES ('536', '6', '1', '3', '2016-08-26 02:01:37', '600', '1188', '0', '233', '20160826013', '总和大');
INSERT INTO `sscorder` VALUES ('537', '8', '1', '3', '2016-08-26 02:01:53', '300', '19803', '0', '233', '20160826013', '中三位：豹子');
INSERT INTO `sscorder` VALUES ('538', '8', '2', '3', '2016-08-26 02:01:53', '400', '4804', '0', '233', '20160826013', '中三位：顺子');
INSERT INTO `sscorder` VALUES ('539', '8', '3', '3', '2016-08-26 02:01:53', '500', '1405', '0', '233', '20160826013', '中三位：对子');
INSERT INTO `sscorder` VALUES ('540', '8', '4', '3', '2016-08-26 02:01:53', '56500', '124865', '0', '233', '20160826013', '中三位：半顺');
INSERT INTO `sscorder` VALUES ('541', '8', '5', '3', '2016-08-26 02:01:53', '600', '1326', '1', '233', '20160826013', '中三位：杂六');
INSERT INTO `sscorder` VALUES ('542', '5', '12', '3', '2016-08-26 02:01:53', '700', '1386', '1', '233', '20160826013', '第5位：小');
INSERT INTO `sscorder` VALUES ('543', '5', '11', '3', '2016-08-26 02:01:53', '700', '1386', '0', '233', '20160826013', '第5位：大');
INSERT INTO `sscorder` VALUES ('544', '5', '10', '3', '2016-08-26 02:01:53', '600', '5880', '0', '233', '20160826013', '第5位：第9球');
INSERT INTO `sscorder` VALUES ('545', '5', '14', '3', '2016-08-26 02:01:53', '800', '1584', '1', '233', '20160826013', '第5位：双');
INSERT INTO `sscorder` VALUES ('546', '5', '13', '3', '2016-08-26 02:01:53', '700', '1386', '0', '233', '20160826013', '第5位：单');
INSERT INTO `sscorder` VALUES ('547', '5', '5', '3', '2016-08-26 02:01:53', '800', '7840', '1', '233', '20160826013', '第5位：第4球');
INSERT INTO `sscorder` VALUES ('548', '5', '4', '3', '2016-08-26 02:01:53', '8700', '85260', '0', '233', '20160826013', '第5位：第3球');
INSERT INTO `sscorder` VALUES ('549', '5', '3', '3', '2016-08-26 02:01:53', '700', '6860', '0', '233', '20160826013', '第5位：第2球');
INSERT INTO `sscorder` VALUES ('550', '5', '2', '3', '2016-08-26 02:01:53', '600', '5880', '0', '233', '20160826013', '第5位：第1球');
INSERT INTO `sscorder` VALUES ('551', '5', '9', '3', '2016-08-26 02:01:53', '4600', '45080', '0', '233', '20160826013', '第5位：第8球');
INSERT INTO `sscorder` VALUES ('552', '5', '8', '3', '2016-08-26 02:01:53', '500', '4900', '0', '233', '20160826013', '第5位：第7球');
INSERT INTO `sscorder` VALUES ('553', '5', '7', '3', '2016-08-26 02:01:53', '6500', '63700', '0', '233', '20160826013', '第5位：第6球');
INSERT INTO `sscorder` VALUES ('554', '5', '6', '3', '2016-08-26 02:01:53', '8600', '84280', '0', '233', '20160826013', '第5位：第5球');
INSERT INTO `sscorder` VALUES ('555', '6', '7', '3', '2016-08-26 02:01:53', '300', '0', '1', '233', '20160826013', '和');
INSERT INTO `sscorder` VALUES ('556', '6', '6', '3', '2016-08-26 02:01:53', '5400', '10638', '0', '233', '20160826013', '虎');
INSERT INTO `sscorder` VALUES ('557', '6', '5', '3', '2016-08-26 02:01:53', '600', '1188', '0', '233', '20160826013', '龙');
INSERT INTO `sscorder` VALUES ('558', '6', '4', '3', '2016-08-26 02:01:53', '98700', '194439', '0', '233', '20160826013', '总和双');
INSERT INTO `sscorder` VALUES ('559', '5', '1', '3', '2016-08-26 02:01:53', '500', '4900', '0', '233', '20160826013', '第5位：第0球');
INSERT INTO `sscorder` VALUES ('560', '6', '3', '3', '2016-08-26 02:01:53', '900', '1782', '1', '233', '20160826013', '总和单');
INSERT INTO `sscorder` VALUES ('561', '6', '2', '3', '2016-08-26 02:01:53', '900', '1773', '1', '233', '20160826013', '总和小');
INSERT INTO `sscorder` VALUES ('562', '6', '1', '3', '2016-08-26 02:01:53', '800', '1584', '0', '233', '20160826013', '总和大');
INSERT INTO `sscorder` VALUES ('563', '8', '1', '3', '2016-08-26 02:02:09', '6700', '442267', '0', '233', '20160826013', '中三位：豹子');
INSERT INTO `sscorder` VALUES ('564', '8', '2', '3', '2016-08-26 02:02:09', '700', '8407', '0', '233', '20160826013', '中三位：顺子');
INSERT INTO `sscorder` VALUES ('565', '8', '3', '3', '2016-08-26 02:02:09', '700', '1967', '0', '233', '20160826013', '中三位：对子');
INSERT INTO `sscorder` VALUES ('566', '8', '4', '3', '2016-08-26 02:02:09', '700', '1547', '0', '233', '20160826013', '中三位：半顺');
INSERT INTO `sscorder` VALUES ('567', '8', '5', '3', '2016-08-26 02:02:09', '700', '1547', '1', '233', '20160826013', '中三位：杂六');
INSERT INTO `sscorder` VALUES ('568', '5', '12', '3', '2016-08-26 02:02:09', '400', '792', '1', '233', '20160826013', '第5位：小');
INSERT INTO `sscorder` VALUES ('569', '5', '11', '3', '2016-08-26 02:02:09', '4300', '8514', '0', '233', '20160826013', '第5位：大');
INSERT INTO `sscorder` VALUES ('570', '5', '10', '3', '2016-08-26 02:02:09', '5400', '52920', '0', '233', '20160826013', '第5位：第9球');
INSERT INTO `sscorder` VALUES ('571', '5', '14', '3', '2016-08-26 02:02:09', '600', '1188', '1', '233', '20160826013', '第5位：双');
INSERT INTO `sscorder` VALUES ('572', '5', '13', '3', '2016-08-26 02:02:09', '500', '990', '0', '233', '20160826013', '第5位：单');
INSERT INTO `sscorder` VALUES ('573', '5', '5', '3', '2016-08-26 02:02:09', '600', '5880', '1', '233', '20160826013', '第5位：第4球');
INSERT INTO `sscorder` VALUES ('574', '5', '4', '3', '2016-08-26 02:02:09', '500', '4900', '0', '233', '20160826013', '第5位：第3球');
INSERT INTO `sscorder` VALUES ('575', '5', '3', '3', '2016-08-26 02:02:09', '5400', '52920', '0', '233', '20160826013', '第5位：第2球');
INSERT INTO `sscorder` VALUES ('576', '5', '2', '3', '2016-08-26 02:02:09', '300', '2940', '0', '233', '20160826013', '第5位：第1球');
INSERT INTO `sscorder` VALUES ('577', '5', '9', '3', '2016-08-26 02:02:09', '6500', '63700', '0', '233', '20160826013', '第5位：第8球');
INSERT INTO `sscorder` VALUES ('578', '5', '8', '3', '2016-08-26 02:02:09', '600', '5880', '0', '233', '20160826013', '第5位：第7球');
INSERT INTO `sscorder` VALUES ('579', '5', '7', '3', '2016-08-26 02:02:09', '700', '6860', '0', '233', '20160826013', '第5位：第6球');
INSERT INTO `sscorder` VALUES ('580', '5', '6', '3', '2016-08-26 02:02:09', '6700', '65660', '0', '233', '20160826013', '第5位：第5球');
INSERT INTO `sscorder` VALUES ('581', '6', '7', '3', '2016-08-26 02:02:09', '600', '0', '1', '233', '20160826013', '和');
INSERT INTO `sscorder` VALUES ('582', '6', '6', '3', '2016-08-26 02:02:09', '600', '1182', '0', '233', '20160826013', '虎');
INSERT INTO `sscorder` VALUES ('583', '6', '5', '3', '2016-08-26 02:02:09', '700', '1386', '0', '233', '20160826013', '龙');
INSERT INTO `sscorder` VALUES ('584', '6', '4', '3', '2016-08-26 02:02:09', '700', '1379', '0', '233', '20160826013', '总和双');
INSERT INTO `sscorder` VALUES ('585', '6', '3', '3', '2016-08-26 02:02:09', '6700', '13266', '1', '233', '20160826013', '总和单');
INSERT INTO `sscorder` VALUES ('586', '6', '2', '3', '2016-08-26 02:02:09', '600', '1182', '1', '233', '20160826013', '总和小');
INSERT INTO `sscorder` VALUES ('587', '6', '1', '3', '2016-08-26 02:02:09', '600', '1188', '0', '233', '20160826013', '总和大');
INSERT INTO `sscorder` VALUES ('588', '9', '3', '3', '2016-08-26 02:02:26', '7600', '21356', '0', '233', '20160826013', '后三位：对子');
INSERT INTO `sscorder` VALUES ('589', '9', '2', '3', '2016-08-26 02:02:26', '800', '9608', '0', '233', '20160826013', '后三位：顺子');
INSERT INTO `sscorder` VALUES ('590', '9', '5', '3', '2016-08-26 02:02:26', '400', '884', '1', '233', '20160826013', '后三位：杂六');
INSERT INTO `sscorder` VALUES ('591', '9', '4', '3', '2016-08-26 02:02:26', '500', '1105', '0', '233', '20160826013', '后三位：半顺');
INSERT INTO `sscorder` VALUES ('592', '9', '1', '3', '2016-08-26 02:02:26', '800', '52808', '0', '233', '20160826013', '后三位：豹子');
INSERT INTO `sscorder` VALUES ('593', '5', '12', '3', '2016-08-26 02:02:26', '300', '594', '1', '233', '20160826013', '第5位：小');
INSERT INTO `sscorder` VALUES ('594', '5', '11', '3', '2016-08-26 02:02:26', '300', '594', '0', '233', '20160826013', '第5位：大');
INSERT INTO `sscorder` VALUES ('595', '5', '10', '3', '2016-08-26 02:02:26', '400', '3920', '0', '233', '20160826013', '第5位：第9球');
INSERT INTO `sscorder` VALUES ('596', '5', '14', '3', '2016-08-26 02:02:26', '500', '990', '1', '233', '20160826013', '第5位：双');
INSERT INTO `sscorder` VALUES ('597', '5', '13', '3', '2016-08-26 02:02:26', '5400', '10692', '0', '233', '20160826013', '第5位：单');
INSERT INTO `sscorder` VALUES ('598', '5', '5', '3', '2016-08-26 02:02:26', '5600', '54880', '1', '233', '20160826013', '第5位：第4球');
INSERT INTO `sscorder` VALUES ('599', '5', '4', '3', '2016-08-26 02:02:26', '500', '4900', '0', '233', '20160826013', '第5位：第3球');
INSERT INTO `sscorder` VALUES ('600', '5', '3', '3', '2016-08-26 02:02:26', '400', '3920', '0', '233', '20160826013', '第5位：第2球');
INSERT INTO `sscorder` VALUES ('601', '5', '2', '3', '2016-08-26 02:02:26', '300', '2940', '0', '233', '20160826013', '第5位：第1球');
INSERT INTO `sscorder` VALUES ('602', '5', '9', '3', '2016-08-26 02:02:26', '500', '4900', '0', '233', '20160826013', '第5位：第8球');
INSERT INTO `sscorder` VALUES ('603', '5', '8', '3', '2016-08-26 02:02:26', '7600', '74480', '0', '233', '20160826013', '第5位：第7球');
INSERT INTO `sscorder` VALUES ('604', '5', '7', '3', '2016-08-26 02:02:26', '700', '6860', '0', '233', '20160826013', '第5位：第6球');
INSERT INTO `sscorder` VALUES ('605', '5', '6', '3', '2016-08-26 02:02:26', '700', '6860', '0', '233', '20160826013', '第5位：第5球');
INSERT INTO `sscorder` VALUES ('606', '6', '7', '3', '2016-08-26 02:02:26', '800', '0', '1', '233', '20160826013', '和');
INSERT INTO `sscorder` VALUES ('607', '6', '6', '3', '2016-08-26 02:02:26', '87800', '172966', '0', '233', '20160826013', '虎');
INSERT INTO `sscorder` VALUES ('608', '6', '5', '3', '2016-08-26 02:02:26', '700', '1386', '0', '233', '20160826013', '龙');
INSERT INTO `sscorder` VALUES ('609', '6', '4', '3', '2016-08-26 02:02:26', '700', '1379', '0', '233', '20160826013', '总和双');
INSERT INTO `sscorder` VALUES ('610', '5', '1', '3', '2016-08-26 02:02:26', '200', '1960', '0', '233', '20160826013', '第5位：第0球');
INSERT INTO `sscorder` VALUES ('611', '6', '3', '3', '2016-08-26 02:02:26', '700', '1386', '1', '233', '20160826013', '总和单');
INSERT INTO `sscorder` VALUES ('612', '6', '2', '3', '2016-08-26 02:02:26', '600', '1182', '1', '233', '20160826013', '总和小');
INSERT INTO `sscorder` VALUES ('613', '6', '1', '3', '2016-08-26 02:02:26', '600', '1188', '0', '233', '20160826013', '总和大');
INSERT INTO `sscorder` VALUES ('614', '8', '2', '3', '2016-08-26 02:02:55', '600', '7206', '0', '233', '20160826013', '中三位：顺子');
INSERT INTO `sscorder` VALUES ('615', '8', '3', '3', '2016-08-26 02:02:55', '600', '1686', '0', '233', '20160826013', '中三位：对子');
INSERT INTO `sscorder` VALUES ('616', '8', '4', '3', '2016-08-26 02:02:55', '67700', '149617', '0', '233', '20160826013', '中三位：半顺');
INSERT INTO `sscorder` VALUES ('617', '8', '5', '3', '2016-08-26 02:02:55', '700', '1547', '1', '233', '20160826013', '中三位：杂六');
INSERT INTO `sscorder` VALUES ('618', '5', '12', '3', '2016-08-26 02:02:55', '5400', '10692', '1', '233', '20160826013', '第5位：小');
INSERT INTO `sscorder` VALUES ('619', '5', '11', '3', '2016-08-26 02:02:55', '500', '990', '0', '233', '20160826013', '第5位：大');
INSERT INTO `sscorder` VALUES ('620', '5', '10', '3', '2016-08-26 02:02:55', '500', '4900', '0', '233', '20160826013', '第5位：第9球');
INSERT INTO `sscorder` VALUES ('621', '5', '14', '3', '2016-08-26 02:02:55', '6700', '13266', '1', '233', '20160826013', '第5位：双');
INSERT INTO `sscorder` VALUES ('622', '5', '13', '3', '2016-08-26 02:02:55', '5600', '11088', '0', '233', '20160826013', '第5位：单');
INSERT INTO `sscorder` VALUES ('623', '5', '5', '3', '2016-08-26 02:02:55', '800', '7840', '1', '233', '20160826013', '第5位：第4球');
INSERT INTO `sscorder` VALUES ('624', '5', '4', '3', '2016-08-26 02:02:55', '800', '7840', '0', '233', '20160826013', '第5位：第3球');
INSERT INTO `sscorder` VALUES ('625', '5', '3', '3', '2016-08-26 02:02:55', '700', '6860', '0', '233', '20160826013', '第5位：第2球');
INSERT INTO `sscorder` VALUES ('626', '5', '2', '3', '2016-08-26 02:02:55', '700', '6860', '0', '233', '20160826013', '第5位：第1球');
INSERT INTO `sscorder` VALUES ('627', '5', '9', '3', '2016-08-26 02:02:55', '600', '5880', '0', '233', '20160826013', '第5位：第8球');
INSERT INTO `sscorder` VALUES ('628', '5', '8', '3', '2016-08-26 02:02:55', '700', '6860', '0', '233', '20160826013', '第5位：第7球');
INSERT INTO `sscorder` VALUES ('629', '5', '7', '3', '2016-08-26 02:02:55', '700', '6860', '0', '233', '20160826013', '第5位：第6球');
INSERT INTO `sscorder` VALUES ('630', '5', '6', '3', '2016-08-26 02:02:55', '9900', '97020', '0', '233', '20160826013', '第5位：第5球');
INSERT INTO `sscorder` VALUES ('631', '6', '7', '3', '2016-08-26 02:02:55', '500', '0', '1', '233', '20160826013', '和');
INSERT INTO `sscorder` VALUES ('632', '6', '6', '3', '2016-08-26 02:02:55', '400', '788', '0', '233', '20160826013', '虎');
INSERT INTO `sscorder` VALUES ('633', '6', '5', '3', '2016-08-26 02:02:55', '6500', '12870', '0', '233', '20160826013', '龙');
INSERT INTO `sscorder` VALUES ('634', '6', '4', '3', '2016-08-26 02:02:55', '700', '1379', '0', '233', '20160826013', '总和双');
INSERT INTO `sscorder` VALUES ('635', '5', '1', '3', '2016-08-26 02:02:55', '600', '5880', '0', '233', '20160826013', '第5位：第0球');
INSERT INTO `sscorder` VALUES ('636', '6', '3', '3', '2016-08-26 02:02:55', '700', '1386', '1', '233', '20160826013', '总和单');
INSERT INTO `sscorder` VALUES ('637', '6', '2', '3', '2016-08-26 02:02:55', '700', '1379', '1', '233', '20160826013', '总和小');
INSERT INTO `sscorder` VALUES ('638', '6', '1', '3', '2016-08-26 02:02:55', '700', '1386', '0', '233', '20160826013', '总和大');
INSERT INTO `sscorder` VALUES ('639', '8', '1', '3', '2016-08-26 02:03:18', '700', '46207', '0', '233', '20160826013', '中三位：豹子');
INSERT INTO `sscorder` VALUES ('640', '8', '2', '3', '2016-08-26 02:03:18', '800', '9608', '0', '233', '20160826013', '中三位：顺子');
INSERT INTO `sscorder` VALUES ('641', '8', '3', '3', '2016-08-26 02:03:18', '8900', '25009', '0', '233', '20160826013', '中三位：对子');
INSERT INTO `sscorder` VALUES ('642', '8', '4', '3', '2016-08-26 02:03:18', '900', '1989', '0', '233', '20160826013', '中三位：半顺');
INSERT INTO `sscorder` VALUES ('643', '8', '5', '3', '2016-08-26 02:03:18', '9700', '21437', '1', '233', '20160826013', '中三位：杂六');
INSERT INTO `sscorder` VALUES ('644', '5', '12', '3', '2016-08-26 02:03:18', '500', '990', '1', '233', '20160826013', '第5位：小');
INSERT INTO `sscorder` VALUES ('645', '5', '11', '3', '2016-08-26 02:03:18', '400', '792', '0', '233', '20160826013', '第5位：大');
INSERT INTO `sscorder` VALUES ('646', '5', '10', '3', '2016-08-26 02:03:18', '300', '2940', '0', '233', '20160826013', '第5位：第9球');
INSERT INTO `sscorder` VALUES ('647', '5', '14', '3', '2016-08-26 02:03:18', '800', '1584', '1', '233', '20160826013', '第5位：双');
INSERT INTO `sscorder` VALUES ('648', '5', '13', '3', '2016-08-26 02:03:18', '6700', '13266', '0', '233', '20160826013', '第5位：单');
INSERT INTO `sscorder` VALUES ('649', '5', '5', '3', '2016-08-26 02:03:18', '8800', '86240', '1', '233', '20160826013', '第5位：第4球');
INSERT INTO `sscorder` VALUES ('650', '5', '4', '3', '2016-08-26 02:03:18', '700', '6860', '0', '233', '20160826013', '第5位：第3球');
INSERT INTO `sscorder` VALUES ('651', '5', '3', '3', '2016-08-26 02:03:18', '700', '6860', '0', '233', '20160826013', '第5位：第2球');
INSERT INTO `sscorder` VALUES ('652', '5', '2', '3', '2016-08-26 02:03:18', '600', '5880', '0', '233', '20160826013', '第5位：第1球');
INSERT INTO `sscorder` VALUES ('653', '5', '9', '3', '2016-08-26 02:03:18', '5400', '52920', '0', '233', '20160826013', '第5位：第8球');
INSERT INTO `sscorder` VALUES ('654', '5', '8', '3', '2016-08-26 02:03:18', '600', '5880', '0', '233', '20160826013', '第5位：第7球');
INSERT INTO `sscorder` VALUES ('655', '5', '7', '3', '2016-08-26 02:03:18', '700', '6860', '0', '233', '20160826013', '第5位：第6球');
INSERT INTO `sscorder` VALUES ('656', '5', '6', '3', '2016-08-26 02:03:18', '800', '7840', '0', '233', '20160826013', '第5位：第5球');
INSERT INTO `sscorder` VALUES ('657', '6', '7', '3', '2016-08-26 02:03:18', '66700', '0', '1', '233', '20160826013', '和');
INSERT INTO `sscorder` VALUES ('658', '6', '6', '3', '2016-08-26 02:03:18', '400', '788', '0', '233', '20160826013', '虎');
INSERT INTO `sscorder` VALUES ('659', '6', '5', '3', '2016-08-26 02:03:18', '4300', '8514', '0', '233', '20160826013', '龙');
INSERT INTO `sscorder` VALUES ('660', '6', '4', '3', '2016-08-26 02:03:18', '600', '1182', '0', '233', '20160826013', '总和双');
INSERT INTO `sscorder` VALUES ('661', '5', '1', '3', '2016-08-26 02:03:18', '600', '5880', '0', '233', '20160826013', '第5位：第0球');
INSERT INTO `sscorder` VALUES ('662', '6', '3', '3', '2016-08-26 02:03:18', '700', '1386', '1', '233', '20160826013', '总和单');
INSERT INTO `sscorder` VALUES ('663', '6', '2', '3', '2016-08-26 02:03:18', '900', '1773', '1', '233', '20160826013', '总和小');
INSERT INTO `sscorder` VALUES ('664', '6', '1', '3', '2016-08-26 02:03:18', '89900', '178002', '0', '233', '20160826013', '总和大');
INSERT INTO `sscorder` VALUES ('665', '8', '1', '3', '2016-08-26 02:03:35', '800', '52808', '0', '233', '20160826013', '中三位：豹子');
INSERT INTO `sscorder` VALUES ('666', '8', '2', '3', '2016-08-26 02:03:35', '800', '9608', '0', '233', '20160826013', '中三位：顺子');
INSERT INTO `sscorder` VALUES ('667', '8', '3', '3', '2016-08-26 02:03:35', '7500', '21075', '0', '233', '20160826013', '中三位：对子');
INSERT INTO `sscorder` VALUES ('668', '8', '4', '3', '2016-08-26 02:03:35', '400', '884', '0', '233', '20160826013', '中三位：半顺');
INSERT INTO `sscorder` VALUES ('669', '8', '5', '3', '2016-08-26 02:03:35', '300', '663', '1', '233', '20160826013', '中三位：杂六');
INSERT INTO `sscorder` VALUES ('670', '5', '12', '3', '2016-08-26 02:03:35', '87800', '173844', '1', '233', '20160826013', '第5位：小');
INSERT INTO `sscorder` VALUES ('671', '5', '11', '3', '2016-08-26 02:03:35', '7700', '15246', '0', '233', '20160826013', '第5位：大');
INSERT INTO `sscorder` VALUES ('672', '5', '10', '3', '2016-08-26 02:03:35', '5600', '54880', '0', '233', '20160826013', '第5位：第9球');
INSERT INTO `sscorder` VALUES ('673', '5', '14', '3', '2016-08-26 02:03:35', '900', '1782', '1', '233', '20160826013', '第5位：双');
INSERT INTO `sscorder` VALUES ('674', '5', '13', '3', '2016-08-26 02:03:35', '800', '1584', '0', '233', '20160826013', '第5位：单');
INSERT INTO `sscorder` VALUES ('675', '5', '5', '3', '2016-08-26 02:03:35', '800', '7840', '1', '233', '20160826013', '第5位：第4球');
INSERT INTO `sscorder` VALUES ('676', '5', '4', '3', '2016-08-26 02:03:35', '7800', '76440', '0', '233', '20160826013', '第5位：第3球');
INSERT INTO `sscorder` VALUES ('677', '5', '3', '3', '2016-08-26 02:03:35', '600', '5880', '0', '233', '20160826013', '第5位：第2球');
INSERT INTO `sscorder` VALUES ('678', '5', '2', '3', '2016-08-26 02:03:35', '4500', '44100', '0', '233', '20160826013', '第5位：第1球');
INSERT INTO `sscorder` VALUES ('679', '5', '9', '3', '2016-08-26 02:03:35', '400', '3920', '0', '233', '20160826013', '第5位：第8球');
INSERT INTO `sscorder` VALUES ('680', '5', '8', '3', '2016-08-26 02:03:35', '3300', '32340', '0', '233', '20160826013', '第5位：第7球');
INSERT INTO `sscorder` VALUES ('681', '5', '7', '3', '2016-08-26 02:03:35', '5400', '52920', '0', '233', '20160826013', '第5位：第6球');
INSERT INTO `sscorder` VALUES ('682', '5', '6', '3', '2016-08-26 02:03:35', '700', '6860', '0', '233', '20160826013', '第5位：第5球');
INSERT INTO `sscorder` VALUES ('683', '6', '7', '3', '2016-08-26 02:03:35', '7700', '0', '1', '233', '20160826013', '和');
INSERT INTO `sscorder` VALUES ('684', '6', '6', '3', '2016-08-26 02:03:35', '600', '1182', '0', '233', '20160826013', '虎');
INSERT INTO `sscorder` VALUES ('685', '6', '5', '3', '2016-08-26 02:03:35', '400', '792', '0', '233', '20160826013', '龙');
INSERT INTO `sscorder` VALUES ('686', '6', '4', '3', '2016-08-26 02:03:35', '3300', '6501', '0', '233', '20160826013', '总和双');
INSERT INTO `sscorder` VALUES ('687', '5', '1', '3', '2016-08-26 02:03:35', '3200', '31360', '0', '233', '20160826013', '第5位：第0球');
INSERT INTO `sscorder` VALUES ('688', '6', '3', '3', '2016-08-26 02:03:35', '400', '792', '1', '233', '20160826013', '总和单');
INSERT INTO `sscorder` VALUES ('689', '6', '2', '3', '2016-08-26 02:03:35', '600', '1182', '1', '233', '20160826013', '总和小');
INSERT INTO `sscorder` VALUES ('690', '6', '1', '3', '2016-08-26 02:03:35', '8700', '17226', '0', '233', '20160826013', '总和大');
INSERT INTO `sscorder` VALUES ('691', '8', '1', '3', '2016-08-26 02:03:51', '7700', '508277', '0', '233', '20160826013', '中三位：豹子');
INSERT INTO `sscorder` VALUES ('692', '8', '2', '3', '2016-08-26 02:03:51', '600', '7206', '0', '233', '20160826013', '中三位：顺子');
INSERT INTO `sscorder` VALUES ('693', '8', '3', '3', '2016-08-26 02:03:51', '600', '1686', '0', '233', '20160826013', '中三位：对子');
INSERT INTO `sscorder` VALUES ('694', '8', '4', '3', '2016-08-26 02:03:51', '600', '1326', '0', '233', '20160826013', '中三位：半顺');
INSERT INTO `sscorder` VALUES ('695', '8', '5', '3', '2016-08-26 02:03:51', '7800', '17238', '1', '233', '20160826013', '中三位：杂六');
INSERT INTO `sscorder` VALUES ('696', '2', '2', '3', '2016-08-26 02:03:51', '6500', '63700', '0', '233', '20160826013', '第2位：第1球');
INSERT INTO `sscorder` VALUES ('697', '2', '3', '3', '2016-08-26 02:03:51', '600', '5880', '1', '233', '20160826013', '第2位：第2球');
INSERT INTO `sscorder` VALUES ('698', '2', '4', '3', '2016-08-26 02:03:51', '7700', '75460', '0', '233', '20160826013', '第2位：第3球');
INSERT INTO `sscorder` VALUES ('699', '2', '9', '3', '2016-08-26 02:03:51', '700', '6860', '0', '233', '20160826013', '第2位：第8球');
INSERT INTO `sscorder` VALUES ('700', '2', '5', '3', '2016-08-26 02:03:51', '700', '6860', '0', '233', '20160826013', '第2位：第4球');
INSERT INTO `sscorder` VALUES ('701', '2', '6', '3', '2016-08-26 02:03:51', '600', '5880', '0', '233', '20160826013', '第2位：第5球');
INSERT INTO `sscorder` VALUES ('702', '2', '7', '3', '2016-08-26 02:03:51', '500', '4900', '0', '233', '20160826013', '第2位：第6球');
INSERT INTO `sscorder` VALUES ('703', '2', '8', '3', '2016-08-26 02:03:51', '45600', '446880', '0', '233', '20160826013', '第2位：第7球');
INSERT INTO `sscorder` VALUES ('704', '2', '13', '3', '2016-08-26 02:03:51', '500', '990', '0', '233', '20160826013', '第2位：单');
INSERT INTO `sscorder` VALUES ('705', '2', '12', '3', '2016-08-26 02:03:51', '500', '990', '1', '233', '20160826013', '第2位：小');
INSERT INTO `sscorder` VALUES ('706', '2', '11', '3', '2016-08-26 02:03:51', '7700', '15246', '0', '233', '20160826013', '第2位：大');
INSERT INTO `sscorder` VALUES ('707', '2', '10', '3', '2016-08-26 02:03:51', '700', '6860', '0', '233', '20160826013', '第2位：第9球');
INSERT INTO `sscorder` VALUES ('708', '6', '7', '3', '2016-08-26 02:03:51', '600', '0', '1', '233', '20160826013', '和');
INSERT INTO `sscorder` VALUES ('709', '6', '6', '3', '2016-08-26 02:03:51', '500', '985', '0', '233', '20160826013', '虎');
INSERT INTO `sscorder` VALUES ('710', '6', '5', '3', '2016-08-26 02:03:51', '87600', '173448', '0', '233', '20160826013', '龙');
INSERT INTO `sscorder` VALUES ('711', '6', '4', '3', '2016-08-26 02:03:51', '800', '1576', '0', '233', '20160826013', '总和双');
INSERT INTO `sscorder` VALUES ('712', '6', '3', '3', '2016-08-26 02:03:51', '7800', '15444', '1', '233', '20160826013', '总和单');
INSERT INTO `sscorder` VALUES ('713', '6', '2', '3', '2016-08-26 02:03:51', '700', '1379', '1', '233', '20160826013', '总和小');
INSERT INTO `sscorder` VALUES ('714', '6', '1', '3', '2016-08-26 02:03:51', '5600', '11088', '0', '233', '20160826013', '总和大');
INSERT INTO `sscorder` VALUES ('715', '2', '14', '3', '2016-08-26 02:03:51', '400', '792', '1', '233', '20160826013', '第2位：双');
INSERT INTO `sscorder` VALUES ('716', '8', '1', '3', '2016-08-26 02:04:08', '6700', '442267', '0', '233', '20160826013', '中三位：豹子');
INSERT INTO `sscorder` VALUES ('717', '8', '2', '3', '2016-08-26 02:04:08', '7800', '93678', '0', '233', '20160826013', '中三位：顺子');
INSERT INTO `sscorder` VALUES ('718', '8', '3', '3', '2016-08-26 02:04:08', '8800', '24728', '0', '233', '20160826013', '中三位：对子');
INSERT INTO `sscorder` VALUES ('719', '8', '4', '3', '2016-08-26 02:04:08', '600', '1326', '0', '233', '20160826013', '中三位：半顺');
INSERT INTO `sscorder` VALUES ('720', '8', '5', '3', '2016-08-26 02:04:08', '7800', '17238', '1', '233', '20160826013', '中三位：杂六');
INSERT INTO `sscorder` VALUES ('721', '2', '1', '3', '2016-08-26 02:04:08', '200', '1960', '0', '233', '20160826013', '第2位：第0球');
INSERT INTO `sscorder` VALUES ('722', '2', '2', '3', '2016-08-26 02:04:08', '300', '2940', '0', '233', '20160826013', '第2位：第1球');
INSERT INTO `sscorder` VALUES ('723', '2', '3', '3', '2016-08-26 02:04:08', '5500', '53900', '1', '233', '20160826013', '第2位：第2球');
INSERT INTO `sscorder` VALUES ('724', '2', '4', '3', '2016-08-26 02:04:08', '500', '4900', '0', '233', '20160826013', '第2位：第3球');
INSERT INTO `sscorder` VALUES ('725', '2', '9', '3', '2016-08-26 02:04:08', '8900', '87220', '0', '233', '20160826013', '第2位：第8球');
INSERT INTO `sscorder` VALUES ('726', '2', '5', '3', '2016-08-26 02:04:08', '400', '3920', '0', '233', '20160826013', '第2位：第4球');
INSERT INTO `sscorder` VALUES ('727', '2', '6', '3', '2016-08-26 02:04:08', '3500', '34300', '0', '233', '20160826013', '第2位：第5球');
INSERT INTO `sscorder` VALUES ('728', '2', '8', '3', '2016-08-26 02:04:08', '700', '6860', '0', '233', '20160826013', '第2位：第7球');
INSERT INTO `sscorder` VALUES ('729', '2', '13', '3', '2016-08-26 02:04:08', '4400', '8712', '0', '233', '20160826013', '第2位：单');
INSERT INTO `sscorder` VALUES ('730', '2', '12', '3', '2016-08-26 02:04:08', '500', '990', '1', '233', '20160826013', '第2位：小');
INSERT INTO `sscorder` VALUES ('731', '2', '11', '3', '2016-08-26 02:04:08', '700', '1386', '0', '233', '20160826013', '第2位：大');
INSERT INTO `sscorder` VALUES ('732', '2', '10', '3', '2016-08-26 02:04:08', '9800', '96040', '0', '233', '20160826013', '第2位：第9球');
INSERT INTO `sscorder` VALUES ('733', '6', '7', '3', '2016-08-26 02:04:08', '400', '0', '1', '233', '20160826013', '和');
INSERT INTO `sscorder` VALUES ('734', '6', '6', '3', '2016-08-26 02:04:08', '300', '591', '0', '233', '20160826013', '虎');
INSERT INTO `sscorder` VALUES ('735', '6', '5', '3', '2016-08-26 02:04:08', '5300', '10494', '0', '233', '20160826013', '龙');
INSERT INTO `sscorder` VALUES ('736', '6', '4', '3', '2016-08-26 02:04:08', '700', '1379', '0', '233', '20160826013', '总和双');
INSERT INTO `sscorder` VALUES ('737', '6', '3', '3', '2016-08-26 02:04:08', '800', '1584', '1', '233', '20160826013', '总和单');
INSERT INTO `sscorder` VALUES ('738', '6', '2', '3', '2016-08-26 02:04:08', '8800', '17336', '1', '233', '20160826013', '总和小');
INSERT INTO `sscorder` VALUES ('739', '6', '1', '3', '2016-08-26 02:04:08', '600', '1188', '0', '233', '20160826013', '总和大');
INSERT INTO `sscorder` VALUES ('740', '2', '14', '3', '2016-08-26 02:04:08', '500', '990', '1', '233', '20160826013', '第2位：双');
INSERT INTO `sscorder` VALUES ('741', '8', '1', '3', '2016-08-26 02:04:24', '500', '33005', '0', '233', '20160826013', '中三位：豹子');
INSERT INTO `sscorder` VALUES ('742', '8', '2', '3', '2016-08-26 02:04:24', '4400', '52844', '0', '233', '20160826013', '中三位：顺子');
INSERT INTO `sscorder` VALUES ('743', '8', '3', '3', '2016-08-26 02:04:24', '500', '1405', '0', '233', '20160826013', '中三位：对子');
INSERT INTO `sscorder` VALUES ('744', '8', '4', '3', '2016-08-26 02:04:24', '6700', '14807', '0', '233', '20160826013', '中三位：半顺');
INSERT INTO `sscorder` VALUES ('745', '8', '5', '3', '2016-08-26 02:04:24', '9800', '21658', '1', '233', '20160826013', '中三位：杂六');
INSERT INTO `sscorder` VALUES ('746', '2', '1', '3', '2016-08-26 02:04:24', '400', '3920', '0', '233', '20160826013', '第2位：第0球');
INSERT INTO `sscorder` VALUES ('747', '2', '2', '3', '2016-08-26 02:04:24', '500', '4900', '0', '233', '20160826013', '第2位：第1球');
INSERT INTO `sscorder` VALUES ('748', '2', '3', '3', '2016-08-26 02:04:24', '6700', '65660', '1', '233', '20160826013', '第2位：第2球');
INSERT INTO `sscorder` VALUES ('749', '2', '4', '3', '2016-08-26 02:04:24', '700', '6860', '0', '233', '20160826013', '第2位：第3球');
INSERT INTO `sscorder` VALUES ('750', '2', '9', '3', '2016-08-26 02:04:24', '700', '6860', '0', '233', '20160826013', '第2位：第8球');
INSERT INTO `sscorder` VALUES ('751', '2', '5', '3', '2016-08-26 02:04:24', '700', '6860', '0', '233', '20160826013', '第2位：第4球');
INSERT INTO `sscorder` VALUES ('752', '2', '6', '3', '2016-08-26 02:04:24', '6500', '63700', '0', '233', '20160826013', '第2位：第5球');
INSERT INTO `sscorder` VALUES ('753', '2', '7', '3', '2016-08-26 02:04:24', '300', '2940', '0', '233', '20160826013', '第2位：第6球');
INSERT INTO `sscorder` VALUES ('754', '2', '8', '3', '2016-08-26 02:04:24', '3500', '34300', '0', '233', '20160826013', '第2位：第7球');
INSERT INTO `sscorder` VALUES ('755', '2', '13', '3', '2016-08-26 02:04:24', '700', '1386', '0', '233', '20160826013', '第2位：单');
INSERT INTO `sscorder` VALUES ('756', '2', '12', '3', '2016-08-26 02:04:24', '9800', '19404', '1', '233', '20160826013', '第2位：小');
INSERT INTO `sscorder` VALUES ('757', '2', '11', '3', '2016-08-26 02:04:24', '8900', '17622', '0', '233', '20160826013', '第2位：大');
INSERT INTO `sscorder` VALUES ('758', '2', '10', '3', '2016-08-26 02:04:24', '800', '7840', '0', '233', '20160826013', '第2位：第9球');
INSERT INTO `sscorder` VALUES ('759', '6', '7', '3', '2016-08-26 02:04:24', '600', '0', '1', '233', '20160826013', '和');
INSERT INTO `sscorder` VALUES ('760', '6', '6', '3', '2016-08-26 02:04:24', '8700', '17139', '0', '233', '20160826013', '虎');
INSERT INTO `sscorder` VALUES ('761', '6', '5', '3', '2016-08-26 02:04:24', '9900', '19602', '0', '233', '20160826013', '龙');
INSERT INTO `sscorder` VALUES ('762', '6', '4', '3', '2016-08-26 02:04:24', '800', '1576', '0', '233', '20160826013', '总和双');
INSERT INTO `sscorder` VALUES ('763', '6', '3', '3', '2016-08-26 02:04:24', '700', '1386', '1', '233', '20160826013', '总和单');
INSERT INTO `sscorder` VALUES ('764', '6', '2', '3', '2016-08-26 02:04:24', '4600', '9062', '1', '233', '20160826013', '总和小');
INSERT INTO `sscorder` VALUES ('765', '6', '1', '3', '2016-08-26 02:04:24', '400', '792', '0', '233', '20160826013', '总和大');
INSERT INTO `sscorder` VALUES ('766', '2', '14', '3', '2016-08-26 02:04:24', '6500', '12870', '1', '233', '20160826013', '第2位：双');
INSERT INTO `sscorder` VALUES ('767', '8', '1', '3', '2016-08-26 02:04:43', '6700', '442267', '0', '233', '20160826013', '中三位：豹子');
INSERT INTO `sscorder` VALUES ('768', '8', '2', '3', '2016-08-26 02:04:43', '7600', '91276', '0', '233', '20160826013', '中三位：顺子');
INSERT INTO `sscorder` VALUES ('769', '8', '3', '3', '2016-08-26 02:04:43', '500', '1405', '0', '233', '20160826013', '中三位：对子');
INSERT INTO `sscorder` VALUES ('770', '8', '4', '3', '2016-08-26 02:04:43', '800', '1768', '0', '233', '20160826013', '中三位：半顺');
INSERT INTO `sscorder` VALUES ('771', '8', '5', '3', '2016-08-26 02:04:43', '800', '1768', '1', '233', '20160826013', '中三位：杂六');
INSERT INTO `sscorder` VALUES ('772', '3', '3', '3', '2016-08-26 02:04:43', '800', '7840', '0', '233', '20160826013', '第3位：第2球');
INSERT INTO `sscorder` VALUES ('773', '3', '2', '3', '2016-08-26 02:04:43', '700', '6860', '0', '233', '20160826013', '第3位：第1球');
INSERT INTO `sscorder` VALUES ('774', '3', '1', '3', '2016-08-26 02:04:43', '500', '4900', '0', '233', '20160826013', '第3位：第0球');
INSERT INTO `sscorder` VALUES ('775', '3', '7', '3', '2016-08-26 02:04:43', '500', '4900', '0', '233', '20160826013', '第3位：第6球');
INSERT INTO `sscorder` VALUES ('776', '3', '6', '3', '2016-08-26 02:04:43', '55400', '542920', '0', '233', '20160826013', '第3位：第5球');
INSERT INTO `sscorder` VALUES ('777', '3', '5', '3', '2016-08-26 02:04:43', '600', '5880', '0', '233', '20160826013', '第3位：第4球');
INSERT INTO `sscorder` VALUES ('778', '3', '4', '3', '2016-08-26 02:04:43', '8700', '85260', '0', '233', '20160826013', '第3位：第3球');
INSERT INTO `sscorder` VALUES ('779', '3', '9', '3', '2016-08-26 02:04:43', '700', '6860', '0', '233', '20160826013', '第3位：第8球');
INSERT INTO `sscorder` VALUES ('780', '3', '8', '3', '2016-08-26 02:04:43', '600', '5880', '1', '233', '20160826013', '第3位：第7球');
INSERT INTO `sscorder` VALUES ('781', '3', '10', '3', '2016-08-26 02:04:43', '7700', '75460', '0', '233', '20160826013', '第3位：第9球');
INSERT INTO `sscorder` VALUES ('782', '3', '13', '3', '2016-08-26 02:04:43', '500', '990', '1', '233', '20160826013', '第3位：单');
INSERT INTO `sscorder` VALUES ('783', '3', '14', '3', '2016-08-26 02:04:43', '66700', '132066', '0', '233', '20160826013', '第3位：双');
INSERT INTO `sscorder` VALUES ('784', '3', '11', '3', '2016-08-26 02:04:43', '6500', '12870', '1', '233', '20160826013', '第3位：大');
INSERT INTO `sscorder` VALUES ('785', '3', '12', '3', '2016-08-26 02:04:43', '500', '990', '0', '233', '20160826013', '第3位：小');
INSERT INTO `sscorder` VALUES ('786', '6', '7', '3', '2016-08-26 02:04:43', '600', '0', '1', '233', '20160826013', '和');
INSERT INTO `sscorder` VALUES ('787', '6', '6', '3', '2016-08-26 02:04:43', '5600', '11032', '0', '233', '20160826013', '虎');
INSERT INTO `sscorder` VALUES ('788', '6', '5', '3', '2016-08-26 02:04:43', '5400', '10692', '0', '233', '20160826013', '龙');
INSERT INTO `sscorder` VALUES ('789', '6', '4', '3', '2016-08-26 02:04:43', '600', '1182', '0', '233', '20160826013', '总和双');
INSERT INTO `sscorder` VALUES ('790', '6', '3', '3', '2016-08-26 02:04:43', '700', '1386', '1', '233', '20160826013', '总和单');
INSERT INTO `sscorder` VALUES ('791', '6', '2', '3', '2016-08-26 02:04:43', '7700', '15169', '1', '233', '20160826013', '总和小');
INSERT INTO `sscorder` VALUES ('792', '6', '1', '3', '2016-08-26 02:04:43', '6700', '13266', '0', '233', '20160826013', '总和大');
INSERT INTO `sscorder` VALUES ('793', '3', '3', '3', '2016-08-26 02:04:52', '900', '8820', '0', '233', '20160826013', '第3位：第2球');
INSERT INTO `sscorder` VALUES ('794', '3', '2', '3', '2016-08-26 02:04:52', '9800', '96040', '0', '233', '20160826013', '第3位：第1球');
INSERT INTO `sscorder` VALUES ('795', '3', '4', '3', '2016-08-26 02:04:52', '9900', '97020', '0', '233', '20160826013', '第3位：第3球');
INSERT INTO `sscorder` VALUES ('796', '1', '8', '3', '2016-08-28 09:27:36', '100', '980', '0', '264', '20160828011', '第1位：第7球');
INSERT INTO `sscorder` VALUES ('797', '1', '9', '3', '2016-08-28 09:27:36', '2300', '22540', '0', '264', '20160828011', '第1位：第8球');
INSERT INTO `sscorder` VALUES ('798', '1', '1', '3', '2016-08-28 09:27:36', '400', '3920', '0', '264', '20160828011', '第1位：第0球');
INSERT INTO `sscorder` VALUES ('799', '1', '2', '3', '2016-08-28 09:27:36', '2300', '22540', '1', '264', '20160828011', '第1位：第1球');
INSERT INTO `sscorder` VALUES ('800', '1', '3', '3', '2016-08-28 09:27:36', '32300', '316540', '0', '264', '20160828011', '第1位：第2球');
INSERT INTO `sscorder` VALUES ('801', '1', '12', '3', '2016-08-28 09:27:36', '2100', '4158', '1', '264', '20160828011', '第1位：小');
INSERT INTO `sscorder` VALUES ('802', '1', '10', '3', '2016-08-28 09:27:36', '1200', '11760', '0', '264', '20160828011', '第1位：第9球');
INSERT INTO `sscorder` VALUES ('803', '6', '6', '3', '2016-08-28 09:27:36', '200', '396', '1', '264', '20160828011', '虎');
INSERT INTO `sscorder` VALUES ('804', '6', '2', '3', '2016-08-28 09:27:36', '200', '396', '1', '264', '20160828011', '总和小');
INSERT INTO `sscorder` VALUES ('805', '1', '13', '3', '2016-08-28 09:27:36', '1200', '2376', '1', '264', '20160828011', '第1位：单');
INSERT INTO `sscorder` VALUES ('806', '1', '14', '3', '2016-08-28 09:27:36', '200', '396', '0', '264', '20160828011', '第1位：双');
INSERT INTO `sscorder` VALUES ('807', '1', '6', '3', '2016-08-28 09:27:57', '2200', '21560', '0', '264', '20160828011', '第1位：第5球');
INSERT INTO `sscorder` VALUES ('808', '1', '8', '3', '2016-08-28 09:27:57', '1200', '11760', '0', '264', '20160828011', '第1位：第7球');
INSERT INTO `sscorder` VALUES ('809', '1', '9', '3', '2016-08-28 09:27:57', '3300', '32340', '0', '264', '20160828011', '第1位：第8球');
INSERT INTO `sscorder` VALUES ('810', '1', '2', '3', '2016-08-28 09:27:57', '200', '1960', '1', '264', '20160828011', '第1位：第1球');
INSERT INTO `sscorder` VALUES ('811', '1', '4', '3', '2016-08-28 09:27:57', '1200', '11760', '0', '264', '20160828011', '第1位：第3球');
INSERT INTO `sscorder` VALUES ('812', '1', '5', '3', '2016-08-28 09:27:57', '1200', '11760', '0', '264', '20160828011', '第1位：第4球');
INSERT INTO `sscorder` VALUES ('813', '1', '12', '3', '2016-08-28 09:27:57', '1200', '2376', '1', '264', '20160828011', '第1位：小');
INSERT INTO `sscorder` VALUES ('814', '1', '11', '3', '2016-08-28 09:27:57', '200', '396', '0', '264', '20160828011', '第1位：大');
INSERT INTO `sscorder` VALUES ('815', '1', '10', '3', '2016-08-28 09:27:57', '200', '1960', '0', '264', '20160828011', '第1位：第9球');
INSERT INTO `sscorder` VALUES ('816', '1', '13', '3', '2016-08-28 09:27:57', '1200', '2376', '1', '264', '20160828011', '第1位：单');
INSERT INTO `sscorder` VALUES ('817', '1', '14', '3', '2016-08-28 09:27:57', '300', '594', '0', '264', '20160828011', '第1位：双');
INSERT INTO `sscorder` VALUES ('818', '1', '9', '4', '2016-08-28 19:54:01', '1500', '14700', '0', '304', '20160828051', '第1位：第8球');
INSERT INTO `sscorder` VALUES ('819', '1', '3', '4', '2016-08-28 19:54:01', '1000', '9800', '0', '304', '20160828051', '第1位：第2球');
INSERT INTO `sscorder` VALUES ('820', '1', '4', '4', '2016-08-28 19:54:01', '2200', '21560', '0', '304', '20160828051', '第1位：第3球');
INSERT INTO `sscorder` VALUES ('821', '1', '2', '4', '2016-08-28 19:57:15', '100', '980', '1', '305', '20160828052', '第1位：第1球');
INSERT INTO `sscorder` VALUES ('822', '1', '3', '4', '2016-08-28 19:57:15', '1000', '9800', '0', '305', '20160828052', '第1位：第2球');

-- ----------------------------
-- Table structure for `ssc_a`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_a`;
CREATE TABLE `ssc_a` (
  `id` int(11) NOT NULL auto_increment,
  `sscid` int(11) NOT NULL,
  `n0` int(3) NOT NULL,
  `n1` int(3) NOT NULL,
  `n2` int(3) NOT NULL,
  `n3` int(3) NOT NULL,
  `n4` int(3) NOT NULL,
  `n5` int(3) NOT NULL,
  `n6` int(3) NOT NULL,
  `n7` int(3) NOT NULL,
  `n8` int(3) NOT NULL,
  `n9` int(3) NOT NULL,
  `da` int(3) NOT NULL,
  `xiao` int(3) NOT NULL,
  `ji` int(3) NOT NULL,
  `ou` int(3) NOT NULL,
  `zhi` int(3) NOT NULL,
  `he` int(3) NOT NULL,
  `lu0` int(3) NOT NULL,
  `lu1` int(3) NOT NULL,
  `lu2` int(3) NOT NULL,
  `sheng` int(3) NOT NULL,
  `ping` int(3) NOT NULL,
  `jiang` int(3) NOT NULL,
  `z0` int(3) NOT NULL,
  `z1` int(3) NOT NULL,
  `z2` int(3) NOT NULL,
  `z3` int(3) NOT NULL,
  `z4` int(3) NOT NULL,
  `z5` int(3) NOT NULL,
  `z6` int(3) NOT NULL,
  `z7` int(3) NOT NULL,
  `z8` int(3) NOT NULL,
  `z9` int(3) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssc_a
-- ----------------------------
INSERT INTO `ssc_a` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '-1', '1', '-1', '1', '1', '-1', '1', '-1', '1', '1', '-1', '-1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '-1', '1');
INSERT INTO `ssc_a` VALUES ('2', '2', '2', '2', '2', '2', '2', '2', '2', '-1', '1', '2', '-1', '2', '-1', '1', '-1', '1', '2', '-1', '1', '1', '2', '-1', '2', '-1', '2', '2', '2', '2', '2', '2', '1', '2');
INSERT INTO `ssc_a` VALUES ('3', '3', '3', '3', '3', '3', '3', '-1', '3', '1', '2', '3', '-1', '3', '-1', '2', '-1', '2', '3', '1', '-1', '2', '3', '-1', '3', '1', '-1', '3', '3', '3', '3', '3', '2', '3');
INSERT INTO `ssc_a` VALUES ('4', '4', '-1', '4', '4', '4', '4', '1', '4', '2', '3', '4', '1', '-1', '1', '-1', '1', '-1', '-1', '2', '1', '3', '4', '-1', '4', '2', '1', '4', '4', '-1', '4', '4', '3', '4');
INSERT INTO `ssc_a` VALUES ('5', '5', '1', '5', '5', '5', '-1', '2', '5', '3', '4', '5', '2', '-1', '2', '-1', '2', '-1', '1', '-1', '2', '-1', '5', '1', '5', '3', '2', '5', '-1', '1', '5', '5', '4', '5');
INSERT INTO `ssc_a` VALUES ('6', '6', '-1', '6', '6', '6', '1', '3', '6', '4', '5', '6', '3', '-1', '3', '-1', '3', '-1', '-1', '1', '3', '1', '6', '-1', '6', '4', '3', '6', '-1', '2', '6', '6', '5', '6');
INSERT INTO `ssc_a` VALUES ('7', '7', '-1', '7', '7', '7', '2', '4', '7', '5', '6', '7', '4', '-1', '4', '-1', '4', '-1', '-1', '2', '4', '2', '-1', '1', '-1', '5', '4', '7', '1', '3', '7', '7', '6', '7');
INSERT INTO `ssc_a` VALUES ('8', '8', '1', '8', '8', '-1', '3', '5', '8', '6', '7', '8', '5', '-1', '-1', '1', '-1', '1', '-1', '3', '5', '-1', '1', '2', '1', '6', '5', '-1', '2', '4', '8', '8', '7', '8');
INSERT INTO `ssc_a` VALUES ('9', '9', '2', '9', '9', '1', '4', '-1', '9', '7', '8', '9', '-1', '1', '-1', '2', '-1', '2', '1', '4', '-1', '-1', '2', '3', '2', '7', '-1', '1', '3', '5', '9', '9', '8', '9');
INSERT INTO `ssc_a` VALUES ('10', '10', '3', '10', '10', '2', '5', '1', '10', '8', '9', '-1', '-1', '2', '-1', '3', '1', '-1', '-1', '5', '1', '-1', '3', '4', '3', '8', '1', '2', '-1', '6', '10', '10', '9', '10');
INSERT INTO `ssc_a` VALUES ('11', '11', '4', '11', '-1', '3', '6', '2', '11', '9', '10', '1', '1', '-1', '1', '-1', '-1', '1', '1', '6', '-1', '1', '4', '-1', '4', '9', '2', '3', '1', '7', '11', '-1', '10', '11');
INSERT INTO `ssc_a` VALUES ('12', '12', '5', '12', '-1', '4', '7', '3', '12', '10', '11', '2', '2', '-1', '2', '-1', '-1', '2', '2', '7', '-1', '2', '-1', '1', '-1', '10', '3', '4', '2', '8', '12', '1', '11', '12');
INSERT INTO `ssc_a` VALUES ('13', '13', '6', '13', '1', '5', '8', '-1', '13', '11', '12', '3', '-1', '1', '-1', '1', '-1', '3', '3', '8', '-1', '-1', '1', '2', '1', '11', '4', '-1', '3', '9', '13', '2', '12', '13');
INSERT INTO `ssc_a` VALUES ('14', '14', '7', '14', '2', '6', '9', '1', '14', '-1', '13', '4', '-1', '2', '-1', '2', '-1', '4', '4', '-1', '1', '-1', '2', '3', '2', '12', '-1', '1', '4', '10', '14', '3', '13', '14');
INSERT INTO `ssc_a` VALUES ('15', '15', '8', '15', '3', '7', '10', '-1', '15', '1', '14', '5', '-1', '3', '-1', '3', '-1', '5', '5', '1', '-1', '1', '3', '-1', '3', '13', '-1', '2', '5', '11', '15', '4', '14', '15');
INSERT INTO `ssc_a` VALUES ('16', '16', '9', '-1', '4', '8', '11', '1', '16', '2', '15', '6', '1', '-1', '-1', '4', '-1', '6', '6', '-1', '1', '2', '4', '-1', '4', '14', '1', '3', '-1', '12', '16', '5', '15', '16');
INSERT INTO `ssc_a` VALUES ('17', '17', '10', '1', '5', '9', '12', '2', '-1', '3', '16', '7', '-1', '1', '1', '-1', '1', '-1', '-1', '1', '2', '-1', '5', '1', '5', '15', '2', '4', '1', '-1', '17', '6', '16', '17');
INSERT INTO `ssc_a` VALUES ('18', '18', '-1', '2', '6', '10', '13', '3', '1', '4', '17', '8', '1', '-1', '2', '-1', '2', '-1', '-1', '2', '3', '1', '6', '-1', '6', '16', '3', '5', '2', '1', '-1', '7', '17', '18');
INSERT INTO `ssc_a` VALUES ('19', '19', '1', '3', '7', '11', '14', '4', '2', '-1', '18', '9', '-1', '1', '-1', '1', '-1', '1', '1', '-1', '4', '-1', '7', '1', '7', '17', '4', '6', '3', '2', '1', '-1', '18', '19');
INSERT INTO `ssc_a` VALUES ('20', '20', '2', '4', '-1', '12', '15', '5', '3', '1', '19', '10', '1', '-1', '1', '-1', '-1', '2', '2', '1', '-1', '1', '8', '-1', '8', '18', '5', '7', '4', '-1', '2', '1', '19', '20');
INSERT INTO `ssc_a` VALUES ('21', '21', '3', '5', '1', '13', '16', '6', '4', '2', '-1', '11', '-1', '1', '2', '-1', '1', '-1', '3', '2', '-1', '-1', '9', '1', '9', '19', '6', '8', '5', '1', '-1', '2', '20', '21');
INSERT INTO `ssc_a` VALUES ('22', '22', '4', '6', '2', '14', '-1', '7', '5', '3', '1', '12', '1', '-1', '3', '-1', '2', '-1', '4', '-1', '1', '1', '10', '-1', '10', '20', '7', '9', '-1', '2', '1', '3', '21', '22');
INSERT INTO `ssc_a` VALUES ('23', '23', '5', '7', '-1', '15', '1', '8', '6', '4', '2', '13', '2', '-1', '4', '-1', '-1', '1', '5', '1', '-1', '2', '11', '-1', '11', '21', '-1', '10', '1', '3', '2', '4', '22', '23');
INSERT INTO `ssc_a` VALUES ('24', '24', '-1', '8', '1', '16', '2', '9', '7', '5', '3', '14', '3', '-1', '5', '-1', '1', '-1', '-1', '2', '1', '3', '12', '-1', '12', '22', '-1', '11', '2', '4', '3', '5', '23', '24');
INSERT INTO `ssc_a` VALUES ('25', '25', '1', '9', '2', '17', '3', '10', '8', '6', '4', '-1', '-1', '1', '-1', '1', '2', '-1', '-1', '3', '2', '-1', '13', '1', '13', '23', '1', '12', '3', '5', '4', '6', '24', '-1');
INSERT INTO `ssc_a` VALUES ('26', '26', '2', '10', '3', '18', '4', '-1', '9', '7', '5', '1', '-1', '2', '-1', '2', '-1', '1', '1', '4', '-1', '1', '14', '-1', '14', '24', '2', '13', '-1', '6', '5', '7', '25', '1');
INSERT INTO `ssc_a` VALUES ('27', '27', '3', '11', '4', '-1', '5', '1', '10', '8', '6', '2', '1', '-1', '-1', '3', '-1', '2', '-1', '5', '1', '2', '15', '-1', '15', '25', '-1', '14', '1', '7', '6', '8', '26', '2');
INSERT INTO `ssc_a` VALUES ('28', '28', '4', '12', '5', '1', '6', '2', '-1', '9', '7', '3', '-1', '1', '1', '-1', '1', '-1', '-1', '6', '2', '-1', '16', '1', '16', '26', '1', '-1', '2', '8', '7', '9', '27', '3');
INSERT INTO `ssc_a` VALUES ('29', '29', '5', '13', '-1', '2', '7', '3', '1', '10', '8', '4', '1', '-1', '2', '-1', '-1', '1', '1', '7', '-1', '1', '17', '-1', '17', '27', '2', '1', '-1', '9', '8', '10', '28', '4');
INSERT INTO `ssc_a` VALUES ('30', '30', '-1', '14', '1', '3', '8', '4', '2', '11', '9', '5', '2', '-1', '3', '-1', '1', '-1', '-1', '8', '1', '2', '18', '-1', '18', '28', '-1', '2', '1', '10', '9', '11', '29', '5');
INSERT INTO `ssc_a` VALUES ('31', '31', '1', '15', '2', '4', '9', '5', '3', '-1', '10', '6', '-1', '1', '-1', '1', '-1', '1', '1', '-1', '2', '-1', '19', '1', '19', '29', '1', '3', '2', '11', '10', '-1', '30', '6');
INSERT INTO `ssc_a` VALUES ('32', '32', '2', '16', '3', '5', '10', '-1', '4', '1', '11', '7', '-1', '2', '-1', '2', '-1', '2', '2', '1', '-1', '1', '20', '-1', '20', '30', '-1', '4', '3', '12', '11', '1', '31', '7');
INSERT INTO `ssc_a` VALUES ('33', '33', '-1', '17', '4', '6', '11', '1', '5', '2', '12', '8', '1', '-1', '1', '-1', '1', '-1', '-1', '2', '1', '2', '21', '-1', '21', '31', '1', '5', '4', '-1', '12', '2', '32', '8');
INSERT INTO `ssc_a` VALUES ('34', '34', '1', '18', '5', '7', '12', '-1', '6', '3', '13', '9', '-1', '1', '-1', '1', '-1', '1', '1', '3', '-1', '-1', '22', '1', '22', '32', '2', '6', '5', '-1', '13', '3', '33', '9');
INSERT INTO `ssc_a` VALUES ('35', '35', '2', '19', '6', '-1', '13', '1', '7', '4', '14', '10', '1', '-1', '-1', '2', '-1', '2', '-1', '4', '1', '1', '23', '-1', '23', '33', '-1', '7', '6', '1', '14', '4', '34', '10');
INSERT INTO `ssc_a` VALUES ('36', '36', '3', '20', '7', '1', '14', '-1', '8', '5', '15', '11', '-1', '1', '-1', '3', '-1', '3', '1', '5', '-1', '-1', '24', '1', '24', '34', '-1', '8', '7', '2', '15', '5', '35', '11');
INSERT INTO `ssc_a` VALUES ('37', '37', '-1', '21', '8', '2', '15', '1', '9', '6', '16', '12', '1', '-1', '1', '-1', '1', '-1', '-1', '6', '1', '1', '25', '-1', '25', '35', '1', '9', '8', '-1', '16', '6', '36', '12');
INSERT INTO `ssc_a` VALUES ('38', '38', '1', '22', '9', '3', '16', '-1', '10', '7', '17', '13', '-1', '1', '-1', '1', '-1', '1', '1', '7', '-1', '-1', '26', '1', '26', '36', '2', '10', '9', '-1', '17', '7', '37', '13');
INSERT INTO `ssc_a` VALUES ('39', '39', '2', '23', '-1', '4', '17', '1', '11', '8', '18', '14', '1', '-1', '1', '-1', '-1', '2', '2', '8', '-1', '1', '27', '-1', '27', '37', '3', '-1', '10', '1', '18', '8', '38', '14');
INSERT INTO `ssc_a` VALUES ('40', '40', '3', '-1', '1', '5', '18', '2', '12', '9', '19', '15', '2', '-1', '-1', '1', '-1', '3', '3', '-1', '1', '2', '28', '-1', '28', '-1', '4', '1', '11', '2', '19', '9', '39', '15');
INSERT INTO `ssc_a` VALUES ('41', '41', '4', '1', '2', '6', '19', '3', '13', '10', '-1', '16', '-1', '1', '1', '-1', '1', '-1', '4', '1', '-1', '-1', '29', '1', '29', '1', '5', '2', '12', '3', '20', '-1', '40', '16');
INSERT INTO `ssc_a` VALUES ('42', '42', '5', '2', '3', '7', '20', '-1', '14', '11', '1', '17', '-1', '2', '-1', '1', '-1', '1', '5', '2', '-1', '1', '30', '-1', '30', '2', '6', '-1', '13', '4', '21', '1', '41', '17');
INSERT INTO `ssc_a` VALUES ('43', '43', '6', '3', '4', '8', '21', '1', '-1', '12', '2', '18', '-1', '3', '1', '-1', '1', '-1', '-1', '3', '1', '-1', '31', '1', '31', '-1', '7', '1', '14', '5', '22', '2', '42', '18');
INSERT INTO `ssc_a` VALUES ('44', '44', '7', '4', '5', '-1', '22', '2', '1', '13', '3', '19', '1', '-1', '-1', '1', '-1', '1', '-1', '4', '2', '1', '32', '-1', '32', '1', '8', '-1', '15', '6', '23', '3', '43', '19');
INSERT INTO `ssc_a` VALUES ('45', '45', '8', '5', '6', '1', '23', '3', '2', '-1', '4', '20', '-1', '1', '-1', '2', '-1', '2', '1', '-1', '3', '-1', '33', '1', '33', '2', '9', '1', '-1', '7', '24', '4', '44', '20');
INSERT INTO `ssc_a` VALUES ('46', '46', '9', '6', '-1', '2', '24', '4', '3', '1', '5', '21', '1', '-1', '1', '-1', '-1', '3', '2', '1', '-1', '1', '34', '-1', '34', '3', '10', '2', '1', '-1', '25', '5', '45', '21');
INSERT INTO `ssc_a` VALUES ('47', '47', '-1', '7', '1', '3', '25', '5', '4', '2', '6', '22', '2', '-1', '2', '-1', '1', '-1', '-1', '2', '1', '2', '35', '-1', '35', '4', '-1', '3', '2', '1', '26', '6', '46', '22');
INSERT INTO `ssc_a` VALUES ('48', '48', '1', '8', '2', '-1', '26', '6', '5', '3', '7', '23', '3', '-1', '-1', '1', '-1', '1', '-1', '3', '2', '-1', '36', '1', '36', '5', '1', '-1', '3', '2', '27', '7', '47', '23');
INSERT INTO `ssc_a` VALUES ('49', '49', '2', '9', '3', '1', '27', '7', '6', '4', '-1', '24', '-1', '1', '1', '-1', '1', '-1', '1', '4', '-1', '-1', '37', '2', '37', '6', '2', '1', '4', '-1', '28', '8', '48', '24');
INSERT INTO `ssc_a` VALUES ('50', '50', '3', '10', '4', '2', '28', '8', '7', '5', '-1', '25', '-1', '2', '2', '-1', '2', '-1', '2', '5', '-1', '1', '-1', '3', '-1', '7', '3', '2', '5', '1', '29', '9', '49', '25');
INSERT INTO `ssc_a` VALUES ('51', '51', '4', '11', '5', '-1', '29', '9', '8', '6', '1', '26', '1', '-1', '-1', '1', '-1', '1', '-1', '6', '1', '2', '1', '-1', '1', '8', '4', '3', '6', '-1', '30', '10', '50', '26');
INSERT INTO `ssc_a` VALUES ('52', '52', '-1', '12', '6', '1', '30', '10', '9', '7', '2', '27', '2', '-1', '1', '-1', '1', '-1', '-1', '7', '2', '3', '2', '-1', '2', '9', '5', '-1', '7', '1', '31', '11', '51', '27');
INSERT INTO `ssc_a` VALUES ('53', '53', '1', '13', '7', '2', '31', '11', '-1', '8', '3', '28', '-1', '1', '2', '-1', '2', '-1', '-1', '8', '3', '-1', '3', '1', '3', '10', '6', '1', '8', '2', '-1', '12', '52', '28');
INSERT INTO `ssc_a` VALUES ('54', '54', '2', '14', '8', '3', '32', '12', '1', '9', '4', '-1', '-1', '2', '-1', '1', '3', '-1', '-1', '9', '4', '-1', '4', '2', '4', '11', '7', '-1', '9', '3', '1', '13', '53', '29');
INSERT INTO `ssc_a` VALUES ('55', '55', '3', '15', '9', '4', '-1', '13', '2', '10', '5', '1', '1', '-1', '1', '-1', '4', '-1', '1', '-1', '5', '1', '5', '-1', '5', '12', '8', '1', '10', '-1', '2', '14', '54', '30');
INSERT INTO `ssc_a` VALUES ('56', '56', '4', '16', '10', '5', '1', '14', '-1', '11', '6', '2', '-1', '1', '2', '-1', '5', '-1', '-1', '1', '6', '-1', '6', '1', '6', '13', '-1', '2', '11', '1', '3', '15', '55', '31');
INSERT INTO `ssc_a` VALUES ('57', '57', '5', '17', '11', '6', '2', '15', '1', '-1', '7', '3', '-1', '2', '-1', '1', '-1', '1', '1', '-1', '7', '-1', '7', '2', '7', '-1', '1', '3', '12', '2', '4', '16', '56', '32');
INSERT INTO `ssc_a` VALUES ('58', '58', '6', '18', '12', '7', '3', '16', '2', '1', '-1', '4', '-1', '3', '1', '-1', '1', '-1', '2', '1', '-1', '-1', '8', '3', '8', '-1', '2', '4', '13', '3', '5', '17', '57', '33');
INSERT INTO `ssc_a` VALUES ('59', '59', '7', '19', '13', '-1', '4', '17', '3', '2', '1', '5', '1', '-1', '-1', '1', '-1', '1', '-1', '2', '1', '1', '9', '-1', '9', '1', '3', '5', '14', '-1', '6', '18', '58', '34');
INSERT INTO `ssc_a` VALUES ('60', '60', '8', '20', '14', '1', '5', '18', '4', '3', '2', '-1', '-1', '1', '-1', '2', '1', '-1', '-1', '3', '2', '-1', '10', '1', '10', '2', '4', '6', '15', '1', '-1', '19', '59', '35');
INSERT INTO `ssc_a` VALUES ('61', '61', '9', '21', '-1', '2', '6', '19', '5', '4', '3', '1', '1', '-1', '1', '-1', '-1', '1', '1', '4', '-1', '1', '11', '-1', '11', '3', '5', '7', '16', '2', '1', '-1', '60', '36');
INSERT INTO `ssc_a` VALUES ('62', '62', '10', '22', '1', '3', '7', '20', '6', '5', '4', '-1', '-1', '1', '-1', '1', '1', '-1', '-1', '5', '1', '-1', '12', '1', '12', '4', '6', '8', '17', '3', '2', '-1', '61', '37');
INSERT INTO `ssc_a` VALUES ('63', '63', '11', '23', '2', '4', '8', '21', '-1', '6', '5', '1', '-1', '2', '1', '-1', '2', '-1', '-1', '6', '2', '1', '13', '-1', '13', '5', '7', '-1', '18', '4', '3', '1', '62', '38');
INSERT INTO `ssc_a` VALUES ('64', '64', '12', '24', '-1', '5', '9', '22', '1', '7', '6', '2', '1', '-1', '2', '-1', '-1', '1', '1', '7', '-1', '2', '14', '-1', '14', '6', '8', '1', '-1', '5', '4', '2', '63', '39');
INSERT INTO `ssc_a` VALUES ('65', '65', '13', '25', '1', '6', '10', '23', '2', '8', '7', '-1', '-1', '1', '-1', '1', '1', '-1', '-1', '8', '1', '-1', '15', '1', '15', '7', '9', '2', '1', '6', '5', '-1', '64', '40');
INSERT INTO `ssc_a` VALUES ('66', '66', '14', '26', '2', '7', '11', '-1', '3', '9', '8', '1', '-1', '2', '-1', '2', '-1', '1', '1', '9', '-1', '1', '16', '-1', '16', '8', '10', '3', '-1', '7', '6', '1', '65', '41');
INSERT INTO `ssc_a` VALUES ('67', '67', '15', '27', '3', '8', '12', '1', '4', '-1', '9', '2', '-1', '3', '-1', '3', '-1', '2', '2', '-1', '1', '-1', '17', '1', '17', '9', '-1', '4', '1', '8', '7', '2', '66', '42');
INSERT INTO `ssc_a` VALUES ('68', '68', '-1', '28', '4', '9', '13', '2', '5', '1', '10', '3', '1', '-1', '1', '-1', '1', '-1', '-1', '1', '2', '1', '18', '-1', '18', '10', '1', '5', '2', '9', '8', '-1', '67', '43');
INSERT INTO `ssc_a` VALUES ('69', '69', '1', '29', '5', '10', '-1', '3', '6', '2', '11', '4', '2', '-1', '2', '-1', '2', '-1', '1', '-1', '3', '-1', '19', '1', '19', '11', '2', '6', '-1', '10', '9', '1', '68', '44');
INSERT INTO `ssc_a` VALUES ('70', '70', '2', '30', '6', '11', '1', '4', '7', '3', '12', '-1', '-1', '1', '-1', '1', '3', '-1', '-1', '1', '4', '-1', '20', '2', '20', '12', '3', '7', '1', '-1', '10', '2', '69', '45');
INSERT INTO `ssc_a` VALUES ('71', '71', '3', '31', '7', '12', '2', '-1', '8', '4', '13', '1', '-1', '2', '-1', '2', '-1', '1', '1', '2', '-1', '1', '21', '-1', '21', '13', '4', '8', '-1', '1', '11', '3', '70', '46');
INSERT INTO `ssc_a` VALUES ('72', '72', '4', '32', '8', '13', '3', '1', '-1', '5', '14', '2', '-1', '3', '1', '-1', '1', '-1', '-1', '3', '1', '-1', '22', '1', '22', '-1', '5', '9', '1', '2', '12', '4', '71', '47');
INSERT INTO `ssc_a` VALUES ('73', '73', '5', '-1', '9', '14', '4', '2', '1', '6', '15', '3', '1', '-1', '-1', '1', '-1', '1', '1', '-1', '2', '1', '23', '-1', '23', '1', '6', '10', '2', '-1', '13', '5', '72', '48');
INSERT INTO `ssc_a` VALUES ('74', '74', '6', '1', '10', '15', '-1', '3', '2', '7', '16', '4', '2', '-1', '1', '-1', '1', '-1', '2', '-1', '3', '-1', '24', '1', '24', '2', '7', '-1', '3', '1', '14', '6', '73', '49');
INSERT INTO `ssc_a` VALUES ('75', '75', '7', '-1', '11', '16', '1', '4', '3', '8', '17', '5', '3', '-1', '-1', '1', '-1', '1', '3', '-1', '4', '1', '25', '-1', '25', '3', '8', '-1', '4', '2', '15', '7', '74', '50');
INSERT INTO `ssc_a` VALUES ('76', '76', '8', '1', '12', '17', '2', '-1', '4', '9', '18', '6', '-1', '1', '-1', '2', '-1', '2', '4', '1', '-1', '-1', '26', '1', '26', '4', '9', '1', '-1', '3', '16', '8', '75', '51');
INSERT INTO `ssc_a` VALUES ('77', '77', '9', '2', '13', '18', '3', '1', '5', '10', '19', '-1', '-1', '2', '-1', '3', '1', '-1', '-1', '2', '1', '-1', '27', '2', '27', '5', '10', '2', '-1', '4', '17', '9', '76', '52');
INSERT INTO `ssc_a` VALUES ('78', '78', '10', '-1', '14', '19', '4', '2', '6', '11', '20', '1', '1', '-1', '-1', '4', '-1', '1', '1', '-1', '2', '1', '28', '-1', '28', '6', '11', '3', '1', '5', '18', '10', '-1', '53');
INSERT INTO `ssc_a` VALUES ('79', '79', '11', '1', '15', '20', '5', '3', '-1', '12', '21', '2', '-1', '1', '1', '-1', '1', '-1', '-1', '1', '3', '-1', '29', '1', '29', '7', '12', '4', '2', '-1', '19', '11', '1', '54');
INSERT INTO `ssc_a` VALUES ('80', '80', '12', '2', '16', '21', '6', '4', '1', '13', '22', '-1', '-1', '2', '-1', '1', '2', '-1', '-1', '2', '4', '-1', '30', '2', '30', '8', '13', '-1', '3', '1', '20', '12', '2', '55');
INSERT INTO `ssc_a` VALUES ('81', '81', '13', '3', '17', '22', '7', '5', '-1', '14', '23', '1', '-1', '3', '1', '-1', '3', '-1', '-1', '3', '5', '1', '31', '-1', '31', '9', '14', '-1', '4', '2', '21', '13', '3', '56');
INSERT INTO `ssc_a` VALUES ('82', '82', '14', '4', '18', '-1', '8', '6', '1', '15', '24', '2', '1', '-1', '-1', '1', '-1', '1', '-1', '4', '6', '2', '32', '-1', '32', '10', '15', '-1', '5', '3', '22', '14', '4', '57');
INSERT INTO `ssc_a` VALUES ('83', '83', '15', '5', '19', '1', '9', '7', '-1', '16', '25', '3', '-1', '1', '1', '-1', '1', '-1', '-1', '5', '7', '-1', '33', '1', '33', '11', '16', '-1', '6', '4', '23', '15', '5', '58');
INSERT INTO `ssc_a` VALUES ('84', '84', '16', '6', '20', '-1', '10', '8', '1', '17', '26', '4', '1', '-1', '-1', '1', '-1', '1', '-1', '6', '8', '1', '34', '-1', '34', '12', '17', '-1', '7', '5', '24', '16', '6', '59');
INSERT INTO `ssc_a` VALUES ('85', '85', '17', '7', '21', '1', '11', '-1', '2', '18', '27', '5', '-1', '1', '-1', '2', '-1', '2', '1', '7', '-1', '-1', '35', '1', '35', '13', '-1', '1', '8', '6', '25', '17', '7', '60');
INSERT INTO `ssc_a` VALUES ('86', '86', '18', '-1', '22', '2', '12', '1', '3', '19', '28', '6', '1', '-1', '-1', '3', '-1', '3', '2', '-1', '1', '1', '36', '-1', '36', '14', '1', '2', '-1', '7', '26', '18', '8', '61');
INSERT INTO `ssc_a` VALUES ('87', '87', '19', '1', '23', '3', '13', '2', '4', '-1', '29', '7', '-1', '1', '-1', '4', '-1', '4', '3', '-1', '2', '-1', '37', '1', '37', '15', '2', '3', '1', '8', '-1', '19', '9', '62');
INSERT INTO `ssc_a` VALUES ('88', '88', '20', '-1', '24', '4', '14', '3', '5', '1', '30', '8', '1', '-1', '-1', '5', '-1', '5', '4', '-1', '3', '1', '38', '-1', '38', '16', '3', '4', '2', '9', '-1', '20', '10', '63');
INSERT INTO `ssc_a` VALUES ('89', '89', '21', '1', '25', '-1', '15', '4', '6', '2', '31', '9', '2', '-1', '-1', '6', '-1', '6', '-1', '1', '4', '-1', '39', '1', '39', '17', '-1', '5', '3', '10', '1', '21', '11', '64');
INSERT INTO `ssc_a` VALUES ('90', '90', '22', '2', '26', '-1', '16', '5', '7', '3', '32', '10', '3', '-1', '-1', '7', '-1', '7', '-1', '2', '5', '1', '-1', '2', '-1', '18', '1', '6', '4', '11', '2', '22', '12', '65');
INSERT INTO `ssc_a` VALUES ('91', '91', '-1', '3', '27', '1', '17', '6', '8', '4', '33', '11', '4', '-1', '1', '-1', '1', '-1', '-1', '3', '6', '2', '1', '-1', '1', '19', '2', '-1', '5', '12', '3', '23', '13', '66');
INSERT INTO `ssc_a` VALUES ('92', '92', '1', '4', '-1', '2', '18', '7', '9', '5', '34', '12', '5', '-1', '2', '-1', '-1', '1', '1', '4', '-1', '-1', '2', '1', '2', '20', '-1', '1', '6', '13', '4', '24', '14', '67');
INSERT INTO `ssc_a` VALUES ('93', '93', '2', '-1', '1', '3', '19', '8', '10', '6', '35', '13', '6', '-1', '-1', '1', '-1', '2', '2', '-1', '1', '1', '3', '-1', '3', '-1', '1', '2', '7', '14', '5', '25', '15', '68');
INSERT INTO `ssc_a` VALUES ('94', '94', '3', '1', '2', '4', '20', '9', '11', '7', '-1', '14', '-1', '1', '1', '-1', '1', '-1', '3', '1', '-1', '-1', '4', '1', '4', '1', '2', '3', '8', '15', '6', '-1', '16', '69');
INSERT INTO `ssc_a` VALUES ('95', '95', '4', '2', '3', '5', '-1', '10', '12', '8', '1', '15', '1', '-1', '2', '-1', '2', '-1', '4', '-1', '1', '1', '5', '-1', '5', '2', '3', '4', '-1', '16', '7', '1', '17', '70');
INSERT INTO `ssc_a` VALUES ('96', '96', '5', '3', '4', '6', '-1', '11', '13', '9', '2', '16', '2', '-1', '3', '-1', '3', '-1', '5', '-1', '2', '2', '-1', '1', '-1', '3', '4', '5', '1', '17', '8', '2', '18', '71');
INSERT INTO `ssc_a` VALUES ('97', '97', '6', '4', '5', '7', '1', '12', '14', '10', '-1', '17', '-1', '1', '4', '-1', '4', '-1', '6', '1', '-1', '-1', '1', '2', '1', '4', '5', '6', '-1', '18', '9', '3', '19', '72');
INSERT INTO `ssc_a` VALUES ('98', '98', '7', '5', '6', '8', '2', '13', '-1', '11', '1', '18', '-1', '2', '5', '-1', '5', '-1', '-1', '2', '1', '1', '2', '-1', '2', '5', '-1', '7', '1', '19', '10', '4', '20', '73');
INSERT INTO `ssc_a` VALUES ('99', '99', '8', '6', '7', '-1', '3', '14', '1', '12', '2', '19', '1', '-1', '-1', '1', '-1', '1', '-1', '3', '2', '2', '3', '-1', '3', '6', '1', '-1', '2', '20', '11', '5', '21', '74');
INSERT INTO `ssc_a` VALUES ('100', '100', '9', '7', '8', '1', '4', '15', '-1', '13', '3', '20', '-1', '1', '1', '-1', '1', '-1', '-1', '4', '3', '-1', '4', '1', '4', '7', '2', '-1', '3', '21', '12', '6', '22', '75');
INSERT INTO `ssc_a` VALUES ('101', '101', '10', '8', '9', '2', '5', '16', '1', '14', '-1', '21', '-1', '2', '2', '-1', '2', '-1', '1', '5', '-1', '-1', '5', '2', '5', '8', '-1', '1', '4', '22', '13', '7', '23', '76');
INSERT INTO `ssc_a` VALUES ('102', '102', '11', '9', '10', '3', '6', '17', '2', '15', '1', '-1', '-1', '3', '-1', '1', '3', '-1', '-1', '6', '1', '-1', '6', '3', '6', '-1', '1', '2', '5', '23', '14', '8', '24', '77');
INSERT INTO `ssc_a` VALUES ('103', '103', '12', '10', '11', '4', '-1', '18', '3', '16', '2', '1', '1', '-1', '1', '-1', '4', '-1', '1', '-1', '2', '1', '7', '-1', '7', '1', '2', '3', '6', '-1', '15', '9', '25', '78');
INSERT INTO `ssc_a` VALUES ('104', '104', '13', '11', '12', '-1', '1', '19', '4', '17', '3', '2', '2', '-1', '-1', '1', '-1', '1', '-1', '1', '3', '2', '8', '-1', '8', '-1', '3', '4', '7', '1', '16', '10', '26', '79');
INSERT INTO `ssc_a` VALUES ('105', '105', '-1', '12', '13', '1', '2', '20', '5', '18', '4', '3', '3', '-1', '1', '-1', '1', '-1', '-1', '2', '4', '3', '9', '-1', '9', '1', '4', '-1', '8', '2', '17', '11', '27', '80');
INSERT INTO `ssc_a` VALUES ('106', '106', '1', '13', '14', '2', '-1', '21', '6', '19', '5', '4', '4', '-1', '2', '-1', '2', '-1', '1', '-1', '5', '-1', '10', '1', '10', '2', '5', '1', '-1', '3', '18', '12', '28', '81');
INSERT INTO `ssc_a` VALUES ('107', '107', '2', '-1', '15', '3', '1', '22', '7', '20', '6', '5', '5', '-1', '-1', '1', '-1', '1', '2', '-1', '6', '1', '11', '-1', '11', '3', '6', '-1', '1', '4', '19', '13', '29', '82');
INSERT INTO `ssc_a` VALUES ('108', '108', '3', '1', '16', '4', '2', '23', '8', '-1', '7', '6', '-1', '1', '-1', '2', '-1', '2', '3', '-1', '7', '-1', '12', '1', '12', '4', '7', '1', '2', '5', '-1', '14', '30', '83');
INSERT INTO `ssc_a` VALUES ('109', '109', '4', '2', '17', '-1', '3', '24', '9', '1', '8', '7', '1', '-1', '-1', '3', '-1', '3', '-1', '1', '8', '1', '13', '-1', '13', '5', '8', '2', '-1', '6', '1', '15', '31', '84');
INSERT INTO `ssc_a` VALUES ('110', '110', '5', '3', '18', '1', '4', '25', '10', '2', '9', '-1', '-1', '1', '-1', '4', '1', '-1', '-1', '2', '9', '-1', '14', '1', '14', '6', '9', '3', '1', '7', '-1', '16', '32', '85');
INSERT INTO `ssc_a` VALUES ('111', '111', '6', '4', '19', '2', '5', '-1', '11', '3', '10', '1', '-1', '2', '-1', '5', '-1', '1', '1', '3', '-1', '1', '15', '-1', '15', '7', '10', '4', '-1', '8', '1', '17', '33', '86');
INSERT INTO `ssc_a` VALUES ('112', '112', '-1', '5', '20', '3', '6', '1', '12', '4', '11', '2', '1', '-1', '1', '-1', '1', '-1', '-1', '4', '1', '2', '16', '-1', '16', '8', '11', '5', '1', '-1', '2', '18', '34', '87');
INSERT INTO `ssc_a` VALUES ('113', '113', '1', '6', '21', '-1', '7', '2', '13', '5', '12', '3', '2', '-1', '-1', '1', '-1', '1', '-1', '5', '2', '-1', '17', '1', '17', '9', '12', '-1', '2', '1', '3', '19', '35', '88');
INSERT INTO `ssc_a` VALUES ('114', '114', '2', '-1', '22', '1', '8', '3', '14', '6', '13', '4', '3', '-1', '-1', '2', '-1', '2', '1', '-1', '3', '1', '18', '-1', '18', '10', '-1', '1', '3', '2', '4', '20', '36', '89');
INSERT INTO `ssc_a` VALUES ('115', '115', '3', '1', '23', '2', '9', '4', '15', '7', '-1', '5', '-1', '1', '1', '-1', '1', '-1', '2', '1', '-1', '-1', '19', '1', '19', '11', '1', '2', '4', '3', '5', '-1', '37', '90');
INSERT INTO `ssc_a` VALUES ('116', '116', '4', '-1', '24', '3', '10', '5', '16', '8', '1', '6', '1', '-1', '-1', '1', '-1', '1', '3', '-1', '1', '1', '20', '-1', '20', '12', '2', '3', '5', '4', '6', '-1', '38', '91');
INSERT INTO `ssc_a` VALUES ('117', '117', '5', '1', '25', '4', '11', '6', '17', '9', '2', '-1', '-1', '1', '-1', '2', '1', '-1', '-1', '1', '2', '-1', '21', '1', '21', '13', '3', '4', '6', '5', '7', '1', '-1', '92');
INSERT INTO `ssc_a` VALUES ('118', '118', '6', '2', '26', '5', '12', '7', '-1', '10', '3', '1', '-1', '2', '1', '-1', '2', '-1', '-1', '2', '3', '1', '22', '-1', '22', '14', '4', '-1', '7', '6', '8', '2', '1', '93');
INSERT INTO `ssc_a` VALUES ('119', '119', '7', '3', '27', '6', '13', '8', '1', '-1', '4', '2', '-1', '3', '-1', '1', '-1', '1', '1', '-1', '4', '-1', '23', '1', '23', '-1', '5', '1', '8', '7', '9', '3', '2', '94');
INSERT INTO `ssc_a` VALUES ('120', '120', '8', '4', '28', '7', '-1', '9', '2', '1', '5', '3', '1', '-1', '1', '-1', '1', '-1', '2', '-1', '5', '1', '24', '-1', '24', '1', '6', '-1', '9', '8', '10', '4', '3', '95');
INSERT INTO `ssc_a` VALUES ('121', '121', '9', '5', '29', '8', '1', '10', '3', '2', '6', '-1', '-1', '1', '-1', '1', '2', '-1', '-1', '1', '6', '-1', '25', '1', '25', '2', '7', '1', '10', '-1', '11', '5', '4', '96');
INSERT INTO `ssc_a` VALUES ('122', '122', '10', '-1', '30', '9', '2', '11', '4', '3', '7', '1', '1', '-1', '-1', '2', '-1', '1', '1', '-1', '7', '1', '26', '-1', '26', '3', '8', '2', '11', '1', '12', '6', '-1', '97');
INSERT INTO `ssc_a` VALUES ('123', '123', '11', '1', '31', '10', '3', '12', '5', '4', '8', '-1', '-1', '1', '-1', '3', '1', '-1', '-1', '1', '8', '-1', '27', '1', '27', '4', '9', '3', '12', '2', '13', '7', '-1', '98');
INSERT INTO `ssc_a` VALUES ('124', '124', '12', '2', '32', '11', '4', '-1', '6', '5', '9', '1', '-1', '2', '-1', '4', '-1', '1', '1', '2', '-1', '1', '28', '-1', '28', '5', '10', '4', '-1', '3', '14', '8', '1', '99');
INSERT INTO `ssc_a` VALUES ('125', '125', '13', '3', '33', '12', '5', '1', '7', '-1', '10', '2', '-1', '3', '-1', '5', '-1', '2', '2', '-1', '1', '-1', '29', '1', '29', '6', '-1', '5', '1', '4', '15', '9', '2', '100');
INSERT INTO `ssc_a` VALUES ('126', '126', '14', '-1', '34', '13', '6', '2', '8', '1', '11', '3', '1', '-1', '-1', '6', '-1', '3', '3', '-1', '2', '1', '30', '-1', '30', '7', '1', '6', '2', '5', '-1', '10', '3', '101');
INSERT INTO `ssc_a` VALUES ('127', '127', '-1', '1', '35', '14', '7', '3', '9', '2', '12', '4', '2', '-1', '1', '-1', '1', '-1', '-1', '1', '3', '2', '31', '-1', '31', '-1', '2', '7', '3', '6', '1', '11', '4', '102');
INSERT INTO `ssc_a` VALUES ('128', '128', '1', '2', '36', '15', '8', '-1', '10', '3', '13', '5', '-1', '1', '-1', '1', '-1', '1', '1', '2', '-1', '-1', '32', '1', '32', '1', '3', '8', '4', '-1', '2', '12', '5', '103');
INSERT INTO `ssc_a` VALUES ('129', '129', '2', '3', '37', '16', '9', '-1', '11', '4', '14', '6', '-1', '2', '-1', '2', '-1', '2', '2', '3', '-1', '1', '-1', '2', '-1', '2', '4', '9', '5', '1', '3', '13', '6', '104');
INSERT INTO `ssc_a` VALUES ('130', '130', '-1', '4', '38', '17', '10', '1', '12', '5', '15', '7', '1', '-1', '1', '-1', '1', '-1', '-1', '4', '1', '2', '1', '-1', '1', '3', '5', '10', '6', '-1', '4', '14', '7', '105');
INSERT INTO `ssc_a` VALUES ('131', '131', '1', '5', '39', '18', '11', '2', '13', '-1', '16', '8', '-1', '1', '-1', '1', '-1', '1', '1', '-1', '2', '-1', '2', '1', '2', '4', '6', '11', '7', '1', '5', '-1', '8', '106');
INSERT INTO `ssc_a` VALUES ('132', '132', '2', '6', '40', '19', '12', '3', '14', '1', '17', '-1', '-1', '2', '-1', '2', '1', '-1', '-1', '1', '3', '-1', '3', '2', '3', '5', '-1', '12', '8', '2', '6', '1', '9', '107');
INSERT INTO `ssc_a` VALUES ('133', '133', '3', '7', '41', '20', '13', '4', '15', '2', '18', '-1', '-1', '3', '-1', '3', '2', '-1', '-1', '2', '4', '1', '-1', '3', '-1', '6', '1', '13', '9', '3', '7', '2', '10', '108');
INSERT INTO `ssc_a` VALUES ('134', '134', '4', '8', '42', '21', '14', '-1', '16', '3', '19', '1', '-1', '4', '-1', '4', '-1', '1', '1', '3', '-1', '2', '1', '-1', '1', '7', '2', '14', '-1', '4', '8', '3', '11', '109');
INSERT INTO `ssc_a` VALUES ('135', '135', '5', '9', '43', '22', '15', '1', '17', '4', '20', '-1', '-1', '5', '-1', '5', '1', '-1', '-1', '4', '1', '-1', '2', '1', '2', '8', '3', '15', '-1', '5', '9', '4', '12', '110');
INSERT INTO `ssc_a` VALUES ('136', '136', '6', '10', '44', '23', '16', '-1', '18', '5', '21', '1', '-1', '6', '-1', '6', '-1', '1', '1', '5', '-1', '1', '3', '-1', '3', '9', '4', '16', '-1', '6', '10', '5', '13', '111');
INSERT INTO `ssc_a` VALUES ('137', '137', '7', '11', '-1', '24', '17', '1', '19', '6', '22', '2', '1', '-1', '1', '-1', '-1', '2', '2', '6', '-1', '2', '4', '-1', '4', '10', '5', '-1', '1', '7', '11', '6', '14', '112');
INSERT INTO `ssc_a` VALUES ('138', '138', '8', '12', '1', '25', '18', '2', '-1', '7', '23', '3', '-1', '1', '2', '-1', '1', '-1', '-1', '7', '1', '-1', '5', '1', '5', '11', '6', '1', '-1', '8', '12', '7', '15', '113');
INSERT INTO `ssc_a` VALUES ('139', '139', '9', '13', '2', '26', '-1', '3', '1', '8', '24', '4', '1', '-1', '3', '-1', '2', '-1', '1', '-1', '2', '1', '6', '-1', '6', '12', '-1', '2', '1', '9', '13', '8', '16', '114');
INSERT INTO `ssc_a` VALUES ('140', '140', '-1', '14', '3', '27', '1', '4', '2', '9', '25', '5', '2', '-1', '4', '-1', '3', '-1', '-1', '1', '3', '2', '7', '-1', '7', '13', '1', '3', '-1', '10', '14', '9', '17', '115');
INSERT INTO `ssc_a` VALUES ('141', '141', '1', '15', '4', '28', '2', '5', '3', '-1', '26', '6', '-1', '1', '-1', '1', '-1', '1', '1', '-1', '4', '-1', '8', '1', '8', '14', '2', '4', '1', '11', '15', '-1', '18', '116');
INSERT INTO `ssc_a` VALUES ('142', '142', '2', '16', '5', '29', '-1', '6', '4', '1', '27', '7', '1', '-1', '1', '-1', '1', '-1', '2', '-1', '5', '1', '9', '-1', '9', '15', '3', '-1', '2', '12', '16', '1', '19', '117');
INSERT INTO `ssc_a` VALUES ('143', '143', '-1', '17', '6', '30', '1', '7', '5', '2', '28', '8', '2', '-1', '2', '-1', '2', '-1', '-1', '1', '6', '2', '10', '-1', '10', '16', '4', '1', '-1', '13', '17', '2', '20', '118');
INSERT INTO `ssc_a` VALUES ('144', '144', '-1', '18', '7', '31', '2', '8', '6', '3', '29', '9', '3', '-1', '3', '-1', '3', '-1', '-1', '2', '7', '3', '-1', '1', '-1', '17', '5', '2', '1', '14', '18', '3', '21', '119');
INSERT INTO `ssc_a` VALUES ('145', '145', '-1', '19', '8', '32', '3', '9', '7', '4', '30', '10', '4', '-1', '4', '-1', '4', '-1', '-1', '3', '8', '4', '-1', '2', '-1', '18', '6', '3', '2', '15', '19', '4', '22', '120');
INSERT INTO `ssc_a` VALUES ('146', '146', '1', '-1', '9', '33', '4', '10', '8', '5', '31', '11', '5', '-1', '-1', '1', '-1', '1', '1', '-1', '9', '-1', '1', '3', '1', '-1', '7', '4', '3', '16', '20', '5', '23', '121');
INSERT INTO `ssc_a` VALUES ('147', '147', '2', '1', '10', '34', '5', '11', '9', '6', '32', '-1', '-1', '1', '-1', '2', '1', '-1', '-1', '1', '10', '-1', '2', '4', '2', '1', '8', '5', '4', '17', '21', '6', '-1', '122');
INSERT INTO `ssc_a` VALUES ('148', '148', '3', '2', '11', '-1', '6', '12', '10', '7', '33', '1', '1', '-1', '-1', '3', '-1', '1', '-1', '2', '11', '1', '3', '-1', '3', '2', '9', '6', '5', '18', '-1', '7', '1', '123');
INSERT INTO `ssc_a` VALUES ('149', '149', '4', '3', '12', '1', '7', '13', '11', '8', '34', '-1', '-1', '1', '-1', '4', '1', '-1', '-1', '3', '12', '-1', '4', '1', '4', '3', '10', '7', '6', '19', '-1', '8', '2', '124');
INSERT INTO `ssc_a` VALUES ('150', '150', '5', '4', '13', '2', '8', '-1', '12', '9', '35', '1', '-1', '2', '-1', '5', '-1', '1', '1', '4', '-1', '1', '5', '-1', '5', '4', '11', '8', '-1', '20', '1', '9', '3', '125');
INSERT INTO `ssc_a` VALUES ('151', '151', '6', '-1', '14', '3', '9', '1', '13', '10', '36', '2', '1', '-1', '-1', '6', '-1', '2', '2', '-1', '1', '2', '6', '-1', '6', '5', '12', '9', '-1', '21', '2', '10', '4', '126');
INSERT INTO `ssc_a` VALUES ('152', '152', '7', '1', '-1', '4', '10', '2', '14', '11', '37', '3', '2', '-1', '1', '-1', '-1', '3', '3', '1', '-1', '-1', '7', '1', '7', '-1', '13', '10', '1', '22', '3', '11', '5', '127');
INSERT INTO `ssc_a` VALUES ('153', '153', '8', '2', '1', '5', '-1', '3', '15', '12', '38', '4', '3', '-1', '2', '-1', '1', '-1', '4', '-1', '1', '-1', '8', '2', '8', '1', '-1', '11', '2', '23', '4', '12', '6', '128');
INSERT INTO `ssc_a` VALUES ('154', '154', '9', '3', '2', '6', '1', '-1', '16', '13', '39', '5', '-1', '1', '-1', '1', '-1', '1', '5', '1', '-1', '-1', '9', '3', '9', '-1', '1', '12', '3', '24', '5', '13', '7', '129');
INSERT INTO `ssc_a` VALUES ('155', '155', '10', '4', '3', '7', '2', '1', '17', '-1', '40', '6', '-1', '2', '-1', '2', '-1', '2', '6', '-1', '1', '-1', '10', '4', '10', '1', '-1', '13', '4', '25', '6', '14', '8', '130');
INSERT INTO `ssc_a` VALUES ('156', '156', '11', '5', '4', '8', '3', '2', '18', '1', '41', '-1', '-1', '3', '-1', '3', '1', '-1', '-1', '1', '2', '-1', '11', '5', '11', '2', '-1', '14', '5', '26', '7', '15', '9', '131');
INSERT INTO `ssc_a` VALUES ('157', '157', '12', '6', '5', '9', '4', '3', '19', '2', '-1', '1', '-1', '4', '1', '-1', '2', '-1', '1', '2', '-1', '1', '12', '-1', '12', '-1', '1', '15', '6', '27', '8', '16', '10', '132');
INSERT INTO `ssc_a` VALUES ('158', '158', '13', '7', '-1', '10', '5', '4', '20', '3', '1', '2', '1', '-1', '2', '-1', '-1', '1', '2', '3', '-1', '2', '13', '-1', '13', '1', '2', '16', '7', '28', '-1', '17', '11', '133');
INSERT INTO `ssc_a` VALUES ('159', '159', '14', '-1', '1', '11', '6', '5', '21', '4', '2', '3', '2', '-1', '-1', '1', '-1', '2', '3', '-1', '1', '3', '14', '-1', '14', '-1', '3', '17', '8', '29', '1', '18', '12', '134');
INSERT INTO `ssc_a` VALUES ('160', '160', '15', '1', '2', '12', '7', '6', '22', '-1', '3', '4', '-1', '1', '-1', '2', '-1', '3', '4', '-1', '2', '-1', '15', '1', '15', '1', '4', '18', '9', '30', '-1', '19', '13', '135');
INSERT INTO `ssc_a` VALUES ('161', '161', '16', '2', '-1', '13', '8', '7', '23', '1', '4', '5', '1', '-1', '1', '-1', '-1', '4', '5', '1', '-1', '1', '16', '-1', '16', '2', '5', '19', '10', '-1', '1', '20', '14', '136');
INSERT INTO `ssc_a` VALUES ('162', '162', '17', '3', '1', '14', '9', '8', '24', '-1', '5', '6', '-1', '1', '-1', '1', '-1', '5', '6', '-1', '1', '-1', '17', '1', '17', '3', '6', '20', '11', '-1', '2', '21', '15', '137');
INSERT INTO `ssc_a` VALUES ('163', '163', '18', '-1', '2', '15', '10', '9', '25', '1', '6', '7', '1', '-1', '-1', '2', '-1', '6', '7', '-1', '2', '1', '18', '-1', '18', '4', '7', '21', '12', '1', '-1', '22', '16', '138');
INSERT INTO `ssc_a` VALUES ('164', '164', '19', '1', '3', '16', '-1', '10', '26', '2', '7', '8', '2', '-1', '1', '-1', '1', '-1', '8', '-1', '3', '-1', '19', '1', '19', '5', '8', '-1', '13', '2', '1', '23', '17', '139');
INSERT INTO `ssc_a` VALUES ('165', '165', '20', '2', '4', '17', '1', '11', '27', '-1', '8', '9', '-1', '1', '-1', '1', '-1', '1', '9', '-1', '4', '-1', '20', '2', '20', '6', '9', '-1', '14', '3', '2', '24', '18', '140');
INSERT INTO `ssc_a` VALUES ('166', '166', '21', '3', '5', '18', '2', '12', '-1', '1', '9', '10', '-1', '2', '1', '-1', '1', '-1', '-1', '1', '5', '1', '21', '-1', '21', '-1', '10', '1', '15', '4', '3', '25', '19', '141');
INSERT INTO `ssc_a` VALUES ('167', '167', '-1', '4', '6', '19', '3', '13', '1', '2', '10', '11', '1', '-1', '2', '-1', '2', '-1', '-1', '2', '6', '2', '22', '-1', '22', '1', '11', '2', '16', '5', '-1', '26', '20', '142');
INSERT INTO `ssc_a` VALUES ('168', '168', '1', '5', '7', '20', '4', '14', '-1', '3', '11', '12', '-1', '1', '3', '-1', '3', '-1', '-1', '3', '7', '-1', '23', '1', '23', '2', '12', '3', '17', '6', '-1', '27', '21', '143');
INSERT INTO `ssc_a` VALUES ('169', '169', '2', '6', '-1', '21', '5', '15', '1', '4', '12', '13', '1', '-1', '4', '-1', '-1', '1', '1', '4', '-1', '1', '24', '-1', '24', '3', '13', '4', '-1', '7', '1', '28', '22', '144');
INSERT INTO `ssc_a` VALUES ('170', '170', '-1', '7', '1', '22', '6', '16', '2', '5', '13', '14', '2', '-1', '5', '-1', '1', '-1', '-1', '5', '1', '2', '25', '-1', '25', '4', '-1', '5', '1', '8', '2', '29', '23', '145');
INSERT INTO `ssc_a` VALUES ('171', '171', '1', '-1', '2', '23', '7', '17', '3', '6', '14', '15', '3', '-1', '-1', '1', '-1', '1', '1', '-1', '2', '-1', '26', '1', '26', '-1', '1', '6', '2', '9', '3', '30', '24', '146');
INSERT INTO `ssc_a` VALUES ('172', '172', '2', '1', '3', '-1', '8', '18', '4', '7', '15', '16', '4', '-1', '-1', '2', '-1', '2', '-1', '1', '3', '-1', '27', '2', '27', '1', '-1', '7', '3', '10', '4', '31', '25', '147');
INSERT INTO `ssc_a` VALUES ('173', '173', '3', '2', '4', '1', '9', '19', '-1', '8', '16', '17', '-1', '1', '1', '-1', '1', '-1', '-1', '2', '4', '-1', '28', '3', '28', '2', '1', '-1', '4', '11', '5', '32', '26', '148');
INSERT INTO `ssc_a` VALUES ('174', '174', '4', '3', '5', '2', '10', '20', '1', '-1', '17', '18', '-1', '2', '-1', '1', '-1', '1', '1', '-1', '5', '-1', '29', '4', '29', '-1', '2', '1', '5', '12', '6', '33', '27', '149');
INSERT INTO `ssc_a` VALUES ('175', '175', '5', '4', '6', '3', '11', '-1', '2', '1', '18', '19', '-1', '3', '-1', '2', '-1', '2', '2', '1', '-1', '1', '30', '-1', '30', '1', '-1', '2', '6', '13', '7', '34', '28', '150');
INSERT INTO `ssc_a` VALUES ('176', '176', '6', '5', '7', '-1', '12', '1', '3', '2', '19', '20', '1', '-1', '-1', '3', '-1', '3', '-1', '2', '1', '2', '31', '-1', '31', '2', '-1', '3', '7', '14', '8', '35', '29', '151');
INSERT INTO `ssc_a` VALUES ('177', '177', '7', '6', '-1', '1', '13', '2', '4', '3', '20', '21', '2', '-1', '1', '-1', '-1', '4', '1', '3', '-1', '3', '32', '-1', '32', '-1', '1', '4', '8', '15', '9', '36', '30', '152');
INSERT INTO `ssc_a` VALUES ('178', '178', '8', '7', '1', '2', '14', '-1', '5', '4', '21', '22', '-1', '1', '-1', '1', '-1', '5', '2', '4', '-1', '-1', '33', '1', '33', '1', '2', '-1', '9', '16', '10', '37', '31', '153');
INSERT INTO `ssc_a` VALUES ('179', '178', '-1', '8', '2', '3', '15', '1', '6', '5', '22', '23', '1', '-1', '1', '-1', '1', '-1', '-1', '5', '1', '1', '34', '-1', '34', '2', '-1', '1', '10', '17', '11', '38', '32', '154');
INSERT INTO `ssc_a` VALUES ('180', '179', '-1', '9', '3', '4', '16', '2', '7', '6', '23', '24', '2', '-1', '2', '-1', '2', '-1', '-1', '6', '2', '2', '-1', '1', '-1', '3', '1', '2', '11', '18', '12', '39', '33', '155');
INSERT INTO `ssc_a` VALUES ('181', '180', '-1', '10', '4', '5', '17', '3', '8', '7', '24', '25', '3', '-1', '3', '-1', '3', '-1', '-1', '7', '3', '3', '-1', '2', '-1', '4', '2', '3', '12', '19', '13', '40', '34', '156');
INSERT INTO `ssc_a` VALUES ('182', '181', '1', '11', '-1', '6', '18', '4', '9', '8', '25', '26', '4', '-1', '4', '-1', '-1', '1', '1', '8', '-1', '-1', '1', '3', '1', '5', '-1', '4', '13', '20', '14', '41', '35', '157');
INSERT INTO `ssc_a` VALUES ('183', '182', '2', '12', '1', '7', '-1', '5', '10', '9', '26', '27', '5', '-1', '5', '-1', '1', '-1', '2', '-1', '1', '-1', '2', '4', '2', '6', '-1', '5', '14', '21', '15', '42', '36', '158');
INSERT INTO `ssc_a` VALUES ('184', '183', '3', '-1', '2', '8', '1', '6', '11', '10', '27', '28', '6', '-1', '-1', '1', '-1', '1', '3', '-1', '2', '1', '3', '-1', '3', '7', '1', '-1', '15', '22', '16', '43', '37', '159');
INSERT INTO `ssc_a` VALUES ('185', '184', '4', '1', '3', '9', '2', '7', '-1', '11', '28', '29', '-1', '1', '1', '-1', '1', '-1', '-1', '1', '3', '-1', '4', '1', '4', '8', '2', '1', '16', '-1', '17', '44', '38', '160');
INSERT INTO `ssc_a` VALUES ('186', '185', '5', '2', '4', '10', '3', '8', '1', '12', '29', '-1', '-1', '2', '-1', '1', '2', '-1', '-1', '2', '4', '-1', '5', '2', '5', '9', '3', '-1', '17', '1', '18', '45', '39', '161');
INSERT INTO `ssc_a` VALUES ('187', '186', '6', '3', '5', '11', '4', '9', '-1', '13', '30', '1', '-1', '3', '1', '-1', '3', '-1', '-1', '3', '5', '1', '6', '-1', '6', '10', '4', '-1', '18', '2', '19', '46', '40', '162');
INSERT INTO `ssc_a` VALUES ('188', '187', '7', '4', '6', '12', '5', '10', '1', '-1', '31', '2', '-1', '4', '-1', '1', '-1', '1', '1', '-1', '6', '-1', '7', '1', '7', '-1', '5', '1', '19', '3', '20', '47', '41', '163');
INSERT INTO `ssc_a` VALUES ('189', '188', '8', '5', '-1', '13', '6', '11', '2', '1', '32', '3', '1', '-1', '1', '-1', '-1', '2', '2', '1', '-1', '1', '8', '-1', '8', '1', '6', '2', '20', '-1', '21', '48', '42', '164');
INSERT INTO `ssc_a` VALUES ('190', '189', '9', '6', '1', '14', '7', '12', '3', '2', '33', '-1', '-1', '1', '-1', '1', '1', '-1', '-1', '2', '1', '-1', '9', '1', '9', '2', '7', '3', '21', '1', '22', '-1', '43', '165');
INSERT INTO `ssc_a` VALUES ('191', '190', '10', '7', '2', '15', '-1', '13', '4', '3', '34', '1', '1', '-1', '1', '-1', '2', '-1', '1', '-1', '2', '1', '10', '-1', '10', '3', '8', '4', '22', '-1', '23', '1', '44', '166');
INSERT INTO `ssc_a` VALUES ('192', '191', '11', '8', '3', '16', '-1', '14', '5', '4', '35', '2', '2', '-1', '2', '-1', '3', '-1', '2', '-1', '3', '2', '-1', '1', '-1', '4', '9', '5', '23', '1', '24', '2', '45', '167');
INSERT INTO `ssc_a` VALUES ('193', '192', '12', '9', '4', '17', '1', '-1', '6', '5', '36', '3', '-1', '1', '-1', '1', '-1', '1', '3', '1', '-1', '-1', '1', '2', '1', '-1', '10', '6', '24', '2', '25', '3', '46', '168');
INSERT INTO `ssc_a` VALUES ('194', '193', '13', '10', '5', '-1', '2', '1', '7', '6', '37', '4', '1', '-1', '-1', '2', '-1', '2', '-1', '2', '1', '1', '2', '-1', '2', '1', '-1', '7', '25', '3', '26', '4', '47', '169');
INSERT INTO `ssc_a` VALUES ('195', '194', '14', '11', '6', '-1', '3', '2', '8', '7', '38', '5', '2', '-1', '-1', '3', '-1', '3', '-1', '3', '2', '2', '-1', '1', '-1', '2', '1', '8', '26', '4', '27', '5', '48', '170');
INSERT INTO `ssc_a` VALUES ('196', '195', '15', '12', '-1', '1', '4', '3', '9', '8', '39', '6', '3', '-1', '1', '-1', '-1', '4', '1', '4', '-1', '3', '1', '-1', '1', '-1', '2', '9', '27', '5', '28', '6', '49', '171');
INSERT INTO `ssc_a` VALUES ('197', '196', '16', '13', '1', '2', '5', '-1', '10', '9', '40', '7', '-1', '1', '-1', '1', '-1', '5', '2', '5', '-1', '-1', '2', '1', '2', '1', '3', '-1', '28', '6', '29', '7', '50', '172');
INSERT INTO `ssc_a` VALUES ('198', '197', '17', '14', '2', '-1', '6', '1', '11', '10', '41', '8', '1', '-1', '-1', '2', '-1', '6', '-1', '6', '1', '1', '3', '-1', '3', '2', '-1', '1', '29', '7', '30', '8', '51', '173');
INSERT INTO `ssc_a` VALUES ('199', '198', '18', '-1', '3', '1', '7', '2', '12', '11', '42', '9', '2', '-1', '-1', '3', '-1', '7', '1', '-1', '2', '2', '4', '-1', '4', '3', '-1', '2', '30', '8', '31', '9', '52', '174');
INSERT INTO `ssc_a` VALUES ('200', '199', '19', '1', '4', '-1', '8', '3', '13', '12', '43', '10', '3', '-1', '-1', '4', '-1', '8', '-1', '1', '3', '-1', '5', '1', '5', '4', '-1', '3', '31', '9', '32', '10', '53', '175');
INSERT INTO `ssc_a` VALUES ('201', '200', '20', '2', '5', '1', '9', '4', '14', '13', '-1', '11', '-1', '1', '1', '-1', '1', '-1', '1', '2', '-1', '-1', '6', '2', '6', '5', '1', '4', '32', '-1', '33', '11', '54', '176');
INSERT INTO `ssc_a` VALUES ('202', '201', '21', '3', '6', '2', '10', '-1', '15', '14', '1', '12', '-1', '2', '-1', '1', '-1', '1', '2', '3', '-1', '1', '7', '-1', '7', '6', '2', '-1', '33', '1', '34', '12', '55', '177');
INSERT INTO `ssc_a` VALUES ('203', '202', '22', '4', '7', '3', '11', '-1', '16', '15', '2', '13', '-1', '3', '-1', '2', '-1', '2', '3', '4', '-1', '2', '-1', '1', '-1', '7', '3', '1', '34', '2', '35', '13', '56', '178');
INSERT INTO `ssc_a` VALUES ('204', '203', '23', '5', '8', '-1', '12', '1', '17', '16', '3', '14', '1', '-1', '-1', '3', '-1', '3', '-1', '5', '1', '3', '1', '-1', '1', '8', '-1', '2', '35', '3', '36', '14', '57', '179');
INSERT INTO `ssc_a` VALUES ('205', '204', '24', '6', '9', '1', '13', '2', '-1', '17', '4', '15', '-1', '1', '1', '-1', '1', '-1', '-1', '6', '2', '-1', '2', '1', '2', '9', '1', '-1', '36', '4', '37', '15', '58', '180');
INSERT INTO `ssc_a` VALUES ('206', '205', '25', '7', '10', '2', '14', '3', '-1', '18', '5', '16', '-1', '2', '2', '-1', '2', '-1', '-1', '7', '3', '1', '-1', '2', '-1', '10', '2', '1', '37', '5', '38', '16', '59', '181');
INSERT INTO `ssc_a` VALUES ('207', '206', '26', '8', '11', '-1', '15', '4', '1', '19', '6', '17', '1', '-1', '-1', '1', '-1', '1', '-1', '8', '4', '2', '1', '-1', '1', '11', '3', '-1', '38', '6', '39', '17', '60', '182');
INSERT INTO `ssc_a` VALUES ('208', '207', '27', '9', '12', '1', '16', '5', '2', '20', '-1', '18', '-1', '1', '1', '-1', '1', '-1', '1', '9', '-1', '-1', '2', '1', '2', '12', '4', '1', '39', '-1', '40', '18', '61', '183');
INSERT INTO `ssc_a` VALUES ('209', '208', '-1', '10', '13', '2', '17', '6', '3', '21', '1', '19', '1', '-1', '2', '-1', '2', '-1', '-1', '10', '1', '1', '3', '-1', '3', '13', '5', '2', '40', '1', '41', '19', '-1', '184');
INSERT INTO `ssc_a` VALUES ('210', '209', '1', '11', '14', '3', '18', '7', '4', '-1', '2', '20', '-1', '1', '-1', '1', '-1', '1', '1', '-1', '2', '-1', '4', '1', '4', '14', '6', '3', '41', '2', '42', '-1', '1', '185');
INSERT INTO `ssc_a` VALUES ('211', '210', '-1', '12', '15', '4', '19', '8', '5', '1', '3', '21', '1', '-1', '1', '-1', '1', '-1', '-1', '1', '3', '1', '5', '-1', '5', '15', '7', '4', '42', '3', '43', '-1', '2', '186');
INSERT INTO `ssc_a` VALUES ('212', '211', '1', '13', '-1', '5', '20', '9', '6', '2', '4', '22', '2', '-1', '2', '-1', '-1', '1', '1', '2', '-1', '-1', '6', '1', '6', '16', '-1', '5', '43', '4', '44', '1', '3', '187');
INSERT INTO `ssc_a` VALUES ('213', '212', '2', '14', '1', '6', '21', '10', '-1', '3', '5', '23', '-1', '1', '3', '-1', '1', '-1', '-1', '3', '1', '-1', '7', '2', '7', '17', '1', '6', '-1', '5', '45', '2', '4', '188');
INSERT INTO `ssc_a` VALUES ('214', '213', '3', '15', '2', '7', '22', '11', '1', '4', '6', '-1', '-1', '2', '-1', '1', '2', '-1', '-1', '4', '2', '-1', '8', '3', '8', '18', '2', '-1', '1', '6', '46', '3', '5', '189');
INSERT INTO `ssc_a` VALUES ('215', '214', '4', '16', '3', '8', '-1', '12', '2', '5', '7', '1', '1', '-1', '1', '-1', '3', '-1', '1', '-1', '3', '1', '9', '-1', '9', '19', '3', '1', '2', '-1', '47', '4', '6', '190');
INSERT INTO `ssc_a` VALUES ('216', '215', '5', '17', '4', '9', '1', '13', '-1', '6', '8', '2', '-1', '1', '2', '-1', '4', '-1', '-1', '1', '4', '-1', '10', '1', '10', '20', '-1', '2', '3', '1', '48', '5', '7', '191');
INSERT INTO `ssc_a` VALUES ('217', '216', '-1', '18', '5', '10', '2', '14', '1', '7', '9', '3', '1', '-1', '3', '-1', '5', '-1', '-1', '2', '5', '1', '11', '-1', '11', '21', '1', '3', '4', '2', '-1', '6', '8', '192');
INSERT INTO `ssc_a` VALUES ('218', '217', '1', '19', '6', '11', '3', '-1', '2', '8', '10', '4', '-1', '1', '-1', '1', '-1', '1', '1', '3', '-1', '-1', '12', '1', '12', '22', '2', '4', '5', '-1', '1', '7', '9', '193');
INSERT INTO `ssc_a` VALUES ('219', '218', '2', '20', '7', '12', '4', '1', '3', '9', '-1', '5', '-1', '2', '1', '-1', '1', '-1', '2', '4', '-1', '-1', '13', '2', '13', '23', '3', '-1', '6', '1', '2', '8', '10', '194');
INSERT INTO `ssc_a` VALUES ('220', '219', '3', '21', '8', '13', '5', '2', '4', '-1', '1', '6', '-1', '3', '-1', '1', '-1', '1', '3', '-1', '1', '1', '14', '-1', '14', '-1', '4', '1', '7', '2', '3', '9', '11', '195');
INSERT INTO `ssc_a` VALUES ('221', '220', '-1', '22', '9', '14', '6', '3', '5', '1', '2', '7', '1', '-1', '1', '-1', '1', '-1', '-1', '1', '2', '2', '15', '-1', '15', '1', '5', '2', '8', '3', '4', '-1', '12', '196');
INSERT INTO `ssc_a` VALUES ('222', '221', '1', '23', '10', '15', '7', '-1', '6', '2', '3', '8', '-1', '1', '-1', '1', '-1', '1', '1', '2', '-1', '-1', '16', '1', '16', '2', '6', '3', '9', '-1', '5', '1', '13', '197');
INSERT INTO `ssc_a` VALUES ('223', '222', '2', '24', '11', '16', '8', '-1', '7', '3', '4', '9', '-1', '2', '-1', '2', '-1', '2', '2', '3', '-1', '1', '-1', '2', '-1', '3', '7', '4', '10', '1', '6', '2', '14', '198');
INSERT INTO `ssc_a` VALUES ('224', '223', '3', '25', '12', '17', '9', '-1', '8', '4', '5', '10', '-1', '3', '-1', '3', '-1', '3', '3', '4', '-1', '2', '-1', '3', '-1', '4', '8', '5', '11', '2', '7', '3', '15', '199');
INSERT INTO `ssc_a` VALUES ('225', '224', '4', '26', '-1', '18', '10', '1', '9', '5', '6', '11', '1', '-1', '1', '-1', '-1', '4', '4', '5', '-1', '3', '1', '-1', '1', '5', '9', '-1', '12', '3', '8', '4', '16', '200');
INSERT INTO `ssc_a` VALUES ('226', '225', '5', '27', '1', '19', '11', '-1', '10', '6', '7', '12', '-1', '1', '-1', '1', '-1', '5', '5', '6', '-1', '-1', '2', '1', '2', '6', '10', '-1', '13', '4', '9', '5', '17', '201');
INSERT INTO `ssc_a` VALUES ('227', '226', '6', '28', '2', '-1', '12', '1', '11', '7', '8', '13', '1', '-1', '-1', '2', '-1', '6', '-1', '7', '1', '1', '3', '-1', '3', '7', '-1', '1', '14', '5', '10', '6', '18', '202');
INSERT INTO `ssc_a` VALUES ('228', '227', '7', '29', '3', '1', '13', '2', '12', '8', '-1', '14', '-1', '1', '1', '-1', '1', '-1', '1', '8', '-1', '-1', '4', '1', '4', '8', '1', '2', '15', '-1', '11', '7', '19', '203');
INSERT INTO `ssc_a` VALUES ('229', '228', '8', '30', '4', '2', '14', '3', '-1', '9', '1', '15', '-1', '2', '2', '-1', '2', '-1', '-1', '9', '1', '1', '5', '-1', '5', '9', '-1', '3', '16', '1', '12', '8', '20', '204');
INSERT INTO `ssc_a` VALUES ('230', '229', '-1', '31', '5', '3', '15', '4', '1', '10', '2', '16', '1', '-1', '3', '-1', '3', '-1', '-1', '10', '2', '2', '6', '-1', '6', '10', '1', '4', '17', '2', '-1', '9', '21', '205');
INSERT INTO `ssc_a` VALUES ('231', '230', '1', '32', '-1', '4', '16', '5', '2', '11', '3', '17', '2', '-1', '4', '-1', '-1', '1', '1', '11', '-1', '-1', '7', '1', '7', '11', '-1', '5', '18', '3', '1', '10', '22', '206');
INSERT INTO `ssc_a` VALUES ('232', '231', '2', '33', '1', '5', '17', '6', '-1', '12', '4', '18', '-1', '1', '5', '-1', '1', '-1', '-1', '12', '1', '-1', '8', '2', '8', '12', '1', '6', '-1', '4', '2', '11', '23', '207');
INSERT INTO `ssc_a` VALUES ('233', '232', '3', '34', '2', '6', '-1', '7', '1', '13', '5', '19', '1', '-1', '6', '-1', '2', '-1', '1', '-1', '2', '1', '9', '-1', '9', '13', '-1', '7', '1', '5', '3', '12', '24', '208');
INSERT INTO `ssc_a` VALUES ('234', '233', '4', '35', '3', '7', '1', '-1', '2', '14', '6', '20', '-1', '1', '-1', '1', '-1', '1', '2', '1', '-1', '-1', '10', '1', '10', '-1', '1', '8', '2', '6', '4', '13', '25', '209');
INSERT INTO `ssc_a` VALUES ('235', '234', '5', '36', '4', '8', '2', '1', '3', '-1', '7', '21', '-1', '2', '-1', '2', '-1', '2', '3', '-1', '1', '-1', '11', '2', '11', '1', '-1', '9', '3', '7', '5', '14', '26', '210');
INSERT INTO `ssc_a` VALUES ('236', '235', '6', '37', '5', '9', '3', '-1', '4', '1', '8', '22', '-1', '3', '-1', '3', '-1', '3', '4', '1', '-1', '1', '12', '-1', '12', '2', '-1', '10', '4', '8', '6', '15', '27', '211');
INSERT INTO `ssc_a` VALUES ('237', '236', '7', '38', '6', '10', '4', '-1', '5', '2', '9', '23', '-1', '4', '-1', '4', '-1', '4', '5', '2', '-1', '2', '-1', '1', '-1', '3', '1', '11', '5', '9', '7', '16', '28', '212');
INSERT INTO `ssc_a` VALUES ('238', '237', '8', '39', '7', '11', '5', '1', '-1', '3', '10', '24', '-1', '5', '1', '-1', '1', '-1', '-1', '3', '1', '-1', '1', '2', '1', '-1', '2', '12', '6', '10', '8', '17', '29', '213');
INSERT INTO `ssc_a` VALUES ('239', '238', '9', '40', '8', '12', '6', '2', '1', '4', '-1', '25', '-1', '6', '2', '-1', '2', '-1', '1', '4', '-1', '-1', '2', '3', '2', '1', '-1', '13', '7', '11', '9', '18', '30', '214');
INSERT INTO `ssc_a` VALUES ('240', '239', '10', '41', '9', '-1', '7', '3', '2', '5', '1', '26', '1', '-1', '-1', '1', '-1', '1', '-1', '5', '1', '1', '3', '-1', '3', '2', '1', '14', '8', '-1', '10', '19', '31', '215');
INSERT INTO `ssc_a` VALUES ('241', '240', '11', '-1', '10', '1', '8', '4', '3', '6', '2', '27', '2', '-1', '-1', '2', '-1', '2', '1', '-1', '2', '2', '4', '-1', '4', '3', '-1', '15', '9', '1', '11', '20', '32', '216');
INSERT INTO `ssc_a` VALUES ('242', '241', '12', '1', '11', '2', '9', '5', '-1', '7', '3', '28', '-1', '1', '1', '-1', '1', '-1', '-1', '1', '3', '-1', '5', '1', '5', '4', '1', '16', '10', '-1', '12', '21', '33', '217');
INSERT INTO `ssc_a` VALUES ('243', '242', '13', '2', '12', '3', '10', '6', '-1', '8', '4', '29', '-1', '2', '2', '-1', '2', '-1', '-1', '2', '4', '1', '-1', '2', '-1', '5', '2', '17', '11', '1', '13', '22', '34', '218');
INSERT INTO `ssc_a` VALUES ('244', '243', '14', '3', '13', '4', '11', '7', '1', '-1', '5', '30', '-1', '3', '-1', '1', '-1', '1', '1', '-1', '5', '-1', '1', '3', '1', '-1', '3', '18', '12', '2', '14', '23', '35', '219');
INSERT INTO `ssc_a` VALUES ('245', '244', '15', '-1', '14', '5', '12', '8', '2', '1', '6', '31', '1', '-1', '-1', '2', '-1', '2', '2', '-1', '6', '1', '2', '-1', '2', '1', '4', '19', '13', '3', '-1', '24', '36', '220');
INSERT INTO `ssc_a` VALUES ('246', '245', '16', '1', '15', '-1', '13', '9', '3', '2', '7', '32', '2', '-1', '-1', '3', '-1', '3', '-1', '1', '7', '-1', '3', '1', '3', '2', '-1', '20', '14', '4', '1', '25', '37', '221');
INSERT INTO `ssc_a` VALUES ('247', '246', '17', '2', '16', '1', '14', '10', '4', '3', '8', '-1', '-1', '1', '-1', '4', '1', '-1', '-1', '2', '8', '-1', '4', '2', '4', '3', '1', '21', '15', '5', '-1', '26', '38', '222');
INSERT INTO `ssc_a` VALUES ('248', '247', '18', '3', '-1', '2', '15', '11', '5', '4', '9', '1', '1', '-1', '1', '-1', '-1', '1', '1', '3', '-1', '1', '5', '-1', '5', '4', '2', '22', '16', '6', '1', '-1', '39', '223');
INSERT INTO `ssc_a` VALUES ('249', '248', '19', '4', '1', '3', '16', '12', '6', '5', '-1', '2', '-1', '1', '2', '-1', '1', '-1', '2', '4', '-1', '-1', '6', '1', '6', '5', '3', '23', '17', '7', '-1', '1', '40', '224');
INSERT INTO `ssc_a` VALUES ('250', '249', '20', '5', '2', '-1', '17', '13', '7', '6', '1', '3', '1', '-1', '-1', '1', '-1', '1', '-1', '5', '1', '1', '7', '-1', '7', '6', '4', '24', '18', '-1', '1', '2', '41', '225');
INSERT INTO `ssc_a` VALUES ('251', '250', '21', '6', '3', '1', '18', '14', '8', '-1', '2', '4', '-1', '1', '-1', '2', '-1', '2', '1', '-1', '2', '-1', '8', '1', '8', '7', '5', '25', '-1', '1', '2', '3', '42', '226');
INSERT INTO `ssc_a` VALUES ('252', '251', '22', '7', '4', '2', '19', '15', '9', '1', '3', '-1', '-1', '2', '-1', '3', '1', '-1', '-1', '1', '3', '-1', '9', '2', '9', '8', '-1', '26', '1', '2', '3', '4', '43', '227');
INSERT INTO `ssc_a` VALUES ('253', '252', '23', '8', '5', '3', '20', '16', '10', '-1', '4', '1', '-1', '3', '-1', '4', '-1', '1', '1', '-1', '4', '1', '10', '-1', '10', '9', '-1', '27', '2', '3', '4', '5', '44', '228');
INSERT INTO `ssc_a` VALUES ('254', '253', '24', '9', '6', '4', '21', '17', '11', '-1', '5', '2', '-1', '4', '-1', '5', '-1', '2', '2', '-1', '5', '2', '-1', '1', '-1', '10', '1', '28', '3', '4', '5', '6', '45', '229');
INSERT INTO `ssc_a` VALUES ('255', '254', '25', '10', '7', '5', '22', '-1', '12', '1', '6', '3', '-1', '5', '-1', '6', '-1', '3', '3', '1', '-1', '3', '1', '-1', '1', '11', '-1', '29', '4', '5', '6', '7', '46', '230');
INSERT INTO `ssc_a` VALUES ('256', '255', '26', '11', '8', '-1', '23', '1', '13', '2', '7', '4', '1', '-1', '-1', '7', '-1', '4', '-1', '2', '1', '4', '2', '-1', '2', '12', '-1', '30', '5', '6', '7', '8', '47', '231');
INSERT INTO `ssc_a` VALUES ('257', '256', '27', '12', '9', '1', '24', '2', '14', '3', '8', '-1', '-1', '1', '-1', '8', '1', '-1', '-1', '3', '2', '-1', '3', '1', '3', '13', '1', '31', '6', '7', '-1', '9', '48', '232');
INSERT INTO `ssc_a` VALUES ('258', '257', '-1', '13', '10', '2', '25', '3', '15', '4', '9', '1', '1', '-1', '1', '-1', '2', '-1', '-1', '4', '3', '1', '4', '-1', '4', '14', '2', '32', '7', '8', '1', '10', '49', '-1');
INSERT INTO `ssc_a` VALUES ('259', '258', '1', '14', '11', '3', '26', '4', '16', '5', '-1', '2', '-1', '1', '2', '-1', '3', '-1', '1', '5', '-1', '-1', '5', '1', '5', '15', '3', '33', '8', '9', '2', '11', '-1', '1');
INSERT INTO `ssc_a` VALUES ('260', '259', '2', '15', '12', '4', '27', '5', '17', '-1', '1', '3', '-1', '2', '-1', '1', '-1', '1', '2', '-1', '1', '1', '6', '-1', '6', '-1', '4', '34', '9', '10', '3', '12', '1', '2');
INSERT INTO `ssc_a` VALUES ('261', '260', '3', '16', '13', '-1', '28', '6', '18', '1', '2', '4', '1', '-1', '-1', '2', '-1', '2', '-1', '1', '2', '2', '7', '-1', '7', '1', '5', '35', '-1', '11', '4', '13', '2', '3');
INSERT INTO `ssc_a` VALUES ('262', '261', '-1', '17', '14', '1', '29', '7', '19', '2', '3', '5', '2', '-1', '1', '-1', '1', '-1', '-1', '2', '3', '3', '8', '-1', '8', '2', '6', '-1', '1', '12', '5', '14', '3', '4');
INSERT INTO `ssc_a` VALUES ('263', '262', '1', '18', '-1', '2', '30', '8', '20', '3', '4', '6', '3', '-1', '2', '-1', '-1', '1', '1', '3', '-1', '-1', '9', '1', '9', '3', '-1', '1', '2', '13', '6', '15', '4', '5');
INSERT INTO `ssc_a` VALUES ('264', '263', '2', '-1', '1', '3', '31', '9', '21', '4', '5', '7', '4', '-1', '-1', '1', '-1', '2', '2', '-1', '1', '1', '10', '-1', '10', '-1', '1', '2', '3', '14', '7', '16', '5', '6');
INSERT INTO `ssc_a` VALUES ('265', '264', '3', '1', '2', '-1', '32', '10', '22', '5', '6', '8', '5', '-1', '-1', '2', '-1', '3', '-1', '1', '2', '-1', '11', '1', '11', '1', '-1', '3', '4', '15', '8', '17', '6', '7');
INSERT INTO `ssc_a` VALUES ('266', '265', '4', '2', '3', '1', '33', '-1', '23', '6', '7', '9', '-1', '1', '-1', '3', '-1', '4', '1', '2', '-1', '-1', '12', '2', '12', '2', '-1', '4', '5', '16', '9', '18', '7', '8');
INSERT INTO `ssc_a` VALUES ('267', '266', '5', '3', '4', '-1', '34', '1', '24', '7', '8', '10', '1', '-1', '-1', '4', '-1', '5', '-1', '3', '1', '1', '13', '-1', '13', '3', '-1', '5', '6', '17', '10', '19', '8', '9');
INSERT INTO `ssc_a` VALUES ('268', '267', '-1', '4', '5', '1', '35', '2', '25', '8', '9', '11', '2', '-1', '1', '-1', '1', '-1', '-1', '4', '2', '2', '14', '-1', '14', '4', '1', '-1', '7', '18', '11', '20', '9', '10');
INSERT INTO `ssc_a` VALUES ('269', '268', '1', '5', '6', '2', '36', '3', '26', '9', '10', '-1', '-1', '1', '-1', '1', '2', '-1', '-1', '5', '3', '-1', '15', '1', '15', '5', '2', '1', '8', '19', '12', '21', '10', '-1');
INSERT INTO `ssc_a` VALUES ('270', '269', '2', '6', '7', '3', '37', '-1', '27', '10', '11', '1', '-1', '2', '-1', '2', '-1', '1', '1', '6', '-1', '1', '16', '-1', '16', '6', '3', '2', '-1', '20', '13', '22', '11', '1');
INSERT INTO `ssc_a` VALUES ('271', '270', '3', '7', '8', '4', '38', '1', '28', '11', '12', '-1', '-1', '3', '-1', '3', '1', '-1', '-1', '7', '1', '-1', '17', '1', '17', '7', '4', '3', '-1', '21', '14', '23', '12', '2');
INSERT INTO `ssc_a` VALUES ('272', '271', '4', '8', '9', '-1', '39', '2', '29', '12', '13', '1', '1', '-1', '-1', '4', '-1', '1', '-1', '8', '2', '1', '18', '-1', '18', '8', '5', '4', '1', '22', '-1', '24', '13', '3');
INSERT INTO `ssc_a` VALUES ('273', '272', '5', '9', '10', '1', '-1', '3', '30', '13', '14', '2', '2', '-1', '1', '-1', '1', '-1', '1', '-1', '3', '-1', '19', '1', '19', '-1', '6', '5', '2', '23', '1', '25', '14', '4');
INSERT INTO `ssc_a` VALUES ('274', '273', '-1', '10', '11', '2', '1', '4', '31', '14', '15', '3', '3', '-1', '2', '-1', '2', '-1', '-1', '1', '4', '1', '20', '-1', '20', '1', '7', '6', '-1', '24', '2', '26', '15', '5');
INSERT INTO `ssc_a` VALUES ('275', '274', '1', '11', '12', '3', '2', '5', '-1', '15', '16', '4', '-1', '1', '3', '-1', '3', '-1', '-1', '2', '5', '-1', '21', '1', '21', '2', '8', '7', '1', '25', '-1', '27', '16', '6');
INSERT INTO `ssc_a` VALUES ('276', '275', '2', '-1', '13', '4', '3', '6', '1', '16', '17', '5', '1', '-1', '-1', '1', '-1', '1', '1', '-1', '6', '1', '22', '-1', '22', '3', '9', '8', '2', '-1', '1', '28', '17', '7');
INSERT INTO `ssc_a` VALUES ('277', '276', '3', '1', '14', '5', '4', '7', '2', '17', '-1', '6', '-1', '1', '1', '-1', '1', '-1', '2', '1', '-1', '-1', '23', '1', '23', '4', '10', '9', '3', '1', '2', '-1', '18', '8');
INSERT INTO `ssc_a` VALUES ('278', '277', '4', '2', '15', '6', '5', '8', '3', '18', '-1', '7', '-1', '2', '2', '-1', '2', '-1', '3', '2', '-1', '1', '-1', '2', '-1', '5', '11', '10', '4', '2', '3', '1', '19', '9');
INSERT INTO `ssc_a` VALUES ('279', '278', '5', '3', '16', '-1', '6', '9', '4', '19', '1', '8', '1', '-1', '-1', '1', '-1', '1', '-1', '3', '1', '2', '1', '-1', '1', '6', '12', '11', '5', '-1', '4', '2', '20', '10');
INSERT INTO `ssc_a` VALUES ('280', '279', '6', '4', '17', '-1', '7', '10', '5', '20', '2', '9', '2', '-1', '-1', '2', '-1', '2', '-1', '4', '2', '3', '-1', '1', '-1', '7', '13', '12', '6', '1', '5', '3', '21', '11');
INSERT INTO `ssc_a` VALUES ('281', '280', '7', '5', '18', '1', '8', '11', '-1', '21', '3', '10', '-1', '1', '1', '-1', '1', '-1', '-1', '5', '3', '-1', '1', '2', '1', '8', '14', '-1', '7', '2', '6', '4', '22', '12');
INSERT INTO `ssc_a` VALUES ('282', '281', '8', '6', '19', '-1', '9', '12', '1', '22', '4', '11', '1', '-1', '-1', '1', '-1', '1', '-1', '6', '4', '1', '2', '-1', '2', '9', '15', '-1', '8', '3', '7', '5', '23', '13');
INSERT INTO `ssc_a` VALUES ('283', '282', '9', '-1', '20', '1', '10', '13', '2', '23', '5', '12', '2', '-1', '-1', '2', '-1', '2', '1', '-1', '5', '2', '3', '-1', '3', '10', '-1', '1', '9', '4', '8', '6', '24', '14');
INSERT INTO `ssc_a` VALUES ('284', '283', '10', '1', '21', '-1', '11', '14', '3', '24', '6', '13', '3', '-1', '-1', '3', '-1', '3', '-1', '1', '6', '-1', '4', '1', '4', '11', '-1', '2', '10', '5', '9', '7', '25', '15');
INSERT INTO `ssc_a` VALUES ('285', '284', '11', '2', '22', '1', '12', '15', '4', '25', '7', '-1', '-1', '1', '-1', '4', '1', '-1', '-1', '2', '7', '-1', '5', '2', '5', '12', '1', '3', '11', '6', '-1', '8', '26', '16');
INSERT INTO `ssc_a` VALUES ('286', '285', '12', '3', '23', '2', '13', '-1', '5', '26', '8', '1', '-1', '2', '-1', '5', '-1', '1', '1', '3', '-1', '1', '6', '-1', '6', '13', '2', '4', '-1', '7', '1', '9', '27', '17');
INSERT INTO `ssc_a` VALUES ('287', '286', '13', '4', '24', '3', '14', '1', '6', '27', '-1', '2', '-1', '3', '1', '-1', '1', '-1', '2', '4', '-1', '-1', '7', '1', '7', '14', '3', '-1', '1', '8', '2', '10', '28', '18');
INSERT INTO `ssc_a` VALUES ('288', '287', '-1', '5', '25', '4', '15', '2', '7', '28', '1', '3', '1', '-1', '2', '-1', '2', '-1', '-1', '5', '1', '1', '8', '-1', '8', '15', '4', '1', '2', '9', '3', '11', '-1', '19');
INSERT INTO `ssc_a` VALUES ('289', '288', '1', '6', '26', '5', '16', '-1', '8', '29', '2', '4', '-1', '1', '-1', '1', '-1', '1', '1', '6', '-1', '-1', '9', '1', '9', '16', '5', '2', '3', '-1', '4', '12', '1', '20');
INSERT INTO `ssc_a` VALUES ('290', '289', '2', '7', '27', '6', '17', '1', '-1', '30', '3', '5', '-1', '2', '1', '-1', '1', '-1', '-1', '7', '1', '-1', '10', '2', '10', '-1', '6', '3', '4', '1', '5', '13', '2', '21');
INSERT INTO `ssc_a` VALUES ('291', '290', '3', '8', '28', '7', '18', '2', '1', '31', '-1', '6', '-1', '3', '2', '-1', '2', '-1', '1', '8', '-1', '-1', '11', '3', '11', '1', '-1', '4', '5', '2', '6', '14', '3', '22');
INSERT INTO `ssc_a` VALUES ('292', '291', '4', '9', '29', '8', '19', '3', '2', '32', '-1', '7', '-1', '4', '3', '-1', '3', '-1', '2', '9', '-1', '1', '-1', '4', '-1', '2', '1', '5', '6', '3', '7', '15', '4', '23');
INSERT INTO `ssc_a` VALUES ('293', '292', '5', '10', '30', '9', '20', '-1', '3', '33', '1', '8', '-1', '5', '-1', '1', '-1', '1', '3', '10', '-1', '2', '1', '-1', '1', '3', '2', '-1', '7', '4', '8', '16', '5', '24');
INSERT INTO `ssc_a` VALUES ('294', '293', '6', '-1', '31', '10', '21', '1', '4', '34', '2', '9', '1', '-1', '-1', '2', '-1', '2', '4', '-1', '1', '3', '2', '-1', '2', '4', '3', '1', '-1', '5', '9', '17', '6', '25');
INSERT INTO `ssc_a` VALUES ('295', '294', '7', '1', '32', '11', '22', '2', '5', '-1', '3', '10', '-1', '1', '-1', '3', '-1', '3', '5', '-1', '2', '-1', '3', '1', '3', '5', '4', '2', '1', '6', '-1', '18', '7', '26');
INSERT INTO `ssc_a` VALUES ('296', '295', '8', '2', '33', '12', '23', '3', '-1', '1', '4', '11', '-1', '2', '1', '-1', '1', '-1', '-1', '1', '3', '1', '4', '-1', '4', '-1', '5', '3', '2', '7', '1', '19', '8', '27');
INSERT INTO `ssc_a` VALUES ('297', '296', '-1', '3', '34', '13', '24', '4', '1', '2', '5', '12', '1', '-1', '2', '-1', '2', '-1', '-1', '2', '4', '2', '5', '-1', '5', '1', '6', '4', '3', '8', '-1', '20', '9', '28');
INSERT INTO `ssc_a` VALUES ('298', '297', '1', '4', '35', '14', '25', '5', '2', '-1', '6', '13', '-1', '1', '-1', '1', '-1', '1', '1', '-1', '5', '-1', '6', '1', '6', '2', '7', '5', '4', '9', '1', '-1', '10', '29');
INSERT INTO `ssc_a` VALUES ('299', '298', '2', '5', '36', '15', '26', '6', '3', '-1', '7', '14', '-1', '2', '-1', '2', '-1', '2', '2', '-1', '6', '1', '-1', '2', '-1', '3', '8', '6', '5', '10', '2', '1', '11', '30');
INSERT INTO `ssc_a` VALUES ('300', '299', '3', '6', '37', '16', '27', '7', '4', '1', '-1', '15', '-1', '3', '1', '-1', '1', '-1', '3', '1', '-1', '-1', '1', '3', '1', '-1', '9', '7', '6', '11', '3', '2', '12', '31');
INSERT INTO `ssc_a` VALUES ('301', '300', '4', '7', '-1', '17', '28', '8', '5', '2', '1', '16', '1', '-1', '2', '-1', '-1', '1', '4', '2', '-1', '1', '2', '-1', '2', '1', '10', '8', '7', '12', '-1', '3', '13', '32');
INSERT INTO `ssc_a` VALUES ('302', '301', '5', '8', '1', '-1', '29', '9', '6', '3', '2', '17', '2', '-1', '-1', '1', '-1', '2', '-1', '3', '1', '-1', '3', '1', '3', '-1', '11', '9', '8', '13', '1', '4', '14', '33');
INSERT INTO `ssc_a` VALUES ('303', '302', '6', '9', '2', '1', '30', '10', '7', '4', '3', '-1', '-1', '1', '-1', '2', '1', '-1', '-1', '4', '2', '-1', '4', '2', '4', '1', '12', '10', '9', '14', '-1', '5', '15', '34');
INSERT INTO `ssc_a` VALUES ('304', '303', '7', '10', '3', '2', '31', '11', '-1', '5', '4', '1', '-1', '2', '1', '-1', '2', '-1', '-1', '5', '3', '1', '5', '-1', '5', '2', '13', '-1', '10', '15', '1', '6', '16', '35');
INSERT INTO `ssc_a` VALUES ('305', '304', '8', '-1', '4', '3', '32', '12', '1', '6', '5', '2', '1', '-1', '-1', '1', '-1', '1', '1', '-1', '4', '2', '6', '-1', '6', '3', '14', '1', '11', '-1', '2', '7', '17', '36');
INSERT INTO `ssc_a` VALUES ('306', '305', '9', '-1', '5', '4', '33', '13', '2', '7', '6', '3', '2', '-1', '-1', '2', '-1', '2', '2', '-1', '5', '3', '-1', '1', '-1', '4', '15', '2', '12', '1', '3', '8', '18', '37');
INSERT INTO `ssc_a` VALUES ('307', '306', '10', '1', '6', '5', '-1', '14', '3', '8', '7', '4', '3', '-1', '1', '-1', '1', '-1', '3', '-1', '6', '-1', '1', '2', '1', '5', '16', '-1', '13', '2', '4', '9', '19', '38');
INSERT INTO `ssc_a` VALUES ('308', '307', '11', '2', '7', '6', '1', '-1', '4', '9', '8', '5', '-1', '1', '-1', '1', '-1', '1', '4', '1', '-1', '-1', '2', '3', '2', '-1', '17', '1', '14', '3', '5', '10', '20', '39');
INSERT INTO `ssc_a` VALUES ('309', '308', '12', '-1', '8', '7', '2', '1', '5', '10', '9', '6', '1', '-1', '-1', '2', '-1', '2', '5', '-1', '1', '1', '3', '-1', '3', '1', '18', '2', '-1', '4', '6', '11', '21', '40');
INSERT INTO `ssc_a` VALUES ('310', '309', '13', '1', '9', '8', '3', '2', '6', '11', '10', '-1', '-1', '1', '-1', '3', '1', '-1', '-1', '1', '2', '-1', '4', '1', '4', '2', '19', '3', '1', '5', '7', '12', '-1', '41');

-- ----------------------------
-- Table structure for `ssc_b`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_b`;
CREATE TABLE `ssc_b` (
  `id` int(11) NOT NULL auto_increment,
  `sscid` int(11) NOT NULL,
  `n0` int(3) NOT NULL,
  `n1` int(3) NOT NULL,
  `n2` int(3) NOT NULL,
  `n3` int(3) NOT NULL,
  `n4` int(3) NOT NULL,
  `n5` int(3) NOT NULL,
  `n6` int(3) NOT NULL,
  `n7` int(3) NOT NULL,
  `n8` int(3) NOT NULL,
  `n9` int(3) NOT NULL,
  `da` int(3) NOT NULL,
  `xiao` int(3) NOT NULL,
  `ji` int(3) NOT NULL,
  `ou` int(3) NOT NULL,
  `zhi` int(3) NOT NULL,
  `he` int(3) NOT NULL,
  `lu0` int(3) NOT NULL,
  `lu1` int(3) NOT NULL,
  `lu2` int(3) NOT NULL,
  `sheng` int(3) NOT NULL,
  `ping` int(3) NOT NULL,
  `jiang` int(3) NOT NULL,
  `z0` int(3) NOT NULL,
  `z1` int(3) NOT NULL,
  `z2` int(3) NOT NULL,
  `z3` int(3) NOT NULL,
  `z4` int(3) NOT NULL,
  `z5` int(3) NOT NULL,
  `z6` int(3) NOT NULL,
  `z7` int(3) NOT NULL,
  `z8` int(3) NOT NULL,
  `z9` int(3) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssc_b
-- ----------------------------
INSERT INTO `ssc_b` VALUES ('1', '1', '1', '-1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '-1', '-1', '1', '-1', '1', '1', '-1', '1', '-1', '1', '1', '1', '-1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `ssc_b` VALUES ('2', '2', '2', '-1', '2', '2', '2', '2', '2', '2', '2', '2', '2', '-1', '-1', '2', '-1', '2', '2', '-1', '2', '1', '-1', '2', '-1', '1', '2', '2', '2', '2', '2', '2', '2', '2');
INSERT INTO `ssc_b` VALUES ('3', '3', '3', '1', '3', '3', '3', '-1', '3', '3', '3', '3', '-1', '1', '-1', '3', '-1', '3', '3', '1', '-1', '-1', '1', '3', '1', '2', '3', '3', '-1', '3', '3', '3', '3', '3');
INSERT INTO `ssc_b` VALUES ('4', '4', '-1', '2', '4', '4', '4', '1', '4', '4', '4', '4', '1', '-1', '1', '-1', '1', '-1', '-1', '2', '1', '1', '2', '-1', '2', '3', '4', '4', '1', '-1', '4', '4', '4', '4');
INSERT INTO `ssc_b` VALUES ('5', '5', '1', '3', '5', '5', '-1', '2', '5', '5', '5', '5', '2', '-1', '2', '-1', '2', '-1', '1', '-1', '2', '-1', '3', '1', '3', '4', '5', '5', '-1', '1', '5', '5', '5', '5');
INSERT INTO `ssc_b` VALUES ('6', '6', '2', '4', '6', '6', '1', '3', '6', '-1', '6', '6', '-1', '1', '-1', '1', '-1', '1', '2', '-1', '3', '-1', '4', '2', '4', '5', '6', '-1', '1', '2', '6', '6', '6', '6');
INSERT INTO `ssc_b` VALUES ('7', '7', '3', '5', '7', '-1', '2', '4', '7', '1', '7', '7', '1', '-1', '-1', '2', '-1', '2', '-1', '1', '4', '1', '5', '-1', '5', '6', '7', '1', '-1', '3', '7', '7', '7', '7');
INSERT INTO `ssc_b` VALUES ('8', '8', '-1', '6', '8', '1', '3', '5', '8', '2', '8', '8', '2', '-1', '1', '-1', '1', '-1', '-1', '2', '5', '2', '6', '-1', '6', '7', '8', '-1', '1', '4', '8', '8', '8', '8');
INSERT INTO `ssc_b` VALUES ('9', '9', '1', '7', '9', '-1', '4', '6', '9', '3', '9', '9', '3', '-1', '-1', '1', '-1', '1', '-1', '3', '6', '-1', '7', '1', '7', '8', '9', '-1', '2', '5', '9', '9', '9', '9');
INSERT INTO `ssc_b` VALUES ('10', '10', '-1', '8', '10', '1', '5', '7', '10', '4', '10', '10', '4', '-1', '1', '-1', '1', '-1', '-1', '4', '7', '1', '8', '-1', '8', '9', '10', '-1', '3', '6', '10', '10', '10', '10');
INSERT INTO `ssc_b` VALUES ('11', '11', '-1', '9', '11', '2', '6', '8', '11', '5', '11', '11', '5', '-1', '2', '-1', '2', '-1', '-1', '5', '8', '2', '-1', '1', '-1', '10', '11', '1', '4', '7', '11', '11', '11', '11');
INSERT INTO `ssc_b` VALUES ('12', '12', '1', '10', '12', '3', '7', '9', '-1', '6', '12', '12', '-1', '1', '3', '-1', '3', '-1', '-1', '6', '9', '-1', '1', '2', '1', '11', '12', '2', '5', '8', '-1', '12', '12', '12');
INSERT INTO `ssc_b` VALUES ('13', '13', '2', '11', '13', '4', '8', '-1', '1', '7', '13', '13', '-1', '2', '-1', '1', '-1', '1', '1', '7', '-1', '1', '2', '-1', '2', '-1', '13', '3', '6', '9', '1', '13', '13', '13');
INSERT INTO `ssc_b` VALUES ('14', '14', '3', '12', '14', '5', '9', '1', '2', '8', '-1', '14', '-1', '3', '1', '-1', '1', '-1', '2', '8', '-1', '-1', '3', '1', '3', '1', '14', '-1', '7', '10', '2', '14', '14', '14');
INSERT INTO `ssc_b` VALUES ('15', '15', '4', '13', '15', '6', '10', '2', '3', '9', '1', '-1', '-1', '4', '-1', '1', '2', '-1', '-1', '9', '1', '-1', '4', '2', '4', '-1', '15', '1', '8', '11', '3', '15', '15', '15');
INSERT INTO `ssc_b` VALUES ('16', '16', '5', '14', '16', '7', '11', '3', '-1', '10', '2', '1', '-1', '5', '1', '-1', '3', '-1', '-1', '10', '2', '1', '5', '-1', '5', '1', '16', '-1', '9', '12', '4', '16', '16', '16');
INSERT INTO `ssc_b` VALUES ('17', '17', '6', '15', '17', '8', '-1', '4', '1', '11', '3', '2', '1', '-1', '2', '-1', '4', '-1', '1', '-1', '3', '2', '6', '-1', '6', '2', '-1', '1', '10', '13', '5', '17', '17', '17');
INSERT INTO `ssc_b` VALUES ('18', '18', '7', '16', '18', '9', '1', '5', '2', '12', '-1', '3', '-1', '1', '3', '-1', '5', '-1', '2', '1', '-1', '-1', '7', '1', '7', '3', '1', '2', '-1', '14', '6', '18', '18', '18');
INSERT INTO `ssc_b` VALUES ('19', '19', '8', '17', '19', '-1', '2', '6', '3', '13', '1', '4', '1', '-1', '-1', '1', '-1', '1', '-1', '2', '1', '1', '8', '-1', '8', '4', '2', '3', '1', '-1', '7', '19', '19', '19');
INSERT INTO `ssc_b` VALUES ('20', '20', '9', '18', '20', '-1', '3', '7', '4', '14', '2', '5', '2', '-1', '-1', '2', '-1', '2', '-1', '3', '2', '2', '-1', '1', '-1', '5', '3', '4', '2', '1', '8', '20', '20', '20');
INSERT INTO `ssc_b` VALUES ('21', '21', '10', '19', '21', '1', '4', '8', '-1', '15', '3', '6', '-1', '1', '1', '-1', '1', '-1', '-1', '4', '3', '-1', '1', '2', '1', '6', '4', '-1', '3', '2', '9', '21', '21', '21');
INSERT INTO `ssc_b` VALUES ('22', '22', '11', '20', '22', '2', '-1', '9', '1', '16', '4', '7', '1', '-1', '2', '-1', '2', '-1', '1', '-1', '4', '1', '2', '-1', '2', '7', '-1', '1', '4', '3', '10', '22', '22', '22');
INSERT INTO `ssc_b` VALUES ('23', '23', '12', '21', '23', '3', '1', '10', '2', '-1', '5', '8', '-1', '1', '-1', '1', '-1', '1', '2', '-1', '5', '-1', '3', '1', '3', '8', '1', '-1', '5', '4', '11', '23', '23', '23');
INSERT INTO `ssc_b` VALUES ('24', '24', '13', '22', '24', '4', '2', '11', '-1', '1', '6', '9', '-1', '2', '1', '-1', '1', '-1', '-1', '1', '6', '1', '4', '-1', '4', '-1', '2', '1', '6', '5', '12', '24', '24', '24');
INSERT INTO `ssc_b` VALUES ('25', '25', '14', '23', '25', '5', '3', '12', '1', '-1', '7', '10', '-1', '3', '-1', '1', '-1', '1', '1', '-1', '7', '-1', '5', '1', '5', '-1', '3', '2', '7', '6', '13', '25', '25', '25');
INSERT INTO `ssc_b` VALUES ('26', '26', '15', '-1', '26', '6', '4', '13', '2', '1', '8', '11', '1', '-1', '-1', '2', '-1', '2', '2', '-1', '8', '1', '6', '-1', '6', '1', '4', '3', '8', '7', '-1', '26', '26', '26');
INSERT INTO `ssc_b` VALUES ('27', '27', '16', '1', '27', '7', '5', '14', '-1', '2', '9', '12', '-1', '1', '1', '-1', '1', '-1', '-1', '1', '9', '-1', '7', '1', '7', '2', '5', '4', '9', '-1', '1', '27', '27', '27');
INSERT INTO `ssc_b` VALUES ('28', '28', '17', '2', '28', '8', '6', '15', '1', '-1', '10', '13', '-1', '2', '-1', '1', '-1', '1', '1', '-1', '10', '-1', '8', '2', '8', '-1', '6', '5', '10', '1', '2', '28', '28', '28');
INSERT INTO `ssc_b` VALUES ('29', '29', '18', '3', '29', '9', '7', '16', '-1', '1', '11', '14', '-1', '3', '1', '-1', '1', '-1', '-1', '1', '11', '1', '9', '-1', '9', '-1', '7', '6', '11', '2', '3', '29', '29', '29');
INSERT INTO `ssc_b` VALUES ('30', '30', '-1', '4', '30', '10', '8', '17', '1', '2', '12', '15', '1', '-1', '2', '-1', '2', '-1', '-1', '2', '12', '2', '10', '-1', '10', '1', '8', '7', '12', '3', '-1', '30', '30', '30');
INSERT INTO `ssc_b` VALUES ('31', '31', '1', '5', '31', '11', '9', '18', '2', '3', '-1', '16', '-1', '1', '3', '-1', '3', '-1', '1', '3', '-1', '-1', '11', '1', '11', '2', '9', '8', '13', '4', '1', '31', '-1', '31');
INSERT INTO `ssc_b` VALUES ('32', '32', '-1', '6', '32', '12', '10', '19', '3', '4', '1', '17', '1', '-1', '4', '-1', '4', '-1', '-1', '4', '1', '1', '12', '-1', '12', '3', '10', '9', '14', '5', '2', '32', '-1', '32');
INSERT INTO `ssc_b` VALUES ('33', '33', '1', '-1', '33', '13', '11', '20', '4', '5', '2', '18', '2', '-1', '-1', '1', '-1', '1', '1', '-1', '2', '-1', '13', '1', '13', '-1', '11', '10', '15', '6', '3', '33', '1', '33');
INSERT INTO `ssc_b` VALUES ('34', '34', '2', '1', '34', '14', '12', '-1', '5', '6', '3', '19', '-1', '1', '-1', '2', '-1', '2', '2', '1', '-1', '-1', '14', '2', '14', '1', '12', '11', '-1', '7', '4', '34', '2', '34');
INSERT INTO `ssc_b` VALUES ('35', '35', '3', '2', '35', '-1', '13', '1', '6', '7', '4', '20', '1', '-1', '-1', '3', '-1', '3', '-1', '2', '1', '1', '15', '-1', '15', '2', '-1', '12', '1', '8', '5', '35', '3', '35');
INSERT INTO `ssc_b` VALUES ('36', '36', '4', '3', '36', '1', '14', '2', '7', '-1', '5', '21', '-1', '1', '-1', '4', '-1', '4', '1', '-1', '2', '-1', '16', '1', '16', '3', '1', '13', '-1', '9', '6', '36', '4', '36');
INSERT INTO `ssc_b` VALUES ('37', '37', '5', '4', '37', '2', '15', '-1', '8', '1', '6', '22', '-1', '2', '-1', '5', '-1', '5', '2', '1', '-1', '1', '17', '-1', '17', '4', '-1', '14', '1', '10', '7', '37', '5', '37');
INSERT INTO `ssc_b` VALUES ('38', '38', '6', '5', '38', '3', '-1', '1', '9', '2', '7', '23', '1', '-1', '1', '-1', '1', '-1', '3', '-1', '1', '2', '18', '-1', '18', '-1', '1', '15', '2', '11', '8', '38', '6', '38');
INSERT INTO `ssc_b` VALUES ('39', '39', '7', '6', '-1', '4', '1', '2', '10', '3', '8', '24', '2', '-1', '2', '-1', '-1', '1', '4', '1', '-1', '3', '19', '-1', '19', '1', '-1', '16', '3', '12', '9', '39', '7', '39');
INSERT INTO `ssc_b` VALUES ('40', '40', '8', '7', '-1', '5', '2', '3', '11', '4', '9', '25', '3', '-1', '3', '-1', '-1', '2', '5', '2', '-1', '4', '-1', '1', '-1', '2', '1', '17', '4', '13', '10', '40', '8', '40');
INSERT INTO `ssc_b` VALUES ('41', '41', '-1', '8', '1', '6', '3', '4', '12', '5', '10', '26', '4', '-1', '4', '-1', '1', '-1', '-1', '3', '1', '5', '1', '-1', '1', '3', '-1', '18', '5', '14', '11', '41', '9', '41');
INSERT INTO `ssc_b` VALUES ('42', '42', '-1', '9', '2', '7', '4', '5', '13', '6', '11', '27', '5', '-1', '5', '-1', '2', '-1', '-1', '4', '2', '6', '-1', '1', '-1', '4', '1', '19', '6', '15', '12', '42', '10', '42');
INSERT INTO `ssc_b` VALUES ('43', '43', '1', '10', '3', '8', '5', '6', '14', '-1', '12', '28', '-1', '1', '-1', '1', '-1', '1', '1', '-1', '3', '-1', '1', '2', '1', '5', '2', '20', '7', '16', '13', '-1', '11', '43');
INSERT INTO `ssc_b` VALUES ('44', '44', '2', '11', '-1', '9', '6', '7', '15', '1', '13', '29', '1', '-1', '1', '-1', '-1', '2', '2', '1', '-1', '1', '2', '-1', '2', '6', '3', '21', '8', '-1', '14', '1', '12', '44');
INSERT INTO `ssc_b` VALUES ('45', '45', '3', '12', '1', '-1', '7', '8', '16', '2', '14', '30', '2', '-1', '-1', '1', '-1', '3', '-1', '2', '1', '-1', '3', '1', '3', '-1', '4', '22', '9', '1', '15', '2', '13', '45');
INSERT INTO `ssc_b` VALUES ('46', '46', '-1', '13', '2', '1', '8', '9', '17', '3', '15', '31', '3', '-1', '1', '-1', '1', '-1', '-1', '3', '2', '1', '4', '-1', '4', '1', '5', '-1', '10', '2', '16', '3', '14', '46');
INSERT INTO `ssc_b` VALUES ('47', '47', '1', '14', '-1', '2', '9', '10', '18', '4', '16', '32', '4', '-1', '2', '-1', '-1', '1', '1', '4', '-1', '-1', '5', '1', '5', '2', '-1', '1', '11', '3', '17', '4', '15', '47');
INSERT INTO `ssc_b` VALUES ('48', '48', '-1', '15', '1', '3', '10', '11', '19', '5', '17', '33', '5', '-1', '3', '-1', '1', '-1', '-1', '5', '1', '1', '6', '-1', '6', '3', '-1', '2', '12', '4', '18', '5', '16', '48');
INSERT INTO `ssc_b` VALUES ('49', '49', '1', '16', '2', '4', '11', '12', '20', '-1', '18', '34', '-1', '1', '-1', '1', '-1', '1', '1', '-1', '2', '-1', '7', '1', '7', '4', '1', '3', '13', '5', '19', '-1', '17', '49');
INSERT INTO `ssc_b` VALUES ('50', '50', '2', '17', '-1', '5', '12', '13', '21', '1', '19', '35', '1', '-1', '1', '-1', '-1', '2', '2', '1', '-1', '1', '8', '-1', '8', '5', '2', '4', '14', '-1', '20', '1', '18', '50');
INSERT INTO `ssc_b` VALUES ('51', '51', '3', '18', '1', '6', '-1', '14', '22', '2', '20', '36', '2', '-1', '2', '-1', '1', '-1', '3', '-1', '1', '-1', '9', '1', '9', '6', '-1', '5', '15', '1', '21', '2', '19', '51');
INSERT INTO `ssc_b` VALUES ('52', '52', '4', '19', '2', '-1', '1', '15', '23', '3', '21', '37', '3', '-1', '-1', '1', '-1', '1', '-1', '1', '2', '1', '10', '-1', '10', '-1', '1', '6', '16', '2', '22', '3', '20', '52');
INSERT INTO `ssc_b` VALUES ('53', '53', '5', '20', '-1', '1', '2', '16', '24', '4', '22', '38', '4', '-1', '1', '-1', '-1', '2', '1', '2', '-1', '2', '11', '-1', '11', '-1', '2', '7', '17', '3', '23', '4', '21', '53');
INSERT INTO `ssc_b` VALUES ('54', '54', '6', '21', '1', '2', '3', '-1', '25', '5', '23', '39', '-1', '1', '-1', '1', '-1', '3', '2', '3', '-1', '-1', '12', '1', '12', '1', '3', '-1', '18', '4', '24', '5', '22', '54');
INSERT INTO `ssc_b` VALUES ('55', '55', '7', '22', '2', '3', '4', '1', '26', '6', '24', '-1', '-1', '2', '-1', '2', '1', '-1', '-1', '4', '1', '-1', '13', '2', '13', '2', '4', '1', '-1', '5', '25', '6', '23', '55');
INSERT INTO `ssc_b` VALUES ('56', '56', '8', '-1', '3', '4', '5', '2', '27', '7', '25', '1', '1', '-1', '-1', '3', '-1', '1', '1', '-1', '2', '1', '14', '-1', '14', '3', '5', '2', '1', '6', '26', '7', '-1', '56');
INSERT INTO `ssc_b` VALUES ('57', '57', '9', '1', '4', '5', '6', '3', '-1', '8', '26', '2', '-1', '1', '1', '-1', '1', '-1', '-1', '1', '3', '-1', '15', '1', '15', '4', '6', '3', '2', '-1', '27', '8', '1', '57');
INSERT INTO `ssc_b` VALUES ('58', '58', '10', '2', '5', '6', '-1', '4', '1', '9', '27', '3', '1', '-1', '2', '-1', '2', '-1', '1', '-1', '4', '1', '16', '-1', '16', '5', '-1', '4', '3', '1', '28', '9', '2', '58');
INSERT INTO `ssc_b` VALUES ('59', '59', '11', '3', '6', '7', '1', '5', '2', '-1', '28', '4', '-1', '1', '-1', '1', '-1', '1', '2', '-1', '5', '-1', '17', '1', '17', '6', '1', '-1', '4', '2', '29', '10', '3', '59');
INSERT INTO `ssc_b` VALUES ('60', '60', '-1', '4', '7', '8', '2', '6', '3', '1', '29', '5', '1', '-1', '1', '-1', '1', '-1', '-1', '1', '6', '1', '18', '-1', '18', '7', '2', '1', '5', '3', '30', '-1', '4', '60');
INSERT INTO `ssc_b` VALUES ('61', '61', '1', '5', '-1', '9', '3', '7', '4', '2', '30', '6', '2', '-1', '2', '-1', '-1', '1', '1', '2', '-1', '-1', '19', '1', '19', '8', '-1', '2', '6', '4', '31', '1', '5', '61');
INSERT INTO `ssc_b` VALUES ('62', '62', '2', '6', '1', '10', '4', '-1', '5', '3', '31', '7', '-1', '1', '-1', '1', '-1', '2', '2', '3', '-1', '-1', '20', '2', '20', '9', '1', '-1', '7', '5', '32', '2', '6', '62');
INSERT INTO `ssc_b` VALUES ('63', '63', '3', '7', '2', '11', '5', '1', '6', '-1', '32', '8', '-1', '2', '-1', '2', '-1', '3', '3', '-1', '1', '-1', '21', '3', '21', '10', '-1', '1', '8', '6', '33', '3', '7', '63');
INSERT INTO `ssc_b` VALUES ('64', '64', '4', '8', '3', '12', '6', '2', '7', '-1', '33', '9', '-1', '3', '-1', '3', '-1', '4', '4', '-1', '2', '1', '-1', '4', '-1', '11', '1', '2', '9', '7', '34', '4', '8', '64');
INSERT INTO `ssc_b` VALUES ('65', '65', '-1', '9', '4', '13', '7', '3', '8', '1', '34', '10', '1', '-1', '1', '-1', '1', '-1', '-1', '1', '3', '2', '1', '-1', '1', '12', '2', '3', '10', '8', '35', '-1', '9', '65');
INSERT INTO `ssc_b` VALUES ('66', '66', '1', '10', '5', '-1', '8', '4', '9', '2', '35', '11', '2', '-1', '-1', '1', '-1', '1', '-1', '2', '4', '-1', '2', '1', '2', '13', '3', '-1', '11', '9', '36', '1', '10', '66');
INSERT INTO `ssc_b` VALUES ('67', '67', '2', '11', '6', '1', '-1', '5', '10', '3', '36', '12', '3', '-1', '1', '-1', '1', '-1', '1', '-1', '5', '-1', '3', '2', '3', '-1', '4', '1', '12', '10', '37', '2', '11', '67');
INSERT INTO `ssc_b` VALUES ('68', '68', '3', '12', '7', '2', '1', '-1', '11', '4', '37', '13', '-1', '1', '-1', '1', '-1', '1', '2', '1', '-1', '-1', '4', '3', '4', '-1', '5', '2', '13', '11', '38', '3', '12', '68');
INSERT INTO `ssc_b` VALUES ('69', '69', '4', '13', '8', '3', '2', '1', '12', '-1', '38', '14', '-1', '2', '-1', '2', '-1', '2', '3', '-1', '1', '-1', '5', '4', '5', '1', '-1', '3', '14', '12', '39', '4', '13', '69');
INSERT INTO `ssc_b` VALUES ('70', '70', '5', '-1', '9', '4', '3', '2', '13', '1', '39', '15', '1', '-1', '-1', '3', '-1', '3', '4', '-1', '2', '1', '6', '-1', '6', '2', '1', '4', '15', '13', '-1', '5', '14', '70');
INSERT INTO `ssc_b` VALUES ('71', '71', '6', '1', '10', '5', '4', '3', '14', '2', '40', '-1', '-1', '1', '-1', '4', '1', '-1', '-1', '1', '3', '-1', '7', '1', '7', '3', '2', '5', '16', '14', '1', '6', '-1', '71');
INSERT INTO `ssc_b` VALUES ('72', '72', '7', '2', '11', '-1', '5', '4', '15', '3', '41', '1', '1', '-1', '-1', '5', '-1', '1', '-1', '2', '4', '1', '8', '-1', '8', '4', '3', '6', '17', '15', '-1', '7', '1', '72');
INSERT INTO `ssc_b` VALUES ('73', '73', '8', '3', '12', '1', '6', '5', '16', '-1', '42', '2', '-1', '1', '-1', '6', '-1', '2', '1', '-1', '5', '-1', '9', '1', '9', '5', '4', '7', '-1', '16', '1', '8', '2', '73');
INSERT INTO `ssc_b` VALUES ('74', '74', '9', '4', '13', '-1', '7', '6', '17', '1', '43', '3', '1', '-1', '-1', '7', '-1', '3', '-1', '1', '6', '1', '10', '-1', '10', '6', '5', '8', '-1', '17', '2', '9', '3', '74');
INSERT INTO `ssc_b` VALUES ('75', '75', '-1', '5', '14', '1', '8', '7', '18', '2', '44', '4', '2', '-1', '1', '-1', '1', '-1', '-1', '2', '7', '2', '11', '-1', '11', '7', '6', '-1', '1', '18', '3', '10', '4', '75');
INSERT INTO `ssc_b` VALUES ('76', '76', '1', '-1', '15', '2', '9', '8', '19', '3', '45', '5', '3', '-1', '-1', '1', '-1', '1', '1', '-1', '8', '-1', '12', '1', '12', '-1', '7', '1', '2', '19', '4', '11', '5', '76');
INSERT INTO `ssc_b` VALUES ('77', '77', '2', '1', '16', '3', '10', '9', '20', '4', '46', '-1', '-1', '1', '-1', '2', '1', '-1', '-1', '1', '9', '-1', '13', '2', '13', '1', '8', '2', '3', '20', '5', '12', '-1', '77');
INSERT INTO `ssc_b` VALUES ('78', '78', '-1', '2', '17', '4', '11', '10', '21', '5', '47', '1', '1', '-1', '1', '-1', '2', '-1', '-1', '2', '10', '1', '14', '-1', '14', '2', '9', '3', '4', '21', '6', '13', '1', '-1');
INSERT INTO `ssc_b` VALUES ('79', '79', '1', '3', '-1', '5', '12', '11', '22', '6', '48', '2', '2', '-1', '2', '-1', '-1', '1', '1', '3', '-1', '-1', '15', '1', '15', '3', '-1', '4', '5', '22', '7', '14', '2', '1');
INSERT INTO `ssc_b` VALUES ('80', '80', '2', '4', '1', '6', '-1', '12', '23', '7', '49', '3', '3', '-1', '3', '-1', '1', '-1', '2', '-1', '1', '-1', '16', '2', '16', '4', '-1', '5', '6', '23', '8', '15', '3', '2');
INSERT INTO `ssc_b` VALUES ('81', '81', '-1', '5', '2', '7', '1', '13', '24', '8', '50', '4', '4', '-1', '4', '-1', '2', '-1', '-1', '1', '2', '1', '17', '-1', '17', '5', '1', '6', '-1', '24', '9', '16', '4', '3');
INSERT INTO `ssc_b` VALUES ('82', '82', '1', '6', '3', '-1', '2', '14', '25', '9', '51', '5', '5', '-1', '-1', '1', '-1', '1', '-1', '2', '3', '-1', '18', '1', '18', '6', '2', '-1', '1', '25', '10', '17', '5', '4');
INSERT INTO `ssc_b` VALUES ('83', '83', '2', '7', '4', '1', '-1', '15', '26', '10', '52', '6', '6', '-1', '1', '-1', '1', '-1', '1', '-1', '4', '-1', '19', '2', '19', '-1', '3', '1', '2', '26', '11', '18', '6', '5');
INSERT INTO `ssc_b` VALUES ('84', '84', '3', '8', '-1', '2', '1', '16', '27', '11', '53', '7', '7', '-1', '2', '-1', '-1', '1', '2', '1', '-1', '1', '20', '-1', '20', '1', '-1', '2', '3', '27', '12', '19', '7', '6');
INSERT INTO `ssc_b` VALUES ('85', '85', '4', '9', '1', '-1', '2', '17', '28', '12', '54', '8', '8', '-1', '-1', '1', '-1', '2', '-1', '2', '1', '-1', '21', '1', '21', '-1', '1', '3', '4', '28', '13', '20', '8', '7');
INSERT INTO `ssc_b` VALUES ('86', '86', '5', '10', '2', '-1', '3', '18', '29', '13', '55', '9', '9', '-1', '-1', '2', '-1', '3', '-1', '3', '2', '1', '-1', '2', '-1', '1', '2', '4', '5', '29', '14', '21', '9', '8');
INSERT INTO `ssc_b` VALUES ('87', '87', '6', '11', '3', '1', '4', '19', '30', '-1', '56', '10', '-1', '1', '-1', '3', '-1', '4', '1', '-1', '3', '-1', '1', '3', '1', '2', '3', '5', '-1', '30', '15', '22', '10', '9');
INSERT INTO `ssc_b` VALUES ('88', '88', '7', '12', '4', '2', '5', '-1', '31', '1', '57', '11', '-1', '2', '-1', '4', '-1', '5', '2', '1', '-1', '1', '2', '-1', '2', '3', '-1', '6', '1', '31', '16', '23', '11', '10');
INSERT INTO `ssc_b` VALUES ('89', '89', '8', '13', '5', '3', '-1', '1', '32', '2', '58', '12', '1', '-1', '1', '-1', '1', '-1', '3', '-1', '1', '2', '3', '-1', '3', '-1', '1', '7', '2', '32', '17', '24', '12', '11');
INSERT INTO `ssc_b` VALUES ('90', '90', '9', '14', '-1', '4', '1', '2', '33', '3', '59', '13', '2', '-1', '2', '-1', '-1', '1', '4', '1', '-1', '3', '4', '-1', '4', '1', '-1', '8', '3', '33', '18', '25', '13', '12');
INSERT INTO `ssc_b` VALUES ('91', '91', '10', '-1', '1', '5', '2', '3', '34', '4', '60', '14', '3', '-1', '-1', '1', '-1', '2', '5', '-1', '1', '4', '5', '-1', '5', '-1', '1', '9', '4', '34', '19', '26', '14', '13');
INSERT INTO `ssc_b` VALUES ('92', '92', '11', '1', '2', '6', '3', '4', '35', '5', '61', '-1', '-1', '1', '-1', '2', '1', '-1', '-1', '1', '2', '-1', '6', '1', '6', '1', '2', '10', '5', '35', '20', '27', '-1', '14');
INSERT INTO `ssc_b` VALUES ('93', '93', '12', '2', '3', '7', '4', '5', '36', '-1', '62', '1', '-1', '2', '-1', '3', '-1', '1', '1', '-1', '3', '1', '7', '-1', '7', '2', '-1', '11', '6', '36', '21', '28', '1', '15');
INSERT INTO `ssc_b` VALUES ('94', '94', '13', '3', '4', '8', '5', '6', '-1', '1', '63', '2', '-1', '3', '1', '-1', '1', '-1', '-1', '1', '4', '2', '8', '-1', '8', '-1', '1', '12', '7', '37', '22', '29', '2', '16');
INSERT INTO `ssc_b` VALUES ('95', '95', '14', '4', '5', '9', '6', '-1', '1', '2', '64', '3', '-1', '4', '-1', '1', '-1', '1', '1', '2', '-1', '3', '9', '-1', '9', '-1', '2', '13', '8', '38', '23', '30', '3', '17');
INSERT INTO `ssc_b` VALUES ('96', '96', '15', '5', '6', '10', '-1', '1', '2', '3', '65', '4', '1', '-1', '1', '-1', '1', '-1', '2', '-1', '1', '4', '10', '-1', '10', '-1', '3', '14', '9', '39', '24', '31', '4', '18');
INSERT INTO `ssc_b` VALUES ('97', '97', '-1', '6', '7', '11', '1', '2', '3', '4', '66', '5', '2', '-1', '2', '-1', '2', '-1', '-1', '1', '2', '5', '11', '-1', '11', '1', '4', '15', '-1', '40', '25', '32', '5', '19');
INSERT INTO `ssc_b` VALUES ('98', '98', '1', '7', '8', '12', '2', '3', '-1', '5', '67', '6', '-1', '1', '3', '-1', '3', '-1', '-1', '2', '3', '-1', '12', '1', '12', '2', '5', '16', '1', '41', '-1', '33', '6', '20');
INSERT INTO `ssc_b` VALUES ('99', '99', '2', '8', '9', '13', '-1', '4', '1', '6', '68', '7', '1', '-1', '4', '-1', '4', '-1', '1', '-1', '4', '1', '13', '-1', '13', '3', '-1', '17', '2', '42', '1', '34', '7', '21');
INSERT INTO `ssc_b` VALUES ('100', '100', '3', '9', '10', '14', '1', '5', '-1', '7', '69', '8', '-1', '1', '5', '-1', '5', '-1', '-1', '1', '5', '-1', '14', '1', '14', '4', '-1', '18', '3', '43', '2', '35', '8', '22');
INSERT INTO `ssc_b` VALUES ('101', '101', '4', '10', '11', '15', '-1', '6', '1', '8', '70', '9', '1', '-1', '6', '-1', '6', '-1', '1', '-1', '6', '1', '15', '-1', '15', '5', '-1', '19', '4', '44', '3', '36', '9', '23');
INSERT INTO `ssc_b` VALUES ('102', '102', '5', '11', '12', '16', '1', '7', '2', '9', '-1', '10', '-1', '1', '7', '-1', '7', '-1', '2', '1', '-1', '-1', '16', '1', '16', '6', '1', '20', '-1', '45', '4', '37', '10', '24');
INSERT INTO `ssc_b` VALUES ('103', '103', '6', '12', '13', '17', '2', '8', '3', '10', '1', '-1', '-1', '2', '-1', '1', '8', '-1', '-1', '2', '1', '-1', '17', '2', '17', '-1', '2', '21', '1', '46', '5', '38', '11', '25');
INSERT INTO `ssc_b` VALUES ('104', '104', '7', '-1', '14', '18', '3', '9', '4', '11', '2', '1', '1', '-1', '-1', '2', '-1', '1', '1', '-1', '2', '1', '18', '-1', '18', '1', '3', '22', '2', '47', '6', '39', '-1', '26');
INSERT INTO `ssc_b` VALUES ('105', '105', '8', '1', '-1', '19', '4', '10', '5', '12', '3', '2', '2', '-1', '1', '-1', '-1', '2', '2', '1', '-1', '-1', '19', '1', '19', '-1', '4', '23', '3', '48', '7', '40', '1', '27');
INSERT INTO `ssc_b` VALUES ('106', '106', '9', '2', '1', '20', '-1', '11', '6', '13', '4', '3', '3', '-1', '2', '-1', '1', '-1', '3', '-1', '1', '-1', '20', '2', '20', '1', '-1', '24', '4', '49', '8', '41', '2', '28');
INSERT INTO `ssc_b` VALUES ('107', '107', '10', '3', '2', '21', '1', '12', '7', '14', '-1', '4', '-1', '1', '3', '-1', '2', '-1', '4', '1', '-1', '-1', '21', '3', '21', '2', '1', '25', '-1', '50', '9', '42', '3', '29');
INSERT INTO `ssc_b` VALUES ('108', '108', '11', '4', '-1', '22', '2', '13', '8', '15', '1', '5', '1', '-1', '4', '-1', '-1', '1', '5', '2', '-1', '1', '22', '-1', '22', '3', '2', '26', '1', '51', '-1', '43', '4', '30');
INSERT INTO `ssc_b` VALUES ('109', '109', '12', '5', '1', '-1', '3', '14', '9', '16', '2', '6', '2', '-1', '-1', '1', '-1', '2', '-1', '3', '1', '-1', '23', '1', '23', '-1', '3', '27', '2', '52', '1', '44', '5', '31');
INSERT INTO `ssc_b` VALUES ('110', '110', '-1', '6', '2', '1', '4', '15', '10', '17', '3', '7', '3', '-1', '1', '-1', '1', '-1', '-1', '4', '2', '1', '24', '-1', '24', '1', '4', '-1', '3', '53', '2', '45', '6', '32');
INSERT INTO `ssc_b` VALUES ('111', '111', '1', '-1', '3', '2', '5', '16', '11', '18', '4', '8', '4', '-1', '-1', '1', '-1', '1', '1', '-1', '3', '-1', '25', '1', '25', '-1', '5', '1', '4', '54', '3', '46', '7', '33');
INSERT INTO `ssc_b` VALUES ('112', '112', '2', '1', '-1', '3', '6', '17', '12', '19', '5', '9', '5', '-1', '1', '-1', '-1', '2', '2', '1', '-1', '-1', '26', '2', '26', '-1', '6', '2', '5', '55', '4', '47', '8', '34');
INSERT INTO `ssc_b` VALUES ('113', '113', '3', '2', '1', '-1', '7', '18', '13', '20', '6', '10', '6', '-1', '-1', '1', '-1', '3', '-1', '2', '1', '-1', '27', '3', '27', '-1', '7', '3', '6', '56', '5', '48', '9', '35');
INSERT INTO `ssc_b` VALUES ('114', '114', '4', '3', '2', '1', '8', '19', '14', '21', '-1', '11', '-1', '1', '1', '-1', '1', '-1', '1', '3', '-1', '-1', '28', '4', '28', '1', '8', '4', '7', '-1', '6', '49', '10', '36');
INSERT INTO `ssc_b` VALUES ('115', '115', '5', '4', '-1', '2', '9', '20', '15', '22', '1', '12', '1', '-1', '2', '-1', '-1', '1', '2', '4', '-1', '1', '29', '-1', '29', '2', '9', '5', '8', '1', '-1', '50', '11', '37');
INSERT INTO `ssc_b` VALUES ('116', '116', '-1', '5', '1', '3', '10', '21', '16', '23', '2', '13', '2', '-1', '3', '-1', '1', '-1', '-1', '5', '1', '2', '30', '-1', '30', '3', '-1', '6', '9', '2', '1', '51', '12', '38');
INSERT INTO `ssc_b` VALUES ('117', '117', '1', '6', '2', '-1', '11', '22', '17', '24', '3', '14', '3', '-1', '-1', '1', '-1', '1', '-1', '6', '2', '-1', '31', '1', '31', '4', '1', '-1', '10', '3', '2', '52', '13', '39');
INSERT INTO `ssc_b` VALUES ('118', '118', '2', '7', '3', '1', '-1', '23', '18', '25', '4', '15', '4', '-1', '1', '-1', '1', '-1', '1', '-1', '3', '-1', '32', '2', '32', '-1', '2', '1', '11', '4', '3', '53', '14', '40');
INSERT INTO `ssc_b` VALUES ('119', '119', '3', '8', '4', '2', '-1', '24', '19', '26', '5', '16', '5', '-1', '2', '-1', '2', '-1', '2', '-1', '4', '1', '-1', '3', '-1', '1', '3', '2', '12', '5', '4', '54', '15', '41');
INSERT INTO `ssc_b` VALUES ('120', '120', '4', '9', '5', '3', '1', '-1', '20', '27', '6', '17', '-1', '1', '-1', '1', '-1', '1', '3', '1', '-1', '-1', '1', '4', '1', '-1', '4', '3', '13', '6', '5', '55', '16', '42');
INSERT INTO `ssc_b` VALUES ('121', '121', '5', '-1', '6', '4', '2', '1', '21', '28', '7', '18', '1', '-1', '-1', '2', '-1', '2', '4', '-1', '1', '1', '2', '-1', '2', '1', '5', '4', '-1', '7', '6', '56', '17', '43');
INSERT INTO `ssc_b` VALUES ('122', '122', '-1', '1', '7', '5', '3', '2', '22', '29', '8', '19', '2', '-1', '1', '-1', '1', '-1', '-1', '1', '2', '2', '3', '-1', '3', '-1', '6', '5', '1', '8', '7', '57', '18', '44');
INSERT INTO `ssc_b` VALUES ('123', '123', '1', '2', '8', '6', '4', '3', '23', '30', '9', '-1', '-1', '1', '-1', '1', '2', '-1', '-1', '2', '3', '-1', '4', '1', '4', '1', '7', '6', '2', '9', '8', '58', '19', '-1');
INSERT INTO `ssc_b` VALUES ('124', '124', '2', '3', '9', '7', '5', '-1', '24', '31', '10', '1', '-1', '2', '-1', '2', '-1', '1', '1', '3', '-1', '1', '5', '-1', '5', '2', '8', '7', '-1', '10', '9', '59', '20', '1');
INSERT INTO `ssc_b` VALUES ('125', '125', '3', '4', '10', '8', '6', '-1', '25', '32', '11', '2', '-1', '3', '-1', '3', '-1', '2', '2', '4', '-1', '2', '-1', '1', '-1', '3', '9', '8', '1', '11', '10', '60', '21', '2');
INSERT INTO `ssc_b` VALUES ('126', '126', '4', '5', '11', '9', '-1', '1', '26', '33', '12', '3', '1', '-1', '1', '-1', '1', '-1', '3', '-1', '1', '3', '1', '-1', '1', '-1', '10', '9', '2', '12', '11', '61', '22', '3');
INSERT INTO `ssc_b` VALUES ('127', '127', '5', '6', '12', '10', '1', '2', '27', '-1', '13', '4', '-1', '1', '-1', '1', '-1', '1', '4', '-1', '2', '-1', '2', '1', '2', '1', '11', '-1', '3', '13', '12', '62', '23', '4');
INSERT INTO `ssc_b` VALUES ('128', '128', '6', '7', '13', '11', '2', '3', '28', '1', '14', '-1', '-1', '2', '-1', '2', '1', '-1', '-1', '1', '3', '-1', '3', '2', '3', '2', '-1', '1', '4', '14', '13', '63', '24', '5');
INSERT INTO `ssc_b` VALUES ('129', '129', '7', '8', '14', '12', '3', '4', '29', '-1', '15', '1', '-1', '3', '-1', '3', '-1', '1', '1', '-1', '4', '1', '4', '-1', '4', '3', '-1', '2', '5', '15', '14', '64', '25', '6');
INSERT INTO `ssc_b` VALUES ('130', '130', '8', '9', '15', '13', '4', '5', '30', '1', '16', '-1', '-1', '4', '-1', '4', '1', '-1', '-1', '1', '5', '-1', '5', '1', '5', '4', '-1', '3', '6', '16', '15', '65', '26', '7');
INSERT INTO `ssc_b` VALUES ('131', '131', '9', '10', '16', '14', '5', '6', '31', '-1', '17', '1', '-1', '5', '-1', '5', '-1', '1', '1', '-1', '6', '1', '6', '-1', '6', '5', '-1', '4', '7', '17', '16', '66', '27', '8');
INSERT INTO `ssc_b` VALUES ('132', '132', '10', '11', '17', '15', '-1', '7', '32', '1', '18', '2', '1', '-1', '1', '-1', '1', '-1', '2', '-1', '7', '2', '7', '-1', '7', '6', '1', '-1', '8', '18', '17', '67', '28', '9');
INSERT INTO `ssc_b` VALUES ('133', '133', '11', '12', '18', '16', '1', '-1', '33', '2', '19', '3', '-1', '1', '-1', '1', '-1', '1', '3', '1', '-1', '-1', '8', '1', '8', '-1', '2', '1', '9', '19', '18', '68', '29', '10');
INSERT INTO `ssc_b` VALUES ('134', '134', '12', '13', '19', '17', '2', '1', '34', '-1', '20', '4', '-1', '2', '-1', '2', '-1', '2', '4', '-1', '1', '-1', '9', '2', '9', '1', '-1', '2', '10', '20', '19', '69', '30', '11');
INSERT INTO `ssc_b` VALUES ('135', '135', '13', '14', '-1', '18', '3', '2', '35', '1', '21', '5', '1', '-1', '1', '-1', '-1', '3', '5', '1', '-1', '1', '10', '-1', '10', '2', '1', '3', '11', '-1', '20', '70', '31', '12');
INSERT INTO `ssc_b` VALUES ('136', '136', '14', '15', '-1', '19', '4', '3', '36', '2', '22', '6', '2', '-1', '2', '-1', '-1', '4', '6', '2', '-1', '2', '-1', '1', '-1', '3', '2', '4', '12', '1', '21', '71', '32', '13');
INSERT INTO `ssc_b` VALUES ('137', '137', '15', '16', '1', '20', '5', '4', '37', '-1', '23', '7', '-1', '1', '-1', '1', '-1', '5', '7', '-1', '1', '-1', '1', '2', '1', '4', '3', '5', '13', '-1', '22', '72', '33', '14');
INSERT INTO `ssc_b` VALUES ('138', '138', '16', '-1', '2', '21', '6', '5', '38', '1', '24', '8', '1', '-1', '-1', '2', '-1', '6', '8', '-1', '2', '1', '2', '-1', '2', '5', '4', '6', '14', '1', '-1', '73', '34', '15');
INSERT INTO `ssc_b` VALUES ('139', '139', '17', '1', '3', '22', '7', '-1', '39', '2', '25', '9', '-1', '1', '-1', '3', '-1', '7', '9', '1', '-1', '-1', '3', '1', '3', '6', '5', '7', '-1', '2', '1', '74', '35', '16');
INSERT INTO `ssc_b` VALUES ('140', '140', '-1', '2', '4', '23', '8', '1', '40', '3', '26', '10', '1', '-1', '1', '-1', '1', '-1', '-1', '2', '1', '1', '4', '-1', '4', '7', '6', '8', '1', '-1', '2', '75', '36', '17');
INSERT INTO `ssc_b` VALUES ('141', '141', '1', '3', '5', '24', '-1', '2', '41', '4', '27', '11', '2', '-1', '2', '-1', '2', '-1', '1', '-1', '2', '-1', '5', '1', '5', '8', '7', '9', '-1', '1', '3', '76', '37', '18');
INSERT INTO `ssc_b` VALUES ('142', '142', '2', '4', '6', '25', '1', '-1', '42', '5', '28', '12', '-1', '1', '-1', '1', '-1', '1', '2', '1', '-1', '-1', '6', '2', '6', '-1', '8', '10', '1', '2', '4', '77', '38', '19');
INSERT INTO `ssc_b` VALUES ('143', '143', '3', '-1', '7', '26', '2', '1', '43', '6', '29', '13', '1', '-1', '-1', '2', '-1', '2', '3', '-1', '1', '1', '7', '-1', '7', '1', '9', '11', '-1', '3', '5', '78', '39', '20');
INSERT INTO `ssc_b` VALUES ('144', '144', '4', '1', '8', '27', '3', '2', '44', '7', '30', '-1', '-1', '1', '-1', '3', '1', '-1', '-1', '1', '2', '-1', '8', '1', '8', '2', '10', '12', '1', '4', '6', '79', '-1', '21');
INSERT INTO `ssc_b` VALUES ('145', '145', '5', '2', '9', '28', '4', '3', '45', '-1', '31', '1', '-1', '2', '-1', '4', '-1', '1', '1', '-1', '3', '1', '9', '-1', '9', '3', '-1', '13', '2', '5', '7', '80', '1', '22');
INSERT INTO `ssc_b` VALUES ('146', '146', '6', '3', '10', '29', '5', '4', '46', '1', '32', '-1', '-1', '3', '-1', '5', '1', '-1', '-1', '1', '4', '-1', '10', '1', '10', '4', '-1', '14', '3', '6', '8', '81', '2', '23');
INSERT INTO `ssc_b` VALUES ('147', '147', '7', '4', '11', '30', '6', '5', '47', '-1', '33', '1', '-1', '4', '-1', '6', '-1', '1', '1', '-1', '5', '1', '11', '-1', '11', '5', '-1', '15', '4', '7', '9', '82', '3', '24');
INSERT INTO `ssc_b` VALUES ('148', '148', '8', '5', '12', '-1', '7', '6', '48', '1', '34', '2', '1', '-1', '-1', '7', '-1', '2', '-1', '1', '6', '2', '12', '-1', '12', '6', '1', '16', '-1', '8', '10', '83', '4', '25');
INSERT INTO `ssc_b` VALUES ('149', '149', '9', '-1', '13', '1', '8', '7', '49', '2', '35', '3', '2', '-1', '-1', '8', '-1', '3', '1', '-1', '7', '3', '13', '-1', '13', '7', '-1', '17', '1', '9', '11', '84', '5', '26');
INSERT INTO `ssc_b` VALUES ('150', '150', '10', '1', '14', '2', '9', '-1', '50', '3', '36', '4', '-1', '1', '-1', '9', '-1', '4', '2', '1', '-1', '-1', '14', '1', '14', '8', '1', '18', '-1', '10', '12', '85', '6', '27');
INSERT INTO `ssc_b` VALUES ('151', '151', '-1', '2', '15', '3', '10', '1', '51', '4', '37', '5', '1', '-1', '1', '-1', '1', '-1', '-1', '2', '1', '1', '15', '-1', '15', '9', '2', '19', '1', '-1', '13', '86', '7', '28');
INSERT INTO `ssc_b` VALUES ('152', '152', '-1', '3', '16', '4', '11', '2', '52', '5', '38', '6', '2', '-1', '2', '-1', '2', '-1', '-1', '3', '2', '2', '-1', '1', '-1', '10', '3', '20', '2', '1', '14', '87', '8', '29');
INSERT INTO `ssc_b` VALUES ('153', '153', '1', '-1', '17', '5', '12', '3', '53', '6', '39', '7', '3', '-1', '-1', '1', '-1', '1', '1', '-1', '3', '-1', '1', '2', '1', '-1', '4', '21', '3', '2', '15', '88', '9', '30');
INSERT INTO `ssc_b` VALUES ('154', '154', '2', '1', '18', '6', '13', '4', '54', '7', '-1', '8', '-1', '1', '1', '-1', '1', '-1', '2', '1', '-1', '-1', '2', '3', '2', '1', '5', '22', '4', '3', '16', '-1', '10', '31');
INSERT INTO `ssc_b` VALUES ('155', '155', '3', '2', '19', '7', '14', '5', '55', '8', '-1', '9', '-1', '2', '2', '-1', '2', '-1', '3', '2', '-1', '1', '-1', '4', '-1', '2', '6', '23', '5', '4', '17', '1', '11', '32');
INSERT INTO `ssc_b` VALUES ('156', '156', '4', '3', '-1', '8', '15', '6', '56', '9', '1', '10', '1', '-1', '3', '-1', '-1', '1', '4', '3', '-1', '2', '1', '-1', '1', '3', '7', '24', '6', '5', '-1', '2', '12', '33');
INSERT INTO `ssc_b` VALUES ('157', '157', '5', '4', '1', '9', '16', '7', '57', '10', '-1', '11', '-1', '1', '4', '-1', '1', '-1', '5', '4', '-1', '-1', '2', '1', '2', '4', '8', '25', '7', '6', '-1', '3', '13', '34');
INSERT INTO `ssc_b` VALUES ('158', '158', '6', '5', '2', '10', '17', '8', '58', '-1', '1', '12', '-1', '2', '-1', '1', '-1', '1', '6', '-1', '1', '1', '3', '-1', '3', '-1', '9', '26', '8', '7', '1', '4', '14', '35');
INSERT INTO `ssc_b` VALUES ('159', '159', '7', '6', '3', '11', '-1', '9', '59', '1', '2', '13', '1', '-1', '1', '-1', '1', '-1', '7', '-1', '2', '2', '4', '-1', '4', '1', '10', '-1', '9', '8', '2', '5', '15', '36');
INSERT INTO `ssc_b` VALUES ('160', '160', '8', '7', '4', '-1', '1', '10', '60', '2', '3', '14', '2', '-1', '-1', '1', '-1', '1', '-1', '1', '3', '3', '5', '-1', '5', '-1', '11', '1', '10', '9', '3', '6', '16', '37');
INSERT INTO `ssc_b` VALUES ('161', '161', '-1', '8', '5', '1', '2', '11', '61', '3', '4', '15', '3', '-1', '1', '-1', '1', '-1', '-1', '2', '4', '4', '6', '-1', '6', '1', '12', '-1', '11', '10', '4', '7', '17', '38');
INSERT INTO `ssc_b` VALUES ('162', '162', '1', '9', '6', '-1', '3', '12', '62', '4', '5', '16', '4', '-1', '-1', '1', '-1', '1', '-1', '3', '5', '-1', '7', '1', '7', '2', '13', '-1', '12', '11', '5', '8', '18', '39');
INSERT INTO `ssc_b` VALUES ('163', '163', '2', '10', '7', '1', '-1', '13', '63', '5', '6', '17', '5', '-1', '1', '-1', '1', '-1', '1', '-1', '6', '-1', '8', '2', '8', '-1', '14', '1', '13', '12', '6', '9', '19', '40');
INSERT INTO `ssc_b` VALUES ('164', '164', '3', '11', '8', '2', '1', '14', '64', '6', '7', '-1', '-1', '1', '-1', '1', '2', '-1', '-1', '1', '7', '-1', '9', '3', '9', '1', '15', '2', '14', '-1', '7', '10', '20', '41');
INSERT INTO `ssc_b` VALUES ('165', '165', '4', '12', '9', '3', '2', '15', '-1', '7', '8', '1', '-1', '2', '1', '-1', '3', '-1', '-1', '2', '8', '1', '10', '-1', '10', '2', '16', '-1', '15', '1', '8', '11', '21', '42');
INSERT INTO `ssc_b` VALUES ('166', '166', '5', '13', '10', '4', '-1', '16', '1', '8', '9', '2', '1', '-1', '2', '-1', '4', '-1', '1', '-1', '9', '2', '11', '-1', '11', '3', '-1', '1', '16', '2', '9', '12', '22', '43');
INSERT INTO `ssc_b` VALUES ('167', '167', '6', '14', '-1', '5', '1', '17', '2', '9', '10', '3', '2', '-1', '3', '-1', '-1', '1', '2', '1', '-1', '3', '12', '-1', '12', '4', '-1', '2', '17', '3', '10', '13', '23', '44');
INSERT INTO `ssc_b` VALUES ('168', '168', '7', '15', '-1', '6', '2', '18', '3', '10', '11', '4', '3', '-1', '4', '-1', '-1', '2', '3', '2', '-1', '4', '-1', '1', '-1', '5', '1', '3', '18', '4', '11', '14', '24', '45');
INSERT INTO `ssc_b` VALUES ('169', '169', '8', '16', '1', '7', '3', '19', '4', '11', '-1', '5', '-1', '1', '5', '-1', '1', '-1', '4', '3', '-1', '-1', '1', '2', '1', '6', '2', '4', '19', '5', '-1', '15', '25', '46');
INSERT INTO `ssc_b` VALUES ('170', '170', '-1', '17', '2', '8', '4', '20', '5', '12', '1', '6', '1', '-1', '6', '-1', '2', '-1', '-1', '4', '1', '1', '2', '-1', '2', '7', '3', '5', '20', '6', '1', '16', '-1', '47');
INSERT INTO `ssc_b` VALUES ('171', '171', '1', '18', '3', '9', '5', '21', '6', '13', '-1', '7', '-1', '1', '7', '-1', '3', '-1', '1', '5', '-1', '-1', '3', '1', '3', '8', '4', '6', '21', '7', '2', '17', '-1', '48');
INSERT INTO `ssc_b` VALUES ('172', '172', '2', '19', '4', '10', '-1', '22', '7', '14', '1', '8', '1', '-1', '8', '-1', '4', '-1', '2', '-1', '1', '1', '4', '-1', '4', '9', '5', '7', '-1', '8', '3', '18', '1', '49');
INSERT INTO `ssc_b` VALUES ('173', '173', '3', '20', '5', '11', '1', '23', '8', '15', '-1', '9', '-1', '1', '9', '-1', '5', '-1', '3', '1', '-1', '-1', '5', '1', '5', '10', '6', '8', '-1', '9', '4', '19', '2', '50');
INSERT INTO `ssc_b` VALUES ('174', '174', '4', '21', '6', '12', '2', '24', '-1', '16', '1', '10', '-1', '2', '10', '-1', '6', '-1', '-1', '2', '1', '1', '6', '-1', '6', '11', '-1', '9', '1', '10', '5', '20', '3', '51');
INSERT INTO `ssc_b` VALUES ('175', '175', '5', '-1', '7', '13', '3', '25', '1', '17', '2', '11', '1', '-1', '-1', '1', '-1', '1', '1', '-1', '2', '2', '7', '-1', '7', '12', '1', '10', '2', '-1', '6', '21', '4', '52');
INSERT INTO `ssc_b` VALUES ('176', '176', '6', '1', '8', '14', '4', '26', '-1', '18', '3', '12', '-1', '1', '1', '-1', '1', '-1', '-1', '1', '3', '-1', '8', '1', '8', '13', '2', '11', '3', '-1', '7', '22', '5', '53');
INSERT INTO `ssc_b` VALUES ('177', '177', '7', '2', '-1', '15', '5', '27', '1', '19', '4', '13', '1', '-1', '2', '-1', '-1', '1', '1', '2', '-1', '1', '9', '-1', '9', '14', '3', '12', '-1', '1', '8', '23', '6', '54');
INSERT INTO `ssc_b` VALUES ('178', '178', '8', '3', '1', '16', '6', '28', '2', '20', '5', '-1', '-1', '1', '-1', '1', '1', '-1', '-1', '3', '1', '-1', '10', '1', '10', '15', '4', '13', '1', '2', '9', '-1', '7', '55');
INSERT INTO `ssc_b` VALUES ('179', '178', '9', '4', '2', '17', '-1', '29', '3', '21', '6', '1', '1', '-1', '1', '-1', '2', '-1', '1', '-1', '2', '-1', '11', '2', '11', '16', '-1', '14', '2', '3', '10', '1', '8', '56');
INSERT INTO `ssc_b` VALUES ('180', '179', '-1', '5', '3', '18', '1', '30', '4', '22', '7', '2', '2', '-1', '2', '-1', '3', '-1', '-1', '1', '3', '1', '12', '-1', '12', '17', '1', '15', '-1', '4', '11', '2', '9', '57');
INSERT INTO `ssc_b` VALUES ('181', '180', '1', '6', '4', '19', '-1', '31', '5', '23', '8', '3', '3', '-1', '3', '-1', '4', '-1', '1', '-1', '4', '-1', '13', '1', '13', '18', '2', '16', '-1', '5', '12', '3', '10', '58');
INSERT INTO `ssc_b` VALUES ('182', '181', '2', '7', '5', '20', '-1', '32', '6', '24', '9', '4', '4', '-1', '4', '-1', '5', '-1', '2', '-1', '5', '1', '-1', '2', '-1', '19', '3', '17', '1', '6', '13', '4', '11', '59');
INSERT INTO `ssc_b` VALUES ('183', '182', '3', '8', '6', '21', '1', '33', '7', '25', '10', '-1', '-1', '1', '-1', '1', '6', '-1', '-1', '1', '6', '-1', '1', '3', '1', '20', '4', '18', '2', '-1', '14', '5', '12', '60');
INSERT INTO `ssc_b` VALUES ('184', '183', '4', '9', '7', '22', '2', '34', '-1', '26', '11', '1', '-1', '2', '1', '-1', '7', '-1', '-1', '2', '7', '1', '2', '-1', '2', '21', '5', '-1', '3', '1', '15', '6', '13', '61');
INSERT INTO `ssc_b` VALUES ('185', '184', '5', '10', '8', '23', '3', '35', '-1', '27', '12', '2', '-1', '3', '2', '-1', '8', '-1', '-1', '3', '8', '2', '-1', '1', '-1', '22', '6', '1', '4', '2', '16', '7', '14', '62');
INSERT INTO `ssc_b` VALUES ('186', '185', '6', '11', '9', '24', '4', '36', '-1', '28', '13', '3', '-1', '4', '3', '-1', '9', '-1', '-1', '4', '9', '3', '-1', '2', '-1', '23', '7', '2', '5', '3', '17', '8', '15', '63');
INSERT INTO `ssc_b` VALUES ('187', '186', '7', '12', '10', '25', '5', '-1', '1', '29', '14', '4', '-1', '5', '-1', '1', '-1', '1', '1', '5', '-1', '4', '1', '-1', '1', '-1', '8', '3', '6', '4', '18', '9', '16', '64');
INSERT INTO `ssc_b` VALUES ('188', '187', '8', '13', '11', '26', '6', '1', '2', '30', '15', '-1', '-1', '6', '-1', '2', '1', '-1', '-1', '6', '1', '-1', '2', '1', '2', '1', '9', '4', '-1', '5', '19', '10', '17', '65');
INSERT INTO `ssc_b` VALUES ('189', '188', '9', '14', '12', '27', '-1', '2', '3', '31', '16', '1', '1', '-1', '1', '-1', '2', '-1', '1', '-1', '2', '1', '3', '-1', '3', '2', '10', '5', '1', '-1', '20', '11', '18', '66');
INSERT INTO `ssc_b` VALUES ('190', '189', '10', '15', '13', '28', '1', '3', '4', '-1', '17', '2', '-1', '1', '-1', '1', '-1', '1', '2', '-1', '3', '-1', '4', '1', '4', '3', '11', '-1', '2', '1', '21', '12', '19', '67');
INSERT INTO `ssc_b` VALUES ('191', '190', '11', '16', '14', '29', '2', '4', '5', '-1', '18', '3', '-1', '2', '-1', '2', '-1', '2', '3', '-1', '4', '1', '-1', '2', '-1', '4', '12', '1', '3', '2', '22', '13', '20', '68');
INSERT INTO `ssc_b` VALUES ('192', '191', '12', '17', '15', '30', '3', '5', '6', '1', '19', '-1', '-1', '3', '-1', '3', '1', '-1', '-1', '1', '5', '-1', '1', '3', '1', '5', '-1', '2', '4', '3', '23', '14', '21', '69');
INSERT INTO `ssc_b` VALUES ('193', '192', '13', '18', '16', '31', '4', '6', '7', '2', '20', '-1', '-1', '4', '-1', '4', '2', '-1', '-1', '2', '6', '1', '-1', '4', '-1', '6', '1', '3', '5', '4', '24', '15', '22', '70');
INSERT INTO `ssc_b` VALUES ('194', '193', '14', '19', '17', '32', '5', '7', '8', '-1', '21', '1', '-1', '5', '-1', '5', '-1', '1', '1', '-1', '7', '2', '1', '-1', '1', '7', '-1', '4', '6', '5', '25', '16', '23', '71');
INSERT INTO `ssc_b` VALUES ('195', '194', '15', '20', '-1', '33', '6', '8', '9', '1', '22', '2', '1', '-1', '1', '-1', '-1', '2', '2', '1', '-1', '3', '2', '-1', '2', '8', '1', '5', '7', '-1', '26', '17', '24', '72');
INSERT INTO `ssc_b` VALUES ('196', '195', '16', '-1', '1', '34', '7', '9', '10', '2', '23', '3', '2', '-1', '-1', '1', '-1', '3', '3', '-1', '1', '4', '3', '-1', '3', '-1', '2', '6', '8', '1', '27', '18', '25', '73');
INSERT INTO `ssc_b` VALUES ('197', '196', '17', '1', '2', '35', '8', '-1', '11', '3', '24', '4', '-1', '1', '-1', '2', '-1', '4', '4', '1', '-1', '-1', '4', '1', '4', '1', '3', '7', '-1', '2', '28', '19', '26', '74');
INSERT INTO `ssc_b` VALUES ('198', '197', '18', '2', '3', '36', '9', '1', '-1', '4', '25', '5', '-1', '2', '1', '-1', '1', '-1', '-1', '2', '1', '-1', '5', '2', '5', '-1', '4', '8', '1', '3', '29', '20', '27', '75');
INSERT INTO `ssc_b` VALUES ('199', '198', '19', '3', '4', '37', '10', '2', '-1', '5', '26', '6', '-1', '3', '2', '-1', '2', '-1', '-1', '3', '2', '1', '-1', '3', '-1', '1', '5', '9', '2', '4', '30', '21', '28', '76');
INSERT INTO `ssc_b` VALUES ('200', '199', '20', '4', '-1', '38', '11', '3', '1', '6', '27', '7', '1', '-1', '3', '-1', '-1', '1', '1', '4', '-1', '2', '1', '-1', '1', '2', '6', '10', '-1', '5', '31', '22', '29', '77');
INSERT INTO `ssc_b` VALUES ('201', '200', '21', '5', '1', '39', '-1', '4', '2', '7', '28', '8', '2', '-1', '4', '-1', '1', '-1', '2', '-1', '1', '-1', '2', '1', '2', '3', '-1', '11', '1', '6', '32', '23', '30', '78');
INSERT INTO `ssc_b` VALUES ('202', '201', '22', '6', '2', '-1', '1', '5', '3', '8', '29', '9', '3', '-1', '-1', '1', '-1', '1', '-1', '1', '2', '1', '3', '-1', '3', '-1', '1', '12', '2', '7', '33', '24', '31', '79');
INSERT INTO `ssc_b` VALUES ('203', '202', '23', '7', '3', '1', '2', '6', '4', '9', '30', '-1', '-1', '1', '-1', '2', '1', '-1', '-1', '2', '3', '-1', '4', '1', '4', '1', '2', '13', '3', '8', '-1', '25', '32', '80');
INSERT INTO `ssc_b` VALUES ('204', '203', '24', '8', '4', '-1', '3', '7', '5', '10', '31', '1', '1', '-1', '-1', '3', '-1', '1', '-1', '3', '4', '1', '5', '-1', '5', '2', '3', '14', '4', '9', '-1', '26', '33', '81');
INSERT INTO `ssc_b` VALUES ('205', '204', '25', '9', '5', '1', '4', '-1', '6', '11', '32', '2', '-1', '1', '-1', '4', '-1', '2', '1', '4', '-1', '-1', '6', '1', '6', '3', '-1', '15', '5', '10', '1', '27', '34', '82');
INSERT INTO `ssc_b` VALUES ('206', '205', '26', '10', '6', '2', '5', '-1', '7', '12', '33', '3', '-1', '2', '-1', '5', '-1', '3', '2', '5', '-1', '1', '-1', '2', '-1', '4', '1', '16', '6', '11', '2', '28', '35', '83');
INSERT INTO `ssc_b` VALUES ('207', '206', '-1', '11', '7', '3', '6', '1', '8', '13', '34', '4', '1', '-1', '1', '-1', '1', '-1', '-1', '6', '1', '2', '1', '-1', '1', '5', '2', '17', '7', '-1', '3', '29', '36', '84');
INSERT INTO `ssc_b` VALUES ('208', '207', '1', '12', '8', '4', '7', '2', '9', '-1', '35', '5', '-1', '1', '-1', '1', '-1', '1', '1', '-1', '2', '-1', '2', '1', '2', '6', '3', '18', '8', '1', '4', '-1', '37', '85');
INSERT INTO `ssc_b` VALUES ('209', '208', '2', '13', '9', '-1', '8', '3', '10', '1', '36', '6', '1', '-1', '-1', '2', '-1', '2', '-1', '1', '3', '1', '3', '-1', '3', '7', '4', '19', '-1', '2', '5', '1', '38', '86');
INSERT INTO `ssc_b` VALUES ('210', '209', '3', '14', '10', '1', '9', '4', '11', '2', '-1', '7', '-1', '1', '1', '-1', '1', '-1', '1', '2', '-1', '-1', '4', '1', '4', '8', '5', '20', '1', '-1', '6', '2', '39', '87');
INSERT INTO `ssc_b` VALUES ('211', '210', '4', '15', '11', '2', '10', '5', '12', '3', '-1', '8', '-1', '2', '2', '-1', '2', '-1', '2', '3', '-1', '1', '-1', '2', '-1', '9', '6', '21', '2', '1', '7', '3', '40', '88');
INSERT INTO `ssc_b` VALUES ('212', '211', '5', '16', '12', '3', '11', '6', '13', '-1', '1', '9', '-1', '3', '-1', '1', '-1', '1', '3', '-1', '1', '2', '1', '-1', '1', '-1', '7', '22', '3', '2', '8', '4', '41', '89');
INSERT INTO `ssc_b` VALUES ('213', '212', '6', '17', '13', '4', '12', '7', '14', '-1', '2', '10', '-1', '4', '-1', '2', '-1', '2', '4', '-1', '2', '3', '-1', '1', '-1', '1', '8', '23', '4', '3', '9', '5', '42', '90');
INSERT INTO `ssc_b` VALUES ('214', '213', '7', '18', '14', '5', '13', '8', '15', '-1', '3', '11', '-1', '5', '-1', '3', '-1', '3', '5', '-1', '3', '4', '-1', '2', '-1', '2', '9', '24', '5', '4', '10', '6', '43', '91');
INSERT INTO `ssc_b` VALUES ('215', '214', '8', '19', '15', '6', '14', '9', '-1', '1', '4', '12', '-1', '6', '1', '-1', '1', '-1', '-1', '1', '4', '5', '1', '-1', '1', '-1', '10', '25', '6', '5', '11', '7', '44', '92');
INSERT INTO `ssc_b` VALUES ('216', '215', '9', '20', '16', '7', '-1', '10', '1', '2', '5', '13', '1', '-1', '2', '-1', '2', '-1', '1', '-1', '5', '6', '2', '-1', '2', '1', '-1', '26', '7', '6', '12', '8', '45', '93');
INSERT INTO `ssc_b` VALUES ('217', '216', '10', '21', '17', '8', '1', '11', '2', '3', '6', '-1', '-1', '1', '-1', '1', '3', '-1', '-1', '1', '6', '-1', '3', '1', '3', '2', '1', '27', '8', '-1', '13', '9', '46', '94');
INSERT INTO `ssc_b` VALUES ('218', '217', '11', '22', '18', '9', '2', '12', '-1', '4', '7', '1', '-1', '2', '1', '-1', '4', '-1', '-1', '2', '7', '1', '4', '-1', '4', '3', '2', '-1', '9', '1', '14', '10', '47', '95');
INSERT INTO `ssc_b` VALUES ('219', '218', '12', '23', '19', '10', '3', '13', '1', '-1', '8', '2', '-1', '3', '-1', '1', '-1', '1', '1', '-1', '8', '-1', '5', '1', '5', '-1', '3', '1', '10', '2', '15', '11', '48', '96');
INSERT INTO `ssc_b` VALUES ('220', '219', '13', '24', '20', '-1', '4', '14', '2', '1', '9', '3', '1', '-1', '-1', '2', '-1', '2', '-1', '1', '9', '1', '6', '-1', '6', '1', '4', '2', '-1', '3', '16', '12', '49', '97');
INSERT INTO `ssc_b` VALUES ('221', '220', '14', '25', '21', '1', '-1', '15', '3', '2', '10', '4', '2', '-1', '1', '-1', '1', '-1', '1', '-1', '10', '-1', '7', '1', '7', '-1', '5', '3', '1', '4', '17', '13', '50', '98');
INSERT INTO `ssc_b` VALUES ('222', '221', '15', '26', '22', '2', '1', '16', '4', '-1', '11', '5', '-1', '1', '-1', '1', '-1', '1', '2', '-1', '11', '-1', '8', '2', '8', '1', '6', '-1', '2', '5', '18', '14', '51', '99');
INSERT INTO `ssc_b` VALUES ('223', '222', '-1', '27', '23', '3', '2', '17', '5', '1', '12', '6', '1', '-1', '1', '-1', '1', '-1', '-1', '1', '12', '1', '9', '-1', '9', '2', '7', '1', '3', '6', '19', '-1', '52', '100');
INSERT INTO `ssc_b` VALUES ('224', '223', '-1', '28', '24', '4', '3', '18', '6', '2', '13', '7', '2', '-1', '2', '-1', '2', '-1', '-1', '2', '13', '2', '-1', '1', '-1', '3', '8', '2', '4', '7', '20', '1', '53', '101');
INSERT INTO `ssc_b` VALUES ('225', '224', '1', '29', '25', '5', '-1', '19', '7', '3', '14', '8', '3', '-1', '3', '-1', '3', '-1', '1', '-1', '14', '-1', '1', '2', '1', '4', '9', '3', '-1', '8', '21', '2', '54', '102');
INSERT INTO `ssc_b` VALUES ('226', '225', '2', '30', '-1', '6', '1', '20', '8', '4', '15', '9', '4', '-1', '4', '-1', '-1', '1', '2', '1', '-1', '1', '2', '-1', '2', '5', '-1', '4', '1', '9', '22', '3', '55', '103');
INSERT INTO `ssc_b` VALUES ('227', '226', '-1', '31', '1', '7', '2', '21', '9', '5', '16', '10', '5', '-1', '5', '-1', '1', '-1', '-1', '2', '1', '2', '3', '-1', '3', '6', '-1', '5', '2', '10', '23', '4', '56', '104');
INSERT INTO `ssc_b` VALUES ('228', '227', '1', '-1', '2', '8', '3', '22', '10', '6', '17', '11', '6', '-1', '-1', '1', '-1', '1', '1', '-1', '2', '-1', '4', '1', '4', '-1', '1', '6', '3', '11', '24', '5', '57', '105');
INSERT INTO `ssc_b` VALUES ('229', '228', '2', '1', '3', '-1', '4', '23', '11', '7', '18', '12', '7', '-1', '-1', '2', '-1', '2', '-1', '1', '3', '-1', '5', '2', '5', '1', '-1', '7', '4', '12', '25', '6', '58', '106');
INSERT INTO `ssc_b` VALUES ('230', '229', '3', '2', '4', '1', '5', '24', '-1', '8', '19', '13', '-1', '1', '1', '-1', '1', '-1', '-1', '2', '4', '-1', '6', '3', '6', '2', '1', '-1', '5', '13', '26', '7', '59', '107');
INSERT INTO `ssc_b` VALUES ('231', '230', '4', '3', '5', '2', '6', '25', '1', '9', '20', '-1', '-1', '2', '-1', '1', '2', '-1', '-1', '3', '5', '-1', '7', '4', '7', '3', '2', '-1', '6', '14', '27', '8', '60', '108');
INSERT INTO `ssc_b` VALUES ('232', '231', '5', '4', '6', '3', '7', '26', '2', '-1', '21', '1', '-1', '3', '-1', '2', '-1', '1', '1', '-1', '6', '1', '8', '-1', '8', '4', '-1', '1', '7', '15', '28', '9', '61', '109');
INSERT INTO `ssc_b` VALUES ('233', '232', '6', '5', '-1', '4', '8', '27', '3', '1', '22', '2', '1', '-1', '1', '-1', '-1', '2', '2', '1', '-1', '2', '9', '-1', '9', '5', '1', '2', '8', '-1', '29', '10', '62', '110');
INSERT INTO `ssc_b` VALUES ('234', '233', '7', '-1', '1', '5', '9', '28', '4', '2', '23', '3', '2', '-1', '-1', '1', '-1', '3', '3', '-1', '1', '3', '10', '-1', '10', '-1', '2', '3', '9', '1', '30', '11', '63', '111');
INSERT INTO `ssc_b` VALUES ('235', '234', '-1', '1', '2', '6', '10', '29', '5', '3', '24', '4', '3', '-1', '1', '-1', '1', '-1', '-1', '1', '2', '4', '11', '-1', '11', '-1', '3', '4', '10', '2', '31', '12', '64', '112');
INSERT INTO `ssc_b` VALUES ('236', '235', '1', '2', '3', '7', '11', '30', '6', '4', '25', '-1', '-1', '1', '-1', '1', '2', '-1', '-1', '2', '3', '-1', '12', '1', '12', '1', '4', '5', '11', '3', '32', '13', '65', '-1');
INSERT INTO `ssc_b` VALUES ('237', '236', '2', '3', '4', '8', '12', '31', '-1', '5', '26', '1', '-1', '2', '1', '-1', '3', '-1', '-1', '3', '4', '1', '13', '-1', '13', '2', '5', '-1', '12', '4', '33', '14', '66', '1');
INSERT INTO `ssc_b` VALUES ('238', '237', '3', '4', '5', '9', '13', '32', '1', '6', '-1', '2', '-1', '3', '2', '-1', '4', '-1', '1', '4', '-1', '-1', '14', '1', '14', '3', '-1', '1', '13', '5', '34', '15', '67', '2');
INSERT INTO `ssc_b` VALUES ('239', '238', '4', '5', '6', '10', '-1', '33', '2', '7', '1', '3', '1', '-1', '3', '-1', '5', '-1', '2', '-1', '1', '1', '15', '-1', '15', '4', '1', '2', '-1', '6', '35', '16', '68', '3');
INSERT INTO `ssc_b` VALUES ('240', '239', '5', '6', '7', '-1', '1', '34', '3', '8', '2', '4', '2', '-1', '-1', '1', '-1', '1', '-1', '1', '2', '2', '16', '-1', '16', '-1', '2', '3', '1', '7', '36', '17', '69', '4');
INSERT INTO `ssc_b` VALUES ('241', '240', '6', '7', '-1', '1', '2', '35', '4', '9', '3', '5', '3', '-1', '1', '-1', '-1', '2', '1', '2', '-1', '3', '17', '-1', '17', '-1', '3', '4', '2', '8', '37', '18', '70', '5');
INSERT INTO `ssc_b` VALUES ('242', '241', '7', '8', '1', '-1', '3', '36', '5', '10', '4', '6', '4', '-1', '-1', '1', '-1', '3', '-1', '3', '1', '-1', '18', '1', '18', '-1', '4', '5', '3', '9', '38', '19', '71', '6');
INSERT INTO `ssc_b` VALUES ('243', '242', '8', '9', '-1', '1', '4', '37', '6', '11', '5', '7', '5', '-1', '1', '-1', '-1', '4', '1', '4', '-1', '1', '19', '-1', '19', '-1', '5', '6', '4', '10', '39', '20', '72', '7');
INSERT INTO `ssc_b` VALUES ('244', '243', '9', '10', '1', '2', '5', '38', '7', '-1', '6', '8', '-1', '1', '-1', '1', '-1', '5', '2', '-1', '1', '-1', '20', '1', '20', '1', '6', '7', '5', '-1', '40', '21', '73', '8');
INSERT INTO `ssc_b` VALUES ('245', '244', '10', '11', '2', '3', '-1', '39', '8', '1', '7', '9', '1', '-1', '1', '-1', '1', '-1', '3', '-1', '2', '1', '21', '-1', '21', '2', '7', '-1', '6', '1', '41', '22', '74', '9');
INSERT INTO `ssc_b` VALUES ('246', '245', '-1', '12', '3', '4', '1', '40', '9', '2', '8', '10', '2', '-1', '2', '-1', '2', '-1', '-1', '1', '3', '2', '22', '-1', '22', '3', '8', '1', '-1', '2', '42', '23', '75', '10');
INSERT INTO `ssc_b` VALUES ('247', '246', '1', '13', '4', '5', '2', '-1', '10', '3', '9', '11', '-1', '1', '-1', '1', '-1', '1', '1', '2', '-1', '-1', '23', '1', '23', '4', '9', '2', '1', '-1', '43', '24', '76', '11');
INSERT INTO `ssc_b` VALUES ('248', '247', '2', '14', '5', '6', '3', '1', '-1', '4', '10', '12', '-1', '2', '1', '-1', '1', '-1', '-1', '3', '1', '-1', '24', '2', '24', '-1', '10', '3', '2', '1', '44', '25', '77', '12');
INSERT INTO `ssc_b` VALUES ('249', '248', '3', '-1', '6', '7', '4', '2', '1', '5', '11', '13', '1', '-1', '-1', '1', '-1', '1', '1', '-1', '2', '1', '25', '-1', '25', '1', '11', '4', '3', '-1', '45', '26', '78', '13');
INSERT INTO `ssc_b` VALUES ('250', '249', '4', '1', '7', '8', '5', '3', '-1', '6', '12', '14', '-1', '1', '1', '-1', '1', '-1', '-1', '1', '3', '-1', '26', '1', '26', '2', '12', '5', '4', '-1', '46', '27', '79', '14');
INSERT INTO `ssc_b` VALUES ('251', '250', '-1', '2', '8', '9', '6', '4', '1', '7', '13', '15', '1', '-1', '2', '-1', '2', '-1', '-1', '2', '4', '1', '27', '-1', '27', '3', '13', '6', '5', '1', '-1', '28', '80', '15');
INSERT INTO `ssc_b` VALUES ('252', '251', '1', '3', '9', '10', '7', '5', '2', '8', '-1', '16', '-1', '1', '3', '-1', '3', '-1', '1', '3', '-1', '-1', '28', '1', '28', '4', '14', '7', '6', '2', '1', '29', '-1', '16');
INSERT INTO `ssc_b` VALUES ('253', '252', '2', '-1', '10', '11', '8', '6', '3', '9', '1', '17', '1', '-1', '-1', '1', '-1', '1', '2', '-1', '1', '1', '29', '-1', '29', '5', '15', '8', '7', '3', '2', '-1', '1', '17');
INSERT INTO `ssc_b` VALUES ('254', '253', '3', '1', '11', '12', '9', '7', '4', '-1', '2', '18', '-1', '1', '-1', '2', '-1', '2', '3', '-1', '2', '-1', '30', '1', '30', '6', '16', '9', '8', '4', '-1', '1', '2', '18');
INSERT INTO `ssc_b` VALUES ('255', '254', '4', '2', '12', '13', '-1', '8', '5', '1', '3', '19', '1', '-1', '1', '-1', '1', '-1', '4', '-1', '3', '1', '31', '-1', '31', '7', '17', '-1', '9', '5', '1', '2', '3', '19');
INSERT INTO `ssc_b` VALUES ('256', '255', '5', '3', '13', '-1', '1', '9', '6', '2', '4', '20', '2', '-1', '-1', '1', '-1', '1', '-1', '1', '4', '2', '32', '-1', '32', '-1', '18', '1', '10', '6', '2', '3', '4', '20');
INSERT INTO `ssc_b` VALUES ('257', '256', '6', '4', '14', '1', '2', '-1', '7', '3', '5', '21', '-1', '1', '-1', '2', '-1', '2', '1', '2', '-1', '-1', '33', '1', '33', '1', '-1', '2', '11', '7', '3', '4', '5', '21');
INSERT INTO `ssc_b` VALUES ('258', '257', '-1', '5', '15', '2', '3', '1', '8', '4', '6', '22', '1', '-1', '1', '-1', '1', '-1', '-1', '3', '1', '1', '34', '-1', '34', '2', '1', '3', '12', '-1', '4', '5', '6', '22');
INSERT INTO `ssc_b` VALUES ('259', '258', '1', '6', '16', '3', '4', '2', '-1', '5', '7', '23', '-1', '1', '2', '-1', '2', '-1', '-1', '4', '2', '-1', '35', '1', '35', '3', '2', '4', '13', '1', '-1', '6', '7', '23');
INSERT INTO `ssc_b` VALUES ('260', '259', '-1', '7', '17', '4', '5', '3', '1', '6', '8', '24', '1', '-1', '3', '-1', '3', '-1', '-1', '5', '3', '1', '36', '-1', '36', '4', '3', '5', '14', '2', '-1', '7', '8', '24');
INSERT INTO `ssc_b` VALUES ('261', '260', '1', '8', '18', '5', '6', '-1', '2', '7', '9', '25', '-1', '1', '-1', '1', '-1', '1', '1', '6', '-1', '-1', '37', '1', '37', '5', '4', '6', '15', '-1', '1', '8', '9', '25');
INSERT INTO `ssc_b` VALUES ('262', '261', '2', '9', '19', '6', '7', '1', '3', '8', '10', '-1', '-1', '2', '-1', '2', '1', '-1', '-1', '7', '1', '-1', '38', '2', '38', '6', '5', '7', '-1', '1', '2', '9', '10', '26');
INSERT INTO `ssc_b` VALUES ('263', '262', '3', '10', '20', '7', '8', '2', '4', '9', '11', '-1', '-1', '3', '-1', '3', '2', '-1', '-1', '8', '2', '1', '-1', '3', '-1', '7', '6', '8', '1', '2', '3', '10', '11', '27');
INSERT INTO `ssc_b` VALUES ('264', '263', '-1', '11', '21', '8', '9', '3', '5', '10', '12', '1', '1', '-1', '1', '-1', '3', '-1', '-1', '9', '3', '2', '1', '-1', '1', '8', '7', '9', '2', '3', '4', '11', '12', '-1');
INSERT INTO `ssc_b` VALUES ('265', '264', '-1', '12', '22', '9', '10', '4', '6', '11', '13', '2', '2', '-1', '2', '-1', '4', '-1', '-1', '10', '4', '3', '-1', '1', '-1', '9', '8', '10', '3', '4', '5', '12', '13', '1');
INSERT INTO `ssc_b` VALUES ('266', '265', '1', '-1', '23', '10', '11', '5', '7', '12', '14', '3', '3', '-1', '-1', '1', '-1', '1', '1', '-1', '5', '-1', '1', '2', '1', '-1', '9', '11', '4', '5', '6', '13', '14', '2');
INSERT INTO `ssc_b` VALUES ('267', '266', '2', '1', '24', '11', '12', '6', '8', '13', '-1', '4', '-1', '1', '1', '-1', '1', '-1', '2', '1', '-1', '-1', '2', '3', '2', '1', '10', '12', '5', '6', '7', '-1', '15', '3');
INSERT INTO `ssc_b` VALUES ('268', '267', '3', '2', '25', '12', '-1', '7', '9', '14', '1', '5', '1', '-1', '2', '-1', '2', '-1', '3', '-1', '1', '1', '3', '-1', '3', '2', '11', '13', '-1', '7', '8', '1', '16', '4');
INSERT INTO `ssc_b` VALUES ('269', '268', '4', '3', '26', '13', '1', '8', '10', '-1', '2', '6', '-1', '1', '-1', '1', '-1', '1', '4', '-1', '2', '-1', '4', '1', '4', '3', '12', '-1', '1', '8', '9', '2', '17', '5');
INSERT INTO `ssc_b` VALUES ('270', '269', '-1', '4', '27', '14', '2', '9', '11', '1', '3', '7', '1', '-1', '1', '-1', '1', '-1', '-1', '1', '3', '1', '5', '-1', '5', '4', '13', '1', '2', '9', '10', '-1', '18', '6');
INSERT INTO `ssc_b` VALUES ('271', '270', '1', '5', '28', '15', '3', '10', '12', '-1', '4', '8', '-1', '1', '-1', '1', '-1', '1', '1', '-1', '4', '-1', '6', '1', '6', '5', '14', '2', '3', '10', '11', '-1', '19', '7');
INSERT INTO `ssc_b` VALUES ('272', '271', '2', '6', '29', '16', '-1', '11', '13', '1', '5', '9', '1', '-1', '1', '-1', '1', '-1', '2', '-1', '5', '1', '7', '-1', '7', '6', '15', '-1', '4', '11', '12', '1', '20', '8');
INSERT INTO `ssc_b` VALUES ('273', '272', '3', '7', '30', '17', '1', '12', '-1', '2', '6', '10', '-1', '1', '2', '-1', '2', '-1', '-1', '1', '6', '-1', '8', '1', '8', '7', '-1', '1', '5', '12', '13', '2', '21', '9');
INSERT INTO `ssc_b` VALUES ('274', '273', '4', '8', '31', '18', '2', '13', '1', '3', '7', '-1', '-1', '2', '-1', '1', '3', '-1', '-1', '2', '7', '-1', '9', '2', '9', '8', '1', '-1', '6', '13', '14', '3', '22', '10');
INSERT INTO `ssc_b` VALUES ('275', '274', '-1', '9', '32', '19', '3', '14', '2', '4', '8', '1', '1', '-1', '1', '-1', '4', '-1', '-1', '3', '8', '1', '10', '-1', '10', '9', '2', '1', '7', '14', '15', '4', '23', '-1');
INSERT INTO `ssc_b` VALUES ('276', '275', '1', '10', '-1', '20', '4', '15', '3', '5', '9', '2', '2', '-1', '2', '-1', '-1', '1', '1', '4', '-1', '-1', '11', '1', '11', '10', '-1', '2', '8', '15', '16', '5', '24', '1');
INSERT INTO `ssc_b` VALUES ('277', '276', '2', '11', '1', '21', '5', '16', '4', '6', '10', '-1', '-1', '1', '-1', '1', '1', '-1', '-1', '5', '1', '-1', '12', '2', '12', '11', '1', '3', '9', '16', '17', '-1', '25', '2');
INSERT INTO `ssc_b` VALUES ('278', '277', '3', '12', '2', '-1', '6', '17', '5', '7', '11', '1', '1', '-1', '-1', '2', '-1', '1', '-1', '6', '2', '1', '13', '-1', '13', '12', '2', '4', '10', '17', '-1', '1', '26', '3');
INSERT INTO `ssc_b` VALUES ('279', '278', '4', '13', '3', '1', '7', '18', '6', '-1', '12', '2', '-1', '1', '-1', '3', '-1', '2', '1', '-1', '3', '-1', '14', '1', '14', '13', '3', '5', '-1', '18', '1', '2', '27', '4');
INSERT INTO `ssc_b` VALUES ('280', '279', '5', '14', '4', '2', '8', '19', '7', '1', '13', '-1', '-1', '2', '-1', '4', '1', '-1', '-1', '1', '4', '-1', '15', '2', '15', '14', '-1', '6', '1', '19', '2', '3', '28', '5');
INSERT INTO `ssc_b` VALUES ('281', '280', '6', '15', '5', '3', '9', '20', '8', '2', '-1', '1', '-1', '3', '1', '-1', '2', '-1', '1', '2', '-1', '1', '16', '-1', '16', '-1', '1', '7', '2', '20', '3', '4', '29', '6');
INSERT INTO `ssc_b` VALUES ('282', '281', '7', '16', '6', '4', '10', '21', '9', '-1', '1', '2', '-1', '4', '-1', '1', '-1', '1', '2', '-1', '1', '2', '17', '-1', '17', '-1', '2', '8', '3', '21', '4', '5', '30', '7');
INSERT INTO `ssc_b` VALUES ('283', '282', '8', '17', '7', '5', '11', '22', '10', '1', '2', '-1', '-1', '5', '-1', '2', '1', '-1', '-1', '1', '2', '-1', '18', '1', '18', '1', '-1', '9', '4', '22', '5', '6', '31', '8');
INSERT INTO `ssc_b` VALUES ('284', '283', '9', '18', '8', '6', '12', '23', '11', '-1', '3', '1', '-1', '6', '-1', '3', '-1', '1', '1', '-1', '3', '1', '19', '-1', '19', '2', '-1', '10', '5', '23', '6', '7', '32', '9');
INSERT INTO `ssc_b` VALUES ('285', '284', '10', '19', '9', '7', '13', '-1', '12', '1', '4', '2', '-1', '7', '-1', '4', '-1', '2', '2', '1', '-1', '2', '20', '-1', '20', '3', '-1', '11', '6', '24', '7', '8', '33', '10');
INSERT INTO `ssc_b` VALUES ('286', '285', '11', '20', '10', '-1', '14', '1', '13', '2', '5', '3', '1', '-1', '-1', '5', '-1', '3', '-1', '2', '1', '3', '21', '-1', '21', '4', '-1', '12', '7', '25', '8', '9', '34', '11');
INSERT INTO `ssc_b` VALUES ('287', '286', '12', '-1', '11', '1', '15', '2', '14', '3', '6', '4', '2', '-1', '-1', '6', '-1', '4', '1', '-1', '2', '4', '22', '-1', '22', '5', '-1', '13', '8', '26', '9', '10', '35', '12');
INSERT INTO `ssc_b` VALUES ('288', '287', '13', '1', '12', '2', '16', '3', '15', '4', '7', '-1', '-1', '1', '-1', '7', '1', '-1', '-1', '1', '3', '-1', '23', '1', '23', '6', '1', '14', '9', '27', '10', '11', '-1', '13');
INSERT INTO `ssc_b` VALUES ('289', '288', '14', '2', '13', '3', '-1', '4', '16', '5', '8', '1', '1', '-1', '1', '-1', '2', '-1', '1', '-1', '4', '1', '24', '-1', '24', '7', '2', '15', '10', '-1', '11', '12', '1', '14');
INSERT INTO `ssc_b` VALUES ('290', '289', '15', '3', '-1', '4', '1', '5', '17', '6', '9', '2', '2', '-1', '2', '-1', '-1', '1', '2', '1', '-1', '2', '25', '-1', '25', '8', '-1', '16', '11', '1', '12', '13', '2', '15');
INSERT INTO `ssc_b` VALUES ('291', '290', '16', '4', '1', '5', '-1', '6', '18', '7', '10', '3', '3', '-1', '3', '-1', '1', '-1', '3', '-1', '1', '-1', '26', '1', '26', '9', '-1', '17', '12', '2', '13', '14', '3', '16');
INSERT INTO `ssc_b` VALUES ('292', '291', '17', '5', '-1', '6', '1', '7', '19', '8', '11', '4', '4', '-1', '4', '-1', '-1', '1', '4', '1', '-1', '1', '27', '-1', '27', '10', '-1', '18', '13', '3', '14', '15', '4', '17');
INSERT INTO `ssc_b` VALUES ('293', '292', '18', '6', '1', '7', '2', '8', '20', '9', '-1', '5', '-1', '1', '5', '-1', '1', '-1', '5', '2', '-1', '-1', '28', '1', '28', '11', '1', '19', '14', '4', '-1', '16', '5', '18');
INSERT INTO `ssc_b` VALUES ('294', '293', '19', '7', '2', '8', '3', '9', '21', '-1', '1', '6', '-1', '2', '-1', '1', '-1', '1', '6', '-1', '1', '1', '29', '-1', '29', '-1', '2', '20', '15', '5', '1', '17', '6', '19');
INSERT INTO `ssc_b` VALUES ('295', '294', '20', '-1', '3', '9', '4', '10', '22', '1', '2', '7', '1', '-1', '-1', '2', '-1', '2', '7', '-1', '2', '2', '30', '-1', '30', '1', '3', '21', '16', '6', '-1', '18', '7', '20');
INSERT INTO `ssc_b` VALUES ('296', '295', '21', '1', '4', '10', '-1', '11', '23', '2', '3', '8', '2', '-1', '1', '-1', '1', '-1', '8', '-1', '3', '-1', '31', '1', '31', '2', '4', '-1', '17', '7', '1', '19', '8', '21');
INSERT INTO `ssc_b` VALUES ('297', '296', '22', '2', '5', '11', '1', '-1', '24', '3', '4', '9', '-1', '1', '-1', '1', '-1', '1', '9', '1', '-1', '-1', '32', '2', '32', '-1', '5', '1', '18', '8', '2', '20', '9', '22');
INSERT INTO `ssc_b` VALUES ('298', '297', '23', '3', '6', '12', '-1', '1', '25', '4', '5', '10', '1', '-1', '1', '-1', '1', '-1', '10', '-1', '1', '1', '33', '-1', '33', '-1', '6', '2', '19', '9', '3', '21', '10', '23');
INSERT INTO `ssc_b` VALUES ('299', '298', '24', '4', '7', '13', '1', '2', '26', '5', '6', '-1', '-1', '1', '-1', '1', '2', '-1', '-1', '1', '2', '-1', '34', '1', '34', '1', '7', '3', '20', '-1', '4', '22', '11', '24');
INSERT INTO `ssc_b` VALUES ('300', '299', '25', '5', '8', '14', '2', '3', '-1', '6', '7', '1', '-1', '2', '1', '-1', '3', '-1', '-1', '2', '3', '1', '35', '-1', '35', '2', '8', '-1', '21', '1', '5', '23', '12', '25');
INSERT INTO `ssc_b` VALUES ('301', '300', '26', '-1', '9', '15', '3', '4', '1', '7', '8', '2', '1', '-1', '-1', '1', '-1', '1', '1', '-1', '4', '2', '36', '-1', '36', '3', '9', '1', '22', '-1', '6', '24', '13', '26');
INSERT INTO `ssc_b` VALUES ('302', '301', '27', '1', '10', '16', '4', '-1', '2', '8', '9', '3', '-1', '1', '-1', '2', '-1', '2', '2', '1', '-1', '-1', '37', '1', '37', '4', '10', '2', '-1', '1', '7', '25', '14', '27');
INSERT INTO `ssc_b` VALUES ('303', '302', '28', '2', '11', '17', '5', '1', '3', '9', '10', '-1', '-1', '2', '-1', '3', '1', '-1', '-1', '2', '1', '-1', '38', '2', '38', '5', '11', '3', '-1', '2', '8', '26', '15', '28');
INSERT INTO `ssc_b` VALUES ('304', '303', '29', '3', '12', '18', '6', '-1', '4', '10', '11', '1', '-1', '3', '-1', '4', '-1', '1', '1', '3', '-1', '1', '39', '-1', '39', '6', '12', '4', '-1', '3', '9', '27', '16', '29');
INSERT INTO `ssc_b` VALUES ('305', '304', '30', '4', '13', '19', '7', '1', '5', '11', '12', '-1', '-1', '4', '-1', '5', '1', '-1', '-1', '4', '1', '-1', '40', '1', '40', '7', '13', '5', '-1', '4', '10', '28', '17', '30');
INSERT INTO `ssc_b` VALUES ('306', '305', '31', '5', '-1', '20', '8', '2', '6', '12', '13', '1', '1', '-1', '1', '-1', '-1', '1', '1', '5', '-1', '1', '41', '-1', '41', '8', '14', '6', '1', '5', '11', '-1', '18', '31');
INSERT INTO `ssc_b` VALUES ('307', '306', '32', '6', '-1', '21', '9', '3', '7', '13', '14', '2', '2', '-1', '2', '-1', '-1', '2', '2', '6', '-1', '2', '-1', '1', '-1', '9', '15', '7', '2', '6', '12', '1', '19', '32');
INSERT INTO `ssc_b` VALUES ('308', '307', '33', '7', '1', '22', '10', '-1', '8', '14', '15', '3', '-1', '1', '-1', '1', '-1', '3', '3', '7', '-1', '-1', '1', '2', '1', '10', '16', '-1', '3', '7', '13', '2', '20', '33');
INSERT INTO `ssc_b` VALUES ('309', '308', '34', '8', '2', '23', '11', '1', '-1', '15', '16', '4', '-1', '2', '1', '-1', '1', '-1', '-1', '8', '1', '-1', '2', '3', '2', '-1', '17', '1', '4', '8', '14', '3', '21', '34');
INSERT INTO `ssc_b` VALUES ('310', '309', '35', '-1', '3', '24', '12', '2', '1', '16', '17', '5', '1', '-1', '-1', '1', '-1', '1', '1', '-1', '2', '1', '3', '-1', '3', '1', '18', '2', '5', '-1', '15', '4', '22', '35');

-- ----------------------------
-- Table structure for `ssc_c`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_c`;
CREATE TABLE `ssc_c` (
  `id` int(11) NOT NULL auto_increment,
  `sscid` int(11) NOT NULL,
  `n0` int(3) NOT NULL,
  `n1` int(3) NOT NULL,
  `n2` int(3) NOT NULL,
  `n3` int(3) NOT NULL,
  `n4` int(3) NOT NULL,
  `n5` int(3) NOT NULL,
  `n6` int(3) NOT NULL,
  `n7` int(3) NOT NULL,
  `n8` int(3) NOT NULL,
  `n9` int(3) NOT NULL,
  `da` int(3) NOT NULL,
  `xiao` int(3) NOT NULL,
  `ji` int(3) NOT NULL,
  `ou` int(3) NOT NULL,
  `zhi` int(3) NOT NULL,
  `he` int(3) NOT NULL,
  `lu0` int(3) NOT NULL,
  `lu1` int(3) NOT NULL,
  `lu2` int(3) NOT NULL,
  `sheng` int(3) NOT NULL,
  `ping` int(3) NOT NULL,
  `jiang` int(3) NOT NULL,
  `z0` int(3) NOT NULL,
  `z1` int(3) NOT NULL,
  `z2` int(3) NOT NULL,
  `z3` int(3) NOT NULL,
  `z4` int(3) NOT NULL,
  `z5` int(3) NOT NULL,
  `z6` int(3) NOT NULL,
  `z7` int(3) NOT NULL,
  `z8` int(3) NOT NULL,
  `z9` int(3) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssc_c
-- ----------------------------
INSERT INTO `ssc_c` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1', '-1', '1', '1', '-1', '1', '-1', '1', '-1', '1', '1', '-1', '1', '-1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '-1', '1', '1');
INSERT INTO `ssc_c` VALUES ('2', '2', '-1', '2', '2', '2', '2', '2', '2', '1', '2', '2', '1', '-1', '1', '-1', '1', '-1', '-1', '1', '2', '1', '2', '-1', '2', '2', '2', '2', '2', '2', '2', '-1', '2', '2');
INSERT INTO `ssc_c` VALUES ('3', '3', '1', '-1', '3', '3', '3', '3', '3', '2', '3', '3', '2', '-1', '-1', '1', '-1', '1', '1', '-1', '3', '-1', '3', '1', '3', '-1', '3', '3', '3', '3', '3', '1', '3', '3');
INSERT INTO `ssc_c` VALUES ('4', '4', '2', '1', '4', '4', '4', '4', '4', '3', '4', '-1', '-1', '1', '-1', '2', '1', '-1', '-1', '1', '4', '-1', '4', '2', '4', '1', '4', '4', '4', '4', '4', '2', '-1', '4');
INSERT INTO `ssc_c` VALUES ('5', '5', '3', '2', '5', '-1', '5', '5', '5', '4', '5', '1', '1', '-1', '-1', '3', '-1', '1', '-1', '2', '5', '1', '5', '-1', '5', '2', '5', '5', '5', '5', '-1', '3', '1', '5');
INSERT INTO `ssc_c` VALUES ('6', '6', '4', '3', '6', '1', '6', '6', '6', '-1', '6', '2', '-1', '1', '-1', '4', '-1', '2', '1', '-1', '6', '-1', '6', '1', '6', '3', '6', '6', '-1', '6', '1', '4', '2', '6');
INSERT INTO `ssc_c` VALUES ('7', '7', '5', '4', '7', '2', '7', '7', '7', '1', '-1', '3', '-1', '2', '1', '-1', '1', '-1', '2', '1', '-1', '-1', '7', '2', '7', '-1', '7', '7', '1', '7', '2', '5', '3', '7');
INSERT INTO `ssc_c` VALUES ('8', '8', '6', '5', '8', '3', '-1', '8', '8', '2', '1', '4', '1', '-1', '2', '-1', '2', '-1', '3', '-1', '1', '1', '8', '-1', '8', '1', '8', '8', '-1', '8', '3', '6', '4', '8');
INSERT INTO `ssc_c` VALUES ('9', '9', '7', '6', '9', '4', '-1', '9', '9', '3', '2', '5', '2', '-1', '3', '-1', '3', '-1', '4', '-1', '2', '2', '-1', '1', '-1', '2', '9', '9', '1', '9', '4', '7', '5', '9');
INSERT INTO `ssc_c` VALUES ('10', '10', '8', '-1', '10', '5', '1', '10', '10', '4', '3', '6', '3', '-1', '-1', '1', '-1', '1', '5', '-1', '3', '3', '1', '-1', '1', '3', '10', '-1', '2', '10', '5', '8', '6', '10');
INSERT INTO `ssc_c` VALUES ('11', '11', '-1', '1', '11', '6', '2', '11', '11', '5', '4', '7', '4', '-1', '1', '-1', '1', '-1', '-1', '1', '4', '4', '2', '-1', '2', '-1', '11', '1', '3', '11', '6', '9', '7', '11');
INSERT INTO `ssc_c` VALUES ('12', '12', '1', '2', '12', '7', '3', '12', '12', '6', '-1', '8', '-1', '1', '2', '-1', '2', '-1', '1', '2', '-1', '-1', '3', '1', '3', '1', '12', '2', '4', '12', '7', '10', '-1', '12');
INSERT INTO `ssc_c` VALUES ('13', '13', '2', '3', '13', '8', '4', '13', '13', '-1', '1', '9', '-1', '2', '-1', '1', '-1', '1', '2', '-1', '1', '1', '4', '-1', '4', '-1', '13', '3', '5', '13', '8', '11', '1', '13');
INSERT INTO `ssc_c` VALUES ('14', '14', '3', '4', '14', '9', '5', '14', '14', '1', '2', '-1', '-1', '3', '-1', '2', '1', '-1', '-1', '1', '2', '-1', '5', '1', '5', '1', '-1', '4', '6', '14', '9', '12', '2', '14');
INSERT INTO `ssc_c` VALUES ('15', '15', '4', '5', '15', '10', '-1', '15', '15', '2', '3', '1', '1', '-1', '1', '-1', '2', '-1', '1', '-1', '3', '1', '6', '-1', '6', '2', '1', '5', '7', '-1', '10', '13', '3', '15');
INSERT INTO `ssc_c` VALUES ('16', '16', '5', '6', '16', '11', '1', '16', '16', '3', '-1', '2', '-1', '1', '2', '-1', '3', '-1', '2', '1', '-1', '-1', '7', '1', '7', '3', '2', '6', '-1', '1', '11', '14', '4', '16');
INSERT INTO `ssc_c` VALUES ('17', '17', '6', '7', '17', '12', '2', '17', '17', '4', '1', '-1', '-1', '2', '-1', '1', '4', '-1', '-1', '2', '1', '-1', '8', '2', '8', '-1', '3', '7', '1', '2', '12', '15', '5', '17');
INSERT INTO `ssc_c` VALUES ('18', '18', '7', '8', '18', '13', '3', '18', '18', '-1', '2', '1', '-1', '3', '-1', '2', '-1', '1', '1', '-1', '2', '1', '9', '-1', '9', '1', '-1', '8', '2', '3', '13', '16', '6', '18');
INSERT INTO `ssc_c` VALUES ('19', '19', '8', '9', '19', '14', '4', '19', '-1', '1', '3', '2', '-1', '4', '1', '-1', '1', '-1', '-1', '1', '3', '2', '10', '-1', '10', '-1', '1', '9', '3', '4', '14', '17', '7', '19');
INSERT INTO `ssc_c` VALUES ('20', '20', '-1', '10', '20', '15', '5', '20', '1', '2', '4', '3', '1', '-1', '2', '-1', '2', '-1', '-1', '2', '4', '3', '11', '-1', '11', '1', '2', '10', '4', '5', '-1', '18', '8', '20');
INSERT INTO `ssc_c` VALUES ('21', '21', '-1', '11', '21', '16', '6', '21', '2', '3', '5', '4', '2', '-1', '3', '-1', '3', '-1', '-1', '3', '5', '4', '-1', '1', '-1', '2', '3', '11', '5', '6', '1', '19', '9', '21');
INSERT INTO `ssc_c` VALUES ('22', '22', '1', '12', '-1', '17', '7', '22', '3', '4', '6', '5', '3', '-1', '4', '-1', '-1', '1', '1', '4', '-1', '-1', '1', '2', '1', '3', '-1', '12', '6', '7', '2', '20', '10', '22');
INSERT INTO `ssc_c` VALUES ('23', '23', '2', '-1', '1', '18', '8', '23', '4', '5', '7', '6', '4', '-1', '-1', '1', '-1', '2', '2', '-1', '1', '1', '2', '-1', '2', '-1', '1', '13', '7', '8', '3', '21', '11', '23');
INSERT INTO `ssc_c` VALUES ('24', '24', '3', '1', '2', '19', '9', '24', '5', '6', '8', '-1', '-1', '1', '-1', '2', '1', '-1', '-1', '1', '2', '-1', '3', '1', '3', '1', '2', '14', '8', '9', '4', '22', '-1', '24');
INSERT INTO `ssc_c` VALUES ('25', '25', '4', '2', '3', '20', '-1', '25', '6', '7', '9', '1', '1', '-1', '1', '-1', '2', '-1', '1', '-1', '3', '1', '4', '-1', '4', '2', '3', '15', '9', '-1', '5', '23', '1', '25');
INSERT INTO `ssc_c` VALUES ('26', '26', '5', '3', '4', '21', '1', '26', '7', '8', '-1', '2', '-1', '1', '2', '-1', '3', '-1', '2', '1', '-1', '-1', '5', '1', '5', '3', '4', '16', '-1', '1', '6', '24', '2', '26');
INSERT INTO `ssc_c` VALUES ('27', '27', '6', '4', '5', '22', '2', '27', '8', '9', '1', '-1', '-1', '2', '-1', '1', '4', '-1', '-1', '2', '1', '-1', '6', '2', '6', '-1', '5', '17', '1', '2', '7', '25', '3', '27');
INSERT INTO `ssc_c` VALUES ('28', '28', '7', '5', '6', '23', '3', '28', '-1', '10', '2', '1', '-1', '3', '1', '-1', '5', '-1', '-1', '3', '2', '1', '7', '-1', '7', '1', '6', '-1', '2', '3', '8', '26', '4', '28');
INSERT INTO `ssc_c` VALUES ('29', '29', '8', '6', '7', '24', '4', '29', '1', '11', '3', '-1', '-1', '4', '-1', '1', '6', '-1', '-1', '4', '3', '-1', '8', '1', '8', '2', '7', '-1', '3', '4', '9', '27', '5', '29');
INSERT INTO `ssc_c` VALUES ('30', '30', '9', '7', '8', '25', '5', '-1', '2', '12', '4', '1', '-1', '5', '-1', '2', '-1', '1', '1', '5', '-1', '1', '9', '-1', '9', '3', '8', '1', '-1', '5', '10', '28', '6', '30');
INSERT INTO `ssc_c` VALUES ('31', '31', '10', '8', '9', '-1', '6', '1', '3', '13', '5', '2', '1', '-1', '-1', '3', '-1', '2', '-1', '6', '1', '2', '10', '-1', '10', '4', '-1', '2', '1', '6', '11', '29', '7', '31');
INSERT INTO `ssc_c` VALUES ('32', '32', '11', '9', '10', '1', '7', '2', '4', '14', '-1', '3', '-1', '1', '1', '-1', '1', '-1', '1', '7', '-1', '-1', '11', '1', '11', '5', '1', '3', '2', '-1', '12', '30', '8', '32');
INSERT INTO `ssc_c` VALUES ('33', '33', '12', '10', '11', '2', '8', '3', '-1', '15', '1', '4', '-1', '2', '2', '-1', '2', '-1', '-1', '8', '1', '1', '12', '-1', '12', '6', '-1', '4', '3', '1', '13', '31', '9', '33');
INSERT INTO `ssc_c` VALUES ('34', '34', '13', '-1', '12', '3', '9', '4', '1', '16', '2', '5', '1', '-1', '-1', '1', '-1', '1', '1', '-1', '2', '2', '13', '-1', '13', '7', '1', '5', '4', '-1', '14', '32', '10', '34');
INSERT INTO `ssc_c` VALUES ('35', '35', '-1', '1', '13', '4', '10', '5', '2', '17', '3', '6', '2', '-1', '1', '-1', '1', '-1', '-1', '1', '3', '3', '14', '-1', '14', '-1', '2', '6', '5', '1', '15', '33', '11', '35');
INSERT INTO `ssc_c` VALUES ('36', '36', '1', '2', '14', '5', '11', '6', '3', '18', '4', '-1', '-1', '1', '-1', '1', '2', '-1', '-1', '2', '4', '-1', '15', '1', '15', '1', '3', '7', '6', '2', '16', '34', '12', '-1');
INSERT INTO `ssc_c` VALUES ('37', '37', '2', '3', '15', '6', '-1', '7', '4', '19', '5', '1', '1', '-1', '1', '-1', '3', '-1', '1', '-1', '5', '1', '16', '-1', '16', '2', '4', '8', '7', '-1', '17', '35', '13', '1');
INSERT INTO `ssc_c` VALUES ('38', '38', '3', '4', '16', '7', '1', '8', '5', '20', '6', '-1', '-1', '1', '-1', '1', '4', '-1', '-1', '1', '6', '-1', '17', '1', '17', '3', '5', '9', '8', '-1', '18', '36', '14', '2');
INSERT INTO `ssc_c` VALUES ('39', '39', '4', '5', '17', '8', '2', '-1', '6', '21', '7', '1', '-1', '2', '-1', '2', '-1', '1', '1', '2', '-1', '1', '18', '-1', '18', '4', '6', '10', '-1', '1', '19', '37', '15', '3');
INSERT INTO `ssc_c` VALUES ('40', '40', '5', '-1', '18', '9', '3', '1', '7', '22', '8', '2', '1', '-1', '-1', '3', '-1', '2', '2', '-1', '1', '2', '19', '-1', '19', '5', '7', '11', '-1', '2', '20', '38', '16', '4');
INSERT INTO `ssc_c` VALUES ('41', '41', '6', '1', '19', '10', '4', '2', '8', '23', '9', '-1', '-1', '1', '-1', '4', '1', '-1', '-1', '1', '2', '-1', '20', '1', '20', '6', '8', '12', '1', '3', '21', '39', '-1', '5');
INSERT INTO `ssc_c` VALUES ('42', '42', '-1', '2', '20', '11', '5', '3', '9', '24', '10', '1', '1', '-1', '1', '-1', '2', '-1', '-1', '2', '3', '1', '21', '-1', '21', '7', '9', '13', '2', '4', '22', '40', '1', '-1');
INSERT INTO `ssc_c` VALUES ('43', '43', '1', '-1', '21', '12', '6', '4', '10', '25', '11', '2', '2', '-1', '-1', '1', '-1', '1', '1', '-1', '4', '-1', '22', '1', '22', '-1', '10', '14', '3', '5', '23', '41', '2', '1');
INSERT INTO `ssc_c` VALUES ('44', '44', '2', '-1', '22', '13', '7', '5', '11', '26', '12', '3', '3', '-1', '-1', '2', '-1', '2', '2', '-1', '5', '1', '-1', '2', '-1', '1', '11', '15', '4', '6', '24', '42', '3', '2');
INSERT INTO `ssc_c` VALUES ('45', '45', '-1', '1', '23', '14', '8', '6', '12', '27', '13', '4', '4', '-1', '1', '-1', '1', '-1', '-1', '1', '6', '2', '1', '-1', '1', '-1', '12', '16', '5', '7', '25', '43', '4', '3');
INSERT INTO `ssc_c` VALUES ('46', '46', '-1', '2', '24', '15', '9', '7', '13', '28', '14', '5', '5', '-1', '2', '-1', '2', '-1', '-1', '2', '7', '3', '-1', '1', '-1', '1', '13', '17', '6', '8', '26', '44', '5', '4');
INSERT INTO `ssc_c` VALUES ('47', '47', '1', '-1', '25', '16', '10', '8', '14', '29', '15', '6', '6', '-1', '-1', '1', '-1', '1', '1', '-1', '8', '-1', '1', '2', '1', '-1', '14', '18', '7', '9', '27', '45', '6', '5');
INSERT INTO `ssc_c` VALUES ('48', '48', '2', '1', '26', '-1', '11', '9', '15', '30', '16', '7', '7', '-1', '-1', '2', '-1', '2', '-1', '1', '9', '-1', '2', '3', '2', '1', '-1', '19', '8', '10', '28', '46', '7', '6');
INSERT INTO `ssc_c` VALUES ('49', '49', '3', '2', '-1', '1', '12', '10', '16', '31', '17', '8', '8', '-1', '1', '-1', '-1', '3', '1', '2', '-1', '1', '3', '-1', '3', '-1', '1', '20', '9', '11', '29', '47', '8', '7');
INSERT INTO `ssc_c` VALUES ('50', '50', '4', '3', '1', '2', '13', '-1', '17', '32', '18', '9', '-1', '1', '-1', '1', '-1', '4', '2', '3', '-1', '-1', '4', '1', '4', '1', '2', '-1', '10', '12', '30', '48', '9', '8');
INSERT INTO `ssc_c` VALUES ('51', '51', '5', '4', '2', '3', '14', '1', '18', '33', '-1', '10', '-1', '2', '1', '-1', '1', '-1', '3', '4', '-1', '-1', '5', '2', '5', '2', '3', '-1', '11', '13', '31', '49', '10', '9');
INSERT INTO `ssc_c` VALUES ('52', '52', '6', '5', '3', '4', '15', '2', '19', '34', '1', '-1', '-1', '3', '-1', '1', '2', '-1', '-1', '5', '1', '-1', '6', '3', '6', '-1', '4', '1', '12', '14', '32', '50', '11', '10');
INSERT INTO `ssc_c` VALUES ('53', '53', '7', '6', '-1', '5', '16', '3', '20', '35', '2', '1', '1', '-1', '1', '-1', '-1', '1', '1', '6', '-1', '1', '7', '-1', '7', '1', '5', '2', '13', '15', '33', '-1', '12', '11');
INSERT INTO `ssc_c` VALUES ('54', '54', '8', '7', '1', '-1', '17', '4', '21', '36', '3', '2', '2', '-1', '-1', '1', '-1', '2', '-1', '7', '1', '-1', '8', '1', '8', '-1', '6', '3', '14', '16', '34', '1', '13', '12');
INSERT INTO `ssc_c` VALUES ('55', '55', '9', '-1', '2', '1', '18', '5', '22', '37', '4', '3', '3', '-1', '-1', '2', '-1', '3', '1', '-1', '2', '1', '9', '-1', '9', '1', '-1', '4', '15', '17', '35', '2', '14', '13');
INSERT INTO `ssc_c` VALUES ('56', '56', '10', '1', '3', '2', '19', '-1', '23', '38', '5', '4', '-1', '1', '-1', '3', '-1', '4', '2', '1', '-1', '-1', '10', '1', '10', '2', '1', '5', '-1', '18', '36', '3', '15', '14');
INSERT INTO `ssc_c` VALUES ('57', '57', '11', '2', '4', '-1', '20', '1', '24', '39', '6', '5', '1', '-1', '-1', '4', '-1', '5', '-1', '2', '1', '1', '11', '-1', '11', '3', '-1', '6', '1', '19', '37', '4', '16', '15');
INSERT INTO `ssc_c` VALUES ('58', '58', '12', '3', '5', '1', '21', '-1', '25', '40', '7', '6', '-1', '1', '-1', '5', '-1', '6', '1', '3', '-1', '-1', '12', '1', '12', '4', '-1', '7', '2', '20', '38', '5', '17', '16');
INSERT INTO `ssc_c` VALUES ('59', '59', '13', '4', '6', '2', '-1', '1', '26', '41', '8', '7', '1', '-1', '1', '-1', '1', '-1', '2', '-1', '1', '1', '13', '-1', '13', '-1', '1', '8', '3', '21', '39', '6', '18', '17');
INSERT INTO `ssc_c` VALUES ('60', '60', '14', '5', '7', '3', '1', '2', '27', '-1', '9', '8', '-1', '1', '-1', '1', '-1', '1', '3', '-1', '2', '-1', '14', '1', '14', '1', '2', '-1', '4', '22', '40', '7', '19', '18');
INSERT INTO `ssc_c` VALUES ('61', '61', '-1', '6', '8', '4', '2', '3', '28', '1', '10', '9', '1', '-1', '1', '-1', '1', '-1', '-1', '1', '3', '1', '15', '-1', '15', '2', '3', '1', '5', '23', '41', '-1', '20', '19');
INSERT INTO `ssc_c` VALUES ('62', '62', '1', '-1', '9', '5', '3', '4', '29', '2', '11', '10', '2', '-1', '-1', '1', '-1', '1', '1', '-1', '4', '-1', '16', '1', '16', '-1', '4', '2', '6', '24', '42', '1', '21', '20');
INSERT INTO `ssc_c` VALUES ('63', '63', '2', '1', '10', '-1', '4', '5', '30', '3', '12', '11', '3', '-1', '-1', '2', '-1', '2', '-1', '1', '5', '-1', '17', '2', '17', '1', '-1', '3', '7', '25', '43', '2', '22', '21');
INSERT INTO `ssc_c` VALUES ('64', '64', '3', '2', '11', '1', '5', '6', '-1', '4', '13', '12', '-1', '1', '1', '-1', '1', '-1', '-1', '2', '6', '-1', '18', '3', '18', '2', '1', '-1', '8', '26', '44', '3', '23', '22');
INSERT INTO `ssc_c` VALUES ('65', '65', '4', '3', '12', '2', '6', '-1', '1', '5', '14', '13', '-1', '2', '-1', '1', '-1', '1', '1', '3', '-1', '1', '19', '-1', '19', '-1', '2', '1', '9', '27', '45', '4', '24', '23');
INSERT INTO `ssc_c` VALUES ('66', '66', '5', '4', '13', '3', '-1', '1', '2', '6', '15', '14', '1', '-1', '1', '-1', '1', '-1', '2', '-1', '1', '2', '20', '-1', '20', '-1', '3', '2', '10', '28', '46', '5', '25', '24');
INSERT INTO `ssc_c` VALUES ('67', '67', '6', '-1', '14', '4', '1', '2', '3', '7', '16', '15', '2', '-1', '-1', '1', '-1', '1', '3', '-1', '2', '3', '21', '-1', '21', '1', '4', '-1', '11', '29', '47', '6', '26', '25');
INSERT INTO `ssc_c` VALUES ('68', '68', '7', '1', '15', '5', '2', '3', '4', '8', '17', '-1', '-1', '1', '-1', '2', '1', '-1', '-1', '1', '3', '-1', '22', '1', '22', '2', '5', '1', '12', '30', '48', '7', '-1', '26');
INSERT INTO `ssc_c` VALUES ('69', '69', '8', '2', '-1', '6', '3', '4', '5', '9', '18', '1', '1', '-1', '1', '-1', '-1', '1', '1', '2', '-1', '1', '23', '-1', '23', '3', '6', '2', '13', '31', '49', '-1', '1', '27');
INSERT INTO `ssc_c` VALUES ('70', '70', '-1', '3', '1', '7', '4', '5', '6', '10', '19', '2', '2', '-1', '2', '-1', '1', '-1', '-1', '3', '1', '2', '24', '-1', '24', '4', '-1', '3', '14', '32', '50', '1', '2', '28');
INSERT INTO `ssc_c` VALUES ('71', '71', '1', '4', '-1', '8', '5', '6', '7', '11', '20', '3', '3', '-1', '3', '-1', '-1', '1', '1', '4', '-1', '-1', '25', '1', '25', '5', '-1', '4', '15', '33', '51', '2', '3', '29');
INSERT INTO `ssc_c` VALUES ('72', '72', '-1', '5', '1', '9', '6', '7', '8', '12', '21', '4', '4', '-1', '4', '-1', '1', '-1', '-1', '5', '1', '1', '26', '-1', '26', '6', '-1', '5', '16', '34', '52', '3', '4', '30');
INSERT INTO `ssc_c` VALUES ('73', '73', '-1', '6', '2', '10', '7', '8', '9', '13', '22', '5', '5', '-1', '5', '-1', '2', '-1', '-1', '6', '2', '2', '-1', '1', '-1', '7', '1', '6', '17', '35', '53', '4', '5', '31');
INSERT INTO `ssc_c` VALUES ('74', '74', '1', '7', '3', '11', '8', '9', '-1', '14', '23', '6', '-1', '1', '6', '-1', '3', '-1', '-1', '7', '3', '-1', '1', '2', '1', '8', '2', '7', '18', '36', '-1', '5', '6', '32');
INSERT INTO `ssc_c` VALUES ('75', '75', '2', '8', '4', '12', '9', '10', '1', '-1', '24', '7', '-1', '2', '-1', '1', '-1', '1', '1', '-1', '4', '-1', '2', '3', '2', '-1', '3', '8', '19', '37', '1', '6', '7', '33');
INSERT INTO `ssc_c` VALUES ('76', '76', '3', '9', '-1', '13', '10', '11', '2', '1', '25', '8', '1', '-1', '1', '-1', '-1', '2', '2', '1', '-1', '1', '3', '-1', '3', '1', '4', '9', '20', '-1', '2', '7', '8', '34');
INSERT INTO `ssc_c` VALUES ('77', '77', '4', '10', '-1', '14', '11', '12', '3', '2', '26', '9', '2', '-1', '2', '-1', '-1', '3', '3', '2', '-1', '2', '-1', '1', '-1', '2', '5', '10', '21', '1', '3', '8', '9', '35');
INSERT INTO `ssc_c` VALUES ('78', '78', '5', '11', '1', '15', '12', '13', '4', '3', '-1', '10', '-1', '1', '3', '-1', '1', '-1', '4', '3', '-1', '-1', '1', '2', '1', '3', '6', '11', '22', '2', '-1', '9', '10', '36');
INSERT INTO `ssc_c` VALUES ('79', '79', '6', '12', '2', '16', '13', '14', '5', '4', '1', '-1', '-1', '2', '-1', '1', '2', '-1', '-1', '4', '1', '-1', '2', '3', '2', '-1', '7', '12', '23', '3', '1', '10', '11', '37');
INSERT INTO `ssc_c` VALUES ('80', '80', '7', '-1', '3', '17', '14', '15', '6', '5', '2', '1', '1', '-1', '-1', '2', '-1', '1', '1', '-1', '2', '1', '3', '-1', '3', '1', '8', '13', '24', '4', '2', '11', '-1', '38');
INSERT INTO `ssc_c` VALUES ('81', '81', '8', '1', '4', '18', '15', '16', '7', '-1', '3', '2', '-1', '1', '-1', '3', '-1', '2', '2', '-1', '3', '-1', '4', '1', '4', '2', '9', '14', '25', '5', '-1', '12', '1', '39');
INSERT INTO `ssc_c` VALUES ('82', '82', '9', '2', '5', '19', '16', '17', '8', '1', '-1', '3', '-1', '2', '1', '-1', '1', '-1', '3', '1', '-1', '-1', '5', '2', '5', '-1', '10', '15', '26', '6', '1', '13', '2', '40');
INSERT INTO `ssc_c` VALUES ('83', '83', '10', '3', '6', '20', '17', '18', '-1', '2', '1', '4', '-1', '3', '2', '-1', '2', '-1', '-1', '2', '1', '1', '6', '-1', '6', '1', '-1', '16', '27', '7', '2', '14', '3', '41');
INSERT INTO `ssc_c` VALUES ('84', '84', '11', '4', '-1', '21', '18', '19', '1', '3', '2', '5', '1', '-1', '3', '-1', '-1', '1', '1', '3', '-1', '2', '7', '-1', '7', '2', '1', '17', '-1', '8', '3', '15', '4', '42');
INSERT INTO `ssc_c` VALUES ('85', '85', '12', '5', '1', '-1', '19', '20', '2', '4', '3', '6', '2', '-1', '-1', '1', '-1', '2', '-1', '4', '1', '-1', '8', '1', '8', '-1', '2', '18', '1', '9', '4', '16', '5', '43');
INSERT INTO `ssc_c` VALUES ('86', '86', '13', '6', '2', '1', '20', '21', '3', '-1', '4', '7', '-1', '1', '-1', '2', '-1', '3', '1', '-1', '2', '-1', '9', '2', '9', '1', '3', '19', '-1', '10', '5', '17', '6', '44');
INSERT INTO `ssc_c` VALUES ('87', '87', '14', '-1', '3', '2', '21', '22', '4', '1', '5', '8', '1', '-1', '-1', '3', '-1', '4', '2', '-1', '3', '1', '10', '-1', '10', '2', '4', '20', '1', '11', '-1', '18', '7', '45');
INSERT INTO `ssc_c` VALUES ('88', '88', '15', '1', '4', '3', '22', '23', '5', '2', '-1', '9', '-1', '1', '1', '-1', '1', '-1', '3', '1', '-1', '-1', '11', '1', '11', '3', '5', '21', '2', '12', '1', '-1', '8', '46');
INSERT INTO `ssc_c` VALUES ('89', '89', '16', '2', '5', '4', '23', '-1', '6', '3', '1', '10', '-1', '2', '-1', '1', '-1', '1', '4', '2', '-1', '1', '12', '-1', '12', '4', '6', '-1', '3', '13', '2', '1', '9', '47');
INSERT INTO `ssc_c` VALUES ('90', '90', '17', '3', '6', '5', '24', '1', '-1', '4', '2', '11', '-1', '3', '1', '-1', '1', '-1', '-1', '3', '1', '-1', '13', '1', '13', '-1', '7', '1', '4', '14', '3', '2', '10', '48');
INSERT INTO `ssc_c` VALUES ('91', '91', '18', '4', '-1', '6', '25', '2', '1', '5', '3', '12', '1', '-1', '2', '-1', '-1', '1', '1', '4', '-1', '1', '14', '-1', '14', '1', '8', '2', '-1', '15', '4', '3', '11', '49');
INSERT INTO `ssc_c` VALUES ('92', '92', '19', '5', '1', '7', '-1', '3', '2', '6', '4', '13', '2', '-1', '3', '-1', '1', '-1', '2', '-1', '1', '-1', '15', '1', '15', '2', '-1', '3', '1', '16', '5', '4', '12', '50');
INSERT INTO `ssc_c` VALUES ('93', '93', '20', '6', '2', '-1', '1', '4', '3', '7', '5', '14', '3', '-1', '-1', '1', '-1', '1', '-1', '1', '2', '1', '16', '-1', '16', '-1', '1', '4', '2', '17', '6', '5', '13', '51');
INSERT INTO `ssc_c` VALUES ('94', '94', '21', '7', '-1', '1', '2', '5', '4', '8', '6', '15', '4', '-1', '1', '-1', '-1', '2', '1', '2', '-1', '2', '17', '-1', '17', '-1', '2', '5', '3', '18', '7', '6', '14', '52');
INSERT INTO `ssc_c` VALUES ('95', '95', '22', '-1', '1', '2', '3', '6', '5', '9', '7', '16', '5', '-1', '-1', '1', '-1', '3', '2', '-1', '1', '3', '18', '-1', '18', '-1', '3', '6', '4', '19', '8', '7', '15', '53');
INSERT INTO `ssc_c` VALUES ('96', '96', '23', '1', '-1', '3', '4', '7', '6', '10', '8', '17', '6', '-1', '1', '-1', '-1', '4', '3', '1', '-1', '-1', '19', '1', '19', '-1', '4', '7', '5', '20', '9', '8', '16', '54');
INSERT INTO `ssc_c` VALUES ('97', '97', '24', '2', '1', '4', '-1', '8', '7', '11', '9', '18', '7', '-1', '2', '-1', '1', '-1', '4', '-1', '1', '-1', '20', '2', '20', '1', '-1', '8', '6', '21', '10', '9', '17', '55');
INSERT INTO `ssc_c` VALUES ('98', '98', '25', '3', '2', '5', '1', '9', '8', '12', '10', '-1', '-1', '1', '-1', '1', '2', '-1', '-1', '1', '2', '-1', '21', '3', '21', '2', '1', '9', '7', '-1', '11', '10', '18', '56');
INSERT INTO `ssc_c` VALUES ('99', '99', '-1', '4', '3', '6', '2', '10', '9', '13', '11', '1', '1', '-1', '1', '-1', '3', '-1', '-1', '2', '3', '1', '22', '-1', '22', '3', '2', '10', '8', '1', '12', '11', '19', '-1');
INSERT INTO `ssc_c` VALUES ('100', '100', '1', '5', '4', '7', '3', '11', '10', '14', '-1', '2', '-1', '1', '2', '-1', '4', '-1', '1', '3', '-1', '-1', '23', '1', '23', '4', '3', '11', '9', '2', '13', '12', '-1', '1');
INSERT INTO `ssc_c` VALUES ('101', '101', '-1', '6', '5', '8', '4', '12', '11', '15', '1', '3', '1', '-1', '3', '-1', '5', '-1', '-1', '4', '1', '1', '24', '-1', '24', '5', '4', '12', '10', '3', '14', '13', '-1', '2');
INSERT INTO `ssc_c` VALUES ('102', '102', '1', '7', '6', '9', '5', '13', '12', '16', '-1', '4', '-1', '1', '4', '-1', '6', '-1', '1', '5', '-1', '-1', '25', '1', '25', '6', '5', '13', '11', '4', '15', '14', '-1', '3');
INSERT INTO `ssc_c` VALUES ('103', '103', '2', '8', '7', '-1', '6', '14', '13', '17', '1', '5', '1', '-1', '-1', '1', '-1', '1', '-1', '6', '1', '1', '26', '-1', '26', '7', '6', '14', '12', '-1', '16', '15', '1', '4');
INSERT INTO `ssc_c` VALUES ('104', '104', '3', '-1', '8', '1', '7', '15', '14', '18', '2', '6', '2', '-1', '-1', '2', '-1', '2', '1', '-1', '2', '2', '27', '-1', '27', '8', '-1', '15', '13', '1', '17', '16', '2', '5');
INSERT INTO `ssc_c` VALUES ('105', '105', '4', '1', '9', '2', '8', '16', '15', '-1', '3', '7', '-1', '1', '-1', '3', '-1', '3', '2', '-1', '3', '-1', '28', '1', '28', '9', '1', '16', '14', '2', '-1', '17', '3', '6');
INSERT INTO `ssc_c` VALUES ('106', '106', '-1', '2', '10', '3', '9', '17', '16', '1', '4', '8', '1', '-1', '1', '-1', '1', '-1', '-1', '1', '4', '1', '29', '-1', '29', '10', '2', '17', '15', '3', '1', '-1', '4', '7');
INSERT INTO `ssc_c` VALUES ('107', '107', '1', '3', '11', '4', '-1', '18', '17', '2', '5', '9', '2', '-1', '2', '-1', '2', '-1', '1', '-1', '5', '-1', '30', '1', '30', '11', '3', '18', '-1', '4', '2', '1', '5', '8');
INSERT INTO `ssc_c` VALUES ('108', '108', '2', '4', '12', '5', '1', '19', '-1', '3', '6', '10', '-1', '1', '3', '-1', '3', '-1', '-1', '1', '6', '-1', '31', '2', '31', '12', '-1', '19', '1', '5', '3', '2', '6', '9');
INSERT INTO `ssc_c` VALUES ('109', '109', '3', '5', '13', '6', '2', '20', '1', '4', '-1', '11', '-1', '2', '4', '-1', '4', '-1', '1', '2', '-1', '-1', '32', '3', '32', '13', '-1', '20', '2', '6', '4', '3', '7', '10');
INSERT INTO `ssc_c` VALUES ('110', '110', '4', '6', '14', '7', '3', '21', '2', '5', '-1', '12', '-1', '3', '5', '-1', '5', '-1', '2', '3', '-1', '1', '-1', '4', '-1', '14', '1', '21', '3', '7', '5', '4', '8', '11');
INSERT INTO `ssc_c` VALUES ('111', '111', '5', '7', '15', '8', '4', '22', '3', '6', '-1', '13', '-1', '4', '6', '-1', '6', '-1', '3', '4', '-1', '2', '-1', '5', '-1', '15', '2', '22', '4', '8', '6', '5', '9', '12');
INSERT INTO `ssc_c` VALUES ('112', '112', '6', '8', '16', '9', '5', '23', '4', '7', '1', '-1', '-1', '5', '-1', '1', '7', '-1', '-1', '5', '1', '-1', '1', '6', '1', '-1', '3', '23', '5', '9', '7', '6', '10', '13');
INSERT INTO `ssc_c` VALUES ('113', '113', '7', '9', '17', '-1', '6', '24', '5', '8', '2', '1', '1', '-1', '-1', '2', '-1', '1', '-1', '6', '2', '1', '2', '-1', '2', '1', '4', '24', '6', '10', '-1', '7', '11', '14');
INSERT INTO `ssc_c` VALUES ('114', '114', '-1', '10', '18', '1', '7', '25', '6', '9', '3', '2', '2', '-1', '1', '-1', '1', '-1', '-1', '7', '3', '2', '3', '-1', '3', '2', '5', '-1', '7', '11', '1', '8', '12', '15');
INSERT INTO `ssc_c` VALUES ('115', '115', '1', '11', '19', '2', '8', '-1', '7', '10', '4', '3', '-1', '1', '-1', '1', '-1', '1', '1', '8', '-1', '-1', '4', '1', '4', '3', '6', '1', '8', '-1', '2', '9', '13', '16');
INSERT INTO `ssc_c` VALUES ('116', '116', '2', '12', '-1', '3', '9', '1', '8', '11', '5', '4', '1', '-1', '1', '-1', '-1', '2', '2', '9', '-1', '1', '5', '-1', '5', '4', '7', '-1', '9', '1', '3', '10', '14', '17');
INSERT INTO `ssc_c` VALUES ('117', '117', '-1', '13', '1', '4', '10', '2', '9', '12', '6', '5', '2', '-1', '2', '-1', '1', '-1', '-1', '10', '1', '2', '6', '-1', '6', '5', '-1', '1', '10', '2', '4', '11', '15', '18');
INSERT INTO `ssc_c` VALUES ('118', '118', '1', '14', '2', '5', '11', '3', '10', '13', '7', '-1', '-1', '1', '-1', '1', '2', '-1', '-1', '11', '2', '-1', '7', '1', '7', '6', '1', '2', '11', '3', '5', '12', '16', '-1');
INSERT INTO `ssc_c` VALUES ('119', '119', '2', '15', '3', '6', '12', '4', '-1', '14', '8', '1', '-1', '2', '1', '-1', '3', '-1', '-1', '12', '3', '1', '8', '-1', '8', '7', '2', '-1', '12', '4', '6', '13', '17', '1');
INSERT INTO `ssc_c` VALUES ('120', '120', '3', '16', '-1', '7', '13', '5', '1', '15', '9', '2', '1', '-1', '2', '-1', '-1', '1', '1', '13', '-1', '2', '9', '-1', '9', '8', '3', '1', '-1', '5', '7', '14', '18', '2');
INSERT INTO `ssc_c` VALUES ('121', '121', '4', '17', '1', '8', '14', '6', '-1', '16', '10', '3', '-1', '1', '3', '-1', '1', '-1', '-1', '14', '1', '-1', '10', '1', '10', '9', '4', '2', '-1', '6', '8', '15', '19', '3');
INSERT INTO `ssc_c` VALUES ('122', '122', '5', '18', '2', '9', '15', '7', '1', '17', '-1', '4', '-1', '2', '4', '-1', '2', '-1', '1', '15', '-1', '-1', '11', '2', '11', '10', '-1', '3', '1', '7', '9', '16', '20', '4');
INSERT INTO `ssc_c` VALUES ('123', '123', '6', '19', '3', '10', '16', '8', '2', '-1', '1', '5', '-1', '3', '-1', '1', '-1', '1', '2', '-1', '1', '1', '12', '-1', '12', '-1', '1', '4', '2', '8', '10', '17', '21', '5');
INSERT INTO `ssc_c` VALUES ('124', '124', '7', '20', '4', '11', '17', '9', '-1', '1', '2', '6', '-1', '4', '1', '-1', '1', '-1', '-1', '1', '2', '2', '13', '-1', '13', '-1', '2', '5', '3', '9', '11', '18', '22', '6');
INSERT INTO `ssc_c` VALUES ('125', '125', '8', '21', '5', '-1', '18', '10', '1', '2', '3', '7', '1', '-1', '-1', '1', '-1', '1', '-1', '2', '3', '3', '14', '-1', '14', '1', '3', '-1', '4', '10', '12', '19', '23', '7');
INSERT INTO `ssc_c` VALUES ('126', '126', '9', '22', '-1', '1', '19', '11', '2', '3', '4', '8', '2', '-1', '1', '-1', '-1', '2', '1', '3', '-1', '4', '15', '-1', '15', '-1', '4', '1', '5', '11', '13', '20', '24', '8');
INSERT INTO `ssc_c` VALUES ('127', '127', '10', '-1', '1', '2', '20', '12', '3', '4', '5', '9', '3', '-1', '-1', '1', '-1', '3', '2', '-1', '1', '5', '16', '-1', '16', '-1', '5', '2', '6', '12', '14', '21', '25', '9');
INSERT INTO `ssc_c` VALUES ('128', '128', '11', '1', '2', '-1', '21', '13', '4', '5', '6', '10', '4', '-1', '-1', '2', '-1', '4', '-1', '1', '2', '-1', '17', '1', '17', '1', '-1', '3', '7', '13', '15', '22', '26', '10');
INSERT INTO `ssc_c` VALUES ('129', '129', '12', '2', '3', '1', '-1', '14', '5', '6', '7', '11', '5', '-1', '1', '-1', '1', '-1', '1', '-1', '3', '-1', '18', '2', '18', '-1', '1', '4', '8', '14', '16', '23', '27', '11');
INSERT INTO `ssc_c` VALUES ('130', '130', '13', '3', '4', '2', '1', '15', '-1', '7', '8', '12', '-1', '1', '2', '-1', '2', '-1', '-1', '1', '4', '-1', '19', '3', '19', '1', '-1', '5', '9', '15', '17', '24', '28', '12');
INSERT INTO `ssc_c` VALUES ('131', '131', '14', '4', '5', '3', '2', '16', '1', '8', '-1', '13', '-1', '2', '3', '-1', '3', '-1', '1', '2', '-1', '-1', '20', '4', '20', '2', '-1', '6', '10', '16', '18', '25', '29', '13');
INSERT INTO `ssc_c` VALUES ('132', '132', '15', '5', '6', '4', '3', '17', '2', '-1', '1', '14', '-1', '3', '-1', '1', '-1', '1', '2', '-1', '1', '1', '21', '-1', '21', '-1', '1', '7', '11', '17', '19', '26', '30', '14');
INSERT INTO `ssc_c` VALUES ('133', '133', '16', '6', '7', '5', '-1', '18', '3', '1', '2', '15', '1', '-1', '1', '-1', '1', '-1', '3', '-1', '2', '2', '22', '-1', '22', '1', '2', '-1', '12', '18', '20', '27', '31', '15');
INSERT INTO `ssc_c` VALUES ('134', '134', '17', '7', '8', '6', '1', '19', '4', '2', '-1', '16', '-1', '1', '2', '-1', '2', '-1', '4', '1', '-1', '-1', '23', '1', '23', '2', '3', '1', '-1', '19', '21', '28', '32', '16');
INSERT INTO `ssc_c` VALUES ('135', '135', '18', '8', '9', '-1', '2', '20', '5', '3', '1', '17', '1', '-1', '-1', '1', '-1', '1', '-1', '2', '1', '1', '24', '-1', '24', '3', '4', '2', '1', '-1', '22', '29', '33', '17');
INSERT INTO `ssc_c` VALUES ('136', '136', '19', '9', '10', '1', '3', '21', '6', '-1', '2', '18', '-1', '1', '-1', '2', '-1', '2', '1', '-1', '2', '-1', '25', '1', '25', '4', '5', '3', '-1', '1', '23', '30', '34', '18');
INSERT INTO `ssc_c` VALUES ('137', '137', '20', '10', '11', '2', '4', '22', '7', '-1', '3', '19', '-1', '2', '-1', '3', '-1', '3', '2', '-1', '3', '1', '-1', '2', '-1', '5', '6', '4', '1', '2', '24', '31', '35', '19');
INSERT INTO `ssc_c` VALUES ('138', '138', '21', '11', '12', '3', '-1', '23', '8', '1', '4', '20', '1', '-1', '1', '-1', '1', '-1', '3', '-1', '4', '2', '1', '-1', '1', '6', '7', '-1', '2', '3', '25', '32', '36', '20');
INSERT INTO `ssc_c` VALUES ('139', '139', '22', '12', '13', '4', '-1', '24', '9', '2', '5', '21', '2', '-1', '2', '-1', '2', '-1', '4', '-1', '5', '3', '-1', '1', '-1', '7', '8', '1', '3', '4', '26', '33', '37', '21');
INSERT INTO `ssc_c` VALUES ('140', '140', '23', '13', '14', '5', '1', '25', '10', '-1', '6', '22', '-1', '1', '-1', '1', '-1', '1', '5', '-1', '6', '-1', '1', '2', '1', '8', '9', '-1', '4', '5', '27', '34', '38', '22');
INSERT INTO `ssc_c` VALUES ('141', '141', '24', '14', '15', '6', '2', '-1', '11', '1', '7', '23', '-1', '2', '-1', '2', '-1', '2', '6', '1', '-1', '1', '2', '-1', '2', '9', '-1', '1', '5', '6', '28', '35', '39', '23');
INSERT INTO `ssc_c` VALUES ('142', '142', '25', '15', '-1', '7', '3', '1', '12', '2', '8', '24', '1', '-1', '1', '-1', '-1', '3', '7', '2', '-1', '2', '3', '-1', '3', '10', '1', '-1', '6', '7', '29', '36', '40', '24');
INSERT INTO `ssc_c` VALUES ('143', '143', '26', '-1', '1', '8', '4', '2', '13', '3', '9', '25', '2', '-1', '-1', '1', '-1', '4', '8', '-1', '1', '3', '4', '-1', '4', '-1', '2', '1', '7', '8', '30', '37', '41', '25');
INSERT INTO `ssc_c` VALUES ('144', '144', '-1', '1', '2', '9', '5', '3', '14', '4', '10', '26', '3', '-1', '1', '-1', '1', '-1', '-1', '1', '2', '4', '5', '-1', '5', '-1', '3', '2', '8', '9', '31', '38', '42', '26');
INSERT INTO `ssc_c` VALUES ('145', '145', '1', '2', '3', '10', '6', '4', '15', '5', '-1', '27', '-1', '1', '2', '-1', '2', '-1', '1', '2', '-1', '-1', '6', '1', '6', '1', '4', '3', '9', '10', '32', '39', '-1', '27');
INSERT INTO `ssc_c` VALUES ('146', '146', '-1', '3', '4', '11', '7', '5', '16', '6', '1', '28', '1', '-1', '3', '-1', '3', '-1', '-1', '3', '1', '1', '7', '-1', '7', '2', '5', '4', '10', '11', '33', '40', '-1', '28');
INSERT INTO `ssc_c` VALUES ('147', '147', '1', '4', '5', '12', '8', '6', '17', '7', '2', '-1', '-1', '1', '-1', '1', '4', '-1', '-1', '4', '2', '-1', '8', '1', '8', '3', '6', '5', '11', '12', '34', '41', '1', '-1');
INSERT INTO `ssc_c` VALUES ('148', '148', '2', '5', '6', '13', '-1', '7', '18', '8', '3', '1', '1', '-1', '1', '-1', '5', '-1', '1', '-1', '3', '1', '9', '-1', '9', '4', '7', '6', '12', '-1', '35', '42', '2', '1');
INSERT INTO `ssc_c` VALUES ('149', '149', '3', '6', '7', '14', '1', '8', '19', '9', '-1', '2', '-1', '1', '2', '-1', '6', '-1', '2', '1', '-1', '-1', '10', '1', '10', '5', '8', '7', '-1', '1', '36', '43', '3', '2');
INSERT INTO `ssc_c` VALUES ('150', '150', '4', '7', '8', '15', '2', '9', '20', '10', '1', '-1', '-1', '2', '-1', '1', '7', '-1', '-1', '2', '1', '-1', '11', '2', '11', '-1', '9', '8', '1', '2', '37', '44', '4', '3');
INSERT INTO `ssc_c` VALUES ('151', '151', '5', '8', '9', '16', '3', '10', '21', '-1', '2', '1', '-1', '3', '-1', '2', '-1', '1', '1', '-1', '2', '1', '12', '-1', '12', '1', '-1', '9', '2', '3', '38', '45', '5', '4');
INSERT INTO `ssc_c` VALUES ('152', '152', '6', '9', '10', '17', '4', '11', '22', '1', '3', '-1', '-1', '4', '-1', '3', '1', '-1', '-1', '1', '3', '-1', '13', '1', '13', '2', '-1', '10', '3', '4', '39', '46', '6', '5');
INSERT INTO `ssc_c` VALUES ('153', '153', '7', '10', '11', '-1', '5', '12', '23', '2', '4', '1', '1', '-1', '-1', '4', '-1', '1', '-1', '2', '4', '1', '14', '-1', '14', '3', '1', '11', '4', '5', '-1', '47', '7', '6');
INSERT INTO `ssc_c` VALUES ('154', '154', '8', '11', '-1', '1', '6', '13', '24', '3', '5', '2', '2', '-1', '1', '-1', '-1', '2', '1', '3', '-1', '2', '15', '-1', '15', '-1', '2', '12', '5', '6', '1', '48', '8', '7');
INSERT INTO `ssc_c` VALUES ('155', '155', '9', '12', '-1', '2', '7', '14', '25', '4', '6', '3', '3', '-1', '2', '-1', '-1', '3', '2', '4', '-1', '3', '-1', '1', '-1', '1', '3', '13', '6', '7', '2', '49', '9', '8');
INSERT INTO `ssc_c` VALUES ('156', '156', '10', '13', '1', '-1', '8', '15', '26', '5', '7', '4', '4', '-1', '-1', '1', '-1', '4', '-1', '5', '1', '-1', '1', '2', '1', '-1', '4', '14', '7', '8', '3', '50', '10', '9');
INSERT INTO `ssc_c` VALUES ('157', '157', '11', '14', '2', '1', '-1', '16', '27', '6', '8', '5', '5', '-1', '1', '-1', '1', '-1', '1', '-1', '2', '-1', '2', '3', '2', '-1', '5', '15', '8', '9', '4', '51', '11', '10');
INSERT INTO `ssc_c` VALUES ('158', '158', '12', '15', '3', '2', '1', '-1', '28', '7', '9', '6', '-1', '1', '-1', '1', '-1', '1', '2', '1', '-1', '-1', '3', '4', '3', '-1', '6', '16', '9', '10', '5', '52', '12', '11');
INSERT INTO `ssc_c` VALUES ('159', '159', '-1', '16', '4', '3', '2', '1', '29', '8', '10', '7', '1', '-1', '1', '-1', '1', '-1', '-1', '2', '1', '1', '4', '-1', '4', '1', '7', '17', '10', '-1', '6', '53', '13', '12');
INSERT INTO `ssc_c` VALUES ('160', '160', '1', '17', '5', '4', '3', '2', '30', '9', '11', '-1', '-1', '1', '-1', '1', '2', '-1', '-1', '3', '2', '-1', '5', '1', '5', '2', '8', '18', '11', '1', '7', '54', '14', '-1');
INSERT INTO `ssc_c` VALUES ('161', '161', '2', '18', '-1', '5', '4', '3', '31', '10', '12', '1', '1', '-1', '1', '-1', '-1', '1', '1', '4', '-1', '1', '6', '-1', '6', '3', '9', '19', '12', '2', '8', '-1', '15', '1');
INSERT INTO `ssc_c` VALUES ('162', '162', '3', '19', '1', '6', '5', '-1', '32', '11', '13', '2', '-1', '1', '-1', '1', '-1', '2', '2', '5', '-1', '-1', '7', '1', '7', '4', '10', '-1', '13', '3', '9', '1', '16', '2');
INSERT INTO `ssc_c` VALUES ('163', '163', '4', '20', '2', '7', '6', '-1', '33', '12', '14', '3', '-1', '2', '-1', '2', '-1', '3', '3', '6', '-1', '1', '-1', '2', '-1', '5', '11', '1', '14', '4', '10', '2', '17', '3');
INSERT INTO `ssc_c` VALUES ('164', '164', '5', '21', '3', '-1', '7', '1', '34', '13', '15', '4', '1', '-1', '-1', '3', '-1', '4', '-1', '7', '1', '2', '1', '-1', '1', '6', '-1', '2', '15', '5', '11', '3', '18', '4');
INSERT INTO `ssc_c` VALUES ('165', '165', '6', '22', '4', '1', '8', '2', '35', '14', '-1', '5', '-1', '1', '1', '-1', '1', '-1', '1', '8', '-1', '-1', '2', '1', '2', '7', '1', '3', '16', '-1', '12', '4', '19', '5');
INSERT INTO `ssc_c` VALUES ('166', '166', '7', '23', '5', '2', '9', '3', '36', '15', '1', '-1', '-1', '2', '-1', '1', '2', '-1', '-1', '9', '1', '-1', '3', '2', '3', '-1', '2', '4', '17', '1', '13', '5', '20', '6');
INSERT INTO `ssc_c` VALUES ('167', '167', '8', '24', '6', '3', '10', '4', '37', '16', '-1', '1', '-1', '3', '1', '-1', '3', '-1', '1', '10', '-1', '1', '4', '-1', '4', '-1', '3', '5', '18', '2', '14', '6', '21', '7');
INSERT INTO `ssc_c` VALUES ('168', '168', '9', '25', '7', '4', '-1', '5', '38', '17', '1', '2', '1', '-1', '2', '-1', '4', '-1', '2', '-1', '1', '2', '5', '-1', '5', '1', '4', '6', '-1', '3', '15', '7', '22', '8');
INSERT INTO `ssc_c` VALUES ('169', '169', '10', '26', '8', '5', '-1', '6', '39', '18', '2', '3', '2', '-1', '3', '-1', '5', '-1', '3', '-1', '2', '3', '-1', '1', '-1', '2', '5', '7', '1', '4', '16', '8', '23', '9');
INSERT INTO `ssc_c` VALUES ('170', '170', '-1', '27', '9', '6', '1', '7', '40', '19', '3', '4', '3', '-1', '4', '-1', '6', '-1', '-1', '1', '3', '4', '1', '-1', '1', '3', '6', '8', '-1', '5', '17', '9', '24', '10');
INSERT INTO `ssc_c` VALUES ('171', '171', '1', '28', '10', '7', '2', '-1', '41', '20', '4', '5', '-1', '1', '-1', '1', '-1', '1', '1', '2', '-1', '-1', '2', '1', '2', '4', '7', '9', '1', '-1', '18', '10', '25', '11');
INSERT INTO `ssc_c` VALUES ('172', '172', '2', '29', '11', '8', '3', '1', '42', '21', '5', '-1', '-1', '2', '-1', '2', '1', '-1', '-1', '3', '1', '-1', '3', '2', '3', '5', '8', '10', '-1', '1', '19', '11', '26', '12');
INSERT INTO `ssc_c` VALUES ('173', '173', '3', '30', '-1', '9', '4', '2', '43', '22', '6', '1', '1', '-1', '1', '-1', '-1', '1', '1', '4', '-1', '1', '4', '-1', '4', '6', '9', '11', '1', '2', '20', '-1', '27', '13');
INSERT INTO `ssc_c` VALUES ('174', '174', '4', '-1', '1', '10', '5', '3', '44', '23', '7', '2', '2', '-1', '-1', '1', '-1', '2', '2', '-1', '1', '2', '5', '-1', '5', '-1', '10', '12', '2', '3', '21', '1', '28', '14');
INSERT INTO `ssc_c` VALUES ('175', '175', '5', '1', '2', '11', '6', '4', '45', '24', '-1', '3', '-1', '1', '1', '-1', '1', '-1', '3', '1', '-1', '-1', '6', '1', '6', '1', '11', '13', '3', '4', '22', '-1', '29', '15');
INSERT INTO `ssc_c` VALUES ('176', '176', '-1', '2', '3', '12', '7', '5', '46', '25', '1', '4', '1', '-1', '2', '-1', '2', '-1', '-1', '2', '1', '1', '7', '-1', '7', '2', '12', '14', '4', '5', '23', '1', '-1', '16');
INSERT INTO `ssc_c` VALUES ('177', '177', '1', '3', '4', '13', '-1', '6', '47', '26', '2', '5', '2', '-1', '3', '-1', '3', '-1', '1', '-1', '2', '-1', '8', '1', '8', '3', '13', '15', '-1', '6', '24', '2', '1', '17');
INSERT INTO `ssc_c` VALUES ('178', '178', '-1', '4', '5', '14', '1', '7', '48', '27', '3', '6', '3', '-1', '4', '-1', '4', '-1', '-1', '1', '3', '1', '9', '-1', '9', '4', '14', '16', '-1', '7', '25', '3', '2', '18');
INSERT INTO `ssc_c` VALUES ('179', '178', '1', '5', '6', '15', '2', '8', '-1', '28', '4', '7', '-1', '1', '5', '-1', '5', '-1', '-1', '2', '4', '-1', '10', '1', '10', '5', '-1', '17', '1', '8', '26', '4', '3', '19');
INSERT INTO `ssc_c` VALUES ('180', '179', '2', '6', '7', '16', '3', '9', '1', '29', '5', '-1', '-1', '2', '-1', '1', '6', '-1', '-1', '3', '5', '-1', '11', '2', '11', '6', '1', '-1', '2', '9', '27', '5', '4', '20');
INSERT INTO `ssc_c` VALUES ('181', '180', '3', '-1', '8', '17', '4', '10', '2', '30', '6', '1', '1', '-1', '-1', '2', '-1', '1', '1', '-1', '6', '1', '12', '-1', '12', '7', '2', '1', '3', '10', '28', '6', '-1', '21');
INSERT INTO `ssc_c` VALUES ('182', '181', '4', '1', '9', '18', '5', '11', '3', '31', '7', '-1', '-1', '1', '-1', '3', '1', '-1', '-1', '1', '7', '-1', '13', '1', '13', '8', '3', '2', '4', '11', '29', '7', '-1', '22');
INSERT INTO `ssc_c` VALUES ('183', '182', '5', '2', '10', '-1', '6', '12', '4', '32', '8', '1', '1', '-1', '-1', '4', '-1', '1', '-1', '2', '8', '1', '14', '-1', '14', '9', '4', '3', '5', '12', '-1', '8', '1', '23');
INSERT INTO `ssc_c` VALUES ('184', '183', '6', '3', '11', '1', '7', '13', '5', '-1', '9', '2', '-1', '1', '-1', '5', '-1', '2', '1', '-1', '9', '-1', '15', '1', '15', '10', '5', '4', '-1', '13', '1', '9', '2', '24');
INSERT INTO `ssc_c` VALUES ('185', '184', '7', '4', '12', '2', '8', '-1', '6', '1', '10', '3', '-1', '2', '-1', '6', '-1', '3', '2', '1', '-1', '1', '16', '-1', '16', '11', '-1', '5', '1', '14', '2', '10', '3', '25');
INSERT INTO `ssc_c` VALUES ('186', '185', '8', '5', '13', '3', '9', '1', '-1', '2', '11', '4', '-1', '3', '1', '-1', '1', '-1', '-1', '2', '1', '-1', '17', '1', '17', '-1', '1', '6', '2', '15', '3', '11', '4', '26');
INSERT INTO `ssc_c` VALUES ('187', '186', '9', '6', '-1', '4', '10', '2', '1', '3', '12', '5', '1', '-1', '2', '-1', '-1', '1', '1', '3', '-1', '1', '18', '-1', '18', '1', '2', '7', '-1', '16', '4', '12', '5', '27');
INSERT INTO `ssc_c` VALUES ('188', '187', '10', '7', '1', '5', '-1', '3', '2', '4', '13', '6', '2', '-1', '3', '-1', '1', '-1', '2', '-1', '1', '-1', '19', '1', '19', '2', '-1', '8', '1', '17', '5', '13', '6', '28');
INSERT INTO `ssc_c` VALUES ('189', '188', '11', '8', '2', '6', '1', '4', '3', '5', '14', '-1', '-1', '1', '-1', '1', '2', '-1', '-1', '1', '2', '-1', '20', '2', '20', '3', '1', '9', '2', '-1', '6', '14', '7', '29');
INSERT INTO `ssc_c` VALUES ('190', '189', '-1', '9', '3', '7', '2', '5', '4', '6', '15', '1', '1', '-1', '1', '-1', '3', '-1', '-1', '2', '3', '1', '21', '-1', '21', '4', '2', '10', '3', '1', '7', '15', '8', '-1');
INSERT INTO `ssc_c` VALUES ('191', '190', '1', '10', '-1', '8', '3', '6', '5', '7', '16', '2', '2', '-1', '2', '-1', '-1', '1', '1', '3', '-1', '-1', '22', '1', '22', '5', '-1', '11', '4', '2', '8', '16', '9', '1');
INSERT INTO `ssc_c` VALUES ('192', '191', '2', '11', '1', '9', '4', '7', '6', '8', '17', '-1', '-1', '1', '-1', '1', '1', '-1', '-1', '4', '1', '-1', '23', '2', '23', '6', '1', '12', '5', '3', '9', '-1', '10', '2');
INSERT INTO `ssc_c` VALUES ('193', '192', '3', '12', '2', '10', '5', '8', '7', '-1', '18', '1', '-1', '2', '-1', '2', '-1', '1', '1', '-1', '2', '1', '24', '-1', '24', '7', '-1', '13', '6', '4', '10', '1', '11', '3');
INSERT INTO `ssc_c` VALUES ('194', '193', '4', '13', '3', '-1', '6', '9', '8', '1', '19', '2', '1', '-1', '-1', '3', '-1', '2', '-1', '1', '3', '2', '25', '-1', '25', '8', '1', '14', '-1', '5', '11', '2', '12', '4');
INSERT INTO `ssc_c` VALUES ('195', '194', '5', '14', '4', '1', '7', '10', '9', '2', '-1', '3', '-1', '1', '1', '-1', '1', '-1', '1', '2', '-1', '-1', '26', '1', '26', '9', '2', '15', '1', '-1', '12', '3', '13', '5');
INSERT INTO `ssc_c` VALUES ('196', '195', '6', '15', '5', '2', '8', '11', '10', '3', '-1', '4', '-1', '2', '2', '-1', '2', '-1', '2', '3', '-1', '1', '-1', '2', '-1', '10', '3', '16', '2', '1', '13', '4', '14', '6');
INSERT INTO `ssc_c` VALUES ('197', '196', '7', '16', '6', '3', '9', '12', '11', '-1', '1', '5', '-1', '3', '-1', '1', '-1', '1', '3', '-1', '1', '2', '1', '-1', '1', '-1', '4', '17', '3', '2', '14', '5', '15', '7');
INSERT INTO `ssc_c` VALUES ('198', '197', '8', '17', '7', '4', '10', '13', '12', '1', '2', '-1', '-1', '4', '-1', '2', '1', '-1', '-1', '1', '2', '-1', '2', '1', '2', '1', '-1', '18', '4', '3', '15', '6', '16', '8');
INSERT INTO `ssc_c` VALUES ('199', '198', '9', '-1', '8', '5', '11', '14', '13', '2', '3', '1', '1', '-1', '-1', '3', '-1', '1', '1', '-1', '3', '1', '3', '-1', '3', '2', '1', '19', '5', '4', '16', '7', '-1', '9');
INSERT INTO `ssc_c` VALUES ('200', '199', '10', '1', '9', '6', '12', '15', '14', '-1', '4', '2', '-1', '1', '-1', '4', '-1', '2', '2', '-1', '4', '-1', '4', '1', '4', '3', '2', '20', '6', '5', '-1', '8', '1', '10');
INSERT INTO `ssc_c` VALUES ('201', '200', '11', '2', '10', '-1', '13', '16', '15', '1', '5', '3', '1', '-1', '-1', '5', '-1', '3', '-1', '1', '5', '1', '5', '-1', '5', '4', '3', '21', '-1', '6', '1', '9', '2', '11');
INSERT INTO `ssc_c` VALUES ('202', '201', '12', '3', '11', '-1', '14', '17', '16', '2', '6', '4', '2', '-1', '-1', '6', '-1', '4', '-1', '2', '6', '2', '-1', '1', '-1', '5', '4', '22', '1', '7', '2', '10', '3', '12');
INSERT INTO `ssc_c` VALUES ('203', '202', '13', '4', '12', '1', '-1', '18', '17', '3', '7', '5', '3', '-1', '1', '-1', '1', '-1', '1', '-1', '7', '-1', '1', '2', '1', '-1', '5', '23', '2', '8', '3', '11', '4', '13');
INSERT INTO `ssc_c` VALUES ('204', '203', '14', '5', '13', '2', '1', '-1', '18', '4', '8', '6', '-1', '1', '-1', '1', '-1', '1', '2', '1', '-1', '-1', '2', '3', '2', '-1', '6', '24', '3', '9', '4', '12', '5', '14');
INSERT INTO `ssc_c` VALUES ('205', '204', '15', '6', '14', '-1', '2', '1', '19', '5', '9', '7', '1', '-1', '-1', '2', '-1', '2', '-1', '2', '1', '1', '3', '-1', '3', '1', '-1', '25', '4', '10', '5', '13', '6', '15');
INSERT INTO `ssc_c` VALUES ('206', '205', '16', '7', '15', '1', '3', '2', '-1', '6', '10', '8', '-1', '1', '1', '-1', '1', '-1', '-1', '3', '2', '-1', '4', '1', '4', '2', '1', '-1', '5', '11', '6', '14', '7', '16');
INSERT INTO `ssc_c` VALUES ('207', '206', '17', '8', '16', '2', '4', '3', '1', '7', '-1', '9', '-1', '2', '2', '-1', '2', '-1', '1', '4', '-1', '-1', '5', '2', '5', '3', '-1', '1', '6', '12', '7', '15', '8', '17');
INSERT INTO `ssc_c` VALUES ('208', '207', '18', '-1', '17', '3', '5', '4', '2', '8', '1', '10', '1', '-1', '-1', '1', '-1', '1', '2', '-1', '1', '1', '6', '-1', '6', '4', '1', '2', '7', '13', '8', '-1', '9', '18');
INSERT INTO `ssc_c` VALUES ('209', '208', '19', '1', '18', '4', '6', '5', '3', '9', '-1', '11', '-1', '1', '1', '-1', '1', '-1', '3', '1', '-1', '-1', '7', '1', '7', '5', '2', '3', '8', '14', '9', '-1', '10', '19');
INSERT INTO `ssc_c` VALUES ('210', '209', '20', '2', '19', '5', '7', '6', '4', '10', '-1', '12', '-1', '2', '2', '-1', '2', '-1', '4', '2', '-1', '1', '-1', '2', '-1', '6', '3', '4', '9', '15', '10', '1', '11', '20');
INSERT INTO `ssc_c` VALUES ('211', '210', '21', '3', '20', '6', '-1', '7', '5', '11', '1', '13', '1', '-1', '3', '-1', '3', '-1', '5', '-1', '1', '2', '1', '-1', '1', '7', '4', '5', '-1', '16', '11', '2', '12', '21');
INSERT INTO `ssc_c` VALUES ('212', '211', '22', '4', '-1', '7', '1', '8', '6', '12', '2', '14', '2', '-1', '4', '-1', '-1', '1', '6', '1', '-1', '3', '2', '-1', '2', '8', '-1', '6', '1', '17', '12', '3', '13', '22');
INSERT INTO `ssc_c` VALUES ('213', '212', '23', '5', '1', '8', '2', '9', '7', '-1', '3', '15', '-1', '1', '-1', '1', '-1', '2', '7', '-1', '1', '-1', '3', '1', '3', '9', '1', '7', '2', '-1', '13', '4', '14', '23');
INSERT INTO `ssc_c` VALUES ('214', '213', '24', '6', '2', '9', '3', '10', '8', '-1', '4', '16', '-1', '2', '-1', '2', '-1', '3', '8', '-1', '2', '1', '-1', '2', '-1', '10', '2', '8', '3', '1', '14', '5', '15', '24');
INSERT INTO `ssc_c` VALUES ('215', '214', '25', '7', '3', '10', '4', '11', '9', '1', '-1', '17', '-1', '3', '1', '-1', '1', '-1', '9', '1', '-1', '-1', '1', '3', '1', '-1', '3', '9', '4', '2', '15', '6', '16', '25');
INSERT INTO `ssc_c` VALUES ('216', '215', '26', '8', '4', '11', '-1', '12', '10', '2', '1', '18', '1', '-1', '2', '-1', '2', '-1', '10', '-1', '1', '1', '2', '-1', '2', '1', '4', '10', '-1', '3', '16', '7', '17', '26');
INSERT INTO `ssc_c` VALUES ('217', '216', '27', '9', '-1', '12', '1', '13', '11', '3', '2', '19', '2', '-1', '3', '-1', '-1', '1', '11', '1', '-1', '2', '3', '-1', '3', '2', '-1', '11', '1', '4', '17', '8', '18', '27');
INSERT INTO `ssc_c` VALUES ('218', '217', '28', '10', '1', '13', '2', '14', '12', '4', '3', '-1', '-1', '1', '-1', '1', '1', '-1', '-1', '2', '1', '-1', '4', '1', '4', '3', '1', '12', '2', '5', '18', '-1', '19', '28');
INSERT INTO `ssc_c` VALUES ('219', '218', '29', '11', '2', '-1', '3', '15', '13', '5', '4', '1', '1', '-1', '-1', '2', '-1', '1', '-1', '3', '2', '1', '5', '-1', '5', '4', '2', '13', '3', '6', '-1', '1', '20', '29');
INSERT INTO `ssc_c` VALUES ('220', '219', '30', '12', '3', '1', '-1', '16', '14', '6', '5', '2', '2', '-1', '1', '-1', '1', '-1', '1', '-1', '3', '-1', '6', '1', '6', '-1', '3', '14', '4', '7', '1', '2', '21', '30');
INSERT INTO `ssc_c` VALUES ('221', '220', '31', '-1', '4', '2', '1', '17', '15', '7', '6', '3', '3', '-1', '-1', '1', '-1', '1', '2', '-1', '4', '1', '7', '-1', '7', '1', '4', '-1', '5', '8', '2', '3', '22', '31');
INSERT INTO `ssc_c` VALUES ('222', '221', '32', '1', '5', '-1', '2', '18', '16', '8', '7', '4', '4', '-1', '-1', '2', '-1', '2', '-1', '1', '5', '-1', '8', '1', '8', '2', '-1', '1', '6', '9', '3', '4', '23', '32');
INSERT INTO `ssc_c` VALUES ('223', '222', '33', '2', '-1', '1', '3', '19', '17', '9', '8', '5', '5', '-1', '1', '-1', '-1', '3', '1', '2', '-1', '1', '9', '-1', '9', '-1', '1', '2', '7', '10', '4', '5', '24', '33');
INSERT INTO `ssc_c` VALUES ('224', '223', '34', '3', '1', '-1', '4', '20', '18', '10', '9', '6', '6', '-1', '-1', '1', '-1', '4', '-1', '3', '1', '-1', '10', '1', '10', '-1', '2', '3', '8', '11', '5', '6', '25', '34');
INSERT INTO `ssc_c` VALUES ('225', '224', '35', '4', '2', '1', '5', '21', '-1', '11', '10', '7', '-1', '1', '1', '-1', '1', '-1', '-1', '4', '2', '-1', '11', '2', '11', '1', '3', '-1', '9', '12', '6', '7', '26', '35');
INSERT INTO `ssc_c` VALUES ('226', '225', '36', '5', '-1', '2', '6', '22', '1', '12', '11', '8', '1', '-1', '2', '-1', '-1', '1', '1', '5', '-1', '1', '12', '-1', '12', '2', '4', '1', '-1', '13', '7', '8', '27', '36');
INSERT INTO `ssc_c` VALUES ('227', '226', '-1', '6', '1', '3', '7', '23', '2', '13', '12', '9', '2', '-1', '3', '-1', '1', '-1', '-1', '6', '1', '2', '13', '-1', '13', '3', '-1', '2', '1', '14', '8', '9', '28', '37');
INSERT INTO `ssc_c` VALUES ('228', '227', '1', '7', '2', '4', '-1', '24', '3', '14', '13', '10', '3', '-1', '4', '-1', '2', '-1', '1', '-1', '2', '-1', '14', '1', '14', '4', '1', '3', '-1', '15', '9', '10', '29', '38');
INSERT INTO `ssc_c` VALUES ('229', '228', '2', '8', '3', '5', '1', '25', '4', '-1', '14', '11', '-1', '1', '-1', '1', '-1', '1', '2', '-1', '3', '-1', '15', '2', '15', '5', '2', '-1', '1', '16', '10', '11', '30', '39');
INSERT INTO `ssc_c` VALUES ('230', '229', '3', '9', '4', '6', '2', '26', '-1', '1', '15', '12', '-1', '2', '1', '-1', '1', '-1', '-1', '1', '4', '1', '16', '-1', '16', '-1', '3', '1', '2', '17', '11', '12', '31', '40');
INSERT INTO `ssc_c` VALUES ('231', '230', '4', '10', '5', '7', '3', '27', '1', '-1', '16', '13', '-1', '3', '-1', '1', '-1', '1', '1', '-1', '5', '-1', '17', '1', '17', '-1', '4', '2', '3', '18', '12', '13', '32', '41');
INSERT INTO `ssc_c` VALUES ('232', '231', '-1', '11', '6', '8', '4', '28', '2', '1', '17', '14', '1', '-1', '1', '-1', '1', '-1', '-1', '1', '6', '1', '18', '-1', '18', '1', '5', '3', '4', '19', '13', '-1', '33', '42');
INSERT INTO `ssc_c` VALUES ('233', '232', '1', '12', '7', '9', '5', '29', '3', '-1', '18', '15', '-1', '1', '-1', '1', '-1', '1', '1', '-1', '7', '-1', '19', '1', '19', '2', '6', '4', '5', '20', '14', '-1', '34', '43');
INSERT INTO `ssc_c` VALUES ('234', '233', '-1', '13', '8', '10', '6', '30', '4', '1', '19', '16', '1', '-1', '1', '-1', '1', '-1', '-1', '1', '8', '1', '20', '-1', '20', '3', '7', '5', '6', '21', '15', '-1', '35', '44');
INSERT INTO `ssc_c` VALUES ('235', '234', '1', '-1', '9', '11', '7', '31', '5', '2', '20', '17', '2', '-1', '-1', '1', '-1', '1', '1', '-1', '9', '-1', '21', '1', '21', '-1', '8', '6', '7', '22', '16', '1', '36', '45');
INSERT INTO `ssc_c` VALUES ('236', '235', '2', '1', '10', '12', '8', '32', '6', '-1', '21', '18', '-1', '1', '-1', '2', '-1', '2', '2', '-1', '10', '-1', '22', '2', '22', '1', '9', '7', '8', '23', '-1', '2', '37', '46');
INSERT INTO `ssc_c` VALUES ('237', '236', '3', '2', '11', '-1', '9', '33', '7', '1', '22', '19', '1', '-1', '-1', '3', '-1', '3', '-1', '1', '11', '1', '23', '-1', '23', '2', '10', '8', '-1', '24', '1', '3', '38', '47');
INSERT INTO `ssc_c` VALUES ('238', '237', '4', '3', '-1', '1', '10', '34', '8', '2', '23', '20', '2', '-1', '1', '-1', '-1', '4', '1', '2', '-1', '2', '24', '-1', '24', '-1', '11', '9', '1', '25', '2', '4', '39', '48');
INSERT INTO `ssc_c` VALUES ('239', '238', '5', '4', '-1', '2', '11', '35', '9', '3', '24', '21', '3', '-1', '2', '-1', '-1', '5', '2', '3', '-1', '3', '-1', '1', '-1', '1', '12', '10', '2', '26', '3', '5', '40', '49');
INSERT INTO `ssc_c` VALUES ('240', '239', '6', '5', '1', '3', '12', '36', '10', '4', '-1', '22', '-1', '1', '3', '-1', '1', '-1', '3', '4', '-1', '-1', '1', '2', '1', '2', '13', '11', '3', '27', '-1', '6', '41', '50');
INSERT INTO `ssc_c` VALUES ('241', '240', '7', '6', '2', '4', '13', '-1', '11', '5', '1', '23', '-1', '2', '-1', '1', '-1', '1', '4', '5', '-1', '1', '2', '-1', '2', '3', '14', '-1', '4', '28', '1', '7', '42', '51');
INSERT INTO `ssc_c` VALUES ('242', '241', '8', '7', '3', '5', '14', '1', '12', '6', '-1', '24', '-1', '3', '1', '-1', '1', '-1', '5', '6', '-1', '-1', '3', '1', '3', '4', '15', '-1', '5', '29', '2', '8', '43', '52');
INSERT INTO `ssc_c` VALUES ('243', '242', '9', '8', '4', '6', '-1', '2', '13', '7', '1', '25', '1', '-1', '2', '-1', '2', '-1', '6', '-1', '1', '1', '4', '-1', '4', '5', '16', '1', '-1', '30', '3', '9', '44', '53');
INSERT INTO `ssc_c` VALUES ('244', '243', '10', '9', '5', '7', '1', '3', '-1', '8', '2', '26', '-1', '1', '3', '-1', '3', '-1', '-1', '1', '2', '-1', '5', '1', '5', '6', '-1', '2', '1', '31', '4', '10', '45', '54');
INSERT INTO `ssc_c` VALUES ('245', '244', '11', '10', '6', '8', '2', '4', '1', '-1', '3', '27', '-1', '2', '-1', '1', '-1', '1', '1', '-1', '3', '-1', '6', '2', '6', '-1', '1', '3', '2', '32', '5', '11', '46', '55');
INSERT INTO `ssc_c` VALUES ('246', '245', '12', '-1', '7', '9', '3', '5', '2', '1', '4', '28', '1', '-1', '-1', '2', '-1', '2', '2', '-1', '4', '1', '7', '-1', '7', '1', '2', '4', '3', '33', '-1', '12', '47', '56');
INSERT INTO `ssc_c` VALUES ('247', '246', '13', '1', '-1', '10', '4', '6', '3', '2', '5', '29', '2', '-1', '1', '-1', '-1', '3', '3', '1', '-1', '-1', '8', '1', '8', '-1', '3', '5', '4', '34', '1', '13', '48', '57');
INSERT INTO `ssc_c` VALUES ('248', '247', '14', '2', '1', '-1', '5', '7', '4', '3', '6', '30', '3', '-1', '-1', '1', '-1', '4', '-1', '2', '1', '-1', '9', '2', '9', '-1', '4', '6', '5', '35', '2', '14', '49', '58');
INSERT INTO `ssc_c` VALUES ('249', '248', '15', '3', '2', '1', '6', '8', '5', '4', '7', '-1', '-1', '1', '-1', '2', '1', '-1', '-1', '3', '2', '-1', '10', '3', '10', '1', '5', '7', '6', '36', '-1', '15', '50', '59');
INSERT INTO `ssc_c` VALUES ('250', '249', '16', '4', '3', '2', '7', '9', '6', '5', '-1', '1', '-1', '2', '1', '-1', '2', '-1', '1', '4', '-1', '1', '11', '-1', '11', '-1', '6', '8', '7', '37', '1', '16', '51', '60');
INSERT INTO `ssc_c` VALUES ('251', '250', '17', '5', '4', '3', '8', '10', '-1', '6', '1', '2', '-1', '3', '2', '-1', '3', '-1', '-1', '5', '1', '2', '12', '-1', '12', '1', '-1', '9', '8', '38', '2', '17', '52', '61');
INSERT INTO `ssc_c` VALUES ('252', '251', '18', '6', '-1', '4', '9', '11', '1', '7', '2', '3', '1', '-1', '3', '-1', '-1', '1', '1', '6', '-1', '3', '13', '-1', '13', '2', '1', '10', '-1', '39', '3', '18', '53', '62');
INSERT INTO `ssc_c` VALUES ('253', '252', '19', '7', '1', '5', '10', '12', '2', '8', '3', '-1', '-1', '1', '-1', '1', '1', '-1', '-1', '7', '1', '-1', '14', '1', '14', '3', '2', '11', '1', '40', '4', '-1', '54', '63');
INSERT INTO `ssc_c` VALUES ('254', '253', '20', '8', '2', '6', '11', '13', '3', '-1', '4', '1', '-1', '2', '-1', '2', '-1', '1', '1', '-1', '2', '1', '15', '-1', '15', '4', '-1', '12', '2', '41', '5', '1', '55', '64');
INSERT INTO `ssc_c` VALUES ('255', '254', '21', '9', '3', '7', '-1', '14', '4', '1', '5', '2', '1', '-1', '1', '-1', '1', '-1', '2', '-1', '3', '2', '16', '-1', '16', '5', '1', '-1', '3', '42', '6', '2', '56', '65');
INSERT INTO `ssc_c` VALUES ('256', '255', '-1', '10', '4', '8', '1', '15', '5', '2', '6', '3', '2', '-1', '2', '-1', '2', '-1', '-1', '1', '4', '3', '17', '-1', '17', '6', '2', '1', '-1', '43', '7', '3', '57', '66');
INSERT INTO `ssc_c` VALUES ('257', '256', '1', '-1', '5', '9', '2', '16', '6', '3', '7', '4', '3', '-1', '-1', '1', '-1', '1', '1', '-1', '5', '-1', '18', '1', '18', '-1', '3', '2', '1', '44', '8', '4', '58', '67');
INSERT INTO `ssc_c` VALUES ('258', '257', '2', '1', '6', '10', '-1', '17', '7', '4', '8', '5', '4', '-1', '1', '-1', '1', '-1', '2', '-1', '6', '-1', '19', '2', '19', '1', '4', '-1', '2', '45', '9', '5', '59', '68');
INSERT INTO `ssc_c` VALUES ('259', '258', '3', '2', '7', '11', '1', '18', '8', '5', '-1', '6', '-1', '1', '2', '-1', '2', '-1', '3', '1', '-1', '-1', '20', '3', '20', '2', '5', '1', '-1', '46', '10', '6', '60', '69');
INSERT INTO `ssc_c` VALUES ('260', '259', '4', '3', '-1', '12', '2', '19', '9', '6', '1', '7', '1', '-1', '3', '-1', '-1', '1', '4', '2', '-1', '1', '21', '-1', '21', '3', '6', '2', '1', '47', '-1', '7', '61', '70');
INSERT INTO `ssc_c` VALUES ('261', '260', '5', '4', '1', '13', '3', '20', '10', '7', '-1', '8', '-1', '1', '4', '-1', '1', '-1', '5', '3', '-1', '-1', '22', '1', '22', '4', '7', '3', '2', '48', '-1', '8', '62', '71');
INSERT INTO `ssc_c` VALUES ('262', '261', '6', '5', '2', '14', '4', '21', '11', '8', '1', '-1', '-1', '2', '-1', '1', '2', '-1', '-1', '4', '1', '-1', '23', '2', '23', '-1', '8', '4', '3', '49', '1', '9', '63', '72');
INSERT INTO `ssc_c` VALUES ('263', '262', '7', '-1', '3', '15', '5', '22', '12', '9', '2', '1', '1', '-1', '-1', '2', '-1', '1', '1', '-1', '2', '1', '24', '-1', '24', '1', '9', '5', '4', '50', '2', '10', '-1', '73');
INSERT INTO `ssc_c` VALUES ('264', '263', '8', '1', '4', '16', '6', '23', '13', '10', '-1', '2', '-1', '1', '1', '-1', '1', '-1', '2', '1', '-1', '-1', '25', '1', '25', '2', '10', '6', '5', '51', '3', '-1', '1', '74');
INSERT INTO `ssc_c` VALUES ('265', '264', '9', '2', '5', '17', '7', '24', '14', '11', '1', '-1', '-1', '2', '-1', '1', '2', '-1', '-1', '2', '1', '-1', '26', '2', '26', '-1', '11', '7', '6', '52', '4', '1', '2', '75');
INSERT INTO `ssc_c` VALUES ('266', '265', '10', '-1', '6', '18', '8', '25', '15', '12', '2', '1', '1', '-1', '-1', '2', '-1', '1', '1', '-1', '2', '1', '27', '-1', '27', '1', '12', '8', '7', '53', '5', '2', '-1', '76');
INSERT INTO `ssc_c` VALUES ('267', '266', '11', '1', '7', '19', '9', '-1', '16', '13', '3', '2', '-1', '1', '-1', '3', '-1', '2', '2', '1', '-1', '-1', '28', '1', '28', '2', '13', '9', '-1', '54', '6', '3', '1', '77');
INSERT INTO `ssc_c` VALUES ('268', '267', '12', '2', '8', '20', '10', '-1', '17', '14', '4', '3', '-1', '2', '-1', '4', '-1', '3', '3', '2', '-1', '1', '-1', '2', '-1', '3', '14', '10', '1', '55', '7', '4', '2', '78');
INSERT INTO `ssc_c` VALUES ('269', '268', '-1', '3', '9', '21', '11', '1', '18', '15', '5', '4', '1', '-1', '1', '-1', '1', '-1', '-1', '3', '1', '2', '1', '-1', '1', '4', '15', '11', '2', '-1', '8', '5', '3', '79');
INSERT INTO `ssc_c` VALUES ('270', '269', '1', '4', '-1', '22', '12', '2', '19', '16', '6', '5', '2', '-1', '2', '-1', '-1', '1', '1', '4', '-1', '-1', '2', '1', '2', '5', '-1', '12', '3', '1', '9', '6', '4', '80');
INSERT INTO `ssc_c` VALUES ('271', '270', '2', '5', '1', '23', '13', '3', '20', '-1', '7', '6', '-1', '1', '-1', '1', '-1', '2', '2', '-1', '1', '-1', '3', '2', '3', '6', '1', '13', '4', '-1', '10', '7', '5', '81');
INSERT INTO `ssc_c` VALUES ('272', '271', '3', '6', '2', '24', '14', '-1', '21', '1', '8', '7', '-1', '2', '-1', '2', '-1', '3', '3', '1', '-1', '1', '4', '-1', '4', '7', '-1', '14', '5', '1', '11', '8', '6', '82');
INSERT INTO `ssc_c` VALUES ('273', '272', '4', '7', '3', '25', '15', '-1', '22', '2', '9', '8', '-1', '3', '-1', '3', '-1', '4', '4', '2', '-1', '2', '-1', '1', '-1', '8', '1', '15', '6', '2', '12', '9', '7', '83');
INSERT INTO `ssc_c` VALUES ('274', '273', '5', '8', '-1', '26', '16', '1', '23', '3', '10', '9', '1', '-1', '1', '-1', '-1', '5', '5', '3', '-1', '3', '1', '-1', '1', '9', '2', '-1', '7', '3', '13', '10', '8', '84');
INSERT INTO `ssc_c` VALUES ('275', '274', '6', '9', '1', '27', '17', '2', '24', '4', '11', '-1', '-1', '1', '-1', '1', '1', '-1', '-1', '4', '1', '-1', '2', '1', '2', '10', '3', '1', '8', '4', '14', '-1', '9', '85');
INSERT INTO `ssc_c` VALUES ('276', '275', '7', '10', '2', '28', '18', '3', '25', '5', '12', '-1', '-1', '2', '-1', '2', '2', '-1', '-1', '5', '2', '1', '-1', '2', '-1', '11', '4', '2', '9', '5', '15', '1', '10', '86');
INSERT INTO `ssc_c` VALUES ('277', '276', '8', '11', '3', '29', '19', '4', '26', '6', '13', '-1', '-1', '3', '-1', '3', '3', '-1', '-1', '6', '3', '2', '-1', '3', '-1', '12', '5', '3', '10', '6', '16', '2', '11', '87');
INSERT INTO `ssc_c` VALUES ('278', '277', '9', '12', '4', '30', '20', '-1', '27', '7', '14', '1', '-1', '4', '-1', '4', '-1', '1', '1', '7', '-1', '3', '1', '-1', '1', '13', '6', '4', '-1', '7', '17', '3', '12', '88');
INSERT INTO `ssc_c` VALUES ('279', '278', '10', '13', '5', '31', '-1', '1', '28', '8', '15', '2', '1', '-1', '1', '-1', '1', '-1', '2', '-1', '1', '4', '2', '-1', '2', '-1', '7', '5', '1', '8', '18', '4', '13', '89');
INSERT INTO `ssc_c` VALUES ('280', '279', '11', '14', '6', '32', '1', '2', '-1', '9', '16', '3', '-1', '1', '2', '-1', '2', '-1', '-1', '1', '2', '-1', '3', '1', '3', '1', '-1', '6', '2', '9', '19', '5', '14', '90');
INSERT INTO `ssc_c` VALUES ('281', '280', '-1', '15', '7', '33', '2', '3', '1', '10', '17', '4', '1', '-1', '3', '-1', '3', '-1', '-1', '2', '3', '1', '4', '-1', '4', '2', '1', '7', '3', '10', '-1', '6', '15', '91');
INSERT INTO `ssc_c` VALUES ('282', '281', '1', '16', '8', '34', '-1', '4', '2', '11', '18', '5', '2', '-1', '4', '-1', '4', '-1', '1', '-1', '4', '-1', '5', '1', '5', '3', '2', '8', '-1', '11', '1', '7', '16', '92');
INSERT INTO `ssc_c` VALUES ('283', '282', '2', '17', '9', '35', '1', '5', '3', '-1', '19', '6', '-1', '1', '-1', '1', '-1', '1', '2', '-1', '5', '-1', '6', '2', '6', '4', '3', '-1', '1', '12', '2', '8', '17', '93');
INSERT INTO `ssc_c` VALUES ('284', '283', '-1', '18', '10', '36', '2', '6', '4', '1', '20', '7', '1', '-1', '1', '-1', '1', '-1', '-1', '1', '6', '1', '7', '-1', '7', '5', '4', '1', '2', '13', '3', '-1', '18', '94');
INSERT INTO `ssc_c` VALUES ('285', '284', '1', '19', '11', '37', '-1', '7', '5', '2', '21', '8', '2', '-1', '2', '-1', '2', '-1', '1', '-1', '7', '-1', '8', '1', '8', '6', '5', '2', '-1', '14', '4', '1', '19', '95');
INSERT INTO `ssc_c` VALUES ('286', '285', '2', '20', '12', '38', '1', '8', '-1', '3', '22', '9', '-1', '1', '3', '-1', '3', '-1', '-1', '1', '8', '-1', '9', '2', '9', '7', '-1', '3', '1', '15', '5', '2', '20', '96');
INSERT INTO `ssc_c` VALUES ('287', '286', '-1', '21', '13', '39', '2', '9', '1', '4', '23', '10', '1', '-1', '4', '-1', '4', '-1', '-1', '2', '9', '1', '10', '-1', '10', '8', '1', '4', '2', '16', '-1', '3', '21', '97');
INSERT INTO `ssc_c` VALUES ('288', '287', '1', '-1', '14', '40', '3', '10', '2', '5', '24', '11', '2', '-1', '-1', '1', '-1', '1', '1', '-1', '10', '-1', '11', '1', '11', '-1', '2', '5', '3', '17', '1', '4', '22', '98');
INSERT INTO `ssc_c` VALUES ('289', '288', '-1', '1', '15', '41', '4', '11', '3', '6', '25', '12', '3', '-1', '1', '-1', '1', '-1', '-1', '1', '11', '1', '12', '-1', '12', '-1', '3', '6', '4', '18', '2', '5', '23', '99');
INSERT INTO `ssc_c` VALUES ('290', '289', '1', '2', '16', '42', '5', '12', '4', '-1', '26', '13', '-1', '1', '-1', '1', '-1', '1', '1', '-1', '12', '-1', '13', '1', '13', '1', '4', '7', '5', '19', '3', '-1', '24', '100');
INSERT INTO `ssc_c` VALUES ('291', '290', '2', '3', '17', '43', '6', '13', '5', '1', '-1', '14', '-1', '2', '1', '-1', '1', '-1', '2', '1', '-1', '-1', '14', '2', '14', '-1', '5', '8', '6', '20', '4', '1', '25', '101');
INSERT INTO `ssc_c` VALUES ('292', '291', '3', '4', '-1', '44', '7', '14', '6', '2', '1', '15', '1', '-1', '2', '-1', '-1', '1', '3', '2', '-1', '1', '15', '-1', '15', '1', '6', '9', '7', '21', '-1', '2', '26', '102');
INSERT INTO `ssc_c` VALUES ('293', '292', '4', '5', '1', '45', '8', '-1', '7', '3', '2', '16', '-1', '1', '-1', '1', '-1', '2', '4', '3', '-1', '-1', '16', '1', '16', '2', '7', '-1', '8', '22', '1', '3', '27', '103');
INSERT INTO `ssc_c` VALUES ('294', '293', '-1', '6', '2', '46', '9', '1', '8', '4', '3', '17', '1', '-1', '1', '-1', '1', '-1', '-1', '4', '1', '1', '17', '-1', '17', '3', '8', '1', '9', '-1', '2', '4', '28', '104');
INSERT INTO `ssc_c` VALUES ('295', '294', '1', '7', '3', '47', '-1', '2', '9', '5', '4', '18', '2', '-1', '2', '-1', '2', '-1', '1', '-1', '2', '-1', '18', '1', '18', '4', '9', '2', '-1', '1', '3', '5', '29', '105');
INSERT INTO `ssc_c` VALUES ('296', '295', '2', '8', '4', '48', '1', '3', '10', '6', '5', '-1', '-1', '1', '-1', '1', '3', '-1', '-1', '1', '3', '-1', '19', '2', '19', '5', '10', '3', '1', '-1', '4', '6', '30', '106');
INSERT INTO `ssc_c` VALUES ('297', '296', '3', '9', '5', '49', '2', '4', '11', '-1', '6', '1', '-1', '2', '-1', '2', '-1', '1', '1', '-1', '4', '1', '20', '-1', '20', '6', '-1', '4', '2', '1', '5', '7', '31', '107');
INSERT INTO `ssc_c` VALUES ('298', '297', '4', '10', '6', '50', '3', '5', '-1', '1', '7', '2', '-1', '3', '1', '-1', '1', '-1', '-1', '1', '5', '2', '21', '-1', '21', '-1', '1', '5', '3', '2', '6', '8', '32', '108');
INSERT INTO `ssc_c` VALUES ('299', '298', '5', '11', '7', '51', '4', '-1', '1', '2', '8', '3', '-1', '4', '-1', '1', '-1', '1', '1', '2', '-1', '3', '22', '-1', '22', '-1', '2', '6', '4', '3', '7', '9', '33', '109');
INSERT INTO `ssc_c` VALUES ('300', '299', '6', '-1', '8', '52', '5', '1', '2', '3', '9', '4', '1', '-1', '-1', '2', '-1', '2', '2', '-1', '1', '4', '23', '-1', '23', '1', '3', '7', '-1', '4', '8', '10', '34', '110');
INSERT INTO `ssc_c` VALUES ('301', '300', '7', '1', '9', '53', '6', '2', '-1', '4', '10', '5', '-1', '1', '1', '-1', '1', '-1', '-1', '1', '2', '-1', '24', '1', '24', '2', '4', '8', '1', '-1', '9', '11', '35', '111');
INSERT INTO `ssc_c` VALUES ('302', '301', '8', '2', '10', '54', '7', '3', '-1', '5', '11', '6', '-1', '2', '2', '-1', '2', '-1', '-1', '2', '3', '1', '-1', '2', '-1', '3', '5', '9', '2', '1', '10', '12', '36', '112');
INSERT INTO `ssc_c` VALUES ('303', '302', '9', '3', '11', '55', '8', '-1', '1', '6', '12', '7', '-1', '3', '-1', '1', '-1', '1', '1', '3', '-1', '2', '1', '-1', '1', '-1', '6', '10', '3', '2', '11', '13', '37', '113');
INSERT INTO `ssc_c` VALUES ('304', '303', '10', '4', '12', '56', '9', '1', '2', '7', '-1', '8', '-1', '4', '1', '-1', '1', '-1', '2', '4', '-1', '-1', '2', '1', '2', '1', '7', '-1', '4', '3', '12', '14', '38', '114');
INSERT INTO `ssc_c` VALUES ('305', '304', '11', '5', '-1', '57', '10', '2', '3', '8', '1', '9', '1', '-1', '2', '-1', '-1', '1', '3', '5', '-1', '1', '3', '-1', '3', '2', '8', '1', '5', '4', '-1', '15', '39', '115');
INSERT INTO `ssc_c` VALUES ('306', '305', '12', '6', '1', '58', '11', '3', '4', '-1', '2', '10', '-1', '1', '-1', '1', '-1', '2', '4', '-1', '1', '-1', '4', '1', '4', '3', '9', '2', '6', '-1', '1', '16', '40', '116');
INSERT INTO `ssc_c` VALUES ('307', '306', '13', '7', '2', '-1', '12', '4', '5', '1', '3', '11', '1', '-1', '-1', '2', '-1', '3', '-1', '1', '2', '1', '5', '-1', '5', '4', '10', '3', '-1', '1', '2', '17', '41', '117');
INSERT INTO `ssc_c` VALUES ('308', '307', '14', '8', '3', '1', '13', '5', '6', '-1', '4', '12', '-1', '1', '-1', '3', '-1', '4', '1', '-1', '3', '-1', '6', '1', '6', '5', '11', '4', '-1', '2', '3', '18', '42', '118');
INSERT INTO `ssc_c` VALUES ('309', '308', '15', '9', '4', '2', '14', '6', '7', '1', '5', '-1', '-1', '2', '-1', '4', '1', '-1', '-1', '1', '4', '-1', '7', '2', '7', '6', '-1', '5', '1', '3', '4', '19', '43', '119');
INSERT INTO `ssc_c` VALUES ('310', '309', '16', '10', '5', '3', '15', '7', '8', '2', '-1', '1', '-1', '3', '1', '-1', '2', '-1', '1', '2', '-1', '1', '8', '-1', '8', '-1', '1', '6', '2', '4', '5', '20', '44', '120');

-- ----------------------------
-- Table structure for `ssc_d`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_d`;
CREATE TABLE `ssc_d` (
  `id` int(11) NOT NULL auto_increment,
  `sscid` int(11) NOT NULL,
  `n0` int(3) NOT NULL,
  `n1` int(3) NOT NULL,
  `n2` int(3) NOT NULL,
  `n3` int(3) NOT NULL,
  `n4` int(3) NOT NULL,
  `n5` int(3) NOT NULL,
  `n6` int(3) NOT NULL,
  `n7` int(3) NOT NULL,
  `n8` int(3) NOT NULL,
  `n9` int(3) NOT NULL,
  `da` int(3) NOT NULL,
  `xiao` int(3) NOT NULL,
  `ji` int(3) NOT NULL,
  `ou` int(3) NOT NULL,
  `zhi` int(3) NOT NULL,
  `he` int(3) NOT NULL,
  `lu0` int(3) NOT NULL,
  `lu1` int(3) NOT NULL,
  `lu2` int(3) NOT NULL,
  `sheng` int(3) NOT NULL,
  `ping` int(3) NOT NULL,
  `jiang` int(3) NOT NULL,
  `z0` int(3) NOT NULL,
  `z1` int(3) NOT NULL,
  `z2` int(3) NOT NULL,
  `z3` int(3) NOT NULL,
  `z4` int(3) NOT NULL,
  `z5` int(3) NOT NULL,
  `z6` int(3) NOT NULL,
  `z7` int(3) NOT NULL,
  `z8` int(3) NOT NULL,
  `z9` int(3) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssc_d
-- ----------------------------
INSERT INTO `ssc_d` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '-1', '-1', '1', '-1', '1', '1', '-1', '-1', '1', '1', '-1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '-1');
INSERT INTO `ssc_d` VALUES ('2', '2', '2', '2', '-1', '2', '2', '2', '2', '2', '2', '1', '1', '-1', '1', '-1', '-1', '1', '1', '2', '-1', '1', '2', '-1', '2', '2', '2', '2', '2', '2', '2', '-1', '2', '1');
INSERT INTO `ssc_d` VALUES ('3', '3', '3', '3', '1', '3', '3', '3', '3', '-1', '3', '2', '-1', '1', '-1', '1', '-1', '2', '2', '-1', '1', '-1', '3', '1', '3', '3', '3', '3', '3', '-1', '3', '1', '3', '2');
INSERT INTO `ssc_d` VALUES ('4', '4', '4', '4', '2', '4', '4', '4', '4', '-1', '4', '3', '-1', '2', '-1', '2', '-1', '3', '3', '-1', '2', '1', '-1', '2', '-1', '4', '4', '4', '4', '1', '4', '2', '4', '3');
INSERT INTO `ssc_d` VALUES ('5', '5', '5', '5', '-1', '5', '5', '5', '5', '1', '5', '4', '1', '-1', '1', '-1', '-1', '4', '4', '1', '-1', '2', '1', '-1', '1', '5', '5', '5', '5', '-1', '5', '3', '5', '4');
INSERT INTO `ssc_d` VALUES ('6', '6', '6', '6', '1', '6', '6', '6', '6', '-1', '6', '5', '-1', '1', '-1', '1', '-1', '5', '5', '-1', '1', '-1', '2', '1', '2', '6', '6', '6', '6', '-1', '6', '4', '6', '5');
INSERT INTO `ssc_d` VALUES ('7', '7', '7', '7', '2', '7', '7', '7', '7', '-1', '7', '6', '-1', '2', '-1', '2', '-1', '6', '6', '-1', '2', '1', '-1', '2', '-1', '7', '7', '7', '7', '1', '7', '5', '7', '6');
INSERT INTO `ssc_d` VALUES ('8', '8', '8', '8', '3', '8', '8', '8', '8', '1', '-1', '7', '-1', '3', '1', '-1', '1', '-1', '7', '1', '-1', '-1', '1', '3', '1', '-1', '8', '8', '8', '2', '8', '6', '8', '7');
INSERT INTO `ssc_d` VALUES ('9', '9', '9', '9', '4', '9', '-1', '9', '9', '2', '1', '8', '1', '-1', '2', '-1', '2', '-1', '8', '-1', '1', '1', '2', '-1', '2', '1', '9', '9', '-1', '3', '9', '7', '9', '8');
INSERT INTO `ssc_d` VALUES ('10', '10', '10', '10', '5', '10', '1', '10', '10', '3', '-1', '9', '-1', '1', '3', '-1', '3', '-1', '9', '1', '-1', '-1', '3', '1', '3', '2', '10', '10', '-1', '4', '10', '8', '10', '9');
INSERT INTO `ssc_d` VALUES ('11', '11', '11', '11', '-1', '11', '2', '11', '11', '4', '1', '10', '1', '-1', '4', '-1', '-1', '1', '10', '2', '-1', '1', '4', '-1', '4', '3', '11', '11', '1', '5', '-1', '9', '11', '10');
INSERT INTO `ssc_d` VALUES ('12', '12', '12', '12', '1', '12', '3', '12', '12', '5', '2', '-1', '-1', '1', '-1', '1', '1', '-1', '-1', '3', '1', '-1', '5', '1', '5', '4', '12', '12', '2', '6', '1', '-1', '12', '11');
INSERT INTO `ssc_d` VALUES ('13', '13', '13', '13', '2', '13', '4', '13', '13', '6', '-1', '1', '-1', '2', '1', '-1', '2', '-1', '1', '4', '-1', '1', '6', '-1', '6', '-1', '13', '13', '3', '7', '2', '1', '13', '12');
INSERT INTO `ssc_d` VALUES ('14', '14', '14', '-1', '3', '14', '5', '14', '14', '7', '1', '2', '1', '-1', '-1', '1', '-1', '1', '2', '-1', '1', '2', '7', '-1', '7', '1', '14', '14', '4', '8', '3', '-1', '14', '13');
INSERT INTO `ssc_d` VALUES ('15', '15', '15', '1', '4', '15', '6', '15', '15', '8', '2', '-1', '-1', '1', '-1', '2', '1', '-1', '-1', '1', '2', '-1', '8', '1', '8', '2', '15', '15', '5', '9', '4', '1', '-1', '14');
INSERT INTO `ssc_d` VALUES ('16', '16', '16', '2', '5', '-1', '7', '16', '16', '9', '3', '1', '1', '-1', '-1', '3', '-1', '1', '-1', '2', '3', '1', '9', '-1', '9', '3', '16', '16', '6', '10', '-1', '2', '1', '15');
INSERT INTO `ssc_d` VALUES ('17', '17', '-1', '3', '6', '1', '8', '17', '17', '10', '4', '2', '2', '-1', '1', '-1', '1', '-1', '-1', '3', '4', '2', '10', '-1', '10', '4', '17', '-1', '7', '11', '1', '3', '2', '16');
INSERT INTO `ssc_d` VALUES ('18', '18', '1', '4', '7', '2', '9', '18', '-1', '11', '5', '3', '-1', '1', '2', '-1', '2', '-1', '-1', '4', '5', '-1', '11', '1', '11', '5', '18', '1', '8', '12', '-1', '4', '3', '17');
INSERT INTO `ssc_d` VALUES ('19', '19', '2', '5', '8', '3', '10', '19', '-1', '12', '6', '4', '-1', '2', '3', '-1', '3', '-1', '-1', '5', '6', '1', '-1', '2', '-1', '6', '19', '2', '9', '13', '1', '5', '4', '18');
INSERT INTO `ssc_d` VALUES ('20', '20', '3', '6', '9', '4', '11', '20', '1', '13', '-1', '5', '-1', '3', '4', '-1', '4', '-1', '1', '6', '-1', '-1', '1', '3', '1', '7', '-1', '3', '10', '14', '2', '6', '5', '19');
INSERT INTO `ssc_d` VALUES ('21', '21', '4', '7', '10', '5', '12', '21', '2', '14', '-1', '6', '-1', '4', '5', '-1', '5', '-1', '2', '7', '-1', '1', '-1', '4', '-1', '8', '1', '4', '11', '15', '3', '7', '6', '20');
INSERT INTO `ssc_d` VALUES ('22', '22', '5', '8', '11', '6', '13', '22', '-1', '15', '1', '7', '-1', '5', '6', '-1', '6', '-1', '-1', '8', '1', '2', '1', '-1', '1', '9', '-1', '5', '12', '16', '4', '8', '7', '21');
INSERT INTO `ssc_d` VALUES ('23', '23', '6', '9', '12', '7', '14', '23', '1', '-1', '2', '8', '-1', '6', '-1', '1', '-1', '1', '1', '-1', '2', '-1', '2', '1', '2', '-1', '1', '6', '13', '17', '5', '9', '8', '22');
INSERT INTO `ssc_d` VALUES ('24', '24', '7', '10', '13', '8', '15', '24', '2', '-1', '3', '9', '-1', '7', '-1', '2', '-1', '2', '2', '-1', '3', '1', '-1', '2', '-1', '1', '2', '7', '14', '18', '6', '10', '9', '23');
INSERT INTO `ssc_d` VALUES ('25', '25', '8', '-1', '14', '9', '16', '25', '3', '1', '4', '10', '1', '-1', '-1', '3', '-1', '3', '3', '-1', '4', '2', '1', '-1', '1', '2', '3', '8', '15', '19', '-1', '11', '10', '24');
INSERT INTO `ssc_d` VALUES ('26', '26', '9', '1', '15', '10', '17', '26', '4', '2', '-1', '11', '-1', '1', '1', '-1', '1', '-1', '4', '1', '-1', '-1', '2', '1', '2', '3', '4', '9', '16', '20', '1', '-1', '11', '25');
INSERT INTO `ssc_d` VALUES ('27', '27', '10', '2', '16', '11', '18', '27', '5', '-1', '1', '12', '-1', '2', '-1', '1', '-1', '1', '5', '-1', '1', '1', '3', '-1', '3', '-1', '5', '10', '17', '21', '2', '1', '12', '26');
INSERT INTO `ssc_d` VALUES ('28', '28', '11', '-1', '17', '12', '19', '28', '6', '1', '2', '13', '1', '-1', '-1', '2', '-1', '2', '6', '-1', '2', '2', '4', '-1', '4', '1', '6', '11', '18', '22', '-1', '2', '13', '27');
INSERT INTO `ssc_d` VALUES ('29', '29', '12', '1', '18', '13', '20', '29', '7', '2', '-1', '14', '-1', '1', '1', '-1', '1', '-1', '7', '1', '-1', '-1', '5', '1', '5', '2', '7', '12', '19', '23', '1', '-1', '14', '28');
INSERT INTO `ssc_d` VALUES ('30', '30', '-1', '2', '19', '14', '21', '30', '8', '3', '1', '15', '1', '-1', '2', '-1', '2', '-1', '-1', '2', '1', '1', '6', '-1', '6', '3', '8', '13', '20', '24', '2', '1', '-1', '29');
INSERT INTO `ssc_d` VALUES ('31', '31', '-1', '3', '20', '15', '22', '31', '9', '4', '2', '16', '2', '-1', '3', '-1', '3', '-1', '-1', '3', '2', '2', '-1', '1', '-1', '4', '9', '14', '21', '25', '3', '2', '1', '30');
INSERT INTO `ssc_d` VALUES ('32', '32', '1', '4', '21', '16', '23', '32', '10', '5', '3', '-1', '-1', '1', '-1', '1', '4', '-1', '-1', '4', '3', '-1', '1', '2', '1', '5', '10', '15', '22', '26', '4', '3', '2', '-1');
INSERT INTO `ssc_d` VALUES ('33', '33', '2', '5', '22', '17', '24', '33', '11', '-1', '4', '1', '-1', '2', '-1', '2', '-1', '1', '1', '-1', '4', '1', '2', '-1', '2', '6', '-1', '16', '23', '27', '5', '4', '3', '1');
INSERT INTO `ssc_d` VALUES ('34', '34', '3', '6', '23', '18', '25', '-1', '12', '1', '5', '2', '-1', '3', '-1', '3', '-1', '2', '2', '1', '-1', '2', '3', '-1', '3', '7', '-1', '17', '24', '28', '6', '5', '4', '2');
INSERT INTO `ssc_d` VALUES ('35', '35', '4', '-1', '24', '19', '26', '1', '13', '2', '6', '3', '1', '-1', '-1', '4', '-1', '3', '3', '-1', '1', '3', '4', '-1', '4', '8', '1', '18', '-1', '29', '7', '6', '5', '3');
INSERT INTO `ssc_d` VALUES ('36', '36', '5', '1', '25', '20', '27', '2', '14', '-1', '7', '4', '-1', '1', '-1', '5', '-1', '4', '4', '-1', '2', '-1', '5', '1', '5', '9', '2', '19', '1', '30', '-1', '7', '6', '4');
INSERT INTO `ssc_d` VALUES ('37', '37', '6', '2', '26', '21', '28', '3', '-1', '1', '8', '5', '-1', '2', '1', '-1', '1', '-1', '-1', '1', '3', '1', '6', '-1', '6', '-1', '3', '20', '2', '31', '1', '8', '7', '5');
INSERT INTO `ssc_d` VALUES ('38', '38', '7', '3', '27', '22', '-1', '4', '1', '2', '9', '6', '1', '-1', '2', '-1', '2', '-1', '1', '-1', '4', '2', '7', '-1', '7', '1', '-1', '21', '3', '32', '2', '9', '8', '6');
INSERT INTO `ssc_d` VALUES ('39', '39', '8', '4', '28', '23', '-1', '5', '2', '3', '10', '7', '2', '-1', '3', '-1', '3', '-1', '2', '-1', '5', '3', '-1', '1', '-1', '2', '1', '22', '4', '33', '3', '10', '9', '7');
INSERT INTO `ssc_d` VALUES ('40', '40', '9', '5', '29', '24', '1', '6', '3', '4', '-1', '8', '-1', '1', '4', '-1', '4', '-1', '3', '1', '-1', '-1', '1', '2', '1', '3', '2', '23', '-1', '34', '4', '11', '10', '8');
INSERT INTO `ssc_d` VALUES ('41', '41', '10', '6', '30', '25', '-1', '7', '4', '5', '1', '9', '1', '-1', '5', '-1', '5', '-1', '4', '-1', '1', '1', '2', '-1', '2', '4', '3', '24', '-1', '35', '5', '12', '11', '9');
INSERT INTO `ssc_d` VALUES ('42', '42', '11', '7', '31', '26', '1', '-1', '5', '6', '2', '10', '-1', '1', '-1', '1', '-1', '1', '5', '1', '-1', '-1', '3', '1', '3', '-1', '4', '25', '1', '36', '6', '13', '12', '10');
INSERT INTO `ssc_d` VALUES ('43', '43', '12', '8', '32', '27', '2', '-1', '6', '7', '3', '11', '-1', '2', '-1', '2', '-1', '2', '6', '2', '-1', '1', '-1', '2', '-1', '1', '5', '26', '2', '37', '7', '14', '13', '11');
INSERT INTO `ssc_d` VALUES ('44', '44', '13', '9', '33', '28', '3', '-1', '7', '8', '4', '12', '-1', '3', '-1', '3', '-1', '3', '7', '3', '-1', '2', '-1', '3', '-1', '2', '6', '27', '3', '38', '8', '15', '14', '12');
INSERT INTO `ssc_d` VALUES ('45', '45', '14', '10', '34', '29', '4', '1', '8', '9', '-1', '13', '-1', '4', '1', '-1', '1', '-1', '8', '4', '-1', '-1', '1', '4', '1', '3', '7', '-1', '4', '39', '9', '16', '15', '13');
INSERT INTO `ssc_d` VALUES ('46', '46', '15', '11', '35', '30', '5', '-1', '9', '10', '1', '14', '-1', '5', '-1', '1', '-1', '1', '9', '5', '-1', '1', '2', '-1', '2', '4', '8', '-1', '5', '40', '10', '17', '16', '14');
INSERT INTO `ssc_d` VALUES ('47', '47', '16', '12', '36', '31', '6', '1', '-1', '11', '2', '15', '-1', '6', '1', '-1', '1', '-1', '-1', '6', '1', '-1', '3', '1', '3', '-1', '9', '1', '6', '41', '11', '18', '17', '15');
INSERT INTO `ssc_d` VALUES ('48', '48', '17', '13', '37', '-1', '7', '2', '1', '12', '3', '16', '1', '-1', '-1', '1', '-1', '1', '-1', '7', '2', '1', '4', '-1', '4', '1', '10', '-1', '7', '42', '12', '19', '18', '16');
INSERT INTO `ssc_d` VALUES ('49', '49', '18', '14', '38', '1', '8', '3', '-1', '13', '4', '17', '-1', '1', '1', '-1', '1', '-1', '-1', '8', '3', '-1', '5', '1', '5', '2', '11', '-1', '8', '43', '13', '20', '19', '17');
INSERT INTO `ssc_d` VALUES ('50', '50', '19', '15', '39', '2', '9', '4', '-1', '14', '5', '18', '-1', '2', '2', '-1', '2', '-1', '-1', '9', '4', '1', '-1', '2', '-1', '3', '12', '1', '9', '44', '14', '21', '20', '18');
INSERT INTO `ssc_d` VALUES ('51', '51', '20', '16', '40', '-1', '10', '5', '1', '15', '6', '19', '1', '-1', '-1', '1', '-1', '1', '-1', '10', '5', '2', '1', '-1', '1', '4', '13', '-1', '10', '45', '15', '22', '21', '19');
INSERT INTO `ssc_d` VALUES ('52', '52', '21', '-1', '41', '1', '11', '6', '2', '16', '7', '20', '2', '-1', '-1', '2', '-1', '2', '1', '-1', '6', '3', '2', '-1', '2', '5', '-1', '1', '11', '46', '16', '23', '22', '20');
INSERT INTO `ssc_d` VALUES ('53', '53', '22', '1', '42', '2', '12', '7', '-1', '17', '8', '21', '-1', '1', '1', '-1', '1', '-1', '-1', '1', '7', '-1', '3', '1', '3', '6', '1', '2', '12', '-1', '17', '24', '23', '21');
INSERT INTO `ssc_d` VALUES ('54', '54', '-1', '2', '43', '3', '13', '8', '1', '18', '9', '22', '1', '-1', '2', '-1', '2', '-1', '-1', '2', '8', '1', '4', '-1', '4', '7', '2', '3', '13', '1', '-1', '25', '24', '22');
INSERT INTO `ssc_d` VALUES ('55', '55', '1', '3', '44', '4', '14', '9', '2', '-1', '10', '23', '-1', '1', '-1', '1', '-1', '1', '1', '-1', '9', '-1', '5', '1', '5', '8', '3', '4', '14', '2', '1', '-1', '25', '23');
INSERT INTO `ssc_d` VALUES ('56', '56', '2', '4', '45', '5', '15', '10', '3', '1', '11', '-1', '-1', '2', '-1', '2', '1', '-1', '-1', '1', '10', '-1', '6', '2', '6', '9', '-1', '5', '15', '3', '2', '1', '26', '24');
INSERT INTO `ssc_d` VALUES ('57', '57', '3', '5', '46', '6', '16', '11', '4', '-1', '12', '1', '-1', '3', '-1', '3', '-1', '1', '1', '-1', '11', '1', '7', '-1', '7', '10', '-1', '6', '16', '4', '3', '2', '27', '25');
INSERT INTO `ssc_d` VALUES ('58', '58', '4', '6', '-1', '7', '17', '12', '5', '1', '13', '2', '1', '-1', '1', '-1', '-1', '2', '2', '1', '-1', '2', '8', '-1', '8', '11', '1', '7', '17', '-1', '4', '3', '28', '26');
INSERT INTO `ssc_d` VALUES ('59', '59', '5', '7', '1', '8', '18', '13', '6', '-1', '14', '3', '-1', '1', '-1', '1', '-1', '3', '3', '-1', '1', '-1', '9', '1', '9', '12', '2', '8', '18', '-1', '5', '4', '29', '27');
INSERT INTO `ssc_d` VALUES ('60', '60', '-1', '8', '2', '9', '19', '14', '7', '1', '15', '4', '1', '-1', '1', '-1', '1', '-1', '-1', '1', '2', '1', '10', '-1', '10', '13', '3', '9', '19', '1', '6', '-1', '30', '28');
INSERT INTO `ssc_d` VALUES ('61', '61', '1', '9', '3', '10', '-1', '15', '8', '2', '16', '5', '2', '-1', '2', '-1', '2', '-1', '1', '-1', '3', '-1', '11', '1', '11', '14', '4', '10', '-1', '2', '7', '1', '31', '29');
INSERT INTO `ssc_d` VALUES ('62', '62', '2', '10', '-1', '11', '1', '16', '9', '3', '17', '6', '3', '-1', '3', '-1', '-1', '1', '2', '1', '-1', '1', '12', '-1', '12', '15', '-1', '11', '1', '3', '8', '2', '32', '30');
INSERT INTO `ssc_d` VALUES ('63', '63', '3', '-1', '1', '12', '2', '17', '10', '4', '18', '7', '4', '-1', '-1', '1', '-1', '2', '3', '-1', '1', '2', '13', '-1', '13', '-1', '1', '12', '2', '4', '9', '3', '33', '31');
INSERT INTO `ssc_d` VALUES ('64', '64', '-1', '1', '2', '13', '3', '18', '11', '5', '19', '8', '5', '-1', '1', '-1', '1', '-1', '-1', '1', '2', '3', '14', '-1', '14', '-1', '2', '13', '3', '5', '10', '4', '34', '32');
INSERT INTO `ssc_d` VALUES ('65', '65', '1', '2', '3', '14', '4', '19', '12', '-1', '20', '9', '-1', '1', '-1', '1', '-1', '1', '1', '-1', '3', '-1', '15', '1', '15', '1', '3', '14', '4', '6', '11', '-1', '35', '33');
INSERT INTO `ssc_d` VALUES ('66', '66', '2', '3', '4', '15', '5', '20', '13', '1', '21', '-1', '-1', '2', '-1', '2', '1', '-1', '-1', '1', '4', '-1', '16', '2', '16', '2', '-1', '15', '5', '7', '12', '1', '36', '34');
INSERT INTO `ssc_d` VALUES ('67', '67', '3', '4', '5', '16', '6', '21', '14', '2', '-1', '1', '-1', '3', '1', '-1', '2', '-1', '1', '2', '-1', '1', '17', '-1', '17', '-1', '1', '16', '6', '8', '13', '2', '37', '35');
INSERT INTO `ssc_d` VALUES ('68', '68', '4', '5', '6', '17', '7', '-1', '15', '3', '1', '2', '-1', '4', '-1', '1', '-1', '1', '2', '3', '-1', '2', '18', '-1', '18', '1', '2', '-1', '7', '9', '14', '3', '38', '36');
INSERT INTO `ssc_d` VALUES ('69', '69', '5', '6', '-1', '18', '8', '1', '16', '4', '2', '3', '1', '-1', '1', '-1', '-1', '2', '3', '4', '-1', '3', '19', '-1', '19', '2', '3', '-1', '8', '10', '15', '4', '39', '37');
INSERT INTO `ssc_d` VALUES ('70', '70', '6', '7', '1', '19', '9', '-1', '17', '5', '3', '4', '-1', '1', '-1', '1', '-1', '3', '4', '5', '-1', '-1', '20', '1', '20', '3', '4', '-1', '9', '11', '16', '5', '40', '38');
INSERT INTO `ssc_d` VALUES ('71', '71', '7', '8', '2', '20', '10', '1', '18', '-1', '4', '5', '-1', '2', '-1', '2', '-1', '4', '5', '-1', '1', '-1', '21', '2', '21', '4', '-1', '1', '10', '12', '17', '6', '41', '39');
INSERT INTO `ssc_d` VALUES ('72', '72', '8', '9', '3', '21', '11', '2', '19', '1', '-1', '6', '-1', '3', '1', '-1', '1', '-1', '6', '1', '-1', '-1', '22', '3', '22', '-1', '1', '2', '11', '13', '18', '7', '42', '40');
INSERT INTO `ssc_d` VALUES ('73', '73', '9', '10', '4', '22', '12', '3', '-1', '2', '1', '7', '-1', '4', '2', '-1', '2', '-1', '-1', '2', '1', '1', '23', '-1', '23', '1', '-1', '3', '12', '14', '19', '8', '43', '41');
INSERT INTO `ssc_d` VALUES ('74', '74', '10', '11', '5', '23', '13', '4', '-1', '3', '2', '8', '-1', '5', '3', '-1', '3', '-1', '-1', '3', '2', '2', '-1', '1', '-1', '2', '1', '4', '13', '15', '20', '9', '44', '42');
INSERT INTO `ssc_d` VALUES ('75', '75', '11', '12', '6', '24', '14', '-1', '1', '4', '3', '9', '-1', '6', '-1', '1', '-1', '1', '1', '4', '-1', '3', '1', '-1', '1', '-1', '2', '5', '14', '16', '21', '10', '45', '43');
INSERT INTO `ssc_d` VALUES ('76', '76', '12', '13', '7', '25', '15', '1', '2', '5', '4', '-1', '-1', '7', '-1', '2', '1', '-1', '-1', '5', '1', '-1', '2', '1', '2', '1', '3', '6', '-1', '17', '22', '11', '46', '44');
INSERT INTO `ssc_d` VALUES ('77', '77', '13', '14', '8', '26', '16', '2', '3', '-1', '5', '1', '-1', '8', '-1', '3', '-1', '1', '1', '-1', '2', '1', '3', '-1', '3', '2', '-1', '7', '1', '18', '23', '12', '47', '45');
INSERT INTO `ssc_d` VALUES ('78', '78', '14', '15', '9', '27', '17', '3', '4', '1', '6', '-1', '-1', '9', '-1', '4', '1', '-1', '-1', '1', '3', '-1', '4', '1', '4', '3', '-1', '8', '2', '19', '24', '13', '48', '46');
INSERT INTO `ssc_d` VALUES ('79', '79', '15', '16', '10', '-1', '18', '4', '5', '2', '7', '1', '1', '-1', '-1', '5', '-1', '1', '-1', '2', '4', '1', '5', '-1', '5', '4', '1', '9', '3', '20', '-1', '14', '49', '47');
INSERT INTO `ssc_d` VALUES ('80', '80', '16', '17', '11', '1', '-1', '5', '6', '3', '8', '2', '2', '-1', '1', '-1', '1', '-1', '1', '-1', '5', '-1', '6', '1', '6', '-1', '2', '10', '4', '21', '1', '15', '50', '48');
INSERT INTO `ssc_d` VALUES ('81', '81', '17', '18', '-1', '2', '1', '6', '7', '4', '9', '3', '3', '-1', '2', '-1', '-1', '1', '2', '1', '-1', '1', '7', '-1', '7', '1', '-1', '11', '5', '22', '2', '16', '51', '49');
INSERT INTO `ssc_d` VALUES ('82', '82', '18', '19', '1', '3', '2', '-1', '8', '5', '10', '4', '-1', '1', '-1', '1', '-1', '2', '3', '2', '-1', '-1', '8', '1', '8', '2', '1', '-1', '6', '23', '3', '17', '52', '50');
INSERT INTO `ssc_d` VALUES ('83', '83', '19', '20', '2', '4', '3', '1', '-1', '6', '11', '5', '-1', '2', '1', '-1', '1', '-1', '-1', '3', '1', '-1', '9', '2', '9', '-1', '2', '1', '7', '24', '4', '18', '53', '51');
INSERT INTO `ssc_d` VALUES ('84', '84', '20', '21', '3', '5', '4', '2', '1', '7', '12', '-1', '-1', '3', '-1', '1', '2', '-1', '-1', '4', '2', '-1', '10', '3', '10', '1', '3', '-1', '8', '25', '5', '19', '54', '52');
INSERT INTO `ssc_d` VALUES ('85', '85', '21', '22', '4', '6', '5', '3', '2', '8', '-1', '1', '-1', '4', '1', '-1', '3', '-1', '1', '5', '-1', '1', '11', '-1', '11', '-1', '4', '1', '9', '26', '6', '20', '55', '53');
INSERT INTO `ssc_d` VALUES ('86', '86', '22', '23', '5', '7', '-1', '4', '3', '9', '1', '2', '1', '-1', '2', '-1', '4', '-1', '2', '-1', '1', '2', '12', '-1', '12', '1', '5', '2', '-1', '27', '7', '21', '56', '54');
INSERT INTO `ssc_d` VALUES ('87', '87', '23', '24', '6', '8', '1', '5', '-1', '10', '2', '3', '-1', '1', '3', '-1', '5', '-1', '-1', '1', '2', '-1', '13', '1', '13', '2', '-1', '3', '1', '28', '8', '22', '57', '55');
INSERT INTO `ssc_d` VALUES ('88', '88', '24', '25', '7', '9', '2', '6', '1', '11', '3', '-1', '-1', '2', '-1', '1', '6', '-1', '-1', '2', '3', '-1', '14', '2', '14', '3', '1', '-1', '2', '29', '9', '23', '58', '56');
INSERT INTO `ssc_d` VALUES ('89', '89', '25', '26', '8', '-1', '3', '7', '2', '12', '4', '1', '1', '-1', '-1', '2', '-1', '1', '-1', '3', '4', '1', '15', '-1', '15', '4', '2', '1', '3', '30', '-1', '24', '59', '57');
INSERT INTO `ssc_d` VALUES ('90', '90', '26', '27', '-1', '1', '4', '8', '3', '13', '5', '2', '2', '-1', '1', '-1', '-1', '2', '1', '4', '-1', '2', '16', '-1', '16', '-1', '3', '2', '4', '31', '1', '25', '60', '58');
INSERT INTO `ssc_d` VALUES ('91', '91', '27', '28', '1', '2', '5', '9', '4', '14', '-1', '3', '-1', '1', '2', '-1', '1', '-1', '2', '5', '-1', '-1', '17', '1', '17', '1', '4', '3', '5', '32', '-1', '26', '61', '59');
INSERT INTO `ssc_d` VALUES ('92', '92', '28', '-1', '2', '3', '6', '10', '5', '15', '1', '4', '1', '-1', '-1', '1', '-1', '1', '3', '-1', '1', '1', '18', '-1', '18', '2', '5', '4', '6', '33', '1', '-1', '62', '60');
INSERT INTO `ssc_d` VALUES ('93', '93', '29', '1', '3', '4', '7', '11', '6', '16', '-1', '5', '-1', '1', '1', '-1', '1', '-1', '4', '1', '-1', '-1', '19', '1', '19', '3', '6', '5', '7', '34', '2', '-1', '63', '61');
INSERT INTO `ssc_d` VALUES ('94', '94', '30', '2', '4', '5', '-1', '12', '7', '17', '1', '6', '1', '-1', '2', '-1', '2', '-1', '5', '-1', '1', '1', '20', '-1', '20', '4', '7', '6', '-1', '35', '3', '1', '64', '62');
INSERT INTO `ssc_d` VALUES ('95', '95', '31', '3', '5', '6', '1', '13', '-1', '18', '2', '7', '-1', '1', '3', '-1', '3', '-1', '-1', '1', '2', '-1', '21', '1', '21', '5', '-1', '7', '1', '36', '4', '2', '65', '63');
INSERT INTO `ssc_d` VALUES ('96', '96', '32', '4', '6', '7', '2', '14', '1', '-1', '3', '8', '-1', '2', '-1', '1', '-1', '1', '1', '-1', '3', '-1', '22', '2', '22', '-1', '1', '8', '2', '37', '5', '3', '66', '64');
INSERT INTO `ssc_d` VALUES ('97', '97', '33', '5', '7', '8', '3', '15', '2', '1', '4', '-1', '-1', '3', '-1', '2', '1', '-1', '-1', '1', '4', '-1', '23', '3', '23', '1', '-1', '9', '3', '38', '6', '4', '67', '65');
INSERT INTO `ssc_d` VALUES ('98', '98', '-1', '6', '8', '9', '4', '16', '3', '2', '5', '1', '1', '-1', '1', '-1', '2', '-1', '-1', '2', '5', '1', '24', '-1', '24', '2', '1', '10', '4', '39', '7', '5', '68', '-1');
INSERT INTO `ssc_d` VALUES ('99', '99', '1', '7', '9', '10', '5', '-1', '4', '3', '6', '2', '-1', '1', '-1', '1', '-1', '1', '1', '3', '-1', '-1', '25', '1', '25', '3', '2', '11', '5', '-1', '8', '6', '69', '1');
INSERT INTO `ssc_d` VALUES ('100', '100', '2', '8', '10', '11', '6', '1', '5', '4', '-1', '3', '-1', '2', '1', '-1', '1', '-1', '2', '4', '-1', '-1', '26', '2', '26', '4', '3', '-1', '6', '1', '9', '7', '70', '2');
INSERT INTO `ssc_d` VALUES ('101', '101', '3', '9', '11', '-1', '7', '2', '6', '5', '1', '4', '1', '-1', '-1', '1', '-1', '1', '-1', '5', '1', '1', '27', '-1', '27', '5', '4', '1', '7', '-1', '10', '8', '71', '3');
INSERT INTO `ssc_d` VALUES ('102', '102', '4', '10', '-1', '1', '8', '3', '7', '6', '2', '5', '2', '-1', '1', '-1', '-1', '2', '1', '6', '-1', '2', '28', '-1', '28', '-1', '5', '2', '8', '1', '11', '9', '72', '4');
INSERT INTO `ssc_d` VALUES ('103', '103', '5', '11', '1', '2', '-1', '4', '8', '7', '3', '6', '3', '-1', '2', '-1', '1', '-1', '2', '-1', '1', '-1', '29', '1', '29', '1', '-1', '3', '9', '2', '12', '10', '73', '5');
INSERT INTO `ssc_d` VALUES ('104', '104', '6', '12', '2', '3', '1', '5', '9', '8', '4', '-1', '-1', '1', '-1', '1', '2', '-1', '-1', '1', '2', '-1', '30', '2', '30', '2', '1', '4', '10', '-1', '13', '11', '74', '6');
INSERT INTO `ssc_d` VALUES ('105', '105', '7', '13', '3', '-1', '2', '6', '10', '9', '5', '1', '1', '-1', '-1', '2', '-1', '1', '-1', '2', '3', '1', '31', '-1', '31', '3', '2', '5', '11', '1', '-1', '12', '75', '7');
INSERT INTO `ssc_d` VALUES ('106', '106', '8', '14', '4', '1', '3', '-1', '11', '10', '6', '2', '-1', '1', '-1', '3', '-1', '2', '1', '3', '-1', '-1', '32', '1', '32', '4', '-1', '6', '12', '2', '1', '13', '76', '8');
INSERT INTO `ssc_d` VALUES ('107', '107', '9', '15', '5', '2', '4', '1', '12', '-1', '7', '3', '-1', '2', '-1', '4', '-1', '3', '2', '-1', '1', '-1', '33', '2', '33', '5', '-1', '7', '13', '3', '2', '14', '77', '9');
INSERT INTO `ssc_d` VALUES ('108', '108', '10', '16', '6', '3', '5', '-1', '13', '1', '8', '4', '-1', '3', '-1', '5', '-1', '4', '3', '1', '-1', '1', '34', '-1', '34', '6', '-1', '8', '14', '4', '3', '15', '78', '10');
INSERT INTO `ssc_d` VALUES ('109', '109', '11', '-1', '7', '4', '6', '1', '14', '2', '9', '5', '1', '-1', '-1', '6', '-1', '5', '4', '-1', '1', '2', '35', '-1', '35', '7', '1', '9', '-1', '5', '4', '16', '79', '11');
INSERT INTO `ssc_d` VALUES ('110', '110', '12', '-1', '8', '5', '7', '2', '15', '3', '10', '6', '2', '-1', '-1', '7', '-1', '6', '5', '-1', '2', '3', '-1', '1', '-1', '8', '2', '10', '1', '6', '5', '17', '80', '12');
INSERT INTO `ssc_d` VALUES ('111', '111', '-1', '1', '9', '6', '8', '3', '16', '4', '11', '7', '3', '-1', '1', '-1', '1', '-1', '-1', '1', '3', '4', '1', '-1', '1', '-1', '3', '11', '2', '7', '6', '18', '81', '13');
INSERT INTO `ssc_d` VALUES ('112', '112', '1', '2', '10', '7', '9', '-1', '17', '5', '12', '8', '-1', '1', '-1', '1', '-1', '1', '1', '2', '-1', '-1', '2', '1', '2', '1', '4', '12', '3', '-1', '7', '19', '82', '14');
INSERT INTO `ssc_d` VALUES ('113', '113', '2', '3', '11', '8', '-1', '1', '18', '6', '13', '9', '1', '-1', '1', '-1', '1', '-1', '2', '-1', '1', '1', '3', '-1', '3', '-1', '5', '13', '4', '1', '8', '20', '83', '15');
INSERT INTO `ssc_d` VALUES ('114', '114', '3', '4', '12', '9', '1', '2', '19', '7', '-1', '10', '-1', '1', '2', '-1', '2', '-1', '3', '1', '-1', '-1', '4', '1', '4', '1', '6', '14', '-1', '2', '9', '21', '84', '16');
INSERT INTO `ssc_d` VALUES ('115', '115', '4', '5', '-1', '10', '2', '3', '20', '8', '1', '11', '1', '-1', '3', '-1', '-1', '1', '4', '2', '-1', '1', '5', '-1', '5', '2', '7', '15', '1', '3', '-1', '22', '85', '17');
INSERT INTO `ssc_d` VALUES ('116', '116', '5', '6', '1', '11', '3', '4', '21', '9', '2', '-1', '-1', '1', '-1', '1', '1', '-1', '-1', '3', '1', '-1', '6', '1', '6', '3', '8', '16', '2', '4', '1', '-1', '86', '18');
INSERT INTO `ssc_d` VALUES ('117', '117', '6', '7', '2', '12', '-1', '5', '22', '10', '3', '1', '1', '-1', '1', '-1', '2', '-1', '1', '-1', '2', '1', '7', '-1', '7', '4', '9', '17', '3', '-1', '2', '1', '87', '19');
INSERT INTO `ssc_d` VALUES ('118', '118', '-1', '8', '3', '13', '1', '6', '23', '11', '4', '2', '2', '-1', '2', '-1', '3', '-1', '-1', '1', '3', '2', '8', '-1', '8', '5', '10', '18', '-1', '1', '3', '2', '88', '20');
INSERT INTO `ssc_d` VALUES ('119', '119', '1', '9', '4', '14', '2', '7', '24', '12', '-1', '3', '-1', '1', '3', '-1', '4', '-1', '1', '2', '-1', '-1', '9', '1', '9', '6', '11', '19', '1', '2', '4', '3', '-1', '21');
INSERT INTO `ssc_d` VALUES ('120', '120', '2', '10', '5', '15', '3', '8', '25', '13', '1', '-1', '-1', '2', '-1', '1', '5', '-1', '-1', '3', '1', '-1', '10', '2', '10', '-1', '12', '20', '2', '3', '5', '4', '1', '22');
INSERT INTO `ssc_d` VALUES ('121', '121', '3', '11', '6', '16', '4', '9', '26', '14', '2', '-1', '-1', '3', '-1', '2', '6', '-1', '-1', '4', '2', '1', '-1', '3', '-1', '1', '13', '21', '3', '4', '6', '5', '2', '23');
INSERT INTO `ssc_d` VALUES ('122', '122', '4', '12', '7', '17', '-1', '10', '27', '15', '3', '1', '1', '-1', '1', '-1', '7', '-1', '1', '-1', '3', '2', '1', '-1', '1', '2', '14', '22', '4', '-1', '7', '6', '3', '24');
INSERT INTO `ssc_d` VALUES ('123', '123', '-1', '13', '8', '18', '1', '11', '28', '16', '4', '2', '2', '-1', '2', '-1', '8', '-1', '-1', '1', '4', '3', '2', '-1', '2', '3', '15', '23', '-1', '1', '8', '7', '4', '25');
INSERT INTO `ssc_d` VALUES ('124', '124', '1', '14', '9', '19', '2', '12', '29', '17', '5', '-1', '-1', '1', '-1', '1', '9', '-1', '-1', '2', '5', '-1', '3', '1', '3', '4', '16', '24', '1', '2', '9', '8', '5', '-1');
INSERT INTO `ssc_d` VALUES ('125', '125', '2', '15', '10', '20', '3', '-1', '30', '18', '6', '1', '-1', '2', '-1', '2', '-1', '1', '1', '3', '-1', '1', '4', '-1', '4', '5', '17', '25', '-1', '3', '10', '9', '6', '1');
INSERT INTO `ssc_d` VALUES ('126', '126', '3', '16', '11', '21', '4', '1', '31', '-1', '7', '2', '-1', '3', '-1', '3', '-1', '2', '2', '-1', '1', '-1', '5', '1', '5', '6', '-1', '26', '1', '4', '11', '10', '7', '2');
INSERT INTO `ssc_d` VALUES ('127', '127', '4', '17', '12', '22', '5', '2', '32', '1', '8', '-1', '-1', '4', '-1', '4', '1', '-1', '-1', '1', '2', '-1', '6', '2', '6', '7', '-1', '27', '2', '5', '12', '11', '8', '3');
INSERT INTO `ssc_d` VALUES ('128', '128', '5', '18', '13', '23', '6', '3', '33', '2', '9', '-1', '-1', '5', '-1', '5', '2', '-1', '-1', '2', '3', '1', '-1', '3', '-1', '8', '1', '28', '3', '6', '13', '12', '9', '4');
INSERT INTO `ssc_d` VALUES ('129', '129', '6', '19', '14', '24', '7', '4', '34', '3', '10', '-1', '-1', '6', '-1', '6', '3', '-1', '-1', '3', '4', '2', '-1', '4', '-1', '9', '2', '29', '4', '7', '14', '13', '10', '5');
INSERT INTO `ssc_d` VALUES ('130', '130', '7', '20', '15', '-1', '8', '5', '35', '4', '11', '1', '1', '-1', '-1', '7', '-1', '1', '-1', '4', '5', '3', '1', '-1', '1', '10', '3', '30', '5', '8', '-1', '14', '11', '6');
INSERT INTO `ssc_d` VALUES ('131', '131', '8', '21', '16', '1', '9', '6', '36', '5', '-1', '2', '-1', '1', '1', '-1', '1', '-1', '1', '5', '-1', '-1', '2', '1', '2', '11', '4', '31', '6', '-1', '1', '15', '12', '7');
INSERT INTO `ssc_d` VALUES ('132', '132', '9', '22', '17', '2', '10', '7', '37', '6', '1', '-1', '-1', '2', '-1', '1', '2', '-1', '-1', '6', '1', '-1', '3', '2', '3', '-1', '5', '32', '7', '1', '2', '16', '13', '8');
INSERT INTO `ssc_d` VALUES ('133', '133', '10', '23', '18', '3', '11', '8', '38', '7', '-1', '1', '-1', '3', '1', '-1', '3', '-1', '1', '7', '-1', '1', '4', '-1', '4', '-1', '6', '33', '8', '2', '3', '17', '14', '9');
INSERT INTO `ssc_d` VALUES ('134', '134', '11', '24', '19', '4', '12', '9', '39', '-1', '1', '2', '-1', '4', '-1', '1', '-1', '1', '2', '-1', '1', '2', '5', '-1', '5', '-1', '7', '34', '9', '3', '4', '18', '15', '10');
INSERT INTO `ssc_d` VALUES ('135', '135', '12', '25', '20', '5', '13', '10', '40', '1', '2', '-1', '-1', '5', '-1', '2', '1', '-1', '-1', '1', '2', '-1', '6', '1', '6', '1', '-1', '35', '10', '4', '5', '19', '16', '11');
INSERT INTO `ssc_d` VALUES ('136', '136', '13', '26', '21', '6', '14', '-1', '41', '2', '3', '1', '-1', '6', '-1', '3', '-1', '1', '1', '2', '-1', '1', '7', '-1', '7', '2', '1', '36', '-1', '5', '6', '20', '17', '12');
INSERT INTO `ssc_d` VALUES ('137', '137', '14', '27', '-1', '7', '15', '1', '42', '3', '4', '2', '1', '-1', '1', '-1', '-1', '2', '2', '3', '-1', '2', '8', '-1', '8', '3', '2', '-1', '1', '6', '7', '21', '18', '13');
INSERT INTO `ssc_d` VALUES ('138', '138', '15', '28', '1', '8', '-1', '2', '43', '4', '5', '3', '2', '-1', '2', '-1', '1', '-1', '3', '-1', '1', '-1', '9', '1', '9', '4', '-1', '1', '2', '7', '8', '22', '19', '14');
INSERT INTO `ssc_d` VALUES ('139', '139', '16', '29', '2', '9', '1', '3', '44', '-1', '6', '4', '-1', '1', '-1', '1', '-1', '1', '4', '-1', '2', '-1', '10', '2', '10', '5', '1', '-1', '3', '8', '9', '23', '20', '15');
INSERT INTO `ssc_d` VALUES ('140', '140', '17', '30', '3', '-1', '2', '4', '45', '1', '7', '5', '1', '-1', '-1', '2', '-1', '2', '-1', '1', '3', '1', '11', '-1', '11', '6', '2', '1', '-1', '9', '10', '24', '21', '16');
INSERT INTO `ssc_d` VALUES ('141', '141', '-1', '31', '4', '1', '3', '5', '46', '2', '8', '6', '2', '-1', '1', '-1', '1', '-1', '-1', '2', '4', '2', '12', '-1', '12', '7', '3', '-1', '1', '10', '11', '25', '22', '17');
INSERT INTO `ssc_d` VALUES ('142', '142', '1', '-1', '5', '2', '4', '6', '47', '3', '9', '7', '3', '-1', '-1', '1', '-1', '1', '1', '-1', '5', '-1', '13', '1', '13', '-1', '4', '1', '2', '11', '12', '26', '23', '18');
INSERT INTO `ssc_d` VALUES ('143', '143', '2', '1', '6', '3', '5', '7', '48', '4', '10', '-1', '-1', '1', '-1', '2', '1', '-1', '-1', '1', '6', '-1', '14', '2', '14', '1', '5', '2', '3', '12', '13', '27', '-1', '19');
INSERT INTO `ssc_d` VALUES ('144', '144', '3', '2', '7', '4', '6', '-1', '49', '5', '11', '1', '-1', '2', '-1', '3', '-1', '1', '1', '2', '-1', '1', '15', '-1', '15', '2', '6', '3', '-1', '13', '14', '28', '1', '20');
INSERT INTO `ssc_d` VALUES ('145', '145', '4', '-1', '8', '5', '7', '1', '50', '6', '12', '2', '1', '-1', '-1', '4', '-1', '2', '2', '-1', '1', '2', '16', '-1', '16', '3', '7', '4', '-1', '14', '15', '29', '2', '21');
INSERT INTO `ssc_d` VALUES ('146', '146', '5', '1', '9', '6', '8', '2', '-1', '7', '13', '3', '-1', '1', '1', '-1', '1', '-1', '-1', '1', '2', '-1', '17', '1', '17', '4', '8', '5', '1', '-1', '16', '30', '3', '22');
INSERT INTO `ssc_d` VALUES ('147', '147', '6', '2', '10', '7', '9', '3', '1', '8', '-1', '4', '-1', '2', '2', '-1', '2', '-1', '1', '2', '-1', '-1', '18', '2', '18', '5', '-1', '6', '2', '1', '17', '31', '4', '23');
INSERT INTO `ssc_d` VALUES ('148', '148', '7', '3', '11', '8', '10', '4', '2', '9', '1', '-1', '-1', '3', '-1', '1', '3', '-1', '-1', '3', '1', '-1', '19', '3', '19', '-1', '1', '7', '3', '2', '18', '32', '5', '24');
INSERT INTO `ssc_d` VALUES ('149', '149', '8', '4', '12', '9', '-1', '5', '3', '10', '2', '1', '1', '-1', '1', '-1', '4', '-1', '1', '-1', '2', '1', '20', '-1', '20', '1', '2', '8', '4', '-1', '19', '33', '6', '25');
INSERT INTO `ssc_d` VALUES ('150', '150', '9', '5', '13', '-1', '1', '6', '4', '11', '3', '2', '2', '-1', '-1', '1', '-1', '1', '-1', '1', '3', '2', '21', '-1', '21', '-1', '3', '9', '5', '1', '20', '34', '7', '26');
INSERT INTO `ssc_d` VALUES ('151', '151', '10', '6', '-1', '1', '2', '7', '5', '12', '4', '3', '3', '-1', '1', '-1', '-1', '2', '1', '2', '-1', '3', '22', '-1', '22', '-1', '4', '10', '6', '2', '21', '35', '8', '27');
INSERT INTO `ssc_d` VALUES ('152', '152', '11', '7', '1', '2', '3', '8', '6', '13', '5', '-1', '-1', '1', '-1', '1', '1', '-1', '-1', '3', '1', '-1', '23', '1', '23', '1', '5', '11', '7', '3', '22', '-1', '9', '28');
INSERT INTO `ssc_d` VALUES ('153', '153', '12', '8', '2', '3', '4', '9', '7', '14', '6', '-1', '-1', '2', '-1', '2', '2', '-1', '-1', '4', '2', '1', '-1', '2', '-1', '2', '6', '12', '8', '4', '23', '1', '10', '29');
INSERT INTO `ssc_d` VALUES ('154', '154', '13', '9', '3', '-1', '5', '10', '8', '15', '7', '1', '1', '-1', '-1', '3', '-1', '1', '-1', '5', '3', '2', '1', '-1', '1', '3', '7', '13', '9', '5', '-1', '2', '11', '30');
INSERT INTO `ssc_d` VALUES ('155', '155', '14', '10', '4', '1', '6', '11', '9', '16', '-1', '2', '-1', '1', '1', '-1', '1', '-1', '1', '6', '-1', '-1', '2', '1', '2', '4', '8', '14', '10', '-1', '1', '3', '12', '31');
INSERT INTO `ssc_d` VALUES ('156', '156', '-1', '11', '5', '2', '7', '12', '10', '17', '1', '3', '1', '-1', '2', '-1', '2', '-1', '-1', '7', '1', '1', '3', '-1', '3', '5', '9', '15', '11', '1', '2', '4', '-1', '32');
INSERT INTO `ssc_d` VALUES ('157', '157', '1', '-1', '6', '3', '8', '13', '11', '18', '2', '4', '2', '-1', '-1', '1', '-1', '1', '1', '-1', '2', '-1', '4', '1', '4', '-1', '10', '16', '12', '2', '3', '5', '1', '33');
INSERT INTO `ssc_d` VALUES ('158', '158', '2', '1', '7', '4', '9', '-1', '12', '19', '3', '5', '-1', '1', '-1', '2', '-1', '2', '2', '1', '-1', '-1', '5', '2', '5', '1', '11', '17', '-1', '3', '4', '6', '2', '34');
INSERT INTO `ssc_d` VALUES ('159', '159', '-1', '2', '8', '5', '10', '1', '13', '20', '4', '6', '1', '-1', '1', '-1', '1', '-1', '-1', '2', '1', '1', '6', '-1', '6', '2', '12', '18', '1', '-1', '5', '7', '3', '35');
INSERT INTO `ssc_d` VALUES ('160', '160', '1', '-1', '9', '6', '11', '2', '14', '21', '5', '7', '2', '-1', '-1', '1', '-1', '1', '1', '-1', '2', '-1', '7', '1', '7', '-1', '13', '19', '2', '1', '6', '8', '4', '36');
INSERT INTO `ssc_d` VALUES ('161', '161', '2', '1', '10', '7', '12', '3', '15', '22', '-1', '8', '-1', '1', '1', '-1', '1', '-1', '2', '1', '-1', '-1', '8', '2', '8', '1', '14', '20', '3', '2', '7', '-1', '5', '37');
INSERT INTO `ssc_d` VALUES ('162', '162', '-1', '2', '11', '8', '13', '4', '16', '23', '1', '9', '1', '-1', '2', '-1', '2', '-1', '-1', '2', '1', '1', '9', '-1', '9', '2', '15', '21', '4', '3', '8', '1', '-1', '38');
INSERT INTO `ssc_d` VALUES ('163', '163', '1', '-1', '12', '9', '14', '5', '17', '24', '2', '10', '2', '-1', '-1', '1', '-1', '1', '1', '-1', '2', '-1', '10', '1', '10', '-1', '16', '22', '5', '4', '9', '2', '1', '39');
INSERT INTO `ssc_d` VALUES ('164', '164', '-1', '1', '13', '10', '15', '6', '18', '25', '3', '11', '3', '-1', '1', '-1', '1', '-1', '-1', '1', '3', '1', '11', '-1', '11', '-1', '17', '23', '6', '5', '10', '3', '2', '40');
INSERT INTO `ssc_d` VALUES ('165', '165', '1', '2', '14', '11', '16', '7', '19', '26', '-1', '12', '-1', '1', '2', '-1', '2', '-1', '1', '2', '-1', '-1', '12', '1', '12', '1', '18', '24', '7', '6', '11', '4', '-1', '41');
INSERT INTO `ssc_d` VALUES ('166', '166', '2', '3', '15', '12', '17', '8', '-1', '27', '1', '13', '-1', '2', '3', '-1', '3', '-1', '-1', '3', '1', '1', '13', '-1', '13', '2', '-1', '25', '8', '7', '12', '5', '1', '42');
INSERT INTO `ssc_d` VALUES ('167', '167', '3', '4', '16', '13', '18', '9', '1', '28', '-1', '14', '-1', '3', '4', '-1', '4', '-1', '1', '4', '-1', '-1', '14', '1', '14', '3', '-1', '26', '9', '8', '13', '6', '2', '43');
INSERT INTO `ssc_d` VALUES ('168', '168', '4', '-1', '17', '14', '19', '10', '2', '29', '1', '15', '1', '-1', '-1', '1', '-1', '1', '2', '-1', '1', '1', '15', '-1', '15', '4', '1', '27', '10', '9', '14', '-1', '3', '44');
INSERT INTO `ssc_d` VALUES ('169', '169', '5', '1', '18', '15', '-1', '11', '3', '30', '2', '16', '2', '-1', '1', '-1', '1', '-1', '3', '-1', '2', '-1', '16', '1', '16', '5', '2', '-1', '11', '10', '15', '1', '4', '45');
INSERT INTO `ssc_d` VALUES ('170', '170', '6', '2', '19', '16', '1', '-1', '4', '31', '3', '17', '-1', '1', '-1', '1', '-1', '1', '4', '1', '-1', '-1', '17', '2', '17', '-1', '3', '1', '12', '11', '16', '2', '5', '46');
INSERT INTO `ssc_d` VALUES ('171', '171', '7', '3', '20', '-1', '2', '1', '5', '32', '4', '18', '1', '-1', '-1', '2', '-1', '2', '-1', '2', '1', '1', '18', '-1', '18', '1', '-1', '2', '13', '12', '17', '3', '6', '47');
INSERT INTO `ssc_d` VALUES ('172', '172', '8', '4', '21', '1', '3', '2', '6', '33', '-1', '19', '-1', '1', '1', '-1', '1', '-1', '1', '3', '-1', '-1', '19', '1', '19', '2', '1', '3', '14', '-1', '18', '4', '7', '48');
INSERT INTO `ssc_d` VALUES ('173', '173', '9', '5', '22', '2', '-1', '3', '7', '34', '1', '20', '1', '-1', '2', '-1', '2', '-1', '2', '-1', '1', '1', '20', '-1', '20', '3', '2', '4', '-1', '1', '19', '5', '8', '49');
INSERT INTO `ssc_d` VALUES ('174', '174', '10', '6', '23', '3', '1', '4', '8', '35', '-1', '21', '-1', '1', '3', '-1', '3', '-1', '3', '1', '-1', '-1', '21', '1', '21', '4', '3', '5', '-1', '2', '20', '6', '9', '50');
INSERT INTO `ssc_d` VALUES ('175', '175', '11', '7', '24', '4', '2', '5', '9', '36', '1', '-1', '-1', '2', '-1', '1', '4', '-1', '-1', '2', '1', '-1', '22', '2', '22', '-1', '4', '6', '1', '3', '21', '7', '10', '51');
INSERT INTO `ssc_d` VALUES ('176', '176', '-1', '8', '25', '5', '3', '6', '10', '37', '2', '1', '1', '-1', '1', '-1', '5', '-1', '-1', '3', '2', '1', '23', '-1', '23', '1', '5', '7', '2', '4', '22', '8', '11', '-1');
INSERT INTO `ssc_d` VALUES ('177', '177', '1', '9', '26', '6', '4', '7', '11', '38', '-1', '2', '-1', '1', '2', '-1', '6', '-1', '1', '4', '-1', '-1', '24', '1', '24', '2', '6', '8', '3', '5', '23', '9', '-1', '1');
INSERT INTO `ssc_d` VALUES ('178', '178', '2', '10', '27', '7', '5', '8', '12', '39', '-1', '3', '-1', '2', '3', '-1', '7', '-1', '2', '5', '-1', '1', '-1', '2', '-1', '3', '7', '9', '4', '6', '24', '10', '1', '2');
INSERT INTO `ssc_d` VALUES ('179', '178', '3', '11', '28', '8', '-1', '9', '13', '40', '1', '4', '1', '-1', '4', '-1', '8', '-1', '3', '-1', '1', '2', '1', '-1', '1', '4', '8', '10', '-1', '7', '25', '11', '2', '3');
INSERT INTO `ssc_d` VALUES ('180', '179', '4', '12', '29', '9', '1', '10', '14', '-1', '2', '5', '-1', '1', '-1', '1', '-1', '1', '4', '-1', '2', '-1', '2', '1', '2', '5', '9', '-1', '1', '8', '26', '12', '3', '4');
INSERT INTO `ssc_d` VALUES ('181', '180', '5', '13', '30', '10', '2', '11', '15', '1', '-1', '6', '-1', '2', '1', '-1', '1', '-1', '5', '1', '-1', '-1', '3', '2', '3', '-1', '10', '1', '2', '9', '27', '13', '4', '5');
INSERT INTO `ssc_d` VALUES ('182', '181', '6', '14', '31', '11', '3', '12', '16', '2', '1', '-1', '-1', '3', '-1', '1', '2', '-1', '-1', '2', '1', '-1', '4', '3', '4', '-1', '11', '2', '3', '10', '28', '14', '5', '6');
INSERT INTO `ssc_d` VALUES ('183', '182', '7', '15', '32', '12', '4', '13', '-1', '3', '2', '1', '-1', '4', '1', '-1', '3', '-1', '-1', '3', '2', '1', '5', '-1', '5', '1', '12', '-1', '4', '11', '29', '15', '6', '7');
INSERT INTO `ssc_d` VALUES ('184', '183', '8', '-1', '33', '13', '5', '14', '1', '4', '3', '2', '1', '-1', '-1', '1', '-1', '1', '1', '-1', '3', '2', '6', '-1', '6', '2', '13', '1', '5', '-1', '30', '16', '7', '8');
INSERT INTO `ssc_d` VALUES ('185', '184', '9', '-1', '34', '14', '6', '15', '2', '5', '4', '3', '2', '-1', '-1', '2', '-1', '2', '2', '-1', '4', '3', '-1', '1', '-1', '3', '14', '2', '6', '1', '31', '17', '8', '9');
INSERT INTO `ssc_d` VALUES ('186', '185', '10', '1', '35', '15', '7', '16', '-1', '6', '5', '4', '-1', '1', '1', '-1', '1', '-1', '-1', '1', '5', '-1', '1', '2', '1', '4', '15', '3', '7', '-1', '32', '18', '9', '10');
INSERT INTO `ssc_d` VALUES ('187', '186', '-1', '2', '36', '16', '8', '17', '1', '7', '6', '5', '1', '-1', '2', '-1', '2', '-1', '-1', '2', '6', '1', '2', '-1', '2', '5', '16', '4', '8', '1', '-1', '19', '10', '11');
INSERT INTO `ssc_d` VALUES ('188', '187', '1', '3', '37', '-1', '9', '18', '2', '8', '7', '6', '2', '-1', '-1', '1', '-1', '1', '-1', '3', '7', '-1', '3', '1', '3', '6', '17', '-1', '9', '2', '1', '20', '11', '12');
INSERT INTO `ssc_d` VALUES ('189', '188', '2', '4', '38', '1', '10', '-1', '3', '9', '8', '7', '-1', '1', '-1', '2', '-1', '2', '1', '4', '-1', '-1', '4', '2', '4', '7', '-1', '1', '10', '3', '2', '21', '12', '13');
INSERT INTO `ssc_d` VALUES ('190', '189', '3', '5', '-1', '2', '11', '1', '4', '10', '9', '8', '1', '-1', '1', '-1', '-1', '3', '2', '5', '-1', '1', '5', '-1', '5', '8', '1', '-1', '11', '4', '3', '22', '13', '14');
INSERT INTO `ssc_d` VALUES ('191', '190', '-1', '6', '1', '3', '12', '2', '5', '11', '10', '9', '2', '-1', '2', '-1', '1', '-1', '-1', '6', '1', '2', '6', '-1', '6', '9', '-1', '1', '12', '5', '4', '23', '14', '15');
INSERT INTO `ssc_d` VALUES ('192', '191', '1', '7', '2', '-1', '13', '3', '6', '12', '11', '10', '3', '-1', '-1', '1', '-1', '1', '-1', '7', '2', '-1', '7', '1', '7', '10', '1', '-1', '13', '6', '5', '24', '15', '16');
INSERT INTO `ssc_d` VALUES ('193', '192', '2', '8', '3', '1', '14', '-1', '7', '13', '12', '11', '-1', '1', '-1', '2', '-1', '2', '1', '8', '-1', '-1', '8', '2', '8', '11', '-1', '1', '14', '7', '6', '25', '16', '17');
INSERT INTO `ssc_d` VALUES ('194', '193', '3', '9', '4', '2', '15', '1', '8', '14', '13', '-1', '-1', '2', '-1', '3', '1', '-1', '-1', '9', '1', '-1', '9', '3', '9', '12', '1', '2', '-1', '8', '7', '26', '17', '18');
INSERT INTO `ssc_d` VALUES ('195', '194', '4', '10', '5', '-1', '16', '2', '9', '15', '14', '1', '1', '-1', '-1', '4', '-1', '1', '-1', '10', '2', '1', '10', '-1', '10', '13', '2', '3', '1', '9', '-1', '27', '18', '19');
INSERT INTO `ssc_d` VALUES ('196', '195', '5', '11', '6', '1', '17', '3', '10', '16', '-1', '2', '-1', '1', '1', '-1', '1', '-1', '1', '11', '-1', '-1', '11', '1', '11', '14', '3', '4', '2', '-1', '1', '28', '19', '20');
INSERT INTO `ssc_d` VALUES ('197', '196', '6', '12', '7', '2', '18', '4', '11', '-1', '1', '3', '-1', '2', '-1', '1', '-1', '1', '2', '-1', '1', '1', '12', '-1', '12', '-1', '4', '5', '3', '1', '2', '29', '20', '21');
INSERT INTO `ssc_d` VALUES ('198', '197', '7', '13', '8', '3', '-1', '5', '12', '1', '2', '4', '1', '-1', '1', '-1', '1', '-1', '3', '-1', '2', '2', '13', '-1', '13', '1', '5', '-1', '4', '2', '3', '30', '21', '22');
INSERT INTO `ssc_d` VALUES ('199', '198', '8', '14', '9', '4', '1', '6', '13', '2', '-1', '5', '-1', '1', '2', '-1', '2', '-1', '4', '1', '-1', '-1', '14', '1', '14', '2', '6', '1', '-1', '3', '4', '31', '22', '23');
INSERT INTO `ssc_d` VALUES ('200', '199', '9', '15', '10', '5', '2', '7', '14', '-1', '1', '6', '-1', '2', '-1', '1', '-1', '1', '5', '-1', '1', '1', '15', '-1', '15', '-1', '7', '2', '1', '4', '5', '32', '23', '24');
INSERT INTO `ssc_d` VALUES ('201', '200', '10', '16', '11', '6', '3', '8', '15', '1', '2', '-1', '-1', '3', '-1', '2', '1', '-1', '-1', '1', '2', '-1', '16', '1', '16', '1', '-1', '3', '2', '5', '6', '33', '24', '25');
INSERT INTO `ssc_d` VALUES ('202', '201', '11', '17', '12', '7', '4', '9', '16', '2', '-1', '1', '-1', '4', '1', '-1', '2', '-1', '1', '2', '-1', '1', '17', '-1', '17', '-1', '1', '4', '3', '6', '7', '34', '25', '26');
INSERT INTO `ssc_d` VALUES ('203', '202', '12', '18', '13', '-1', '5', '10', '17', '3', '1', '2', '1', '-1', '-1', '1', '-1', '1', '-1', '3', '1', '2', '18', '-1', '18', '1', '2', '5', '4', '-1', '8', '35', '26', '27');
INSERT INTO `ssc_d` VALUES ('204', '203', '13', '19', '14', '1', '6', '11', '18', '-1', '2', '3', '-1', '1', '-1', '2', '-1', '2', '1', '-1', '2', '-1', '19', '1', '19', '2', '3', '6', '-1', '1', '9', '36', '27', '28');
INSERT INTO `ssc_d` VALUES ('205', '204', '-1', '20', '15', '2', '7', '12', '19', '1', '3', '4', '1', '-1', '1', '-1', '1', '-1', '-1', '1', '3', '1', '20', '-1', '20', '3', '4', '7', '1', '2', '10', '-1', '28', '29');
INSERT INTO `ssc_d` VALUES ('206', '205', '1', '21', '16', '3', '8', '13', '20', '-1', '4', '5', '-1', '1', '-1', '1', '-1', '1', '1', '-1', '4', '-1', '21', '1', '21', '4', '5', '8', '2', '3', '11', '-1', '29', '30');
INSERT INTO `ssc_d` VALUES ('207', '206', '2', '22', '17', '-1', '9', '14', '21', '1', '5', '6', '1', '-1', '-1', '2', '-1', '2', '-1', '1', '5', '1', '22', '-1', '22', '5', '6', '9', '-1', '4', '12', '1', '30', '31');
INSERT INTO `ssc_d` VALUES ('208', '207', '3', '-1', '18', '1', '10', '15', '22', '2', '6', '7', '2', '-1', '-1', '3', '-1', '3', '1', '-1', '6', '2', '23', '-1', '23', '6', '-1', '10', '1', '5', '13', '2', '31', '32');
INSERT INTO `ssc_d` VALUES ('209', '208', '4', '1', '19', '2', '11', '16', '23', '-1', '7', '8', '-1', '1', '-1', '4', '-1', '4', '2', '-1', '7', '-1', '24', '1', '24', '7', '1', '11', '2', '6', '-1', '3', '32', '33');
INSERT INTO `ssc_d` VALUES ('210', '209', '5', '2', '20', '3', '12', '17', '-1', '1', '8', '9', '-1', '2', '1', '-1', '1', '-1', '-1', '1', '8', '1', '25', '-1', '25', '-1', '2', '12', '3', '7', '1', '4', '33', '34');
INSERT INTO `ssc_d` VALUES ('211', '210', '6', '3', '21', '4', '13', '18', '1', '2', '-1', '10', '-1', '3', '2', '-1', '2', '-1', '1', '2', '-1', '-1', '26', '1', '26', '1', '-1', '13', '4', '8', '2', '5', '34', '35');
INSERT INTO `ssc_d` VALUES ('212', '211', '7', '-1', '22', '5', '14', '19', '2', '3', '1', '11', '1', '-1', '-1', '1', '-1', '1', '2', '-1', '1', '1', '27', '-1', '27', '2', '1', '14', '5', '9', '3', '-1', '35', '36');
INSERT INTO `ssc_d` VALUES ('213', '212', '8', '1', '23', '6', '15', '20', '3', '4', '2', '-1', '-1', '1', '-1', '2', '1', '-1', '-1', '1', '2', '-1', '28', '1', '28', '3', '2', '15', '6', '10', '4', '1', '-1', '37');
INSERT INTO `ssc_d` VALUES ('214', '213', '9', '-1', '24', '7', '16', '21', '4', '5', '3', '1', '1', '-1', '-1', '3', '-1', '1', '1', '-1', '3', '1', '29', '-1', '29', '4', '3', '16', '7', '11', '5', '2', '-1', '38');
INSERT INTO `ssc_d` VALUES ('215', '214', '10', '1', '-1', '8', '17', '22', '5', '6', '4', '2', '2', '-1', '1', '-1', '-1', '2', '2', '1', '-1', '-1', '30', '1', '30', '-1', '4', '17', '8', '12', '6', '3', '1', '39');
INSERT INTO `ssc_d` VALUES ('216', '215', '11', '2', '1', '9', '18', '23', '6', '-1', '5', '3', '-1', '1', '-1', '1', '-1', '3', '3', '-1', '1', '-1', '31', '2', '31', '1', '5', '18', '9', '-1', '7', '4', '2', '40');
INSERT INTO `ssc_d` VALUES ('217', '216', '12', '3', '2', '10', '19', '24', '7', '1', '-1', '4', '-1', '2', '1', '-1', '1', '-1', '4', '1', '-1', '-1', '32', '3', '32', '-1', '6', '19', '10', '1', '8', '5', '3', '41');
INSERT INTO `ssc_d` VALUES ('218', '217', '13', '-1', '3', '11', '20', '25', '8', '2', '1', '5', '1', '-1', '-1', '1', '-1', '1', '5', '-1', '1', '1', '33', '-1', '33', '1', '7', '20', '11', '2', '9', '-1', '4', '42');
INSERT INTO `ssc_d` VALUES ('219', '218', '-1', '1', '4', '12', '21', '26', '9', '3', '2', '6', '2', '-1', '1', '-1', '1', '-1', '-1', '1', '2', '2', '34', '-1', '34', '-1', '8', '21', '12', '3', '10', '1', '5', '43');
INSERT INTO `ssc_d` VALUES ('220', '219', '1', '2', '5', '13', '22', '27', '10', '4', '-1', '7', '-1', '1', '2', '-1', '2', '-1', '1', '2', '-1', '-1', '35', '1', '35', '1', '9', '22', '13', '4', '11', '2', '-1', '44');
INSERT INTO `ssc_d` VALUES ('221', '220', '-1', '3', '6', '14', '23', '28', '11', '5', '1', '8', '1', '-1', '3', '-1', '3', '-1', '-1', '3', '1', '1', '36', '-1', '36', '2', '10', '23', '14', '5', '12', '3', '-1', '45');
INSERT INTO `ssc_d` VALUES ('222', '221', '1', '-1', '7', '15', '24', '29', '12', '6', '2', '9', '2', '-1', '-1', '1', '-1', '1', '1', '-1', '2', '-1', '37', '1', '37', '-1', '11', '24', '15', '6', '13', '4', '1', '46');
INSERT INTO `ssc_d` VALUES ('223', '222', '2', '1', '8', '16', '25', '-1', '13', '7', '3', '10', '-1', '1', '-1', '2', '-1', '2', '2', '1', '-1', '-1', '38', '2', '38', '1', '12', '25', '-1', '7', '14', '5', '2', '47');
INSERT INTO `ssc_d` VALUES ('224', '223', '3', '2', '9', '17', '26', '1', '14', '-1', '4', '11', '-1', '2', '-1', '3', '-1', '3', '3', '-1', '1', '-1', '39', '3', '39', '2', '-1', '26', '1', '8', '15', '6', '3', '48');
INSERT INTO `ssc_d` VALUES ('225', '224', '4', '3', '10', '18', '27', '2', '15', '1', '-1', '12', '-1', '3', '1', '-1', '1', '-1', '4', '1', '-1', '-1', '40', '4', '40', '-1', '1', '27', '2', '9', '16', '7', '4', '49');
INSERT INTO `ssc_d` VALUES ('226', '225', '-1', '4', '11', '19', '28', '3', '16', '2', '1', '13', '1', '-1', '2', '-1', '2', '-1', '-1', '2', '1', '1', '41', '-1', '41', '1', '2', '28', '3', '10', '17', '8', '-1', '50');
INSERT INTO `ssc_d` VALUES ('227', '226', '1', '5', '12', '20', '29', '4', '-1', '3', '2', '14', '-1', '1', '3', '-1', '3', '-1', '-1', '3', '2', '-1', '42', '1', '42', '2', '3', '29', '4', '11', '-1', '9', '1', '51');
INSERT INTO `ssc_d` VALUES ('228', '227', '2', '6', '13', '21', '-1', '5', '1', '4', '3', '15', '1', '-1', '4', '-1', '4', '-1', '1', '-1', '3', '1', '43', '-1', '43', '3', '-1', '30', '5', '12', '1', '10', '2', '52');
INSERT INTO `ssc_d` VALUES ('229', '228', '3', '7', '14', '22', '1', '6', '2', '-1', '4', '16', '-1', '1', '-1', '1', '-1', '1', '2', '-1', '4', '-1', '44', '1', '44', '4', '1', '-1', '6', '13', '2', '11', '3', '53');
INSERT INTO `ssc_d` VALUES ('230', '229', '4', '8', '15', '-1', '2', '7', '3', '1', '5', '17', '1', '-1', '-1', '2', '-1', '2', '-1', '1', '5', '1', '45', '-1', '45', '5', '2', '1', '-1', '14', '3', '12', '4', '54');
INSERT INTO `ssc_d` VALUES ('231', '230', '5', '9', '16', '1', '3', '8', '-1', '2', '6', '18', '-1', '1', '1', '-1', '1', '-1', '-1', '2', '6', '-1', '46', '1', '46', '6', '3', '-1', '1', '15', '4', '13', '5', '55');
INSERT INTO `ssc_d` VALUES ('232', '231', '-1', '10', '17', '2', '4', '9', '1', '3', '7', '19', '1', '-1', '2', '-1', '2', '-1', '-1', '3', '7', '1', '47', '-1', '47', '7', '4', '1', '2', '16', '-1', '14', '6', '56');
INSERT INTO `ssc_d` VALUES ('233', '232', '-1', '11', '18', '3', '5', '10', '2', '4', '8', '20', '2', '-1', '3', '-1', '3', '-1', '-1', '4', '8', '2', '-1', '1', '-1', '8', '5', '2', '3', '17', '1', '15', '7', '57');
INSERT INTO `ssc_d` VALUES ('234', '233', '1', '12', '19', '-1', '6', '11', '3', '5', '9', '21', '3', '-1', '-1', '1', '-1', '1', '-1', '5', '9', '-1', '1', '2', '1', '9', '6', '-1', '4', '18', '2', '16', '8', '58');
INSERT INTO `ssc_d` VALUES ('235', '234', '2', '13', '20', '1', '7', '12', '4', '-1', '10', '22', '-1', '1', '-1', '2', '-1', '2', '1', '-1', '10', '-1', '2', '3', '2', '10', '7', '1', '-1', '19', '3', '17', '9', '59');
INSERT INTO `ssc_d` VALUES ('236', '235', '3', '14', '21', '2', '8', '13', '-1', '1', '11', '23', '-1', '2', '1', '-1', '1', '-1', '-1', '1', '11', '1', '3', '-1', '3', '-1', '8', '2', '1', '20', '4', '18', '10', '60');
INSERT INTO `ssc_d` VALUES ('237', '236', '4', '-1', '22', '3', '9', '14', '1', '2', '12', '24', '1', '-1', '-1', '1', '-1', '1', '1', '-1', '12', '2', '4', '-1', '4', '1', '9', '3', '2', '-1', '5', '19', '11', '61');
INSERT INTO `ssc_d` VALUES ('238', '237', '-1', '1', '23', '4', '10', '15', '2', '3', '13', '25', '2', '-1', '1', '-1', '1', '-1', '-1', '1', '13', '3', '5', '-1', '5', '-1', '10', '4', '3', '1', '6', '20', '12', '62');
INSERT INTO `ssc_d` VALUES ('239', '238', '1', '2', '24', '-1', '11', '16', '3', '4', '14', '26', '3', '-1', '-1', '1', '-1', '1', '-1', '2', '14', '-1', '6', '1', '6', '1', '11', '-1', '4', '2', '7', '21', '13', '63');
INSERT INTO `ssc_d` VALUES ('240', '239', '2', '3', '25', '1', '12', '17', '-1', '5', '15', '27', '-1', '1', '1', '-1', '1', '-1', '-1', '3', '15', '-1', '7', '2', '7', '2', '12', '-1', '5', '3', '8', '22', '14', '64');
INSERT INTO `ssc_d` VALUES ('241', '240', '3', '4', '26', '2', '13', '18', '1', '-1', '16', '28', '-1', '2', '-1', '1', '-1', '1', '1', '-1', '16', '-1', '8', '3', '8', '-1', '13', '1', '6', '4', '9', '23', '15', '65');
INSERT INTO `ssc_d` VALUES ('242', '241', '4', '5', '27', '3', '14', '-1', '2', '1', '17', '29', '-1', '3', '-1', '2', '-1', '2', '2', '1', '-1', '1', '9', '-1', '9', '1', '-1', '2', '7', '5', '10', '24', '16', '66');
INSERT INTO `ssc_d` VALUES ('243', '242', '5', '6', '28', '4', '15', '-1', '3', '2', '18', '30', '-1', '4', '-1', '3', '-1', '3', '3', '2', '-1', '2', '-1', '1', '-1', '2', '1', '3', '8', '6', '11', '25', '17', '67');
INSERT INTO `ssc_d` VALUES ('244', '243', '6', '7', '29', '5', '16', '1', '4', '3', '19', '-1', '-1', '5', '-1', '4', '1', '-1', '-1', '3', '1', '-1', '1', '2', '1', '3', '2', '4', '-1', '7', '12', '26', '18', '68');
INSERT INTO `ssc_d` VALUES ('245', '244', '7', '8', '30', '-1', '17', '2', '5', '4', '20', '1', '1', '-1', '-1', '5', '-1', '1', '-1', '4', '2', '1', '2', '-1', '2', '4', '3', '5', '1', '8', '-1', '27', '19', '69');
INSERT INTO `ssc_d` VALUES ('246', '245', '8', '9', '-1', '1', '18', '3', '6', '5', '21', '2', '2', '-1', '1', '-1', '-1', '2', '1', '5', '-1', '2', '3', '-1', '3', '-1', '4', '6', '2', '9', '1', '28', '20', '70');
INSERT INTO `ssc_d` VALUES ('247', '246', '9', '10', '1', '2', '19', '4', '7', '6', '-1', '3', '-1', '1', '2', '-1', '1', '-1', '2', '6', '-1', '-1', '4', '1', '4', '1', '5', '7', '3', '10', '-1', '29', '21', '71');
INSERT INTO `ssc_d` VALUES ('248', '247', '10', '11', '-1', '3', '20', '5', '8', '7', '1', '4', '1', '-1', '3', '-1', '-1', '1', '3', '7', '-1', '1', '5', '-1', '5', '2', '6', '8', '4', '11', '-1', '30', '22', '72');
INSERT INTO `ssc_d` VALUES ('249', '248', '11', '-1', '1', '4', '21', '6', '9', '8', '2', '5', '2', '-1', '-1', '1', '-1', '2', '4', '-1', '1', '2', '6', '-1', '6', '-1', '7', '9', '5', '12', '1', '31', '23', '73');
INSERT INTO `ssc_d` VALUES ('250', '249', '12', '1', '2', '5', '22', '7', '10', '-1', '3', '6', '-1', '1', '-1', '2', '-1', '3', '5', '-1', '2', '-1', '7', '1', '7', '1', '8', '10', '6', '13', '-1', '32', '24', '74');
INSERT INTO `ssc_d` VALUES ('251', '250', '-1', '2', '3', '6', '23', '8', '11', '1', '4', '7', '1', '-1', '1', '-1', '1', '-1', '-1', '1', '3', '1', '8', '-1', '8', '2', '9', '11', '7', '14', '1', '-1', '25', '75');
INSERT INTO `ssc_d` VALUES ('252', '251', '1', '3', '-1', '7', '24', '9', '12', '2', '5', '8', '2', '-1', '2', '-1', '-1', '1', '1', '2', '-1', '-1', '9', '1', '9', '3', '-1', '12', '8', '15', '2', '1', '26', '76');
INSERT INTO `ssc_d` VALUES ('253', '252', '2', '4', '1', '8', '25', '-1', '13', '3', '6', '9', '-1', '1', '-1', '1', '-1', '2', '2', '3', '-1', '-1', '10', '2', '10', '4', '1', '-1', '9', '16', '3', '2', '27', '77');
INSERT INTO `ssc_d` VALUES ('254', '253', '3', '5', '2', '9', '-1', '1', '14', '4', '7', '10', '1', '-1', '1', '-1', '1', '-1', '3', '-1', '1', '1', '11', '-1', '11', '-1', '2', '1', '10', '17', '4', '3', '28', '78');
INSERT INTO `ssc_d` VALUES ('255', '254', '4', '6', '3', '10', '1', '2', '-1', '5', '8', '11', '-1', '1', '2', '-1', '2', '-1', '-1', '1', '2', '-1', '12', '1', '12', '1', '-1', '2', '11', '18', '5', '4', '29', '79');
INSERT INTO `ssc_d` VALUES ('256', '255', '5', '7', '4', '-1', '2', '3', '1', '6', '9', '12', '1', '-1', '-1', '1', '-1', '1', '-1', '2', '3', '1', '13', '-1', '13', '2', '1', '-1', '12', '19', '6', '5', '30', '80');
INSERT INTO `ssc_d` VALUES ('257', '256', '-1', '8', '5', '1', '3', '4', '2', '7', '10', '13', '2', '-1', '1', '-1', '1', '-1', '-1', '3', '4', '2', '14', '-1', '14', '3', '2', '-1', '13', '20', '7', '6', '31', '81');
INSERT INTO `ssc_d` VALUES ('258', '257', '1', '9', '6', '2', '-1', '5', '3', '8', '11', '14', '3', '-1', '2', '-1', '2', '-1', '1', '-1', '5', '-1', '15', '1', '15', '4', '3', '1', '-1', '21', '8', '7', '32', '82');
INSERT INTO `ssc_d` VALUES ('259', '258', '2', '10', '7', '3', '1', '6', '4', '-1', '12', '15', '-1', '1', '-1', '1', '-1', '1', '2', '-1', '6', '-1', '16', '2', '16', '5', '4', '-1', '1', '22', '9', '8', '33', '83');
INSERT INTO `ssc_d` VALUES ('260', '259', '3', '11', '8', '4', '2', '-1', '5', '1', '13', '16', '-1', '2', '-1', '2', '-1', '2', '3', '1', '-1', '1', '17', '-1', '17', '6', '-1', '1', '2', '23', '10', '9', '34', '84');
INSERT INTO `ssc_d` VALUES ('261', '260', '4', '12', '9', '5', '3', '1', '6', '2', '-1', '17', '-1', '3', '1', '-1', '1', '-1', '4', '2', '-1', '-1', '18', '1', '18', '7', '1', '-1', '3', '24', '11', '10', '35', '85');
INSERT INTO `ssc_d` VALUES ('262', '261', '5', '13', '10', '6', '4', '2', '7', '-1', '1', '18', '-1', '4', '-1', '1', '-1', '1', '5', '-1', '1', '1', '19', '-1', '19', '-1', '2', '1', '4', '25', '12', '11', '36', '86');
INSERT INTO `ssc_d` VALUES ('263', '262', '6', '14', '11', '7', '5', '3', '8', '1', '2', '-1', '-1', '5', '-1', '2', '1', '-1', '-1', '1', '2', '-1', '20', '1', '20', '1', '-1', '2', '5', '26', '13', '12', '37', '87');
INSERT INTO `ssc_d` VALUES ('264', '263', '7', '15', '12', '8', '6', '4', '9', '2', '-1', '1', '-1', '6', '1', '-1', '2', '-1', '1', '2', '-1', '1', '21', '-1', '21', '-1', '1', '3', '6', '27', '14', '13', '38', '88');
INSERT INTO `ssc_d` VALUES ('265', '264', '8', '16', '13', '9', '7', '-1', '10', '3', '1', '2', '-1', '7', '-1', '1', '-1', '1', '2', '3', '-1', '2', '22', '-1', '22', '1', '2', '-1', '7', '28', '15', '14', '39', '89');
INSERT INTO `ssc_d` VALUES ('266', '265', '-1', '17', '14', '10', '8', '1', '11', '4', '2', '3', '1', '-1', '1', '-1', '1', '-1', '-1', '4', '1', '3', '23', '-1', '23', '2', '3', '1', '8', '-1', '16', '15', '40', '90');
INSERT INTO `ssc_d` VALUES ('267', '266', '1', '18', '15', '11', '9', '2', '12', '5', '3', '-1', '-1', '1', '-1', '1', '2', '-1', '-1', '5', '2', '-1', '24', '1', '24', '3', '4', '2', '9', '1', '17', '16', '41', '-1');
INSERT INTO `ssc_d` VALUES ('268', '267', '-1', '19', '16', '12', '10', '3', '13', '6', '4', '1', '1', '-1', '1', '-1', '3', '-1', '-1', '6', '3', '1', '25', '-1', '25', '4', '5', '3', '10', '2', '18', '17', '42', '-1');
INSERT INTO `ssc_d` VALUES ('269', '268', '1', '20', '17', '13', '11', '4', '-1', '7', '5', '2', '-1', '1', '2', '-1', '4', '-1', '-1', '7', '4', '-1', '26', '1', '26', '5', '6', '4', '11', '3', '-1', '18', '43', '1');
INSERT INTO `ssc_d` VALUES ('270', '269', '2', '21', '18', '14', '12', '-1', '1', '8', '6', '3', '-1', '2', '-1', '1', '-1', '1', '1', '8', '-1', '1', '27', '-1', '27', '-1', '7', '5', '12', '4', '1', '19', '44', '2');
INSERT INTO `ssc_d` VALUES ('271', '270', '3', '22', '19', '-1', '13', '1', '2', '9', '7', '4', '1', '-1', '-1', '2', '-1', '2', '-1', '9', '1', '2', '28', '-1', '28', '1', '-1', '6', '13', '5', '2', '20', '45', '3');
INSERT INTO `ssc_d` VALUES ('272', '271', '4', '23', '20', '1', '14', '2', '3', '10', '8', '-1', '-1', '1', '-1', '3', '1', '-1', '-1', '10', '2', '-1', '29', '1', '29', '2', '1', '7', '14', '6', '-1', '21', '46', '4');
INSERT INTO `ssc_d` VALUES ('273', '272', '5', '24', '21', '-1', '15', '3', '4', '11', '9', '1', '1', '-1', '-1', '4', '-1', '1', '-1', '11', '3', '1', '30', '-1', '30', '3', '2', '8', '15', '7', '-1', '22', '47', '5');
INSERT INTO `ssc_d` VALUES ('274', '273', '6', '25', '-1', '1', '16', '4', '5', '12', '10', '2', '2', '-1', '1', '-1', '-1', '2', '1', '12', '-1', '2', '31', '-1', '31', '-1', '3', '9', '16', '8', '1', '23', '48', '6');
INSERT INTO `ssc_d` VALUES ('275', '274', '7', '26', '1', '2', '-1', '5', '6', '13', '11', '3', '3', '-1', '2', '-1', '1', '-1', '2', '-1', '1', '-1', '32', '1', '32', '1', '-1', '10', '17', '9', '2', '24', '49', '7');
INSERT INTO `ssc_d` VALUES ('276', '275', '8', '27', '2', '-1', '1', '6', '7', '14', '12', '4', '4', '-1', '-1', '1', '-1', '1', '-1', '1', '2', '1', '33', '-1', '33', '-1', '1', '11', '18', '10', '3', '25', '50', '8');
INSERT INTO `ssc_d` VALUES ('277', '276', '-1', '28', '3', '1', '2', '7', '8', '15', '13', '5', '5', '-1', '1', '-1', '1', '-1', '-1', '2', '3', '2', '34', '-1', '34', '1', '2', '-1', '19', '11', '4', '26', '51', '9');
INSERT INTO `ssc_d` VALUES ('278', '277', '1', '29', '4', '2', '3', '8', '-1', '16', '14', '6', '-1', '1', '2', '-1', '2', '-1', '-1', '3', '4', '-1', '35', '1', '35', '2', '3', '1', '20', '12', '-1', '27', '52', '10');
INSERT INTO `ssc_d` VALUES ('279', '278', '-1', '30', '5', '3', '4', '9', '1', '17', '15', '7', '1', '-1', '3', '-1', '3', '-1', '-1', '4', '5', '1', '36', '-1', '36', '3', '4', '2', '21', '13', '-1', '28', '53', '11');
INSERT INTO `ssc_d` VALUES ('280', '279', '1', '-1', '6', '4', '5', '10', '2', '18', '16', '8', '2', '-1', '-1', '1', '-1', '1', '1', '-1', '6', '-1', '37', '1', '37', '-1', '5', '3', '22', '14', '1', '29', '54', '12');
INSERT INTO `ssc_d` VALUES ('281', '280', '-1', '1', '7', '5', '6', '11', '3', '19', '17', '9', '3', '-1', '1', '-1', '1', '-1', '-1', '1', '7', '1', '38', '-1', '38', '-1', '6', '4', '23', '15', '2', '30', '55', '13');
INSERT INTO `ssc_d` VALUES ('282', '281', '1', '2', '8', '6', '7', '-1', '4', '20', '18', '10', '-1', '1', '-1', '1', '-1', '1', '1', '2', '-1', '-1', '39', '1', '39', '1', '7', '5', '24', '-1', '3', '31', '56', '14');
INSERT INTO `ssc_d` VALUES ('283', '282', '2', '3', '-1', '7', '8', '1', '5', '21', '19', '11', '1', '-1', '1', '-1', '-1', '2', '2', '3', '-1', '1', '40', '-1', '40', '2', '8', '-1', '25', '1', '4', '32', '57', '15');
INSERT INTO `ssc_d` VALUES ('284', '283', '3', '4', '1', '8', '9', '2', '6', '22', '-1', '12', '-1', '1', '2', '-1', '1', '-1', '3', '4', '-1', '-1', '41', '1', '41', '3', '9', '1', '26', '2', '-1', '33', '58', '16');
INSERT INTO `ssc_d` VALUES ('285', '284', '4', '5', '2', '9', '10', '-1', '7', '23', '1', '13', '-1', '2', '-1', '1', '-1', '1', '4', '5', '-1', '1', '42', '-1', '42', '4', '10', '-1', '27', '3', '1', '34', '59', '17');
INSERT INTO `ssc_d` VALUES ('286', '285', '5', '6', '3', '10', '11', '1', '8', '24', '2', '-1', '-1', '3', '-1', '2', '1', '-1', '-1', '6', '1', '-1', '43', '1', '43', '5', '11', '1', '-1', '4', '2', '35', '60', '18');
INSERT INTO `ssc_d` VALUES ('287', '286', '6', '7', '-1', '11', '12', '2', '9', '25', '3', '1', '1', '-1', '1', '-1', '-1', '1', '1', '7', '-1', '1', '44', '-1', '44', '6', '12', '2', '1', '5', '3', '-1', '61', '19');
INSERT INTO `ssc_d` VALUES ('288', '287', '7', '8', '1', '12', '13', '3', '-1', '26', '4', '2', '-1', '1', '2', '-1', '1', '-1', '-1', '8', '1', '-1', '45', '1', '45', '7', '13', '3', '-1', '6', '4', '1', '62', '20');
INSERT INTO `ssc_d` VALUES ('289', '288', '8', '9', '2', '-1', '14', '4', '1', '27', '5', '3', '1', '-1', '-1', '1', '-1', '1', '-1', '9', '2', '1', '46', '-1', '46', '8', '14', '-1', '1', '7', '5', '2', '63', '21');
INSERT INTO `ssc_d` VALUES ('290', '289', '9', '-1', '3', '1', '15', '5', '2', '28', '6', '4', '2', '-1', '-1', '2', '-1', '2', '1', '-1', '3', '2', '47', '-1', '47', '9', '-1', '1', '2', '8', '6', '3', '64', '22');
INSERT INTO `ssc_d` VALUES ('291', '290', '10', '1', '4', '2', '16', '-1', '3', '29', '7', '5', '-1', '1', '-1', '3', '-1', '3', '2', '1', '-1', '-1', '48', '1', '48', '10', '1', '2', '-1', '9', '7', '4', '65', '23');
INSERT INTO `ssc_d` VALUES ('292', '291', '11', '2', '5', '3', '17', '1', '4', '-1', '8', '6', '-1', '2', '-1', '4', '-1', '4', '3', '-1', '1', '-1', '49', '2', '49', '11', '-1', '3', '1', '10', '8', '5', '66', '24');
INSERT INTO `ssc_d` VALUES ('293', '292', '-1', '3', '6', '4', '18', '2', '5', '1', '9', '7', '1', '-1', '1', '-1', '1', '-1', '-1', '1', '2', '1', '50', '-1', '50', '12', '1', '4', '2', '11', '9', '-1', '67', '25');
INSERT INTO `ssc_d` VALUES ('294', '293', '1', '4', '7', '5', '19', '3', '6', '2', '-1', '8', '-1', '1', '2', '-1', '2', '-1', '1', '2', '-1', '-1', '51', '1', '51', '13', '2', '5', '3', '12', '10', '1', '-1', '26');
INSERT INTO `ssc_d` VALUES ('295', '294', '2', '5', '8', '6', '20', '4', '7', '3', '1', '-1', '-1', '2', '-1', '1', '3', '-1', '-1', '3', '1', '-1', '52', '2', '52', '-1', '3', '6', '4', '13', '11', '2', '1', '27');
INSERT INTO `ssc_d` VALUES ('296', '295', '3', '6', '9', '-1', '21', '5', '8', '4', '2', '1', '1', '-1', '-1', '2', '-1', '1', '-1', '4', '2', '1', '53', '-1', '53', '1', '4', '7', '5', '14', '-1', '3', '2', '28');
INSERT INTO `ssc_d` VALUES ('297', '296', '4', '7', '10', '1', '-1', '6', '9', '5', '3', '2', '2', '-1', '1', '-1', '1', '-1', '1', '-1', '3', '-1', '54', '1', '54', '-1', '5', '8', '6', '15', '1', '4', '3', '29');
INSERT INTO `ssc_d` VALUES ('298', '297', '5', '8', '11', '-1', '1', '7', '10', '6', '4', '3', '3', '-1', '-1', '1', '-1', '1', '-1', '1', '4', '1', '55', '-1', '55', '-1', '6', '9', '7', '16', '2', '5', '4', '30');
INSERT INTO `ssc_d` VALUES ('299', '298', '6', '9', '12', '-1', '2', '8', '11', '7', '5', '4', '4', '-1', '-1', '2', '-1', '2', '-1', '2', '5', '2', '-1', '1', '-1', '1', '7', '10', '8', '17', '3', '6', '5', '31');
INSERT INTO `ssc_d` VALUES ('300', '299', '-1', '10', '13', '1', '3', '9', '12', '8', '6', '5', '5', '-1', '1', '-1', '1', '-1', '-1', '3', '6', '3', '1', '-1', '1', '2', '8', '-1', '9', '18', '4', '7', '6', '32');
INSERT INTO `ssc_d` VALUES ('301', '300', '1', '11', '14', '2', '4', '10', '13', '9', '-1', '6', '-1', '1', '2', '-1', '2', '-1', '1', '4', '-1', '-1', '2', '1', '2', '3', '9', '1', '10', '19', '5', '8', '-1', '33');
INSERT INTO `ssc_d` VALUES ('302', '301', '2', '12', '15', '3', '5', '11', '14', '10', '1', '-1', '-1', '2', '-1', '1', '3', '-1', '-1', '5', '1', '-1', '3', '2', '3', '-1', '10', '2', '11', '20', '6', '9', '1', '34');
INSERT INTO `ssc_d` VALUES ('303', '302', '3', '-1', '16', '4', '6', '12', '15', '11', '2', '1', '1', '-1', '-1', '2', '-1', '1', '1', '-1', '2', '1', '4', '-1', '4', '1', '11', '3', '12', '21', '7', '10', '-1', '35');
INSERT INTO `ssc_d` VALUES ('304', '303', '4', '1', '17', '5', '7', '13', '-1', '12', '3', '2', '-1', '1', '1', '-1', '1', '-1', '-1', '1', '3', '-1', '5', '1', '5', '2', '12', '4', '13', '-1', '8', '11', '1', '36');
INSERT INTO `ssc_d` VALUES ('305', '304', '5', '2', '18', '6', '8', '14', '1', '-1', '4', '3', '-1', '2', '-1', '1', '-1', '1', '1', '-1', '4', '-1', '6', '2', '6', '-1', '13', '5', '14', '1', '9', '12', '2', '37');
INSERT INTO `ssc_d` VALUES ('306', '305', '6', '3', '19', '-1', '9', '15', '2', '1', '5', '4', '1', '-1', '-1', '2', '-1', '2', '-1', '1', '5', '1', '7', '-1', '7', '1', '14', '6', '-1', '2', '10', '13', '3', '38');
INSERT INTO `ssc_d` VALUES ('307', '306', '7', '4', '20', '1', '10', '16', '3', '-1', '6', '5', '-1', '1', '-1', '3', '-1', '3', '1', '-1', '6', '-1', '8', '1', '8', '2', '15', '7', '-1', '3', '11', '14', '4', '39');
INSERT INTO `ssc_d` VALUES ('308', '307', '8', '5', '-1', '2', '11', '17', '4', '1', '7', '6', '1', '-1', '1', '-1', '-1', '4', '2', '1', '-1', '1', '9', '-1', '9', '3', '16', '8', '1', '-1', '12', '15', '5', '40');
INSERT INTO `ssc_d` VALUES ('309', '308', '9', '6', '1', '3', '12', '18', '-1', '2', '8', '7', '-1', '1', '2', '-1', '1', '-1', '-1', '2', '1', '-1', '10', '1', '10', '4', '17', '9', '-1', '1', '13', '16', '6', '41');
INSERT INTO `ssc_d` VALUES ('310', '309', '10', '7', '2', '4', '-1', '19', '1', '3', '9', '8', '1', '-1', '3', '-1', '2', '-1', '1', '-1', '2', '1', '11', '-1', '11', '5', '-1', '10', '1', '2', '14', '17', '7', '42');

-- ----------------------------
-- Table structure for `ssc_e`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_e`;
CREATE TABLE `ssc_e` (
  `id` int(11) NOT NULL auto_increment,
  `sscid` int(11) NOT NULL,
  `n0` int(3) NOT NULL,
  `n1` int(3) NOT NULL,
  `n2` int(3) NOT NULL,
  `n3` int(3) NOT NULL,
  `n4` int(3) NOT NULL,
  `n5` int(3) NOT NULL,
  `n6` int(3) NOT NULL,
  `n7` int(3) NOT NULL,
  `n8` int(3) NOT NULL,
  `n9` int(3) NOT NULL,
  `da` int(3) NOT NULL,
  `xiao` int(3) NOT NULL,
  `ji` int(3) NOT NULL,
  `ou` int(3) NOT NULL,
  `zhi` int(3) NOT NULL,
  `he` int(3) NOT NULL,
  `lu0` int(3) NOT NULL,
  `lu1` int(3) NOT NULL,
  `lu2` int(3) NOT NULL,
  `sheng` int(3) NOT NULL,
  `ping` int(3) NOT NULL,
  `jiang` int(3) NOT NULL,
  `z0` int(3) NOT NULL,
  `z1` int(3) NOT NULL,
  `z2` int(3) NOT NULL,
  `z3` int(3) NOT NULL,
  `z4` int(3) NOT NULL,
  `z5` int(3) NOT NULL,
  `z6` int(3) NOT NULL,
  `z7` int(3) NOT NULL,
  `z8` int(3) NOT NULL,
  `z9` int(3) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssc_e
-- ----------------------------
INSERT INTO `ssc_e` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '-1', '-1', '1', '-1', '1', '1', '-1', '-1', '1', '1', '-1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '-1');
INSERT INTO `ssc_e` VALUES ('2', '2', '2', '2', '-1', '2', '2', '2', '2', '2', '2', '1', '1', '-1', '1', '-1', '-1', '1', '1', '2', '-1', '1', '2', '-1', '2', '2', '2', '2', '2', '2', '2', '-1', '2', '1');
INSERT INTO `ssc_e` VALUES ('3', '3', '3', '3', '-1', '3', '3', '3', '3', '3', '3', '2', '2', '-1', '2', '-1', '-1', '2', '2', '3', '-1', '2', '-1', '1', '-1', '3', '3', '3', '3', '3', '3', '1', '3', '2');
INSERT INTO `ssc_e` VALUES ('4', '4', '-1', '4', '1', '4', '4', '4', '4', '4', '4', '3', '3', '-1', '3', '-1', '1', '-1', '-1', '4', '1', '3', '1', '-1', '1', '4', '-1', '4', '4', '4', '4', '2', '4', '3');
INSERT INTO `ssc_e` VALUES ('5', '5', '1', '5', '2', '5', '5', '5', '5', '-1', '5', '4', '-1', '1', '-1', '1', '-1', '1', '1', '-1', '2', '-1', '2', '1', '2', '5', '1', '5', '5', '5', '5', '-1', '5', '4');
INSERT INTO `ssc_e` VALUES ('6', '6', '2', '6', '3', '6', '6', '6', '6', '1', '-1', '5', '-1', '2', '1', '-1', '1', '-1', '2', '1', '-1', '-1', '3', '2', '3', '-1', '2', '6', '6', '6', '6', '1', '6', '5');
INSERT INTO `ssc_e` VALUES ('7', '7', '-1', '7', '4', '7', '7', '7', '7', '2', '1', '6', '1', '-1', '2', '-1', '2', '-1', '-1', '2', '1', '1', '4', '-1', '4', '1', '3', '7', '7', '7', '7', '2', '-1', '6');
INSERT INTO `ssc_e` VALUES ('8', '8', '1', '8', '5', '-1', '8', '8', '8', '3', '2', '7', '2', '-1', '-1', '1', '-1', '1', '-1', '3', '2', '-1', '5', '1', '5', '2', '4', '-1', '8', '8', '8', '3', '1', '7');
INSERT INTO `ssc_e` VALUES ('9', '9', '2', '9', '6', '1', '9', '-1', '9', '4', '3', '8', '-1', '1', '-1', '2', '-1', '2', '1', '4', '-1', '-1', '6', '2', '6', '3', '-1', '1', '9', '9', '9', '4', '2', '8');
INSERT INTO `ssc_e` VALUES ('10', '10', '3', '10', '7', '2', '10', '-1', '10', '5', '4', '9', '-1', '2', '-1', '3', '-1', '3', '2', '5', '-1', '1', '-1', '3', '-1', '4', '1', '2', '10', '10', '10', '5', '3', '9');
INSERT INTO `ssc_e` VALUES ('11', '11', '4', '11', '8', '-1', '11', '1', '11', '6', '5', '10', '1', '-1', '-1', '4', '-1', '4', '-1', '6', '1', '2', '1', '-1', '1', '5', '-1', '3', '11', '11', '11', '6', '4', '10');
INSERT INTO `ssc_e` VALUES ('12', '12', '-1', '12', '9', '1', '12', '2', '12', '7', '6', '11', '2', '-1', '1', '-1', '1', '-1', '-1', '7', '2', '3', '2', '-1', '2', '6', '1', '-1', '12', '12', '12', '7', '5', '11');
INSERT INTO `ssc_e` VALUES ('13', '13', '1', '13', '10', '2', '13', '3', '13', '-1', '7', '12', '-1', '1', '-1', '1', '-1', '1', '1', '-1', '3', '-1', '3', '1', '3', '7', '2', '1', '13', '13', '13', '-1', '6', '12');
INSERT INTO `ssc_e` VALUES ('14', '14', '2', '14', '11', '3', '14', '4', '-1', '1', '8', '13', '-1', '2', '1', '-1', '1', '-1', '-1', '1', '4', '1', '4', '-1', '4', '-1', '3', '2', '14', '14', '14', '1', '7', '13');
INSERT INTO `ssc_e` VALUES ('15', '15', '3', '15', '-1', '4', '15', '5', '1', '2', '9', '14', '1', '-1', '2', '-1', '-1', '1', '1', '2', '-1', '2', '5', '-1', '5', '1', '4', '3', '-1', '15', '15', '2', '8', '14');
INSERT INTO `ssc_e` VALUES ('16', '16', '4', '16', '1', '5', '16', '-1', '2', '3', '10', '15', '-1', '1', '-1', '1', '-1', '2', '2', '3', '-1', '-1', '6', '1', '6', '2', '5', '-1', '1', '16', '16', '3', '9', '15');
INSERT INTO `ssc_e` VALUES ('17', '17', '-1', '17', '2', '6', '17', '1', '3', '4', '11', '16', '1', '-1', '1', '-1', '1', '-1', '-1', '4', '1', '1', '7', '-1', '7', '3', '6', '1', '2', '-1', '17', '4', '10', '16');
INSERT INTO `ssc_e` VALUES ('18', '18', '1', '18', '3', '7', '18', '2', '4', '5', '-1', '17', '-1', '1', '2', '-1', '2', '-1', '1', '5', '-1', '-1', '8', '1', '8', '4', '7', '2', '3', '1', '18', '5', '-1', '17');
INSERT INTO `ssc_e` VALUES ('19', '19', '2', '19', '4', '8', '19', '-1', '5', '6', '1', '18', '-1', '2', '-1', '1', '-1', '1', '2', '6', '-1', '1', '9', '-1', '9', '5', '8', '-1', '4', '2', '19', '6', '1', '18');
INSERT INTO `ssc_e` VALUES ('20', '20', '-1', '20', '5', '9', '20', '1', '6', '7', '2', '19', '1', '-1', '1', '-1', '1', '-1', '-1', '7', '1', '2', '10', '-1', '10', '6', '9', '1', '5', '-1', '20', '7', '2', '19');
INSERT INTO `ssc_e` VALUES ('21', '21', '1', '21', '6', '10', '-1', '2', '7', '8', '3', '20', '2', '-1', '2', '-1', '2', '-1', '1', '-1', '2', '-1', '11', '1', '11', '7', '10', '2', '-1', '1', '21', '8', '3', '20');
INSERT INTO `ssc_e` VALUES ('22', '22', '2', '22', '7', '11', '1', '3', '8', '9', '-1', '21', '-1', '1', '3', '-1', '3', '-1', '2', '1', '-1', '-1', '12', '2', '12', '8', '11', '3', '-1', '2', '22', '9', '4', '21');
INSERT INTO `ssc_e` VALUES ('23', '23', '3', '23', '8', '12', '-1', '4', '9', '10', '1', '22', '1', '-1', '4', '-1', '4', '-1', '3', '-1', '1', '1', '13', '-1', '13', '9', '12', '4', '-1', '3', '23', '10', '5', '22');
INSERT INTO `ssc_e` VALUES ('24', '24', '4', '24', '9', '13', '1', '5', '10', '-1', '2', '23', '-1', '1', '-1', '1', '-1', '1', '4', '-1', '2', '-1', '14', '1', '14', '10', '13', '-1', '1', '4', '24', '11', '6', '23');
INSERT INTO `ssc_e` VALUES ('25', '25', '5', '25', '10', '14', '-1', '6', '11', '1', '3', '24', '1', '-1', '1', '-1', '1', '-1', '5', '-1', '3', '1', '15', '-1', '15', '11', '14', '-1', '2', '5', '25', '12', '7', '24');
INSERT INTO `ssc_e` VALUES ('26', '26', '6', '26', '11', '15', '1', '7', '12', '2', '4', '-1', '-1', '1', '-1', '1', '2', '-1', '-1', '1', '4', '-1', '16', '1', '16', '12', '15', '1', '3', '-1', '26', '13', '8', '25');
INSERT INTO `ssc_e` VALUES ('27', '27', '7', '27', '12', '16', '2', '8', '13', '3', '5', '-1', '-1', '2', '-1', '2', '3', '-1', '-1', '2', '5', '1', '-1', '2', '-1', '13', '16', '2', '4', '1', '27', '14', '9', '26');
INSERT INTO `ssc_e` VALUES ('28', '28', '8', '28', '-1', '17', '3', '9', '14', '4', '6', '1', '1', '-1', '1', '-1', '-1', '1', '1', '3', '-1', '2', '1', '-1', '1', '14', '17', '3', '5', '2', '28', '-1', '10', '27');
INSERT INTO `ssc_e` VALUES ('29', '29', '9', '29', '1', '18', '4', '10', '-1', '5', '7', '2', '-1', '1', '2', '-1', '1', '-1', '-1', '4', '1', '-1', '2', '1', '2', '15', '18', '4', '-1', '3', '29', '1', '11', '28');
INSERT INTO `ssc_e` VALUES ('30', '30', '10', '30', '2', '19', '5', '11', '1', '6', '8', '-1', '-1', '2', '-1', '1', '2', '-1', '-1', '5', '2', '-1', '3', '2', '3', '16', '19', '-1', '1', '4', '30', '2', '12', '29');
INSERT INTO `ssc_e` VALUES ('31', '31', '11', '31', '3', '20', '6', '12', '2', '-1', '9', '1', '-1', '3', '-1', '2', '-1', '1', '1', '-1', '3', '1', '4', '-1', '4', '17', '-1', '1', '2', '5', '31', '3', '13', '30');
INSERT INTO `ssc_e` VALUES ('32', '32', '12', '32', '4', '21', '7', '13', '3', '1', '10', '-1', '-1', '4', '-1', '3', '1', '-1', '-1', '1', '4', '-1', '5', '1', '5', '18', '-1', '2', '3', '6', '32', '4', '14', '31');
INSERT INTO `ssc_e` VALUES ('33', '33', '13', '33', '5', '-1', '8', '14', '4', '2', '11', '1', '1', '-1', '-1', '4', '-1', '1', '-1', '2', '5', '1', '6', '-1', '6', '19', '1', '3', '4', '7', '-1', '5', '15', '32');
INSERT INTO `ssc_e` VALUES ('34', '34', '14', '34', '6', '1', '-1', '15', '5', '3', '12', '2', '2', '-1', '1', '-1', '1', '-1', '1', '-1', '6', '-1', '7', '1', '7', '-1', '2', '4', '5', '8', '1', '6', '16', '33');
INSERT INTO `ssc_e` VALUES ('35', '35', '15', '35', '7', '2', '1', '16', '-1', '4', '13', '3', '-1', '1', '2', '-1', '2', '-1', '-1', '1', '7', '-1', '8', '2', '8', '1', '-1', '5', '6', '9', '2', '7', '17', '34');
INSERT INTO `ssc_e` VALUES ('36', '36', '16', '36', '8', '3', '2', '17', '1', '-1', '14', '4', '-1', '2', '-1', '1', '-1', '1', '1', '-1', '8', '-1', '9', '3', '9', '-1', '1', '6', '7', '10', '3', '8', '18', '35');
INSERT INTO `ssc_e` VALUES ('37', '37', '17', '37', '9', '4', '3', '18', '2', '1', '15', '-1', '-1', '3', '-1', '2', '1', '-1', '-1', '1', '9', '-1', '10', '4', '10', '1', '-1', '7', '8', '11', '4', '9', '19', '36');
INSERT INTO `ssc_e` VALUES ('38', '38', '18', '38', '10', '5', '-1', '19', '3', '2', '16', '1', '1', '-1', '1', '-1', '2', '-1', '1', '-1', '10', '1', '11', '-1', '11', '2', '1', '8', '9', '-1', '5', '10', '20', '37');
INSERT INTO `ssc_e` VALUES ('39', '39', '19', '39', '-1', '6', '1', '20', '4', '3', '17', '2', '2', '-1', '2', '-1', '-1', '1', '2', '1', '-1', '2', '12', '-1', '12', '3', '-1', '9', '10', '1', '6', '11', '21', '38');
INSERT INTO `ssc_e` VALUES ('40', '40', '20', '40', '-1', '7', '2', '21', '5', '4', '18', '3', '3', '-1', '3', '-1', '-1', '2', '3', '2', '-1', '3', '-1', '1', '-1', '4', '1', '10', '11', '2', '7', '12', '22', '39');
INSERT INTO `ssc_e` VALUES ('41', '41', '21', '41', '1', '-1', '3', '22', '6', '5', '19', '4', '4', '-1', '-1', '1', '-1', '3', '-1', '3', '1', '-1', '1', '2', '1', '-1', '2', '11', '12', '3', '8', '13', '23', '40');
INSERT INTO `ssc_e` VALUES ('42', '42', '22', '42', '2', '1', '4', '23', '7', '6', '-1', '5', '-1', '1', '1', '-1', '1', '-1', '1', '4', '-1', '-1', '2', '3', '2', '1', '3', '12', '13', '-1', '9', '14', '24', '41');
INSERT INTO `ssc_e` VALUES ('43', '43', '23', '43', '3', '2', '5', '24', '8', '7', '-1', '6', '-1', '2', '2', '-1', '2', '-1', '2', '5', '-1', '1', '-1', '4', '-1', '2', '4', '13', '14', '1', '10', '15', '25', '42');
INSERT INTO `ssc_e` VALUES ('44', '44', '24', '44', '4', '3', '6', '-1', '9', '8', '1', '7', '-1', '3', '-1', '1', '-1', '1', '3', '6', '-1', '2', '1', '-1', '1', '3', '5', '-1', '15', '2', '11', '16', '26', '43');
INSERT INTO `ssc_e` VALUES ('45', '45', '25', '45', '5', '4', '7', '1', '10', '9', '-1', '8', '-1', '4', '1', '-1', '1', '-1', '4', '7', '-1', '-1', '2', '1', '2', '4', '6', '-1', '16', '3', '12', '17', '27', '44');
INSERT INTO `ssc_e` VALUES ('46', '46', '26', '46', '6', '5', '8', '2', '11', '10', '1', '-1', '-1', '5', '-1', '1', '2', '-1', '-1', '8', '1', '-1', '3', '2', '3', '-1', '7', '1', '17', '4', '13', '18', '28', '45');
INSERT INTO `ssc_e` VALUES ('47', '47', '27', '47', '7', '6', '9', '3', '12', '11', '-1', '1', '-1', '6', '1', '-1', '3', '-1', '1', '9', '-1', '1', '4', '-1', '4', '-1', '8', '2', '18', '5', '14', '19', '29', '46');
INSERT INTO `ssc_e` VALUES ('48', '48', '28', '48', '8', '7', '10', '4', '-1', '12', '1', '2', '-1', '7', '2', '-1', '4', '-1', '-1', '10', '1', '2', '5', '-1', '5', '1', '-1', '3', '19', '6', '15', '20', '30', '47');
INSERT INTO `ssc_e` VALUES ('49', '49', '29', '49', '9', '8', '11', '5', '1', '13', '2', '-1', '-1', '8', '-1', '1', '5', '-1', '-1', '11', '2', '-1', '6', '1', '6', '2', '1', '-1', '20', '7', '16', '21', '31', '48');
INSERT INTO `ssc_e` VALUES ('50', '50', '30', '50', '10', '9', '12', '6', '-1', '14', '3', '1', '-1', '9', '1', '-1', '6', '-1', '-1', '12', '3', '1', '7', '-1', '7', '3', '2', '-1', '21', '8', '17', '22', '32', '49');
INSERT INTO `ssc_e` VALUES ('51', '51', '31', '51', '11', '10', '-1', '7', '1', '15', '4', '2', '1', '-1', '2', '-1', '7', '-1', '1', '-1', '4', '2', '8', '-1', '8', '4', '-1', '1', '22', '9', '18', '23', '33', '50');
INSERT INTO `ssc_e` VALUES ('52', '52', '32', '52', '12', '11', '1', '8', '2', '16', '-1', '3', '-1', '1', '3', '-1', '8', '-1', '2', '1', '-1', '-1', '9', '1', '9', '5', '1', '2', '-1', '10', '19', '24', '34', '51');
INSERT INTO `ssc_e` VALUES ('53', '53', '33', '53', '13', '12', '2', '9', '3', '-1', '1', '4', '-1', '2', '-1', '1', '-1', '1', '3', '-1', '1', '1', '10', '-1', '10', '-1', '2', '3', '1', '11', '20', '25', '35', '52');
INSERT INTO `ssc_e` VALUES ('54', '54', '34', '54', '14', '13', '3', '10', '4', '-1', '2', '5', '-1', '3', '-1', '2', '-1', '2', '4', '-1', '2', '2', '-1', '1', '-1', '1', '3', '4', '2', '12', '21', '26', '36', '53');
INSERT INTO `ssc_e` VALUES ('55', '55', '35', '55', '15', '14', '4', '11', '-1', '1', '3', '6', '-1', '4', '1', '-1', '1', '-1', '-1', '1', '3', '3', '1', '-1', '1', '-1', '4', '5', '3', '13', '22', '27', '37', '54');
INSERT INTO `ssc_e` VALUES ('56', '56', '36', '56', '-1', '15', '5', '12', '1', '2', '4', '7', '1', '-1', '2', '-1', '-1', '1', '1', '2', '-1', '4', '2', '-1', '2', '1', '5', '6', '-1', '14', '23', '28', '38', '55');
INSERT INTO `ssc_e` VALUES ('57', '57', '37', '57', '1', '16', '6', '13', '-1', '3', '5', '8', '-1', '1', '3', '-1', '1', '-1', '-1', '3', '1', '-1', '3', '1', '3', '2', '6', '7', '-1', '15', '24', '29', '39', '56');
INSERT INTO `ssc_e` VALUES ('58', '58', '38', '58', '2', '17', '-1', '14', '1', '4', '6', '9', '1', '-1', '4', '-1', '2', '-1', '1', '-1', '2', '1', '4', '-1', '4', '3', '-1', '8', '1', '16', '25', '30', '40', '57');
INSERT INTO `ssc_e` VALUES ('59', '59', '39', '59', '3', '18', '-1', '15', '2', '5', '7', '10', '2', '-1', '5', '-1', '3', '-1', '2', '-1', '3', '2', '-1', '1', '-1', '4', '1', '9', '2', '17', '26', '31', '41', '58');
INSERT INTO `ssc_e` VALUES ('60', '60', '40', '60', '4', '19', '-1', '16', '3', '6', '8', '11', '3', '-1', '6', '-1', '4', '-1', '3', '-1', '4', '3', '-1', '2', '-1', '5', '2', '10', '3', '18', '27', '32', '42', '59');
INSERT INTO `ssc_e` VALUES ('61', '61', '41', '61', '5', '-1', '1', '17', '4', '7', '9', '12', '4', '-1', '-1', '1', '-1', '1', '-1', '1', '5', '4', '1', '-1', '1', '-1', '3', '11', '4', '19', '28', '33', '43', '60');
INSERT INTO `ssc_e` VALUES ('62', '62', '42', '62', '6', '1', '2', '-1', '5', '8', '10', '13', '-1', '1', '-1', '2', '-1', '2', '1', '2', '-1', '-1', '2', '1', '2', '1', '-1', '12', '5', '20', '29', '34', '44', '61');
INSERT INTO `ssc_e` VALUES ('63', '63', '43', '63', '7', '2', '3', '-1', '6', '9', '11', '14', '-1', '2', '-1', '3', '-1', '3', '2', '3', '-1', '1', '-1', '2', '-1', '2', '1', '13', '6', '21', '30', '35', '45', '62');
INSERT INTO `ssc_e` VALUES ('64', '64', '44', '64', '8', '3', '4', '1', '7', '10', '-1', '15', '-1', '3', '1', '-1', '1', '-1', '3', '4', '-1', '-1', '1', '3', '1', '3', '2', '-1', '7', '22', '31', '36', '46', '63');
INSERT INTO `ssc_e` VALUES ('65', '65', '45', '65', '9', '4', '5', '2', '8', '11', '1', '-1', '-1', '4', '-1', '1', '2', '-1', '-1', '5', '1', '-1', '2', '4', '2', '-1', '3', '1', '8', '23', '32', '37', '47', '64');
INSERT INTO `ssc_e` VALUES ('66', '66', '46', '66', '10', '5', '6', '-1', '9', '12', '2', '1', '-1', '5', '-1', '2', '-1', '1', '1', '6', '-1', '1', '3', '-1', '3', '1', '4', '2', '-1', '24', '33', '38', '48', '65');
INSERT INTO `ssc_e` VALUES ('67', '67', '47', '67', '11', '6', '7', '1', '10', '-1', '3', '2', '-1', '6', '-1', '3', '-1', '2', '2', '-1', '1', '-1', '4', '1', '4', '2', '-1', '3', '1', '25', '34', '39', '49', '66');
INSERT INTO `ssc_e` VALUES ('68', '68', '48', '68', '-1', '7', '8', '2', '11', '1', '4', '3', '1', '-1', '1', '-1', '-1', '3', '3', '1', '-1', '1', '5', '-1', '5', '3', '1', '4', '2', '-1', '35', '40', '50', '67');
INSERT INTO `ssc_e` VALUES ('69', '69', '49', '69', '1', '8', '9', '3', '12', '2', '-1', '4', '-1', '1', '2', '-1', '1', '-1', '4', '2', '-1', '-1', '6', '1', '6', '4', '2', '5', '3', '1', '-1', '41', '51', '68');
INSERT INTO `ssc_e` VALUES ('70', '70', '50', '70', '2', '9', '10', '-1', '13', '3', '1', '5', '-1', '2', '-1', '1', '-1', '1', '5', '3', '-1', '1', '7', '-1', '7', '5', '3', '-1', '4', '2', '1', '42', '52', '69');
INSERT INTO `ssc_e` VALUES ('71', '71', '51', '71', '3', '10', '11', '-1', '14', '4', '2', '6', '-1', '3', '-1', '2', '-1', '2', '6', '4', '-1', '2', '-1', '1', '-1', '6', '4', '1', '5', '3', '2', '43', '53', '70');
INSERT INTO `ssc_e` VALUES ('72', '72', '52', '72', '4', '11', '-1', '1', '15', '5', '3', '7', '1', '-1', '1', '-1', '1', '-1', '7', '-1', '1', '3', '1', '-1', '1', '-1', '5', '2', '6', '4', '3', '44', '54', '71');
INSERT INTO `ssc_e` VALUES ('73', '73', '-1', '73', '5', '12', '1', '2', '16', '6', '4', '8', '2', '-1', '2', '-1', '2', '-1', '-1', '1', '2', '4', '2', '-1', '2', '1', '6', '3', '-1', '5', '4', '45', '55', '72');
INSERT INTO `ssc_e` VALUES ('74', '74', '1', '74', '6', '-1', '2', '3', '17', '7', '5', '9', '3', '-1', '-1', '1', '-1', '1', '-1', '2', '3', '-1', '3', '1', '3', '2', '7', '-1', '1', '6', '5', '46', '56', '73');
INSERT INTO `ssc_e` VALUES ('75', '75', '2', '75', '-1', '1', '3', '4', '18', '8', '6', '10', '4', '-1', '1', '-1', '-1', '2', '1', '3', '-1', '1', '4', '-1', '4', '-1', '8', '1', '2', '7', '6', '47', '57', '74');
INSERT INTO `ssc_e` VALUES ('76', '76', '3', '76', '-1', '2', '4', '5', '19', '9', '7', '11', '5', '-1', '2', '-1', '-1', '3', '2', '4', '-1', '2', '-1', '1', '-1', '1', '9', '2', '3', '8', '7', '48', '58', '75');
INSERT INTO `ssc_e` VALUES ('77', '77', '4', '77', '1', '3', '5', '6', '20', '-1', '8', '12', '-1', '1', '-1', '1', '-1', '4', '3', '-1', '1', '-1', '1', '2', '1', '2', '10', '3', '4', '-1', '8', '49', '59', '76');
INSERT INTO `ssc_e` VALUES ('78', '78', '5', '78', '-1', '4', '6', '7', '21', '1', '9', '13', '1', '-1', '1', '-1', '-1', '5', '4', '1', '-1', '1', '2', '-1', '2', '3', '11', '4', '5', '-1', '9', '50', '60', '77');
INSERT INTO `ssc_e` VALUES ('79', '79', '6', '79', '1', '-1', '7', '8', '22', '2', '10', '14', '2', '-1', '-1', '1', '-1', '6', '-1', '2', '1', '-1', '3', '1', '3', '-1', '12', '5', '6', '1', '10', '51', '61', '78');
INSERT INTO `ssc_e` VALUES ('80', '80', '7', '80', '2', '1', '8', '9', '23', '-1', '11', '15', '-1', '1', '-1', '2', '-1', '7', '1', '-1', '2', '-1', '4', '2', '4', '1', '13', '6', '-1', '2', '11', '52', '62', '79');
INSERT INTO `ssc_e` VALUES ('81', '81', '8', '81', '3', '2', '-1', '10', '24', '1', '12', '16', '1', '-1', '1', '-1', '1', '-1', '2', '-1', '3', '1', '5', '-1', '5', '2', '14', '-1', '1', '3', '12', '53', '63', '80');
INSERT INTO `ssc_e` VALUES ('82', '82', '9', '82', '-1', '3', '1', '11', '25', '2', '13', '17', '2', '-1', '2', '-1', '-1', '1', '3', '1', '-1', '2', '6', '-1', '6', '3', '-1', '1', '2', '4', '13', '54', '64', '81');
INSERT INTO `ssc_e` VALUES ('83', '83', '10', '83', '1', '4', '2', '12', '26', '-1', '14', '18', '-1', '1', '-1', '1', '-1', '2', '4', '-1', '1', '-1', '7', '1', '7', '4', '1', '2', '3', '-1', '14', '55', '65', '82');
INSERT INTO `ssc_e` VALUES ('84', '84', '11', '-1', '2', '5', '3', '13', '27', '1', '15', '19', '1', '-1', '-1', '2', '-1', '3', '5', '-1', '2', '1', '8', '-1', '8', '5', '2', '3', '4', '1', '-1', '56', '66', '83');
INSERT INTO `ssc_e` VALUES ('85', '85', '12', '1', '-1', '6', '4', '14', '28', '2', '16', '20', '2', '-1', '1', '-1', '-1', '4', '6', '1', '-1', '-1', '9', '1', '9', '-1', '3', '4', '5', '2', '1', '57', '67', '84');
INSERT INTO `ssc_e` VALUES ('86', '86', '13', '2', '1', '7', '5', '15', '29', '3', '17', '-1', '-1', '1', '-1', '1', '1', '-1', '-1', '2', '1', '-1', '10', '2', '10', '1', '4', '5', '6', '3', '2', '-1', '68', '85');
INSERT INTO `ssc_e` VALUES ('87', '87', '14', '3', '2', '8', '6', '16', '30', '-1', '18', '1', '-1', '2', '-1', '2', '-1', '1', '1', '-1', '2', '1', '11', '-1', '11', '2', '-1', '6', '7', '4', '3', '1', '69', '86');
INSERT INTO `ssc_e` VALUES ('88', '88', '15', '4', '3', '9', '7', '-1', '31', '1', '19', '2', '-1', '3', '-1', '3', '-1', '2', '2', '1', '-1', '2', '12', '-1', '12', '3', '-1', '7', '8', '5', '4', '2', '70', '87');
INSERT INTO `ssc_e` VALUES ('89', '89', '16', '5', '4', '10', '8', '1', '-1', '2', '20', '3', '-1', '4', '1', '-1', '1', '-1', '-1', '2', '1', '-1', '13', '1', '13', '-1', '1', '8', '9', '6', '5', '3', '71', '88');
INSERT INTO `ssc_e` VALUES ('90', '90', '17', '6', '5', '11', '9', '2', '1', '-1', '21', '4', '-1', '5', '-1', '1', '-1', '1', '1', '-1', '2', '-1', '14', '2', '14', '-1', '2', '9', '10', '7', '6', '4', '72', '89');
INSERT INTO `ssc_e` VALUES ('91', '91', '18', '-1', '6', '12', '10', '3', '2', '1', '22', '5', '1', '-1', '-1', '2', '-1', '2', '2', '-1', '3', '1', '15', '-1', '15', '1', '3', '10', '11', '8', '-1', '5', '73', '90');
INSERT INTO `ssc_e` VALUES ('92', '92', '19', '1', '7', '13', '11', '4', '3', '2', '23', '-1', '-1', '1', '-1', '3', '1', '-1', '-1', '1', '4', '-1', '16', '1', '16', '2', '4', '11', '12', '9', '1', '6', '-1', '91');
INSERT INTO `ssc_e` VALUES ('93', '93', '20', '2', '-1', '14', '12', '5', '4', '3', '24', '1', '1', '-1', '1', '-1', '-1', '1', '1', '2', '-1', '1', '17', '-1', '17', '3', '5', '12', '13', '10', '2', '-1', '1', '92');
INSERT INTO `ssc_e` VALUES ('94', '94', '21', '3', '1', '15', '13', '-1', '5', '4', '25', '2', '-1', '1', '-1', '1', '-1', '2', '2', '3', '-1', '-1', '18', '1', '18', '4', '6', '-1', '14', '11', '3', '1', '2', '93');
INSERT INTO `ssc_e` VALUES ('95', '95', '22', '-1', '2', '16', '14', '1', '6', '5', '26', '3', '1', '-1', '-1', '2', '-1', '3', '3', '-1', '1', '1', '19', '-1', '19', '5', '7', '1', '-1', '12', '4', '2', '3', '94');
INSERT INTO `ssc_e` VALUES ('96', '96', '23', '1', '3', '17', '-1', '2', '7', '6', '27', '4', '2', '-1', '1', '-1', '1', '-1', '4', '-1', '2', '-1', '20', '1', '20', '6', '8', '-1', '1', '13', '5', '3', '4', '95');
INSERT INTO `ssc_e` VALUES ('97', '97', '24', '2', '4', '18', '1', '3', '8', '7', '28', '-1', '-1', '1', '-1', '1', '2', '-1', '-1', '1', '3', '-1', '21', '2', '21', '7', '9', '1', '2', '-1', '6', '4', '5', '96');
INSERT INTO `ssc_e` VALUES ('98', '98', '25', '3', '5', '19', '2', '4', '9', '-1', '29', '1', '-1', '2', '-1', '2', '-1', '1', '1', '-1', '4', '1', '22', '-1', '22', '8', '-1', '2', '3', '1', '7', '5', '6', '97');
INSERT INTO `ssc_e` VALUES ('99', '99', '26', '4', '6', '20', '3', '5', '10', '-1', '30', '2', '-1', '3', '-1', '3', '-1', '2', '2', '-1', '5', '2', '-1', '1', '-1', '9', '1', '3', '4', '2', '8', '6', '7', '98');
INSERT INTO `ssc_e` VALUES ('100', '100', '27', '5', '-1', '21', '4', '6', '11', '1', '31', '3', '1', '-1', '1', '-1', '-1', '3', '3', '1', '-1', '3', '1', '-1', '1', '10', '2', '4', '5', '-1', '9', '7', '8', '99');
INSERT INTO `ssc_e` VALUES ('101', '101', '28', '-1', '1', '22', '5', '7', '12', '2', '32', '4', '2', '-1', '-1', '1', '-1', '4', '4', '-1', '1', '4', '2', '-1', '2', '-1', '3', '5', '6', '1', '10', '8', '9', '100');
INSERT INTO `ssc_e` VALUES ('102', '102', '29', '1', '-1', '23', '6', '8', '13', '3', '33', '5', '3', '-1', '1', '-1', '-1', '5', '5', '1', '-1', '-1', '3', '1', '3', '-1', '4', '6', '7', '2', '11', '9', '10', '101');
INSERT INTO `ssc_e` VALUES ('103', '103', '30', '2', '1', '-1', '7', '9', '14', '4', '34', '6', '4', '-1', '-1', '1', '-1', '6', '-1', '2', '1', '-1', '4', '2', '4', '-1', '5', '7', '8', '3', '12', '10', '11', '102');
INSERT INTO `ssc_e` VALUES ('104', '104', '31', '3', '2', '-1', '8', '10', '15', '5', '35', '7', '5', '-1', '-1', '2', '-1', '7', '-1', '3', '2', '1', '-1', '3', '-1', '1', '6', '8', '9', '4', '13', '11', '12', '103');
INSERT INTO `ssc_e` VALUES ('105', '105', '32', '4', '3', '1', '9', '11', '16', '6', '-1', '8', '-1', '1', '1', '-1', '1', '-1', '1', '4', '-1', '-1', '1', '4', '1', '2', '7', '9', '10', '-1', '14', '12', '13', '104');
INSERT INTO `ssc_e` VALUES ('106', '106', '33', '5', '4', '2', '-1', '12', '17', '7', '1', '9', '1', '-1', '2', '-1', '2', '-1', '2', '-1', '1', '1', '2', '-1', '2', '3', '8', '10', '-1', '1', '15', '13', '14', '105');
INSERT INTO `ssc_e` VALUES ('107', '107', '34', '-1', '5', '3', '1', '13', '18', '8', '2', '10', '2', '-1', '-1', '1', '-1', '1', '3', '-1', '2', '2', '3', '-1', '3', '4', '9', '-1', '1', '2', '16', '14', '15', '106');
INSERT INTO `ssc_e` VALUES ('108', '108', '35', '-1', '6', '4', '2', '14', '19', '9', '3', '11', '3', '-1', '-1', '2', '-1', '2', '4', '-1', '3', '3', '-1', '1', '-1', '5', '10', '1', '2', '3', '17', '15', '16', '107');
INSERT INTO `ssc_e` VALUES ('109', '109', '-1', '1', '7', '5', '3', '15', '20', '10', '4', '12', '4', '-1', '1', '-1', '1', '-1', '-1', '1', '4', '4', '1', '-1', '1', '-1', '11', '2', '3', '4', '18', '16', '17', '108');
INSERT INTO `ssc_e` VALUES ('110', '110', '1', '2', '8', '-1', '4', '16', '21', '11', '5', '13', '5', '-1', '-1', '1', '-1', '1', '-1', '2', '5', '-1', '2', '1', '2', '1', '12', '-1', '4', '5', '19', '17', '18', '109');
INSERT INTO `ssc_e` VALUES ('111', '111', '2', '3', '9', '1', '5', '17', '22', '12', '-1', '14', '-1', '1', '1', '-1', '1', '-1', '1', '3', '-1', '-1', '3', '2', '3', '2', '13', '1', '5', '-1', '20', '18', '19', '110');
INSERT INTO `ssc_e` VALUES ('112', '112', '3', '4', '10', '2', '6', '18', '23', '13', '1', '-1', '-1', '2', '-1', '1', '2', '-1', '-1', '4', '1', '-1', '4', '3', '4', '-1', '14', '2', '6', '1', '21', '19', '20', '111');
INSERT INTO `ssc_e` VALUES ('113', '113', '4', '5', '11', '3', '-1', '19', '24', '14', '2', '1', '1', '-1', '1', '-1', '3', '-1', '1', '-1', '2', '1', '5', '-1', '5', '1', '15', '3', '7', '-1', '22', '20', '21', '112');
INSERT INTO `ssc_e` VALUES ('114', '114', '5', '6', '12', '4', '1', '20', '-1', '15', '3', '2', '-1', '1', '2', '-1', '4', '-1', '-1', '1', '3', '-1', '6', '1', '6', '2', '-1', '4', '8', '1', '23', '21', '22', '113');
INSERT INTO `ssc_e` VALUES ('115', '115', '6', '7', '13', '5', '2', '21', '1', '-1', '4', '3', '-1', '2', '-1', '1', '-1', '1', '1', '-1', '4', '-1', '7', '2', '7', '-1', '1', '5', '9', '2', '24', '22', '23', '114');
INSERT INTO `ssc_e` VALUES ('116', '116', '7', '8', '14', '6', '-1', '22', '2', '1', '5', '4', '1', '-1', '1', '-1', '1', '-1', '2', '-1', '5', '1', '8', '-1', '8', '1', '2', '-1', '10', '3', '25', '23', '24', '115');
INSERT INTO `ssc_e` VALUES ('117', '117', '8', '9', '15', '7', '1', '23', '-1', '2', '6', '5', '-1', '1', '2', '-1', '2', '-1', '-1', '1', '6', '-1', '9', '1', '9', '2', '-1', '1', '11', '4', '26', '24', '25', '116');
INSERT INTO `ssc_e` VALUES ('118', '118', '9', '10', '16', '-1', '2', '24', '1', '3', '7', '6', '1', '-1', '-1', '1', '-1', '1', '-1', '2', '7', '1', '10', '-1', '10', '3', '1', '-1', '12', '5', '27', '25', '26', '117');
INSERT INTO `ssc_e` VALUES ('119', '119', '10', '11', '17', '1', '-1', '25', '2', '4', '8', '7', '2', '-1', '1', '-1', '1', '-1', '1', '-1', '8', '-1', '11', '1', '11', '-1', '2', '1', '13', '6', '28', '26', '27', '118');
INSERT INTO `ssc_e` VALUES ('120', '120', '11', '12', '18', '2', '1', '26', '3', '5', '9', '-1', '-1', '1', '-1', '1', '2', '-1', '-1', '1', '9', '-1', '12', '2', '12', '1', '3', '2', '14', '-1', '29', '27', '28', '119');
INSERT INTO `ssc_e` VALUES ('121', '121', '12', '13', '19', '3', '2', '27', '4', '6', '10', '-1', '-1', '2', '-1', '2', '3', '-1', '-1', '2', '10', '1', '-1', '3', '-1', '2', '4', '3', '15', '1', '30', '28', '29', '120');
INSERT INTO `ssc_e` VALUES ('122', '122', '13', '14', '20', '-1', '3', '28', '5', '7', '11', '1', '1', '-1', '-1', '3', '-1', '1', '-1', '3', '11', '2', '1', '-1', '1', '3', '5', '4', '16', '2', '-1', '29', '30', '121');
INSERT INTO `ssc_e` VALUES ('123', '123', '-1', '15', '21', '1', '4', '29', '6', '8', '12', '2', '2', '-1', '1', '-1', '1', '-1', '-1', '4', '12', '3', '2', '-1', '2', '4', '6', '-1', '17', '3', '1', '30', '31', '122');
INSERT INTO `ssc_e` VALUES ('124', '124', '-1', '16', '22', '2', '5', '30', '7', '9', '13', '3', '3', '-1', '2', '-1', '2', '-1', '-1', '5', '13', '4', '-1', '1', '-1', '5', '7', '1', '18', '4', '2', '31', '32', '123');
INSERT INTO `ssc_e` VALUES ('125', '125', '1', '-1', '23', '3', '6', '31', '8', '10', '14', '4', '4', '-1', '-1', '1', '-1', '1', '1', '-1', '14', '-1', '1', '2', '1', '-1', '8', '2', '19', '5', '3', '32', '33', '124');
INSERT INTO `ssc_e` VALUES ('126', '126', '2', '1', '24', '4', '-1', '32', '9', '11', '15', '5', '5', '-1', '1', '-1', '1', '-1', '2', '-1', '15', '-1', '2', '3', '2', '1', '9', '-1', '20', '6', '4', '33', '34', '125');
INSERT INTO `ssc_e` VALUES ('127', '127', '3', '-1', '25', '5', '1', '33', '10', '12', '16', '6', '6', '-1', '-1', '1', '-1', '1', '3', '-1', '16', '1', '3', '-1', '3', '2', '10', '-1', '21', '7', '5', '34', '35', '126');
INSERT INTO `ssc_e` VALUES ('128', '128', '4', '1', '26', '-1', '2', '34', '11', '13', '17', '7', '7', '-1', '-1', '2', '-1', '2', '-1', '1', '17', '-1', '4', '1', '4', '3', '-1', '1', '22', '8', '6', '35', '36', '127');
INSERT INTO `ssc_e` VALUES ('129', '129', '5', '2', '27', '1', '3', '-1', '12', '14', '18', '8', '-1', '1', '-1', '3', '-1', '3', '1', '2', '-1', '-1', '5', '2', '5', '4', '-1', '2', '23', '9', '7', '36', '37', '128');
INSERT INTO `ssc_e` VALUES ('130', '130', '6', '3', '28', '-1', '4', '1', '13', '15', '19', '9', '1', '-1', '-1', '4', '-1', '4', '-1', '3', '1', '1', '6', '-1', '6', '5', '-1', '3', '24', '10', '8', '37', '38', '129');
INSERT INTO `ssc_e` VALUES ('131', '131', '7', '4', '29', '1', '-1', '2', '14', '16', '20', '10', '2', '-1', '1', '-1', '1', '-1', '1', '-1', '2', '-1', '7', '1', '7', '-1', '1', '4', '25', '11', '9', '38', '39', '130');
INSERT INTO `ssc_e` VALUES ('132', '132', '8', '5', '30', '2', '1', '3', '15', '17', '21', '-1', '-1', '1', '-1', '1', '2', '-1', '-1', '1', '3', '-1', '8', '2', '8', '1', '2', '5', '26', '-1', '10', '39', '40', '131');
INSERT INTO `ssc_e` VALUES ('133', '133', '9', '6', '31', '3', '-1', '4', '16', '18', '22', '1', '1', '-1', '1', '-1', '3', '-1', '1', '-1', '4', '1', '9', '-1', '9', '2', '3', '6', '27', '-1', '11', '40', '41', '132');
INSERT INTO `ssc_e` VALUES ('134', '134', '10', '7', '32', '4', '1', '5', '17', '19', '-1', '2', '-1', '1', '2', '-1', '4', '-1', '2', '1', '-1', '-1', '10', '1', '10', '3', '4', '7', '-1', '1', '12', '41', '42', '133');
INSERT INTO `ssc_e` VALUES ('135', '135', '11', '8', '33', '5', '2', '6', '18', '20', '-1', '3', '-1', '2', '3', '-1', '5', '-1', '3', '2', '-1', '1', '-1', '2', '-1', '4', '5', '8', '1', '2', '13', '42', '43', '134');
INSERT INTO `ssc_e` VALUES ('136', '136', '-1', '9', '34', '6', '3', '7', '19', '21', '1', '4', '1', '-1', '4', '-1', '6', '-1', '-1', '3', '1', '2', '1', '-1', '1', '5', '6', '9', '2', '3', '14', '43', '-1', '135');
INSERT INTO `ssc_e` VALUES ('137', '137', '1', '10', '35', '7', '-1', '8', '20', '22', '2', '5', '2', '-1', '5', '-1', '7', '-1', '1', '-1', '2', '-1', '2', '1', '2', '6', '7', '10', '-1', '4', '15', '44', '1', '136');
INSERT INTO `ssc_e` VALUES ('138', '138', '2', '11', '36', '8', '1', '-1', '21', '23', '3', '6', '-1', '1', '-1', '1', '-1', '1', '2', '1', '-1', '-1', '3', '2', '3', '-1', '8', '11', '1', '5', '16', '45', '2', '137');
INSERT INTO `ssc_e` VALUES ('139', '139', '3', '12', '37', '-1', '2', '1', '22', '24', '4', '7', '1', '-1', '-1', '2', '-1', '2', '-1', '2', '1', '1', '4', '-1', '4', '1', '-1', '12', '2', '6', '17', '46', '3', '138');
INSERT INTO `ssc_e` VALUES ('140', '140', '4', '13', '38', '1', '3', '2', '-1', '25', '5', '8', '-1', '1', '1', '-1', '1', '-1', '-1', '3', '2', '-1', '5', '1', '5', '2', '1', '-1', '3', '7', '18', '47', '4', '139');
INSERT INTO `ssc_e` VALUES ('141', '141', '5', '14', '39', '2', '4', '3', '1', '-1', '6', '9', '-1', '2', '-1', '1', '-1', '1', '1', '-1', '3', '-1', '6', '2', '6', '-1', '2', '1', '4', '8', '19', '48', '5', '140');
INSERT INTO `ssc_e` VALUES ('142', '142', '6', '15', '40', '-1', '5', '4', '2', '1', '7', '10', '1', '-1', '-1', '2', '-1', '2', '-1', '1', '4', '1', '7', '-1', '7', '1', '3', '2', '-1', '9', '20', '49', '6', '141');
INSERT INTO `ssc_e` VALUES ('143', '143', '7', '16', '41', '1', '6', '-1', '3', '2', '8', '11', '-1', '1', '-1', '3', '-1', '3', '1', '2', '-1', '-1', '8', '1', '8', '2', '-1', '3', '1', '10', '21', '50', '7', '142');
INSERT INTO `ssc_e` VALUES ('144', '144', '-1', '17', '42', '2', '7', '1', '4', '3', '9', '12', '1', '-1', '1', '-1', '1', '-1', '-1', '3', '1', '1', '9', '-1', '9', '3', '1', '4', '2', '-1', '22', '51', '8', '143');
INSERT INTO `ssc_e` VALUES ('145', '145', '-1', '18', '43', '3', '8', '2', '5', '4', '10', '13', '2', '-1', '2', '-1', '2', '-1', '-1', '4', '2', '2', '-1', '1', '-1', '4', '2', '5', '3', '1', '23', '52', '9', '144');
INSERT INTO `ssc_e` VALUES ('146', '146', '1', '-1', '44', '4', '9', '3', '6', '5', '11', '14', '3', '-1', '-1', '1', '-1', '1', '1', '-1', '3', '-1', '1', '2', '1', '-1', '3', '6', '4', '2', '24', '53', '10', '145');
INSERT INTO `ssc_e` VALUES ('147', '147', '2', '-1', '45', '5', '10', '4', '7', '6', '12', '15', '4', '-1', '-1', '2', '-1', '2', '2', '-1', '4', '1', '-1', '3', '-1', '1', '4', '7', '5', '3', '25', '54', '11', '146');
INSERT INTO `ssc_e` VALUES ('148', '148', '3', '1', '46', '6', '11', '-1', '8', '7', '13', '16', '-1', '1', '-1', '3', '-1', '3', '3', '1', '-1', '-1', '1', '4', '1', '2', '5', '8', '-1', '4', '26', '55', '12', '147');
INSERT INTO `ssc_e` VALUES ('149', '149', '4', '-1', '47', '7', '12', '1', '9', '8', '14', '17', '1', '-1', '-1', '4', '-1', '4', '4', '-1', '1', '1', '2', '-1', '2', '3', '6', '9', '-1', '5', '27', '56', '13', '148');
INSERT INTO `ssc_e` VALUES ('150', '150', '5', '-1', '48', '8', '13', '2', '10', '9', '15', '18', '2', '-1', '-1', '5', '-1', '5', '5', '-1', '2', '2', '-1', '1', '-1', '4', '7', '10', '1', '6', '28', '57', '14', '149');
INSERT INTO `ssc_e` VALUES ('151', '151', '6', '1', '49', '9', '14', '3', '-1', '10', '16', '19', '-1', '1', '1', '-1', '1', '-1', '-1', '1', '3', '-1', '1', '2', '1', '5', '8', '11', '2', '-1', '29', '58', '15', '150');
INSERT INTO `ssc_e` VALUES ('152', '152', '-1', '2', '50', '10', '15', '4', '1', '11', '17', '20', '1', '-1', '2', '-1', '2', '-1', '-1', '2', '4', '1', '2', '-1', '2', '6', '9', '12', '3', '1', '-1', '59', '16', '151');
INSERT INTO `ssc_e` VALUES ('153', '153', '1', '3', '51', '11', '16', '5', '2', '12', '-1', '21', '-1', '1', '3', '-1', '3', '-1', '1', '3', '-1', '-1', '3', '1', '3', '7', '10', '13', '4', '2', '1', '60', '-1', '152');
INSERT INTO `ssc_e` VALUES ('154', '154', '2', '4', '-1', '12', '17', '6', '3', '13', '1', '22', '1', '-1', '4', '-1', '-1', '1', '2', '4', '-1', '1', '4', '-1', '4', '8', '11', '14', '5', '3', '-1', '61', '1', '153');
INSERT INTO `ssc_e` VALUES ('155', '155', '3', '5', '1', '13', '18', '7', '4', '-1', '2', '23', '-1', '1', '-1', '1', '-1', '2', '3', '-1', '1', '-1', '5', '1', '5', '9', '12', '15', '6', '-1', '1', '62', '2', '154');
INSERT INTO `ssc_e` VALUES ('156', '156', '4', '6', '2', '14', '-1', '8', '5', '1', '3', '24', '1', '-1', '1', '-1', '1', '-1', '4', '-1', '2', '1', '6', '-1', '6', '10', '13', '-1', '7', '1', '2', '63', '3', '155');
INSERT INTO `ssc_e` VALUES ('157', '157', '5', '7', '-1', '15', '1', '9', '6', '2', '4', '25', '2', '-1', '2', '-1', '-1', '1', '5', '1', '-1', '2', '7', '-1', '7', '11', '-1', '1', '8', '2', '3', '64', '4', '156');
INSERT INTO `ssc_e` VALUES ('158', '158', '6', '8', '-1', '16', '2', '10', '7', '3', '5', '26', '3', '-1', '3', '-1', '-1', '2', '6', '2', '-1', '3', '-1', '1', '-1', '12', '1', '2', '9', '3', '4', '65', '5', '157');
INSERT INTO `ssc_e` VALUES ('159', '159', '7', '9', '1', '17', '3', '11', '8', '4', '6', '-1', '-1', '1', '-1', '1', '1', '-1', '-1', '3', '1', '-1', '1', '2', '1', '13', '2', '3', '10', '4', '5', '-1', '6', '158');
INSERT INTO `ssc_e` VALUES ('160', '160', '8', '10', '2', '18', '4', '-1', '9', '5', '7', '1', '-1', '2', '-1', '2', '-1', '1', '1', '4', '-1', '1', '2', '-1', '2', '14', '3', '4', '-1', '5', '6', '1', '7', '159');
INSERT INTO `ssc_e` VALUES ('161', '161', '9', '-1', '3', '19', '5', '1', '10', '6', '8', '2', '1', '-1', '-1', '3', '-1', '2', '2', '-1', '1', '2', '3', '-1', '3', '15', '4', '5', '-1', '6', '7', '2', '8', '160');
INSERT INTO `ssc_e` VALUES ('162', '162', '10', '1', '4', '20', '-1', '2', '11', '7', '9', '3', '2', '-1', '1', '-1', '1', '-1', '3', '-1', '2', '-1', '4', '1', '4', '16', '5', '-1', '1', '7', '8', '3', '9', '161');
INSERT INTO `ssc_e` VALUES ('163', '163', '11', '2', '5', '21', '1', '3', '12', '8', '-1', '4', '-1', '1', '2', '-1', '2', '-1', '4', '1', '-1', '-1', '5', '2', '5', '17', '6', '1', '-1', '8', '9', '4', '10', '162');
INSERT INTO `ssc_e` VALUES ('164', '164', '12', '3', '6', '22', '2', '4', '-1', '9', '1', '5', '-1', '2', '3', '-1', '3', '-1', '-1', '2', '1', '1', '6', '-1', '6', '18', '-1', '2', '1', '9', '10', '5', '11', '163');
INSERT INTO `ssc_e` VALUES ('165', '165', '13', '4', '7', '-1', '3', '5', '1', '10', '2', '6', '1', '-1', '-1', '1', '-1', '1', '-1', '3', '2', '2', '7', '-1', '7', '19', '1', '-1', '2', '10', '11', '6', '12', '164');
INSERT INTO `ssc_e` VALUES ('166', '166', '14', '5', '8', '-1', '4', '6', '2', '11', '3', '7', '2', '-1', '-1', '2', '-1', '2', '-1', '4', '3', '3', '-1', '1', '-1', '20', '2', '1', '3', '11', '12', '7', '13', '165');
INSERT INTO `ssc_e` VALUES ('167', '167', '15', '-1', '9', '1', '5', '7', '3', '12', '4', '8', '3', '-1', '-1', '3', '-1', '3', '1', '-1', '4', '4', '1', '-1', '1', '21', '-1', '2', '4', '12', '13', '8', '14', '166');
INSERT INTO `ssc_e` VALUES ('168', '168', '16', '-1', '10', '2', '6', '8', '4', '13', '5', '9', '4', '-1', '-1', '4', '-1', '4', '2', '-1', '5', '5', '-1', '1', '-1', '22', '1', '3', '5', '13', '14', '9', '15', '167');
INSERT INTO `ssc_e` VALUES ('169', '169', '17', '1', '11', '3', '7', '-1', '5', '14', '6', '10', '-1', '1', '-1', '5', '-1', '5', '3', '1', '-1', '-1', '1', '2', '1', '23', '2', '4', '-1', '14', '15', '10', '16', '168');
INSERT INTO `ssc_e` VALUES ('170', '170', '18', '2', '12', '4', '8', '-1', '6', '15', '7', '11', '-1', '2', '-1', '6', '-1', '6', '4', '2', '-1', '1', '-1', '3', '-1', '24', '3', '5', '1', '15', '16', '11', '17', '169');
INSERT INTO `ssc_e` VALUES ('171', '171', '19', '3', '13', '5', '9', '1', '7', '16', '-1', '12', '-1', '3', '1', '-1', '1', '-1', '5', '3', '-1', '-1', '1', '4', '1', '25', '4', '-1', '2', '16', '17', '12', '18', '170');
INSERT INTO `ssc_e` VALUES ('172', '172', '20', '-1', '14', '6', '10', '2', '8', '17', '1', '13', '1', '-1', '-1', '1', '-1', '1', '6', '-1', '1', '1', '2', '-1', '2', '26', '5', '1', '3', '17', '18', '-1', '19', '171');
INSERT INTO `ssc_e` VALUES ('173', '173', '21', '1', '15', '7', '-1', '3', '9', '18', '2', '14', '2', '-1', '1', '-1', '1', '-1', '7', '-1', '2', '-1', '3', '1', '3', '27', '6', '-1', '4', '18', '19', '1', '20', '172');
INSERT INTO `ssc_e` VALUES ('174', '174', '22', '2', '16', '8', '1', '4', '10', '19', '3', '-1', '-1', '1', '-1', '1', '2', '-1', '-1', '1', '3', '-1', '4', '2', '4', '28', '7', '1', '5', '-1', '20', '2', '21', '173');
INSERT INTO `ssc_e` VALUES ('175', '175', '23', '3', '17', '9', '-1', '5', '11', '20', '4', '1', '1', '-1', '1', '-1', '3', '-1', '1', '-1', '4', '1', '5', '-1', '5', '29', '8', '2', '6', '-1', '21', '3', '22', '174');
INSERT INTO `ssc_e` VALUES ('176', '176', '24', '4', '18', '-1', '1', '6', '12', '21', '5', '2', '2', '-1', '-1', '1', '-1', '1', '-1', '1', '5', '2', '6', '-1', '6', '-1', '9', '3', '7', '1', '22', '4', '23', '175');
INSERT INTO `ssc_e` VALUES ('177', '177', '25', '5', '19', '1', '2', '-1', '13', '22', '6', '3', '-1', '1', '-1', '2', '-1', '2', '1', '2', '-1', '-1', '7', '1', '7', '1', '-1', '4', '8', '2', '23', '5', '24', '176');
INSERT INTO `ssc_e` VALUES ('178', '178', '26', '6', '-1', '2', '3', '1', '14', '23', '7', '4', '1', '-1', '1', '-1', '-1', '3', '2', '3', '-1', '1', '8', '-1', '8', '2', '1', '-1', '9', '3', '24', '6', '25', '177');
INSERT INTO `ssc_e` VALUES ('179', '178', '27', '7', '1', '3', '4', '-1', '15', '24', '8', '5', '-1', '1', '-1', '1', '-1', '4', '3', '4', '-1', '2', '-1', '1', '-1', '3', '2', '1', '10', '4', '25', '7', '26', '178');
INSERT INTO `ssc_e` VALUES ('180', '179', '28', '8', '2', '-1', '5', '1', '16', '25', '9', '6', '1', '-1', '-1', '2', '-1', '5', '-1', '5', '1', '3', '1', '-1', '1', '4', '-1', '2', '11', '5', '26', '8', '27', '179');
INSERT INTO `ssc_e` VALUES ('181', '180', '29', '9', '-1', '1', '6', '2', '17', '26', '10', '7', '2', '-1', '1', '-1', '-1', '6', '1', '6', '-1', '4', '2', '-1', '2', '-1', '1', '3', '12', '6', '27', '9', '28', '180');
INSERT INTO `ssc_e` VALUES ('182', '181', '30', '10', '1', '2', '7', '3', '-1', '27', '11', '8', '-1', '1', '2', '-1', '1', '-1', '-1', '7', '1', '-1', '3', '1', '3', '1', '2', '4', '-1', '7', '28', '10', '29', '181');
INSERT INTO `ssc_e` VALUES ('183', '182', '-1', '11', '2', '3', '8', '4', '1', '28', '12', '9', '1', '-1', '3', '-1', '2', '-1', '-1', '8', '2', '1', '4', '-1', '4', '2', '3', '5', '1', '8', '-1', '11', '30', '182');
INSERT INTO `ssc_e` VALUES ('184', '183', '1', '12', '3', '4', '-1', '5', '2', '29', '13', '10', '2', '-1', '4', '-1', '3', '-1', '1', '-1', '3', '-1', '5', '1', '5', '3', '4', '6', '-1', '9', '1', '12', '31', '183');
INSERT INTO `ssc_e` VALUES ('185', '184', '2', '13', '4', '5', '1', '6', '3', '30', '-1', '11', '-1', '1', '5', '-1', '4', '-1', '2', '1', '-1', '-1', '6', '2', '6', '4', '5', '7', '-1', '10', '2', '13', '32', '184');
INSERT INTO `ssc_e` VALUES ('186', '185', '3', '14', '5', '6', '2', '7', '-1', '31', '1', '12', '-1', '2', '6', '-1', '5', '-1', '-1', '2', '1', '1', '7', '-1', '7', '5', '-1', '8', '1', '11', '3', '14', '33', '185');
INSERT INTO `ssc_e` VALUES ('187', '186', '4', '15', '-1', '7', '3', '8', '1', '32', '2', '13', '1', '-1', '7', '-1', '-1', '1', '1', '3', '-1', '2', '8', '-1', '8', '6', '1', '9', '-1', '12', '4', '15', '34', '186');
INSERT INTO `ssc_e` VALUES ('188', '187', '5', '16', '1', '8', '4', '9', '2', '33', '-1', '14', '-1', '1', '8', '-1', '1', '-1', '2', '4', '-1', '-1', '9', '1', '9', '7', '2', '10', '1', '13', '-1', '16', '35', '187');
INSERT INTO `ssc_e` VALUES ('189', '188', '-1', '17', '2', '9', '5', '10', '3', '34', '1', '15', '1', '-1', '9', '-1', '2', '-1', '-1', '5', '1', '1', '10', '-1', '10', '8', '3', '11', '2', '14', '1', '17', '-1', '188');
INSERT INTO `ssc_e` VALUES ('190', '189', '1', '18', '3', '10', '6', '11', '4', '-1', '2', '16', '-1', '1', '-1', '1', '-1', '1', '1', '-1', '2', '-1', '11', '1', '11', '9', '4', '12', '3', '15', '2', '-1', '1', '189');
INSERT INTO `ssc_e` VALUES ('191', '190', '2', '19', '4', '11', '-1', '12', '5', '1', '3', '17', '1', '-1', '1', '-1', '1', '-1', '2', '-1', '3', '1', '12', '-1', '12', '10', '5', '-1', '4', '16', '3', '1', '2', '190');
INSERT INTO `ssc_e` VALUES ('192', '191', '3', '20', '5', '12', '1', '-1', '6', '2', '4', '18', '-1', '1', '-1', '1', '-1', '1', '3', '1', '-1', '-1', '13', '1', '13', '-1', '6', '1', '5', '17', '4', '2', '3', '191');
INSERT INTO `ssc_e` VALUES ('193', '192', '4', '21', '6', '13', '2', '1', '7', '3', '5', '-1', '-1', '2', '-1', '2', '1', '-1', '-1', '2', '1', '-1', '14', '2', '14', '1', '7', '2', '-1', '18', '5', '3', '4', '192');
INSERT INTO `ssc_e` VALUES ('194', '193', '5', '22', '7', '14', '-1', '2', '8', '4', '6', '1', '1', '-1', '1', '-1', '2', '-1', '1', '-1', '2', '1', '15', '-1', '15', '2', '8', '3', '1', '-1', '6', '4', '5', '193');
INSERT INTO `ssc_e` VALUES ('195', '194', '6', '-1', '8', '15', '1', '3', '9', '5', '7', '2', '2', '-1', '-1', '1', '-1', '1', '2', '-1', '3', '2', '16', '-1', '16', '3', '9', '-1', '2', '1', '7', '5', '6', '194');
INSERT INTO `ssc_e` VALUES ('196', '195', '7', '1', '9', '16', '2', '4', '10', '-1', '8', '3', '-1', '1', '-1', '2', '-1', '2', '3', '-1', '4', '-1', '17', '1', '17', '4', '10', '1', '3', '2', '-1', '6', '7', '195');
INSERT INTO `ssc_e` VALUES ('197', '196', '8', '2', '10', '17', '3', '5', '-1', '1', '9', '4', '-1', '2', '1', '-1', '1', '-1', '-1', '1', '5', '1', '18', '-1', '18', '-1', '11', '2', '4', '3', '1', '7', '8', '196');
INSERT INTO `ssc_e` VALUES ('198', '197', '9', '3', '11', '18', '4', '6', '1', '2', '10', '-1', '-1', '3', '-1', '1', '2', '-1', '-1', '2', '6', '-1', '19', '1', '19', '1', '12', '-1', '5', '4', '2', '8', '9', '197');
INSERT INTO `ssc_e` VALUES ('199', '198', '10', '4', '12', '19', '5', '7', '2', '3', '11', '-1', '-1', '4', '-1', '2', '3', '-1', '-1', '3', '7', '1', '-1', '2', '-1', '2', '13', '1', '6', '5', '3', '9', '10', '198');
INSERT INTO `ssc_e` VALUES ('200', '199', '11', '5', '-1', '20', '6', '8', '3', '4', '12', '1', '1', '-1', '1', '-1', '-1', '1', '1', '4', '-1', '2', '1', '-1', '1', '3', '14', '2', '7', '6', '4', '-1', '11', '199');
INSERT INTO `ssc_e` VALUES ('201', '200', '12', '6', '1', '21', '7', '-1', '4', '5', '13', '2', '-1', '1', '-1', '1', '-1', '2', '2', '5', '-1', '-1', '2', '1', '2', '4', '15', '-1', '8', '7', '5', '1', '12', '200');
INSERT INTO `ssc_e` VALUES ('202', '201', '13', '7', '2', '22', '8', '1', '-1', '6', '14', '3', '-1', '2', '1', '-1', '1', '-1', '-1', '6', '1', '-1', '3', '2', '3', '-1', '16', '1', '9', '8', '6', '2', '13', '201');
INSERT INTO `ssc_e` VALUES ('203', '202', '14', '8', '3', '23', '9', '2', '-1', '7', '15', '4', '-1', '3', '2', '-1', '2', '-1', '-1', '7', '2', '1', '-1', '3', '-1', '1', '17', '2', '10', '9', '7', '3', '14', '202');
INSERT INTO `ssc_e` VALUES ('204', '203', '15', '-1', '4', '24', '10', '3', '1', '8', '16', '5', '1', '-1', '-1', '1', '-1', '1', '1', '-1', '3', '2', '1', '-1', '1', '2', '18', '3', '11', '-1', '8', '4', '15', '203');
INSERT INTO `ssc_e` VALUES ('205', '204', '-1', '1', '5', '25', '11', '4', '2', '9', '17', '6', '2', '-1', '1', '-1', '1', '-1', '-1', '1', '4', '3', '2', '-1', '2', '-1', '19', '4', '12', '1', '9', '5', '16', '204');
INSERT INTO `ssc_e` VALUES ('206', '205', '1', '2', '6', '26', '12', '5', '3', '10', '18', '-1', '-1', '1', '-1', '1', '2', '-1', '-1', '2', '5', '-1', '3', '1', '3', '1', '20', '5', '13', '2', '10', '6', '17', '-1');
INSERT INTO `ssc_e` VALUES ('207', '206', '2', '3', '7', '-1', '13', '6', '4', '11', '19', '1', '1', '-1', '-1', '2', '-1', '1', '-1', '3', '6', '1', '4', '-1', '4', '2', '21', '6', '14', '3', '-1', '7', '18', '1');
INSERT INTO `ssc_e` VALUES ('208', '207', '3', '4', '-1', '1', '14', '7', '5', '12', '20', '2', '2', '-1', '1', '-1', '-1', '2', '1', '4', '-1', '2', '5', '-1', '5', '-1', '22', '7', '15', '4', '1', '8', '19', '2');
INSERT INTO `ssc_e` VALUES ('209', '208', '4', '5', '1', '2', '15', '8', '6', '13', '-1', '3', '-1', '1', '2', '-1', '1', '-1', '2', '5', '-1', '-1', '6', '1', '6', '1', '23', '8', '16', '5', '-1', '9', '20', '3');
INSERT INTO `ssc_e` VALUES ('210', '209', '5', '6', '2', '3', '16', '9', '7', '14', '-1', '4', '-1', '2', '3', '-1', '2', '-1', '3', '6', '-1', '1', '-1', '2', '-1', '2', '24', '9', '17', '6', '1', '10', '21', '4');
INSERT INTO `ssc_e` VALUES ('211', '210', '-1', '7', '3', '4', '17', '10', '8', '15', '1', '5', '1', '-1', '4', '-1', '3', '-1', '-1', '7', '1', '2', '1', '-1', '1', '3', '25', '10', '18', '7', '2', '11', '-1', '5');
INSERT INTO `ssc_e` VALUES ('212', '211', '1', '8', '4', '5', '18', '11', '9', '16', '-1', '6', '-1', '1', '5', '-1', '4', '-1', '1', '8', '-1', '-1', '2', '1', '2', '4', '26', '11', '19', '8', '3', '12', '-1', '6');
INSERT INTO `ssc_e` VALUES ('213', '212', '2', '9', '5', '6', '19', '12', '10', '17', '-1', '7', '-1', '2', '6', '-1', '5', '-1', '2', '9', '-1', '1', '-1', '2', '-1', '5', '27', '12', '20', '9', '4', '13', '1', '7');
INSERT INTO `ssc_e` VALUES ('214', '213', '3', '10', '6', '7', '20', '-1', '11', '18', '1', '8', '-1', '3', '-1', '1', '-1', '1', '3', '10', '-1', '2', '1', '-1', '1', '6', '28', '-1', '21', '10', '5', '14', '2', '8');
INSERT INTO `ssc_e` VALUES ('215', '214', '4', '11', '7', '8', '21', '-1', '12', '19', '2', '9', '-1', '4', '-1', '2', '-1', '2', '4', '11', '-1', '3', '-1', '1', '-1', '7', '29', '1', '22', '11', '6', '15', '3', '9');
INSERT INTO `ssc_e` VALUES ('216', '215', '5', '12', '8', '9', '-1', '1', '13', '20', '3', '10', '1', '-1', '1', '-1', '1', '-1', '5', '-1', '1', '4', '1', '-1', '1', '-1', '30', '2', '23', '12', '7', '16', '4', '10');
INSERT INTO `ssc_e` VALUES ('217', '216', '6', '13', '9', '10', '1', '-1', '14', '21', '4', '11', '-1', '1', '-1', '1', '-1', '1', '6', '1', '-1', '-1', '2', '1', '2', '-1', '31', '3', '24', '13', '8', '17', '5', '11');
INSERT INTO `ssc_e` VALUES ('218', '217', '7', '14', '10', '11', '-1', '1', '15', '22', '5', '12', '1', '-1', '1', '-1', '1', '-1', '7', '-1', '1', '1', '3', '-1', '3', '-1', '32', '4', '25', '14', '9', '18', '6', '12');
INSERT INTO `ssc_e` VALUES ('219', '218', '8', '15', '-1', '12', '1', '2', '16', '23', '6', '13', '2', '-1', '2', '-1', '-1', '1', '8', '1', '-1', '2', '4', '-1', '4', '1', '-1', '5', '26', '15', '10', '19', '7', '13');
INSERT INTO `ssc_e` VALUES ('220', '219', '9', '16', '1', '13', '-1', '3', '17', '24', '7', '14', '3', '-1', '3', '-1', '1', '-1', '9', '-1', '1', '-1', '5', '1', '5', '2', '-1', '6', '27', '16', '11', '20', '8', '14');
INSERT INTO `ssc_e` VALUES ('221', '220', '10', '17', '2', '14', '1', '4', '-1', '25', '8', '15', '-1', '1', '4', '-1', '2', '-1', '-1', '1', '2', '-1', '6', '2', '6', '3', '-1', '7', '28', '17', '12', '21', '9', '15');
INSERT INTO `ssc_e` VALUES ('222', '221', '11', '18', '3', '15', '2', '-1', '1', '26', '9', '16', '-1', '2', '-1', '1', '-1', '1', '1', '2', '-1', '1', '7', '-1', '7', '-1', '1', '8', '29', '18', '13', '22', '10', '16');
INSERT INTO `ssc_e` VALUES ('223', '222', '12', '19', '4', '16', '3', '1', '2', '27', '-1', '17', '-1', '3', '1', '-1', '1', '-1', '2', '3', '-1', '-1', '8', '1', '8', '1', '2', '-1', '30', '19', '14', '23', '11', '17');
INSERT INTO `ssc_e` VALUES ('224', '223', '13', '20', '5', '17', '4', '-1', '3', '28', '1', '18', '-1', '4', '-1', '1', '-1', '1', '3', '4', '-1', '1', '9', '-1', '9', '2', '3', '-1', '31', '20', '15', '24', '12', '18');
INSERT INTO `ssc_e` VALUES ('225', '224', '14', '21', '-1', '18', '5', '1', '4', '29', '2', '19', '1', '-1', '1', '-1', '-1', '2', '4', '5', '-1', '2', '10', '-1', '10', '3', '4', '-1', '32', '21', '16', '25', '13', '19');
INSERT INTO `ssc_e` VALUES ('226', '225', '15', '22', '1', '19', '6', '2', '5', '30', '-1', '20', '-1', '1', '2', '-1', '1', '-1', '5', '6', '-1', '-1', '11', '1', '11', '4', '5', '1', '33', '22', '-1', '26', '14', '20');
INSERT INTO `ssc_e` VALUES ('227', '226', '16', '-1', '2', '20', '7', '3', '6', '31', '1', '21', '1', '-1', '-1', '1', '-1', '1', '6', '-1', '1', '1', '12', '-1', '12', '5', '6', '2', '34', '23', '1', '-1', '15', '21');
INSERT INTO `ssc_e` VALUES ('228', '227', '17', '1', '3', '21', '8', '-1', '7', '32', '2', '22', '-1', '1', '-1', '2', '-1', '2', '7', '1', '-1', '-1', '13', '1', '13', '6', '7', '3', '-1', '24', '2', '1', '16', '22');
INSERT INTO `ssc_e` VALUES ('229', '228', '18', '2', '4', '22', '9', '1', '8', '33', '-1', '23', '-1', '2', '1', '-1', '1', '-1', '8', '2', '-1', '-1', '14', '2', '14', '7', '8', '-1', '1', '25', '3', '2', '17', '23');
INSERT INTO `ssc_e` VALUES ('230', '229', '19', '-1', '5', '23', '10', '2', '9', '34', '1', '24', '1', '-1', '-1', '1', '-1', '1', '9', '-1', '1', '1', '15', '-1', '15', '8', '9', '1', '2', '26', '4', '-1', '18', '24');
INSERT INTO `ssc_e` VALUES ('231', '230', '-1', '1', '6', '24', '11', '3', '10', '35', '2', '25', '2', '-1', '1', '-1', '1', '-1', '-1', '1', '2', '2', '16', '-1', '16', '-1', '10', '2', '3', '27', '5', '1', '19', '25');
INSERT INTO `ssc_e` VALUES ('232', '231', '1', '2', '7', '25', '12', '4', '11', '36', '3', '-1', '-1', '1', '-1', '1', '2', '-1', '-1', '2', '3', '-1', '17', '1', '17', '1', '11', '3', '4', '28', '6', '2', '20', '-1');
INSERT INTO `ssc_e` VALUES ('233', '232', '2', '3', '8', '26', '-1', '5', '12', '37', '4', '1', '1', '-1', '1', '-1', '3', '-1', '1', '-1', '4', '1', '18', '-1', '18', '2', '12', '4', '5', '-1', '7', '3', '21', '1');
INSERT INTO `ssc_e` VALUES ('234', '233', '3', '4', '9', '27', '1', '-1', '13', '38', '5', '2', '-1', '1', '-1', '1', '-1', '1', '2', '1', '-1', '-1', '19', '1', '19', '-1', '13', '5', '6', '1', '8', '4', '22', '2');
INSERT INTO `ssc_e` VALUES ('235', '234', '4', '-1', '10', '28', '2', '1', '14', '39', '6', '3', '1', '-1', '-1', '2', '-1', '2', '3', '-1', '1', '1', '20', '-1', '20', '1', '14', '6', '-1', '2', '9', '5', '23', '3');
INSERT INTO `ssc_e` VALUES ('236', '235', '5', '1', '11', '29', '3', '2', '15', '40', '-1', '4', '-1', '1', '1', '-1', '1', '-1', '4', '1', '-1', '-1', '21', '1', '21', '2', '15', '7', '1', '3', '10', '-1', '24', '4');
INSERT INTO `ssc_e` VALUES ('237', '236', '6', '-1', '12', '30', '4', '3', '16', '41', '1', '5', '1', '-1', '-1', '1', '-1', '1', '5', '-1', '1', '1', '22', '-1', '22', '3', '16', '8', '2', '4', '11', '-1', '25', '5');
INSERT INTO `ssc_e` VALUES ('238', '237', '7', '1', '13', '31', '5', '4', '-1', '42', '2', '6', '-1', '1', '1', '-1', '1', '-1', '-1', '1', '2', '-1', '23', '1', '23', '4', '17', '9', '3', '-1', '12', '1', '26', '6');
INSERT INTO `ssc_e` VALUES ('239', '238', '8', '-1', '14', '32', '6', '5', '1', '43', '3', '7', '1', '-1', '-1', '1', '-1', '1', '1', '-1', '3', '1', '24', '-1', '24', '5', '18', '10', '4', '-1', '13', '2', '27', '7');
INSERT INTO `ssc_e` VALUES ('240', '239', '9', '1', '15', '33', '-1', '6', '2', '44', '4', '8', '2', '-1', '1', '-1', '1', '-1', '2', '-1', '4', '-1', '25', '1', '25', '6', '19', '-1', '5', '1', '14', '3', '28', '8');
INSERT INTO `ssc_e` VALUES ('241', '240', '10', '2', '16', '34', '1', '7', '3', '45', '5', '-1', '-1', '1', '-1', '1', '2', '-1', '-1', '1', '5', '-1', '26', '2', '26', '7', '20', '1', '6', '-1', '15', '4', '29', '9');
INSERT INTO `ssc_e` VALUES ('242', '241', '11', '3', '17', '-1', '2', '8', '4', '46', '6', '1', '1', '-1', '-1', '2', '-1', '1', '-1', '2', '6', '1', '27', '-1', '27', '8', '21', '2', '7', '1', '-1', '5', '30', '10');
INSERT INTO `ssc_e` VALUES ('243', '242', '12', '4', '-1', '1', '3', '9', '5', '47', '7', '2', '2', '-1', '1', '-1', '-1', '2', '1', '3', '-1', '2', '28', '-1', '28', '-1', '22', '3', '8', '2', '1', '6', '31', '11');
INSERT INTO `ssc_e` VALUES ('244', '243', '13', '5', '1', '2', '-1', '10', '6', '48', '8', '3', '3', '-1', '2', '-1', '1', '-1', '2', '-1', '1', '-1', '29', '1', '29', '1', '-1', '4', '9', '3', '2', '7', '32', '12');
INSERT INTO `ssc_e` VALUES ('245', '244', '14', '6', '2', '-1', '1', '11', '7', '49', '9', '4', '4', '-1', '-1', '1', '-1', '1', '-1', '1', '2', '1', '30', '-1', '30', '-1', '1', '5', '10', '4', '3', '8', '33', '13');
INSERT INTO `ssc_e` VALUES ('246', '245', '15', '7', '3', '1', '-1', '12', '8', '50', '10', '5', '5', '-1', '1', '-1', '1', '-1', '1', '-1', '3', '-1', '31', '1', '31', '-1', '2', '6', '11', '5', '4', '9', '34', '14');
INSERT INTO `ssc_e` VALUES ('247', '246', '16', '8', '4', '2', '1', '-1', '9', '51', '11', '6', '-1', '1', '-1', '1', '-1', '1', '2', '1', '-1', '-1', '32', '2', '32', '-1', '3', '7', '12', '6', '5', '10', '35', '15');
INSERT INTO `ssc_e` VALUES ('248', '247', '17', '9', '5', '3', '2', '1', '-1', '52', '12', '7', '-1', '2', '1', '-1', '1', '-1', '-1', '2', '1', '-1', '33', '3', '33', '-1', '4', '8', '13', '7', '6', '11', '36', '16');
INSERT INTO `ssc_e` VALUES ('249', '248', '18', '10', '6', '4', '3', '2', '1', '-1', '13', '8', '-1', '3', '-1', '1', '-1', '1', '1', '-1', '2', '-1', '34', '4', '34', '-1', '5', '9', '14', '8', '7', '12', '37', '17');
INSERT INTO `ssc_e` VALUES ('250', '249', '-1', '11', '7', '5', '4', '3', '2', '1', '14', '9', '1', '-1', '1', '-1', '1', '-1', '-1', '1', '3', '1', '35', '-1', '35', '1', '6', '10', '15', '9', '8', '-1', '38', '18');
INSERT INTO `ssc_e` VALUES ('251', '250', '1', '12', '8', '6', '5', '4', '3', '2', '15', '-1', '-1', '1', '-1', '1', '2', '-1', '-1', '2', '4', '-1', '36', '1', '36', '2', '7', '11', '16', '10', '9', '1', '39', '-1');
INSERT INTO `ssc_e` VALUES ('252', '251', '2', '13', '9', '7', '6', '5', '4', '3', '16', '-1', '-1', '2', '-1', '2', '3', '-1', '-1', '3', '5', '1', '-1', '2', '-1', '3', '8', '12', '17', '11', '10', '2', '40', '1');
INSERT INTO `ssc_e` VALUES ('253', '252', '3', '-1', '10', '8', '7', '6', '5', '4', '17', '1', '1', '-1', '-1', '3', '-1', '1', '1', '-1', '6', '2', '1', '-1', '1', '4', '9', '13', '18', '12', '11', '3', '-1', '2');
INSERT INTO `ssc_e` VALUES ('254', '253', '4', '-1', '11', '9', '8', '7', '6', '5', '18', '2', '2', '-1', '-1', '4', '-1', '2', '2', '-1', '7', '3', '-1', '1', '-1', '5', '10', '14', '19', '13', '12', '4', '1', '3');
INSERT INTO `ssc_e` VALUES ('255', '254', '5', '1', '12', '10', '9', '8', '7', '-1', '19', '3', '-1', '1', '-1', '5', '-1', '3', '3', '-1', '8', '-1', '1', '2', '1', '6', '11', '15', '20', '14', '-1', '5', '2', '4');
INSERT INTO `ssc_e` VALUES ('256', '255', '-1', '2', '13', '11', '10', '9', '8', '1', '20', '4', '1', '-1', '1', '-1', '1', '-1', '-1', '1', '9', '1', '2', '-1', '2', '7', '12', '16', '21', '15', '1', '-1', '3', '5');
INSERT INTO `ssc_e` VALUES ('257', '256', '1', '3', '14', '12', '-1', '10', '9', '2', '21', '5', '2', '-1', '2', '-1', '2', '-1', '1', '-1', '10', '-1', '3', '1', '3', '8', '13', '17', '-1', '16', '2', '1', '4', '6');
INSERT INTO `ssc_e` VALUES ('258', '257', '2', '-1', '15', '13', '1', '11', '10', '3', '22', '6', '3', '-1', '-1', '1', '-1', '1', '2', '-1', '11', '1', '4', '-1', '4', '9', '14', '-1', '1', '17', '3', '2', '5', '7');
INSERT INTO `ssc_e` VALUES ('259', '258', '3', '1', '-1', '14', '2', '12', '11', '4', '23', '7', '4', '-1', '1', '-1', '-1', '2', '3', '1', '-1', '-1', '5', '1', '5', '-1', '15', '1', '2', '18', '4', '3', '6', '8');
INSERT INTO `ssc_e` VALUES ('260', '259', '4', '-1', '1', '15', '3', '13', '12', '5', '24', '8', '5', '-1', '-1', '1', '-1', '3', '4', '-1', '1', '1', '6', '-1', '6', '-1', '16', '2', '3', '19', '5', '4', '7', '9');
INSERT INTO `ssc_e` VALUES ('261', '260', '5', '-1', '2', '16', '4', '14', '13', '6', '25', '9', '6', '-1', '-1', '2', '-1', '4', '5', '-1', '2', '2', '-1', '1', '-1', '1', '17', '3', '4', '20', '6', '5', '8', '10');
INSERT INTO `ssc_e` VALUES ('262', '261', '6', '1', '3', '17', '5', '15', '-1', '7', '26', '10', '-1', '1', '1', '-1', '1', '-1', '-1', '1', '3', '-1', '1', '2', '1', '2', '18', '4', '5', '-1', '7', '6', '9', '11');
INSERT INTO `ssc_e` VALUES ('263', '262', '7', '2', '4', '-1', '6', '16', '1', '8', '27', '11', '1', '-1', '-1', '1', '-1', '1', '-1', '2', '4', '1', '2', '-1', '2', '3', '19', '-1', '6', '1', '8', '7', '10', '12');
INSERT INTO `ssc_e` VALUES ('264', '263', '8', '3', '-1', '1', '7', '17', '2', '9', '28', '12', '2', '-1', '1', '-1', '-1', '2', '1', '3', '-1', '2', '3', '-1', '3', '-1', '20', '1', '7', '2', '9', '8', '11', '13');
INSERT INTO `ssc_e` VALUES ('265', '264', '9', '4', '1', '2', '-1', '18', '3', '10', '29', '13', '3', '-1', '2', '-1', '1', '-1', '2', '-1', '1', '-1', '4', '1', '4', '1', '-1', '2', '8', '3', '10', '9', '12', '14');
INSERT INTO `ssc_e` VALUES ('266', '265', '-1', '5', '2', '3', '1', '19', '4', '11', '30', '14', '4', '-1', '3', '-1', '2', '-1', '-1', '1', '2', '1', '5', '-1', '5', '2', '1', '3', '-1', '4', '11', '10', '13', '15');
INSERT INTO `ssc_e` VALUES ('267', '266', '1', '-1', '3', '4', '2', '20', '5', '12', '31', '15', '5', '-1', '-1', '1', '-1', '1', '1', '-1', '3', '-1', '6', '1', '6', '-1', '2', '4', '1', '5', '12', '11', '14', '16');
INSERT INTO `ssc_e` VALUES ('268', '267', '2', '1', '4', '5', '3', '21', '-1', '13', '32', '16', '-1', '1', '1', '-1', '1', '-1', '-1', '1', '4', '-1', '7', '2', '7', '1', '3', '5', '2', '-1', '13', '12', '15', '17');
INSERT INTO `ssc_e` VALUES ('269', '268', '3', '2', '5', '6', '4', '-1', '1', '14', '33', '17', '-1', '2', '-1', '1', '-1', '1', '1', '2', '-1', '1', '8', '-1', '8', '-1', '4', '6', '3', '1', '14', '13', '16', '18');
INSERT INTO `ssc_e` VALUES ('270', '269', '-1', '3', '6', '7', '5', '1', '2', '15', '34', '18', '1', '-1', '1', '-1', '1', '-1', '-1', '3', '1', '2', '9', '-1', '9', '1', '5', '7', '4', '-1', '15', '14', '17', '19');
INSERT INTO `ssc_e` VALUES ('271', '270', '-1', '4', '7', '8', '6', '2', '3', '16', '35', '19', '2', '-1', '2', '-1', '2', '-1', '-1', '4', '2', '3', '-1', '1', '-1', '2', '6', '8', '5', '1', '16', '15', '18', '20');
INSERT INTO `ssc_e` VALUES ('272', '271', '1', '5', '8', '9', '-1', '3', '4', '17', '36', '20', '3', '-1', '3', '-1', '3', '-1', '1', '-1', '3', '-1', '1', '2', '1', '3', '7', '9', '-1', '2', '17', '16', '19', '21');
INSERT INTO `ssc_e` VALUES ('273', '272', '2', '6', '9', '10', '1', '4', '5', '18', '37', '-1', '-1', '1', '-1', '1', '4', '-1', '-1', '1', '4', '-1', '2', '3', '2', '4', '8', '10', '1', '-1', '18', '17', '20', '22');
INSERT INTO `ssc_e` VALUES ('274', '273', '3', '7', '10', '11', '2', '5', '6', '19', '38', '-1', '-1', '2', '-1', '2', '5', '-1', '-1', '2', '5', '1', '-1', '4', '-1', '5', '9', '11', '2', '1', '19', '18', '21', '23');
INSERT INTO `ssc_e` VALUES ('275', '274', '4', '8', '11', '12', '3', '6', '7', '-1', '39', '1', '-1', '3', '-1', '3', '-1', '1', '1', '-1', '6', '2', '1', '-1', '1', '6', '-1', '12', '3', '2', '20', '19', '22', '24');
INSERT INTO `ssc_e` VALUES ('276', '275', '5', '9', '12', '13', '-1', '7', '8', '1', '40', '2', '1', '-1', '1', '-1', '1', '-1', '2', '-1', '7', '3', '2', '-1', '2', '7', '1', '-1', '4', '3', '21', '20', '23', '25');
INSERT INTO `ssc_e` VALUES ('277', '276', '6', '10', '13', '14', '1', '8', '9', '-1', '41', '3', '-1', '1', '-1', '1', '-1', '1', '3', '-1', '8', '-1', '3', '1', '3', '8', '2', '-1', '5', '4', '22', '21', '24', '26');
INSERT INTO `ssc_e` VALUES ('278', '277', '7', '11', '14', '15', '2', '9', '10', '1', '-1', '4', '-1', '2', '1', '-1', '1', '-1', '4', '1', '-1', '-1', '4', '2', '4', '-1', '3', '1', '6', '5', '23', '22', '25', '27');
INSERT INTO `ssc_e` VALUES ('279', '278', '8', '12', '15', '16', '3', '10', '11', '2', '1', '-1', '-1', '3', '-1', '1', '2', '-1', '-1', '2', '1', '-1', '5', '3', '5', '-1', '4', '2', '7', '6', '24', '23', '26', '28');
INSERT INTO `ssc_e` VALUES ('280', '279', '-1', '13', '16', '17', '4', '11', '12', '3', '2', '1', '1', '-1', '1', '-1', '3', '-1', '-1', '3', '2', '1', '6', '-1', '6', '1', '5', '3', '8', '7', '25', '24', '27', '-1');
INSERT INTO `ssc_e` VALUES ('281', '280', '1', '14', '17', '18', '5', '12', '13', '4', '3', '-1', '-1', '1', '-1', '1', '4', '-1', '-1', '4', '3', '-1', '7', '1', '7', '2', '6', '4', '9', '8', '26', '25', '28', '-1');
INSERT INTO `ssc_e` VALUES ('282', '281', '2', '15', '18', '19', '-1', '13', '14', '5', '4', '1', '1', '-1', '1', '-1', '5', '-1', '1', '-1', '4', '1', '8', '-1', '8', '3', '7', '5', '10', '-1', '27', '26', '29', '1');
INSERT INTO `ssc_e` VALUES ('283', '282', '3', '-1', '19', '20', '1', '14', '15', '6', '5', '2', '2', '-1', '-1', '1', '-1', '1', '2', '-1', '5', '2', '9', '-1', '9', '4', '8', '-1', '11', '1', '28', '27', '30', '2');
INSERT INTO `ssc_e` VALUES ('284', '283', '4', '1', '20', '21', '-1', '15', '16', '7', '6', '3', '3', '-1', '1', '-1', '1', '-1', '3', '-1', '6', '-1', '10', '1', '10', '5', '9', '-1', '12', '2', '29', '28', '31', '3');
INSERT INTO `ssc_e` VALUES ('285', '284', '5', '2', '21', '-1', '1', '16', '17', '8', '7', '4', '4', '-1', '-1', '1', '-1', '1', '-1', '1', '7', '1', '11', '-1', '11', '-1', '10', '1', '13', '3', '30', '29', '32', '4');
INSERT INTO `ssc_e` VALUES ('286', '285', '6', '3', '22', '1', '-1', '17', '18', '9', '8', '5', '5', '-1', '1', '-1', '1', '-1', '1', '-1', '8', '-1', '12', '1', '12', '-1', '11', '2', '14', '4', '31', '30', '33', '5');
INSERT INTO `ssc_e` VALUES ('287', '286', '7', '4', '23', '-1', '1', '18', '19', '10', '9', '6', '6', '-1', '-1', '1', '-1', '1', '-1', '1', '9', '1', '13', '-1', '13', '-1', '12', '3', '15', '5', '32', '31', '34', '6');
INSERT INTO `ssc_e` VALUES ('288', '287', '8', '5', '24', '-1', '2', '19', '20', '11', '10', '7', '7', '-1', '-1', '2', '-1', '2', '-1', '2', '10', '2', '-1', '1', '-1', '1', '13', '4', '16', '6', '33', '32', '35', '7');
INSERT INTO `ssc_e` VALUES ('289', '288', '9', '6', '25', '1', '3', '20', '21', '-1', '11', '8', '-1', '1', '-1', '3', '-1', '3', '1', '-1', '11', '-1', '1', '2', '1', '2', '14', '5', '-1', '7', '34', '33', '36', '8');
INSERT INTO `ssc_e` VALUES ('290', '289', '10', '7', '26', '2', '4', '21', '22', '1', '12', '-1', '-1', '2', '-1', '4', '1', '-1', '-1', '1', '12', '-1', '2', '3', '2', '3', '-1', '6', '1', '8', '35', '34', '37', '9');
INSERT INTO `ssc_e` VALUES ('291', '290', '11', '8', '-1', '3', '5', '22', '23', '2', '13', '1', '1', '-1', '1', '-1', '-1', '1', '1', '2', '-1', '1', '3', '-1', '3', '4', '1', '7', '2', '9', '36', '-1', '38', '10');
INSERT INTO `ssc_e` VALUES ('292', '291', '12', '9', '1', '4', '6', '23', '24', '3', '-1', '2', '-1', '1', '2', '-1', '1', '-1', '2', '3', '-1', '-1', '4', '1', '4', '5', '2', '8', '3', '10', '-1', '1', '39', '11');
INSERT INTO `ssc_e` VALUES ('293', '292', '-1', '10', '2', '5', '7', '24', '25', '4', '1', '3', '1', '-1', '3', '-1', '2', '-1', '-1', '4', '1', '1', '5', '-1', '5', '6', '3', '9', '4', '11', '1', '2', '-1', '12');
INSERT INTO `ssc_e` VALUES ('294', '293', '1', '11', '3', '-1', '8', '25', '26', '5', '2', '4', '2', '-1', '-1', '1', '-1', '1', '-1', '5', '2', '-1', '6', '1', '6', '7', '4', '-1', '5', '12', '2', '3', '1', '13');
INSERT INTO `ssc_e` VALUES ('295', '294', '2', '12', '4', '1', '-1', '26', '27', '6', '3', '5', '3', '-1', '1', '-1', '1', '-1', '1', '-1', '3', '-1', '7', '2', '7', '-1', '5', '1', '6', '13', '3', '4', '2', '14');
INSERT INTO `ssc_e` VALUES ('296', '295', '3', '13', '5', '2', '1', '27', '28', '7', '4', '-1', '-1', '1', '-1', '1', '2', '-1', '-1', '1', '4', '-1', '8', '3', '8', '1', '6', '2', '7', '-1', '4', '5', '3', '15');
INSERT INTO `ssc_e` VALUES ('297', '296', '4', '14', '6', '3', '2', '28', '29', '8', '-1', '1', '-1', '2', '1', '-1', '3', '-1', '1', '2', '-1', '1', '9', '-1', '9', '-1', '7', '3', '8', '1', '5', '6', '4', '16');
INSERT INTO `ssc_e` VALUES ('298', '297', '5', '15', '7', '4', '3', '29', '-1', '9', '1', '2', '-1', '3', '2', '-1', '4', '-1', '-1', '3', '1', '2', '10', '-1', '10', '1', '-1', '4', '9', '2', '6', '7', '5', '17');
INSERT INTO `ssc_e` VALUES ('299', '298', '6', '16', '8', '5', '4', '30', '1', '10', '2', '-1', '-1', '4', '-1', '1', '5', '-1', '-1', '4', '2', '-1', '11', '1', '11', '2', '1', '-1', '10', '3', '7', '8', '6', '18');
INSERT INTO `ssc_e` VALUES ('300', '299', '7', '17', '9', '6', '5', '31', '2', '11', '3', '-1', '-1', '5', '-1', '2', '6', '-1', '-1', '5', '3', '1', '-1', '2', '-1', '3', '2', '1', '11', '4', '8', '9', '7', '19');
INSERT INTO `ssc_e` VALUES ('301', '300', '8', '-1', '10', '7', '6', '32', '3', '12', '4', '1', '1', '-1', '-1', '3', '-1', '1', '1', '-1', '4', '2', '1', '-1', '1', '4', '3', '2', '12', '5', '9', '10', '-1', '20');
INSERT INTO `ssc_e` VALUES ('302', '301', '9', '1', '11', '8', '7', '33', '4', '13', '5', '-1', '-1', '1', '-1', '4', '1', '-1', '-1', '1', '5', '-1', '2', '1', '2', '5', '4', '3', '13', '6', '10', '11', '-1', '21');
INSERT INTO `ssc_e` VALUES ('303', '302', '10', '-1', '12', '9', '8', '34', '5', '14', '6', '1', '1', '-1', '-1', '5', '-1', '1', '1', '-1', '6', '1', '3', '-1', '3', '6', '5', '4', '14', '7', '11', '12', '-1', '22');
INSERT INTO `ssc_e` VALUES ('304', '303', '11', '1', '13', '10', '9', '35', '6', '15', '-1', '2', '-1', '1', '1', '-1', '1', '-1', '2', '1', '-1', '-1', '4', '1', '4', '7', '6', '5', '15', '8', '12', '-1', '1', '23');
INSERT INTO `ssc_e` VALUES ('305', '304', '12', '2', '14', '11', '10', '-1', '7', '16', '1', '3', '-1', '2', '-1', '1', '-1', '1', '3', '2', '-1', '1', '5', '-1', '5', '8', '7', '-1', '16', '9', '13', '1', '2', '24');
INSERT INTO `ssc_e` VALUES ('306', '305', '13', '3', '15', '-1', '11', '1', '8', '17', '2', '4', '1', '-1', '-1', '2', '-1', '2', '-1', '3', '1', '2', '6', '-1', '6', '9', '-1', '1', '17', '10', '14', '2', '3', '25');
INSERT INTO `ssc_e` VALUES ('307', '306', '14', '4', '16', '1', '12', '2', '9', '18', '-1', '5', '-1', '1', '1', '-1', '1', '-1', '1', '4', '-1', '-1', '7', '1', '7', '10', '1', '2', '18', '-1', '15', '3', '4', '26');
INSERT INTO `ssc_e` VALUES ('308', '307', '-1', '5', '17', '2', '13', '3', '10', '19', '1', '6', '1', '-1', '2', '-1', '2', '-1', '-1', '5', '1', '1', '8', '-1', '8', '11', '2', '3', '19', '1', '16', '4', '-1', '27');
INSERT INTO `ssc_e` VALUES ('309', '308', '1', '6', '-1', '3', '14', '4', '11', '20', '2', '7', '2', '-1', '3', '-1', '-1', '1', '1', '6', '-1', '-1', '9', '1', '9', '12', '-1', '4', '20', '2', '17', '5', '1', '28');
INSERT INTO `ssc_e` VALUES ('310', '309', '2', '7', '1', '4', '15', '5', '12', '21', '-1', '8', '-1', '1', '4', '-1', '1', '-1', '2', '7', '-1', '-1', '10', '2', '10', '13', '1', '5', '21', '3', '-1', '6', '2', '29');

-- ----------------------------
-- Table structure for `takeorder`
-- ----------------------------
DROP TABLE IF EXISTS `takeorder`;
CREATE TABLE `takeorder` (
  `id` int(11) NOT NULL auto_increment,
  `memid` int(11) default NULL,
  `money` int(11) default NULL,
  `bank` varchar(100) default NULL,
  `bankpos` varchar(200) default NULL,
  `card` varchar(40) default NULL,
  `truename` varchar(10) default NULL,
  `state` int(11) default NULL COMMENT '0：等待审核，1：已打款，2：无效',
  `ts` datetime default NULL,
  `fromcard` varchar(30) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of takeorder
-- ----------------------------
INSERT INTO `takeorder` VALUES ('1', '3', null, 'werwe', '北京市北京辖县延庆县XX街XX支行', '123123123123123', 'asdf', '0', '2016-08-25 00:40:47', null);
INSERT INTO `takeorder` VALUES ('2', '3', '200', 'werwe', '北京市北京辖县延庆县XX街XX支行', '123123123123123', 'asdf', '0', '2016-08-25 00:47:55', null);
INSERT INTO `takeorder` VALUES ('3', '3', '50000', 'werwe', '北京市北京辖县延庆县XX街XX支行', '123123123123123', 'asdf', '0', '2016-08-28 15:53:15', null);

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL auto_increment,
  `user_extend_id` bigint(20) default NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `teacher_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `user_extend_id` (`user_extend_id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_extend_id`) REFERENCES `user_extends` (`id`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `t_teachers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1', null);

-- ----------------------------
-- Table structure for `user_extends`
-- ----------------------------
DROP TABLE IF EXISTS `user_extends`;
CREATE TABLE `user_extends` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `age` int(11) default NULL,
  `sex` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `mtel` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_extends
-- ----------------------------
INSERT INTO `user_extends` VALUES ('1', '管理员', '26', '男', '111', '112');
