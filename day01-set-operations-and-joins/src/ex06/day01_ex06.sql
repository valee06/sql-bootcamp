(select po.order_date as action_date, p.name as person_name
from person_order as po join person as p on po.person_id = p.id)
INTERSECT
(select visit_date, p.name
from person_visits as pv join person as p on pv.person_id = p.id)
order by action_date asc, person_name desc;