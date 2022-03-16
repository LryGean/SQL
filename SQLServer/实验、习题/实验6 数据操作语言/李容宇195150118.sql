use 教学管理
go

/*1.录入数据至数据库表*/
--1)新学年到来，有新生入学，请添加记录至表Student。
--添加学生记录，学号“S13”，姓名“吴旭”，性别“男”，出生日期为1990年3月21日，电信专业1001班。
insert into Student
values ('S13','吴旭','男','1990-3-21','电信','电信1001')

--添加学生记录，学号“S11”，姓名“李欣”，性别“女”，出生日期、专业、班级暂不知。
INSERT into Student(sno,sname,sex)
values ('S11','李欣','女')

--2)新教师入职，请添加教师信息至表Teacher。
--  电信专业来了新教师，教师编号为“T6”，姓名“李志新”，男性，44岁，职称暂不知，工资1300，岗位津贴1800。
insert into Teacher(tno,tname,sex,age,sal,comm)
values ('T6','李志新','男','44',1300,1800)

--3)教师申请开课，将授课信息添加至表TC。
--新来教师李志新申请讲授“数字逻辑”课程，请添加授课信息。
insert into TC
select (select tno from Teacher where tname='李志新'),cno
from Course
where cname='数字逻辑'

/*2.修改数据*/
--1)计算机导论课程学分改为3学分。
update Course
set credit =3
where cname='计算机导论'

--2)请将教师张兰职称改为“教授”，工资涨到1500，岗位津贴提高500。
update Teacher
set prof='教授',sal=1500,comm=comm+500
where tname='张兰'

--3)“微机原理与技术”课程考试成绩偏低，每位学生对应成绩提高5分。
update SC
set score += 5
where sno in (select sno from Course where cname='微机原理与技术')

/*3.删除数据*/
--1)由于C7这门课程选课人数太少，暂时停上，请删除选课信息中C7课程的选课信息。
delete from SC
where cno='C7'
--2)删除C7这门课程的授课信息。
delete from TC
where cno='C7'

--3)删除张海涛的选课信息。
delete from SC
where sno in (select sno from Student where sname='v张海涛')

/*4.复制数据库表*/
--1)复制所有职称为副教授或教授的教师信息至新表t_test。
select * 
into t_test
from Teacher
where prof in ('副教授','教授')

--2)把成绩85分以下的学生学号、姓名、课程号和成绩存至新表makeup_s中。
select sno 学号,(select sname from Student where sno=SC.SNO) 姓名,cno 课程号,score 成绩
into makeup_s
from SC
where score < 85

--3)复制表makeup_s的结构为新表temp。
select *
into temp
from makeup_s
where 5=6

--4)将表makeup_s中不及格学生的记录存至temp表中。
insert into temp
select *
from makeup_s
where 成绩 <= 60
