select pz.name as pizzeria_name
from pizzeria as pz 
where pz.id in 
((select pv.pizzeria_id from person_visits as pv
join (select * from person where name = 'Andrey') as p on pv.person_id = p.id)
EXCEPT 
(select m.pizzeria_id from person_order as po
join (select * from person where name = 'Andrey' ) as p on po.person_id = p.id
join menu as m on po.menu_id = m.id))
order by pizzeria_name;