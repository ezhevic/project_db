DROP TABLE IF EXISTS "restaurant" CASCADE;
DROP TABLE IF EXISTS "dish_in_order" CASCADE;
DROP TABLE IF EXISTS "waiter" CASCADE;
DROP TABLE IF EXISTS "ingredient" CASCADE;
DROP TABLE IF EXISTS "customer_order" CASCADE;
DROP TABLE IF EXISTS "customer" CASCADE;
DROP TABLE IF EXISTS "menu" CASCADE;
DROP TABLE IF EXISTS "dish" CASCADE;
DROP TABLE IF EXISTS "loyalty_card" CASCADE;
DROP TABLE IF EXISTS "archieve_loyalty_card" CASCADE;

CREATE database db;

CREATE schema model_restaurant;
set search_path to model_restaurant, public;


CREATE TABLE IF NOT EXISTS restaurant
(
  restaurant_id serial       NOT NULL PRIMARY KEY,
  name_rest     varchar(100) NOT NULL,
  phone_num     varchar(30)  NOT NULL,
  adress        varchar(100) NOT NULL
);


CREATE TABLE IF NOT EXISTS waiter
(
  waiter_id     serial       NOT NULL PRIMARY KEY,
  restaurant_id integer      NOT NULL REFERENCES restaurant (restaurant_id) ON DELETE CASCADE ON UPDATE CASCADE,
  name_waiter   varchar(100) NOT NULL,
  birth_dt      date,
  experience    integer      DEFAULT 0 CHECK ( experience >= 0 ),
  phone_number  varchar(30)
);


CREATE TABLE IF NOT EXISTS customer
(
  customer_id serial NOT NULL PRIMARY KEY
);


CREATE TABLE IF NOT EXISTS menu
(
  menu_id       serial      NOT NULL PRIMARY KEY,
  restaurant_id integer     NOT NULL REFERENCES restaurant (restaurant_id) ON DELETE CASCADE ON UPDATE CASCADE,
  menu_category varchar(50)
);


CREATE TABLE IF NOT EXISTS loyalty_card
(
  card_id     serial  NOT NULL PRIMARY KEY,
  card_number integer NOT NULL,
  bonus       float   NOT NULL DEFAULT 0,
  card_valid  integer CHECK ( card_valid = 0 OR card_valid = 1 )
);


CREATE TABLE IF NOT EXISTS archieve_loyalty_card
(
  card_id     serial  NOT NULL REFERENCES loyalty_card (card_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  valid_from  date    DEFAULT NOW(),
  valid_to    date    DEFAULT (('now'::text)::date + '10 years'::interval)
);


CREATE TABLE IF NOT EXISTS customer_order
(
  order_id      serial       NOT NULL PRIMARY KEY,
  waiter_id     integer      NOT NULL REFERENCES waiter (waiter_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  customer_id   integer      NOT NULL REFERENCES customer (customer_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  restaurant_id integer      NOT NULL REFERENCES restaurant (restaurant_id) ON DELETE CASCADE ON UPDATE CASCADE,
  card_id       integer      NOT NULL REFERENCES loyalty_card (card_id),
  order_from    timestamp,
  order_to      timestamp,
  payment_type  varchar(30)  CHECK ( payment_type = 'card' OR payment_type = 'cash' OR payment_type = NULL),
  payment_amt   decimal(8,2) CHECK ( payment_amt > 0 OR payment_amt = NULL)
);


CREATE TABLE IF NOT EXISTS dish
(
  dish_id    serial       NOT NULL PRIMARY KEY,
  menu_id    integer      NOT NULL REFERENCES menu (menu_id) ON DELETE CASCADE ON UPDATE CASCADE,
  name_dish  varchar(100) NOT NULL,
  cook_time  varchar(50),
  type_dish  varchar(50)
);


CREATE TABLE IF NOT EXISTS ingredient
(
  dish_id          integer      NOT NULL REFERENCES dish (dish_id),
  name_ingredient  varchar(100) NOT NULL,
  UNIQUE (dish_id, name_ingredient)
);


CREATE TABLE IF NOT EXISTS dish_in_order
(
  dish_id  integer  NOT NULL REFERENCES dish (dish_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  order_id integer  NOT NULL REFERENCES customer_order (order_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  PRIMARY KEY (dish_id, order_id),
  UNIQUE (dish_id, order_id)
);

