{% macro get_payment_methods2() %}

{% set payment_methods_query %}
select distinct
payment_method
from {{ ref('stg_payments') }}
order by 1
{% endset %}

{% set results = run_query(payment_methods_query) %}

{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}
{{ log('Logging results') }}
{{ log(results_list, info=True) }}
{{ return(results_list) }}

{% endmacro %}