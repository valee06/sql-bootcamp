select m.pizza_name as pizza_name,
       pz.name as pizzeria_name,
       m.price as price
from menu as m
left join pizzeria as pz
on m.pizzeria_id = pz.id
where pizza_name = 'mushroom pizza' or pizza_name = 'pepperoni pizza'
order by pizza_name, pizzeria_name;