select
  customer_id,
  customer_name,
  loaded_at
from {{ source('raw', 'customers') }}

