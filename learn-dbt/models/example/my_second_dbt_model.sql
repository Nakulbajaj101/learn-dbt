
-- Use the `ref` function to select from other models
{{ config(materialized='view') }}

select *
from {{ ref('my_first_dbt_model') }}
union all 
select NULL as id, {{ var('my_first_variable') }} as first_variable
