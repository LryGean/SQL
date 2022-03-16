/*1.�������ݿ⡰��ѧ����������ѡ�������Ĭ�����á�*/
CREATE DATABASE ��ѧ����
GO

/*�����ݿ��ѧ�����У������������ݿ��
��ʦ��Teacher��ѧ����Student���γ̱�Course��
ѡ�α�SC���ڿα�TC��*/
/*ѡ�����ݿ��ѧ����*/
USE ��ѧ����
GO

/*����Teacher��*/
CREATE TABLE Teacher
(
	TNO CHAR(2) NOT NULL PRIMARY KEY,
	TNAME CHAR(8) NOT NULL,
	SEX CHAR(2) CHECK(SEX='��' OR SEX='Ů'),
	AGE TINYINT CHECK(AGE>0),
	PROF CHAR(10) CHECK(PROF IN ('����','��ʦ','������','����')),
	SAL SMALLINT DEFAULT 2000 CHECK(SAL>0),
	COMM SMALLINT CHECK(COMM>=0),
	DEPT VARCHAR(20)
)
GO

/*����Student��*/
CREATE TABLE Student
(
	SNO CHAR(8) NOT NULL,
	SNAME CHAR(8) NOT NULL,
	SEX CHAR(2),
	BIRTHDAY DATETIME,
	DEPT VARCHAR(20),
	CLASS VARCHAR(10),
	PRIMARY KEY(SNO),
	CONSTRAINT CK_STUDENT_SEX CHECK(SEX='��' OR SEX='Ů')
)
GO

/*����Course��*/
CREATE TABLE Course
(
	CNO CHAR(5) NOT NULL PRIMARY KEY,
	CNAME VARCHAR(30) NOT NULL,
	CREDIT TINYINT CHECK(CREDIT>0),
	SEMESTER TINYINT
)
GO

/*����SC��*/
CREATE TABLE SC
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	SNO CHAR(8) NOT NULL FOREIGN KEY REFERENCES Student(SNO),
	CNO CHAR(5) NOT NULL,
	SCORE TINYINT CHECK(SCORE>=0 AND SCORE<=100),
	CONSTRAINT FK_SC_CNO FOREIGN KEY(CNO) REFERENCES Course(CNO)
)
GO

/*�����ڿα�*/
CREATE TABLE TC
(
	ID INT IDENTITY(1,1),
	TNO CHAR(2) NOT NULL FOREIGN KEY REFERENCES Teacher(TNO),
	CNO CHAR(5) NOT NULL FOREIGN KEY REFERENCES Course(CNO)
)
GO

/*��Ӳ�������*/
--��ӽ�ʦ��Ϣ
insert into Teacher values('T1','����','��',47,'����',1500,3000,'�����')
insert into Teacher values('T2','��ƽ','Ů',28,'��ʦ',800,1200,'ͨ��')
insert into Teacher values('T3','��ΰ','��',30,'��ʦ',900,1200,'�����')
insert into Teacher values('T4','��ѩ��','Ů',51,'����',1600,3000,'����')
insert into Teacher values('T5','����','Ů',39,'������',1300,2000,'ͨ��')
go

--���ѧ����Ϣ
insert into Student values('S1','����','Ů','1990-12-1','�����','��091')
insert into Student values('S2','Ǯ��','��','1988-2-23','ͨ��','ͨ��092')
insert into Student values('S3','������','��','1989-9-11','ͨ��','ͨ��091')
insert into Student values('S4','��˼˼','��','1991-2-11','����','����1001')
insert into Student values('S5','����','��','1988-7-2','�����','��092')
insert into Student values('S6','����','Ů','1990-6-5','����','����1001')
insert into Student values('S7','��˼��','Ů','1987-3-4','ͨ��','ͨ��091')
insert into Student values('S8','��ٳ','Ů','1991-7-2','ͨ��','ͨ��092')
insert into Student values('S9','�ź���','��','1990-8-30','ͨ��','ͨ��092')
insert into Student values('S10','����ɽ','��','1989-5-2','�����','��091')
go

--��ӿγ���Ϣ
insert into Course values('C1','C���Գ������',4,1)
insert into Course values('C2','΢��ԭ���뼼��',3,5)
insert into Course values('C3','�����߼�',3,3)
insert into Course values('C4','SQL ServerӦ�ÿ���',3,1)
insert into Course values('C5','����ϵͳ',4,6)
insert into Course values('C6','Java�������������',4,3)
insert into Course values('C7','���������',2,1)
go

--����ڿ���Ϣ
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

--���ѡ����Ϣ
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

