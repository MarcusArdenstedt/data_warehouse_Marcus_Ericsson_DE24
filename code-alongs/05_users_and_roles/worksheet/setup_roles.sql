
USE ROLE USERADMIN;

SELECT current_role();

SELECT current_user();


-- create 3 roles
CREATE ROLE ice_cream_reader COMMENT = 'Able to read ice_cream database';

CREATE ROLE ice_cream_writer COMMENT = 'Able to do CRUD operation on ice_cream databse';

CREATE ROLE ice_cream_analyst COMMENT = 'Able to create views on ice_cream database';

-- switch role to securityadmin
USE ROLE SECURITYADMIN; -- manage grant

-- Grant usage to role 
-- privileges to ice_cream_reader
GRANT USAGE ON WAREHOUSE dev_wh TO ROLE ice_cream_reader;
GRANT USAGE ON DATABASE ice_cream_db TO ROLE ice_cream_reader;

-- get ability to reference schema within the db but not any privileges on object
GRANT USAGE ON ALL SCHEMAS IN DATABASE ice_cream_db TO ROLE ice_cream_reader;

-- grants select on existing tables
GRANT SELECT ON ALL TABLES IN SCHEMA ice_cream_db.public TO ROLE ice_cream_reader;

-- grant select on all future tables in public
GRANT SELECT ON FUTURE TABLES IN SCHEMA ice_cream_db.public TO ROLE ice_cream_reader;

-- check grants
SHOW GRANTS TO ROLE ice_cream_reader;
SHOW FUTURE GRANTS IN SCHEMA ice_cream_db.public;

GRANT ROLE ice_cream_reader TO ROLE ice_cream_writer;


-- ice_cream_writer role has ice_cream_reader role granted on
SHOW GRANTS TO ROLE ice_cream_writer;

-- grant CRUD operation to ice_cream_writer
GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA ice_cream_db.public TO ROLE ice_cream_writer;

GRANT INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA ice_cream_db.public TO ROLE ice_cream_writer;

GRANT CREATE TABLE ON SCHEMA ice_cream_db.public TO ROLE ice_cream_writer;

SHOW FUTURE GRANTS IN SCHEMA ice_cream_db.public;

GRANT ROLE ice_cream_writer TO USER Marcus;


-- return a list of secondary rols that are active.
SELECT current_secondary_roles();
