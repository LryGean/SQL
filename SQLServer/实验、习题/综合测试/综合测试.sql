use ����ɹ�
go

--1�����������ɫ�����������ƺͲ��ء�
select pname �����,city ������
from P
where color='��'

--2�������Ӧ����J1�Ĺ�Ӧ�̺���, ��ѯ������չ�Ӧ�̺�������
select S.sno ��Ӧ�̺���
from  J join S on J.city=S.city 
where jno='J1'
order by S.sno

--3���������ɹ�������QTY������ǰ���ʶ�����ȫ���ɹ���Ϣ��
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

--4��������й�Ӧ'P2'����Ĺ�Ӧ���������绰��
select sname ����,tel �绰 
from  S
where city in (select city from P where pno = 'P2')

--5������绰����Ϊ��6602����ͷ�Ĺ�Ӧ�̵������� 
select sname ����
from  S
where tel like '6602%'

--6�����ʹ�ù�Ӧ��S1��Ӧ������Ĺ���������
select count(jno)
from  SPJ
group by sno
having sno='S1'

--7�����ÿ������ʹ����������������ع��̺ź��������� 
select J.jno ���̺�,sum(QTY) ������
from  SPJ join J on spj.jno=J.jno 
group by j.jno


--8������ص��ڱ����Ĺ������ơ� ��ʹ�õ�������ƺͲ��ء� 
select jname ��������,pname �����,J.city 
from J join SPJ on J.jno=spj.jno join P on spj.pno=p.pno 
where J.city='����'

--9�������Ӳ�ѯ���ʹ���ɹ�Ӧ��S1�ṩ����Ĺ������ơ� 
select JNAME ������
from  J
where  jno in (select jno from SPJ where sno = 'S1')

--10�������Ӧ������Ϊÿ����������Ӧ�����������
select qty
from  SPJ
where sno in (select sno from S where sname='����')

--11) �����P6��������Ϊ10��
update P
set weight =10
where pno='p6'

--12) ���һ��������������ΪP7������Ϊ��������ɫ����7������Ϊ���
insert into p
values ('P7','����','��ɫ',7,'���')