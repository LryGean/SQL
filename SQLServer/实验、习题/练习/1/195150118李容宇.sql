/*����ʵ��2�����ݿ�*/
use Students
go

select sno,sname,dept
from student

select *
from student

select sno,sname,sex,birthday,dept 
from student

select sno ѧ��,����=sname,sex �Ա�,��������=birthday,dept ϵ��
from student

select year(getdate())-year(Birthday) ����
from student

/*distinct����ȡֵ��ͬ���ظ���*/
select distinct sno ѧ��,grade �ɼ�
from sc
where grade between 60 and 80
/*�ȼ�*/
select distinct sno ѧ��,grade �ɼ�
from sc
where grade >=60 and grade <= 80

/*��һ���ա��š���ѧ������ϸ��Ϣ*/
/*���ŵ�ͬѧ*/
select *
from student
where sname like '��%'
/*�������ͬѧ*/
select *
from student
where sname like '[����]%'
/*���������ֵ�ͬѧ*/
select *
from student
where rtrim (sname) like '��_'

/*��ѯ2000������ѧ��*/
select sno,sname,birthday,dept
from student
where birthday<'2000-1-1'

/*��ѯȱ����ѧ��*/
select sno,cno
from sc
where grade is null

/*��ѯ�������������к���С������*/
select sno,sname
from student
where sname like '[������]%С%'

/*�����ϵ��ȫ������*/
select sname
from student
where dept='�����ϵ' and sex='��'

/*���ȼ���not > and > or*/
select *
from student
where not sex='��' and dept='�����ϵ' or dept='ͨ�Ź���ϵ'

/*��ѧ����������������,descΪ����*/
select *,year(getdate())-year(birthday) age
from student 
order by year(getdate())-year(birthday)

/*�Ȱ�ϵ�ֿ�,ͬϵ�İ����ս���*/
select *
from student
order by dept,birthday desc,sex

select sno ѧ��,cno �γ�,grade �ɼ�
from sc
where cno='C002' and grade between 80 and 90


select count(*) ������,count(sno) ѧ�Ÿ���,
       count(distinct sno) ���ظ���ѧ�Ÿ���
from sc
/*count����nullֵ*/
select count(*) ������,count(grade) �ɼ�����,
       count(distinct grade) ���ظ��ĳɼ�����
from sc

select sum(grade)
from sc
where sno='0811101'

select max(grade),min(grade)
from sc
where cno='C001'

/*��ѯÿ��ϵ������*/
select count(*) �����ϵ������
from student
where dept='�����ϵ'
/*����group by*/
/*ÿ��ϵ������*/
select dept ϵ��,count(*) ����
from student
group by dept

select dept ϵ��,max(year(getdate())-year(birthday)) �������
from student
group by dept

/*����where�Ӿ�ķ���*/
/*ÿ��ϵ���Ů������*/
select dept ϵ��,count(*) ���� 
from student
where sex='Ů'
group by dept

/*order by�����*/