{{ config(
    materialized='incremental',
    unique_key='order_id'
) }}

select
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp
from {{ ref('stg_orders') }}

{% if is_incremental() %}

where order_purchase_timestamp >
(
    select max(order_purchase_timestamp)
    from {{ this }}
)

{% endif %}