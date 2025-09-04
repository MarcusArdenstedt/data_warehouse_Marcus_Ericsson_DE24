

-- if current_role = useradmin else: change to use role useradmin
select current_role();

CREATE ROLE IF NOT EXISTS extract_api_dlt;

-- change to securityadmin to give privilege and grant user to role
USE ROLE SECURITYADMIN;
GRANT ROLE extract_api_dlt TO USER extract_load;

GRANT USAGE ON DATABASE stockholm_parking TO ROLE extract_api_dlt;

GRANT USAGE ON SCHEMA stockholm_parking.staging TO ROLE extract_api_dlt;

GRANT USAGE ON WAREHOUSE dev_wh TO ROLE extract_api_dlt;


GRANT CREATE TABLE ON SCHEMA stockholm_parking.staging TO ROLE extract_api_dlt;

