
USE ROLE SYSADMIN;

SELECT current_role(), current_user();

USE DATABASE job_ads_3;

CREATE SCHEMA IF NOT EXISTS warehouse;

SHOW SCHEMAS IN DATABASE job_ads_3;

USE ROLE securityadmin;

GRANT ROLE job_ads_dlt_role_3 TO ROLE job_ads_dbt_role_code_alongs;

SHOW GRANTS TO ROLE job_ads_dbt_role_code_alongs;


GRANT USAGE, CREATE TABLE, CREATE VIEW ON SCHEMA job_ads_3.warehouse TO ROLE job_ads_dbt_role_code_alongs;

-- grant CRUD and selection tables and views
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA job_ads_3.warehouse TO ROLE job_ads_dbt_role_code_alongs;

GRANT SELECT ON ALL VIEWS IN SCHEMA job_ads_3.warehouse TO ROLE job_ads_dbt_role_code_alongs;

-- grant CRUD and select on future tables and views
GRANT SELECT, INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA job_ads_3.warehouse TO ROLE job_ads_dbt_role_code_alongs;

GRANT SELECT ON FUTURE VIEWS IN SCHEMA job_ads_3.warehouse TO ROLE job_ads_dbt_role_code_alongs;

USE ROLE job_ads_dbt_role_code_alongs;

USE WAREHOUSE dev_wh;
SELECT * FROM job_ads_3.staging.data_field_job_ads LIMIT 10;

SHOW GRANTS ON SCHEMA job_ads_3.warehouse;

USE SCHEMA job_ads_3.warehouse;
SELECT current_user(), current_role(), current_warehouse();
CREATE TABLE test (id INTEGER);
SHOW TABLES;

DROP TABLE test;



