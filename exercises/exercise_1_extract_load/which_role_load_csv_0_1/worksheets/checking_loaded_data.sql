
USE ROLE marketing_dlt_role;

USE DATABASE ifood;

SHOW SCHEMAS;

SHOW WAREHOUSES;

USE WAREHOUSE marketing_wh;


DESC DATABASE ifood;

DESC SCHEMA staging;

SELECT * FROM staging.ifood_marketing;

DESC TABLE staging.ifood_marketing;


SELECT index, income, age, education, kidhome, teenhome, complain FROM staging.ifood_marketing WHERE kidhome >= 1 and age < 35 ORDER BY age ASC;


USE SCHEMA staging;


CREATE TABLE IF NOT EXISTS person AS SELECT index, marital_status, age, education FROM ifood_marketing;

SHOW TABLES IN SCHEMA staging;

SELECT * FROM staging.person;

SELECT COUNT(*) FROM person;

SHOW TABLES IN SCHEMA staging;

DESC TABLE staging.person;