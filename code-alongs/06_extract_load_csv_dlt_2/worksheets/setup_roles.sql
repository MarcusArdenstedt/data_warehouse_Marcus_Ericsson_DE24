
USE ROLE USERADMIN;

CREATE ROLE IF NOT EXISTS movies_dlt_role_2;

CREATE ROLE IF NOT EXISTS movies_reader_role_2;



-- Grants to user
USE ROLE SECURITYADMIN;

Grant ROLE movies_dlt_role_2 TO USER extract_loader_2;

GRANT ROLE movies_reader_role_2 TO USER Marcus;



GRANT USAGE ON WAREHOUSE dev_wh TO ROLE movies_dlt_role_2;

Grant USAGE ON DATABASE movies_2 TO ROLE movies_dlt_role_2;

GRANT USAGE ON SCHEMA movies_2.staging TO ROLE movies_dlt_role_2;


-- DDL
GRANT CREATE TABLE ON SCHEMA movies_2.staging TO ROLE movies_dlt_role_2;

-- DML
GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA movies_2.staging TO ROLE movies_dlt_role_2;
GRANT INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA movies_2.staging TO ROLE movies_dlt_role_2;


-- check grants 
SHOW GRANTS ON SCHEMA movies_2.staging;

SHOW FUTURE GRANTS IN SCHEMA movies_2.staging;

SHOW GRANTS TO ROLE movies_dlt_role_2;

SHOW GRANTS TO USER extract_loader_2;



SELECT current_role();

-- grant role movies_reader_2

GRANT USAGE ON WAREHOUSE dev_wh TO ROLE movies_reader_role_2;

GRANT USAGE ON DATABASE movies_2 TO ROLE movies_reader_role_2;

GRANT USAGE ON SCHEMA movies_2.staging TO ROLE movies_reader_role_2;

GRANT SELECT ON ALL TABLES IN SCHEMA movies_2.staging TO ROLE movies_reader_role_2;

GRANT SELECT ON FUTURE TABLES IN DATABASE movies_2 TO ROLE movies_reader_role_2;



