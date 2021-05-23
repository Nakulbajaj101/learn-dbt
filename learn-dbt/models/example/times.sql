{{ config(materialised='incremental', unique_key='t_time') }}

select * 
FROM 
"SNOWFLAKE_SAMPLE_DATA"."TPCDS_SF10TCL"."TIME_DIM"
where T_TIME IN (select T_TIME
                 from 
                 "SNOWFLAKE_SAMPLE_DATA"."TPCDS_SF10TCL"."TIME_DIM"
                  where to_time(concat(T_HOUR::varchar, ':', T_MINUTE, ':', T_SECOND)) <= current_time)

{% if is_incremental() %}

and T_TIME > (select max(T_TIME) from {{ this }})

{% endif %}