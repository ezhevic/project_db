-- триггер на вставку времени открытия заказа

CREATE OR REPLACE FUNCTION start_customer_order() RETURNS TRIGGER AS $$
BEGIN
NEW.order_from = now();
RETURN NEW;
END;
$$ LANGUAGE plpgsql;


DROP TRIGGER IF EXISTS start_order ON customer_order;
CREATE OR REPLACE TRIGGER start_order
BEFORE INSERT ON customer_order
FOR EACH ROW
EXECUTE FUNCTION start_customer_order();

-- для проверки
SELECT *
FROM customer_order;

INSERT INTO customer_order VALUES (11, 3, 11, 6, 10, NULL, NULL, NULL, NULL);


-- триггер на вставку времени закрытия заказа

CREATE OR REPLACE FUNCTION end_customer_order() RETURNS TRIGGER AS $$
BEGIN
IF NEW.payment_type IS NULL
THEN RETURN NEW.payment_type = NULL;
ELSIF NEW.payment_amt IS NULL
THEN RETURN NEW.payment_amt = NULL;
ELSE
NEW.order_to = now();
RETURN NEW;
END IF;
END;
$$ LANGUAGE plpgsql;


DROP TRIGGER IF EXISTS end_order ON customer_order;
CREATE OR REPLACE TRIGGER end_order
BEFORE UPDATE ON customer_order
FOR EACH ROW
EXECUTE FUNCTION end_customer_order();

-- для проверки
UPDATE customer_order SET payment_type = 'card'
WHERE order_id = 11;

UPDATE customer_order SET payment_amt = 5400
WHERE order_id = 11;

SELECT *
FROM customer_order;

DELETE FROM customer_order
WHERE order_id = 11;


-- триггер на версионную таблицу

CREATE OR REPLACE FUNCTION check_actual_info_card() RETURNS TRIGGER AS $$
BEGIN
IF (OLD.card_valid = 0 AND NEW.card_valid = 1)
THEN INSERT INTO archieve_loyalty_card SELECT card_id, now(), (('now'::text)::date + '10 years'::interval)
     FROM loyalty_card
     WHERE card_id = NEW.card_id;
END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;


DROP TRIGGER IF EXISTS end_order ON loyalty_card;
CREATE OR REPLACE TRIGGER end_order
BEFORE UPDATE ON loyalty_card
FOR EACH ROW
EXECUTE FUNCTION check_actual_info_card();

-- для проверки
SELECT *
FROM loyalty_card;

SELECT *
FROM archieve_loyalty_card;

UPDATE loyalty_card SET card_valid = 0
WHERE card_id = 10;

UPDATE loyalty_card SET card_valid = 1
WHERE card_id = 10;

DELETE FROM archieve_loyalty_card
WHERE valid_from = '2023-05-01';
-- дата подставляется текущая
