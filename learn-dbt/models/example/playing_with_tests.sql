{{ config(materialized='table') }}


SELECT *

FROM 

"SNOWFLAKE_SAMPLE_DATA"."TPCH_SF001"."CUSTOMER"