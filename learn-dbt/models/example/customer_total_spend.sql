{{ config(materialized='table') }}


select cust.c_custkey,
       cust.c_name,
       cust.c_nationkey as nation,
       SUM(ord.o_totalprice) as cust_total_spend
       FROM "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."CUSTOMER" cust
       
       
       LEFT JOIN 
       
       "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS" ord
       ON cust.c_custkey = ord.o_custkey
       
       group by cust.c_custkey,
       cust.c_name,
       cust.c_nationkey