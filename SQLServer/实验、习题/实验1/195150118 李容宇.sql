/*һ��ʹ��T-SQL��䴴�����ݿ⡣
1. �������ݿ⡰��ѧ������
(1) ��1�������ļ��������ļ��߼��ļ���Ϊ����ѧ����_Data���������ļ���Ϊ����ѧ����_Data.mdf������ʼ��СΪ5MB������С�������ƣ��Զ�����ÿ������1MB��
(2) ������־�ļ�ֻ��һ�����߼���Ϊ����ѧ����_log���������ļ���Ϊ����ѧ����_log.ldf������ʼ��С1MB������СΪ10MB���Զ�����ÿ������10%��
(3) �����ļ��������ڡ�D:\��ѧ�����ļ����С�
*/
create database ��ѧ����
on 
(
	name=��ѧ����_Data,
	filename='C:\��ѧ����\��ѧ����_Data.mdf',
	size=5,
	filegrowth=1
)
log on
(
	name=��ѧ����_log,
	filename='C:\��ѧ����\��ѧ����_log.ldf',
	size=1,
	maxsize=10,
	filegrowth=10%
)

/*2.�������ݿ⡰Test����
(1) Ҫ������ݿ������������ļ��飬�ֱ���primary��second��
(2) ����3�������ļ��������������ļ��߼��ļ���Ϊ��test���������ļ���Ϊ��test.mdf������ʼ��СΪ10MB������СΪ50MB���Զ�����ÿ������5MB�����������ļ��߼����ֱ�Ϊ��test_Data2������test_Data3���������ļ����ֱ�Ϊ��test_Data2.ndf������test_Data3.ndf������ʼ��С��Ϊ5MB���Զ�����ÿ������1MB������С��Ϊ10MB����������second�ļ����С�
(3) ������־�ļ�ֻ��һ�����߼���Ϊ��test_log���������ļ���Ϊ��test_log.ldf������ʼ��С2MB������СΪ10MB���Զ�������ÿ������10%��
(4) �����ļ��������ڡ�D:\Test���ļ����С�
*/
create database Test
on primary
(
	name=test,
	filename='C:\Test\test.mdf',
	size=10,
	maxsize=50,
	filegrowth=5
),
filegroup sencond
(
	name=test_Data2,
	filename='C:\Test\test_Data2.ndf',
	size=5,
	maxsize=10,
	filegrowth=1
),
(
	name=test_Data3,
	filename='C:\Test\test_Data3.ndf',
	size=5,
	maxsize=10,
	filegrowth=1
)
log on 
(
	name=test_log,
	filename='C:\Test\test_log.ldf',
	size=2,
	maxsize=10,
	filegrowth=10%
)
/*����ʹ��T-SQL����޸����ݿ⡣
1.�����ݿ�Test�����һ�������ļ����߼��ļ���Ϊ��test_Data4���������ļ���Ϊ��test_Data4.ndf��������ڡ�D:\Test���ļ����У�ָ����ʼ��СΪ2MB������С�����ޣ������Զ�����Ϊ2MB��
*/
alter database Test
add file
(
	name=test_Data4,
	filename='C:\Test\test_Data4.ndf',
	size=2,
	filegrowth=2
)

/**2.�����ݿ�Test��ɾ�������ļ�test_Data4��*/
alter database Test
remove file test_Data4

/**3.�����ݿ�Test�����һ����־�ļ����߼��ļ���Ϊ��test_log2���������ļ���Ϊ��test_log2.ldf��������СΪ10MB����10%������*/
alter database Test
add log file
(
	name=test_log2,
	filename='C:\Test\test_log2.ldf',
	maxsize=10,
	filegrowth=10%
)

/**4.ɾ�����ݿ�Test�е���־�ļ�test_log2��*/
alter database Test
remove file test_log2


/*5.�޸����ݿ�Test�е������ļ�test_Data2����ʼ��СΪ15MB������СΪ50MB����3MB������*/
alter  database Test
modify file
(
	name=test_Data2,
	size=15,
	maxsize=50,
	filegrowth=3
)
/*6.�����ݿ�Test�����ָ���ΪPractice��*/
EXEC sp_renamedb 'Test','Practice'

/*����ʹ��T-SQL���ɾ�����ݿ⡣
ɾ�����ݿ�Practice��*/
Drop database Practice;
