insert into person_order(id, person_id, menu_id, order_date) 
select ((select max(id) + 1 from person_order) + 
(select count(*) from person as p2 where p2.id < p.id)) as id, 
p.id as person_id, (select id from menu where pizza_name = 'greek pizza'
and pizzeria_id = (select id from pizzeria where name = 'Dominos')) as menu_id, 
'2022-02-25' as order_date
from person as p;

--select * from person_order;