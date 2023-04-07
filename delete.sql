DELETE FROM users 
WHERE id = 256
RETURNING *;

SELECT * FROM users;

DROP -- удалить полностью таблицу
TRUNCATE, DELETE  -- очистить таблицу