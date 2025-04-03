{% macro calculate_sum(column) %}
    SUM({{ column }})
{% endmacro %}

