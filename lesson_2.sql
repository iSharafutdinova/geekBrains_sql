-- Урок 2. SQL – создание объектов, простые запросы выборки
-- 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными

CREATE TABLE sales (
	id INT NOT NULL PRIMARY KEY,
    product_name VARCHAR(20) NOT NULL,
    amount INT NOT NULL,
    price INT NOT NULL);

INSERT INTO sales (id, product_name, amount, price)
VALUES (1, 'product_1', 100, 199),
	   (2, 'product_2', 250, 1999),
       (3, 'product_3', 500, 2999);

-- 2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.

SELECT id , product_name, 
	IF (amount < 100, 'Товар заканчивается (менее 100 шт. в остатке)', 
		IF (amount BETWEEN 100 AND 300, 'Товара достаточно (от 100 до 300 шт.)', 'Товара на складе много (более 300 шт.)')
	) AS 'status'
FROM sales;

-- Создайте таблицу “orders”, заполните ее значениями. 
-- Покажите “полный” статус заказа, используя оператор CASE

CREATE TABLE orders (
	id INT NOT NULL PRIMARY KEY,
    amount INT NOT NULL,
    order_date DATE NOT NULL,
    customer_name VARCHAR(20) NOT NULL); 

INSERT INTO orders (id, amount, order_date, customer_name)
VALUES (1, 2, '2023-02-01', 'Ivanov I.A.'),
	   (2, 24, '2023-07-01', 'Petrova P.P.'),
       (3, 201, '2023-04-01', 'Sidorov S.S.');

SELECT customer_name, order_date, id AS product_id, amount, 
CASE
  WHEN amount > 100 THEN "Оптовая продажа"
  ELSE "Розничная продажа"
END AS status
FROM orders

-- Чем NULL отличается от 0?
/* 
NULL это отсутсвие значений в ячейке, 
0 это цифра, значение (с которым можно производить математические вычисления). */