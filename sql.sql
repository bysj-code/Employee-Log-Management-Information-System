DROP TABLE IF EXISTS `slides`;
CREATE TABLE `slides` (
  `slides_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '轮播图ID：',
  `title` varchar(64) DEFAULT NULL COMMENT '标题：',
  `content` varchar(255) DEFAULT NULL COMMENT '内容：',
  `url` varchar(255) DEFAULT NULL COMMENT '链接：',
  `img` varchar(255) DEFAULT NULL COMMENT '轮播图：',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击量：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`slides_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='轮播图';
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `auth_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '授权ID：',
  `user_group` varchar(64) DEFAULT NULL COMMENT '用户组：',
  `mod_name` varchar(64) DEFAULT NULL COMMENT '模块名：',
  `table_name` varchar(64) DEFAULT NULL COMMENT '表名：',
  `page_title` varchar(255) DEFAULT NULL COMMENT '页面标题：',
  `path` varchar(255) DEFAULT NULL COMMENT '路由路径：',
  `position` varchar(32) DEFAULT NULL COMMENT '位置：',
  `mode` varchar(32) NOT NULL DEFAULT '_blank' COMMENT '跳转方式：',
  `add` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可增加：',
  `del` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可删除：',
  `set` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改：',
  `get` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可查看：',
  `field_add` text COMMENT '添加字段：',
  `field_set` text COMMENT '修改字段：',
  `field_get` text COMMENT '查询字段：',
  `table_nav_name` varchar(500) DEFAULT NULL COMMENT '跨表导航名称：',
  `table_nav` varchar(500) DEFAULT NULL COMMENT '跨表导航：',
  `option` text COMMENT '配置：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户权限管理';
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上传ID',
  `name` varchar(64) DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) DEFAULT NULL COMMENT '访问路径',
  `file` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `display` varchar(255) DEFAULT NULL COMMENT '显示顺序',
  `father_id` int(11) DEFAULT '0' COMMENT '父级ID',
  `dir` varchar(255) DEFAULT NULL COMMENT '文件夹',
  `type` varchar(32) DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`upload_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件上传';
insert into `upload` values ('1','movie.mp4','/upload/movie.mp4','',null,'0',null,'video');
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '公告id：',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题：',
  `content` longtext COMMENT '正文：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公告';
insert into `notice` values ('1','网站公告','<p>公告，是指政府、团体对重大事件当众正式公布或者公开宣告，宣布。国务院2012年4月16日发布、2012年7月1日起施行的《党政机关公文处理工作条例》，对公告的使用表述为：“适用于向国内外宣布重要事项或者法定事项”。其中包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等。</p>','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0');
insert into `notice` values ('2','关于我们','<p>       一个网站要取得成功，要有先进的理念、先进的思想，更为重要的是抢占先机，及时行动。网络世界可谓一日千里、 日新月异，一个网站只有把握先机，抓住机遇，才</p><p>可能有更多的机会获得成功，可能处于网络行业发展的致高点，可能创建出成功的网站，才能能获得成功。要知道一种网站新模式在网络上只有保持几天的优势,因为人们很容易“COPY" 和模仿，因此，唯有不</p><p>断创新，不失时机地推出新的服务、新的模式、新的思想，网站才可能长久立于不败之地。</p>','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0');
insert into `notice` values ('3','联系方式','<h3>网站内容及品牌合作</h3><p>Email：xxxx@qq.com</p><h3>商务合作</h3><p>电话：010-xxxxxxx</p><p>Email：xxxx@qq.com</p><h3><br></h3><h3><br></h3><p><br></p>','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0');
insert into `notice` values ('4','网站介绍','<p>此处可上传文字、图片、视频、超链接、表格等内容区</p>','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0');
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组ID：[0,8388607]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '名称：[0,16]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `register` smallint(1) unsigned DEFAULT '0' COMMENT '注册位置:',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户组：用于用户前端身份和鉴权';
DROP TABLE IF EXISTS `article_type`;
CREATE TABLE `article_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID：[0,10000]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]决定分类显示的先后顺序',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '分类名称：[2,16]',
  `father_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID：[0,32767]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该分类的作用',
  `icon` text COMMENT '分类图标：',
  `url` varchar(255) DEFAULT NULL COMMENT '外链地址：[0,255]如果该分类是跳转到其他网站的情况下，就在该URL上设置',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章分类';
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id：[0,8388607]',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题：[0,125]用于文章和html的title标签中',
  `type` varchar(64) NOT NULL DEFAULT '0' COMMENT '文章分类：[0,1000]用来搜索指定类型的文章',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数：[0,1000000000]访问这篇文章的人次',
  `praise_len` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source` varchar(255) DEFAULT NULL COMMENT '来源：[0,255]文章的出处',
  `url` varchar(255) DEFAULT NULL COMMENT '来源地址：[0,255]用于跳转到发布该文章的网站',
  `tag` varchar(255) DEFAULT NULL COMMENT '标签：[0,255]用于标注文章所属相关内容，多个标签用空格隔开',
  `content` longtext COMMENT '正文：文章的主体内容',
  `img` varchar(255) DEFAULT NULL COMMENT '封面图',
  `description` text COMMENT '文章描述',
  PRIMARY KEY (`article_id`,`title`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章：用于内容管理系统的文章';
DROP TABLE IF EXISTS `praise`;
CREATE TABLE `praise` (
  `praise_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '点赞状态:1为点赞，0已取消',
  PRIMARY KEY (`praise_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='点赞';
DROP TABLE IF EXISTS `access_token`;
CREATE TABLE `access_token` (
  `token_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '临时访问牌ID',
  `token` varchar(64) DEFAULT NULL COMMENT '临时访问牌',
  `info` text,
  `maxage` int(2) NOT NULL DEFAULT '2' COMMENT '最大寿命：默认2小时',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号:',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='登陆访问时长';
insert into `access_token` values ('57','5accf85cb6a7f06f0aa2968deadaec1b',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('58','46ff1d4d07714f046ba07b34bffe0af9',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('59','ed9d6cba9826fda1beafcd9326be7a86',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('60','c99763c1833ea0785d9e2b81da3fd28f',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('61','33fbfaccd6d1cb9143e4129bd919d4b0',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('62','493e13da5f293ba67a56a0fe3e1fa6cf',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('63','c4b48e9e2160db09c703041a8fee0a1f',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('64','d13cdaefd3823c360c959a02a262f71d',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('65','6c6ff426fd77ea5a2025ce5ed2e42c8a',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('66','80930065a61ffcdd5cbb75f60932973c',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('67','94114763cf2e3b020495d8a27096d4ef',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('68','761052c551c97c9317bc3aa475c85b84',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('69','7c44ef14131a0ba7c16aa16cef104065',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('70','96380f3d9542c80d04bdade1cf7635a5',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('71','bfdc7acfcbf5763fda81945b60961222',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('72','170a598e51ae8ae2badde20a42fe171d',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('73','c82c357488c75926a92d8a9608d4b367',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('74','4d35290c023f407a820f37dbbb1ceb09',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('75','8d19162776682b695c0f62f3c7a92fec',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('76','a7ea2cdc9a2be179e19200e593ad5a69',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('77','c79a554f9832adc01f19682c5d576bc4',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('78','1c7d95001fa09951a679841c8100ad1f',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('79','776da1bcdd01ddb3cbf0a37fa13fc5b0',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('80','d336e88e57c329d0166931292c1fac41',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('81','37a40f526a6c82fc6110b512802d35bf',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('82','691ad331771f4109206d58aeee572371',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('83','9942e458886219960d3344b4a6a6fbec',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('84','e9939a8b7ccf9f548f0bbb5664981f96',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('85','f5b27912060d1909bef61fab9d96faae',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('86','7c5888682f1d449eb1b62f0054a79fbf',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('87','00dfdc6ac21c4a9da80fd71c990764d1',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('88','3cce592bc72840ab932ce96d85a194da',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('89','43fdaa989a644ad683ef4b4d488e8629',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('90','d6a3cecadacff0dbd6b43b25372cc2a2',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('91','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('92','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('93','26c553bd2ee2ab6605d18dfd310d85f9',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('94','3fd52f81236ed2c37ff91a6696d4e47a',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('95','893332e9ee67d60d8312b3700c58a359',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('96','b7844068ade535b2e517df4a40948703',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('97','179b37a5e1893c3af6b946bd5a1c8625',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('98','3a47b8a040a83ebbc9194cb255dc668c',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('99','afa60196afb77dcc2b520ed13a817560',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('100','7fc6d9b324f8c0a3a1784d04ef132692',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('101','84e31b291f2bde6b7ceb27af5fe8eee3',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
DROP TABLE IF EXISTS `hits`;
CREATE TABLE `hits` (
  `hits_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`hits_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='用户点击';
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论人ID：',
  `reply_to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '回复评论ID：空为0',
  `content` longtext COMMENT '内容：',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称：',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评论';
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID：[0,8388607]用户获取其他与用户相关的数据',
  `state` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '账户状态：[0,10](1可用|2异常|3已冻结|4已注销)',
  `user_group` varchar(32) DEFAULT NULL COMMENT '所在用户组：[0,32767]决定用户身份和权限',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间：',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码：[0,11]用户的手机号码，用于找回密码时或登录时',
  `phone_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '手机认证：[0,1](0未认证|1审核中|2已认证)',
  `username` varchar(16) NOT NULL DEFAULT '' COMMENT '用户名：[0,16]用户登录时所用的账户名称',
  `nickname` varchar(16) DEFAULT '' COMMENT '昵称：[0,16]',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码：[0,32]用户登录所需的密码，由6-16位数字或英文组成',
  `email` varchar(64) DEFAULT '' COMMENT '邮箱：[0,64]用户的邮箱，用于找回密码时或登录时',
  `email_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱认证：[0,1](0未认证|1审核中|2已认证)',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户账户：用于保存用户登录信息';
insert into `user` values ('1','1','管理员','2023-03-31 18:21:49.0',null,'0','admin','admin','bfd59291e825b5f2bbf1eb76569f8fe7','','0','/api/upload/admin_avatar.jpg','2023-03-31 17:35:13.0');
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff`(staff_id int(11) NOT NULL AUTO_INCREMENT COMMENT '员工ID',
`employee_id` varchar(64) NOT NULL UNIQUE comment '员工工号',
`employee_name` varchar(64) comment '员工姓名',
`gender` varchar(64) comment '性别',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (staff_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '员工';

DROP TABLE IF EXISTS `notification_list`;
CREATE TABLE `notification_list`(notification_list_id int(11) NOT NULL AUTO_INCREMENT COMMENT '通知列表ID',
`title` varchar(64) comment '标题',
`publisher` varchar(64) comment '发布人',
`release_time` date comment '发布时间',
`content_related` varchar(64) comment '内容相关',
`content_details` text comment '内容详情',
`hits` int(11) DEFAULT 0 NOT NULL comment '点击数',
`praise_len` int(11) DEFAULT 0 NOT NULL comment '点赞数',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (notification_list_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '通知列表';
insert into `notification_list` values (1,'标题1','发布人1','2023-03-07','内容相关1','此处可上传文字、图片、视频、超链接、表格等内容区1',63,241,0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `notification_list` values (2,'标题2','发布人2','2023-03-07','内容相关2','此处可上传文字、图片、视频、超链接、表格等内容区2',143,791,0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `notification_list` values (3,'标题3','发布人3','2023-03-07','内容相关3','此处可上传文字、图片、视频、超链接、表格等内容区3',286,297,0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `notification_list` values (4,'标题4','发布人4','2023-03-07','内容相关4','此处可上传文字、图片、视频、超链接、表格等内容区4',235,675,0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `notification_list` values (5,'标题5','发布人5','2023-03-07','内容相关5','此处可上传文字、图片、视频、超链接、表格等内容区5',545,547,0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `notification_list` values (6,'标题6','发布人6','2023-03-07','内容相关6','此处可上传文字、图片、视频、超链接、表格等内容区6',219,10,0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `notification_list` values (7,'标题7','发布人7','2023-03-07','内容相关7','此处可上传文字、图片、视频、超链接、表格等内容区7',941,636,0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `notification_list` values (8,'标题8','发布人8','2023-03-07','内容相关8','此处可上传文字、图片、视频、超链接、表格等内容区8',328,20,0,'2023-03-07 10:38:42','2023-03-07 10:38:42');

DROP TABLE IF EXISTS `employee_information`;
CREATE TABLE `employee_information`(employee_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '员工信息ID',
`employee_id` int(11) DEFAULT 0 comment '员工工号',
`employee_name` varchar(64) comment '员工姓名',
`gender` varchar(64) comment '性别',
`age` int(11) DEFAULT 0 comment '年龄',
`native_place` varchar(64) comment '籍贯',
`contact_number` varchar(64) comment '联系电话',
`professional_skills` varchar(64) comment '专业技能',
`average` int(11) DEFAULT 0 comment '平均分',
`number_of_completed_projects` int(11) DEFAULT 0 comment '完成项目数量',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (employee_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '员工信息';
insert into `employee_information` values (1,0,'员工姓名1','性别1',1,'籍贯1','联系电话1','专业技能1',1,1,0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `employee_information` values (2,0,'员工姓名2','性别2',2,'籍贯2','联系电话2','专业技能2',2,2,0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `employee_information` values (3,0,'员工姓名3','性别3',3,'籍贯3','联系电话3','专业技能3',3,3,0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `employee_information` values (4,0,'员工姓名4','性别4',4,'籍贯4','联系电话4','专业技能4',4,4,0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `employee_information` values (5,0,'员工姓名5','性别5',5,'籍贯5','联系电话5','专业技能5',5,5,0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `employee_information` values (6,0,'员工姓名6','性别6',6,'籍贯6','联系电话6','专业技能6',6,6,0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `employee_information` values (7,0,'员工姓名7','性别7',7,'籍贯7','联系电话7','专业技能7',7,7,0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `employee_information` values (8,0,'员工姓名8','性别8',8,'籍贯8','联系电话8','专业技能8',8,8,0,'2023-03-07 10:38:42','2023-03-07 10:38:42');

DROP TABLE IF EXISTS `problem_feedback`;
CREATE TABLE `problem_feedback`(problem_feedback_id int(11) NOT NULL AUTO_INCREMENT COMMENT '问题反馈ID',
`title` varchar(64) comment '标题',
`employee_id` int(11) DEFAULT 0 comment '员工工号',
`employee_name` varchar(64) comment '员工姓名',
`feedback_time` date comment '反馈时间',
`problem_description` text comment '问题描述',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`examine_reply` varchar(16) DEFAULT '' comment '审核回复',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (problem_feedback_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '问题反馈';
insert into `problem_feedback` values (1,'标题1',0,'员工姓名1','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区1','未审核','',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `problem_feedback` values (2,'标题2',0,'员工姓名2','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区2','未审核','',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `problem_feedback` values (3,'标题3',0,'员工姓名3','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区3','未审核','',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `problem_feedback` values (4,'标题4',0,'员工姓名4','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区4','未审核','',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `problem_feedback` values (5,'标题5',0,'员工姓名5','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区5','未审核','',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `problem_feedback` values (6,'标题6',0,'员工姓名6','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区6','未审核','',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `problem_feedback` values (7,'标题7',0,'员工姓名7','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区7','未审核','',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `problem_feedback` values (8,'标题8',0,'员工姓名8','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区8','未审核','',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');

DROP TABLE IF EXISTS `clock_in`;
CREATE TABLE `clock_in`(clock_in_id int(11) NOT NULL AUTO_INCREMENT COMMENT '打卡签到ID',
`employee_id` int(11) DEFAULT 0 comment '员工工号',
`employee_name` varchar(64) comment '员工姓名',
`gender` varchar(64) comment '性别',
`clock_type` varchar(64) comment '打卡类型',
`clocking_time` datetime comment '打卡时间',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`location_address` varchar(64) DEFAULT NULL comment '当前位置',
`location_lng` varchar(64) DEFAULT NULL comment '当前位置经度',
`location_lat` varchar(64) DEFAULT NULL comment '当前位置纬度',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (clock_in_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '打卡签到';
insert into `clock_in` values (1,0,'员工姓名1','性别1','打卡类型1','2023-03-07 10:38:42',0,'广东省深圳市南山区科技园','113.946782','22.556481','2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `clock_in` values (2,0,'员工姓名2','性别2','打卡类型2','2023-03-07 10:38:42',0,'广东省深圳市南山区科技园','113.946782','22.556481','2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `clock_in` values (3,0,'员工姓名3','性别3','打卡类型3','2023-03-07 10:38:42',0,'广东省深圳市南山区科技园','113.946782','22.556481','2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `clock_in` values (4,0,'员工姓名4','性别4','打卡类型4','2023-03-07 10:38:42',0,'广东省深圳市南山区科技园','113.946782','22.556481','2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `clock_in` values (5,0,'员工姓名5','性别5','打卡类型5','2023-03-07 10:38:42',0,'广东省深圳市南山区科技园','113.946782','22.556481','2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `clock_in` values (6,0,'员工姓名6','性别6','打卡类型6','2023-03-07 10:38:42',0,'广东省深圳市南山区科技园','113.946782','22.556481','2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `clock_in` values (7,0,'员工姓名7','性别7','打卡类型7','2023-03-07 10:38:42',0,'广东省深圳市南山区科技园','113.946782','22.556481','2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `clock_in` values (8,0,'员工姓名8','性别8','打卡类型8','2023-03-07 10:38:42',0,'广东省深圳市南山区科技园','113.946782','22.556481','2023-03-07 10:38:42','2023-03-07 10:38:42');

DROP TABLE IF EXISTS `project_records`;
CREATE TABLE `project_records`(project_records_id int(11) NOT NULL AUTO_INCREMENT COMMENT '项目记录ID',
`employee_id` int(11) DEFAULT 0 comment '员工工号',
`employee_name` varchar(64) comment '员工姓名',
`task_name` varchar(64) comment '任务名称',
`dispatch_time` varchar(64) comment '分派时间',
`completion` varchar(64) comment '完成情况',
`record_time` date comment '记录时间',
`details` text comment '详情',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (project_records_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '项目记录';
insert into `project_records` values (1,0,'员工姓名1','任务名称1','分派时间1','完成情况1','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区1',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `project_records` values (2,0,'员工姓名2','任务名称2','分派时间2','完成情况2','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区2',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `project_records` values (3,0,'员工姓名3','任务名称3','分派时间3','完成情况3','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区3',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `project_records` values (4,0,'员工姓名4','任务名称4','分派时间4','完成情况4','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区4',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `project_records` values (5,0,'员工姓名5','任务名称5','分派时间5','完成情况5','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区5',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `project_records` values (6,0,'员工姓名6','任务名称6','分派时间6','完成情况6','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区6',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `project_records` values (7,0,'员工姓名7','任务名称7','分派时间7','完成情况7','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区7',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `project_records` values (8,0,'员工姓名8','任务名称8','分派时间8','完成情况8','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区8',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');

DROP TABLE IF EXISTS `employee_log`;
CREATE TABLE `employee_log`(employee_log_id int(11) NOT NULL AUTO_INCREMENT COMMENT '员工日志ID',
`log_title` varchar(64) comment '日志标题',
`employee_id` int(11) DEFAULT 0 comment '员工工号',
`employee_name` varchar(64) comment '员工姓名',
`record_time` date comment '记录时间',
`content_details` text comment '内容详情',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (employee_log_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '员工日志';
insert into `employee_log` values (1,'日志标题1',0,'员工姓名1','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区1',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `employee_log` values (2,'日志标题2',0,'员工姓名2','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区2',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `employee_log` values (3,'日志标题3',0,'员工姓名3','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区3',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `employee_log` values (4,'日志标题4',0,'员工姓名4','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区4',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `employee_log` values (5,'日志标题5',0,'员工姓名5','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区5',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `employee_log` values (6,'日志标题6',0,'员工姓名6','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区6',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `employee_log` values (7,'日志标题7',0,'员工姓名7','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区7',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `employee_log` values (8,'日志标题8',0,'员工姓名8','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区8',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');

DROP TABLE IF EXISTS `department_head`;
CREATE TABLE `department_head`(department_head_id int(11) NOT NULL AUTO_INCREMENT COMMENT '部门主管ID',
`supervisor_no` varchar(64) NOT NULL UNIQUE comment '主管编号',
`supervisor_name` varchar(64) comment '主管姓名',
`gender` varchar(64) comment '性别',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (department_head_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '部门主管';

DROP TABLE IF EXISTS `task_arrangement`;
CREATE TABLE `task_arrangement`(task_arrangement_id int(11) NOT NULL AUTO_INCREMENT COMMENT '任务安排ID',
`employee_id` int(11) DEFAULT 0 comment '员工工号',
`employee_name` varchar(64) comment '员工姓名',
`contact_number` varchar(64) comment '联系电话',
`professional_skills` varchar(64) comment '专业技能',
`task_name` varchar(64) comment '任务名称',
`dispatch_time` date comment '分派时间',
`task_requirements` text comment '任务要求',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (task_arrangement_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '任务安排';
insert into `task_arrangement` values (1,0,'员工姓名1','联系电话1','专业技能1','任务名称1','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区1',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `task_arrangement` values (2,0,'员工姓名2','联系电话2','专业技能2','任务名称2','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区2',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `task_arrangement` values (3,0,'员工姓名3','联系电话3','专业技能3','任务名称3','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区3',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `task_arrangement` values (4,0,'员工姓名4','联系电话4','专业技能4','任务名称4','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区4',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `task_arrangement` values (5,0,'员工姓名5','联系电话5','专业技能5','任务名称5','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区5',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `task_arrangement` values (6,0,'员工姓名6','联系电话6','专业技能6','任务名称6','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区6',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `task_arrangement` values (7,0,'员工姓名7','联系电话7','专业技能7','任务名称7','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区7',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `task_arrangement` values (8,0,'员工姓名8','联系电话8','专业技能8','任务名称8','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区8',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');

DROP TABLE IF EXISTS `project_scoring`;
CREATE TABLE `project_scoring`(project_scoring_id int(11) NOT NULL AUTO_INCREMENT COMMENT '项目打分ID',
`employee_id` int(11) DEFAULT 0 comment '员工工号',
`employee_name` varchar(64) comment '员工姓名',
`task_name` varchar(64) comment '任务名称',
`completion` varchar(64) comment '完成情况',
`scoring_time` date comment '打分时间',
`fraction` int(11) DEFAULT 0 comment '分数',
`annotation_notes` varchar(64) comment '标注说明',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (project_scoring_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '项目打分';
insert into `project_scoring` values (1,0,'员工姓名1','任务名称1','完成情况1','2023-03-07',1,'标注说明1',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `project_scoring` values (2,0,'员工姓名2','任务名称2','完成情况2','2023-03-07',2,'标注说明2',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `project_scoring` values (3,0,'员工姓名3','任务名称3','完成情况3','2023-03-07',3,'标注说明3',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `project_scoring` values (4,0,'员工姓名4','任务名称4','完成情况4','2023-03-07',4,'标注说明4',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `project_scoring` values (5,0,'员工姓名5','任务名称5','完成情况5','2023-03-07',5,'标注说明5',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `project_scoring` values (6,0,'员工姓名6','任务名称6','完成情况6','2023-03-07',6,'标注说明6',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `project_scoring` values (7,0,'员工姓名7','任务名称7','完成情况7','2023-03-07',7,'标注说明7',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');
insert into `project_scoring` values (8,0,'员工姓名8','任务名称8','完成情况8','2023-03-07',8,'标注说明8',0,'2023-03-07 10:38:42','2023-03-07 10:38:42');

DROP TABLE IF EXISTS `work_tracking`;
CREATE TABLE `work_tracking`(work_tracking_id int(11) NOT NULL AUTO_INCREMENT COMMENT '工作追踪ID',
`title` varchar(64) comment '标题',
`supervisor_no` int(11) DEFAULT 0 comment '主管编号',
`supervisor_name` varchar(64) comment '主管姓名',
`task_name` varchar(64) comment '任务名称',
`closing_date` date comment '截止日期',
`tracking` text comment '追踪情况',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (work_tracking_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '工作追踪';
insert into `work_tracking` values (1,'标题1',0,'主管姓名1','任务名称1','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区1',0,'2023-03-07 10:38:43','2023-03-07 10:38:43');
insert into `work_tracking` values (2,'标题2',0,'主管姓名2','任务名称2','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区2',0,'2023-03-07 10:38:43','2023-03-07 10:38:43');
insert into `work_tracking` values (3,'标题3',0,'主管姓名3','任务名称3','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区3',0,'2023-03-07 10:38:43','2023-03-07 10:38:43');
insert into `work_tracking` values (4,'标题4',0,'主管姓名4','任务名称4','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区4',0,'2023-03-07 10:38:43','2023-03-07 10:38:43');
insert into `work_tracking` values (5,'标题5',0,'主管姓名5','任务名称5','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区5',0,'2023-03-07 10:38:43','2023-03-07 10:38:43');
insert into `work_tracking` values (6,'标题6',0,'主管姓名6','任务名称6','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区6',0,'2023-03-07 10:38:43','2023-03-07 10:38:43');
insert into `work_tracking` values (7,'标题7',0,'主管姓名7','任务名称7','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区7',0,'2023-03-07 10:38:43','2023-03-07 10:38:43');
insert into `work_tracking` values (8,'标题8',0,'主管姓名8','任务名称8','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区8',0,'2023-03-07 10:38:43','2023-03-07 10:38:43');

DROP TABLE IF EXISTS `general_manager`;
CREATE TABLE `general_manager`(general_manager_id int(11) NOT NULL AUTO_INCREMENT COMMENT '总经理ID',
`general_manager_no` varchar(64) NOT NULL UNIQUE comment '总经理编号',
`full_name` varchar(64) comment '姓名',
`gender` varchar(64) comment '性别',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (general_manager_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '总经理';

DROP TABLE IF EXISTS `agency_tasks`;
CREATE TABLE `agency_tasks`(agency_tasks_id int(11) NOT NULL AUTO_INCREMENT COMMENT '代办任务ID',
`title` varchar(64) comment '标题',
`general_manager_no` int(11) DEFAULT 0 comment '总经理编号',
`full_name` varchar(64) comment '姓名',
`task_name` varchar(64) comment '任务名称',
`creation_time` date comment '创建时间',
`closing_date` date comment '截止日期',
`task_details` text comment '任务详情',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (agency_tasks_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '代办任务';
insert into `agency_tasks` values (1,'标题1',0,'姓名1','任务名称1','2023-03-07','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区1',0,'2023-03-07 10:38:43','2023-03-07 10:38:43');
insert into `agency_tasks` values (2,'标题2',0,'姓名2','任务名称2','2023-03-07','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区2',0,'2023-03-07 10:38:43','2023-03-07 10:38:43');
insert into `agency_tasks` values (3,'标题3',0,'姓名3','任务名称3','2023-03-07','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区3',0,'2023-03-07 10:38:43','2023-03-07 10:38:43');
insert into `agency_tasks` values (4,'标题4',0,'姓名4','任务名称4','2023-03-07','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区4',0,'2023-03-07 10:38:43','2023-03-07 10:38:43');
insert into `agency_tasks` values (5,'标题5',0,'姓名5','任务名称5','2023-03-07','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区5',0,'2023-03-07 10:38:43','2023-03-07 10:38:43');
insert into `agency_tasks` values (6,'标题6',0,'姓名6','任务名称6','2023-03-07','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区6',0,'2023-03-07 10:38:43','2023-03-07 10:38:43');
insert into `agency_tasks` values (7,'标题7',0,'姓名7','任务名称7','2023-03-07','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区7',0,'2023-03-07 10:38:43','2023-03-07 10:38:43');
insert into `agency_tasks` values (8,'标题8',0,'姓名8','任务名称8','2023-03-07','2023-03-07','此处可上传文字、图片、视频、超链接、表格等内容区8',0,'2023-03-07 10:38:43','2023-03-07 10:38:43');

insert into `auth` values ('1','管理员','员工','staff','员工','/staff/table','','_blank','1','1','1','1','employee_id,employee_name,gender','employee_id,employee_name,gender','employee_id,employee_name,gender',null,'0','{"examine":true}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('2','管理员','员工','staff','员工详情','/staff/view','','_blank','1','1','1','1','employee_id,employee_name,gender','employee_id,employee_name,gender','employee_id,employee_name,gender',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('3','管理员','通知列表','notification_list','通知列表','/notification_list/table','','_blank','1','1','1','1','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details',null,'0','{"can_show_comment":true}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('4','管理员','通知列表','notification_list','通知详情','/notification_list/view','','_blank','1','1','1','1','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('5','管理员','通知列表','notification_list','通知列表','/notification_list/list','','_blank','1','1','1','1','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('6','管理员','通知列表','notification_list','通知详情','/notification_list/details','','_blank','1','1','1','1','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details',null,'0','{"can_comment":true,"can_show_comment":true}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('7','管理员','员工信息','employee_information','员工信息','/employee_information/table','','_blank','1','1','1','1','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects',null,'0','{"figure":true}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('8','管理员','员工信息','employee_information','信息详情','/employee_information/view','','_blank','1','1','1','1','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('9','管理员','员工信息','employee_information','员工信息','/employee_information/list','','_blank','1','1','1','1','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('10','管理员','问题反馈','problem_feedback','问题反馈','/problem_feedback/table','','_blank','1','1','1','1','title,employee_id,employee_name,feedback_time,problem_description','title,employee_id,employee_name,feedback_time,problem_description','title,employee_id,employee_name,feedback_time,problem_description',null,'0','{"examine":true}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('11','管理员','问题反馈','problem_feedback','反馈详情','/problem_feedback/view','','_blank','1','1','1','1','title,employee_id,employee_name,feedback_time,problem_description','title,employee_id,employee_name,feedback_time,problem_description','title,employee_id,employee_name,feedback_time,problem_description',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('12','管理员','问题反馈','problem_feedback','问题反馈','/problem_feedback/list','','_blank','1','1','1','1','title,employee_id,employee_name,feedback_time,problem_description','title,employee_id,employee_name,feedback_time,problem_description','title,employee_id,employee_name,feedback_time,problem_description',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('13','管理员','打卡签到','clock_in','打卡签到','/clock_in/table','','_blank','1','1','1','1','employee_id,employee_name,gender,clock_type,clocking_time','employee_id,employee_name,gender,clock_type,clocking_time','employee_id,employee_name,gender,clock_type,clocking_time',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('14','管理员','打卡签到','clock_in','签到详情','/clock_in/view','','_blank','1','1','1','1','employee_id,employee_name,gender,clock_type,clocking_time','employee_id,employee_name,gender,clock_type,clocking_time','employee_id,employee_name,gender,clock_type,clocking_time',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('15','管理员','打卡签到','clock_in','打卡签到','/clock_in/list','','_blank','1','1','1','1','employee_id,employee_name,gender,clock_type,clocking_time','employee_id,employee_name,gender,clock_type,clocking_time','employee_id,employee_name,gender,clock_type,clocking_time',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('16','管理员','项目记录','project_records','项目记录','/project_records/table','','_blank','1','1','1','1','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('17','管理员','项目记录','project_records','记录详情','/project_records/view','','_blank','1','1','1','1','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('18','管理员','项目记录','project_records','项目记录','/project_records/list','','_blank','1','1','1','1','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('19','管理员','项目记录','project_records','项目记录','/project_records/edit','','_blank','1','1','1','1','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('20','管理员','员工日志','employee_log','员工日志','/employee_log/table','','_blank','1','1','1','1','log_title,employee_id,employee_name,record_time,content_details','log_title,employee_id,employee_name,record_time,content_details','log_title,employee_id,employee_name,record_time,content_details',null,'0','{"print":true,"export_db":true}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('21','管理员','员工日志','employee_log','日志详情','/employee_log/view','','_blank','1','1','1','1','log_title,employee_id,employee_name,record_time,content_details','log_title,employee_id,employee_name,record_time,content_details','log_title,employee_id,employee_name,record_time,content_details',null,'0','{"print":true}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('22','管理员','员工日志','employee_log','员工日志','/employee_log/list','','_blank','1','1','1','1','log_title,employee_id,employee_name,record_time,content_details','log_title,employee_id,employee_name,record_time,content_details','log_title,employee_id,employee_name,record_time,content_details',null,'0','{"print":true}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('23','管理员','部门主管','department_head','部门主管','/department_head/table','','_blank','1','1','1','1','supervisor_no,supervisor_name,gender','supervisor_no,supervisor_name,gender','supervisor_no,supervisor_name,gender',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('24','管理员','部门主管','department_head','主管详情','/department_head/view','','_blank','1','1','1','1','supervisor_no,supervisor_name,gender','supervisor_no,supervisor_name,gender','supervisor_no,supervisor_name,gender',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('25','管理员','任务安排','task_arrangement','任务安排','/task_arrangement/table','','_blank','1','1','1','1','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('26','管理员','任务安排','task_arrangement','安排详情','/task_arrangement/view','','_blank','1','1','1','1','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('27','管理员','任务安排','task_arrangement','任务安排','/task_arrangement/list','','_blank','1','1','1','1','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('28','管理员','项目打分','project_scoring','项目打分','/project_scoring/table','','_blank','1','1','1','1','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('29','管理员','项目打分','project_scoring','打分详情','/project_scoring/view','','_blank','1','1','1','1','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('30','管理员','项目打分','project_scoring','项目打分','/project_scoring/list','','_blank','1','1','1','1','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('31','管理员','工作追踪','work_tracking','工作追踪','/work_tracking/table','','_blank','1','1','1','1','title,supervisor_no,supervisor_name,task_name,closing_date,tracking','title,supervisor_no,supervisor_name,task_name,closing_date,tracking','title,supervisor_no,supervisor_name,task_name,closing_date,tracking',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('32','管理员','工作追踪','work_tracking','追踪详情','/work_tracking/view','','_blank','1','1','1','1','title,supervisor_no,supervisor_name,task_name,closing_date,tracking','title,supervisor_no,supervisor_name,task_name,closing_date,tracking','title,supervisor_no,supervisor_name,task_name,closing_date,tracking',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('33','管理员','总经理','general_manager','总经理','/general_manager/table','','_blank','1','1','1','1','general_manager_no,full_name,gender','general_manager_no,full_name,gender','general_manager_no,full_name,gender',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('34','管理员','总经理','general_manager','总经理详情','/general_manager/view','','_blank','1','1','1','1','general_manager_no,full_name,gender','general_manager_no,full_name,gender','general_manager_no,full_name,gender',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('35','管理员','代办任务','agency_tasks','代办任务','/agency_tasks/table','','_blank','1','1','1','1','title,general_manager_no,full_name,task_name,creation_time,closing_date,task_details','title,general_manager_no,full_name,task_name,creation_time,closing_date,task_details','title,general_manager_no,full_name,task_name,creation_time,closing_date,task_details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('36','管理员','代办任务','agency_tasks','任务详情','/agency_tasks/view','','_blank','1','1','1','1','title,general_manager_no,full_name,task_name,creation_time,closing_date,task_details','title,general_manager_no,full_name,task_name,creation_time,closing_date,task_details','title,general_manager_no,full_name,task_name,creation_time,closing_date,task_details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('37','管理员','评论','comment','评论列表','/comment/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('38','管理员','评论','comment','评论详情','/comment/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('39','管理员','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('40','管理员','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('41','管理员','新闻','article','新闻资讯','/article/table','','_blank','1','1','1','1','','','',null,'0','{"print":true,"export_db":true,"import_db":true}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('42','管理员','新闻','article','资讯详情','/article/view','','_blank','1','1','1','1','','','',null,'0','{"print":true}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('43','管理员','新闻','article','新闻资讯','/article/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('44','管理员','新闻','article','资讯详情','/article/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('45','管理员','新闻分类','article_type','资讯分类','/article_type/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('46','管理员','新闻分类','article_type','分类详情','/article_type/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('47','管理员','公告','notice','公告消息','/notice/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('48','管理员','公告','notice','公告详情','/notice/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('49','管理员','公告','notice','公告消息','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('50','管理员','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('51','游客','员工','staff','员工','/staff/table','','_blank','1','0','0','0','employee_id,employee_name,gender','employee_id,employee_name,gender','employee_id,employee_name,gender',null,'0','{"examine":false}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('52','游客','员工','staff','员工详情','/staff/view','','_blank','1','0','0','0','employee_id,employee_name,gender','employee_id,employee_name,gender','employee_id,employee_name,gender',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('53','游客','通知列表','notification_list','通知列表','/notification_list/table','','_blank','0','0','0','0','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details',null,'0','{"can_show_comment":false}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('54','游客','通知列表','notification_list','通知列表详情','/notification_list/view','','_blank','0','0','0','0','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('55','游客','通知列表','notification_list','通知列表','/notification_list/list','','_blank','0','0','0','1','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('56','游客','通知列表','notification_list','通知详情','/notification_list/details','','_blank','0','0','0','1','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details',null,'0','{"can_comment":false,"can_show_comment":false}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('57','游客','员工信息','employee_information','员工信息','/employee_information/table','','_blank','0','0','0','0','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects',null,'0','{"figure":false}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('58','游客','员工信息','employee_information','员工信息详情','/employee_information/view','','_blank','0','0','0','0','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('59','游客','员工信息','employee_information','员工信息','/employee_information/list','','_blank','0','0','0','0','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('60','游客','问题反馈','problem_feedback','问题反馈','/problem_feedback/table','','_blank','0','0','0','0','title,employee_id,employee_name,feedback_time,problem_description','title,employee_id,employee_name,feedback_time,problem_description','title,employee_id,employee_name,feedback_time,problem_description',null,'0','{"examine":false}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('61','游客','问题反馈','problem_feedback','问题反馈详情','/problem_feedback/view','','_blank','0','0','0','0','title,employee_id,employee_name,feedback_time,problem_description','title,employee_id,employee_name,feedback_time,problem_description','title,employee_id,employee_name,feedback_time,problem_description',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('62','游客','问题反馈','problem_feedback','问题反馈','/problem_feedback/list','','_blank','0','0','0','0','title,employee_id,employee_name,feedback_time,problem_description','title,employee_id,employee_name,feedback_time,problem_description','title,employee_id,employee_name,feedback_time,problem_description',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('63','游客','打卡签到','clock_in','打卡签到','/clock_in/table','','_blank','0','0','0','0','employee_id,employee_name,gender,clock_type,clocking_time','employee_id,employee_name,gender,clock_type,clocking_time','employee_id,employee_name,gender,clock_type,clocking_time',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('64','游客','打卡签到','clock_in','打卡签到详情','/clock_in/view','','_blank','0','0','0','0','employee_id,employee_name,gender,clock_type,clocking_time','employee_id,employee_name,gender,clock_type,clocking_time','employee_id,employee_name,gender,clock_type,clocking_time',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('65','游客','打卡签到','clock_in','打卡签到','/clock_in/list','','_blank','0','0','0','0','employee_id,employee_name,gender,clock_type,clocking_time','employee_id,employee_name,gender,clock_type,clocking_time','employee_id,employee_name,gender,clock_type,clocking_time',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('66','游客','项目记录','project_records','项目记录','/project_records/table','','_blank','0','0','0','0','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('67','游客','项目记录','project_records','项目记录详情','/project_records/view','','_blank','0','0','0','0','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('68','游客','项目记录','project_records','项目记录','/project_records/list','','_blank','0','0','0','0','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('69','游客','项目记录','project_records','项目记录','/project_records/edit','','_blank','0','0','0','0','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('70','游客','员工日志','employee_log','员工日志','/employee_log/table','','_blank','0','0','0','0','log_title,employee_id,employee_name,record_time,content_details','log_title,employee_id,employee_name,record_time,content_details','log_title,employee_id,employee_name,record_time,content_details',null,'0','{"print":false,"export_db":false}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('71','游客','员工日志','employee_log','员工日志详情','/employee_log/view','','_blank','0','0','0','0','log_title,employee_id,employee_name,record_time,content_details','log_title,employee_id,employee_name,record_time,content_details','log_title,employee_id,employee_name,record_time,content_details',null,'0','{"print":false}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('72','游客','员工日志','employee_log','员工日志','/employee_log/list','','_blank','0','0','0','0','log_title,employee_id,employee_name,record_time,content_details','log_title,employee_id,employee_name,record_time,content_details','log_title,employee_id,employee_name,record_time,content_details',null,'0','{"print":false}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('73','游客','部门主管','department_head','部门主管','/department_head/table','','_blank','0','0','0','0','supervisor_no,supervisor_name,gender','supervisor_no,supervisor_name,gender','supervisor_no,supervisor_name,gender',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('74','游客','部门主管','department_head','部门主管详情','/department_head/view','','_blank','0','0','0','0','supervisor_no,supervisor_name,gender','supervisor_no,supervisor_name,gender','supervisor_no,supervisor_name,gender',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('75','游客','任务安排','task_arrangement','任务安排','/task_arrangement/table','','_blank','0','0','0','0','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('76','游客','任务安排','task_arrangement','任务安排详情','/task_arrangement/view','','_blank','0','0','0','0','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('77','游客','任务安排','task_arrangement','任务安排','/task_arrangement/list','','_blank','0','0','0','0','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('78','游客','项目打分','project_scoring','项目打分','/project_scoring/table','','_blank','0','0','0','0','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('79','游客','项目打分','project_scoring','项目打分详情','/project_scoring/view','','_blank','0','0','0','0','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('80','游客','项目打分','project_scoring','项目打分','/project_scoring/list','','_blank','0','0','0','0','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('81','游客','工作追踪','work_tracking','工作追踪','/work_tracking/table','','_blank','0','0','0','0','title,supervisor_no,supervisor_name,task_name,closing_date,tracking','title,supervisor_no,supervisor_name,task_name,closing_date,tracking','title,supervisor_no,supervisor_name,task_name,closing_date,tracking',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('82','游客','工作追踪','work_tracking','工作追踪详情','/work_tracking/view','','_blank','0','0','0','0','title,supervisor_no,supervisor_name,task_name,closing_date,tracking','title,supervisor_no,supervisor_name,task_name,closing_date,tracking','title,supervisor_no,supervisor_name,task_name,closing_date,tracking',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('83','游客','总经理','general_manager','总经理','/general_manager/table','','_blank','0','0','0','0','general_manager_no,full_name,gender','general_manager_no,full_name,gender','general_manager_no,full_name,gender',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('84','游客','总经理','general_manager','总经理详情','/general_manager/view','','_blank','0','0','0','0','general_manager_no,full_name,gender','general_manager_no,full_name,gender','general_manager_no,full_name,gender',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('85','游客','代办任务','agency_tasks','代办任务','/agency_tasks/table','','_blank','0','0','0','0','title,general_manager_no,full_name,task_name,creation_time,closing_date,task_details','title,general_manager_no,full_name,task_name,creation_time,closing_date,task_details','title,general_manager_no,full_name,task_name,creation_time,closing_date,task_details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('86','游客','代办任务','agency_tasks','代办任务详情','/agency_tasks/view','','_blank','0','0','0','0','title,general_manager_no,full_name,task_name,creation_time,closing_date,task_details','title,general_manager_no,full_name,task_name,creation_time,closing_date,task_details','title,general_manager_no,full_name,task_name,creation_time,closing_date,task_details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('87','游客','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('88','游客','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('89','游客','评论','comment','我的评论','/comment/list','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('90','游客','评论','comment','评论详情','/comment/details','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('91','游客','新闻','article','新闻列表','/article/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('92','游客','新闻','article','新闻详情','/article/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('93','游客','新闻','article','新闻资讯','/article/list','','_blank','0','0','0','1','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('94','游客','新闻','article','资讯详情','/article/details','','_blank','0','0','0','1','','','',null,'0','{"can_comment":false,"can_show_comment":false}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('95','游客','新闻分类','article_type','新闻分类列表','/article_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('96','游客','新闻分类','article_type','新闻分类详情','/article_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('97','游客','公告','notice','公告列表','/notice/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('98','游客','公告','notice','公告详情','/notice/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('99','游客','公告','notice','公告消息','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('100','游客','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('101','员工','员工','staff','员工','/staff/table','','_blank','0','0','0','0','employee_id,employee_name,gender','employee_id,employee_name,gender','employee_id,employee_name,gender',null,'0','{"examine":false}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('102','员工','员工','staff','员工详情','/staff/view','','_blank','0','0','0','0','employee_id,employee_name,gender','employee_id,employee_name,gender','employee_id,employee_name,gender',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('103','员工','通知列表','notification_list','通知列表','/notification_list/table','','_blank','0','0','0','0','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details',null,'0','{"can_show_comment":false}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('104','员工','通知列表','notification_list','通知列表详情','/notification_list/view','','_blank','0','0','0','0','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('105','员工','通知列表','notification_list','通知列表','/notification_list/list','','_blank','1','1','1','1','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('106','员工','通知列表','notification_list','通知详情','/notification_list/details','','_blank','1','1','1','1','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details',null,'0','{"can_comment":true,"can_show_comment":true}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('107','员工','员工信息','employee_information','员工信息','/employee_information/table','','_blank','1','1','1','1','age,native_place,employee_id,employee_name,gender,contact_number,professional_skills','age,native_place,employee_id,employee_name,gender,contact_number,professional_skills','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects',null,'0','{"figure":false}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('108','员工','员工信息','employee_information','员工详情','/employee_information/view','','_blank','1','1','1','1','age,native_place,employee_id,employee_name,gender,contact_number,professional_skills','age,native_place,employee_id,employee_name,gender,contact_number,professional_skills','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('109','员工','员工信息','employee_information','员工信息','/employee_information/list','','_blank','1','1','1','1','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('110','员工','问题反馈','problem_feedback','问题反馈','/problem_feedback/table','','_blank','1','1','1','1','title,employee_id,employee_name,feedback_time,problem_description','title,employee_id,employee_name,feedback_time,problem_description','title,employee_id,employee_name,feedback_time,problem_description',null,'0','{"examine":false}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('111','员工','问题反馈','problem_feedback','反馈详情','/problem_feedback/view','','_blank','1','1','1','1','title,employee_id,employee_name,feedback_time,problem_description','title,employee_id,employee_name,feedback_time,problem_description','title,employee_id,employee_name,feedback_time,problem_description',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('112','员工','问题反馈','problem_feedback','问题反馈','/problem_feedback/list','','_blank','1','1','1','1','title,employee_id,employee_name,feedback_time,problem_description','title,employee_id,employee_name,feedback_time,problem_description','title,employee_id,employee_name,feedback_time,problem_description',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('113','员工','打卡签到','clock_in','打卡签到','/clock_in/table','','_blank','1','1','1','1','employee_id,employee_name,gender,clock_type,clocking_time','employee_id,employee_name,gender,clock_type,clocking_time','employee_id,employee_name,gender,clock_type,clocking_time',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('114','员工','打卡签到','clock_in','签到详情','/clock_in/view','','_blank','1','1','1','1','employee_id,employee_name,gender,clock_type,clocking_time','employee_id,employee_name,gender,clock_type,clocking_time','employee_id,employee_name,gender,clock_type,clocking_time',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('115','员工','打卡签到','clock_in','打卡签到','/clock_in/list','','_blank','1','1','1','1','employee_id,employee_name,gender,clock_type,clocking_time','employee_id,employee_name,gender,clock_type,clocking_time','employee_id,employee_name,gender,clock_type,clocking_time',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('116','员工','项目记录','project_records','项目记录','/project_records/table','','_blank','1','1','1','1','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('117','员工','项目记录','project_records','记录详情','/project_records/view','','_blank','1','1','1','1','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('118','员工','项目记录','project_records','项目记录','/project_records/list','','_blank','1','1','1','1','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('119','员工','项目记录','project_records','项目记录','/project_records/edit','','_blank','1','1','1','1','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('120','员工','员工日志','employee_log','员工日志','/employee_log/table','','_blank','1','1','1','1','log_title,employee_id,employee_name,record_time,content_details','log_title,employee_id,employee_name,record_time,content_details','log_title,employee_id,employee_name,record_time,content_details',null,'0','{"print":true,"export_db":true}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('121','员工','员工日志','employee_log','日志详情','/employee_log/view','','_blank','1','1','1','1','log_title,employee_id,employee_name,record_time,content_details','log_title,employee_id,employee_name,record_time,content_details','log_title,employee_id,employee_name,record_time,content_details',null,'0','{"print":true}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('122','员工','员工日志','employee_log','员工日志','/employee_log/list','','_blank','1','1','1','1','log_title,employee_id,employee_name,record_time,content_details','log_title,employee_id,employee_name,record_time,content_details','log_title,employee_id,employee_name,record_time,content_details',null,'0','{"print":true}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('123','员工','部门主管','department_head','部门主管','/department_head/table','','_blank','0','0','0','0','supervisor_no,supervisor_name,gender','supervisor_no,supervisor_name,gender','supervisor_no,supervisor_name,gender',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('124','员工','部门主管','department_head','部门主管详情','/department_head/view','','_blank','0','0','0','0','supervisor_no,supervisor_name,gender','supervisor_no,supervisor_name,gender','supervisor_no,supervisor_name,gender',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('125','员工','任务安排','task_arrangement','历史项目','/task_arrangement/table','','_blank','0','1','0','1','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('126','员工','任务安排','task_arrangement','项目详情','/task_arrangement/view','','_blank','0','1','0','1','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('127','员工','任务安排','task_arrangement','历史项目','/task_arrangement/list','','_blank','1','1','1','1','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('128','员工','项目打分','project_scoring','项目得分','/project_scoring/table','','_blank','0','1','0','1','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('129','员工','项目打分','project_scoring','得分详情','/project_scoring/view','','_blank','0','1','0','1','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('130','员工','项目打分','project_scoring','项目打分','/project_scoring/list','','_blank','1','1','1','1','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('131','员工','工作追踪','work_tracking','工作追踪','/work_tracking/table','','_blank','0','0','0','0','title,supervisor_no,supervisor_name,task_name,closing_date,tracking','title,supervisor_no,supervisor_name,task_name,closing_date,tracking','title,supervisor_no,supervisor_name,task_name,closing_date,tracking',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('132','员工','工作追踪','work_tracking','工作追踪详情','/work_tracking/view','','_blank','0','0','0','0','title,supervisor_no,supervisor_name,task_name,closing_date,tracking','title,supervisor_no,supervisor_name,task_name,closing_date,tracking','title,supervisor_no,supervisor_name,task_name,closing_date,tracking',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('133','员工','总经理','general_manager','总经理','/general_manager/table','','_blank','0','0','0','0','general_manager_no,full_name,gender','general_manager_no,full_name,gender','general_manager_no,full_name,gender',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('134','员工','总经理','general_manager','总经理详情','/general_manager/view','','_blank','0','0','0','0','general_manager_no,full_name,gender','general_manager_no,full_name,gender','general_manager_no,full_name,gender',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('135','员工','代办任务','agency_tasks','代办任务','/agency_tasks/table','','_blank','0','0','0','0','title,general_manager_no,full_name,task_name,creation_time,closing_date,task_details','title,general_manager_no,full_name,task_name,creation_time,closing_date,task_details','title,general_manager_no,full_name,task_name,creation_time,closing_date,task_details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('136','员工','代办任务','agency_tasks','代办任务详情','/agency_tasks/view','','_blank','0','0','0','0','title,general_manager_no,full_name,task_name,creation_time,closing_date,task_details','title,general_manager_no,full_name,task_name,creation_time,closing_date,task_details','title,general_manager_no,full_name,task_name,creation_time,closing_date,task_details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('137','员工','评论','comment','评论列表','/comment/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('138','员工','评论','comment','评论详情','/comment/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('139','员工','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('140','员工','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('141','员工','新闻','article','新闻列表','/article/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('142','员工','新闻','article','新闻详情','/article/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('143','员工','新闻','article','新闻资讯','/article/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('144','员工','新闻','article','资讯详情','/article/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('145','员工','新闻分类','article_type','新闻分类列表','/article_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('146','员工','新闻分类','article_type','新闻分类详情','/article_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('147','员工','公告','notice','公告列表','/notice/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('148','员工','公告','notice','公告详情','/notice/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('149','员工','公告','notice','公告消息','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('150','员工','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('151','部门主管','员工','staff','员工','/staff/table','','_blank','0','0','0','0','employee_id,employee_name,gender','employee_id,employee_name,gender','employee_id,employee_name,gender',null,'0','{"examine":false}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('152','部门主管','员工','staff','员工详情','/staff/view','','_blank','0','0','0','0','employee_id,employee_name,gender','employee_id,employee_name,gender','employee_id,employee_name,gender',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('153','部门主管','通知列表','notification_list','通知列表','/notification_list/table','','_blank','0','0','0','0','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details',null,'0','{"can_show_comment":false}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('154','部门主管','通知列表','notification_list','通知列表详情','/notification_list/view','','_blank','0','0','0','0','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('155','部门主管','通知列表','notification_list','通知列表','/notification_list/list','','_blank','1','1','1','1','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('156','部门主管','通知列表','notification_list','通知详情','/notification_list/details','','_blank','1','1','1','1','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details',null,'0','{"can_comment":true,"can_show_comment":true}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('157','部门主管','员工信息','employee_information','员工信息','/employee_information/table','','_blank','1','1','1','1','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects',null,'0','{"figure":true}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('158','部门主管','员工信息','employee_information','员工详情','/employee_information/view','','_blank','1','1','1','1','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('159','部门主管','员工信息','employee_information','员工信息','/employee_information/list','','_blank','1','1','1','1','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('160','部门主管','问题反馈','problem_feedback','问题反馈','/problem_feedback/table','','_blank','0','1','0','1','title,employee_id,employee_name,feedback_time,problem_description','title,employee_id,employee_name,feedback_time,problem_description','title,employee_id,employee_name,feedback_time,problem_description',null,'0','{"examine":true}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('161','部门主管','问题反馈','problem_feedback','反馈详情','/problem_feedback/view','','_blank','0','1','0','1','title,employee_id,employee_name,feedback_time,problem_description','title,employee_id,employee_name,feedback_time,problem_description','title,employee_id,employee_name,feedback_time,problem_description',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('162','部门主管','问题反馈','problem_feedback','问题反馈','/problem_feedback/list','','_blank','0','1','0','1','title,employee_id,employee_name,feedback_time,problem_description','title,employee_id,employee_name,feedback_time,problem_description','title,employee_id,employee_name,feedback_time,problem_description',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('163','部门主管','打卡签到','clock_in','打卡签到','/clock_in/table','','_blank','0','1','0','1','employee_id,employee_name,gender,clock_type,clocking_time','employee_id,employee_name,gender,clock_type,clocking_time','employee_id,employee_name,gender,clock_type,clocking_time',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('164','部门主管','打卡签到','clock_in','签到详情','/clock_in/view','','_blank','0','1','0','1','employee_id,employee_name,gender,clock_type,clocking_time','employee_id,employee_name,gender,clock_type,clocking_time','employee_id,employee_name,gender,clock_type,clocking_time',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('165','部门主管','打卡签到','clock_in','打卡签到','/clock_in/list','','_blank','0','1','0','1','employee_id,employee_name,gender,clock_type,clocking_time','employee_id,employee_name,gender,clock_type,clocking_time','employee_id,employee_name,gender,clock_type,clocking_time',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('166','部门主管','项目记录','project_records','项目记录','/project_records/table','','_blank','0','1','0','1','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('167','部门主管','项目记录','project_records','记录详情','/project_records/view','','_blank','0','1','0','1','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('168','部门主管','项目记录','project_records','项目记录','/project_records/list','','_blank','0','1','0','1','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('169','部门主管','项目记录','project_records','项目记录','/project_records/edit','','_blank','0','1','0','1','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('170','部门主管','员工日志','employee_log','员工日志','/employee_log/table','','_blank','0','1','0','1','log_title,employee_id,employee_name,record_time,content_details','log_title,employee_id,employee_name,record_time,content_details','log_title,employee_id,employee_name,record_time,content_details',null,'0','{"print":true,"export_db":true}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('171','部门主管','员工日志','employee_log','日志详情','/employee_log/view','','_blank','0','1','0','1','log_title,employee_id,employee_name,record_time,content_details','log_title,employee_id,employee_name,record_time,content_details','log_title,employee_id,employee_name,record_time,content_details',null,'0','{"print":true}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('172','部门主管','员工日志','employee_log','员工日志','/employee_log/list','','_blank','0','1','0','1','log_title,employee_id,employee_name,record_time,content_details','log_title,employee_id,employee_name,record_time,content_details','log_title,employee_id,employee_name,record_time,content_details',null,'0','{"print":true}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('173','部门主管','部门主管','department_head','部门主管','/department_head/table','','_blank','0','0','0','0','supervisor_no,supervisor_name,gender','supervisor_no,supervisor_name,gender','supervisor_no,supervisor_name,gender',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('174','部门主管','部门主管','department_head','部门主管详情','/department_head/view','','_blank','0','0','0','0','supervisor_no,supervisor_name,gender','supervisor_no,supervisor_name,gender','supervisor_no,supervisor_name,gender',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('175','部门主管','任务安排','task_arrangement','任务安排','/task_arrangement/table','','_blank','1','1','1','1','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('176','部门主管','任务安排','task_arrangement','安排详情','/task_arrangement/view','','_blank','1','1','1','1','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('177','部门主管','任务安排','task_arrangement','任务安排','/task_arrangement/list','','_blank','0','1','0','1','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('178','部门主管','项目打分','project_scoring','项目打分','/project_scoring/table','','_blank','1','1','1','1','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('179','部门主管','项目打分','project_scoring','打分详情','/project_scoring/view','','_blank','1','1','1','1','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('180','部门主管','项目打分','project_scoring','项目打分','/project_scoring/list','','_blank','0','1','0','1','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('181','部门主管','工作追踪','work_tracking','工作追踪','/work_tracking/table','','_blank','1','1','1','1','title,supervisor_no,supervisor_name,task_name,closing_date,tracking','title,supervisor_no,supervisor_name,task_name,closing_date,tracking','title,supervisor_no,supervisor_name,task_name,closing_date,tracking',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('182','部门主管','工作追踪','work_tracking','追踪详情','/work_tracking/view','','_blank','1','1','1','1','title,supervisor_no,supervisor_name,task_name,closing_date,tracking','title,supervisor_no,supervisor_name,task_name,closing_date,tracking','title,supervisor_no,supervisor_name,task_name,closing_date,tracking',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('183','部门主管','总经理','general_manager','总经理','/general_manager/table','','_blank','0','0','0','0','general_manager_no,full_name,gender','general_manager_no,full_name,gender','general_manager_no,full_name,gender',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('184','部门主管','总经理','general_manager','总经理详情','/general_manager/view','','_blank','0','0','0','0','general_manager_no,full_name,gender','general_manager_no,full_name,gender','general_manager_no,full_name,gender',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('185','部门主管','代办任务','agency_tasks','代办任务','/agency_tasks/table','','_blank','0','0','0','0','title,general_manager_no,full_name,task_name,creation_time,closing_date,task_details','title,general_manager_no,full_name,task_name,creation_time,closing_date,task_details','title,general_manager_no,full_name,task_name,creation_time,closing_date,task_details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('186','部门主管','代办任务','agency_tasks','任务详情','/agency_tasks/view','','_blank','0','0','0','0','title,general_manager_no,full_name,task_name,creation_time,closing_date,task_details','title,general_manager_no,full_name,task_name,creation_time,closing_date,task_details','title,general_manager_no,full_name,task_name,creation_time,closing_date,task_details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('187','部门主管','评论','comment','评论列表','/comment/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('188','部门主管','评论','comment','评论详情','/comment/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('189','部门主管','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('190','部门主管','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('191','部门主管','新闻','article','新闻列表','/article/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('192','部门主管','新闻','article','新闻详情','/article/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('193','部门主管','新闻','article','新闻资讯','/article/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('194','部门主管','新闻','article','资讯详情','/article/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('195','部门主管','新闻分类','article_type','新闻分类列表','/article_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('196','部门主管','新闻分类','article_type','新闻分类详情','/article_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('197','部门主管','公告','notice','公告列表','/notice/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('198','部门主管','公告','notice','公告详情','/notice/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('199','部门主管','公告','notice','公告消息','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('200','部门主管','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('201','总经理','员工','staff','员工','/staff/table','','_blank','0','0','0','0','employee_id,employee_name,gender','employee_id,employee_name,gender','employee_id,employee_name,gender',null,'0','{"examine":false}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('202','总经理','员工','staff','员工详情','/staff/view','','_blank','0','0','0','0','employee_id,employee_name,gender','employee_id,employee_name,gender','employee_id,employee_name,gender',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('203','总经理','通知列表','notification_list','通知列表','/notification_list/table','','_blank','0','0','0','0','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details',null,'0','{"can_show_comment":false}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('204','总经理','通知列表','notification_list','通知列表详情','/notification_list/view','','_blank','0','0','0','0','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('205','总经理','通知列表','notification_list','通知列表','/notification_list/list','','_blank','1','1','1','1','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('206','总经理','通知列表','notification_list','通知详情','/notification_list/details','','_blank','1','1','1','1','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details','title,publisher,release_time,content_related,content_details',null,'0','{"can_comment":true,"can_show_comment":true}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('207','总经理','员工信息','employee_information','员工信息','/employee_information/table','','_blank','1','1','1','1','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects',null,'0','{"figure":true}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('208','总经理','员工信息','employee_information','员工详情','/employee_information/view','','_blank','1','1','1','1','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('209','总经理','员工信息','employee_information','员工信息','/employee_information/list','','_blank','0','1','0','1','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects','employee_id,employee_name,gender,age,native_place,contact_number,professional_skills,average,number_of_completed_projects',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('210','总经理','问题反馈','problem_feedback','问题反馈','/problem_feedback/table','','_blank','0','1','0','1','title,employee_id,employee_name,feedback_time,problem_description','title,employee_id,employee_name,feedback_time,problem_description','title,employee_id,employee_name,feedback_time,problem_description',null,'0','{"examine":true}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('211','总经理','问题反馈','problem_feedback','反馈详情','/problem_feedback/view','','_blank','0','1','0','1','title,employee_id,employee_name,feedback_time,problem_description','title,employee_id,employee_name,feedback_time,problem_description','title,employee_id,employee_name,feedback_time,problem_description',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('212','总经理','问题反馈','problem_feedback','问题反馈','/problem_feedback/list','','_blank','0','1','0','1','title,employee_id,employee_name,feedback_time,problem_description','title,employee_id,employee_name,feedback_time,problem_description','title,employee_id,employee_name,feedback_time,problem_description',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('213','总经理','打卡签到','clock_in','打卡签到','/clock_in/table','','_blank','0','1','0','1','employee_id,employee_name,gender,clock_type,clocking_time','employee_id,employee_name,gender,clock_type,clocking_time','employee_id,employee_name,gender,clock_type,clocking_time',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('214','总经理','打卡签到','clock_in','签到详情','/clock_in/view','','_blank','0','1','0','1','employee_id,employee_name,gender,clock_type,clocking_time','employee_id,employee_name,gender,clock_type,clocking_time','employee_id,employee_name,gender,clock_type,clocking_time',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('215','总经理','打卡签到','clock_in','打卡签到','/clock_in/list','','_blank','0','1','0','1','employee_id,employee_name,gender,clock_type,clocking_time','employee_id,employee_name,gender,clock_type,clocking_time','employee_id,employee_name,gender,clock_type,clocking_time',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('216','总经理','项目记录','project_records','项目记录','/project_records/table','','_blank','0','1','0','1','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('217','总经理','项目记录','project_records','记录详情','/project_records/view','','_blank','0','1','0','1','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('218','总经理','项目记录','project_records','项目记录','/project_records/list','','_blank','0','1','0','1','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('219','总经理','项目记录','project_records','项目记录','/project_records/edit','','_blank','0','1','0','1','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details','employee_id,employee_name,task_name,dispatch_time,completion,record_time,details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('220','总经理','员工日志','employee_log','员工日志','/employee_log/table','','_blank','0','1','0','1','log_title,employee_id,employee_name,record_time,content_details','log_title,employee_id,employee_name,record_time,content_details','log_title,employee_id,employee_name,record_time,content_details',null,'0','{"print":true,"export_db":true}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('221','总经理','员工日志','employee_log','日志详情','/employee_log/view','','_blank','0','1','0','1','log_title,employee_id,employee_name,record_time,content_details','log_title,employee_id,employee_name,record_time,content_details','log_title,employee_id,employee_name,record_time,content_details',null,'0','{"print":true}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('222','总经理','员工日志','employee_log','员工日志','/employee_log/list','','_blank','0','1','0','1','log_title,employee_id,employee_name,record_time,content_details','log_title,employee_id,employee_name,record_time,content_details','log_title,employee_id,employee_name,record_time,content_details',null,'0','{"print":false}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('223','总经理','部门主管','department_head','部门主管','/department_head/table','','_blank','0','0','0','0','supervisor_no,supervisor_name,gender','supervisor_no,supervisor_name,gender','supervisor_no,supervisor_name,gender',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('224','总经理','部门主管','department_head','部门主管详情','/department_head/view','','_blank','0','0','0','0','supervisor_no,supervisor_name,gender','supervisor_no,supervisor_name,gender','supervisor_no,supervisor_name,gender',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('225','总经理','任务安排','task_arrangement','任务安排','/task_arrangement/table','','_blank','1','1','1','1','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('226','总经理','任务安排','task_arrangement','安排详情','/task_arrangement/view','','_blank','1','1','1','1','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('227','总经理','任务安排','task_arrangement','任务安排','/task_arrangement/list','','_blank','1','1','1','1','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements','employee_id,employee_name,contact_number,professional_skills,task_name,dispatch_time,task_requirements',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('228','总经理','项目打分','project_scoring','项目打分','/project_scoring/table','','_blank','1','1','1','1','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('229','总经理','项目打分','project_scoring','打分详情','/project_scoring/view','','_blank','1','1','1','1','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('230','总经理','项目打分','project_scoring','项目打分','/project_scoring/list','','_blank','1','1','1','1','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes','employee_id,employee_name,task_name,completion,scoring_time,fraction,annotation_notes',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('231','总经理','工作追踪','work_tracking','工作追踪','/work_tracking/table','','_blank','0','0','0','0','title,supervisor_no,supervisor_name,task_name,closing_date,tracking','title,supervisor_no,supervisor_name,task_name,closing_date,tracking','title,supervisor_no,supervisor_name,task_name,closing_date,tracking',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('232','总经理','工作追踪','work_tracking','工作追踪详情','/work_tracking/view','','_blank','0','0','0','0','title,supervisor_no,supervisor_name,task_name,closing_date,tracking','title,supervisor_no,supervisor_name,task_name,closing_date,tracking','title,supervisor_no,supervisor_name,task_name,closing_date,tracking',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('233','总经理','总经理','general_manager','总经理','/general_manager/table','','_blank','0','0','0','0','general_manager_no,full_name,gender','general_manager_no,full_name,gender','general_manager_no,full_name,gender',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('234','总经理','总经理','general_manager','总经理详情','/general_manager/view','','_blank','0','0','0','0','general_manager_no,full_name,gender','general_manager_no,full_name,gender','general_manager_no,full_name,gender',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('235','总经理','代办任务','agency_tasks','代办任务','/agency_tasks/table','','_blank','1','1','1','1','title,general_manager_no,full_name,task_name,creation_time,closing_date,task_details','title,general_manager_no,full_name,task_name,creation_time,closing_date,task_details','title,general_manager_no,full_name,task_name,creation_time,closing_date,task_details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('236','总经理','代办任务','agency_tasks','任务详情','/agency_tasks/view','','_blank','1','1','1','1','title,general_manager_no,full_name,task_name,creation_time,closing_date,task_details','title,general_manager_no,full_name,task_name,creation_time,closing_date,task_details','title,general_manager_no,full_name,task_name,creation_time,closing_date,task_details',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('237','总经理','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('238','总经理','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('239','总经理','评论','comment','我的评论','/comment/list','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('240','总经理','评论','comment','评论详情','/comment/details','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('241','总经理','新闻','article','新闻列表','/article/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `auth` values ('242','总经理','新闻','article','新闻详情','/article/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2023-03-07 10:38:44.0','2023-03-07 10:38:44.0');
insert into `auth` values ('243','总经理','新闻','article','新闻资讯','/article/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-07 10:38:44.0','2023-03-07 10:38:44.0');
insert into `auth` values ('244','总经理','新闻','article','资讯详情','/article/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-03-07 10:38:44.0','2023-03-07 10:38:44.0');
insert into `auth` values ('245','总经理','新闻分类','article_type','新闻分类列表','/article_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-07 10:38:44.0','2023-03-07 10:38:44.0');
insert into `auth` values ('246','总经理','新闻分类','article_type','新闻分类详情','/article_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-07 10:38:44.0','2023-03-07 10:38:44.0');
insert into `auth` values ('247','总经理','公告','notice','公告列表','/notice/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-07 10:38:44.0','2023-03-07 10:38:44.0');
insert into `auth` values ('248','总经理','公告','notice','公告详情','/notice/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-07 10:38:44.0','2023-03-07 10:38:44.0');
insert into `auth` values ('249','总经理','公告','notice','公告消息','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-07 10:38:44.0','2023-03-07 10:38:44.0');
insert into `auth` values ('250','总经理','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-07 10:38:44.0','2023-03-07 10:38:44.0');
insert into `user_group` values ('1','100','管理员',null,'','','0','0','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `user_group` values ('2','100','游客',null,'','','0','0','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `user_group` values ('3','100','员工',null,'staff','staff_id','0','3','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `user_group` values ('4','100','部门主管',null,'department_head','department_head_id','0','0','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `user_group` values ('5','100','总经理',null,'general_manager','general_manager_id','0','1','2023-03-07 10:38:43.0','2023-03-07 10:38:43.0');
insert into `slides` values ('1','轮播图1','内容1','/article/details?article=1','/api/upload/1581829557839724545.jpg','947','2023-03-07 10:38:44.0','2023-03-07 10:38:44.0');
insert into `slides` values ('2','轮播图2','内容2','/article/details?article=2','/api/upload/1581826367270420481.jpg','501','2023-03-07 10:38:44.0','2023-03-07 10:38:44.0');
insert into `slides` values ('3','轮播图3','内容3','/article/details?article=3','/api/upload/1581829644997361665.jpg','956','2023-03-07 10:38:44.0','2023-03-07 10:38:44.0');
insert into `article` values ('1','日本合资芯片企业官宣牵手IBM 向2纳米工艺发起冲击','企业','94','0','2023-03-07 10:38:44.0','2023-03-07 10:38:44.0',null,null,null,'<p>声明称，两家公司将推进IBM突破性的2纳米节点技术的开发，之后将引入Rapidus在日本的代工工厂。IBM曾于去年公布了全球首个2纳米节点芯片开发技术，预计较7纳米芯片性能提升45%，能效提升75%。</p><p>协议还包括，Rapidus的科学家和工程师将与IBM日本公司和IBM总部的研究人员一起在纽约奥尔巴尼纳米技术综合体工作，该园区拥有世界领先的半导体研究生态系统。</p><p>Rapidus总裁兼首席执行官Atsuyoshi Koike在声明中称，“很高兴宣布与IBM建立合作伙伴关系。这是一项期待已久的国际合作，对于日本未来再次在半导体供应链中发挥重要作用的目标至关重要。”</p><p><strong>Rapidus的野心</strong></p><p>值得一提的是，这家宣布向2纳米工艺发起冲击的芯片公司仅成立一个月。上月10日，日本丰田汽车、索尼、NTT、NEC、软银、KIOXIA等8家公司合资成立了Rapidus，进行人工智能、智能城市建设等相关高端芯片开发。</p><p>Rapidus官网写道，公司的目标是2027年在日本本土工厂中开始大规模生产2纳米工艺的芯片。日本政府还在11月11日官宣向这家新公司补贴至多700亿日元（约合人民币约35.14亿元）。</p><p>目前，美国、中国和韩国是全球半导体行业的主要竞争者，而日本则试图在这一领域快速追赶，希望能重新恢复其过去在半导体行业的领先地位。</p><p>日内，Atsuyoshi Koike重申了公司的目标，并补充称将进一步寻求政府的支持，“我们将需要几万亿日元的投资，我们相信，我们将能够获得日本经济产业省的支持。”</p><p>Koike强调，“如果我们不能实现2纳米的生产能力，不良的后果将是巨大的。”</p>',null,null);
insert into `article` values ('2','广东省湛江市市场监管局奋勇分局开展知识产权保护调研和送法进企业活动','企业','494','0','2023-03-07 10:38:44.0','2023-03-07 10:38:44.0',null,null,null,'<p>中国质量新闻网讯 为进一步优化营商环境，推动知识产权高质量发展，广东省湛江市市场监管局奋勇分局积极想企业之所想，急企业之所急，上门到企业送法普法，为企业提供贴心暖心服务。</p><p>12月5日，市市场监管局奋勇分局工作人员先后到园区东岛新能源、南国药业、鑫润滔集团等8家企业开展知识产权保护和运用专题指导服务，现场了解企业生产经营情况、知识产权保护运用现状、存在问题和实际需求，并送上《专利产品备案条件及流程》《专利奖申报指南》《知识产权促进工作资助办法》《知识产权项目申报目录》等一系列政策法规宣传册。</p><p>在座谈会上，企业代表们表示，以前对知识产权认识不到位，政策信息来源渠道不对称，研发出来的产品经常被别人抢先注册，给企业造成了不可估量的损失。知识产权等无形资产往往是一个企业创新能力、运营能力、市场竞争力的体现，有助于企业建立品牌，赢得客户信任，使企业在激烈竞争中脱颖而出。纷纷点赞奋勇分局的上门送法服务，称这是为企业下了一场“及时雨”。</p><p>下一步，市市场监管局奋勇分局将聚焦企业痛点、难点、堵点，全面加强知识产权保护，政企协力，不断优化营商环境，助推企业高质量发展，构建奋勇高新区新发展格局。</p>','/api/upload/1602860039670857729.jpg',null);
insert into `article` values ('3','新濠国际发展(00200)成立提名及企业管治委员会','企业','984','0','2023-03-07 10:38:44.0','2023-03-07 10:38:44.0',null,null,null,'<p><span style="color: rgb(0, 0, 0);">智通财经APP讯，新濠国际发展(00200)发布公告，为精简董事会委员会结构及提高效率，董事会已将现有的提名委员会及企业管治委员会合并为提名及企业管治委员会(提名及企业管治委员会)，自2022年12月13日起生效</span></p>','/api/upload/1602860203085135872.jpg',null);
insert into `article` values ('4','中国企业治理高端论坛聚焦公司法修改','企业','17','0','2023-03-07 10:38:44.0','2023-03-07 10:38:44.0',null,null,null,'<p>在当前《中华人民共和国公司法》（以下简称公司法）修订的背景下，完善和发展企业、公司及产业等相关法律制度的话题，受到学界业界高度关注。以“中国式现代化与公司法发展”为主题的中国企业治理高端论坛日前举办，多名专家以公司法修改为中心展开研讨，分享真知灼见。</p><p>全国人大宪法和法律委员会副主任江必新系统梳理、归纳了党的二十大报告对企业发展和治理提出的新要求，认为不论是公司治理还是企业合规，尤其是正在进行的公司法修订，都要以二十大报告作为指导思想，积极落实二十大报告中关于企业发展、规范治理的精神。我国的法治已进入体系化建设时代，公司治理、企业合规同样需要体系化。体系化建设是一项难度很大的系统工程，一定要秉持积极态度，坚持科学立场，深入研究体系化建设的规律。</p><p>中国行为法学会企业治理研究分会会长周瑞春表示，公司法作为中国特色社会主义法治体系的重要组成部分，对持续优化营商环境、激发市场创新活力、完善和加强产权保护具有重要意义。针对实践中的突出问题和制度短板，对现行公司法作出修改完善，是企业治理研究的基础性课题。</p><p>中国人民大学法学院教授史际春认为，公司法比较不依赖于实定法条，更多依赖客观法则。在公司法的制定与修改中，需要尊重资本关系、契约自由等底层自然逻辑，不能拘泥于实定法条，否则有违法治要求的公平正义，还会加重公司负担，造成实践混乱。</p><p>中国人民大学法学院教授刘俊海认为，2013年的公司法修改，是为了降低市场准入的行政监管门槛，提升投资者的获得感和安全感；新公司法修改的天平应向债权人制度倾斜，打造战略友好型的公司法。应当提高整个公司族群的核心竞争力，保障理性债权人的知情权、选择权等权利，保护公司的资本信用、资产信用和人格信用这三大信用。</p><p>北京大学法学院教授蒋大兴指出，应当通过修订公司法解决长期困扰法院审判实践的争议性问题。为企业家提供确定的预期，解决企业融资困境；建立首席合规官制度和中层管理人制度等，保护私有财产和企业家稀缺资源。</p><p>清华大学法学院教授朱慈蕴认为，ESG（环境、社会和公司治理）现已成为全球化运动，可助力人类实现可持续发展目标。公司法在制度层面具有内在的可持续发展机制，因此现代公司法必须适应ESG要求，以实现可持续发展目标。例如ESG要求公司激活目的条款，因此我国公司法应尽快完善董事信义义务，并为公司治理提出新标准。</p><p>中国政法大学教授赵旭东认为，公司治理规范基本上属于结构性规范、分配性规范、普通规范和内部性规范。这些规范调整的是公司内部关系，主要涉及公司内部权力分配和股东管理权益，不直接影响公司外部当事人的权益和社会公共利益。因此除了基于公司治理的基本需求和特定组织机构本身的固有性质而必须赋予某些条款以强制性之外，其他一般无须基于法律强制。除股东会与经理的设置规范以及经理职权和股东会某些职权的规范应具有强制性外，其他公司治理规范，如董事会和监事会的设置及其职权等，均应作任意性规定。</p><p>北京师范大学公司治理与企业发展研究中心主任高明华认为，提高公司治理水平，是企业高质量发展的核心，应从投资者保护、董事会治理和企业家能力3个方面着手，通过真正落实中小投资者的决策和监督权、继续健全董事会结构并使其发挥实质性作用、努力保障总经理经营控制权的独立性，实现高质量发展的目标。</p><p>西南政法大学教授赵万一从公司法中嵌入刑法规则的原因、特殊制度构造等方面发言，认为把刑法规则引入公司法对现有法律体系是一个重大挑战。从长远目标看，应适当剥离刑法中的一些规定，分散到单行法律里规制，这样更有利于发挥这些基础性、专业性强的法律的调整作用。</p><p>华东政法大学教授顾功耘认为，不同的企业应该设计不同的治理结构。改革开放40多年来，企业治理结构实际上已发生很大变化，现阶段国有企业改革，党委要加入公司治理，决策的执行监督与权利义务分配是摆在眼前需要解决的一个问题。此外，从分类改革到分类治理的大环境下，企业设置的目标、股权性质或者产权性质以及企业是否实行“走出去”战略，也会对国有企业与非国有企业的公司治理产生影响。</p><p>清华大学法学院教授汤欣认为，需要仔细考察董事承担第三责任的理论依据，而不是按照比较法上纯粹的形式比较得出结论。董事对第三人责任具有现实功能，在目前公司法资本规则不断放松的立法背景下，董事承担第三人责任，有助于强化债权人保护，并补充法人格否定制度。从责任的实现方面看，应引入第三人责任，但是不引入连带责任。</p><p>中国人民大学法学院教授徐阳光提出，重整制度是挽救困境企业最有效的法律制度。他归纳分析了各地司法实践中重整制度的规则设计与实践的前沿问题，重整程序中公司治理结构的问题，合并破产问题与出资人重整程序中出资人权益保护的问题，呼吁学者开展深入研究。</p><p>首都师范大学政法学院院长吴高臣认为，财产因素虽然不是公司人格构成的本质要素，却是公司资本制度的理论基础，公司财产变化会影响公司人格。公司信用分为资本信用与资产信用，资本信用是公司取得人格的先决条件，也是资产信用的核心。他提出完善认缴制度的三点建议：一是恢复出资比例制度，但不要求出资额；二是完善资本催缴制度；三是完善股东出资义务加速到期制度。</p><p>同济大学经济法治研究中心主任朱国华针对公司法中独立董事制度发言，认为对独立董事要求过高不利于发挥其才能，建立明确的勤勉标准既能对独立董事的行为进行有效指引，又能为行政执法树立标杆。因此，应完善独立董事责任保险制度，明确独立董事的责任界定，区分独立董事承担行政责任与民事责任时的归责原则，并完善独立董事未尽勤勉义务的问责标准。</p><p>华东政法大学经济法学院教授沈贵明认为，现行公司法将有限责任公司和股份责任公司这两类公司混合立法，采取相同的治理机制，削弱了公司应有的价值和作用。公司立法应按照不同公司的形态，分别规定具体治理机制，以体现不同形态公司固有的价值。</p><p>中国行为法学会常务副秘书长朱崇坤认为，民法典规定法定代表人以法人名义从事的民事活动所产生的法律后果由法人承担，但实践中法定代表人的行为未必与法人的真实表示一致，易产生纠纷，使法定代表人制度出现混乱。基于实践中的各类问题，他对构建法定代表人制度提出建议：一是明确法定代表人的签字效力；二是加强公司治理结构化，明确法定代表人的职责；三是加强法定代表人责任立法，引导和监督其行为；四是落实监督制度，加强公司内部监督制衡；五是加强企业信用制度建设。</p><p>北京交通大学法学院民商经济法系主任李文华结合实务经验，介绍了企业治理实践结构中国企与私企在高管聘用制度方面的差异，以及部分国企中的专职董事制度与总法律顾问制度。他指出，法务人员在企业中的占比，对企业合规等具有重要意义。</p><p>上海对外经贸大学教授汪其昌认为，公司法的核心在于利益最大化，不仅公司内部要追求股东利益最大化，更要追求公司作为市场主体带来的政府利益和公共利益最大化。经济发展离不开信誉建设，只有重视并维持信用，才能追求各方利益最大化。</p><p>中央党校（国家行政学院）政法部教授王伟作总结发言。他认为，良好的公司治理是经济社会发展的微观细胞和重要基础，在以中国式现代化推进中华民族伟大复兴的进程中，我们要用中国式现代化理念去推动企业公司化的现代化。本次论坛形成很多非常深刻和睿智的观点，必将为推进公司企业治理的现代化、法治化贡献智慧和力量。</p>','/api/upload/1602859762892931073.jpg',null);
insert into `article_type` values ('1','100','企业','0',null,null,null,'2023-03-07 10:38:44.0','2023-03-07 10:38:44.0');
