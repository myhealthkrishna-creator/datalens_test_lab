{% macro datalens_set_query_tag() %}
  {% set tag = {
    "invocation_id": invocation_id,
    "node_id": model.unique_id,
    "dag_id": var("datalens_dag_id", "datalens_lab")
  } %}
  alter session set query_tag = '{{ tojson(tag) | replace("'", "''") }}'
{% endmacro %}

