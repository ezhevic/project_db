-- представление таблицы loyalty_card с замаскированным полем номера карты

CREATE OR REPLACE VIEW loyalty_card_secure AS
    SELECT alc.card_id, regexp_replace(CAST(card_number AS varchar), '(.){4}', '****', 1) AS card_number,
           bonus, valid_from, valid_to
    FROM loyalty_card
    JOIN archieve_loyalty_card alc on loyalty_card.card_id = alc.card_id;

SELECT *
FROM loyalty_card_secure;


-- представление о посетителях с замаскированным полем карты
DROP VIEW customer_info;

CREATE OR REPLACE VIEW customer_info AS
    SELECT customer_id, regexp_replace(CAST(card_number AS varchar), '(.){4}', '****', 1) AS card_number,
           name_rest, order_id
    FROM restaurant AS r
    INNER JOIN customer_order AS c ON r.restaurant_id = c.restaurant_id
    INNER JOIN loyalty_card lc on lc.card_id = c.card_id
    ORDER BY customer_id;

SELECT *
FROM customer_info;


-- сводка с замаскированными данными по работавшим 2023-04-09 официантам с указанием количества обслуженных заказов
-- (работал = обслужил хотя бы 1 заказ)

CREATE OR REPLACE VIEW waiter_secure AS
    SELECT w.waiter_id, w.restaurant_id,
           'name' AS name_waiter,
           regexp_replace(CAST(birth_dt AS varchar), '(.){8}', '**-**-**', 3) AS birth_dt, experience,
           regexp_replace(CAST(phone_number AS varchar), '(.){7}', '*******', 4) AS phone_number,
           CASE
               WHEN count(order_id) > 0
               THEN count(order_id)
               ELSE 0
               END AS count_orders
    FROM waiter AS w
    INNER JOIN customer_order co ON w.waiter_id = co.waiter_id
    WHERE order_from > '2023-04-09 00:00:00' AND order_from < '2023-04-10 00:00:00'
    GROUP BY w.waiter_id
    ORDER BY w.waiter_id;

SELECT *
FROM waiter_secure;


-- сводка ингредиентов, которые используются в блюдах

CREATE OR REPLACE VIEW ingredients_in_dishes AS
    SELECT name_ingredient, name_dish
    FROM ingredient AS i
    INNER JOIN dish d ON d.dish_id = i.dish_id
    ORDER BY d.dish_id;

SELECT *
FROM ingredients_in_dishes;


-- сводка работников ресторанов

CREATE OR REPLACE VIEW workers AS
    SELECT name_rest, name_waiter
    FROM restaurant AS r
    INNER JOIN waiter w ON r.restaurant_id = w.restaurant_id
    ORDER BY r.restaurant_id;

SELECT *
FROM workers;


-- сводка блюд в меню

CREATE OR REPLACE VIEW dishes_in_menu AS
    SELECT d.menu_id, menu_category, name_dish
    FROM dish AS d
    INNER JOIN menu m ON m.menu_id = d.menu_id
    ORDER BY d.menu_id, menu_category;

SELECT *
FROM dishes_in_menu;


