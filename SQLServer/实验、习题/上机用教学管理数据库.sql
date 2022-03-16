/*1.创建数据库“教学管理”，其他选项均采用默认设置。*/
CREATE DATABASE 教学管理
GO

/*在数据库教学管理中，创建如下数据库表。
教师表：Teacher，学生表：Student，课程表：Course，
选课表SC，授课表：TC。*/
/*选择数据库教学管理*/
USE 教学管理
GO

/*创建Teacher表*/
CREATE TABLE Teacher
(
	TNO CHAR(2) NOT NULL PRIMARY KEY,
	TNAME CHAR(8) NOT NULL,
	SEX CHAR(2) CHECK(SEX='男' OR SEX='女'),
	AGE TINYINT CHECK(AGE>0),
	PROF CHAR(10) CHECK(PROF IN ('助教','讲师','副教授','教授')),
	SAL SMALLINT DEFAULT 2000 CHECK(SAL>0),
	COMM SMALLINT CHECK(COMM>=0),
	DEPT VARCHAR(20)
)
GO

/*创建Student表*/
CREATE TABLE Student
(
	SNO CHAR(8) NOT NULL,
	SNAME CHAR(8) NOT NULL,
	SEX CHAR(2),
	BIRTHDAY DATETIME,
	DEPT VARCHAR(20),
	CLASS VARCHAR(10),
	PRIMARY KEY(SNO),
	CONSTRAINT CK_STUDENT_SEX CHECK(SEX='男' OR SEX='女')
)
GO

/*创建Course表*/
CREATE TABLE Course
(
	CNO CHAR(5) NOT NULL PRIMARY KEY,
	CNAME VARCHAR(30) NOT NULL,
	CREDIT TINYINT CHECK(CREDIT>0),
	SEMESTER TINYINT
)
GO

/*创建SC表*/
CREATE TABLE SC
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	SNO CHAR(8) NOT NULL FOREIGN KEY REFERENCES Student(SNO),
	CNO CHAR(5) NOT NULL,
	SCORE TINYINT CHECK(SCORE>=0 AND SCORE<=100),
	CONSTRAINT FK_SC_CNO FOREIGN KEY(CNO) REFERENCES Course(CNO)
)
GO

/*创建授课表*/
CREATE TABLE TC
(
	ID INT IDENTITY(1,1),
	TNO CHAR(2) NOT NULL FOREIGN KEY REFERENCES Teacher(TNO),
	CNO CHAR(5) NOT NULL FOREIGN KEY REFERENCES Course(CNO)
)
GO

/*添加测试数据*/
--添加教师信息
insert into Teacher values('T1','李力','男',47,'教授',1500,3000,'计算机')
insert into Teacher values('T2','王平','女',28,'讲师',800,1200,'通信')
insert into Teacher values('T3','刘伟','男',30,'讲师',900,1200,'计算机')
insert into Teacher values('T4','张雪兰','女',51,'教授',1600,3000,'电信')
insert into Teacher values('T5','张兰','女',39,'副教授',1300,2000,'通信')
go

--添加学生信息
insert into Student values('S1','赵毅','女','1990-12-1','计算机','计091')
insert into Student values('S2','钱晓','男','1988-2-23','通信','通信092')
insert into Student values('S3','张晓明','男','1989-9-11','通信','通信091')
insert into Student values('S4','李思思','男','1991-2-11','电信','电信1001')
insert into Student values('S5','周武','男','1988-7-2','计算机','计092')
insert into Student values('S6','吴丽','女','1990-6-5','电信','电信1001')
insert into Student values('S7','范思孟','女','1987-3-4','通信','通信091')
insert into Student values('S8','孙俪','女','1991-7-2','通信','通信092')
insert into Student values('S9','张海涛','男','1990-8-30','通信','通信092')
insert into Student values('S10','王青山','男','1989-5-2','计算机','计091')
go

--添加课程信息
insert into Course values('C1','C语言程序设计',4,1)
insert into Course values('C2','微机原理与技术',3,5)
insert into Course values('C3','数字逻辑',3,3)
insert into Course values('C4','SQL Server应用开发',3,1)
insert into Course values('C5','操作系统',4,6)
insert into Course values('C6','Java面向对象程序设计',4,3)
insert into Course values('C7','计算机导论',2,1)
go

--添加授课信息
insert into TC values('T1','C1')
insert into TC values('T1','C4')
insert into TC values('T2','C5')
insert into TC values('T3','C1')
insert into TC values('T4','C2')
insert into TC values('T4','C3')
insert into TC values('T5','C5')
insert into TC values('T5','C7')
insert into TC values('T3','C5')
go

--添加选课信息
insert into SC values('S1','C1',90)
insert into SC values('S1','C2',85)
insert into SC values('S2','C5',57)
insert into SC values('S2','C6',80)
insert into SC values('S2','C7',null)
insert into SC values('S3','C1',75)
insert into SC values('S3','C2',70)
insert into SC values('S3','C4',85)
insert into SC values('S4','C1',93)
insert into SC values('S4','C2',85)
insert into SC values('S4','C3',83)
insert into SC values('S5','C2',55)
go

