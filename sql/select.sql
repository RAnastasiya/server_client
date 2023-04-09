SELECT * FROM users;

SELECT id, first_name, last_name, is_male 
FROM users;

SELECT id, first_name, last_name, is_male 
FROM users
WHERE is_male = FALSE;

SELECT id, first_name, last_name, is_male 
FROM users
WHERE id % 5 = 0;

SELECT id, first_name, last_name, is_male 
FROM users
WHERE id % 5 = 0 AND is_male = FALSE;

SELECT id, first_name, last_name, is_male 
FROM users
WHERE is_male = TRUE AND id % 2 = 1;

SELECT id, first_name, last_name, is_male 
FROM users
WHERE first_name = 'Don';

SELECT id, first_name, last_name, is_male 
FROM users
WHERE first_name IN ('Don', 'Mary', 'Alex', 'Sara');

SELECT id, first_name, last_name, is_male 
FROM users
WHERE id >= 300 AND id < 305;

SELECT id, first_name, last_name, is_male 
FROM users
WHERE id BETWEEN 300 AND 305;

SELECT id, first_name, last_name, is_male 
FROM users
WHERE id BETWEEN SYMMETRIC 305 AND 300;

SELECT id, first_name, last_name, is_male 
FROM users
WHERE is_male = TRUE AND height BETWEEN 1.80 AND 1.95;

SELECT id, first_name, is_male, 
extract(years FROM age(birthday)) AS age,
extract(years FROM birthday) AS year_of_bday
FROM users;

-- 1 усі молодше 28 років
SELECT id, first_name, is_male, 
extract(years FROM age(birthday)) AS age
FROM users
WHERE extract(years FROM age(birthday)) < 28;

SELECT id, first_name, is_male, 
extract(years FROM age(birthday)) AS age
FROM users
WHERE age(birthday) < make_interval(28);

--2 усі жінки від 25 до 29 років
SELECT id, first_name, is_male, birthday,
extract(years FROM age(birthday)) AS age
FROM users
WHERE is_male = FALSE AND extract(years FROM age(birthday)) BETWEEN 25 AND 26;

SELECT id, first_name, is_male, birthday,
age(birthday) AS age,
make_interval(25) AS interval
FROM users
WHERE is_male = FALSE AND age(birthday) BETWEEN make_interval(25) AND make_interval(26);

--3 усі хто народився в 1998 році
SELECT id, first_name, is_male, 
extract(years FROM birthday) AS year_of_bday
FROM users
WHERE extract(years FROM birthday) = 1998;

--4 усі хто народився 13 числа
SELECT id, first_name, is_male, 
extract(days FROM birthday) AS day_of_bday
FROM users
WHERE extract(days FROM birthday) = 13;

--5 усі чоловіки які народились влітку
SELECT id, first_name, is_male, 
extract(months FROM birthday) AS month_of_bday
FROM users
WHERE is_male = TRUE AND extract(months FROM birthday) BETWEEN 6 AND 8;

SELECT id, first_name, is_male, 
extract(months FROM birthday) AS month_of_bday
FROM users
WHERE is_male = TRUE AND extract(months FROM birthday) IN (6,7,8);

--6 усі чоловіки віком старше 45 зі зростом менше 1.75
SELECT id, first_name, is_male, height, 
extract(years FROM age(birthday)) AS age
FROM users
WHERE is_male = TRUE AND extract(years FROM age(birthday)) > 45 AND height < 1.75;

--7
SELECT id, email, is_male, extract(years FROM age(birthday)) AS age, height
FROM users
WHERE is_male = TRUE 
AND extract(years FROM age(birthday)) > 35 
AND height < 1.65
LIMIT 10 OFFSET 10;

--8 fullname
SELECT first_name || ' ' || last_name AS full_name
FROM users
LIMIT 10 OFFSET 10;

SELECT concat(first_name , ' ', last_name) AS full_name
FROM users
LIMIT 10 OFFSET 10;

--9 
SELECT concat(first_name , ' ', last_name) AS full_name,
length(concat(first_name , ' ', last_name)) AS length
FROM users
WHERE length(concat(first_name , ' ', last_name)) BETWEEN 15 AND 19;


SELECT * 
FROM (
    SELECT concat(first_name , ' ', last_name) AS full_name,
    length(concat(first_name , ' ', last_name)) AS length
    FROM users
) AS fn_lenght

WHERE fn_lenght.length BETWEEN 15 AND 19;