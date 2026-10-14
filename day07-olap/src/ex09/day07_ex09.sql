select address,  round(max(age) - (min(age) * 1.0 / max(age)), 2) as formula,
round(avg(age), 2) as average, 
case when (max(age) - (min(age) * 1.0 / max(age))) > avg(age) then true
else false 
end as comparison
from person 
group by address
order by address;