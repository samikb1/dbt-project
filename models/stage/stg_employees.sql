select
    emp_no
    ,birth_date
    ,first_name
    ,last_name
    ,gender
    ,hire_date
    ,current_timestamp()
from
ref{{ ("employees")}}