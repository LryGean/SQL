use ��ѧ����
go

/*1.����һ��ֵ�Ļ��ڱȽϲ��Ե��Ӳ�ѯ*/
--1)��ѯ�롰�ź��Ρ�ͬ���ѧ����ѧ�ź�������
select sno	ѧ��,sname ����
from Student
where class in (select class from Student where sname='�ź���') and sname != '�ź���'  

--2)��ѯ�롰SQL ServerӦ�ÿ������γ�ѧ����ͬ�Ŀγ̱�źͿγ����ơ�
select cno �γ̺�,cname  �γ�����
from Course
where credit in (select credit from Course where cname='SQL ServerӦ�ÿ���') and cname != 'SQL ServerӦ�ÿ���'

--3)��ѯ�롰��������ʦ����ͬϵ���н�ʦ������
select tname ����
from Teacher
where dept not in (select dept from Teacher where tname ='����') and sex='��'

--4)��ѯ��ʦ�бȡ���ΰ������󣬱ȡ�����������С�Ľ�ʦ��š�������ְ�ơ�
select tno ��ʦ���,tname ����,prof ְ��
from Teacher
where age > some (select age from Teacher where tname='��ΰ')
and age < some (select age from Teacher where tname='����')

/*2.����һ��ֵ�Ļ��ڼ��ϵ��Ӳ�ѯ*/
--1)��ѯ���ڿγ̺�ΪC5�Ľ�ʦ������
select tname
from Teacher
where tno in (select tno from TC where cno='C5')

--2)ʹ��INν�ʲ�ѯ����ѧ����û��ѡ�޵Ŀγ̱�źͿγ�����
select cno �γ̱��,cname �γ���
from Course
where cno != all(select cno from SC where sno is not null)

--3)��ѯѡ����S4��ѧ��ѡ�޿γ̵�ѧ��ѧ�ź�����
select distinct sno ѧ��,(select sname from Student where sno=SC.SNO) ����
from SC
where cno in (select cno from SC where sno='S4') and sno != 'S4'

/*3.����Ӳ�ѯ*/
--1)ʹ��EXISTSν�ʲ�ѯû�н��ڿγ̺�ΪC5�γ̵Ľ�ʦ����������ϵ��
select tname ����,dept ϵ
from Teacher
where not exists (select * from TC where cno='C5' and tno=Teacher.tno)

--2)ʹ��EXISTS��ѯ����δѡ�޿γ̵�ѧ������������ѧ��ѧ�ź�������
select sno ѧ��,sname ����
from Student
where not exists (select * from SC where sno=Student.SNO)
order by sno desc

--3)��ѯ�ɼ��ȸÿγ�ƽ���ɼ��ߵ�ѧ����ѧ�źͳɼ���
select sno ѧ��,cno �γ̱��,score �ɼ�
from SC s1
where score >=all (select avg(score) from SC s2  where s2.sno=s1.sno group by cno)

/*˼����*/
--1.��ѯ��ʦ�����������ڿγ̵Ŀγ����ơ�
/*
select cname �γ�����
from Course
where cno in (select cno from TC where tno in
(select tno from Teacher where tname='����'))
*/

--2.��ѯ����ϵ�бȼ����ϵ���н�ʦ���ʶ��ߵĽ�ʦ���������ʼ�����ϵ��
/*
select tname ����,sal ����,dept ϵ
from Teacher t1
where sal > some (select max(sal) from Teacher t2 where dept='�����')
*/

--3.ѡ������ѯͬʱѡ���ˡ�C���Գ�����ơ��͡�΢��ԭ���뼼������ѧ��������
/*
select distinct (select sname from Student where sno=s1.sno) ����
from SC s1
where sno in (select sno from SC where cno in (select cno from Course where cname in('C���Գ������','΢��ԭ���뼼��')) group by sno having count(cno)=2)
*/