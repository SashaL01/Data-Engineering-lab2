-- Проверка количества записей в источнике и приемнике
-- первая строчка запроса подсчитывает кол-во заказов в схеме Stg таблицы orders
-- второй строчка подсчитывает кол-во заказов в схеме dw таблицы sales_fact 
SELECT COUNT(*) FROM stg.oыrders;
SELECT COUNT(*) FROM dw.sales_fact;
--полученный ответ 9994

-- Проверка распределения данных
-- считает количество записей в каждой категории и  
-- группировует записи в таблице dw.product_dim по категории
SELECT category, COUNT(*)
FROM dw.product_dim
GROUP BY category;
--полученный ответ furniture - 904;office supplies - 2560; technology- 880 


-- Проверка отсутствия дубликатов
-- запрос делает проверку, есть ли в таблице dw.customer_dim дубликаты по customer_id.
-- если записей больше 1, есть дубликаты.
SELECT customer_id, COUNT(*)
FROM dw.customer_dim
GROUP BY customer_id
HAVING COUNT(*) > 1;


-- Пример проверки связей
-- запрос делает проверку , есть ли в таблице dw.sales_fact записи, 
--у которых нет записи в таблице dw.shipping_dim 
--Если запрос вернет число больше нуля, значит в dw.sales_fact есть заказы, у которых нету доставки .
 
SELECT COUNT(*)
FROM dw.sales_fact f
LEFT JOIN dw.shipping_dim s ON f.ship_id = s.ship_id
WHERE s.ship_id IS NULL;
