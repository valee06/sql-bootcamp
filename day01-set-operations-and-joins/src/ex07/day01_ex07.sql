select po.order_date as order_date, 
concat(p.name, ' (age:', p.age, ')') as person_information
from person_order as po join person as p on po.person_id = p.id
order by order_date, person_information;