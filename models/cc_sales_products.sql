{{
  config(
    materialized='table'
  )
}}

WITH stg_cc_sales AS (
    SELECT
  date_date
  ### Key ###  
  ,product_id
  ###########
  ,quantity AS qty
FROM `raw_data_circle.raw_cc_sales`
)

SELECT
  ### Key ###  
  product_id
  ###########
  ,SUM(qty) AS qty_91
  ,ROUND(SUM(qty)/91,2) AS avg_daily_qty_91
FROM stg_cc_sales
WHERE 
	date_date >= DATE_SUB('2021-10-01',INTERVAL 91 DAY)
GROUP BY product_id