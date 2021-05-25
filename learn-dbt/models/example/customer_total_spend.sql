

select cust.c_custkey,
       cust.c_name,
       cust.c_nationkey as nation,
       SUM(ord.o_totalprice) as cust_total_spend
       FROM {{ source('sample_snowflake','customer') }} cust
       
       
       LEFT JOIN 
       
       {{ source('sample_snowflake','orders') }} ord
       ON cust.c_custkey = ord.o_custkey
       
       group by cust.c_custkey,
       cust.c_name,
       cust.c_nationkey