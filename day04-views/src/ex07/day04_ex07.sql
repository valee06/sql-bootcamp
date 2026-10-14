insert into person_visits(id, person_id, pizzeria_id, visit_date)
values ((select max(id) + 1 from person_visits), 
(select id from person where name = 'Dmitriy'), 
(select pz.id from pizzeria as pz join menu as m on m.pizzeria_id = pz.id
where m.price < 800 and pz.name not in (select name from mv_dmitriy_visits_and_eats) 
order by pz.id limit 1),
 '2022-01-08');

refresh MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
