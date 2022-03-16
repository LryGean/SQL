use Students
go

--1.查询SC表中的全部数据
select *
from SC

--2.计算机系学生的姓名和性别。
select sname 姓名,sex 性别
from Student

--3.成绩在70~80分的学生的学号、课程号和成绩
select sno 学号,cno 课程号,grade 成绩
from SC
where grade>=70 and grade <=80

--4.查询第2学期开设的学分在3~5的课程的课程名和学分
select cname 课程名,credit 学分
from course
where semester=2 and (credit>=3 and credit <=5)

--5.查询姓张和姓王学生的详细信息
select *
from Student
where sname like '[张王]%'
order by  sname asc

--6.查询名字的第二个字是"勇"和"大"的学生姓名
select sname
from Student
where sname like '_[勇大]%'

--7.查询还没有考试的课程的课程号
select distinct cno 
from SC
where grade is null

--8.查询C001课程的最高分和最低分
select max(grade) 最高分,min(grade) 最低分
from SC
where cno='C001'

--9.统计每个系的学生人数
select dept 系,count(*) 人数
from Student
group by dept

--10.统计每门课程的选课人数和考试最高分
select cno 课程号,count(*) 人数,max(grade) 最高分
from SC
group by cno

--11.统计每个学生的选课门数和考试总成绩,并按选课门数升序显示结果
select sno 学号,count(*) 选课门数,sum(grade) 考试总成绩
from SC
group by sno
order by count(cno)

--12.查询选修C002课程的学生的姓名和所在系
select sname 姓名,dept 系别
from Student s join SC on s.Sno = SC.Sno
where cno='C002'

--13.查询成绩80分以上的学生的姓名、课程号和成绩，并按成绩降序排列结果
select s.sname 姓名,SC.cno 课程号,SC.grade 成绩 
from Student s join SC on s.Sno = SC.Sno
where grade>80
order by grade desc

--14.查询选课门数最多的前两位学生,列出他们的学号和选课门数
select TOP 2 WITH TIES s.sno 学号,count(SC.cno) 选课门数
from Student s join SC on s.Sno = SC.Sno
group by s.sno
order by count(SC.cno)


--15.查询Java考试成绩最高的学生的姓名和成绩
select Top 1 with ties s.Sname 姓名,SC.Grade 成绩
from Student s join SC on s.Sno=SC.Sno join Course c on SC.Cno=c.Cno
where c.Cname='Java'
order by SC.Grade desc

--16.查询与Java在同一学期开设的课程的课程名和开课学期
select c2.Cname 课程名,c2.Semester 开课学期
from Course c1 join Course c2 on c1.Semester=c2.Semester
where c1.Cname='Java'

--17.查询与李勇在同一个系学习的学生的姓名和所在系
select s2.Sname 姓名,s2.Dept 系
from Student s1 join Student s2 on s1.Dept=s2.Dept
where s1.Sname='李勇' and s1.Sname != s2.Sname

--18.查询没人选的课程的课程号和课程名
select distinct c.Cno 课程号,c.Cname 课程名
from SC join Course c on SC.Cno=c.Cno
where Grade is null

--19.查询计算机系没有选课的学生姓名
select distinct s.Sname 姓名
from Student s join SC on s.Sno=SC.Sno join Course c on SC.Cno=c.Cno
where Dept='计算机系'

--20查询有考试成绩的所有学生的姓名、选修课名称及考试成绩，要求将查询结果放在一张新的永久表（假设新表名为new_sc）中，新表的列名分别为Student_Name、Course_Name和Grade。
select (select sname from Student where sno=s1.Sno) Student_Name,(select cname from Course where cno=s1.Cno) Course_Name,grade Grade
into new_sc
from SC s1
where grade is not null
--21.查询每个系年龄大于20的学生人数，并将结果保存到一个新的永久表Dept_Age中。
select dept 系,count(dept) 人数
into Dept_Age
from Student
where year(getdate())-year(Birthday)>20
group by dept

--22.创建一个新表，表名为test，其中包含3个列：COL1、COL2和COL3。其中，
/*
	COL1：整型，允许空值。
	COL2：普通编码定长字符型，长度为10，不允许空值。
	COL3：普通编码定长字符型，长度为10，允许空值。
	试写出按行插入如下数据的语句，见表6-11。
				表6-11 需要插入的数据
				COL1	COL2	COL3
				NULL	 B1		NULL
				 1		 B2		 C2
				 2		 B3		NULL
*/
create table test
(
	COL1 int,
	COL2 nchar(10) not null,
	COL3 nchar(10)
)
insert into test(COL1,COL2,COL3)
values (NULL,'B1',Null),(1,'B2','C2'),(2,'B3',NULL)

--23.将所有选修C001课程的学生的成绩加10分。
update SC
set Grade=Grade+10
where cno='C001'

--24.将计算机系所有修“计算机文化”课程的学生的成绩加10分
update SC
set Grade=Grade+10
where cno in (select cno from Course where cname='计算机文化')

--25.删除成绩小于50分的学生的选课记录
delete from SC
where Grade < 50
--26.删除计算机系Java考试成绩不及格学生的Java选课记录。
delete from SC
where Grade < 60 and cno in (select cno from Course where cname='Java')  and sno in (select sno from Student where dept='计算机系')

--27.删除没人选修的课程的基本信息。
--①
delete from Course
where cno in (select cno from sc where Grade is NULL)

--②
delete from Course from Course c join sc on c.cno=sc.cno
where sc.cno is null



