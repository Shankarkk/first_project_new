{{ config(materialized='table') }}

WITH tb1 as(
    select
    PS_PARTKEY AS PARTKEY, 
    PS_SUPPKEY AS SUPPKEY,
    PS_AVAILQTY AS AVAILQTY,
    PS_SUPPLYCOST AS SUPPLYCOST,
    PS_COMMENT AS COMMENT 
from {{source('snowflake_data','RAW_PARTSUPP')}})
select * from tb1
