with stg_salary as (select 
emp_no
,salary
,from_date
,to_date
,current_timestamp() as load_date
from
{{ ref("salaries") }}
)

select * from stg_salary