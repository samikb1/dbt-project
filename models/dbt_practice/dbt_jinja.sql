{%- set payments_type=['bank_transfer','upi','cheque','credit_card'] -%}

with cte_payments as (
select * from {{ source('raw','stg_payments') }}
)

,pivoted as (
    select
        order_id,
        {% for payment in payments_type -%}
        sum(case when payment_type = '{{ payment }}' then amount else 0 end) as {{ payment }}_amount
            {% if not loop.last %}
            ,
            {%- endif -%}
        {%- endfor -%}

        from 
        cte_payments
        where status='success'
        group by 1
)

select * from pivoted