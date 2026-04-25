select *
from {{ ref('fct_orders') }}
where amount <= 0
  and '{{ var("scenario", "success") }}' = 'test_failure'

