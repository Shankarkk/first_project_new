{{ config(materialized='table') }}

WITH tb1 as(
    select 
    R_REGIONKEY AS REGIONKEY,
	R_NAME AS NAME,
	R_COMMENT AS COMMENT
    from {{source('snowflake_data','RAW_REGION')}})
select * from tb1
