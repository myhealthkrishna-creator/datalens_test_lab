select 'upstream table is empty' as failure_reason
where '{{ var("scenario", "success") }}' = 'empty_upstream'
  and (select count(*) from {{ ref('fct_orders') }}) = 0

