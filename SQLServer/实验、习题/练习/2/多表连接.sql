use Students
go

/*����*/
select Student.sno ѧ��,SC.sno ѧ��,sname ����,CNO �γ̺�,Grade �ɼ�
from Student cross join SC

/*����*/
select s.sno ѧ��,sname ����,CNO �γ̺�,Grade �ɼ�
from Student s join SC on s.sno = SC.sno

/*��������*/
select s.sno ѧ��,sname ����,c.cno �γ̺�,Grade �ɼ�
from Student s join SC on s.sno = SC.sno join Course c on SC.cno=c.cno

/*��ѯѡ���ˡ�������Ļ����γ̵�ѧ��������*/
select s.sno ѧ��,sname ����,c.cname �γ���
from Student s join SC on s.sno = SC.sno 
join Course c on SC.cno=c.cno
where c.cname='������Ļ�ѧ'

/*������*/
select *
from Student S1 join Student S2 on S1.dept = S2.dept
where 

/*��ѯ��������ͬһ��ϵѧϰ��ѧ�������������ڵ�ϵ*/
select S2.sname ����,S2.dept ϵ��
from Student S1 join Student S2 on S1.dept = S2.dept
where S1.sname = '����' and S2.sname != '����'

/*��ѯ��������ͬһ���Ա��ѧ�����������Ա�*/
select S2.sname ����,S2.sex ϵ��
from Student S1 join Student S2 on S1.sex = S2.sex
where S1.sname = '����' and S2.sname != '����'

/*��ѯ�롰���ݽṹ���γ���ͬһ��ѧ�ڿ���Ŀγ̵Ŀγ����Ϳ���ѧ��(����������ͬһѧ��)*/
select C1.Cname �γ�����,C1.Semester

/*������*/
--��ѯ����ѧ����ѡ�����������ûѡ�ε�ѧ����
select *
from student s left outer join sc on s.sno = sc.sno
where sc.sno is null

--ͳ�Ƽ����ϵÿ��ѧ����ѡ������������û��ѡ�ε�ѧ����
select s.sno ѧ��,count(sc.sno) ѡ������
from Student s left join SC on s.sno = SC.sno
where dept='�����ϵ'
group by s.sno

--3.��ѯ����ѧ����û��ѡ�޵Ŀγ̺źͿγ����� ����ŵ��ǿγ̣��ÿγ̱����������������ӵĿγ̿��ܳ��ֿ�ֵnull��
select c.CNO �γ̺�,c.CNAME �γ���
from Course c  left join SC on c.CNO=SC.CNO left join Student s on s.SNO=SC.SNO  
where s.SNO is null


/*P154�ϻ�ϰ��*/
--12.��ѯѡ��C002�γ̵�ѧ��������������ϵ
select sname
from Student s join SC on s.Sno = SC.Sno
where

--13.��ѯ�ɼ�80�����ϵ�ѧ�����������γ̺źͳɼ��������ɼ��������н��

--14.��ѯѡ����������ǰ��λѧ���������ͳɼ�

--15.

--16.
