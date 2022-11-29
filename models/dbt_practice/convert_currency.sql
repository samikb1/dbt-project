with cte_payments as (
select * from {{ source('raw','stg_payments') }}
)

,convert_currency as (

select order_id
,{{ rupees_to_dollars('amount') }} as amount_dollars

from
cte_payments
group by 1,2
)

select * from convert_currency
