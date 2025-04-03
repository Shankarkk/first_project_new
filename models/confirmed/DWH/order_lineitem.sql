{{ config(materialized='table') }}

SELECT 
    o.order_key,
    COUNT(*) AS order_unique_items,  
    {{ calculate_sum('line_quantity') }} AS order_total_quantity  
FROM {{ ref('stg_orders') }} AS o  
INNER JOIN {{ ref('stg_lineitem') }} AS l  
    ON l.order_key = o.order_key  
GROUP BY o.order_key
