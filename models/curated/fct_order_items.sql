{{ config(
    materialized='incremental',
    unique_key='order_items_skey'
) }}

select
    order_items_skey,
    order_skey,
    product_skey,
    order_item_id,
    seller_id,
    shipping_limit_date,
    price,
    freight_value
from {{ ref("order_items_refined_model") }}

{% if is_incremental() %}
WHERE
    order_items_skey > (SELECT MAX(order_items_skey) FROM {{ this }})
{% endif %}