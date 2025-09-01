
USE ROLE movies_reader_role_2;

SHOW DATABASES;

USE DATABASE movies_2;

DESCRIBE DATABASE movies_2;

DESCRIBE SCHEMA staging;

DESC TABLE staging.netflix;

SELECT * FROM staging.netflix;

SELECT count(*) FROM staging.netflix;