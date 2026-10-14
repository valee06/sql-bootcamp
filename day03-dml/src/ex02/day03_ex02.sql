select m.pizza_name as pizza_name,
       m.price as price,
       pz.name as pizzeria_name
from menu as m
join pizzeria as pz on m.pizzeria_id = pz.id
where m.id not in (select menu_id from person_order)
order by pizza_name, price;