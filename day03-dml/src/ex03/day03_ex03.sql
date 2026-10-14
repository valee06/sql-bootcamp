(select pz.name as pizzeria_name
from person_visits as pv 
join (select * from person where gender = 'female') as p
on pv.person_id = p.id
join pizzeria as pz on pv.pizzeria_id = pz.id
EXCEPT ALL
select pz.name as pizzeria_name
from person_visits as pv 
join (select * from person where gender = 'male') as p
on pv.person_id = p.id
join pizzeria as pz on pv.pizzeria_id = pz.id)

UNION ALL

(select pz.name as pizzeria_name
from person_visits as pv 
join (select * from person where gender = 'male') as p
on pv.person_id = p.id
join pizzeria as pz on pv.pizzeria_id = pz.id
EXCEPT ALL
select pz.name as pizzeria_name
from person_visits as pv 
join (select * from person where gender = 'female') as p
on pv.person_id = p.id
join pizzeria as pz on pv.pizzeria_id = pz.id)
order by pizzeria_name;