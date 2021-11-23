{% macro get_schema_json2() %}
{% set data_structure_query %}

select distinct schema
from
{{ ref('stg_car_sales4')}};

--select * from {{ ref('stg_car_sales3')}}
{% endset %}
{% set results = run_query(data_structure_query) %}
{% if execute %}
    {% set properties = results.columns[0].values() %}
    {% set my_dict = fromjson(properties[0]) %}
{% else %}
    {% set properties = [] %}
    {% set my_dict = [] %}
{% endif %}
{{ return(my_dict) }}
{% endmacro %}