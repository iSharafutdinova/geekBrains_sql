/* Урок 4. SQL – работа с несколькими таблицами
Условие: 
Табличка: https://drive.google.com/file/d/1PQn576YVakvlWrIgIjSP9YEf5id4cqYs/view?usp=sharing */

-- Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA

SELECT COLOR , COUNT(*) AS AMOUNT FROM AUTO
WHERE MARK = 'BMW' OR MARK = 'LADA'
GROUP BY COLOR;

-- Вывести на экран марку авто и количество AUTO не этой марки

SELECT MARK, (9 - COUNT(*)) AS amount_not_this_mark FROM AUTO
GROUP BY MARK;

/* Задание №3.
Даны 2 таблицы, созданные следующим образом:
create table test_a (id INT, data VARCHAR(1));
create table test_b (id INT);
insert into test_a(id, data) values
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');
insert into test_b(id) values
(10),
(30),
(50);
Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT. */

SELECT * FROM test_a
LEFT JOIN test_b ON test_b.id = test_a.id
WHERE test_b.id IS NULL;