-- session #1
begin transaction;

-- session #2
begin transaction;

-- session #1
select * from pizzeria where name = 'Pizza Hut';
-- проверка текущего значения

-- session #2
update pizzeria
set rating = 3.6
where name = 'Pizza Hut';
-- меняем содержимое таблицы

commit transaction;
-- опубликовали изменения

-- session #1
select * from pizzeria where name = 'Pizza Hut';
-- смотрим на изменения

commit transaction;
-- опубликовали изменения

select * from pizzeria where name = 'Pizza Hut';
-- проверка изменений

-- session #2
select * from pizzeria where name = 'Pizza Hut';
-- проверка изменений