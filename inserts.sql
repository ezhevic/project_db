INSERT INTO loyalty_card VALUES(1, 387541, 100, 1);
INSERT INTO loyalty_card VALUES(2, 484596, 500, 1);
INSERT INTO loyalty_card VALUES(3, 174856, 1000, 1);
INSERT INTO loyalty_card VALUES(4, 174351, 300, 1);
INSERT INTO loyalty_card VALUES(5, 585160, 700, 1);
INSERT INTO loyalty_card VALUES(6, 108236, 956, 1);
INSERT INTO loyalty_card VALUES(7, 664982, 349, 1);
INSERT INTO loyalty_card VALUES(8, 782657, 900, 1);
INSERT INTO loyalty_card VALUES(9, 225684, 652, 1);
INSERT INTO loyalty_card VALUES(10, 936954, 1111, 0);


INSERT INTO archieve_loyalty_card VALUES(1, '2022-02-02', '2032-02-02');
INSERT INTO archieve_loyalty_card VALUES(2, '2013-03-12', '2023-03-12');
INSERT INTO archieve_loyalty_card VALUES(2, '2023-03-13', '2033-03-13');
INSERT INTO archieve_loyalty_card VALUES(3, '2017-07-17', '2027-07-17');
INSERT INTO archieve_loyalty_card VALUES(4, '2022-01-03', '2032-01-03');
INSERT INTO archieve_loyalty_card VALUES(5, '2019-10-10', '2029-10-10');
INSERT INTO archieve_loyalty_card VALUES(6, '2020-02-20', '2030-02-20');
INSERT INTO archieve_loyalty_card VALUES(7, '2021-12-12', '2031-12-12');
INSERT INTO archieve_loyalty_card VALUES(8, '2022-11-11', '2032-11-11');
INSERT INTO archieve_loyalty_card VALUES(9, '2022-01-22', '2032-01-22');
INSERT INTO archieve_loyalty_card VALUES(10, '2012-08-08', '2022-08-08');


INSERT INTO restaurant VALUES(1, 'Савва', +74997959999, 'Театральный пр. 2');
INSERT INTO restaurant VALUES(2, 'Белуга', +74959010936, 'Моховая ул. 15/1с1');
INSERT INTO restaurant VALUES(3, 'Марчеллиз', +79031308920, 'ул. Большая Дмитровка 5/6с4');
INSERT INTO restaurant VALUES(4, 'Северяне', +79771919116, 'Большая Никитская ул.12');
INSERT INTO restaurant VALUES(5, '#FARШ', +74952584205, 'Никольская ул.12');
INSERT INTO restaurant VALUES(6, 'Кофемания', +74994951582, 'Малый Черкасский пер.2');
INSERT INTO restaurant VALUES(7, 'Зарядье', +74955310950, 'ул. Варварка 6с3');
INSERT INTO restaurant VALUES(8, 'Рыба моя', +74957846858, 'Славянская площадь, 2');
INSERT INTO restaurant VALUES(9, 'The бык', +74959881717, 'Страстной бул, 8А');
INSERT INTO restaurant VALUES(10, 'Пушкинъ', +74957390033, 'Тверской бул, 26А');


INSERT INTO waiter VALUES(1, 1, 'Степан Степанов', '2000-03-22', 0, '+79163692587');
INSERT INTO waiter VALUES(2, 1, 'Петр Распутин', '1985-01-13', 10, '+79125896321');
INSERT INTO waiter VALUES(3, 1, 'Ксения Павлова', '1995-12-10', 5, '+79162589654');
INSERT INTO waiter VALUES(4, 1, 'Мария Коломенская', '1997-03-25', 3, '+79162514758');
INSERT INTO waiter VALUES(5, 1, 'Екатерина Кедрова', '1987-01-18', 7, '+79125627521');
INSERT INTO waiter VALUES(6, 1, 'Евгений Петров', '1993-10-27', 6, '+79162006454');
INSERT INTO waiter VALUES(7, 1, 'Владислав Замухарецкий', '1993-05-16', 8, '+79165876758');
INSERT INTO waiter VALUES(8, 4, 'Роман Попов', '1989-02-06', 7, '+79125876459');
INSERT INTO waiter VALUES(9, 10, 'Наталья Полякова', '1991-04-04', 8, '+794569521634');
INSERT INTO waiter VALUES(10, 5, 'Леонид Летунов', '1994-04-15', 6, '+79168741236');
INSERT INTO waiter VALUES(11, 5, 'Лев Акимов', '1996-03-02', 4, '+79165826930');
INSERT INTO waiter VALUES(12, 3, 'Александр Александров', '1996-08-18', 5, '+79166458910');
INSERT INTO waiter VALUES(13, 7, 'Анатолий Анатольев', '1999-09-09', 2, '+79125462138');


INSERT INTO customer VALUES(0);
INSERT INTO customer VALUES(1);
INSERT INTO customer VALUES(2);
INSERT INTO customer VALUES(3);
INSERT INTO customer VALUES(4);
INSERT INTO customer VALUES(5);
INSERT INTO customer VALUES(6);
INSERT INTO customer VALUES(7);
INSERT INTO customer VALUES(8);
INSERT INTO customer VALUES(9);
INSERT INTO customer VALUES(10);
INSERT INTO customer VALUES(11);


