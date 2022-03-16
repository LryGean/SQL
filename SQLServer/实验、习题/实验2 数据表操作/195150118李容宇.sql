--1.	使用T-SQL命令创建数据库“教学管理”，其他选项均采用默认设置。
create database 教学管理
go

--选择使用的数据库
use 教学管理
go
--2.	在数据库教学管理中，使用T-SQL命令创建如下数据库表。教师表：Teacher，学生表：Student，课程表：Course，选课表SC，授课表：TC。
--创建教师表
create table Teacher
(
	tno   char(2)     not null primary key,
	tname char(8)     not null,
	sex   char(2)     check(sex='男' or sex='女'),
	age   tinyint     check(age > 0),
    prof  char(10)    check(prof='助教' or prof='讲师' or prof='副教授' or prof='教授'),
	sal   smallint    check(sal>0)	default 2000,
	comm  smallint    check(comm>=0),
	dept  varchar(20) 
)

--创建Student表
create table Student
(
	sno	     char(8) not null primary key,        --列级约束
	sname	 char(8) not null,
	sex      char(2) check(sex='男' or sex='女'), --列级约束
	birthday datetime,
    dept     varchar(20),
	class    varchar(10)
)

--创建课程表
create table Course
(
	cno       char(5)     not null primary key,
	cname     varchar(30) not null,
	credit    tinyint,
	semester  tinyint,
)

--创建选课表
create table SC
(
	id  int     identity(1,1) not null  primary key,
	sno char(8) not null,
	cno char(5) not null,
	score tinyint check(score>0 and score<100),
	foreign key (sno) references Student(sno),
	foreign key (cno) references Course(cno),
)

--创建授课表
create table TC
(
	id  int     identity(1,1) not null,
	tno char(2) not null,
	cno char(5) not null
)

/*3.	使用T-SQL命令修改数据库教学管理里的数据表。
①	向已有数据表Student中添加学籍列。列定义如下：
列名：NATIVE
数据类型及长度：CHAR(40)
是否可NULL：NOT NULL
*/
alter table Student add native char(40) not null

/*②	修改已有数据表Student中的定义。
列名：NATIVE
数据类型及长度：CHAR(10)
是否可NULL：NULL
*/
alter table Student alter column native char(10) null

/*③	删除数据库表Student中的NATIVE列。*/
alter table Student drop column native

/*④	为已有数据表Course中的CREDIT列添加约束CK_CREDIT，保证学分大于零。*/
alter table Course
add constraint CK_credit check(credit>0)

/*⑤	为已有数据表Teacher中的COMM列添加默认值为0，约束名为DF_COMM。*/
alter table Teacher
add constraint DF_comm default(0) for comm

/*⑥	为已有数据表TC中的 TNO列添加引用Teacher表的外键约束FK_TC_TNO，CNO列添加引用Course表的外键约束FK_TC_CNO。*/
alter table TC
add constraint FK_TC_tno foreign key (tno)references Teacher(tno)

alter table TC
add constraint FK_TC_cno foreign key (cno)references Course(cno)

/*⑦删除数据表Teacher中的约束DF_COMM。*/
alter table Teacher
drop constraint DF_comm

/*4.删除数据表TC。*/
drop table TC

/*思考
1.一个数据库中的数据表可以有相同的表名吗？同一数据表中，列名称可以同名吗？
答：一个数据库中的数据表不可以有相同的表名。
同一数据表中，列名称不可以同名。
2.“USE 教学管理”命令是什么含义？与此语句功能相同的图形工具操作是什么？
答：“USE 教学管理”命令表示选择使用教学管理数据库。
展开数据库，选择要使用的数据库。
3.有如下定义：
CREATE TABLE TEST
(
	ITEM1 CHAR(10),
	ITEM2 NCHAR(10),
	ITEM3 NCHAR(20),
	ITEM4 NVARCHAR(20)
)
①ITEM1与ITEM2所占磁盘空间格式多少字节？是否相同？
答：ITEM1所占磁盘空间格式10 字节，ITEM2所占磁盘空间格式20字节。
不相同，char(n)表示字符串最大空间为n字节，小于n字节的时，系统自动在后边补空格；nchar(n)表示字符串最大空间为2n字节，小于2n字节的时，系统自动在后边补空格。
②ITEM3与ITEM4所占磁盘空间格式多少字节？是否相同？
答：ITEM3所占磁盘空间格式20字节,ITEM4所占磁盘空间格式42字节。
不相同，nchar(n)表示字符串最大空间为2n字节，小于2n字节的时，系统自动在后边补空格；nvarchar(n)存储空间为2*字符数+2字节额外开销。
③如果在ITEM1对应的数据项中输入字符串“12345678901”可以吗？为什么？
答：不可以，因为“12345678901”是11个字节，大于char(10)的最大存储空间10字节。
4.教学管理数据库中的表删除有顺序吗？如果有，删除顺序应该是什么？
答：有顺序，如果被删除的表中有其他表对它的外键引用约束，则必须先删除外键所在的表，然后再删除被引用的表。
*/