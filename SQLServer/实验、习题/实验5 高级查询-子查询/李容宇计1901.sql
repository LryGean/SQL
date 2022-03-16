use 教学管理
go

/*1.返回一个值的基于比较测试的子查询*/
--1)查询与“张海涛”同班的学生的学号和姓名。
select sno	学号,sname 姓名
from Student
where class in (select class from Student where sname='张海涛') and sname != '张海涛'  

--2)查询与“SQL Server应用开发”课程学分相同的课程编号和课程名称。
select cno 课程号,cname  课程名称
from Course
where credit in (select credit from Course where cname='SQL Server应用开发') and cname != 'SQL Server应用开发'

--3)查询与“张兰”教师不在同系的男教师姓名。
select tname 姓名
from Teacher
where dept not in (select dept from Teacher where tname ='张兰') and sex='男'

--4)查询教师中比“刘伟”年龄大，比“李力”年龄小的教师编号、姓名及职称。
select tno 教师编号,tname 姓名,prof 职称
from Teacher
where age > some (select age from Teacher where tname='刘伟')
and age < some (select age from Teacher where tname='李力')

/*2.返回一组值的基于集合的子查询*/
--1)查询讲授课程号为C5的教师姓名。
select tname
from Teacher
where tno in (select tno from TC where cno='C5')

--2)使用IN谓词查询所有学生都没有选修的课程编号和课程名。
select cno 课程编号,cname 课程名
from Course
where cno != all(select cno from SC where sno is not null)

--3)查询选修了S4号学生选修课程的学生学号和姓名
select distinct sno 学号,(select sname from Student where sno=SC.SNO) 姓名
from SC
where cno in (select cno from SC where sno='S4') and sno != 'S4'

/*3.相关子查询*/
--1)使用EXISTS谓词查询没有讲授课程号为C5课程的教师姓名和所在系。
select tname 姓名,dept 系
from Teacher
where not exists (select * from TC where cno='C5' and tno=Teacher.tno)

--2)使用EXISTS查询所有未选修课程的学生名单，返回学生学号和姓名。
select sno 学号,sname 姓名
from Student
where not exists (select * from SC where sno=Student.SNO)
order by sno desc

--3)查询成绩比该课程平均成绩高的学生的学号和成绩。
select sno 学号,cno 课程编号,score 成绩
from SC s1
where score >=all (select avg(score) from SC s2  where s2.sno=s1.sno group by cno)

/*思考题*/
--1.查询教师“张兰”讲授课程的课程名称。
/*
select cname 课程名称
from Course
where cno in (select cno from TC where tno in
(select tno from Teacher where tname='张兰'))
*/

--2.查询其他系中比计算机系所有教师工资都高的教师姓名、工资及所在系。
/*
select tname 姓名,sal 工资,dept 系
from Teacher t1
where sal > some (select max(sal) from Teacher t2 where dept='计算机')
*/

--3.选做：查询同时选修了“C语言程序设计”和“微机原理与技术”的学生姓名。
/*
select distinct (select sname from Student where sno=s1.sno) 姓名
from SC s1
where sno in (select sno from SC where cno in (select cno from Course where cname in('C语言程序设计','微机原理与技术')) group by sno having count(cno)=2)
*/