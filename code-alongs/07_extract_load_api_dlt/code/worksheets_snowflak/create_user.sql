
USE ROLE USERADMIN;


CREATE ROLE IF NOT EXISTS code_alongs_job_ads_dlt_role;

-- design: one user for EL and several roles for 
-- loading to server
CREATE USER IF NOT EXISTS code_alongs_extract_loader
    PASSWORD = 'extract_loader_password123'
    DEFAULT_WAREHOUSE = COMPUTE_WH;