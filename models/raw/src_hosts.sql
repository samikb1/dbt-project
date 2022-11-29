WITH cte_source AS (

  SELECT * FROM {{ source('raw','hosts_raw') }}

),
cte_transformed AS (
    select
    value:c1::number(38,0) as host_id
    ,value:c2::string as host_name
    ,value:c3::string as is_superhost
    ,TRY_TO_TIMESTAMP_TZ(value:c4::string) as created_at
    ,value:c5::timestamp_tz as updated_at
from
cte_source
)
select
    host_id
    ,host_name
    ,is_superhost
    ,created_at
    ,updated_at
from
cte_transformed
