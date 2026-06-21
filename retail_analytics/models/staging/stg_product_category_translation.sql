select
    c1 as product_category_name,
    c2 as product_category_name_english
from {{ source('raw', 'product_category_translation') }}