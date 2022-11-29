WITH cte_listings AS (
    select 
        listing_id
        ,listing_name
        ,room_type
        ,minimum_nights
        ,price
        ,host_id
        ,created_at
        ,staged_at
    from
        {{source('stage','stg_listings')}}
),

cte_joined AS (
    SELECT
         listing_id
        ,listing_name
        ,room_type
        ,minimum_nights
        ,price
        ,a.host_id
        ,host_name
        ,is_superhost
        ,a.created_at
        ,a.staged_at
FROM
    cte_listings a
LEFT JOIN
    {{source('stage','stg_hosts')}} b
   on a.host_id = b.host_id 
)

SELECT
       listing_id
        ,listing_name
        ,room_type
        ,minimum_nights
        ,price
        ,host_id
        ,host_name
        ,is_superhost
        ,created_at
        ,staged_at
FROM
    cte_joined