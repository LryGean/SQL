use 零件采购
go

--1）查出所有绿色零件的零件名称和产地。
select pname 零件名,city 产地名
from P
where color='绿'

--2）查出供应工程J1的供应商号码, 查询结果按照供应商号码排序。
select S.sno 供应商号码
from  J join S on J.city=S.city 
where jno='J1'
order by S.sno

--3）查出零件采购数量（QTY）最多的前三笔订单的全部采购信息。
select top 3 with ties *
from  SPJ
where QTY in (select top 3 with ties QTY 
              from SPJ 
              group by QTY 
              order by QTY desc)
order by QTY desc

select top 3 with ties *
from SPJ
order by qty desc

--4）查出所有供应'P2'零件的供应商姓名及电话。
select sname 姓名,tel 电话 
from  S
where city in (select city from P where pno = 'P2')

--5）查出电话号码为‘6602’开头的供应商的姓名。 
select sname 姓名
from  S
where tel like '6602%'

--6）查出使用供应商S1供应的零件的工程总数。
select count(jno)
from  SPJ
group by sno
having sno='S1'

--7）查出每个工程使用零件的数量，返回工程号和总数量。 
select J.jno 工程号,sum(QTY) 总数量
from  SPJ join J on spj.jno=J.jno 
group by j.jno


--8）查出地点在北京的工程名称、 所使用的零件名称和产地。 
select jname 工程名称,pname 零件名,J.city 
from J join SPJ on J.jno=spj.jno join P on spj.pno=p.pno 
where J.city='北京'

--9）利用子查询查出使用由供应商S1提供零件的工程名称。 
select JNAME 工程名
from  J
where  jno in (select jno from SPJ where sno = 'S1')

--10）查出供应商黎明为每个工程所供应零件的数量。
select qty
from  SPJ
where sno in (select sno from S where sname='黎明')

--11) 将零件P6的重量改为10。
update P
set weight =10
where pno='p6'

--12) 添加一种新零件，零件号为P7，名称为长钉，银色，重7，产地为天津。
insert into p
values ('P7','长钉','银色',7,'天津')