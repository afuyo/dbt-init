{% macro get_metadata(tableName='stg_car_sales3') %}
{% set data_structure_query %}

select distinct this as schema
from
{{ ref(tableName)}},
lateral flatten(input => schema:properties);

{% endset %}
{% set results = run_query(data_structure_query) %}
{% if execute %}
    {% set properties = results.columns[0].values() %}
    {% set properties_dict = fromjson(properties[0]) %}
{% else %}
    {% set properties = [] %}
    {% set properties_dict =[] %}
{% endif %}
{{ return(properties_dict) }}
{% endmacro %}