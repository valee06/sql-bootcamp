with date_cte(d) as
(
    select generate_series('2022-01-01'::date, '2022-01-10'::date, interval '1 day')
)
select d::date as missing_date 
from  date_cte
left join person_visits as pv on pv.visit_date = d::date and (pv.person_id = 1 or pv.person_id = 2)
where pv.person_id is null
order by missing_date;