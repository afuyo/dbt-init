{% macro get_schema_json() %}
{% set my_json_str = '{
  "productId": "NUMBER",
  "productName": "VARCHAR",
  "price": "NUMBER"
}' %}
{{ return(my_json_str) }}
{% endmacro %}