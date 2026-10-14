set enable_seqscan = off;
explain analyze select m.pizza_name as pizza_name,
       pz.name as pizzeria_name
from menu as m 
join pizzeria as pz on m.pizzeria_id = pz.id;