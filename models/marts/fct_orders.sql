{{ config(materialized='incremental', unique_key='order_id') }}

with orders as (
  select *
  from {{ ref('stg_orders') }}
  {% if var('scenario', 'success') == 'empty_upstream' %}
    where 1 = 0
  {% endif %}
),

customers as (
  select * from {{ ref('stg_customers') }}
),

joined as (
  select
    orders.order_id,
    orders.customer_id,
    customers.customer_name,
    orders.amount,
    orders.order_status,
    orders.loaded_at
  from orders
  left join customers using (customer_id)
)

select * from joined

{% if var('scenario', 'success') == 'incremental_drift' %}
union all
select
  order_id,
  customer_id,
  customer_name,
  amount,
  order_status,
  loaded_at
from joined
where order_id = 1001
{% endif %}

