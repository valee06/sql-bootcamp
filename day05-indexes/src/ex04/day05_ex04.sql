create index idx_menu_unique on menu(pizzeria_id, pizza_name);

set enable_seqscan = off;
explain analyze select pz.name as pizzeria_name, 
                       m.pizza_name as pizza_name
from menu as m join pizzeria as pz on m.pizzeria_id = pz.id;