create MATERIALIZED VIEW mv_dmitriy_visits_and_eats as
(select pz.name 
from (select * from person_visits where visit_date = '2022-01-08') as po 
join (select * from person where name = 'Dmitriy') as p
on po.person_id = p.id
join (select id, name from pizzeria 
where id in (select distinct pizzeria_id from menu where price < 800)) as pz
on po.pizzeria_id = pz.id);
