insert into ���_�������� values (1, '������ ���������')
insert into ���_�������� values (2, '��������� ������')
insert into ���_�������� values (3, '������ �� ���������� �����')
insert into ���_�������� values (4, '��������� �������')


insert into ������ (ID_������, ID_����_��������, ����_������) values (1, 1, '2022-08-02')
insert into ������ (ID_������, ID_����_��������, ����_������) values (2, 2, '2022-06-02')
insert into ������ (ID_������, ID_����_��������, ����_������) values (3, 2, '2022-04-02')
insert into ������ (ID_������, ID_����_��������, ����_������) values (4, 2, '2022-03-02')
insert into ������ (ID_������, ID_����_��������, ����_������) values (5, 3, '2022-01-02')
insert into ������ (ID_������, ID_����_��������, ����_������) values (6, 2, '2022-03-02')
insert into ������ (ID_������, ID_����_��������, ����_������) values (7, 1, '2021-02-02')
insert into ������ (ID_������, ID_����_��������, ����_������) values (8, 2, '2022-01-02')
insert into ������ (ID_������, ID_����_��������, ����_������) values (9, 4, '2021-04-02')
insert into ������ (ID_������, ID_����_��������, ����_������) values (10, 3, '2022-05-02')
insert into ������ (ID_������, ID_����_��������, ����_������) values (11, 3, '2022-06-02')
insert into ������ (ID_������, ID_����_��������, ����_������) values (12, 2, '2001-10-02')
insert into ������ (ID_������, ID_����_��������, ����_������) values (13, 1, '2022-03-02')
insert into ������ (ID_������, ID_����_��������, ����_������) values (14, 3, '2021-12-02')
insert into ������ (ID_������, ID_����_��������, ����_������) values (15, 4, '2022-02-02')
insert into ������ (ID_������, ID_����_��������, ����_������) values (16, 2, '2022-08-02')
insert into ������ (ID_������, ID_����_��������, ����_������) values (17, 2, '2021-07-02')



select top 1 ��������_���� as '����� ���������� ��� �������� �� ������� ���:', Count(������.ID_����_��������) as '���������� ������:'
	from ������, ���_��������
		where ������.ID_����_�������� = ���_��������.ID_����_�������� and ����_������ >= '2022-01-01'
		group by ������.ID_����_��������, ��������_����
		order by  ��������_����

create table ����_�������(
	ID_����_������� int primary key,
	��������_���� char(200) null)
go

create table ���_������(
	ID_���_������ int primary key,
	��������_������ char(200) null,
	��������� money null)
go

create table ���_��������(
	ID_����_�������� int primary key,
	��������_���� char(100))
go

create table �����_������(
	ID_�����_������ int primary key,
	��������_����������� char(200),
	��� int null,
	��������� char(100),
	�� money null,
	����_������_������ date null)
go

create table �������(
	ID_�������� int primary key,
	����� tinyint null,
	����� tinyint null,
	����_������ date null,
	���_������������� varchar(7) null,
	���_����� varchar(200),
	����_�������� date null,
	�����_�������� varchar(100),
	������_����������� varchar(100))

Create table �������(
	ID_�������� int primary key,
	������� varchar(70),
	��� varchar(30),
	�������� varchar(30),
	������� char(16),
	���_������� char(16),
	��_����� varchar(100),
	ID_�����_������ int,
	ID_�������� int
	foreign key (ID_�����_������) references �����_������ (ID_�����_������),
	foreign key (ID_��������) references ������� (ID_��������))

create table ������(
	ID_������ int primary key,
	ID_����_�������� int null,
	ID_����_������� int,
	ID_���_������ int,
	����_������� int null,
	����� money null,
	������ decimal null,
	ID_�������� int,
	����_������ date null,
	�����_������ time,
	foreign key (ID_����_��������) references ���_�������� (ID_����_��������),
	foreign key (ID_����_�������) references ����_������� (ID_����_�������),
	foreign key (ID_��������) references ������� (ID_��������)
	)
go

create table ������_����������_�����(
	ID_���_������ int,
	ID_������ int,
	foreign key (ID_���_������) references ���_������ (ID_���_������),
	foreign key (ID_������) references ������ (ID_������))
go

/*
drop table ������
drop table ����_�������
drop table ���_��������
drop table ������_����������_�����
drop table ���_������
drop table �������
drop table �����_������
drop table �������
*/

select * from ������
delete from ���_�������� where ID_����_�������� = 1

create trigger Deleting on ���_��������
instead of delete
as
delete from ������ where ID_����_�������� in (select d.ID_����_�������� from deleted d)
delete from ���_�������� where ID_����_�������� in (select d.ID_����_�������� from deleted d)