CREATE OR REPLACE FUNCTION waiter_orders (name_get varchar, period_from timestamp, period_to timestamp)
RETURNS TABLE(name_get varchar, count_orders integer) 
AS $$
    SELECT name_waiter, count(order_id)
    FROM customer_order
    INNER JOIN waiter w
    ON w.waiter_id = customer_order.waiter_id
    WHERE name_waiter = name_get AND
    (order_from > period_from OR order_to < period_to) AND
    (order_from < period_to AND order_to > period_from)
    GROUP BY name_waiter;
$$
LANGUAGE sql;

-- для проверки
-- SELECT *
--     FROM waiter_orders('Степан Степанов', '2023-04-09 13:00:00', '2023-04-09 13:45:00');



CREATE OR REPLACE FUNCTION count_orders_in_time (time_get timestamp)
RETURNS TABLE(time_get timestamp, count integer) 
AS $$
    SELECT time_get, count(order_id)
    FROM customer_order
    WHERE order_from < time_get AND order_to > time_get
$$
LANGUAGE sql;

-- для проверки
-- SELECT *
--     FROM count_orders_in_time('2023-04-09 13:30:00');


CREATE OR REPLACE FUNCTION find_age(name_get varchar)
RETURNS TABLE(name_get varchar, age int) 
AS $$
    SELECT name_waiter, date_part('year', age(birth_dt))
    FROM waiter
    WHERE name_waiter = name_get
$$
LANGUAGE sql;

-- для проверки
-- SELECT *
--     FROM find_age('Степан Степанов');

