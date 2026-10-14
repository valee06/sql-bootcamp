select m1.pizza_name as pizza_name,
       pz1.name as pizzeria_name_1,
       pz2.name as pizzeria_name_2,
       m2.price as price
from menu as m1
join menu as m2 
on (m1.pizza_name = m2.pizza_name
and m1.price = m2.price
and m1.pizzeria_id > m2.pizzeria_id)
join pizzeria as pz1 on m1.pizzeria_id = pz1.id
join pizzeria as pz2 on m2.pizzeria_id = pz2.id
order by pizza_name;