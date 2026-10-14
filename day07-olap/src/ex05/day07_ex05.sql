select distinct name 
from person_order as po
join person as p on p.id = po.person_id
order by name;