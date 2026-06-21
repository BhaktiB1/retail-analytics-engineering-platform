select
    order_id,
    actual_delivery_days

from {{ ref('fct_order_items') }}

where actual_delivery_days < 0