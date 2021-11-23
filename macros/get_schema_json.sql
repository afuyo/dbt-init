{% macro get_schema_json() %}
{% set my_json_str = '{"Account_Search_FirstLast_vod__c": "VARCHAR",
  "Account_Search_LastFirst_vod__c": "VARCHAR"}' %}
{{ return(my_json_str) }}
{% endmacro %}