INSERT INTO menu VALUES(1, 5, 'Основное');
INSERT INTO menu VALUES(2, 2, 'Детское');
INSERT INTO menu VALUES(3, 7, 'Веганское');
INSERT INTO menu VALUES(4, 8, 'Винная карта');
INSERT INTO menu VALUES(5, 5, 'Летнее');
INSERT INTO menu VALUES(6, 10, 'Осеннее');
INSERT INTO menu VALUES(7, 3, 'Зимнее');
INSERT INTO menu VALUES(8, 1, 'Весеннее');
INSERT INTO menu VALUES(9, 2, 'Нежное');
INSERT INTO menu VALUES(10, 9, 'На предзаказ');


INSERT INTO customer_order VALUES(1, 3, 1, 6, 1, '2023-04-09 13:20:32', '2023-04-09 14:52:01', 'card', 5000);
INSERT INTO customer_order VALUES(2, 1, 4, 6, 2, '2023-04-09 13:24:32', '2023-04-09 15:12:53', 'card', 3500);
INSERT INTO customer_order VALUES(3, 3, 2, 6, 3, '2023-04-09 13:33:32', '2023-04-09 15:32:27', 'cash', 4000);
INSERT INTO customer_order VALUES(4, 1, 5, 6, 4, '2023-04-09 13:37:25', '2023-04-09 15:52:01', 'card', 2135);
INSERT INTO customer_order VALUES(5, 7, 3, 5, 5, '2023-04-09 13:42:12', '2023-04-09 17:32:47', 'card', 3997);
INSERT INTO customer_order VALUES(6, 8, 10, 6, 6, '2023-04-09 13:43:15', '2023-04-09 17:02:01', 'cash', 6100);
INSERT INTO customer_order VALUES(7, 1, 9, 3, 7, '2023-04-09 13:48:56', '2023-04-09 15:34:55', 'card', 5483);
INSERT INTO customer_order VALUES(8, 6, 8, 6, 8, '2023-04-09 13:51:22', '2023-04-09 15:55:11', 'card', 4760);
INSERT INTO customer_order VALUES(9, 1, 6, 6, 9, '2023-04-09 13:56:25', '2023-04-09 15:55:22', 'card', 3100);
INSERT INTO customer_order VALUES(10, 6, 7, 3, 10, '2023-04-09 13:58:42', '2023-04-09 16:56:31', 'card', 4330);


INSERT INTO dish VALUES(1, 1, 'Бургер', '20 минут', 'Горячее');
INSERT INTO dish VALUES(2, 1, 'Салат Цезарь', '10 минут', 'Салаты');
INSERT INTO dish VALUES(3, 1, 'Стейк рибай', '7 минут', 'Горячее');
INSERT INTO dish VALUES(4, 9, 'Филе палтуса', '15 минут', 'Горячее');
INSERT INTO dish VALUES(5, 1, 'Паста', '20 минут', 'Горячее');
INSERT INTO dish VALUES(6, 1, 'Бефстроганов', '20 минут', 'Горячее');
INSERT INTO dish VALUES(7, 6, 'Кесадилья', '7 минут', 'Закуски');
INSERT INTO dish VALUES(8, 9, 'Овсянка с голубикой', '10 минут', 'Завтраки');
INSERT INTO dish VALUES(9, 1, 'Шницель', '20 минут', 'Горячее');
INSERT INTO dish VALUES(10, 2, 'Сырники', '10 минут', 'Завтраки');


INSERT INTO ingredient VALUES(1, 'Свинина');
INSERT INTO ingredient VALUES(6, 'Свинина');
INSERT INTO ingredient VALUES(9, 'Свинина');
INSERT INTO ingredient VALUES(5, 'Спагетти');
INSERT INTO ingredient VALUES(5, 'Грибы');
INSERT INTO ingredient VALUES(4, 'Палтус');
INSERT INTO ingredient VALUES(5, 'Лук');
INSERT INTO ingredient VALUES(6, 'Лук');
INSERT INTO ingredient VALUES(7, 'Кунжут');
INSERT INTO ingredient VALUES(2, 'Томаты');
INSERT INTO ingredient VALUES(1, 'Томаты');
INSERT INTO ingredient VALUES(2, 'Салат');
INSERT INTO ingredient VALUES(1, 'Салат');
INSERT INTO ingredient VALUES(2, 'Сухари');
INSERT INTO ingredient VALUES(5, 'Курица');
INSERT INTO ingredient VALUES(8, 'Овсянка');
INSERT INTO ingredient VALUES(10, 'Яйцо');
INSERT INTO ingredient VALUES(1, 'Яйцо');
INSERT INTO ingredient VALUES(2, 'Яйцо');
INSERT INTO ingredient VALUES(5, 'Яйцо');
INSERT INTO ingredient VALUES(7, 'Яйцо');
INSERT INTO ingredient VALUES(9, 'Яйцо');
INSERT INTO ingredient VALUES(8, 'Голубика');
INSERT INTO ingredient VALUES(1, 'Булка');
INSERT INTO ingredient VALUES(2, 'Соус');
INSERT INTO ingredient VALUES(5, 'Соус');
INSERT INTO ingredient VALUES(6, 'Соус');
INSERT INTO ingredient VALUES(1, 'Кунжут');
INSERT INTO ingredient VALUES(10, 'Творог');


INSERT INTO dish_in_order VALUES(1, 3);
INSERT INTO dish_in_order VALUES(2, 4);
INSERT INTO dish_in_order VALUES(3, 1);
INSERT INTO dish_in_order VALUES(4, 1);
INSERT INTO dish_in_order VALUES(5, 5);
INSERT INTO dish_in_order VALUES(6, 10);
INSERT INTO dish_in_order VALUES(7, 6);
INSERT INTO dish_in_order VALUES(8, 7);
INSERT INTO dish_in_order VALUES(9, 2);
INSERT INTO dish_in_order VALUES(10, 9);
