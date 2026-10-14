select m.pizza_name as pizza_name, 
       m.price as price,
       pz.name as pizzeria_name,
       pv.visit_date as visit_date
from (select * from person where name = 'Kate') as p 
join person_visits as pv on pv.person_id = p.id
join pizzeria as pz on pv.pizzeria_id = pz.id
join (select * from menu where price between 800 and 1000) as m 
on pz.id = m.pizzeria_id
order by pizza_name, price, pizzeria_name;
