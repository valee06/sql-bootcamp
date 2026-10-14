insert into menu(id, pizzeria_id, pizza_name, price) 
values ((select max(id) from menu) + 1, 
(select id from pizzeria as pz where pz.name = 'Dominos'), 'sicilian pizza', 900);

--select * from menu;