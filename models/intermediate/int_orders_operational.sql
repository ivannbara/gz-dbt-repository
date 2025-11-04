select orders_id,date_date,shipping_fee,logcost,ship_cost,round((margin+shipping_fee - (logcost+ship_cost)),2) as operational_margin from {{ ref("int_orders_margin") }}
Left join {{ ref("stg_raw__ship") }} 
using(orders_id)
order by orders_id desc