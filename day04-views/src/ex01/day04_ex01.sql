(select f.name as name 
from v_persons_female as f)
union
(select m.name as name
from v_persons_male as m)
order by name;