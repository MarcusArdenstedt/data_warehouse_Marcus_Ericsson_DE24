
USE ROLE USERADMIN;

SELECT current_user(), current_role();
CREATE ROLE job_ads_dbt_role_code_alongs;

GRANT ROLE job_ads_dbt_role_code_alongs TO USER transformer;

GRANT ROLE job_ads_dbt_role_code_alongs TO USER Marcus;