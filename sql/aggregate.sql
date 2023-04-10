SELECT min(weight), is_male
FROM users
GROUP BY is_male;

-- сумарний вес
SELECT sum(weight), is_male
FROM users
GROUP BY is_male

-- середній вес
SELECT avg(weight), is_male
FROM users
GROUP BY is_male;

SELECT count(*), first_name
FROM users
GROUP BY first_name;

SELECT count(*), first_name
FROM users
WHERE is_male = TRUE
GROUP BY first_name;

--1
-- кількість чоловіків , жінок
SELECT count(*), is_male
FROM users
GROUP BY is_male;

SELECT count(id), is_male
FROM users
GROUP BY is_male;

--2
-- середній зріст чоловіків, старше 35 років
SELECT avg(height)
FROM users
WHERE is_male = TRUE AND extract(years FROM age(birthday)) > 35;

SELECT avg(height), is_male
FROM users
WHERE extract(years FROM age(birthday)) > 35 AND is_male = TRUE
GROUP BY is_male;
--3
-- кількість юзерів, які народилися з 1982 по 1985 включно
SELECT count(*)
FROM users
WHERE extract(years FROM birthday) BETWEEN 1982 AND 1985;

SELECT count(id) AS "народилися з 1982 по 1985"
FROM users
WHERE extract(years FROM birthday) BETWEEN 1982 AND 1985;

-- кількість людей з прізвищами: Carlson, Reed, Horton
SELECT count(*), last_name
FROM users
WHERE last_name = 'Carlson' OR last_name = 'Reed' OR last_name = 'Horton'
GROUP BY last_name;

SELECT count(*), last_name
FROM users
WHERE last_name IN('Carlson','Reed','Horton')
GROUP BY last_name;

-- кількість людей, які народилися 08 08 будь якого року
SELECT count(*) AS "народилися 08 08 будь якого року"
FROM users
WHERE extract(months FROM age(birthday)) = 8 AND extract(days FROM age(birthday)) = 8;

SELECT count(*), extract(months FROM age(birthday)) AS months
FROM users
WHERE extract(months FROM age(birthday)) = 8 AND extract(days FROM age(birthday)) = 8
GROUP BY months;

-- кількість чоловіків зі зростом менше 1.6
SELECT count(*)
FROM users
WHERE is_male = TRUE AND height < 1.6;

-- кількість жінок з вагою більше 100
SELECT count(*)
FROM users
WHERE is_male = FALSE AND weight > 100;
