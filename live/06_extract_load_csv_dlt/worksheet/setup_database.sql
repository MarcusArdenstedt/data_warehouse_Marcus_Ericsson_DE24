
SHOW DATABASES;

-- switch to an apporpriate role
USE ROLE sysadmin;

-- set up database for dlt csv data ingestion
-- (optional) drop database if there is any
CREATE DATABASE IF NOT EXISTS MOVIES;

-- set up staging schema
CREATE SCHEMA staging;
-- alternative use 'fully qualified object name' CREATE SCHEMA movies.staging;



