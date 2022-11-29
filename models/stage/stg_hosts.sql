WITH cte_source AS (

  SELECT * FROM {{ source('raw','src_hosts') }}

),
cte_transformed AS (
    select
    host_id
    ,NVL(host_name, 'Anonymous') as host_name
    ,is_superhost
    ,created_at
    ,updated_at
    ,current_timestamp() as staged_at
from
cte_source
)

select
    host_id
    ,host_name
    ,is_superhost
    ,created_at
    ,updated_at
    ,staged_at
from
cte_transformed
