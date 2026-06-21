select
    oi.order_id,
    oi.order_item_id,
    oi.product_id,
    oi.seller_id,

    o.customer_id,
    o.order_status,
    o.order_purchase_timestamp,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,

    p.product_category_name,
    pct.product_category_name_english,

    oi.price,
    oi.freight_value,
    oi.price + oi.freight_value as gross_item_value,

    datediff(
        day,
        o.order_purchase_timestamp,
        o.order_delivered_customer_date
    ) as actual_delivery_days,

    datediff(
        day,
        o.order_purchase_timestamp,
        o.order_estimated_delivery_date
    ) as estimated_delivery_days,

    case
        when o.order_delivered_customer_date > o.order_estimated_delivery_date
            then 1
        else 0
    end as is_late_delivery

from {{ ref('stg_order_items') }} as oi

left join {{ ref('stg_orders') }} as o
    on oi.order_id = o.order_id

left join {{ ref('stg_products') }} as p
    on oi.product_id = p.product_id

left join {{ ref('stg_product_category_translation') }} as pct
    on p.product_category_name = pct.product_category_name