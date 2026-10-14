-- session #1
begin transaction;

update pizzeria
set rating = 5.0
where name = 'Pizza Hut';
-- меняем содержимое таблицы

select * from pizzeria where name = 'Pizza Hut';
-- проверяем изменения в текущем сеансе

-- session #2
select * from pizzeria where name = 'Pizza Hut';
-- нет изменений

-- session #1
commit transaction;
-- опубликовали изменения

-- session #2
select * from pizzeria where name = 'Pizza Hut';
-- увидели изменения