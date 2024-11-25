{{ config(
    materialized='incremental',
    unique_key='order_review_skey'
) }}

select 
    order_reviews.order_review_skey, 
    order_reviews.order_skey, 
    order_reviews.review_id, 
    order_reviews.review_score as score, 
    orders.order_travel_time,
    orders.delivery_date_difference,
    orders.delivery_time_error_percentage,
from {{ ref("order_reviews_refined_model") }} as order_reviews
inner join
    {{ ref("fct_orders") }} as orders on order_reviews.order_skey = orders.order_skey

{% if is_incremental() %}
WHERE 
    order_reviews.order_review_skey > (SELECT MAX(order_review_skey) FROM {{ this }})
{% endif %}