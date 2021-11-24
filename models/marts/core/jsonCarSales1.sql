{%set table_name= 'stg_car_sales3' %}
{% set properties_dict = get_metadata(table_name) %}

  select 
  {% for key, value in properties_dict.items() %}
   src:{{key}}::{{value['type']}} as {{key}}
   {%- if not loop.last %},{% endif -%}
  {% endfor %}

 from {{ ref(table_name)}}