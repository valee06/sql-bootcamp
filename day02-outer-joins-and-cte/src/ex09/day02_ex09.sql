select p.name as name
from (select * from person where gender = 'female') as p
join (select * from person_order where menu_id in 
     (select id from menu where pizza_name = 'pepperoni pizza')) as po_1
on p.id = po_1.person_id 
join (select * from person_order where menu_id in 
     (select id from menu where pizza_name = 'cheese pizza')) as po_2
on p.id = po_2.person_id 
order by name;