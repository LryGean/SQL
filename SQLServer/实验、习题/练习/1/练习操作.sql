use Students
go

--(1)查询每个学生所有科目的平均成绩与实际参加考试门数
select 学号,avg(成绩) 平均成绩,count(成绩) 实考门数
from 学生表
group by 学号

--(2)查询每个班每个科目的平均成绩
select 班级,科目,avg(成绩) 平均成绩
from 学生表
group by 班级,科目

--(3)查询每个班每个科目实考人数与应考人数
select 班级,科目,count(成绩) 实考人数,count(学号) 应考人数
from 学生表
group by 班级,科目

--(4)查询哪门科目参加考试的学生都及格了
select 科目
from 学生表
group by 科目
having min(成绩)>=60

