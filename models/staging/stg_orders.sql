select
  order_id,
  customer_id,
  amount,
  loaded_at,
  {% if var('scenario', 'success') == 'schema_change' %}
    order_status
  {% else %}
    'placed' as order_status
  {% endif %}
from {{ source('raw', 'orders') }}

