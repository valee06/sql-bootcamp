create function func_minimum(variadic arr numeric[])
returns numeric as $$
    (select min(val) from unnest(arr) val)
$$ language sql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);