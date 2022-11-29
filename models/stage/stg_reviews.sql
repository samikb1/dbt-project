WITH cte_source AS (

  SELECT * FROM {{ source('raw','src_reviews') }}

)
    select
    listing_id
    ,review_date
    ,reviewer_name
    ,review_text
    ,review_sentiment
    ,current_timestamp() as staged_at
from
cte_source