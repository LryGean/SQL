use ��ѧ����
go

/*1.�����Ӳ�ѯ*/
--1)��ѯ����ѡ��ѧ����ѧ�š�������ѡ�޿γ̺ż����Գɼ���
select s.Sno ѧ��,s.Sname ����,SC.Cno ѡ�޿γ̺�,SC.SCORE ���Գɼ�
from Student s join SC on s.Sno=SC.Sno

--2)��ѯ����ѡ��ѧ����ѧ�š�������ѡ�޿γ����Ƽ����Գɼ���
select s.Sno ѧ��,s.Sname ����,c.Cname �γ�����,SC.SCORE ���Գɼ�
from Student s join SC on s.Sno=SC.Sno join Course c on SC.Cno=c.Cno

--3)��ѯ���ογ̵Ŀγ̺š��ον�ʦ������������γ̺�����
select TC.CNO �γ̺�,t.TNAME �ο���ʦ����
from Teacher t join TC on t.TNO=TC.TNO
order by CNO

--4)��ѯ���ογ̵Ŀγ����Ƽ��ον�ʦ������
select Cname �γ���,TNAME �ο���ʦ����
from Teacher t join TC on t.TNO=TC.TNO join Course c on TC.CNO=c.CNO

--5)��ѯ���ڡ�C���Գ�����ơ��γ̵Ľ�ʦ�������Ա�ְ�ơ�
select t.Tname ��ʦ����,SEX �Ա�,PROF ְ��
from Teacher t join TC on t.TNO=TC.TNO join Course c on TC.CNO=c.CNO
where c.CNAME='C���Գ������'

--6)��ѯѡ���˿γ̵ļ����ϵѧ����������ѡ�޿γ����Ƽ����Գɼ���
select s.SNAME ����,c.CNAME ѡ�޿�����,SC.SCORE ���Գɼ�
from Student s join SC on s.SNO=SC.SNO join Course c on SC.Cno=c.Cno
where DEPT='�����'

--7)ͳ��ѧ������������ѡ�޿γ̵�������ƽ���ɼ���
select count(s.SNO) ѡ������,avg(SC.SCORE) ƽ����
from Student s join SC on s.SNO=SC.SNO
group by s.SNO,s.SNAME
Having s.SNAME='������'

/*2.������*/
--1)��ѯ���бȡ���ΰ�����ʸߵĽ�ʦ���������ʼ���ΰ�Ĺ��ʡ�
select t2.TNAME ����,t2.SAL ����
from Teacher t1 join Teacher t2 on t2.SAL>=t1.SAL
where t1.TNAME='��ΰ'
order by t2.SAL

--2)��ѯ�롰����ɽ��ͬ���ѧ��ѧ�ź�������
select s2.SNO ѧ��,s2.SNAME ����
from Student s1 join Student s2 on s1.CLASS=s2.CLASS
where s1.SNAME='����ɽ'

/*3.������*/
--1)��ѯ����ѧ����ѡ�������Ҫ�󷵻�ѧ��ѧ�š�������ѡ�޿γ̺ż��ɼ���û��ѡ�ε�ѧ����ѡ����Ϣ��ʾΪ�գ���
select s.SNO ѧ��,s.SNAME ����,SC.CNO ѡ�޿γ̺�,SC.SCORE �ɼ�
from Student s left join SC on s.SNO=SC.SNO

--2)��ѯ����ѧ����ѡ�������Ҫ�󷵻�ѧ��ѧ�š�������ѡ�޿γ����Ƽ��ɼ���û��ѡ�ε�ѧ����ѡ����Ϣ��ʾΪ�գ���
select s.SNO ѧ��,s.SNAME ����,c.CNAME ѡ�޿γ���,SC.SCORE �ɼ�
from Student s left join SC on s.SNO=SC.SNO left join Course c on SC.CNO=c.CNO 

--3)��ѯ����δѡ�޿γ̵�ѧ������������ѧ��ѧ�ź�������
select s.SNO ѧ��,s.SNAME ����
from Student s left join SC on s.SNO=SC.SNO
where SC.CNO is null

/*˼��*/
--1.��ѯ��ʦ�����������ڿγ̵Ŀγ����ơ�
/*
select t.TNAME ����,c.CNAME �ڿ�����
from Teacher t join TC on t.TNO=TC.TNO join Course c on TC.CNO=c.CNO
where t.TNAME='����'
*/

--2.ͳ��ѡ���˿γ̡�΢��ԭ���뼼������ÿ��רҵ���ܳɼ���ƽ���ɼ�������ƽ���ɼ���������
/*�⣺
select COUNT(SC.SCORE) �ܳɼ�,avg(SC.SCORE) ƽ���ɼ�
from Student s join SC on s.Sno=SC.Sno join Course c on SC.CNO=c.CNO
where c.CNAME='΢��ԭ���뼼��'
group by DEPT,SCORE
order by SC.SCORE desc
*/

--3.��ѯ����ѧ����û��ѡ�޵Ŀγ̺źͿγ����� 
/*
select c.CNO �γ̺�,c.CNAME �γ���
from Course c  left join SC on c.CNO=SC.CNO left join Student s on s.SNO=SC.SNO  
where s.SNO is null
*/

--4.ѡ������ѯͬʱѡ���ˡ�C���Գ�����ơ��͡�΢��ԭ���뼼������ѧ��������
/*
select s.SNAME
from Student s join SC on s.SNO=SC.SNO join Course c on SC.CNO=c.CNO 
where c.CNAME in ('C���Գ������','΢��ԭ���뼼��')
group by s.SNAME
Having count(c.CNAME)=2
*/