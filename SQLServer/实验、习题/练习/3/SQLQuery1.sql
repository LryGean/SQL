use Students
go

--��ѯ�����ϵѡ��C002��ѧ���������Ա�
select sname,sex 
from student
where dept='�����ϵ' and sno in(
select sno
from SC
where cno='C002'
)


--ͳ��ѡ����Java �γ̵���Щѧ����ѡ��������ƽ���ɼ�
select sno ѧ��,count(*) ѡ������,avg(grade) ƽ���ɼ�
from SC where sno in(
	select sno from SC join Coures c on c.cno=SC.cno
	where
)

--��ѯѡ�ˡ�Java���γ̵�ѧ��ѧ��
select
from

--��ѯѡ��"C004"�Ҹ��ڴ˿γ̵�ƽ���ɼ�
select sno ѧ��,grade �ɼ�
from sc
where cno='C004' and grade>(
	select avg(grade) from sc where cno='C004'
)

--��ѯ�Ķ�ѧ�ڿ����ѧ����ߵĿγ̵Ŀγ�����ѧ��

--��ѯ����ƽ���ɼ�����ȫ��ѧ������ƽ���ɼ���ѧ����ѧ�ź�ƽ���ɼ�
select Sno ѧ��,avg(grade) ƽ���ɼ�
from SC
group by Sno
having avg(grade) > (select avg(grade) 
from SC)

/*����Ӳ�ѯ*/
--��ѯѧ������������ϵ�͸�ѧ��ѡ�Ŀγ�����
select sname,dept,(
	select count(*) from SC where sno= student.sno
) as Countcno
from Student


--��7-27 ��ѯ����ѡ��C001��C002���ſγ̵�ѧ��ѧ�š�
SELECT T1.Sno 
FROM (SELECT * FROM SC WHERE Cno = 'C001') AS T1 
JOIN (SELECT * FROM SC WHERE Cno = 'c002') AS T2 
ON T1.Sno=T2.Sno



/*��ϰ*/
--������Ӳ�ѯ
--��ѯû��ѡ���ˡ�Java���γ̵�ѧ��
select *
from student
where sno  not in (
	select sno from SC where cno in(
		select cno from course where cname='Java'
	)
)

--����Ӳ�ѯ
select *
from student
where not exists(
	select * from SC where sno=student.sno and cno in(
		select cno from course where cname='Java'
	)
)