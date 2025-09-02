
USE ROLE USERADMIN;

CREATE ROLE IF NOT EXISTS marketing_dlt_role;

-- change to securityadmin
USE ROLE SECURITYADMIN;

-- grant role to user
GRANT ROLE marketing_dlt_role TO USER extract_loader;

GRANT ROLE marketing_dlt_role TO USER Marcus;


-- grant role privilegier: warehouse, database and schema

GRANT USAGE ON WAREHOUSE marketing_wh TO ROLE marketing_dlt_role;

GRANT USAGE ON DATABASE ifood TO ROLE marketing_dlt_role;


GRANT USAGE ON SCHEMA ifood.staging TO ROLE marketing_dlt_role;


-- grant privilegier to DDL and DML to role
GRANT CREATE TABLE ON SCHEMA ifood.staging TO ROLE marketing_dlt_role;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA ifood.staging TO ROLE marketing_dlt_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA ifood.staging TO ROLE marketing_dlt_role;


-- show grants

SHOW GRANTS ON SCHEMA ifood.staging;

SHOW FUTURE GRANTS IN SCHEMA ifood.staging;

SHOW GRANTS TO USER extract_loader;
