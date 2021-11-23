{%- set my_json_str = get_schema_json() -%}
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
{% set my_dict = fromjson(my_json_str) %}
  {% for key, value in my_dict.items() %}
    {{log(key) }}
    {{ log(value) }}
  {% endfor %}
{{log(my_dict['Account_Search_FirstLast_vod__c'])}}
{{ log("Running query!") }}
{{ log('my message', info=True) }}
select * from {{ ref('stg_car_sales3')}}