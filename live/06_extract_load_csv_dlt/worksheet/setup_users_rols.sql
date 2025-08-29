
-- switch to an appropiate role to create user and role
USE ROLE USERADMIN;

-- create dlt user
CREATE USER extract_loader 
    PASSWORD = 'a1234b5678'
    DEFAULT_WAREHOUSE = COMPUTE_WH;

-- create dlt role

CREATE ROLE movies_dlt_role;

-- switch to appropiate role to grant privileges to role and grant role to user
USE ROLE SECURITYADMIN;


-- grant role user
GRANT ROLE movies_dlt_role TO USER extract_loader;

-- grant privileges to role
-- this role needs to use warehouse, db, schema
GRANT USAGE ON WAREHOUSE COMPUTE_WH TO ROLE movies_dlt_role;

GRANT USAGE ON DATABASE movies TO ROLE movies_dlt_role;

GRANT USAGE ON SCHEMA movies.staging TO ROLE movies_dlt_role;


-- this role needs some special usage for the db and schema
GRANT CREATE TABLE ON SCHEMA movies.staging TO ROLE movies_dlt_role;
GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA movies.staging TO ROLE movies_dlt_role;
GRANT INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA movies.staging TO ROLE movies_dlt_role;

-- check 
SHOW GRANTS TO ROLE movies_dlt_role;

