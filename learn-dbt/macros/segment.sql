{% macro segment(column_name) %}
CASE WHEN {{column_name}} in ('BUILDING','AUTOMOBILE','MACHINERY') THEN 'segment_1' else 'segment_2' end 
{% endmacro %}