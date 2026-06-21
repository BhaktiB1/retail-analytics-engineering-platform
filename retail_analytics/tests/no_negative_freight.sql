select *
from {{ ref('fct_order_items') }}
where price < 0