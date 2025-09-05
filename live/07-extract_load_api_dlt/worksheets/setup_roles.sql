
SELECT current_role();

USE ROLE USERADMIN;
CREATE ROLE IF NOT EXISTS job_ads_dlt_role;

-- change to sysadmin to granted privileger to different role
USE ROLE SYSADMIN;

GRANT ROLE job_ads_dlt_role TO USER extract_loader;

GRANT ROLE job_ads_dlt_role TO USER Marcus;

GRANT USAGE ON DATABASE job_ads TO ROLE job_ads_dlt_role;

GRANT USAGE ON SCHEMA job_ads.staging TO ROLE job_ads_dlt_role;

GRANT USAGE ON WAREHOUSE dev_wh TO ROLE job_ads_dlt_role;


GRANT CREATE TABLE ON SCHEMA job_ads.staging TO ROLE job_ads_dlt_role;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA job_ads.staging TO ROLE job_ads_dlt_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA job_ads.staging TO ROLE job_ads_dlt_role;

SELECT current_user(), current_account(), current_role(), current_schema(), current_warehouse();


SHOW SCHEMAS;
USE ROLE ACCOUNTADMIN;

SHOW ACCOUNTS;

SHOW GRANTS TO ROLE job_ads_dlt_role;