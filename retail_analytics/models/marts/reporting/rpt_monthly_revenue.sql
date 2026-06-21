select
    date_trunc('month', order_purchase_timestamp) as order_month,
    count(distinct order_id) as total_orders,
    count(*) as total_order_items,
    sum(gross_item_value) as gross_revenue,
    sum(price) as product_revenue,
    sum(freight_value) as freight_revenue,
    avg(gross_item_value) as avg_item_value,
    avg(is_late_delivery) as late_delivery_rate

from {{ ref('fct_order_items') }}

group by 1