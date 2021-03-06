USE [master]
GO
/****** 对象:  Database [Students]    脚本日期: 03/30/2012 22:18:08 ******/
CREATE DATABASE [Students] 
GO

USE [Students]
GO
/****** 对象:  Table [dbo].[Student]    脚本日期: 03/30/2012 22:18:29 ******/
CREATE TABLE [dbo].[Student](
	[Sno] [char](7) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Sname] [nchar](5) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Sex] [nchar](1) COLLATE Chinese_PRC_CI_AS NULL,
	[Birthday] [datetime] NULL,
	[Dept] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NULL DEFAULT ('计算机系'),
PRIMARY KEY CLUSTERED 
(
	[Sno] ASC
))

GO

ALTER TABLE [dbo].[Student]  WITH CHECK ADD CHECK  (([Sex]='女' OR [Sex]='男'))
GO

CREATE TABLE [dbo].[Course](
	[Cno] [char](4) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Cname] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Credit] [tinyint] NULL,
	[Semester] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Cno] ASC
))

GO

CREATE TABLE [dbo].[SC](
	[Sno] [char](7) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Cno] [char](4) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Grade] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Sno] ASC,
	[Cno] ASC
))

GO

ALTER TABLE [dbo].[SC]  WITH CHECK ADD FOREIGN KEY([Cno])
REFERENCES [dbo].[Course] ([Cno])
GO
ALTER TABLE [dbo].[SC]  WITH CHECK ADD FOREIGN KEY([Sno])
REFERENCES [dbo].[Student] ([Sno])
GO
ALTER TABLE [dbo].[SC]  WITH CHECK ADD CHECK  (([Grade]>=(0) AND [Grade]<=(100)))

insert into student values('0811101','李勇','男','1999-5-6','计算机系')
insert into student values('0811102','刘晨','男','2003-8-8','计算机系')
insert into student values('0811103','王敏','女','2002-3-8','计算机系')
insert into student values('0811104','张小红','女','2003-1-10','计算机系')
insert into student values('0821101','张立','男','1998-10-12','信息管理系')
insert into student values('0821102','吴宾','女','1999-3-20','信息管理系')
insert into student values('0821103','张海','男','2000-6-3','信息管理系')
insert into student values('0831101','钱小平','女','2000-11-9','通信工程系')
insert into student values('0831102','王大力','男','1999-5-6','通信工程系')
insert into student values('0831103','张珊珊','女','2001-2-26','通信工程系')


insert into course values('C001','高等数学',4,1)
insert into course values('C002','大学英语',3,1)
insert into course values('C003','大学英语',3,2)
insert into course values('C004','计算机文化学',2,2)
insert into course values('C005','Java',2,3)
insert into course values('C006','数据库基础',4,5)
insert into course values('C007','数据结构',4,4)
insert into course values('C008','计算机网络',4,4)

insert into sc values('0811101','C001',96)
insert into sc values('0811101','C002',80)
insert into sc values('0811101','C003',84)
insert into sc values('0811101','C005',62)
insert into sc values('0811102','C001',92)
insert into sc values('0811102','C002',90)
insert into sc values('0811102','C004',84)
insert into sc values('0821102','C001',76)
insert into sc values('0821102','C004',85)
insert into sc values('0821102','C005',73)
insert into sc values('0821102','C007',NULL)
insert into sc values('0821103','C001',50)
insert into sc values('0821103','C004',80)
insert into sc values('0831101','C001',50)
insert into sc values('0831101','C004',80)
insert into sc values('0831102','C007',NULL)
insert into sc values('0831103','C004',78)
insert into sc values('0831103','C005',65)
insert into sc values('0831103','C007',NULL)