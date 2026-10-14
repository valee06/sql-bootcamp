insert into person_order(id, person_id, menu_id, order_date)
values ((select max(id) from person_order) + 1, 
(select id from person where name = 'Denis'), 
(select id from menu where pizza_name = 'sicilian pizza' and 
pizzeria_id = (select id from pizzeria where name = 'Dominos')),
'2022-02-24'),
((select max(id) from person_order) + 2, 
(select id from person where name = 'Irina'), 
(select id from menu where pizza_name = 'sicilian pizza' and 
pizzeria_id = (select id from pizzeria where name = 'Dominos')),
'2022-02-24');

--select * from person_order;