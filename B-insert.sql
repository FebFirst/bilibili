use bilibili;
/*

*/
-- alter database bilibili character set utf8;
/*
drop table if exists Subscribe;

create table Subscribe
(
   user_id              int(10) not null,
   series_name            varchar(50) not null,
   primary key (user_id, series_name)
);

alter table Subscribe add constraint foreign key (user_id)
      references User (user_id) on delete restrict on update restrict;

alter table Subscribe add constraint foreign key (series_name)
      references Series(series_name) on delete restrict on update restrict;
     
      
 alter table video add column thumb_count int(10);
 */
 -- alter table favorite_group add column group_name varchar(50);
 -- select * from favorite_group;
 -- alter table comment add column comment_pusher varchar(50);
 -- select * from comment;
 /*
 alter table reply_post  rename to post_report;
 select * from post_report;
 */
--  alter table reply add column reply_pusher varchar(50);
-- update reply set reply_pusher = "slt" where reply_id>-1;
-- update reply set content="我要说一句真话" where reply_id=3;
-- select * from reply;
/*
update video set title="yes" where video_id=3;
update video set title="yes or not" where video_id=1;
select * from video;

-- alter table interestgroup_userletter add column is_read tinyint(1);
update letter set is_read=0 where letter_id>-1;
select * from letter;

-- alter table interestsgroup change  interst_group_name  interest_group_name varchar(50) ;
delete from interestgroup_user where interest_group_id =1;
select * from interestgroup_user;

-- 插入用户
insert into user values
(0,"slt","amber",1,1,"AMBER","1030701874@qq.com","1996-1-18","2016-7-13 23:33:33","2016-7-13 23:33:33",null,null,null);

insert into user values
(1,"ss","ss",1,0,"AMBER","ss@qq.com",null,"2016-7-13 23:33:33","2016-7-13 23:33:33",null,null,null);

insert into user values
(2,"xsb","123456",1,1,"AMBER","252344233@qq.com","1999-9-19","2016-7-13 23:33:33","2016-7-13 23:33:33",null,null,null);

-- 插入兴趣圈
insert into interest_group values(1,"新番推送");
insert into interest_group values(2,"二次元BGM");
insert into interest_group values(3,"回顾那些年的二次元");
-- 插入私信
insert into letter values (0,0,1,"你好你好！");
insert into letter values (0,1,0,"你好呀，ss！");

-- 插入视频
insert into video values
(1,"slt","交大军训","My soul,your beats!","这是一次难忘的军训晚会，集结了众多豪杰！",videos/

-- 插入帖子
insert into post(content,create_time,thumb_count,post_pusher) values
("杀杀杀","2014-2-23 23:33:33",0,"1030701874@qq.com");
*/
-- delete from post where post_id = 999 and thumb_count = 0;
-- delete from interestgroup_user where interest_group_id>2;
-- Set SQL_SAFE_UPDATES=0;
-- delete from video where video_id=11;
-- 插入分类
/*insert into category values("番剧");
insert into category values("动画");
insert into category values("直播");
insert into category values("音乐");
insert into category values("舞蹈");
insert into category values("校园");
insert into category values("其他");
*/
-- 插入子分类
/*
insert into subcategory values("连载动漫","番剧");
insert into subcategory values("完结动漫","番剧");
insert into subcategory values("国产动漫","番剧");
insert into subcategory values("电视剧","番剧");
insert into subcategory values("MAD·AMV","动画");
insert into subcategory values("MMD·3D","动画");
insert into subcategory values("学生直播","直播");
insert into subcategory values("教师直播","直播");
insert into subcategory values("二次元音乐","音乐");
insert into subcategory values("三次元音乐","音乐");
insert into subcategory values("原创音乐","音乐");
insert into subcategory values("街舞","舞蹈");
insert into subcategory values("舞蹈教程","舞蹈");
insert into subcategory values("鬼畜","其他");
insert into subcategory values("学校生活","校园");
*/
-- 视频子分类对应
/*
insert into video_subcategory values(5,"连载动漫");
insert into video_subcategory values(6,"完结动漫");

*/

-- 删除视频
/*
Set SQL_SAFE_UPDATES=0;
 delete from video where video_id>0;
 insert into user values
(1,"ss","ss",1,0,"AMBER","ss@qq.com",null,"2016-7-13 23:33:33","2016-7-13 23:33:33",null,null,null);
*/
