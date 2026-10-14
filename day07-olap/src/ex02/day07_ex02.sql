(select name, count(*), 'visit' as action_type
from person_visits as pv
join pizzeria as pz on pz.id = pv.pizzeria_id
group by name
order by count desc limit 3)
union
(select name, count(*), 'order' as action_type
from person_order as po
join menu as m on m.id = po.menu_id
join pizzeria as pz on pz.id = m.pizzeria_id
group by name
order by count desc limit 3)
order by action_type asc, count desc;