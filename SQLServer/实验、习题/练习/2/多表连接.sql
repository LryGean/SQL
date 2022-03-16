use Students
go

/*交叉*/
select Student.sno 学号,SC.sno 学号,sname 姓名,CNO 课程号,Grade 成绩
from Student cross join SC

/*内连*/
select s.sno 学号,sname 姓名,CNO 课程号,Grade 成绩
from Student s join SC on s.sno = SC.sno

/*三表连接*/
select s.sno 学号,sname 姓名,c.cno 课程号,Grade 成绩
from Student s join SC on s.sno = SC.sno join Course c on SC.cno=c.cno

/*查询选修了“计算机文化”课程的学生姓名。*/
select s.sno 学号,sname 姓名,c.cname 课程名
from Student s join SC on s.sno = SC.sno 
join Course c on SC.cno=c.cno
where c.cname='计算机文化学'

/*内连接*/
select *
from Student S1 join Student S2 on S1.dept = S2.dept
where 

/*查询与刘晨在同一个系学习的学生的姓名和所在的系*/
select S2.sname 姓名,S2.dept 系别
from Student S1 join Student S2 on S1.dept = S2.dept
where S1.sname = '刘晨' and S2.sname != '刘晨'

/*查询与刘晨在同一个性别的学生的姓名和性别*/
select S2.sname 姓名,S2.sex 系别
from Student S1 join Student S2 on S1.sex = S2.sex
where S1.sname = '刘晨' and S2.sname != '刘晨'

/*查询与“数据结构”课程在同一个学期开设的课程的课程名和开课学期(连接条件：同一学期)*/
select C1.Cname 课程名称,C1.Semester

/*外连接*/
--查询所有学生的选课情况，包括没选课的学生。
select *
from student s left outer join sc on s.sno = sc.sno
where sc.sno is null

--统计计算机系每个学生的选课门数，包括没有选课的学生。
select s.sno 学号,count(sc.sno) 选课门数
from Student s left join SC on s.sno = SC.sno
where dept='计算机系'
group by s.sno

--3.查询所有学生都没有选修的课程号和课程名。 （落脚点是课程，用课程表连接其他表，被连接的课程可能出现空值null）
select c.CNO 课程号,c.CNAME 课程名
from Course c  left join SC on c.CNO=SC.CNO left join Student s on s.SNO=SC.SNO  
where s.SNO is null


/*P154上机习题*/
--12.查询选修C002课程的学生的姓名和所在系
select sname
from Student s join SC on s.Sno = SC.Sno
where

--13.查询成绩80分以上的学生的姓名、课程号和成绩，并按成绩降序排列结果

--14.查询选课门数最多的前两位学生的姓名和成绩

--15.

--16.
