create function fnc_person_visits_and_eats_on_date(pperson varchar = 'Dmitriy',
pprice numeric = 500, pdate date = '2022-01-08')
returns table (
    pizzeria_name varchar
) as $$
    begin
        return query
        select pz.name 
        from (select * from person_visits where visit_date = pdate) as po 
        join (select * from person where person.name = pperson) as p
        on po.person_id = p.id
        join (select pz.id, pz.name from pizzeria as pz
        where id in (select distinct pizzeria_id from menu where price < pprice)) as pz
        on po.pizzeria_id = pz.id;
    end;
$$ language plpgsql;

select *  from fnc_person_visits_and_eats_on_date(pprice := 800);

select *  from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
