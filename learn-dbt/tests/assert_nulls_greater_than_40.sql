SELECT 
SUM(CASE WHEN id is NULL then 1 else 0 end)/COUNT(*) as null_percent
FROM {{ ref('my_second_dbt_model') }} 
having null_percent > 0.4
