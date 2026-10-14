create view v_price_with_discount as
(select p.name as name,
       m.pizza_name as pizza_name,
       m.price as price,
       round(m.price - (m.price * 0.1)) as discount_price
from person_order as po
join person as p on po.person_id = p.id 
join menu as m on po.menu_id = m.id
order by name, pizza_name);