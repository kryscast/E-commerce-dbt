select
    order_id,
    order_item_id,
    product_id,
    seller_id,
    shipping_limit_date,
    price,
    freight_value,
    {{ dbt_utils.generate_surrogate_key(["product_id"]) }} as product_skey,
    {{ dbt_utils.generate_surrogate_key(["order_id"]) }} as order_skey,
    {{ dbt_utils.generate_surrogate_key(["product_id", "order_id", "order_item_id"]) }}
    as order_items_skey
from {{ ref("order_items_raw_model") }}
