{% macro calculate_delivery_status(delivered_date, estimated_date) %}

case
    when {{ delivered_date }} is null then 'not_delivered'
    when {{ delivered_date }} > {{ estimated_date }} then 'late'
    else 'on_time'
end

{% endmacro %}