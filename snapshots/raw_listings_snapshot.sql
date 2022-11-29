{% snapshot raw_listings_snapshot_check %}

    select * from {{ref('src_listings')}}

{% endsnapshot %}