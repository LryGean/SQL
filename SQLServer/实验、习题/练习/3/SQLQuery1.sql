use Students
go

--查询计算机系选修C002的学生姓名、性别
select sname,sex 
from student
where dept='计算机系' and sno in(
select sno
from SC
where cno='C002'
)


--统计选修了Java 课程的这些学生的选课门数和平均成绩
select sno 学号,count(*) 选课门数,avg(grade) 平均成绩
from SC where sno in(
	select sno from SC join Coures c on c.cno=SC.cno
	where
)

--查询选了“Java”课程的学生学号
select
from

--查询选了"C004"且高于此课程的平均成绩
select sno 学号,grade 成绩
from sc
where cno='C004' and grade>(
	select avg(grade) from sc where cno='C004'
)

--查询的二学期开设的学分最高的课程的课程名和学分

--查询考试平均成绩高于全体学生的总平均成绩的学生的学号和平均成绩
select Sno 学号,avg(grade) 平均成绩
from SC
group by Sno
having avg(grade) > (select avg(grade) 
from SC)

/*相关子查询*/
--查询学生姓名、所在系和该学生选的课程门数
select sname,dept,(
	select count(*) from SC where sno= student.sno
) as Countcno
from Student


--例7-27 查询至少选了C001和C002两门课程的学生学号。
SELECT T1.Sno 
FROM (SELECT * FROM SC WHERE Cno = 'C001') AS T1 
JOIN (SELECT * FROM SC WHERE Cno = 'c002') AS T2 
ON T1.Sno=T2.Sno



/*复习*/
--不相关子查询
--查询没有选修了“Java”课程的学生
select *
from student
where sno  not in (
	select sno from SC where cno in(
		select cno from course where cname='Java'
	)
)

--相关子查询
select *
from student
where not exists(
	select * from SC where sno=student.sno and cno in(
		select cno from course where cname='Java'
	)
)