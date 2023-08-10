with stg_salary as (select 
emp_no
,salary as gross_salary
,0.10 * salary as tax_deduction
,(salary - tax_deduction) as net_salary
,from_date
,to_date
,current_timestamp() as load_date
from
{{ ref("salaries") }}
)

select * from stg_salary