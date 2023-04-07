ALTER TABLE users 
ADD COLUMN weight SMALLINT CHECK(weight BETWEEN 25 AND 250);

SELECT * FROM users;

UPDATE users
SET weight = (height - 0.8) * 100;

UPDATE users
SET weight = 80
WHERE id = 120;

UPDATE users
SET weight = 80
WHERE id = 125
RETURNING *;

-- 1
UPDATE users
SET weight = 55
WHERE first_name = IN ('Anna', 'Mary')
RETURNING *;

-- 2
UPDATE users
SET weight = 230
WHERE is_male = TRUE 
AND extract(years FROM age(birthday)) > 65
AND height > 2
RETURNING *; 

-- 3
UPDATE users
SET weight = 60
WHERE is_male = FALSE 
AND extract(years FROM age(birthday)) < 35
AND height <= 1.65
RETURNING *; 
