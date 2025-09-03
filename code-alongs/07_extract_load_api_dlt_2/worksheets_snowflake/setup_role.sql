
USE ROLE USERADMIN;

CREATE ROLE IF NOT EXISTS job_ads_dlt_role_3;

USE ROLE SECURITYADMIN;

GRANT ROLE job_ads_dlt_role_3 TO USER extract_loader_3;

GRANT ROLE job_ads_dlt_role_3 TO USER Marcus;


GRANT USAGE ON WAREHOUSE dev_wh TO ROLE job_ads_dlt_role_3;

GRANT USAGE ON DATABASE job_ads_3 TO ROLE job_ads_dlt_role_3;

GRANT USAGE ON SCHEMA job_ads_3.staging TO ROLE job_ads_dlt_role_3;

GRANT CREATE TABLE ON SCHEMA job_ads_3.staging TO ROLE job_ads_dlt_role_3;



GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA job_ads_3.staging TO ROLE job_ads_dlt_role_3;
GRANT SELECT, INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA job_ads_3.staging TO ROLE job_ads_dlt_role_3;

SHOW GRANTS ON SCHEMA job_ads_3.staging;

SHOW FUTURE GRANTS IN SCHEMA job_ads_3.staging;

SHOW GRANTS TO ROLE job_ads_dlt_role_3;

SHOW GRANTS TO USER extract_loader_3;


SELECT current_account(), current_user(), current_role();

