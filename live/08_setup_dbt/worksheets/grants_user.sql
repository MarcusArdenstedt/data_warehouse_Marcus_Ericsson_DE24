
USE ROLE USERADMIN;

SELECT current_user(), current_role();
CREATE ROLE job_ads_dbt_role;

GRANT ROLE job_ads_dbt_role TO USER transformer_live;

GRANT ROLE job_ads_dbt_role TO USER Marcus;