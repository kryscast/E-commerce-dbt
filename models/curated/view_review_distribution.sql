SELECT 
    order_reviews.score,
    products.category_name
FROM {{ ref("fct_order_reviews") }} AS order_reviews
INNER JOIN {{ ref("fct_order_items") }} AS order_items ON order_reviews.order_skey = order_items.order_skey
INNER JOIN {{ ref("dim_products") }} AS products ON order_items.product_skey = products.product_skey