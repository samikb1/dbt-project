with cte_payments_agg as (
    select 
payment_type
,sum(amount)
from {{ source("raw","stg_payments") }}
group by 1
)

select * from cte_payments_agg