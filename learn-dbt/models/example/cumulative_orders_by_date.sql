
select o_orderdate,
o_totalprice,
sum(o_totalprice) over (order by o_orderdate rows between unbounded preceding and current row) as cumulative_price 

from 

(
select  o_orderdate,
sum(o_totalprice) as o_totalprice
from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS"
group by  o_orderdate
) 

