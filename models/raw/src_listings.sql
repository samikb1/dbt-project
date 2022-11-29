select
    value:c1::number(38,0) as listing_id
    ,value:c2::string as listing_url
    ,value:c3::string as listing_name
    ,value:c4::varchar(1000) as room_type
    ,value:c5::integer as minimum_nights
    ,value:c6::number(38,0) as host_id
    ,value:c7::string as price_str
    ,value:c8::timestamp_tz as created_at
    ,value:c9::timestamp_tz as updated_at
from
    {{ source ('raw','listings_raw')}}