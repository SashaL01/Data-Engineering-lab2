select *
from orders

--задание 1 Рассчитать прибыль по подкатегориям
--выбираеи subcategory и считаем профит для каждой подкатегории 
select 
	subcategory,
	sum(profit) as total_profit
from orders
group by subcategory -- группируем по subcategory чтобы посчитать общий профит для каждой подкатегории

-------------------------------------------------------------

select *
from orders


--задание 2 Создать таблицу клиентов по сегментам
--удаляем таблицу customer_segment если она существует
drop table if exists dw.customer_segment ;
--создаем таблице customer_segment в схеме dw и добавляем поля таблицы
create table dw.customer_segment (
	customer_id   varchar(8) not null primary key, -- используем varchar так,как может иметь буквы и цифры; длина 8 так как у идентификатора длина максимум 8 
 	customer_name varchar(22) not null, --VARCHAR  для хранения строк. 22 так как самое длинное имя Christina VanderZanden имеет 22 символа
	segment varchar(11) not null --VARCHAR  для хранения строк. 11 так как самый длинный сегмент имеет Home Office
);-- PRIMARY KEY на customer_id, так как является уникальным значением для каждого клиента

--вставляем данные в таблицу customer_segment
insert into dw.customer_segment 
--выбираем  customer_id, customer_name, segment из таблицы orders,и используем distinct чтобы не было дубликатов
SELECT DISTINCT customer_id, customer_name, segment
FROM stg.orders;
--проверяем 
select *
from dw.customer_segment



-------------------------------------------------------------
select *
from orders

--задание 3 Найти количество заказов по регионам

--выбираем столбец region и посчитываем order_id для кол-ва заказов
select 
	region,
	count(order_id) as total_order
from orders --указываем таблицу откуда берем данные 
group by region --группируем результаты по region ,чтобы подсчитать кол-вл
