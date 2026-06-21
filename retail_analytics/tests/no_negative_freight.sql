select
    order_id,
    order_item_id,
    freight_value

from {{ ref('fct_order_items') }}

where freight_value < 0