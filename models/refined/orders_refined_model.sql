select
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp,
    date(order_purchase_timestamp) as order_purchase_date,
    order_approved_at,
    order_delivered_carrier_date,
    order_delivered_customer_date,
    order_estimated_delivery_date,
    timestampdiff(
        day, order_approved_at, order_delivered_customer_date
    ) as order_travel_time,
        DATEDIFF(day, order_delivered_customer_date, order_estimated_delivery_date) 
        AS delivery_date_difference,
    CASE
        WHEN order_estimated_delivery_date IS NOT NULL 
             AND DATEDIFF(day, order_purchase_timestamp, order_estimated_delivery_date) != 0 THEN
            DATEDIFF(day, order_delivered_customer_date, order_estimated_delivery_date) 
            / NULLIF(DATEDIFF(day, order_purchase_timestamp, order_estimated_delivery_date), 0) * 100
        ELSE
            NULL
    END AS delivery_time_error_percentage,
CASE
    WHEN delivery_time_error_percentage = 100 THEN 'Great'
    WHEN delivery_time_error_percentage BETWEEN 50 AND 99 THEN 'Very good'
    WHEN delivery_time_error_percentage BETWEEN 1 AND 49 THEN 'Good'
    WHEN delivery_time_error_percentage = 0 THEN 'Neutral'
    WHEN delivery_time_error_percentage BETWEEN -49 AND -1 THEN 'Needs work'
    WHEN delivery_time_error_percentage BETWEEN -99 AND -50 THEN 'Bad'
    WHEN delivery_time_error_percentage < -100 THEN 'Very bad'
END AS accuracy,
    {{ dbt_utils.generate_surrogate_key(["ORDER_ID"]) }} as order_skey,
    {{ dbt_utils.generate_surrogate_key(["CUSTOMER_ID"]) }} as customer_skey,
    {{ dbt_utils.generate_surrogate_key(["ORDER_PURCHASE_DATE"]) }}
    as order_purchase_date_skey
from {{ ref("orders_raw_model") }}
