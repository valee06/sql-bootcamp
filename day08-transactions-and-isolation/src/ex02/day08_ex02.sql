-- session #1
begin transaction isolation level repeatable read;
-- установили требуемый уровень изоляции на время текущей транзакции

-- session #2
begin transaction isolation level repeatable read;
-- установили требуемый уровень изоляции на время текущей транзакции

-- session #1
select * from pizzeria where name = 'Pizza Hut';
-- проверка текущего значения

-- session #2
select * from pizzeria where name = 'Pizza Hut';
-- проверка текущего значения

-- session #1
update pizzeria
set rating = 4.0
where name = 'Pizza Hut';
-- меняем содержимое таблицы

-- session #2
update pizzeria
set rating = 3.6
where name = 'Pizza Hut';
-- ошибка: could not serialize access due to concurrent update

-- session #1
commit transaction;
-- опубликовали изменения

-- session #2
commit transaction;
-- случается rollback

-- session #1
select * from pizzeria where name = 'Pizza Hut';
-- видим изменения из второй сессии


-- session #2
select * from pizzeria where name = 'Pizza Hut';
-- проверка изменений