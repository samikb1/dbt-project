{% macro get_column_values(column_name, relation) %}

{% set relation_query %}
select distinct
{{ column_name }}
from {{ relation }}
order by 1
{% endset %}

{% set results = run_query(relation_query) %}

{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}

{% endmacro %}


{% macro get_payment_methods(columnname) %}

{#{{ return(get_column_values('payment_type', source('raw','stg_payments'))) }}#}
{{ return(get_column_values(columnname, source('raw','stg_payments')) )}}
{% endmacro %}
