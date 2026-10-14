(select pz.name as pizzeria_name
from person_order as po
join (select * from person where gender = 'female') as p
on po.person_id = p.id
join menu as m on po.menu_id = m.id
join pizzeria as pz on m.pizzeria_id = pz.id
where pz.name not in
(select pz.name as pizzeria_name
from person_order as po
join (select * from person where gender = 'male') as p
on po.person_id = p.id
join menu as m on po.menu_id = m.id
join pizzeria as pz on m.pizzeria_id = pz.id))

UNION 

(select pz.name as pizzeria_name
from person_order as po
join (select * from person where gender = 'male') as p
on po.person_id = p.id
join menu as m on po.menu_id = m.id
join pizzeria as pz on m.pizzeria_id = pz.id
where pz.name not in 
(select pz.name as pizzeria_name
from person_order as po
join (select * from person where gender = 'female') as p
on po.person_id = p.id
join menu as m on po.menu_id = m.id
join pizzeria as pz on m.pizzeria_id = pz.id))
order by pizzeria_name;