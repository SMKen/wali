--all table and column will be uppercase
-- 数据库: `app_smken`
-- 表的结构 `WALI_NOTES`
CREATE TABLE IF NOT EXISTS `WALI_NOTES` (
  `UID` VARCHAR(32) NOT NULL,
  `ADMIN` VARCHAR(32) DEFAULT NULL,
  `LV` INT(11) DEFAULT 10,
  `CLASSES` INT(11) DEFAULT 1,
  `STATUS` INT(11) DEFAULT 1,
  `CATEGORYS` VARCHAR(64) DEFAULT NULL,
  `CREATETIME` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DIARYDAY` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DIARY` TEXT,
  `MOOD` VARCHAR(64) DEFAULT NULL,
  `OUTLINE` VARCHAR(64) DEFAULT NULL,
  `UPDATETIME` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `VIEWTIMES` INT(11) DEFAULT NULL,
  `WEATHER` VARCHAR(32) DEFAULT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=MYISAM DEFAULT CHARSET=UTF8;

-- 转存表中的数据 `WALI_NOTES`
INSERT INTO `WALI_NOTES` (`UID`, `ADMIN`, `CATEGORYS`, `CREATETIME`, `DIARYDAY`, `LV`, `DIARY`, `MOOD`, `OUTLINE`, `UPDATETIME`, `VIEWTIMES`, `WEATHER`) VALUES
('288651ec4f25436cb83f49b817e15cf0', 'Ken', 'Easy，SM', '2014-11-03 11:35:21', '2014-06-13 00:00:00', 10, '才思敏捷。\r\n既不喜欢“思”，那诗情画意的“诗”也不错吧。\r\n不喜欢与人攀比的字，只希望个人能够开心、幸福。', '欣喜', '才思敏捷 Easy', '2014-11-03 11:35:21', 0, '睛'),
('da68125b26f34b2cb7e80b390c4b78e4', 'Ken', '新版本', '2014-11-04 12:24:11', '2014-11-04 00:00:00', 10, '发布不止10次，从大小写，到日志，到主从数据库，到编码，再到一些逻辑调整，问题太多了，还好，目前基本稳定。Cheers  . ', '好', '新版本发布', '2014-11-04 12:24:11', 1, '睛'),
('0c86b7103286415dbe092c9eb25b0c35', 'Ken', '寒冬', '2014-11-04 23:39:50', '2014-11-04 00:00:00', 10, '去年底，今年中，今天。寒冬真的到来了。\r\n"水则资车，旱则资舟，以待乏也"。\r\n长期愿景和短期执行计划都必不可缺。', '一般', '寒冬到来', '2014-11-04 23:39:50', 1, '晴'),
('b9f00861b2eb42f98d5eadde7b818df0', 'Ken', '新版本', '2014-11-05 15:27:19', '2014-11-05 00:00:00', 10, '再添加一个mall页面UI及简单介绍，同时Fix 标签BUG。', '一般', '新版本发布V6', '2014-11-05 15:27:19', 1, '小雨转阴'),
('0ad69f06ebb54d96bf9dda04da6f505c', 'Ken', '忧伤，阴雨，工作，思考', '2014-11-07 00:13:16', '2014-11-05 00:00:00', 10, '个人的发展与成就是与集体的命运连在一起的，正所谓：天下兴亡，匹夫有责。\r\n曲终人散，大家一起时多少会有一些忧伤，曾经的汗水，曾经的虐待，曾经的欢笑，曾经的抱怨，曾经的激情，曾经的迷惘，曾经的曾经已经不存在了，只剩下一抹淡淡的忧伤。曾经其乐融融的小团队马上就各奔东西了。\r\n今天的天气就是我们的心情，绵延不断地阴雨，掩不住的忧伤。本准备一起吃午饭，却被这雨搅散，很没意思。下午刚才一会雨还转了晴，我还高兴地说了句“风雨之后见阳光”，现在却又成了阴天，像雾霾一样的阴天让我感觉不到一种上进，刚才还有的一点激情又被窗外逝去的阳光带走了。\r\n我不喜欢这种天气，我喜欢晴天，我喜欢风雨后的明亮的阳光和蔚蓝的天空，感觉那时什么都是亮堂的，让人精神焕发，重新燃起激情。', '忧伤', '忧伤的阴雨天', '2014-11-07 00:13:16', 1, '雨转阴'),
('62130a9da2134a2596c8021f7e1bc539', 'Ken', '生活', '2014-11-05 21:41:02', '2014-11-05 00:00:00', 10, '我感觉我比较缺，上个月还比较好。也可能是遗传，或小时候听信了睡前要"三省吾身"后养成的“不良习惯”吧。睡商也要养成或培养。', '一般', '睡商', '2014-11-05 21:41:02', 1, '雨转阴'),
('74d3088a0990442e93ff291d0f9145b9', 'Ken', '工作，散伙', '2014-11-06 23:24:29', '2014-11-06 00:00:00', 10, '虽然中午BOSS请吃了一次。下午经提议一起拍张留恋照片后，晚上，我们坑了Welkin请大家喝酒。气氛不那么热烈，但也不伤感，大家已经坦然了，很快话题都散开到家事、国事了，第三、四次经历这样的事，我也习惯了。离开的、留下的、机动的三拔人，希望以后都万事如意、一帆风顺。\r\n有机会还是希望大家能再走到一起，还能够继续这个事业。', '一般', '散伙饭', '2014-11-06 23:24:29', 1, '晴'),
('4fe8955126354af384ebad686e66579d', 'Ken', '散伙，羽毛球', '2014-11-06 23:34:10', '2014-11-06 00:00:00', 10, '晚上，有人请大家打球，也好久没打球了，大家还是欣然前往。\r\n与以往不同的是，没有了王的淡定、夏的认真、涂的秀气，只有许的积极、陈的粘网、李的发球，虽然我们没有什么精湛的技术，但是大家一起，锻炼了身体，放松了心情，最关键的是，这也许是最后一次这么愉快地打球了。过了今天，以后只能改打乒乓了，呵呵。珍惜。', '开心', '最后一次愉快的羽毛球？', '2014-11-06 23:34:10', 1, '晴');

-- 表的结构 `WALI_NOTES_ADMIN`
CREATE TABLE IF NOT EXISTS `WALI_NOTES_ADMIN` (
  `UID` VARCHAR(32) NOT NULL,
  `CREATETIME` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DIARYCOUNT` INT(11) DEFAULT NULL,
  `LV` INT(11) DEFAULT 5,
  `EMAIL` VARCHAR(64) DEFAULT NULL,
  `IMGS` VARCHAR(64) DEFAULT NULL,
  `LASTLOGINTIME` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LOGINTIMES` INT(11) DEFAULT NULL,
  `LOGO` VARCHAR(64) DEFAULT NULL,
  `NAME` VARCHAR(32) DEFAULT NULL,
  `PWD` VARCHAR(64) DEFAULT NULL,
  `UPDATETIME` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`UID`)
) ENGINE=MYISAM DEFAULT CHARSET=UTF8;

-- 转存表中的数据 `WALI_NOTES_ADMIN`
INSERT INTO `WALI_NOTES_ADMIN` (`UID`,`LV`, `CREATETIME`, `DIARYCOUNT`, `EMAIL`, `IMGS`, `LASTLOGINTIME`, `LOGINTIMES`, `LOGO`, `NAME`, `PWD`, `UPDATETIME`) VALUES
('Ken',1, '2014-11-03 11:49:14', 1, 'zh_chao@126.com', NULL, '2014-11-03 11:49:14', 1, 'Ken', 'Ken', '1234', '2014-11-03 11:49:14'),
('admin',5, '2014-11-09 19:37:14', 1, 'admin@zhengchao.net.cn', NULL, '2014-11-09 19:49:14', 1, 'admin', 'admin', '1234', '2014-11-09 19:49:14');

 