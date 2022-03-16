use Students
go

--1
select * 
into a
from student
where sex='男'

--2 复制结构
select *
into 同框架
from student
where 1=0

--3插入数据
insert into student
values('1','他','男','2007-12-2','CS')

--更新数据
update 同框架 set dept='CS'
