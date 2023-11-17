{% macro create_masking_policy_pii_number(node_database,node_schema) %}

CREATE MASKING POLICY IF NOT EXISTS {{node_database}}.{{node_schema}}.pii_number AS (val numeric)

RETURNS numeric ->

    CASE WHEN CURRENT_ROLE() in ('ACCOUNTADMIN' )THEN val

        ELSE 99999.99

    END

{% endmacro %}