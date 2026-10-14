select p.name as name,
       m.pizza_name as pizza_name,
       m.price as price,
       trim_scale(m.price - m.price * pd.discount / 100) as discount_price,
       pz.name as pizzeria_name
from person_order as po
join person as p on po.person_id = p.id
join menu as m on po.menu_id = m.id
join person_discounts as pd 
on po.person_id = pd.person_id and m.pizzeria_id = pd.pizzeria_id
join pizzeria as pz on m.pizzeria_id = pz.id
order by name, pizza_name;