use Students
go

--1.��ѯSC���е�ȫ������
select *
from SC

--2.�����ϵѧ�����������Ա�
select sname ����,sex �Ա�
from Student

--3.�ɼ���70~80�ֵ�ѧ����ѧ�š��γ̺źͳɼ�
select sno ѧ��,cno �γ̺�,grade �ɼ�
from SC
where grade>=70 and grade <=80

--4.��ѯ��2ѧ�ڿ����ѧ����3~5�Ŀγ̵Ŀγ�����ѧ��
select cname �γ���,credit ѧ��
from course
where semester=2 and (credit>=3 and credit <=5)

--5.��ѯ���ź�����ѧ������ϸ��Ϣ
select *
from Student
where sname like '[����]%'
order by  sname asc

--6.��ѯ���ֵĵڶ�������"��"��"��"��ѧ������
select sname
from Student
where sname like '_[�´�]%'

--7.��ѯ��û�п��ԵĿγ̵Ŀγ̺�
select distinct cno 
from SC
where grade is null

--8.��ѯC001�γ̵���߷ֺ���ͷ�
select max(grade) ��߷�,min(grade) ��ͷ�
from SC
where cno='C001'

--9.ͳ��ÿ��ϵ��ѧ������
select dept ϵ,count(*) ����
from Student
group by dept

--10.ͳ��ÿ�ſγ̵�ѡ�������Ϳ�����߷�
select cno �γ̺�,count(*) ����,max(grade) ��߷�
from SC
group by cno

--11.ͳ��ÿ��ѧ����ѡ�������Ϳ����ܳɼ�,����ѡ������������ʾ���
select sno ѧ��,count(*) ѡ������,sum(grade) �����ܳɼ�
from SC
group by sno
order by count(cno)

--12.��ѯѡ��C002�γ̵�ѧ��������������ϵ
select sname ����,dept ϵ��
from Student s join SC on s.Sno = SC.Sno
where cno='C002'

--13.��ѯ�ɼ�80�����ϵ�ѧ�����������γ̺źͳɼ��������ɼ��������н��
select s.sname ����,SC.cno �γ̺�,SC.grade �ɼ� 
from Student s join SC on s.Sno = SC.Sno
where grade>80
order by grade desc

--14.��ѯѡ����������ǰ��λѧ��,�г����ǵ�ѧ�ź�ѡ������
select TOP 2 WITH TIES s.sno ѧ��,count(SC.cno) ѡ������
from Student s join SC on s.Sno = SC.Sno
group by s.sno
order by count(SC.cno)


--15.��ѯJava���Գɼ���ߵ�ѧ���������ͳɼ�
select Top 1 with ties s.Sname ����,SC.Grade �ɼ�
from Student s join SC on s.Sno=SC.Sno join Course c on SC.Cno=c.Cno
where c.Cname='Java'
order by SC.Grade desc

--16.��ѯ��Java��ͬһѧ�ڿ���Ŀγ̵Ŀγ����Ϳ���ѧ��
select c2.Cname �γ���,c2.Semester ����ѧ��
from Course c1 join Course c2 on c1.Semester=c2.Semester
where c1.Cname='Java'

--17.��ѯ��������ͬһ��ϵѧϰ��ѧ��������������ϵ
select s2.Sname ����,s2.Dept ϵ
from Student s1 join Student s2 on s1.Dept=s2.Dept
where s1.Sname='����' and s1.Sname != s2.Sname

--18.��ѯû��ѡ�Ŀγ̵Ŀγ̺źͿγ���
select distinct c.Cno �γ̺�,c.Cname �γ���
from SC join Course c on SC.Cno=c.Cno
where Grade is null

--19.��ѯ�����ϵû��ѡ�ε�ѧ������
select distinct s.Sname ����
from Student s join SC on s.Sno=SC.Sno join Course c on SC.Cno=c.Cno
where Dept='�����ϵ'

--20��ѯ�п��Գɼ�������ѧ����������ѡ�޿����Ƽ����Գɼ���Ҫ�󽫲�ѯ�������һ���µ����ñ������±���Ϊnew_sc���У��±�������ֱ�ΪStudent_Name��Course_Name��Grade��
select (select sname from Student where sno=s1.Sno) Student_Name,(select cname from Course where cno=s1.Cno) Course_Name,grade Grade
into new_sc
from SC s1
where grade is not null
--21.��ѯÿ��ϵ�������20��ѧ������������������浽һ���µ����ñ�Dept_Age�С�
select dept ϵ,count(dept) ����
into Dept_Age
from Student
where year(getdate())-year(Birthday)>20
group by dept

--22.����һ���±�����Ϊtest�����а���3���У�COL1��COL2��COL3�����У�
/*
	COL1�����ͣ������ֵ��
	COL2����ͨ���붨���ַ��ͣ�����Ϊ10���������ֵ��
	COL3����ͨ���붨���ַ��ͣ�����Ϊ10�������ֵ��
	��д�����в����������ݵ���䣬����6-11��
				��6-11 ��Ҫ���������
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

--23.������ѡ��C001�γ̵�ѧ���ĳɼ���10�֡�
update SC
set Grade=Grade+10
where cno='C001'

--24.�������ϵ�����ޡ�������Ļ����γ̵�ѧ���ĳɼ���10��
update SC
set Grade=Grade+10
where cno in (select cno from Course where cname='������Ļ�')

--25.ɾ���ɼ�С��50�ֵ�ѧ����ѡ�μ�¼
delete from SC
where Grade < 50
--26.ɾ�������ϵJava���Գɼ�������ѧ����Javaѡ�μ�¼��
delete from SC
where Grade < 60 and cno in (select cno from Course where cname='Java')  and sno in (select sno from Student where dept='�����ϵ')

--27.ɾ��û��ѡ�޵Ŀγ̵Ļ�����Ϣ��
--��
delete from Course
where cno in (select cno from sc where Grade is NULL)

--��
delete from Course from Course c join sc on c.cno=sc.cno
where sc.cno is null



