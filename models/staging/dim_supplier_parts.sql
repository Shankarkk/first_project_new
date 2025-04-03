{{ config(materialized='table') }}

WITH supplier_parts AS (
    SELECT 
        s.SUPPKEY AS supplier_key,
        s.NAME AS supplier_name,
        s.NATIONKEY AS nation_key,
        s.ACCTBAL AS account_balance,
        ps.AVAILQTY AS available_quantity,
        ps.SUPPLYCOST AS supply_cost,
        TRY_CAST(ps.PARTKEY AS NUMBER) AS part_key,  -- Ensure type match
        p.P_NAME AS part_name,
        p.P_MFGR AS part_manufacturer,
        p.P_BRAND AS part_brand,
        p.P_TYPE AS part_type,
        p.P_SIZE AS part_size,
        p.P_CONTAINER AS part_container,
        p.P_RETAILPRICE AS part_retail_price
    FROM {{ref('stg_supplier')}} s
    JOIN {{ref('stg_partsupp')}} ps 
        ON s.SUPPKEY = ps.SUPPKEY  
    JOIN {{source('snowflake_data','RAW_PART')}} P        --snowflake_sample_data.tpch_sf1.part p  
        ON TRY_CAST(ps.PARTKEY AS NUMBER) = p.P_PARTKEY  -- Ensure same data type
)
SELECT * FROM supplier_parts
