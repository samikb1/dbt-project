{% snapshot orders_history_scd2 %}
{{ config
(
target_database= "dbt_project",
target_schema='unit_test',
strategy='timestamp',
unique_key='user_id',
updated_at='order_date'
)}}

select * from {{ source("orders","raw_orders")}}

{% endsnapshot %}