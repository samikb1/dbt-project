{{ config(database='STAGE',transient='false') }}

select
   month(emp_date) as month_name
  ,sum(emp_sal) as total_sal

from
{{source ('RAW','RAW_EMP_INFO')}}
group by 1