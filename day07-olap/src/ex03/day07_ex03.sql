select name, sum(count) as total_count
from 
((select pz.name, count(*)
from person_visits as pv
join pizzeria as pz on pz.id = pv.pizzeria_id
group by pz.name)
union all
(select pz.name, count(*)
from person_order as po
join menu as m on m.id = po.menu_id
join pizzeria as pz on pz.id = m.pizzeria_id
group by pz.name)) 
group by name
order by total_count desc, name asc;