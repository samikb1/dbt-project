{{ config(alias='stg_orders_completed',tags=["finance"]) }}

select 
*
from
{{ source('orders','raw_orders')}}
where status='completed'