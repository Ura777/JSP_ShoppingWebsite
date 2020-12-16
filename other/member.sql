/*
Navicat MySQL Data Transfer

Source Server         : jsp
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : mydatabase

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2016-01-03 00:38:35
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `account` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `level` varchar(10) DEFAULT '一般',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO member VALUES ('1', 'GM', 'dllm1020GM', 'dick30', '0800000000', '桃園巿觀音區武威里99鄰66-66號', 's999999@test.com.tw', 'GM');
INSERT INTO member VALUES ('2', '測試人員1', 'test01', '1234', '0911111111', '桃園市中壢區不告訴你', 'test@test.com', '碧池');
INSERT INTO member VALUES ('3', '測試人員2', 'test02', '5678', '0922222222', '桃園市平鎮區不告訴你', 'test02@test.com', '一般');
