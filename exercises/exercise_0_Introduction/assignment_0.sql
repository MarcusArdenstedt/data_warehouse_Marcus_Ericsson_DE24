
-- a) Use this database and find out the underlying schemas, tables and views to get an overview of its logical structure

SHOW DATABASES;

USE GOOGLE_KEYWORDS_SEARCH_DATASET__DISCOVER_ALL_SEARCHES_ON_GOOGLE;

ShOW SCHEMAS;

USE SCHEMA DATAFEEDS;

SHOW VIEWS IN DATABASE GOOGLE_KEYWORDS_SEARCH_DATASET__DISCOVER_ALL_SEARCHES_ON_GOOGLE;

SHOW TABLES;

-- b) Find out the columns and its data types in the table "GOOGLE_KEYWORDS"
SELECT * FROM GOOGLE_KEYWORDS LIMIT 10;

-- SNOWSQL using whole word not abbreviations. DESC; -> DESCRIBE TABLE or DATABASE or DATA WAREHOUS.
DESCRIBE TABLE GOOGLE_KEYWORDS;


