{% macro group_by(n) %} -- n is the number to iterate
    GROUP BY 
    {% for num in range (1,n+1) %}
        {{ num }}
        {% if not loop.last %} , {% endif %}
    {% endfor %}
{% endmacro %}


