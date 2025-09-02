
USE ROLE SYSADMIN;

CREATE DATABASE IF NOT EXISTS job_ads_3;

CREATE SCHEMA IF NOT EXISTS job_ads_3.staging;


USE ROLE SYSADMIN;

SELECT query_text, warehouse_name, start_time
FROM TABLE(information_schema.query_history_by_user(RESULT_LIMIT => 20))
ORDER BY start_time DESC;