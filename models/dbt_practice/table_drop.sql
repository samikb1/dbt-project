{% set database = 'RAW_EXTRACT' %}
{% set schema = 'DBT_SBHATTACHARYA' %}

select
    case when table_type='VIEW'
        then table_type
        else
        'TABLE'
    end as drop_type,
    'DROP' || ' ' || drop_type || ' ' || '{{ database }}.' || table_schema || '.' || table_name || ';' as command

from {{ database }}.information_schema.tables
where table_schema= '{{ schema }}'