-- session #1
begin transaction;

-- session #2
begin transaction;

-- session #1
update pizzeria 
set name = 'Nice Pizza' where id = 1;
-- изменили данные для первой пиццерии в 1 сессии

-- session #2
update pizzeria
set name = 'Bad Pizza' where id = 2;
-- изменили данные для второй пиццерии во 2 сессии

-- session #1
update pizzeria
set name = 'Funny Pizza' where id = 2;
-- изменили данные для второй пиццерии в 1 сессии

-- session #2
update pizzeria
set name = 'Cringe Pizza' where id = 1;
-- ошибка: deadlock detected

-- session #1
commit transaction;
-- публикуем изменения

-- session #2
commit transaction;
-- cлучается rollback

-- session #1
select * from pizzeria where id in (1,2);

-- session #2
select * from pizzeria where id in (1,2);
