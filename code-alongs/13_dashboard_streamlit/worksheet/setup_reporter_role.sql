
USE ROLE USERADMIN;

SELECT current_warehouse(), current_database(), current_role();

CREATE ROLE IF NOT EXISTS job_ads_reporter_role;

USE ROLE SECURITYADMIN;

GRANT USAGE ON WAREHOUSE dev_wh TO ROLE job_ads_reporter_role;

GRANT USAGE ON DATABASE job_ads_3 TO ROLE job_ads_reporter_role;

GRANT USAGE ON SCHEMA job_ads_3.marts TO ROLE job_ads_reporter_role;

GRANT SELECT ON ALL TABLES IN SCHEMA job_ads_3.marts TO ROLE job_ads_reporter_role;

GRANT SELECT ON ALL VIEWS IN SCHEMA job_ads_3.marts TO ROLE job_ads_reporter_role;

GRANT SELECT ON FUTURE TABLES IN SCHEMA job_ads_3.marts TO ROLE job_ads_reporter_role;

GRANT SELECT ON FUTURE VIEWS IN SCHEMA job_ads_3.marts TO ROLE job_ads_reporter_role;

GRANT ROLE job_ads_reporter_role TO USER reporter;
GRANT ROLE job_ads_reporter_role TO USER Marcus;


USE ROLE job_ads_reporter_role;

-- if not use warehouse, do it: USE WAREHOUSE dev_wh
SELECT * FROM job_ads_3.marts.mart_job_listings;
