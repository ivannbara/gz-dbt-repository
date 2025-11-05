{{ config(materialized='view') }}
select date_date
, operational_margin-ads_cost as ads_margin
, average_basket
, operational_margin
, ads_cost, impression as ads_impression
, click as ads_click
, quantity
, revenue
, purchase_cost
, shipping_fee
, log_cost
from {{ ref("int_campaigns_day") }}
Left join {{ref("finance_days")}}
using(date_date)