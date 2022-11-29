{% macro drop_stale_model(database='RAW_EXTRACT',schema='DBT_SBHATTACHARYA',days=0) %}
    {% set drop_commands %}
        select
            case when table_type='VIEW'
                then table_type
                else
                'TABLE'
            end as drop_type,
            'DROP' || ' ' || drop_type || ' ' || '{{ database }}.' || table_schema || '.' || table_name || ';' as command

        from {{ database }}.information_schema.tables
        where table_schema= '{{ schema }}'
        and last_altered <= current_date - {{ days }}
    {% endset %}

    {{ log('\nGenerating cleanup queries...\n',info=True)}}
    {% set drop_queries=run_query(drop_commands).columns[1].values() %}
        {{ log(drop_queries, info=True) }}
    {{ return([]) }}

{% endmacro%}