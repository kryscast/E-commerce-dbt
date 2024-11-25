{{ config(
    materialized='incremental',
    unique_key='order_skey' 
) }}

SELECT
    order_skey,
    customer_skey,
    order_purchase_date_skey,
    order_id,
    order_status as status,
    order_purchase_timestamp as purchase_timestamp,
    order_purchase_date as purchase_date,
    order_approved_at as approved_at,
    order_delivered_carrier_date as deliveried_carrier_date,
    order_delivered_customer_date as delivered_customer_date,
    order_estimated_delivery_date as estimated_delivery_date,
    delivery_date_difference,
    delivery_time_error_percentage,
    order_travel_time
 from {{ref("orders_refined_model")}}

{% if is_incremental() %}
WHERE 
    order_skey > (SELECT MAX(order_skey) FROM {{ this }})
{% endif %}