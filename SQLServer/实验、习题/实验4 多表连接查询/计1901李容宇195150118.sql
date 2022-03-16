use 教学管理
go

/*1.内连接查询*/
--1)查询所有选课学生的学号、姓名、选修课程号及考试成绩。
select s.Sno 学号,s.Sname 姓名,SC.Cno 选修课程号,SC.SCORE 考试成绩
from Student s join SC on s.Sno=SC.Sno

--2)查询所有选课学生的学号、姓名、选修课程名称及考试成绩。
select s.Sno 学号,s.Sname 姓名,c.Cname 课程名称,SC.SCORE 考试成绩
from Student s join SC on s.Sno=SC.Sno join Course c on SC.Cno=c.Cno

--3)查询开课课程的课程号、任课教师姓名，结果按课程号排序。
select TC.CNO 课程号,t.TNAME 任课老师名字
from Teacher t join TC on t.TNO=TC.TNO
order by CNO

--4)查询开课课程的课程名称及任课教师姓名。
select Cname 课程名,TNAME 任课老师名字
from Teacher t join TC on t.TNO=TC.TNO join Course c on TC.CNO=c.CNO

--5)查询教授“C语言程序设计”课程的教师姓名、性别及职称。
select t.Tname 教师姓名,SEX 性别,PROF 职称
from Teacher t join TC on t.TNO=TC.TNO join Course c on TC.CNO=c.CNO
where c.CNAME='C语言程序设计'

--6)查询选修了课程的计算机系学生的姓名、选修课程名称及考试成绩。
select s.SNAME 姓名,c.CNAME 选修课名称,SC.SCORE 考试成绩
from Student s join SC on s.SNO=SC.SNO join Course c on SC.Cno=c.Cno
where DEPT='计算机'

--7)统计学生“张晓明”选修课程的门数及平均成绩。
select count(s.SNO) 选课门数,avg(SC.SCORE) 平均数
from Student s join SC on s.SNO=SC.SNO
group by s.SNO,s.SNAME
Having s.SNAME='张晓明'

/*2.自连接*/
--1)查询所有比“刘伟”工资高的教师姓名、工资及刘伟的工资。
select t2.TNAME 姓名,t2.SAL 工资
from Teacher t1 join Teacher t2 on t2.SAL>=t1.SAL
where t1.TNAME='刘伟'
order by t2.SAL

--2)查询与“王青山”同班的学生学号和姓名。
select s2.SNO 学号,s2.SNAME 姓名
from Student s1 join Student s2 on s1.CLASS=s2.CLASS
where s1.SNAME='王青山'

/*3.外连接*/
--1)查询所有学生的选课情况，要求返回学生学号、姓名、选修课程号及成绩（没有选课的学生的选课信息显示为空）。
select s.SNO 学号,s.SNAME 姓名,SC.CNO 选修课程号,SC.SCORE 成绩
from Student s left join SC on s.SNO=SC.SNO

--2)查询所有学生的选课情况，要求返回学生学号、姓名、选修课程名称及成绩（没有选课的学生的选课信息显示为空）。
select s.SNO 学号,s.SNAME 姓名,c.CNAME 选修课程名,SC.SCORE 成绩
from Student s left join SC on s.SNO=SC.SNO left join Course c on SC.CNO=c.CNO 

--3)查询所有未选修课程的学生名单，返回学生学号和姓名。
select s.SNO 学号,s.SNAME 姓名
from Student s left join SC on s.SNO=SC.SNO
where SC.CNO is null

/*思考*/
--1.查询教师“张兰”讲授课程的课程名称。
/*
select t.TNAME 姓名,c.CNAME 授课名称
from Teacher t join TC on t.TNO=TC.TNO join Course c on TC.CNO=c.CNO
where t.TNAME='张兰'
*/

--2.统计选修了课程“微机原理与技术”的每个专业的总成绩和平均成绩，按照平均成绩降序排序。
/*解：
select COUNT(SC.SCORE) 总成绩,avg(SC.SCORE) 平均成绩
from Student s join SC on s.Sno=SC.Sno join Course c on SC.CNO=c.CNO
where c.CNAME='微机原理与技术'
group by DEPT,SCORE
order by SC.SCORE desc
*/

--3.查询所有学生都没有选修的课程号和课程名。 
/*
select c.CNO 课程号,c.CNAME 课程名
from Course c  left join SC on c.CNO=SC.CNO left join Student s on s.SNO=SC.SNO  
where s.SNO is null
*/

--4.选做：查询同时选修了“C语言程序设计”和“微机原理与技术”的学生姓名。
/*
select s.SNAME
from Student s join SC on s.SNO=SC.SNO join Course c on SC.CNO=c.CNO 
where c.CNAME in ('C语言程序设计','微机原理与技术')
group by s.SNAME
Having count(c.CNAME)=2
*/