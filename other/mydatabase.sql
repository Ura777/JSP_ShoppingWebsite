/*
Navicat MySQL Data Transfer

Source Server         : jsp
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : mydatabase

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2016-01-10 15:18:28
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
INSERT INTO advertisement VALUES ('1', 'image\\advertisement', 'https://tw.yahoo.com', 'yahoo', 'yahoo');
INSERT INTO advertisement VALUES ('2', 'image\\advertisement', 'https://www.google.com.tw', 'google', 'google');
INSERT INTO advertisement VALUES ('3', 'image\\advertisement', 'http://shopping.pchome.com.tw', 'pchome', 'pchome');
INSERT INTO advertisement VALUES ('4', 'image\\advertisement', 'http://www.ruten.com.tw', '露天', '露天');
INSERT INTO advertisement VALUES ('5', 'image\\advertisement', 'http://www.8591.com.tw', '8591', '8591');
INSERT INTO advertisement VALUES ('6', 'image\\advertisement', 'http://www.kingstone.com.tw', '金石堂', '金石堂');
INSERT INTO advertisement VALUES ('7', 'image\\advertisement', 'http://www.books.com.tw', '柏克萊', '柏克萊');
INSERT INTO advertisement VALUES ('8', 'image\\advertisement', 'https://www.iread.com.tw', '灰熊愛讀書', '灰熊愛讀書');
INSERT INTO advertisement VALUES ('9', 'image\\advertisement', 'https://yanderedev.wordpress.com', '病嬌模擬器', '病嬌模擬器');
INSERT INTO advertisement VALUES ('10', 'image\\advertisement', 'http://lol.garena.tw', 'LOL', 'LOL');
INSERT INTO advertisement VALUES ('11', 'image\\advertisement', 'http://www.pixiv.net', 'Pixiv', 'Pixiv');
INSERT INTO advertisement VALUES ('12', 'image\\advertisement', 'http://www123.eyny.com', '伊莉', '伊莉');

-- ----------------------------
-- Table structure for `counter`
-- ----------------------------
DROP TABLE IF EXISTS `counter`;
CREATE TABLE `counter` (
  `count` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of counter
-- ----------------------------
INSERT INTO counter VALUES ('12');

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

-- ----------------------------
-- Table structure for `login`
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `account` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO login VALUES ('dllm1020GM', 'dick30');
INSERT INTO login VALUES ('test01', '1234');
INSERT INTO login VALUES ('test02', '5678');

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
  `discount` varchar(10) DEFAULT '9折',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO member VALUES ('1', 'GM', 'dllm1020GM', 'dick30', '0800000000', '桃園巿觀音區武威里99鄰66-66號', 's999999@test.com.tw', 'GM', '5折');
INSERT INTO member VALUES ('2', '測試人員1', 'test01', '1234', '0911111111', '桃園市中壢區不告訴你', 'test@test.com', '碧池', '8折');
INSERT INTO member VALUES ('3', '測試人員2', 'test02', '5678', '0922222222', '桃園市平鎮區不告訴你', 'test02@test.com', '一般', '9折');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(10) NOT NULL,
  `introduce01` varchar(500) DEFAULT '',
  `introduce02` varchar(500) DEFAULT '',
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `imagepath` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO product VALUES ('1', '自慰套飛機杯日本GENMU二代 PINKY 少女情懷 新素材 柔嫩加強版 吸吮真妙杯-橙色 ', '飛機杯', '商品尺寸：15.8cm<br>商品重量：218g<br>商品材質：矽膠<br>商品顏色：橙色', '模擬少女逐漸成熟的身體，猶如一顆未熟透的果實，羞澀之中又對男子漢的占有充滿好奇，她期待你在她充滿緊度的身體上盡情釋放男性本能。<br>膠體清新無臭，柔軟材質構造，內部觸感更加逼真。<br>壓力均衡系統，無論玉柱大小，都緊緻如初。<br>可反覆水洗，永保初次質感。', '480', '100', 'image\\product');
INSERT INTO product VALUES ('2', '日本TH 二代 肉襲亂舞 R-20 2nd 子宮快感 自慰器', '飛機杯', '商品尺寸：長約13.5cm*7.4cm<br>商品重量：380g<br>商品材質：高級矽膠<br>商品顏色：膚色', '大幅降低抽插時的阻力，粉嫩微子宮設計。<br>真實猥褻的加工內壁，特殊凹槽設計享受破處快感。<br>快吸入的快感噴發升天，獨特的厚度絕佳肉感包覆。<br>此自慰孔使用了安全安心物料。<br>滑順手感可長期使用，絕佳的耐久度，讓你遠離刺鼻臭味。<br>沐浴乳清洗也OK喔。', '850', '100', 'image\\product');
INSERT INTO product VALUES ('3', '潮吹戰神 虛擬膚質 擬真吸盤式老二棒', '陽具', '商品尺寸：約155mm*40mm<br>商品材質：高級矽膠<br>商品顏色：膚色', '高級矽膠製造。<br>形逼真設計精巧 ，如真人勃起時的狀態。<br>棒身精細的雕塑出實體老二的造型。<br>超粗猛堅固的陽具，表面還有鼓起的血管。<br>吸附(盤)式設計，可任意固定於光滑面，如地板或牆面上，使妳的性愛有更多的選擇。<br>可用於夫妻調情，女性自慰，刺激敏感區域，提高性生活質量的目的。逼真刺激，防滑的表面處理，增加性感部位磨擦，能對女性敏感部位造成強烈刺激。', '280', '100', 'image\\product');
INSERT INTO product VALUES ('4', '根之欲 地獄超屌 360度旋轉 10段變頻 逼真老二仿真棒 帝王魔根6', '陽具', '商品材質：矽膠 +電子零件<br>商品尺寸：寬4cm x 長 20cm<br>使用電源：4號電池x3<br>商品顏色：膚', '搖擺快感，玩法多變。<br>仿真肌膚，軟硬適中。<br>十段變頻，外柔內鋼。底盤吸附，隨處想樂。<br>使用TPR材質，安全放心。<br>耐久性佳，不變色。<br>觸感柔軟逼真，不會有異味。', '660', '100', 'image\\product');
INSERT INTO product VALUES ('5', 'Durex杜蕾斯 螺紋型保險套 12入', '套套', '型號：ribbed<br>材質：由天然橡膠製成，含有潤滑劑及儲精袋設計<br>規格：12枚/盒<br>尺寸：闊度約52mm<br>外盒尺寸：6.4ｘ12.5ｘ3.7cm<br>藥商：利潔時股份有限公司<br>藥商地址 ：台北市松山區敦化北路150號11樓<br>製造商：SSL International plc.<br>製造廠址：SSL Manufacturing(Thailand)Ltd, Wellgrow Industrial Estate, 100 Moo 5 Bangsamak, Bangpakong, Chachoengsao 24180, THAILAND<br>製造日期：2013年08月<br>保存期限：2018年07月<br>檢內登字號：檢內登字第34505號<br>許可證字號：衛署醫器輸字第010429號', '無。', '250', '100', 'image\\product');
INSERT INTO product VALUES ('6', 'Okamoto岡本 003 極薄白金 PLATINUM 10入', '套套', '材質：天然乳膠、潤滑劑<br>規格：10片裝/盒<br>尺寸：口徑52±2mm<br>外盒尺寸：12ｘ6ｘ3.4cm<br>藥商：傳悅國際有限公司<br>藥商地址 ：台北市中山區中山北路二段31號7F<br>藥商諮詢專線：（04)2215-5924<br>製造商：Okamoto Industries Inc.-Ibaraki P<br>製造廠址：1 Nishiyama, Itabashi-Cho Ryugasaki, Ibaraki-Pref., Japan<br>製造日期：2014年06月<br>保存期限：2019年05月<br>檢內登字號：檢內登字第34381號<br>許可證字號：衛署醫器輸字第017656號', '比超薄更薄，零阻隔觸感。<br>傳熱度更高，體溫傳導性更佳。<br>上套更快速，易翻捲特殊設計，使用更順暢。', '395', '100', 'image\\product');
INSERT INTO product VALUES ('7', '肛門後庭塞-妖狐的誘惑', '後庭', '商品材質：軟膠肛塞 + 人造狐狸毛<br>商品尺寸：狐狸尾巴:長約360mm ;後庭塞:107mm*35mm<br>商品顏色：黑色', '狐狸尾巴的變身cosplay用具就是這麼神秘，插上肛門塞就變成狐美人。<br>給愛人插上，盡顯狐狸的野性！<br>即使走動的過程中也不會掉下，更不用說對此尾巴拉拉扯扯過程中帶來的快感和樂趣！<br>快快行動！可以變化的可愛狐狸就是你！', '550', '100', 'image\\product');
INSERT INTO product VALUES ('8', '愉悅後庭拉珠棒-入門', '後庭', '商品材質：天然矽膠<br>商品尺寸：長約15.3cm*最大寬度約2cm<br>商品顏色：粉紅色', '七重刺激，輕鬆進入。<br>防水，防霉，防脫落。<br>無毒無害，可反覆使用。<br>造型優美，自由擺動。<br>清新無意味，安心使用。<br>使用後沖洗，可反覆使用。', '200', '100', 'image\\product');
INSERT INTO product VALUES ('9', '日本進口品牌水性300ml', '潤滑液', '商品產地：日本<br>內容量：300 ml', '中性質料最符合人體皮膚及陰道內部環境，與情趣玩具或和情人一同使用都非常適合。<br>也可使用於按摩或者其他用途，滑順好清洗的質感絕對讓您愛不釋手。<br>果凍狀的黏稠度，劑量好控制不會流的到處都是。<br>超潤滑質感不易乾，水性好清洗，使用自慰器或愛愛及後庭讓你超滑超順暢。<br>水溶性質料、使用後只要用水沖洗並搓揉幾下就能夠讓私密的肌膚與雙手乾淨舒爽。<br>成份天然，安心使用。', '150', '100', 'image\\product');
INSERT INTO product VALUES ('10', '杜蕾斯Durex杜蕾斯熱感潤滑液', '潤滑液', '商品容量：50ml', '世界知名品牌DUREX，50ml精裝超值版。\r<br>最受玩家歡迎的必備款，隨性所致，在每個調情時刻散發魔力。', '175', '100', 'image\\product');

-- ----------------------------
-- Table structure for `temptrade`
-- ----------------------------
DROP TABLE IF EXISTS `temptrade`;
CREATE TABLE `temptrade` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `productName` varchar(100) NOT NULL,
  `productID` int(10) NOT NULL,
  `productType` varchar(10) NOT NULL,
  `productPrice` int(10) NOT NULL,
  `productQuantity` int(10) NOT NULL,
  `memberAccount` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of temptrade
-- ----------------------------
INSERT INTO temptrade VALUES ('4', '根之欲 地獄超屌 360度旋轉 10段變頻 逼真老二仿真棒 帝王魔根6', '4', '陽具', '660', '1', 'dllm1020GM');
INSERT INTO temptrade VALUES ('5', '愉悅後庭拉珠棒-入門', '8', '後庭', '200', '1', 'dllm1020GM');

-- ----------------------------
-- Table structure for `trademember`
-- ----------------------------
DROP TABLE IF EXISTS `trademember`;
CREATE TABLE `trademember` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberName` varchar(20) NOT NULL,
  `memberAccount` varchar(50) NOT NULL,
  `tradeWay` varchar(50) NOT NULL,
  `memberPhone` varchar(20) NOT NULL,
  `memberAddress` varchar(50) NOT NULL,
  `memberLevel` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trademember
-- ----------------------------
INSERT INTO trademember VALUES ('1', '測試人員1', 'test01', '一律皆為宅配到府', '0911111111', '桃園市中壢區不告訴你', '碧池');

-- ----------------------------
-- Table structure for `tradeproduct`
-- ----------------------------
DROP TABLE IF EXISTS `tradeproduct`;
CREATE TABLE `tradeproduct` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `prdouctName` varchar(100) NOT NULL,
  `productID` int(10) NOT NULL,
  `productType` varchar(10) NOT NULL,
  `productPrice` int(10) NOT NULL,
  `productQuantity` int(10) NOT NULL,
  `total` int(30) DEFAULT NULL,
  `memberAccount` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tradeproduct
-- ----------------------------
INSERT INTO tradeproduct VALUES ('1', '自慰套飛機杯日本GENMU二代 PINKY 少女情懷 新素材 柔嫩加強版 吸吮真妙杯-橙色 ', '1', '飛機杯', '480', '5', '0', 'test01');
INSERT INTO tradeproduct VALUES ('2', '根之欲 地獄超屌 360度旋轉 10段變頻 逼真老二仿真棒 帝王魔根6', '4', '陽具', '660', '2', '0', 'test01');
INSERT INTO tradeproduct VALUES ('3', 'Durex杜蕾斯 螺紋型保險套 12入', '5', '套套', '250', '1', '3176', 'test01');
