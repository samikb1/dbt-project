{{ config (tags = ["positive_test"],
           database = 'RAW_EXTRACT',
           schema = 'STAGE',
           where = '"FROM_DATE < __seven_diff__"')
           }}

select 
*
from {{ ref('stg_salaries')}}
where salary < 0
