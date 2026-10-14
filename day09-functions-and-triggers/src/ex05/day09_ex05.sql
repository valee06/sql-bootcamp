drop function fnc_persons_female(), fnc_persons_male();

create function fnc_persons(pgender varchar default 'female')
returns table (
    id bigint,
    name varchar,
    age integer,
    gender varchar,
    address varchar
) as $$
    (select * from person where gender = pgender)
$$ language sql;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();