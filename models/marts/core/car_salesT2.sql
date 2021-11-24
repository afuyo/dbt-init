{% set data_structure_query %}

select distinct this as schema
from
{{ ref('stg_car_sales3')}},
lateral flatten(input => schema:properties);

--select * from {{ ref('stg_car_sales3')}}
{% endset %}
{% set results = run_query(data_structure_query) %}
{% if execute %}
    {% set properties = results.columns[0].values() %}
    {% set properties_dict = fromjson(properties[0]) %}
{% else %}
    {% set properties = [] %}
    {% set properties_dict =[ {
                  'name' : node.Name,
                  'id' : node.id,
               }] %}
{% endif %}
  {% for key, value in properties_dict.items() %}
  {{log("printing for loop ########")}}
    {{log(key) }}
    {{ log(value) }}
  {% endfor %}
{% set my_json_str = '{"Account_Search_FirstLast_vod__c": "VARCHAR",
  "Account_Search_LastFirst_vod__c": "VARCHAR"}' %}
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
{{log(my_dict['Account_Search_FirstLast_vod__c'])}}
{{ log("Running query!") }}
{{log(results)}}
{{log(properties_dict['price'])}}
{{ log('my message', info=True) }}
select * from {{ ref('stg_car_sales3')}}