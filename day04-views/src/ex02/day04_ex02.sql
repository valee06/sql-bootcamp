create view v_generated_dates as
(select d::date as generated_date from
generate_series('2022-01-01'::date, '2022-01-31'::date, interval '1 day') as d
order by generated_date);