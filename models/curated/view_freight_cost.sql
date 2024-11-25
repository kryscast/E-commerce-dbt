SELECT 
    orders.ORDER_ID,
    order_items.freight_value,
    order_items.price
FROM {{ ref("fct_order_items") }} as order_items
INNER JOIN {{ ref("fct_orders") }} as orders ON order_items.order_skey = orders.order_skey
