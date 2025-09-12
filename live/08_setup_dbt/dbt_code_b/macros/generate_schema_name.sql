
{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}   -- om default schema från profiles är lika med schema man försöker använda
    {%- if custom_schema_name is none -%}       

        {{ default_schema }}

    {%- else -%}

        {{ custom_schema_name | trim }}      

    {%- endif -%}

{%- endmacro %}