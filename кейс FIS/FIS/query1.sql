insert into Вид_продукта values (1, 'Кредит наличными')
insert into Вид_продукта values (2, 'Ипотечный кредит')
insert into Вид_продукта values (3, 'Кредит на неотложные нужды')
insert into Вид_продукта values (4, 'Нецелевые кредиты')


insert into Заявка (ID_заявки, ID_вида_продукта, Дата_заявки) values (1, 1, '2022-08-02')
insert into Заявка (ID_заявки, ID_вида_продукта, Дата_заявки) values (2, 2, '2022-06-02')
insert into Заявка (ID_заявки, ID_вида_продукта, Дата_заявки) values (3, 2, '2022-04-02')
insert into Заявка (ID_заявки, ID_вида_продукта, Дата_заявки) values (4, 2, '2022-03-02')
insert into Заявка (ID_заявки, ID_вида_продукта, Дата_заявки) values (5, 3, '2022-01-02')
insert into Заявка (ID_заявки, ID_вида_продукта, Дата_заявки) values (6, 2, '2022-03-02')
insert into Заявка (ID_заявки, ID_вида_продукта, Дата_заявки) values (7, 1, '2021-02-02')
insert into Заявка (ID_заявки, ID_вида_продукта, Дата_заявки) values (8, 2, '2022-01-02')
insert into Заявка (ID_заявки, ID_вида_продукта, Дата_заявки) values (9, 4, '2021-04-02')
insert into Заявка (ID_заявки, ID_вида_продукта, Дата_заявки) values (10, 3, '2022-05-02')
insert into Заявка (ID_заявки, ID_вида_продукта, Дата_заявки) values (11, 3, '2022-06-02')
insert into Заявка (ID_заявки, ID_вида_продукта, Дата_заявки) values (12, 2, '2001-10-02')
insert into Заявка (ID_заявки, ID_вида_продукта, Дата_заявки) values (13, 1, '2022-03-02')
insert into Заявка (ID_заявки, ID_вида_продукта, Дата_заявки) values (14, 3, '2021-12-02')
insert into Заявка (ID_заявки, ID_вида_продукта, Дата_заявки) values (15, 4, '2022-02-02')
insert into Заявка (ID_заявки, ID_вида_продукта, Дата_заявки) values (16, 2, '2022-08-02')
insert into Заявка (ID_заявки, ID_вида_продукта, Дата_заявки) values (17, 2, '2021-07-02')



select top 1 Название_вида as 'Самый популярный вид продукта за текущий год:', Count(Заявка.ID_вида_продукта) as 'Количество заявок:'
	from Заявка, Вид_продукта
		where Заявка.ID_вида_продукта = Вид_продукта.ID_вида_продукта and Дата_заявки >= '2022-01-01'
		group by Заявка.ID_вида_продукта, Название_вида
		order by  Название_вида

create table Цель_кредита(
	ID_цели_кредита int primary key,
	Название_цели char(200) null)
go

create table Доп_услуга(
	ID_доп_услуги int primary key,
	Название_услуги char(200) null,
	Стоимость money null)
go

create table Вид_продукта(
	ID_вида_продукта int primary key,
	Название_вида char(100))
go

create table Место_работы(
	ID_места_работы int primary key,
	Название_организации char(200),
	ИНН int null,
	Должность char(100),
	ЗП money null,
	Дата_начала_работы date null)
go

create table Паспорт(
	ID_паспорта int primary key,
	Серия tinyint null,
	Номер tinyint null,
	Дата_выдачи date null,
	Код_подразделения varchar(7) null,
	Кем_выдан varchar(200),
	Дата_рождения date null,
	Место_рождения varchar(100),
	Регион_регистрации varchar(100))

Create table Заемщик(
	ID_заемщика int primary key,
	Фамилия varchar(70),
	Имя varchar(30),
	Отчество varchar(30),
	Телефон char(16),
	Доп_телефон char(16),
	Эл_почта varchar(100),
	ID_места_работы int,
	ID_паспорта int
	foreign key (ID_места_работы) references Место_работы (ID_места_работы),
	foreign key (ID_паспорта) references Паспорт (ID_паспорта))

create table Заявка(
	ID_заявки int primary key,
	ID_вида_продукта int null,
	ID_цели_кредита int,
	ID_доп_услуги int,
	Срок_кредита int null,
	Сумма money null,
	Ставка decimal null,
	ID_заемщика int,
	Дата_заявки date null,
	Время_заявки time,
	foreign key (ID_вида_продукта) references Вид_продукта (ID_вида_продукта),
	foreign key (ID_цели_кредита) references Цель_кредита (ID_цели_кредита),
	foreign key (ID_заемщика) references Заемщик (ID_заемщика)
	)
go

create table Список_заказанных_услуг(
	ID_доп_услуги int,
	ID_заявки int,
	foreign key (ID_доп_услуги) references Доп_услуга (ID_доп_услуги),
	foreign key (ID_заявки) references Заявка (ID_заявки))
go

/*
drop table Заявка
drop table Цель_кредита
drop table Вид_продукта
drop table Список_заказанных_услуг
drop table Доп_услуга
drop table Паспорт
drop table Место_работы
drop table Заемщик
*/

select * from Заявка
delete from Вид_продукта where ID_вида_продукта = 1

create trigger Deleting on Вид_продукта
instead of delete
as
delete from Заявка where ID_вида_продукта in (select d.ID_вида_продукта from deleted d)
delete from Вид_продукта where ID_вида_продукта in (select d.ID_вида_продукта from deleted d)