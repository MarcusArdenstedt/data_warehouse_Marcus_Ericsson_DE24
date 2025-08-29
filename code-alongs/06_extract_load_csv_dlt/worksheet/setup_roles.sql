

-- movies role 
-- dlt role
CREATE ROLE IF NOT EXISTS code_alongs_movies_dlt_role;



-- grant role to user
USE ROLE SECURITYADMIN;

GRANT ROLE code_alongs_movies_dlt_role TO USER code_alongs_extract_loader;

-- grant privileges to role
GRANT USAGE ON WAREHOUSE COMPUTE_WH TO ROLE code_alongs_movies_dlt_role;
GRANT USAGE ON DATABASE code_alongs_movies TO ROLE code_alongs_movies_dlt_role;
GRANT USAGE ON SCHEMA code_alongs_movies.staging TO ROLE code_alongs_movies_dlt_role;
GRANT CREATE TABLE ON SCHEMA code_alongs_movies.staging TO ROLE code_alongs_movies_dlt_role;
GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA code_alongs_movies.staging TO ROLE code_alongs_movies_dlt_role;
GRANT INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA code_alongs_movies.staging TO ROLE code_alongs_movies_dlt_role;

-- check grants
SHOW GRANTS ON SCHEMA code_alongs_movies.staging;
SHOW FUTURE GRANTS IN SCHEMA code_alongs_movies.staging;
SHOW GRANTS TO ROLE code_alongs_movies_dlt_role;
SHOW GRANTS TO USER code_alongs_extract_loader;

-- create reader role
USE ROLE useradmin;
CREATE ROLE IF NOT EXISTS code_alongs_movies_reader;

-- grant privileges to role
USE ROLE securityadmin;

GRANT USAGE ON WAREHOUSE COMPUTE_WH TO ROLE code_alongs_movies_reader;
GRANT USAGE ON DATABASE code_alongs_movies TO ROLE code_alongs_movies_reader;
GRANT USAGE ON SCHEMA code_alongs_movies.staging TO ROLE code_alongs_movies_reader;

GRANT SELECT ON ALL TABLES IN SCHEMA code_alongs_movies.staging TO ROLE code_alongs_movies_reader;

GRANT SELECT ON FUTURE TABLES IN SCHEMA code_alongs_movies.staging TO ROLE code_alongs_movies_reader;
GRANT SELECT ON FUTURE TABLES IN DATABASE code_alongs_movies TO ROLE code_alongs_movies_reader;


GRANT USAGE ON WAREHOUSE COMPUTE_WH TO ROLE code_alongs_movies_reader;
GRANT ROLE code_alongs_movies_reader TO USER Marcus;