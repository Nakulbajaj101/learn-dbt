
-- Use the `ref` function to select from other models
{{ config(materialized='view', post_hook='grant select on {{this}} to role analytics_role' ) }}

select *
from {{ ref('my_first_dbt_model') }}
union all 
select NULL as id, 'SA' as state, CURRENT_TIMESTAMP as updated_at, {{ var('my_first_variable') }} as first_variable
