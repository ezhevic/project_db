-- выбрать топ-3 официанта по опыту из ресторана "Савва"

SELECT name_waiter, birth_dt, experience
FROM waiter
NATURAL JOIN restaurant
WHERE name_rest = 'Савва'
ORDER BY experience DESC, birth_dt DESC
LIMIT 3;


-- вывести тип оплаты, по которому средний чек наивысший

SELECT payment_type, avg(payment_amt) AS avg_bill
FROM customer_order
GROUP BY payment_type
ORDER BY avg_bill
LIMIT 1;


-- вывести названия ресторанов, тип оплаты и сумму платежа
-- для ресторанов, где средний чек этого типа оплаты выше 5000

SELECT r.name_rest AS restaurant, payment_type, sum(payment_amt) AS sum_payment
FROM restaurant r
NATURAL JOIN customer_order co
GROUP BY (payment_type, r.name_rest)
HAVING avg(payment_amt) > 5000;


-- посчитать средний чек 2023-04-09 для каждого официанта, отранжировать по опыту

SELECT co.waiter_id, experience,
       avg(payment_amt) OVER (PARTITION BY co.waiter_id) AS avg_bill
FROM customer_order AS co
INNER JOIN waiter AS w
ON co.waiter_id = w.waiter_id
WHERE order_from > '2023-04-09 00:00:00' AND order_from < '2023-04-10 00:00:00'
ORDER BY experience DESC;


-- отранжировать официантов по суммарному чеку гостей за 2023-04-09

SELECT waiter_id, payment, dense_rank() OVER (ORDER BY payment DESC) AS rank
FROM(
    SELECT waiter_id, order_from,
           sum(payment_amt) OVER (PARTITION BY waiter_id) AS payment
    FROM customer_order
    ) AS co
WHERE order_from > '2023-04-09 00:00:00' AND order_from < '2023-04-10 00:00:00'
ORDER BY waiter_id, payment DESC;


-- вывести для каждого официанта текущий, предыдущий и следующий заказ

SELECT name_waiter, order_id, lag(order_id) OVER (PARTITION BY co.waiter_id ORDER BY order_from) AS previous_order,
       lead(order_id) OVER (PARTITION BY co.waiter_id ORDER BY order_from) AS next_order
FROM customer_order AS co
INNER JOIN waiter AS w
ON co.waiter_id = w.waiter_id;


-- CRUD-запрос к таблице customer_order

INSERT INTO customer_order VALUES(11, 5, 11, 5, 10, '2023-04-09 14:00:21', NULL, 'card', 5555);

UPDATE customer_order SET order_to = '2023-04-09 14:50:35'
WHERE order_from = '2023-04-09 14:00:21';

UPDATE customer_order SET card_id = 3
WHERE order_from = '2023-04-09 14:00:21';

DELETE FROM customer_order
WHERE order_from > '2023-04-09 14:00:00';

-- CRUD-запрос к таблице waiter

INSERT INTO waiter VALUES(14, 2, 'Геннадий Кросивый', '1990-09-09', 7, '+79125357130');
INSERT INTO waiter VALUES(15, 2, 'Серафим Добряков', '1985-10-13', 9, '+79165396630');
INSERT INTO waiter VALUES(16, 2, 'Виталий Бунин', '1993-01-29', 5, '+79193307231');
INSERT INTO waiter VALUES(17, 2, 'Макар Титов', '1997-05-07', 7, '+79198557130');

UPDATE waiter SET name_waiter = 'Геннадий Красивый'
WHERE waiter_id = 14;

DELETE FROM waiter
WHERE waiter_id > 15;

