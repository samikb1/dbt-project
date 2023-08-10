{% test salaries_is_positive(model,column_name) %}
{# { config(severity = 'warn') } #}

with validation as (
    select
        {{ column_name }} as salary_field
    from {{ model }}
)
, 
validation_errors as (
    select
        salary_field
    from
    validation
    where salary_field <= 0
)

select * from validation_errors

{% endtest %}