{% macro rupees_to_dollars(column_name) %}
    {{ column_name }}/80
{% endmacro %}