WITH cte_source AS (

  SELECT * FROM {{ source('raw','src_listings') }}

),
cte_transformed AS (
    select
    listing_id
    ,listing_url
    ,listing_name
    ,room_type
    ,case when minimum_nights = 0 then 1 
        ELSE minimum_nights
    END as minimum_nights
    ,host_id
    ,replace(price_str,'$') as price
    ,created_at
    ,updated_at
    ,current_timestamp() as staged_at
from
cte_source
)

select
    listing_id
    ,listing_url
    ,listing_name
    ,room_type
    ,minimum_nights
    ,host_id
    ,price
    ,created_at
    ,updated_at
    ,staged_at
from
cte_transformed
