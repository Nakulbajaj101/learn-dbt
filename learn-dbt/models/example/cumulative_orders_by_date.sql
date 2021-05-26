
select o_orderdate,
o_totalprice,
sum(o_totalprice) over (order by o_orderdate rows between unbounded preceding and current row) as cumulative_price 

from 

(
select  o_orderdate,
sum(o_totalprice) as o_totalprice
from {{ source('sample_snowflake','orders') }}

{% if target.name == "dev" %} --only run when environment is set to dev
where year(o_orderdate) = 1996
{% endif %}

group by  o_orderdate
) 

