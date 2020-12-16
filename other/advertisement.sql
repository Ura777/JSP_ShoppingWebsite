/*
Navicat MySQL Data Transfer

Source Server         : jsp
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : mydatabase

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2016-01-14 21:00:51
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `advertisement`
-- ----------------------------
DROP TABLE IF EXISTS `advertisement`;
CREATE TABLE `advertisement` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `imagepath` varchar(50) NOT NULL,
  `link` text,
  `alternate` text,
  `adcontent` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of advertisement
-- ----------------------------
INSERT INTO advertisement VALUES ('1', 'image\\advertisement', 'https://zh.wikipedia.org/wiki/%E5%B0%8F%E9%AD%94%E5%A5%B3DoReMi%E8%A7%92%E8%89%B2%E5%88%97%E8%A1%A8', 'wikidoremi', 'wikidoremi');
INSERT INTO advertisement VALUES ('2', 'image\\advertisement', 'http://www.ikea.com/tw/zh/', 'ikea', 'ikea');
INSERT INTO advertisement VALUES ('3', 'image\\advertisement', 'http://www.cw.com.tw/article/article.action?id=5012852', '大學生要做的11件事', '大學生要做的11件事');
INSERT INTO advertisement VALUES ('4', 'image\\advertisement', 'https://www.youtube.com/watch?v=JfAouMxGAqE', '原力覺醒', '原力覺醒');
INSERT INTO advertisement VALUES ('5', 'image\\advertisement', 'http://a24250308.blogspot.tw/2014/10/blog-post_77.html', '魯蛇金句', '魯蛇金句');
INSERT INTO advertisement VALUES ('6', 'image\\advertisement', 'http://www.xn--6u4ap5k.tw/081229_01/xx011.html', '金興金紙廠', '金興金紙廠');
INSERT INTO advertisement VALUES ('7', 'image\\advertisement', 'http://tw1003x.tw.tranews.com/', '台北主題咖啡館', '台北主題咖啡館');
INSERT INTO advertisement VALUES ('8', 'image\\advertisement', 'https://www.iread.com.tw', '灰熊愛讀書', '灰熊愛讀書');
INSERT INTO advertisement VALUES ('9', 'image\\advertisement', 'https://yanderedev.wordpress.com', '病嬌模擬器', '病嬌模擬器');
INSERT INTO advertisement VALUES ('10', 'image\\advertisement', 'http://24h.pchome.com.tw/store/DGAD5L', 'pchome', 'pchome');
INSERT INTO advertisement VALUES ('11', 'image\\advertisement', 'http://sleepwalklife.pixnet.net/blog/post/393055079-make-up%EF%BD%9C%E7%A7%8B%E5%86%AC%E9%9F%93%E7%B3%BB%E6%B8%85%E6%96%B0%E8%A3%B8%E5%A6%9D%E7%95%AB%E6%B3%95%EF%BC%9A%E7%AB%8B%E5%88%BB%E5%8C%96%E8%BA%AB%E9%9F%93', '韓妝教學', '韓妝教學');
INSERT INTO advertisement VALUES ('12', 'image\\advertisement', 'http://news.gamme.com.tw/tag/%E6%B7%B7%E8%A1%80%E7%BE%8E%E5%A5%B3', 'news', 'news');
