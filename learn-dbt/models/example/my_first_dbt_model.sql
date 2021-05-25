
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table', alias='my_first_model' ) }}

with source_data as (

    select 1 as id, 'CA' as state, CURRENT_TIMESTAMP as updated_at
    union all
    select null as id, 'WA' as state, CURRENT_TIMESTAMP as updated_at
    union all
    select 2 as id, 'NY' as state, CURRENT_TIMESTAMP as updated_at

)

select *, {{ var('my_first_variable') }} as first_variable
from source_data
where id >= {{ var('my_second_variable') }}

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
