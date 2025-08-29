
USE ROLE USERADMIN;


CREATE ROLE IF NOT EXISTS code_alongs_job_ads_dlt_role;

-- design: one user for EL and several roles for 
-- loading to server
CREATE USER IF NOT EXISTS code_alongs_extract_loader
    PASSWORD = 'extract_loader_password123'
    DEFAULT_WAREHOUSE = COMPUTE_WH;

USE ROLE SECURITYADMIN;

-- can have different ingestion tools e.g. dlt, airbyte, fivetran, ...
GRANT ROLE code_alongs_job_ads_dlt_role TO USER code_alongs_extract_loader;

GRANT USAGE ON WAREHOUSE COMPUTE_WH TO ROLE code_alongs_job_ads_dlt_role;

-- haven't done this, need to create database, schema
GRANT USAGE ON DATABASE code_alongs_job_ads TO ROLE code_alongs_job_ads_dlt_role;

GRANT USAGE ON code_alongs_job_ads.staging TO ROLE code_alongs_job_ads_dlt_role;

GRANT CREATE TABLE ON SCHEMA code_alongs_job_ads.staging TO ROLE code_alongs_job_ads_dlt_role;

GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA code_alongs_job_ads.staging TO ROLE code_alongs_job_ads_dlt_role;
GRANT INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA code_alongs_job_ads.staging TO ROLE code_alongs_job_ads_dlt_role;


-- check grants
SHOW GRANTS ON SCHEMA code_alongs_job_ads.staging;
SHOW FUTURE GRANTS SCHEMA code_alongs_job_ads.staging;

-- check grants for role
SHOW GRANTS TO ROLE code_alongs_job_ads_dlt_role;
SHOW GRANTS TO USER code_alongs_extract_loader;

