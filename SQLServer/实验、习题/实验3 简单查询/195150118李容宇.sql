use ��ѧ����
go

/*1.ָ���л�ȫ���в�ѯ*/
--1)��ѯStudentѧ������ȫ��ѧ������ϸ��Ϣ��
select *
from Student

--2)��ѯ����ѧ�����������������ݡ�
select sname ����,year(birthday) �������
from Student

--3)��ѯ���н�ʦ���������Ա�
select tname ��ʦ����,sex �Ա�
from Teacher

--4)��ѯ�γ̵Ŀγ̱�š��γ�����ѧ�֡�
select cno �γ̱��,cname �γ���,credit ѧ��
from Course

--5)��ѯ��ѧ��ѡ�޵Ŀγ̺�
select distinct cno �γ̺�
from SC

/*2.��������ѯ*/
--1)��ѯѧʱΪ4�Ŀγ����ơ�
select cname �γ�
from Course
where credit=4

--2)��ѯѧ��ΪS3��ѧ��������ϵ�������䡣
select sname ����,dept ϵ��,year(getdate())-year(birthday) ����
from Student
where sno='S3'

--3)��ѯ���Գɼ��в������ѧ��ѧ�š�
select sno �ɼ����ϸ��ѧ��ѧ��
from SC
where score < 60

--4)��ѯ��ѡ�޿γ�û���Ե�ѧ��ѧ�źͿγ̺š�
select sno ѧ��,cno �γ̺�
from SC
where score is null

--5)��ѯ���Գɼ���75-85��֮���ѧ��ѧ�źͳɼ���
select sno ѧ��,score �ɼ�
from SC
where score between 75 and 85

--6)��ѯ������20-22��֮���ѧ����������ϵ������䡣
select sname ����,dept ϵ��,year(getdate())-year(birthday) as ����
from Student
where year(getdate())-year(birthday) between 20 and 22

--7)��ѯ���������������ѧ����������ѧ�ź��Ա�
select sname ����,sno ѧ��,sex �Ա�
from Student
where sname like '[����]%'

--8)��ѯ�����еڶ�����Ϊ�������ֵ�����������ϵ��
select sname ����,sno ѧ��,dept ϵ��
from Student
where sex='��' and sname like '_[��]%'

--9)��ѯнˮ��3000���ϵ���Ϣϵ��ʦ��������нˮ=����+��λ������
select tname ��ʦ����
from Teacher
where dept='�����' and (sal+comm) >3000

--10)��ѯ�������ͨ�ŵĽ�ʦ���������䡣
select tname ��ʦ����,age ����
from Teacher
where dept in ('�����','ͨ��')

/*3.�Բ�ѯ�������*/
--1)��ѯѧ����Ϣ�����ճ������ڽ������С�
select *
from Student
order by birthday desc

--2)��ѯ�������ͨ��ѧ����������ϵ���������ϵ������������������
select sname ����,dept ϵ��
from Student
where dept in('�����','ͨ��')
order by dept asc,sname desc

--3)��ѯ�����пγ̺�C2�ɼ���ѧ����ѧ�š��γ̺źͳɼ��������ɼ���������
select sno ѧ��,cno �γ̺�,score �ɼ�
from SC
where cno='C2'
order by score desc

--4)��ѯѧ��ΪS2��ѧ���μӿ��Եĳɼ���������ճɼ��������С�
select score
from SC 
where sno='S2'
order by score desc

/*4.ʹ�þۼ������Ĳ�ѯ*/
--1)��ѯ�����ѧ������������
select count(*) ����
from Student

--2)��ѯC3�γ̿��Եĳɼ���߷ּ���ͷ֡�
select CNO,max(score) ��߷�,min(score) ��ͷ�
from SC
group by CNO
having CNO='C3'

--3)��ѯѧ��ΪS1��ѧ�����пγ̵�ƽ���ɼ���
select avg(score) ƽ���ɼ�
from SC
where sno='S1'

/*
select avg(SCORE) ƽ���ɼ�
from SC
group by SNO
having SNO='s1'
*/

--4)��ѯ�μ���C1�γ̿��Ե�ѧ��������
select count(*) �μ�C1���Ե�����
from SC
where cno='C1' and score is not null

--5)��ѯ���������ļ������ʦ������
select count(*) ����
from Teacher
where tname like '��%' and dept = '�����'

/*5.����ͳ�Ʋ�ѯ*/
--1)��ѯѧ�������Ա���������
select sex �Ա�,count(*) ����
from Student
group by sex

--2)��ѯ����ϵ�����Ա��ʦ��������
select dept ϵ��,sex �Ա�,count(sex)����
from Teacher
group by dept,sex

--3)��ѯÿ��ѧ����ѧ�ż����п��Ե�ƽ���ɼ���
select SNO ѧ��,avg(SCORE) ƽ���ɼ�
from SC
group by SNO

--4)��ѯ���ſγ̵Ŀγ̺ż�ѡ��������
select CNO �γ̺�,count(CNO) ѡ������
from SC
group by CNO 

--5)��ѯѡ�����������Ͽγ̵�ѧ��ѧ�ź�ƽ���ɼ���
select SNO ѧ��,avg(SCORE) ƽ���ɼ�
from SC
group by SNO
having count(CNO)>=2

--6)��ѯ���пγ̿��Գɼ��������ѧ��ѧ�š�
select SNO ѧ��
from SC
group by SNO
having min(SCORE)>= 60

/*˼��*/
--1.��ѯ������4��ͬѧѡ�޵Ŀγ̺š�
/*
select CNO �γ̺�
from SC
group by CNO
having count(SNO)>=4
*/

--2.��ѯѡ�����������Ͽγ̵�ѧ��ѧ�š�
/*
select SNO
from SC
group by SNO
having count(CNO)>=2
*/
--3.��������ORDER BY�Ӿ�����á�
--1)ORDER BY SNO, SEX
--���ͣ���ѧ���Ա������������

--2)ORDER BY AGE, PROF DESC
--���ͣ��Խ�ʦ��������ְ�ƽ�������

--4.��������GROUP BY�Ӿ�����á�
--1)GROUP BY SEX
--���ͣ����Ա���з���

--2)GROUP BY AGE, PROF
--���ͣ��ȶ�������飬�ٰ�ְ�ƽ��з���