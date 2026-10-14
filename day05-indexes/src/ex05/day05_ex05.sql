create unique index idx_person_order_order_date
on person_order(person_id, menu_id) where order_date = '2022-01-01';

set enable_seqscan = off;
explain analyze select m.pizza_name as pizza_name, p.name as name 
from person_order as po 
join menu as m on po.menu_id = m.id
join person as p on po.person_id = p.id
where po.order_date = '2022-01-01';