--1.	ʹ��T-SQL��������ݿ⡰��ѧ����������ѡ�������Ĭ�����á�
create database ��ѧ����
go

--ѡ��ʹ�õ����ݿ�
use ��ѧ����
go
--2.	�����ݿ��ѧ�����У�ʹ��T-SQL������������ݿ����ʦ��Teacher��ѧ����Student���γ̱�Course��ѡ�α�SC���ڿα�TC��
--������ʦ��
create table Teacher
(
	tno   char(2)     not null primary key,
	tname char(8)     not null,
	sex   char(2)     check(sex='��' or sex='Ů'),
	age   tinyint     check(age > 0),
    prof  char(10)    check(prof='����' or prof='��ʦ' or prof='������' or prof='����'),
	sal   smallint    check(sal>0)	default 2000,
	comm  smallint    check(comm>=0),
	dept  varchar(20) 
)

--����Student��
create table Student
(
	sno	     char(8) not null primary key,        --�м�Լ��
	sname	 char(8) not null,
	sex      char(2) check(sex='��' or sex='Ů'), --�м�Լ��
	birthday datetime,
    dept     varchar(20),
	class    varchar(10)
)

--�����γ̱�
create table Course
(
	cno       char(5)     not null primary key,
	cname     varchar(30) not null,
	credit    tinyint,
	semester  tinyint,
)

--����ѡ�α�
create table SC
(
	id  int     identity(1,1) not null  primary key,
	sno char(8) not null,
	cno char(5) not null,
	score tinyint check(score>0 and score<100),
	foreign key (sno) references Student(sno),
	foreign key (cno) references Course(cno),
)

--�����ڿα�
create table TC
(
	id  int     identity(1,1) not null,
	tno char(2) not null,
	cno char(5) not null
)

/*3.	ʹ��T-SQL�����޸����ݿ��ѧ����������ݱ�
��	���������ݱ�Student�����ѧ���С��ж������£�
������NATIVE
�������ͼ����ȣ�CHAR(40)
�Ƿ��NULL��NOT NULL
*/
alter table Student add native char(40) not null

/*��	�޸��������ݱ�Student�еĶ��塣
������NATIVE
�������ͼ����ȣ�CHAR(10)
�Ƿ��NULL��NULL
*/
alter table Student alter column native char(10) null

/*��	ɾ�����ݿ��Student�е�NATIVE�С�*/
alter table Student drop column native

/*��	Ϊ�������ݱ�Course�е�CREDIT�����Լ��CK_CREDIT����֤ѧ�ִ����㡣*/
alter table Course
add constraint CK_credit check(credit>0)

/*��	Ϊ�������ݱ�Teacher�е�COMM�����Ĭ��ֵΪ0��Լ����ΪDF_COMM��*/
alter table Teacher
add constraint DF_comm default(0) for comm

/*��	Ϊ�������ݱ�TC�е� TNO���������Teacher������Լ��FK_TC_TNO��CNO���������Course������Լ��FK_TC_CNO��*/
alter table TC
add constraint FK_TC_tno foreign key (tno)references Teacher(tno)

alter table TC
add constraint FK_TC_cno foreign key (cno)references Course(cno)

/*��ɾ�����ݱ�Teacher�е�Լ��DF_COMM��*/
alter table Teacher
drop constraint DF_comm

/*4.ɾ�����ݱ�TC��*/
drop table TC

/*˼��
1.һ�����ݿ��е����ݱ��������ͬ�ı�����ͬһ���ݱ��У������ƿ���ͬ����
��һ�����ݿ��е����ݱ���������ͬ�ı�����
ͬһ���ݱ��У������Ʋ�����ͬ����
2.��USE ��ѧ����������ʲô���壿�����书����ͬ��ͼ�ι��߲�����ʲô��
�𣺡�USE ��ѧ���������ʾѡ��ʹ�ý�ѧ�������ݿ⡣
չ�����ݿ⣬ѡ��Ҫʹ�õ����ݿ⡣
3.�����¶��壺
CREATE TABLE TEST
(
	ITEM1 CHAR(10),
	ITEM2 NCHAR(10),
	ITEM3 NCHAR(20),
	ITEM4 NVARCHAR(20)
)
��ITEM1��ITEM2��ռ���̿ռ��ʽ�����ֽڣ��Ƿ���ͬ��
��ITEM1��ռ���̿ռ��ʽ10 �ֽڣ�ITEM2��ռ���̿ռ��ʽ20�ֽڡ�
����ͬ��char(n)��ʾ�ַ������ռ�Ϊn�ֽڣ�С��n�ֽڵ�ʱ��ϵͳ�Զ��ں�߲��ո�nchar(n)��ʾ�ַ������ռ�Ϊ2n�ֽڣ�С��2n�ֽڵ�ʱ��ϵͳ�Զ��ں�߲��ո�
��ITEM3��ITEM4��ռ���̿ռ��ʽ�����ֽڣ��Ƿ���ͬ��
��ITEM3��ռ���̿ռ��ʽ20�ֽ�,ITEM4��ռ���̿ռ��ʽ42�ֽڡ�
����ͬ��nchar(n)��ʾ�ַ������ռ�Ϊ2n�ֽڣ�С��2n�ֽڵ�ʱ��ϵͳ�Զ��ں�߲��ո�nvarchar(n)�洢�ռ�Ϊ2*�ַ���+2�ֽڶ��⿪����
�������ITEM1��Ӧ���������������ַ�����12345678901��������Ϊʲô��
�𣺲����ԣ���Ϊ��12345678901����11���ֽڣ�����char(10)�����洢�ռ�10�ֽڡ�
4.��ѧ�������ݿ��еı�ɾ����˳��������У�ɾ��˳��Ӧ����ʲô��
����˳�������ɾ���ı�����������������������Լ�����������ɾ��������ڵı�Ȼ����ɾ�������õı�
*/