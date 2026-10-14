select distinct p.name as  name
from (select * from person where gender = 'male' and 
     (address = 'Moscow' or address = 'Samara')) as p
join person_order as po on p.id = po.person_id
join (select * from menu where 
     pizza_name = 'mushroom pizza' or pizza_name = 'pepperoni pizza') as m
on po.menu_id = m.id
order by name desc;