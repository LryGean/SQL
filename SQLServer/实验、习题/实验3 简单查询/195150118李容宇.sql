use 教学管理
go

/*1.指定列或全部列查询*/
--1)查询Student学生表中全体学生的详细信息。
select *
from Student

--2)查询所有学生的姓名及其出生年份。
select sname 姓名,year(birthday) 出生年份
from Student

--3)查询所有教师的姓名和性别。
select tname 教师姓名,sex 性别
from Teacher

--4)查询课程的课程编号、课程名及学分。
select cno 课程编号,cname 课程名,credit 学分
from Course

--5)查询有学生选修的课程号
select distinct cno 课程号
from SC

/*2.按条件查询*/
--1)查询学时为4的课程名称。
select cname 课程
from Course
where credit=4

--2)查询学号为S3的学生姓名、系名及年龄。
select sname 姓名,dept 系名,year(getdate())-year(birthday) 年龄
from Student
where sno='S3'

--3)查询考试成绩有不及格的学生学号。
select sno 成绩不合格的学生学号
from SC
where score < 60

--4)查询有选修课程没考试的学生学号和课程号。
select sno 学号,cno 课程号
from SC
where score is null

--5)查询考试成绩有75-85分之间的学生学号和成绩。
select sno 学号,score 成绩
from SC
where score between 75 and 85

--6)查询年龄在20-22岁之间的学生的姓名、系别和年龄。
select sname 姓名,dept 系别,year(getdate())-year(birthday) as 年龄
from Student
where year(getdate())-year(birthday) between 20 and 22

--7)查询所有姓李或姓王的学生的姓名、学号和性别。
select sname 姓名,sno 学号,sex 性别
from Student
where sname like '[李王]%'

--8)查询名字中第二个字为“晓”字的男生姓名和系别。
select sname 姓名,sno 学号,dept 系别
from Student
where sex='男' and sname like '_[晓]%'

--9)查询薪水在3000以上的信息系教师姓名。（薪水=工资+岗位津贴）
select tname 教师姓名
from Teacher
where dept='计算机' and (sal+comm) >3000

--10)查询计算机和通信的教师姓名及年龄。
select tname 教师姓名,age 年龄
from Teacher
where dept in ('计算机','通信')

/*3.对查询结果排序*/
--1)查询学生信息，按照出生日期降序排列。
select *
from Student
order by birthday desc

--2)查询计算机、通信学生的姓名、系名，结果按系名升序、姓名降序排序。
select sname 姓名,dept 系名
from Student
where dept in('计算机','通信')
order by dept asc,sname desc

--3)查询所有有课程号C2成绩的学生的学号、课程号和成绩，并按成绩降序排序。
select sno 学号,cno 课程号,score 成绩
from SC
where cno='C2'
order by score desc

--4)查询学号为S2的学生参加考试的成绩，结果按照成绩降序排列。
select score
from SC 
where sno='S2'
order by score desc

/*4.使用聚集函数的查询*/
--1)查询计算机学生的总人数。
select count(*) 人数
from Student

--2)查询C3课程考试的成绩最高分及最低分。
select CNO,max(score) 最高分,min(score) 最低分
from SC
group by CNO
having CNO='C3'

--3)查询学号为S1的学生所有课程的平均成绩。
select avg(score) 平均成绩
from SC
where sno='S1'

/*
select avg(SCORE) 平均成绩
from SC
group by SNO
having SNO='s1'
*/

--4)查询参加了C1课程考试的学生人数。
select count(*) 参加C1考试的人数
from SC
where cno='C1' and score is not null

--5)查询所有姓王的计算机教师人数。
select count(*) 人数
from Teacher
where tname like '王%' and dept = '计算机'

/*5.分组统计查询*/
--1)查询学生各个性别及其人数。
select sex 性别,count(*) 人数
from Student
group by sex

--2)查询各个系各个性别教师的人数。
select dept 系别,sex 性别,count(sex)人数
from Teacher
group by dept,sex

--3)查询每个学生的学号及所有考试的平均成绩。
select SNO 学号,avg(SCORE) 平均成绩
from SC
group by SNO

--4)查询各门课程的课程号及选课人数。
select CNO 课程号,count(CNO) 选课人数
from SC
group by CNO 

--5)查询选修了两门以上课程的学生学号和平均成绩。
select SNO 学号,avg(SCORE) 平均成绩
from SC
group by SNO
having count(CNO)>=2

--6)查询所有课程考试成绩均及格的学生学号。
select SNO 学号
from SC
group by SNO
having min(SCORE)>= 60

/*思考*/
--1.查询至少有4个同学选修的课程号。
/*
select CNO 课程号
from SC
group by CNO
having count(SNO)>=4
*/

--2.查询选修了两门以上课程的学生学号。
/*
select SNO
from SC
group by SNO
having count(CNO)>=2
*/
--3.解释下列ORDER BY子句的作用。
--1)ORDER BY SNO, SEX
--解释：对学号性别进行升序排列

--2)ORDER BY AGE, PROF DESC
--解释：对教师年龄升序、职称降序排列

--4.解释下列GROUP BY子句的作用。
--1)GROUP BY SEX
--解释：对性别进行分组

--2)GROUP BY AGE, PROF
--解释：先对年龄分组，再按职称进行分组