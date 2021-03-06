USE [Students]
GO
/****** Object:  Table [dbo].[学生表]    Script Date: 03/03/2021 10:13:20 ******/
CREATE TABLE [dbo].[学生表](
	[学号] [int] NULL,
	[姓名] [varchar](20) NULL,
	[性别] [char](2) NULL,
	[班级] [varchar](20) NULL,
	[科目] [varchar](20) NULL,
	[成绩] [int] NULL
) ON [PRIMARY]
GO

insert into 学生表 
select 1,'刘强','男','计0801','C语言',70 union
select 2,'王拾遗','男','通信0803','C语言',55 union
select 3,'巴洁','女','计0801','SQL基础',84 union
select 1,'刘强','男','计0801','SQL基础',90 union
select 1,'刘强','男','计0801','英语',89 union
select 3,'巴洁','女','计0801','C语言',65 union
select 4,'吴二强','男','通信0801','C语言',NULL union
select 2,'王拾遗','男','通信0803','SQL基础',92 union
select 3,'巴洁','女','计0801','英语',83 union
select 4,'吴二强','男','通信0801','英语',50 union
select 5,'王五','男','通信0801','英语',NULL
GO
