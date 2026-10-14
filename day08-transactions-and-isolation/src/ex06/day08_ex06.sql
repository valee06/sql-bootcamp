-- session #1
begin transaction isolation level repeatable read;
-- установили требуемый уровень изоляции на время текущей транзакции

-- session #2
begin transaction isolation level repeatable read;
-- установили требуемый уровень изоляции на время текущей транзакции

-- session #1
select sum(rating) from pizzeria;
-- проверка текущего значения суммы всех рейтингов

-- session #2
insert into pizzeria
values (11, 'Kazan Pizza 2', 4.0);
--добавляем новое значение в таблицу

commit transaction;
-- публикуем изменения 

-- session #1 
select sum(rating) from pizzeria;
-- проверяем наличие изменений в значении суммы рейтингов

commit transaction;
-- публикуем изменения

select sum(rating) from pizzeria;
-- проверка изменений

-- session #2
select sum(rating) from pizzeria;
-- проверка изменений
