select name, count(*) as count_of_visits
from person_visits as pv
join person as p on p.id = pv.person_id
group by name
order by count_of_visits desc, name asc limit 4;