{% macro create_masking_policy_pii_string(node_database,node_schema) %}

CREATE MASKING POLICY IF NOT EXISTS {{node_database}}.{{node_schema}}.pii_string AS (val string)

RETURNS string ->

    CASE WHEN CURRENT_ROLE() in ('ACCOUNTADMIN' )THEN val

        ELSE sha2(val)

    END

{% endmacro %}