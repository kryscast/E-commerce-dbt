select customers.city, customers.state, products.category_name
from {{ ref("dim_customers") }} as customers
inner join
    {{ ref("fct_orders") }} as orders on customers.customer_skey = orders.customer_skey
inner join
    {{ ref("fct_order_items") }} as order_items
    on orders.order_skey = order_items.order_skey
inner join
    {{ ref("dim_products") }} as products
    on order_items.product_skey = products.product_skey
