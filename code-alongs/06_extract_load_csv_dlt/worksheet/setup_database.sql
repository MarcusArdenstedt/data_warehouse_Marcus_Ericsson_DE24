
USE ROLE SYSADMIN;

-- setup database and the staging layer
CREATE DATABASE IF NOT EXISTS code_alongs_movies;


-- staging layer is a landing zone data is loaded
CREATE SCHEMA IF NOT EXISTS code_alongs_movies.staging;

USE SCHEMA code_alongs_movies.staging;
