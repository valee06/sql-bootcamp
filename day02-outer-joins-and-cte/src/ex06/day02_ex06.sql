select m.pizza_name as pizza_name,
       pz.name as pizzeria_name
from person_order as po
join (select * from person where name = 'Anna' or name = 'Denis') as p 
on po.person_id = p.id
left join menu as m on po.menu_id = m.id
left join pizzeria as pz on m.pizzeria_id = pz.id
order by pizza_name, pizzeria_name;