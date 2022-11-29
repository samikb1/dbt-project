select
    value:c1::number(38,0) as listing_id
    ,value:c2::timestamp_tz as review_date
    ,value:c3::string as reviewer_name
    ,value:c4::string as review_text
    ,value:c5::string as review_sentiment
from
    {{ source ('raw','reviews_raw')}}