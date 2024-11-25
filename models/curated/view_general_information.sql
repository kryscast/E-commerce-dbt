select 
    orders.purchase_date, 
    orders.order_id, 
    customer.city, 
    customer.state, 
    dates.month
from {{ ref("fct_orders") }} as orders
inner join
    {{ ref("dim_customers") }} as customer on customer.customer_skey = orders.customer_skey
inner join
    {{ ref("dim_dates") }} as dates on dates.date_skey = orders.order_purchase_date_skey
