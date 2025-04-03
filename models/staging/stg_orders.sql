{{ config(materialized='table') }}

WITH tb1 as(
    select 
  --primary key 
    o_orderkey as order_key,	
    o_custkey as cust_key,

  --order details
    o_totalprice as order_total,
    CAST(o_orderdate AS DATE) AS order_date,

  --truncate date to month for monthly reports
     DATE_TRUNC('month', CAST(o_orderdate AS DATE)) AS order_month,

  --make statuses more readable 
    case 
        when o_orderstatus = 'O' then 'Open'
        when o_orderstatus = 'F' then 'Filled'
        when o_orderstatus = 'P' then 'Processing'
        end as order_status

    from {{source('snowflake_data','RAW_ORDERS')}})
select * from tb1
