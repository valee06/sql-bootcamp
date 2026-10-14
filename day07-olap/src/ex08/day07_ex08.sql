select p.address as address, pz.name as name, count(*) as count_of_orders
from person_order as po
join person as p on p.id = po.person_id
join menu as m on m.id = po.menu_id
join pizzeria as pz on pz.id = m.pizzeria_id
group by p.address, pz.name
order by address, name;