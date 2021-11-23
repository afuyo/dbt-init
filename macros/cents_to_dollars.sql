{% macro cents_to_dollars(column_name, decimal_places=2) -%}
{% set my_json_str = '{"abc": 123}' %}
{% set my_json_str2 = '{
  "price": {
    "description": "The price of the product",
    "exclusiveMinimum": 0,
    "type": "number"
  },
  "productId": {
    "description": "The unique identifier for a product",
    "type": "integer"
  },
  "productName": {
    "description": "Name of the product",
    "type": "string"
  }
}' %}

{% set my_json_str3 = '{ "properties": {
    "price": {
      "description": "The price of the product",
      "exclusiveMinimum": 0,
      "type": "number"
    },
    "productId": {
      "description": "The unique identifier for a product",
      "type": "integer"
    },
    "productName": {
      "description": "Name of the product",
      "type": "string"
    }
  },
  "required": [
    "productId",
    "productName",
    "price"
  ],
  "title": "Product",
  "type": "object"
}' %}
{% set my_dict = fromjson(my_json_str) %}
{% do log(my_dict['abc']) %}
round({{column_name}} / 100, {{decimal_places}})
{{ log("Running query!") }}
{{log(my_json_str)}}
{{log(my_json_str3)}}
{%- endmacro %}






