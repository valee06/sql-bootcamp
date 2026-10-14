select name, 
       count(*) as count_of_orders, 
       round(avg(price), 2) as average_price, 
       max(price) as max_price, 
       min(price) as min_price
from person_order as po
join menu as m on m.id = po.menu_id
join pizzeria as pz on pz.id = m.pizzeria_id
group by name
order by name;