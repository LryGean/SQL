/*一、使用T-SQL语句创建数据库。
1. 创建数据库“教学管理”。
(1) 有1个数据文件，数据文件逻辑文件名为“教学管理_Data”，物理文件名为“教学管理_Data.mdf”，初始大小为5MB，最大大小不受限制，自动增长每次增加1MB。
(2) 事务日志文件只有一个，逻辑名为“教学管理_log”，物理文件名为“教学管理_log.ldf”，初始大小1MB，最大大小为10MB，自动增长每次增加10%。
(3) 所有文件均保存在“D:\教学管理”文件夹中。
*/
create database 教学管理
on 
(
	name=教学管理_Data,
	filename='C:\教学管理\教学管理_Data.mdf',
	size=5,
	filegrowth=1
)
log on
(
	name=教学管理_log,
	filename='C:\教学管理\教学管理_log.ldf',
	size=1,
	maxsize=10,
	filegrowth=10%
)

/*2.创建数据库“Test”。
(1) 要求该数据库有两个数据文件组，分别是primary和second。
(2) 共有3个数据文件，其中主数据文件逻辑文件名为“test”，物理文件名为“test.mdf”，初始大小为10MB，最大大小为50MB，自动增长每次增加5MB；辅助数据文件逻辑名分别为“test_Data2”、“test_Data3”，物理文件名分别为“test_Data2.ndf”、“test_Data3.ndf”，初始大小均为5MB，自动增长每次增加1MB，最大大小均为10MB，均放置在second文件组中。
(3) 事务日志文件只有一个，逻辑名为“test_log”，物理文件名为“test_log.ldf”，初始大小2MB，最大大小为10MB，自动增长，每次增加10%。
(4) 所有文件均保存在“D:\Test”文件夹中。
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
/*二、使用T-SQL语句修改数据库。
1.在数据库Test中添加一个数据文件，逻辑文件名为“test_Data4”，物理文件名为“test_Data4.ndf”，存放在“D:\Test”文件夹中，指定初始大小为2MB，最大大小不受限，设置自动增长为2MB。
*/
alter database Test
add file
(
	name=test_Data4,
	filename='C:\Test\test_Data4.ndf',
	size=2,
	filegrowth=2
)

/**2.从数据库Test中删除数据文件test_Data4。*/
alter database Test
remove file test_Data4

/**3.在数据库Test中添加一个日志文件，逻辑文件名为“test_log2”，物理文件名为“test_log2.ldf”，最大大小为10MB，按10%增长。*/
alter database Test
add log file
(
	name=test_log2,
	filename='C:\Test\test_log2.ldf',
	maxsize=10,
	filegrowth=10%
)

/**4.删除数据库Test中的日志文件test_log2。*/
alter database Test
remove file test_log2


/*5.修改数据库Test中的数据文件test_Data2，初始大小为15MB，最大大小为50MB，按3MB增长。*/
alter  database Test
modify file
(
	name=test_Data2,
	size=15,
	maxsize=50,
	filegrowth=3
)
/*6.将数据库Test的名字更改为Practice。*/
EXEC sp_renamedb 'Test','Practice'

/*三、使用T-SQL语句删除数据库。
删除数据库Practice。*/
Drop database Practice;
