
{% macro capitalize_first_letter(column) %}
CASE 
    WHEN {{column}} IS NULL THEN NULL
    ELSE UPPER(substr({{column}}, 1, 1)) || lower(substr({{column}}, 2))
END
  
{% endmacro %}