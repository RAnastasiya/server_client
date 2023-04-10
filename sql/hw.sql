DROP TABLE IF EXISTS pizzas;
-- Створіть таблицю “pizza” (“id”, “name”, “price”, “diameter”). Валюту не враховуємо!
CREATE TABLE pizzas(
    id SERIAL PRIMARY KEY,
    name VARCHAR(64) NOT NULL CHECK(name != ''),
    price NUMERIC(8,2) NOT NULL CHECK(price > 0),
    diameter NUMERIC(3) NOT NULL CHECK(diameter >= 18 AND diameter <= 38)
);

-- Завдання на INSERT
-- Додати нову піцу Маргарита, діаметр 18, ціна 50,4грн.
INSERT INTO pizzas(name, diameter, price)
VALUES ('Маргарита', 18, 54.4);

-- Додати нову піцу Карбонара, діаметр 28, ціна 81грн.
INSERT INTO pizzas(name, diameter, price)
VALUES ('Карбонара', 28, 81);

-- Додайте дві нові піци одним запитом: Цезар, діаметр 38, ціна 149грн, Пепероні, діаметр 32, ціна 116грн
INSERT INTO pizzas(name, diameter, price)
VALUES ('Цезар', 38, 149), ('Пепероні', 32, 116);

-- Завдання на UPDATE
-- Поставте ціну Маргаріті 53грн.
UPDATE pizzas
SET price = 53
WHERE name = 'Маргарита';

-- Піца з id=4 поставте діаметр 30, поверніть усі оновлені данні.
UPDATE pizzas
SET diameter = 30
WHERE id = 4
RETURNING *;

-- Усім піцам, чия ціна більша за 100грн зробіть її 130грн, поверніть усі оновлені данні.
UPDATE pizzas
SET price = 130
WHERE price > 100
RETURNING *;

-- Піц з id більше 2 і менше 5 включно поставте діаметр 22.
UPDATE pizzas
SET diameter = 22
WHERE id BETWEEN 2 AND 5;

-- Змініть Цезар на 4 сири та поставте ціну 180.
UPDATE pizzas
SET price = 180, name = '4 сири'
WHERE name = 'Цезар';

-- Завдання на SELECT
-- Вибрати піцу з id=3.
SELECT id, name, price, diameter
FROM pizzas
WHERE id = 3;

-- Вибрати піцу із ціною менше 100грн.
SELECT id, name, price, diameter
FROM pizzas
WHERE price < 100;

-- Вибрати піцу з ціною не рівною 130грн.
SELECT id, name, price, diameter
FROM pizzas
WHERE price != 130;

-- Дізнайтесь ціну і діаметр Пепероні.
SELECT name, price
FROM pizzas
WHERE name = 'Пепероні';

-- Вибрати піцу під назвою Маргарита.
SELECT id, name, price, diameter
FROM pizzas
WHERE name = 'Маргарита';

-- Вибрати всі піци, крім тієї, яка називається Карбонара.
SELECT id, name, price, diameter
FROM pizzas
WHERE name != 'Карбонара';

-- Вибрати всі піци діаметром 22 та ціною менше 150грн.
SELECT id, name, price, diameter
FROM pizzas
WHERE diameter = 22 AND price < 150;

-- Вибрати піцу з діаметром від 25 до 33 включно.
SELECT id, name, price, diameter
FROM pizzas
WHERE diameter BETWEEN 25 AND 33;

-- Вибрати піци з діаметром від 25 до 33 або з ціною від 100 до 200 грн.
SELECT id, name, price, diameter
FROM pizzas
WHERE diameter BETWEEN 26 AND 32 AND price BETWEEN 101 AND 199;

-- Вибрати всі піци діаметром 22 або 180грн.
SELECT id, name, price, diameter
FROM pizzas
WHERE diameter = 26 OR price = 180;

-- Завдання на DELETE
-- Видаліть піцу з id=3.
DELETE FROM pizzas 
WHERE id = 3;

-- Видаліть Пепероні, поверніть усі видалені данні.
DELETE FROM pizzas 
WHERE name = 'Пепероні'
RETURNING *;

-- Видаліть всі піци, які мають діаметр 18, поверніть усі видалені данні.
DELETE FROM pizzas 
WHERE diameter = 18
RETURNING *;