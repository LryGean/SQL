/*引用实验2的数据库*/
use Students
go

select sno,sname,dept
from student

select *
from student

select sno,sname,sex,birthday,dept 
from student

select sno 学号,姓名=sname,sex 性别,出生日期=birthday,dept 系别
from student

select year(getdate())-year(Birthday) 年龄
from student

/*distinct消除取值相同的重复行*/
select distinct sno 学号,grade 成绩
from sc
where grade between 60 and 80
/*等价*/
select distinct sno 学号,grade 成绩
from sc
where grade >=60 and grade <= 80

/*查一下姓’张‘的学生的详细信息*/
/*姓张的同学*/
select *
from student
where sname like '张%'
/*姓张李的同学*/
select *
from student
where sname like '[张李]%'
/*姓张两个字的同学*/
select *
from student
where rtrim (sname) like '张_'

/*查询2000年生的学生*/
select sno,sname,birthday,dept
from student
where birthday<'2000-1-1'

/*查询缺考的学生*/
select sno,cno
from sc
where grade is null

/*查询姓张李刘姓名中含有小的名字*/
select sno,sname
from student
where sname like '[张李刘]%小%'

/*计算机系的全体男生*/
select sname
from student
where dept='计算机系' and sex='男'

/*优先级：not > and > or*/
select *
from student
where not sex='男' and dept='计算机系' or dept='通信工程系'

/*将学生按年龄升序排列,desc为降序*/
select *,year(getdate())-year(birthday) age
from student 
order by year(getdate())-year(birthday)

/*先按系分块,同系的按生日降序*/
select *
from student
order by dept,birthday desc,sex

select sno 学号,cno 课程,grade 成绩
from sc
where cno='C002' and grade between 80 and 90


select count(*) 总行数,count(sno) 学号个数,
       count(distinct sno) 不重复的学号个数
from sc
/*count忽略null值*/
select count(*) 总行数,count(grade) 成绩个数,
       count(distinct grade) 不重复的成绩个数
from sc

select sum(grade)
from sc
where sno='0811101'

select max(grade),min(grade)
from sc
where cno='C001'

/*查询每个系的人数*/
select count(*) 计算机系的人数
from student
where dept='计算机系'
/*分组group by*/
/*每个系的人数*/
select dept 系别,count(*) 人数
from student
group by dept

select dept 系别,max(year(getdate())-year(birthday)) 年龄最大
from student
group by dept

/*带有where子句的分组*/
/*每个系别的女生人数*/
select dept 系别,count(*) 人数 
from student
where sex='女'
group by dept

/*order by放最后*/