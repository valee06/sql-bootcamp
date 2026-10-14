select po.order_date as order_date, 
concat(p.name, ' (age:', p.age, ')') as person_information
from (select person_id as id, order_date from person_order) as po 
natural join person as p
order by order_date, person_information;