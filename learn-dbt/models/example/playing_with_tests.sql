{{ config(materialized='table') }}


SELECT *, {{segment('c_mktsegment')}} as cust_segment

FROM 

"SNOWFLAKE_SAMPLE_DATA"."TPCH_SF001"."CUSTOMER"