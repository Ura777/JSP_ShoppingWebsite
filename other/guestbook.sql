/*
Navicat MySQL Data Transfer

Source Server         : jsp
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : mydatabase

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2016-01-03 23:27:50
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `guestbook`
-- ----------------------------
DROP TABLE IF EXISTS `guestbook`;
CREATE TABLE `guestbook` (
  `no` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `mail` varchar(30) DEFAULT NULL,
  `subject` varchar(30) DEFAULT NULL,
  `content` text,
  `putdate` date DEFAULT NULL,
  `IP` text,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guestbook
-- ----------------------------
INSERT INTO guestbook VALUES ('1', 'GM', 'GM@test.com', '測試用', '測試\r<br>Testing', '2015-12-25', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('2', '222', '222', '222', '2222', '2015-12-25', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('3', '333', '333', '333', '33333', '2015-12-25', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('4', '444', '44', '44', '5dfewafewf\r<br>dfsafe6cd\r<br>ewe', '2015-12-25', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('5', 'DDDD', 'esdf', 'weew', 'seew', '2015-12-25', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('6', 'gwe', 'dfwse', 'sd', 'ggw', '2015-12-25', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('7', 'dewe', 'df', 'dde', 'ewe ewatewat\r<br>dawetwae', '2015-12-25', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('8', '測試', 'dfwewewddfw', '測試', '測試', '2015-12-25', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('9', 'eewe', 'ddfwe', 'we ', 'jytjtktuu', '2015-12-25', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('10', 'jrt', 'ktykty', 'ewrtwe', 'frherhyrt', '2015-12-25', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('11', 'eweaw', 'dsfs', 'hwhw', 'hrherjeyer', '2015-12-25', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('12', 'ewyyw', 'dahwe', 'sdw', '454687\r<br>45687', '2015-12-26', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('13', '555', '888', '99*', '*//7778888', '2015-12-26', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('14', '748787', '4678', '1454', 'awegtaw ergefwea\r<br>dfaweegwa', '2015-12-26', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('15', 'ewaeaw', 'sds', 'ee', 'sase', '2015-12-26', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('16', 'ewewsd', 'dddg', 'wegegg', 'wewaeyawty reyreyae\r<br>sdfewf4wa8awe\r<br>ewate9wa8ewe', '2015-12-26', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('17', 'GMMMM', 'GMG@test.com', 'Testing', 'OωO\r<br>O_O\r<br>OAO\r<br>QAQ\r<br>哭哭囉~呵呵~', '2015-12-26', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('18', 'GM', 'GM@test.com', '測試request.getRemoteAddr()', '如題', '2015-12-26', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('19', 'GM', 'GM@test.com', '測試SQL Insert2', '抓IP\r<br>O_O', '2015-12-26', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('20', 'GM2', 'GM2@test.com', '再度測試SQL Insert', '再抓一次IP', '2015-12-26', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('21', 'GM2', 'GM@test.com', '測試用 request', '抓IP', '2015-12-26', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('22', 'GM', 'GM@test.com', '測試一下(駁回)', '我要予以駁回~❤', '2015-12-26', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('23', 'GM2', 'GM2@test.com', '測試(駁回分行)', '我要予以\r<br>駁回~❤', '2015-12-26', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('24', '潘安', 'sdfgdfgsfs', 'suck my dick', '尻尻軍', '2016-01-03', '0:0:0:0:0:0:0:1');
