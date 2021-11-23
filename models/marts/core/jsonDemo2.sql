{%- set my_dict = get_schema_json2() -%}
  select
  {% for key, value in my_dict.items() %}
  src:{{key}} as {{key}}
  {%- if not loop.last %},{% endif -%}

  {% endfor %}
  from {{ ref('stg_car_sales3')}}

