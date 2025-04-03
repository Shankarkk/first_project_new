{{ config(materialized='table') }}

WITH tb1 AS (
    SELECT
        c_custkey AS custkey,
        c_name AS custname,
        c_address AS custaddress,
        c_nationkey AS custnationkey,
        c_phone AS custphone,
        c_acctbal AS custacctbal,
        c_mktsegment AS custmktsegment,
        c_comment AS custcomment,
        s_suppkey AS suppkey,
        s_name AS suppliername,
        s_address AS supplieraddress,
        s_nationkey AS suppliernationkey,
        s_phone AS supplierphone,
        s_acctbal AS supplieracctbal,
        s_comment AS suppliercomment
    FROM {{ source('snowflake_data','RAW_CUSTOMER_NATION') }}
    JOIN {{ source('snowflake_data','RAW_SUPPLIER') }}
)

SELECT * FROM tb1
